Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web09.4105.1622103098503227296
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 01:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JfPWsD3E;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id u3so663774ilv.8
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 01:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hJQ3fBINYHq+6VjuA0591puQMPo0WVCL6BMpIYI+mDY=;
        b=JfPWsD3EasK3xICeAGWPJEE3rALL++IGLZHWMC2hoXWaJA5oWIHj4TajAdu/kxBql3
         3DjhWGbeFxQb1Qo5YcjOy6zSg+qG9sPy81oNtgGFRf2JlE6I+bdk2SwbmIrzbAvxU4BE
         82EzOOHwsUHgijcrXEIGiPlUW6Eozos11eOvwQ3gcwBx4h03/L8WXeUoSkyCBCD0FlH7
         HaPv/hcvo6xNTGMlV4+fejumKoOOrNfX7EHpUi6bMT21YwggO6W/Ui8U8heg4i4htYvj
         PZ04MBjZqQy4v2dYqozfLW9FJdthiFt0G+of4PPLD0Cak6V07ksi/C+8g967Cxs+TpJR
         NCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hJQ3fBINYHq+6VjuA0591puQMPo0WVCL6BMpIYI+mDY=;
        b=CqvQ7UUXZKS/yZM6dTuLi/goiy7ppGnccPEqwKT3UX7WMHRDpK2FRbquGLm6abX7Ww
         CLVYGXWSh6U4jslt1Co3/hJHHeP/DaPXe39hun35fuhRDj8QhvG7JRDc/50ja/FsZr+a
         F9HzfB9HlLh57mj5J8Gp7mWc+S2b9QFNoPcpExrHFKbn2tLxA5sP/vlRuVNnMvdWZJhJ
         oGeWSd9LjNgAPahVieZamQxYd4TZ1DXDOHXV4dxJSNKA25hCdpr9+rVbYiMtnVkUo9iw
         prYq4BlSjGwDIx+t1PjcaT3Jxm9MM1ex9q4tmjL+rg1tZRfbDEQVEOzXld+sCJ6VJEus
         g7Cg==
X-Gm-Message-State: AOAM5317tftq6O0bRyRveLViNzmzR0QpPHyMmLqZI41RU0LkbzjvTIom
	D4BiMzXrjkyavjljnLOQuBMjICd2VANBmSst
X-Google-Smtp-Source: ABdhPJxkmkrGITylDl9VRQ/0Y1Am6RPSGZpp/fG9K3n6pzkbonkWbMOtsAr4XT3ktcGvI3gc2n/oZQ==
X-Received: by 2002:a92:cd85:: with SMTP id r5mr1986979ilb.294.1622103097492;
        Thu, 27 May 2021 01:11:37 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id p2sm804981ilp.17.2021.05.27.01.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 01:11:36 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v5 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
Date: Thu, 27 May 2021 01:10:59 -0700
Message-Id: <20210527081100.1213973-4-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210527081100.1213973-1-vinay.m.engg@gmail.com>
References: <CANUMPcVo=iH43q+70zHnsm5ktJR4D4AO+KZEzj8=0AQNaYFv0w@mail.gmail.com>
 <20210527081100.1213973-1-vinay.m.engg@gmail.com>

Build remote-test-server copy to image and execute
remotely through background ssh.

Execute rust testing by exporting required paths. Capturing
test results in summary.txt at rust source folder.

Kill "remote-test-server" on the image through ssh,
once testing is completed.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 50 ++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/rust.py

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
new file mode 100644
index 0000000000..066a28c046
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: MIT
+import os
+from oeqa.core.decorator import OETestTag
+from oeqa.core.case import OEPTestResultTestCase
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu, Command
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
+			#Copy remote-test-server through scp and execute through background ssh
+			sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR'
+			cmd = "scp %s %s/build/x86_64-unknown-linux-gnu/stage2-tools-bin/remote-test-server root@%s:~/ ;" % (sshargs, builddir, qemu.ip)
+			testcommand = '~/remote-test-server -v remote'
+			cmd = cmd + "ssh %s -f root@%s \"%s\";" % (sshargs, qemu.ip, testcommand)
+			# Get the values of variables.
+			targetsys = get_bb_var("TARGET_SYS", "rust-testsuite")
+			rustlibpath = get_bb_var("STAGING_LIBDIR_NATIVE", "rust-testsuite")
+			tmpdir = get_bb_var("TMPDIR", "rust-testsuite")
+			testargs = "--no-fail-fast --bless"
+			# Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hosttools.                        
+			cmd = cmd + " export PATH=%s/../bin:$PATH;" % rustlibpath
+			cmd = cmd + " export PATH=%s/../bin/%s:%s/hosttools:$PATH;" % (rustlibpath, targetsys, tmpdir) 
+			cmd = cmd + " export RUST_TARGET_PATH=%s/rustlib;" % rustlibpath
+			# Trigger testing.                        
+			cmd = cmd + " export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
+			cmd = cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test %s --target %s > summary.txt 2>&1;" % (builddir, testargs, targetsys)
+			# To kill remote-test-server executing through background ssh
+			killcommand = "kill -9 \$(ps | grep remote-test-server |  grep -v \"grep\" | awk '{print \$1}')"
+			cmd = cmd + "ssh %s root@%s \"%s\";" % (sshargs, qemu.ip, killcommand)
+			result = runCmd(cmd)
+			self.assertEqual(0, result.status, 'oe-selftest returned a non 0 status:%s' % result.output)                        
+
+@OETestTag("toolchain-system")
+class RustSelfTestSystemEmulated(RustSelfTestBase):
+	def test_rust(self):
+		self.run_check_emulated("rust")
-- 
2.17.1

