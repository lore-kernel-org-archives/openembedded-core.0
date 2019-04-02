Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23AE87D14F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 18:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A4BE71857C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 20:38:13 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 5DXcaem-ZxAJ
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 20:38:12 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id A8D6E18580
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 20:38:12 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 914FE1A06D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 20:38:12 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8665F1A06B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 20:38:12 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 20:38:12 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 79011129
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 20:38:12 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x32IcCoa020164
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Apr 2019 20:38:12 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x32IcCGX020163
	for openembedded-core@lists.openembedded.org;
	Tue, 2 Apr 2019 20:38:12 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 20:38:10 +0200
Message-Id: <20190402183810.20118-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCHv2] base.bbclass, staging.bbclass: Move prepare_recipe_sysroot task dependency
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
X-List-Received-Date: Tue, 02 Apr 2019 18:38:13 -0000

Move prepare_recipe_sysroot's task dependency on populate_sysroot from
base.bbclass (where it was specified in the middle of do_configure's
definition) to staging.bbclass (where the rest of
do_prepare_recipe_sysroot is defined). This was a left-over from when
recipe specific sysroots were introduced in commit 809746f5 and the
task dependency on populate_sysroot was moved from do_configure to
do_prepare_recipe_sysroot.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Removed the Change-Id footer from the commit message.

 meta/classes/base.bbclass    | 1 -
 meta/classes/staging.bbclass | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 8ece51fe42..d0b82d747d 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -310,7 +310,6 @@ CLEANBROKEN = "0"
 
 addtask configure after do_patch
 do_configure[dirs] = "${B}"
-do_prepare_recipe_sysroot[deptask] = "do_populate_sysroot"
 base_do_configure() {
 	if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; then
 		if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" ]; then
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index c9bcd745fe..062b2817c8 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -577,6 +577,7 @@ python extend_recipe_sysroot() {
 }
 extend_recipe_sysroot[vardepsexclude] += "MACHINE_ARCH PACKAGE_EXTRA_ARCHS SDK_ARCH BUILD_ARCH SDK_OS BB_TASKDEPDATA"
 
+do_prepare_recipe_sysroot[deptask] = "do_populate_sysroot"
 python do_prepare_recipe_sysroot () {
     bb.build.exec_func("extend_recipe_sysroot", d)
 }
-- 
2.12.0


