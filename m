Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCA0D3B7D7
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 04:55:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12130.1732510548555689215
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 20:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10598c1d70=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP4s2OF032252
	for <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 20:55:48 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433b799d00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 20:55:47 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 24 Nov 2024 20:55:47 -0800
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 24 Nov 2024 20:55:46 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH] acpica: fix CVE-2024-24856
Date: Mon, 25 Nov 2024 12:55:45 +0800
Message-ID: <20241125045545.3821180-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=atbgCjZV c=1 sm=1 tr=0 ts=67440354 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=_OkILIDVsgnTJI8HqdYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: T-jMegxDu7LVEIoJEo7qQ11joQN2-vCP
X-Proofpoint-ORIG-GUID: T-jMegxDu7LVEIoJEo7qQ11joQN2-vCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-25_02,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=854 bulkscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411250040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207719

From: Changqing Li <changqing.li@windriver.com>

The memory allocation function ACPI_ALLOCATE_ZEROED does not guarantee a
successful allocation, but the subsequent code directly dereferences the
pointer that receives it, which may lead to null pointer dereference. To
fix this issue, a null pointer check should be added. If it is null,
return exception code AE_NO_MEMORY.

Refer: https://nvd.nist.gov/vuln/detail/CVE-2024-24856

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../acpica/acpica_20240322.bb                 |  3 +-
 .../acpica/files/CVE-2024-24856.patch         | 31 +++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/acpica/files/CVE-2024-24856.patch

diff --git a/meta/recipes-extended/acpica/acpica_20240322.bb b/meta/recipes-extended/acpica/acpica_20240322.bb
index 90e3599d32..1f93c0d435 100644
--- a/meta/recipes-extended/acpica/acpica_20240322.bb
+++ b/meta/recipes-extended/acpica/acpica_20240322.bb
@@ -16,7 +16,8 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
-SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master"
+SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master \
+           file://CVE-2024-24856.patch"
 SRCREV = "170fc3076a86777077637f10b05c32ac21ac13aa"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-extended/acpica/files/CVE-2024-24856.patch b/meta/recipes-extended/acpica/files/CVE-2024-24856.patch
new file mode 100644
index 0000000000..c0c9c00d12
--- /dev/null
+++ b/meta/recipes-extended/acpica/files/CVE-2024-24856.patch
@@ -0,0 +1,31 @@
+From 4d4547cf13cca820ff7e0f859ba83e1a610b9fd0 Mon Sep 17 00:00:00 2001
+From: Huai-Yuan Liu <qq810974084@gmail.com>
+Date: Tue, 9 Apr 2024 23:23:39 +0800
+Subject: [PATCH] check null return of ACPI_ALLOCATE_ZEROED in
+ AcpiDbConvertToPackage
+
+ACPI_ALLOCATE_ZEROED may fails, Elements might be null and will cause null pointer dereference later.
+
+Signed-off-by: Huai-Yuan Liu <qq810974084@gmail.com>
+
+CVE: CVE-2024-24856
+Upstream-Status: Backport [https://github.com/acpica/acpica/pull/946/commits/4d4547cf13cca820ff7e0f859ba83e1a610b9fd0]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ source/components/debugger/dbconvert.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/source/components/debugger/dbconvert.c b/source/components/debugger/dbconvert.c
+index 6a41000036..32ad5be179 100644
+--- a/source/components/debugger/dbconvert.c
++++ b/source/components/debugger/dbconvert.c
+@@ -354,6 +354,8 @@ AcpiDbConvertToPackage (
+ 
+     Elements = ACPI_ALLOCATE_ZEROED (
+         DB_DEFAULT_PKG_ELEMENTS * sizeof (ACPI_OBJECT));
++    if (!Elements)
++        return (AE_NO_MEMORY);
+ 
+     This = String;
+     for (i = 0; i < (DB_DEFAULT_PKG_ELEMENTS - 1); i++)
-- 
2.25.1


