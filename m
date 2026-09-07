Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3061C79FAE
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 06:37:39 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28580.1788763051699160064
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 23:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=HVWdLYzl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20260907063728a77935ffbf00020714-2jnn53@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260907063728a77935ffbf00020714
        for <openembedded-core@lists.openembedded.org>;
        Mon, 07 Sep 2026 08:37:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=pS11joJ71i5fICEMrki89ZNucs3an6B+OJrT7MzQYDM=;
 b=HVWdLYzlpbz/1Y4IpMTSm5RUUY/c15DQcymOlZiYnLUiAOpL0btp75dL5RHb0gsk/DFPg4
 I6XHCScAG766+QqsAURyHs3YSRAd6iWPG55KmEuWC+jvQK8BzJ1hYF4DpBHpZqUZ8KIS2Rkq
 zPdaKvnsRn1Wjww4956fvSIuMX2PShk6eTfct1Y+8p5MGvDwXrd/9lqEr9MaMv2jNvyBRofm
 EaUuX5j5YQnFVcbxJqpRREf6Or+jdpb5yRvbiRoI0NFCCdP6gqOksWlceUfZ6W1gkr//MyD4
 9bzwPV2F2Lt73lv6pGbJurF0LahafRixzeosrh1K7X21tVbt1l74oCxw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 4/9] oe-selftest: tinfoil: test prepared task runner
Date: Mon,  7 Sep 2026 08:36:10 +0200
Message-ID: <20260907063720.56742-5-adrian.freihofer@siemens.com>
In-Reply-To: <20260907063720.56742-1-adrian.freihofer@siemens.com>
References: <20260907063720.56742-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245228

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add shell and Python marker tasks to pseudo-pyc-test, with and without
fakeroot. Build the tasks normally to prepare their dependencies, remove
their markers, then rerun them through Tinfoil's run_prepared_task() API.

This verifies that a prepared task can be rerun through BitBake's worker
path without resolving its dependencies, including shell and Python task
execution within and outside a pseudo session as needed by devtool ide-sdk.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../pseudo-pyc-test/pseudo-pyc-test.bb        | 45 ++++++++++++++
 meta/lib/oeqa/selftest/cases/tinfoil.py       | 60 +++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-test.bb b/meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-test.bb
index 12dc91a8f3..f6b31b63cd 100644
--- a/meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-test.bb
+++ b/meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-test.bb
@@ -13,3 +13,48 @@ python do_install() {
     import pseudo_pyc_test2
     print(pseudo_pyc_test2.STRING)
 }
+
+TINFOIL_TEST_MARKER_DIR = "${TMPDIR}/tinfoil-prepared-task"
+TINFOIL_TEST_MARKER_VALUE ?= ""
+
+write_tinfoil_shell_marker() {
+    mkdir -p ${TINFOIL_TEST_MARKER_DIR}
+    printf '%s%s' "$1" "${TINFOIL_TEST_MARKER_VALUE}" > ${TINFOIL_TEST_MARKER_DIR}/"$1"
+}
+
+do_tinfoil_dep() {
+    write_tinfoil_shell_marker dep
+}
+addtask tinfoil_dep
+
+do_tinfoil_shell() {
+    write_tinfoil_shell_marker shell
+}
+addtask tinfoil_shell after do_tinfoil_dep
+
+do_tinfoil_shell_fakeroot() {
+    write_tinfoil_shell_marker shell-fakeroot
+}
+do_tinfoil_shell_fakeroot[fakeroot] = "1"
+do_tinfoil_shell_fakeroot[depends] += "virtual/fakeroot-native:do_populate_sysroot"
+addtask tinfoil_shell_fakeroot after do_tinfoil_dep
+
+def write_tinfoil_marker(d, name):
+    import os
+
+    marker_dir = d.getVar('TINFOIL_TEST_MARKER_DIR')
+    os.makedirs(marker_dir, exist_ok=True)
+    with open(os.path.join(marker_dir, name), 'w') as marker:
+        marker.write(name + d.getVar('TINFOIL_TEST_MARKER_VALUE'))
+
+python do_tinfoil_python() {
+    write_tinfoil_marker(d, 'python')
+}
+addtask tinfoil_python after do_tinfoil_dep
+
+python do_tinfoil_python_fakeroot() {
+    write_tinfoil_marker(d, 'python-fakeroot')
+}
+do_tinfoil_python_fakeroot[fakeroot] = "1"
+do_tinfoil_python_fakeroot[depends] += "virtual/fakeroot-native:do_populate_sysroot"
+addtask tinfoil_python_fakeroot after do_tinfoil_dep
diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index 21c8686b2a..d8009eddfe 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -6,11 +6,14 @@
 
 import os
 import re
+import shutil
 import time
 import logging
+import uuid
 import bb.tinfoil
 
 from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake
 
 class TinfoilTests(OESelftestTestCase):
     """ Basic tests for the tinfoil API """
@@ -77,6 +80,63 @@ class TinfoilTests(OESelftestTestCase):
             localdata.setVar('PN', 'hello')
             self.assertEqual('hello', localdata.getVar('BPN'))
 
+    def test_run_prepared_task(self):
+        """Verify run_prepared_task() runs only the requested task, not its
+        dependency.
+
+        pseudo-pyc-test's do_tinfoil_* tasks depend on do_tinfoil_dep; both
+        write a marker file containing the task name plus the current value
+        of TINFOIL_TEST_MARKER_VALUE. A normal bitbake build is expected to
+        update both the dependency's and the requested tasks' markers to a
+        new value. Calling run_prepared_task() with another new value must
+        update only the requested tasks' markers, leaving do_tinfoil_dep's
+        marker at the value written by the earlier bitbake build.
+        """
+        marker_dir = os.path.join(
+            self.builddir, 'tmp', 'tinfoil-prepared-task')
+        shutil.rmtree(marker_dir, ignore_errors=True)
+        self.track_for_cleanup(marker_dir)
+
+        tasks = ('shell', 'shell_fakeroot', 'python', 'python_fakeroot')
+
+        # Use a fresh, random value each run so the tasks' signatures change
+        # and bitbake can't skip them as "up to date" from a previous run.
+        value1 = uuid.uuid4().hex
+        bitbake(' '.join('pseudo-pyc-test:do_tinfoil_%s' % task
+                          for task in tasks),
+                postconfig='TINFOIL_TEST_MARKER_VALUE = "%s"\n' % value1)
+
+        # do_tinfoil_dep is a dependency of all the tasks above, so a normal
+        # bitbake build is expected to have run it too, with the same value.
+        with open(os.path.join(marker_dir, 'dep')) as marker:
+            self.assertEqual(marker.read(), 'dep' + value1)
+        for task in tasks:
+            marker_name = task.replace('_', '-')
+            with open(os.path.join(marker_dir, marker_name)) as marker:
+                self.assertEqual(marker.read(), marker_name + value1)
+
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=False, quiet=2)
+            # A distinct value per call proves each run_prepared_task()
+            # invocation re-reads the variable rather than reusing a value
+            # cached from an earlier call in this loop.
+            values2 = {task: uuid.uuid4().hex for task in tasks}
+            for task in tasks:
+                tinfoil.run_command('setVariable', 'TINFOIL_TEST_MARKER_VALUE', values2[task])
+                tinfoil.run_prepared_task(
+                    'pseudo-pyc-test', 'do_tinfoil_%s' % task)
+
+        # The requested tasks must have re-run and picked up their own value
+        for task in tasks:
+            marker_name = task.replace('_', '-')
+            with open(os.path.join(marker_dir, marker_name)) as marker:
+                self.assertEqual(marker.read(), marker_name + values2[task])
+
+        # ...but run_prepared_task() must not have run do_tinfoil_dep, so its
+        # marker should still hold the value written by the earlier bitbake build
+        with open(os.path.join(marker_dir, 'dep')) as marker:
+            self.assertEqual(marker.read(), 'dep' + value1)
+
     # The config_data API to parse_recipe_file is used by:
     # layerindex-web layerindex/update_layer.py
     def test_parse_recipe_custom_data(self):
-- 
2.55.0


