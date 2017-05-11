Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5E95673081
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 16:43:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4BGhwmY005253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 11 May 2017 17:43:59 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1d8rC2-0006x5-Bg; Thu, 11 May 2017 17:43:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 May 2017 17:43:54 +0100
Message-Id: <1494521035-26677-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494521035-26677-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1494521035-26677-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 11 May 2017 17:43:59 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/3] package_deb: Split do_package_write_deb into two functions
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
X-List-Received-Date: Thu, 11 May 2017 16:44:00 -0000

This prepares the way to parallelise deb generation and splits the iteration
over packages and the package generation into separate functions. Whitespace
indentation is unchanged deliberately and is fixed in a followup patch. There
should be no functional change.

Some checks on variables are removed as they were pointless when you looked
at the code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_deb.bbclass | 57 +++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 33 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index eacabcd..636647d 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -51,47 +51,39 @@ def debian_arch_map(arch, tune):
 # INSTALL_TASK_DEB - task name
 
 python do_package_deb () {
-    import re, copy
-    import textwrap
-    import subprocess
-    import collections
-    import codecs
-
     oldcwd = os.getcwd()
 
-    workdir = d.getVar('WORKDIR')
-    if not workdir:
-        bb.error("WORKDIR not defined, unable to package")
-        return
-
-    outdir = d.getVar('PKGWRITEDIRDEB')
-    if not outdir:
-        bb.error("PKGWRITEDIRDEB not defined, unable to package")
-        return
-
     packages = d.getVar('PACKAGES')
     if not packages:
         bb.debug(1, "PACKAGES not defined, nothing to package")
         return
 
     tmpdir = d.getVar('TMPDIR')
-
     if os.access(os.path.join(tmpdir, "stamps", "DEB_PACKAGE_INDEX_CLEAN"),os.R_OK):
         os.unlink(os.path.join(tmpdir, "stamps", "DEB_PACKAGE_INDEX_CLEAN"))
 
-    if packages == []:
-        bb.debug(1, "No packages; nothing to do")
-        return
+    for pkg in packages.split():
+        deb_write_pkg(pkg, d)
+
+    os.chdir(oldcwd)
+}
 
-    pkgdest = d.getVar('PKGDEST')
+def deb_write_pkg(pkg, d):
+        import re, copy
+        import textwrap
+        import subprocess
+        import collections
+        import codecs
 
-    def cleanupcontrol(root):
-        for p in ['CONTROL', 'DEBIAN']:
-            p = os.path.join(root, p)
-            if os.path.exists(p):
-                bb.utils.prunedir(p)
+        outdir = d.getVar('PKGWRITEDIRDEB')
+        pkgdest = d.getVar('PKGDEST')
+
+        def cleanupcontrol(root):
+            for p in ['CONTROL', 'DEBIAN']:
+                p = os.path.join(root, p)
+                if os.path.exists(p):
+                    bb.utils.prunedir(p)
 
-    for pkg in packages.split():
         localdata = bb.data.createCopy(d)
         root = "%s/%s" % (pkgdest, pkg)
 
@@ -118,7 +110,7 @@ python do_package_deb () {
         if not g and localdata.getVar('ALLOW_EMPTY', False) != "1":
             bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV'), localdata.getVar('PKGR')))
             bb.utils.unlockfile(lf)
-            continue
+            return
 
         controldir = os.path.join(root, 'DEBIAN')
         bb.utils.mkdirhier(controldir)
@@ -293,13 +285,12 @@ python do_package_deb () {
 
         cleanupcontrol(root)
         bb.utils.unlockfile(lf)
-    os.chdir(oldcwd)
-}
-# Indirect references to these vars
-do_package_write_deb[vardeps] += "PKGV PKGR PKGV DESCRIPTION SECTION PRIORITY MAINTAINER DPKG_ARCH PN HOMEPAGE"
+
 # Otherwise allarch packages may change depending on override configuration
-do_package_deb[vardepsexclude] = "OVERRIDES"
+deb_write_pkg[vardepsexclude] = "OVERRIDES"
 
+# Indirect references to these vars
+do_package_write_deb[vardeps] += "PKGV PKGR PKGV DESCRIPTION SECTION PRIORITY MAINTAINER DPKG_ARCH PN HOMEPAGE"
 
 SSTATETASKS += "do_package_write_deb"
 do_package_write_deb[sstate-inputdirs] = "${PKGWRITEDIRDEB}"
-- 
2.7.4


