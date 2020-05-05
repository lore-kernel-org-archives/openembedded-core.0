Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.1511.1588648850085055500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FLS2GtFn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.194, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f194.google.com with SMTP id t16so249549plo.7
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=M9xkv5PJNukQ94LWZzdYhzVRSyzNSZoA1p6MCRlN02U=;
        b=FLS2GtFn6G7/VEqM3trrRa2uMWBTZTR1IyfBrw3UNWJHvNPIUZ7zgWSOoiaFkrnWVl
         WtvCQ627+W4vKEB7XU0ndV1CCGIEdYpvjZFHhkemfsPzhQ2ixGpge55vAYT8rQA+qjB8
         /MP+qkTIQl97zczlYY4OQbJPRqCP7/Ti+lhXPR/IpeMjq+YSxIZmyGOLxY+Nyoi8wUZI
         RF2kjUpsWPPMjvemJgcj4Ze+gBNlycOt3JL48LZu2/WjRamjcT28lG+AnF2rFUEgA2yk
         i0ne6p95zEt1xouI1Nxdh2ufZ2NgXgHE0zaYxALGJVgjoyIY0x4P7z6g9g+whcfXERPe
         Mndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=M9xkv5PJNukQ94LWZzdYhzVRSyzNSZoA1p6MCRlN02U=;
        b=SkwTlrkAeRORDdoilLi6mr586rNve4PgFEk8bJ7Rb9En5YOzjQbN0GdLKJpbinVIPW
         BEx1aR/R9pQh7JjDw3a8FSnUGBpaFscLtRX70Pf6S+EG1TCo99dxG0RSMhmBN1eVa+zw
         5AYdcrm4uPWOyw9U1JbwIsMv26wIAyrbQI5/FpnW95Uznf1CaNIu2hSu3zeuveF7a4a6
         qBqAnRMaQZiIjnSSjK8mb90bOQ0nrS+j5OfHF8yA5MIJ/ujpezMJ7hrDOSbobI48vVr+
         zv+MnKj/m0WpVLFY5vxzhfwtgTsoMHnbGsoZTfyUMrtSNGg0CY3CHEsLuH+ay17jJaKW
         80Og==
X-Gm-Message-State: AGi0PubKglIpM74tEW9LG8GwdPFvJ40Z1oi4G491kRe+tSmSqGcR8tHE
	tsOb6fuZBTUKajXRzz0mNZolcSL64KRTuQ==
X-Google-Smtp-Source: APiQypJAWHs6BPBPNEWifYIG1l6LLV2ThgofbGg68X8Q5+6DMgu1qXno+zgWaLJetzEyEFtNKabLwQ==
X-Received: by 2002:a17:90a:ac02:: with SMTP id o2mr329065pjq.140.1588648848963;
        Mon, 04 May 2020 20:20:48 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.20.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:20:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/28] oeqa/selftest: Add test for conflicting sysroot provider
Date: Mon,  4 May 2020 17:19:12 -1000
Message-Id: <31a8b4935e673aba8a1147c4a2fb510b1a8bc3ce.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

sysroot-test depends on virtual/sysroot-test which we build for one machine,
switch machine, switch provider of virtual/sysroot-test and check that the
sysroot is correctly cleaned up. The files in the two providers overlap
so can cause errors if the sysroot code doesn't function correctly.

Yes, sysroot-test should be machine specific really to avoid this, however
the sysroot cleanup should also work.

This adds a test for bug:

[YOCTO #13702]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sysroot-test/sysroot-test-arch1_1.0.bb    | 14 +++++++
 .../sysroot-test/sysroot-test-arch2_1.0.bb    | 14 +++++++
 .../sysroot-test/sysroot-test_1.0.bb          |  6 +++
 meta/lib/oeqa/selftest/cases/sysroot.py       | 37 +++++++++++++++++++
 4 files changed, 71 insertions(+)
 create mode 100644 meta-selftest/recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb
 create mode 100644 meta-selftest/recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb
 create mode 100644 meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/sysroot.py

diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb
new file mode 100644
index 0000000000..36a682c53d
--- /dev/null
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb
@@ -0,0 +1,14 @@
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
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb
new file mode 100644
index 0000000000..67172f3cab
--- /dev/null
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb
@@ -0,0 +1,14 @@
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
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb
new file mode 100644
index 0000000000..560487c159
--- /dev/null
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb
@@ -0,0 +1,6 @@
+SUMMARY = "Virtual provider sysroot test"
+LICENSE = "CLOSED"
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS = "virtual/sysroot-test"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/lib/oeqa/selftest/cases/sysroot.py b/meta/lib/oeqa/selftest/cases/sysroot.py
new file mode 100644
index 0000000000..6e34927c90
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
2.17.1

