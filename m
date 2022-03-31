Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C63C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 10:16:35 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web08.5385.1648721794040431366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 03:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G8cYyokW;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id z12so26824217lfu.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 03:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6L2qqd3YAHn1hgTsgP7WeuuUaLowplVOG22yodlaJ/0=;
        b=G8cYyokWQVOaF1osEwj2D9ZPd01o2CLyDud9EkeTvZlf1oUmgCRkj5+h+IqKjwMS69
         Mfg4iM1mE2NoKTWMo/44PrA0a9Y2Z/Cz2QxJh3iwSoC6Htk22ntHIms1iRyIdkgb5r20
         WW47/7xlL9bmn4PeFBQbeq+dZymWQgU4BfHPqAlIHbHAALLnNCDLzrJ67PBz3j8ohMsq
         LUdUWxExBlXhsS4WPlmCtz1NneKkuSj1YTX6UKSRifK36WBXFxAMdhK+A+jb66f3rADy
         NJqd+VzQASHUGPuOC4S7eNRHGv2yhtBNtcx+qavmI3SOnQm6Oj2SC02RK/GQ7+kqrajE
         7GXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6L2qqd3YAHn1hgTsgP7WeuuUaLowplVOG22yodlaJ/0=;
        b=SJMtKis07ygln3NYj8JuGgXiaEaAIwm5EZ6jDO3dSivb4xmf5A6UT8WzuJmz8ScUzD
         u2fBYimrJ1fkdfn516mluv1nzKmIcbKMKzPDJ+5nU1qByV27yQqo6Q4Ks+F05tWRzwUQ
         xTDhDewsyR/TPG85tiPDdRxTJiDvAm5TNLGRM2F4SzX1H6N4DHv0Tbfk5HTSdH0+/fKK
         2LdIOE2TNwPKQ+BjpY7aw2Rq60U545CxAxhTN907HbokcyqOO1zpJiOOiGF//ggZe/sM
         ZDCQ2Gxdv5dX3HdIj0eh7xI+rItx3z86MhMJ8aX8wMFS/loboWs0Lp0tIVftlq07YxLH
         boRQ==
X-Gm-Message-State: AOAM533+NYUT0iqTd4/+JoSK5FReTqqgQgTFOpVcn08aFoFYO7IT9BOs
	j5LHOms/oE1IKaKST2ZHaRg3ORjetmiGcYTyla0=
X-Google-Smtp-Source: 
 ABdhPJx7TR1QXMMammyf2uy6G4v2eiDd6e/5emOWnJFAOfqHvjbIy9ybcXpIVmzsFgpABePlwBYamXCPwRYXlN11SpE=
X-Received: by 2002:a05:6512:31cb:b0:44a:1311:60e4 with SMTP id
 j11-20020a05651231cb00b0044a131160e4mr10180007lfe.521.1648721791799; Thu, 31
 Mar 2022 03:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220329075101.3085897-1-crg7475@mailbox.org>
 <CANNYZj8+h6hLAeMSU2JTN_MXE53-_iSN926tPkiAOtqLkdszTw@mail.gmail.com>
 <a60b0534-7caa-0004-495f-ce4af48c0df2@mailbox.org>
In-Reply-To: <a60b0534-7caa-0004-495f-ce4af48c0df2@mailbox.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 31 Mar 2022 12:16:20 +0200
Message-ID: 
 <CANNYZj_SvDznbX3vpb2UgcY4AqXAyEP61iC-e=BRXRjg3XS1mA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libsdl2: Disable libunwind dependency in native
 builds
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 10:16:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163807

But the autobuilder does have a 21.10 worker, and the problem isn't
happening there, or is it?

Alex

On Thu, 31 Mar 2022 at 10:52, Carlos Rafael Giani <crg7475@mailbox.org> wrote:
>
> I can only report my own host setup, which is Ubuntu 21.10 x86-64. libsdl2-native fails to build 100% of the time on this host.
>
> On 29.03.22 22:35, Alexander Kanavin wrote:
>
> Is this specific to some particular host setup? If so, it needs to be
> said in the commit message, so we know when it is safe to drop this
> patch.
>
> Alex
>
> On Tue, 29 Mar 2022 at 09:52, Carlos Rafael Giani via
> lists.openembedded.org <crg7475=mailbox.org@lists.openembedded.org>
> wrote:
>
> libunwind-native currently cannot be added to the class-native DEPENDS
> due to the following problem:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/91/builds/5624/steps/12/logs/stdio
>
> And without libunwind-native, libsdl2-native config fails errors like:
>
> | -- Checking for one of the modules 'libunwind'
> | CMake Error at [...]/build/tmp/work/x86_64-linux/libsdl2-native/2.0.20-r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig.cmake:890 (message):
> |   None of the required 'libunwind' found
> | Call Stack (most recent call first):
> |   CMakeLists.txt:1367 (pkg_search_module)
>
> Ideally, the libunwind issue would be fixed, and then this could be added
> to the libsdl2 recipe:
>
> DEPENDS:append:class-native = " libunwind-native"
>
> However, the libunwind problem is not trivial to fix, and requires a
> specific setup to reproduce. As an alternative workaround, turn off
> libunwind support in the native SDL2 build by disabling the unwind.h
> check in the CMake script (this subsequently turns off all the other
> libunwind checks). The main user of libsdl2-native is qemu-native, which
> does not need libunwind support in SDL2.
>
> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ---
>  ...d-in-native-OE-builds-by-not-looking.patch | 38 +++++++++++++++++++
>  .../libsdl2/libsdl2_2.0.20.bb                 |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
> new file mode 100644
> index 0000000000..214664f621
> --- /dev/null
> +++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
> @@ -0,0 +1,38 @@
> +From 50c691e83f81b235bb96ef996dd4568ffaae256f Mon Sep 17 00:00:00 2001
> +From: Carlos Rafael Giani <crg7475@mailbox.org>
> +Date: Fri, 18 Mar 2022 12:06:23 +0100
> +Subject: [PATCH] Disable libunwind in native OE builds by not looking for
> + libunwind
> +
> +This is a workaround for this build error:
> +
> +| -- Checking for one of the modules 'libunwind'
> +| CMake Error at [...]/build/tmp/work/x86_64-linux/libsdl2-native/2.0.20-r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig.cmake:890 (message):
> +|   None of the required 'libunwind' found
> +| Call Stack (most recent call first):
> +|   CMakeLists.txt:1367 (pkg_search_module)
> +
> +By not looking for the libunwind header, the rest of the libunwind
> +specific bits in the CMake build script are disabled.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 64f9fbf..12a4d8f 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -862,7 +862,7 @@ if(SDL_LIBC)
> +     check_include_file(sys/types.h HAVE_SYS_TYPES_H)
> +     foreach(_HEADER
> +             stdio.h stdlib.h stddef.h stdarg.h malloc.h memory.h string.h limits.h float.h
> +-            strings.h wchar.h inttypes.h stdint.h ctype.h math.h iconv.h signal.h libunwind.h)
> ++            strings.h wchar.h inttypes.h stdint.h ctype.h math.h iconv.h signal.h)
> +       string(TOUPPER "HAVE_${_HEADER}" _UPPER)
> +       string(REPLACE "." "_" _HAVE_H ${_UPPER})
> +       check_include_file("${_HEADER}" ${_HAVE_H})
> +--
> +2.32.0
> +
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> index 58bc94cc86..4ba22c1fe6 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> @@ -20,6 +20,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
>             file://optional-libunwind-generic.patch \
>             file://0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch \
>             "
> +SRC_URI:append:class-native = " file://0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch"
>
>  S = "${WORKDIR}/SDL2-${PV}"
>
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163739): https://lists.openembedded.org/g/openembedded-core/message/163739
> Mute This Topic: https://lists.openembedded.org/mt/90103750/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

