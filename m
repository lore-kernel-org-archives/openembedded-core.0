Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B6B6A71993
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 15:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v16FqMD1019019; Mon, 6 Feb 2017 15:52:22 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W3qh-1SDJcvf; Mon,  6 Feb 2017 15:52:22 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v16FqGoG019001
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 6 Feb 2017 15:52:17 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1calaS-00026i-Bh; Mon, 06 Feb 2017 15:52:16 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 15:52:13 +0000
Message-Id: <1486396334-8039-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486396334-8039-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1486396334-8039-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/6] staging: Improve file creation resiliance
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
X-List-Received-Date: Mon, 06 Feb 2017 15:52:24 -0000

If you abort a build mid execution of the staging extend_sysroot function
there are currently races and cleanup of that function may fail.

This change splits the code into separate phases so that the manifests are
manipulated before files are installed, meaning we should be able to reverse
actions if builds fail, crash or are interrupted.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 88 ++++++++++++++++++++++++--------------------
 1 file changed, 49 insertions(+), 39 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index bd798ba..0cb46bf 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -245,17 +245,9 @@ python do_populate_sysroot_setscene () {
 }
 addtask do_populate_sysroot_setscene
 
-def staging_copyfile(c, target, fixme, postinsts, stagingdir, seendirs):
+def staging_copyfile(c, target, dest, postinsts, seendirs):
     import errno
 
-    if c.endswith("/fixmepath"):
-        fixme.append(c)
-        return None
-    if c.endswith("/fixmepath.cmd"):
-        return None
-    #bb.warn(c)
-    dest = c.replace(stagingdir, "")
-    dest = target + "/" + "/".join(dest.split("/")[3:])
     destdir = os.path.dirname(dest)
     if destdir not in seendirs:
         bb.utils.mkdirhier(destdir)
@@ -282,9 +274,7 @@ def staging_copyfile(c, target, fixme, postinsts, stagingdir, seendirs):
                 raise
     return dest
 
-def staging_copydir(c, target, stagingdir, seendirs):
-    dest = c.replace(stagingdir, "")
-    dest = target + "/" + "/".join(dest.split("/")[3:])
+def staging_copydir(c, target, dest, seendirs):
     if dest not in seendirs:
         bb.utils.mkdirhier(dest)
         seendirs.add(dest)
@@ -338,11 +328,18 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
             with open(manifest, "r") as f:
                 for l in f:
                     l = l.strip()
+                    if l.endswith("/fixmepath"):
+                        fixme.append(l)
+                        continue
+                    if l.endswith("/fixmepath.cmd"):
+                        continue
+                    dest = l.replace(stagingdir, "")
+                    dest = targetdir + "/" + "/".join(dest.split("/")[3:])
                     if l.endswith("/"):
-                        staging_copydir(l, targetdir, stagingdir, seendirs)
+                        staging_copydir(l, targetdir, dest, seendirs)
                         continue
                     try:
-                        staging_copyfile(l, targetdir, fixme, postinsts, stagingdir, seendirs)
+                        staging_copyfile(l, targetdir, dest, postinsts, seendirs)
                     except FileExistsError:
                         continue
 
@@ -365,6 +362,8 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
 python extend_recipe_sysroot() {
     import copy
     import subprocess
+    import errno
+    import collections
 
     taskdepdata = d.getVar("BB_TASKDEPDATA", False)
     mytaskname = d.getVar("BB_RUNTASK")
@@ -574,43 +573,54 @@ python extend_recipe_sysroot() {
         if not os.path.exists(manifest):
             bb.warn("Manifest %s not found?" % manifest)
         else:
-            with open(manifest, "r") as f, open(taskmanifest, 'w') as m:
+            newmanifest = collections.OrderedDict()
+            if native:
+                fm = fixme['native']
+                targetdir = recipesysrootnative
+            else:
+                fm = fixme['']
+                targetdir = destsysroot
+            with open(manifest, "r") as f:
                 manifests[dep] = manifest
                 for l in f:
                     l = l.strip()
-                    if l.endswith("/"):
-                        if native:
-                            dest = staging_copydir(l, recipesysrootnative, stagingdir, seendirs)
-                        else:
-                            dest = staging_copydir(l, destsysroot, stagingdir, seendirs)
+                    if l.endswith("/fixmepath"):
+                        fm.append(l)
+                        continue
+                    if l.endswith("/fixmepath.cmd"):
                         continue
-                    if native:
-                        dest = staging_copyfile(l, recipesysrootnative, fixme['native'], postinsts, stagingdir, seendirs)
-                    else:
-                        dest = staging_copyfile(l, destsysroot, fixme[''], postinsts, stagingdir, seendirs)
-                    if dest:
-                        m.write(dest.replace(workdir + "/", "") + "\n")
+                    dest = l.replace(stagingdir, "")
+                    dest = targetdir + "/" + "/".join(dest.split("/")[3:])
+                    newmanifest[l] = dest
             # Having multiple identical manifests in each sysroot eats diskspace so
-            # create a shared pool of them.
+            # create a shared pool of them and hardlink if we can.
+            # We create the manifest in advance so that if something fails during installation,
+            # or the build is interrupted, subsequent exeuction can cleanup.
             sharedm = sharedmanifests + "/" + os.path.basename(taskmanifest)
             if not os.path.exists(sharedm):
                 smlock = bb.utils.lockfile(sharedm + ".lock")
                 # Can race here. You'd think it just means we may not end up with all copies hardlinked to each other
                 # but python can lose file handles so we need to do this under a lock.
-                try:
-                    if not os.path.exists(sharedm):
-                        os.rename(taskmanifest, sharedm)
-                except OSError:
-                   pass
+                if not os.path.exists(sharedm):
+                    with open(sharedm, 'w') as m:
+                       for l in newmanifest:
+                           dest = newmanifest[l]
+                           m.write(dest.replace(workdir + "/", "") + "\n")
                 bb.utils.unlockfile(smlock)
-            if os.path.exists(sharedm):
-                # If we're crossing mount points we'll not reach here.
-                if os.path.exists(taskmanifest):
-                    if os.path.getsize(sharedm) != os.path.getsize(taskmanifest):
-                        # Order of entries can differ, overall size shouldn't
-                        raise Exception("Manifests %s and %s differ in size and shouldn't?" % (sharedm, taskmanifest))
-                    os.unlink(taskmanifest)
+            try:
                 os.link(sharedm, taskmanifest)
+            except OSError as err:
+                if err.errno == errno.EXDEV:
+                    bb.utils.copyfile(sharedm, taskmanifest)
+                else:
+                    raise
+            # Finally actually install the files
+            for l in newmanifest:
+                    dest = newmanifest[l]
+                    if l.endswith("/"):
+                        staging_copydir(l, targetdir, dest, seendirs)
+                        continue
+                    staging_copyfile(l, targetdir, dest, postinsts, seendirs)
 
     for f in fixme:
         if f == '':
-- 
2.7.4


