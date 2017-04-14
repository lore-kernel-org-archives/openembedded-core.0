Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 382C777E89
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 02:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 26C892E64C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id YdOWfaEtB75u
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:21 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 1294B2E651
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:21 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 012E21E080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:21 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8DF71E07E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:20 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:20 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id DAB9D335A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:20 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v3E2eK9B013789
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:20 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v3E2eKfq013788
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Apr 2017 04:40:20 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Apr 2017 04:39:53 +0200
Message-Id: <1c07779a90e5b5855c85a16644759929335b985a.1492135840.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1492135840.git.pkj@axis.com>
References: <cover.1492135840.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 1/2] useradd.bbclass: Make postinst functions verbose if BB_VERBOSE_LOGS is set
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
X-List-Received-Date: Fri, 14 Apr 2017 02:40:22 -0000

If BB_VERBOSE_LOGS is enabled, then make the postinst functions use
set -x so that their execution is traced. This greatly simplifies
debugging, especially in case of failures as nothing is recorded in
the logs otherwise to indicate what caused the failure.

Also reduce code duplication in useradd_sysroot_sstate() by only
having one copy of the code to create the postinst files.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd.bbclass | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 4373677bd6..d9b5373d96 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -133,26 +133,25 @@ useradd_sysroot () {
 }
 
 python useradd_sysroot_sstate () {
+    scriptfile = None
     task = d.getVar("BB_CURRENTTASK")
     if task == "package_setscene":
         bb.build.exec_func("useradd_sysroot", d)
     elif task == "prepare_recipe_sysroot":
         # Used to update this recipe's own sysroot so the user/groups are available to do_install
         scriptfile = d.expand("${RECIPE_SYSROOT}${bindir}/postinst-useradd-${PN}")
-        bb.utils.mkdirhier(os.path.dirname(scriptfile))
-        with open(scriptfile, 'w') as script:
-            script.write("#!/bin/sh\n")
-            bb.data.emit_func("useradd_sysroot", script, d)
-            script.write("useradd_sysroot\n")
-        os.chmod(scriptfile, 0o755)
         bb.build.exec_func("useradd_sysroot", d)
     elif task == "populate_sysroot":
         # Used when installed in dependent task sysroots
         scriptfile = d.expand("${SYSROOT_DESTDIR}${bindir}/postinst-useradd-${PN}")
+
+    if scriptfile:
         bb.utils.mkdirhier(os.path.dirname(scriptfile))
         with open(scriptfile, 'w') as script:
             script.write("#!/bin/sh\n")
             bb.data.emit_func("useradd_sysroot", script, d)
+            if bb.msg.loggerVerboseLogs:
+                script.write("set -x\n")
             script.write("useradd_sysroot\n")
         os.chmod(scriptfile, 0o755)
 }
-- 
2.12.0


