Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6883C4332F
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 18:28:20 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.2794.1671388094612550328
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 10:28:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RYTt0gSr;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 04F04100003;
	Sun, 18 Dec 2022 18:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671388092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pm4Fc7UatbGcUry5tUeucR3exPaOwPWBtA25znyW+uA=;
	b=RYTt0gSrcxyL1ZWfM3Kr59MR0MF/XrRWiYQmRwnlnezNtlBZLufxG+WonLFnmlMJ9ni68d
	YUu0XKuelFjE/9XWSm0StmD0klTVGjx3hhoe4S795aROKmOD25B4oEug+Q4jFBalZJWQCh
	ABC+BxBmxCZw5cXMfQwclcIN2GZRGmt1zqZ/jNf2wrWzdsTHh7P7BnEVvNIdHbgcqCDdUZ
	9n29DKLQb0qxTmwS4yaHLjFEKZN9ljFkJGu2mEIdIx/rCpiL/aSUpdA7nzUkoNZa9vMOVz
	WWVmMGrrL9YWSSHmKX+0G+4tTufm9X0aH8gTMjjRFrSidGy/aRSoF+wqCGOw0Q==
Date: Sun, 18 Dec 2022 19:28:11 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Anton Antonov <anton.antonov@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [langdale][master][PATCH v2] rust: Do not use default
 compiler flags defined in CC crate
Message-ID: <Y59bu7W+hEtBpCAj@mail.local>
References: <20221209095008.563491-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209095008.563491-1-Anton.Antonov@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 18:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174807

Hello,

This caused errors on the autobuilders:
https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/6367/steps/12/logs/stdio

On 09/12/2022 09:50:08+0000, Anton Antonov wrote:
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
>  meta/classes-recipe/rust-target-config.bbclass | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
> index 2710b4325d..0f72d685df 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -401,3 +401,20 @@ python do_rust_gen_targets () {
>  addtask rust_gen_targets after do_patch before do_compile
>  do_rust_gen_targets[dirs] += "${RUST_TARGETS_DIR}"
>  
> +# For building C dependecies only use compiler parameters defined in OE-core
> +# and ignore the default parameters defined in the CC crate.
> +# https://github.com/rust-lang/cc-rs#external-configuration-via-environment-variables
> +
> +# The CC crate checks for CRATE_CC_NO_DEFAULTS existence not value.
> +# Even empty CRATE_CC_NO_DEFAULTS will be taken into account.
> +# For rust native recipes we still rely on the CC crate parameters.
> +# Currently it's not possible to export a variable conditionally,
> +# so, let's export it for class-target and class-nativesdk only
> +
> +do_compile:prepend:class-target() {
> +    export CRATE_CC_NO_DEFAULTS=1
> +}
> +
> +do_compile:prepend:class-nativesdk() {
> +    export CRATE_CC_NO_DEFAULTS=1
> +}
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174440): https://lists.openembedded.org/g/openembedded-core/message/174440
> Mute This Topic: https://lists.openembedded.org/mt/95557415/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

