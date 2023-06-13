Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5E9C88CB6
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 09:52:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9441.1686649952881754316
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 02:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65AEA1FB;
	Tue, 13 Jun 2023 02:53:17 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8A763F71E;
	Tue, 13 Jun 2023 02:52:31 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/2] testimage: Set nostamp for do_write_image_test_data
Date: Tue, 13 Jun 2023 10:51:48 +0100
Message-Id: <20230613095148.1269420-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230613095148.1269420-1-peter.hoyes@arm.com>
References: <20230613095148.1269420-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 09:52:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182705

From: Peter Hoyes <Peter.Hoyes@arm.com>

The testdata.json file generated as part of the rootfs postprocess
commands contains almost all Bitbake variables and is used by OEQA test
cases to inspect the build environment. However it is not automatically
regenerated, complicating the process of developing OEQA test cases.

Set nostamp on the new do_write_image_test_data task so that it always
runs.

Add a demonstrative OE selftest.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 meta/classes-recipe/testimage.bbclass     |  1 +
 meta/lib/oeqa/selftest/cases/testimage.py | 26 +++++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/testimage.py

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
index b23340420f..67f7f3629e 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -118,6 +118,7 @@ python do_write_image_test_data() {
                 os.remove(testdata_link)
             os.symlink(os.path.basename(testdata_name), testdata_link)
 }
+do_write_image_test_data[nostamp] =3D "1"
 do_write_image_test_data[vardepsexclude] +=3D "TOPDIR"
 addtask write_image_test_data after do_rootfs before do_image_complete
=20
diff --git a/meta/lib/oeqa/selftest/cases/testimage.py b/meta/lib/oeqa/se=
lftest/cases/testimage.py
new file mode 100644
index 0000000000..3ba9184821
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/testimage.py
@@ -0,0 +1,26 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import json
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_vars
+
+class TestDataTests(OESelftestTestCase):
+    def test_regenerate(self):
+        """
+        Test that variables changes are reflected in testdata.json
+        """
+        test_image =3D "core-image-minimal"
+        self.write_config('IMAGE_CLASSES +=3D "testimage"\nTEST_VARIABLE=
 =3D "VALUE1"')
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


