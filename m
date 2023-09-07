Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DEEEC8741
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 16:22:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17631.1694103722029902176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 09:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nadm445R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76142ca2fc=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 387Co370005402
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Sep 2023 16:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=4W3nd
	DT8rJp7OTtMW9y7Q5iH1/WCGVYGJ4WInXaMs/A=; b=nadm445R1txBPTECZ/VAJ
	qHHL2YOStSwXwzYFkrbpjUFp5FRYM1Hx/A7oypAWuil8lPzjSd6mTwVhZaZXsJr3
	J4IBU3+vxd8x1HkSQgUAb/PjZQ9a42CiCml0XutZdievUi9mAc+uI1+e7cS3lAdF
	hwgzrPo6k2nKesyJOTzPPfaXqosOE85IfMXo7B7EtST7r9usojXPNsjzin0OO+Zr
	VtjrbX9KD8//vn3sj2PDWE6GeBpG8VDkAYqe+Iukcav92E678kD8CuPt2GmEdxd5
	av7xaP+Yyl7s/S9Q3Khm3zjXJyp/EVbN8YnB8KCosJng7ot9znnKWzeQm7Xkpp9c
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k3kge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 16:22:00 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 7 Sep 2023 09:21:58 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Thu, 7 Sep 2023 09:21:57 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH 1/2] webkitgtk: fix CVE-2023-32439
Date: Fri, 8 Sep 2023 00:21:54 +0800
Message-ID: <20230907162155.2441494-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: LsdY9IPUx81Vw3SPf3XLN-0zdo_fRm-k
X-Proofpoint-ORIG-GUID: LsdY9IPUx81Vw3SPf3XLN-0zdo_fRm-k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=645
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309070146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 16:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187391

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2023-32439 for webkitgtk.

CVE: CVE-2023-32439

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../webkit/webkitgtk/CVE-2023-32439.patch     | 128 ++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.38.6.bb  |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2023-32439.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2023-32439.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-32439.patch
new file mode 100644
index 0000000000..5c240011e0
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-32439.patch
@@ -0,0 +1,128 @@
+CVE: CVE-2023-32439
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/ebefb9e]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From ebefb9e6b7e7440ab6bb29452f4ac6350bd8b975 Mon Sep 17 00:00:00 2001
+From: Yijia Huang <yijia_huang@apple.com>
+Date: Wed, 10 May 2023 09:41:48 -0700
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
+index 000000000000..ed40601ea37f
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
+index e4db64155316..5ec334787c0c 100644
+--- a/Source/JavaScriptCore/dfg/DFGClobberize.h
++++ b/Source/JavaScriptCore/dfg/DFGClobberize.h
+@@ -383,6 +383,7 @@ void clobberize(Graph& graph, Node* node, const ReadFunctor& read, const WriteFu
+ 
+         read(JSObject_butterfly);
+         ArrayMode mode = node->arrayMode();
++        LocationKind locationKind = node->op() == EnumeratorNextUpdateIndexAndMode ? EnumeratorNextUpdateIndexAndModeLoc : HasIndexedPropertyLoc;
+         switch (mode.type()) {
+         case Array::ForceExit: {
+             write(SideState);
+@@ -392,7 +393,7 @@ void clobberize(Graph& graph, Node* node, const ReadFunctor& read, const WriteFu
+             if (mode.isInBounds()) {
+                 read(Butterfly_publicLength);
+                 read(IndexedInt32Properties);
+-                def(HeapLocation(HasIndexedPropertyLoc, IndexedInt32Properties, graph.varArgChild(node, 0), graph.varArgChild(node, 1)), LazyNode(node));
++                def(HeapLocation(locationKind, IndexedInt32Properties, graph.varArgChild(node, 0), graph.varArgChild(node, 1)), LazyNode(node));
+                 return;
+             }
+             break;
+@@ -402,7 +403,7 @@ void clobberize(Graph& graph, Node* node, const ReadFunctor& read, const WriteFu
+             if (mode.isInBounds()) {
+                 read(Butterfly_publicLength);
+                 read(IndexedDoubleProperties);
+-                def(HeapLocation(HasIndexedPropertyLoc, IndexedDoubleProperties, graph.varArgChild(node, 0), graph.varArgChild(node, 1)), LazyNode(node));
++                def(HeapLocation(locationKind, IndexedDoubleProperties, graph.varArgChild(node, 0), graph.varArgChild(node, 1)), LazyNode(node));
+                 return;
+             }
+             break;
+@@ -412,7 +413,7 @@ void clobberize(Graph& graph, Node* node, const ReadFunctor& read, const WriteFu
+             if (mode.isInBounds()) {
+                 read(Butterfly_publicLength);
+                 read(IndexedContiguousProperties);
+-                def(HeapLocation(HasIndexedPropertyLoc, IndexedContiguousProperties, graph.varArgChild(node, 0), graph.varArgChild(node, 1)), LazyNode(node));
++                def(HeapLocation(locationKind, IndexedContiguousProperties, graph.varArgChild(node, 0), graph.varArgChild(node, 1)), LazyNode(node));
+                 return;
+             }
+             break;
+diff --git a/Source/JavaScriptCore/dfg/DFGHeapLocation.cpp b/Source/JavaScriptCore/dfg/DFGHeapLocation.cpp
+index 0661e5b826b7..698a6d4b6062 100644
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
+index 40fb71673284..7238491b02c9 100644
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
+2.34.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
index 5e8adf50fc..4cef133c19 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reproducibility.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://d318bb461f040b90453bc4e100dcf967243ecd98.patch \
+           file://CVE-2023-32439.patch \
            "
 SRC_URI[sha256sum] = "1c614c9589389db1a79ea9ba4293bbe8ac3ab0a2234cac700935fae0724ad48b"
 
-- 
2.34.1


