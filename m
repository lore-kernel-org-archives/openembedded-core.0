Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E587ACCA47A
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:53:03 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.1571.1654188781214858912
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=pB9veLOM;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id e66so5214264pgc.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WGQnQFxwwidFi9+FstFI97h0TjxCfGxkI/rZoQfFNQI=;
        b=pB9veLOMPpDtPAeawhXwz5FIrrpA4Bop3YIbkZ8E8hOYQIxrjtXF6CCUS8K3WTm/FO
         quIIhIqfd2QDozhUTO39lrSG6hTatAxt6cn7UWJfVF80hbthi/H1T2fESGBBUBuWydWZ
         ZGKyboMN6bMcFlrwsc2Ke8W3MvLcU6eTP5hDyNDE3tvKLUXfmDOOuhZnRZraZjTwgTPa
         f59i/Nm1fa+R5B667/IBEetQyircXi8y3rghB/oHhZZBaU+1D7FOiev4Q2mQsFaoUBS6
         yeXlqF5BcrO0ozKyOAVaWYNJ5WMzyOYinJB5UCsVupoBRnbZHwr4oQ8nxPg6Xtuz6+0r
         JT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WGQnQFxwwidFi9+FstFI97h0TjxCfGxkI/rZoQfFNQI=;
        b=OGh3a9tAK6J9CBME3wmyRqSkM40c70rkmnSgoWR0YZ3J52DssGSVijfAfuU9a8qk+9
         ViuwZCHf5F8vscYAZTak+nVXTypGb+txSypc0CXgfSDby9xrcQ2brya6GskXjplcTpgi
         MdlgkrTeYGaYglux3A2qwZlLtldzl7WGHDBfuh1YOR22B+m6iZ8nv8Wys1A4RGkpxTL4
         KIAVq3MQyKDp8VvhSarKWKecPbYF2Ej5vco8LU7eL4k7JCaKV/Y+uHRr1Nkds0vooCiX
         a31tjTKuQQI6fUBI7TE8w30h4UO070KZg5zE1rQGq/e7YHfejYBn+V+J5cod2l2TxD+y
         UgBw==
X-Gm-Message-State: AOAM533eoYNSLTj2fPDRrR8V3R8ZqpeoElGM5yawnC3c0A/9tfi2VZaP
	/Y9l4zMiwwb4pWrcN3ndootx5p9TGx3USi7T
X-Google-Smtp-Source: 
 ABdhPJwzlHEfQANLUIwnakgxYHTMI8yzF8zWneflD7qLcTdZd97qSqpxNkjXrEE0VgB+3DR5ZmqSsg==
X-Received: by 2002:a62:878b:0:b0:51b:c452:33cf with SMTP id
 i133-20020a62878b000000b0051bc45233cfmr5219367pfe.72.1654188779939;
        Thu, 02 Jun 2022 09:52:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.52.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:52:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/26] ovmf: Fix native build with gcc-12
Date: Thu,  2 Jun 2022 06:51:52 -1000
Message-Id: 
 <d28d84c5b43ffcc312808af085d949e403805aca.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:53:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166497

From: Khem Raj <raj.khem@gmail.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7b67f19d353d88107f52cceda3c858730ac1db54)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 0000000000..23366b4d07
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
index 0000000000..91c01647db
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
index b15d40eac8..84e3360a3a 100644
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
2.25.1


