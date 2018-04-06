Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 050E074B9C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 18:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 71FA51852D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id eqSalMgu0c0u
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9292E18512
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80C511A05F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 760A01A05E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 686DE2926
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w36IR3bp017619
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Apr 2018 20:27:03 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w36IR3B3017618
	for openembedded-core@lists.openembedded.org;
	Fri, 6 Apr 2018 20:27:03 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2018 20:26:55 +0200
Message-Id: <93f8858d76e5605efb7429769157fe59c7a4720a.1523039141.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1523039141.git.pkj@axis.com>
References: <cover.1523039141.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 1/3] Use ${MACHINE_ARCH} instead of ${MACHINE} for stamp-extra-info task flag
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
X-List-Received-Date: Fri, 06 Apr 2018 18:27:11 -0000

Without this change, there will be two sstate index files in
tmp/sstate-control for any machine that contains a dash in the
name.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/deploy.bbclass            | 2 +-
 meta/classes/image.bbclass             | 2 +-
 meta/classes/package.bbclass           | 2 +-
 meta/classes/populate_sdk_base.bbclass | 2 +-
 meta/classes/populate_sdk_ext.bbclass  | 2 +-
 meta/recipes-core/meta/signing-keys.bb | 3 ++-
 6 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/deploy.bbclass b/meta/classes/deploy.bbclass
index 8ad07da015..6d52908783 100644
--- a/meta/classes/deploy.bbclass
+++ b/meta/classes/deploy.bbclass
@@ -8,4 +8,4 @@ python do_deploy_setscene () {
 }
 addtask do_deploy_setscene
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
-do_deploy[stamp-extra-info] = "${MACHINE}"
+do_deploy[stamp-extra-info] = "${MACHINE_ARCH}"
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 1636eed6b0..2247b305da 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -289,7 +289,7 @@ SSTATETASKS += "do_image_complete"
 SSTATE_SKIP_CREATION_task-image-complete = '1'
 do_image_complete[sstate-inputdirs] = "${IMGDEPLOYDIR}"
 do_image_complete[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
-do_image_complete[stamp-extra-info] = "${MACHINE}"
+do_image_complete[stamp-extra-info] = "${MACHINE_ARCH}"
 addtask do_image_complete after do_image before do_build
 python do_image_complete_setscene () {
     sstate_setscene(d)
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 504c0232ef..9bba021efb 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2234,7 +2234,7 @@ SSTATETASKS += "do_packagedata"
 do_packagedata[sstate-inputdirs] = "${PKGDESTWORK}"
 do_packagedata[sstate-outputdirs] = "${PKGDATA_DIR}"
 do_packagedata[sstate-lockfile-shared] = "${PACKAGELOCK}"
-do_packagedata[stamp-extra-info] = "${MACHINE}"
+do_packagedata[stamp-extra-info] = "${MACHINE_ARCH}"
 
 python do_packagedata_setscene () {
     sstate_setscene(d)
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 77ec8aaec2..3560ef143c 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -156,7 +156,7 @@ SSTATE_SKIP_CREATION_task-populate-sdk = '1'
 do_populate_sdk[cleandirs] = "${SDKDEPLOYDIR}"
 do_populate_sdk[sstate-inputdirs] = "${SDKDEPLOYDIR}"
 do_populate_sdk[sstate-outputdirs] = "${SDK_DEPLOY}"
-do_populate_sdk[stamp-extra-info] = "${MACHINE}${SDKMACHINE}"
+do_populate_sdk[stamp-extra-info] = "${MACHINE_ARCH}${SDKMACHINE}"
 
 fakeroot create_sdk_files() {
 	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 655375416b..e1bba49eaf 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -722,6 +722,6 @@ SSTATE_SKIP_CREATION_task-populate-sdk-ext = '1'
 do_populate_sdk_ext[cleandirs] = "${SDKEXTDEPLOYDIR}"
 do_populate_sdk_ext[sstate-inputdirs] = "${SDKEXTDEPLOYDIR}"
 do_populate_sdk_ext[sstate-outputdirs] = "${SDK_DEPLOY}"
-do_populate_sdk_ext[stamp-extra-info] = "${MACHINE}"
+do_populate_sdk_ext[stamp-extra-info] = "${MACHINE_ARCH}"
 
 addtask populate_sdk_ext after do_sdk_depends
diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index 6387d90d47..1e1c7e3459 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -69,7 +69,8 @@ do_deploy () {
 do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_RPM}"
 # cleandirs should possibly be in deploy.bbclass but we need it
 do_deploy[cleandirs] = "${DEPLOYDIR}"
-# clear stamp-extra-info since MACHINE is normally put there by deploy.bbclass
+# clear stamp-extra-info since MACHINE_ARCH is normally put there by
+# deploy.bbclass
 do_deploy[stamp-extra-info] = ""
 addtask deploy after do_get_public_keys
 
-- 
2.12.0


