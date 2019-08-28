Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id C303F7ED76
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 05:07:33 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d85so895822pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 22:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=6yxn/6BnCmcuP8CKRUp2Fd8tn30hFlJ7SrqTWHNwVxA=;
	b=MaW4mOrwr4GYTzzFIAd+Cpeianq/LAphc8Vot52NbFUH8tfe1b+trUA5uT4yiXtAnI
	NXXgcwalR6HrqK6AU8Xly2tbR5xJTSx90hdzO3o1XlgqYPxfO1UvFZm0JMNxjVHIv6eP
	wHYgfvWCjutqVpB4ASni1CMYOPtQRgRafSqY1mVy6720YzcMbjusdX4zYuCDBot1t4Y+
	s1rYwWlF3K0MX4PTF4OMElwfMtM/qwk6hL6ObfYO1tTlClzmV8mPg4f/y91Izz1qoImh
	kGLR8s4f44a0a+pKX81Shnp2OcVdHvBp8xTPgRJ9PLUcRqDOoTvKZjDsQugRu0EXkoAZ
	ApJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=6yxn/6BnCmcuP8CKRUp2Fd8tn30hFlJ7SrqTWHNwVxA=;
	b=gL9bXe/uOJ0FGR1kkBpYSSIt1BZ+ED1u9BModNUpKhNws3tK/sbYrqxuGUfdF2grN5
	UQF13tJN/B6e33aICVeG1DtVS+3LODbKR3+KxkkzuIjakbM/wTdPVpCsGptPTjfbdiKm
	bUyt7KyCb9eH6gzLN325J11VpaxUGF8F02D64L6mjew0XBXAv0BZPu72jlNIT8I403lR
	cCtAqpgfHll8QvOGJwUanyKmPRBxa+nby1aWN5/zykQhPmKnesb1sPo9QhMRvfalCObD
	XBn0yDqs8OacWk+14yZxZetz5g+J+JQrl80NBdbO4AfWCC352hVL5hgZvNr6gmuHEWyp
	sRdw==
X-Gm-Message-State: APjAAAVxc+od021EYDZKluVN+vdxstQhcBt8+/G5phu2aiU2nwr5x3FZ
	AFAND9zzSoYYZx/qVAvxwPpXZA==
X-Google-Smtp-Source: APXvYqzBO4j4ygL9dtCPbC8rWmeSBbhlIOc2fyeFUOKrsCJDSwz1TKV+s34QjSkSSItk1vyke2S7RA==
X-Received: by 2002:a17:90a:2764:: with SMTP id
	o91mr2369038pje.57.1566968854847; 
	Tue, 27 Aug 2019 22:07:34 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	g11sm1490741pfk.187.2019.08.27.22.07.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 22:07:34 -0700 (PDT)
Date: Wed, 28 Aug 2019 05:06:29 +0000
Message-Id: <20190828050629.6392-10-nathan@nathanrossi.com>
In-Reply-To: <20190828050629.6392-0-nathan@nathanrossi.com>
References: <20190828050629.6392-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 10/11] oeqa/selftest/glibc: Create selftest case for glibc test suite
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
X-List-Received-Date: Wed, 28 Aug 2019 05:07:33 -0000
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
 meta/lib/oeqa/selftest/cases/glibc.py | 91 +++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/glibc.py

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
new file mode 100644
index 0000000000..5252ebb1b5
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: MIT
+import os
+import contextlib
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
+class GlibcSelfTest(OESelftestTestCase):
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+        if not hasattr(cls.tc, "extraresults"):
+            cls.tc.extraresults = {}
+
+    def test_glibc(self):
+        self.glibc_run_check()
+
+    def glibc_run_check(self, ssh = None):
+        # configure ssh target
+        features = []
+        if ssh is not None:
+            features.append('BUILD_TEST_TARGET = "ssh"')
+            features.append('BUILD_TEST_HOST = "{0}"'.format(ssh))
+            features.append('BUILD_TEST_HOST_USER = "root"')
+            features.append('BUILD_TEST_HOST_PORT = "22"')
+            # force single threaded test execution
+            features.append('EGLIBCPARALLELISM_task-check_pn-glibc-testsuite = "PARALLELMFLAGS="-j1""')
+        self.write_config("\n".join(features))
+
+        bitbake("glibc-testsuite -c check")
+
+        builddir = get_bb_var("B", "glibc-testsuite")
+
+        failed = 0
+        with open(os.path.join(builddir, "tests.sum"), "r") as f:
+            for test, result in parse_values(f):
+                self.tc.extraresults["{}.{}".format(type(self).__name__, test)] = {"status" : result}
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

