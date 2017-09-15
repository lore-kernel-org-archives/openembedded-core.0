Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3AFE978667
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 14:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8DFC4184EE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 16:49:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id JX0ve48LMWxO
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 16:49:12 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 8FAB1184E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 16:49:12 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EE141A08D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 16:49:12 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73EAB1A07B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 16:49:12 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 16:49:12 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 686D3243
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 16:49:12 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v8FEnBwa024766
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 16:49:11 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v8FEnBIn024765
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Sep 2017 16:49:11 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 16:48:59 +0200
Message-Id: <20170915144859.22347-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] useradd.bbclass: Unify writing of script file in useradd_sysroot_sstate()
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
X-List-Received-Date: Fri, 15 Sep 2017 14:49:13 -0000

There were two identical code blocks for writing the
postinst-useradd-${PN} scripts. This combines them into one.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd.bbclass | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 6017ded860..a40e3fecd4 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -138,22 +138,19 @@ useradd_sysroot () {
 EXTRA_STAGING_FIXMES += "COMPONENTS_DIR"
 
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
-- 
2.12.0


