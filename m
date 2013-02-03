Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U29fH-0002bi-1s
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 01:12:07 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401FUM020480; Mon, 4 Feb 2013 00:01:19 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id K8CctCyWHMZg; Mon,  4 Feb 2013 00:01:18 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401Bhr020456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Feb 2013 00:01:13 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U29Pk-0000Xr-1n; Sun, 03 Feb 2013 23:56:00 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 23:55:42 +0000
Message-Id: <bbd713a4903d216fc76522552285ef089ac81d92.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
References: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 12/22] package.bbclass: Fix up bb.mkdirhier/bb.copyfile usage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 00:12:40 -0000

These are in bb.utils so lets the correct function and avoid the overhead
of the fixup/warning for the deprecated usage.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 9c8cdbc..bee6548 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -253,7 +253,7 @@ def splitdebuginfo(file, debugfile, debugsrcdir, d):
     if debugsrcdir:
         subprocess.call("'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (debugedit, workparentdir, debugsrcdir, sourcefile, file), shell=True)
 
-    bb.mkdirhier(os.path.dirname(debugfile))
+    bb.utils.mkdirhier(os.path.dirname(debugfile))
 
     subprocess.call("'%s' --only-keep-debug '%s' '%s'" % (objcopy, file, debugfile), shell=True)
 
@@ -287,7 +287,7 @@ def copydebugsources(debugsrcdir, d):
             basepath = basepath + "/" + p
             if not os.path.exists(basepath):
                 nosuchdir.append(basepath)
-        bb.mkdirhier(basepath)
+        bb.utils.mkdirhier(basepath)
 
         processdebugsrc =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '(<internal>|<built-in>)$' | "
         # We need to ignore files that are not actually ours
@@ -644,7 +644,7 @@ python fixup_perms () {
             continue
 
         # Create path to move directory to, move it, and then setup the symlink
-        bb.mkdirhier(os.path.dirname(target))
+        bb.utils.mkdirhier(os.path.dirname(target))
         #bb.note("Fixup Perms: Rename %s -> %s" % (dir, ptarget))
         os.rename(origin, target)
         #bb.note("Fixup Perms: Link %s -> %s" % (dir, link))
@@ -891,7 +891,7 @@ python populate_packages () {
     packages = d.getVar('PACKAGES', True)
     pn = d.getVar('PN', True)
 
-    bb.mkdirhier(outdir)
+    bb.utils.mkdirhier(outdir)
     os.chdir(dvar)
 
     # Sanity check PACKAGES for duplicates and for LICENSE_EXCLUSION
@@ -914,7 +914,7 @@ python populate_packages () {
 
     for pkg in package_list:
         root = os.path.join(pkgdest, pkg)
-        bb.mkdirhier(root)
+        bb.utils.mkdirhier(root)
 
         filesvar = d.getVar('FILES_%s' % pkg, True) or d.getVar('FILES', True) or ""
         if "//" in filesvar:
@@ -945,7 +945,7 @@ python populate_packages () {
             def mkdir(src, dest, p):
                 src = os.path.join(src, p)
                 dest = os.path.join(dest, p)
-                bb.mkdirhier(dest)
+                bb.utils.mkdirhier(dest)
                 fstat = os.stat(src)
                 os.chmod(dest, fstat.st_mode)
                 os.chown(dest, fstat.st_uid, fstat.st_gid)
@@ -975,7 +975,7 @@ python populate_packages () {
                 os.chmod(fpath, fstat.st_mode)
                 os.chown(fpath, fstat.st_uid, fstat.st_gid)
                 continue
-            ret = bb.copyfile(file, fpath)
+            ret = bb.utils.copyfile(file, fpath)
             if ret is False or ret == 0:
                 raise bb.build.FuncFailed("File population failed")
 
-- 
1.7.10.4



