Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6079.1794231925100266687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:45:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=BVH07v9v;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 367D53D81892;
	Mon,  9 Nov 2026 08:45:24 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id DWy1TkACVqTv; Mon,  9 Nov 2026 08:45:22 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A08533D8176B;
	Mon,  9 Nov 2026 08:45:22 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com A08533D8176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1794231922; bh=40sDrF9NuAkV+vk09pT7+oe3Hp1Go9jiXVdEIfSxG0I=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=BVH07v9vrrw9tuI6nKtHSmQU4DQjXArEO0Dx95a0HO1jfIwryPbsSfCGbqDGQ+ZN6
	 MAUnwlnm2O32IH6vBUBUn4/yJ1diOjXy5/TcItUMInMZVPyI9lonH8U25edYbAJJ/O
	 tOiBtWhu11Rz7VOZ6E7PBOW856EV1vtNvtmkYiozl71SBVjPUpcCYjPPYlpvpcwEVP
	 65ncDgmfby95ak7eNfRrr/51+9Mirg0ZjJcNfwRthL1bmXQXIrfKNVZRwRcUOrjvmd
	 htPAkuhSOEhBi57BKWCDd9fpKw914tx+7O3FIQEe4Eq69KWr73XgzmMDPEyNPzlmEh
	 9dFVwRll6DPEQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id yTP_M0-mMVEj; Mon,  9 Nov 2026 08:45:22 -0500 (EST)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 20C393D8182D;
	Mon,  9 Nov 2026 08:45:22 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 09 Nov 2026 14:44:34 +0100
Subject: [PATCH v2 17/18] oeqa/selftest: debug Cargo example over QEMU
 slirp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-devtool-ide-sdk-cargo-v2-17-d56134000561@savoirfairelinux.com>
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
In-Reply-To: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249844

Exercise Cargo deploy and CodeLLDB launch against oe-selftest-image over
slirp. Verify source breakpoints, Rust and runtime backtrace frames, and
that the BitBake RUST_DEBUG_REMAP includes the devtool external source
tree so package QA does not reject host paths in DWARF.

AI-Generated: Uses GitHub Copilot

Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

---

Changes in v2:

- Use STAGING_LIBDIR_NATIVE to locate Rust standard-library sources in
  the SDK.
- Remove the second ide-sdk invocation and repeated-remap assertion while
  retaining the QEMU debugging and rebuild coverage.
---
 meta/lib/oeqa/selftest/cases/devtool.py | 117 ++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index f23e1a7f95..0128d37d83 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -4456,6 +4456,123 @@ class DevtoolIdeSdkRustTests(DevtoolIdeSdkTests):
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
+            get_bb_var('STAGING_LIBDIR_NATIVE', 'cargo-example'),
+            'rustlib', 'src', 'rust', 'library')
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

