Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 67E437F298
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 16:58:21 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id x15so9465133pgg.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 09:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=IZiGOC4ItMg6+/KO1K1kXtwKtQsQfKHjDdM3GSkpuTQ=;
	b=jWU9UQUCTOVoHUE0+pJvwXsaZmubdzKyEeGtP7HetYv5YiPqRjaHWYUkgy3exzlxcF
	7Awc81mFrDOo2IO01Sgt7s3Ib3YiN7ZtO5wkKogYrHParQyKUNghKWpCJb//BlOXTJIc
	T0oYAPFzywwFZLR7HjcBHPXvJ+CTOKTKCu0iWCLlFYv3NxDQ++t3220D684Ch1IATUOc
	jbT7tPJ/O3VrM+hu7DhdGS1DQKpSb+K8sZqvkTfzld0LPFYB2aLUntkF+tLIKKhRSDjS
	t5ZQzuMpikKik+bZc8994V0PN28yncvUpR2AZCfil4mwJNcDTDmPKCZx1NwQRNMVvmxb
	0sOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=IZiGOC4ItMg6+/KO1K1kXtwKtQsQfKHjDdM3GSkpuTQ=;
	b=kes05mPsekZYgCwl2ihvdHx7G5+jaupw6o32q0ecs9rreiAwupyyb5jrKye3O5xPpo
	QbRXv9IUxL3dPQuciibusUYDyrVeD2axc/FVsGOHuzkqQOU2nlMliibzbi28ummayiDe
	aZ7561TIUWa+FSUTwLbPn5uZQdQfZGk17mdM7/KCFJXTIisSonfMAAi0GAEsqI/Ki7jE
	HAlNnsHCRKygqRzQ5+uyapX+nN/wxgJSjfmUX7AYiUteVC6p7XbHbvDZQCIyrb2HYMle
	8+8Lf8htPIoNqoFJaVQt7Pbj7OsLkkjcorNT9WrhlndAp2Xq+BjNy4g9TG+XRUflMLQf
	k4Pw==
X-Gm-Message-State: APjAAAXFvjbcEk+vcwTKazwNZDwHZjj3rlPmOh3uJvmHDtK6YYZBr/R+
	es4cgZZFZG3bcQTxCgICGcK8tPlN7qXZxQ==
X-Google-Smtp-Source: APXvYqziv1fyNZIKfdkdfMNzivvL3BS8Ud0jo2sYKuGN1/O+OY5hW1yplpYJ7uYR4ozRgAZfSeJQDA==
X-Received: by 2002:a63:2a08:: with SMTP id q8mr30833356pgq.415.1567529901992; 
	Tue, 03 Sep 2019 09:58:21 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	m19sm76646pjv.9.2019.09.03.09.58.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 09:58:21 -0700 (PDT)
Date: Tue, 03 Sep 2019 16:56:41 +0000
Message-Id: <20190903165641.16597-12-nathan@nathanrossi.com>
In-Reply-To: <20190903165641.16597-0-nathan@nathanrossi.com>
References: <20190903165641.16597-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 12/12] oeqa/selftest/glibc: Create selftest case for glibc test suite
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Sep 2019 16:58:21 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Create a oeqa selftest test case to execute the glibc test suite and
report the results. The results are populated into the extraresults
variable of the test case which are written to testresults.json for
resulttool to analyse.

An additional subclass is created to separate the execution with qemu
linux-user and qemu system. The GlibcSelfTestSystemEmulated test case
handles setup of the target image, setup of and NFS server as well as
execution with runqemu.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
- Populate test results as ptestresults
- Rename BUILD_TEST_* to TOOLCHAIN_TEST_*
- Mark tests with 'machine' tag
---
 meta/lib/oeqa/selftest/cases/glibc.py | 97 +++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/glibc.py

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
new file mode 100644
index 0000000000..f836367094
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: MIT
+import os
+import contextlib
+from oeqa.core.decorator import OETestTag
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runqemu, Command
+from oeqa.utils.nfs import unfs_server
+
+def parse_values(content):
+    for i in content:
+        for v in ["PASS", "FAIL", "XPASS", "XFAIL", "UNRESOLVED", "UNSUPPORTED", "UNTESTED", "ERROR", "WARNING"]:
+            if i.startswith(v + ": "):
+                yield i[len(v) + 2:].strip(), v
+                break
+
+@OETestTag("machine")
+class GlibcSelfTest(OESelftestTestCase):
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+        if not hasattr(cls.tc, "extraresults"):
+            cls.tc.extraresults = {}
+
+        if "ptestresult.sections" not in cls.tc.extraresults:
+            cls.tc.extraresults["ptestresult.sections"] = {}
+
+    def test_glibc(self):
+        self.glibc_run_check()
+
+    def glibc_run_check(self, ssh = None):
+        # configure ssh target
+        features = []
+        if ssh is not None:
+            features.append('TOOLCHAIN_TEST_TARGET = "ssh"')
+            features.append('TOOLCHAIN_TEST_HOST = "{0}"'.format(ssh))
+            features.append('TOOLCHAIN_TEST_HOST_USER = "root"')
+            features.append('TOOLCHAIN_TEST_HOST_PORT = "22"')
+            # force single threaded test execution
+            features.append('EGLIBCPARALLELISM_task-check_pn-glibc-testsuite = "PARALLELMFLAGS="-j1""')
+        self.write_config("\n".join(features))
+
+        bitbake("glibc-testsuite -c check")
+
+        builddir = get_bb_var("B", "glibc-testsuite")
+
+        failed = 0
+        self.tc.extraresults["ptestresult.sections"]["glibc"] = {}
+        with open(os.path.join(builddir, "tests.sum"), "r") as f:
+            for test, result in parse_values(f):
+                self.tc.extraresults["ptestresult.glibc.{}".format(test)] = {"status" : result}
+                if result == "FAIL":
+                    self.logger.info("failed: '{}'".format(test))
+                    failed += 1
+        self.assertEqual(failed, 0)
+
+class GlibcSelfTestSystemEmulated(GlibcSelfTest):
+    default_installed_packages = [
+        "glibc-charmaps",
+        "libgcc",
+        "libstdc++",
+        "libatomic",
+        "libgomp",
+        "python3",
+        "python3-pexpect",
+        "nfs-utils",
+        ]
+
+    def glibc_run_check(self):
+        with contextlib.ExitStack() as s:
+            # use the base work dir, as the nfs mount, since the recipe directory may not exist
+            tmpdir = get_bb_var("BASE_WORKDIR")
+            nfsport, mountport = s.enter_context(unfs_server(tmpdir))
+
+            # build core-image-minimal with required packages
+            features = []
+            features.append('IMAGE_FEATURES += "ssh-server-openssh"')
+            features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(self.default_installed_packages)))
+            self.write_config("\n".join(features))
+            bitbake("core-image-minimal")
+
+            # start runqemu
+            qemu = s.enter_context(runqemu("core-image-minimal", runqemuparams = "nographic"))
+
+            # validate that SSH is working
+            status, _ = qemu.run("uname")
+            self.assertEqual(status, 0)
+
+            # setup nfs mount
+            if qemu.run("mkdir -p \"{0}\"".format(tmpdir))[0] != 0:
+                raise Exception("Failed to setup NFS mount directory on target")
+            mountcmd = "mount -o noac,nfsvers=3,port={0},udp,mountport={1} \"{2}:{3}\" \"{3}\"".format(nfsport, mountport, qemu.server_ip, tmpdir)
+            status, output = qemu.run(mountcmd)
+            if status != 0:
+                raise Exception("Failed to setup NFS mount on target ({})".format(repr(output)))
+
+            super().glibc_run_check(ssh = qemu.ip)
+
---
2.23.0.rc1

