Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601F5C433EF
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 21:47:34 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.21689.1652651245066613716
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 14:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H7EHzO07;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id u3so18202466wrg.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 14:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Ga0no4vIeu92dPNMtcT+xqCKWbujkm5YGSr8WOkPy2g=;
        b=H7EHzO07xkCDQp6u4KnYDLygauyaS6WpMY/STk9B8IRiLavYokqpdHmeHqKArgk2Vb
         uYRvJ6tejR7f9b2izOAHsj1QMkSIk9IDKMFUVfFfzmUgFudU1XWCITVxWHLaKDmlVCyP
         yl0Zb6vd7tfYtNEFoflt2hyJma6eajzQx3sJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Ga0no4vIeu92dPNMtcT+xqCKWbujkm5YGSr8WOkPy2g=;
        b=x1v8jxKKE+barsgDO2AMyBG87Egmg/YpST6SojdpHRkj98z6rkQRL/5CPN9TDeXl7K
         i4i2/2iOUD1cn94si5Z6TZ3yUJnm3kplt5tp6ozDNyHSXY2nxjRG+5sMdhPsvxorUAvB
         BGLAakNoXXtRQxhGd4aeRcH4A/UMM50AIoRZdT8lZ0FaYjnDMBQw7F6PLO9ieCNu0PXF
         pH3m/3Hogkp1Y4Raq1rEiDrcwK3jLEYuqGJfrSOE14e/xpGMJNCPE1atSso7DMjX7rA8
         a9ynjWCQ/BMc64wyiL/BfP/x3yy6Ek33DpkB6Xh+kKr1TOqAbCzptQcDYfR8Fyg/U3Ud
         AjEQ==
X-Gm-Message-State: AOAM530syXqJIsQeBjYlI57LDCSn4EPWFiPc89GbBjMZTjF74MuWLZPI
	EjrKuJgxkingzXfJjZYEEKs5KA==
X-Google-Smtp-Source: 
 ABdhPJzeKB7P63nQH20AbJj6G/aHQFIu1GwQ/F2d/NkwQhm9VnKBPDjBNbwAlNLSDS+hDbH8wSAa9Q==
X-Received: by 2002:a05:6000:10cc:b0:20a:de6f:3c48 with SMTP id
 b12-20020a05600010cc00b0020ade6f3c48mr11562243wrx.650.1652651243578;
        Sun, 15 May 2022 14:47:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:907b:5576:ab63:2b17?
 ([2001:8b0:aba:5f3c:907b:5576:ab63:2b17])
        by smtp.gmail.com with ESMTPSA id
 g4-20020adfbc84000000b0020c5253d8f3sm9269016wrh.63.2022.05.15.14.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 14:47:22 -0700 (PDT)
Message-ID: 
 <be5e05b977a8333f5f3a5c9b677439e6487d8dc1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ovmf: Fix native build with gcc-12
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 15 May 2022 22:47:21 +0100
In-Reply-To: 
 <CAMKF1so_P06U1LsL2h-LbMxuSvLw6aoS-TWg5n4hZa=3rjozog@mail.gmail.com>
References: <20220513162244.577710-1-raj.khem@gmail.com>
	 <16EEF7C2A0110441.10172@lists.openembedded.org>
	 <c5c1d238df20f6563c9a4bc5c4e5794eda01bfec.camel@linuxfoundation.org>
	 <CAMKF1so_P06U1LsL2h-LbMxuSvLw6aoS-TWg5n4hZa=3rjozog@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 21:47:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165660

On Sat, 2022-05-14 at 14:42 -0700, Khem Raj wrote:
>=20
>=20
> On Sat, May 14, 2022 at 2:31 PM <richard.purdie@linuxfoundation.org>
> wrote:
> > On Sat, 2022-05-14 at 13:15 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Fri, 2022-05-13 at 09:22 -0700, Khem Raj wrote:
> > > > Host distros have started deploying gcc12 as well e.g.
> > > > archlinux
> > > > this build failure shows up which has been fixed upstream
> > > >=20
> > > > In function =E2=80=98GetAlignmentFromFile=E2=80=99,
> > > > =C2=A0 =C2=A0 =C2=A0inlined from =E2=80=98main=E2=80=99 at GenFfs.c=
:816:20:
> > > > GenFfs.c:545:5: error: pointer =E2=80=98InFileHandle=E2=80=99 used =
after
> > > > =E2=80=98fclose=E2=80=99 [-Werror=3Duse-after-free]
> > > > =C2=A0 =C2=A0545 |=C2=A0 =C2=A0 =C2=A0Error(NULL, 0, 4001, "Resourc=
e", "memory cannot be
> > > > allocated=C2=A0 of %s", InFileHandle);
> > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0
> > > > =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
> > > > ~~~~~~~~~~~~~~~~~~~~~
> > > >=20
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > > =C2=A0 .../0001-BaseTools-fix-gcc12-warning-1.patch=C2=A0 | 51
> > > > +++++++++++++++++++
> > > > =C2=A0 .../0001-BaseTools-fix-gcc12-warning.patch=C2=A0 =C2=A0 | 49
> > > > ++++++++++++++++++
> > > > =C2=A0 meta/recipes-core/ovmf/ovmf_git.bb=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++
> > > > =C2=A0 3 files changed, 106 insertions(+)
> > > > =C2=A0 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-
> > > > BaseTools-fix-gcc12-warning-1.patch
> > > > =C2=A0 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-
> > > > BaseTools-fix-gcc12-warning.patch
> > > >=20
> > > > diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-
> > > > gcc12-warning-1.patch b/meta/recipes-core/ovmf/ovmf/0001-
> > > > BaseTools-fix-gcc12-warning-1.patch
> > > > new file mode 100644
> > > > index 00000000000..23366b4d078
> > > > --- /dev/null
> > > > +++ b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-
> > > > warning-1.patch
> > > > @@ -0,0 +1,51 @@
> > > > +From b0a0b7b605aeb8106e7b50d1efeb746f401498cc Mon Sep 17
> > > > 00:00:00 2001
> > > > +From: Gerd Hoffmann <kraxel@redhat.com>
> > > > +Date: Thu, 24 Mar 2022 20:04:35 +0800
> > > > +Subject: [PATCH] BaseTools: fix gcc12 warning
> > > > +
> > > > +Sdk/C/LzmaEnc.c: In function ?LzmaEnc_CodeOneMemBlock?:
> > > > +Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local
> > > > variable ?outStream? in ?*p.rc.outStream? [-Werror=3Ddangling-
> > > > pointer=3D]
> > > > + 2828 |=C2=A0 =C2=A0p->rc.outStream =3D &outStream.vt;
> > > > +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
> > > > +Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
> > > > + 2811 |=C2=A0 =C2=A0CLzmaEnc_SeqOutStreamBuf outStream;
> > > > +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~
> > > > +Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
> > > > +Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local
> > > > variable ?outStream? in ?*(CLzmaEnc *)pp.rc.outStream? [-
> > > > Werror=3Ddangling-pointer=3D]
> > > > + 2828 |=C2=A0 =C2=A0p->rc.outStream =3D &outStream.vt;
> > > > +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
> > > > +Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
> > > > + 2811 |=C2=A0 =C2=A0CLzmaEnc_SeqOutStreamBuf outStream;
> > > > +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~
> > > > +Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
> > > > +cc1: all warnings being treated as errors
> > > > +
> > > > +Upstream-Status: Backport
> > > > [https://github.com/tianocore/edk2/commit/85021f8cf22d1bd411480
> > > > 3c6c610dea5ef0059f1]
> > > > +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > > > +Reviewed-by: Bob Feng <bob.c.feng@intel.com>
> > > > +---
> > > > + BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c | 3 ++-
> > > > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> > > > b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> > > > +index 4e9b499f8d..4b9f5fa692 100644
> > > > +--- a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> > > > ++++ b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> > > > +@@ -2825,12 +2825,13 @@ SRes
> > > > LzmaEnc_CodeOneMemBlock(CLzmaEncHandle pp, BoolInt reInit,
> > > > +=20
> > > > +=C2=A0 =C2=A0nowPos64 =3D p->nowPos64;
> > > > +=C2=A0 =C2=A0RangeEnc_Init(&p->rc);
> > > > +-=C2=A0 p->rc.outStream =3D &outStream.vt;
> > > > +=20
> > > > +=C2=A0 =C2=A0if (desiredPackSize =3D=3D 0)
> > > > +=C2=A0 =C2=A0 =C2=A0return SZ_ERROR_OUTPUT_EOF;
> > > > +=20
> > > > ++=C2=A0 p->rc.outStream =3D &outStream.vt;
> > > > +=C2=A0 =C2=A0res =3D LzmaEnc_CodeOneBlock(p, desiredPackSize,
> > > > *unpackSize);
> > > > ++=C2=A0 p->rc.outStream =3D NULL;
> > > > +=20
> > > > +=C2=A0 =C2=A0*unpackSize =3D (UInt32)(p->nowPos64 - nowPos64);
> > > > +=C2=A0 =C2=A0*destLen -=3D outStream.rem;
> > > > +--=20
> > > > +2.36.1
> > > > +
> > > > diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-
> > > > gcc12-warning.patch b/meta/recipes-core/ovmf/ovmf/0001-
> > > > BaseTools-fix-gcc12-warning.patch
> > > > new file mode 100644
> > > > index 00000000000..91c01647db2
> > > > --- /dev/null
> > > > +++ b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-
> > > > warning.patch
> > > > @@ -0,0 +1,49 @@
> > > > +From 2435c17e56652479315853cec5b91fb0ea0911a3 Mon Sep 17
> > > > 00:00:00 2001
> > > > +From: Gerd Hoffmann <kraxel@redhat.com>
> > > > +Date: Thu, 24 Mar 2022 20:04:34 +0800
> > > > +Subject: [PATCH] BaseTools: fix gcc12 warning
> > > > +
> > > > +GenFfs.c:545:5: error: pointer ?InFileHandle? used after
> > > > ?fclose? [-Werror=3Duse-after-free]
> > > > +=C2=A0 545 |=C2=A0 =C2=A0 =C2=A0Error(NULL, 0, 4001, "Resource", "=
memory cannot be
> > > > allocated=C2=A0 of %s", InFileHandle);
> > > > +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0
> > > > =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
> > > > ~~~~~~~~~~~~~~~~~~~~~
> > > > +GenFfs.c:544:5: note: call to ?fclose? here
> > > > +=C2=A0 544 |=C2=A0 =C2=A0 =C2=A0fclose (InFileHandle);
> > > > +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~
> > > > +
> > > > +Upstream-Status: Backport
> > > > [https://github.com/tianocore/edk2/commit/7b005f344e533cd913c3c
> > > > a05b266f9872df886d1]
> > > > +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > > > +Reviewed-by: Bob Feng <bob.c.feng@intel.com>
> > > > +---
> > > > + BaseTools/Source/C/GenFfs/GenFfs.c | 2 +-
> > > > + BaseTools/Source/C/GenSec/GenSec.c | 2 +-
> > > > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > > > +
> > > > +diff --git a/BaseTools/Source/C/GenFfs/GenFfs.c
> > > > b/BaseTools/Source/C/GenFfs/GenFfs.c
> > > > +index 949025c333..d78d62ab36 100644
> > > > +--- a/BaseTools/Source/C/GenFfs/GenFfs.c
> > > > ++++ b/BaseTools/Source/C/GenFfs/GenFfs.c
> > > > +@@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT32
> > > > *Alignment)
> > > > +=C2=A0 =C2=A0PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);
> > > > +=C2=A0 =C2=A0if (PeFileBuffer =3D=3D NULL) {
> > > > +=C2=A0 =C2=A0 =C2=A0fclose (InFileHandle);
> > > > +-=C2=A0 =C2=A0 Error(NULL, 0, 4001, "Resource", "memory cannot be
> > > > allocated=C2=A0 of %s", InFileHandle);
> > > > ++=C2=A0 =C2=A0 Error(NULL, 0, 4001, "Resource", "memory cannot be
> > > > allocated for %s", InFile);
> > > > +=C2=A0 =C2=A0 =C2=A0return EFI_OUT_OF_RESOURCES;
> > > > +=C2=A0 =C2=A0}
> > > > +=C2=A0 =C2=A0fread (PeFileBuffer, sizeof (UINT8), PeFileSize,
> > > > InFileHandle);
> > > > +diff --git a/BaseTools/Source/C/GenSec/GenSec.c
> > > > b/BaseTools/Source/C/GenSec/GenSec.c
> > > > +index d54a4f9e0a..b1d05367ec 100644
> > > > +--- a/BaseTools/Source/C/GenSec/GenSec.c
> > > > ++++ b/BaseTools/Source/C/GenSec/GenSec.c
> > > > +@@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile,
> > > > UINT32 *Alignment)
> > > > +=C2=A0 =C2=A0PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);
> > > > +=C2=A0 =C2=A0if (PeFileBuffer =3D=3D NULL) {
> > > > +=C2=A0 =C2=A0 =C2=A0fclose (InFileHandle);
> > > > +-=C2=A0 =C2=A0 Error(NULL, 0, 4001, "Resource", "memory cannot be
> > > > allocated=C2=A0 of %s", InFileHandle);
> > > > ++=C2=A0 =C2=A0 Error(NULL, 0, 4001, "Resource", "memory cannot be
> > > > allocated for %s", InFile);
> > > > +=C2=A0 =C2=A0 =C2=A0return EFI_OUT_OF_RESOURCES;
> > > > +=C2=A0 =C2=A0}
> > > > +=C2=A0 =C2=A0fread (PeFileBuffer, sizeof (UINT8), PeFileSize,
> > > > InFileHandle);
> > > > +--=20
> > > > +2.36.1
> > > > +
> > > > diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-
> > > > core/ovmf/ovmf_git.bb
> > > > index b15d40eac83..84e3360a3af 100644
> > > > --- a/meta/recipes-core/ovmf/ovmf_git.bb
> > > > +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> > > > @@ -15,12 +15,18 @@ PACKAGECONFIG +=3D
> > > > "${@bb.utils.contains('MACHINE_FEATURES', 'tpm2', 'tpm', '', d)
> > > > =C2=A0 PACKAGECONFIG[secureboot] =3D ",,,"
> > > > =C2=A0 PACKAGECONFIG[tpm] =3D "-D TPM_ENABLE=3DTRUE,-D
> > > > TPM_ENABLE=3DFALSE,,"
> > > > =C2=A0=20
> > > > +# GCC12 trips on it
> > > > +#see
> > > > https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Basetoo=
ls-turn-off-gcc12-warning.patch
> > > > +BUILD_CFLAGS +=3D "-Wno-error=3Dstringop-overflow"
> > > > +
> > > > =C2=A0 SRC_URI =3D
> > > > "gitsm://github.com/tianocore/edk2.git;branch=3Dmaster;protocol=3Dh
> > > > ttps \
> > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
> > > > =C2=A0file://0001-ovmf-update-path-to-native-BaseTools.patch \
> > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
> > > > =C2=A0file://0002-BaseTools-makefile-adjust-to-build-in-under-bitba=
k
> > > > e.patch \
> > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-ovmf-Up=
date-to-latest.patch \
> > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-debug-p=
refix-map.patch \
> > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-reprodu=
cible.patch \
> > > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-BaseTools-fix=
-gcc12-warning.patch \
> > > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-BaseTools-fix=
-gcc12-warning-1.patch \
> > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
> > > > =C2=A0=20
> > > > =C2=A0 PV =3D "edk2-stable202202"
> > >=20
> > > I think this may cause the efi failures in:
> > >=20
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/358=
3/steps/14/logs/stdio
> > >=20
> > > (and all the other similar oe-selftest runs)
> >=20
> > I'm going to retract that, further testing shows it is something
> > else,
> > still not sure what.
> >=20
>=20
>=20
> Right I was a little confused as well and was trying to reproduce
> locally here with and without this patch and the results were same=C2=A0

It definitely wasn't this patch, sorry. It can sometimes be really hard
to tell which failure is from which patch, it has taken me a few tries
to isolate this one!

Cheers,

Richard

