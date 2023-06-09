Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04320C7EE43
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 14:09:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14322.1686319772253579886
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 07:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rPfasoXX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5524cb4a3f=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 359DpxhZ027824
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Jun 2023 07:09:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=R/2Hh73LCW48D9yKSMvfHztutV8dEQXNBNeYp2eL4So=;
 b=rPfasoXXfpZ5bOKuDk4UqrqHvkybtSNfHer9oXw9w7LD4v8ugvIFf65NAMzu0TyIvsrU
 NugPh1cIuJCYcYFxCTChH/g1rbwxvUQQRPNsnqUHTrT4zYqnvYliXg4TuNpTNJAQfbMw
 2AddDNYS4veEd3QAte1H6Fn/l7pD9iH9IR+VEc9vCl5Rze5Z8039M1+lwCYedHJ33jdF
 AIBbqmG3G7DNf6TAHOmfnn0bUaQhLzjcwgDGmajI9zO5+cNjMj16+ZjHtLJKn5qFGHvn
 mmtJG9IqSLnNZUxWKWo2VitR3+88NgasapyAL618xG7BOFhCy4tj3QoWOCeurjZDQnpb tQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2a80trdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 07:09:31 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 07:09:29 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH V2 1/6] webkitgtk: fix CVE-2022-46691
Date: Fri, 9 Jun 2023 14:09:03 +0000
Message-ID: <20230609140908.3465521-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 0mkdnHQoD6OdWQLufefdjS5sveH8U63Y
X-Proofpoint-ORIG-GUID: 0mkdnHQoD6OdWQLufefdjS5sveH8U63Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_10,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=873 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306090120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 14:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182551

A memory consumption issue was addressed with improved memory handling.
This issue is fixed in Safari 16.2, tvOS 16.2, macOS Ventura 13.1, iOS
15.7.2 and iPadOS 15.7.2, iOS 16.2 and iPadOS 16.2, watchOS 9.2. Processing
maliciously crafted web content may lead to arbitrary code execution.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-46691
https://support.apple.com/en-us/HT213531

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../webkit/webkitgtk/CVE-2022-46691.patch     | 43 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.patch
new file mode 100644
index 0000000000..ff9df40433
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.patch
@@ -0,0 +1,43 @@
+From fd57a49d07c9c285780495344073350182fd7c7c Mon Sep 17 00:00:00 2001
+From: Yijia Huang <hyjorc1@gmail.com>
+Date: Mon, 10 Oct 2022 15:42:34 -0700
+Subject: [PATCH] [JSC] Should model BigInt with side effects
+ https://bugs.webkit.org/show_bug.cgi?id=246291 rdar://100494823
+
+Reviewed by Yusuke Suzuki.
+
+Operations with two BigInt operands have side effects,
+which should not be hoisted from loops.
+
+* Source/JavaScriptCore/dfg/DFGClobberize.cpp:
+(JSC::DFG::doesWrites):
+* Source/JavaScriptCore/dfg/DFGClobberize.h:
+(JSC::DFG::clobberize):
+
+Canonical link: https://commits.webkit.org/255368@main
+
+CVE: CVE-2022-46691
+
+Upstream-Status: Backport
+[https://github.com/WebKit/WebKit/commit/fd57a49d07c9c285780495344073350182fd7c7c]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ Source/JavaScriptCore/dfg/DFGClobberize.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Source/JavaScriptCore/dfg/DFGClobberize.h b/Source/JavaScriptCore/dfg/DFGClobberize.h
+index 0363ab20dcd8..4b1bcfea1fd7 100644
+--- a/Source/JavaScriptCore/dfg/DFGClobberize.h
++++ b/Source/JavaScriptCore/dfg/DFGClobberize.h
+@@ -811,6 +811,8 @@ void clobberize(Graph& graph, Node* node, const ReadFunctor& read, const WriteFu
+     case ValueBitRShift:
+         // FIXME: this use of single-argument isBinaryUseKind would prevent us from specializing (for example) for a HeapBigInt left-operand and a BigInt32 right-operand.
+         if (node->isBinaryUseKind(AnyBigIntUse) || node->isBinaryUseKind(BigInt32Use) || node->isBinaryUseKind(HeapBigIntUse)) {
++            read(World);
++            write(SideState);
+             def(PureValue(node));
+             return;
+         }
+--
+2.40.0
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index 1dac4f5677..02258f84e4 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BP}.tar.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            file://CVE-2022-32888.patch \
            file://CVE-2022-32923.patch \
+           file://CVE-2022-46691.patch \
            "
 SRC_URI[sha256sum] = "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136edbab2c133d00437"
 
-- 
2.40.0


