Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AE9CCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 20:52:12 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8123.1762462329321172411
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 12:52:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Qg2slbp9;
 spf=pass (domain: smile.fr, ip: 209.85.208.179, mailfrom: yoann.congal@smile.fr)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-378cfd75fb0so553891fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 12:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762462327; x=1763067127; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8dMI3PDIcsVxg35M57nLeTstHvPXJK3urjPKkk5yi6o=;
        b=Qg2slbp961lrK3a7LVK2LLJU130eqXEaTU42qhRuc2QDO/tp4p/7PKx6fX/utVP+EF
         IHcHFhTq7f58RVa2Q5J41NJ6VCk+PFZnezelUKt+440ZnBs6ToLpUgJ8MYrDL/zgyb+g
         lpq9g7H3DJn3avVjtfMu9T8/+7ViDuQOOSOcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762462327; x=1763067127;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dMI3PDIcsVxg35M57nLeTstHvPXJK3urjPKkk5yi6o=;
        b=qTi15tHNepW2JQ+2FlHvPi2bPttXTi2L2mM2FtK53SqRkgqYzoDGcljJ62fLhY8U8/
         eefsFm2z8x4tHhvKTiRi6r78H11anMPAHiVI5ukfqC6vvUKLvugtnDRHwtm8FLuE0o2Y
         JNmIkb6tI85sFqJr4eQf4ptoruQq+l0Rqm1vK4wUR+iYhUpP5tzCLvcRBKFVUdUJrnuh
         FDsdwMFV67zLZJ2Y0XTsNyTPFbKXL9sixUPS44zqKV4HQkTsmKCIYONWagAQm+D7ysux
         J85zO9J2NDLPmjLcwoIyfSCPOdV+M7pCybTPZCsedfQhDpWPgfQNsrAqyF7ZMlheQqst
         xPVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX93ITn2j5CckHiNrYIm+v4O3lC463AlaRyf/nWOnHgHZ7usbOX5gcMVy0bUfED64bXvn1lnVgOJTi0ZFeKQ0TDUQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4pNRFdaGMbPB9tavxZnonUUuHFIx776LhRhcZawvbky30loZ+
	vXy1s9epClL/mfDz44HRu+4KGPQb4v+5SucISruYu0B5C4N66gj6aLRomP7O6vNbgdSqpplcTg4
	7u+4XNB4=
X-Gm-Gg: ASbGnctRSb53kporjuolzy79PjVXmesWJpTUMTgpHfkUCQrdvOixPgwHH+Lczy6Z2tg
	wnS5aDZNij6MFcta22uEWckf3r8/hVxFLfWekLyxoDiq1cYpJIQ4dtSR4jRwH5vONN5SuGxvkpS
	GSEkTuDct9etW1v/ouiq1cjH1uMNjQX4+iPf+JQIlUKl+ICDOGCL3rF2EPRm5o9CYILjRh8YmeM
	HY9Qqh5UA9vn35s82EspB7EZv1NKTZFpuTClNfJylMlf4SGCm3m+tMR99/SmLuyysMylqsNXvT4
	ITko5V7L4bJwhzragRJet7kp4/+WXwkGzn3ob6pRQbjRuvbjfAxrANxN/FBxWjgDP3Ko3dX5G9c
	7yRnAZmgNEV7vLpYDA3GkyDms/krPYXjdgtMnoeBnwCZfkVwUnDZvKdB8jj+O6Av19l6Fg/GKHH
	gSokg2KroKbWWYvr6fYplUApjU7wWsHfBc93HL96debJt/IyR/NLbw0ucB4tGlIepz+c4+lhK5c
	idb6naunufjNHM2VsJC3LmvHgP80peV22iArheALSc=
X-Google-Smtp-Source: AGHT+IGnFxIry4ZOwRV+hmMb8GdLrqolNDpid2Gq0rWjr4gDq7CiVSX/GLgnkhfPhKN/O8vt8ouABQ==
X-Received: by 2002:a05:6512:2316:b0:592:f7ee:6dcf with SMTP id 2adb3069b0e04-59456b522b6mr178682e87.9.1762462327210;
        Thu, 06 Nov 2025 12:52:07 -0800 (PST)
Received: from ?IPV6:2a01:cb00:1331:aa00:328f:d57b:7553:b0cf? (2a01cb001331aa00328fd57b7553b0cf.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:328f:d57b:7553:b0cf])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b75dasm947380e87.59.2025.11.06.12.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 12:52:06 -0800 (PST)
Message-ID: <bad6e390-1eac-4afa-8635-2b5948e33ac6@smile.fr>
Date: Thu, 6 Nov 2025 21:52:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH RFC v2 5/8] kernel-yocto: add rust support via
 make rustavailable in do_kernel_configme
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
 sundeep.kokkonda@windriver.com, elmehdi.younes@smile.fr
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
 <20251105130942.833204-6-Harish.Sadineni@windriver.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20251105130942.833204-6-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 20:52:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226003



Le 05/11/2025 à 14:09, Sadineni, Harish via lists.openembedded.org a écrit :
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
> 
> To enable Rust integration in the Linux kernel build, this patch:
> 
> - Adds `rust-native`, `clang-native` and `bindgen-cli-native` to `do_kernel_configme[depends]`
>   to ensure required tools are available for Rust support.
> - Invokes `make rustavailable` inside `do_kernel_configme()` to prepare
>   the kernel for building Rust-based modules or core components.
> 
> The `make rustavailable` target requires the Rust standard library sources to be
> present under `${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust`, which is handled
> in the `rust` recipe via shared staging.
> 
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
> index e53bf15194..7a115bdffd 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -463,6 +463,10 @@ do_kernel_configme[depends] += "virtual/cross-binutils:do_populate_sysroot"
>  do_kernel_configme[depends] += "virtual/cross-cc:do_populate_sysroot"
>  do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
>  do_kernel_configme[depends] += "kern-tools-native:do_populate_sysroot"
> +do_kernel_configme[depends] += "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', \
> +                                'rust-native:do_populate_sysroot \
> +                                 clang-native:do_populate_sysroot \
> +                                 bindgen-cli-native:do_populate_sysroot', '', d)}"
>  do_kernel_configme[dirs] += "${S} ${B}"
>  do_kernel_configme() {
>  	do_kernel_metadata config
> @@ -507,6 +511,11 @@ do_kernel_configme() {
>  		echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
>  	fi
>  }
> +do_kernel_configme:append() {
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
> +        oe_runmake -C ${S} O=${B} rustavailable
> +    fi

(same question as in a previous patch) Why not adding this code to
do_kernel_configme() defined just above?

> +}
>  
>  addtask kernel_configme before do_configure after do_patch
>  addtask config_analysis
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225762): https://lists.openembedded.org/g/openembedded-core/message/225762
> Mute This Topic: https://lists.openembedded.org/mt/116133831/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yoann.congal@smile.fr]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Yoann Congal
Smile ECS


