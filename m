Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B387C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 16:22:58 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.261.1652458968169576139
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 09:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gyGNA8hI;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id x23so8093540pff.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 09:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gkrJZW1o5VWn9yceoBVtt+Th9SHIlBWdw+IMHBQ3Nqk=;
        b=gyGNA8hIGbH3nYWweO8ofkQGHXWWfIJC3I+c38qfC+9wCGV7HKY3USmenMqJ2xC0ax
         WASibpRCIL+QYLEMeW40tkNMH7R2ISrVhK5EEs8qgTm29OOwIcJbYfud2rhTPhuK/oNj
         p3Y1o4oOQqnGYttt7cjaFZZwti77TbWzt/nW15z3xU3HUoTQ1Goc/5oHQUcsQKEzIY5l
         hFto5Qjp1gr2gC1sU4EtYuYaNitksyZuFAKrn4t8mBZu4tzECB9NPcNyhKTY9aOrc6d5
         HZ3HqcVgo1obbX9IU2iEg/axO+0ThA6/i2/YudgBH84thBU5Pc09BVJpWAo4cPX+dsZr
         O/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gkrJZW1o5VWn9yceoBVtt+Th9SHIlBWdw+IMHBQ3Nqk=;
        b=WFnU/op3VJjMLpA1w13TgKRxmRg2pXdK/P1lP6R7yw/vzddjIw1ecYSmAM+qWoKkpo
         6R3i6u7Bi8L3td/67kMd8XrJ309qSGJ58sGsBW2k/2FgM377VuSteRzCXcNExsroEsew
         JCjjHi2M49veFiPw9RkA42+X7BNbcK4RDRSg/89dPfyWWH9jhHzu6FQDiEZgvRjxL+l5
         kARIk6+D+OgmwRXG/M9ZFExQl7ognJIyKscrSqozrHBHJnXVncICMYWZe2ynvm9dyCio
         B3asBSlauwm7k+SmuLiYuIM3240UqDkdYfCmrTapN3RPKQiNS0fBP+XL0y1czC6L0xHW
         L5BA==
X-Gm-Message-State: AOAM531y8e2uK5aTTWQRe8zKlFXBBsZ/DEEcwklAGomJmEsaBMerohXt
	mFND71GKJKmnxXJPVMQ4rMUqkkJDMuXdKw==
X-Google-Smtp-Source: 
 ABdhPJzemtuADc0OYpgJKNukwHWjkF2BRECCcQqAA+8xKA9jihnaK/qDBILMjiQPIAy1t42BwKS9fw==
X-Received: by 2002:a65:6d16:0:b0:3c1:b056:5f5a with SMTP id
 bf22-20020a656d16000000b003c1b0565f5amr4514201pgb.469.1652458967176;
        Fri, 13 May 2022 09:22:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a622904000000b0050dc76281d0sm2007475pfp.170.2022.05.13.09.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 09:22:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ovmf: Fix native build with gcc-12
Date: Fri, 13 May 2022 09:22:44 -0700
Message-Id: <20220513162244.577710-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 16:22:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165579

Host distros have started deploying gcc12 as well e.g. archlinux
this build failure shows up which has been fixed upstream

In function =E2=80=98GetAlignmentFromFile=E2=80=99,
    inlined from =E2=80=98main=E2=80=99 at GenFfs.c:816:20:
GenFfs.c:545:5: error: pointer =E2=80=98InFileHandle=E2=80=99 used after =
=E2=80=98fclose=E2=80=99 [-Werror=3Duse-after-free]
  545 |     Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  o=
f %s", InFileHandle);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-BaseTools-fix-gcc12-warning-1.patch  | 51 +++++++++++++++++++
 .../0001-BaseTools-fix-gcc12-warning.patch    | 49 ++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  6 +++
 3 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-wa=
rning-1.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-wa=
rning.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1=
.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1.pat=
ch
new file mode 100644
index 00000000000..23366b4d078
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1.patch
@@ -0,0 +1,51 @@
+From b0a0b7b605aeb8106e7b50d1efeb746f401498cc Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 24 Mar 2022 20:04:35 +0800
+Subject: [PATCH] BaseTools: fix gcc12 warning
+
+Sdk/C/LzmaEnc.c: In function ?LzmaEnc_CodeOneMemBlock?:
+Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable ?out=
Stream? in ?*p.rc.outStream? [-Werror=3Ddangling-pointer=3D]
+ 2828 |   p->rc.outStream =3D &outStream.vt;
+      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
+Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
+ 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
+      |                            ^~~~~~~~~
+Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
+Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable ?out=
Stream? in ?*(CLzmaEnc *)pp.rc.outStream? [-Werror=3Ddangling-pointer=3D]
+ 2828 |   p->rc.outStream =3D &outStream.vt;
+      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
+Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
+ 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
+      |                            ^~~~~~~~~
+Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
+cc1: all warnings being treated as errors
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/85021f=
8cf22d1bd4114803c6c610dea5ef0059f1]
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Bob Feng <bob.c.feng@intel.com>
+---
+ BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c b/BaseTools/S=
ource/C/LzmaCompress/Sdk/C/LzmaEnc.c
+index 4e9b499f8d..4b9f5fa692 100644
+--- a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
++++ b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
+@@ -2825,12 +2825,13 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHandle pp, Bo=
olInt reInit,
+ =0D
+   nowPos64 =3D p->nowPos64;=0D
+   RangeEnc_Init(&p->rc);=0D
+-  p->rc.outStream =3D &outStream.vt;=0D
+ =0D
+   if (desiredPackSize =3D=3D 0)=0D
+     return SZ_ERROR_OUTPUT_EOF;=0D
+ =0D
++  p->rc.outStream =3D &outStream.vt;=0D
+   res =3D LzmaEnc_CodeOneBlock(p, desiredPackSize, *unpackSize);=0D
++  p->rc.outStream =3D NULL;=0D
+ =0D
+   *unpackSize =3D (UInt32)(p->nowPos64 - nowPos64);=0D
+   *destLen -=3D outStream.rem;=0D
+--=20
+2.36.1
+
diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.p=
atch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.patch
new file mode 100644
index 00000000000..91c01647db2
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.patch
@@ -0,0 +1,49 @@
+From 2435c17e56652479315853cec5b91fb0ea0911a3 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 24 Mar 2022 20:04:34 +0800
+Subject: [PATCH] BaseTools: fix gcc12 warning
+
+GenFfs.c:545:5: error: pointer ?InFileHandle? used after ?fclose? [-Werror=
=3Duse-after-free]
+  545 |     Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  =
of %s", InFileHandle);
+      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
+GenFfs.c:544:5: note: call to ?fclose? here
+  544 |     fclose (InFileHandle);
+      |     ^~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/7b005f=
344e533cd913c3ca05b266f9872df886d1]
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Bob Feng <bob.c.feng@intel.com>
+---
+ BaseTools/Source/C/GenFfs/GenFfs.c | 2 +-
+ BaseTools/Source/C/GenSec/GenSec.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/BaseTools/Source/C/GenFfs/GenFfs.c b/BaseTools/Source/C/GenFf=
s/GenFfs.c
+index 949025c333..d78d62ab36 100644
+--- a/BaseTools/Source/C/GenFfs/GenFfs.c
++++ b/BaseTools/Source/C/GenFfs/GenFfs.c
+@@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)
+   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);=0D
+   if (PeFileBuffer =3D=3D NULL) {=0D
+     fclose (InFileHandle);=0D
+-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s",=
 InFileHandle);=0D
++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s",=
 InFile);=0D
+     return EFI_OUT_OF_RESOURCES;=0D
+   }=0D
+   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);=0D
+diff --git a/BaseTools/Source/C/GenSec/GenSec.c b/BaseTools/Source/C/GenSe=
c/GenSec.c
+index d54a4f9e0a..b1d05367ec 100644
+--- a/BaseTools/Source/C/GenSec/GenSec.c
++++ b/BaseTools/Source/C/GenSec/GenSec.c
+@@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)
+   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);=0D
+   if (PeFileBuffer =3D=3D NULL) {=0D
+     fclose (InFileHandle);=0D
+-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s",=
 InFileHandle);=0D
++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s",=
 InFile);=0D
+     return EFI_OUT_OF_RESOURCES;=0D
+   }=0D
+   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);=0D
+--=20
+2.36.1
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index b15d40eac83..84e3360a3af 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -15,12 +15,18 @@ PACKAGECONFIG +=3D "${@bb.utils.contains('MACHINE_FEATU=
RES', 'tpm2', 'tpm', '', d)
 PACKAGECONFIG[secureboot] =3D ",,,"
 PACKAGECONFIG[tpm] =3D "-D TPM_ENABLE=3DTRUE,-D TPM_ENABLE=3DFALSE,,"
=20
+# GCC12 trips on it
+#see https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Basetools=
-turn-off-gcc12-warning.patch
+BUILD_CFLAGS +=3D "-Wno-error=3Dstringop-overflow"
+
 SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=3Dmaster;protoco=
l=3Dhttps \
            file://0001-ovmf-update-path-to-native-BaseTools.patch \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake=
.patch \
            file://0003-ovmf-Update-to-latest.patch \
            file://0005-debug-prefix-map.patch \
            file://0006-reproducible.patch \
+           file://0001-BaseTools-fix-gcc12-warning.patch \
+           file://0001-BaseTools-fix-gcc12-warning-1.patch \
            "
=20
 PV =3D "edk2-stable202202"
--=20
2.36.1


