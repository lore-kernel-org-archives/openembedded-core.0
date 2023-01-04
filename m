Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70808C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 19:17:45 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.22409.1672859858632878445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 11:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lJ3y+g2m;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1322d768ba7so40867043fac.5
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v16SjkSVUoOKt0MYq0KgxCYS3rT6ui6NgPQR+rClxGo=;
        b=lJ3y+g2mTv9KpDbcte+MqUNo8/ftm1U8HwpTPKhFoTs4olIxDdZBsu00+T/+i/1AYD
         SveAS1KOjEC8BGsiKq2UhYzGAK6v9+RJgBWowht1q9weEDKlXcq38JsXV/JJm1+vcKND
         HmnTf/v8pPw4TSszMzRDzSCmw89QyOHJPvtIyfrxsps7kl5hhMP+zhA0QqYcyRjcgVul
         +rGANer4OKHo2L0voltJWviMlVhCYo/+TAQWhhMR3B7y/YMq3LGPtFMLjPmKeghuAm+F
         o4US5qSrFdkc4Zx+3JPgZFgDZyAk/YBZNWEYJupSVa/8YyP36x8sSPt52SkSJoGUi3HU
         V9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v16SjkSVUoOKt0MYq0KgxCYS3rT6ui6NgPQR+rClxGo=;
        b=kFONh3Vphk/uUZ57IxNcqZizgCFBIQFAZ50/vX3pFCuVECasTVKGQk3gIHRgfdHcMI
         fuWHiqrXwVD8B1xkQ4MD2AoOVomYr9scpKj+WO7sEfeV1xTp+1KW66qiCeFx020DH+HY
         U1GUuzaJC6CgpB3GKS2Q+GzQyoEalJTlz2yHikXT9Ar7ZwSPKZmDDM34lSHNweJNhqpM
         rjAOzUKQ4GgfmN+Rod0aek84KHA9u60A5658/dLrIzsh7POXeh+OqCRmKd7Tr++nyI+u
         B2XUpDZdoY0YJ/qs9+gT89phNpk0vsy9cSSIkWD3yJ+iAaLmasIO60OcFnzPO4H+eEAe
         MnZg==
X-Gm-Message-State: AFqh2kozCa7xobvVRehLrWwGx+jj9F7jON4zI1t7tul7mbhAQjczG47O
	+1PGMc07QBx9G+DhCZIsn/N56lSBA0QDadmlFdY=
X-Google-Smtp-Source: AMrXdXvO/FjKWxngMOIn0b62Lze/BCJ7K193uG+n4Qovb18o5JF4zH/C436JQN7YL0sUZ4rjKK55ZVlwQ2yYX39iu2o=
X-Received: by 2002:a05:6871:4049:b0:150:ab7d:7012 with SMTP id
 ky9-20020a056871404900b00150ab7d7012mr706248oab.55.1672859857556; Wed, 04 Jan
 2023 11:17:37 -0800 (PST)
MIME-Version: 1.0
References: <20221229023442.2520067-1-changqing.li@windriver.com> <20221229023442.2520067-2-changqing.li@windriver.com>
In-Reply-To: <20221229023442.2520067-2-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jan 2023 11:17:11 -0800
Message-ID: <CAMKF1soyU8OdM8zWSP353ifsvXLn3yAQ3wgheOgYa-wm=MH=7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] curl: enable nghttp2 for support HTTP2
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 19:17:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175504

nghttp2-native fails to build which is exposed by this change

ERROR: nghttp2-native-1.50.0-r0 do_compile:
ExecutionError('/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/temp/run.do_compile.1646093',
1, None, None)
ERROR: Logfile of failure stored in:
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/temp/log.do_compile.1646093
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: cmake --build
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/build
--target all --
| [1/1] cd /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/build/python
&& /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/recipe-sysroot-native/usr/bin/python3-native/
python3 setup.py build
| FAILED: python/CMakeFiles/python
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/build/python/CMakeFiles/python
| cd /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/build/python
&& /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/recipe-sysroot-native/usr/bin/python3-native/python
3 setup.py build
| Traceback (most recent call last):
|   File "/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/build/python/setup.py",
line 24, in <module>
|     from setuptools import setup, Extension
| ModuleNotFoundError: No module named 'setuptools'
| ninja: build stopped: subcommand failed.
| WARNING: /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/temp/run.do_compile.1646093:161
exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} } cmake --build
'/mnt/b/yoe/master/build/tmp/work/x8
6_64-linux/nghttp2-native/1.50.0-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
|       #1: cmake_runcmake_build,
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/temp/run.do_compile.1646093,
line 161
|       #2: cmake_do_compile,
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/temp/run.do_compile.1646093,
line 155
|       #3: do_compile,
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/temp/run.do_compile.1646093,
line 150
|       #4: main,
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.50.0-r0/temp/run.do_compile.1646093,
line 174
ERROR: Task (virtual:native:/mnt/b/yoe/master/sources/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_compile)
failed with exit code '1'

On Wed, Dec 28, 2022 at 6:34 PM Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> After commit `ostree: replace libsoup-2.4 by curl`, ostree depends on
> libcurl, but it needs http2 support, otherwise it will fail with
> error:
> OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:initiate_next_curl_request: assertion failed (rc == CURLM_OK): (1 == 0)
> | Bail out! OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:initiate_next_curl_request: assertion failed (rc == CURLM_OK): (1 == 0)
>
> Enable nghttp2 to fix above error.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-support/curl/curl_7.86.0.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-support/curl/curl_7.86.0.bb b/meta/recipes-support/curl/curl_7.86.0.bb
> index f5e3e7235d..6cee548f35 100644
> --- a/meta/recipes-support/curl/curl_7.86.0.bb
> +++ b/meta/recipes-support/curl/curl_7.86.0.bb
> @@ -24,9 +24,9 @@ inherit autotools pkgconfig binconfig multilib_header ptest
>  # Entropy source for random PACKAGECONFIG option
>  RANDOM ?= "/dev/urandom"
>
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} libidn openssl proxy random threaded-resolver verbose zlib"
> -PACKAGECONFIG:class-native = "ipv6 openssl proxy random threaded-resolver verbose zlib"
> -PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver verbose zlib"
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} libidn openssl proxy random threaded-resolver verbose zlib nghttp2"
> +PACKAGECONFIG:class-native = "ipv6 openssl proxy random threaded-resolver verbose zlib nghttp2"
> +PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver verbose zlib nghttp2"
>
>  # 'ares' and 'threaded-resolver' are mutually exclusive
>  PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175090): https://lists.openembedded.org/g/openembedded-core/message/175090
> Mute This Topic: https://lists.openembedded.org/mt/95931602/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

