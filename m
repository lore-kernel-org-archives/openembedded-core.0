Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4417FC87FD4
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 19:09:27 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.29192.1724958565743619917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 12:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=awUxbd7f;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5a108354819so1368343a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 12:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724958564; x=1725563364; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W1xkMm+TQn2FWCoKKEhNYuzg0X9HjtBOg8ChdJ3FYgw=;
        b=awUxbd7faLE3duhPIrquVfxtnZf/MJnB6e6zIfcRDUd7/iaz0yRL0i/BxiqOhxl9RZ
         SOBmA4w5gFQEQO0S5/kNiPvYueVayZuuLmdzGIWraElsxCtp14HekxXafYB5eKfZ8/4d
         TH364a6cszpcQAQqWOlUUMFxWA9sVQGg8TgRzKZjvYgyD9kAiGTcuKaBhEHG8IRIXf3N
         i0Ku65sFHm0sJG+5v4/DXzV0DIMppk715tKgT+BOS5K2CnD0AkqL9AHA5FI/4dz2afcw
         /lpbpTrWXpU7dEvBWD37nmjv8eXs7dd/TCwqfyBwQixTgohqjPm+hegchLMRVSx2DEi3
         qLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724958564; x=1725563364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1xkMm+TQn2FWCoKKEhNYuzg0X9HjtBOg8ChdJ3FYgw=;
        b=AV8f/Qh+ymzCIACJlkg5391yIXUUBeZmYztHPlfibgTkhP9DGTQ+eS9B7nx7WUCsqz
         kKbQBCUn0fDRljClRmZMHDCqU3vcEagDbmq98Gu1DTsWwpCc0XDGisVxbKB3lf6eV5cw
         CAEQ2QUNL7DtdK1Nrmhry+LzFvJQN0QLsdmnZwseEYcl6bGdZr6/e3/uByV86OkDEw3X
         Ouq7aofzNrPb2tRsS4BMDunV7xOyPCeisDfch3AMcYPl8HMU/y1TEqJsAzjNcCBsOUOx
         ee/1KJ+srvVYtRuipJEtIjbH1uEjNr79mQx4IDP9VNuWxpPY/mh1jrbnr1Z2Tfvz7vdB
         jAOw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ1ne5CE6nhhw2wT9zziuXvJDBZbICyZr0W4Cyrlg3HdWHl2X/BOiiv1PuNkcx3rSyuzdnrc2B+WVXqEek56Fvnw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YykYIw50+CK2F1qYhBKgu0XGPAXn+Hbu4Yt/LgEw2tnc5LzfxdQ
	CNa3Ldelf+Mc5hJuzuBHyCkzkkHmhA4bcuPl+xphT4FmH22O4qupNDLAjF/9b+94cpSfEJ70w6p
	m95noTA7ctMOb2SpKeT7HSg2MCl4=
X-Google-Smtp-Source: AGHT+IHYOIGoPisuIRflNNOTecbLVt5tP1rlUao+OQQUNRWowkHXuHPqCMa4BLSproECmv20IGhvLphqsymRQB4desM=
X-Received: by 2002:a05:6402:50d0:b0:5c0:8ff8:ec41 with SMTP id
 4fb4d7f45d1cf-5c21ed3d4c8mr3458308a12.9.1724958563416; Thu, 29 Aug 2024
 12:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <17EF8C4828BB74CA.5775@lists.openembedded.org> <CALT56yPm6t4vkBfqjdY1WB5x=Z29vc1FXaUkNXM_j_hx_CU1aA@mail.gmail.com>
In-Reply-To: <CALT56yPm6t4vkBfqjdY1WB5x=Z29vc1FXaUkNXM_j_hx_CU1aA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 29 Aug 2024 21:09:11 +0200
Message-ID: <CANNYZj8k0ASvN6C9Dvsm+z6XT0LEMpaAxRqKQxCy2qu2-hDUzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] piglit: add missing dependency on wayland
To: dbaryshkov@gmail.com
Cc: Ross Burton <ross.burton@arm.com>, openembedded-core@lists.openembedded.org, 
	Trevor Gamblin <tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 19:09:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203944

A *much* better fix would be to introduce a wayland PACKAGECONFIG,
that would set PIGLIT_USE_WAYLAND (per
https://gitlab.freedesktop.org/mesa/piglit/-/blob/main/CMakeLists.txt?ref_type=heads#L195)
and relocate all the wayland-scanner, protocols, libraries, etc
dependencies from unconditional DEPENDS to under that option.

Alex

On Thu, 29 Aug 2024 at 20:45, Dmitry Baryshkov via
lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org>
wrote:
>
> On Tue, 27 Aug 2024 at 12:37, Dmitry Baryshkov via
> lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org>
> wrote:
> >
> > After the recent piglit update it fails X11 builds reporting that it can
> > not find wayland-client package. Add missing dependency.
> >
> > Fixes: 9662bdabf3f6 ("piglit: upgrade 22eaf6a91c -> c11c9374c1")
> > Cc: Trevor Gamblin <tgamblin@baylibre.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Gracious ping. See the build.log at
> https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/dmitry.baryshkov/oebuilds/2lKYJUouynr7OoOtfUeOLDTDZYY
>
> Relevant part of the failure log:
>
> | -- Found OpenGL:
> /oe/build/tmp-rpb-glibc/work/armv8a-linaro-linux/piglit/1.0+gitr/recipe-sysroot/usr/lib/libGL.so
> | -- Checking for module 'waffle-1'
> | --   Found waffle-1, version 1.8.1
> | -- Checking for module 'gbm>=17.1'
> | --   Found gbm, version 24.0.7
> | -- Looking for gbm_bo_map
> | -- Looking for gbm_bo_map - found
> | -- Looking for gbm_bo_get_fd_for_plane
> | -- Looking for gbm_bo_get_fd_for_plane - found
> | -- Checking for module 'wayland-client'
> | --   No package 'wayland-client' found
> | -- Configuring incomplete, errors occurred!
> | WARNING: exit code 1 from a shell command.
> | CMake Error at
> /oe/build/tmp-rpb-glibc/work/armv8a-linaro-linux/piglit/1.0+gitr/recipe-sysroot-native/usr/share/cmake-3.30/Modules/FindPkgConfig.cmake:645
> (message):
> |   The following required packages were not found:
> |
> |    - wayland-client
> |
> | Call Stack (most recent call first):
> |   /oe/build/tmp-rpb-glibc/work/armv8a-linaro-linux/piglit/1.0+gitr/recipe-sysroot-native/usr/share/cmake-3.30/Modules/FindPkgConfig.cmake:873
> (_pkg_check_modules_internal)
> |   CMakeLists.txt:196 (pkg_check_modules)
> |
> |
> NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Failed
>
>
> > ---
> >  meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
> > index 3a2dec34d7e0..7cdd38d823cc 100644
> > --- a/meta/recipes-graphics/piglit/piglit_git.bb
> > +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> > @@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
> >  X11_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxrender libglu', '', d)}"
> >  X11_RDEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos', '', d)}"
> >
> > -DEPENDS = "libpng waffle libxkbcommon python3-mako-native python3-numpy-native python3-six-native virtual/egl wayland-native wayland-protocols"
> > +DEPENDS = "libpng waffle libxkbcommon python3-mako-native python3-numpy-native python3-six-native virtual/egl wayland-native wayland wayland-protocols"
> >
> >  inherit cmake pkgconfig python3native features_check bash-completion
>
>
>
> --
> With best wishes
> Dmitry
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203943): https://lists.openembedded.org/g/openembedded-core/message/203943
> Mute This Topic: https://lists.openembedded.org/mt/108120289/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

