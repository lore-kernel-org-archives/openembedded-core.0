Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CCBE80A87
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 05:14:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11288.1695791678796909212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 22:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ouSpWVHD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7634d2663b=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38R4NkhP017531
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 05:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=/SPAo
	n483fk6/25LM5k5nGICKWsI70OTOfjUuC83OnE=; b=ouSpWVHDTD7oFthgpTKPH
	sOKX8lsRj8BWTlNjDLEdzpWgY65XF2retjfjRcRmpB2KRCcf9/3n3NK4abAd8c4A
	+vWviFMNPbIgvhsU/AHnAjasnei9lz0b34vBCU/3s3eogcDV4Bwzt7xdYgHyxL4W
	6QVt0Zh9YOhVaO9+ptASVUlK5MLVqg8tv/wgq4HAUAgVWRon+nBvWE1olkwt8Ir1
	PdE9vaHarB0Hy2/IbHfbtM9Agcf1og2qTfxO8dmSZMMBg2XV9/kqNydqy2qqIYf6
	S+scyCfA6iP2avKBWTDh4aX2FBvwhHje8D7jKBEtUPN0PlxJzURFmvkrFY6AKmXw
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9n7x3k5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 05:14:35 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 22:14:30 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2023-32439
Date: Wed, 27 Sep 2023 05:14:15 +0000
Message-ID: <20230927051415.3322649-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: Y1ZImznoU7UbKWpcJ8r4B_n2XAp2R9Ot
X-Proofpoint-GUID: Y1ZImznoU7UbKWpcJ8r4B_n2XAp2R9Ot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_01,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 mlxlogscore=894 impostorscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309270041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 05:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188291

From: Yogita Urade <yogita.urade@windriver.com>

A type confusion issue was addressed with improved checks.
This issue is fixed in iOS 16.5.1 and iPadOS 16.5.1, Safari
16.5.1, macOS Ventura 13.4.1, iOS 15.7.7 and iPadOS 15.7.7.
Processing maliciously crafted web content may lead to
arbitrary code execution. Apple is aware of a report that
this issue may have been actively exploited.

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../webkit/webkitgtk/CVE-2023-32439.patch     | 127 ++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   1 +
 2 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2023-32439.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2023-32439.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-32439.patch
new file mode 100644
index 0000000000..f8d7b613fa
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-32439.patch
@@ -0,0 +1,127 @@
+From ebefb9e6b7e7440ab6bb29452f4ac6350bd8b975 Mon Sep 17 00:00:00 2001
+From: Yijia Huang <yijia_huang@apple.com>
+Date: Tue, 26 Sep 2023 09:23:31 +0000
+Subject: [PATCH] Cherry-pick 263909@main (52fe95e5805c).
+ https://bugs.webkit.org/show_bug.cgi?id=256567
+
+    EnumeratorNextUpdateIndexAndMode and HasIndexedProperty should have different heap location kinds
+    https://bugs.webkit.org/show_bug.cgi?id=256567
+    rdar://109089013
+
+    Reviewed by Yusuke Suzuki.
+
+    EnumeratorNextUpdateIndexAndMode and HasIndexedProperty are different DFG nodes. However,
+    they might introduce the same heap location kind in DFGClobberize.h which might lead to
+    hash collision. We should introduce a new locationn kind for EnumeratorNextUpdateIndexAndMode.
+
+    * JSTests/stress/heap-location-collision-dfg-clobberize.js: Added.
+    (foo):
+    * Source/JavaScriptCore/dfg/DFGClobberize.h:
+    (JSC::DFG::clobberize):
+    * Source/JavaScriptCore/dfg/DFGHeapLocation.cpp:
+    (WTF::printInternal):
+    * Source/JavaScriptCore/dfg/DFGHeapLocation.h:
+
+    Canonical link: https://commits.webkit.org/263909@main
+
+Canonical link: https://commits.webkit.org/260527.376@webkitglib/2.40
+
+CVE: CVE-2023-32439
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/ebefb9e]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ .../stress/heap-location-collision-dfg-clobberize.js | 12 ++++++++++++
+ Source/JavaScriptCore/dfg/DFGClobberize.h            |  7 ++++---
+ Source/JavaScriptCore/dfg/DFGHeapLocation.cpp        |  4 ++++
+ Source/JavaScriptCore/dfg/DFGHeapLocation.h          |  1 +
+ 4 files changed, 21 insertions(+), 3 deletions(-)
+ create mode 100644 JSTests/stress/heap-location-collision-dfg-clobberize.js
+
+diff --git a/JSTests/stress/heap-location-collision-dfg-clobberize.js b/JSTests/stress/heap-location-collision-dfg-clobberize.js
+new file mode 100644
+index 00000000..ed40601e
+--- /dev/null
++++ b/JSTests/stress/heap-location-collision-dfg-clobberize.js
+@@ -0,0 +1,12 @@
++//@ runDefault("--watchdog=300", "--watchdog-exception-ok")
++const arr = [0];
++
++function foo() {
++    for (let _ in arr) {
++        0 in arr;
++        while(1);
++    }
++}
++
++
++foo();
+diff --git a/Source/JavaScriptCore/dfg/DFGClobberize.h b/Source/JavaScriptCore/dfg/DFGClobberize.h
+index f96e21d2..af3e864b 100644
+--- a/Source/JavaScriptCore/dfg/DFGClobberize.h
++++ b/Source/JavaScriptCore/dfg/DFGClobberize.h
+@@ -371,6 +371,7 @@ void clobberize(Graph& graph, Node* node, const ReadFunctor& read, const WriteFu
+
+         read(JSObject_butterfly);
+         ArrayMode mode = node->arrayMode();
++        LocationKind locationKind = node->op() == EnumeratorNextUpdateIndexAndMode ? EnumeratorNextUpdateIndexAndModeLoc : HasIndexedPropertyLoc;
+         switch (mode.type()) {
+         case Array::ForceExit: {
+             write(SideState);
+@@ -380,7 +381,7 @@ void clobberize(Graph& graph, Node* node, const ReadFunctor& read, const WriteFu
+             if (mode.isInBounds()) {
+                 read(Butterfly_publicLength);
+                 read(IndexedInt32Properties);
+-                def(HeapLocation(HasIndexedPropertyLoc, IndexedInt32Properties, graph.varArgChild(node, 0), graph.varArgChild(node, 1)), LazyNode(node));
++                def(HeapLocation(locationKind, IndexedInt32Properties, graph.varArgChild(node, 0), graph.varArgChild(node, 1)), LazyNode(node));
+                 return;
+             }
+             break;
+@@ -390,7 +391,7 @@ void clobberize(Graph& graph, Node* node, const ReadFunctor& read, const WriteFu
+             if (mode.isInBounds()) {
+                 read(Butterfly_publicLength);
+                 read(IndexedDoubleProperties);
+-                def(HeapLocation(HasIndexedPropertyLoc, IndexedDoubleProperties, graph.varArgChild(node, 0), graph.varArgChild(node, 1)), LazyNode(node));
++                def(HeapLocation(locationKind, IndexedDoubleProperties, graph.varArgChild(node, 0), graph.varArgChild(node, 1)), LazyNode(node));
+                 return;
+             }
+             break;
+@@ -400,7 +401,7 @@ void clobberize(Graph& graph, Node* node, const ReadFunctor& read, const WriteFu
+             if (mode.isInBounds()) {
+                 read(Butterfly_publicLength);
+                 read(IndexedContiguousProperties);
+-                def(HeapLocation(HasIndexedPropertyLoc, IndexedContiguousProperties, graph.varArgChild(node, 0), graph.varArgChild(node, 1)), LazyNode(node));
++                def(HeapLocation(locationKind, IndexedContiguousProperties, graph.varArgChild(node, 0), graph.varArgChild(node, 1)), LazyNode(node));
+                 return;
+             }
+             break;
+diff --git a/Source/JavaScriptCore/dfg/DFGHeapLocation.cpp b/Source/JavaScriptCore/dfg/DFGHeapLocation.cpp
+index 0661e5b8..698a6d4b 100644
+--- a/Source/JavaScriptCore/dfg/DFGHeapLocation.cpp
++++ b/Source/JavaScriptCore/dfg/DFGHeapLocation.cpp
+@@ -134,6 +134,10 @@ void printInternal(PrintStream& out, LocationKind kind)
+         out.print("HasIndexedPorpertyLoc");
+         return;
+
++    case EnumeratorNextUpdateIndexAndModeLoc:
++        out.print("EnumeratorNextUpdateIndexAndModeLoc");
++        return;
++
+     case IndexedPropertyDoubleLoc:
+         out.print("IndexedPropertyDoubleLoc");
+         return;
+diff --git a/Source/JavaScriptCore/dfg/DFGHeapLocation.h b/Source/JavaScriptCore/dfg/DFGHeapLocation.h
+index 40fb7167..7238491b 100644
+--- a/Source/JavaScriptCore/dfg/DFGHeapLocation.h
++++ b/Source/JavaScriptCore/dfg/DFGHeapLocation.h
+@@ -46,6 +46,7 @@ enum LocationKind {
+     DirectArgumentsLoc,
+     GetterLoc,
+     GlobalVariableLoc,
++    EnumeratorNextUpdateIndexAndModeLoc,
+     HasIndexedPropertyLoc,
+     IndexedPropertyDoubleLoc,
+     IndexedPropertyDoubleSaneChainLoc,
+--
+2.40.0
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index 10fcd0813a..f4b8456749 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BP}.tar.xz \
            file://CVE-2022-46700.patch \
            file://CVE-2023-23529.patch \
            file://CVE-2022-48503.patch \
+           file://CVE-2023-32439.patch \
            "
 SRC_URI[sha256sum] = "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136edbab2c133d00437"
 
-- 
2.40.0


