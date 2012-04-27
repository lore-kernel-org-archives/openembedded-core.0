Received: from e06smtp18.uk.ibm.com ([195.75.94.114])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1SNj38-0002xJ-GE
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 13:09:18 +0200
Received: from /spool/local
	by e06smtp18.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <openembedded-core@lists.openembedded.org> from
	<ken.werner@linaro.org>; Fri, 27 Apr 2012 11:59:40 +0100
Received: from d06nrmr1507.portsmouth.uk.ibm.com (9.149.38.233)
	by e06smtp18.uk.ibm.com (192.168.101.148) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 27 Apr 2012 11:59:38 +0100
Received: from d06av08.portsmouth.uk.ibm.com (d06av08.portsmouth.uk.ibm.com
	[9.149.37.249])
	by d06nrmr1507.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id q3RAxb2m2384084
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 11:59:37 +0100
Received: from d06av08.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id q3RAxaK3007464
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 04:59:37 -0600
Received: from bolide.boeblingen.de.ibm.com
	(dyn-9-152-213-71.boeblingen.de.ibm.com [9.152.213.71])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id q3RAxaAE007458; Fri, 27 Apr 2012 04:59:36 -0600
From: Ken Werner <ken.werner@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Apr 2012 12:59:17 +0200
Message-Id: <1335524357-16990-1-git-send-email-ken.werner@linaro.org>
X-Mailer: git-send-email 1.7.5.4
x-cbid: 12042710-6892-0000-0000-000001AF1D34
Subject: [PATCH] Qt 4.8 GCC 4.7 fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Apr 2012 11:09:18 -0000

This change introduces two new patches to Qt 4.8. One prevents the build
system from using the -fuse-ld=gold GCC flag as this isn't upstream and
therefore not supported by many toolchains out there. The second patch
fixes a compile time error when using toolchains based on GCC 4.7.

Signed-off-by: Ken Werner <ken.werner@linaro.org>
---
 meta/recipes-qt/qt4/qt-4.8.1.inc                   |    2 +
 .../qt4/qt-4.8.1/disable-fuse-gold-flag.patch      |   26 ++++++++++++++++
 meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch       |   31 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
 4 files changed, 60 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.1/disable-fuse-gold-flag.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch

diff --git a/meta/recipes-qt/qt4/qt-4.8.1.inc b/meta/recipes-qt/qt4/qt-4.8.1.inc
index cd78401..b42ca01 100644
--- a/meta/recipes-qt/qt4/qt-4.8.1.inc
+++ b/meta/recipes-qt/qt4/qt-4.8.1.inc
@@ -20,6 +20,8 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://pulseaudio-config.patch \
            file://g++.conf \
            file://linux.conf \
+           file://gcc47-fix.patch \
+           file://disable-fuse-gold-flag.patch \
            "
 
 SRC_URI[md5sum] = "7960ba8e18ca31f0c6e4895a312f92ff"
diff --git a/meta/recipes-qt/qt4/qt-4.8.1/disable-fuse-gold-flag.patch b/meta/recipes-qt/qt4/qt-4.8.1/disable-fuse-gold-flag.patch
new file mode 100644
index 0000000..d49d7bc
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.8.1/disable-fuse-gold-flag.patch
@@ -0,0 +1,26 @@
+Disable the -fuse-ld=gold flag. This option is a Debian/Ubuntu specific
+extension to the g++ and causes upstream GCC to throw an error.
+
+Index: qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/common.pri
+===================================================================
+--- qt-everywhere-opensource-src-4.8.0.orig/src/3rdparty/webkit/Source/common.pri
++++ qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/common.pri
+@@ -3,12 +3,12 @@
+ contains(JAVASCRIPTCORE_JIT,yes): DEFINES+=ENABLE_JIT=1
+ contains(JAVASCRIPTCORE_JIT,no): DEFINES+=ENABLE_JIT=0
+ 
+-linux-g++ {
+-isEmpty($$(SBOX_DPKG_INST_ARCH)):exists(/usr/bin/ld.gold) {
+-    message(Using gold linker)
+-    QMAKE_LFLAGS+=-fuse-ld=gold
+-}
+-}
++#linux-g++ {
++#isEmpty($$(SBOX_DPKG_INST_ARCH)):exists(/usr/bin/ld.gold) {
++#    message(Using gold linker)
++#    QMAKE_LFLAGS+=-fuse-ld=gold
++#}
++#}
+ 
+ # We use this flag on production branches
+ # See https://bugs.webkit.org/show_bug.cgi?id=60824
diff --git a/meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch b/meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch
new file mode 100644
index 0000000..8252817
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch
@@ -0,0 +1,31 @@
+Fix compile error when using toolchains based on GCC 4.7.
+
+Index: qt-everywhere-opensource-src-4.8.0/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
+===================================================================
+--- qt-everywhere-opensource-src-4.8.0.orig/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
++++ qt-everywhere-opensource-src-4.8.0/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
+@@ -57,9 +57,7 @@ namespace JSC {
+     
+     class JSGlobalObject : public JSVariableObject {
+     protected:
+-        using JSVariableObject::JSVariableObjectData;
+-
+-        struct JSGlobalObjectData : public JSVariableObjectData {
++        struct JSGlobalObjectData : public JSVariableObject::JSVariableObjectData {
+             // We use an explicit destructor function pointer instead of a
+             // virtual destructor because we want to avoid adding a vtable
+             // pointer to this struct. Adding a vtable pointer would force the
+Index: qt-everywhere-opensource-src-4.8.0/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
+===================================================================
+--- qt-everywhere-opensource-src-4.8.0.orig/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
++++ qt-everywhere-opensource-src-4.8.0/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
+@@ -32,8 +32,7 @@ namespace JSC{
+     
+     class JSStaticScopeObject : public JSVariableObject {
+     protected:
+-        using JSVariableObject::JSVariableObjectData;
+-        struct JSStaticScopeObjectData : public JSVariableObjectData {
++        struct JSStaticScopeObjectData : public JSVariableObjectData::JSVariableObjectData {
+             JSStaticScopeObjectData()
+                 : JSVariableObjectData(&symbolTable, &registerStore + 1)
+             {
diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 8c15352..291e62a 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r43"
+INC_PR = "r44"
 
 QT_BASE_LIB  ?= "libqt-embedded"
 
-- 
1.7.5.4



