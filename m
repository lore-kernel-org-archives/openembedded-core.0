Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B8EC433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 17:03:25 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.1277.1633971805017929572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 10:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IkfKgQsB;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id bl14so3644744qkb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 10:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=025kucqJRmurGOWTpjI8Y3eTHFitukdpPIXv/tgaNXE=;
        b=IkfKgQsBF1N8gROZpPMqEe8ROkNyp8Zw6v0u76hDB7Q5r8RmgyjDPeL/A5QNh1Fn9c
         m3lU+PfVaXK+EzNIzKEgtaUoGlQPXr7FK6HMLTOFu98Qfe/FfxmcxvpHvR2NIQLOZARV
         LQf41w4beB0szk2VGSg/ZnGxm5AxkIdifxvnM6iQKo1LEQjTtCF3eyYH1gL16Hzcia6w
         Hxo25zzRGiYG9SNemsDiY+VJPa7xwyRgGkmlAGAz8QfMHaoYJJ8RyGvY6IgJNI402caY
         MFD01uSmi+IAkt8tyfKsrlqrc2Y0uCzldohcds5QxSDbUKyF6i+phvvsOfeikuCn0nGO
         w4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=025kucqJRmurGOWTpjI8Y3eTHFitukdpPIXv/tgaNXE=;
        b=ZNrtyEot/MtXUh66QcHzWb5/VX+cjrgW/wwTZDm0dEYpve/bf2zPiXWBj5uoJXqTYd
         StiAbHJrHSDnyd6pGdLkmLXPA0c3jxWko+DXEY5jZnQQ4/G2x6jEM+PZDvLjD0POEm0B
         go1CrXHvwH3LUoYbMMvkVrBdxGASfxKTnv7vbxlqcLT+Q2or0H2AfQ/QitzbX2N3qG5H
         tN+wivQLRL9nCoEnls0EJNcYKcOiRMr0ftZOekK0Tu47OLp9NWH3Wep0mugds8N8Kp90
         u8bLcddPyrGJucd9/Ch5k4YeVZtUACikRLlv7m5yr8xJ9n8EmmGr/79EjcCXln1Va1Fn
         Aoiw==
X-Gm-Message-State: AOAM532v4oYgGwsa2WkgKvWKse98uilcd/ltHNIif7dtqHR/tXYPbxUa
	ShFmroe/j1KbUNLZIN4kFGXAVUeBrVrc2rE0uNE=
X-Google-Smtp-Source: 
 ABdhPJxAoKQhm4aizxQ0mm8LSHDZuKt1VtdWkHLcOh8u3gQyoK6Nj8tXZ0y7gM9cQjAyDLSJbUm+ECXuNFsCmNyOZ00=
X-Received: by 2002:a37:8401:: with SMTP id g1mr15821711qkd.231.1633971803896;
 Mon, 11 Oct 2021 10:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211010191008.4122049-1-alex@linutronix.de>
 <20211010191008.4122049-13-alex@linutronix.de>
In-Reply-To: <20211010191008.4122049-13-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Oct 2021 10:02:57 -0700
Message-ID: 
 <CAMKF1spWkdXuSBcc1Dkb6dkfiKxpKmkB6=2SsuaOyWhuu0NMkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/13] rust: generate target definitions from
 (arch, abi), not just arch
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 17:03:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156843

On Sun, Oct 10, 2021 at 12:11 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This allows to add the missing x32 definition and others in the future.
>

It missed the powerpc eabispe, If we are going to use ABI extensions

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-devtools/rust/rust-common.inc | 57 +++++++++++++---------
>  meta/recipes-devtools/rust/rust-cross.inc  |  4 +-
>  2 files changed, 38 insertions(+), 23 deletions(-)
>
> diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
> index 797284316e2..7f92602e165 100644
> --- a/meta/recipes-devtools/rust/rust-common.inc
> +++ b/meta/recipes-devtools/rust/rust-common.inc
> @@ -119,22 +119,22 @@ def llvm_features(d):
>
>
>  ## arm-unknown-linux-gnueabihf
> -DATA_LAYOUT[arm] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
> -LLVM_TARGET[arm] = "${RUST_TARGET_SYS}"
> -TARGET_ENDIAN[arm] = "little"
> -TARGET_POINTER_WIDTH[arm] = "32"
> -TARGET_C_INT_WIDTH[arm] = "32"
> -MAX_ATOMIC_WIDTH[arm] = "64"
> -FEATURES[arm] = "+v6,+vfp2"
> +DATA_LAYOUT[arm-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
> +LLVM_TARGET[arm-eabi] = "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[arm-eabi] = "little"
> +TARGET_POINTER_WIDTH[arm-eabi] = "32"
> +TARGET_C_INT_WIDTH[arm-eabi] = "32"
> +MAX_ATOMIC_WIDTH[arm-eabi] = "64"
> +FEATURES[arm-eabi] = "+v6,+vfp2"
>
>  ## armv7-unknown-linux-gnueabihf
> -DATA_LAYOUT[armv7] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
> -LLVM_TARGET[armv7] = "${RUST_TARGET_SYS}"
> -TARGET_ENDIAN[armv7] = "little"
> -TARGET_POINTER_WIDTH[armv7] = "32"
> -TARGET_C_INT_WIDTH[armv7] = "32"
> -MAX_ATOMIC_WIDTH[armv7] = "64"
> -FEATURES[armv7] = "+v7,+vfp2,+thumb2"
> +DATA_LAYOUT[armv7-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
> +LLVM_TARGET[armv7-eabi] = "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[armv7-eabi] = "little"
> +TARGET_POINTER_WIDTH[armv7-eabi] = "32"
> +TARGET_C_INT_WIDTH[armv7-eabi] = "32"
> +MAX_ATOMIC_WIDTH[armv7-eabi] = "64"
> +FEATURES[armv7-eabi] = "+v7,+vfp2,+thumb2"
>
>  ## aarch64-unknown-linux-{gnu, musl}
>  DATA_LAYOUT[aarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
> @@ -152,6 +152,14 @@ TARGET_POINTER_WIDTH[x86_64] = "64"
>  TARGET_C_INT_WIDTH[x86_64] = "32"
>  MAX_ATOMIC_WIDTH[x86_64] = "64"
>
> +## x86_64-unknown-linux-gnux32
> +DATA_LAYOUT[x86_64-x32] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
> +LLVM_TARGET[x86_64-x32] = "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[x86_64-x32] = "little"
> +TARGET_POINTER_WIDTH[x86_64-x32] = "32"
> +TARGET_C_INT_WIDTH[x86_64-x32] = "32"
> +MAX_ATOMIC_WIDTH[x86_64-x32] = "64"
> +
>  ## i686-unknown-linux-{gnu, musl}
>  DATA_LAYOUT[i686] = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
>  LLVM_TARGET[i686] = "${RUST_TARGET_SYS}"
> @@ -292,22 +300,27 @@ TARGET_LLVM_FEATURES = "${@llvm_features(d)}"
>  # (original) target.
>  TARGET_LLVM_FEATURES:class-native = "${@','.join(llvm_features_from_cc_arch(d))}"
>
> -def rust_gen_target(d, thing, wd, features, cpu, arch):
> +def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
>      import json
>      sys = sys_for(d, thing)
>      prefix = prefix_for(d, thing)
>
> -    features = features or d.getVarFlag('FEATURES', arch) or ""
> +    if abi:
> +        arch_abi = "{}-{}".format(arch, abi)
> +    else:
> +        arch_abi = arch
> +
> +    features = features or d.getVarFlag('FEATURES', arch_abi) or ""
>      features = features.strip()
>
>      # build tspec
>      tspec = {}
> -    tspec['llvm-target'] = d.getVarFlag('LLVM_TARGET', arch)
> -    tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch)
> -    tspec['max-atomic-width'] = int(d.getVarFlag('MAX_ATOMIC_WIDTH', arch))
> -    tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch)
> -    tspec['target-c-int-width'] = d.getVarFlag('TARGET_C_INT_WIDTH', arch)
> -    tspec['target-endian'] = d.getVarFlag('TARGET_ENDIAN', arch)
> +    tspec['llvm-target'] = d.getVarFlag('LLVM_TARGET', arch_abi)
> +    tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch_abi)
> +    tspec['max-atomic-width'] = int(d.getVarFlag('MAX_ATOMIC_WIDTH', arch_abi))
> +    tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch_abi)
> +    tspec['target-c-int-width'] = d.getVarFlag('TARGET_C_INT_WIDTH', arch_abi)
> +    tspec['target-endian'] = d.getVarFlag('TARGET_ENDIAN', arch_abi)
>      tspec['arch'] = arch_to_rust_target_arch(arch)
>      tspec['os'] = "linux"
>      if "musl" in tspec['llvm-target']:
> diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
> index bee7c9f12f3..42163f7b819 100644
> --- a/meta/recipes-devtools/rust/rust-cross.inc
> +++ b/meta/recipes-devtools/rust/rust-cross.inc
> @@ -11,13 +11,15 @@ python do_rust_gen_targets () {
>          features = ""
>          cpu = "generic"
>          arch = d.getVar('{}_ARCH'.format(thing))
> +        abi = ""
>          if thing is "TARGET":
> +            abi = d.getVar('ABIEXTENSION')
>              # arm and armv7 have different targets in llvm
>              if arch == "arm" and target_is_armv7(d):
>                  arch = 'armv7'
>              features = d.getVar('TARGET_LLVM_FEATURES') or ""
>              cpu = d.getVar('TARGET_LLVM_CPU')
> -        rust_gen_target(d, thing, wd, features, cpu, arch)
> +        rust_gen_target(d, thing, wd, features, cpu, arch, abi)
>  }
>
>  # Otherwise we'll depend on what we provide
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156806): https://lists.openembedded.org/g/openembedded-core/message/156806
> Mute This Topic: https://lists.openembedded.org/mt/86220702/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

