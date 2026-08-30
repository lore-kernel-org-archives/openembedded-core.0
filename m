Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C22C624D1
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 14:29:56 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9427.1788100183422661276
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 07:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=liLJ6jB3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20260830142941347738eca1000207b3-3wxdyx@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260830142941347738eca1000207b3
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 16:29:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=QQsUOd5iJnjH6IUfwvWymw8iYFDcfzGw6O+x4sggBig=;
 b=liLJ6jB3vSizeZlAJ+MH2cnIjsw7r6ruBWpBQATQpOq3Me6rnyQjO6HhmXQWQNwo//pfyo
 895/bU0Y6IDKHx9a/KCcFJOomomhomnsca5wSVvWftCyj2+h+7bB/F/LeiZPpC6Km0hXJC3r
 5N0s5ou/AAYRvfQ988xiZic2VVsJQjqZf79eT2z7K4nLV94LzXXdzK3cB1mbI4DyUR5nxYpb
 kEyaPysvGnUKjPSyM6oCInPGnf7i+4T/CI/dM5tZxWLD+qmVPrkDk7/pjUQ9G39uznebUyqy
 JxBiu9/Utt/JIFUZKKC2mIPvn/JbIz3oOtoWD5vq6OGrfeXx4uMC5hJg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 10/24] oe-selftest: devtool ide-sdk: add slirp networking test
Date: Sun, 30 Aug 2026 16:28:37 +0200
Message-ID: <20260830142922.17241-11-adrian.freihofer@siemens.com>
In-Reply-To: <20260830142922.17241-1-adrian.freihofer@siemens.com>
References: <20260830142922.17241-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 14:29:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244661

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add test_devtool_ide_sdk_none_qemu_slirp which verifies the complete
devtool ide-sdk workflow using runqemu slirp networking instead of TAP
devices.

The test checks that:
  - update_qb_slirp_opt() writes QB_SLIRP_OPT (including the SSH
    hostfwd entry) to the image workspace bbappend before the build.
  - The image boots in runqemu slirp mode (no TAP device setup needed).
  - devtool deploy-target successfully reaches the target via the slirp
    SSH port forward (localhost:2222 by default).
  - The full edit/compile/deploy/verify cycle works over the slirp
    connection, just as it does in the TAP-based tests.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 50 +++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 1ecf4c24f5..c18b94ab5a 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3864,6 +3864,56 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
             # Verify deployment and remote debugging works
             self._verify_launch_json_debugging(tempdir, qemu, example_exe)
 
+    @OETestTag("runqemu")
+    def test_devtool_ide_sdk_none_qemu_slirp(self):
+        """Verify devtool ide-sdk works with runqemu slirp networking.
+
+        Slirp mode uses SSH port forwarding (default: localhost:2222 -> guest:22).
+        This test checks that:
+          - update_qb_slirp_opt() writes the QB_SLIRP_OPT host-forwarding
+            entries to the image workspace bbappend before the build.
+          - runqemu boots the image in slirp mode.
+          - devtool deploy-target reaches the target via localhost:2222.
+        """
+        recipe_name = "cmake-example"
+        build_file = "CMakeLists.txt"
+        testimage = "oe-selftest-image"
+
+        self._check_workspace()
+        self._write_bb_config()
+
+        # devtool modify and build image; QB_SLIRP_OPT is written to the bbappend.
+        tempdir = self._devtool_ide_sdk_recipe(recipe_name, build_file, None)
+        runCmd('devtool ide-sdk %s %s -c --ide=none' % (recipe_name, testimage),
+               output_log=self._cmd_logger)
+
+        # Verify QB_SLIRP_OPT was written to the workspace bbappend.
+        appends_dir = os.path.join(self.workspacedir, 'appends')
+        bbappend = os.path.join(appends_dir, testimage + '.bbappend')
+        self.assertExists(bbappend, 'Image bbappend not created at %s' % bbappend)
+        with open(bbappend) as f:
+            bbappend_content = f.read()
+        self.assertIn('QB_SLIRP_OPT', bbappend_content,
+                      'QB_SLIRP_OPT not written to image bbappend')
+        self.assertIn('hostfwd=tcp:127.0.0.1:2222-:22', bbappend_content,
+                      'SSH slirp port forward missing from QB_SLIRP_OPT')
+
+        with runqemu(testimage, runqemuparams="nographic slirp") as qemu:
+            slirp_host = qemu.ip
+            slirp_port = qemu.port or '2222'
+
+            # Re-run ide-sdk with the actual slirp address; image is already built.
+            bitbake_sdk_cmd = (
+                'devtool ide-sdk %s %s -t root@%s -P %s --skip-bitbake --ide=none'
+                % (recipe_name, testimage, slirp_host, slirp_port))
+            runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
+
+            self._gdb_cross()
+            compile_cmd = self._verify_cmake_preset(tempdir)
+            self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name,
+                                        recipe_name, compile_cmd)
+
+
 class DevtoolIdeSdkKernelTests(DevtoolIdeSdkTests):
 
     @OETestTag("runqemu")
-- 
2.55.0


