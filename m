Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3A5C433EF
	for <webhook@archiver.kernel.org>; Sat, 14 May 2022 21:31:04 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.10589.1652563863298462998
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 May 2022 14:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gSy2I5RI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 v191-20020a1cacc8000000b00397001398c0so7886wme.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 14 May 2022 14:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=CfI+aS6y4iMTulkDqQarRkebffB8tDxH/4QWxO6dzsQ=;
        b=gSy2I5RIN5+q7pqm7nGjWciwJfmum2GUhqip3tK2kcsjG+v+pOve2sSYnom0zX1uAt
         a54Ntt8HDwrRQrnpQTW1JJOoK0edRfG5880M/o6me2MEEkUUcDfTRX8V8IwE0/xaew1F
         Bx2X8gbxfKiMHZw87dqfURHKdrOrnOaPZmQ2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=CfI+aS6y4iMTulkDqQarRkebffB8tDxH/4QWxO6dzsQ=;
        b=QNg4pVa6thyt2Mwdo4T5sFZDM9V9xobVB7K+ZeP2kAaT4VuPQarVm5tStthcFGiVlm
         z7c4x5CRh4TbtzZlslwKpxbcARUH1XkDwe7hbgq2Fy3q4VL+r0SylnU2vwYClBJhqBaz
         OQtx0HIp2GhfdgRpBfF2H9IZCqIJ2JwZ7KHaiPS1KFtbG1+BPrfEAO5781aK9B02bqm5
         nq5JMa/aZLhpmebWgS45aRrj4y3KwY16e3K/NPiPCSNsJffTlFKdTp6ALPes+uXYEjCu
         1V1fmEN+sfXbqXc1HMcCbNUBw1UT+zx+ao0ye5OcBm9EScjCTwA/Bke63UKYy1BhOj8X
         PkTA==
X-Gm-Message-State: AOAM530hbHBQ2uIOKJxDIVaUqB8dlvjWGDQE4Z4WBShcEILaqkrJR7ci
	ktZ8xIVrGqKzu4mKR3K7df+rlg==
X-Google-Smtp-Source: 
 ABdhPJwjSMxMkKl1iwgE1pFCDv69RGbKa6uNrPtEMCEXyps7enSH5DAjr5I1el+51Moq+h0pTbqauQ==
X-Received: by 2002:a05:600c:2258:b0:394:2045:bed with SMTP id
 a24-20020a05600c225800b0039420450bedmr10351701wmm.174.1652563861753;
        Sat, 14 May 2022 14:31:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9136:b992:97dc:d32d?
 ([2001:8b0:aba:5f3c:9136:b992:97dc:d32d])
        by smtp.gmail.com with ESMTPSA id
 p19-20020adf9d93000000b0020d048c75e0sm473129wre.112.2022.05.14.14.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:31:01 -0700 (PDT)
Message-ID: 
 <c5c1d238df20f6563c9a4bc5c4e5794eda01bfec.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ovmf: Fix native build with gcc-12
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 14 May 2022 22:31:00 +0100
In-Reply-To: <16EEF7C2A0110441.10172@lists.openembedded.org>
References: <20220513162244.577710-1-raj.khem@gmail.com>
	 <16EEF7C2A0110441.10172@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 May 2022 21:31:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165595

On Sat, 2022-05-14 at 13:15 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2022-05-13 at 09:22 -0700, Khem Raj wrote:
> > Host distros have started deploying gcc12 as well e.g. archlinux
> > this build failure shows up which has been fixed upstream
> >=20
> > In function =E2=80=98GetAlignmentFromFile=E2=80=99,
> >     inlined from =E2=80=98main=E2=80=99 at GenFfs.c:816:20:
> > GenFfs.c:545:5: error: pointer =E2=80=98InFileHandle=E2=80=99 used afte=
r =E2=80=98fclose=E2=80=99 [-Werror=3Duse-after-free]
> >   545 |     Error(NULL, 0, 4001, "Resource", "memory cannot be allocate=
d  of %s", InFileHandle);
> >       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
> >=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../0001-BaseTools-fix-gcc12-warning-1.patch  | 51 +++++++++++++++++++
> >  .../0001-BaseTools-fix-gcc12-warning.patch    | 49 ++++++++++++++++++
> >  meta/recipes-core/ovmf/ovmf_git.bb            |  6 +++
> >  3 files changed, 106 insertions(+)
> >  create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc1=
2-warning-1.patch
> >  create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc1=
2-warning.patch
> >=20
> > diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warni=
ng-1.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1=
.patch
> > new file mode 100644
> > index 00000000000..23366b4d078
> > --- /dev/null
> > +++ b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1.pa=
tch
> > @@ -0,0 +1,51 @@
> > +From b0a0b7b605aeb8106e7b50d1efeb746f401498cc Mon Sep 17 00:00:00 2001
> > +From: Gerd Hoffmann <kraxel@redhat.com>
> > +Date: Thu, 24 Mar 2022 20:04:35 +0800
> > +Subject: [PATCH] BaseTools: fix gcc12 warning
> > +
> > +Sdk/C/LzmaEnc.c: In function ?LzmaEnc_CodeOneMemBlock?:
> > +Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable =
?outStream? in ?*p.rc.outStream? [-Werror=3Ddangling-pointer=3D]
> > + 2828 |   p->rc.outStream =3D &outStream.vt;
> > +      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
> > +Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
> > + 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
> > +      |                            ^~~~~~~~~
> > +Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
> > +Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable =
?outStream? in ?*(CLzmaEnc *)pp.rc.outStream? [-Werror=3Ddangling-pointer=
=3D]
> > + 2828 |   p->rc.outStream =3D &outStream.vt;
> > +      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
> > +Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
> > + 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
> > +      |                            ^~~~~~~~~
> > +Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
> > +cc1: all warnings being treated as errors
> > +
> > +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/85=
021f8cf22d1bd4114803c6c610dea5ef0059f1]
> > +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > +Reviewed-by: Bob Feng <bob.c.feng@intel.com>
> > +---
> > + BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c | 3 ++-
> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c b/BaseToo=
ls/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> > +index 4e9b499f8d..4b9f5fa692 100644
> > +--- a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> > ++++ b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> > +@@ -2825,12 +2825,13 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHandle pp=
, BoolInt reInit,
> > +=20
> > +   nowPos64 =3D p->nowPos64;
> > +   RangeEnc_Init(&p->rc);
> > +-  p->rc.outStream =3D &outStream.vt;
> > +=20
> > +   if (desiredPackSize =3D=3D 0)
> > +     return SZ_ERROR_OUTPUT_EOF;
> > +=20
> > ++  p->rc.outStream =3D &outStream.vt;
> > +   res =3D LzmaEnc_CodeOneBlock(p, desiredPackSize, *unpackSize);
> > ++  p->rc.outStream =3D NULL;
> > +=20
> > +   *unpackSize =3D (UInt32)(p->nowPos64 - nowPos64);
> > +   *destLen -=3D outStream.rem;
> > +--=20
> > +2.36.1
> > +
> > diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warni=
ng.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.pat=
ch
> > new file mode 100644
> > index 00000000000..91c01647db2
> > --- /dev/null
> > +++ b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.patc=
h
> > @@ -0,0 +1,49 @@
> > +From 2435c17e56652479315853cec5b91fb0ea0911a3 Mon Sep 17 00:00:00 2001
> > +From: Gerd Hoffmann <kraxel@redhat.com>
> > +Date: Thu, 24 Mar 2022 20:04:34 +0800
> > +Subject: [PATCH] BaseTools: fix gcc12 warning
> > +
> > +GenFfs.c:545:5: error: pointer ?InFileHandle? used after ?fclose? [-We=
rror=3Duse-after-free]
> > +  545 |     Error(NULL, 0, 4001, "Resource", "memory cannot be allocat=
ed  of %s", InFileHandle);
> > +      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
> > +GenFfs.c:544:5: note: call to ?fclose? here
> > +  544 |     fclose (InFileHandle);
> > +      |     ^~~~~~~~~~~~~~~~~~~~~
> > +
> > +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/7b=
005f344e533cd913c3ca05b266f9872df886d1]
> > +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > +Reviewed-by: Bob Feng <bob.c.feng@intel.com>
> > +---
> > + BaseTools/Source/C/GenFfs/GenFfs.c | 2 +-
> > + BaseTools/Source/C/GenSec/GenSec.c | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/BaseTools/Source/C/GenFfs/GenFfs.c b/BaseTools/Source/C/G=
enFfs/GenFfs.c
> > +index 949025c333..d78d62ab36 100644
> > +--- a/BaseTools/Source/C/GenFfs/GenFfs.c
> > ++++ b/BaseTools/Source/C/GenFfs/GenFfs.c
> > +@@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignme=
nt)
> > +   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);
> > +   if (PeFileBuffer =3D=3D NULL) {
> > +     fclose (InFileHandle);
> > +-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of =
%s", InFileHandle);
> > ++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for =
%s", InFile);
> > +     return EFI_OUT_OF_RESOURCES;
> > +   }
> > +   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
> > +diff --git a/BaseTools/Source/C/GenSec/GenSec.c b/BaseTools/Source/C/G=
enSec/GenSec.c
> > +index d54a4f9e0a..b1d05367ec 100644
> > +--- a/BaseTools/Source/C/GenSec/GenSec.c
> > ++++ b/BaseTools/Source/C/GenSec/GenSec.c
> > +@@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Align=
ment)
> > +   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);
> > +   if (PeFileBuffer =3D=3D NULL) {
> > +     fclose (InFileHandle);
> > +-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of =
%s", InFileHandle);
> > ++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for =
%s", InFile);
> > +     return EFI_OUT_OF_RESOURCES;
> > +   }
> > +   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
> > +--=20
> > +2.36.1
> > +
> > diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovm=
f/ovmf_git.bb
> > index b15d40eac83..84e3360a3af 100644
> > --- a/meta/recipes-core/ovmf/ovmf_git.bb
> > +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> > @@ -15,12 +15,18 @@ PACKAGECONFIG +=3D "${@bb.utils.contains('MACHINE_F=
EATURES', 'tpm2', 'tpm', '', d)
> >  PACKAGECONFIG[secureboot] =3D ",,,"
> >  PACKAGECONFIG[tpm] =3D "-D TPM_ENABLE=3DTRUE,-D TPM_ENABLE=3DFALSE,,"
> > =20
> > +# GCC12 trips on it
> > +#see https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Baset=
ools-turn-off-gcc12-warning.patch
> > +BUILD_CFLAGS +=3D "-Wno-error=3Dstringop-overflow"
> > +
> >  SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=3Dmaster;pro=
tocol=3Dhttps \
> >             file://0001-ovmf-update-path-to-native-BaseTools.patch \
> >             file://0002-BaseTools-makefile-adjust-to-build-in-under-bit=
bake.patch \
> >             file://0003-ovmf-Update-to-latest.patch \
> >             file://0005-debug-prefix-map.patch \
> >             file://0006-reproducible.patch \
> > +           file://0001-BaseTools-fix-gcc12-warning.patch \
> > +           file://0001-BaseTools-fix-gcc12-warning-1.patch \
> >             "
> > =20
> >  PV =3D "edk2-stable202202"
>=20
> I think this may cause the efi failures in:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3583/st=
eps/14/logs/stdio
>=20
> (and all the other similar oe-selftest runs)

I'm going to retract that, further testing shows it is something else,
still not sure what.

Cheers,

Richard



