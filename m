Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web12.10065.1622217203577340611
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 08:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K374iIl3;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id b25so4658096iot.5
        for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 08:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tXBgAsw6tH8Haz4zrnG5CXL95GWB0jT7RqMPLcQHF90=;
        b=K374iIl3HeJvfrX2ZHTNILTalXaISM2+lnCymbH1vNdUV8938LZYPY+dUCCXpQfPG9
         5QCy5Qgn7MViO8Q85RW6C7tsdhw0GzAtVL7uIB+wy8uZA0VfB588a9MTYVrLKRQmQTvX
         i7VgS87C15nOmLyVk55VSMbu08crBMQsOUHXDmVcljeE24v/4uC133W69J4kcMX+xCam
         t0nyWevmax50jZaSQwNkQLO98sYXmDudSr4iLJMuabCK+ve6fcpPOIJEtc/TM/fLahhc
         muGftx3f49cAeXjSXqdNO11FV70qKI3LxaOwqoDxjZNg4BvkhP+FOUz9Bl3d8Ab2jhll
         A9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tXBgAsw6tH8Haz4zrnG5CXL95GWB0jT7RqMPLcQHF90=;
        b=jj2I8w3RWjgRLAJHYjb6MypH5nr19zFXoHwyIcKGTZbUo+kysIHomqOR2MVDA9Rp+S
         FYMpNYEklpZ0JpKZg524SXSI3P3ZEXU+GI6Q8CirEGNdZZbmQSq/EBLTN8GR9Pe9ztC7
         mItOn9/nGdqCnfuTtjl3a9x6Ts09OQxsBHUE6Gu4jHSsW751qdaBgvuZm/rncIvT7N8F
         TEn/KgofxjqniYSPUCBSFUCP6cZ1ocZ2/7PSiwr5xivOKnqwCyh/sugjK5Yhr9E7/Re0
         oCIddNHXiRstJUSBFob8Llf5SWWT9d3895Hw7wA7PhPnCHEKOZC4MLdL0UZaiYotybDc
         a+EA==
X-Gm-Message-State: AOAM532Ifv5dxm8SkKlTnljZJl3r19neMetWrERvcUePxKChwKRHOmyR
	1zDxq8oBR6zh7nifehb4OV+v4fLLA/GGF4nH
X-Google-Smtp-Source: ABdhPJy66PAsPenmqMR2n93UkYPhR5DUz1URaQk9jXQSm29stIlZL93sNLDS7bdKPSl41cuuIyg1Zw==
X-Received: by 2002:a02:5b85:: with SMTP id g127mr9494436jab.80.1622217202603;
        Fri, 28 May 2021 08:53:22 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id z8sm3367965ilq.30.2021.05.28.08.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 08:53:22 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v6 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
Date: Fri, 28 May 2021 08:53:07 -0700
Message-Id: <20210528155308.354567-4-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210528155308.354567-1-vinay.m.engg@gmail.com>
References: <CANNYZj_RNDuTY2+dMuQBAByh_01Yj7_nWwwv2iO_sU-r+qvw_Q@mail.gmail.com>
 <20210528155308.354567-1-vinay.m.engg@gmail.com>

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
index 0000000000..19206e7b07
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
+			cmd = cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test codegen %s --target %s ;" % (builddir, testargs, targetsys)
+			result = runCmd(cmd)
+
+@OETestTag("toolchain-system")
+class RustSelfTestSystemEmulated(RustSelfTestBase):
+	def test_rust(self):
+		self.run_check_emulated("rust")
-- 
2.17.1

