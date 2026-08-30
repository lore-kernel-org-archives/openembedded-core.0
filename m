Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580C3C624A2
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 21:49:26 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17279.1788126561354360217
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 14:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Axyg5p5U;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20260830214919b38f4f65c4000207b3-29dswg@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260830214919b38f4f65c4000207b3
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 23:49:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7g3PlO/+cF3lKflvvDNgM7bMu8xwLpQ1yvZAdh5u1Ts=;
 b=Axyg5p5Upx4IG7aTaYg0EiDHmJzHScGYcA8dNcnMf+OdZjZJjMml+ErZ6GAv3wfuPOuqO1
 hiny9R605n5MHCVPb/UoMK8n6PJu7A9nok+TgUBT1jOHfVTGQRfRJt2OtjkJw/WeCuGTdt3Y
 x18T2s2vrziC+jmR1sbbeeAPyCG/Z65r9GC2cHoIDLbax1FRQncG+U+p/EysHyw4iihz87O3
 MlnMHwMV5hPpbZ7Z79JcRLwVcVaTdkYaSHuxe08ag1NexUGp2r3pFNVuGvhagYYdJ8uvqjuK
 Cb4EItmUprcB/FLji7jS2gWQMYyqnXS5u3CgwKMAWCuWVXwB3jy90s1g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 24/25] oe-selftest: devtool ide-sdk: test NFS debug rootfs
Date: Sun, 30 Aug 2026 23:48:46 +0200
Message-ID: <20260830214912.1346063-25-adrian.freihofer@siemens.com>
In-Reply-To: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
References: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 21:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244719

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Exercise --nfs=rootfs-dbg with a real image build and verify the
extracted rootfs, pseudo state, and generated VS Code debug paths.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 118 ++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index c05cf7bc82..8d68809552 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3539,8 +3539,18 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         r = runCmd(gdbserver_script, output_log=self._cmd_logger)
         self.assertEqual(r.status, 0)
 
+        # The start script already waited for gdbserver's port to come up
+        # before returning, so the pid file it wrote must exist by now. Still
+        # retry the read a few times: on an NFS-root target (--nfs=rootfs-dbg)
+        # this check runs over a fresh SSH connection right after the one that
+        # wrote the file, and a brief visibility lag has been observed there.
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
@@ -3974,6 +3984,114 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
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
+            # Re-run with the real QEMU target address, instead of 192.168.7.2 IP
+            if slirp:
+                target_options = '-t root@%s -P %s ' % (qemu.ip, qemu.port or '2222')
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


