Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3180CDB47E
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 20:18:03 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.26982.1697055479135187794
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 13:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=p0lebF6R;
 spf=pass (domain: baylibre.com, ip: 209.85.160.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4196ae80fc3so1743111cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 13:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697055478; x=1697660278; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qNvmqkZCUKIbdBDGIhg+J6OhaMfxp4WVMxxZ2ydnN5o=;
        b=p0lebF6R1Ceh5uRr9qC6fBxBfzfTmOdIaiUiY+tsl/TU/FBinZnYy0SOlQtjxkNzim
         TIeGJtqq7Nh/3iceqykUFNn3hEO9PcUijH2UIqLiB2t/uvSWtz1nUcuSFTgcx0DjUipS
         DECVIIXlfYAii5GXNCEHRCJWpteR926u8cMZqIlef84kmPBiTpuTEEL/4EUksjQ34z3Z
         kH327s0aPgl+E+/Ev+UHx5XGJ6Lzuvtz/5ci2SL/6NDkcJ0XtKHDAggnMV9e4Kf3VGi/
         PxooFs9wsC1bioeDIwWFvJbLOcoHUQd2vppefznv+qMFDTDfLp7EgpMc3usx8TaNVMPL
         GcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697055478; x=1697660278;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qNvmqkZCUKIbdBDGIhg+J6OhaMfxp4WVMxxZ2ydnN5o=;
        b=OTbntnRaiAilY63X5OUOF29foQval8N+WPoYp/i2yn10Iu4ZyhN0qBEaI57dPX3mep
         PVmEArXqanWAgXQl+YR+/F7OWseCWFrVKcYXDCnMTAYa9RP292JWFDejjcIhxD1h1/Oy
         5rvQ+8/+IocgkPtbcOd4XDbvrYoe0QiCU7oZVWzKxKV2EnTbVnTKYsh7FNjKXcvlgCvW
         d6OLlU/fCMaSOJCGfBUzzRueQskNX8OWzHCgo9nRFZz8OsKyCENdKpZnjRKk8LaWIyPH
         6ylqnlpefdGYbKioxCtMZBxZSnz0pRTa0RDWD3TozMU0O0gP7vSQSPQHkI5pqtSIxb5h
         Of0w==
X-Gm-Message-State: AOJu0Yz9K3BQt+D8/WtdcyleVIJ/K/v+7gSXcL47TDvkeJVIeHlJT/BA
	+cLjF5+gsOGFi2UZsbDD27EFsA==
X-Google-Smtp-Source: AGHT+IEhJjjAbUBMtFVcJd27/YzmHCa6eH+OKtlooEvtCPubAP7a0EXq+Qm0gbqi3CocuiaQiVt1ig==
X-Received: by 2002:a05:622a:552:b0:418:ff8:383a with SMTP id m18-20020a05622a055200b004180ff8383amr26006694qtx.64.1697055477789;
        Wed, 11 Oct 2023 13:17:57 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id m13-20020ac866cd000000b003f6ac526568sm5626100qtp.39.2023.10.11.13.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 13:17:57 -0700 (PDT)
Message-ID: <d3ad4229-46e5-c659-c220-1831907e49a8@baylibre.com>
Date: Wed, 11 Oct 2023 16:17:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [OE-core] [PATCH v2] wayland: consider pkgconfig sysroot for
 pkgdatadir
Content-Language: en-US
To: Andreas Cord-Landwehr <cordlandwehr@kde.org>,
 openembedded-core@lists.openembedded.org
References: <20231011191959.3666657-1-cordlandwehr@kde.org>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20231011191959.3666657-1-cordlandwehr@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 20:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188971


On 2023-10-11 15:19, Andreas Cord-Landwehr wrote:
> Fix pkgconfig find calls to find wayland protocol XML files, which are
> installed into /usr/share/wayland/. This patch fixes specifically the
> call `pkg-config --variable=pkgdatadir wayland-client` to locate the
> folder containing wayland.xml. Without the patch, only the host system's
> data dir /usr/share/wayland is reported (and that only when
> wayland-protocols dev package is available) thus leaking a path from the
> host system into the recipe build.
>
> Access to wayland.xml is required by projects that generate wayland API
> via waylandscanner like KDE's kwin or layer-shell-qt.
>
> See further details of upstream discussion in:
> https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/102
>
> Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
> ---
>   ...der-pkgconfig-sysroot-for-pkgdatadir.patch | 46 +++++++++++++++++++
>   .../wayland/wayland_1.22.0.bb                 |  1 +
>   2 files changed, 47 insertions(+)
>   create mode 100644 meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
>
> diff --git a/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch b/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
> new file mode 100644
> index 0000000000..4573bb635a
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
> @@ -0,0 +1,46 @@
> +From ff8ecbe8891d592e645927659318720f9e190054 Mon Sep 17 00:00:00 2001
> +From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
> +Date: Sun, 6 Feb 2022 17:23:46 +0100
> +Subject: [PATCH] Consider pkgconfig sysroot for pkgdatadir
> +
> +For libs/cflags this is done automatically, but not for manually accessed
> +variables. This matches what wayland-protocols does.
> +
> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/272]
There should be a Signed-off-by tag here as well. Can you add one and 
resubmit?
> +---
> + src/meson.build | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/meson.build b/src/meson.build
> +index a8a1d2b..721e151 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -65,7 +65,7 @@ if get_option('scanner')
> + 		version: meson.project_version(),
> + 		variables: [
> + 			'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
> +-			'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name()),
> ++			'pkgdatadir=' + join_paths('${pc_sysrootdir}${datarootdir}', meson.project_name()),
> + 			'bindir=' + join_paths('${prefix}', get_option('bindir')),
> + 			'wayland_scanner=${bindir}/wayland-scanner'
> + 		],
> +@@ -211,7 +211,7 @@ if get_option('libraries')
> + 		filebase: 'wayland-server',
> + 		variables: [
> + 			'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
> +-			'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name())
> ++			'pkgdatadir=' + join_paths('${pc_sysrootdir}${datarootdir}', meson.project_name())
> + 		]
> + 	)
> +
> +@@ -250,7 +250,7 @@ if get_option('libraries')
> + 		filebase: 'wayland-client',
> + 		variables: [
> + 			'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
> +-			'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name())
> ++			'pkgdatadir=' + join_paths('${pc_sysrootdir}${datarootdir}', meson.project_name())
> + 		]
> + 	)
> +
> +--
> +2.37.2
> diff --git a/meta/recipes-graphics/wayland/wayland_1.22.0.bb b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
> index 26bad580eb..17e4a0cd98 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.22.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
> @@ -15,6 +15,7 @@ DEPENDS = "expat libffi wayland-native"
>   SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
>              file://run-ptest \
>              file://0001-build-Fix-strndup-detection-on-MinGW.patch \
> +           file://0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch \
>              "
>   SRC_URI[sha256sum] = "1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936ebb7e7cbc2425842"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188970): https://lists.openembedded.org/g/openembedded-core/message/188970
> Mute This Topic: https://lists.openembedded.org/mt/101904034/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

