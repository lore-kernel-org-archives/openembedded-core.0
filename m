Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DFFCCD19A
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 11:27:50 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.12990.1760700463015554920
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 04:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g49Kk3ax;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso3812716a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 04:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700461; x=1761305261; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sBUzSS1+lJ7stx8uE1UIT9+pppCGgqUjS0bkO7btAp4=;
        b=g49Kk3ax06W6etj3hoGCjxeooLoueozB0KAxUZPGf4ocYWwYk8EE0nF9+byF8DcYvU
         t8ja0PFrNjj/UZpIzceGbbCtSshN8qQuAbXCIJKJuB1h4/dCB8fXxp/HXCZZ8zCJ62+l
         hfWj52p3DQGE9JLXvQ11fwJ6FJZEFQcXozaoRg9BCQ9tIzzjwZXHoOVBR18d9kSeRurC
         q8mC9jvRiGcc2URBuWdQiVI+povpQXps01waJiMvZ700/5wSVBPRAn9n2IK8QiEiwwFz
         6+m7XtDmf7RgoNAXtcN1KTQwKavQ3M4onlnrSlmqMFnLO/bh9oIRjg/DX2Ss0CJn4m3+
         iGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700461; x=1761305261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sBUzSS1+lJ7stx8uE1UIT9+pppCGgqUjS0bkO7btAp4=;
        b=bhUO+RhGnBFkWAH35dtR45uOjDdqWhmoKN9++sFXyo8vKscrSk5PsR1efbbQspjnaS
         bG7nbkKv2koetYi7UtMYWhPoyegg64v1kDS0tMIDf8HYMIEagBJcKbRlXKKiunxfdW+S
         E0h2YmKDVcA1cd+RfEmW207DJ5pWel8EbDkipjCw4b9Lnzo8pn5VRwhoduSKQivy1pRG
         65fFB33SnlDK8NHe1te/rHppArqOKhCAp0VWvvOgMssGrQzkgnz/TJdc7F48iUjMTQ6y
         Inyou127jpXQCeYYUAEo96fKqXd5fgiWb0+dScpD90lMa8QUJ1TJZ2fcwvnU2QBRUEyS
         29iA==
X-Forwarded-Encrypted: i=1; AJvYcCWaVwef6xgP36oEwYqB9vMv07ElhDiM0x+RqUd4GznWAMj8vLKQTnetWqrYCmFZgtnqvIWeIeZ0egLg3pxX8Z4bpg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwacZ++fpDwQqV69rvcjN/db6ECRZ7ieabWkTFtdYnsFBQHuNpG
	Ut5nCdLO2ZTvCoKOedjk1WX4KZUsaDRSYPIgqWTfnuNGpQXmL98tqVOx
X-Gm-Gg: ASbGnctc+gGGyOcLW1VXHdBrwCzD2/Jo6VkOALxqlpI2WWV2oJyCKaMq4d3zx4yA/AE
	RCYfM9ANm6tD4zAETkQg5SbBrVZgHWPeheyMAwHqs/UE3T+zReOz2uuOrQM4Wqu4gaN/4Muoa9W
	ZRgusQDxj68v3589z8Es0uT/xbTT/0t/iD4mny5iAvSzuQMPG9UzfLesOVkR6dSk0KqNnGzVO1O
	crP5EYqZxd35jqYGZWiYuxeWugfq53g+DMTKrHSSBm0GJAr56O8OyYhcDDbUkREdYVH+xfPUdi7
	HcKKu171aJfNatjkUoBwaNG18XjFGGjmezw2h3eXC421ghFI2X7c2Sg2NAdJY/2KsHuiMbNiRh4
	G/m/fVtDlBEcNQa7kMRehX+SxIlySRtv9SU/BsMPK3j8j87I2yE0wofu7gQQg+75dWyB6KubLRG
	XQV53XIKeEK9kMLEp242xpN4P71gmxQVHbfJeZN8FfdWQ9
X-Google-Smtp-Source: AGHT+IEKZ3RJmS61hvxmapA6K8lM/LdUEEa4KDBqYYIik2hMeRtmk3UW5qVTd3zVZhEU4AS4hKiiFg==
X-Received: by 2002:a05:6402:2713:b0:639:e5da:637e with SMTP id 4fb4d7f45d1cf-63c1e1f212fmr3171601a12.6.1760700459490;
        Fri, 17 Oct 2025 04:27:39 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c1d344aa2sm2664402a12.5.2025.10.17.04.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 04:27:39 -0700 (PDT)
Message-ID: <432c0278-2f37-4798-9e17-f6107b192d4f@gmail.com>
Date: Fri, 17 Oct 2025 13:27:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: upgrade 25.2.4 -> 25.2.5
To: foss@0leil.net, openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
References: <20251016-mesa-25-2-5-v1-1-08035df5e74e@cherry.de>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20251016-mesa-25-2-5-v1-1-08035df5e74e@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 11:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225008

2025. 10. 16. 16:58 keltezéssel, Quentin Schulz via lists.openembedded.org írta:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> See https://docs.mesa3d.org/relnotes/25.2.5.html.
>
> 0001-glx-provide-glx.pc.patch is in 25.2.5 via commit 293a26135d83
> ("glx: provide glx.pc") so can be dropped.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Zoltán Böszörményi <zboszor@gmail.com>

> ---
> Only build tested. kmscube run on Ringneck PX30 (Aarch64 Rockchip
> board).
>
> I have quickly glanced at the diff, one new header included (commit
> 5eb46a78d8dd ("vulkan/query_pool: Store video encode feedback")) but
> it's already part of the dependencies listed in vulkan_lite_runtime_deps
> and its companion C file is also in vulkan_lite_runtime_files so it
> should be just fine without a change in the recipe.
>
> A meson config file changed in commit 4ea070a741bf ("amd: require LLVM
> when amd-use-llvm is enabled") but AFAICT we don't use this meson option
> so it changes nothing for us.
> ---
>   .../mesa/files/0001-glx-provide-glx.pc.patch       | 41 ----------------------
>   meta/recipes-graphics/mesa/mesa.inc                |  5 ++-
>   2 files changed, 2 insertions(+), 44 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-glx-provide-glx.pc.patch b/meta/recipes-graphics/mesa/files/0001-glx-provide-glx.pc.patch
> deleted file mode 100644
> index dbe58fcc89..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-glx-provide-glx.pc.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 4fed044aaed5911fdc58d2a634f34a7186836935 Mon Sep 17 00:00:00 2001
> -From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> -Date: Sun, 12 Oct 2025 23:54:25 +0300
> -Subject: [PATCH] glx: provide glx.pc
> -
> -New Vulkan CTS 1.4.4 started requiring glx.pc pkg-config file. Provide
> -one if GLVND is not used in order to let VK CTS and other programs find
> -Mesa GLX implementation.
> -
> -Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37834]
> ----
> - src/glx/meson.build | 12 ++++++++++++
> - 1 file changed, 12 insertions(+)
> -
> -diff --git a/src/glx/meson.build b/src/glx/meson.build
> -index 04fdf26ba6a2..28313f83a783 100644
> ---- a/src/glx/meson.build
> -+++ b/src/glx/meson.build
> -@@ -134,6 +134,18 @@ libgl = shared_library(
> -   install : true,
> - )
> -
> -+if not with_glvnd
> -+  pkg.generate(
> -+    name : 'glx',
> -+    description : 'Mesa GLX Library',
> -+    version : meson.project_version(),
> -+    libraries : libgl,
> -+    libraries_private : gl_priv_libs,
> -+    requires_private : gl_priv_reqs,
> -+    variables : ['glx_tls=yes'],
> -+  )
> -+endif
> -+
> - if with_symbols_check
> -   libgl_symbols_file = with_glvnd ? 'glvnd-symbols.txt' : 'libgl-symbols.txt'
> -
> ---
> -2.51.0
> -
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 1485e0b727..6a36aea259 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -17,11 +17,10 @@ PE = "2"
>   SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
>              file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
>              file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
> -           file://0001-glx-provide-glx.pc.patch \
>   "
>   
> -SRC_URI[sha256sum] = "a370b4c549cbfbe646b319e34d73edb50ed883978f5e95133f282f0eae39ab52"
> -PV = "25.2.4"
> +SRC_URI[sha256sum] = "bb6243e7a6f525febfa1e6ab50827ca4d4bfdad73812377b0ca9b6c50998b03e"
> +PV = "25.2.5"
>   
>   UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>   
>
> ---
> base-commit: 5284c01374eb3957ab13ff3f271424e9ee7b9840
> change-id: 20251016-mesa-25-2-5-643cd0dacec3
>
> Best regards,
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224971): https://lists.openembedded.org/g/openembedded-core/message/224971
> Mute This Topic: https://lists.openembedded.org/mt/115790425/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


