Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A621EEE8000
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 13:47:17 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.39463.1694180835524982944
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 06:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XHIspHPC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68a56401c12so1768739b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 06:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694180834; x=1694785634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMb+uanfpYA0pU8fwv19LdbmBCHEDcx5dlsKQL3wwsw=;
        b=XHIspHPCmUOwYZscmZvDpB9NVlO/6U4opdZVoibdpScoQ+0qVYLcyAYasTfUHV5Vrq
         j0GE4wLZesp4wvhO3rdF+suXeI3g6m2qeEz0miL/8u+qIx7ZSXdWJcHqKw5HZyzlmLNd
         bYAAwN5aCPG/uuyI8+UvUkF0HdOehW3dDimWLzxG9LCULLTCDih9XY+X95UmfKSsNm8j
         VFdG8bKO41OO0Jv2qtzkaBBQ+wNhpntovcykkdGrlHdusfd3jCYFrPZMHWF71nID7FYb
         uTBHslW0iGadFUuBSiLUCwSC4Tzpg0HZtVSwY+cPXSIVObMcXdQhCoEjIJpb8bqaL3pe
         ziCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694180834; x=1694785634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMb+uanfpYA0pU8fwv19LdbmBCHEDcx5dlsKQL3wwsw=;
        b=BDcXCJCXAOoFd4ToiwL9Uyfaougw5GikLFdUuDH2boSbKLapmcrqr0CKozXPVMgLnX
         PMhxjE71B7ZdrrfT92233Jw1gODAa2xJbPjbX1jhVTSGb1bSBLYh3d7lvR+knKe8UOFQ
         PPNdQTddg9GQ4plZklpIbnYYst+n4sAHG4STs99h0B63zYiAmfiPHOPzotaPk+CtkD2g
         a1+fNOtRFtcSIEc6XEHUrm1wc5wr5OAzg3R45/FZyNmwFlMoe7HdtL1mIk1pGEvBfBLs
         n6GxjXNIyahGbNiX3S/c2tND976v7pyzy6mrdETnahaT1hV1oYP4nieH6xJk56/Vm/eB
         wMqw==
X-Gm-Message-State: AOJu0Yy2YLH6Fb2AobDELHLPUeNXylagVk9FefTGxBIVXeK90ch3eqFy
	2brhooLuqFo4QzydZD/GJsF651m9RMooh3Tclag=
X-Google-Smtp-Source: AGHT+IHJsPTm0Oo+f4j/sSX00h4TeUz9VE2JjpA5KMvVBgsi2Y8PRVlSkQqy4reb3iJ+72+oeC23TA==
X-Received: by 2002:a05:6a20:8422:b0:135:1af6:9a01 with SMTP id c34-20020a056a20842200b001351af69a01mr3595087pzd.8.1694180834498;
        Fri, 08 Sep 2023 06:47:14 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id x18-20020a056a00271200b00653fe2d527esm1344828pfv.32.2023.09.08.06.47.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 06:47:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 3/9] webkitgtk: fix CVE-2023-32439
Date: Fri,  8 Sep 2023 03:46:54 -1000
Message-Id: <71edb4ec115208950ae5da5305b5fd75823121ec.1694179812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694179812.git.steve@sakoman.com>
References: <cover.1694179812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 13:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187425

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2023-32439 for webkitgtk.

CVE: CVE-2023-32439

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


