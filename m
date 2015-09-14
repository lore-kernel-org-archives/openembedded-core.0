Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A2DFE6E26B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8E9urZQ006083 for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 10:56:53 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YJB23QnPR5so
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 10:56:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8E9udsb006078
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 10:56:50 +0100
Message-ID: <1442224599.26666.9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Sep 2015 10:56:39 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] webkitgtk: Add patch to fix gcc5 compile issues
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
X-List-Received-Date: Mon, 14 Sep 2015 09:56:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Without this patch, webkitgtk fails to build with gcc5. I found Khem had
sent the patch against Qt for the same issue we were seeing on mips/ppc.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-sato/webkit/webkitgtk/gcc5.patch b/meta/recipes-sato/webkit/webkitgtk/gcc5.patch
new file mode 100644
index 0000000..5951a81
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/gcc5.patch
@@ -0,0 +1,26 @@
+JSObject: Create explicit instantiation of putByIndexBeyondVectorLengthWithoutAttributes
+
+Reason for change: newer gcc might optimize away the templates
+and they wont be available for other .cpp files to use as these
+are used in a different .cpp we need to tell compiler to explicitly
+instantiate them.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: webkitgtk-2.8.5/Source/JavaScriptCore/runtime/JSObject.cpp
+===================================================================
+--- webkitgtk-2.8.5.orig/Source/JavaScriptCore/runtime/JSObject.cpp
++++ webkitgtk-2.8.5/Source/JavaScriptCore/runtime/JSObject.cpp
+@@ -1965,6 +1965,10 @@ void JSObject::putByIndexBeyondVectorLen
+     }
+ }
+ 
++template void JSObject::putByIndexBeyondVectorLengthWithoutAttributes<Int32Shape>(ExecState* exec, unsigned i, JSValue value);
++template void JSObject::putByIndexBeyondVectorLengthWithoutAttributes<DoubleShape>(ExecState* exec, unsigned i, JSValue value);
++template void JSObject::putByIndexBeyondVectorLengthWithoutAttributes<ContiguousShape>(ExecState* exec, unsigned i, JSValue value);
++
+ void JSObject::putByIndexBeyondVectorLengthWithArrayStorage(ExecState* exec, unsigned i, JSValue value, bool shouldThrow, ArrayStorage* storage)
+ {
+     VM& vm = exec->vm();
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
index 365f20b..82d670d 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
 SRC_URI = "\
   http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
   file://0001-This-patch-fixes-a-command-line-that-is-too-long-ove.patch \
+  file://gcc5.patch \
   "
 SRC_URI[md5sum] = "df79991848a5096d3a75289ebce547ae"
 SRC_URI[sha256sum] = "3d1f0c534935f43fd74df90f2648fcee672d60f1f57a30fa557a77891ae04d20"



