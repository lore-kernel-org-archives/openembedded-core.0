Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EFDE7C4F7
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 08:53:16 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.10918.1696495992553756764
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 01:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aysLAFwM;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c038a1e2e6so8299471fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 01:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696495990; x=1697100790; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hosnEYn4HEiXS+S2DAQOuqlnYEzTwq+ZoWEQ8Ew7+9s=;
        b=aysLAFwMGztOnFSZhEP+ljjgWSAouSQvyUHmFrvvtT/hKfqJDSqdI+HEwM5VbLS/P6
         qOzDcIRk6GUFfZh4gDUWXlK11+mHuvWH/XOklC7vxHTUSC3OkdkGPgbJjH/opa9it6AV
         Ul4PTDQF3Pb2FZMvPkhb3nI38oMa5P5YzV1tKSLPErg0lLZT74f+Co4tVkgFY9ZdNg9M
         ZrotJjPCOZhQuxqCyFA+GOWarpuKxtCO4HJ7UzsHjegyCHRP5rSdN/Jky5yLdwFk9B8A
         TQBwd0tUJvPfNxHmWeRChkVCmz2Jzm72iyCQuNDQUEAJBsJBZcAeD3nqGQD1uxkw9EMJ
         RTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696495990; x=1697100790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hosnEYn4HEiXS+S2DAQOuqlnYEzTwq+ZoWEQ8Ew7+9s=;
        b=EgH9DYG70w3gMxV3Jz4he1h7C0/XYxIEIGZf0DfpeEsN/t8YBGatknPlUpPylz3s4E
         PGaLJir3TqVMeR+KofR/CeN/i+6Cp8hzcXaHBvKcjD3osKtO06FRu+CariSvy7Jot5bD
         Sr7LjMELTRWhT2dlHNXZ7sJKTmZStGSTSax2ACP3fhNFBQlyd4AVcR39ALGx2/+StbWw
         B7pV7rUt8jOt0T2jt66nMgxLcNJtRNvBVlnkzX6JTQMbw66VEmZN8ffAEXqQxzT277Jc
         g8oeEQL3oNDCNBuxY4opT3W/8eUQ0eO+zc4P8y7nxM1WFOmQBTr7MlRBav84jDOp11Kp
         /DeA==
X-Gm-Message-State: AOJu0Yx9Xq4qzN1JK4khmmtfk3AIYwrjyGeHi5otV7iDyyZiZZZ1E/vo
	HHXao34enIbNn8CFQZkjZFsKhKS/MplZ57WHLcI=
X-Google-Smtp-Source: AGHT+IHbPk6EBmBBz7R8cwc3ygn1DPSFByUQTF7xPrgjDU8wVi8XNdOhAyN69bL5Yw0uqjyuEfYhaaH1zMXnJvOnT04=
X-Received: by 2002:a2e:b784:0:b0:2bb:a123:2db7 with SMTP id
 n4-20020a2eb784000000b002bba1232db7mr3789061ljo.51.1696495990453; Thu, 05 Oct
 2023 01:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231001102818.797907-1-cordlandwehr@kde.org>
In-Reply-To: <20231001102818.797907-1-cordlandwehr@kde.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Oct 2023 10:53:08 +0200
Message-ID: <CANNYZj_mUOxDWyT68ygkD4q5dEwP08FdAsb7JG1UUxesDorzfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wayland: consider pkgconfig sysroot for pkgdatadir
To: Andreas Cord-Landwehr <cordlandwehr@kde.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 08:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188707

Can you show where this is causing problems for you? We're not seeing
the issue in CI builds, so the problem this is solving needs to be
better explained.

Also upstream has a point: we should migrate away from a long
unmaintained freedesktop pkg-config.

Alex

On Sun, 1 Oct 2023 at 12:28, Andreas Cord-Landwehr <cordlandwehr@kde.org> wrote:
>
> Fix pkgconfig find calls to find wayland protocol XML files.
> See discussion in:
> https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/102
>
> Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
> ---
>  ...der-pkgconfig-sysroot-for-pkgdatadir.patch | 46 +++++++++++++++++++
>  .../wayland/wayland_1.22.0.bb                 |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
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
> +---
> + src/meson.build | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/meson.build b/src/meson.build
> +index a8a1d2b..721e151 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -65,7 +65,7 @@ if get_option('scanner')
> +               version: meson.project_version(),
> +               variables: [
> +                       'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
> +-                      'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name()),
> ++                      'pkgdatadir=' + join_paths('${pc_sysrootdir}${datarootdir}', meson.project_name()),
> +                       'bindir=' + join_paths('${prefix}', get_option('bindir')),
> +                       'wayland_scanner=${bindir}/wayland-scanner'
> +               ],
> +@@ -211,7 +211,7 @@ if get_option('libraries')
> +               filebase: 'wayland-server',
> +               variables: [
> +                       'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
> +-                      'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name())
> ++                      'pkgdatadir=' + join_paths('${pc_sysrootdir}${datarootdir}', meson.project_name())
> +               ]
> +       )
> +
> +@@ -250,7 +250,7 @@ if get_option('libraries')
> +               filebase: 'wayland-client',
> +               variables: [
> +                       'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
> +-                      'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name())
> ++                      'pkgdatadir=' + join_paths('${pc_sysrootdir}${datarootdir}', meson.project_name())
> +               ]
> +       )
> +
> +--
> +2.37.2
> diff --git a/meta/recipes-graphics/wayland/wayland_1.22.0.bb b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
> index 26bad580eb..17e4a0cd98 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.22.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
> @@ -15,6 +15,7 @@ DEPENDS = "expat libffi wayland-native"
>  SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
>             file://run-ptest \
>             file://0001-build-Fix-strndup-detection-on-MinGW.patch \
> +           file://0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch \
>             "
>  SRC_URI[sha256sum] = "1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936ebb7e7cbc2425842"
>
> --
> 2.39.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188480): https://lists.openembedded.org/g/openembedded-core/message/188480
> Mute This Topic: https://lists.openembedded.org/mt/101689465/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

