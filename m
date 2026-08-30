Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33956C624C6
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 14:29:55 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9435.1788100183850000808
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 07:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=EpUndzpD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20260830142942267301f6080002071a-bf_krj@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260830142942267301f6080002071a
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 16:29:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=mdB2D9oOIhE1+3lfi9RCmJPeu6zpwig5nfpZvKdceLM=;
 b=EpUndzpDudJi0lORkitnnHhemdT5GWXqSvddDplF+VUl4TXTBQ+UNTxgkTnTuXG/SazQnm
 YDavM3tHlxQL7NuTdTBxv2j1uZ/qH4E8/JxAX7NrLqCMfQuEDXp4jW4hX93kz62dKz5fIB2G
 Xa/rGelCiNtVrxfOiKkESsT+qbe00rYpL4Kjv0N4TBkJW/9ZTTAecrbbeE6Vc26i2edwj9CT
 hgw+QcqeF9lW4M/YBt5xnn0R5wdpJuP6digY5DePxxn7C7yBX3cYa3KjQTF+K8Oadlxht0Sl
 3uZpg5P5yWudSUuCiOcX6GQToeIzOKZ58wYLNfbs6I7q1O8XkL0+INgA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 19/24] oe-selftest: devtool deploy-target: test deploying into a local rootfs path
Date: Sun, 30 Aug 2026 16:28:46 +0200
Message-ID: <20260830142922.17241-20-adrian.freihofer@siemens.com>
In-Reply-To: <20260830142922.17241-1-adrian.freihofer@siemens.com>
References: <20260830142922.17241-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 14:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244667

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Extract an image's rootfs tarball with runqemu-extract-sdk, boot it via
NFS with runqemu, then deploy a devtool-modified recipe directly into
that directory with plain 'devtool deploy-target <recipe> <path>' (no
ssh) while the target has it mounted live, and confirm the target
immediately sees the change.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 73 +++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 3e0eb7948f..35f2aa2e6c 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2171,6 +2171,79 @@ class DevtoolDeployTargetTests(DevtoolBase):
                     extra_args = ' '.join(a for a in (strip_opt, filter_args) if a)
                     _deploy_and_check(extra_args, check_full_filelist=not filter_args, expected_files=expected_files)
 
+    @OETestTag("runqemu")
+    def test_devtool_deploy_target_path(self):
+        """Verify 'devtool deploy-target <recipe> <path>' deploys straight into
+        a local pseudo-managed rootfs directory (no ssh), and that a target
+        booting that same directory via NFS immediately sees the change.
+        """
+        self._check_runqemu_prerequisites()
+        self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        testrecipe = 'mdadm'
+        testfile = '/sbin/mdadm'
+        if "usrmerge" in get_bb_var('DISTRO_FEATURES'):
+            testfile = '/usr/sbin/mdadm'
+        testcommand = '/sbin/mdadm --help'
+        testimage = 'oe-selftest-image'
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
+
+            status, _ = qemu.run(testcommand)
+            self.assertEqual(status, 0, '%s was not deployed' % testfile)
+
+            # Deploying again while the target still has this directory NFS-mounted live must still succeed.
+            result = runCmd(deploy_cmd)
+            self.assertEqual(result.status, 0)
+
+
 class DevtoolBuildImageTests(DevtoolBase):
 
     def test_devtool_build_image(self):
-- 
2.55.0


