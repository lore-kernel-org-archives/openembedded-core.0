Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2021BC38147
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 20:59:06 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.28928.1674075544510531984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 12:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gnvv4oou;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A128B1BF206;
	Wed, 18 Jan 2023 20:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674075542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ma/AJloZuKk5ZPTLf0Xxbmd+479NMfcneILuU4hF0O0=;
	b=gnvv4oouKlcZ4cSBYp5RKbeeFXy18Cdunk7i9jB+avLQ2v2D1l81DQcjq09p6clsJk6clu
	MGQy5/IN0B65YzE/vgqgNeWx5sF75XqVQaqSYUe/gVBBqL/7B+xbSEHkxz56f6nX8HksBp
	ApwDU+SLVg79aK3+iMTEpy6qMrJetIn1LiDeDgSTYoDKlKQx+6kUTYUEprcR4ue9EJyci9
	siI++YrJ6MtIQ/DDPE22+fZIErzDVgINhFYioEUmay8y8qnD2Nl+qZ5CVglokF2AIqILgU
	Q31SspbQejTQ/Q0Cq6gMUybebx1Vf+4g2AgUtmKd7Y96T7Cpgy4sNc3ALzqk5g==
Date: Wed, 18 Jan 2023 21:59:01 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, seebs@seebs.net
Subject: Re: [OE-core] [PATCH] pseudo.c: Avoid patch mismatch errors for
 NAMELESS file entries
Message-ID: <Y8hdlawJuYGRATb0@mail.local>
References: <20230118140047.1924765-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118140047.1924765-1-richard.purdie@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 20:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176113

On 18/01/2023 14:00:47+0000, Richard Purdie wrote:
> In rare cases we see failures, often in linux-libc-headers for things like:
> 
> |   INSTALL /XXX/linux-libc-headers/6.1-r0/image/usr/include
> | abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
> 
> Pseudo log:
> path mismatch [2 links]: ino 46662476 db 'NAMELESS FILE' req '/XXX/linux-libc-headers/6.1-r0/image/usr'.
> Setup complete, sending SIGUSR1 to pid 3630890.
> 
> Whilst this doesn't easily reproduce, the issue is that multiple different processes are
> likely working on the directory and the creation in pseudo might not match accesses
> made by other processes.
> 
> Ultimately, the "NAMELESS FILE" is harmless and pseudo will reconcile things
> so rather than error out, we should ignore this case.
> 

[ YOCTO #14932 ]

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  pseudo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/pseudo.c b/pseudo.c
> index 528fe1b..4f36786 100644
> --- a/pseudo.c
> +++ b/pseudo.c
> @@ -682,7 +682,8 @@ pseudo_op(pseudo_msg_t *msg, const char *program, const char *tag, char **respon
>  				}
>  				break;
>  			default:
> -				if (strcmp(msg->path, path_by_ino)) {
> +				/* Ignore NAMELESS FILE entries since those could be created by other threads on new files */
> +				if (strcmp(msg->path, path_by_ino) && !strcmp(path_by_ino, "NAMELESS FILE")) {
>  					mismatch = 1;
>  				}
>  				break;
> -- 
> 2.37.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176096): https://lists.openembedded.org/g/openembedded-core/message/176096
> Mute This Topic: https://lists.openembedded.org/mt/96354064/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

