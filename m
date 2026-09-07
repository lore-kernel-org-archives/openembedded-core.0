Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF16C79FA0
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 06:37:38 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28905.1788763051781260538
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 23:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=IoW6eLs/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-202609070637285c096d5f3000020788-fyfaik@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202609070637285c096d5f3000020788
        for <openembedded-core@lists.openembedded.org>;
        Mon, 07 Sep 2026 08:37:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=5aBTMJCbJTqe33Z4Hf1g1etper4QEr6My+8fwQ3yZRs=;
 b=IoW6eLs/9xr46GUJHduUfLl1WpsZ8PR4zXtscoKEdw+bpN8wRe73Rr0Ufi1n8Zk9bC1eYf
 LRf1y7jOYt/Uaf7xTtzEc+5DLE3DSgbHfPLD45poJdQpkL18TVkk5G05lPsgcsFv555Njo/d
 vm4nVgiH5h4kRng5VQFxnEiAE4aKmBWUTUCg0rtOLGY164DIAMtmNVlaMGV1nl2EEaWXytfE
 UM+OBABVgnGLL7eo4MPR6xF60N3/4HRAmlAoeDZGsqr5KTswcAZUP1mRlamUHdm1EW2pTvEB
 eTGZEv4iQ1QfUqN5ghArtlA9vRoVlzERxdSHPy5kevvz3AgqrZ3aYwxQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 6/9] oe-selftest: devtool ide-sdk: test install task
Date: Mon,  7 Sep 2026 08:36:12 +0200
Message-ID: <20260907063720.56742-7-adrian.freihofer@siemens.com>
In-Reply-To: <20260907063720.56742-1-adrian.freihofer@siemens.com>
References: <20260907063720.56742-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245234

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Verify that the ide-sdk setup generates the do_install task script and that
the script runs successfully. This covers the prepared-task runner used by
the IDE deployment workflow without requiring Qemu.

Replace the ad-hoc dependsOn handling in _verify_launch_config() with a
new helper that mirrors VS Code's task dependency resolution and
execution order. This ensures that the selftest runs the same sequence
of tasks as VS Code would, including compile and install/deploy
prerequisites, before starting the debug server. This also aligns the
gdb and lldb selftest paths to avoid behavior drift and improve test
reliability.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 86 ++++++++++++++++++++-----
 1 file changed, 70 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index a4b7a83094..cf7b97fdda 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3043,7 +3043,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         """Verify the scripts referred by the tasks.json file are fine.
 
         This function does not depend on Qemu. Therefore it verifies the scripts
-        exists and the delete step works as expected. But it does not try to
+        exists and the install step works as expected. But it does not try to
         deploy to Qemu.
         """
         recipe_id, recipe_id_pretty = self._get_recipe_ids(recipe_name)
@@ -3061,6 +3061,11 @@ class DevtoolIdeSdkTests(DevtoolBase):
         i_and_d_script_path = os.path.join(
             self._workspace_scripts_dir(recipe_name), i_and_d_script)
         self.assertExists(i_and_d_script_path)
+        install_script = 'bb_run_do_install_' + recipe_id
+        install_script_path = os.path.join(
+            self._workspace_scripts_dir(recipe_name), install_script)
+        self.assertExists(install_script_path)
+        runCmd(install_script_path, cwd=tempdir, output_log=self._cmd_logger)
 
         deploy_script_path = os.path.join(
             self._workspace_scripts_dir(recipe_name), 'deploy_target_' + recipe_id)
@@ -3295,6 +3300,60 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertEqual(actual_group, group,
                          msg="%s not owned by group %s: got %s" % (conf_file, group, actual_group))
 
+    def _run_vscode_task_with_dependencies(self, tempdir, task_label, run_main_task=True):
+        """Run a VS Code shell task and its dependsOn chain.
+
+        The helper mirrors VS Code task dependency ordering for selftests, so
+        preLaunchTask prerequisites (e.g. compile and do_install/deploy tasks)
+        run before the debug server task.
+        """
+        tasks_path = os.path.join(tempdir, '.vscode', 'tasks.json')
+        self.assertExists(tasks_path, 'tasks.json not found at %s' % tasks_path)
+
+        with open(tasks_path) as tasks_j:
+            tasks_d = json.load(tasks_j)
+
+        task_by_label = {
+            task.get('label'): task
+            for task in tasks_d.get('tasks', [])
+            if task.get('label')
+        }
+        self.assertIn(task_label, task_by_label,
+                      "Task '%s' not found in tasks.json" % task_label)
+
+        ran = set()
+
+        def run_task(label, execute_task):
+            if label in ran:
+                return
+
+            task = task_by_label[label]
+            deps = task.get('dependsOn', [])
+            if isinstance(deps, str):
+                deps = [deps]
+
+            for dep in deps:
+                self.assertIn(dep, task_by_label,
+                              "DependsOn task '%s' not found in tasks.json" % dep)
+                run_task(dep, True)
+
+            if execute_task:
+                command = task.get('command')
+                if command:
+                    args = task.get('args', [])
+                    if not isinstance(args, list):
+                        args = [args]
+                    task_cmd = [command] + [str(arg) for arg in args]
+
+                    task_cwd = task.get('options', {}).get('cwd', tempdir)
+                    if isinstance(task_cwd, str):
+                        task_cwd = task_cwd.replace('${workspaceFolder}', tempdir)
+                    runCmd(task_cmd, cwd=task_cwd, output_log=self._cmd_logger)
+
+            ran.add(label)
+
+        run_task(task_label, run_main_task)
+
 
 class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
 
@@ -3786,21 +3845,10 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
             (task for task in tasks if task["label"] == prelaunch_task_name), None)
         self.assertIsNotNone(prelaunch_task, f"PreLaunchTask '{prelaunch_task_name}' not found in tasks.json")
 
-        # Find the dependsOn task if exists (install and deploy-target)
-        if "dependsOn" in prelaunch_task:
-            depends_task_names = prelaunch_task["dependsOn"]
-            for depends_task_name in depends_task_names:
-                depends_task = next(
-                    (task for task in tasks if task["label"] == depends_task_name), None)
-                self.assertIsNotNone(depends_task, f"DependsOn task '{depends_task_name}' not found in tasks.json")
-                # For simplicity, we assume the dependsOn task is a prerequisite and does not affect the main command
-                self.logger.debug(f"PreLaunchTask '{prelaunch_task_name}' depends on '{depends_task_name}'")
-
-                # Extract command details from dependsOn task
-                depends_task_command = depends_task["command"]
-                depends_task_args = depends_task.get("args", [])
-                self.logger.debug(f"Would execute dependsOn task: {depends_task_command} {' '.join(depends_task_args)}")
-                runCmd(f"{depends_task_command} {' '.join(depends_task_args)}", output_log=self._cmd_logger)
+        # Execute preLaunchTask prerequisites exactly like VS Code dependsOn
+        # handling, but keep starting the debug server in this method.
+        self._run_vscode_task_with_dependencies(
+            tempdir, prelaunch_task_name, run_main_task=False)
 
         # Verify task structure and extract command details
         self.assertEqual(prelaunch_task["type"], "shell", f"Task '{prelaunch_task_name}' should be shell type")
@@ -4569,6 +4617,12 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
         self.assertIsNotNone(prelaunch_task,
                              "preLaunchTask '%s' not found in tasks.json" % prelaunch_task_name)
 
+        # Run compile/install/deploy prerequisites exactly as VS Code would,
+        # but keep starting the debug server itself in this method so we can
+        # retain explicit readiness handling and diagnostics.
+        self._run_vscode_task_with_dependencies(
+            tempdir, prelaunch_task_name, run_main_task=False)
+
         # Extract the SSH command and start lldb-server on the target
         task_command = prelaunch_task["command"]
         task_args = prelaunch_task["args"]
-- 
2.55.0


