Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BF0C4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 17:44:58 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.145.1668361489842120768
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 09:44:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k/obDex6;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id x21so10296245ljg.10
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 09:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zmCM/XIjTnAp4YLB2e+DMk9ujmC4U9FCw92Zk2pEuXQ=;
        b=k/obDex6eaBK3Oy9iHsvf2wIcKa9pdd1HosznI2bepLmk3VmefQeUO2CvDXVlyqSTX
         oBhyNliy0uWbNB8iJw4gbSyY4auQ/LIg2jVdj2fx6x0usnI2i9tQ72BAXD672Zupngb8
         zpGRNhtB/EpWd9mDQoNF7+gfjbGJmQ1jrAAbPGw7h2mgZ3Yb5SWRgnbZrXpemZoE0TYB
         2OAIv/S3v8xXP8gczzIxU2TSk/rCfD4hJJINJbby2g5hUInyGQw+lFraUhBDDMqvH2BX
         tcrowaelQZwy3pbNyJC0VvqeZq9Du58vvIEvvGYkCjB8AtQHA63a9gZewf5kU5ErglFp
         T2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmCM/XIjTnAp4YLB2e+DMk9ujmC4U9FCw92Zk2pEuXQ=;
        b=0/m6XXiSd0WwwCFwWJm6Ue0IlSCLCLBNx4ueDh273E+7mheaFym/TYfjCsjvJUgYaH
         kqWl5652eVga6fEpy3UvlZrdmekM5Y3oF1XYQ4zD++NtUYEU3JM3lKGvsrz4C0Dz2MFd
         V+AyVNRcP3oRtPJWDltScDQwcQjLKOn8RFHGWTAZ+8IEc9RVCFgeoeZ/nIIJ6p7Z3xvu
         Oe7E/gb1knYeQoy7R8DbxG7zeWuWKqSq18CH7F9gzs1eP6FAPhY0nI4ojD5ynDKwT80m
         PQJWSx/7wLxOHuJA3tQejQN2bGl8QLbw7rxLMkaJ1Lfn4ioVvl0zP9VCMiOiF6gawDiv
         mJaw==
X-Gm-Message-State: ANoB5plHwjHdCKP6ZTn0v9NN4Isaw65zQO/AaE6n1hhbcPlIkXeVMEJJ
	9O09ziuV8+ua5IUbn2KvhD0iDMY7GfUQHfE8yPk=
X-Google-Smtp-Source: AA0mqf5AiXKxT6ZXqumebgSY8BtilJMSEFwspY1BOwKx41bi4byFMdAVeBjQxg3oG0e+WB1mPQo/6ClRLNC+Qu1dXkw=
X-Received: by 2002:a2e:a5c7:0:b0:277:8759:bf65 with SMTP id
 n7-20020a2ea5c7000000b002778759bf65mr2952814ljp.108.1668361487916; Sun, 13
 Nov 2022 09:44:47 -0800 (PST)
MIME-Version: 1.0
References: <20221113084429.329094-1-vince@underview.tech>
In-Reply-To: <20221113084429.329094-1-vince@underview.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 13 Nov 2022 18:44:36 +0100
Message-ID: <CANNYZj_hMQeMh-Rp-fJ=nezRUcwaOk3mMpX4iKSxAEia7tmZeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: fix native llvm-config RUNPATH
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 17:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173207

I'm not sure I understand the desired outcome properly. Does this
patch native llvm-config according to the target libdir, or according
to the build host libdir? The first one is not correct (native items
must be reusable between targets), the second one is not solving the
problem?

Alex

On Sun, 13 Nov 2022 at 09:44, Vincent Davis Jr <vince@underview.tech> wrote:
>
> Problem occurs when native llvm-config binary is
> required by another recipe. RUNPATH is hardcoded
> to $ORIGIN/../lib:$ORIGIN/../../lib which depending
> upon architecture 'lib' directory name may vary
> (i.e 'lib64').
>
> Commit fixes issue by updating rpath on binary to include
> architecture dependent directory name.
>
> Commit also fixes issue with llvm-config --libdir command
> by setting LLVM_LIBDIR_SUFFIX. Command will return proper
> architecture dependent directory name.
>
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
>  meta/recipes-devtools/llvm/llvm_git.bb | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
> index 1f47e5d0fb..29eb119be5 100644
> --- a/meta/recipes-devtools/llvm/llvm_git.bb
> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> @@ -56,6 +56,14 @@ def get_llvm_arch(bb, d, arch_var):
>  def get_llvm_host_arch(bb, d):
>      return get_llvm_arch(bb, d, 'HOST_ARCH')
>
> +def get_llvm_libdir_suffix(bb, d):
> +    import re
> +    arch = d.getVar('HOST_ARCH')
> +    if re.match(r'(x86.64)$', arch):
> +        return 64
> +    else:
> +        return ""
> +
>  PACKAGECONFIG ??= ""
>  # if optviewer OFF, force the modules to be not found or the ones on the host would be found
>  PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"
> @@ -64,6 +72,7 @@ PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_
>  # Default to build all OE-Core supported target arches (user overridable).
>  #
>  LLVM_TARGETS ?= "AMDGPU;${@get_llvm_host_arch(bb, d)}"
> +LLVM_TARGET_LIBDIR_SUFFIX ?= "${@get_llvm_libdir_suffix(bb, d)}"
>
>  ARM_INSTRUCTION_SET:armv5 = "arm"
>  ARM_INSTRUCTION_SET:armv4t = "arm"
> @@ -83,6 +92,10 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
>                    -DCMAKE_BUILD_TYPE=Release \
>                    -G Ninja"
>
> +EXTRA_OECMAKE:append:class-native = "\
> +                  -DLLVM_LIBDIR_SUFFIX=${LLVM_TARGET_LIBDIR_SUFFIX} \
> +                  "
> +
>  EXTRA_OECMAKE:append:class-target = "\
>                    -DCMAKE_CROSSCOMPILING:BOOL=ON \
>                    -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
> @@ -129,6 +142,7 @@ do_install:class-native() {
>  }
>
>  SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
> +SYSROOT_PREPROCESS_FUNCS:append:class-native = " llvm_sysroot_preprocess_native"
>
>  llvm_sysroot_preprocess() {
>         install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
> @@ -136,6 +150,18 @@ llvm_sysroot_preprocess() {
>         ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
>  }
>
> +# All of LLVM's shipping binaries have an rpath pointing at ``$ORIGIN/../lib``.
> +# Recipe llvm requires llvm-native to compile. When compiling llvm build libraries
> +# are located in $ORIGIN/../lib directory. When the llvm-config binary required
> +# in another recipe depending upon HOST_ARCH variable libraries may be located
> +# in a different directory. Account for both situations here.
> +llvm_sysroot_preprocess_native() {
> +       chrpath --replace '$ORIGIN'/../lib${LLVM_TARGET_LIBDIR_SUFFIX}:'$ORIGIN'/../../lib${LLVM_TARGET_LIBDIR_SUFFIX}:'$ORIGIN'/../lib:'$ORIGIN'/../../lib \
> +                          ${SYSROOT_DESTDIR}${bindir}/llvm-tblgen${PV}
> +       chrpath --replace '$ORIGIN'/../lib${LLVM_TARGET_LIBDIR_SUFFIX}:'$ORIGIN'/../../lib${LLVM_TARGET_LIBDIR_SUFFIX}:'$ORIGIN'/../lib:'$ORIGIN'/../../lib \
> +                          ${SYSROOT_DESTDIR}${bindir}/llvm-config${PV}
> +}
> +
>  PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto"
>
>  RRECOMMENDS:${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173187): https://lists.openembedded.org/g/openembedded-core/message/173187
> Mute This Topic: https://lists.openembedded.org/mt/94995332/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

