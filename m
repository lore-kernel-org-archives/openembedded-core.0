Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D29E743F4
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 08:16:55 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.12904.1695975405898033799
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 01:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eDn3EWxK;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-534848725e8so7013331a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 01:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695975404; x=1696580204; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z9GaxfFYNkG1MzK6ZkemJhbxQxvXr9/3gId7RbBW4w0=;
        b=eDn3EWxKoJKexZ2DyT6VLhih5jfOgi3q3Zf3GIr58zGBH38tYnIWtJ+EPagchZAChL
         JFubI0K+xnHfvAb+C0vYPsbCcO2ipLKFzR9t+OsGCCouBnNXoSXjdDy8LLPE3YJCrnPk
         71b77sxLMOaCjT1/KxuyoqoT0U1JVBn5o+jpY16IG8GM4SfRoB9PL3adJGLD1/Nvz0FS
         DeUK91VQCDVLeRkoaxx5UNR/Ah8zBFLpdRVIQe9DvL4C8CO9481AdwoyK8VeqDBJigwP
         1Ls/3BOJ8SEcdMOiohtFmA7JTDy2zGluYpA2Yp/nYsAVBIcTPeGOW80P4B2Mfc8Na5Qx
         ZHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695975404; x=1696580204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9GaxfFYNkG1MzK6ZkemJhbxQxvXr9/3gId7RbBW4w0=;
        b=Kt92ypfAkanbm7BUsBbyRgkHu7/s4IJkek9aV1ye0dPtC3RBoX2iBsJS/J5Be/OSly
         Lf6oGTsASRdFxQEn8OzYQEmtND3gEa4ZBrtphJDUTmAHiKsnnIh6nK5iM+gdi4/Osi/o
         kyHor3l3FhKi2CoEvIBALxQ4VxZsfUnYowRt46nRvzFgyjmV1ryGbKQqOzLc8jfIq6Vy
         3QtZYJWWLGm+EMYimAyMAtbets3fjfk6k1OZn4kL835M6RGTOeHRWNKWNF8ORokvVW5F
         Ks0otv19PpeN+z51NJC870Nhvxs+sRFnaIf57nMYmVI2E2YZVQbHuDB01vLTTYr1Uyp/
         RK5g==
X-Gm-Message-State: AOJu0YzHh6XEJrX88ta4dnBvulbCEw8ad1LcIYGR2IphKTgN7WTfXQ4h
	yEST4s+IFuxQOrKFP8pazD0=
X-Google-Smtp-Source: AGHT+IHPLBdJ4eH+B3TD4/fqBWmu/QFOeeUr42g+PNSto+haeEW1xu0zsOrmnpUTVvgNBpoGdBghrQ==
X-Received: by 2002:a17:906:104e:b0:9ae:4e81:4580 with SMTP id j14-20020a170906104e00b009ae4e814580mr3287984ejj.66.1695975404017;
        Fri, 29 Sep 2023 01:16:44 -0700 (PDT)
Received: from [192.168.2.52] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id oq19-20020a170906cc9300b0098f99048053sm12150796ejb.148.2023.09.29.01.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 01:16:43 -0700 (PDT)
Message-ID: <b634757c-30bf-728e-06c0-e400ae9c8934@gmail.com>
Date: Fri, 29 Sep 2023 10:16:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [OE-core] [PATCH 1/2] mesa: Fix native build on hosts with
 llvm-dev installed
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20230928230106.1058552-1-raj.khem@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20230928230106.1058552-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 08:16:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188393

2023. 09. 29. 1:01 keltezéssel, Khem Raj írta:
> This issue is always there, it just shows up with newer LLVM since
> symbol mismatches are being found otherwise it was happily linking with
> host libLLVM.so silently.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   ...e-cmake-dependency-detector-for-llvm.patch | 47 +++++++++++++++++++
>   meta/recipes-graphics/mesa/mesa.inc           |  1 +
>   2 files changed, 48 insertions(+)
>   create mode 100644 meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch b/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
> new file mode 100644
> index 00000000000..3a836ab4821
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
> @@ -0,0 +1,47 @@
> +From 00d41cd5aa3f4b494dc276c9b4ccdc096310c91f Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 28 Sep 2023 15:34:22 -0700
> +Subject: [PATCH] meson: Disable cmake dependency detector for llvm
> +
> +meson dependency auto dependency detection uses cmake and then
> +config-tool to process dependencies, in mesa the logic to detect llvm is
> +using auto detection which means if it finds cmake then it will try to
> +use cmake method. Cmake method works ok except a case when llvm-dev
> +package is installed on the build host then it generates its own
> +native.meson file and ignores OE supplied meson.native file which has
> +correct llvm-config tool specified which is pointing to llvm-config from
> +native sysroot. The generated meson.native file points to one found in
> +/usr/bin and there onwards detector finds native install of llvm and
> +configures that into building native mesa package.
> +
> +Since cmake detector does not always work, disable it by default and use
> +config-tool which works in all cases. This is suggested in below issues
> +too
> +
> +A similar issue is open in meson upstream [1] and mesa [2]
> +
> +[1] https://github.com/mesonbuild/meson/issues/10483
> +[2] https://gitlab.freedesktop.org/mesa/mesa/-/issues/6738

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25438

> +
> +Upstream-Status: Inappropriate [Cross-compile specific]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + meson.build | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/meson.build b/meson.build
> +index 00a6953..05815ec 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -1659,6 +1659,7 @@ with_llvm = false
> + if _llvm.allowed()
> +   dep_llvm = dependency(
> +     'llvm',
> ++    method : 'config-tool',
> +     version : _llvm_version,
> +     modules : llvm_modules,
> +     optional_modules : llvm_optional_modules,
> +--
> +2.42.0
> +
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 559d445ae5e..4e824500dd0 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -19,6 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>              file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
>              file://0001-gallium-Fix-build-with-llvm-17.patch \
>              file://0001-intel-Allow-using-intel_clc-from-the-system.patch \
> +           file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch \
>              "
>   
>   SRC_URI[sha256sum] = "45434ff91a709844130a3174d9c0ef39c6b50725b2bb0c13e736f36134db14ad"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188386): https://lists.openembedded.org/g/openembedded-core/message/188386
> Mute This Topic: https://lists.openembedded.org/mt/101648329/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


