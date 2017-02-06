Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8022B7198A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 15:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v16FqMaP019012; Mon, 6 Feb 2017 15:52:22 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JCJHgcHdKnly; Mon,  6 Feb 2017 15:52:22 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v16FqG9Y019000
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 6 Feb 2017 15:52:17 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1calaS-00026d-Aw; Mon, 06 Feb 2017 15:52:16 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 15:52:12 +0000
Message-Id: <1486396334-8039-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486396334-8039-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1486396334-8039-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/6] staging: Add shared manifest support
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

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index b92bdaf..bd798ba 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -479,6 +479,7 @@ python extend_recipe_sysroot() {
     bb.note("\n".join(msgbuf))
 
     stagingdir = d.getVar("STAGING_DIR")
+    sharedmanifests = stagingdir + "-components/manifests"
     recipesysroot = d.getVar("RECIPE_SYSROOT")
     recipesysrootnative = d.getVar("RECIPE_SYSROOT_NATIVE")
     current_variant = d.getVar("BBEXTENDVARIANT")
@@ -493,6 +494,7 @@ python extend_recipe_sysroot() {
 
     depdir = recipesysrootnative + "/installeddeps"
     bb.utils.mkdirhier(depdir)
+    bb.utils.mkdirhier(sharedmanifests)
 
     lock = bb.utils.lockfile(recipesysroot + "/sysroot.lock")
 
@@ -588,6 +590,27 @@ python extend_recipe_sysroot() {
                         dest = staging_copyfile(l, destsysroot, fixme[''], postinsts, stagingdir, seendirs)
                     if dest:
                         m.write(dest.replace(workdir + "/", "") + "\n")
+            # Having multiple identical manifests in each sysroot eats diskspace so
+            # create a shared pool of them.
+            sharedm = sharedmanifests + "/" + os.path.basename(taskmanifest)
+            if not os.path.exists(sharedm):
+                smlock = bb.utils.lockfile(sharedm + ".lock")
+                # Can race here. You'd think it just means we may not end up with all copies hardlinked to each other
+                # but python can lose file handles so we need to do this under a lock.
+                try:
+                    if not os.path.exists(sharedm):
+                        os.rename(taskmanifest, sharedm)
+                except OSError:
+                   pass
+                bb.utils.unlockfile(smlock)
+            if os.path.exists(sharedm):
+                # If we're crossing mount points we'll not reach here.
+                if os.path.exists(taskmanifest):
+                    if os.path.getsize(sharedm) != os.path.getsize(taskmanifest):
+                        # Order of entries can differ, overall size shouldn't
+                        raise Exception("Manifests %s and %s differ in size and shouldn't?" % (sharedm, taskmanifest))
+                    os.unlink(taskmanifest)
+                os.link(sharedm, taskmanifest)
 
     for f in fixme:
         if f == '':
-- 
2.7.4


