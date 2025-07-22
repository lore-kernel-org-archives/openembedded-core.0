Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8AEC83F25
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 01:36:39 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.2851.1753148196421477446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 18:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YRZycyIL;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-75001b1bd76so3085535b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 18:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753148196; x=1753752996; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NTk1bXdFu/oszyAM+uY16Ch4m6FKRfrpJ1rKsLpYRRQ=;
        b=YRZycyILGMEi7Uj0IJ05hjZ5Ko54km5JFI5L05qRPA5zgYAhvDCmOYGul72yctEy7J
         G7Dj4K24w/LGcnMWXQkIHssX8BOcG4qgPFhAxS2+iqbPHWvoRRJRdlAKuLF3RNDWXCSA
         5N4g9CLw2+H/ONfX25wLMI0729kLgl1TE4KbQFIWXqMqi3Hbys9l6NTUAbm9ZsIETotT
         u9OTG61Ol6f3FgMCJGIdtOdqt9VR6f5vCnfovvuTboeoU2Mcyel+lUtDfnaNHkVcOzJ2
         sI3lQ2xFmU+8AlVfmTRjy25zYfPvUYWYY3QaZJxQQXIrjFj7iIKEnmMRjaY6d4vh0a5m
         irSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753148196; x=1753752996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NTk1bXdFu/oszyAM+uY16Ch4m6FKRfrpJ1rKsLpYRRQ=;
        b=SOy3CRurSEDGCS2nQGZjo1bp9Q36Fztkba/46olm3kFsyYF/xUGGl+v6PX8WxL4lfO
         YxLvBRiZBwLScI4A2zv/qiFXD5RJsqBvbwpzzwTk+S+FgO5qzpOvURdPsCV8e1jV5Zkq
         y2SVKbzZIMKn+4oCtDRj14XPKj4sR0snCE1gg+YuvS9oePUQYBJCXqVaVHuwn3SWH9EC
         1PjgwzBGfcrGR1Vi4bk5QsRrDyp+/yBRPNwdmwnYDl/48h+Mwv6C86k75QPpBVE1wFN6
         R/28jWiLoUGdLL52YHVL+d3xCgJ9mr/CSXGXOSRAX7AJY8JEruIMHtxFwp4L1HCFHQ+s
         UwZA==
X-Forwarded-Encrypted: i=1; AJvYcCX0ulgZ3JFuzcz/+2e6tGjfmlRc4ZSA0Wx1GrCuLHU+k8D4led+ejdl9h6hqlknheMj8NH162OuTHiGPBS2xu1lLg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxNBR+u7BtMamlWryPViUgckX/L2MBQnCwOEGp22q85w1tAAf5q
	ORMvFigwkhdjc3kaSdCgoYH4ej2VOTwejp0bV8C5pJ3/72Ym0zxKuXUZ
X-Gm-Gg: ASbGnctNagH2Xf1du1XMvjWjAME52dfTf0DKigcQN+5BA4BT7kzGWwB0HD/6oMETDdM
	MB1tnhTASyL3CsVzS0xZs3fMOdSzuLCezjB2p5vGQHdxlkBytu5XfvFGTDodI4cDSXzNZ6v2MDm
	nqyK+PPMzoMR5ZvZa0Uu3nreAos4v5MNbHZbliuuYznctF2T+n3I+hVf3gZ1vHTWoduXX2nOoGm
	rWzGcb+rwDXXwoTxVtXx4ctXR3+EILeAnRuDDWcdRh1u4g1ZADJwgsZFKT0cj18eUlnq8abvzqW
	650pr51c2YmsJL+s7SmTvsMJV7Txz+yml7tTJRGOc+fyrjs2xhIrpYmMkeCq1eJa4g2CRnslxO5
	b5GiBIJWQNCjXVJckE9qScrvNy6AhEK5rt5jo3VrYizrgB3s=
X-Google-Smtp-Source: AGHT+IGhByBB888WiM8aav4P0t1riZMMb0Q2n/n8cF1DfRw2trajYDgySkH6yFjtW+ZLv6KT9Xk63A==
X-Received: by 2002:a05:6a21:e584:b0:1f5:95a7:8159 with SMTP id adf61e73a8af0-2381143f76cmr37274659637.10.1753148195627;
        Mon, 21 Jul 2025 18:36:35 -0700 (PDT)
Received: from [10.15.13.154] ([209.129.148.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc6aab8sm6321183b3a.157.2025.07.21.18.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 18:36:34 -0700 (PDT)
Message-ID: <719acd36-4a42-4d73-ab01-1728fb93045d@gmail.com>
Date: Mon, 21 Jul 2025 18:36:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH RFC v2 5/6] mesa: use simpler mesa-tools-native
 recipe as dependency for libclc
To: foss@0leil.net, openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>,
 Ross Burton <ross.burton@arm.com>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>,
 Quentin Schulz <quentin.schulz@cherry.de>
References: <20250721-mesa-libclc-panfrost-v2-0-f713d0858949@cherry.de>
 <20250721-mesa-libclc-panfrost-v2-5-f713d0858949@cherry.de>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250721-mesa-libclc-panfrost-v2-5-f713d0858949@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 01:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220714



On 7/21/25 3:33 AM, Quentin Schulz via lists.openembedded.org wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> libclc is required for some drivers (asahi, panfrost and intel at the
> very least).
> libclc brings very expensive dependencies such as llvm and clang.
> Building clang and llvm for each target architecture is very expensive,
> but mesa allows to depend on prebuilt host binaries (mesa-clc and
> precomp-compiler). Those are built by mesa as well, but can be compiled
> in mesa-native instead of mesa, making the dependency expensive but only
> once regardless of the number of target architectures to build for.
> Ideally the mesa-clc and precomp-compiler would only be compiled in
> mesa-native if target mesa requires libclc support, however this is not
> possible as a target recipe cannot impact or depend on a native recipe's
> configuration. We thus have two choices, always build libclc in
> mesa-native with its heavy dependencies and impact every build or force
> the user to modify the mesa-native recipe in a custom layer (as a native
> recipe cannot use target's OVERRIDES). The latter is unacceptable so the
> former seems to be the only option. Another big downside is that
> mesa-native currently builds drivers (amd, nouveau, svga) which we may
> have absolutely no interest in building, increasing the build time and
> possibly dependencies list).
> 
> A third choice is to spin-off the native mesa recipe with libclc support
> into a new recipe without drivers and only what's necessary to build
> mesa-clc and precomp-compiler binaries.
> This allows to keep a "clean" mesa-native recipe for whoever needs those
> drivers built-in (e.g. for testing, for qemu-native, or whatever else)
> and only bring the libclc dependency when required by the target recipe.
> 
> Because libclc is now only built for the host, opencl support now needs
> to explicitly bring libclc and others to build as libclc won't bring it
> in the build environment anymore.
> 

libclc from clang ( native ) should be enough to use, we then do
not need target clang versions, since we are cross compiling 
clang-native would be happy to use libclc-native backend for OpenCL and that
would be all, we need to configure clang-native with AMDGPU and NVPTX
targets of course.

> Suggested-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>   meta/recipes-graphics/mesa/mesa-tools-native.bb | 21 +++++++++++++++++++++
>   meta/recipes-graphics/mesa/mesa.inc             | 11 ++---------
>   2 files changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/recipes-graphics/mesa/mesa-tools-native.bb
> new file mode 100644
> index 0000000000000000000000000000000000000000..5f7c3a2dc2338e328e0e30b93c263f6c87b61eaa
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
> @@ -0,0 +1,21 @@
> +require mesa.inc
> +inherit native
> +
> +SUMMARY += " (tools only)"
> +
> +S = "${UNPACKDIR}/mesa-${PV}"
> +
> +PACKAGECONFIG = "tools asahi intel panfrost"
> +# llvm required for libclc
> +PACKAGECONFIG += "gallium-llvm"
> +# Doesn't compile without wayland-scanner if PLATFORMS has wayland in, and,
> +# doesn't compile at all if PLATFORMS is empty so add x11 and wayland
> +# to PACKAGECONFIG like in mesa.inc
> +PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)}"
> +
> +DEPENDS += "libclc-native spirv-tools-native spirv-llvm-translator-native"
> +
> +EXTRA_OEMESON += " \
> +    -Dmesa-clc=enabled -Dinstall-mesa-clc=true -Dmesa-clc-bundle-headers=enabled \
> +    -Dprecomp-compiler=enabled -Dinstall-precomp-compiler=true \
> +"
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 5295b70fc9b4bb9570d86333f9229aef9114d93d..0fdb6d19655a06b645c6ac8815dfc62fa7e0c9eb 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -126,7 +126,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
>   
>   # "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
>   # Be sure to enable them both for the target and for the native build.
> -PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native"
> +PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native libclc spirv-tools spirv-llvm-translator"
>   
>   PACKAGECONFIG[broadcom] = ""
>   PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
> @@ -165,16 +165,9 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '
>   GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r600', '', d)}"
>   GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
>   
> -MESA_CLC = "system"
> -MESA_CLC:class-native = "enabled"
> -INSTALL_MESA_CLC = "false"
> -INSTALL_MESA_CLC:class-native = "true"
> -MESA_NATIVE = "mesa-native"
> -MESA_NATIVE:class-native = ""
> -
>   PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
>   PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
> -PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
> +PACKAGECONFIG[libclc] = "-Dmesa-clc=system -Dprecomp-compiler=system,,mesa-tools-native"
>   PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
>   PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220678): https://lists.openembedded.org/g/openembedded-core/message/220678
> Mute This Topic: https://lists.openembedded.org/mt/114265791/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


