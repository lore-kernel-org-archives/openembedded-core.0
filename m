Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780BACE7AE6
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 02:49:08 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.6273.1695869348139026197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 19:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tjH+eKaM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68bed2c786eso10010440b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 19:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695869347; x=1696474147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77bvEOdN58/ZnR4m5kkPNjmEYnCxvfKnXoKJ6lM7BM4=;
        b=tjH+eKaMc5i/Jl4d7G1NM/bJewUpQUV2O07HKuwZpsTzmaUH8+9d/9RUiC/lFrlQPy
         S5TR+hSxbOSoVidl+tX5CIyyqPxIkkYuwlp/sxznmwnN030841ax62NJaIkO4E+aCAS9
         pYKYnjSv3oV5UOiWNbCMO5U5h115NXJcA5yu6og57X/tQOzdLHa8LAH2ClCq36r9ADvP
         dOIvv7Mbau3nHGcqYBUCl3S8udPD3x1+/vtZGlHD+5WZQ6BBHHGjkDC7Dk3nX0g9GVhw
         oxrvY8kOlf8+BfeM9BZBgpfvcyH+kuNqjb6r+SvpE4mhbkJ/xDxM8NjTP10K86HsC9Kt
         Ks2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695869347; x=1696474147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77bvEOdN58/ZnR4m5kkPNjmEYnCxvfKnXoKJ6lM7BM4=;
        b=kgFhveER6rzoDZMA1IY13LK9pdmK6pisx9H+uB0N7OSjnjL+dCX7tjRjVu/uCdIv15
         qcwRO2AmMq/rC8aSo4UPry2QJYSiCAiLT5hatCF9PjuE3FLFR18RmLowOuRq/obewLrP
         JhAvMlKEjJhwtXriBG7XhW0lQDYAbCf4lb+gumtqJPY71PRwtwiywp8NR3yyLiL304Cv
         2TBaKNPuEh1UeADJVdpryVjV8qq02ReIZdj74Z0WfSnjD/ut0MkRXNAvRA8nnmVvdfTz
         iL9xGo0GtRe4dYoXOSqF5kTll1xFmPzMcWy6RxghXm0tHygI6QH9d9HU/08s2jfwGDk2
         RjMw==
X-Gm-Message-State: AOJu0YwhiUEi7dAGnRv5PsYD+NpimxVJI9tG6stjngjXPoOlQ0pdT6Hp
	+0mwFjU4Cr4sQfYeCiV1j3wThuO/wFwQf+dna50=
X-Google-Smtp-Source: AGHT+IG2jWjbaOPWqIOoPwfIKGgMBk+Uqwmko2Y+Y8pH7nEfFq2hEzbcmGNq/rOXmbNoYuTSRknVXw==
X-Received: by 2002:a05:6a00:cc2:b0:690:ca4e:661b with SMTP id b2-20020a056a000cc200b00690ca4e661bmr4390233pfv.13.1695869347147;
        Wed, 27 Sep 2023 19:49:07 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n3-20020aa79043000000b0068e12e6954csm1850214pfo.36.2023.09.27.19.49.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 19:49:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/17] webkitgtk: fix CVE-2023-32439
Date: Wed, 27 Sep 2023 16:48:38 -1000
Message-Id: <cdbc3c1548299eb78aeebb94909224eca8410158.1695869144.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695869144.git.steve@sakoman.com>
References: <cover.1695869144.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 02:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188359

From: Yogita Urade <yogita.urade@windriver.com>

A type confusion issue was addressed with improved checks.
This issue is fixed in iOS 16.5.1 and iPadOS 16.5.1, Safari
16.5.1, macOS Ventura 13.4.1, iOS 15.7.7 and iPadOS 15.7.7.
Processing maliciously crafted web content may lead to
arbitrary code execution. Apple is aware of a report that
this issue may have been actively exploited.

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


