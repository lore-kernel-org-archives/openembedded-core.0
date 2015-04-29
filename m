Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1314B7169F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 13:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3TDNUXA002641 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 14:23:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vg6g5-zsdcMQ
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 14:23:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3TDNE06002625
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 14:23:25 +0100
Message-ID: <1430313794.19130.15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 14:23:14 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] package: Fix license exclusion packaging errors
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
X-List-Received-Date: Wed, 29 Apr 2015 13:23:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently the license exclusion code removes packages from PACKAGES
pre population of the package directories. This means that the FILES
entries for some packages are not seen and invariably results in
packaging errors.

Instead, remove the packages from PACKAGES post population of the packages
so the usual FILES entries work as expected but the file are not placed
into any packages and no packages containing embargoed licenses are generated.

This avoids errors from gcc-runtime with GPLv3 exclusion like:

ERROR: QA Issue: gcc-runtime: Files/directories were installed but not shipped in any package:
  /usr/share
  /usr/src
  /usr/share/gcc-4.9.2
  /usr/share/gcc-4.9.2/python
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install. [installed-vs-shipped]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 5ece69e..a76e6e9 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1041,14 +1041,11 @@ python populate_packages () {
     bb.utils.mkdirhier(outdir)
     os.chdir(dvar)
 
-    # Sanity check PACKAGES for duplicates and for LICENSE_EXCLUSION
+    # Sanity check PACKAGES for duplicates
     # Sanity should be moved to sanity.bbclass once we have the infrastucture
     package_list = []
 
     for pkg in packages.split():
-        if d.getVar('LICENSE_EXCLUSION-' + pkg, True):
-            msg = "%s has an incompatible license. Excluding from packaging." % pkg
-            package_qa_handle_error("incompatible-license", msg, d)
         if pkg in package_list:
             msg = "%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg
             package_qa_handle_error("packages-list", msg, d)
@@ -1082,9 +1079,6 @@ python populate_packages () {
                 continue
             seen.append(file)
 
-            if d.getVar('LICENSE_EXCLUSION-' + pkg, True):
-                continue
-
             def mkdir(src, dest, p):
                 src = os.path.join(src, p)
                 dest = os.path.join(dest, p)
@@ -1125,6 +1119,16 @@ python populate_packages () {
     os.umask(oldumask)
     os.chdir(workdir)
 
+    # Handle LICENSE_EXCLUSION
+    package_list = []
+    for pkg in packages.split():
+        if d.getVar('LICENSE_EXCLUSION-' + pkg, True):
+            msg = "%s has an incompatible license. Excluding from packaging." % pkg
+            package_qa_handle_error("incompatible-license", msg, d)
+        else:
+            package_list.append(pkg)
+    d.setVar('PACKAGES', ' '.join(package_list))
+
     unshipped = []
     for root, dirs, files in cpath.walk(dvar):
         dir = root[len(dvar):]



