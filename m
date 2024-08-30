Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C7FCA0ECA
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 00:30:24 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.2066.1724977823214495652
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 17:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LB9HeNhe;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f4f2868783so13240591fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 17:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724977821; x=1725582621; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vi23ShB4omb2VTAsyaevu3qVJiMDnOoFDkO/vOFqapo=;
        b=LB9HeNhekKPXv470lMrrEthVIkxb2vjkYjf34IxkiOFeXMkZEYIjv+8KsWpaMzL9aM
         56hbCBB52llSK4oOigVhVqkDO1ho4qrVhTdXwGUTYb76q+oXFgzvV9xC78dTM+v/VLCM
         3S5ihE64TPQ9JU8njoQ0eGKautvBJ4F0bc6rUk3ThlP6Ycewhu+WFkUzOYEfRMT2Jhjk
         8kslTPC8g3ughdJ7eYPOPFrDsciQ+TmcyQ0MMki8nW/RsFKaGbxDR3rY7UziygO83/TL
         n84FMwH8s1BvWcAl1jUShlZWLEJ2uqxGA/izUrpxHMabGXBV/4+vRNg4wzwoHefAzcT1
         b71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724977821; x=1725582621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vi23ShB4omb2VTAsyaevu3qVJiMDnOoFDkO/vOFqapo=;
        b=mU+NnPCGyu9i+DqDzlSPJKGf0LQsKNGo/iIgdm5lvgHwZD5wu1YfnMDsI0Js5iB509
         /hZMAZn3xiNXIL65QJgLkKk805s/zE6cgKzuOj+kSWLHV4bzW9DDJeC6lpJsr0IZ8dqq
         hGPZrC7owFbIgU553BmI0tlkrpz1B9qrLwbaSDozk34r2QRgHdI3CDNqmjEgRLKMfCWh
         URWHfj4+clje6/AAyhtzBB1NVi4wEbLCsWna/4wSgi83npDRand4WKeb7YOT8xVJErrz
         i+rp4AGxWI2oDaJ3IIyEvE+SUrYF48gmcWrCPp/h8iDgGliyyzOd8+F3eH6Srv1UsH+3
         m+Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWrdYVj6GA6XA0oFoeoLbjiwUoj/angQoOAQE7O7jKcYqkUULkhfcF02hjp0f9hYlMAlVBnPcN5shQy/AYVqUDINg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxJJV1iWvaXWsCeCpILlgdluotXle4Z1ZED2IL5a6NZTFJG7+f2
	XYQD2AirxvHHXkxtLDBb2nTXPX6uSJuEb+rwIb1N+MW04hsPePbYj+YxAywGvsK64qskz9wqdIB
	xkX+pJqvotdPyeC0FJVTQ7rt9sJ4=
X-Google-Smtp-Source: AGHT+IF8ibbobBPwrJ4+HwmY7Yef8FAbuZDZ/vh1QcsqxgBH/982lZ3LpBiTXar7kBpZprs6WRxQs072RbR7ncDZrJo=
X-Received: by 2002:a2e:510a:0:b0:2ef:2685:177d with SMTP id
 38308e7fff4ca-2f61e0564e0mr2852611fa.20.1724977820543; Thu, 29 Aug 2024
 17:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <17EF8C4828BB74CA.5775@lists.openembedded.org> <CALT56yPm6t4vkBfqjdY1WB5x=Z29vc1FXaUkNXM_j_hx_CU1aA@mail.gmail.com>
 <CANNYZj8k0ASvN6C9Dvsm+z6XT0LEMpaAxRqKQxCy2qu2-hDUzA@mail.gmail.com>
In-Reply-To: <CANNYZj8k0ASvN6C9Dvsm+z6XT0LEMpaAxRqKQxCy2qu2-hDUzA@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Fri, 30 Aug 2024 03:30:08 +0300
Message-ID: <CALT56yORJmt=UonhanFoOqbg_VDuewNcV5hjU-1R8BmQQOCPFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] piglit: add missing dependency on wayland
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>, openembedded-core@lists.openembedded.org, 
	Trevor Gamblin <tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 00:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203949

On Thu, 29 Aug 2024 at 22:09, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> A *much* better fix would be to introduce a wayland PACKAGECONFIG,
> that would set PIGLIT_USE_WAYLAND (per
> https://gitlab.freedesktop.org/mesa/piglit/-/blob/main/CMakeLists.txt?ref_type=heads#L195)
> and relocate all the wayland-scanner, protocols, libraries, etc
> dependencies from unconditional DEPENDS to under that option.

Ack, I'll take a look.

>
> Alex
>
> On Thu, 29 Aug 2024 at 20:45, Dmitry Baryshkov via
> lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org>
> wrote:
> >
> > On Tue, 27 Aug 2024 at 12:37, Dmitry Baryshkov via
> > lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org>
> > wrote:
> > >
> > > After the recent piglit update it fails X11 builds reporting that it can
> > > not find wayland-client package. Add missing dependency.
> > >
> > > Fixes: 9662bdabf3f6 ("piglit: upgrade 22eaf6a91c -> c11c9374c1")
> > > Cc: Trevor Gamblin <tgamblin@baylibre.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Gracious ping. See the build.log at
> > https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/dmitry.baryshkov/oebuilds/2lKYJUouynr7OoOtfUeOLDTDZYY
> >
> > Relevant part of the failure log:
> >
> > | -- Found OpenGL:
> > /oe/build/tmp-rpb-glibc/work/armv8a-linaro-linux/piglit/1.0+gitr/recipe-sysroot/usr/lib/libGL.so
> > | -- Checking for module 'waffle-1'
> > | --   Found waffle-1, version 1.8.1
> > | -- Checking for module 'gbm>=17.1'
> > | --   Found gbm, version 24.0.7
> > | -- Looking for gbm_bo_map
> > | -- Looking for gbm_bo_map - found
> > | -- Looking for gbm_bo_get_fd_for_plane
> > | -- Looking for gbm_bo_get_fd_for_plane - found
> > | -- Checking for module 'wayland-client'
> > | --   No package 'wayland-client' found
> > | -- Configuring incomplete, errors occurred!
> > | WARNING: exit code 1 from a shell command.
> > | CMake Error at
> > /oe/build/tmp-rpb-glibc/work/armv8a-linaro-linux/piglit/1.0+gitr/recipe-sysroot-native/usr/share/cmake-3.30/Modules/FindPkgConfig.cmake:645
> > (message):
> > |   The following required packages were not found:
> > |
> > |    - wayland-client
> > |
> > | Call Stack (most recent call first):
> > |   /oe/build/tmp-rpb-glibc/work/armv8a-linaro-linux/piglit/1.0+gitr/recipe-sysroot-native/usr/share/cmake-3.30/Modules/FindPkgConfig.cmake:873
> > (_pkg_check_modules_internal)
> > |   CMakeLists.txt:196 (pkg_check_modules)
> > |
> > |
> > NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Failed
> >
> >
> > > ---
> > >  meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
> > > index 3a2dec34d7e0..7cdd38d823cc 100644
> > > --- a/meta/recipes-graphics/piglit/piglit_git.bb
> > > +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> > > @@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
> > >  X11_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxrender libglu', '', d)}"
> > >  X11_RDEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos', '', d)}"
> > >
> > > -DEPENDS = "libpng waffle libxkbcommon python3-mako-native python3-numpy-native python3-six-native virtual/egl wayland-native wayland-protocols"
> > > +DEPENDS = "libpng waffle libxkbcommon python3-mako-native python3-numpy-native python3-six-native virtual/egl wayland-native wayland wayland-protocols"
> > >
> > >  inherit cmake pkgconfig python3native features_check bash-completion
> >
> >
> >
> > --
> > With best wishes
> > Dmitry
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#203943): https://lists.openembedded.org/g/openembedded-core/message/203943
> > Mute This Topic: https://lists.openembedded.org/mt/108120289/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
With best wishes
Dmitry

