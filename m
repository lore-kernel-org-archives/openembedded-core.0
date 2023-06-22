Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8B2EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:34:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16460.1687451670324620884
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 09:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5A90C14;
	Thu, 22 Jun 2023 09:35:13 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14C8B3F663;
	Thu, 22 Jun 2023 09:34:28 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	richard.purdie@linuxfoundation.org,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH v2] rootfs-postcommands: Set vardeps for write_image_test_data
Date: Thu, 22 Jun 2023 17:34:13 +0100
Message-Id: <20230622163413.839916-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 16:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183269

From: Peter Hoyes <Peter.Hoyes@arm.com>

The testdata.json file generated as part of the rootfs postprocess
commands currently contains almost all Bitbake variables and is used by
OEQA test cases to inspect the build environment. However only a small
number of variables are actually used and the testdata.json is not
automatically updated when the variables are updated.

Introduce the TESTIMAGE_EXPORT_VARS variable to explicitly define the
variables to be collected for testdata.json and populate with all
variables used by runtime tests in OE-core. Use this variable to set the
vardeps of write_image_test_data.

Modify export2json to take an explicit list of keys to export, instead
of exporting everything in the datastore.

Add a demonstrative OE selftest to rootfspostcommandstests.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 .../rootfs-postcommands.bbclass               | 28 ++++++++++++++++++-
 meta/lib/oe/data.py                           | 19 ++-----------
 .../selftest/cases/rootfspostcommandstests.py | 19 +++++++++++++
 3 files changed, 48 insertions(+), 18 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/class=
es-recipe/rootfs-postcommands.bbclass
index 652601b95f..cb5b0727b8 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -453,6 +453,30 @@ rootfs_sysroot_relativelinks () {
 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
 }
=20
+TESTIMAGE_EXPORT_VARS ?=3D "\
+    ARCH \
+    DEPLOY_DIR \
+    DEPLOY_DIR_DEB \
+    DISTRO_FEATURES \
+    DL_DIR \
+    IMAGE \
+    IMAGE_FEATURES \
+    libdir \
+    MACHINE \
+    MULTILIB_VARIANTS \
+    PACKAGE_FEED_GPG_NAME \
+    PTEST_EXPECT_FAILURE \
+    QEMU_USE_KVM \
+    SDK_DEPLOY \
+    SDKPATH \
+    T \
+    TEST_LOG_DIR \
+    TOOLCHAINEXT_OUTPUTNAME \
+    TUNE_PKGARCH \
+    VIRTUAL-RUNTIME_init_manager \
+    WORKDIR \
+"
+
 # Generated test data json file
 python write_image_test_data() {
     from oe.data import export2json
@@ -462,7 +486,8 @@ python write_image_test_data() {
     testdata_name =3D os.path.join(deploy_dir, "%s.testdata.json" % d.ge=
tVar('IMAGE_NAME'))
=20
     searchString =3D "%s/"%(d.getVar("TOPDIR")).replace("//","/")
-    export2json(d, testdata_name, searchString=3DsearchString, replaceSt=
ring=3D"")
+    exportkeys =3D d.getVar('TESTIMAGE_EXPORT_VARS').split()
+    export2json(d, exportkeys, testdata_name, searchString=3DsearchStrin=
g, replaceString=3D"")
=20
     if os.path.exists(testdata_name) and link_name:
         testdata_link =3D os.path.join(deploy_dir, "%s.testdata.json" % =
link_name)
@@ -471,6 +496,7 @@ python write_image_test_data() {
                 os.remove(testdata_link)
             os.symlink(os.path.basename(testdata_name), testdata_link)
 }
+write_image_test_data[vardeps] +=3D "${TESTIMAGE_EXPORT_VARS}"
 write_image_test_data[vardepsexclude] +=3D "TOPDIR"
=20
 # Check for unsatisfied recommendations (RRECOMMENDS)
diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index 37121cfad2..101a52e5e0 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -23,25 +23,10 @@ def typed_value(key, d):
     except (TypeError, ValueError) as exc:
         bb.msg.fatal("Data", "%s: %s" % (key, str(exc)))
=20
-def export2json(d, json_file, expand=3DTrue, searchString=3D"",replaceSt=
ring=3D""):
+def export2json(d, keys, json_file, expand=3DTrue, searchString=3D"",rep=
laceString=3D""):
     data2export =3D {}
-    keys2export =3D []
=20
-    for key in d.keys():
-        if key.startswith("_"):
-            continue
-        elif key.startswith("BB"):
-            continue
-        elif key.startswith("B_pn"):
-            continue
-        elif key.startswith("do_"):
-            continue
-        elif d.getVarFlag(key, "func"):
-            continue
-
-        keys2export.append(key)
-
-    for key in keys2export:
+    for key in keys:
         try:
             data2export[key] =3D d.getVar(key, expand).replace(searchStr=
ing,replaceString)
         except bb.data_smart.ExpansionError:
diff --git a/meta/lib/oeqa/selftest/cases/rootfspostcommandstests.py b/me=
ta/lib/oeqa/selftest/cases/rootfspostcommandstests.py
index 44e2c09a6f..d15e766f49 100644
--- a/meta/lib/oeqa/selftest/cases/rootfspostcommandstests.py
+++ b/meta/lib/oeqa/selftest/cases/rootfspostcommandstests.py
@@ -2,6 +2,7 @@
 #
 # SPDX-License-Identifier: MIT
=20
+import json
 import os
 import oe
 import unittest
@@ -95,3 +96,21 @@ class ShadowUtilsTidyFiles(OESelftestTestCase):
                 unsorted.append(file)
         if (unsorted):
             raise Exception("The following files were not sorted by ID a=
s expected: %s" % unsorted)
+
+
+class TestDataTests(OESelftestTestCase):
+    def test_vardeps(self):
+        """
+        Test that variables changes are reflected in testdata.json
+        """
+        test_image =3D "core-image-minimal"
+        self.write_config('TESTIMAGE_EXPORT_VARS:append =3D " TEST_VARIA=
BLE"\nTEST_VARIABLE =3D "VALUE1"')
+        bitbake(test_image)
+        self.append_config('TEST_VARIABLE =3D "VALUE2"')
+        bitbake(test_image)
+
+        vars =3D get_bb_vars(('DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'), te=
st_image)
+        testdata_json =3D "%s/%s.testdata.json" % (vars['DEPLOY_DIR_IMAG=
E'], vars['IMAGE_LINK_NAME'])
+        with open(testdata_json, 'r') as tf:
+            testdata_vars =3D json.load(tf)
+        self.assertEqual(testdata_vars['TEST_VARIABLE'], 'VALUE2')
--=20
2.34.1


