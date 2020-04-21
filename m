Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.982.1587481162377798629
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 07:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y9dy//nv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id g12so4037697wmh.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2020 07:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BmlxVIJzWsTZVuNuOxwEcpEVrvtZujivC7Qla0sYuLE=;
        b=Y9dy//nvi+sxNyx9rY/DGicdQCM2bkUw1ogTVlr9pNWkgyzjI1f54eRJpVh46S9iUB
         n+3AfEOcAAMRUedOPPgQA0g19HDgqCzc0upEQ3PpHz2lP9L6FuAvBLzPGQxtW7FEmg2+
         W9zlKvd7Z06hTbRSIOFkLAr3RBXwIhZJTqYJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BmlxVIJzWsTZVuNuOxwEcpEVrvtZujivC7Qla0sYuLE=;
        b=EZINUAo49IPcjOP7+O53MfRtKUo17Y3pSfoE6ZwRYAHPGzraDaBet3oPVr5qGV5KL5
         g+tuT60jZHK5k7jNJlXcujIcDCoLb1dp/ETr/4FxQXPbTGaX5pf11G/QJXaaWGtAAuLR
         aX69zLmqzG4d6x+14vvDxToFKeLUtUJPcHBq5xIORzTxHBOl+/13YYK5bQ/BJeM3fdpX
         jiSoiDGzP/L/kidX4kYuRooP0vmoA68DjcAMp6GM/AshhcVHXcpp1dG1b/dSfLKC57VG
         baNsZzXDpHFt1LopZSoV0Uplpotobw/KLC+JvS/XXTtOmENbdw5SGm3A0OIm3mDGCD9j
         wWeA==
X-Gm-Message-State: AGi0PuaEOvMK+CffrPSWzRH+IhhTMz9bvl4pSDKvJ4h5M2mTEOIM4Gnu
	E76iaicRGqS8gOIRfu3Wqm99bu9JlW8=
X-Google-Smtp-Source: APiQypKHhhajtiyoC43WuNuKdr/RaQw0qFeWYA5VDA+QzzRud3zbyrogqQ8yxgKSlpWZPITz15BNdg==
X-Received: by 2002:a05:600c:114d:: with SMTP id z13mr5368740wmz.54.1587481160296;
        Tue, 21 Apr 2020 07:59:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s12sm3662033wmc.7.2020.04.21.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 07:59:19 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: licensing@lists.yoctoproject.org
Subject: [PATCH 1/2] oeqa/selftest: Add test for conflicting sysroot provider
Date: Tue, 21 Apr 2020 15:59:15 +0100
Message-Id: <20200421145916.861422-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysroot-test depends on virtual/sysroot-test which we build for one machine,
switch machine, switch provider of virtual/sysroot-test and check that the
sysroot is correctly cleaned up. The files in the two providers overlap
so can cause errors if the sysroot code doesn't function correctly.

Yes, sysroot-test should be machine specific really to avoid this, however
the sysroot cleanup should also work.

This adds a test for bug:

[YOCTO #13702]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../sysroot-test/sysroot-test-arch1_1.0.bb    | 12 ++++++
 .../sysroot-test/sysroot-test-arch2_1.0.bb    | 12 ++++++
 .../sysroot-test/sysroot-test_1.0.bb          |  4 ++
 meta/lib/oeqa/selftest/cases/sysroot.py       | 37 +++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 meta-selftest/recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb
 create mode 100644 meta-selftest/recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb
 create mode 100644 meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/sysroot.py

diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb
new file mode 100644
index 00000000000..0b4ed2ef052
--- /dev/null
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb
@@ -0,0 +1,12 @@
+LICENSE = "CLOSED"
+
+PROVIDES = "virtual/sysroot-test"
+INHIBIT_DEFAULT_DEPS = "1"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+TESTSTRING ?= "1"
+
+do_install() {
+	install -d ${D}${includedir}
+	echo "# test ${TESTSTRING}" > ${D}${includedir}/sysroot-test.h
+}
\ No newline at end of file
diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb
new file mode 100644
index 00000000000..f8b50acda2c
--- /dev/null
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb
@@ -0,0 +1,12 @@
+LICENSE = "CLOSED"
+
+PROVIDES = "virtual/sysroot-test"
+INHIBIT_DEFAULT_DEPS = "1"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+TESTSTRING ?= "2"
+
+do_install() {
+	install -d ${D}${includedir}
+	echo "# test ${TESTSTRING}" > ${D}${includedir}/sysroot-test.h
+}
\ No newline at end of file
diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb
new file mode 100644
index 00000000000..bec0eecb980
--- /dev/null
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb
@@ -0,0 +1,4 @@
+SUMMARY = "Virtual provider sysroot test"
+LICENSE = "CLOSED"
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS = "virtual/sysroot-test"
diff --git a/meta/lib/oeqa/selftest/cases/sysroot.py b/meta/lib/oeqa/selftest/cases/sysroot.py
new file mode 100644
index 00000000000..6e34927c909
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/sysroot.py
@@ -0,0 +1,37 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+import uuid
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import  bitbake
+
+class SysrootTests(OESelftestTestCase):
+    def test_sysroot_cleanup(self):
+        """
+        Build sysroot test which depends on virtual/sysroot-test for one machine,
+        switch machine, switch provider of virtual/sysroot-test and check that the
+        sysroot is correctly cleaned up. The files in the two providers overlap
+        so can cause errors if the sysroot code doesn't function correctly.
+        Yes, sysroot-test should be machine specific really to avoid this, however
+        the sysroot cleanup should also work [YOCTO #13702]. 
+        """
+
+        uuid1 = uuid.uuid4()
+        uuid2 = uuid.uuid4()
+
+        self.write_config("""
+PREFERRED_PROVIDER_virtual/sysroot-test = "sysroot-test-arch1"
+MACHINE = "qemux86"
+TESTSTRING_pn-sysroot-test-arch1 = "%s"
+TESTSTRING_pn-sysroot-test-arch2 = "%s"
+""" % (uuid1, uuid2))
+        bitbake("sysroot-test")
+        self.write_config("""
+PREFERRED_PROVIDER_virtual/sysroot-test = "sysroot-test-arch2"
+MACHINE = "qemux86copy"
+TESTSTRING_pn-sysroot-test-arch1 = "%s"
+TESTSTRING_pn-sysroot-test-arch2 = "%s"
+""" % (uuid1, uuid2))
+        bitbake("sysroot-test")
-- 
2.25.1

