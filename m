Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED089C47258
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 00:02:07 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.3829.1706745723654022170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 16:02:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KbGoVYKC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C9F840002;
	Thu,  1 Feb 2024 00:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706745721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ob/HHcViekdT5zTQG1JE8BluxVQnQdhTDCHQV5ek3cA=;
	b=KbGoVYKCg6NaVUaAOKvZ98UzW7yNV2f6kcp1sgjGsKDcOH6KMAzWvtjBn5iNpS3qrfFF+3
	MRznlkRMIfZjXCS3j/Dt+y4Fjg+Aok6nvhSg6V0n+Ei5R4asJ9gewz7gT99Me6KJZwE7+k
	3mURnNuzpeXgF2FeO2EU2bXM56IjaTF99L/f7At/iZjDrwZyi9sYSTb7aFE0GcxURF9nNu
	2lhS8E+2YmLrrbTC0jTykEmtzXA/Cd6iOs8DCKg0M1fiPMViMDA2fBQSA/WoBF5Ubl8PXX
	8w3J/u26umg5xxQS7Z2YyKvuUs4PbarcsT4lCsEFluq0WefgK4IrKvaIyDCElA==
Date: Thu, 1 Feb 2024 01:02:00 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 1/2] classes/package_rpm: additionally escape \
 and " in filenames
Message-ID: <2024020100020005ae4aed@mail.local>
References: <20240131120438.1097632-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131120438.1097632-1-alex@linutronix.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 00:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194543

On 31/01/2024 13:04:37+0100, Alexander Kanavin wrote:
> As specified in:
> https://github.com/rpm-software-management/rpm/blob/rpm-4.19.x/docs/manual/spec.md#shell-globbing
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes-global/package_rpm.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
> index 819ee502783..c9354734756 100644
> --- a/meta/classes-global/package_rpm.bbclass
> +++ b/meta/classes-global/package_rpm.bbclass
> @@ -217,7 +217,7 @@ python write_specfile () {
>                  return "%attr({:o},{},{}) ".format(mode, owner, group)
>  
>              def escape_chars(p):
> -                return p.replace("%", "%%")
> +                return p.replace("%", "%%").replace("\\", "\\\\").replace('"', '\\"'))

  File "/home/pokybuild/yocto-worker/build-appliance/build/meta/classes-global/package_rpm.bbclass", line 220
    return p.replace("%", "%%").replace("\\", "\\\\").replace('"', '\\"'))
                                                                         ^
SyntaxError: unmatched ')'


>  
>              path = rootpath.replace(walkpath, "")
>              if path.endswith("DEBIAN") or path.endswith("CONTROL"):
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194515): https://lists.openembedded.org/g/openembedded-core/message/194515
> Mute This Topic: https://lists.openembedded.org/mt/104073360/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

