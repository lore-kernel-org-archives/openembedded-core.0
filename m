Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E093FC88E50
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:53:52 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80.1788990824462594145
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=kTk8AUOP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-20260909215342060f9fa35e0002071f-3xesus@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260909215342060f9fa35e0002071f
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Sep 2026 23:53:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vHo1uzZZG51LglazYHcR0louWyMS0ZxAN36s7QE1BZw=;
 b=kTk8AUOP9Ney46033bIBbKMTMS3SCt7zV6Klt9PnJCbWsk82SCkfHtZALoi/X9h6xYTbN9
 YsY3di0aQSkiuKmtRvLqJJN89TF5XIX+dt4II3sU2/GRmkjivQhWUoVfXrYKgqACKoEpAwCS
 PrlC2RLlqgQ89fpzaQQNwC7AI7lbnAfW/gCh1/Q4poqbcAaAPWLX3fi2uJawv9H6L26flAFZ
 UVJ50GgOlyQLtRblFNJBKmh+8xXH+FbkKb+HirWhKMqyA7Ny6zPBf6nrRi55dfNJZ1pKozeX
 JMNifWRr13QLak1+eeN0T4QzYVNI4UBpvlaL/IvHm1EK16RFQm9ZzX4A==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 05/15] oe-selftest: devtool ide-sdk: test NFS debug rootfs
Date: Wed,  9 Sep 2026 23:53:05 +0200
Message-ID: <20260909215337.89106-6-adrian.freihofer@siemens.com>
In-Reply-To: <20260909215337.89106-1-adrian.freihofer@siemens.com>
References: <20260909215337.89106-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 21:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245511

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Exercise --nfs=rootfs-dbg with a real image build and verify the
extracted rootfs, pseudo state, runqemu helper, image bbappend and the
generated VS Code debug paths. Two further tests boot that rootfs over
NFS with runqemu, once with tap and once with slirp networking, re-run
ide-sdk against the actual target address and drive a full remote GDB
debug session.

Booting from NFS also exposed that the gdbserver pid file written by the
start script can become readable over the next SSH connection only a
moment later, so poll for it instead of reading it once.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 120 ++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 8bfdd15552..38eb9b3905 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3627,8 +3627,17 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         r = runCmd(gdbserver_script, output_log=self._cmd_logger)
         self.assertEqual(r.status, 0)
 
+        # The start script waits for gdbserver's port before returning, but on
+        # an NFS-root target (--nfs=rootfs-dbg) the pid file it wrote has been
+        # observed to become readable over the next SSH connection only a
+        # moment later, so poll for it.
         pid_file = '/tmp/gdbserver_1234_usr-bin-%s_multi/gdbserver.pid' % example_exe
         status, output = qemu.run('cat %s' % pid_file)
+        for _ in range(10):
+            if status == 0:
+                break
+            time.sleep(1)
+            status, output = qemu.run('cat %s' % pid_file)
         self.assertEqual(status, 0)
         gdbserver_pid = output.strip()
         self.assertRegex(gdbserver_pid, r'^\d+$')
@@ -4068,6 +4077,117 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
                 self.assertEqual(r.status, 0)
                 debug_check_func(r.output, DevtoolIdeSdkTests.MAGIC_STRING_ORIG)
 
+    def test_devtool_ide_sdk_code_nfs_debug_rootfs(self):
+        """Verify ide-sdk extracts an NFS debug rootfs for VS Code debugging."""
+        recipe_name = "cmake-example"
+        build_file = "CMakeLists.txt"
+        testimage = "oe-selftest-image"
+
+        self._check_workspace()
+        self._write_bb_config()
+        tempdir = self._devtool_ide_sdk_recipe(
+            recipe_name, build_file, testimage)
+        runCmd('devtool ide-sdk %s %s -c --ide=code --nfs=rootfs-dbg' %
+               (recipe_name, testimage), output_log=self._cmd_logger)
+
+        nfs_rootfs = os.path.join(
+            self.workspacedir, 'nfs-exports', testimage, 'rootfs-dbg')
+        self.assertExists(nfs_rootfs)
+        self.assertExists(nfs_rootfs + '.pseudo_state')
+        self.assertExists(os.path.join(nfs_rootfs, 'usr', 'bin', recipe_name))
+        runqemu_helper = os.path.join(
+            self.workspacedir, 'nfs-exports', testimage,
+            'runqemu-rootfs-dbg')
+        self.assertExists(runqemu_helper)
+        self.assertTrue(os.access(runqemu_helper, os.X_OK))
+        with open(runqemu_helper) as helper_file:
+            helper = helper_file.read()
+        self.assertIn('exec runqemu ', helper)
+        self.assertIn(nfs_rootfs, helper)
+
+        bbappend = os.path.join(
+            self.workspacedir, 'appends', testimage + '.bbappend')
+        with open(bbappend) as append_file:
+            self.assertRegex(
+                append_file.read(),
+                r'IMAGE_FSTYPES_DEBUGFS(?::append)? = " ?tar"')
+
+        with open(os.path.join(tempdir, '.vscode', 'launch.json')) as launch_file:
+            launch_configurations = json.load(launch_file)['configurations']
+        for configuration in launch_configurations:
+            self.assertIn(
+                nfs_rootfs, configuration['additionalSOLibSearchPath'])
+            self.assertEqual(
+                os.path.join(nfs_rootfs, 'usr', 'src', 'debug'),
+                configuration['sourceFileMap']['/usr/src/debug'])
+
+    def _test_devtool_ide_sdk_nfs_debug_rootfs_qemu(self, slirp=False):
+        """Boot the extracted NFS debug rootfs and exercise remote GDB."""
+        recipe_name = "cmake-example"
+        build_file = "CMakeLists.txt"
+        testimage = "oe-selftest-image"
+
+        self._check_workspace()
+        self._write_bb_config()
+        if not slirp:
+            self._check_runqemu_prerequisites()
+
+        tempdir = self._devtool_ide_sdk_recipe(
+            recipe_name, build_file, testimage)
+        runCmd('devtool ide-sdk %s %s -c --ide=none --nfs=rootfs-dbg' %
+               (recipe_name, testimage),
+               output_log=self._cmd_logger)
+
+        nfs_rootfs = os.path.join(
+            self.workspacedir, 'nfs-exports', testimage, 'rootfs-dbg')
+        runqemu_helper = os.path.join(
+            self.workspacedir, 'nfs-exports', testimage,
+            'runqemu-rootfs-dbg')
+        self.assertExists(nfs_rootfs)
+        self.assertExists(runqemu_helper)
+
+        launch_cmd = '%s nographic' % shlex.quote(runqemu_helper)
+        runqemuparams = ''
+        if slirp:
+            launch_cmd += ' slirp'
+            # QemuTarget uses this only to select its localhost SSH endpoint;
+            # launch_cmd supplies the actual runqemu option.
+            runqemuparams = 'slirp'
+
+        with runqemu(testimage, runqemuparams=runqemuparams,
+                     launch_cmd=launch_cmd) as qemu:
+            status, output = qemu.run(
+                "awk '$2 == \"/\" {print $3}' /proc/mounts")
+            self.assertEqual(status, 0)
+            self.assertEqual(output.strip(), 'nfs')
+
+            # Re-run with the real QEMU target address, instead of 192.168.7.2 IP.
+            # --skip-bitbake also skips the rootfs extraction, which would
+            # otherwise wipe the directory the target has mounted right now.
+            if slirp:
+                self.assertIsNotNone(qemu.port, 'No SSH port for the slirp target')
+                target_options = '-t root@%s -P %s ' % (qemu.ip, qemu.port)
+            else:
+                target_options = '-t root@%s -c ' % qemu.ip
+            runCmd('devtool ide-sdk %s %s %s--skip-bitbake --ide=none --nfs=rootfs-dbg' %
+                   (recipe_name, testimage, target_options),
+                   output_log=self._cmd_logger)
+
+            self._gdb_cross()
+            compile_cmd = self._verify_cmake_preset(tempdir)
+            self._devtool_ide_sdk_qemu(
+                tempdir, qemu, recipe_name, recipe_name, compile_cmd)
+
+    @OETestTag("runqemu")
+    def test_devtool_ide_sdk_none_nfs_qemu(self):
+        """Verify remote GDB debugging through an NFS-root QEMU target."""
+        self._test_devtool_ide_sdk_nfs_debug_rootfs_qemu()
+
+    @OETestTag("runqemu")
+    def test_devtool_ide_sdk_none_nfs_qemu_slirp(self):
+        """Verify remote GDB debugging through an NFS-root slirp target."""
+        self._test_devtool_ide_sdk_nfs_debug_rootfs_qemu(slirp=True)
+
     @OETestTag("runqemu")
     def test_devtool_ide_sdk_code_cmake(self):
         """Verify a cmake recipe works with ide=code mode"""
-- 
2.55.0


