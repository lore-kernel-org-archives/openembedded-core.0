Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E13C7FA88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 23:25:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9TNPBrH019372
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 16:25:12 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 29 Oct 2019 16:25:11 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Oct 2019 16:25:11 -0700
Message-ID: <20191029232511.42579-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] webkitgtk: fix occasional link error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Oct 2019 23:25:11 -0000
Content-Type: text/plain

Partial backport from WebKit.git.  See patch for details.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../webkit/webkitgtk/fix-link-error.patch          | 45 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.24.4.bb       |  1 +
 2 files changed, 46 insertions(+)
 create mode 100755 meta/recipes-sato/webkit/webkitgtk/fix-link-error.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-link-error.patch b/meta/recipes-sato/webkit/webkitgtk/fix-link-error.patch
new file mode 100755
index 0000000..9696ddd
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-link-error.patch
@@ -0,0 +1,45 @@
+webkitgtk: fix an occasional link error
+
+Part of ae465a4e...  Changelog is not included in the source tarball.
+
+Upstream-Status:  backport [git://git.webkit.org/WebKit.git]
+
+commit ae465a4e3b1498b6c4038fc7e596e0e3662d116f
+Author: Hironori.Fujii@sony.com <Hironori.Fujii@sony.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
+Date:   Fri Jun 28 07:38:09 2019 +0000
+
+    [Win] unresolved external symbol "JSC::JSObject::didBecomePrototype(void)" referenced in function "JSC::Structure::create(...)"
+    https://bugs.webkit.org/show_bug.cgi?id=199312
+    
+    Reviewed by Keith Miller.
+    
+    WinCairo port, clang-cl Release builds reported a following linkage error:
+    
+    > WebCore.lib(UnifiedSource-4babe430-10.cpp.obj) : error LNK2019: unresolved external symbol "public: void __cdecl JSC::JSObject::didBecomePrototype(void)" (?didBecomePrototype@JSObject@JSC@@QEAAXXZ) referenced in function "public: static class JSC::Structure * __cdecl JSC::Structure::create(class JSC::VM &,class JSC::JSGlobalObject *,class JSC::JSValue,class JSC::TypeInfo const &,struct JSC::ClassInfo const *,unsigned char,unsigned int)" (?create@Structure@JSC@@SAPEAV12@AEAVVM@2@PEAVJSGlobalObject@2@VJSValue@2@AEBVTypeInfo@2@PEBUClassInfo@2@EI@Z)
+    
+    No new tests because there is no behavior change.
+    
+    * Modules/indexeddb/server/SQLiteIDBBackingStore.cpp: Include <JavaScriptCore/JSCInlines.h>,
+    and do not include headers which is included by it.
+    
+    git-svn-id: http://svn.webkit.org/repository/webkit/trunk@246922 268f45cc-cd09-0410-ab3c-d52691b4dbfc
+
+[ modification of Changelog deleted ]
+
+diff --git a/Source/WebCore/Modules/indexeddb/server/SQLiteIDBBackingStore.cpp b/Source/WebCore/Modules/indexeddb/server/SQLiteIDBBackingStore.cpp
+index d1b047c..0899a9a 100644
+--- a/Source/WebCore/Modules/indexeddb/server/SQLiteIDBBackingStore.cpp
++++ b/Source/WebCore/Modules/indexeddb/server/SQLiteIDBBackingStore.cpp
+@@ -49,11 +49,8 @@
+ #include "SQLiteTransaction.h"
+ #include "ThreadSafeDataBuffer.h"
+ #include <JavaScriptCore/AuxiliaryBarrierInlines.h>
+-#include <JavaScriptCore/HeapInlines.h>
+-#include <JavaScriptCore/JSCJSValueInlines.h>
+-#include <JavaScriptCore/JSGlobalObject.h>
++#include <JavaScriptCore/JSCInlines.h>
+ #include <JavaScriptCore/StrongInlines.h>
+-#include <JavaScriptCore/StructureInlines.h>
+ #include <wtf/FileSystem.h>
+ #include <wtf/NeverDestroyed.h>
+ #include <wtf/text/StringConcatenateNumbers.h>
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
index 8c695ce..b04ec82 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://include_array.patch \
            file://narrowing.patch \
            file://0001-gstreamer-add-a-missing-format-string.patch \
+           file://fix-link-error.patch \
            "
 
 SRC_URI[md5sum] = "c214963d8c0e7d83460da04a0d8dda87"
-- 
2.7.4


