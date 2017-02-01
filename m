Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 48FD671DA3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 12:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v11C5BAJ011927; Wed, 1 Feb 2017 12:05:11 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iR7bwVti2KZg; Wed,  1 Feb 2017 12:05:11 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v11C5ALS011900
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Feb 2017 12:05:11 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cYtew-0000F9-8W; Wed, 01 Feb 2017 12:05:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 12:05:05 +0000
Message-Id: <1485950707-878-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/3] sstate/staging: Batch log messages for performance
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

According to profile data, repeated calls to bb.debug and bb.note in
the extend_recipe_sysroot() codepath were accounting for 75% of the time
(1.5s) in calls from tasks like do_image_complete.

This batches up the log messages into one call into the logging system
which gives similar behaviour to disabling the logging but retains the
debug information.

Since setscene_depvalid is also called from bitbake's setscene code,
we have to be a little creative with the function parameters and leave
the other debug output mechanism in place. This should hopefully
speed up recipe specific sysroots.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass  | 14 ++++++++++----
 meta/classes/staging.bbclass | 11 +++++++----
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index aeb7466..ada6fe5 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -909,13 +909,19 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
 
 BB_SETSCENE_DEPVALID = "setscene_depvalid"
 
-def setscene_depvalid(task, taskdependees, notneeded, d):
+def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
     # taskdependees is a dict of tasks which depend on task, each being a 3 item list of [PN, TASKNAME, FILENAME]
     # task is included in taskdependees too
     # Return - False - We need this dependency
     #        - True - We can skip this dependency
 
-    bb.debug(2, "Considering setscene task: %s" % (str(taskdependees[task])))
+    def logit(msg, log):
+        if log is not None:
+            log.append(msg)
+        else:
+            bb.debug(2, msg)
+
+    logit("Considering setscene task: %s" % (str(taskdependees[task])), log)
 
     def isNativeCross(x):
         return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x or x.endswith("-cross")
@@ -933,7 +939,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
         return True
 
     for dep in taskdependees:
-        bb.debug(2, "  considering dependency: %s" % (str(taskdependees[dep])))
+        logit("  considering dependency: %s" % (str(taskdependees[dep])), log)
         if task == dep:
             continue
         if dep in notneeded:
@@ -987,7 +993,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
 
 
         # Safe fallthrough default
-        bb.debug(2, " Default setscene dependency fall through due to dependency: %s" % (str(taskdependees[dep])))
+        logit(" Default setscene dependency fall through due to dependency: %s" % (str(taskdependees[dep])), log)
         return False
     return True
 
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index b9c84a4..35e53fe 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -441,6 +441,7 @@ python extend_recipe_sysroot() {
     bb.note("Direct dependencies are %s" % str(configuredeps))
     #bb.note(" or %s" % str(start))
 
+    msgbuf = []
     # Call into setscene_depvalid for each sub-dependency and only copy sysroot files
     # for ones that would be restored from sstate.
     done = list(start)
@@ -455,19 +456,21 @@ python extend_recipe_sysroot() {
                 taskdeps = {}
                 taskdeps[dep] = setscenedeps[dep][:2]
                 taskdeps[datadep] = setscenedeps[datadep][:2]
-                retval = setscene_depvalid(datadep, taskdeps, [], d)
+                retval = setscene_depvalid(datadep, taskdeps, [], d, msgbuf)
                 if retval:
-                    bb.note("Skipping setscene dependency %s for installation into the sysroot" % datadep)
+                    msgbuf.append("Skipping setscene dependency %s for installation into the sysroot")
                     continue
                 done.append(datadep)
                 new.append(datadep)
                 if datadep not in configuredeps and setscenedeps[datadep][1] == "do_populate_sysroot":
                     configuredeps.append(datadep)
-                    bb.note("Adding dependency on %s" % setscenedeps[datadep][0])
+                    msgbuf.append("Adding dependency on %s" % setscenedeps[datadep][0])
                 else:
-                    bb.note("Following dependency on %s" % setscenedeps[datadep][0])
+                    msgbuf.append("Following dependency on %s" % setscenedeps[datadep][0])
         next = new
 
+    bb.note("\n".join(msgbuf))
+
     stagingdir = d.getVar("STAGING_DIR")
     recipesysroot = d.getVar("RECIPE_SYSROOT")
     recipesysrootnative = d.getVar("RECIPE_SYSROOT_NATIVE")
-- 
2.7.4


