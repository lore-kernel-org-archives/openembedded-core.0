Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FEE47D245
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 12:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B9775185BD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 14:26:29 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 2nZ36V8mJBcC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 14:26:28 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id DAF7A18325
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 14:26:28 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C39BC1E08B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 14:26:28 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B872A1E089
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 14:26:28 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 14:26:28 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id ACB8F285A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 14:26:28 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x33CQSff018499
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Apr 2019 14:26:28 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x33CQSWx018498
	for openembedded-core@lists.openembedded.org;
	Wed, 3 Apr 2019 14:26:28 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2019 14:26:26 +0200
Message-Id: <20190403122626.18451-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] useradd.bbclass: Make sure users/groups exist for package_write_* tasks
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
X-List-Received-Date: Wed, 03 Apr 2019 12:26:30 -0000

If the populate_lic task and any of the package_write_* tasks need to
run, but the package task can be restored from the sstate cache, then
the fetch task, which is a dependency of populate_lic, will wipe out
the RSS including any users/groups that have been created. This
results in that the package_write_* tasks are run without any
user/group information, which causes them to fallback to either use
the root user for any unknown users/groups (rpm) or to use the numeric
UIDs/GIDs (deb/ipk). Neither solution will yield correct packages.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd.bbclass | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 124becd082..e32315a1af 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -4,7 +4,7 @@ inherit useradd_base
 # target sysroot, and shadow -native and -sysroot provide the utilities
 # and support files needed to add and modify user and group accounts
 DEPENDS_append_class-target = " base-files shadow-native shadow-sysroot shadow base-passwd"
-PACKAGE_WRITE_DEPS += "shadow-native"
+PACKAGE_WRITE_DEPS += "shadow-native shadow-sysroot base-passwd"
 
 # This preinstall function can be run in four different contexts:
 #
@@ -144,7 +144,10 @@ python useradd_sysroot_sstate () {
     task = d.getVar("BB_CURRENTTASK")
     if task == "package_setscene":
         bb.build.exec_func("useradd_sysroot", d)
-    elif task == "prepare_recipe_sysroot":
+    elif (task == "prepare_recipe_sysroot" or
+          task == "package_write_deb" or
+          task == "package_write_ipk" or
+          task == "package_write_rpm"):
         # Used to update this recipe's own sysroot so the user/groups are available to do_install
         scriptfile = d.expand("${RECIPE_SYSROOT}${bindir}/postinst-useradd-${PN}")
         bb.build.exec_func("useradd_sysroot", d)
@@ -161,13 +164,16 @@ python useradd_sysroot_sstate () {
         os.chmod(scriptfile, 0o755)
 }
 
-do_prepare_recipe_sysroot[postfuncs] += "${SYSROOTFUNC}"
-SYSROOTFUNC_class-target = "useradd_sysroot_sstate"
 SYSROOTFUNC = ""
+SYSROOTFUNC_class-target = "useradd_sysroot_sstate"
 
-SYSROOT_PREPROCESS_FUNCS += "${SYSROOTFUNC}"
+do_prepare_recipe_sysroot[postfuncs] += "${SYSROOTFUNC}"
+do_package_write_deb[prefuncs] += "${SYSROOTFUNC}"
+do_package_write_ipk[prefuncs] += "${SYSROOTFUNC}"
+do_package_write_rpm[prefuncs] += "${SYSROOTFUNC}"
 
-SSTATEPREINSTFUNCS_append_class-target = " useradd_sysroot_sstate"
+SYSROOT_PREPROCESS_FUNCS += "${SYSROOTFUNC}"
+SSTATEPREINSTFUNCS += "${SYSROOTFUNC}"
 
 do_package_setscene[depends] += "${USERADDSETSCENEDEPS}"
 do_populate_sysroot_setscene[depends] += "${USERADDSETSCENEDEPS}"
-- 
2.12.0


