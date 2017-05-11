Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 183AD72FBF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 16:43:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4BGhv37005251
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 11 May 2017 17:43:58 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1d8rC1-0006x0-A8; Thu, 11 May 2017 17:43:57 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 May 2017 17:43:53 +0100
Message-Id: <1494521035-26677-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 11 May 2017 17:43:58 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/3] package_ipk: Split into two functions
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

This prepares the way to parallelise ipk generation and splits the iteration
over packages and the package generation into separate functions. Whitespace
indentation is unchanged deliberately and is fixed in a followup patch. There
should be no functional change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_ipk.bbclass | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index c7cec9d..16ee761 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -17,11 +17,6 @@ OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKA
 OPKGLIBDIR = "${localstatedir}/lib"
 
 python do_package_ipk () {
-    import re, copy
-    import textwrap
-    import subprocess
-    import collections
-
     oldcwd = os.getcwd()
 
     workdir = d.getVar('WORKDIR')
@@ -42,13 +37,27 @@ python do_package_ipk () {
     if os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"), os.R_OK):
         os.unlink(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"))
 
-    def cleanupcontrol(root):
-        for p in ['CONTROL', 'DEBIAN']:
-            p = os.path.join(root, p)
-            if os.path.exists(p):
-                bb.utils.prunedir(p)
-
     for pkg in packages.split():
+        ipk_write_pkg(pkg, d)
+
+    os.chdir(oldcwd)
+}
+
+def ipk_write_pkg(pkg, d):
+        import re, copy
+        import subprocess
+        import textwrap
+        import collections
+
+        def cleanupcontrol(root):
+            for p in ['CONTROL', 'DEBIAN']:
+                p = os.path.join(root, p)
+                if os.path.exists(p):
+                    bb.utils.prunedir(p)
+
+        outdir = d.getVar('PKGWRITEDIRIPK')
+        pkgdest = d.getVar('PKGDEST')
+
         localdata = bb.data.createCopy(d)
         root = "%s/%s" % (pkgdest, pkg)
 
@@ -99,7 +108,7 @@ python do_package_ipk () {
         if not g and localdata.getVar('ALLOW_EMPTY', False) != "1":
             bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV'), localdata.getVar('PKGR')))
             bb.utils.unlockfile(lf)
-            continue
+            return
 
         controldir = os.path.join(root, 'CONTROL')
         bb.utils.mkdirhier(controldir)
@@ -239,10 +248,9 @@ python do_package_ipk () {
         cleanupcontrol(root)
         bb.utils.unlockfile(lf)
 
-    os.chdir(oldcwd)
-}
 # Otherwise allarch packages may change depending on override configuration
-do_package_ipk[vardepsexclude] = "OVERRIDES"
+ipk_write_pkg[vardepsexclude] = "OVERRIDES"
+
 
 SSTATETASKS += "do_package_write_ipk"
 do_package_write_ipk[sstate-inputdirs] = "${PKGWRITEDIRIPK}"
-- 
2.7.4


