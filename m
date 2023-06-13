Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB85AC7EE2E
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 09:52:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9326.1686649941934246890
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 02:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E2721FB;
	Tue, 13 Jun 2023 02:53:06 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C38B43F71E;
	Tue, 13 Jun 2023 02:52:20 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/2] rootfs-postcommands,testimage: Move testdata generation to own task
Date: Tue, 13 Jun 2023 10:51:47 +0100
Message-Id: <20230613095148.1269420-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 09:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182704

From: Peter Hoyes <Peter.Hoyes@arm.com>

write_image_test_data is currently a ROOTFS_POSTPROCESS_COMMAND, even
though it does not act on the rootfs. Additionally it is only required
when running testimage.

Promote it to its own task, to decouple it from rootfs generation, and
move it to testimage.bbclass

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 .../rootfs-postcommands.bbclass               | 23 -------------------
 meta/classes-recipe/testimage.bbclass         | 21 +++++++++++++++++
 2 files changed, 21 insertions(+), 23 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/class=
es-recipe/rootfs-postcommands.bbclass
index 690fa976aa..ad7e7ccd8b 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -33,9 +33,6 @@ ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("=
IMAGE_FEATURES", "read-only
 # and we don't want to disable such a default that by setting a value he=
re.
 APPEND:append =3D '${@bb.utils.contains("IMAGE_FEATURES", "read-only-roo=
tfs", " ro", "", d)}'
=20
-# Generates test data file with data store variables expanded in json fo=
rmat
-ROOTFS_POSTPROCESS_COMMAND +=3D "write_image_test_data; "
-
 # Write manifest
 IMAGE_MANIFEST =3D "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ma=
nifest"
 ROOTFS_POSTUNINSTALL_COMMAND =3D+ "write_image_manifest ; "
@@ -368,26 +365,6 @@ rootfs_sysroot_relativelinks () {
 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
 }
=20
-# Generated test data json file
-python write_image_test_data() {
-    from oe.data import export2json
-
-    deploy_dir =3D d.getVar('IMGDEPLOYDIR')
-    link_name =3D d.getVar('IMAGE_LINK_NAME')
-    testdata_name =3D os.path.join(deploy_dir, "%s.testdata.json" % d.ge=
tVar('IMAGE_NAME'))
-
-    searchString =3D "%s/"%(d.getVar("TOPDIR")).replace("//","/")
-    export2json(d, testdata_name, searchString=3DsearchString, replaceSt=
ring=3D"")
-
-    if os.path.exists(testdata_name) and link_name:
-        testdata_link =3D os.path.join(deploy_dir, "%s.testdata.json" % =
link_name)
-        if testdata_link !=3D testdata_name:
-            if os.path.lexists(testdata_link):
-                os.remove(testdata_link)
-            os.symlink(os.path.basename(testdata_name), testdata_link)
-}
-write_image_test_data[vardepsexclude] +=3D "TOPDIR"
-
 # Check for unsatisfied recommendations (RRECOMMENDS)
 python rootfs_log_check_recommends() {
     log_path =3D d.expand("${T}/log.do_rootfs")
diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
index b48cd96575..b23340420f 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -100,6 +100,27 @@ TESTIMAGE_DUMP_DIR ?=3D "${LOG_DIR}/runtime-hostdump=
/"
=20
 TESTIMAGE_UPDATE_VARS ?=3D "DL_DIR WORKDIR DEPLOY_DIR_IMAGE IMAGE_LINK_N=
AME"
=20
+# Generated test data json file
+python do_write_image_test_data() {
+    from oe.data import export2json
+
+    deploy_dir =3D d.getVar('IMGDEPLOYDIR')
+    link_name =3D d.getVar('IMAGE_LINK_NAME')
+    testdata_name =3D os.path.join(deploy_dir, "%s.testdata.json" % d.ge=
tVar('IMAGE_NAME'))
+
+    searchString =3D "%s/"%(d.getVar("TOPDIR")).replace("//","/")
+    export2json(d, testdata_name, searchString=3DsearchString, replaceSt=
ring=3D"")
+
+    if os.path.exists(testdata_name) and link_name:
+        testdata_link =3D os.path.join(deploy_dir, "%s.testdata.json" % =
link_name)
+        if testdata_link !=3D testdata_name:
+            if os.path.lexists(testdata_link):
+                os.remove(testdata_link)
+            os.symlink(os.path.basename(testdata_name), testdata_link)
+}
+do_write_image_test_data[vardepsexclude] +=3D "TOPDIR"
+addtask write_image_test_data after do_rootfs before do_image_complete
+
 testimage_dump_target () {
     top -bn1
     ps
--=20
2.34.1


