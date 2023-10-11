Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41ABCD98F8
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 07:48:29 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.11583.1697010503209633644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 00:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F0stVcf3;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-504b84d59cbso8727426e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697010501; x=1697615301; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KWkut4T2d6fwZ8oy5YnuLdO/xNoLJ2esWS3/BlEvb6E=;
        b=F0stVcf3KrbTMBcxvfi58yfu/FIRdBe481oOrEQGFmT2AZ4MGsoUJLkl2cO4ktKvof
         U/ok/D7W1bRtwDgnBFJeAoCeRFz3koYCPfm4BLvGcB7tNYFsaCD2W/leTaeHsiwwtM0L
         XjU9/vqg0b2vqRspieGnqEcGz28u9FbH7vCgOOBjtcXv4QLzLlmblVTG7Pze24b8Xq5C
         db5cC9siqIMTWrChrjjHYoLBrYL471XBs3ydkaIm+C8Vlks28qiXgEGWYfE6W7RSCuOa
         24Wgku8/66/bEhqcW9pPM64WJBV9KT6V3yDoudNYf6KLyeh4unUtIhAgW7vMwOtbasRn
         SEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697010501; x=1697615301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KWkut4T2d6fwZ8oy5YnuLdO/xNoLJ2esWS3/BlEvb6E=;
        b=EOu9/HD2kAJhyN2awjlepyrHa1l3iWUJG9KnUhtjHYLygisagmTrkF3RlUtUH0B+qe
         KjwLkw+pKaf+NT7ufD/OBuew4EPWvDckul6PSs89z7UrSLjMjY9MyYzb56yPQVWEAdDE
         DtOIur+6QPyurubyCOReR2NNObRMkQWnOGNClz6cMZbXkX516B8ZlZ8+Hy8puJLHXJLZ
         sQFegzaZKglVJuFYRVE8U5J/btqvyX9LuQ1uDZAffRulS4rCBLdVemNtS2xqp+FUH0WT
         MxWHZAjWhe8xpUBY9wwQCKbGY4w3Yi8CeJ0JxCJtDfRFX2f0X0/vLXL+THjbo8XBnHcY
         XQow==
X-Gm-Message-State: AOJu0YyWfLubIsCFioBDX7tqhVGrpM/2w06GVshEAfLgmGCCCKB29jxv
	ROJJQDrr4vCiRnoWKGppPKTORgUG4slA/SoHzQ8=
X-Google-Smtp-Source: AGHT+IGFicyNzYiJKGmVbRMfnOqhm02LY+udXN+6dcw4QQSawQubJDacwcl7SxagGwwiJop6bh8TWOrIUvUHESyUO98=
X-Received: by 2002:a05:6512:ad1:b0:503:333e:b387 with SMTP id
 n17-20020a0565120ad100b00503333eb387mr23338001lfu.41.1697010500811; Wed, 11
 Oct 2023 00:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231001102818.797907-1-cordlandwehr@kde.org> <CANNYZj_mUOxDWyT68ygkD4q5dEwP08FdAsb7JG1UUxesDorzfQ@mail.gmail.com>
 <3acd980a-f3d2-cd5b-faef-8dbcca331dee@kde.org>
In-Reply-To: <3acd980a-f3d2-cd5b-faef-8dbcca331dee@kde.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Oct 2023 09:48:09 +0200
Message-ID: <CANNYZj9TFgmGHBk7uBZLMg30ff2s7Z5g8qrfjPQv6de_yJeqLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wayland: consider pkgconfig sysroot for pkgdatadir
To: Andreas Cord-Landwehr <cordlandwehr@kde.org>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 07:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188942

Hello Andreas,

thanks for the explanation, this s fine, but can you add it to the
commit message so it's preserved in history?

I'd say we do need to switch to a maintained implementation of
pkgconfig, and align with regular distros on that, Ross, do you know
if something's holding that back (other than the usual lack of
time/people/patience with chasing corner cases etc).

Alex

On Thu, 5 Oct 2023 at 21:18, Andreas Cord-Landwehr <cordlandwehr@kde.org> wrote:
>
> Hi Alex,
>
> this patch is needed for building kwin and layer-shell-qt from meta-kde
> layer. Right now, we carry this patch for Wayland to fix essentially
> pkg-config's call "pkg-config --variable=pkgdatadir wayland-client" to
> locate the folder with wayland.xml, which is needed during code
> generation of the C & C++ API with wayland-scanner and qtwaylandscanner.
> Without the patch the pkgdatadir location is reported, and I think that
> is the biggest issue here, to be "/usr/share/wayland/" as an absolute
> path and thus breaks out of the recipe-sysroot and leaks the host
> system's wayland.xml in the build process.
>
> Regarding a switch away from pkg-config, I like to let others comment
> with more insights into that topic :)
>
> Best regards,
> Andreas
>
> On 05.10.23 10:53, Alexander Kanavin wrote:
> > Can you show where this is causing problems for you? We're not seeing
> > the issue in CI builds, so the problem this is solving needs to be
> > better explained.
> >
> > Also upstream has a point: we should migrate away from a long
> > unmaintained freedesktop pkg-config.
> >
> > Alex
> >
> > On Sun, 1 Oct 2023 at 12:28, Andreas Cord-Landwehr <cordlandwehr@kde.org> wrote:
> >>
> >> Fix pkgconfig find calls to find wayland protocol XML files.
> >> See discussion in:
> >> https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/102
> >>
> >> Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
> >> ---
> >>   ...der-pkgconfig-sysroot-for-pkgdatadir.patch | 46 +++++++++++++++++++
> >>   .../wayland/wayland_1.22.0.bb                 |  1 +
> >>   2 files changed, 47 insertions(+)
> >>   create mode 100644 meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
> >>
> >> diff --git a/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch b/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
> >> new file mode 100644
> >> index 0000000000..4573bb635a
> >> --- /dev/null
> >> +++ b/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
> >> @@ -0,0 +1,46 @@
> >> +From ff8ecbe8891d592e645927659318720f9e190054 Mon Sep 17 00:00:00 2001
> >> +From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
> >> +Date: Sun, 6 Feb 2022 17:23:46 +0100
> >> +Subject: [PATCH] Consider pkgconfig sysroot for pkgdatadir
> >> +
> >> +For libs/cflags this is done automatically, but not for manually accessed
> >> +variables. This matches what wayland-protocols does.
> >> +
> >> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/272]
> >> +---
> >> + src/meson.build | 6 +++---
> >> + 1 file changed, 3 insertions(+), 3 deletions(-)
> >> +
> >> +diff --git a/src/meson.build b/src/meson.build
> >> +index a8a1d2b..721e151 100644
> >> +--- a/src/meson.build
> >> ++++ b/src/meson.build
> >> +@@ -65,7 +65,7 @@ if get_option('scanner')
> >> +               version: meson.project_version(),
> >> +               variables: [
> >> +                       'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
> >> +-                      'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name()),
> >> ++                      'pkgdatadir=' + join_paths('${pc_sysrootdir}${datarootdir}', meson.project_name()),
> >> +                       'bindir=' + join_paths('${prefix}', get_option('bindir')),
> >> +                       'wayland_scanner=${bindir}/wayland-scanner'
> >> +               ],
> >> +@@ -211,7 +211,7 @@ if get_option('libraries')
> >> +               filebase: 'wayland-server',
> >> +               variables: [
> >> +                       'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
> >> +-                      'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name())
> >> ++                      'pkgdatadir=' + join_paths('${pc_sysrootdir}${datarootdir}', meson.project_name())
> >> +               ]
> >> +       )
> >> +
> >> +@@ -250,7 +250,7 @@ if get_option('libraries')
> >> +               filebase: 'wayland-client',
> >> +               variables: [
> >> +                       'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
> >> +-                      'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name())
> >> ++                      'pkgdatadir=' + join_paths('${pc_sysrootdir}${datarootdir}', meson.project_name())
> >> +               ]
> >> +       )
> >> +
> >> +--
> >> +2.37.2
> >> diff --git a/meta/recipes-graphics/wayland/wayland_1.22.0.bb b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
> >> index 26bad580eb..17e4a0cd98 100644
> >> --- a/meta/recipes-graphics/wayland/wayland_1.22.0.bb
> >> +++ b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
> >> @@ -15,6 +15,7 @@ DEPENDS = "expat libffi wayland-native"
> >>   SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
> >>              file://run-ptest \
> >>              file://0001-build-Fix-strndup-detection-on-MinGW.patch \
> >> +           file://0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch \
> >>              "
> >>   SRC_URI[sha256sum] = "1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936ebb7e7cbc2425842"
> >>
> >> --
> >> 2.39.2
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#188480): https://lists.openembedded.org/g/openembedded-core/message/188480
> >> Mute This Topic: https://lists.openembedded.org/mt/101689465/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>

