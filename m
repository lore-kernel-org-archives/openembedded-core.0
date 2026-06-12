Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FF4CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 08:39:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65982.1781253583117819393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 01:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZFhN70u9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso5438835e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 01:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781253581; x=1781858381; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m8ZQI1FeY284xKzV55lzIXubURrToac6KjAzGRNimSQ=;
        b=ZFhN70u9w3eH2uO7BTJRCzI2uacCRPpZ3giton6ComXYmGZNugCnZhPFAzilCmuPsO
         ZSa7+TlPstCHeSlFNAzNcp69RJ2D5muFALsvHQkbnlzFwzLiv8fMySDe4B+lR2dq0ui2
         2hFOgLoXihTmRtl6zkLcV3NgC8epVUbGOGjWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781253581; x=1781858381;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8ZQI1FeY284xKzV55lzIXubURrToac6KjAzGRNimSQ=;
        b=KZ01Jm3COuTa/eO2eEby5HCykI2CoutdFLe9wt9IMNcd1pl2W6yWImW9ZiFiqh0O2Q
         Qs6sSpIMpeuWsjk2XtuGeqp5oiC2FE0bYdTg7wt/z/r6BbnXMySGtEj2J/U3q981M2eA
         lERhlmEZEspGgI/+gJyt5gF5nmhLH6cwCWqmNblBeSyCtAn/2wCYEs00DCgrYKmMn37p
         J1KL3vCROI2wJC535CqmeCzfvJ4uRtYkn6I5M3AeltjRnuTVOUpCqerGVq1VMQmPG6sX
         F7XZiTt77mOXJ+4/CQpxnJwgGGIXP0z5ExcZMi0+G0iDB8AsCsXE8GtOcJWAMr5po32E
         +ZZA==
X-Forwarded-Encrypted: i=1; AFNElJ99A31AyfjC+gLaNboreUj86MmStl0wLsJ4Y5L+gwv02nTJjM4ebCYcqLGOL2tVH7M6Rik5N4I3hg1nee11p6xumA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzVzEwMBDmd6iB1WnLJQ/KHyKca76ae7t1qhgbFJfTNbMI07J0d
	581GX+sRa/J3702FiHoSbt6F9x+pLpdmkTNfuv2GkxA0F2h8XqUBZmn+LYPcDATU/Ko=
X-Gm-Gg: Acq92OFx7ba0fi/1FHuPnbKCaAv2Y01hmPvCByOpxViw5WcdFhqiPBLIEshKW/N0Nq0
	jY8Az+m3xCrGMEnBrqFMbXeN8FP67sE8DY2iHFhuO6INqv0YzyHB5rrFL82Y6jgGjgAuy4jMgdp
	R6T6eU21r91dWQ0txhmlV6DUYptkt+4hflVnYXeVyEpT3R6SDLRMS0wWIuc/qr3063vaK6V1FyQ
	j+9fGRzfnHfN1aVCXOsNhE5I8sFQaWe+s95PHyMptU2XZHfOunwTclyZl2cWoWeuLul3463GvbY
	n2e+tXtOOP1sTxM8Rq70BEtcahsRpTAWRIL1aqM6YAf0ePxcFNnl9ALgLB9z6HN7R80eLa1tRl3
	dhbJWh92Q6drtQZ7JzUhLyGEVNyGRnquIyewDbcfRTmqBdKkNY4ml40w/WjYZep2GkGQGM4ogVP
	PUfja1A8xzfQ1uSQyXm4lJrVNTbebu0sBe6r9CnJX1Wlg7qW3VAlHYGvdtGlddY1z0y+p66/dkC
	hJzlF0359lHM5wW
X-Received: by 2002:a05:600c:8b09:b0:490:b446:fb8 with SMTP id 5b1f17b1804b1-490ec4d9298mr22107295e9.11.1781253581113;
        Fri, 12 Jun 2026 01:39:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f50c:d0e7:6f94:47a9? ([2001:8b0:aba:5f3c:f50c:d0e7:6f94:47a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4a128csm59092445e9.0.2026.06.12.01.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 01:39:40 -0700 (PDT)
Message-ID: <81d9b55d8be3f08a199c0ed82cc5a68a3e083cdd.camel@linuxfoundation.org>
Subject: Re: [PATCH v3] llvm/mesa/rust: simplify llvm-config handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Deepesh.Varatharajan@windriver.com, 
	openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Fri, 12 Jun 2026 09:39:39 +0100
In-Reply-To: <20260612034643.3215188-1-Deepesh.Varatharajan@windriver.com>
References: <20260612034643.3215188-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 08:39:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238594

On Thu, 2026-06-11 at 20:46 -0700, Deepesh.Varatharajan@windriver.com wrote=
:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>=20
> Replace PATH-based llvm-config discovery with explicit sysroot-native
> resolution and simplify the target llvm-config wrapper to act as a pure
> pass-through while preserving Yocto alternate path handling.
>=20
> The previous implementation relied on:
>=20
> * `which -a llvm-config | sed -n 2p`
> =C2=A0=C2=A0 which is unreliable in cross-build environments because it o=
nly
> =C2=A0=C2=A0 searches executables present in $PATH. Native sysroot tools
> =C2=A0=C2=A0 (e.g. recipe-sysroot-native llvm-config) are not guaranteed =
to be
> =C2=A0=C2=A0 exposed via PATH, so they may not be discovered at all.

We always configure PATH to contain the cross scripts and native
sysroot. Is there something which is reconfiguring PATH to skip the
native sysroot?

> * `echo $base_libdir | sed -n '/lib64/p'`
> =C2=A0=C2=A0 which depends on a BitBake variable that may be empty or uns=
et
> =C2=A0=C2=A0 in certain build contexts, leading to incorrect libdir selec=
tion.
>=20
> Update the wrapper to:
>=20
> * Use an @LLVM_CONFIG_PATH@ placeholder that is replaced during the
> =C2=A0 build with the appropriate native llvm-config path.
> * Detect libdir using filesystem inspection rather than variable
> =C2=A0 parsing.
> * Preserve `YOCTO_ALTERNATE_EXE_PATH` and
> =C2=A0 `YOCTO_ALTERNATE_LIBDIR` handling.
> * Delegate all arguments directly to the native llvm-config.
>=20
> Update rust and mesa recipes to replace the placeholder with the native
> llvm-config path during target and nativesdk builds.
>=20
> Also remove the native llvm-config copy logic and lib/lib64 symlink
> workarounds, relying instead on explicit native tool resolution.
>=20
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
> =C2=A0...unwind.pc.in-and-llvm-config-scripts.patch | 52 +++-------------=
---
> =C2=A0meta/recipes-devtools/rust/rust_1.96.0.bb=C2=A0=C2=A0=C2=A0=C2=A0 |=
 52 ++++++-------------
> =C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 ++++++
> =C2=A03 files changed, 39 insertions(+), 81 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc=
.in-and-llvm-config-scripts.patch b/meta/recipes-devtools/clang/clang/0026-=
llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
> index eeb802732b..72ffdc6c1f 100644
> --- a/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and=
-llvm-config-scripts.patch
> +++ b/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and=
-llvm-config-scripts.patch
> @@ -8,6 +8,7 @@ These are added by OE project
> =C2=A0Upstream-Status: Inappropriate [ OE-Specific ]
> =C2=A0
> =C2=A0Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> =C2=A0---
> =C2=A0 libunwind/libunwind.pc.in=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 9 ++++++
> =C2=A0 llvm/tools/llvm-config/llvm-config | 52 ++++++++++++++++++++++++++=
++++
> @@ -35,56 +36,19 @@ new file mode 100644
> =C2=A0index 000000000000..6a0dd54b8eab
> =C2=A0--- /dev/null
> =C2=A0+++ b/llvm/tools/llvm-config/llvm-config
> -@@ -0,0 +1,52 @@
> +@@ -0,0 +1,15 @@
> =C2=A0+#!/bin/bash
> =C2=A0+#
> -+# Wrapper script for llvm-config. Supplies the right environment variab=
les
> -+# for the target and delegates to the native llvm-config for anything e=
lse. This
> -+# is needed because arguments like --ldflags, --cxxflags, etc. are set =
by the
> -+# native compile rather than the target compile.
> ++# The llvm-config wrapper will act as a pure pass-through to the native=
 llvm-config
> ++# while preserving Yocto-specific environment variables used for altern=
ate executable
> ++# and library path resolution.
> =C2=A0+#
> =C2=A0+SCRIPT_DIR=3D"$(dirname "$(readlink -f "$0")")"
> -+NEXT_LLVM_CONFIG=3D"$(which -a llvm-config | sed -n 2p)"
> ++NEXT_LLVM_CONFIG=3D"@LLVM_CONFIG_PATH@"

As I understand it, this is always being configured to point at the
llvm-config in the native sysroot?

I think this script is only ever installed into STAGING_BINDIR_CROSS?

If that is the case, could we just set this to a relative path to
SCRIPT_DIR, which would then always point at the right places without
needing to be adjusted each time?

> =C2=A0+export YOCTO_ALTERNATE_EXE_PATH=3D"${YOCTO_ALTERNATE_EXE_PATH:=3D"=
$(readlink -f "$SCRIPT_DIR/../llvm-config")"}"
> -+if [ -n "$( echo $base_libdir | sed -n '/lib64/p')" ]; then
> ++if [ -d "$(readlink -f "$SCRIPT_DIR/../../lib64")" ]; then
> =C2=A0+=C2=A0=C2=A0=C2=A0 export YOCTO_ALTERNATE_LIBDIR=3D"${YOCTO_ALTERN=
ATE_LIBDIR:=3D"/lib64"}"
> =C2=A0+else
> =C2=A0+=C2=A0=C2=A0=C2=A0 export YOCTO_ALTERNATE_LIBDIR=3D"${YOCTO_ALTERN=
ATE_LIBDIR:=3D"/lib"}"
> =C2=A0+fi
> -+if [[ $# =3D=3D 0 ]]; then
> -+=C2=A0 exec "$NEXT_LLVM_CONFIG"
> -+fi
> -+
> -+remain=3D""
> -+output=3D""
> -+for arg in "$@"; do
> -+=C2=A0 case "$arg" in
> -+=C2=A0=C2=A0=C2=A0 --cppflags)
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 output=3D"${output} ${CPPFLAGS}"
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
> -+=C2=A0=C2=A0=C2=A0 --cflags)
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 output=3D"${output} ${CFLAGS}"
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;

Can you remind me, how does the native llvm-config provide the target
cflags? Is that triggered by setting the YOCTO_ALTERNATE_LIBDIR above?

Cheers,

Richard

