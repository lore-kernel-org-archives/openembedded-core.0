Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F210DCAC5B0
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 13:36:40 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.7834.1759498593603822460
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 06:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=I6ASg4SJ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 593DaWVB3553680;
	Fri, 3 Oct 2025 08:36:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759498592;
	bh=SKSmisVgmjEKsXX94ZkNbH00L+1c2zPCOZ++adJRNvo=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=I6ASg4SJW+u1NRLgPHz9X58eDfHCSFsMFZa8Q2cThLgMW1CN8JakEdqRqAMW9iLlr
	 YTVuBWHYmr8o0RTRSfP63wJAU2SBR3on9gVMbGzMmta+0LoSS52lVCDH5Zz3hih3f1
	 ZZnCc2AA0GmJ3eL6Fn7zcPbOym3Re+UVU5cjj90E=
Received: from DLEE205.ent.ti.com (dlee205.ent.ti.com [157.170.170.85])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 593DaWPU177357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Oct 2025 08:36:32 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Oct
 2025 08:36:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 3 Oct 2025 08:36:32 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 593DaW2F3447624;
	Fri, 3 Oct 2025 08:36:32 -0500
Message-ID: <a177c9f3-ac3d-4c37-9723-60b04e0984ca@ti.com>
Date: Fri, 3 Oct 2025 08:36:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] ghostscript: upgrade 10.05.1 -> 10.06.0
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
References: <20250929104731.19684-1-vanusuri@mvista.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250929104731.19684-1-vanusuri@mvista.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 593DaWVB3553680
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 13:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224389


This was accepted onto master, and we are seeing different a different=20
32bit build failure:

./brotli/c/dec/decode.c: In function 'PreloadSymbol':
./brotli/c/dec/huffman.h:83:47: error: ISO C90 forbids mixed=20
declarations and code [-Werror=3Ddeclaration-after-statement]
    83 | #define BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(H) uint32_t=20
__fastload_##H =3D (*H)
       |                                               ^~~~~~~~
./brotli/c/dec/decode.c:440:3: note: in expansion of macro=20
'BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD'
   440 |   BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(table);
       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




On 9/29/2025 5:47 AM, Vijay Anusuri via lists.openembedded.org wrote:
> From: Vijay Anusuri <vanusuri@mvista.com>
>=20
> Dropped 0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
>=20
> Added fPIC flag needed to prevent a linker error during the build proce=
ss.
>=20
> This upgrade addresses CVEs:
> CVE-2025-59798, CVE-2025-59799, CVE-2025-59800, CVE-2025-59801
>=20
> Changelog:
> https://ghostscript.readthedocs.io/en/gs10.06.0/News.html
>=20
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>   ...Fix-compatibility-with-C23-compilers.patch | 67 ------------------=
-
>   ...ript_10.05.1.bb =3D> ghostscript_10.06.0.bb} |  5 +-
>   2 files changed, 2 insertions(+), 70 deletions(-)
>   delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001=
-Bug-708160-Fix-compatibility-with-C23-compilers.patch
>   rename meta/recipes-extended/ghostscript/{ghostscript_10.05.1.bb =3D>=
 ghostscript_10.06.0.bb} (93%)
>=20
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708=
160-Fix-compatibility-with-C23-compilers.patch b/meta/recipes-extended/gh=
ostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compiler=
s.patch
> deleted file mode 100644
> index 78f3fc1c34..0000000000
> --- a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix=
-compatibility-with-C23-compilers.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -From c595086bfe206776676e290df98cd09e91210e27 Mon Sep 17 00:00:00 2001
> -From: Alex Cherepanov <alex@coscript.biz>
> -Date: Thu, 3 Apr 2025 17:19:41 +0100
> -Subject: [PATCH] Bug 708160: Fix compatibility with C23 compilers
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -* fixes:
> -  http://errors.yoctoproject.org/Errors/Details/853021/
> -
> -In file included from ./base/genconf.c:18:
> -./base/stdpre.h:348:13: error: =E2=80=98bool=E2=80=99 cannot be define=
d via =E2=80=98typedef=E2=80=99
> -  348 | typedef int bool;
> -      |             ^~~~
> -./base/stdpre.h:348:13: note: =E2=80=98bool=E2=80=99 is a keyword with=
 =E2=80=98-std=3Dc23=E2=80=99 onwards
> -./base/stdpre.h:348:1: warning: useless type name in empty declaration
> -  348 | typedef int bool;
> -      | ^~~~~~~
> -
> -Upstream-Status: Backport [Partial backport of https://cgit.ghostscrip=
t.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/base/stdpre.h?id=3Dae940946473=
ceb8c5353bc6e7f04673c6e60502d]
> -
> -Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ----
> - base/stdpre.h | 6 ++++--
> - 1 file changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/base/stdpre.h b/base/stdpre.h
> -index dda30b6..2f9c84e 100644
> ---- a/base/stdpre.h
> -+++ b/base/stdpre.h
> -@@ -1,4 +1,4 @@
> --/* Copyright (C) 2001-2023 Artifex Software, Inc.
> -+/* Copyright (C) 2001-2025 Artifex Software, Inc.
> -    All Rights Reserved.
> -
> -    This software is provided AS-IS with no warranty, either express o=
r
> -@@ -341,7 +341,9 @@ typedef signed char schar;
> -  * and the MetroWerks C++ compiler insists that bool be equivalent to
> -  * unsigned char.
> -  */
> --#ifndef __cplusplus
> -+
> -+/* C23 has bool as a builtin type. */
> -+#if !defined(__cplusplus) && (!defined(__STDC_VERSION__) || __STDC_VE=
RSION__ < 202311L)
> - #ifdef __BEOS__
> - typedef unsigned char bool;
> - #else
> -diff --git a/base/gp.h b/base/gp.h
> -index ad5bb61..cf2c9cf 100644
> ---- a/base/gp.h
> -+++ b/base/gp.h
> -@@ -1,4 +1,4 @@
> --/* Copyright (C) 2001-2023 Artifex Software, Inc.
> -+/* Copyright (C) 2001-2025 Artifex Software, Inc.
> -    All Rights Reserved.
> -
> -    This software is provided AS-IS with no warranty, either express o=
r
> -@@ -646,7 +646,7 @@ int gp_fseek_impl(FILE *strm, gs_offset_t offset, =
int origin);
> - /* Create a second open gp_file on the basis of a given one */
> - FILE *gp_fdup_impl(FILE *f, const char *mode);
> -
> --int gp_fseekable_impl(FILE *f);
> -+bool gp_fseekable_impl(FILE *f);
> -
> - /* Force given file into binary mode (no eol translations, etc) */
> - /* if 2nd param true, text mode if 2nd param false */
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b=
/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
> similarity index 93%
> rename from meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
> rename to meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
> index 417bf52a99..8bb5bb985c 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
> @@ -24,10 +24,9 @@ def gs_verdir(v):
>   SRC_URI =3D "https://github.com/ArtifexSoftware/ghostpdl-downloads/re=
leases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
>              file://ghostscript-9.16-Werror-return-type.patch \
>              file://avoid-host-contamination.patch \
> -           file://0001-Bug-708160-Fix-compatibility-with-C23-compilers=
.patch \
>              "
>  =20
> -SRC_URI[sha256sum] =3D "121861b6d29b2461dec6575c9f3cab665b810bd408d4ec=
02c86719fa708b0a49"
> +SRC_URI[sha256sum] =3D "5bd6da34794928cc7e616f288e32bd0be7f9a5ca2d3c20=
6a0af2c19a4e3a318f"
>  =20
>   PACKAGECONFIG ??=3D ""
>   PACKAGECONFIG[gtk] =3D "--enable-gtk,--disable-gtk,gtk+3"
> @@ -47,7 +46,7 @@ EXTRA_OECONF:append:mipsarcho32 =3D " --with-large_co=
lor_index=3D0"
>   EXTRA_OECONF:append:armv7a =3D "${@bb.utils.contains('TUNE_FEATURES',=
'neon','',' --disable-neon',d)}"
>   EXTRA_OECONF:append:armv7ve =3D "${@bb.utils.contains('TUNE_FEATURES'=
,'neon','',' --disable-neon',d)}"
>  =20
> -TARGET_CFLAGS +=3D "-std=3Dgnu17"
> +TARGET_CFLAGS +=3D "-std=3Dgnu17 -fPIC"
>  =20
>   # Uses autoconf but not automake, can't do out-of-tree
>   inherit autotools-brokensep pkgconfig
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224134): https://lists.openembedded.org/g/openembed=
ded-core/message/224134
> Mute This Topic: https://lists.openembedded.org/mt/115492575/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

