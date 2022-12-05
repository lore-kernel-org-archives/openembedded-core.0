Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DE2C4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 21:39:17 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.29302.1670276354156286851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 13:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=VgylQ30g;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20221205213910b2553368e3851fcd5a-u5mpsj@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20221205213910b2553368e3851fcd5a
        for <openembedded-core@lists.openembedded.org>;
        Mon, 05 Dec 2022 22:39:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=VvUJJ2eTg0Q5Y2x+cdehct7ZyneOFgwYKZQmqCE84fw=;
 b=VgylQ30g+aytTunMynRrDK0m6QiPglp8VggDQ6iCn+WA0rMiYHAMcE4bbRJlaCA2vR/dX1
 ERXoLSIqFMqr6LuVRvKxL1NCAHtDWWRjN30tabwBmY7o+lkUTBEaWMcbFuUtr0QFa70FFBG/
 EPZ4CUaFXU4Uzh1DY2iQPyvo9Q+o4=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] oeqa/selftest/externalsrc: add test for srctree_hash_files
Date: Mon,  5 Dec 2022 22:38:15 +0100
Message-Id: <20221205213815.460409-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174304

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oeqa/selftest/cases/externalsrc.py | 44 +++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/externalsrc.py

diff --git a/meta/lib/oeqa/selftest/cases/externalsrc.py b/meta/lib/oeqa/selftest/cases/externalsrc.py
new file mode 100644
index 0000000000..1d800dc82c
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/externalsrc.py
@@ -0,0 +1,44 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+import shutil
+import tempfile
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import get_bb_var, runCmd
+
+class ExternalSrc(OESelftestTestCase):
+    # test that srctree_hash_files does not crash
+    # we should be actually checking do_compile[file-checksums] but oeqa currently does not support it
+    #     so we check only that a recipe with externalsrc can be parsed
+    def test_externalsrc_srctree_hash_files(self):
+        test_recipe = "git-submodule-test"
+        git_url = "git://git.yoctoproject.org/git-submodule-test"
+        externalsrc_dir = tempfile.TemporaryDirectory(prefix="externalsrc").name
+
+        self.write_config(
+            """
+INHERIT += "externalsrc"
+EXTERNALSRC:pn-%s = "%s"
+""" % (test_recipe, externalsrc_dir)
+        )
+
+        # test with git without submodules
+        runCmd('git clone %s %s' % (git_url, externalsrc_dir))
+        os.unlink(externalsrc_dir + "/.gitmodules")
+        open(".gitmodules", 'w').close()  # local file .gitmodules in cwd should not affect externalsrc parsing
+        self.assertEqual(get_bb_var("S", test_recipe), externalsrc_dir, msg = "S does not equal to EXTERNALSRC")
+        os.unlink(".gitmodules")
+
+        # test with git with submodules
+        runCmd('git checkout .gitmodules', cwd=externalsrc_dir)
+        runCmd('git submodule update --init --recursive', cwd=externalsrc_dir)
+        self.assertEqual(get_bb_var("S", test_recipe), externalsrc_dir, msg = "S does not equal to EXTERNALSRC")
+
+        # test without git
+        shutil.rmtree(os.path.join(externalsrc_dir, ".git"))
+        self.assertEqual(get_bb_var("S", test_recipe), externalsrc_dir, msg = "S does not equal to EXTERNALSRC")
-- 
2.30.2


