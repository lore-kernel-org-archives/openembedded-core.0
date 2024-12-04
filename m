Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4659E77172
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:36:36 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.25144.1733344592859592643
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FR+XgQGx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fc41b4c78bso141051a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733344592; x=1733949392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOQ36W8rmXlMScGBnZA1E61dv4T0j4EZod5jTs94SuE=;
        b=FR+XgQGxXTSvQcJ+cj8DLvN+IJZgS8D8mqN9IJu5wes03wf8XJ/VPJnLCsQbtGwks6
         qyLsbetY+UKgQTPfoDHFVsEcKIbjdV70M0ZVwmZYDOOw+pnW34Th7tIBNSOsRMRD/uEw
         nQIxFpArneaCnYlg6szGcIVBQDWDK/ww7VQWQ69Zml6dE6uVOndD2PtI8pTX8IZJosPR
         xaBJg0JUhbStrFlLqvXr7Fkbs6Yt6UP/UFTheOT2Ez/P8tNEKjb7PPqhdEL+YpC2mUxw
         WL1RjK0N7BMgsk6uPchMUmsLNg3uAsBT3cCOtIDrfYU/AHf77RbpysaSJiuG1o2AD2r5
         TU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344592; x=1733949392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOQ36W8rmXlMScGBnZA1E61dv4T0j4EZod5jTs94SuE=;
        b=syTjFYDKABhUdU84Dot4DpabCeE64rNtZmEXEFGQ9g0lZmTlHm+YxmhfkxgvbcCRKr
         tmKjbi4/5yuXAyqaZpKjKdfG+VyJGQlL+3oof/UmkWAD7BM+zv8yBYd4SwNIcyP794Dm
         nR28R58aSmpMzvMlccBQ/BeynU5AXQVyI/NlIgfUq8ncTU8XGT3SwN1Ehmm8YrfwGuI0
         e4bi+mDaF+2BxXZjinLdKFu2szIcKL0ygI7kikGlHyoEJu2I73ptWn7BJPeisPCxSj9u
         /p5Q3F3zOxSqiWFECebXOLX2D1q+9OreYurmNT/eR7zkcZEwAycuR4y5zCtcJj6/sP9y
         EqcQ==
X-Gm-Message-State: AOJu0YysKq+Z0qPnHPeLGFfRIdzlly1ivJtUZ8bUkQFK9hiTzaJ6Z08r
	4cGWVO7I+kJjpxnPvIIiSb7Mp6Pi6KB6rOKoAfb8PAjRpSJzmN6+m/SAElPU0udT4aum8dUZ56s
	p
X-Gm-Gg: ASbGncuat1QKLLkqXi5+AThCIPUY81JxPcTFJ85JS3M669qI4wvUfSMYueISU7Jjxxv
	eDYtfWwJWwG/PMMp7fK93Xn7yjTF0Syd8G5H9GkOcQ2qRz9QDvmwAedfgSJLsIYHqp9a7dTbggG
	46UqKuhpuA4Hap52NVnsPqNuHjragQ00H+3uqoOitHXPq8hWLEAt+CP46SxIPoJanYDjZ18EjuZ
	avDjMTAbDwps2cFy8nCf+9CAae8EGZpxQ9/3aY=
X-Google-Smtp-Source: AGHT+IFp+MdGzNXvDOo43CFUM9tYHVS/0fkJv0NwWCL5sUBehMwfhCVCIOsq1BtKgYWFXRCn2PNv5w==
X-Received: by 2002:a05:6a20:7f83:b0:1db:e90a:6b24 with SMTP id adf61e73a8af0-1e1653d0286mr12968915637.25.1733344592083;
        Wed, 04 Dec 2024 12:36:32 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f3d7sm12827805b3a.55.2024.12.04.12.36.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:36:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/15] ovmf: fix CVE-2024-1298
Date: Wed,  4 Dec 2024 12:36:09 -0800
Message-Id: <2a6825a8ad6e5a600e458614ff7bb676ec9c5fac.1733344462.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733344462.git.steve@sakoman.com>
References: <cover.1733344462.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208330

From: Hongxu Jia <hongxu.jia@windriver.com>

Backport fix from upstream to resolve CVE-2024-1298

  https://github.com/tianocore/edk2/commit/284dbac43da752ee34825c8b3f6f9e82=
81cb5a19

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ential-UINT32-overflow-in-S3-ResumeC.patch | 51 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-Potential=
-UINT32-overflow-in-S3-ResumeC.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-Potential-UINT32=
-overflow-in-S3-ResumeC.patch b/meta/recipes-core/ovmf/ovmf/0001-MdeModuleP=
kg-Potential-UINT32-overflow-in-S3-ResumeC.patch
new file mode 100644
index 0000000000..264820138f
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-Potential-UINT32-overfl=
ow-in-S3-ResumeC.patch
@@ -0,0 +1,51 @@
+From 150ea3ea4c821b133a782eeb33ef2a9c8fd8d7c3 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 22 Nov 2024 13:05:57 +0800
+Subject: [PATCH] MdeModulePkg: Potential UINT32 overflow in S3 ResumeCount
+
+REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4677
+
+Attacker able to modify physical memory and ResumeCount.
+System will crash/DoS when ResumeCount reaches its MAX_UINT32.
+
+Cc: Zhiguang Liu <zhiguang.liu@intel.com>
+Cc: Dandan Bi <dandan.bi@intel.com>
+Cc: Liming Gao <gaoliming@byosoft.com.cn>
+
+Signed-off-by: Pakkirisamy ShanmugavelX <shanmugavelx.pakkirisamy@intel.co=
m>
+Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>
+
+CVE: CVE-2024-1298
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/284dba=
c43da752ee34825c8b3f6f9e8281cb5a19]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ .../FirmwarePerformancePei.c                         | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/MdeModulePkg/Universal/Acpi/FirmwarePerformanceDataTablePei/F=
irmwarePerformancePei.c b/MdeModulePkg/Universal/Acpi/FirmwarePerformanceDa=
taTablePei/FirmwarePerformancePei.c
+index 2f2b2a8..2ba9215 100644
+--- a/MdeModulePkg/Universal/Acpi/FirmwarePerformanceDataTablePei/Firmware=
PerformancePei.c
++++ b/MdeModulePkg/Universal/Acpi/FirmwarePerformanceDataTablePei/Firmware=
PerformancePei.c
+@@ -112,11 +112,15 @@ FpdtStatusCodeListenerPei (
+   //=0D
+   S3ResumeTotal =3D MultU64x32 (AcpiS3ResumeRecord->AverageResume, AcpiS3=
ResumeRecord->ResumeCount);=0D
+   AcpiS3ResumeRecord->ResumeCount++;=0D
+-  AcpiS3ResumeRecord->AverageResume =3D DivU64x32 (S3ResumeTotal + AcpiS3=
ResumeRecord->FullResume, AcpiS3ResumeRecord->ResumeCount);=0D
++  if (AcpiS3ResumeRecord->ResumeCount > 0) {=0D
++    AcpiS3ResumeRecord->AverageResume =3D DivU64x32 (S3ResumeTotal + Acpi=
S3ResumeRecord->FullResume, AcpiS3ResumeRecord->ResumeCount);=0D
++    DEBUG ((DEBUG_INFO, "\nFPDT: S3 Resume Performance - AverageResume =
=3D 0x%x\n", AcpiS3ResumeRecord->AverageResume));=0D
++  } else {=0D
++    DEBUG ((DEBUG_ERROR, "\nFPDT: S3 ResumeCount reaches the MAX_UINT32 v=
alue. S3 ResumeCount record reset to Zero."));=0D
++  }=0D
+ =0D
+-  DEBUG ((DEBUG_INFO, "FPDT: S3 Resume Performance - ResumeCount   =3D %d=
\n", AcpiS3ResumeRecord->ResumeCount));=0D
+-  DEBUG ((DEBUG_INFO, "FPDT: S3 Resume Performance - FullResume    =3D %l=
d\n", AcpiS3ResumeRecord->FullResume));=0D
+-  DEBUG ((DEBUG_INFO, "FPDT: S3 Resume Performance - AverageResume =3D %l=
d\n", AcpiS3ResumeRecord->AverageResume));=0D
++  DEBUG ((DEBUG_INFO, "FPDT: S3 Resume Performance - ResumeCount   =3D 0x=
%x\n", AcpiS3ResumeRecord->ResumeCount));=0D
++  DEBUG ((DEBUG_INFO, "FPDT: S3 Resume Performance - FullResume    =3D 0x=
%x\n", AcpiS3ResumeRecord->FullResume));=0D
+ =0D
+   //=0D
+   // Update S3 Suspend Performance Record.=0D
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index cc2ac4268c..ada6ee72db 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -25,6 +25,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
            file://0001-MdePkg-Fix-overflow-issue-in-BasePeCoffLib.patch \
+           file://0001-MdeModulePkg-Potential-UINT32-overflow-in-S3-Resume=
C.patch \
            "
=20
 PV =3D "edk2-stable202402"
--=20
2.34.1


