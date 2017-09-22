Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D930C77E8F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 16:41:19 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8MGfIRD026639
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 22 Sep 2017 17:41:19 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dvR0w-0001QV-CV; Fri, 22 Sep 2017 17:41:18 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Sep 2017 17:41:16 +0100
Message-Id: <1506098477-5444-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/2] staging: Reduce verbosity of log messages
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
X-List-Received-Date: Fri, 22 Sep 2017 16:41:20 -0000

The staging changes were very verbose in their logging and whilst this is useful
when staging issues occur, those thankfully seem rare now and we can tune down
the logging to a sane level. This improves the readability of error messages from
functions that fail.

The code is still verbose when its replacing things in the sysroot.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 6185aef..ea831e0 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -373,7 +373,8 @@ python extend_recipe_sysroot() {
                     msgbuf.append("Following dependency on %s" % setscenedeps[datadep][0])
         next = new
 
-    bb.note("\n".join(msgbuf))
+    # This logging is too verbose for day to day use sadly
+    #bb.debug(2, "\n".join(msgbuf))
 
     depdir = recipesysrootnative + "/installeddeps"
     bb.utils.mkdirhier(depdir)
@@ -442,6 +443,8 @@ python extend_recipe_sysroot() {
             os.unlink(fl)
             os.unlink(fl + ".complete")
 
+    msg_exists = []
+    msg_adding = []
     for dep in configuredeps:
         c = setscenedeps[dep][0]
         if c not in installed:
@@ -452,7 +455,7 @@ python extend_recipe_sysroot() {
         if os.path.exists(depdir + "/" + c):
             lnk = os.readlink(depdir + "/" + c)
             if lnk == c + "." + taskhash and os.path.exists(depdir + "/" + c + ".complete"):
-                bb.note("%s exists in sysroot, skipping" % c)
+                msg_exists.append(c)
                 continue
             else:
                 bb.note("%s exists in sysroot, but is stale (%s vs. %s), removing." % (c, lnk, c + "." + taskhash))
@@ -463,6 +466,8 @@ python extend_recipe_sysroot() {
         elif os.path.lexists(depdir + "/" + c):
             os.unlink(depdir + "/" + c)
 
+        msg_adding.append(c)
+
         os.symlink(c + "." + taskhash, depdir + "/" + c)
 
         d2 = d
@@ -559,6 +564,9 @@ python extend_recipe_sysroot() {
                         continue
                     staging_copyfile(l, targetdir, dest, postinsts, seendirs)
 
+    bb.note("Installed into sysroot: %s" % str(msg_adding))
+    bb.note("Skipping as already exists in sysroot: %s" % str(msg_exists))
+
     for f in fixme:
         if f == '':
             staging_processfixme(fixme[f], recipesysroot, recipesysroot, recipesysrootnative, d)
-- 
2.7.4


