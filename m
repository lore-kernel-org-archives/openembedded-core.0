Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.19689.1622285896456075931
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 03:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RvMxE/eh;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id a6so6901530ioe.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 03:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6R+LMwqYDJ21zYwCl+6UWaYSntS2RTcaRI3dme6jeTM=;
        b=RvMxE/ehqPiEavhdZhr25lnn1rE3mTpEw8qGwVJqMGAM2y42+EB50VA2o00ufV2LzO
         t1e+2vSKcRP1bsm4jYkBj9Y5jIC/Zrw/BHQ8BipLGbdZnDJo9wVMWtujz6NlWxMSWT0e
         lkeBrE7jKCOVwY0aNg0kuLFUyCd3rkzd8TZILa2McLsmtgXcSuhp3dUC1LSX/MxhOA+M
         O+Kn+LhQorOcCD11iVje7ElQRfNu7A6YZT/rxoKmM03QbETuWOCqtTT8BIUtuYFiojse
         8fKmEKWRUDI/VWJVPJRW5Zu8GZwqy5Yj0O+c6yDyCz1NhYL/mrwodcghwq+p4hu9mjoW
         F89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6R+LMwqYDJ21zYwCl+6UWaYSntS2RTcaRI3dme6jeTM=;
        b=WnCGCHmUxkrZOSvLgyMD+NTpY4cZsESteYA0iaTP1yyDYPBAV2iKcmd2euWFiSkZWb
         mI4mp9rx+rzLZNL8SnfEw9B4YC+QTXJ4kZwSuBLQ+LdThfQHr9dDmcyd/4+ZxarisPDE
         NBvDUZo4OYex+EdeqyUcmlUFpZu+Ujq+XIcHoY/wobI+dQwIB0wD0qnYOZObO4F5MSU9
         KILoD6bE40BZ17kPv+wuE85I4//3sEyDtM0w6t83JUcFE1CJ/DU9FEiOQRvYuq6sb8Rn
         LtYAjory5TYgkGQdcSnziOfFlHBxA0krTL9ppXw57Kcszdfyt0jKVa9bR5Ctj79ioqeY
         GqcA==
X-Gm-Message-State: AOAM531K3huh+ysffhk+/pluf+FkvJLtw/y1YECMfMh354gwN+seuWLH
	8U6G0PndU186Gi5NctenMuq3gYxAanLJ7HLw
X-Google-Smtp-Source: ABdhPJzWsn0m/Vs7hNzf/rIeZ10aF4aaSmARA+F2IeaJNXLeaa+3S0F5SwfTyCMYHhCpnY9u7w4BLA==
X-Received: by 2002:a02:a316:: with SMTP id q22mr12246632jai.26.1622285895496;
        Sat, 29 May 2021 03:58:15 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id o5sm4441174ilm.78.2021.05.29.03.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 03:58:14 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v8 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
Date: Sat, 29 May 2021 03:57:48 -0700
Message-Id: <20210529105749.3017489-4-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210529105749.3017489-1-vinay.m.engg@gmail.com>
References: <CANNYZj8i1D15ePeor45k2Mpec3vq7y6PSU8+ynLvSzRdnfL1Hg@mail.gmail.com>
 <20210529105749.3017489-1-vinay.m.engg@gmail.com>

Build remote-test-server copy to image and execute
remotely through background ssh.

Execute rust testing by exporting required paths.
And capture the output in result.output

Print the results in case of failure of runCmd().

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 53 ++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/rust.py

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
new file mode 100644
index 0000000000..ee61216e02
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

