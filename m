Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA78C88E5A
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 07:38:34 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14685.1769413110456342787
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 23:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=EsAlQ/WF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-202601260738288bfcf3ae2000020705-jr6njt@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202601260738288bfcf3ae2000020705
        for <openembedded-core@lists.openembedded.org>;
        Mon, 26 Jan 2026 08:38:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=a3XS/ZJR1NxGoapWsVY8Y2f+J7CRdSuy+y8wsy4MiIE=;
 b=EsAlQ/WFx7rnnx9Z5N33kAX3xqVylYxhz5/R8yCS0DSHFVmQAQQ1pJafdHNgueLqnLBFqI
 Mqh3UK1/M9lvMhrqNjbziDvT6JQHvZIABxoGND/1oATKpAE3au9yFc2sccMpE0ABGQ8Ps9vL
 4lHGfr1aQiP7HNwnxWwTyu+XmH21d3YdmIqx6AIEFMhhW+Iv/2FYeW9MCQYnX/rRsCO1Yyf+
 cLfdTFT6LeEP4BM/vRu3o4GqyFE32zDF4w9ja6JZ7NqnAWF5iyrYD+kxvWXYQsDUAUiqgU4I
 jS6AED7c9f1KeiWaZtmm2yrL4otMMT47HoVVgRNNjgxfWRazB8TXY9Xg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 05/13] oe-selftest: devtool: check example services are running
Date: Mon, 26 Jan 2026 08:37:32 +0100
Message-ID: <20260126073809.468495-6-adrian.freihofer@siemens.com>
In-Reply-To: <20260126073809.468495-1-adrian.freihofer@siemens.com>
References: <20260126073809.468495-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 07:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229954

From: Adrian Freihofer <adrian.freihofer@siemens.com>

When running the devtool ide-sdk test with qemu, verify that the example
services are actually running on the target by using pgrep to check for
the example executable names.

Also verify that the configuration files in /etc are owned by the proper
user and group, both before and after the install_and_deploy scripts
have run. This is also a check that the install_and_deploy scripts
are working correctly with pseudo.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 45 +++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 681dcee08c..e78e6ed226 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2810,6 +2810,22 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertIn("Running tests...", result.output)
         self.assertIn("100% tests passed", result.output)
 
+    def _verify_service_running(self, qemu, service_name):
+        """Helper to verify a service is running in Qemu"""
+        status, output = qemu.run("pgrep %s" % service_name)
+        self.assertEqual(status, 0, msg="%s service not running: %s" %
+                         (service_name, output))
+        self.assertTrue(output.strip().isdigit(),
+                        f"pgrep output should be a PID integer, got: {output.strip()}")
+
+    def _verify_conf_file(self, qemu, conf_file, owner, group):
+        """Helper to verify a configuration file is owned by the proper user and group"""
+        ls_cmd = "ls -l %s" % conf_file
+        status, output = qemu.run(ls_cmd)
+        self.assertEqual(status, 0, msg="Failed to ls %s: %s" % (conf_file, output))
+        self.assertRegex(output, rf"^-.+ {owner} {group} .+ {re.escape(conf_file)}$",
+                         msg="%s not owned by %s:%s: %s" % (conf_file, owner, group, output))
+
     @OETestTag("runqemu")
     def test_devtool_ide_sdk_none_qemu(self):
         """Start qemu-system and run tests for multiple recipes. ide=none is used."""
@@ -2826,7 +2842,16 @@ class DevtoolIdeSdkTests(DevtoolBase):
             # cmake-example recipe
             recipe_name = "cmake-example"
             example_exe = "cmake-example"
+            example_user_group = "cmake-example"
+            conf_file = "/etc/cmake-example.conf"
             build_file = "CMakeLists.txt"
+
+            # Verify the cmake-example service is running on the target
+            self._verify_service_running(qemu, example_exe)
+            # Verify /etc/cmake-example.conf is owned by the cmake-example user
+            self._verify_conf_file(qemu, conf_file, example_user_group, example_user_group)
+
+            # Setup the recipe with devtool ide-sdk cmake-example ...
             tempdir = self._devtool_ide_sdk_recipe(
                 recipe_name, build_file, testimage)
             bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=none' % (
@@ -2835,14 +2860,29 @@ class DevtoolIdeSdkTests(DevtoolBase):
             self._gdb_cross()
             self._verify_cmake_preset(tempdir)
             self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe)
+
             # Verify the oe-scripts sym-link is valid
             self.assertEqual(self._workspace_scripts_dir(
                 recipe_name), self._sources_scripts_dir(tempdir))
 
+            # Verify /etc/meson-example.conf is still owned by the cmake-example user
+            # after the install and deploy scripts updated the file
+            self._verify_conf_file(qemu, conf_file, example_exe, example_exe)
+
+
             # meson-example recipe
             recipe_name = "meson-example"
             example_exe = "mesonex"
+            example_user_group = "meson-example"
+            conf_file = "/etc/meson-example.conf"
             build_file = "meson.build"
+
+            # Verify the meson-example service is running on the target
+            self._verify_service_running(qemu, example_exe)
+            # Verify /etc/meson-example.conf is owned by the meson-example user
+            self._verify_conf_file(qemu, conf_file, example_user_group, example_user_group)
+
+            # Setup the recipe with devtool ide-sdk meson-example ...
             tempdir = self._devtool_ide_sdk_recipe(
                 recipe_name, build_file, testimage)
             bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=none' % (
@@ -2850,10 +2890,15 @@ class DevtoolIdeSdkTests(DevtoolBase):
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
             self._gdb_cross()
             self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe)
+
             # Verify the oe-scripts sym-link is valid
             self.assertEqual(self._workspace_scripts_dir(
                 recipe_name), self._sources_scripts_dir(tempdir))
 
+            # Verify /etc/meson-example.conf is still owned by the meson-example user
+            # after the install and deploy scripts updated the file
+            self._verify_conf_file(qemu, conf_file, example_user_group, example_user_group)
+
     def test_devtool_ide_sdk_code_cmake(self):
         """Verify a cmake recipe works with ide=code mode"""
         recipe_name = "cmake-example"
-- 
2.52.0


