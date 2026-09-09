Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684E0C88E48
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:53:52 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77.1788990824405615363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=DEm1404M;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-2026090921534175da5e0a8700020714-znjxbf@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026090921534175da5e0a8700020714
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Sep 2026 23:53:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Ba97bilShWFgM64DS1I2GA+j79afIgNFQiHxCpqSTCk=;
 b=DEm1404MSqa2YRC8EQeNv6/0ojlG70v4buA6h9PA8x+sPc6Lpw5SVq2nqzUEov4Uro2DGu
 ztnvP/W5HuG7QELkqPrwPDI7vMCURtIXZAcBfdjtoVym8BixTw4TLB3h3xAVOsi4Ov9H/VX8
 3FJtNSEjtCweLQMJ1Ck1A7orTxEHp8VE9+OUFe8eoCGOKofG5h6Jshjy2fMUFxIuiNCNez56
 G0YsIk3D/Dp5Pb1FCp4nhRUt9ClTeZb7rt1AUtB4N+rZu0qPjuazsHzjth11aUXbQOrnGwaH
 eV/y1dlK/qaf1ZceLSGTn3ZQeGgi0pC0bqS77Zs0ExUV5gyuMw2rGW5g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 03/15] oe-selftest: devtool deploy-target: test deploying into a local rootfs path
Date: Wed,  9 Sep 2026 23:53:03 +0200
Message-ID: <20260909215337.89106-4-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245506

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Extract an image's rootfs tarball with runqemu-extract-sdk, boot it via
NFS with runqemu, then deploy a devtool-modified recipe directly into
that directory with plain 'devtool deploy-target <recipe> <path>' (no
ssh) while the target has it mounted live, and confirm the target
immediately sees the change. Deploying a second time covers replacing an
existing deployment, a --file-glob deploy covers the filtered variant
which packs an explicit file list, and 'devtool undeploy-target <recipe>
<path>' covers removing the files again, all while the rootfs stays
mounted.

Also deploy/undeploy the same recipe over ssh into the very same live
directory and compare the resulting file ownership/permissions (captured
via the same pseudo find/ls trick test_devtool_deploy_target uses)
against the local-path deploy's result, to confirm the two independent
code paths (_deploy_local's pseudo pipe vs _deploy_ssh's tar-over-ssh)
produce identical output.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 161 ++++++++++++++++++++++++
 1 file changed, 161 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index cf7b97fdda..8bfdd15552 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2171,6 +2171,167 @@ class DevtoolDeployTargetTests(DevtoolBase):
                     extra_args = ' '.join(a for a in (strip_opt, filter_args) if a)
                     _deploy_and_check(extra_args, check_full_filelist=not filter_args, expected_files=expected_files)
 
+    @OETestTag("runqemu")
+    def test_devtool_deploy_target_path(self):
+        """Verify 'devtool deploy-target/undeploy-target <recipe> <path>' deploy/remove straight into
+        a local pseudo-managed rootfs directory (no ssh), and that a target
+        booting that same directory via NFS immediately sees the change.
+        """
+        self._check_runqemu_prerequisites()
+        self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        testrecipe = 'mdadm'
+        testfile = '/sbin/mdadm'
+        # mdmon is installed by the same do_install, used to check --file-glob filtering
+        otherfile = '/sbin/mdmon'
+        if "usrmerge" in get_bb_var('DISTRO_FEATURES'):
+            testfile = '/usr/sbin/mdadm'
+            otherfile = '/usr/sbin/mdmon'
+        testcommand = '/sbin/mdadm --help'
+        testimage = 'oe-selftest-image'
+        # Use the mdadm-doc package to check --package filtering excludes it
+        mandir = get_bb_var('mandir', testrecipe)
+        docfile = os.path.join(mandir, 'man8', '%s.8' % testrecipe)
+
+        # A tar rootfs is needed both to extract a local copy of it (below)
+        # and for runqemu to NFS-boot straight from that extracted directory.
+        self.append_config('IMAGE_FSTYPES:append = " tar"\n')
+        bitbake("%s qemu-native qemu-helper-native" % testimage)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], testimage)
+        deploy_dir_image = bb_vars['DEPLOY_DIR_IMAGE']
+        image_link_name = bb_vars['IMAGE_LINK_NAME']
+        self.add_command_to_tearDown('bitbake -c clean %s' % testimage)
+        self.add_command_to_tearDown('rm -f %s/%s*' % (deploy_dir_image, testimage))
+
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        runCmd('devtool build %s' % testrecipe)
+
+        # Extract a local pseudo-managed rootfs the same way
+        rootfs_tarball = os.path.join(deploy_dir_image, image_link_name + '.tar')
+        self.assertExists(rootfs_tarball)
+        extractdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(extractdir)
+        nfs_rootfs = os.path.join(extractdir, 'rootfs')
+        runCmd('runqemu-extract-sdk %s %s' % (rootfs_tarball, nfs_rootfs))
+        self.assertExists(nfs_rootfs)
+        self.assertExists(nfs_rootfs + '.pseudo_state')
+
+        # oe-selftest-image does not install mdadm by default, so the target must not see it yet.
+        self.assertNotExists(os.path.join(nfs_rootfs, testfile.lstrip('/')))
+
+        qemuboot = os.path.join(deploy_dir_image, image_link_name + '.qemuboot.conf')
+        self.assertExists(qemuboot)
+        launch_cmd = 'runqemu %s %s nographic' % (shlex.quote(qemuboot), shlex.quote(nfs_rootfs))
+        with runqemu(testimage, launch_cmd=launch_cmd) as qemu:
+            status, output = qemu.run("awk '$2 == \"/\" {print $3}' /proc/mounts")
+            self.assertEqual(status, 0)
+            self.assertEqual(output.strip(), 'nfs')
+
+            status, _ = qemu.run(testcommand)
+            self.assertNotEqual(status, 0, '%s should not be deployed yet' % testfile)
+
+            # Deploy directly into the local rootfs path (no ssh) while the target has it NFS-mounted live
+            deploy_cmd = 'devtool deploy-target %s %s' % (testrecipe, nfs_rootfs)
+            if self.logger.isEnabledFor(logging.DEBUG):
+                deploy_cmd += ' -s'
+            result = runCmd(deploy_cmd)
+            self.assertEqual(result.status, 0)
+            self.assertExists(os.path.join(nfs_rootfs, testfile.lstrip('/')))
+            self.assertExists(os.path.join(nfs_rootfs, otherfile.lstrip('/')))
+
+            status, _ = qemu.run(testcommand)
+            self.assertEqual(status, 0, '%s was not deployed' % testfile)
+
+            # Deploying again while the target still has this directory NFS-mounted live must still succeed.
+            result = runCmd(deploy_cmd)
+            self.assertEqual(result.status, 0)
+
+            # Undeploy directly from the local rootfs path (no ssh) while the target still has it NFS-mounted live
+            undeploy_cmd = 'devtool undeploy-target %s %s' % (testrecipe, nfs_rootfs)
+            if self.logger.isEnabledFor(logging.DEBUG):
+                undeploy_cmd += ' -s'
+            result = runCmd(undeploy_cmd)
+            self.assertEqual(result.status, 0)
+            self.assertNotExists(os.path.join(nfs_rootfs, testfile.lstrip('/')))
+
+            status, _ = qemu.run(testcommand)
+            self.assertNotEqual(status, 0, 'undeploy-target did not remove %s as it should have' % testfile)
+
+            # Confirm the local-path deploy (dual-pseudo pipe) and the ssh deploy
+            # (tar over ssh) land identical files with identical ownership/perms
+            # into the very same live NFS-exported directory, for both an
+            # unfiltered deploy and a --package filtered one.
+            bb_vars = get_bb_vars(['FAKEROOTENV', 'FAKEROOTCMD', 'PATH'], testrecipe)
+            fakerootenv = bb_vars['FAKEROOTENV']
+            fakerootcmd = bb_vars['FAKEROOTCMD']
+            path = bb_vars['PATH']
+            state_dir = nfs_rootfs + '.pseudo_state'
+
+            def _get_rootfs_filelist():
+                # nfs_rootfs has its own pseudo database, distinct from the one
+                # FAKEROOTENV points at, so override it for this inspection.
+                cmd = 'PATH="%s" %s PSEUDO_LOCALSTATEDIR=%s PSEUDO_INCLUDE_PATHS=%s %s find . -type f -exec ls -l {} \\;' % (
+                    path, fakerootenv, shlex.quote(state_dir), shlex.quote(nfs_rootfs), fakerootcmd)
+                result = runCmd(cmd, cwd=nfs_rootfs)
+                filelist = self._process_ls_output(result.output)
+                filelist.sort(key=lambda item: item.split()[-1])
+                return filelist
+
+            def _compare_local_and_ssh_deploy(extra_args, expected_files):
+                """Deploy extra_args once locally and once over ssh into the same
+                live directory, and assert both leave identical files with
+                identical ownership/permissions (expected_files checks each path
+                was/wasn't deployed, on both sides)."""
+                local_cmd = ('%s %s' % (deploy_cmd, extra_args)).strip()
+                result = runCmd(local_cmd)
+                self.assertEqual(result.status, 0)
+                for filepath, expected in expected_files.items():
+                    exists = os.path.exists(os.path.join(nfs_rootfs, filepath.lstrip('/')))
+                    self.assertEqual(exists, expected, '%s: %s exists=%s after local deploy' % (extra_args, filepath, exists))
+                local_filelist = _get_rootfs_filelist()
+
+                result = runCmd(undeploy_cmd)
+                self.assertEqual(result.status, 0)
+                self.assertNotExists(os.path.join(nfs_rootfs, testfile.lstrip('/')))
+
+                ssh_cmd = ('devtool deploy-target -c %s root@%s %s' % (testrecipe, qemu.ip, extra_args)).strip()
+                result = runCmd(ssh_cmd)
+                self.assertEqual(result.status, 0)
+                for filepath, expected in expected_files.items():
+                    exists = os.path.exists(os.path.join(nfs_rootfs, filepath.lstrip('/')))
+                    self.assertEqual(exists, expected, '%s: %s exists=%s after ssh deploy' % (extra_args, filepath, exists))
+                ssh_filelist = _get_rootfs_filelist()
+
+                self.assertEqual(local_filelist, ssh_filelist,
+                                '%s: local-path deploy and ssh deploy produced different file ownership/permissions' % extra_args)
+
+                result = runCmd('devtool undeploy-target -c %s root@%s' % (testrecipe, qemu.ip))
+                self.assertEqual(result.status, 0)
+                self.assertNotExists(os.path.join(nfs_rootfs, testfile.lstrip('/')))
+
+            _compare_local_and_ssh_deploy('', {testfile: True, otherfile: True, docfile: True})
+            _compare_local_and_ssh_deploy('--package %s' % testrecipe, {testfile: True, otherfile: True, docfile: False})
+
+            # A --package/--file-glob filtered deploy hands tar an explicit file
+            # list instead of packing the whole tree, so cover that path as well.
+            filtered_deploy_cmd = deploy_cmd + ' --file-glob %s' % testfile
+            result = runCmd(filtered_deploy_cmd)
+            self.assertEqual(result.status, 0)
+            self.assertExists(os.path.join(nfs_rootfs, testfile.lstrip('/')))
+            self.assertNotExists(os.path.join(nfs_rootfs, otherfile.lstrip('/')))
+
+            status, _ = qemu.run(testcommand)
+            self.assertEqual(status, 0, '%s was not deployed' % testfile)
+
+            result = runCmd(undeploy_cmd)
+            self.assertEqual(result.status, 0)
+            self.assertNotExists(os.path.join(nfs_rootfs, testfile.lstrip('/')))
+
+
 class DevtoolBuildImageTests(DevtoolBase):
 
     def test_devtool_build_image(self):
-- 
2.55.0


