Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38535.1793004983699186368
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 01:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=O15D9VRr;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C6FAF3D81896;
	Mon, 26 Oct 2026 04:56:22 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id A2pIK1NiTCtY; Mon, 26 Oct 2026 04:56:21 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 19BF83D81665;
	Mon, 26 Oct 2026 04:56:21 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 19BF83D81665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793004981; bh=gAwT//k7vaXLlexh39wXWYiuE+7JlwSuK+KYOVbs6BE=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=O15D9VRrmXEZoi73YhXpop/2OYpRaMMxqr4YV5JH9hKzfVooKEt279Kl3Zs2XnBfY
	 jQ7cG/240NBBn3mzpLOQktYX47Zybzqf/jxz8blvgmkAMP9uj4TFUAyemcloFXaeot
	 S6M3b6UIkuXBLv0V8s6ti6NVz/zk1JDhojcb3ZbrRIJ0nvHBQ3Kyf7q+cqoSmj3idc
	 iuzIpFfBX+y+zvW7BO5y+39F7kz7FiQMSLZx8tYW5zEzRqA8Qw1SNH23nV8sWGJYIb
	 7ZfbcjV3kPmQxnzvgip72nJzGK2UsJHMDbWiXBuaVpA8yXcrtIsLGpzDjYI26/hwpL
	 iooDlrrUmNprA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id CEo3Bu8viVpq; Mon, 26 Oct 2026 04:56:20 -0400 (EDT)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 899BF3D81844;
	Mon, 26 Oct 2026 04:56:20 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 26 Oct 2026 09:55:57 +0100
Subject: [PATCH 19/20] oeqa/selftest: debug Cargo example over QEMU slirp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-devtool-ide-sdk-cargo-v1-19-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 08:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248658

Exercise Cargo deploy and CodeLLDB launch against oe-selftest-image over
slirp. Verify source breakpoints, Rust and runtime backtrace frames, and
that BitBake's RUST_DEBUG_REMAP includes the devtool external source tree so
package QA does not reject host paths in DWARF.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 127 ++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 114536fc16..87dc8a1ee5 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -4472,6 +4472,133 @@ class DevtoolIdeSdkRustTests(DevtoolIdeSdkTests):
             if task['label'].startswith('install && deploy-target '))
         self.assertEqual(install_task['dependsOn'], [build_task['label']])
 
+    @OETestTag("runqemu")
+    def test_code_cargo_qemu_slirp(self):
+        recipe_name = 'cargo-example'
+        testimage = 'oe-selftest-image'
+        self._check_workspace()
+        self._write_bb_config()
+        tempdir = self._devtool_ide_sdk_recipe(
+            recipe_name, 'Cargo.toml', testimage)
+        port_start = self._reserve_slirp_port_block()
+        port_opts = ' -G %d' % port_start
+        runCmd(
+            'devtool ide-sdk %s %s --ide=code --target root@localhost '
+            '--port 2222 --no-host-check%s' % (
+                recipe_name, testimage, port_opts),
+            output_log=self._cmd_logger)
+        source_remap = '--remap-path-prefix=%s=%s' % (
+            os.path.realpath(tempdir),
+            get_bb_var('TARGET_DBGSRC_DIR', recipe_name))
+        rustflags = shlex.split(get_bb_var('RUSTFLAGS', recipe_name))
+        self.assertIn(
+            source_remap, rustflags,
+            'Cargo BitBake builds must remap the external source tree for DWARF')
+        self._verify_slirp_bbappend(testimage)
+
+        with runqemu(
+                testimage, runqemuparams='nographic slirp snapshot') as qemu:
+            self.assertIsNotNone(qemu.port, 'No SSH port for the slirp target')
+            runCmd(
+                'devtool ide-sdk %s %s %s --skip-bitbake --ide=code%s' % (
+                    recipe_name, testimage,
+                    '-t root@%s -P %s --no-host-check' % (qemu.ip, qemu.port),
+                    port_opts),
+                output_log=self._cmd_logger)
+            rustflags = shlex.split(get_bb_var('RUSTFLAGS', recipe_name))
+            self.assertIn(
+                source_remap, rustflags,
+                'Repeated ide-sdk runs must preserve the Cargo source remap')
+            self._verify_rust_lldb_debugging(tempdir, expected_input=4)
+
+    def _verify_rust_lldb_debugging(self, tempdir, expected_input):
+        with open(os.path.join(tempdir, '.vscode', 'launch.json')) as launch_file:
+            launch = json.load(launch_file)['configurations'][0]
+        with open(os.path.join(tempdir, '.vscode', 'tasks.json')) as tasks_file:
+            tasks = json.load(tasks_file)['tasks']
+
+        self.assertEqual(launch['type'], 'lldb')
+        target_dbgsrc_dir = get_bb_var('TARGET_DBGSRC_DIR', 'cargo-example')
+        self.assertEqual(
+            launch['sourceMap'][target_dbgsrc_dir], os.path.realpath(tempdir))
+        self._run_vscode_task_with_dependencies(
+            tempdir, launch['preLaunchTask'], run_main_task=False)
+        server_task = next(
+            task for task in tasks if task['label'] == launch['preLaunchTask'])
+        self.assertEqual(server_task['command'], 'ssh')
+        ssh_args = [server_task['command']] + server_task['args']
+        if ssh_args[-1].startswith('"') and ssh_args[-1].endswith('"'):
+            ssh_args[-1] = ssh_args[-1][1:-1].replace('\\$', '$')
+        runCmd(ssh_args, output_log=self._cmd_logger)
+
+        source_line = self._find_source_break_line(
+            tempdir, 'src/main.rs', '    match n {')
+        println_line = self._find_source_break_line(
+            tempdir, 'src/main.rs', 'println!')
+        lldb_batch = [
+            os.path.join(
+                get_bb_var('RECIPE_SYSROOT_NATIVE', 'lldb-native'),
+                'usr', 'bin', 'lldb'),
+            '--batch',
+        ]
+        for command in launch['initCommands'] + launch['targetCreateCommands']:
+            lldb_batch += ['-o', command]
+        source_map_args = []
+        for source, destination in launch.get('sourceMap', {}).items():
+            source_map_args += [source, destination]
+        if source_map_args:
+            lldb_batch += [
+                '-o', 'settings set target.source-map %s' %
+                ' '.join(source_map_args)]
+        lldb_batch += [
+            '-o', 'breakpoint set --file main.rs --line %d' % source_line,
+            '-o', 'breakpoint set --file main.rs --line %d' % println_line,
+            '-o', 'breakpoint disable 2',
+            '-o', 'breakpoint list',
+            '-o', 'run',
+            '-o', 'frame variable n',
+            '-o', 'thread backtrace',
+            '-o', 'breakpoint disable 1',
+            '-o', 'breakpoint enable 2',
+            '-o', 'continue',
+            '-o', 'frame info',
+            '-o', 'frame select 1',
+            '-o', 'frame info',
+            '-o', 'frame select 3',
+            '-o', "image lookup -v -r -n 'std::rt::lang_start.*'",
+            '-o', 'thread backtrace',
+            '-o', 'exit',
+        ]
+        result = runCmd(lldb_batch, timeout=60, output_log=self._cmd_logger)
+        self.assertNotIn('(pending)', result.output)
+        self.assertIn('cargo_example::fibonacci', result.output)
+        self.assertIn('cargo_example::main', result.output)
+        self.assertIn('std::rt::lang_start', result.output)
+        self.assertIn('__libc_start', result.output)
+        self.assertRegex(result.output, r'n\s*=\s*%d' % expected_input)
+        libstd_rustsrc = get_bb_var('RUSTSRC', 'libstd-rs')
+        libstd_work_shared = os.path.join(
+            get_bb_var('TMPDIR', 'libstd-rs'), 'work-shared')
+        rust_std_target_root = os.path.join(
+            get_bb_var('TARGET_DBGSRC_DIR', 'libstd-rs'),
+            os.path.relpath(libstd_rustsrc, libstd_work_shared),
+            'library')
+        rust_std_sdk_root = os.path.join(
+            get_bb_var('RECIPE_SYSROOT_NATIVE', 'cargo-example'),
+            'usr', 'lib', 'rustlib', 'src', 'rust', 'library')
+        rust_std_source = os.path.join(
+            rust_std_target_root, 'std', 'src', 'rt.rs')
+        self.assertEqual(
+            launch['sourceMap'][rust_std_target_root], rust_std_sdk_root)
+        self.assertIn(
+            rust_std_source, result.output,
+            'Rust runtime backtrace did not resolve to the SDK debug path:\n%s' %
+            result.output)
+        self.assertNotIn(libstd_rustsrc, result.output)
+        self.assertTrue(
+            os.path.isfile(os.path.join(rust_std_sdk_root, 'std', 'src', 'rt.rs')),
+            'Rust standard-library source is missing from the recipe SDK sysroot')
+
 
 class DevtoolIdeSdkKernelTests(DevtoolIdeSdkTests):
 

-- 
2.53.0

