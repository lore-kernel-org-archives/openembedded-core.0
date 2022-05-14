Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1B4C433EF
	for <webhook@archiver.kernel.org>; Sat, 14 May 2022 12:15:31 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.5387.1652530527941734390
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 May 2022 05:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LE3slYLQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id k30so1836802wrd.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 14 May 2022 05:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=/w52EOPu574EiNSUQWn5BNB7YTk0vqtsgqL5c2cS44s=;
        b=LE3slYLQbOyppkHNxLF1Hce1bO6Fk3203iySWuUbAViainNsjXGCvbV5q84MOPmNC1
         jo5oJH1dD/nnGfigWq33vbvZepZlmyMMCltBmkDbxQqJijYVpOdaGCB3V4JifoJONdpZ
         51DWn6MwDIDK26ZT1n2M0g3P/EEVGH1DF3b8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=/w52EOPu574EiNSUQWn5BNB7YTk0vqtsgqL5c2cS44s=;
        b=r3Da7biNH8Ygmu6hmqHXSymU7RTUCjkyAs9GmZ27bi5XOVbeQ3ngxqtZVZdow7Ektg
         P9ztBV6OBkWDdy5TBgFMQOtWo7sHPVVQZs5uCAp0PCvGS47oe7hd2TZPWsEI4a6ZgiiH
         5buDJn1cenbFo9VEtNgcOTsm+KCxXfmBbqPSlX/Cd+yCrRSDClXCykUds579Za1nywhG
         NDC69Q+pITjfvg/QVsJgeExKXurHSyfqEiKNRElOT2whZ3R3L0Wg33X46lFrM73pkpY+
         evy6B26zh1qVJ8j33NcxCICGbney9Wg6Sg1AP41DNP8WoCpId0pMLdzTf9J41qc/UI8L
         2T/Q==
X-Gm-Message-State: AOAM532TGWqM2xLjQ/h67oFe9nG6+RqzuhjD7rvp67nLLbxU0k+jLhGS
	Uk9dCzdE2I5w67R1eFimGNoRcA==
X-Google-Smtp-Source: 
 ABdhPJyaPqxeN9tyMqy3zkdMfAdNbfnevmkTAGwXiy1WurL41DwVVwEwn+rUl74VtREUx6qD0GPlxQ==
X-Received: by 2002:a5d:4fc7:0:b0:20c:dcd2:b088 with SMTP id
 h7-20020a5d4fc7000000b0020cdcd2b088mr7530289wrw.54.1652530526315;
        Sat, 14 May 2022 05:15:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6860:c182:5cab:e7e9?
 ([2001:8b0:aba:5f3c:6860:c182:5cab:e7e9])
        by smtp.gmail.com with ESMTPSA id
 d16-20020adf9c90000000b0020c5253d8fasm4618261wre.70.2022.05.14.05.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 05:15:25 -0700 (PDT)
Message-ID: 
 <94a8a02f6d94d8d4871fae331a7383cda81ab3dc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ovmf: Fix native build with gcc-12
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 14 May 2022 13:15:23 +0100
In-Reply-To: <20220513162244.577710-1-raj.khem@gmail.com>
References: <20220513162244.577710-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 May 2022 12:15:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165590

On Fri, 2022-05-13 at 09:22 -0700, Khem Raj wrote:
> Host distros have started deploying gcc12 as well e.g. archlinux
> this build failure shows up which has been fixed upstream
>=20
> In function =E2=80=98GetAlignmentFromFile=E2=80=99,
>     inlined from =E2=80=98main=E2=80=99 at GenFfs.c:816:20:
> GenFfs.c:545:5: error: pointer =E2=80=98InFileHandle=E2=80=99 used after =
=E2=80=98fclose=E2=80=99 [-Werror=3Duse-after-free]
>   545 |     Error(NULL, 0, 4001, "Resource", "memory cannot be allocated =
 of %s", InFileHandle);
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-BaseTools-fix-gcc12-warning-1.patch  | 51 +++++++++++++++++++
>  .../0001-BaseTools-fix-gcc12-warning.patch    | 49 ++++++++++++++++++
>  meta/recipes-core/ovmf/ovmf_git.bb            |  6 +++
>  3 files changed, 106 insertions(+)
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-=
warning-1.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-=
warning.patch
>=20
> diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning=
-1.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1.p=
atch
> new file mode 100644
> index 00000000000..23366b4d078
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1.patc=
h
> @@ -0,0 +1,51 @@
> +From b0a0b7b605aeb8106e7b50d1efeb746f401498cc Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Thu, 24 Mar 2022 20:04:35 +0800
> +Subject: [PATCH] BaseTools: fix gcc12 warning
> +
> +Sdk/C/LzmaEnc.c: In function ?LzmaEnc_CodeOneMemBlock?:
> +Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable ?o=
utStream? in ?*p.rc.outStream? [-Werror=3Ddangling-pointer=3D]
> + 2828 |   p->rc.outStream =3D &outStream.vt;
> +      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
> +Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
> + 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
> +      |                            ^~~~~~~~~
> +Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
> +Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable ?o=
utStream? in ?*(CLzmaEnc *)pp.rc.outStream? [-Werror=3Ddangling-pointer=3D]
> + 2828 |   p->rc.outStream =3D &outStream.vt;
> +      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
> +Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
> + 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
> +      |                            ^~~~~~~~~
> +Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
> +cc1: all warnings being treated as errors
> +
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/8502=
1f8cf22d1bd4114803c6c610dea5ef0059f1]
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +Reviewed-by: Bob Feng <bob.c.feng@intel.com>
> +---
> + BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c b/BaseTools=
/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> +index 4e9b499f8d..4b9f5fa692 100644
> +--- a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> ++++ b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> +@@ -2825,12 +2825,13 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHandle pp, =
BoolInt reInit,
> +=20
> +   nowPos64 =3D p->nowPos64;
> +   RangeEnc_Init(&p->rc);
> +-  p->rc.outStream =3D &outStream.vt;
> +=20
> +   if (desiredPackSize =3D=3D 0)
> +     return SZ_ERROR_OUTPUT_EOF;
> +=20
> ++  p->rc.outStream =3D &outStream.vt;
> +   res =3D LzmaEnc_CodeOneBlock(p, desiredPackSize, *unpackSize);
> ++  p->rc.outStream =3D NULL;
> +=20
> +   *unpackSize =3D (UInt32)(p->nowPos64 - nowPos64);
> +   *destLen -=3D outStream.rem;
> +--=20
> +2.36.1
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning=
.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.patch
> new file mode 100644
> index 00000000000..91c01647db2
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.patch
> @@ -0,0 +1,49 @@
> +From 2435c17e56652479315853cec5b91fb0ea0911a3 Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Thu, 24 Mar 2022 20:04:34 +0800
> +Subject: [PATCH] BaseTools: fix gcc12 warning
> +
> +GenFfs.c:545:5: error: pointer ?InFileHandle? used after ?fclose? [-Werr=
or=3Duse-after-free]
> +  545 |     Error(NULL, 0, 4001, "Resource", "memory cannot be allocated=
  of %s", InFileHandle);
> +      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
> +GenFfs.c:544:5: note: call to ?fclose? here
> +  544 |     fclose (InFileHandle);
> +      |     ^~~~~~~~~~~~~~~~~~~~~
> +
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/7b00=
5f344e533cd913c3ca05b266f9872df886d1]
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +Reviewed-by: Bob Feng <bob.c.feng@intel.com>
> +---
> + BaseTools/Source/C/GenFfs/GenFfs.c | 2 +-
> + BaseTools/Source/C/GenSec/GenSec.c | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/BaseTools/Source/C/GenFfs/GenFfs.c b/BaseTools/Source/C/Gen=
Ffs/GenFfs.c
> +index 949025c333..d78d62ab36 100644
> +--- a/BaseTools/Source/C/GenFfs/GenFfs.c
> ++++ b/BaseTools/Source/C/GenFfs/GenFfs.c
> +@@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment=
)
> +   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);
> +   if (PeFileBuffer =3D=3D NULL) {
> +     fclose (InFileHandle);
> +-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s=
", InFileHandle);
> ++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s=
", InFile);
> +     return EFI_OUT_OF_RESOURCES;
> +   }
> +   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
> +diff --git a/BaseTools/Source/C/GenSec/GenSec.c b/BaseTools/Source/C/Gen=
Sec/GenSec.c
> +index d54a4f9e0a..b1d05367ec 100644
> +--- a/BaseTools/Source/C/GenSec/GenSec.c
> ++++ b/BaseTools/Source/C/GenSec/GenSec.c
> +@@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignme=
nt)
> +   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);
> +   if (PeFileBuffer =3D=3D NULL) {
> +     fclose (InFileHandle);
> +-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s=
", InFileHandle);
> ++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s=
", InFile);
> +     return EFI_OUT_OF_RESOURCES;
> +   }
> +   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
> +--=20
> +2.36.1
> +
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
> index b15d40eac83..84e3360a3af 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -15,12 +15,18 @@ PACKAGECONFIG +=3D "${@bb.utils.contains('MACHINE_FEA=
TURES', 'tpm2', 'tpm', '', d)
>  PACKAGECONFIG[secureboot] =3D ",,,"
>  PACKAGECONFIG[tpm] =3D "-D TPM_ENABLE=3DTRUE,-D TPM_ENABLE=3DFALSE,,"
> =20
> +# GCC12 trips on it
> +#see https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Basetoo=
ls-turn-off-gcc12-warning.patch
> +BUILD_CFLAGS +=3D "-Wno-error=3Dstringop-overflow"
> +
>  SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=3Dmaster;proto=
col=3Dhttps \
>             file://0001-ovmf-update-path-to-native-BaseTools.patch \
>             file://0002-BaseTools-makefile-adjust-to-build-in-under-bitba=
ke.patch \
>             file://0003-ovmf-Update-to-latest.patch \
>             file://0005-debug-prefix-map.patch \
>             file://0006-reproducible.patch \
> +           file://0001-BaseTools-fix-gcc12-warning.patch \
> +           file://0001-BaseTools-fix-gcc12-warning-1.patch \
>             "
> =20
>  PV =3D "edk2-stable202202"

I think this may cause the efi failures in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3583/step=
s/14/logs/stdio

(and all the other similar oe-selftest runs)

Cheers,

Richard


