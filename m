Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE99BC77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 16:29:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.55142.1684340971446314908
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 09:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B69011FB;
	Wed, 17 May 2023 09:30:15 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EBF43F73F;
	Wed, 17 May 2023 09:29:30 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] rootfs-postcommands: Set vardeps for write_image_test_data
Date: Wed, 17 May 2023 17:29:06 +0100
Message-Id: <20230517162906.2395999-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 16:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181496

From: Peter Hoyes <Peter.Hoyes@arm.com>

The testdata.json file generated as part of the rootfs postprocess
commands contains almost all Bitbake variables and is used by OEQA test
cases to inspect the build environment. However it is only regenerated
when the rootfs task is otherwise retriggered, complicating the process
of developing OEQA test cases.

Use the vardeps mechanism to add a dependency on all the generated
datastore keys. Split out exportkeys from export2json to support this.

Add a demonstrative OE selftest to rootfspostcommandstests.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 .../rootfs-postcommands.bbclass               |  3 ++-
 meta/lib/oe/data.py                           |  9 +++++++--
 .../selftest/cases/rootfspostcommandstests.py | 19 +++++++++++++++++++
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/class=
es-recipe/rootfs-postcommands.bbclass
index 690fa976aa..b91498c32e 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -386,7 +386,8 @@ python write_image_test_data() {
                 os.remove(testdata_link)
             os.symlink(os.path.basename(testdata_name), testdata_link)
 }
-write_image_test_data[vardepsexclude] +=3D "TOPDIR"
+write_image_test_data[vardeps] +=3D "${@' '.join(oe.data.exportkeys(d))}=
"
+write_image_test_data[vardepsexclude] +=3D "TOPDIR DATETIME BUILDNAME ${=
BB_HASHCONFIG_IGNORE_VARS}"
=20
 # Check for unsatisfied recommendations (RRECOMMENDS)
 python rootfs_log_check_recommends() {
diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index 37121cfad2..9989230638 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -23,8 +23,7 @@ def typed_value(key, d):
     except (TypeError, ValueError) as exc:
         bb.msg.fatal("Data", "%s: %s" % (key, str(exc)))
=20
-def export2json(d, json_file, expand=3DTrue, searchString=3D"",replaceSt=
ring=3D""):
-    data2export =3D {}
+def exportkeys(d):
     keys2export =3D []
=20
     for key in d.keys():
@@ -41,6 +40,12 @@ def export2json(d, json_file, expand=3DTrue, searchStr=
ing=3D"",replaceString=3D""):
=20
         keys2export.append(key)
=20
+    return keys2export
+
+def export2json(d, json_file, expand=3DTrue, searchString=3D"",replaceSt=
ring=3D""):
+    data2export =3D {}
+    keys2export =3D exportkeys(d)
+
     for key in keys2export:
         try:
             data2export[key] =3D d.getVar(key, expand).replace(searchStr=
ing,replaceString)
diff --git a/meta/lib/oeqa/selftest/cases/rootfspostcommandstests.py b/me=
ta/lib/oeqa/selftest/cases/rootfspostcommandstests.py
index 44e2c09a6f..5de4ea378a 100644
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
+        self.write_config('TEST_VARIABLE =3D "VALUE1"')
+        bitbake(test_image)
+        self.write_config('TEST_VARIABLE =3D "VALUE2"')
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


