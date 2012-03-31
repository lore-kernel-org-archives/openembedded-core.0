Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SDmKA-00045t-Ve
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 02:37:47 +0200
Received: by dadz8 with SMTP id z8so102967dad.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 17:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=dI0aqDecn3pwLN05DMiis8S4rkOS1ObvmktuvSqaq3w=;
	b=jQyaZa0+Y+SBl7+VdnZ8a2qP1jTlH07npIAW0UjT3FVddl00ykFmwSQTg72aMc8X87
	Rpcz97SYZNoJcKPqrHTlSq81CKbU6bL7/esR5mmwdffLA5vktjRnad6yYzpeUU/AkGVv
	pCrGFu+Ic+RR8K6fmtlAGDBCQriafykxrmUqM6AzqGt7JhEfKhXaCXzDoXZH8RkQhn4l
	cYHRsN66XSLG5IPNfycbfUxC91pCb/ptXz6s/N/0JpTKvZmlPSqZWtuo8yWuzEiBjbaw
	jRuW2NxTbUC6iWRi581OhnE2pI54qmNtshJQ4lZm558dRvtpfHrHJHoA7hWgj0YlkIIx
	hCGA==
Received: by 10.68.203.4 with SMTP id km4mr1525297pbc.53.1333153721144;
	Fri, 30 Mar 2012 17:28:41 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id b7sm8444705pba.2.2012.03.30.17.28.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 17:28:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Mar 2012 17:27:41 -0700
Message-Id: <1333153661-32563-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] qt-4.7.4: Fix build with gcc 4.7
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
X-List-Received-Date: Sat, 31 Mar 2012 00:37:47 -0000

g++ 4.7 is detecting inheritence problems
which we solve by explictly specifying
elements in constructors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-qt/qt4/qt-4.7.4.inc             |    1 +
 meta/recipes-qt/qt4/qt-4.7.4/gcc47-fix.patch |   67 ++++++++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb    |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb    |    2 +-
 4 files changed, 70 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/gcc47-fix.patch

diff --git a/meta/recipes-qt/qt4/qt-4.7.4.inc b/meta/recipes-qt/qt4/qt-4.7.4.inc
index f8956f7..6ea9efc 100644
--- a/meta/recipes-qt/qt4/qt-4.7.4.inc
+++ b/meta/recipes-qt/qt4/qt-4.7.4.inc
@@ -20,6 +20,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://g++.conf \
            file://linux.conf \
            file://fix-qtbug-20925.patch \
+	   file://gcc47-fix.patch \
            "
 
 SRC_URI[md5sum] = "9831cf1dfa8d0689a06c2c54c5c65aaf"
diff --git a/meta/recipes-qt/qt4/qt-4.7.4/gcc47-fix.patch b/meta/recipes-qt/qt4/qt-4.7.4/gcc47-fix.patch
new file mode 100644
index 0000000..1a73626
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.7.4/gcc47-fix.patch
@@ -0,0 +1,67 @@
+Fix compiler errors e.g.
+
+| ../3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h:270:100: error: invalid static_cast from type 'QTJSC::JSVariableObject::JSVariableObjectData* const' to type 'QTJSC::JSGlobalObject::JSGlobalObjectData*'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: qt-everywhere-opensource-src-4.7.4/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
+===================================================================
+--- qt-everywhere-opensource-src-4.7.4.orig/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h	2012-03-30 15:29:20.733188940 -0700
++++ qt-everywhere-opensource-src-4.7.4/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h	2012-03-30 15:29:46.525190187 -0700
+@@ -57,9 +57,8 @@
+     
+     class JSGlobalObject : public JSVariableObject {
+     protected:
+-        using JSVariableObject::JSVariableObjectData;
+ 
+-        struct JSGlobalObjectData : public JSVariableObjectData {
++        struct JSGlobalObjectData : public JSVariableObject::JSVariableObjectData {
+             // We use an explicit destructor function pointer instead of a
+             // virtual destructor because we want to avoid adding a vtable
+             // pointer to this struct. Adding a vtable pointer would force the
+Index: qt-everywhere-opensource-src-4.7.4/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
+===================================================================
+--- qt-everywhere-opensource-src-4.7.4.orig/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h	2012-03-30 15:31:40.713195714 -0700
++++ qt-everywhere-opensource-src-4.7.4/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h	2012-03-30 15:32:01.449196717 -0700
+@@ -32,8 +32,7 @@
+     
+     class JSStaticScopeObject : public JSVariableObject {
+     protected:
+-        using JSVariableObject::JSVariableObjectData;
+-        struct JSStaticScopeObjectData : public JSVariableObjectData {
++        struct JSStaticScopeObjectData : public JSVariableObject::JSVariableObjectData {
+             JSStaticScopeObjectData()
+                 : JSVariableObjectData(&symbolTable, &registerStore + 1)
+             {
+Index: qt-everywhere-opensource-src-4.7.4/src/3rdparty/webkit/JavaScriptCore/runtime/JSGlobalObject.h
+===================================================================
+--- qt-everywhere-opensource-src-4.7.4.orig/src/3rdparty/webkit/JavaScriptCore/runtime/JSGlobalObject.h	2012-03-30 15:46:29.841238746 -0700
++++ qt-everywhere-opensource-src-4.7.4/src/3rdparty/webkit/JavaScriptCore/runtime/JSGlobalObject.h	2012-03-30 15:47:19.525241150 -0700
+@@ -57,7 +57,7 @@
+     protected:
+         using JSVariableObject::JSVariableObjectData;
+ 
+-        struct JSGlobalObjectData : public JSVariableObjectData {
++        struct JSGlobalObjectData : public JSVariableObject::JSVariableObjectData {
+             // We use an explicit destructor function pointer instead of a
+             // virtual destructor because we want to avoid adding a vtable
+             // pointer to this struct. Adding a vtable pointer would force the
+Index: qt-everywhere-opensource-src-4.7.4/src/3rdparty/webkit/JavaScriptCore/runtime/JSStaticScopeObject.h
+===================================================================
+--- qt-everywhere-opensource-src-4.7.4.orig/src/3rdparty/webkit/JavaScriptCore/runtime/JSStaticScopeObject.h	2012-03-30 15:47:50.789242663 -0700
++++ qt-everywhere-opensource-src-4.7.4/src/3rdparty/webkit/JavaScriptCore/runtime/JSStaticScopeObject.h	2012-03-30 16:25:51.465353133 -0700
+@@ -32,10 +32,9 @@
+     
+     class JSStaticScopeObject : public JSVariableObject {
+     protected:
+-        using JSVariableObject::JSVariableObjectData;
+-        struct JSStaticScopeObjectData : public JSVariableObjectData {
++        struct JSStaticScopeObjectData : public JSVariableObject::JSVariableObjectData {
+             JSStaticScopeObjectData()
+-                : JSVariableObjectData(&symbolTable, &registerStore + 1)
++                : JSVariableObject::JSVariableObjectData(&symbolTable, &registerStore + 1)
+             {
+             }
+             SymbolTable symbolTable;
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
index a1fcafb..75b2cee 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
@@ -1,7 +1,7 @@
 require qt-${PV}.inc
 require qt4-embedded.inc
 
-PR = "${INC_PR}.7"
+PR = "${INC_PR}.8"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
index e7f848e..e845759 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt-${PV}.inc
 
-PR = "${INC_PR}.7"
+PR = "${INC_PR}.8"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
-- 
1.7.5.4



