Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83628C43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 20:44:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.335.1655930684273978592
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 13:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F7cL239Z;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B7CB71C0002;
	Wed, 22 Jun 2022 20:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655930682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XKDn1GKBbF/bgz8jBR6yD/0VDPooniAZd73NmSr1ysw=;
	b=F7cL239ZrcRRKgNu3cNkPM/qdSFlj8QMeGtjA9jL6ok1Tn5QrapIDyZQncRO4rJakYrzKR
	fOEWJHNxgNXDylDjUfRzxMyGkAzF1/AWFCd2bj3Hir0ouYPaA3bMyYwMPJ21eQX7DFOYZ+
	bCmpImo7xo7VzuR317q6PKPufFpPDO665+PzTOP9Bq2EBGgmkW6RgTHnYAdUQhVpUGW7V/
	GILnW7vL3+CV7iKIFYCY1D99KvtgzJAjeUY1whPItO5b/US6UHeMAczHFYCCMTJrpesr91
	lHY0iVx0j8DjXEU5+Q/MN97sNwOKwU90lN8UmayQFAIL+l0ISqqgzt6hwMwzIg==
Date: Wed, 22 Jun 2022 22:44:40 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Markus Volk" <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH 1/2] llvm: make LLVM_HAVE_OPT_VIEWER_MODULES
 optional
Message-ID: <20220622224440.658ff65c@booty>
In-Reply-To: <20220622173251.478588-1-f_l_k@t-online.de>
References: <20220622173251.478588-1-f_l_k@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 20:44:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167256

Hi Markus,

On Wed, 22 Jun 2022 19:32:50 +0200
"Markus Volk" <f_l_k@t-online.de> wrote:

> Make it a PACKAGECONFIG option and thus avoid automagic to improve reproducibility
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-devtools/llvm/llvm_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
> index 67ed1eab00..b86605cbce 100644
> --- a/meta/recipes-devtools/llvm/llvm_git.bb
> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> @@ -90,6 +90,9 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
>                    -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
>                   "
>  
> +PACKAGECONFIG ?= ""
> +PACKAGECONFIG[optviewer] = "-DPY_PYGMENTS_FOUND=ON -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=ON -DPY_YAML_FOUND=ON,-DPY_PYGMENTS_FOUND=OFF,,python3-pygments python3-pyyaml"
> +

I have been working on a different version of this patch earlier today
based on the discussion on this mailing list. Now it completed testing
on my machine and I have run a build on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1049

My approach was slightly different, but not dramatically. I wrote a
more informative commit message though. I'm sending my patch to have
both out so that we can find which is the best one.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

