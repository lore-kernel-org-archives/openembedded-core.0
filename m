Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99C8C7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 12:07:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6997.1686053228668602789
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 05:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eVD/KmA6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55213888e3=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356BfQFn007964
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jun 2023 12:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=twhqvV6nqd2ucj94InRQhIOWQDEx9Y71tXyn3Xdzygo=;
 b=eVD/KmA6uXiH3U+9H5qegJZsdNvV+oSyJml59bTwhC1B7jIsg4UitXNlmy7ntCcLzYl6
 B4KkCfNp6yOuSszJS0lnMhlZZRdhlNyB6AJT64n8Z5pyh0NKbq5c11zW8ms3ENGxsR+0
 9tQ1CqaczsCc9yeAMtBCSMkQRT0rZqRX279sDuvKspYo7qAKF2r+27NxQLgpMZVG83C1
 JxsJP9FgHjRwuGLF6l4hA2MCIkkI60BM6lLBAStf3aHKhflHnNflpw1V/WsjNtf76sXl
 Xj/vZU8ENCzOZvZKgcI4NtbiM6+5gEe767+6s+FMMLBU7GuvubRnHqp/nIO/bJ60gwYh pA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qyvg8je2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 12:07:07 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 05:07:05 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <yogita.urade@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2022-46691
Date: Tue, 6 Jun 2023 12:06:47 +0000
Message-ID: <20230606120647.3692694-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 59izc3XmPxbT_Qf-q2FVKKuBf56Ml8KI
X-Proofpoint-GUID: 59izc3XmPxbT_Qf-q2FVKKuBf56Ml8KI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_08,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=904
 phishscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306060102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 12:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182428

A memory consumption issue was addressed with improved memory handling. This issue is fixed in Safari 16.2, tvOS 16.2, macOS Ventura 13.1, iOS 15.7.2 and iPadOS 15.7.2, iOS 16.2 and iPadOS 16.2, watchOS 9.2. Processing maliciously crafted web content may lead to arbitrary code execution.

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


