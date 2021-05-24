Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web08.26419.1621876577869493580
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 10:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WE3MRyFd;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id a8so20462174ioa.12
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 10:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Fr4BFThJakNdNbN8xOjMAzJGoDPrVNgWdgiee7wURTU=;
        b=WE3MRyFdw7Mf8XEYq+BGBfma+8k6I1TcvNRZIk31CfKLHoOjzwyVNAqI/E553zjEYL
         mGty3y9uKRLF2Twceu+6xx5DpHFXk/fv3dX224PGT+NqyV8n3GPj5Ew+eBuh0V9ppfM5
         a/oaiB8gPGHNc2F8O9JfnZF1Zv5ArCSLLPziOLKaxJJti17agzRJDPO4MWJBOWdS4QYC
         XRIaEIFKL/dkD5CBJlBl60dqgq+/8m9u5Y/Of2zjvtz6EJVmoTzmoLv+Jwg2Eu9iat00
         kTx/tfK/84ortqWRtk4ZcRWipwmpJDaXMuLr/IF9BrZazILVnzfaD8ptWk6aCeOA7/Bu
         aZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Fr4BFThJakNdNbN8xOjMAzJGoDPrVNgWdgiee7wURTU=;
        b=IVw98ghuDQEDlOeRQNgfmumYrqNRQHiV/4JiAplFu76ZAd1syUezjp50nE3/7Ea7k6
         AU3+KHMJz/9YW6pCYWEV72MN0VUSQVQewEc/VZlr0CR9X8r7vdKFog1vUYDfquD+Fy7p
         zwsx/RuVuL6BU5mfPeVKyOTTBULHpHSdiXycL1/gTiLJ42yON2PRrOAo5RE0uHwEIK6N
         4/IzsOsVJRMV1JgDskP6V+EHVZMkUlw9foNJzqaIjsmOBRj2FS9RbRqrQ1tOAgtf+Nsr
         Ym9mHfXRh+Tn2IbIRTVE4POxL7AqKvmRhPlxyPOvIH3cnwLW3wa1bNIq5YKXOidf2dzE
         vlLA==
X-Gm-Message-State: AOAM531R1xNrrlWS9MUM19lmHH69wIm5HO7EeqWnf3lV3FvfTeMfLqPO
	OCXuHKqMfk7dvnSLmHl0xtHZFkJMJBsCP6O8
X-Google-Smtp-Source: ABdhPJxg7749E2xBZpoTZTtCuYE7VwIhjQ2TJYgZoVR8wFcbiv+O5vvgg48U9zJm8ir8Md7Ueee+7Q==
X-Received: by 2002:a6b:e817:: with SMTP id f23mr15097846ioh.183.1621876576842;
        Mon, 24 May 2021 10:16:16 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id j2sm11424103ioj.20.2021.05.24.10.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 10:16:16 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v4 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
Date: Mon, 24 May 2021 10:15:58 -0700
Message-Id: <20210524171559.190239-4-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210524171559.190239-1-vinay.m.engg@gmail.com>
References: <CANNYZj-v-hcO19SSkYgYKSeOBj7f1u4zvSRkfcx5UAm=ndye_A@mail.gmail.com>
 <20210524171559.190239-1-vinay.m.engg@gmail.com>

Build remote-test-server copy to image and execute
remotely through background ssh.

Execute rust testing by exporting required paths. Capturing
test results in summary.txt at rust source folder.

We are booting qemuimage in "nographic" mode along with additional
qemuparams,
'-monitor telnet:127.0.0.1:1234,server,nowait -serial mon:stdio -serial null'

Note:
'-serial mon:stdio -serial': To fix below run-time errors while testing
"failed with Connection reset by peer"

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 51 ++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/rust.py

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
new file mode 100644
index 0000000000..398fb35ccb
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: MIT
+import os
+from oeqa.core.decorator import OETestTag
+from oeqa.core.case import OEPTestResultTestCase
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu, Command
+from oeqa.utils.sshcontrol import SSHControl
+import threading
+
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
+		with runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams= " -monitor \
+                        telnet:127.0.0.1:1234,server,nowait -serial mon:stdio -serial null") as qemu:
+			#Copy remote-test-server through scp and execute through background ssh
+			ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user="root", timeout=600)
+			ssh.copy_to(builddir + "/" + "build/x86_64-unknown-linux-gnu/stage2-tools-bin/remote-test-server","~/")
+			t_thread = threading.Thread(target=ssh.run, args=("~/remote-test-server -v remote",))
+			t_thread.start()
+			# Get the values of variables.
+			targetsys = get_bb_var("TARGET_SYS", "rust-testsuite")
+			rustlibpath = get_bb_var("STAGING_LIBDIR_NATIVE", "rust-testsuite")
+			tmpdir = get_bb_var("TMPDIR", "rust-testsuite")
+			testargs = "--no-fail-fast --bless"
+			# Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hosttools.                        
+			cmd = "export PATH=%s/../bin:$PATH;" % rustlibpath
+			cmd = cmd + " export PATH=%s/../bin/%s:%s/hosttools:$PATH;" % (rustlibpath, targetsys, tmpdir) 
+			cmd = cmd + " export RUST_TARGET_PATH=%s/rustlib;" % rustlibpath
+			# Trigger testing.                        
+			cmd = cmd + " export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
+			cmd = cmd + " cd %s;  python3 src/bootstrap/bootstrap.py -j 40 --verbose test %s --target %s > summary.txt 2> /dev/null " % (builddir, testargs, targetsys)
+			runCmd(cmd)                        
+			# Stop ssh background execution
+			t_thread.stop()
+
+@OETestTag("toolchain-system")
+class RustSelfTestSystemEmulated(RustSelfTestBase):
+	def test_rust(self):
+		self.run_check_emulated("rust")
-- 
2.17.1

