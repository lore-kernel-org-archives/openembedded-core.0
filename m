Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B68C48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 13:51:22 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.41369.1707918675307246925
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 05:51:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=giz5CjUS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33934567777so3549295f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 05:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707918674; x=1708523474; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=coEs6uf+AXhQftSHapVCVSWNxI9E2yvgirrLUbX779s=;
        b=giz5CjUSuxTPWzsFQt2dUhvWLrXT03zliMEF8JW2CZ0Rjyv6ZA1Szyz6JsJtm1MwV9
         IGAeosU5gNMhO3ONhu4xYN3ukApojC90RGGdhrDOMoLVmPV4dei97KNu6BvWHjdsAhLP
         2PGQf8L5wMJr6rGL1wuMiY6ACgZffO4VNnTz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707918674; x=1708523474;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=coEs6uf+AXhQftSHapVCVSWNxI9E2yvgirrLUbX779s=;
        b=w5ExS/gfAC8XHeVwPbMv7nMpYlRaDczAkmQNY1GurvgDl2lg/CIUs6L2e5dYjGvP4s
         38nA5wo3NNk15udwpuxKWiwk/Sx1D2tPrquf72GLG+XyIPE/0D2qSJptVB6ArCjlTbDQ
         M/pmtCdR26eqmdHphIByGDJUKf8D1dOTPObc0hubjVQKdWQGOrVphIzpILZsF41lajmU
         hQjRw9+TNxthyf+bslMlwbnSbRp6nGWhlsHDLiHe/F6cEBGFq/jIdG9pG84R7reat59S
         sIosZPiWdRvIqQjRkmPkSdDmiPrxpLiuPvz+xI422e/b9zhvqm9ig+J7WnGjt2AbBphI
         Rxgg==
X-Forwarded-Encrypted: i=1; AJvYcCWezQ7dCiGBbZjfmsnbmDjlssju9TBR1DzGZK5UYPPg+r+wqKA0iPUPA4vgDQkXQqVa4uRshiS0JphpMdZlWeLXgHfsNYo13eNQSTBpyLewRCX4w7gt8bsp
X-Gm-Message-State: AOJu0YyB5tNt8kIb5qjsoKnZ/qQPe4hFwbcQnmWzUCvJYs7ncqiZ+IVq
	/G54bTSBuEp6kiotXau+av3b8I8vmcp8ExeGSwJGdKEMJzV2+Q9aXA91igcPQ4g=
X-Google-Smtp-Source: AGHT+IGU1tSHU57owkGH/O3JMvPbtR/GXWXoQjFIGvXoIKv5HCyvh86SSigx7rZ6QIXbplwAYzJz0A==
X-Received: by 2002:a5d:4e90:0:b0:33b:26d7:e6dd with SMTP id e16-20020a5d4e90000000b0033b26d7e6ddmr1734357wru.48.1707918673671;
        Wed, 14 Feb 2024 05:51:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVWHGdn563AtUpCc0tpnaV1QQesmmDxTOoP3tyvsGQ6W5FkqqPxAthbB0f5MfO8PByZR8a20BuYQ+d32uQWdA7hPRzF90WnYpA8x08HQhiA9HuAtQuXud0s
Received: from ?IPv6:2001:8b0:aba:5f3c:61c2:9b19:f62a:921b? ([2001:8b0:aba:5f3c:61c2:9b19:f62a:921b])
        by smtp.gmail.com with ESMTPSA id ay7-20020a5d6f07000000b0033cf053fa1esm1555684wrb.106.2024.02.14.05.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 05:51:13 -0800 (PST)
Message-ID: <2816e71889d9f743496192eb2f6e0520f3b6eb8e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] valgrind: skip 14 ptests in 3.22
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: randy.macleod@windriver.com, openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
Date: Wed, 14 Feb 2024 13:51:10 +0000
In-Reply-To: <20240212220501.3571864-3-Randy.MacLeod@windriver.com>
References: <20240212220501.3571864-1-Randy.MacLeod@windriver.com>
	 <20240212220501.3571864-3-Randy.MacLeod@windriver.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 13:51:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195476

On Mon, 2024-02-12 at 14:05 -0800, Randy MacLeod via
lists.openembedded.org wrote:
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>=20
> Sort the ptest depenencies into a somewhat alpahbetical order.
> Add python3-compile for ptests.
>=20
> Add softlinks for cachegrind to eliminate a warning seen in those tests.
>=20
> The folowing tests fail after the 3.22 update:
>    memcheck/tests/linux/dlclose_leak-no-keep
>    memcheck/tests/linux/dlclose_leak
>    memcheck/tests/wrap1
>    memcheck/tests/wrap2
>    ...
>    memcheck/tests/wrap8
>    cachegrind/tests/wrap5
>    massif/tests/bug469146
>    massif/tests/new-cpp
>    massif/tests/overloaded-new
>=20
> Omit these tests until they are fixed.
> Tracked by: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15399
>=20
> =3D=3D=3D Test Summary =3D=3D=3D
> TOTAL: 778
> PASSED: 759
> FAILED: 0
> SKIPPED: 19
>=20
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  .../valgrind/valgrind/remove-for-all               | 14 ++++++++++++++
>  meta/recipes-devtools/valgrind/valgrind_3.22.0.bb  | 14 ++++++++++++--
>  2 files changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/met=
a/recipes-devtools/valgrind/valgrind/remove-for-all
> index e26088f3b1..004589a7ea 100644
> --- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
> +++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
> @@ -1,6 +1,17 @@
> +cachegrind/tests/wrap5
>  none/tests/amd64/fb_test_amd64
>  gdbserver_tests/hginfo
> +memcheck/tests/linux/dlclose_leak-no-keep
> +memcheck/tests/linux/dlclose_leak
>  memcheck/tests/supp_unknown
> +memcheck/tests/wrap1
> +memcheck/tests/wrap2
> +memcheck/tests/wrap3
> +memcheck/tests/wrap4
> +memcheck/tests/wrap5
> +memcheck/tests/wrap6
> +memcheck/tests/wrap7
> +memcheck/tests/wrap8
>  helgrind/tests/tls_threads
>  helgrind/tests/pth_mempcpy_false_races
>  drd/tests/bar_bad
> @@ -9,3 +20,6 @@ drd/tests/pth_barrier_thr_cr
>  drd/tests/std_thread2
>  drd/tests/thread_name_xml
>  massif/tests/deep-D
> +massif/tests/bug469146
> +massif/tests/new-cpp
> +massif/tests/overloaded-new
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb b/meta/rec=
ipes-devtools/valgrind/valgrind_3.22.0.bb
> index dc00edb24e..74ac7ec9d5 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
> @@ -129,13 +129,18 @@ INHIBIT_PACKAGE_STRIP_FILES =3D "${PKGD}${libexecdi=
r}/valgrind/vgpreload_memcheck-
>  RRECOMMENDS:${PN} +=3D "${TCLIBC}-dbg"
> =20
>  RDEPENDS:${PN}-ptest +=3D " bash coreutils curl file \
> -   gdb libgomp \
> +   gdb \
> +   ${TCLIBC}-src gcc-runtime-dbg \
> +   libgomp \
>     perl \
>     perl-module-file-basename perl-module-file-glob perl-module-getopt-lo=
ng \
>     perl-module-overloading perl-module-cwd perl-module-ipc-open3 \
>     perl-module-carp perl-module-symbol \
> -   procps sed ${PN}-dbg ${PN}-src ${TCLIBC}-src gcc-runtime-dbg \
> +   procps \
> +   python3-compile \
> +   sed \
>     util-linux-taskset \
> +   ${PN}-dbg ${PN}-src \
>     ${PN}-cachegrind ${PN}-massif ${PN}-callgrind \
>  "
>  RDEPENDS:${PN}-ptest:append:libc-glibc =3D " glibc-utils glibc-gconv-utf=
-32"
> @@ -225,6 +230,11 @@ do_install_ptest() {
>      sed -i s:@libexecdir@:${libexecdir}:g ${D}${PTEST_PATH}/run-ptest
>      sed -i s:@bindir@:${bindir}:g ${D}${PTEST_PATH}/run-ptest
> =20
> +    # enable cachegrind ptests
> +    ln -s ${bindir}/cg_annotate ${D}/${PTEST_PATH}/cachegrind/cg_annotat=
e
> +    ln -s ${bindir}/cg_diff ${D}/${PTEST_PATH}/cachegrind/cg_diff
> +    ln -s ${bindir}/cg_merge ${D}/${PTEST_PATH}/cachegrind/cg_merge
> +
>      # This test fails on the host as well, using both 3.15 and git maste=
r (as of Jan 24 2020)
>      # https://bugs.kde.org/show_bug.cgi?id=3D402833
>      rm ${D}${PTEST_PATH}/memcheck/tests/overlap.vgtest

There may be further failures on arm:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6086

Cheers,

Richard



