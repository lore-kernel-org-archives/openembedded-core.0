Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9125377B52
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 17:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2NHBCLj015494; Thu, 23 Mar 2017 17:11:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id l4V0Yd-B52JI; Thu, 23 Mar 2017 17:11:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2NHBAFG015474
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Mar 2017 17:11:11 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cr6GU-00029O-By; Thu, 23 Mar 2017 17:11:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 17:11:07 +0000
Message-Id: <1490289067-8206-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490289067-8206-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1490289067-8206-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/5] staging: Remove uninstalled dependencies from sysroots
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
X-List-Received-Date: Thu, 23 Mar 2017 17:11:13 -0000

Currently, if something is added to a sysroot, its hash remains unchanged,
and it continues to be buildable, it doesn't get removed from the sysroot.

This patch handles the case where something is removed from DEPENDS or
[depends].

It does introduce its own issue where something could get removed even
though some other task in parallel may have the same requirement. This
case should be extrememly rare and fixing the more common DEPENDS removal
is likely the bigger win though.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 6dd21e8..27fcd1e 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -469,6 +469,8 @@ python extend_recipe_sysroot() {
     multilibs = {}
     manifests = {}
 
+    installed = []
+
     for f in os.listdir(depdir):
         if not f.endswith(".complete"):
             continue
@@ -487,6 +489,9 @@ python extend_recipe_sysroot() {
         if mytaskname in ["do_sdk_depends", "do_populate_sdk_ext"] and c.endswith("-initial"):
             bb.note("Skipping initial setscene dependency %s for installation into the sysroot" % c)
             continue
+
+        installed.append(c)
+
         if os.path.exists(depdir + "/" + c):
             lnk = os.readlink(depdir + "/" + c)
             if lnk == c + "." + taskhash and os.path.exists(depdir + "/" + c + ".complete"):
@@ -601,6 +606,29 @@ python extend_recipe_sysroot() {
         c = setscenedeps[dep][0]
         os.symlink(manifests[dep], depdir + "/" + c + ".complete")
 
+    # We want to remove anything which this task previously installed but is no longer a dependency
+    # This could potentially race against another task which also installed it but still requires it
+    # but the alternative is not doing anything at all and that race window should be small enough
+    # to be insignificant
+    taskindex = depdir + "/" + "index." + mytaskname
+    if os.path.exists(taskindex):
+        with open(taskindex, "r") as f:
+            for l in f:
+                l = l.strip()
+                if l not in installed:
+                    l = depdir + "/" + l
+                    if not os.path.exists(l):
+                        # Was likely already uninstalled
+                        continue
+                    bb.note("Task %s no longer depends on %s, removing from sysroot" % (mytaskname, l))
+                    lnk = os.readlink(l)
+                    sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
+                    os.unlink(l)
+                    os.unlink(l + ".complete")
+    with open(taskindex, "w") as f:
+        for l in sorted(installed):
+            f.write(l + "\n")
+
     bb.utils.unlockfile(lock)
 }
 extend_recipe_sysroot[vardepsexclude] += "MACHINE_ARCH PACKAGE_EXTRA_ARCHS SDK_ARCH BUILD_ARCH SDK_OS BB_TASKDEPDATA"
-- 
2.7.4


