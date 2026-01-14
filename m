Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4970AD37E5F
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 15:58:26 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13574.1768406300205491321
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 07:58:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yqNst/HD;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A3E774E420D7;
	Wed, 14 Jan 2026 15:58:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6ACB76074A;
	Wed, 14 Jan 2026 15:58:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49C6910B68290;
	Wed, 14 Jan 2026 16:58:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768406297; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0c4+99wCtzv+VOsjtsQ3HEZdOIxVGMQniYI1nP/tfYQ=;
	b=yqNst/HDFHgeJm/yQOvRLf85T7PJRijvFwyQ5j6H66485nyP2KB0DHdtJTxKZBH7tBRQlw
	Y1Stu9wJ6cqEshio7X/t8EsFJUCuywy8rG0nIsqnB4RBJIFxihDNqXS0mqrS8hicLFvH+Q
	Z/CKBUuyWNnjcEMK4AMu61upBu20t32NWa2ToF6GdEq3RQapi6yDJFCKa5v5/NhGU1HeXO
	Dj42Fr52Y5DEF0Dw2n36NroBqQPlEAq/ZCpGCFQCvdvaSAg17FswORwc+Ix7OHfBfBM1us
	wBnUjHE844siV9+29K5LHHHDsVsnWjvN84tsRvhju4lY3G5eC/LnEBQbMlXxrA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 16:58:14 +0100
Message-Id: <DFOFPON5W0JH.3442V3YUTEX2L@bootlin.com>
Subject: Re: [OE-core] [PATCH] llvm: enable LLVMgold.so build by adding
 binutils dependency
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <mark.yang@lge.com>, <openembedded-core@lists.openembedded.org>
References: <20260113225424.1208879-1-mark.yang@lge.com>
In-Reply-To: <20260113225424.1208879-1-mark.yang@lge.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 15:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229345

Hi,

On Tue Jan 13, 2026 at 11:54 PM CET, mark.yang via lists.openembedded.org w=
rote:
> From: "mark.yang" <mark.yang@lge.com>
>
> Currently, LLVMgold.so is not built because the binutils headers
> are missing during the build process.
>
> This allows LLVM to find the necessary headers and build the LLVMgold.so,
> which is required for Link Time Optimization (LTO) support properly.
>
> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---
>  meta/recipes-devtools/clang/llvm_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devto=
ols/clang/llvm_git.bb
> index 96ea383731..bed9988c1a 100644
> --- a/meta/recipes-devtools/clang/llvm_git.bb
> +++ b/meta/recipes-devtools/clang/llvm_git.bb
> @@ -11,7 +11,7 @@ require common-source.inc
> =20
>  LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D8a15a0759ef07f2682d2ba4b8=
93c9afe"
> =20
> -DEPENDS =3D "llvm-tblgen-native libffi libxml2 zlib zstd"
> +DEPENDS =3D "llvm-tblgen-native libffi libxml2 zlib zstd binutils"
> =20
>  inherit cmake pkgconfig lib_package multilib_header
> =20
> @@ -50,6 +50,7 @@ EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DMinSizeRel \
>                    -DLLVM_TOOL_YAML2OBJ_BUILD=3DOFF \
>                    -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
>                    -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen=
 \
> +                  -DLLVM_BINUTILS_INCDIR=3D${STAGING_INCDIR} \
>                    -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAIN_FI=
LE=3D${WORKDIR}/toolchain-native.cmake' \
>                   "
> =20

I think this triggered the following error on our test infrastructure:

NOTE: Running task 9262 of 9824 (virtual:native:/srv/pokybuild/yocto-worker=
/qemux86-64-ltp/build/layers/openembedded-core/meta/recipes-devtools/clang/=
libclc_git.bb:do_create_spdx)
ERROR: llvm-21.1.8-r1 do_package: QA Issue: llvm: Files/directories were in=
stalled but not shipped in any package:
  /usr/lib/LLVMgold.so

Can you have a look?

https://autobuilder.yoctoproject.org/valkyrie/#/builders/63/builds/2846
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4942824/raw_inlin=
e

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


