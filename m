Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EC9C2BA1A
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 11:05:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.70316.1718967939513278182
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 04:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=690294a050=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LA0WSr013142
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:05:38 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yvrmrgrsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:05:38 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 04:05:35 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][v2][PATCH 1/1] acpica: fix CVE-2024-24856
Date: Fri, 21 Jun 2024 11:05:09 +0000
Message-ID: <20240621110509.2992516-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: W0NHZuspPfdDpvSMB-dDdfLTmdt12Zzy
X-Proofpoint-ORIG-GUID: W0NHZuspPfdDpvSMB-dDdfLTmdt12Zzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_04,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxlogscore=827
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406210082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:05:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201019

From: Yogita Urade <yogita.urade@windriver.com>

The memory allocation function ACPI_ALLOCATE_ZEROED does not
guarantee a successful allocation, but the subsequent code
directly dereferences the pointer that receives it, which may
lead to null pointer dereference. To fix this issue, a null
pointer check should be added. If it is null, return exception
code AE_NO_MEMORY.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-24856

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../acpica/acpica/CVE-2024-24856.patch        | 33 +++++++++++++++++++
 .../acpica/acpica_20211217.bb                 |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/acpica/acpica/CVE-2024-24856.patch

diff --git a/meta/recipes-extended/acpica/acpica/CVE-2024-24856.patch b/meta/recipes-extended/acpica/acpica/CVE-2024-24856.patch
new file mode 100644
index 0000000000..beb6a79c8e
--- /dev/null
+++ b/meta/recipes-extended/acpica/acpica/CVE-2024-24856.patch
@@ -0,0 +1,33 @@
+From 4d4547cf13cca820ff7e0f859ba83e1a610b9fd0 Mon Sep 17 00:00:00 2001
+From: Huai-Yuan Liu <qq810974084@gmail.com>
+Date: Tue, 4 Jun 2024 11:52:15 +0000
+Subject: [PATCH] check null return of ACPI_ALLOCATE_ZEROED in
+
+AcpiDbConvertToPackage ACPI_ALLOCATE_ZEROED may fails, Elements
+might be null and will cause null pointer dereference later.
+
+Signed-off-by: Huai-Yuan Liu <qq810974084@gmail.com>
+
+CVE: CVE-2024-24856
+Upstream-Status: Backport [https://github.com/acpica/acpica/commit/4d4547cf13cca820ff7e0f859ba83e1a610b9fd0]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ source/components/debugger/dbconvert.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/source/components/debugger/dbconvert.c b/source/components/debugger/dbconvert.c
+index 55307d0..c17a5ab 100644
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
+--
+2.40.0
diff --git a/meta/recipes-extended/acpica/acpica_20211217.bb b/meta/recipes-extended/acpica/acpica_20211217.bb
index d1727c1dab..ec253b998f 100644
--- a/meta/recipes-extended/acpica/acpica_20211217.bb
+++ b/meta/recipes-extended/acpica/acpica_20211217.bb
@@ -16,7 +16,9 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
-SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
+SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz \
+           file://CVE-2024-24856.patch \
+          "
 SRC_URI[sha256sum] = "2511f85828820d747fa3e2c3433d3a38c22db3d9c2fd900e1a84eb4173cb5992"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
-- 
2.23.0


