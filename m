Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61ACFC54EF0
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 12:33:30 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.12298.1673008401528909756
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 04:33:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZyM0mgOj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 54BCF2000F;
	Fri,  6 Jan 2023 12:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673008399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bF8CSAOrdrHAj0TSwkB6XNBrjmn+couYWKiuuKkxN1k=;
	b=ZyM0mgOj4KdsXS2ZTTotF9rTKoY+bfNG6HYmBrfd0OH8tJ3mP9JXmpnYzDmPPbWAuAOwXm
	5Fxka4uKDYVjNWm7qd+WWPP3EAX2yL3RXQ2iBx6X42X4Mf9u3EKouJ6chveC4Is6eziRf+
	6o78OTj/9xpD5Ao1Kggpe+Gd7xKPhz7haH/iIzC4QvLUODN3YvraQJTTTgFDn4F4nqbEM0
	o+q6kExfczXS59cESj7QCrwunjYIacvJpZZe7CBY8m06WTDpq+XC8i/+d1dSDWLWpJra9D
	oXWavR7VOQFW3nTerovi8jwpoZ4Vrpxgd9U5v+wRiZLrl2tlvuXLYR6QjP8txQ==
Date: Fri, 6 Jan 2023 13:33:19 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: jan.kircher@leica-microsystems.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] toolchain-scripts: compatibility with unbound
 variable protection
Message-ID: <Y7gVD6T3z5fuhX79@mail.local>
References: <20230104122626.3472721-1-jan.kircher@leica-microsystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104122626.3472721-1-jan.kircher@leica-microsystems.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 12:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175581

Hello,

Can you set your git from address so git adds a From: line to your
patch?

git config --global sendemail.from "jan.kircher@leica-microsystems.com"

Should be working fine.

On 04/01/2023 13:26:26+0100, Jan Kircher via lists.openembedded.org wrote:
> Fixed an error when Bash's unbound variable protection is enabled (set -u) and variable LD_LIBRARY_PATH does not exist.
> 
> Signed-off-by: Jan Kircher <jan.kircher@leica-microsystems.com>
> ---
>  meta/classes-recipe/toolchain-scripts.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
> index 3cc823fe63..fa658a6596 100644
> --- a/meta/classes-recipe/toolchain-scripts.bbclass
> +++ b/meta/classes-recipe/toolchain-scripts.bbclass
> @@ -37,7 +37,7 @@ toolchain_create_sdk_env_script () {
>         echo '# http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html#AEN80' >> $script
>         echo '# http://xahlee.info/UnixResource_dir/_/ldpath.html' >> $script
>         echo '# Only disable this check if you are absolutely know what you are doing!' >> $script
> -       echo 'if [ ! -z "$LD_LIBRARY_PATH" ]; then' >> $script
> +       echo 'if [ ! -z "${LD_LIBRARY_PATH:-}" ]; then' >> $script

Your smtp server is mangling the patch (space vs tab) and it is not
possible to apply it.

>         echo "    echo \"Your environment is misconfigured, you probably need to 'unset LD_LIBRARY_PATH'\"" >> $script
>         echo "    echo \"but please check why this was set in the first place and that it's safe to unset.\"" >> $script
>         echo '    echo "The SDK will not operate correctly in most cases when LD_LIBRARY_PATH is set."' >> $script
> --
> 2.38.1
> 
> Please be advised that this email may contain confidential information. If you are not the intended recipient, please notify us by email by replying to the sender and delete this message. The sender disclaims that the content of this email constitutes an offer to enter into, or the acceptance of, any agreement; provided that the foregoing does not invalidate the binding effect of any digital or other electronic reproduction of a manual signature that is included in any attachment.

This is probably the cause of the issue.

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175473): https://lists.openembedded.org/g/openembedded-core/message/175473
> Mute This Topic: https://lists.openembedded.org/mt/96048942/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

