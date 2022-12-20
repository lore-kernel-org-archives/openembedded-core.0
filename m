Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4080C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 15:21:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.52788.1671549656797545084
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 07:20:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mCpGhPzS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E2BCB1C0004;
	Tue, 20 Dec 2022 15:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671549654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=72dpLAyk8znR0msawvZ99KfW+qwPk8hJeG0jCybuDPo=;
	b=mCpGhPzSrpLNvPfD6e6OiFgpmrAP25Gj1pKn30N99woVzKXD8h6m5I0cc9eQFj4eIU5D42
	hpgOb+jPvQkBtNLDeMrQqxJFIBfsWVFTGuakpq8Hlutk22UENNLGATnHyiYSOI6tAjGanu
	dyE/cz4FdHNQ1SywF7hRV0phr91kJmeQzy6AjqXet3ZKR5fzKvMEHHStBsRyuoYa8Bougs
	F0oaz6AbAikBJb8TOGVAgxE7JvnZ88vb7eIL6Ii82ZxLguUiUo6bPJPy2WsM2lHzlpU313
	QqkUmD6BPcckG8BW9kUKJ9oas1Yd7tllHpub88LFva9q3xzv4Yj42qpPG2vFMg==
Date: Tue, 20 Dec 2022 16:20:53 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Anton Antonov <anton.antonov@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [langdale][master][PATCH v3] rust: Do not use default
 compiler flags defined in CC crate
Message-ID: <Y6HS1fEm26XWUMS8@mail.local>
References: <20221220112459.1734179-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221220112459.1734179-1-Anton.Antonov@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 15:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174857

Hello,

this fails on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/6362/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/6274/steps/12/logs/stdio

On 20/12/2022 11:24:59+0000, Anton Antonov wrote:
> Rust crates build dependecy C libraries using "CC" crate.
> This crate adds some default compiler parameters depending on target arch.
> For some target archs these parameters conflict with the parameters defined by OE.
> 
> Warnings/errors like this can be seen in the case:
> 
> cc1: error: switch '-mcpu=cortex-a15' conflicts with switch '-march=armv7-a+fp' [-Werror]
> 
> Lets use only the OE parameters by exporting CRATE_CC_NO_DEFAULTS.
> https://github.com/rust-lang/cc-rs#external-configuration-via-environment-variables
> 
> This patch fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=14947
> 
> Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
> ---
>  meta/classes-recipe/rust-target-config.bbclass | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
> index 2710b4325d..5685897462 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -401,3 +401,16 @@ python do_rust_gen_targets () {
>  addtask rust_gen_targets after do_patch before do_compile
>  do_rust_gen_targets[dirs] += "${RUST_TARGETS_DIR}"
>  
> +# For building C dependecies use only compiler parameters defined in OE-core
> +# and ignore the default parameters defined in the CC crate.
> +# https://github.com/rust-lang/cc-rs#external-configuration-via-environment-variables
> +
> +# The CC crate checks for CRATE_CC_NO_DEFAULTS existence not value.
> +# Even empty CRATE_CC_NO_DEFAULTS will be taken into account.
> +# For rust native recipes we still rely on the CC crate parameters.
> +# Currently it's not possible to export a variable conditionally,
> +# so, let's export it for class-target only
> +
> +do_compile:prepend:class-target() {
> +    export CRATE_CC_NO_DEFAULTS=1
> +}
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174846): https://lists.openembedded.org/g/openembedded-core/message/174846
> Mute This Topic: https://lists.openembedded.org/mt/95783763/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

