Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EB6C32793
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 23:56:58 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web08.5298.1661299009304304704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 16:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=N0r2OFuO;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25,
 mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 8DE5A3200124;
	Tue, 23 Aug 2022 19:56:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 23 Aug 2022 19:56:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1661299008; x=1661385408; bh=Hr
	J+swoc1aCwlxq8XZ1IZ6Ken2TwHcGSRK5CKatH6NA=; b=N0r2OFuOiHGU0FzUvI
	/zPZ37JCgKYqs/h6ASBn2r9TPIWx9ycHaL8Ux7MEaz6bCCeGeBglFPainG2Y+Fg1
	L/87eoJ5svj4qPRPCk4V9u2B/726tz8E0xGF2rKzz/E4ENNFBc59EYZS8gRI+7Nj
	47zGUXhcle0SgoMgj7JsW6yQpUNhazNJ1kURDcJJIErATl7dtoQrHkkkVhp1VQFE
	CXDIHYZrcKehEAv34uXWpDv+kwge9wgfvqrRRLgOifvCye9BCv9n37Mo1pmsdHih
	n0o6gcrwgNm1DPodtjbOmNsU7zN/TU4nHX5s5a9JJOEpLayKCifR7I2x4eWHhEZI
	QlMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1661299008; x=1661385408; bh=HrJ+swoc1aCwl
	xq8XZ1IZ6Ken2TwHcGSRK5CKatH6NA=; b=XuXMjaqgUcVIE1X/QAExjTFFEiL5S
	wS9QNBp4EPlWwsx+6l1jvl96OqK3q3/6a/m0YU6pK3yJJN8t57japolmwUQMLiL+
	a+lzAfmdvgrubCEfc1LYzDi0VTQICNzIATb+op3NNq84TyMPJwPlKzNX4jlBDHW3
	ycgNAeLpvBV+Pb3RNZQlHrE8hoqbWvfPT+f8qVLK34Hpqvp4twvex+SS7x+AGdfe
	YnAYIgWS//R5v1z+EoYEFilfUsaDDsEoKBuo8QneegoYcNKVyemWw9MJyj8g+14s
	gn1j+T7I1N8UuCRGypJAfCB2jiLqssOWzSRFHq33zJ3Je/mK0dvw55KdA==
X-ME-Sender: <xms:P2kFY6ntAtCc8d2mSwjmukFtkw1sh7fg7kyG18lLLLYWjghCkCvUJA>
    <xme:P2kFYx0jhyDSFxYpuu7q2lbmABCTM9q4FtlvSJCbs7w2qLB2U3oDfiO7MLFc31WTV
    bIcxaT0RQtXVZHJPBY>
X-ME-Received: 
 <xmr:P2kFY4pZMr883jOlZRjoDJUt-0NZqoM7tTOxTdiRMkmcj_jBjhZJ-eU5KdgH8pSZvqnDfLAsdgypiilRi2cfpViC2CPhg_lPNMi9-2e8t04G9sRm8QmbCFNB>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejtddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepieevlefhieefffffgeetud
    euudffueelveeggfdvtdfhvdethfeuheehhfduffdvnecuffhomhgrihhnpehsvghlfhht
    vghsthdrtggrshgvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:P2kFY-mH_SCNa4jrOmKqRNX_9hFobUDXm027TmDs9A0TZEmZW2Z6Bw>
    <xmx:P2kFY434HWltGQH1eF1noFlG9hUuI6gru9qFVUeBDpv3jQYtfrS4Ug>
    <xmx:P2kFY1se9Je7-P8TBE6YvnP7NpEaMlSFdHB5u84FpODygv9bqH3RGQ>
    <xmx:QGkFY19HHC8awPFduxWHW1Ev8L997TO9PasvK0ZVEqhDmuZ6wk1ubQ>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Aug 2022 19:56:47 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH 4/6] selftest: Add module for testing rootfs postcommands
Date: Wed, 24 Aug 2022 01:56:22 +0200
Message-Id: <20220823235624.2488133-4-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220823235624.2488133-3-andrei@gherzan.com>
References: <20220823235624.2488133-3-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 23:56:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169765

From: Andrei Gherzan <andrei.gherzan@huawei.com>

The initial implementation adds tests for 'tidy_shadowutils_files'.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../selftest/cases/rootfspostcommandstests.py | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/rootfspostcommandstests.py

diff --git a/meta/lib/oeqa/selftest/cases/rootfspostcommandstests.py b/meta/lib/oeqa/selftest/cases/rootfspostcommandstests.py
new file mode 100644
index 0000000000..44e2c09a6f
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/rootfspostcommandstests.py
@@ -0,0 +1,97 @@
+# SPDX-FileCopyrightText: Huawei Inc.
+#
+# SPDX-License-Identifier: MIT
+
+import os
+import oe
+import unittest
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_vars
+
+class ShadowUtilsTidyFiles(OESelftestTestCase):
+    """
+    Check if shadow image rootfs files are tidy.
+
+    The tests are focused on testing the functionality provided by the
+    'tidy_shadowutils_files' rootfs postprocess command (via
+    SORT_PASSWD_POSTPROCESS_COMMAND).
+    """
+
+    def sysconf_build(self):
+        """
+        Verify if shadow tidy files tests are to be run and if yes, build a
+        test image and return its sysconf rootfs path.
+        """
+
+        test_image = "core-image-minimal"
+
+        config = 'IMAGE_CLASSES += "extrausers"\n'
+        config += 'EXTRA_USERS_PARAMS = "groupadd -g 1000 oeqatester; "\n'
+        config += 'EXTRA_USERS_PARAMS += "useradd -p \'\' -u 1000 -N -g 1000 oeqatester; "\n'
+        self.write_config(config)
+
+        vars = get_bb_vars(("IMAGE_ROOTFS", "SORT_PASSWD_POSTPROCESS_COMMAND", "sysconfdir"),
+            test_image)
+        passwd_postprocess_cmd = vars["SORT_PASSWD_POSTPROCESS_COMMAND"]
+        self.assertIsNotNone(passwd_postprocess_cmd)
+        if (passwd_postprocess_cmd.strip() != 'tidy_shadowutils_files;'):
+            raise unittest.SkipTest("Testcase skipped as 'tidy_shadowutils_files' "
+                "rootfs post process command is not the set SORT_PASSWD_POSTPROCESS_COMMAND.")
+
+        rootfs = vars["IMAGE_ROOTFS"]
+        self.assertIsNotNone(rootfs)
+        sysconfdir = vars["sysconfdir"]
+        bitbake(test_image)
+        self.assertIsNotNone(sysconfdir)
+
+        return oe.path.join(rootfs, sysconfdir)
+
+    def test_shadowutils_backup_files(self):
+        """
+        Test that the rootfs doesn't include any known shadow backup files.
+        """
+
+        backup_files = (
+            'group-',
+            'gshadow-',
+            'passwd-',
+            'shadow-',
+            'subgid-',
+            'subuid-',
+        )
+
+        rootfs_sysconfdir = self.sysconf_build()
+        found = []
+        for backup_file in backup_files:
+            backup_filepath = oe.path.join(rootfs_sysconfdir, backup_file)
+            if os.path.exists(backup_filepath):
+                found.append(backup_file)
+        if (found):
+            raise Exception('The following shadow backup files were found in '
+                'the rootfs: %s' % found)
+
+    def test_shadowutils_sorted_files(self):
+        """
+        Test that the 'passwd' and the 'group' shadow utils files are ordered
+        by ID.
+        """
+
+        files = (
+            'passwd',
+            'group',
+        )
+
+        rootfs_sysconfdir = self.sysconf_build()
+        unsorted = []
+        for file in files:
+            filepath = oe.path.join(rootfs_sysconfdir, file)
+            with open(filepath, 'rb') as f:
+                ids = []
+                lines = f.readlines()
+                for line in lines:
+                    entries = line.split(b':')
+                    ids.append(int(entries[2]))
+            if (ids != sorted(ids)):
+                unsorted.append(file)
+        if (unsorted):
+            raise Exception("The following files were not sorted by ID as expected: %s" % unsorted)
-- 
2.25.1


