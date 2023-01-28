Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E4CEC38142
	for <webhook@archiver.kernel.org>; Sat, 28 Jan 2023 23:17:57 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.6407.1674947872950047862
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Jan 2023 15:17:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fUMAJidd;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-12c8312131fso10975309fac.4
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 15:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b6ldjrtxZz+Keoti+z0ZrZZkk2D3uKcDI9u9MCJU6BI=;
        b=fUMAJiddVqpQNZd+cjd1kXhXfOAdvcL2QuiJmMTjX5er9AMsD+CFdKviZAhnwjG6W5
         YS69Kri0DYK2yNoU+u8JbFw7CLdlqXujkK/FRKaOlP0K5hPFjG+yDrXVEycRC8xyMRm4
         U31fofH/ziJodcVZHJWb+ZZbWp9dIYzzmcJgjNqTFVZcV+BpiDzqNeN/Trs9qxHLcf0V
         QCTED1uLlF59FF3gXVaFG3AiiEVfbrQckQRBW7WH11B/60CanzHoP5ME91y75JQaUIcZ
         RtvwQbQ39JljgM35AO+b1/x6eg68qsITJxFznWI+R3ZAURNumVgXnfGQKmAVT49hVSUj
         1uXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6ldjrtxZz+Keoti+z0ZrZZkk2D3uKcDI9u9MCJU6BI=;
        b=C/wcVNDQQIKgw7D8Fpuvjni/4ZcHc8Lomrpu+H40DvlLD91Qo4ZADiczJ8Qj7EEGP0
         CEHyqvuQwOCPXuV3DXTeoalP25CJTCWkHV/aPN82QCS0JZoyOTWAJtm9tnhdRyJzz7hV
         AyMet2UPBEVNCpvgGrR4ollkN8T4w2d84tbDe6+FgTP3BIgI9mjM4WH6Rb8wK5fVdtA8
         8yzEj8n43jG/U/8B4NJnzvp0lp+Nw2A0Je4BXrWejbfTMd39DTNbitb1GcwAvn+vSkz4
         7R5x8yuShXEPX58nP5VOr1KkOvESuDfIwuHxLJoJP3N5B1u6prDv9r4AI3hi66bkZ55U
         6Zow==
X-Gm-Message-State: AO0yUKVcRVelDADfgR71mmCHhzC3hQ6d8fOovfNf+3lKXIEDRN7OpxnS
	WZTHsYYoBXIHkXVIzW2FM8aaEYyhnuDWG7+TV/Y=
X-Google-Smtp-Source: AK7set+eO7I1aX3RfYrJ2C4dMTbpGJmULASVIxyULx6OhLwHKyrCn9dl8yAf5a5OZ9O1cmqGRZgmM6o0pXKM8/isn2g=
X-Received: by 2002:a05:6870:6488:b0:163:573b:3eca with SMTP id
 cz8-20020a056870648800b00163573b3ecamr859601oab.55.1674947871854; Sat, 28 Jan
 2023 15:17:51 -0800 (PST)
MIME-Version: 1.0
References: <20221229023442.2520067-1-changqing.li@windriver.com>
 <20221229023442.2520067-2-changqing.li@windriver.com> <Y7baMI4MLdLKahf+@mail.local>
 <a690d84f-aa54-4187-e0dd-780a966cf454@windriver.com> <Y8RwajkarV+GAz+O@mail.local>
 <173BE13D4A763969.24231@lists.openembedded.org> <37fd9f16-929e-4e1d-9fc5-1fd33cf3110b@windriver.com>
In-Reply-To: <37fd9f16-929e-4e1d-9fc5-1fd33cf3110b@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Jan 2023 15:17:25 -0800
Message-ID: <CAMKF1so4tRcTDTk2o3hsPmBFxoYd5X4rK=dR0DcPdv9tdsLxuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] curl: enable nghttp2 for support HTTP2
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 23:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176463

still failing on archlinux

| [26/27] Generating nghttp2.c
| /usr/lib/python3.10/site-packages/Cython/Compiler/Main.py:369:
FutureWarning: Cython directive 'language_level' not set, using 2 for
now (Py2). This will change in a later release! File:
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.51.0-r0/nghttp2-1.51.0/python/nghttp2.pyx
|   tree = Parsing.p_module(s, pxd, full_module_name)
| [27/27] cd /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.51.0-r0/build/python
&& /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.51.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3
setup.py build
| FAILED: python/CMakeFiles/python
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.51.0-r0/build/python/CMakeFiles/python
| cd /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.51.0-r0/build/python
&& /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.51.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3
setup.py build
| Traceback (most recent call last):
|   File "/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.51.0-r0/build/python/setup.py",
line 24, in <module>
|     from setuptools import setup, Extension
| ModuleNotFoundError: No module named 'setuptools'
| ninja: build stopped: subcommand failed.
| WARNING: /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.51.0-r0/temp/run.do_compile.2200023:167
exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} } cmake --build
'/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.51.0-r0/build'
"$@" -- ${EXTRA_OECMAKE_BUILD}'



On Sat, Jan 28, 2023 at 12:03 AM Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
> On 1/20/23 09:48, Changqing Li wrote:
> >
> > On 1/16/23 05:30, Alexandre Belloni wrote:
> >> CAUTION: This email comes from a non Wind River email account!
> >> Do not click links or open attachments unless you recognize the
> >> sender and know the content is safe.
> >>
> >> On 13/01/2023 16:04:42+0800, Changqing Li wrote:
> >>> On 1/5/23 22:09, Alexandre Belloni wrote:
> >>>> CAUTION: This email comes from a non Wind River email account!
> >>>> Do not click links or open attachments unless you recognize the
> >>>> sender and know the content is safe.
> >>>>
> >>>> This fails on the AB:
> >>>>
> >>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4580/steps/14/logs/stdio
> >>>>
> >>> Hi, Alexandre
> >>>
> >>> I need some help to debug this issue.
> >>>
> >>> I cannot reproduce this issue on my host. First,  the gcc command
> >>> used to
> >>> build the binary conftest will
> >>>
> >>> have as-needed enabled by default,  so actually,  these libs will
> >>> not be
> >>> linked, and runtime check will passed.
> >>>
> >>> Refer the command:
> >>>
> >>> gcc -o conftest
> >>> -isystem/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/include
> >>> -pipe -Werror-implicit-function-declaration -g -O2 -std=gnu89 -pedantic
> >>> -Wall -W -Wpointer-arith -Wwrite-strings -Wunused -Wshadow -Winline
> >>> -Wnested-externs -Wmissing-declarations -Wmissing-prototypes
> >>> -Wno-long-long
> >>> -Wbad-function-cast -Wfloat-equal -Wno-multichar -Wsign-compare -Wundef
> >>> -Wno-format-nonliteral -Wendif-labels -Wstrict-prototypes
> >>> -Wdeclaration-after-statement -Wold-style-definition
> >>> -Wstrict-aliasing=3
> >>> -Wcast-align -Wtype-limits -Wold-style-declaration
> >>> -Wmissing-parameter-type
> >>> -Wempty-body -Wclobbered -Wignored-qualifiers -Wconversion
> >>> -Wno-sign-conversion -Wvla -ftree-vrp -Wdouble-promotion -Wformat=2
> >>> -Warray-bounds=2 -Wshift-negative-value -Wshift-overflow=2
> >>> -Wnull-dereference -fdelete-null-pointer-checks -Wduplicated-cond
> >>> -Wunused-const-variable -Wduplicated-branches -Wrestrict -Walloc-zero
> >>> -Wformat-overflow=2 -Wformat-truncation=2 -Wimplicit-fallthrough=4
> >>> -Wno-system-headers
> >>> -isystem/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/include
> >>> -I/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/..//include
> >>> -I/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include
> >>>
> >>> -DOPENSSL_SUPPRESS_DEPRECATED
> >>> -I/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include
> >>> -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib
> >>> -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/lib
> >>>
> >>> -Wl,--enable-new-dtags
> >>> -Wl,-rpath-link,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib
> >>> -Wl,-rpath-link,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/lib
> >>> -Wl,-rpath,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib
> >>> -Wl,-rpath,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/lib
> >>>
> >>> -Wl,-O1 -Wl,--allow-shlib-undefined
> >>> -Wl,--dynamic-linker=/mnt/lincd/build/tmp-glibc/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
> >>> -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/..//lib
> >>> -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib
> >>> -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib
> >>>
> >>> conftest.c   -lnghttp2 -lssl -lcrypto -lssl -lcrypto -lz
> >>>
> >>>
> >>> I also tried to add "-Wl,--no-as-needed" in above comand, and
> >>> manually run
> >>> it,  then conftest will link those libraries. These libraries can
> >>> also be
> >>> found at runtime
> >>>
> >>> since these libraries will be in recipe-sysroot-native.
> >>>
> >>> $/mnt/yocto/test/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build# ldd
> >>> conftest
> >>>      linux-vdso.so.1 (0x00007ffd447c1000)
> >>>      libnghttp2.so.14 =>
> >>> /mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/libnghttp2.so.14
> >>> (0x00007f6bd36af000)
> >>>      libssl.so.3 =>
> >>> /mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/libssl.so.3
> >>> (0x00007f6bd3606000)
> >>>      libcrypto.so.3 =>
> >>> /mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/libcrypto.so.3
> >>> (0x00007f6bd31cf000)
> >>>      libz.so.1 =>
> >>> /mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/libz.so.1
> >>> (0x00007f6bd31b5000)
> >>>      libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f6bd2fb9000)
> >>>      libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0
> >>> (0x00007f6bd2f96000)
> >>>      libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2
> >>> (0x00007f6bd2f90000)
> >>> /mnt/lincd/build/tmp-glibc/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
> >>> => /lib64/ld-linux-x86-64.so.2 (0x00007f6bd36e6000)
> >>> $/mnt/yocto/test/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build#
> >>> ./conftest
> >>>
> >>>
> >>> This should be an host related issue,  Does the worker
> >>> "debian11-ty-3" means
> >>> that this build is built on debian11 docker or debian11 host? Thanks.
> >> This is a debian 11 host.
> >
> > Hi, Alex
> >
> > I cannot reproduce this with debian 11 docker image.
> >
> > $ cat /etc/os-release
> > PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"
> > NAME="Debian GNU/Linux"
> > VERSION_ID="11"
> > VERSION="11 (bullseye)"
> > VERSION_CODENAME=bullseye
> > ID=debian
> > HOME_URL="https://www.debian.org/"
> > SUPPORT_URL="https://www.debian.org/support"
> > BUG_REPORT_URL="https://bugs.debian.org/"
> >
> > configure:33927: checking run-time libs availability
> > configure:33983: gcc  -o conftest
> > -isystem/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/include
> > -pipe -Werror-implicit-function-declaration -O2 -Wno-system-headers
> > -isystem/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/include
> > -I/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/..//include
> > -I/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include
> > -DOPENSSL_SUPPRESS_DEPRECATED
> > -I/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include
> > -L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib
> > -L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/lib
> > -Wl,--enable-new-dtags
> > -Wl,-rpath-link,/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib
> > -Wl,-rpath-link,/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/lib
> > -Wl,-rpath,/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib
> > -Wl,-rpath,/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/lib
> > -Wl,-O1 -Wl,--allow-shlib-undefined
> > -Wl,--dynamic-linker=/mnt/yocto/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
> > -L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/..//lib
> > -L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib
> > -L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib
> > conftest.c -lnghttp2 -lssl -lcrypto -lssl -lcrypto -lz  >&5
> > configure:33983: $? = 0
> > configure:33983: ./conftest
> > configure:33983: $? = 0
> > configure:33985: result: fine
> >
> >
> > Is it possible to login the autobuilder host to check this?
>
> Hi, Alex, Richard
>
> Could you help to give some suggestions to debug this issue?
>
> Thanks
>
> Changqing
>
> >
> >
> > Regards
> >
> > Changqing
> >
> >>
> >>>
> >>> Regards
> >>>
> >>> Changqing
> >>>
> >>>> | checking run-time libs availability... failed
> >>>> | configure: error: one or more libs available at link-time are not
> >>>> available run-time. Libs used at link-time: -lnghttp2 -lssl
> >>>> -lcrypto -lssl -lcrypto -lz
> >>>> | NOTE: The following config.log files may provide further
> >>>> information.
> >>>> | NOTE:
> >>>> /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-109066/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build/config.log
> >>>> | ERROR: configure failed
> >>>> | WARNING: exit code 1 from a shell command.
> >>>> NOTE: recipe curl-native-7.87.0-r0: task do_configure: Failed
> >>>> ERROR: Task
> >>>> (virtual:native:/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-support/curl/curl_7.87.0.bb:do_configure)
> >>>> failed with exit code '1'
> >>>>
> >>>> On 29/12/2022 10:34:42+0800, Changqing Li wrote:
> >>>>> From: Changqing Li <changqing.li@windriver.com>
> >>>>>
> >>>>> After commit `ostree: replace libsoup-2.4 by curl`, ostree depends on
> >>>>> libcurl, but it needs http2 support, otherwise it will fail with
> >>>>> error:
> >>>>> OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:initiate_next_curl_request:
> >>>>> assertion failed (rc == CURLM_OK): (1 == 0)
> >>>>> | Bail out!
> >>>>> OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:initiate_next_curl_request:
> >>>>> assertion failed (rc == CURLM_OK): (1 == 0)
> >>>>>
> >>>>> Enable nghttp2 to fix above error.
> >>>>>
> >>>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >>>>> ---
> >>>>>    meta/recipes-support/curl/curl_7.86.0.bb | 6 +++---
> >>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
> >>>>>
> >>>>> diff --git a/meta/recipes-support/curl/curl_7.86.0.bb
> >>>>> b/meta/recipes-support/curl/curl_7.86.0.bb
> >>>>> index f5e3e7235d..6cee548f35 100644
> >>>>> --- a/meta/recipes-support/curl/curl_7.86.0.bb
> >>>>> +++ b/meta/recipes-support/curl/curl_7.86.0.bb
> >>>>> @@ -24,9 +24,9 @@ inherit autotools pkgconfig binconfig
> >>>>> multilib_header ptest
> >>>>>    # Entropy source for random PACKAGECONFIG option
> >>>>>    RANDOM ?= "/dev/urandom"
> >>>>>
> >>>>> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6',
> >>>>> d)} libidn openssl proxy random threaded-resolver verbose zlib"
> >>>>> -PACKAGECONFIG:class-native = "ipv6 openssl proxy random
> >>>>> threaded-resolver verbose zlib"
> >>>>> -PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random
> >>>>> threaded-resolver verbose zlib"
> >>>>> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6',
> >>>>> d)} libidn openssl proxy random threaded-resolver verbose zlib
> >>>>> nghttp2"
> >>>>> +PACKAGECONFIG:class-native = "ipv6 openssl proxy random
> >>>>> threaded-resolver verbose zlib nghttp2"
> >>>>> +PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random
> >>>>> threaded-resolver verbose zlib nghttp2"
> >>>>>
> >>>>>    # 'ares' and 'threaded-resolver' are mutually exclusive
> >>>>>    PACKAGECONFIG[ares] =
> >>>>> "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
> >>>>> --
> >>>>> 2.25.1
> >>>>>
> >>>>>
> >>>>>
> >>>> --
> >>>> Alexandre Belloni, co-owner and COO, Bootlin
> >>>> Embedded Linux and Kernel engineering
> >>>> https://bootlin.com
> >>>
> >>>
> >>
> >> --
> >> Alexandre Belloni, co-owner and COO, Bootlin
> >> Embedded Linux and Kernel engineering
> >> https://bootlin.com
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176459): https://lists.openembedded.org/g/openembedded-core/message/176459
> Mute This Topic: https://lists.openembedded.org/mt/95931602/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

