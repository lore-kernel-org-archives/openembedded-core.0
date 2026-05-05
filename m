Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF983CD3444
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:59:03 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1055.1778000339488356116
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dZbYmrEN;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48d146705b4so14286455e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000337; x=1778605137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GCZJ9NT9+XkXePuvVNyWHrSnw/95Nqw5QoCR2by8MYc=;
        b=dZbYmrENbLWa7o/3TakOYdfsoBsQNVrFeruMg68n12dvC1GlcAD6N68cIjLuUpoZiO
         D1loY957qX1lNNPZkK5d6WtA2dfXsmKomRwdIgBo64D+ifJS3INRfa4sUgEw/p4Po33b
         GVqT+nTyoVvvNa+3pjwksQhep+6O5JI5a3BmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000337; x=1778605137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GCZJ9NT9+XkXePuvVNyWHrSnw/95Nqw5QoCR2by8MYc=;
        b=EFKDhHuzILKoM744DUdRX4rweqFvmYBaq0eDytL5bPOlcvsxfv7bdsGMdr2WYlXmgJ
         ppd6rlC9edGy0phhP0vLSPZhUwxdhgHO4gq1942oXuUCG7E5Fxca9zlzTOUunk4xc3YT
         s7jDEoPg8DpYqpqyaX24dCPPAQA8Pqv/sJm3Kl3LDSiu3PUJHYnDK119wpp5mJ2ajUDX
         Vyce+zduLyy7ZKXE2bxQkKrfbMjxZgjg/DU8K78gOWIksmzYs8LryG7q8GhrZcDf70i7
         3vHjzuwqm0TCRqdjq6WxjFuyqzLqr5Zc6T0tjIRT6b5DteC6DjLrKkiq94ncNJJdvSgJ
         lK8Q==
X-Gm-Message-State: AOJu0Yyk4fdgQ22DulSkeIG2bABi8fp1QARLQwlKSh+iEr+cuqjtmpHO
	e8G35rs9G//tP/YU0HDLiz1Dt6wn5rzOIL6X2BxRENT0SUfde4AGOh/aU1X52IZoQzmgSUqWJRv
	WA2tvqJ4=
X-Gm-Gg: AeBDieumi1+otW+CRLQfmo284YQXEcwwylVDqxgwrwBJv2P9UUibgbVKyg0LLSWdulR
	2G32p24gzTbjttpj0XluAQ28ceQn+JFelnjp1NMUY0SBqdyh31XNf3s3QVV5Mwb2HIC3u7en96f
	sjnvraR+D/iD3IQUDF0zFTTLwa9XrpWjtXmaFt5zFK6Jf6VxZkjqQ1y6WFI2uULxd4g74f8f5ob
	LfHqfrVaFli4DJEYmLw52ORLPBTaf1XU2N+k6Dd5CWP11gGPQEUwPGu7dkTNhwrZeXgClGCsSlg
	kvRy+GxsZbnbiCJeHo8ut+V0x6xhp1QRTiV1LIB627ESpLCVs3+Zp7rk6W3ARCSQSASFKrudREB
	DBioxr055HKH28D11Dnl7frghhVaNzV9aKr/kpF5a2XlYtUa0y3M4dm+Uz+5ts7xh7aeaHPO+wk
	ux9KywrrpqFzf4bi8cZVvwkKr8GZeN7/x8X8nx509BPBvg0sPJVd11dD3WBSXlHvx3GMoaE1ltC
	A/qANCBAxAIKLDZBRTrcjxExw==
X-Received: by 2002:a05:600c:a10d:b0:48a:563c:c8e0 with SMTP id 5b1f17b1804b1-48e51f21e7bmr973255e9.1.1778000337086;
        Tue, 05 May 2026 09:58:57 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.58.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:58:56 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/23] ovmf: fix CVE-2025-2296
Date: Tue,  5 May 2026 18:57:30 +0200
Message-ID: <09be6658833e7ac4143eeb26bdaf67c6c94e260a.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236504

From: Hongxu Jia <hongxu.jia@windriver.com>

According to [1], EDK2 contains a vulnerability in BIOS where an attacker m=
ay
cause =E2=80=9C Improper Input Validation=E2=80=9D by local access. Success=
ful exploitation of
this vulnerability could alter control flow in unexpected ways, potentially
allowing arbitrary command execution and impacting Confidentiality, Integri=
ty,
and Availability.

Backport patches from upstream [2] to fix CVE-2025-2296

Note: backport 0001-AmdSev-Halt-on-failed-blob-allocation.patch to apply
the CVE patches without confliction

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-2296
[2] https://github.com/tianocore/edk2/pull/10628

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 ...mdSev-Halt-on-failed-blob-allocation.patch | 159 ++++
 .../ovmf/ovmf/CVE-2025-2296-1.patch           | 762 ++++++++++++++++++
 .../ovmf/ovmf/CVE-2025-2296-2.patch           | 175 ++++
 .../ovmf/ovmf/CVE-2025-2296-3.patch           |  42 +
 .../ovmf/ovmf/CVE-2025-2296-4.patch           |  34 +
 .../ovmf/ovmf/CVE-2025-2296-5.patch           |  36 +
 .../ovmf/ovmf/CVE-2025-2296-6.patch           |  54 ++
 .../ovmf/ovmf/CVE-2025-2296-7.patch           | 124 +++
 .../ovmf/ovmf/CVE-2025-2296-8.patch           | 125 +++
 .../ovmf/ovmf/CVE-2025-2296-9.patch           | 108 +++
 meta/recipes-core/ovmf/ovmf_git.bb            |  10 +
 11 files changed, 1629 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-AmdSev-Halt-on-failed-=
blob-allocation.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-1.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-2.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-3.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-4.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-5.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-6.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-7.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-8.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-9.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-AmdSev-Halt-on-failed-blob-al=
location.patch b/meta/recipes-core/ovmf/ovmf/0001-AmdSev-Halt-on-failed-blo=
b-allocation.patch
new file mode 100644
index 0000000000..181ff3376a
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-AmdSev-Halt-on-failed-blob-allocatio=
n.patch
@@ -0,0 +1,159 @@
+From dbec8dc5ba6341d816ffd495fcd7eeece1716bb4 Mon Sep 17 00:00:00 2001
+From: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
+Date: Mon, 29 Apr 2024 20:07:19 +0000
+Subject: [PATCH] AmdSev: Halt on failed blob allocation
+
+A malicious host may be able to undermine the fw_cfg
+interface such that loading a blob fails.
+
+In this case rather than continuing to the next boot
+option, the blob verifier should halt.
+
+For non-confidential guests, the error should be non-fatal.
+
+Signed-off-by: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/10b4bb=
8d6d0c515ed9663691aea3684be8f7b0fc]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ .../BlobVerifierSevHashes.c                     | 17 ++++++++++++++++-
+ OvmfPkg/Include/Library/BlobVerifierLib.h       | 11 +++++++----
+ .../BlobVerifierLibNull/BlobVerifierNull.c      | 13 ++++++++-----
+ .../QemuKernelLoaderFsDxe.c                     |  9 ++++-----
+ 4 files changed, 35 insertions(+), 15 deletions(-)
+
+diff --git a/OvmfPkg/AmdSev/BlobVerifierLibSevHashes/BlobVerifierSevHashes=
.c b/OvmfPkg/AmdSev/BlobVerifierLibSevHashes/BlobVerifierSevHashes.c
+index 2e58794c3c..6477c5c3d3 100644
+--- a/OvmfPkg/AmdSev/BlobVerifierLibSevHashes/BlobVerifierSevHashes.c
++++ b/OvmfPkg/AmdSev/BlobVerifierLibSevHashes/BlobVerifierSevHashes.c
+@@ -80,6 +80,7 @@ FindBlobEntryGuid (
+   @param[in] BlobName           The name of the blob=0D
+   @param[in] Buf                The data of the blob=0D
+   @param[in] BufSize            The size of the blob in bytes=0D
++  @param[in] FetchStatus        The status of the previous blob fetch=0D
+ =0D
+   @retval EFI_SUCCESS           The blob was verified successfully.=0D
+   @retval EFI_ACCESS_DENIED     The blob could not be verified, and there=
fore=0D
+@@ -90,13 +91,27 @@ EFIAPI
+ VerifyBlob (=0D
+   IN  CONST CHAR16  *BlobName,=0D
+   IN  CONST VOID    *Buf,=0D
+-  IN  UINT32        BufSize=0D
++  IN  UINT32        BufSize,=0D
++  IN  EFI_STATUS    FetchStatus=0D
+   )=0D
+ {=0D
+   CONST GUID  *Guid;=0D
+   INT32       Remaining;=0D
+   HASH_TABLE  *Entry;=0D
+ =0D
++  // Enter a dead loop if the fetching of this blob=0D
++  // failed. This prevents a malicious host from=0D
++  // circumventing the following checks.=0D
++  if (EFI_ERROR (FetchStatus)) {=0D
++    DEBUG ((=0D
++      DEBUG_ERROR,=0D
++      "%a: Fetching blob failed.\n",=0D
++      __func__=0D
++      ));=0D
++=0D
++    CpuDeadLoop ();=0D
++  }=0D
++=0D
+   if ((mHashesTable =3D=3D NULL) || (mHashesTableSize =3D=3D 0)) {=0D
+     DEBUG ((=0D
+       DEBUG_ERROR,=0D
+diff --git a/OvmfPkg/Include/Library/BlobVerifierLib.h b/OvmfPkg/Include/L=
ibrary/BlobVerifierLib.h
+index 7e1af27574..09af1b77de 100644
+--- a/OvmfPkg/Include/Library/BlobVerifierLib.h
++++ b/OvmfPkg/Include/Library/BlobVerifierLib.h
+@@ -22,17 +22,20 @@
+   @param[in] BlobName           The name of the blob=0D
+   @param[in] Buf                The data of the blob=0D
+   @param[in] BufSize            The size of the blob in bytes=0D
++  @param[in] FetchStatus        The status of fetching this blob=0D
+ =0D
+-  @retval EFI_SUCCESS           The blob was verified successfully.=0D
+-  @retval EFI_ACCESS_DENIED     The blob could not be verified, and there=
fore=0D
+-                                should be considered non-secure.=0D
++  @retval EFI_SUCCESS           The blob was verified successfully or was=
 not=0D
++                                found in the hash table.=0D
++  @retval EFI_ACCESS_DENIED     Kernel hashes not supported but the boot =
can=0D
++                                continue safely.=0D
+ **/=0D
+ EFI_STATUS=0D
+ EFIAPI=0D
+ VerifyBlob (=0D
+   IN  CONST CHAR16  *BlobName,=0D
+   IN  CONST VOID    *Buf,=0D
+-  IN  UINT32        BufSize=0D
++  IN  UINT32        BufSize,=0D
++  IN  EFI_STATUS    FetchStatus=0D
+   );=0D
+ =0D
+ #endif=0D
+diff --git a/OvmfPkg/Library/BlobVerifierLibNull/BlobVerifierNull.c b/Ovmf=
Pkg/Library/BlobVerifierLibNull/BlobVerifierNull.c
+index e817c3cc95..db5320571c 100644
+--- a/OvmfPkg/Library/BlobVerifierLibNull/BlobVerifierNull.c
++++ b/OvmfPkg/Library/BlobVerifierLibNull/BlobVerifierNull.c
+@@ -16,18 +16,21 @@
+   @param[in] BlobName           The name of the blob=0D
+   @param[in] Buf                The data of the blob=0D
+   @param[in] BufSize            The size of the blob in bytes=0D
++  @param[in] FetchStatus        The status of the fetch of this blob=0D
+ =0D
+-  @retval EFI_SUCCESS           The blob was verified successfully.=0D
+-  @retval EFI_ACCESS_DENIED     The blob could not be verified, and there=
fore=0D
+-                                should be considered non-secure.=0D
++  @retval EFI_SUCCESS           The blob was verified successfully or was=
 not=0D
++                                found in the hash table.=0D
++  @retval EFI_ACCESS_DENIED     Kernel hashes not supported but the boot =
can=0D
++                                continue safely.=0D
+ **/=0D
+ EFI_STATUS=0D
+ EFIAPI=0D
+ VerifyBlob (=0D
+   IN  CONST CHAR16  *BlobName,=0D
+   IN  CONST VOID    *Buf,=0D
+-  IN  UINT32        BufSize=0D
++  IN  UINT32        BufSize,=0D
++  IN  EFI_STATUS    FetchStatus=0D
+   )=0D
+ {=0D
+-  return EFI_SUCCESS;=0D
++  return FetchStatus;=0D
+ }=0D
+diff --git a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c b/OvmfP=
kg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
+index 3c12085f6c..cf58c97cd2 100644
+--- a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
++++ b/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
+@@ -1042,6 +1042,7 @@ QemuKernelLoaderFsDxeEntrypoint (
+   KERNEL_BLOB  *CurrentBlob;=0D
+   KERNEL_BLOB  *KernelBlob;=0D
+   EFI_STATUS   Status;=0D
++  EFI_STATUS   FetchStatus;=0D
+   EFI_HANDLE   FileSystemHandle;=0D
+   EFI_HANDLE   InitrdLoadFile2Handle;=0D
+ =0D
+@@ -1060,15 +1061,13 @@ QemuKernelLoaderFsDxeEntrypoint (
+   //=0D
+   for (BlobType =3D 0; BlobType < KernelBlobTypeMax; ++BlobType) {=0D
+     CurrentBlob =3D &mKernelBlob[BlobType];=0D
+-    Status      =3D FetchBlob (CurrentBlob);=0D
+-    if (EFI_ERROR (Status)) {=0D
+-      goto FreeBlobs;=0D
+-    }=0D
++    FetchStatus =3D FetchBlob (CurrentBlob);=0D
+ =0D
+     Status =3D VerifyBlob (=0D
+                CurrentBlob->Name,=0D
+                CurrentBlob->Data,=0D
+-               CurrentBlob->Size=0D
++               CurrentBlob->Size,=0D
++               FetchStatus=0D
+                );=0D
+     if (EFI_ERROR (Status)) {=0D
+       goto FreeBlobs;=0D
+--=20
+2.49.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-1.patch b/meta/recip=
es-core/ovmf/ovmf/CVE-2025-2296-1.patch
new file mode 100644
index 0000000000..5cdbb12f19
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-1.patch
@@ -0,0 +1,762 @@
+From 459f5ffa24ae8574657c4105af0ff7dc30ac428d Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Tue, 14 Jan 2025 17:36:39 +0100
+Subject: [PATCH 01/10] OvmfPkg/QemuKernelLoaderFsDxe: rework direct kernel
+ boot filesystem
+
+Split KERNEL_BLOB struct into two:
+
+ * One (KERNEL_BLOB_ITEMS) static array describing how to load (unnamed)
+   blobs from fw_cfg.
+ * And one (KERNEL_BLOB) dynamically allocated linked list carrying the
+   data blobs for the pseudo filesystem.
+
+Also add some debug logging.  Prefix most functions with 'QemuKernel'
+for consistency and easier log file grepping.  Add some small helper
+functions.
+
+This refactoring prepares for loading blobs in other ways.
+No (intentional) change in filesystem protocol behavior.
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+CVE: CVE-2025-2296
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/459f5f=
fa24ae8574657c4105af0ff7dc30ac428d]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ .../QemuKernelLoaderFsDxe.c                   | 345 +++++++++++-------
+ 1 file changed, 205 insertions(+), 140 deletions(-)
+
+diff --git a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c b/OvmfP=
kg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
+index cf58c97cd2..7ad1b3828f 100644
+--- a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
++++ b/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
+@@ -31,13 +31,6 @@
+ //=0D
+ // Static data that hosts the fw_cfg blobs and serves file requests.=0D
+ //=0D
+-typedef enum {=0D
+-  KernelBlobTypeKernel,=0D
+-  KernelBlobTypeInitrd,=0D
+-  KernelBlobTypeCommandLine,=0D
+-  KernelBlobTypeMax=0D
+-} KERNEL_BLOB_TYPE;=0D
+-=0D
+ typedef struct {=0D
+   CONST CHAR16    Name[8];=0D
+   struct {=0D
+@@ -45,11 +38,17 @@ typedef struct {
+     FIRMWARE_CONFIG_ITEM CONST    DataKey;=0D
+     UINT32                        Size;=0D
+   }                             FwCfgItem[2];=0D
+-  UINT32          Size;=0D
+-  UINT8           *Data;=0D
+-} KERNEL_BLOB;=0D
++} KERNEL_BLOB_ITEMS;=0D
++=0D
++typedef struct KERNEL_BLOB KERNEL_BLOB;=0D
++struct KERNEL_BLOB {=0D
++  CHAR16         Name[8];=0D
++  UINT32         Size;=0D
++  UINT8          *Data;=0D
++  KERNEL_BLOB    *Next;=0D
++};=0D
+ =0D
+-STATIC KERNEL_BLOB  mKernelBlob[KernelBlobTypeMax] =3D {=0D
++STATIC KERNEL_BLOB_ITEMS  mKernelBlobItems[] =3D {=0D
+   {=0D
+     L"kernel",=0D
+     {=0D
+@@ -69,7 +68,9 @@ STATIC KERNEL_BLOB  mKernelBlob[KernelBlobTypeMax] =3D {
+   }=0D
+ };=0D
+ =0D
+-STATIC UINT64  mTotalBlobBytes;=0D
++STATIC KERNEL_BLOB  *mKernelBlobs;=0D
++STATIC UINT64       mKernelBlobCount;=0D
++STATIC UINT64       mTotalBlobBytes;=0D
+ =0D
+ //=0D
+ // Device path for the handle that incorporates our "EFI stub filesystem"=
.=0D
+@@ -117,7 +118,7 @@ STATIC EFI_TIME  mInitTime;
+ typedef struct {=0D
+   UINT64               Signature; // Carries STUB_FILE_SIG.=0D
+ =0D
+-  KERNEL_BLOB_TYPE     BlobType; // Index into mKernelBlob. KernelBlobTyp=
eMax=0D
++  KERNEL_BLOB          *Blob;    // Index into mKernelBlob. KernelBlobTyp=
eMax=0D
+                                  // denotes the root directory of the fil=
esystem.=0D
+ =0D
+   UINT64               Position; // Byte position for regular files;=0D
+@@ -177,7 +178,7 @@ typedef struct {
+ STATIC=0D
+ EFI_STATUS=0D
+ EFIAPI=0D
+-StubFileOpen (=0D
++QemuKernelStubFileOpen (=0D
+   IN EFI_FILE_PROTOCOL   *This,=0D
+   OUT EFI_FILE_PROTOCOL  **NewHandle,=0D
+   IN CHAR16              *FileName,=0D
+@@ -196,7 +197,7 @@ StubFileOpen (
+ STATIC=0D
+ EFI_STATUS=0D
+ EFIAPI=0D
+-StubFileClose (=0D
++QemuKernelStubFileClose (=0D
+   IN EFI_FILE_PROTOCOL  *This=0D
+   )=0D
+ {=0D
+@@ -219,7 +220,7 @@ StubFileClose (
+ STATIC=0D
+ EFI_STATUS=0D
+ EFIAPI=0D
+-StubFileDelete (=0D
++QemuKernelStubFileDelete (=0D
+   IN EFI_FILE_PROTOCOL  *This=0D
+   )=0D
+ {=0D
+@@ -229,18 +230,17 @@ StubFileDelete (
+ =0D
+ /**=0D
+   Helper function that formats an EFI_FILE_INFO structure into the=0D
+-  user-allocated buffer, for any valid KERNEL_BLOB_TYPE value (including=
=0D
+-  KernelBlobTypeMax, which stands for the root directory).=0D
++  user-allocated buffer, for any valid KERNEL_BLOB (including NULL,=0D
++  which stands for the root directory).=0D
+ =0D
+   The interface follows the EFI_FILE_GET_INFO -- and for directories, the=
=0D
+   EFI_FILE_READ -- interfaces.=0D
+ =0D
+-  @param[in]     BlobType     The KERNEL_BLOB_TYPE value identifying the =
fw_cfg=0D
++  @param[in]     Blob         The KERNEL_BLOB identifying the fw_cfg=0D
+                               blob backing the STUB_FILE that information=
 is=0D
+-                              being requested about. If BlobType equals=0D
+-                              KernelBlobTypeMax, then information will be=
=0D
+-                              provided about the root directory of the=0D
+-                              filesystem.=0D
++                              being requested about. If Blob is NULL,=0D
++                              then information will be provided about the=
 root=0D
++                              directory of the filesystem.=0D
+ =0D
+   @param[in,out] BufferSize  On input, the size of Buffer. On output, the=
=0D
+                              amount of data returned in Buffer. In both c=
ases,=0D
+@@ -257,10 +257,10 @@ StubFileDelete (
+ **/=0D
+ STATIC=0D
+ EFI_STATUS=0D
+-ConvertKernelBlobTypeToFileInfo (=0D
+-  IN KERNEL_BLOB_TYPE  BlobType,=0D
+-  IN OUT UINTN         *BufferSize,=0D
+-  OUT VOID             *Buffer=0D
++QemuKernelBlobTypeToFileInfo (=0D
++  IN KERNEL_BLOB  *Blob,=0D
++  IN OUT UINTN    *BufferSize,=0D
++  OUT VOID        *Buffer=0D
+   )=0D
+ {=0D
+   CONST CHAR16  *Name;=0D
+@@ -272,17 +272,16 @@ ConvertKernelBlobTypeToFileInfo (
+   EFI_FILE_INFO  *FileInfo;=0D
+   UINTN          OriginalBufferSize;=0D
+ =0D
+-  if (BlobType =3D=3D KernelBlobTypeMax) {=0D
++  if (Blob =3D=3D NULL) {=0D
+     //=0D
+     // getting file info about the root directory=0D
+     //=0D
++    DEBUG ((DEBUG_INFO, "%a: file info: directory\n", __func__));=0D
+     Name      =3D L"\\";=0D
+-    FileSize  =3D KernelBlobTypeMax;=0D
++    FileSize  =3D mKernelBlobCount;=0D
+     Attribute =3D EFI_FILE_READ_ONLY | EFI_FILE_DIRECTORY;=0D
+   } else {=0D
+-    CONST KERNEL_BLOB  *Blob;=0D
+-=0D
+-    Blob      =3D &mKernelBlob[BlobType];=0D
++    DEBUG ((DEBUG_INFO, "%a: file info: \"%s\"\n", __func__, Blob->Name))=
;=0D
+     Name      =3D Blob->Name;=0D
+     FileSize  =3D Blob->Size;=0D
+     Attribute =3D EFI_FILE_READ_ONLY;=0D
+@@ -312,6 +311,23 @@ ConvertKernelBlobTypeToFileInfo (
+   return EFI_SUCCESS;=0D
+ }=0D
+ =0D
++STATIC=0D
++KERNEL_BLOB *=0D
++FindKernelBlob (=0D
++  CHAR16  *FileName=0D
++  )=0D
++{=0D
++  KERNEL_BLOB  *Blob;=0D
++=0D
++  for (Blob =3D mKernelBlobs; Blob !=3D NULL; Blob =3D Blob->Next) {=0D
++    if (StrCmp (FileName, Blob->Name) =3D=3D 0) {=0D
++      return Blob;=0D
++    }=0D
++  }=0D
++=0D
++  return NULL;=0D
++}=0D
++=0D
+ /**=0D
+   Reads data from a file, or continues scanning a directory.=0D
+ =0D
+@@ -349,25 +365,25 @@ ConvertKernelBlobTypeToFileInfo (
+ STATIC=0D
+ EFI_STATUS=0D
+ EFIAPI=0D
+-StubFileRead (=0D
++QemuKernelStubFileRead (=0D
+   IN EFI_FILE_PROTOCOL  *This,=0D
+   IN OUT UINTN          *BufferSize,=0D
+   OUT VOID              *Buffer=0D
+   )=0D
+ {=0D
+-  STUB_FILE          *StubFile;=0D
+-  CONST KERNEL_BLOB  *Blob;=0D
+-  UINT64             Left;=0D
++  STUB_FILE    *StubFile;=0D
++  KERNEL_BLOB  *Blob;=0D
++  UINT64       Left, Pos;=0D
+ =0D
+   StubFile =3D STUB_FILE_FROM_FILE (This);=0D
+ =0D
+   //=0D
+   // Scanning the root directory?=0D
+   //=0D
+-  if (StubFile->BlobType =3D=3D KernelBlobTypeMax) {=0D
++  if (StubFile->Blob =3D=3D NULL) {=0D
+     EFI_STATUS  Status;=0D
+ =0D
+-    if (StubFile->Position =3D=3D KernelBlobTypeMax) {=0D
++    if (StubFile->Position =3D=3D mKernelBlobCount) {=0D
+       //=0D
+       // Scanning complete.=0D
+       //=0D
+@@ -375,8 +391,16 @@ StubFileRead (
+       return EFI_SUCCESS;=0D
+     }=0D
+ =0D
+-    Status =3D ConvertKernelBlobTypeToFileInfo (=0D
+-               (KERNEL_BLOB_TYPE)StubFile->Position,=0D
++    for (Pos =3D 0, Blob =3D mKernelBlobs;=0D
++         Pos < StubFile->Position;=0D
++         Pos++, Blob =3D Blob->Next)=0D
++    {=0D
++    }=0D
++=0D
++    DEBUG ((DEBUG_INFO, "%a: file list: #%d \"%s\"\n", __func__, Pos, Blo=
b->Name));=0D
++=0D
++    Status =3D QemuKernelBlobTypeToFileInfo (=0D
++               Blob,=0D
+                BufferSize,=0D
+                Buffer=0D
+                );=0D
+@@ -391,7 +415,7 @@ StubFileRead (
+   //=0D
+   // Reading a file.=0D
+   //=0D
+-  Blob =3D &mKernelBlob[StubFile->BlobType];=0D
++  Blob =3D StubFile->Blob;=0D
+   if (StubFile->Position > Blob->Size) {=0D
+     return EFI_DEVICE_ERROR;=0D
+   }=0D
+@@ -402,6 +426,7 @@ StubFileRead (
+   }=0D
+ =0D
+   if (Blob->Data !=3D NULL) {=0D
++    DEBUG ((DEBUG_INFO, "%a: file read: \"%s\", %d bytes\n", __func__, Bl=
ob->Name, *BufferSize));=0D
+     CopyMem (Buffer, Blob->Data + StubFile->Position, *BufferSize);=0D
+   }=0D
+ =0D
+@@ -435,7 +460,7 @@ StubFileRead (
+ STATIC=0D
+ EFI_STATUS=0D
+ EFIAPI=0D
+-StubFileWrite (=0D
++QemuKernelStubFileWrite (=0D
+   IN EFI_FILE_PROTOCOL  *This,=0D
+   IN OUT UINTN          *BufferSize,=0D
+   IN VOID               *Buffer=0D
+@@ -444,7 +469,7 @@ StubFileWrite (
+   STUB_FILE  *StubFile;=0D
+ =0D
+   StubFile =3D STUB_FILE_FROM_FILE (This);=0D
+-  return (StubFile->BlobType =3D=3D KernelBlobTypeMax) ?=0D
++  return (StubFile->Blob =3D=3D NULL) ?=0D
+          EFI_UNSUPPORTED :=0D
+          EFI_WRITE_PROTECTED;=0D
+ }=0D
+@@ -466,7 +491,7 @@ StubFileWrite (
+ STATIC=0D
+ EFI_STATUS=0D
+ EFIAPI=0D
+-StubFileGetPosition (=0D
++QemuKernelStubFileGetPosition (=0D
+   IN EFI_FILE_PROTOCOL  *This,=0D
+   OUT UINT64            *Position=0D
+   )=0D
+@@ -474,7 +499,7 @@ StubFileGetPosition (
+   STUB_FILE  *StubFile;=0D
+ =0D
+   StubFile =3D STUB_FILE_FROM_FILE (This);=0D
+-  if (StubFile->BlobType =3D=3D KernelBlobTypeMax) {=0D
++  if (StubFile->Blob =3D=3D NULL) {=0D
+     return EFI_UNSUPPORTED;=0D
+   }=0D
+ =0D
+@@ -501,7 +526,7 @@ StubFileGetPosition (
+ STATIC=0D
+ EFI_STATUS=0D
+ EFIAPI=0D
+-StubFileSetPosition (=0D
++QemuKernelStubFileSetPosition (=0D
+   IN EFI_FILE_PROTOCOL  *This,=0D
+   IN UINT64             Position=0D
+   )=0D
+@@ -511,7 +536,7 @@ StubFileSetPosition (
+ =0D
+   StubFile =3D STUB_FILE_FROM_FILE (This);=0D
+ =0D
+-  if (StubFile->BlobType =3D=3D KernelBlobTypeMax) {=0D
++  if (StubFile->Blob =3D=3D NULL) {=0D
+     if (Position =3D=3D 0) {=0D
+       //=0D
+       // rewinding a directory scan is allowed=0D
+@@ -526,7 +551,7 @@ StubFileSetPosition (
+   //=0D
+   // regular file seek=0D
+   //=0D
+-  Blob =3D &mKernelBlob[StubFile->BlobType];=0D
++  Blob =3D StubFile->Blob;=0D
+   if (Position =3D=3D MAX_UINT64) {=0D
+     //=0D
+     // seek to end=0D
+@@ -583,7 +608,7 @@ StubFileSetPosition (
+ STATIC=0D
+ EFI_STATUS=0D
+ EFIAPI=0D
+-StubFileGetInfo (=0D
++QemuKernelStubFileGetInfo (=0D
+   IN EFI_FILE_PROTOCOL  *This,=0D
+   IN EFI_GUID           *InformationType,=0D
+   IN OUT UINTN          *BufferSize,=0D
+@@ -596,8 +621,8 @@ StubFileGetInfo (
+   StubFile =3D STUB_FILE_FROM_FILE (This);=0D
+ =0D
+   if (CompareGuid (InformationType, &gEfiFileInfoGuid)) {=0D
+-    return ConvertKernelBlobTypeToFileInfo (=0D
+-             StubFile->BlobType,=0D
++    return QemuKernelBlobTypeToFileInfo (=0D
++             StubFile->Blob,=0D
+              BufferSize,=0D
+              Buffer=0D
+              );=0D
+@@ -685,7 +710,7 @@ StubFileGetInfo (
+ STATIC=0D
+ EFI_STATUS=0D
+ EFIAPI=0D
+-StubFileSetInfo (=0D
++QemuKernelStubFileSetInfo (=0D
+   IN EFI_FILE_PROTOCOL  *This,=0D
+   IN EFI_GUID           *InformationType,=0D
+   IN UINTN              BufferSize,=0D
+@@ -712,7 +737,7 @@ StubFileSetInfo (
+ STATIC=0D
+ EFI_STATUS=0D
+ EFIAPI=0D
+-StubFileFlush (=0D
++QemuKernelStubFileFlush (=0D
+   IN EFI_FILE_PROTOCOL  *This=0D
+   )=0D
+ {=0D
+@@ -724,16 +749,16 @@ StubFileFlush (
+ //=0D
+ STATIC CONST EFI_FILE_PROTOCOL  mEfiFileProtocolTemplate =3D {=0D
+   EFI_FILE_PROTOCOL_REVISION, // revision 1=0D
+-  StubFileOpen,=0D
+-  StubFileClose,=0D
+-  StubFileDelete,=0D
+-  StubFileRead,=0D
+-  StubFileWrite,=0D
+-  StubFileGetPosition,=0D
+-  StubFileSetPosition,=0D
+-  StubFileGetInfo,=0D
+-  StubFileSetInfo,=0D
+-  StubFileFlush,=0D
++  QemuKernelStubFileOpen,=0D
++  QemuKernelStubFileClose,=0D
++  QemuKernelStubFileDelete,=0D
++  QemuKernelStubFileRead,=0D
++  QemuKernelStubFileWrite,=0D
++  QemuKernelStubFileGetPosition,=0D
++  QemuKernelStubFileSetPosition,=0D
++  QemuKernelStubFileGetInfo,=0D
++  QemuKernelStubFileSetInfo,=0D
++  QemuKernelStubFileFlush,=0D
+   NULL,                       // OpenEx, revision 2=0D
+   NULL,                       // ReadEx, revision 2=0D
+   NULL,                       // WriteEx, revision 2=0D
+@@ -743,7 +768,7 @@ STATIC CONST EFI_FILE_PROTOCOL  mEfiFileProtocolTempla=
te =3D {
+ STATIC=0D
+ EFI_STATUS=0D
+ EFIAPI=0D
+-StubFileOpen (=0D
++QemuKernelStubFileOpen (=0D
+   IN EFI_FILE_PROTOCOL   *This,=0D
+   OUT EFI_FILE_PROTOCOL  **NewHandle,=0D
+   IN CHAR16              *FileName,=0D
+@@ -752,7 +777,7 @@ StubFileOpen (
+   )=0D
+ {=0D
+   CONST STUB_FILE  *StubFile;=0D
+-  UINTN            BlobType;=0D
++  KERNEL_BLOB      *Blob;=0D
+   STUB_FILE        *NewStubFile;=0D
+ =0D
+   //=0D
+@@ -774,21 +799,20 @@ StubFileOpen (
+   // Only the root directory supports opening files in it.=0D
+   //=0D
+   StubFile =3D STUB_FILE_FROM_FILE (This);=0D
+-  if (StubFile->BlobType !=3D KernelBlobTypeMax) {=0D
++  if (StubFile->Blob !=3D NULL) {=0D
+     return EFI_UNSUPPORTED;=0D
+   }=0D
+ =0D
+   //=0D
+   // Locate the file.=0D
+   //=0D
+-  for (BlobType =3D 0; BlobType < KernelBlobTypeMax; ++BlobType) {=0D
+-    if (StrCmp (FileName, mKernelBlob[BlobType].Name) =3D=3D 0) {=0D
+-      break;=0D
+-    }=0D
+-  }=0D
++  Blob =3D FindKernelBlob (FileName);=0D
+ =0D
+-  if (BlobType =3D=3D KernelBlobTypeMax) {=0D
++  if (Blob =3D=3D NULL) {=0D
++    DEBUG ((DEBUG_INFO, "%a: file not found: \"%s\"\n", __func__, FileNam=
e));=0D
+     return EFI_NOT_FOUND;=0D
++  } else {=0D
++    DEBUG ((DEBUG_INFO, "%a: file opened: \"%s\"\n", __func__, FileName))=
;=0D
+   }=0D
+ =0D
+   //=0D
+@@ -800,7 +824,7 @@ StubFileOpen (
+   }=0D
+ =0D
+   NewStubFile->Signature =3D STUB_FILE_SIG;=0D
+-  NewStubFile->BlobType  =3D (KERNEL_BLOB_TYPE)BlobType;=0D
++  NewStubFile->Blob      =3D Blob;=0D
+   NewStubFile->Position  =3D 0;=0D
+   CopyMem (=0D
+     &NewStubFile->File,=0D
+@@ -842,7 +866,7 @@ StubFileOpen (
+ STATIC=0D
+ EFI_STATUS=0D
+ EFIAPI=0D
+-StubFileSystemOpenVolume (=0D
++QemuKernelStubFileSystemOpenVolume (=0D
+   IN EFI_SIMPLE_FILE_SYSTEM_PROTOCOL  *This,=0D
+   OUT EFI_FILE_PROTOCOL               **Root=0D
+   )=0D
+@@ -855,7 +879,7 @@ StubFileSystemOpenVolume (
+   }=0D
+ =0D
+   StubFile->Signature =3D STUB_FILE_SIG;=0D
+-  StubFile->BlobType  =3D KernelBlobTypeMax;=0D
++  StubFile->Blob      =3D NULL;=0D
+   StubFile->Position  =3D 0;=0D
+   CopyMem (=0D
+     &StubFile->File,=0D
+@@ -869,13 +893,13 @@ StubFileSystemOpenVolume (
+ =0D
+ STATIC CONST EFI_SIMPLE_FILE_SYSTEM_PROTOCOL  mFileSystem =3D {=0D
+   EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_REVISION,=0D
+-  StubFileSystemOpenVolume=0D
++  QemuKernelStubFileSystemOpenVolume=0D
+ };=0D
+ =0D
+ STATIC=0D
+ EFI_STATUS=0D
+ EFIAPI=0D
+-InitrdLoadFile2 (=0D
++QemuKernelInitrdLoadFile2 (=0D
+   IN      EFI_LOAD_FILE2_PROTOCOL   *This,=0D
+   IN      EFI_DEVICE_PATH_PROTOCOL  *FilePath,=0D
+   IN      BOOLEAN                   BootPolicy,=0D
+@@ -883,8 +907,11 @@ InitrdLoadFile2 (
+   OUT     VOID                      *Buffer     OPTIONAL=0D
+   )=0D
+ {=0D
+-  CONST KERNEL_BLOB  *InitrdBlob =3D &mKernelBlob[KernelBlobTypeInitrd];=
=0D
++  KERNEL_BLOB  *InitrdBlob;=0D
+ =0D
++  DEBUG ((DEBUG_INFO, "%a: initrd read\n", __func__));=0D
++  InitrdBlob =3D FindKernelBlob (L"initrd");=0D
++  ASSERT (InitrdBlob !=3D NULL);=0D
+   ASSERT (InitrdBlob->Size > 0);=0D
+ =0D
+   if (BootPolicy) {=0D
+@@ -913,17 +940,33 @@ InitrdLoadFile2 (
+ }=0D
+ =0D
+ STATIC CONST EFI_LOAD_FILE2_PROTOCOL  mInitrdLoadFile2 =3D {=0D
+-  InitrdLoadFile2,=0D
++  QemuKernelInitrdLoadFile2,=0D
+ };=0D
+ =0D
+ //=0D
+ // Utility functions.=0D
+ //=0D
+ =0D
++STATIC VOID=0D
++QemuKernelChunkedRead (=0D
++  UINT8   *Dest,=0D
++  UINT32  Bytes=0D
++  )=0D
++{=0D
++  UINT32  Chunk;=0D
++=0D
++  while (Bytes > 0) {=0D
++    Chunk =3D (Bytes < SIZE_1MB) ? Bytes : SIZE_1MB;=0D
++    QemuFwCfgReadBytes (Chunk, Dest);=0D
++    Bytes -=3D Chunk;=0D
++    Dest  +=3D Chunk;=0D
++  }=0D
++}=0D
++=0D
+ /**=0D
+   Populate a blob in mKernelBlob.=0D
+ =0D
+-  param[in,out] Blob  Pointer to the KERNEL_BLOB element in mKernelBlob t=
hat is=0D
++  param[in,out] Blob  Pointer to the KERNEL_BLOB_ITEMS that is=0D
+                       to be filled from fw_cfg.=0D
+ =0D
+   @retval EFI_SUCCESS           Blob has been populated. If fw_cfg report=
ed a=0D
+@@ -934,35 +977,46 @@ STATIC CONST EFI_LOAD_FILE2_PROTOCOL  mInitrdLoadFil=
e2 =3D {
+ **/=0D
+ STATIC=0D
+ EFI_STATUS=0D
+-FetchBlob (=0D
+-  IN OUT KERNEL_BLOB  *Blob=0D
++QemuKernelFetchBlob (=0D
++  IN KERNEL_BLOB_ITEMS  *BlobItems=0D
+   )=0D
+ {=0D
+-  UINT32  Left;=0D
+-  UINTN   Idx;=0D
+-  UINT8   *ChunkData;=0D
++  UINT32       Size;=0D
++  UINTN        Idx;=0D
++  UINT8        *ChunkData;=0D
++  KERNEL_BLOB  *Blob;=0D
++  EFI_STATUS   Status;=0D
+ =0D
+   //=0D
+   // Read blob size.=0D
+   //=0D
+-  Blob->Size =3D 0;=0D
+-  for (Idx =3D 0; Idx < ARRAY_SIZE (Blob->FwCfgItem); Idx++) {=0D
+-    if (Blob->FwCfgItem[Idx].SizeKey =3D=3D 0) {=0D
++  for (Size =3D 0, Idx =3D 0; Idx < ARRAY_SIZE (BlobItems->FwCfgItem); Id=
x++) {=0D
++    if (BlobItems->FwCfgItem[Idx].SizeKey =3D=3D 0) {=0D
+       break;=0D
+     }=0D
+ =0D
+-    QemuFwCfgSelectItem (Blob->FwCfgItem[Idx].SizeKey);=0D
+-    Blob->FwCfgItem[Idx].Size =3D QemuFwCfgRead32 ();=0D
+-    Blob->Size               +=3D Blob->FwCfgItem[Idx].Size;=0D
++    QemuFwCfgSelectItem (BlobItems->FwCfgItem[Idx].SizeKey);=0D
++    BlobItems->FwCfgItem[Idx].Size =3D QemuFwCfgRead32 ();=0D
++    Size                          +=3D BlobItems->FwCfgItem[Idx].Size;=0D
+   }=0D
+ =0D
+-  if (Blob->Size =3D=3D 0) {=0D
++  if (Size =3D=3D 0) {=0D
+     return EFI_SUCCESS;=0D
+   }=0D
+ =0D
++  Blob =3D AllocatePool (sizeof (*Blob));=0D
++  if (Blob->Data =3D=3D NULL) {=0D
++    return EFI_OUT_OF_RESOURCES;=0D
++  }=0D
++=0D
++  ZeroMem (Blob, sizeof (*Blob));=0D
++=0D
+   //=0D
+   // Read blob.=0D
+   //=0D
++  Status =3D StrCpyS (Blob->Name, sizeof (Blob->Name), BlobItems->Name);=
=0D
++  ASSERT (!EFI_ERROR (Status));=0D
++  Blob->Size =3D Size;=0D
+   Blob->Data =3D AllocatePool (Blob->Size);=0D
+   if (Blob->Data =3D=3D NULL) {=0D
+     DEBUG ((=0D
+@@ -972,6 +1026,7 @@ FetchBlob (
+       (INT64)Blob->Size,=0D
+       Blob->Name=0D
+       ));=0D
++    FreePool (Blob);=0D
+     return EFI_OUT_OF_RESOURCES;=0D
+   }=0D
+ =0D
+@@ -984,34 +1039,48 @@ FetchBlob (
+     ));=0D
+ =0D
+   ChunkData =3D Blob->Data;=0D
+-  for (Idx =3D 0; Idx < ARRAY_SIZE (Blob->FwCfgItem); Idx++) {=0D
+-    if (Blob->FwCfgItem[Idx].DataKey =3D=3D 0) {=0D
++  for (Idx =3D 0; Idx < ARRAY_SIZE (BlobItems->FwCfgItem); Idx++) {=0D
++    if (BlobItems->FwCfgItem[Idx].DataKey =3D=3D 0) {=0D
+       break;=0D
+     }=0D
+ =0D
+-    QemuFwCfgSelectItem (Blob->FwCfgItem[Idx].DataKey);=0D
++    QemuFwCfgSelectItem (BlobItems->FwCfgItem[Idx].DataKey);=0D
++    QemuKernelChunkedRead (ChunkData, BlobItems->FwCfgItem[Idx].Size);=0D
++    ChunkData +=3D BlobItems->FwCfgItem[Idx].Size;=0D
++  }=0D
+ =0D
+-    Left =3D Blob->FwCfgItem[Idx].Size;=0D
+-    while (Left > 0) {=0D
+-      UINT32  Chunk;=0D
++  Blob->Next   =3D mKernelBlobs;=0D
++  mKernelBlobs =3D Blob;=0D
++  mKernelBlobCount++;=0D
++  mTotalBlobBytes +=3D Blob->Size;=0D
++  return EFI_SUCCESS;=0D
++}=0D
+ =0D
+-      Chunk =3D (Left < SIZE_1MB) ? Left : SIZE_1MB;=0D
+-      QemuFwCfgReadBytes (Chunk, ChunkData + Blob->FwCfgItem[Idx].Size - =
Left);=0D
+-      Left -=3D Chunk;=0D
+-      DEBUG ((=0D
+-        DEBUG_VERBOSE,=0D
+-        "%a: %Ld bytes remaining for \"%s\" (%d)\n",=0D
+-        __func__,=0D
+-        (INT64)Left,=0D
+-        Blob->Name,=0D
+-        (INT32)Idx=0D
+-        ));=0D
+-    }=0D
++STATIC=0D
++EFI_STATUS=0D
++QemuKernelVerifyBlob (=0D
++  CHAR16      *FileName,=0D
++  EFI_STATUS  FetchStatus=0D
++  )=0D
++{=0D
++  KERNEL_BLOB  *Blob;=0D
++  EFI_STATUS   Status;=0D
+ =0D
+-    ChunkData +=3D Blob->FwCfgItem[Idx].Size;=0D
++  if ((StrCmp (FileName, L"kernel") !=3D 0) &&=0D
++      (StrCmp (FileName, L"initrd") !=3D 0) &&=0D
++      (StrCmp (FileName, L"cmdline") !=3D 0))=0D
++  {=0D
++    return EFI_SUCCESS;=0D
+   }=0D
+ =0D
+-  return EFI_SUCCESS;=0D
++  Blob   =3D FindKernelBlob (FileName);=0D
++  Status =3D VerifyBlob (=0D
++             FileName,=0D
++             Blob ? Blob->Data : NULL,=0D
++             Blob ? Blob->Size : 0,=0D
++             FetchStatus=0D
++             );=0D
++  return Status;=0D
+ }=0D
+ =0D
+ //=0D
+@@ -1038,13 +1107,13 @@ QemuKernelLoaderFsDxeEntrypoint (
+   IN EFI_SYSTEM_TABLE  *SystemTable=0D
+   )=0D
+ {=0D
+-  UINTN        BlobType;=0D
+-  KERNEL_BLOB  *CurrentBlob;=0D
+-  KERNEL_BLOB  *KernelBlob;=0D
+-  EFI_STATUS   Status;=0D
+-  EFI_STATUS   FetchStatus;=0D
+-  EFI_HANDLE   FileSystemHandle;=0D
+-  EFI_HANDLE   InitrdLoadFile2Handle;=0D
++  UINTN              BlobIdx;=0D
++  KERNEL_BLOB_ITEMS  *BlobItems;=0D
++  KERNEL_BLOB        *Blob;=0D
++  EFI_STATUS         Status;=0D
++  EFI_STATUS         FetchStatus;=0D
++  EFI_HANDLE         FileSystemHandle;=0D
++  EFI_HANDLE         InitrdLoadFile2Handle;=0D
+ =0D
+   if (!QemuFwCfgIsAvailable ()) {=0D
+     return EFI_NOT_FOUND;=0D
+@@ -1059,26 +1128,22 @@ QemuKernelLoaderFsDxeEntrypoint (
+   //=0D
+   // Fetch all blobs.=0D
+   //=0D
+-  for (BlobType =3D 0; BlobType < KernelBlobTypeMax; ++BlobType) {=0D
+-    CurrentBlob =3D &mKernelBlob[BlobType];=0D
+-    FetchStatus =3D FetchBlob (CurrentBlob);=0D
+-=0D
+-    Status =3D VerifyBlob (=0D
+-               CurrentBlob->Name,=0D
+-               CurrentBlob->Data,=0D
+-               CurrentBlob->Size,=0D
++  for (BlobIdx =3D 0; BlobIdx < ARRAY_SIZE (mKernelBlobItems); ++BlobIdx)=
 {=0D
++    BlobItems   =3D &mKernelBlobItems[BlobIdx];=0D
++    FetchStatus =3D QemuKernelFetchBlob (BlobItems);=0D
++=0D
++    Status =3D QemuKernelVerifyBlob (=0D
++               (CHAR16 *)BlobItems->Name,=0D
+                FetchStatus=0D
+                );=0D
+     if (EFI_ERROR (Status)) {=0D
+       goto FreeBlobs;=0D
+     }=0D
+-=0D
+-    mTotalBlobBytes +=3D CurrentBlob->Size;=0D
+   }=0D
+ =0D
+-  KernelBlob =3D &mKernelBlob[KernelBlobTypeKernel];=0D
+-=0D
+-  if (KernelBlob->Data =3D=3D NULL) {=0D
++  Blob =3D FindKernelBlob (L"kernel");=0D
++  if (Blob =3D=3D NULL) {=0D
++    DEBUG ((DEBUG_INFO, "%a: no kernel present -> quit\n", __func__));=0D
+     Status =3D EFI_NOT_FOUND;=0D
+     goto FreeBlobs;=0D
+   }=0D
+@@ -1106,7 +1171,9 @@ QemuKernelLoaderFsDxeEntrypoint (
+     goto FreeBlobs;=0D
+   }=0D
+ =0D
+-  if (KernelBlob[KernelBlobTypeInitrd].Size > 0) {=0D
++  Blob =3D FindKernelBlob (L"initrd");=0D
++  if (Blob !=3D NULL) {=0D
++    DEBUG ((DEBUG_INFO, "%a: initrd setup\n", __func__));=0D
+     InitrdLoadFile2Handle =3D NULL;=0D
+     Status                =3D gBS->InstallMultipleProtocolInterfaces (=0D
+                                    &InitrdLoadFile2Handle,=0D
+@@ -1141,13 +1208,11 @@ UninstallFileSystemHandle:
+   ASSERT_EFI_ERROR (Status);=0D
+ =0D
+ FreeBlobs:=0D
+-  while (BlobType > 0) {=0D
+-    CurrentBlob =3D &mKernelBlob[--BlobType];=0D
+-    if (CurrentBlob->Data !=3D NULL) {=0D
+-      FreePool (CurrentBlob->Data);=0D
+-      CurrentBlob->Size =3D 0;=0D
+-      CurrentBlob->Data =3D NULL;=0D
+-    }=0D
++  while (mKernelBlobs !=3D NULL) {=0D
++    Blob         =3D mKernelBlobs;=0D
++    mKernelBlobs =3D Blob->Next;=0D
++    FreePool (Blob->Data);=0D
++    FreePool (Blob);=0D
+   }=0D
+ =0D
+   return Status;=0D
+--=20
+2.49.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-2.patch b/meta/recip=
es-core/ovmf/ovmf/CVE-2025-2296-2.patch
new file mode 100644
index 0000000000..964ee306bf
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-2.patch
@@ -0,0 +1,175 @@
+From 20df7c42bd446fe725bfc78cdb40577456c421d8 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Wed, 15 Jan 2025 00:29:52 +0100
+Subject: [PATCH 02/10] OvmfPkg/QemuKernelLoaderFsDxe: add support for named
+ blobs
+
+Load all named fw_cfg blobs with "etc/boot/" prefix into the pseudo
+filesystem.
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+CVE: CVE-2025-2296
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/20df7c=
42bd446fe725bfc78cdb40577456c421d8]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ .../QemuKernelLoaderFsDxe.c                   | 94 ++++++++++++++++---
+ .../QemuKernelLoaderFsDxe.inf                 |  1 +
+ 2 files changed, 84 insertions(+), 11 deletions(-)
+
+diff --git a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c b/OvmfP=
kg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
+index 7ad1b3828f..1f63adda0b 100644
+--- a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
++++ b/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
+@@ -21,6 +21,7 @@
+ #include <Library/DebugLib.h>=0D
+ #include <Library/DevicePathLib.h>=0D
+ #include <Library/MemoryAllocationLib.h>=0D
++#include <Library/PrintLib.h>=0D
+ #include <Library/QemuFwCfgLib.h>=0D
+ #include <Library/UefiBootServicesTableLib.h>=0D
+ #include <Library/UefiRuntimeServicesTableLib.h>=0D
+@@ -32,12 +33,12 @@
+ // Static data that hosts the fw_cfg blobs and serves file requests.=0D
+ //=0D
+ typedef struct {=0D
+-  CONST CHAR16    Name[8];=0D
++  CHAR16    Name[8];=0D
+   struct {=0D
+-    FIRMWARE_CONFIG_ITEM CONST    SizeKey;=0D
+-    FIRMWARE_CONFIG_ITEM CONST    DataKey;=0D
+-    UINT32                        Size;=0D
+-  }                             FwCfgItem[2];=0D
++    FIRMWARE_CONFIG_ITEM    SizeKey;=0D
++    FIRMWARE_CONFIG_ITEM    DataKey;=0D
++    UINT32                  Size;=0D
++  }                         FwCfgItem[2];=0D
+ } KERNEL_BLOB_ITEMS;=0D
+ =0D
+ typedef struct KERNEL_BLOB KERNEL_BLOB;=0D
+@@ -989,15 +990,23 @@ QemuKernelFetchBlob (
+ =0D
+   //=0D
+   // Read blob size.=0D
++  //   Size !=3D 0      ->  use size as-is=0D
++  //   SizeKey !=3D 0   ->  read size from fw_cfg=0D
++  //   both are 0     ->  unused entry=0D
+   //=0D
+   for (Size =3D 0, Idx =3D 0; Idx < ARRAY_SIZE (BlobItems->FwCfgItem); Id=
x++) {=0D
+-    if (BlobItems->FwCfgItem[Idx].SizeKey =3D=3D 0) {=0D
++    if ((BlobItems->FwCfgItem[Idx].SizeKey =3D=3D 0) &&=0D
++        (BlobItems->FwCfgItem[Idx].Size =3D=3D 0))=0D
++    {=0D
+       break;=0D
+     }=0D
+ =0D
+-    QemuFwCfgSelectItem (BlobItems->FwCfgItem[Idx].SizeKey);=0D
+-    BlobItems->FwCfgItem[Idx].Size =3D QemuFwCfgRead32 ();=0D
+-    Size                          +=3D BlobItems->FwCfgItem[Idx].Size;=0D
++    if (BlobItems->FwCfgItem[Idx].SizeKey) {=0D
++      QemuFwCfgSelectItem (BlobItems->FwCfgItem[Idx].SizeKey);=0D
++      BlobItems->FwCfgItem[Idx].Size =3D QemuFwCfgRead32 ();=0D
++    }=0D
++=0D
++    Size +=3D BlobItems->FwCfgItem[Idx].Size;=0D
+   }=0D
+ =0D
+   if (Size =3D=3D 0) {=0D
+@@ -1083,6 +1092,55 @@ QemuKernelVerifyBlob (
+   return Status;=0D
+ }=0D
+ =0D
++STATIC=0D
++EFI_STATUS=0D
++QemuKernelFetchNamedBlobs (=0D
++  VOID=0D
++  )=0D
++{=0D
++  struct {=0D
++    UINT32    FileSize;=0D
++    UINT16    FileSelect;=0D
++    UINT16    Reserved;=0D
++    CHAR8     FileName[QEMU_FW_CFG_FNAME_SIZE];=0D
++  } *DirEntry;=0D
++  KERNEL_BLOB_ITEMS  Items;=0D
++  EFI_STATUS         Status;=0D
++  EFI_STATUS         FetchStatus;=0D
++  UINT32             Count;=0D
++  UINT32             Idx;=0D
++=0D
++  QemuFwCfgSelectItem (QemuFwCfgItemFileDir);=0D
++  Count =3D SwapBytes32 (QemuFwCfgRead32 ());=0D
++=0D
++  DirEntry =3D AllocatePool (sizeof (*DirEntry) * Count);=0D
++  QemuFwCfgReadBytes (sizeof (*DirEntry) * Count, DirEntry);=0D
++=0D
++  for (Idx =3D 0; Idx < Count; ++Idx) {=0D
++    if (AsciiStrnCmp (DirEntry[Idx].FileName, "etc/boot/", 9) !=3D 0) {=0D
++      continue;=0D
++    }=0D
++=0D
++    ZeroMem (&Items, sizeof (Items));=0D
++    UnicodeSPrint (Items.Name, sizeof (Items.Name), L"%a", DirEntry[Idx].=
FileName + 9);=0D
++    Items.FwCfgItem[0].DataKey =3D SwapBytes16 (DirEntry[Idx].FileSelect)=
;=0D
++    Items.FwCfgItem[0].Size    =3D SwapBytes32 (DirEntry[Idx].FileSize);=
=0D
++=0D
++    FetchStatus =3D QemuKernelFetchBlob (&Items);=0D
++    Status      =3D QemuKernelVerifyBlob (=0D
++                    (CHAR16 *)Items.Name,=0D
++                    FetchStatus=0D
++                    );=0D
++    if (EFI_ERROR (Status)) {=0D
++      FreePool (DirEntry);=0D
++      return Status;=0D
++    }=0D
++  }=0D
++=0D
++  FreePool (DirEntry);=0D
++  return EFI_SUCCESS;=0D
++}=0D
++=0D
+ //=0D
+ // The entry point of the feature.=0D
+ //=0D
+@@ -1126,10 +1184,24 @@ QemuKernelLoaderFsDxeEntrypoint (
+   }=0D
+ =0D
+   //=0D
+-  // Fetch all blobs.=0D
++  // Fetch named blobs.=0D
+   //=0D
++  DEBUG ((DEBUG_INFO, "%a: named blobs (etc/boot/*)\n", __func__));=0D
++  Status =3D QemuKernelFetchNamedBlobs ();=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto FreeBlobs;=0D
++  }=0D
++=0D
++  //=0D
++  // Fetch traditional blobs.=0D
++  //=0D
++  DEBUG ((DEBUG_INFO, "%a: traditional blobs\n", __func__));=0D
+   for (BlobIdx =3D 0; BlobIdx < ARRAY_SIZE (mKernelBlobItems); ++BlobIdx)=
 {=0D
+-    BlobItems   =3D &mKernelBlobItems[BlobIdx];=0D
++    BlobItems =3D &mKernelBlobItems[BlobIdx];=0D
++    if (FindKernelBlob (BlobItems->Name)) {=0D
++      continue;=0D
++    }=0D
++=0D
+     FetchStatus =3D QemuKernelFetchBlob (BlobItems);=0D
+ =0D
+     Status =3D QemuKernelVerifyBlob (=0D
+diff --git a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.inf b/Ovm=
fPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.inf
+index 7b35adb8e0..a2f44bbca1 100644
+--- a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.inf
++++ b/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.inf
+@@ -30,6 +30,7 @@
+   DebugLib=0D
+   DevicePathLib=0D
+   MemoryAllocationLib=0D
++  PrintLib=0D
+   QemuFwCfgLib=0D
+   UefiBootServicesTableLib=0D
+   UefiDriverEntryPoint=0D
+--=20
+2.49.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-3.patch b/meta/recip=
es-core/ovmf/ovmf/CVE-2025-2296-3.patch
new file mode 100644
index 0000000000..0ea2a70bf5
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-3.patch
@@ -0,0 +1,42 @@
+From adf385ecab69631952bdc8b774ebd77e82b94a00 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 16 Jan 2025 15:42:13 +0100
+Subject: [PATCH 03/10] OvmfPkg/QemuKernelLoaderFsDxe: allow longer file na=
mes
+
+QEMU_FW_CFG_FNAME_SIZE is 56. 'etc/boot/' prefix is minus 9.  Add one
+for the terminating '\0'.  Effective max size is 48.
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+CVE: CVE-2025-2296
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/adf385=
ecab69631952bdc8b774ebd77e82b94a00]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c b/OvmfP=
kg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
+index 1f63adda0b..0947b6bf2d 100644
+--- a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
++++ b/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
+@@ -33,7 +33,7 @@
+ // Static data that hosts the fw_cfg blobs and serves file requests.=0D
+ //=0D
+ typedef struct {=0D
+-  CHAR16    Name[8];=0D
++  CHAR16    Name[48];=0D
+   struct {=0D
+     FIRMWARE_CONFIG_ITEM    SizeKey;=0D
+     FIRMWARE_CONFIG_ITEM    DataKey;=0D
+@@ -43,7 +43,7 @@ typedef struct {
+ =0D
+ typedef struct KERNEL_BLOB KERNEL_BLOB;=0D
+ struct KERNEL_BLOB {=0D
+-  CHAR16         Name[8];=0D
++  CHAR16         Name[48];=0D
+   UINT32         Size;=0D
+   UINT8          *Data;=0D
+   KERNEL_BLOB    *Next;=0D
+--=20
+2.49.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-4.patch b/meta/recip=
es-core/ovmf/ovmf/CVE-2025-2296-4.patch
new file mode 100644
index 0000000000..bba3b51c78
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-4.patch
@@ -0,0 +1,34 @@
+From 1111e9fe7078eed9e5c50e1808776ee40a629e16 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 16 Jan 2025 15:52:54 +0100
+Subject: [PATCH 04/10] OvmfPkg/QemuKernelLoaderFsDxe: drop bogus assert
+
+Triggers when trying to get root directory info.
+Reproducer:
+ * Use qemu -kernel with something edk2 can not load.
+ * When dropped into the efi shell try inspect the file system.
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+CVE: CVE-2025-2296
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/1111e9=
fe7078eed9e5c50e1808776ee40a629e16]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c b/OvmfP=
kg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
+index 0947b6bf2d..3e1a876bf0 100644
+--- a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
++++ b/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
+@@ -290,7 +290,6 @@ QemuKernelBlobTypeToFileInfo (
+ =0D
+   NameSize     =3D (StrLen (Name) + 1) * 2;=0D
+   FileInfoSize =3D OFFSET_OF (EFI_FILE_INFO, FileName) + NameSize;=0D
+-  ASSERT (FileInfoSize >=3D sizeof *FileInfo);=0D
+ =0D
+   OriginalBufferSize =3D *BufferSize;=0D
+   *BufferSize        =3D FileInfoSize;=0D
+--=20
+2.49.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-5.patch b/meta/recip=
es-core/ovmf/ovmf/CVE-2025-2296-5.patch
new file mode 100644
index 0000000000..e3a8292356
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-5.patch
@@ -0,0 +1,36 @@
+From 46ae4e4b9574530e5081e98af0495d6f6d28379f Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 16 Jan 2025 16:03:01 +0100
+Subject: [PATCH 05/10] OvmfPkg/QemuKernelLoaderFsDxe: accept absolute paths
+
+EFI shell looks for "\startup.nsh".
+Try "-fw_cfg name=3Detc/boot/startup.nsh,string=3D'echo hello'" ;)
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+CVE: CVE-2025-2296
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/46ae4e=
4b9574530e5081e98af0495d6f6d28379f]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c b/OvmfP=
kg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
+index 3e1a876bf0..5b90420dad 100644
+--- a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
++++ b/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
+@@ -806,6 +806,11 @@ QemuKernelStubFileOpen (
+   //=0D
+   // Locate the file.=0D
+   //=0D
++  if (FileName[0] =3D=3D '\\') {=0D
++    // also accept absolute paths, i.e. '\kernel' for 'kernel'=0D
++    FileName++;=0D
++  }=0D
++=0D
+   Blob =3D FindKernelBlob (FileName);=0D
+ =0D
+   if (Blob =3D=3D NULL) {=0D
+--=20
+2.49.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-6.patch b/meta/recip=
es-core/ovmf/ovmf/CVE-2025-2296-6.patch
new file mode 100644
index 0000000000..3515efe008
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-6.patch
@@ -0,0 +1,54 @@
+From c45051450efbdae4a38f07998b3e7b77abe7173a Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Mon, 20 Jan 2025 11:28:37 +0100
+Subject: [PATCH 06/10] OvmfPkg/QemuKernelLoaderFsDxe: don't quit when named
+ blobs are present
+
+Allows to use the qemu kernel loader pseudo file system for other
+purposes than loading a linux kernel (or efi binary).  Passing
+startup.nsh for EFI shell is one example.
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+CVE: CVE-2025-2296
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/c45051=
450efbdae4a38f07998b3e7b77abe7173a]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c b/OvmfP=
kg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
+index 5b90420dad..add914daa8 100644
+--- a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
++++ b/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
+@@ -71,6 +71,7 @@ STATIC KERNEL_BLOB_ITEMS  mKernelBlobItems[] =3D {
+ =0D
+ STATIC KERNEL_BLOB  *mKernelBlobs;=0D
+ STATIC UINT64       mKernelBlobCount;=0D
++STATIC UINT64       mKernelNamedBlobCount;=0D
+ STATIC UINT64       mTotalBlobBytes;=0D
+ =0D
+ //=0D
+@@ -1139,6 +1140,8 @@ QemuKernelFetchNamedBlobs (
+       FreePool (DirEntry);=0D
+       return Status;=0D
+     }=0D
++=0D
++    mKernelNamedBlobCount++;=0D
+   }=0D
+ =0D
+   FreePool (DirEntry);=0D
+@@ -1218,8 +1221,8 @@ QemuKernelLoaderFsDxeEntrypoint (
+   }=0D
+ =0D
+   Blob =3D FindKernelBlob (L"kernel");=0D
+-  if (Blob =3D=3D NULL) {=0D
+-    DEBUG ((DEBUG_INFO, "%a: no kernel present -> quit\n", __func__));=0D
++  if ((Blob =3D=3D NULL) && (mKernelNamedBlobCount =3D=3D 0)) {=0D
++    DEBUG ((DEBUG_INFO, "%a: no kernel and no named blobs present -> quit=
\n", __func__));=0D
+     Status =3D EFI_NOT_FOUND;=0D
+     goto FreeBlobs;=0D
+   }=0D
+--=20
+2.49.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-7.patch b/meta/recip=
es-core/ovmf/ovmf/CVE-2025-2296-7.patch
new file mode 100644
index 0000000000..a9d9922695
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-7.patch
@@ -0,0 +1,124 @@
+From 3da39f2cb681eb69f4eef54acd4b25d25cd7103d Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Wed, 10 Apr 2024 17:25:03 +0200
+Subject: [PATCH 07/10] OvmfPkg/X86QemuLoadImageLib: support booting via sh=
im
+
+Try load shim first.  In case that succeeded update the command line to
+list 'kernel' first so shim will fetch the kernel from the kernel loader
+file system.
+
+This allows to use direct kernel boot with distro kernels and secure
+boot enabled.  Usually distro kernels can only be verified by distro
+shim using the distro keys compiled into the shim binary.
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+CVE: CVE-2025-2296
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/3da39f=
2cb681eb69f4eef54acd4b25d25cd7103d]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ .../X86QemuLoadImageLib/X86QemuLoadImageLib.c | 56 ++++++++++++++++++-
+ 1 file changed, 54 insertions(+), 2 deletions(-)
+
+diff --git a/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.c b/O=
vmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.c
+index a7ab43ca74..e4dbc2dc7e 100644
+--- a/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.c
++++ b/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.c
+@@ -57,6 +57,25 @@ STATIC CONST KERNEL_VENMEDIA_FILE_DEVPATH  mKernelDevic=
ePath =3D {
+   }=0D
+ };=0D
+ =0D
++STATIC CONST KERNEL_VENMEDIA_FILE_DEVPATH  mShimDevicePath =3D {=0D
++  {=0D
++    {=0D
++      MEDIA_DEVICE_PATH, MEDIA_VENDOR_DP,=0D
++      { sizeof (VENDOR_DEVICE_PATH)       }=0D
++    },=0D
++    QEMU_KERNEL_LOADER_FS_MEDIA_GUID=0D
++  },  {=0D
++    {=0D
++      MEDIA_DEVICE_PATH, MEDIA_FILEPATH_DP,=0D
++      { sizeof (KERNEL_FILE_DEVPATH)      }=0D
++    },=0D
++    L"shim",=0D
++  },  {=0D
++    END_DEVICE_PATH_TYPE, END_ENTIRE_DEVICE_PATH_SUBTYPE,=0D
++    { sizeof (EFI_DEVICE_PATH_PROTOCOL) }=0D
++  }=0D
++};=0D
++=0D
+ STATIC=0D
+ VOID=0D
+ FreeLegacyImage (=0D
+@@ -339,6 +358,7 @@ QemuLoadKernelImage (
+   UINTN                      CommandLineSize;=0D
+   CHAR8                      *CommandLine;=0D
+   UINTN                      InitrdSize;=0D
++  BOOLEAN                    Shim;=0D
+ =0D
+   //=0D
+   // Redundant assignment to work around GCC48/GCC49 limitations.=0D
+@@ -351,11 +371,35 @@ QemuLoadKernelImage (
+   Status =3D gBS->LoadImage (=0D
+                   FALSE,                    // BootPolicy: exact match re=
quired=0D
+                   gImageHandle,             // ParentImageHandle=0D
+-                  (EFI_DEVICE_PATH_PROTOCOL *)&mKernelDevicePath,=0D
++                  (EFI_DEVICE_PATH_PROTOCOL *)&mShimDevicePath,=0D
+                   NULL,                     // SourceBuffer=0D
+                   0,                        // SourceSize=0D
+                   &KernelImageHandle=0D
+                   );=0D
++  if (Status =3D=3D EFI_SUCCESS) {=0D
++    Shim =3D TRUE;=0D
++    DEBUG ((DEBUG_INFO, "%a: booting via shim\n", __func__));=0D
++  } else {=0D
++    Shim =3D FALSE;=0D
++    if (Status =3D=3D EFI_SECURITY_VIOLATION) {=0D
++      gBS->UnloadImage (KernelImageHandle);=0D
++    }=0D
++=0D
++    if (Status !=3D EFI_NOT_FOUND) {=0D
++      DEBUG ((DEBUG_INFO, "%a: LoadImage(shim): %r\n", __func__, Status))=
;=0D
++      return Status;=0D
++    }=0D
++=0D
++    Status =3D gBS->LoadImage (=0D
++                    FALSE,                  // BootPolicy: exact match re=
quired=0D
++                    gImageHandle,           // ParentImageHandle=0D
++                    (EFI_DEVICE_PATH_PROTOCOL *)&mKernelDevicePath,=0D
++                    NULL,                   // SourceBuffer=0D
++                    0,                      // SourceSize=0D
++                    &KernelImageHandle=0D
++                    );=0D
++  }=0D
++=0D
+   switch (Status) {=0D
+     case EFI_SUCCESS:=0D
+       break;=0D
+@@ -465,6 +509,13 @@ QemuLoadKernelImage (
+     KernelLoadedImage->LoadOptionsSize +=3D sizeof (L" initrd=3Dinitrd") =
- 2;=0D
+   }=0D
+ =0D
++  if (Shim) {=0D
++    //=0D
++    // Prefix 'kernel ' in UTF-16.=0D
++    //=0D
++    KernelLoadedImage->LoadOptionsSize +=3D sizeof (L"kernel ") - 2;=0D
++  }=0D
++=0D
+   if (KernelLoadedImage->LoadOptionsSize =3D=3D 0) {=0D
+     KernelLoadedImage->LoadOptions =3D NULL;=0D
+   } else {=0D
+@@ -485,7 +536,8 @@ QemuLoadKernelImage (
+     UnicodeSPrintAsciiFormat (=0D
+       KernelLoadedImage->LoadOptions,=0D
+       KernelLoadedImage->LoadOptionsSize,=0D
+-      "%a%a",=0D
++      "%a%a%a",=0D
++      (Shim =3D=3D FALSE)        ?  "" : "kernel ",=0D
+       (CommandLineSize =3D=3D 0) ?  "" : CommandLine,=0D
+       (InitrdSize =3D=3D 0)      ?  "" : " initrd=3Dinitrd"=0D
+       );=0D
+--=20
+2.49.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-8.patch b/meta/recip=
es-core/ovmf/ovmf/CVE-2025-2296-8.patch
new file mode 100644
index 0000000000..97d77883fd
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-8.patch
@@ -0,0 +1,125 @@
+From 4b507b49664514d7f09e6b7a9ca2da25a5e440fd Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 11 Apr 2024 08:15:22 +0200
+Subject: [PATCH 08/10] OvmfPkg/GenericQemuLoadImageLib: support booting via
+ shim
+
+Try load shim first.  In case that succeeded update the command line to
+list 'kernel' first so shim will fetch the kernel from the kernel loader
+file system.
+
+This allows to use direct kernel boot with distro kernels and secure
+boot enabled.  Usually distro kernels can only be verified by distro
+shim using the distro keys compiled into the shim binary.
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+CVE: CVE-2025-2296
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/4b507b=
49664514d7f09e6b7a9ca2da25a5e440fd]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ .../GenericQemuLoadImageLib.c                 | 56 ++++++++++++++++++-
+ 1 file changed, 54 insertions(+), 2 deletions(-)
+
+diff --git a/OvmfPkg/Library/GenericQemuLoadImageLib/GenericQemuLoadImageL=
ib.c b/OvmfPkg/Library/GenericQemuLoadImageLib/GenericQemuLoadImageLib.c
+index b99fb350aa..9d0ba77755 100644
+--- a/OvmfPkg/Library/GenericQemuLoadImageLib/GenericQemuLoadImageLib.c
++++ b/OvmfPkg/Library/GenericQemuLoadImageLib/GenericQemuLoadImageLib.c
+@@ -57,6 +57,25 @@ STATIC CONST KERNEL_VENMEDIA_FILE_DEVPATH  mKernelDevic=
ePath =3D {
+   }=0D
+ };=0D
+ =0D
++STATIC CONST KERNEL_VENMEDIA_FILE_DEVPATH  mShimDevicePath =3D {=0D
++  {=0D
++    {=0D
++      MEDIA_DEVICE_PATH, MEDIA_VENDOR_DP,=0D
++      { sizeof (VENDOR_DEVICE_PATH)       }=0D
++    },=0D
++    QEMU_KERNEL_LOADER_FS_MEDIA_GUID=0D
++  },  {=0D
++    {=0D
++      MEDIA_DEVICE_PATH, MEDIA_FILEPATH_DP,=0D
++      { sizeof (KERNEL_FILE_DEVPATH)      }=0D
++    },=0D
++    L"shim",=0D
++  },  {=0D
++    END_DEVICE_PATH_TYPE, END_ENTIRE_DEVICE_PATH_SUBTYPE,=0D
++    { sizeof (EFI_DEVICE_PATH_PROTOCOL) }=0D
++  }=0D
++};=0D
++=0D
+ STATIC CONST SINGLE_VENMEDIA_NODE_DEVPATH  mQemuKernelLoaderFsDevicePath =
=3D {=0D
+   {=0D
+     {=0D
+@@ -174,6 +193,7 @@ QemuLoadKernelImage (
+   UINTN                            CommandLineSize;=0D
+   CHAR8                            *CommandLine;=0D
+   UINTN                            InitrdSize;=0D
++  BOOLEAN                          Shim;=0D
+ =0D
+   //=0D
+   // Load the image. This should call back into the QEMU EFI loader file =
system.=0D
+@@ -181,11 +201,35 @@ QemuLoadKernelImage (
+   Status =3D gBS->LoadImage (=0D
+                   FALSE,                    // BootPolicy: exact match re=
quired=0D
+                   gImageHandle,             // ParentImageHandle=0D
+-                  (EFI_DEVICE_PATH_PROTOCOL *)&mKernelDevicePath,=0D
++                  (EFI_DEVICE_PATH_PROTOCOL *)&mShimDevicePath,=0D
+                   NULL,                     // SourceBuffer=0D
+                   0,                        // SourceSize=0D
+                   &KernelImageHandle=0D
+                   );=0D
++  if (Status =3D=3D EFI_SUCCESS) {=0D
++    Shim =3D TRUE;=0D
++    DEBUG ((DEBUG_INFO, "%a: booting via shim\n", __func__));=0D
++  } else {=0D
++    Shim =3D FALSE;=0D
++    if (Status =3D=3D EFI_SECURITY_VIOLATION) {=0D
++      gBS->UnloadImage (KernelImageHandle);=0D
++    }=0D
++=0D
++    if (Status !=3D EFI_NOT_FOUND) {=0D
++      DEBUG ((DEBUG_INFO, "%a: LoadImage(shim): %r\n", __func__, Status))=
;=0D
++      return Status;=0D
++    }=0D
++=0D
++    Status =3D gBS->LoadImage (=0D
++                    FALSE,        // BootPolicy: exact match required=0D
++                    gImageHandle, // ParentImageHandle=0D
++                    (EFI_DEVICE_PATH_PROTOCOL *)&mKernelDevicePath,=0D
++                    NULL,       // SourceBuffer=0D
++                    0,          // SourceSize=0D
++                    &KernelImageHandle=0D
++                    );=0D
++  }=0D
++=0D
+   switch (Status) {=0D
+     case EFI_SUCCESS:=0D
+       break;=0D
+@@ -303,6 +347,13 @@ QemuLoadKernelImage (
+     KernelLoadedImage->LoadOptionsSize +=3D sizeof (L" initrd=3Dinitrd") =
- 2;=0D
+   }=0D
+ =0D
++  if (Shim) {=0D
++    //=0D
++    // Prefix 'kernel ' in UTF-16.=0D
++    //=0D
++    KernelLoadedImage->LoadOptionsSize +=3D sizeof (L"kernel ") - 2;=0D
++  }=0D
++=0D
+   if (KernelLoadedImage->LoadOptionsSize =3D=3D 0) {=0D
+     KernelLoadedImage->LoadOptions =3D NULL;=0D
+   } else {=0D
+@@ -323,7 +374,8 @@ QemuLoadKernelImage (
+     UnicodeSPrintAsciiFormat (=0D
+       KernelLoadedImage->LoadOptions,=0D
+       KernelLoadedImage->LoadOptionsSize,=0D
+-      "%a%a",=0D
++      "%a%a%a",=0D
++      (Shim =3D=3D FALSE)        ?  "" : "kernel ",=0D
+       (CommandLineSize =3D=3D 0) ?  "" : CommandLine,=0D
+       (InitrdSize =3D=3D 0)      ?  "" : " initrd=3Dinitrd"=0D
+       );=0D
+--=20
+2.49.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-9.patch b/meta/recip=
es-core/ovmf/ovmf/CVE-2025-2296-9.patch
new file mode 100644
index 0000000000..8f0535cc4b
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-9.patch
@@ -0,0 +1,108 @@
+From 1549bf11cc94b135b6ad8fa5ebc34bdf7c18ba9c Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Tue, 17 Dec 2024 09:59:21 +0100
+Subject: [PATCH 09/10] OvmfPkg/X86QemuLoadImageLib: make legacy loader
+ configurable.
+
+Add the 'opt/org.tianocore/EnableLegacyLoader' FwCfg option to
+enable/disable the insecure legacy linux kernel loader.
+
+For now this is enabled by default.  Probably the default will be
+flipped to disabled at some point in the future.
+
+Also print a warning to the screen in case the linux kernel secure
+boot verification has failed.
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+CVE: CVE-2025-2296
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/1549bf=
11cc94b135b6ad8fa5ebc34bdf7c18ba9c]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ .../X86QemuLoadImageLib/X86QemuLoadImageLib.c | 48 ++++++++++++++++---
+ .../X86QemuLoadImageLib.inf                   |  1 +
+ 2 files changed, 42 insertions(+), 7 deletions(-)
+
+diff --git a/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.c b/O=
vmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.c
+index e4dbc2dc7e..2d610f6bd3 100644
+--- a/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.c
++++ b/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.c
+@@ -19,8 +19,10 @@
+ #include <Library/MemoryAllocationLib.h>=0D
+ #include <Library/PrintLib.h>=0D
+ #include <Library/QemuFwCfgLib.h>=0D
++#include <Library/QemuFwCfgSimpleParserLib.h>=0D
+ #include <Library/QemuLoadImageLib.h>=0D
+ #include <Library/UefiBootServicesTableLib.h>=0D
++#include <Library/UefiLib.h>=0D
+ #include <Protocol/DevicePath.h>=0D
+ #include <Protocol/LoadedImage.h>=0D
+ #include <Protocol/OvmfLoadedX86LinuxKernel.h>=0D
+@@ -421,13 +423,45 @@ QemuLoadKernelImage (
+     // Fall through=0D
+     //=0D
+     case EFI_ACCESS_DENIED:=0D
+-    //=0D
+-    // We are running with UEFI secure boot enabled, and the image failed=
 to=0D
+-    // authenticate. For compatibility reasons, we fall back to the legac=
y=0D
+-    // loader in this case.=0D
+-    //=0D
+-    // Fall through=0D
+-    //=0D
++      //=0D
++      // We are running with UEFI secure boot enabled, and the image fail=
ed to=0D
++      // authenticate. For compatibility reasons, we fall back to the leg=
acy=0D
++      // loader in this case (unless disabled via fw_cfg).=0D
++      //=0D
++    {=0D
++      EFI_STATUS  RetStatus;=0D
++      BOOLEAN     Enabled =3D TRUE;=0D
++=0D
++      AsciiPrint (=0D
++        "OVMF: Secure boot image verification failed.  Consider using the=
 '-shim'\n"=0D
++        "OVMF: command line switch for qemu (available in version 10.0 + =
newer).\n"=0D
++        "\n"=0D
++        );=0D
++=0D
++      RetStatus =3D QemuFwCfgParseBool (=0D
++                    "opt/org.tianocore/EnableLegacyLoader",=0D
++                    &Enabled=0D
++                    );=0D
++      if (EFI_ERROR (RetStatus)) {=0D
++        Enabled =3D TRUE;=0D
++      }=0D
++=0D
++      if (!Enabled) {=0D
++        AsciiPrint (=0D
++          "OVMF: Fallback to insecure legacy linux kernel loader is disab=
led.\n"=0D
++          "\n"=0D
++          );=0D
++        return EFI_ACCESS_DENIED;=0D
++      } else {=0D
++        AsciiPrint (=0D
++          "OVMF: Using legacy linux kernel loader (insecure and deprecate=
d).\n"=0D
++          "\n"=0D
++          );=0D
++        //=0D
++        // Fall through=0D
++        //=0D
++      }=0D
++    }=0D
+     case EFI_UNSUPPORTED:=0D
+       //=0D
+       // The image is not natively supported or cross-type supported. Let=
's try=0D
+diff --git a/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.inf b=
/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.inf
+index c7ec041cb7..09babd3be8 100644
+--- a/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.inf
++++ b/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.inf
+@@ -33,6 +33,7 @@
+   LoadLinuxLib=0D
+   PrintLib=0D
+   QemuFwCfgLib=0D
++  QemuFwCfgSimpleParserLib=0D
+   ReportStatusCodeLib=0D
+   UefiBootServicesTableLib=0D
+ =0D
+--=20
+2.49.0
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index badde30d97..fd5ff25dc9 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -29,6 +29,16 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branc=
h=3Dmaster;protocol=3Dhttps \
            file://0006-BaseTools-StringFuncs-fix-gcc-16-warning.patch \
            file://0007-BaseTools-EfiRom-fix-compiler-warning.patch \
            file://0008-BaseTools-Pccts-set-C-standard.patch \
+           file://0001-AmdSev-Halt-on-failed-blob-allocation.patch \
+           file://CVE-2025-2296-1.patch \
+           file://CVE-2025-2296-2.patch \
+           file://CVE-2025-2296-3.patch \
+           file://CVE-2025-2296-4.patch \
+           file://CVE-2025-2296-5.patch \
+           file://CVE-2025-2296-6.patch \
+           file://CVE-2025-2296-7.patch \
+           file://CVE-2025-2296-8.patch \
+           file://CVE-2025-2296-9.patch \
            "
=20
 PV =3D "edk2-stable202402"

