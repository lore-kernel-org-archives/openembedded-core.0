Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8359EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 10:24:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4451.1687170262509056246
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 03:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jSkqRkjs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55342238ed=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J8CuGh004627
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 10:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=5GU8zMkKSG5YCCoYcx1aETeUtbRen6pvTClWoVO9gzU=;
 b=jSkqRkjsP7Z2+Ew0wIJ0K58MZZ6MXMKYdLJe7tGNafPYmOxEHNs+fmI9TY4t64tIz8+g
 EcGihOaoKcK5Va/k+Z1IpClL7sC9zZ3ZTPaeaIIh58RfDxZwULR9KaTnzWrsO3LBALw6
 16hWyQ3xCp7aw9s6fQD1+rapP4ATM8hp1iCnxEzKVQH7K6LpOlVBoCXD0FRLwOnwVUf2
 BusYbkbRT+qzch5c4zfGyhP2TEJVpOBtjPvjIQTx+N0U14XDsHfjiPbBVeCV8K9+fH+Z
 KjnwduwE1D071yx2bA1wnz2Nf+tjsYDdU8FRm3Ut7sgFy95JVjQrrKHTgPOlHfrURNan yw== 
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r93t89fcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 10:24:21 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 19 Jun 2023 03:24:18 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] nasm: fix CVE-2022-46457
Date: Mon, 19 Jun 2023 10:23:37 +0000
Message-ID: <20230619102337.743917-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: bP-KLt69UT0I2fvkRdlCDbW_uf9DH8MU
X-Proofpoint-ORIG-GUID: bP-KLt69UT0I2fvkRdlCDbW_uf9DH8MU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_07,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=941
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 10:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183096

NASM v2.16 was discovered to contain a segmentation violation
in the component ieee_write_file at /output/outieee.c.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-46457

Upstream patches:
https://github.com/netwide-assembler/nasm/commit/c8af73112027fad0ecbb277e9cba257678c405af

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nasm/nasm/CVE-2022-46457.patch            | 50 +++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.15.05.bb    |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2022-46457.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2022-46457.patch b/meta/recipes-devtools/nasm/nasm/CVE-2022-46457.patch
new file mode 100644
index 0000000000..3502d572cd
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2022-46457.patch
@@ -0,0 +1,50 @@
+From c8af73112027fad0ecbb277e9cba257678c405af Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin" <hpa@zytor.com>
+Date: Wed, 7 Dec 2022 10:23:46 -0800
+Subject: [PATCH] outieee: fix segfault on empty input
+
+Fix the IEEE backend crashing if the input file is empty.
+
+Signed-off-by: H. Peter Anvin <hpa@zytor.com>
+
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/c8af73112027fad0ecbb277e9cba257678c405af]
+CVE: CVE-2022-46457
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ output/outieee.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/output/outieee.c b/output/outieee.c
+index cdb8333..8bc5eaa 100644
+--- a/output/outieee.c
++++ b/output/outieee.c
+@@ -919,7 +919,7 @@ static void ieee_write_file(void)
+      * Write the section headers
+      */
+     seg = seghead;
+-    if (!debuginfo && !strcmp(seg->name, "??LINE"))
++    if (!debuginfo && seg && !strcmp(seg->name, "??LINE"))
+         seg = seg->next;
+     while (seg) {
+         char buf[256];
+@@ -954,7 +954,7 @@ static void ieee_write_file(void)
+     /*
+      * write the start address if there is one
+      */
+-    if (ieee_entry_seg) {
++    if (ieee_entry_seg && seghead) {
+         for (seg = seghead; seg; seg = seg->next)
+             if (seg->index == ieee_entry_seg)
+                 break;
+@@ -1067,7 +1067,7 @@ static void ieee_write_file(void)
+      *  put out section data;
+      */
+     seg = seghead;
+-    if (!debuginfo && !strcmp(seg->name, "??LINE"))
++    if (!debuginfo && seg && !strcmp(seg->name, "??LINE"))
+         seg = seg->next;
+     while (seg) {
+         if (seg->currentpos) {
+--
+2.40.0
diff --git a/meta/recipes-devtools/nasm/nasm_2.15.05.bb b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
index 59b1121bd4..bcb7e071d6 100644
--- a/meta/recipes-devtools/nasm/nasm_2.15.05.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
            file://CVE-2022-44370.patch \
+           file://CVE-2022-46457.patch \
            "
 
 SRC_URI[sha256sum] = "3c4b8339e5ab54b1bcb2316101f8985a5da50a3f9e504d43fa6f35668bee2fd0"
-- 
2.40.0


