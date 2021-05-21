Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web09.8839.1621603774461471116
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 May 2021 06:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SM1qX8Xo;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id t11so20071430iol.9
        for <openembedded-core@lists.openembedded.org>; Fri, 21 May 2021 06:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=esCtvyLCQ7KqSvRyTJi/EM3zQtCd69bXk2np3agsmcc=;
        b=SM1qX8Xok3YMrSHfgnmj970OVE2TfqOQXFxxQrzQhyut3rMteA16RolqyWRcoMqVew
         vs7Ge2qi2cF0Z905LOFgIwgrI6cIpE/Ruiy1w6me3zi67/KgMav84TJ9lApTi5jTb9jN
         DHxSKGkQPPMvqVWXkv0L2Laaiadu59st5bE7zBPr6qhMmZ37ILsU8BKA3A7prnp8ZkCv
         JNqdvKi+6NATEhOSjUXI1AtUOgP8fbgLXQvpuuzswrQciiFzrVB8O6ymi9/Km1BC4y9R
         bR1nZia9zc/QmGmDaNcSHtKyYCelt/QOiZcWRXczjF+OA+X7+MkwpcJF90v+JwEtGzPf
         5sMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=esCtvyLCQ7KqSvRyTJi/EM3zQtCd69bXk2np3agsmcc=;
        b=UnSM1W11Wsbkjhtf9palKBnMVJc7sz6zl4LqVBcZiJitytewCdztPm7m2UOZWOojs/
         j1TyzPUAFaB61BzD62b54o8SqfR5qUzYBkKHDvH8uEl/XL9lWXEFGPxb2UcHubE9yXBg
         193abpvfY5MkCZIV9LPSi5BnYocb5jp3uc0mggXP/BrufvUVH3Ljxq8CUvDjCtF0rM3S
         q74al/S8nbQTX/OuRbRiu7ntOmUwWLI3Nix7dVvZIwBSAvqMUXOb45ruVMchUv+yqYm/
         H6zHP5h3Jd8yb7OU3r2hNz2SvoU0FxcbboRb/+5onOmTvrhR61vf8HWNblZ75uHApz3f
         MMUg==
X-Gm-Message-State: AOAM533A1t6/bJtaIqCcl/YF26yv8e0kyOTkUtBOdtU4E8oM9LHZJBxq
	QK+gdkcgmYcxIshWsMQPD20KoMzN08Wm6rs8
X-Google-Smtp-Source: ABdhPJw0CryS/pRtWug3ugxBXsTZ2bE5M6mPiLqjFP0to20rLamxcmjTqdO1UtcCBAiUURjLghZSTA==
X-Received: by 2002:a05:6602:121a:: with SMTP id y26mr10472581iot.168.1621603773526;
        Fri, 21 May 2021 06:29:33 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id f8sm1165202ilr.12.2021.05.21.06.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 06:29:32 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v3 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
Date: Fri, 21 May 2021 06:29:13 -0700
Message-Id: <20210521132914.140884-4-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210521132914.140884-1-vinay.m.engg@gmail.com>
References: <CANNYZj-yODhEEFErtUxBeiw3O1YvEfV-hGOOW_uPNvo6x8mNYQ@mail.gmail.com>
 <20210521132914.140884-1-vinay.m.engg@gmail.com>

Build remote-test-server copy to image and execute
remotely through background ssh. Execute testing
through do_check.

We are booting qemuimage in "nographic" mode along with additional
qemuparams,
'-monitor telnet:127.0.0.1:1234,server,nowait -serial mon:stdio -serial null'

Note:
'-serial mon:stdio -serial': To fix below run-time errors while testing
"failed with Connection reset by peer"

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 50 ++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/rust.py

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
new file mode 100644
index 0000000000..fc900d536f
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -0,0 +1,50 @@
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
+
+		# Get build directory path
+		builddir = get_bb_var("B", "rust-testsuite")
+
+		# build core-image-minimal with required packages
+		default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
+		features = []
+		features.append('IMAGE_FEATURES += "ssh-server-openssh"')
+		features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
+		self.write_config("\n".join(features))
+		bitbake("core-image-minimal")
+
+		# wrap the execution with a qemu instance
+		with runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams= " -monitor \
+                        telnet:127.0.0.1:1234,server,nowait -serial mon:stdio -serial null") as qemu:
+
+			# Copy remote-test-server through scp and execute through background ssh
+			ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user="root", timeout=600)
+			ssh.copy_to(builddir + "/" + "build/x86_64-unknown-linux-gnu/stage2-tools-bin/remote-test-server","~/")
+			t_thread = threading.Thread(target=ssh.run, args=("~/remote-test-server -v remote",))
+			t_thread.start()
+
+			# Set TEST_DEVICE_ADDR to image ip
+			cmd  = "export TEST_DEVICE_ADDR=%s:12345;" % qemu.ip
+			runCmd(cmd)
+
+                        # Test execution
+			bitbake("{} -c check".format(recipe))
+			# Stop ssh background execution
+			t_thread.stop()
+
+@OETestTag("toolchain-system")
+class RustSelfTestSystemEmulated(RustSelfTestBase):
+	def test_rust(self):
+		self.run_check_emulated("rust")
-- 
2.17.1

