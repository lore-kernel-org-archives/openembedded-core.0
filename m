Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web09.10461.1622218160560838418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 09:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OQ6QiJ8W;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id d25so4725942ioe.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 09:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9IZspf17XaUlWpbI2vj/vitrl1kTDpbI+BevZAO05O0=;
        b=OQ6QiJ8WpthaF1hkBQGID/vix566fA8TpqwnjNo1Au9vMCv6wPUkAy8S4gG+VInQQW
         cIxERsbo3NqfvY88fHUFqfCRt+5VKeCur16cfOjnVWbdyObG/oPFPUW3wtpyZk97Bu37
         uGTmyVhkytvmr6JQmcBgH6dVIEKxuE5IcgZtp3E09XRrifd+h8P4WxAaN5olE7HVScf1
         U/8MPK9eYKfaNd+KRNWJnvA5+FXEzpDNUVNpwntXlo0Thci0VamVNp9DZ6YYdFD00Suz
         j8nFzzC+4y3Vu1P0e7ImF4IQDgUSODiGAT8QlapkzQHOpwwt2Y86AP9YRdKYdAK0Re0W
         VagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9IZspf17XaUlWpbI2vj/vitrl1kTDpbI+BevZAO05O0=;
        b=B6YMUmJ1KCZIXpy+y9cJqeKZFuZ69lPbL9DnaKMY4ocexNtsk4bILC+g6PQ6Um5RgY
         Adab4VzAzsHl9vlMDdYcMPW0QaR/JEsObjSB9WtiVrae4Fta10F0/r7S5KpG+6jZ6/+P
         nqvjS8HjhZFY1jHg630iLmhQG/vFRWRbPjGCJf/I0rNDfcIvEwEvBKJP7oL0ctjmtm/q
         fTMivv5YRHQrpndFzC8xKYFKaPXIGAdOttIfzXOMcXow+aOrUw4oEh1PZyI2L1Yc3r9y
         coFSPVku/H+N5+KiT069xk6noBG+rtVsqIaAoht5D+HZQlEDRXYu8VWNNOBcv6fzOffb
         MLNQ==
X-Gm-Message-State: AOAM531RnhaR2ZL02cDUbT+PPbHbtwouOjqH1uh1CO4HRg6XWTqZ9ecp
	b5QNmSI5um8LwJXhigMhDrv36OazJCzdVCxQ
X-Google-Smtp-Source: ABdhPJy1PILU9oNUBJZ/tZv2Ws0r1LK7Zsq16WbLGDQma6MHlFk/Fa4+zZL2iAAmRkIe0XirrCHWYw==
X-Received: by 2002:a05:6602:158a:: with SMTP id e10mr7577144iow.137.1622218159555;
        Fri, 28 May 2021 09:09:19 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id l21sm2975022iol.22.2021.05.28.09.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 09:09:19 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v7 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
Date: Fri, 28 May 2021 09:09:07 -0700
Message-Id: <20210528160908.394290-4-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210528160908.394290-1-vinay.m.engg@gmail.com>
References: <CANNYZj_RNDuTY2+dMuQBAByh_01Yj7_nWwwv2iO_sU-r+qvw_Q@mail.gmail.com>
 <20210528160908.394290-1-vinay.m.engg@gmail.com>

Build remote-test-server copy to image and execute
remotely through background ssh.

Execute rust testing by exporting required paths.
And capture the output in result.output

Print the results in case of failure of runCmd().

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 52 ++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/rust.py

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
new file mode 100644
index 0000000000..8643d8120d
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: MIT
+import os
+import subprocess
+from oeqa.core.decorator import OETestTag
+from oeqa.core.case import OEPTestResultTestCase
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu, Command
+from oeqa.utils.sshcontrol import SSHControl
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
+		with runqemu("core-image-minimal", runqemuparams = "nographic") as qemu:
+			# Copy remote-test-server to image through scp
+			ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user="root")
+			ssh.copy_to(builddir + "/" + "build/x86_64-unknown-linux-gnu/stage2-tools-bin/remote-test-server","~/")
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
2.17.1

