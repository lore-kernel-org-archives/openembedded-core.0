Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 24D5160116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 15:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBFFd0Th001138 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 15:39:00 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uR6HUQwDmeem
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 15:39:00 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBFFcsLn001132
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 15:38:55 GMT
Message-ID: <1450193934.13505.58.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Dec 2015 15:38:54 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] package: Add auto package splitting of .debug files
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
X-List-Received-Date: Tue, 15 Dec 2015 15:39:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Creating FILES_${PN}-dbg is tedious and also pretty pointless. We might as well
assume ".debug" is a special directory name and split into -dbg automatically.

This change does so without changing the rest of the splitting logic too much.
It can be disabled for the cases where we really do want manual control of
the -dbg packages (e.g. qt4) with NOAUTOPACKAGEDEBUG = "1".

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2bae341..54f7ae5 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1039,6 +1039,8 @@ python populate_packages () {
 
     bb.utils.mkdirhier(outdir)
     os.chdir(dvar)
+    
+    autodebug = not (d.getVar("NOAUTOPACKAGEDEBUG", True) or False)
 
     # Sanity check PACKAGES for duplicates
     # Sanity should be moved to sanity.bbclass once we have the infrastucture
@@ -1048,6 +1050,8 @@ python populate_packages () {
         if pkg in package_list:
             msg = "%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg
             package_qa_handle_error("packages-list", msg, d)
+        elif autodebug and pkg.endswith("-dbg"):
+            package_list.insert(0, pkg)
         else:
             package_list.append(pkg)
     d.setVar('PACKAGES', ' '.join(package_list))
@@ -1058,6 +1062,16 @@ python populate_packages () {
     # os.mkdir masks the permissions with umask so we have to unset it first
     oldumask = os.umask(0)
 
+    debug = []
+    for root, dirs, files in cpath.walk(dvar):
+        dir = root[len(dvar):]
+        if not dir:
+            dir = os.sep
+        for f in (files + dirs):
+            path = "." + os.path.join(dir, f)
+            if "/.debug/" in path or path.endswith("/.debug"):
+                debug.append(path)
+
     for pkg in package_list:
         root = os.path.join(pkgdest, pkg)
         bb.utils.mkdirhier(root)
@@ -1071,6 +1085,9 @@ python populate_packages () {
         origfiles = filesvar.split()
         files = files_from_filevars(origfiles)
 
+        if autodebug and pkg.endswith("-dbg"):
+            files.extend(debug)
+
         for file in files:
             if (not cpath.islink(file)) and (not cpath.exists(file)):
                 continue
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 2058e54..91be769 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -129,6 +129,7 @@ PACKAGES_DYNAMIC += "^${QT_BASE_NAME}-plugin-.* ^${QT_BASE_NAME}-translation-.*
 
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}     = ""
+NOAUTOPACKAGEDEBUG = "1"
 FILES_${PN}-dev = "${includedir}/${QT_DIR_NAME}/Qt/*"
 FILES_${PN}-dbg = "/usr/src/debug/"
 FILES_${QT_BASE_NAME}-demos-doc = "${docdir}/${QT_DIR_NAME}/qch/qt.qch"



