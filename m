Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 78BAB7843F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 12:47:48 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vBJClltX013941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 19 Dec 2017 12:47:48 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eRHJD-0004aF-G7; Tue, 19 Dec 2017 12:47:47 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 12:47:46 +0000
Message-Id: <1513687666-17581-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] rm_work: Handle race with -inital tasks
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
X-List-Received-Date: Tue, 19 Dec 2017 12:47:48 -0000

There is a race with rm_work when tasks run deltask do_build since
do_rm_work becomes a floating task. Handle this by injecting
the populate_sysroot/lic dependencies manually if the tasks returned
are empty. This depends on a change to fix bb.build.preceedtask() in
bitbake too.

[YOCTO #12365]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rm_work.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 13a9e75..5918082 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -166,6 +166,10 @@ python inject_rm_work() {
     deps = set(bb.build.preceedtask('do_build', True, d))
     deps.difference_update(('do_build', 'do_rm_work_all'))
 
+    # deps can be empty if do_build doesn't exist, e.g. *-inital recipes
+    if not deps:
+        deps = ["do_populate_sysroot", "do_populate_lic"]
+
     if pn in excludes:
         d.delVarFlag('rm_work_rootfs', 'cleandirs')
         d.delVarFlag('rm_work_populatesdk', 'cleandirs')
@@ -179,6 +183,8 @@ python inject_rm_work() {
         # work in the recipe itself.
         # In practice, addtask() here merely updates the dependencies.
         bb.build.addtask('do_rm_work', 'do_build', ' '.join(deps), d)
+        if "initial" in pn:
+            bb.warn(pn + "2: " + " ".join(deps))
 
     # Always update do_build_without_rm_work dependencies.
     bb.build.addtask('do_build_without_rm_work', '', ' '.join(deps), d)
-- 
2.7.4


