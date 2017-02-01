Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4932373196
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 12:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v11C5Bc2011929; Wed, 1 Feb 2017 12:05:11 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KbRSGjz4_LN7; Wed,  1 Feb 2017 12:05:11 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v11C5AaL011901
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Feb 2017 12:05:11 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cYtew-0000FC-9J; Wed, 01 Feb 2017 12:05:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 12:05:06 +0000
Message-Id: <1485950707-878-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485950707-878-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1485950707-878-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] staging: Reduce the number of mkdirs calls
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
X-List-Received-Date: Wed, 01 Feb 2017 12:05:13 -0000

The number of mkdir calls was showing up high on the profile charts since
it was getting called once per file which is excessive. Each call results
in one or more syscalls which is bad for performance. Cache which
directories we've seen to reduce the calls to a more reasonable number
and speed up recipe specific sysroots.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 35e53fe..93d31eb 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -244,7 +244,7 @@ python do_populate_sysroot_setscene () {
 }
 addtask do_populate_sysroot_setscene
 
-def staging_copyfile(c, target, fixme, postinsts, stagingdir):
+def staging_copyfile(c, target, fixme, postinsts, stagingdir, seendirs):
     import errno
 
     if c.endswith("/fixmepath"):
@@ -255,7 +255,10 @@ def staging_copyfile(c, target, fixme, postinsts, stagingdir):
     #bb.warn(c)
     dest = c.replace(stagingdir, "")
     dest = target + "/" + "/".join(dest.split("/")[3:])
-    bb.utils.mkdirhier(os.path.dirname(dest))
+    destdir = os.path.dirname(dest)
+    if destdir not in seendirs:
+        bb.utils.mkdirhier(destdir)
+        seendirs.add(destdir)
     if "/usr/bin/postinst-" in c:
         postinsts.append(dest)
     if os.path.islink(c):
@@ -278,10 +281,12 @@ def staging_copyfile(c, target, fixme, postinsts, stagingdir):
                 raise
     return dest
 
-def staging_copydir(c, target, stagingdir):
+def staging_copydir(c, target, stagingdir, seendirs):
     dest = c.replace(stagingdir, "")
     dest = target + "/" + "/".join(dest.split("/")[3:])
-    bb.utils.mkdirhier(dest)
+    if dest not in seendirs:
+        bb.utils.mkdirhier(dest)
+        seendirs.add(dest)
 
 def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
     import subprocess
@@ -302,6 +307,7 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
 
     fixme = []
     postinsts = []
+    seendirs = set()
     stagingdir = d.getVar("STAGING_DIR")
     if native:
         pkgarchs = ['${BUILD_ARCH}', '${BUILD_ARCH}_*']
@@ -332,10 +338,10 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
                 for l in f:
                     l = l.strip()
                     if l.endswith("/"):
-                        staging_copydir(l, targetdir, stagingdir)
+                        staging_copydir(l, targetdir, stagingdir, seendirs)
                         continue
                     try:
-                        staging_copyfile(l, targetdir, fixme, postinsts, stagingdir)
+                        staging_copyfile(l, targetdir, fixme, postinsts, stagingdir, seendirs)
                     except FileExistsError:
                         continue
 
@@ -492,6 +498,7 @@ python extend_recipe_sysroot() {
     fixme = {}
     fixme[''] = []
     fixme['native'] = []
+    seendirs = set()
     postinsts = []
     multilibs = {}
     manifests = {}
@@ -570,14 +577,14 @@ python extend_recipe_sysroot() {
                     l = l.strip()
                     if l.endswith("/"):
                         if native:
-                            dest = staging_copydir(l, recipesysrootnative, stagingdir)
+                            dest = staging_copydir(l, recipesysrootnative, stagingdir, seendirs)
                         else:
-                            dest = staging_copydir(l, destsysroot, stagingdir)
+                            dest = staging_copydir(l, destsysroot, stagingdir, seendirs)
                         continue
                     if native:
-                        dest = staging_copyfile(l, recipesysrootnative, fixme['native'], postinsts, stagingdir)
+                        dest = staging_copyfile(l, recipesysrootnative, fixme['native'], postinsts, stagingdir, seendirs)
                     else:
-                        dest = staging_copyfile(l, destsysroot, fixme[''], postinsts, stagingdir)
+                        dest = staging_copyfile(l, destsysroot, fixme[''], postinsts, stagingdir, seendirs)
                     if dest:
                         m.write(dest.replace(workdir + "/", "") + "\n")
 
-- 
2.7.4


