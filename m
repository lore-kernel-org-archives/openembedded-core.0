Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id DABBE7754B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 12:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 54620183A0;
	Tue,  3 Jul 2018 14:00:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id CDtHHhv3GEDG; Tue,  3 Jul 2018 14:00:09 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 374FF180E6;
	Tue,  3 Jul 2018 14:00:09 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E8551E072;
	Tue,  3 Jul 2018 14:00:09 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11DD81E056;
	Tue,  3 Jul 2018 14:00:09 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue,  3 Jul 2018 14:00:09 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by seth.se.axis.com (Postfix) with ESMTP id 04B6F2152;
	Tue,  3 Jul 2018 14:00:09 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id EB2BB9C0AD; Tue,  3 Jul 2018 14:00:08 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2018 14:00:08 +0200
Message-Id: <20180703120008.15766-1-olofjn@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Subject: [PATCH v2] rpm: Avoid leaking temporary scriplet files
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
X-List-Received-Date: Tue, 03 Jul 2018 12:00:11 -0000

RPM writes each package scriptlet (post-/preinstall) to
/var/tmp/rpm-tmp.XXXXXX --- a lot of files potentially gets created.
When debugging is enabled, these temporary scriptlet files aren't
cleaned up at all and after a while this results in the filesystem
resources are eaten up (like running out of available inodes).

Normally, the temporary files would have been written to the tmp
directory of the target sysroot (which we can easily clean up), but in
this tree, you can't necessarily run the scriptlets.

Fixes [YOCTO #12792]

Signed-off-by: Olof Johansson <olofjn@axis.com>
---
 ...installing-execute-package-scriptlets-wit.patch | 35 ++++++++++++++++++----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
index 2be3cb5af3c..4020a310926 100644
--- a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
+++ b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
@@ -1,4 +1,4 @@
-From a6f269f879221f2777169c5f7291322afe6b661b Mon Sep 17 00:00:00 2001
+From a89daa75ac970d8e247edc762d1181e9a5b0c5d0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 17 Jan 2017 14:07:17 +0200
 Subject: [PATCH] When cross-installing, execute package scriptlets without
@@ -7,17 +7,42 @@ Subject: [PATCH] When cross-installing, execute package scriptlets without
 This is triggered only when RPM_NO_CHROOT_FOR_SCRIPTS environment variable is defined.
 Otherwise they will trigger an explosion of failures, obviously.
 
+Amended 2018-07-03 by Olof Johansson <olofjn@axis.com>:
+
+  Remove leaking temporary scriptlet files
+
+  Since we tell dnf to run rpm with debug output, this will result in rpm not
+  cleaning up written temporary scriptlet files (same flag controls both
+  behaviors). This wouldn't have been a problem since we normally would use the
+  target sysroot also for temporary files, but we need to chroot out to be able
+  to actually run the rpm scriptlets (purpose of this patch), so the temporary
+  files are written to the host's /var/tmp/ directory, causing a gradual
+  resource leakage on the host system for every RPM based do_rootfs task
+  executed.
+
+  Signed-off-by: Olof Johansson <olofjn@axis.com>
+
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- lib/rpmscript.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
+ lib/rpmscript.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
 
 diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index 98d3f420d..b95b5d606 100644
+index cc98c4885..f8bd3df04 100644
 --- a/lib/rpmscript.c
 +++ b/lib/rpmscript.c
-@@ -467,7 +467,13 @@ rpmRC rpmScriptRun(rpmScript script, int arg1, int arg2, FD_t scriptFd,
+@@ -394,8 +394,7 @@ exit:
+ 	Fclose(out);	/* XXX dup'd STDOUT_FILENO */
+ 
+     if (fn) {
+-	if (!rpmIsDebug())
+-	    unlink(fn);
++	unlink(fn);
+ 	free(fn);
+     }
+     free(mline);
+@@ -428,7 +427,13 @@ rpmRC rpmScriptRun(rpmScript script, int arg1, int arg2, FD_t scriptFd,
  
      if (rc != RPMRC_FAIL) {
  	if (script_type & RPMSCRIPTLET_EXEC) {
-- 
2.11.0


