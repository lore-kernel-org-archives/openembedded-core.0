Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3ECBC46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 16:49:46 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.109052.1673369383737550441
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jan 2023 08:49:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=niGZpd98;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id x25-20020a056830115900b00670932eff32so7313440otq.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 08:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=36Q3OzZGAxHPPd016MLAoGdqUn09bQfZnBZrB9uNyAg=;
        b=niGZpd98pi9BFEXqHMdZa11dp1UTi/C3UAhGGW3kGy5KOkKHJlWSNEBc/PV0Lkywrw
         fAoXkhJxR1WWDFIEjjUPrmZn5KLYEXbEGK9E52CfyOfsAAN28yYJHfL0ADsfzv9Q2BfC
         RoX4a9O4UlhvCtSyOCv8eFrowKbcYV7foYwgj1vm2JfEGVPl2jZIm4dwE/Ot3C9onA38
         dE09Myz7MW6w+j7az1h5J3L36z4JwQFNGdJHhvllCkyh+/mOl4SifA6zxmEB0KqLPUQB
         9bttvRxy3FdZsM59IkJLYwJNobThQCw0iCfcPkhrxZ+SKFSPqJTBoMHMYDfQO5zroXLt
         slAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36Q3OzZGAxHPPd016MLAoGdqUn09bQfZnBZrB9uNyAg=;
        b=Hg72jZyjYnVeqKdiLSnLm9xLeGLDRxbIparK4bJefw35EuLS+ZHp4GBXP6AVBaimXD
         Qn/5lhAAUUerKstcu9MFsQGBIYiw0ajNuILFtxHZ0BBcsokcaVnhhdXeBbtityZkfaG5
         QQ9iZ0hWSApcM7HRbLB8ivLqJ2vp72Qq0KdYHH9Rtk/qPN2rbhnrAR8pyatDgbna0DKV
         ufZ3J2MEuvnkM95+nxi9lH/kU9Y3IioP5N1Wa1VHIZjP86Uhl0Br6qxBNtBc/S3PipHC
         JtW7w8ibVu2ELUB7f/xBphqoT2eE8eZeRIp48PHX0f0H586dP0AdL0bNLY2ysAHyUUU2
         5vPQ==
X-Gm-Message-State: AFqh2kq8MhxSGQn1hjpHH5acvQWJMJQhpMzkWqTaYv/umwMpkcya5i0r
	cpSA72kCGZqbzVFUw6XZ/FeEGTnWzqZUDojpCzE=
X-Google-Smtp-Source: AMrXdXsrOFiQi4RPtrBlw/FnKx76jy4ZbWSdazDV9fblFUEmewwrC4cMIOU9RD2c1jqc93suA5uuabmfVKHwg4Rm4G4=
X-Received: by 2002:a9d:5cc5:0:b0:676:92ca:f7f4 with SMTP id
 r5-20020a9d5cc5000000b0067692caf7f4mr3761560oti.55.1673369382759; Tue, 10 Jan
 2023 08:49:42 -0800 (PST)
MIME-Version: 1.0
References: <20221229023442.2520067-1-changqing.li@windriver.com>
 <20221229023442.2520067-2-changqing.li@windriver.com> <CAMKF1soyU8OdM8zWSP353ifsvXLn3yAQ3wgheOgYa-wm=MH=7A@mail.gmail.com>
 <cd8d5ccc-09ab-f68b-59e1-7d608c766a93@windriver.com>
In-Reply-To: <cd8d5ccc-09ab-f68b-59e1-7d608c766a93@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Jan 2023 08:49:16 -0800
Message-ID: <CAMKF1sq6hHcXCbi1SWZF09UpcZb-mmDAWoQ9DWkqUhTd_15-3w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] curl: enable nghttp2 for support HTTP2
To: Changqing Li <changqing.li@windriver.com>
Cc: Changqing Li <changqing.li@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 16:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175722

On Tue, Jan 10, 2023 at 1:32 AM Changqing Li <changqing.li@windriver.com> wrote:
>
>
> On 1/5/23 03:17, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender and know the content is safe.
> >
> > nghttp2-native fails to build which is exposed by this change
> >
> > ERROR: nghttp2-native-1.50.0-r0 do_compile:
> > ExecutionError('/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/temp/run.do_compile.1646093',
> > 1, None, None)
> > ERROR: Logfile of failure stored in:
> > /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/temp/log.do_compile.1646093
> > Log data follows:
> > | DEBUG: Executing shell function do_compile
> > | NOTE: cmake --build
> > /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/build
> > --target all --
> > | [1/1] cd /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/build/python
> > && /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/recipe-sysroot-native/usr/bin/python3-native/
> > python3 setup.py build
> > | FAILED: python/CMakeFiles/python
> > /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/build/python/CMakeFiles/python
> > | cd /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/build/python
> > && /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/recipe-sysroot-native/usr/bin/python3-native/python
> > 3 setup.py build
> > | Traceback (most recent call last):
> > |   File "/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/build/python/setup.py",
> > line 24, in <module>
> > |     from setuptools import setup, Extension
> > | ModuleNotFoundError: No module named 'setuptools'
> > | ninja: build stopped: subcommand failed.
> > | WARNING: /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/temp/run.do_compile.1646093:161
> > exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} } cmake --build
> > '/mnt/b/yoe/master/build/tmp/work/x8
> > 6_64-linux/nghttp2-native/1.50.0-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
> > | WARNING: Backtrace (BB generated script):
> > |       #1: cmake_runcmake_build,
> > /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/temp/run.do_compile.1646093,
> > line 161
> > |       #2: cmake_do_compile,
> > /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/temp/run.do_compile.1646093,
> > line 155
> > |       #3: do_compile,
> > /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/temp/run.do_compile.1646093,
> > line 150
> > |       #4: main,
> > /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/temp/run.do_compile.1646093,
> > line 174
> > ERROR: Task (virtual:native:/mnt/b/yoe/master/sources/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_compile)
> > failed with exit code '1'
>
> Hi, Khem
>
> I think autobuilder reproduced  this issue since on this machine, cython
> and PythonLibs is found so ENABLE_PYTHON_BINDINGS is set to ON,
>
> but on my build host,  it will be OFF, so python subdir will not be
> compiled. I plan to just disable ENABLE_PYTHON_BINDINGS directly to make
>
> deterministic build, and send V2 later.

Thanks for root causing the following up.

>
>
> Refer part of the CMakeList.txt
>
> find_package(Cython)
>
> find_package(PythonLibs)
>
> if(CYTHON_FOUND AND PYTHONLIBS_FOUND)
>
> set(ENABLE_PYTHON_BINDINGS_DEFAULT ON)
>
> else()
>
> set(ENABLE_PYTHON_BINDINGS_DEFAULT OFF)
>
> endif()
>
> >
> > On Wed, Dec 28, 2022 at 6:34 PM Changqing Li
> > <changqing.li@eng.windriver.com> wrote:
> >> From: Changqing Li <changqing.li@windriver.com>
> >>
> >> After commit `ostree: replace libsoup-2.4 by curl`, ostree depends on
> >> libcurl, but it needs http2 support, otherwise it will fail with
> >> error:
> >> OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:initiate_next_curl_request: assertion failed (rc == CURLM_OK): (1 == 0)
> >> | Bail out! OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:initiate_next_curl_request: assertion failed (rc == CURLM_OK): (1 == 0)
> >>
> >> Enable nghttp2 to fix above error.
> >>
> >> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >> ---
> >>   meta/recipes-support/curl/curl_7.86.0.bb | 6 +++---
> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta/recipes-support/curl/curl_7.86.0.bb b/meta/recipes-support/curl/curl_7.86.0.bb
> >> index f5e3e7235d..6cee548f35 100644
> >> --- a/meta/recipes-support/curl/curl_7.86.0.bb
> >> +++ b/meta/recipes-support/curl/curl_7.86.0.bb
> >> @@ -24,9 +24,9 @@ inherit autotools pkgconfig binconfig multilib_header ptest
> >>   # Entropy source for random PACKAGECONFIG option
> >>   RANDOM ?= "/dev/urandom"
> >>
> >> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} libidn openssl proxy random threaded-resolver verbose zlib"
> >> -PACKAGECONFIG:class-native = "ipv6 openssl proxy random threaded-resolver verbose zlib"
> >> -PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver verbose zlib"
> >> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} libidn openssl proxy random threaded-resolver verbose zlib nghttp2"
> >> +PACKAGECONFIG:class-native = "ipv6 openssl proxy random threaded-resolver verbose zlib nghttp2"
> >> +PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver verbose zlib nghttp2"
> >>
> >>   # 'ares' and 'threaded-resolver' are mutually exclusive
> >>   PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
> >> --
> >> 2.25.1
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#175090): https://lists.openembedded.org/g/openembedded-core/message/175090
> >> Mute This Topic: https://lists.openembedded.org/mt/95931602/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>

