Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79A8FF8855
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 21:15:55 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32995.1777065348647314845
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 14:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nKT9QB3l;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so135664815e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 14:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777065347; x=1777670147; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrJLJNySB8fQEibliHf5DAyRt6PTtQ3kbgpw8uwM94w=;
        b=nKT9QB3lxMxK5WbFBiLV6QUrE32oreerLX5XASy0BWbpaJ2sTyK8YEdRP5Tjy4WtCR
         sHCsMRb+gcd7eqrFO6xX4pSvTeuXUcpU3Ci6HbNTbtkBP2k26tPzxI3/VmuobAyFEQq7
         JRKjX/TofBYuCo+Q8BY+SF90cy+3ZdUnbU4RA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777065347; x=1777670147;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TrJLJNySB8fQEibliHf5DAyRt6PTtQ3kbgpw8uwM94w=;
        b=fuFujyPYnuipgZGuvxHxtfa4zXXnhHlPwP/0a6P8nIjdZrsnvMEWc9k/NZkdxHRaGv
         8py5ylGiNuaGm/cT5IJtZjN036t5C6kcZmBP3Dto1uPB6ndj8SedQoTfhGbdGHBL63A2
         IxTtv4+VYXXFRXj7Bx3l+lOXvE7SUoh+QexmiRMQA+gzR3vwJpPLotCmc2nUb5S1yP2p
         XNOHLg+M88uPcdBXgubklVcTKY/dw6Vin4+XHWQq9lNdHNJkll7EyOwAqm8GlzISeAcz
         VHGxg0oR9wNhLcjtcCiyas0fe/2ZGp7/S3bS+A9LCwGAx9bG4zclIoKy/jrADmvwbNf+
         +pyA==
X-Forwarded-Encrypted: i=1; AFNElJ/BfX4UGMwtI9WWhcrLB9hx2Sbe9TWW2MpGHVTRjpeJb2ag2sIaeye5laaRpQzbyZipqFSiErwFNEaJS9YHGZ5LMg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwVLHJ3GmZQcgAzC7SAfEvD5V0i0NHaF4pbcy3lGc8FrMdPhKsx
	mLqNSYA2cz117ijZFOc6Mr3EQ0R+V/wfvTBmgxeJQK3hXVwoGADM3DAOZTW7nPa1gbc2Fgu+WSW
	7z5HviXIju7if
X-Gm-Gg: AeBDieuL+M0heW76/FD0P+CyijRw38Tzp1WKT1q5w2Lw6gkVXO+JcyyRLVQz//Nd3Al
	SvxezFzzk89/NUQ5v9JzZI42j3XibJsaETA8jfKoK3BePr7YyAD6tJwCc5LFbfpM2K24mKbfOVx
	cSB9A4Gb25AG58uSFs2IxH4688VYmr7Am+YUzBNhXPnbV9c9FDdrP4jzL5PTf/g7BiqBqKlBqTX
	/kTPu5Nbx36CtZ6vPMwRF9CZ7bf6xyUdqUV70uznoJqkXwWTHjdGOWotWj14qYsiXApTc99rsh9
	fe9Y4USEB3vM0gvBVESg4EnAdhyyjts7QzwrTk7rdJSlCW9FfoTxi88xuzLoiT0DOjOFwV9aT7+
	6UB3RzOp3XKMxIz+e2Ti2Fxi8++Qa3ni9I2aakWpv6C5BvvNkLmbO/GMud/qdcE1gaKih+I8bwW
	o35cA/FOxk3+JuQKW/hPHD+5EdApKcz2HxS+LWhpa8I20A6em344YXJoRtqjeeuyWQHrriW1J7/
	wSs0wInsaoVK1a1gUaBuP/aSg==
X-Received: by 2002:a05:600c:8b38:b0:488:b14f:b8ed with SMTP id 5b1f17b1804b1-488fb6e815amr486918885e9.0.1777065346915;
        Fri, 24 Apr 2026 14:15:46 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb75ab25sm190349055e9.11.2026.04.24.14.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 14:15:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 23:15:45 +0200
Message-Id: <DI1P39S0V3L3.3HVBRCKGI9CPF@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap 37/66] ovmf: backport a fix for build with
 gcc-16
X-Mailer: aerc 0.20.0
References: <cover.1777064068.git.yoann.congal@smile.fr>
 <7de54889b3547a94bc7c6015731ec1c099e4d629.1777064068.git.yoann.congal@smile.fr>
In-Reply-To: <7de54889b3547a94bc7c6015731ec1c099e4d629.1777064068.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 21:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235941

On Fri Apr 24, 2026 at 10:55 PM CEST, Yoann Congal wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
>
> Fixes build on host with gcc-16:
>
> StringFuncs.c: In function =E2=80=98SplitStringByWhitespace=E2=80=99:
> StringFuncs.c:113:15: error: variable =E2=80=98Item=E2=80=99 set but not =
used [-Werror=3Dunused-but-set-variable=3D]
>   113 |   UINTN       Item;
>       |               ^~~~
>
> and
>
> EfiRom.c: In function =E2=80=98main=E2=80=99:
> EfiRom.c:78:17: error: assignment discards =E2=80=98const=E2=80=99 qualif=
ier from pointer target type [-Werror=3Ddiscarded-qualifiers]
>    78 |       if ((Ptr0 =3D strstr ((CONST CHAR8 *) mOptions.FileList->Fi=
leName, DEFAULT_OUTPUT_EXTENSION)) !=3D NULL) {
>       |                 ^
>
> and one more for older version used in scarthgap
>
> main.c: In function =E2=80=98ProcessArgs=E2=80=99:
> main.c:163:42: error: too many arguments to function =E2=80=98p->process=
=E2=80=99; expected 0, have 2
>   163 |                                         (*p->process)( *argv, *(a=
rgv+1) );
>       |                                         ~^~~~~~~~~~~~  ~~~~~
> main.c:120:34: note: declared here
>   120 |                         WildFunc process;
>       |                                  ^~~~~~~
> main.c:168:42: error: too many arguments to function =E2=80=98p->process=
=E2=80=99; expected 0, have 1
>   168 |                                         (*p->process)( *argv );
>       |                                         ~^~~~~~~~~~~~  ~~~~~
> main.c:120:34: note: declared here
>   120 |                         WildFunc process;
>       |                                  ^~~~~~~
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> [YC: upstream commit a1db482ecd2824a4ae67a3c2a8e607b607ab4a43]
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>

This patch contains weird line endings and might fail to apply when
using mails.

You will find it on my branch here:
ovmf: backport a fix for build with gcc-16 - openembedded-core-contrib - Op=
enEmbedded Core user contribution trees
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/s=
carthgap-nut&id=3D7de54889b3547a94bc7c6015731ec1c099e4d629

Regards,

> ---
>  ...Tools-StringFuncs-fix-gcc-16-warning.patch | 42 ++++++++++++++++++
>  ...aseTools-EfiRom-fix-compiler-warning.patch | 44 +++++++++++++++++++
>  .../0008-BaseTools-Pccts-set-C-standard.patch | 44 +++++++++++++++++++
>  meta/recipes-core/ovmf/ovmf_git.bb            |  3 ++
>  4 files changed, 133 insertions(+)
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0006-BaseTools-StringFunc=
s-fix-gcc-16-warning.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0007-BaseTools-EfiRom-fix=
-compiler-warning.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0008-BaseTools-Pccts-set-=
C-standard.patch
>
> diff --git a/meta/recipes-core/ovmf/ovmf/0006-BaseTools-StringFuncs-fix-g=
cc-16-warning.patch b/meta/recipes-core/ovmf/ovmf/0006-BaseTools-StringFunc=
s-fix-gcc-16-warning.patch
> new file mode 100644
> index 00000000000..a465dede9c3
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/0006-BaseTools-StringFuncs-fix-gcc-16-w=
arning.patch
> @@ -0,0 +1,42 @@
> +From 015c26aea52a54e96319887ea542870b4804fb91 Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Thu, 29 Jan 2026 09:23:32 +0100
> +Subject: [PATCH] BaseTools/StringFuncs: fix gcc 16 warning
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +StringFuncs.c: In function =E2=80=98SplitStringByWhitespace=E2=80=99:
> +StringFuncs.c:113:15: error: variable =E2=80=98Item=E2=80=99 set but not=
 used [-Werror=3Dunused-but-set-variable=3D]
> +  113 |   UINTN       Item;
> +      |               ^~~~
> +
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +
> +Upstream-Status: Backport [edk2-stable202602 https://github.com/tianocor=
e/edk2/commit/3597306191297b504683b83fe7750e49c6a2e836]
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +---
> + BaseTools/Source/C/Common/StringFuncs.c | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/BaseTools/Source/C/Common/StringFuncs.c b/BaseTools/Source/=
C/Common/StringFuncs.c
> +index 53e44365e9..df02d9c808 100644
> +--- a/BaseTools/Source/C/Common/StringFuncs.c
> ++++ b/BaseTools/Source/C/Common/StringFuncs.c
> +@@ -110,7 +110,6 @@ SplitStringByWhitespace (
> +   CHAR8       *EndOfSubString;
> +   CHAR8       *EndOfString;
> +   STRING_LIST *Output;
> +-  UINTN       Item;
> +=20
> +   String =3D CloneString (String);
> +   if (String =3D=3D NULL) {
> +@@ -120,7 +119,7 @@ SplitStringByWhitespace (
> +=20
> +   Output =3D NewStringList ();
> +=20
> +-  for (Pos =3D String, Item =3D 0; Pos < EndOfString; Item++) {
> ++  for (Pos =3D String; Pos < EndOfString;) {
> +     while (isspace ((int)*Pos)) {
> +       Pos++;
> +     }
> diff --git a/meta/recipes-core/ovmf/ovmf/0007-BaseTools-EfiRom-fix-compil=
er-warning.patch b/meta/recipes-core/ovmf/ovmf/0007-BaseTools-EfiRom-fix-co=
mpiler-warning.patch
> new file mode 100644
> index 00000000000..7aaafe6efbf
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/0007-BaseTools-EfiRom-fix-compiler-warn=
ing.patch
> @@ -0,0 +1,44 @@
> +From 4d2bdadcd6d45f6708b1b4827b0dc9b6e4b8edd2 Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Mon, 8 Dec 2025 10:28:50 +0100
> +Subject: [PATCH] BaseTools/EfiRom: fix compiler warning
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +New warning after updating gcc:
> +
> +EfiRom.c: In function =E2=80=98main=E2=80=99:
> +EfiRom.c:78:17: error: assignment discards =E2=80=98const=E2=80=99 quali=
fier from pointer target type [-Werror=3Ddiscarded-qualifiers]
> +
> +The assigned value is not used, so fix the warning by just removing it.
> +
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +
> +Upstream-Status: Backport [edk2-stable202602 https://github.com/tianocor=
e/edk2/commit/9af06ef3cbb052b142f9660c2c01e7aeb401300c]
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +---
> + BaseTools/Source/C/EfiRom/EfiRom.c | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/BaseTools/Source/C/EfiRom/EfiRom.c b/BaseTools/Source/C/Efi=
Rom/EfiRom.c
> +index fa7bf0e62e..6e903b3504 100644
> +--- a/BaseTools/Source/C/EfiRom/EfiRom.c
> ++++ b/BaseTools/Source/C/EfiRom/EfiRom.c
> +@@ -44,7 +44,6 @@ Returns:
> +   FILE_LIST *FList;
> +   UINT32    TotalSize;
> +   UINT32    Size;
> +-  CHAR8     *Ptr0;
> +=20
> +   SetUtilityName(UTILITY_NAME);
> +=20
> +@@ -75,7 +74,7 @@ Returns:
> +   //
> +   if (mOptions.DumpOption =3D=3D 1) {
> +     if (mOptions.FileList !=3D NULL) {
> +-      if ((Ptr0 =3D strstr ((CONST CHAR8 *) mOptions.FileList->FileName=
, DEFAULT_OUTPUT_EXTENSION)) !=3D NULL) {
> ++      if (strstr ((CONST CHAR8 *) mOptions.FileList->FileName, DEFAULT_=
OUTPUT_EXTENSION) !=3D NULL) {
> +         DumpImage (mOptions.FileList);
> +         goto BailOut;
> +       } else {
> diff --git a/meta/recipes-core/ovmf/ovmf/0008-BaseTools-Pccts-set-C-stand=
ard.patch b/meta/recipes-core/ovmf/ovmf/0008-BaseTools-Pccts-set-C-standard=
.patch
> new file mode 100644
> index 00000000000..de4ccb8a47d
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/0008-BaseTools-Pccts-set-C-standard.pat=
ch
> @@ -0,0 +1,44 @@
> +From 74bc6545e72707a47dd9dae42ce33b8877b10000 Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Mon, 20 Jan 2025 09:40:31 +0100
> +Subject: [PATCH] BaseTools/Pccts: set C standard
> +
> +The prehistoric code base doesn't build with ISO C23.  Set the C
> +standard to C11 (for both clang and gcc) so it continues to build with
> +gcc 15 (which uses C23 by default).
> +
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +
> +Upstream-Status: Backport [edk2-stable202502 https://github.com/tianocor=
e/edk2/commit/e063f8b8a53861043b9872cc35b08a3dc03b0942]
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +---
> + BaseTools/Source/C/VfrCompile/Pccts/antlr/makefile | 2 +-
> + BaseTools/Source/C/VfrCompile/Pccts/dlg/makefile   | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/BaseTools/Source/C/VfrCompile/Pccts/antlr/makefile b/BaseTo=
ols/Source/C/VfrCompile/Pccts/antlr/makefile
> +index 746d58b5e2..b47c8a37af 100644
> +--- a/BaseTools/Source/C/VfrCompile/Pccts/antlr/makefile
> ++++ b/BaseTools/Source/C/VfrCompile/Pccts/antlr/makefile
> +@@ -169,7 +169,7 @@ ANTLR=3D${BIN_DIR}/antlr
> + DLG=3D${BIN_DIR}/dlg
> + OBJ_EXT=3Do
> + OUT_OBJ =3D -o
> +-CFLAGS=3D $(COPT) -I. -I$(SET) -I$(PCCTS_H) -DUSER_ZZSYN $(COTHER) -DZZ=
LEXBUFSIZE=3D65536
> ++CFLAGS=3D $(COPT) -I. -I$(SET) -I$(PCCTS_H) -DUSER_ZZSYN $(COTHER) -DZZ=
LEXBUFSIZE=3D65536 -std=3Dgnu11
> + CPPFLAGS=3D
> + #
> + # SGI Users, use this CFLAGS
> +diff --git a/BaseTools/Source/C/VfrCompile/Pccts/dlg/makefile b/BaseTool=
s/Source/C/VfrCompile/Pccts/dlg/makefile
> +index e45ac98e04..d72bee3d70 100644
> +--- a/BaseTools/Source/C/VfrCompile/Pccts/dlg/makefile
> ++++ b/BaseTools/Source/C/VfrCompile/Pccts/dlg/makefile
> +@@ -123,7 +123,7 @@ endif
> + COPT=3D-O
> + ANTLR=3D${BIN_DIR}/antlr
> + DLG=3D${BIN_DIR}/dlg
> +-CFLAGS=3D $(COPT) -I. -I$(SET) -I$(PCCTS_H) -DUSER_ZZSYN -DZZLEXBUFSIZE=
=3D65536
> ++CFLAGS=3D $(COPT) -I. -I$(SET) -I$(PCCTS_H) -DUSER_ZZSYN -DZZLEXBUFSIZE=
=3D65536 -std=3Dgnu11
> + CPPFLAGS=3D
> + OBJ_EXT=3Do
> + OUT_OBJ =3D -o
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
> index 319f03a8d2a..badde30d97e 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -26,6 +26,9 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;bran=
ch=3Dmaster;protocol=3Dhttps \
>             file://0004-reproducible.patch \
>             file://0001-MdePkg-Fix-overflow-issue-in-BasePeCoffLib.patch =
\
>             file://0001-MdeModulePkg-Potential-UINT32-overflow-in-S3-Resu=
meC.patch \
> +           file://0006-BaseTools-StringFuncs-fix-gcc-16-warning.patch \
> +           file://0007-BaseTools-EfiRom-fix-compiler-warning.patch \
> +           file://0008-BaseTools-Pccts-set-C-standard.patch \
>             "
> =20
>  PV =3D "edk2-stable202402"


--=20
Yoann Congal
Smile ECS


