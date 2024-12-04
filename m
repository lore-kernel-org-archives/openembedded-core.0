Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57558E77172
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:54:45 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.21448.1733334875785013471
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:54:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=A8MkFqaB;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so53690a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334875; x=1733939675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcEjMr/99jN/RcK0+b9NvEIW6MFQtgndNmd0CnNTB5A=;
        b=A8MkFqaBZCeJv/MivPkPY9Ynk0xZmG/W878lHwA8+1kUo6Jiqv8LdVqOKjxYlSh0Mm
         5GA7+ii7oHqH+F+hjl0sI56eg0oDkeeGg/fX576DbQRi+Q4ULtvRNGxPZUDaxJE+oIi6
         n7ZJQN4hjFkITc/q2Ddrp8kocqygZRIFGh2R2GCDrbd3TVP5lw8GhwXSod7I3S4GA1DP
         FrP2QextZsnMOh+LA5KWHM4I2YNX2C9yq3y7sh4YWnY2/MMaKwYiaBwBiG3qpW7YO5FJ
         41zTPVdiastxTCF9e4ufDDIjIYB7VmpEZ9citMulVLF7KzI+FysbTRw+clkHxJYCo8vB
         QX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334875; x=1733939675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcEjMr/99jN/RcK0+b9NvEIW6MFQtgndNmd0CnNTB5A=;
        b=pCi15HWyKG1lAm4ul4ymbPRwK9onglBAZ7tlNMzPd7oQxfjEl53hRL6hxkg7I7caQm
         lu8M4e0gMawhdsn9haR00VmA8k3lJ95IKnDEvP6dqn49s7qjA69BWK+4D66mUahKsUSQ
         STPAN3L9enikiTmDNcY4G4xHAQC15mW388g+3/p9AKu0UU9JhuuJ3krGiwD+DAksdFta
         FUbNBbLJ7rcmAYPAAMsGrjahZJVGNXzLBWIc4ndeBqROt5f/taVNu/rO5EqC7Mws9WQp
         RGmL3u+z5N2Au1wqHGQX9rqZI8YuY5rNb463XjypyeJ70vNZTyDTApNZzMix8K7IhCJ0
         P4LA==
X-Gm-Message-State: AOJu0YysWxMLPqDa2CQXYpaR4sHY7tjZ5z3jRhfLpHXnzUha+9vnZqsX
	3sBclgJlWHX/eIL2Yv6q+UN4fzjtzGDiJavc9bnO9WkYpEknVGb6d+lax7wEqP/6rPIouUCQKwi
	F
X-Gm-Gg: ASbGnct1k+yQdVrd8H7G6Y/NSA0BUTg7uIWFdDqS4iPvgQXTKxvVB+s8WdwCWuX1wII
	OKTdae0601L0GXZ3EuhLLv6LHeudxZOTcfFFB8EE4xWfWZ6A6r5cFhQ58hJ+AwDxVTWl2KpdcVA
	fQDhGkmAvRE2+RYrp3OdRrzjaXUBlpwCOkQ5PF82cjMIDcdwH2OlPg7j1hdXFXKXfwsd8j3qPco
	/j+qfSkiZKhio6ymGZQJs2gwxls82jM8Lw5heA=
X-Google-Smtp-Source: AGHT+IFhABVpq6yOH7vi28Jdwxnm+AyCPEq8GiYWimtCCle4OP046sI1d2kEw+QmI85P3hvqJl72/A==
X-Received: by 2002:a05:6a21:118e:b0:1e0:f059:cd4 with SMTP id adf61e73a8af0-1e16539f77cmr10550463637.4.1733334874848;
        Wed, 04 Dec 2024 09:54:34 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/38] ovmf: Fix CVE-2022-36765
Date: Wed,  4 Dec 2024 09:53:38 -0800
Message-Id: <260fc2182e6a83d7c93b2e8efd95255cd9168a79.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208294

From: Soumya Sambu <soumya.sambu@windriver.com>

EDK2 is susceptible to a vulnerability in the CreateHob() function,
allowing a user to trigger a integer overflow to buffer overflow
via a local network. Successful exploitation of this vulnerability
may result in a compromise of confidentiality, integrity, and/or
availability.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-36765

Upstream-patches:
https://github.com/tianocore/edk2/commit/59f024c76ee57c2bec84794536302fc770=
cd6ec2
https://github.com/tianocore/edk2/commit/aeaee8944f0eaacbf4cdf39279785b9ba4=
836bb6
https://github.com/tianocore/edk2/commit/9a75b030cf27d2530444e9a2f9f11867f7=
9bf679

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../ovmf/ovmf/CVE-2022-36765-0001.patch       | 179 ++++++++++++++++++
 .../ovmf/ovmf/CVE-2022-36765-0002.patch       | 157 +++++++++++++++
 .../ovmf/ovmf/CVE-2022-36765-0003.patch       | 135 +++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |   3 +
 4 files changed, 474 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0002.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0003.patch

diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0001.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2022-36765-0001.patch
new file mode 100644
index 0000000000..120cf66f6a
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0001.patch
@@ -0,0 +1,179 @@
+From 59f024c76ee57c2bec84794536302fc770cd6ec2 Mon Sep 17 00:00:00 2001
+From: Gua Guo <gua.guo@intel.com>
+Date: Thu, 11 Jan 2024 13:01:19 +0800
+Subject: [PATCH] UefiPayloadPkg/Hob: Integer Overflow in CreateHob()
+
+REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4166
+
+Fix integer overflow in various CreateHob instances.
+Fixes: CVE-2022-36765
+
+The CreateHob() function aligns the requested size to 8
+performing the following operation:
+```
+HobLength =3D (UINT16)((HobLength + 0x7) & (~0x7));
+```
+
+No checks are performed to ensure this value doesn't
+overflow, and could lead to CreateHob() returning a smaller
+HOB than requested, which could lead to OOB HOB accesses.
+
+Reported-by: Marc Beatove <mbeatove@google.com>
+Cc: Guo Dong <guo.dong@intel.com>
+Cc: Sean Rhodes <sean@starlabs.systems>
+Cc: James Lu <james.lu@intel.com>
+Reviewed-by: Gua Guo <gua.guo@intel.com>
+Cc: John Mathew <john.mathews@intel.com>
+Authored-by: Gerd Hoffmann <kraxel@redhat.com>
+Signed-off-by: Gua Guo <gua.guo@intel.com>
+
+CVE: CVE-2022-36765
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/59f024=
c76ee57c2bec84794536302fc770cd6ec2]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ .../Library/PayloadEntryHobLib/Hob.c          | 43 +++++++++++++++++++
+ .../UefiPayloadEntry/UniversalPayloadEntry.c  |  8 ++--
+ 2 files changed, 48 insertions(+), 3 deletions(-)
+
+diff --git a/UefiPayloadPkg/Library/PayloadEntryHobLib/Hob.c b/UefiPayload=
Pkg/Library/PayloadEntryHobLib/Hob.c
+index 2c3acbbc19..51c2e28d7d 100644
+--- a/UefiPayloadPkg/Library/PayloadEntryHobLib/Hob.c
++++ b/UefiPayloadPkg/Library/PayloadEntryHobLib/Hob.c
+@@ -110,6 +110,13 @@ CreateHob (
+ =0D
+   HandOffHob =3D GetHobList ();=0D
+ =0D
++  //=0D
++  // Check Length to avoid data overflow.=0D
++  //=0D
++  if (HobLength > MAX_UINT16 - 0x7) {=0D
++    return NULL;=0D
++  }=0D
++=0D
+   HobLength =3D (UINT16)((HobLength + 0x7) & (~0x7));=0D
+ =0D
+   FreeMemory =3D HandOffHob->EfiFreeMemoryTop - HandOffHob->EfiFreeMemory=
Bottom;=0D
+@@ -160,6 +167,9 @@ BuildResourceDescriptorHob (
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_RESOURCE_DESCRIPTOR, sizeof (EFI_HOB_RE=
SOURCE_DESCRIPTOR));=0D
+   ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->ResourceType      =3D ResourceType;=0D
+   Hob->ResourceAttribute =3D ResourceAttribute;=0D
+@@ -330,6 +340,10 @@ BuildModuleHob (
+     );=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_MEMORY_ALLOCATION, sizeof (EFI_HOB_MEMO=
RY_ALLOCATION_MODULE));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   CopyGuid (&(Hob->MemoryAllocationHeader.Name), &gEfiHobMemoryAllocModul=
eGuid);=0D
+   Hob->MemoryAllocationHeader.MemoryBaseAddress =3D MemoryAllocationModul=
e;=0D
+@@ -378,6 +392,11 @@ BuildGuidHob (
+   ASSERT (DataLength <=3D (0xffff - sizeof (EFI_HOB_GUID_TYPE)));=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_GUID_EXTENSION, (UINT16)(sizeof (EFI_HO=
B_GUID_TYPE) + DataLength));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return NULL;=0D
++  }=0D
++=0D
+   CopyGuid (&Hob->Name, Guid);=0D
+   return Hob + 1;=0D
+ }=0D
+@@ -441,6 +460,10 @@ BuildFvHob (
+   EFI_HOB_FIRMWARE_VOLUME  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_FV, sizeof (EFI_HOB_FIRMWARE_VOLUME));=
=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->BaseAddress =3D BaseAddress;=0D
+   Hob->Length      =3D Length;=0D
+@@ -472,6 +495,10 @@ BuildFv2Hob (
+   EFI_HOB_FIRMWARE_VOLUME2  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_FV2, sizeof (EFI_HOB_FIRMWARE_VOLUME2))=
;=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->BaseAddress =3D BaseAddress;=0D
+   Hob->Length      =3D Length;=0D
+@@ -513,6 +540,10 @@ BuildFv3Hob (
+   EFI_HOB_FIRMWARE_VOLUME3  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_FV3, sizeof (EFI_HOB_FIRMWARE_VOLUME3))=
;=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->BaseAddress          =3D BaseAddress;=0D
+   Hob->Length               =3D Length;=0D
+@@ -546,6 +577,10 @@ BuildCpuHob (
+   EFI_HOB_CPU  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_CPU, sizeof (EFI_HOB_CPU));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->SizeOfMemorySpace =3D SizeOfMemorySpace;=0D
+   Hob->SizeOfIoSpace     =3D SizeOfIoSpace;=0D
+@@ -583,6 +618,10 @@ BuildStackHob (
+     );=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_MEMORY_ALLOCATION, sizeof (EFI_HOB_MEMO=
RY_ALLOCATION_STACK));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   CopyGuid (&(Hob->AllocDescriptor.Name), &gEfiHobMemoryAllocStackGuid);=
=0D
+   Hob->AllocDescriptor.MemoryBaseAddress =3D BaseAddress;=0D
+@@ -664,6 +703,10 @@ BuildMemoryAllocationHob (
+     );=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_MEMORY_ALLOCATION, sizeof (EFI_HOB_MEMO=
RY_ALLOCATION));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   ZeroMem (&(Hob->AllocDescriptor.Name), sizeof (EFI_GUID));=0D
+   Hob->AllocDescriptor.MemoryBaseAddress =3D BaseAddress;=0D
+diff --git a/UefiPayloadPkg/UefiPayloadEntry/UniversalPayloadEntry.c b/Uef=
iPayloadPkg/UefiPayloadEntry/UniversalPayloadEntry.c
+index edb3c20471..abfe75bd7b 100644
+--- a/UefiPayloadPkg/UefiPayloadEntry/UniversalPayloadEntry.c
++++ b/UefiPayloadPkg/UefiPayloadEntry/UniversalPayloadEntry.c
+@@ -111,10 +111,12 @@ AddNewHob (
+   }=0D
+ =0D
+   NewHob.Header =3D CreateHob (Hob->Header->HobType, Hob->Header->HobLeng=
th);=0D
+-=0D
+-  if (NewHob.Header !=3D NULL) {=0D
+-    CopyMem (NewHob.Header + 1, Hob->Header + 1, Hob->Header->HobLength -=
 sizeof (EFI_HOB_GENERIC_HEADER));=0D
++  ASSERT (NewHob.Header !=3D NULL);=0D
++  if (NewHob.Header =3D=3D NULL) {=0D
++    return;=0D
+   }=0D
++=0D
++  CopyMem (NewHob.Header + 1, Hob->Header + 1, Hob->Header->HobLength - s=
izeof (EFI_HOB_GENERIC_HEADER));=0D
+ }=0D
+ =0D
+ /**=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0002.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2022-36765-0002.patch
new file mode 100644
index 0000000000..1209be27b5
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0002.patch
@@ -0,0 +1,157 @@
+From aeaee8944f0eaacbf4cdf39279785b9ba4836bb6 Mon Sep 17 00:00:00 2001
+From: Gua Guo <gua.guo@intel.com>
+Date: Thu, 11 Jan 2024 13:07:50 +0800
+Subject: [PATCH] EmbeddedPkg/Hob: Integer Overflow in CreateHob()
+
+REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4166
+
+Fix integer overflow in various CreateHob instances.
+Fixes: CVE-2022-36765
+
+The CreateHob() function aligns the requested size to 8
+performing the following operation:
+```
+HobLength =3D (UINT16)((HobLength + 0x7) & (~0x7));
+```
+
+No checks are performed to ensure this value doesn't
+overflow, and could lead to CreateHob() returning a smaller
+HOB than requested, which could lead to OOB HOB accesses.
+
+Reported-by: Marc Beatove <mbeatove@google.com>
+Cc: Leif Lindholm <quic_llindhol@quicinc.com>
+Reviewed-by: Ard Biesheuvel <ardb+tianocore@kernel.org>
+Cc: Abner Chang <abner.chang@amd.com>
+Cc: John Mathew <john.mathews@intel.com>
+Authored-by: Gerd Hoffmann <kraxel@redhat.com>
+Signed-off-by: Gua Guo <gua.guo@intel.com>
+
+CVE: CVE-2022-36765
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/aeaee8=
944f0eaacbf4cdf39279785b9ba4836bb6]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ EmbeddedPkg/Library/PrePiHobLib/Hob.c | 43 +++++++++++++++++++++++++++
+ 1 file changed, 43 insertions(+)
+
+diff --git a/EmbeddedPkg/Library/PrePiHobLib/Hob.c b/EmbeddedPkg/Library/P=
rePiHobLib/Hob.c
+index 8eb175aa96..cbc35152cc 100644
+--- a/EmbeddedPkg/Library/PrePiHobLib/Hob.c
++++ b/EmbeddedPkg/Library/PrePiHobLib/Hob.c
+@@ -110,6 +110,13 @@ CreateHob (
+ =0D
+   HandOffHob =3D GetHobList ();=0D
+ =0D
++  //=0D
++  // Check Length to avoid data overflow.=0D
++  //=0D
++  if (HobLength > MAX_UINT16 - 0x7) {=0D
++    return NULL;=0D
++  }=0D
++=0D
+   HobLength =3D (UINT16)((HobLength + 0x7) & (~0x7));=0D
+ =0D
+   FreeMemory =3D HandOffHob->EfiFreeMemoryTop - HandOffHob->EfiFreeMemory=
Bottom;=0D
+@@ -160,6 +167,9 @@ BuildResourceDescriptorHob (
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_RESOURCE_DESCRIPTOR, sizeof (EFI_HOB_RE=
SOURCE_DESCRIPTOR));=0D
+   ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->ResourceType      =3D ResourceType;=0D
+   Hob->ResourceAttribute =3D ResourceAttribute;=0D
+@@ -401,6 +411,10 @@ BuildModuleHob (
+     );=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_MEMORY_ALLOCATION, sizeof (EFI_HOB_MEMO=
RY_ALLOCATION_MODULE));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   CopyGuid (&(Hob->MemoryAllocationHeader.Name), &gEfiHobMemoryAllocModul=
eGuid);=0D
+   Hob->MemoryAllocationHeader.MemoryBaseAddress =3D MemoryAllocationModul=
e;=0D
+@@ -449,6 +463,11 @@ BuildGuidHob (
+   ASSERT (DataLength <=3D (0xffff - sizeof (EFI_HOB_GUID_TYPE)));=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_GUID_EXTENSION, (UINT16)(sizeof (EFI_HO=
B_GUID_TYPE) + DataLength));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return NULL;=0D
++  }=0D
++=0D
+   CopyGuid (&Hob->Name, Guid);=0D
+   return Hob + 1;=0D
+ }=0D
+@@ -512,6 +531,10 @@ BuildFvHob (
+   EFI_HOB_FIRMWARE_VOLUME  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_FV, sizeof (EFI_HOB_FIRMWARE_VOLUME));=
=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->BaseAddress =3D BaseAddress;=0D
+   Hob->Length      =3D Length;=0D
+@@ -543,6 +566,10 @@ BuildFv2Hob (
+   EFI_HOB_FIRMWARE_VOLUME2  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_FV2, sizeof (EFI_HOB_FIRMWARE_VOLUME2))=
;=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->BaseAddress =3D BaseAddress;=0D
+   Hob->Length      =3D Length;=0D
+@@ -584,6 +611,10 @@ BuildFv3Hob (
+   EFI_HOB_FIRMWARE_VOLUME3  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_FV3, sizeof (EFI_HOB_FIRMWARE_VOLUME3))=
;=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->BaseAddress          =3D BaseAddress;=0D
+   Hob->Length               =3D Length;=0D
+@@ -639,6 +670,10 @@ BuildCpuHob (
+   EFI_HOB_CPU  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_CPU, sizeof (EFI_HOB_CPU));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->SizeOfMemorySpace =3D SizeOfMemorySpace;=0D
+   Hob->SizeOfIoSpace     =3D SizeOfIoSpace;=0D
+@@ -676,6 +711,10 @@ BuildStackHob (
+     );=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_MEMORY_ALLOCATION, sizeof (EFI_HOB_MEMO=
RY_ALLOCATION_STACK));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   CopyGuid (&(Hob->AllocDescriptor.Name), &gEfiHobMemoryAllocStackGuid);=
=0D
+   Hob->AllocDescriptor.MemoryBaseAddress =3D BaseAddress;=0D
+@@ -756,6 +795,10 @@ BuildMemoryAllocationHob (
+     );=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_MEMORY_ALLOCATION, sizeof (EFI_HOB_MEMO=
RY_ALLOCATION));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   ZeroMem (&(Hob->AllocDescriptor.Name), sizeof (EFI_GUID));=0D
+   Hob->AllocDescriptor.MemoryBaseAddress =3D BaseAddress;=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0003.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2022-36765-0003.patch
new file mode 100644
index 0000000000..9579205e09
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0003.patch
@@ -0,0 +1,135 @@
+From 9a75b030cf27d2530444e9a2f9f11867f79bf679 Mon Sep 17 00:00:00 2001
+From: Gua Guo <gua.guo@intel.com>
+Date: Thu, 11 Jan 2024 13:03:26 +0800
+Subject: [PATCH] StandaloneMmPkg/Hob: Integer Overflow in CreateHob()
+
+REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4166
+
+Fix integer overflow in various CreateHob instances.
+Fixes: CVE-2022-36765
+
+The CreateHob() function aligns the requested size to 8
+performing the following operation:
+```
+HobLength =3D (UINT16)((HobLength + 0x7) & (~0x7));
+```
+
+No checks are performed to ensure this value doesn't
+overflow, and could lead to CreateHob() returning a smaller
+HOB than requested, which could lead to OOB HOB accesses.
+
+Reported-by: Marc Beatove <mbeatove@google.com>
+Reviewed-by: Ard Biesheuvel <ardb+tianocore@kernel.org>
+Cc: Sami Mujawar <sami.mujawar@arm.com>
+Reviewed-by: Ray Ni <ray.ni@intel.com>
+Cc: John Mathew <john.mathews@intel.com>
+Authored-by: Gerd Hoffmann <kraxel@redhat.com>
+Signed-off-by: Gua Guo <gua.guo@intel.com>
+
+CVE: CVE-2022-36765
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/9a75b0=
30cf27d2530444e9a2f9f11867f79bf679]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ .../Arm/StandaloneMmCoreHobLib.c              | 35 +++++++++++++++++++
+ 1 file changed, 35 insertions(+)
+
+diff --git a/StandaloneMmPkg/Library/StandaloneMmCoreHobLib/Arm/Standalone=
MmCoreHobLib.c b/StandaloneMmPkg/Library/StandaloneMmCoreHobLib/Arm/Standal=
oneMmCoreHobLib.c
+index 1550e1babc..59473e28fe 100644
+--- a/StandaloneMmPkg/Library/StandaloneMmCoreHobLib/Arm/StandaloneMmCoreH=
obLib.c
++++ b/StandaloneMmPkg/Library/StandaloneMmCoreHobLib/Arm/StandaloneMmCoreH=
obLib.c
+@@ -34,6 +34,13 @@ CreateHob (
+ =0D
+   HandOffHob =3D GetHobList ();=0D
+ =0D
++  //=0D
++  // Check Length to avoid data overflow.=0D
++  //=0D
++  if (HobLength > MAX_UINT16 - 0x7) {=0D
++    return NULL;=0D
++  }=0D
++=0D
+   HobLength =3D (UINT16)((HobLength + 0x7) & (~0x7));=0D
+ =0D
+   FreeMemory =3D HandOffHob->EfiFreeMemoryTop - HandOffHob->EfiFreeMemory=
Bottom;=0D
+@@ -89,6 +96,10 @@ BuildModuleHob (
+     );=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_MEMORY_ALLOCATION, sizeof (EFI_HOB_MEMO=
RY_ALLOCATION_MODULE));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   CopyGuid (&(Hob->MemoryAllocationHeader.Name), &gEfiHobMemoryAllocModul=
eGuid);=0D
+   Hob->MemoryAllocationHeader.MemoryBaseAddress =3D MemoryAllocationModul=
e;=0D
+@@ -129,6 +140,9 @@ BuildResourceDescriptorHob (
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_RESOURCE_DESCRIPTOR, sizeof (EFI_HOB_RE=
SOURCE_DESCRIPTOR));=0D
+   ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->ResourceType      =3D ResourceType;=0D
+   Hob->ResourceAttribute =3D ResourceAttribute;=0D
+@@ -167,6 +181,11 @@ BuildGuidHob (
+   ASSERT (DataLength <=3D (0xffff - sizeof (EFI_HOB_GUID_TYPE)));=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_GUID_EXTENSION, (UINT16)(sizeof (EFI_HO=
B_GUID_TYPE) + DataLength));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return NULL;=0D
++  }=0D
++=0D
+   CopyGuid (&Hob->Name, Guid);=0D
+   return Hob + 1;=0D
+ }=0D
+@@ -226,6 +245,10 @@ BuildFvHob (
+   EFI_HOB_FIRMWARE_VOLUME  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_FV, sizeof (EFI_HOB_FIRMWARE_VOLUME));=
=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->BaseAddress =3D BaseAddress;=0D
+   Hob->Length      =3D Length;=0D
+@@ -255,6 +278,10 @@ BuildFv2Hob (
+   EFI_HOB_FIRMWARE_VOLUME2  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_FV2, sizeof (EFI_HOB_FIRMWARE_VOLUME2))=
;=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->BaseAddress =3D BaseAddress;=0D
+   Hob->Length      =3D Length;=0D
+@@ -282,6 +309,10 @@ BuildCpuHob (
+   EFI_HOB_CPU  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_CPU, sizeof (EFI_HOB_CPU));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->SizeOfMemorySpace =3D SizeOfMemorySpace;=0D
+   Hob->SizeOfIoSpace     =3D SizeOfIoSpace;=0D
+@@ -319,6 +350,10 @@ BuildMemoryAllocationHob (
+     );=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_MEMORY_ALLOCATION, sizeof (EFI_HOB_MEMO=
RY_ALLOCATION));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   ZeroMem (&(Hob->AllocDescriptor.Name), sizeof (EFI_GUID));=0D
+   Hob->AllocDescriptor.MemoryBaseAddress =3D BaseAddress;=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index dbfed086e4..1dba709824 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -50,6 +50,9 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://CVE-2023-45237-0001.patch \
            file://CVE-2023-45237-0002.patch \
            file://CVE-2023-45236.patch \
+           file://CVE-2022-36765-0001.patch \
+           file://CVE-2022-36765-0002.patch \
+           file://CVE-2022-36765-0003.patch \
            "
=20
 PV =3D "edk2-stable202202"
--=20
2.34.1


