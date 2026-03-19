Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2C51088E78
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 04:42:42 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4094.1773895354124782776
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 21:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=svUJCowW;
 spf=pass (domain: konsulko.com, ip: 209.85.222.174, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cfc1aced74so3958885a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 21:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1773895353; x=1774500153; darn=lists.openembedded.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qQCtkJLSL6w+ykLAlO9DCKQkuIbH87TRlJdF48I69tU=;
        b=svUJCowWPYyOkcFZW/1UzfSoKaKRiBTchOPRcO/wcwI6judpRpOtjEeO6HdbEVjiCa
         AkRmfMm+YCwR7Dqm6Sbh4WT9iyYzT4jArai2uy0cF5TIAInf3iKcpFuVd5KMDj0/x59w
         wk0/ItIEsou3S2XhHWP39kac1JR1Y6v96tUFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773895353; x=1774500153;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQCtkJLSL6w+ykLAlO9DCKQkuIbH87TRlJdF48I69tU=;
        b=WYcXZMweJ7mFuX8E/l37feNvqogII1UIniDI10NSOsNLN4Y85QD6jV5PdM4TapxZnN
         KmRVvEmn7cz+Tq/uTpxtbmr7l3PfD1axyPLwnQZDVOdgjNS7XNvj11u4e2GrMoSELLZ2
         9ISDnCFujHBGmijEosJ7r6n97t0PV9RvnJlsOnFXfEn61YKTTlIsbzUBaViwcXB4bzV3
         elZXZbYZ6LhfNazLzlsZ/7lFTJ3f244s03MhoIjbAfuXTouGMYgXfizr4wKNcjMukIP6
         E08TgVymc8b+V7eODwRLWvlPoNYdXSVH65TmxU/1a1h+lM1KiqYC4U/oFou1G9W61eoJ
         kVcA==
X-Gm-Message-State: AOJu0Yw074+FetRJnVaU4pVTM7dDQw5YYVDQoT4FmuJrPNYfqNubvtlF
	qoGP0S6Pqr2rKB7KBq3CPhdfzuto+82YhaXtYPFL+U60RlByOalT2AkA6JO2p57Xd88xWRd31xR
	frvt9
X-Gm-Gg: ATEYQzz5kmSDPTXP/7jKhbEOGYKHQ3W9fy9uRtGzvsHpqqZJDFPNQICwFN0UxcSj4IB
	uGciXitWvE1jezxMTapD9eTCAXMynaNFgeqME4lgjGKKLwLvg+XLlshK96VpnRk2HZp/ZjRbtQB
	XacCqgfIVYsKsWe4YstsYPaktI5VtMWyftMOfGAKu9oV7tDkBg4/NAITv/eCDodU97bX0rF3d3f
	JexxuNoZmKMxm5fpgjgHqMjONnXGofzT2SSn3ChFA0Nt4uZ7YeLyMYv+ncg9HfxbNTBXMfHLzCK
	b4FZtd0VFldB0oLK9RhqwAbenqsy0KxwOiLyoDnAoZ6ygXMpSl+TnrrUgt4F/8bIydE74YlRSKH
	Ld+sS6AGfcudeJLlGqlkdRCt5YAwb5lDy0dYMj/ZBHoZPoWfLhZNxvKMBwv1rLrmAIJBkvSZPT0
	USqQagvmHTlanFJUO15zTe6ch24NC3rh1weZ/pr6u84WtzgN5SlaKTvZafbT025uGHmRWzF96Ve
	v26J4WdL9kr+I1a/Lkh2kygonIMUhTsNfJhVlxQKZBB8Z0=
X-Received: by 2002:a05:620a:44c2:b0:8cd:b33a:a4da with SMTP id af79cd13be357-8cfad37f90bmr762798585a.55.1773895352818;
        Wed, 18 Mar 2026 21:42:32 -0700 (PDT)
Received: from godzilla (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c6b8e225fsm38448056d6.3.2026.03.18.21.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 21:42:32 -0700 (PDT)
Date: Thu, 19 Mar 2026 00:42:22 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/1] weston: update to 15.0.0
In-Reply-To: <DH5WCZNFT8GV.3OA9E3ZNR71XY@bootlin.com>
Message-ID: <2ed76967-4b14-ab3c-d349-2d55f365576f@konsulko.com>
References: <cover.1772963425.git.scott.murray@konsulko.com> <5f4c8c72cb972c976aa2e95d0288fba6d3369415.1772963425.git.scott.murray@konsulko.com> <DH5WCZNFT8GV.3OA9E3ZNR71XY@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811583-351275349-1773895352=:3890"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 04:42:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233460

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811583-351275349-1773895352=:3890
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT

On Wed, 18 Mar 2026, Mathieu Dubois-Briand wrote:

> On Sun Mar 8, 2026 at 10:57 AM CET, Scott Murray via lists.openembedded.org wrote:
> > Announcement:
> > https://lore.freedesktop.org/wayland-devel/aZbDU-xtVMLhB0wD@xpredator/
> >
> > Functional changes:
> > - New Vulkan renderer. A "vulkan" PACKAGECONFIG option has been
> >   added to enable building it, and it is enabled if "vulkan" is
> >   present in DISTRO_FEATURES, similar to how X11 and Wayland are
> >   handled.
> > - New Lua shell. A "lua-shell" PACkAGECONFIG option has been added
> >   to enable building it, but it has not been enabled by defsult to
> >   avoid affecting build times.
> > - Fullscreen shell and screen-share module marked as deprecated.
> >   Their PACKAGECONFIG options have been updated to still work, but
> >   have not been renamed to avoid breaking working configurations.
> > - Perfetto support. A "perfetto" PACKAGECONFIG option has been
> >   added to enable building it, but it is not on by default due
> >   to meta-oe being required to build.
> > - The "client-no-resize" option for the RDP backend has been
> >   replaced with "resizeable/no-resizeable" to match the VNC
> >   backend. The example in weston.ini has been updated.
> >
> > Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> > ---
>
> Hi Scott,
>
> Thanks for your patch, and sorry for the delay.
>
> I looks like this is breaking "no-x11" builds. I believe you should be
> able to reproduce this just with "DISTRO_FEATURES:remove = 'x11'":
>
> ERROR: weston-15.0.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/weston/15.0.0/temp/run.do_compile.2505757' failed with exit code 1
> ...
> | FAILED: [code=1] libweston/renderer-vulkan/vulkan-renderer.so.p/vulkan-pipeline.c.o
> | x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/weston/15.0.0/recipe-sysroot -Ilibweston/renderer-vulkan/vulkan-renderer.so.p -Ilibweston/renderer-vulkan -I../sources/weston-15.0.0/libweston/renderer-vulkan -I. -I../sources/weston-15.0.0 -Iinclude -I../sources/weston-15.0.0/include -Ilibweston -I../sources/weston-15.0.0/libweston -Iprotocol -I/srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/weston/15.0.0/recipe-sysroot/usr/include/libdrm -I/srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/weston/15.0.0/recipe-sysroot/usr/include/pixman-1 -fdiagnostics-color=always -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Wmissing-prototypes -Wno-unused-parameter -Wno-shift-negative-value -Wno-missing-field-initializers -Wno-pedantic -Wundef -fvisibility=hidden -Wmissing-prototypes -Wno-unused-parameter -Wno-shift-negative-value -Wno-missing-field-initializers -Wno-pedantic -Wundef -fvisibility=hidden -O2 -g -fcanon-prefix-map -ffile-prefix-map=/srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/weston/15.0.0/sources/weston-15.0.0=/usr/src/debug/weston/15.0.0 -ffile-prefix-map=/srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/weston/15.0.0/build=/usr/src/debug/weston/15.0.0 -ffile-prefix-map=/srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/weston/15.0.0/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/weston/15.0.0/recipe-sysroot-native= -pipe -fPIC -MD -MQ libweston/renderer-vulkan/vulkan-renderer.so.p/vulkan-pipeline.c.o -MF libweston/renderer-vulkan/vulkan-renderer.so.p/vulkan-pipeline.c.o.d -o libweston/renderer-vulkan/vulkan-renderer.so.p/vulkan-pipeline.c.o -c ../sources/weston-15.0.0/libweston/renderer-vulkan/vulkan-pipeline.c
> | In file included from ../sources/weston-15.0.0/libweston/renderer-vulkan/vulkan-pipeline.c:42:
> | ../sources/weston-15.0.0/libweston/renderer-vulkan/vulkan-renderer-internal.h:43:10: fatal error: xcb/xcb.h: No such file or directory
> |    43 | #include <xcb/xcb.h>
> |       |          ^~~~~~~~~~~
> | compilation terminated.
> | ninja: build stopped: subcommand failed
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/3404
>
> Can you have a look at the error?

It seems upstream fixed this after 15.0.0, I have just sent a v2 with
the fix backported as a patch after retesting with and without x11 in
DISTRO_FEATURES.

Best regards,

Scott

---1463811583-351275349-1773895352=:3890--

