Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D5AD5A6D8
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 03:26:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.37926.1732591615333369055
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 19:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1060df9989=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ3P2An027587;
	Mon, 25 Nov 2024 19:26:55 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433feq2cuu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 25 Nov 2024 19:26:54 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 25 Nov 2024 19:26:53 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 25 Nov 2024 19:26:53 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>
Subject: [scarthgap][PATCH V2 2/2] ovmf: fix CVE-2024-1298
Date: Mon, 25 Nov 2024 19:26:53 -0800
Message-ID: <20241126032653.326194-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126032653.326194-1-hongxu.jia@windriver.com>
References: <20241126032653.326194-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=c+L5Qg9l c=1 sm=1 tr=0 ts=67453ffe cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=hqBzw_eTAAAA:8 a=t7CeM3EgAAAA:8 a=QyXUC8HyAAAA:8 a=jYJ61ryfAAAA:8
 a=J6owyr6zO-tr3Sa6r84A:9 a=bkWp_v3HvcftT6DRAIDL:22 a=FdTzh2GWekK77mhwV6Dw:22 a=eNvJ01k53lG8zT5pDJgy:22
X-Proofpoint-ORIG-GUID: R-y48dPYnOyJtOSfi6lmc-M9qQYF_iHz
X-Proofpoint-GUID: R-y48dPYnOyJtOSfi6lmc-M9qQYF_iHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_02,2024-11-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411260027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 03:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207840

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
2.25.1


