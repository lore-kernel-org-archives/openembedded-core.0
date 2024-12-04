Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548DFE77170
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:54:45 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.21197.1733334879008941957
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:54:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rgwVVNGv;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7fc99fc2b16so46835a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334878; x=1733939678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Kgr+YV/AMuhRkdy5majxLUeQrF9P2N7YPj3o77rr5c=;
        b=rgwVVNGvvpMK7zPk4N28mgT2Fm02ylxfFw4ltU8OPdFtfSFsznLD2R4B6ETuIZN2yt
         BTLYcVHq1klVdwYMlQUb98K7mEhw6kJoXywkUJZoVmt10AVxYFTS70zz0tjQ0jHesRZt
         ljnw9RqGAozkMf6DN58AiL0hkZnv7qELzNm5l1vmdB5v1mw60JgBJdi9ny0qpcoNBGfm
         ONI9bQdyR0SC2qUnTp5WFgoCQItaH473BmY8KZ8AebZFbJ0guvgrDvwXuhj4bb4oHlaB
         b2lcYZ8/On/qlfaKlqrWx8Y6H8aUxs/5DjfrudxC5A5tk2OwGMiVRyITpocaHXQMgE3S
         CXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334878; x=1733939678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Kgr+YV/AMuhRkdy5majxLUeQrF9P2N7YPj3o77rr5c=;
        b=dsrShYz21KWKJqHxL2qOfaEMSyLdEQDEqTYFP/jEhVhgAhMKPi8pRpkdtoIFOTyF2G
         8mh3SNPCdv9GSzP3zj1HD4Z9ggQPLzbJJGJr7xD/V0+4d2nSw0cZzdSOCg/rA+h/+ggj
         2rVKTCdolhKjR9Nrx4mYPxONaSR96NWeYuyBc4oRcSQyI+Hr1L0qjaoKmcJ0kbUtL2RY
         GQn/KgOth0746syCDNSXVv37fkZBisqYVMHBv1+JNjVWe5PO8i4WTYmBQ9wta0MN3Lk6
         tzd86nIlv84Y0izRKpDd+dOVaNL6783r3p60082tOpvXGhIrUL28BhINP7AY+dCncwdp
         J11g==
X-Gm-Message-State: AOJu0Yzxx6Rjv6CCyDtinU2LCE0VEeG7FnysqfhpnBeECRqe0RfwPX/2
	VfR3UskoatKy+sjA/xmHl199mkfIjOBJq8mZ3socKx8CeMWABfrNUNHYb3/3oZkkwUBnc73ekSu
	o
X-Gm-Gg: ASbGncupMR7c3Kk7Wydqaicp/NOypTcp1Df/mSUvgN9IxrX+gbZkDvpqCLdlN/8clxK
	1wn/VHor5WiUgJmWgkdnx2omaTt2yCrIWFOjf7YqfFDPaJTA01+SObutZvgcrmqu9mvvh237OUA
	N2sF6PrQR7NbwCWtojH5EhPd4F3XkpLFPQR6QF/wDq+ZUT7Sak+jgqBa190g9ZzskAFrh280u4+
	FTa/GiBOmIlHfLdqO/1SMKThwh/+qPCJM2CSDg=
X-Google-Smtp-Source: AGHT+IFQX4nGZ1Rnbi/nF6LUZIhih0ym308+kR990iKr6Rx77n8v0SvGo5vOSs+RbLK5boRNr2c0sw==
X-Received: by 2002:a05:6a20:7f8f:b0:1e0:d333:2b9d with SMTP id adf61e73a8af0-1e1653c5227mr11247586637.22.1733334878172;
        Wed, 04 Dec 2024 09:54:38 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/38] ovmf: fix CVE-2024-1298
Date: Wed,  4 Dec 2024 09:53:40 -0800
Message-Id: <af65d3e221fb239c2dd769ce109e78c720e35793.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208296

From: Hongxu Jia <hongxu.jia@windriver.com>

Backport a fix from upstream to resolve CVE-2024-1298

    https://github.com/tianocore/edk2/commit/284dbac43da752ee34825c8b3f6f9e=
8281cb5a19

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
index 0000000000..7480f8722e
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-Potential-UINT32-overfl=
ow-in-S3-ResumeC.patch
@@ -0,0 +1,51 @@
+From 63f29c180dd04d13614440740a8795ee422567b8 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 22 Nov 2024 17:43:28 +0800
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
+index 2f2b2a80b2..2ba9215226 100644
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
index e626d306a4..a067dd017b 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -54,6 +54,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://CVE-2022-36765-0002.patch \
            file://CVE-2022-36765-0003.patch \
            file://0001-MdePkg-Fix-overflow-issue-in-BasePeCoffLib.patch \
+           file://0001-MdeModulePkg-Potential-UINT32-overflow-in-S3-Resume=
C.patch \
            "
=20
 PV =3D "edk2-stable202202"
--=20
2.34.1


