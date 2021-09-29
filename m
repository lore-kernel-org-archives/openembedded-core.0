Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AAFC433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 08:04:57 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.5879.1632902694105210233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 01:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MAkBSJZH;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id s75so1891196pgs.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 01:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ucs6WvaGJsUgGy1bEiQf7iaQ2x2va8VOE3z8KNvz4ng=;
        b=MAkBSJZH0V8nJTxwonb+bmMorIuuhPwMXIkz7NWcFn8LTKRLq88Pl8KyuLYRLdp4RU
         vU9BuAutRYwDMKeNNGqOhKv2c5VTXiCwVpoOQRsB1vhwhCIhCyfR+kj5ckcwdHwsjdhW
         S7XNb5fr8di1gJcJGkJyg/QrkZmurFIrx4yHWmWiEULcVJm3KDEAoGpn2qum+cteNQ25
         bk8MmDoySWOP1qteHBEZzkqtESyR3MruxKFxv+JentUTLs/y6niBpILb6IiVNXpG77Nk
         4ceGMHE5EivpJLvgDrOq3fDYvObijvOvQ58Sqfp6Ag3UoE5DtWroqZvQzSMSZa8w7V8d
         l4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ucs6WvaGJsUgGy1bEiQf7iaQ2x2va8VOE3z8KNvz4ng=;
        b=17ULKJ07kF7gLh5rcOgAeDo6vk8QT0TXef7mnG12OTQ9TCUU9cWb67IYCITLyAweB4
         eUkIi4uJh+uoJEaL5nx3vVZ9WfGBIcNP32EgKHTu2kpjDfOndoedd58BLhGAnbz/BabQ
         mTGyH6j61WquwNI9xb7ch1JIl4p7LUK3/GDQLUC9XOMpsKz9kmfSqknH1y6trImFK6CC
         F/6uFwMfEXtRAUBuuGQK/rVhkjwP8dKXDdXcpcRn3CXlglkClxPwStwP7PVSI6JFnSDY
         kbzNDFKcz1x0MznewCsXtI7wL+fiVEDbmvoPFntyLie2G5VF8TCSTPhmUvkCBgkejp9U
         RBCw==
X-Gm-Message-State: AOAM532YTzBfQFrWCRHwQDSbpXKXTRUeEECrNvPu5RHP6/RTuTFwyznl
	dbtYTcvtrehM7WbGCzyCIceceP2MEvY=
X-Google-Smtp-Source: 
 ABdhPJwCzdu/7uRwXPi+twa3PWLqpbyPl0qv8Zs1RzBDhXdmZ9GHeVH/Aron9a/HCGO+AP1zckjMww==
X-Received: by 2002:a63:9a01:: with SMTP id o1mr8399510pge.441.1632902693462;
        Wed, 29 Sep 2021 01:04:53 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 cq21sm1075081pjb.10.2021.09.29.01.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 01:04:52 -0700 (PDT)
From: Pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	alex.kanavin@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.m.engg@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [PATCH v2 1/3] Rust oe-selftest script
Date: Wed, 29 Sep 2021 01:04:46 -0700
Message-Id: <20210929080448.16224-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 08:04:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156448

The file builds remote-test-server and executes rust testing
remotely using background ssh. It adds the necessary test environment
and variables to run the rust oe-selftest.

Print the results in case of failure of runCmd().

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 53 ++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/rust.py

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
new file mode 100644
index 0000000000..7978758221
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: MIT
+import os
+import subprocess
+from oeqa.core.decorator import OETestTag
+from oeqa.core.case import OEPTestResultTestCase
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu, Command
+from oeqa.utils.sshcontrol import SSHControl
+
+# Total time taken for testing is of about 2hr 20min, with PARALLEL_MAKE set to 40 number of jobs.
+class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
+
+	def run_check_emulated(self, *args, **kwargs):
+		# build remote-test-server before image build
+		recipe = "rust-testsuite"
+		bitbake("{} -c compile".format(recipe))
+		builddir = get_bb_var("B", "rust-testsuite")
+		# build core-image-minimal with required packages
+		default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
+		features = []
+		features.append('IMAGE_FEATURES += "ssh-server-openssh"')
+		features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
+		self.write_config("\n".join(features))
+		bitbake("core-image-minimal")
+		# wrap the execution with a qemu instance
+		with runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams = "-m 512") as qemu:
+			# Copy remote-test-server to image through scp
+			ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user="root")
+			ssh.copy_to(builddir + "/" + "build/x86_64-unknown-linux-gnu/stage1-tools-bin/remote-test-server","~/")
+			# Execute remote-test-server on image through background ssh
+			command = '~/remote-test-server -v remote'
+			sshrun=subprocess.Popen(("ssh", '-o',  'UserKnownHostsFile=/dev/null', '-o',  'StrictHostKeyChecking=no', '-f', "root@%s" % qemu.ip, command),
+                                shell=False,
+                                stdout=subprocess.PIPE,
+                                stderr=subprocess.PIPE)
+			# Get the values of variables.
+			targetsys = get_bb_var("TARGET_SYS", "rust-testsuite")
+			rustlibpath = get_bb_var("STAGING_LIBDIR_NATIVE", "rust-testsuite")
+			tmpdir = get_bb_var("TMPDIR", "rust-testsuite")
+			testargs = "--no-fail-fast --bless"
+			# Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hosttools.
+			cmd = " export PATH=%s/../bin:$PATH;" % rustlibpath
+			cmd = cmd + " export PATH=%s/../bin/%s:%s/hosttools:$PATH;" % (rustlibpath, targetsys, tmpdir)
+			cmd = cmd + " export RUST_TARGET_PATH=%s/rustlib;" % rustlibpath
+			# Trigger testing.
+			cmd = cmd + " export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
+			cmd = cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test %s --target %s ;" % (builddir, testargs, targetsys)
+			result = runCmd(cmd)
+
+@OETestTag("toolchain-system")
+class RustSelfTestSystemEmulated(RustSelfTestBase):
+	def test_rust(self):
+		self.run_check_emulated("rust")
-- 
2.31.1


