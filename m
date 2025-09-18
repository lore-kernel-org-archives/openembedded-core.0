Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1EBCAC5B6
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:08:21 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.277.1758229694000737135
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=PxfMTf9I;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-202509182108119bfcde076700020746-2wyeqn@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202509182108119bfcde076700020746
        for <openembedded-core@lists.openembedded.org>;
        Thu, 18 Sep 2025 23:08:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=WaJl1pxjSBadel/9/PjabqJd9zOeNESv10TUwVvnzpg=;
 b=PxfMTf9Igd0X8kIMxIyAG4dTVlxCeQsYfc/AjEASfc/WL7enHyHOzQ/9yr8j+1Sy1C4ugl
 9ISoVKGtozAl+9XYac8XJ5ZQgBjmjUSXfWljgxL6Cso/pvY40tehX/zcIElC7Ij546ga535m
 3AJvUIO2I0FeXlvY7o1A+y+NsqYe083hVXaGptBovwS9dephpRpGbNDuwa3owMUtWmeNusvO
 cMztQwkwukunD9pghM1aRXUXt7eAEij5IdH9CYva5R5oztMyv6hoQRKj0HXEJnEsGSLe9t7L
 tP+WcV+Plkn9Wid0e5S7QrmQvqNeFCkw2Fn99y+3AbJ1dKCrRPEB6RVw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 08/19] oe-selftest: devtool: check example services are running
Date: Thu, 18 Sep 2025 23:07:10 +0200
Message-ID: <20250918210754.477049-9-adrian.freihofer@siemens.com>
In-Reply-To: <20250918210754.477049-1-adrian.freihofer@siemens.com>
References: <20250918210754.477049-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223665

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
index 36a1819bd89..82ac821cba6 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2813,6 +2813,22 @@ class DevtoolIdeSdkTests(DevtoolBase):
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
@@ -2829,7 +2845,16 @@ class DevtoolIdeSdkTests(DevtoolBase):
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
@@ -2838,14 +2863,29 @@ class DevtoolIdeSdkTests(DevtoolBase):
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
@@ -2853,10 +2893,15 @@ class DevtoolIdeSdkTests(DevtoolBase):
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
2.51.0


