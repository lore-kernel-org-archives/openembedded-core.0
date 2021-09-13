Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.183.1631554519347353084
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 10:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pF4wL5PW;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: pgowda.cve@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id c4so4771403pls.6
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 10:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G5uDmq1pGEYLBX4i/O/cH1dhK22RFkDa/ivsxlfWm1M=;
        b=pF4wL5PWgSJ9zMR9o20mLmDDUufpz64CS7skkGhh1F6vlLJXJgVfLZt6EjEXsUfpe2
         mpxVbb9JGkzl8e0v3CNIWkDzcJYEiJKZyru9lokkJVkGQvG/JyJFbPx7zzo8Q8wfNWcH
         iobFpZYLbbukKkxrpd782rrH4xiFFNzMP9bEUz95w8Q/i710CyQCxALV99JWrm1lIvjM
         uQu36w1u4nwLRx3k11Rg9rxcsgzK8mB+Ro1xkk5wGQrxquwY9pDK0Pgu0Cya6G28l5xc
         2oX+QTqpNbYUf4uo7mdDbio3ZkKndkfLsSXOMDQLboDdeIDp3IDaDeVjHcqRpdE6o4ms
         21+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G5uDmq1pGEYLBX4i/O/cH1dhK22RFkDa/ivsxlfWm1M=;
        b=40wjtnh3ge9dizexjJQYTm4QFiLn6M4flB4gaPhZ/y1I5BeAy8rPC6aSkBmD/eHVSA
         pVyqNj+oLePTZbq8sQfGzZ/h/J3diVDmNV0/0G0xw6FheDBNzLeMsxMUoLpMHE4Se+EW
         f4Dehb0YAe3EgTkQqnfytgWoAvtdW6axQxq+MUYEspWppETO01GNedNQRBeNv6uutdZl
         /Yt6QJD/5ohqdGD9aceSbJ161YtAQI7okNMGj2poZWi+F4mjTRP9Wy41wUXiw4eVQJks
         V3cEuoLOsldH0ep/RAdZ9nlTGZDBICMoRk4+6NJlJ4KHnIJgnRFaOTsbFsvPoSFJ7Wwh
         Vt6g==
X-Gm-Message-State: AOAM532a0spoDPQLQoYpalImLmBZd3a/blEOLcx9hYGsgSMGrP4fkM8N
	s2wbWFHV7EmH8SHdBU3YJlRAfZ62PicWvw==
X-Google-Smtp-Source: ABdhPJyadiSjEQNCfyK5wrDH8G2TtD3IdwOeGeEyaZPGKamR6fzyuir8G1SVKaMTXRWK3TjQZq+cQQ==
X-Received: by 2002:a17:902:8543:b029:12d:461f:a6a8 with SMTP id d3-20020a1709028543b029012d461fa6a8mr11446293plo.1.1631554518626;
        Mon, 13 Sep 2021 10:35:18 -0700 (PDT)
Return-Path: <pgowda.cve@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id t68sm8988337pgc.59.2021.09.13.10.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 10:35:18 -0700 (PDT)
From: pgowda.cve@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.m.engg@gmail.com,
	alex.kanavin@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [PATCH 1/4] Rust oe-selftest script
Date: Mon, 13 Sep 2021 10:35:10 -0700
Message-Id: <20210913173513.176653-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file builds remote-test-server and executes rust testing
remotely using background ssh. It adds the necessary test environment
and variables to run the rust oe-selftest.

Print the results in case of failure of runCmd().

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 54 ++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/rust.py

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
new file mode 100644
index 0000000000..4ebb9045f4
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -0,0 +1,54 @@
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
+#		with runqemu("core-image-minimal", runqemuparams = "nographic") as qemu:
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

