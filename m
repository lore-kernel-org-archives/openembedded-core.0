Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7A4C64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 08:52:26 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.17650.1677660741035313957
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 00:52:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JNXPnlc8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 27E4EE0004;
	Wed,  1 Mar 2023 08:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677660739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oAtlquXdf68Ier3D9SDrPM0+FqnCV1CW2guMLtf1qaU=;
	b=JNXPnlc83qaWRg8rEUQqTUtodcEsz7LKW57Wl94NJC80ZqhMVvZl0RZ9E1w9T67qrhMjBp
	5JMTBaVDID8nguQGpAXO9eEdJk0kH+KrVFlevzkO2GzongFQpBf2jTVQXkFYkEi2HAflAr
	O7+e6xtS1OgMJmXdq/kX/XS9nnm4YzM2vfazTyOeZU09fy0Y30/QMha2QiWxH1WQNXRDTC
	29gur1oB7WNeAhXIXvDmQk+whUxhbtDeuMhAMETTn5sORNkhJzQeyri7BMpCZtWGdZ9Bli
	+QS1HAZrw/7gs12mshNtDOARJQm/4zn3/ZqtwxEMbPo4+NvpDvumMyp1BNBGQg==
Date: Wed, 1 Mar 2023 09:52:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org,
	Pavel Modilaynen <pavelmn@axis.com>,
	Mingli Yu <mingli.yu@windriver.com>
Subject: Re: [OE-core] [pseudo][PATCH 1/1] pseudo_util.c: Open file with
 O_CLOEXEC to avoid fd leak
Message-ID: <Y/8SQZ9wDOAtztSX@mail.local>
References: <20230301000302.93660-1-yoann.congal@smile.fr>
 <20230301000302.93660-2-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301000302.93660-2-yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 08:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177875

On 01/03/2023 01:03:04+0100, Yoann Congal wrote:
> From: Pavel Modilaynen <pavelmn@axis.com>
> 
> Use close-on-exec (O_CLOEXEC) flag when open log file to
> make sure its file descriptor is not leaked to parent
> process on fork/exec.
> 
> Fixes [YOCTO #13311]
> 

This is missing the author's SoB

> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  pseudo_util.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/pseudo_util.c b/pseudo_util.c
> index 64636b7..b58036f 100644
> --- a/pseudo_util.c
> +++ b/pseudo_util.c
> @@ -1611,7 +1611,7 @@ pseudo_logfile(char *filename, char *defname, int prefer_fd) {
>  		}
>  		free(filename);
>  	}	
> -	fd = open(pseudo_path, O_WRONLY | O_APPEND | O_CREAT, 0644);
> +	fd = open(pseudo_path, O_WRONLY | O_APPEND | O_CREAT | O_CLOEXEC, 0644);
>  	if (fd == -1) {
>  		pseudo_diag("help: can't open log file %s: %s\n", pseudo_path, strerror(errno));
>  	} else {
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177861): https://lists.openembedded.org/g/openembedded-core/message/177861
> Mute This Topic: https://lists.openembedded.org/mt/97303652/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

