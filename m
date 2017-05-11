Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7970272FBF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 16:44:00 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4BGhxdZ005261
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 11 May 2017 17:44:00 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1d8rC3-0006xB-Lt; Thu, 11 May 2017 17:43:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 May 2017 17:43:55 +0100
Message-Id: <1494521035-26677-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494521035-26677-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1494521035-26677-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 11 May 2017 17:44:00 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 3/3] package_ipk/deb: Tweak functions for better cleanup and layout
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

This uses more modern formatting to handle the lockfiles and control
file cleanup with try/finally, taking advantage of the previous
extra indentation.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_deb.bbclass | 33 +++++++++++++++++----------------
 meta/classes/package_ipk.bbclass | 32 ++++++++++++++++----------------
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 636647d..04b9197 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -69,25 +69,26 @@ python do_package_deb () {
 }
 
 def deb_write_pkg(pkg, d):
-        import re, copy
-        import textwrap
-        import subprocess
-        import collections
-        import codecs
+    import re, copy
+    import textwrap
+    import subprocess
+    import collections
+    import codecs
 
-        outdir = d.getVar('PKGWRITEDIRDEB')
-        pkgdest = d.getVar('PKGDEST')
+    outdir = d.getVar('PKGWRITEDIRDEB')
+    pkgdest = d.getVar('PKGDEST')
 
-        def cleanupcontrol(root):
-            for p in ['CONTROL', 'DEBIAN']:
-                p = os.path.join(root, p)
-                if os.path.exists(p):
-                    bb.utils.prunedir(p)
+    def cleanupcontrol(root):
+        for p in ['CONTROL', 'DEBIAN']:
+            p = os.path.join(root, p)
+            if os.path.exists(p):
+                bb.utils.prunedir(p)
 
-        localdata = bb.data.createCopy(d)
-        root = "%s/%s" % (pkgdest, pkg)
+    localdata = bb.data.createCopy(d)
+    root = "%s/%s" % (pkgdest, pkg)
 
-        lf = bb.utils.lockfile(root + ".lock")
+    lf = bb.utils.lockfile(root + ".lock")
+    try:
 
         localdata.setVar('ROOT', '')
         localdata.setVar('ROOT_%s' % pkg, root)
@@ -109,7 +110,6 @@ def deb_write_pkg(pkg, d):
         g = glob('*')
         if not g and localdata.getVar('ALLOW_EMPTY', False) != "1":
             bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV'), localdata.getVar('PKGR')))
-            bb.utils.unlockfile(lf)
             return
 
         controldir = os.path.join(root, 'DEBIAN')
@@ -283,6 +283,7 @@ def deb_write_pkg(pkg, d):
         os.chdir(basedir)
         subprocess.check_output("PATH=\"%s\" dpkg-deb -b %s %s" % (localdata.getVar("PATH"), root, pkgoutdir), shell=True)
 
+    finally:
         cleanupcontrol(root)
         bb.utils.unlockfile(lf)
 
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 16ee761..5cc7e0a 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -44,25 +44,25 @@ python do_package_ipk () {
 }
 
 def ipk_write_pkg(pkg, d):
-        import re, copy
-        import subprocess
-        import textwrap
-        import collections
+    import re, copy
+    import subprocess
+    import textwrap
+    import collections
 
-        def cleanupcontrol(root):
-            for p in ['CONTROL', 'DEBIAN']:
-                p = os.path.join(root, p)
-                if os.path.exists(p):
-                    bb.utils.prunedir(p)
+    def cleanupcontrol(root):
+        for p in ['CONTROL', 'DEBIAN']:
+            p = os.path.join(root, p)
+            if os.path.exists(p):
+                bb.utils.prunedir(p)
 
-        outdir = d.getVar('PKGWRITEDIRIPK')
-        pkgdest = d.getVar('PKGDEST')
-
-        localdata = bb.data.createCopy(d)
-        root = "%s/%s" % (pkgdest, pkg)
+    outdir = d.getVar('PKGWRITEDIRIPK')
+    pkgdest = d.getVar('PKGDEST')
 
-        lf = bb.utils.lockfile(root + ".lock")
+    localdata = bb.data.createCopy(d)
+    root = "%s/%s" % (pkgdest, pkg)
 
+    lf = bb.utils.lockfile(root + ".lock")
+    try:
         localdata.setVar('ROOT', '')
         localdata.setVar('ROOT_%s' % pkg, root)
         pkgname = localdata.getVar('PKG_%s' % pkg)
@@ -107,7 +107,6 @@ def ipk_write_pkg(pkg, d):
         g = glob('*')
         if not g and localdata.getVar('ALLOW_EMPTY', False) != "1":
             bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV'), localdata.getVar('PKGR')))
-            bb.utils.unlockfile(lf)
             return
 
         controldir = os.path.join(root, 'CONTROL')
@@ -245,6 +244,7 @@ def ipk_write_pkg(pkg, d):
             ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname, ipkver, d.getVar('PACKAGE_ARCH'))
             sign_ipk(d, ipk_to_sign)
 
+    finally:
         cleanupcontrol(root)
         bb.utils.unlockfile(lf)
 
-- 
2.7.4


