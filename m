Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290CDC52D73
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 11:06:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.57399.1723115161115501884
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 04:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8950103a07=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4784OW3w004144
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Aug 2024 04:06:00 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0hv9g0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 04:06:00 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 04:05:58 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/3] ghostscript: fix CVE-2024-29509
Date: Thu, 8 Aug 2024 11:05:42 +0000
Message-ID: <20240808110544.2591803-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: ZlzCClHFEwb0ss0aj4bC9XCxMHttCP6s
X-Proofpoint-GUID: ZlzCClHFEwb0ss0aj4bC9XCxMHttCP6s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_11,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408080079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 11:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203132

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ghostscript/CVE-2024-29509.patch          | 45 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29509.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29509.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29509.patch
new file mode 100644
index 0000000000..8de97f91a0
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29509.patch
@@ -0,0 +1,45 @@
+From 917b3a71fb20748965254631199ad98210d6c2fb Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Thu, 25 Jan 2024 11:58:22 +0000
+Subject: [PATCH] Bug 707510 - don't use strlen on passwords
+
+Item #1 of the report. This looks like an oversight when first coding
+the routine. We should use the PostScript string length, because
+PostScript strings may not be NULL terminated (and as here may contain
+internal NULL characters).
+
+Fix the R6 handler which has the same problem too.
+
+CVE: CVE-2024-29509
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=917b3a71fb20748965254631199ad98210d6c2fb]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ pdf/pdf_sec.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pdf/pdf_sec.c b/pdf/pdf_sec.c
+index ff60805..2bb59e1 100644
+--- a/pdf/pdf_sec.c
++++ b/pdf/pdf_sec.c
+@@ -1250,7 +1250,7 @@ static int check_password_R5(pdf_context *ctx, char *Password, int PasswordLen,
+         if (code < 0) {
+             pdf_string *P = NULL, *P_UTF8 = NULL;
+
+-            code = pdfi_object_alloc(ctx, PDF_STRING, strlen(ctx->encryption.Password), (pdf_obj **)&P);
++	    code = pdfi_object_alloc(ctx, PDF_STRING, PasswordLen, (pdf_obj **)&P);
+             if (code < 0) {
+                 return code;
+             }
+@@ -1300,7 +1300,7 @@ static int check_password_R6(pdf_context *ctx, char *Password, int PasswordLen,
+         if (code < 0) {
+             pdf_string *P = NULL, *P_UTF8 = NULL;
+
+-            code = pdfi_object_alloc(ctx, PDF_STRING, strlen(ctx->encryption.Password), (pdf_obj **)&P);
++	    code = pdfi_object_alloc(ctx, PDF_STRING, PasswordLen, (pdf_obj **)&P);
+             if (code < 0)
+                 return code;
+             memcpy(P->data, Password, PasswordLen);
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index ab4a2def4c..f738b0133f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -52,6 +52,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2023-52722.patch \
                 file://CVE-2024-29511-0001.patch \
                 file://CVE-2024-29511-0002.patch \
+                file://CVE-2024-29509.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.40.0


