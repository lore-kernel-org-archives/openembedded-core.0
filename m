Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.25727.1627271219709219099
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 25 Jul 2021 20:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GAlsrKVR;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: sanakazisk19@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso5056505pjo.1
        for <Openembedded-core@lists.openembedded.org>; Sun, 25 Jul 2021 20:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=qfCkHz1RCFRXg+/oj/SdQ1J2QOADpPgW0T22JiDPj88=;
        b=GAlsrKVR6+ntXZbmAaAi8GwOGXE/3NujDYfvG0kPTY9c+qov+1/yfIE9B2jTwBF+0s
         PtfQ4nGP9C4ICkw2QcEvlrAktNDFSGTqDc+SpqU5KUFazWfCCLi0JRzd2gZyYLVw4wAP
         FD86JtTCbbdNH2KEKKK4LX1E6TTpPAYjQvAb8HwRCVbtrtSir+ShkYnAMt9zJzF4KoEd
         yY27BpUFXpCjentcpy8/JrESCdL8RFw86TQJuFiLp5O/2jpBYnNNPGxKqwmBf5jdJxhv
         LPKjXHvtvWQEG+0j1wV6bJt2onIog3wVHJbUNzCF/v1lh5TBoLOnz7JmmSBJ9YlSvY1J
         WTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qfCkHz1RCFRXg+/oj/SdQ1J2QOADpPgW0T22JiDPj88=;
        b=TJnmr+DMp7ixtitz8nDvonZMWx73DomVUBBbvkWvJNAPc43MTTubLp1kkWvXLCyvQR
         KUvlUhjj4/ixrXLKAQZ2q6SGfGWmMzwEq62ilk6UwNKDyryX8PSZk28Vfxs5FqmHgtUn
         rMdm9q3A0Pdd9Dcf/HMLfoAmQxFDvdFwGR5i4DPRyTnCbWkROzg8zLwmEw3alAVRn5Hw
         d1hVjBRKabXXdFDiJvYYIzfJozBwYxci+fSjbfPJG27YO8L940kbophBASCOwbOMwqIB
         dFQqXk9kguDgRMuQyhMxQLkLQP34K0Q4bXViIldnbHAAn5i5yVt6VPR1sJP//jNSZAtb
         mMig==
X-Gm-Message-State: AOAM530tItbs7nK4Xl+QDZYwD8ZeG9s6h5TEOYdGP5AlOHjP9N6JQhgm
	tCyp6sgs/3DNg+xldVZXaQtbTT9MqAOXrA==
X-Google-Smtp-Source: ABdhPJwxWp/TEBWrs7sbF6GbdQvz+8X/Y6nA3ltLGTuKh77w0sAETE4nB5Yf3HFnCjkbvn0PSwXmSQ==
X-Received: by 2002:a17:902:ab45:b029:12c:17e1:f817 with SMTP id ij5-20020a170902ab45b029012c17e1f817mr3889647plb.60.1627271219048;
        Sun, 25 Jul 2021 20:46:59 -0700 (PDT)
Return-Path: <sanakazisk19@gmail.com>
Received: from localhost.localdomain ([106.220.205.42])
        by smtp.gmail.com with ESMTPSA id l10sm15778575pjg.11.2021.07.25.20.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 20:46:58 -0700 (PDT)
From: "sana kazi" <sanakazisk19@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: nishaparrakat@gmail.com
Subject: [poky][master][PATCH] test_buildhistory: Add test to verify that LICENSE is added
Date: Mon, 26 Jul 2021 09:16:38 +0530
Message-Id: <20210726034638.13401-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Sana Kazi <Sana.Kazi@kpit.com>

Added test case which uses BUILDHISTORY_EXPORT_RECIPE_VARIABLES
and BUILDHISTORY_EXPORT_PACKAGE_VARIABLES to add LICENSE for glibc as a
sample recipe to buildhistory and the test verifies that expected
license value is written in latest file.

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 .../recipes-test/glibc/glibc_%.bbappend       |  2 +
 .../oeqa/selftest/cases/test_buildhistory.py  | 48 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-selftest/recipes-test/glibc/glibc_%.bbappend
 create mode 100644 meta/lib/oeqa/selftest/cases/test_buildhistory.py

diff --git a/meta-selftest/recipes-test/glibc/glibc_%.bbappend b/meta-selftest/recipes-test/glibc/glibc_%.bbappend
new file mode 100644
index 0000000000..205720982c
--- /dev/null
+++ b/meta-selftest/recipes-test/glibc/glibc_%.bbappend
@@ -0,0 +1,2 @@
+# This bbappend is used to alter the recipe using the test_recipe.inc file created by tests.
+include test_recipe.inc
diff --git a/meta/lib/oeqa/selftest/cases/test_buildhistory.py b/meta/lib/oeqa/selftest/cases/test_buildhistory.py
new file mode 100644
index 0000000000..2f1bd54599
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/test_buildhistory.py
@@ -0,0 +1,48 @@
+import unittest
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.selftest.cases.buildhistory import BuildhistoryBase
+from oeqa.utils.commands import bitbake, get_bb_var
+
+class BuildhistoryTests(BuildhistoryBase):
+
+    def test_write_license_to_latest_recipe(self):
+        target = 'glibc'
+        recipe_variables = []
+        self.write_recipeinc(target, 'BUILDHISTORY_EXPORT_RECIPE_VARIABLES += \"LICENSE\"')
+        self.run_buildhistory_operation(target)
+        add_buildhistory_config = 'PACKAGE_CLASSES = \"package_ipk\"'
+        self.append_config(add_buildhistory_config)
+        pkghistdir = get_bb_var('BUILDHISTORY_DIR')
+        PACKAGE_ARCH = get_bb_var('MULTIMACH_TARGET_SYS')
+        bitbake('-c package_write_ipk -f %s' % target)
+        infofile = "{}/packages/{}/{}/latest".format(pkghistdir, PACKAGE_ARCH, target)
+        expected = "LICENSE = GPLv2 & LGPLv2.1"
+        result = False
+        with open(infofile, "r") as f:
+            for line in f:
+                if line.strip() == expected:
+                    result = True
+                    break
+        if not result:
+            raise AssertionError("Expected License not found")
+
+    def test_write_license_to_latest_package(self):
+        target = 'glibc'
+        recipe_variables = []
+        self.write_recipeinc(target, 'BUILDHISTORY_EXPORT_PACKAGE_VARIABLES += \"LICENSE\"')
+        self.run_buildhistory_operation(target)
+        add_buildhistory_config = 'PACKAGE_CLASSES = \"package_ipk\"'
+        self.append_config(add_buildhistory_config)
+        bitbake('-c package_write_ipk -f %s' % target)
+        pkghistdir = get_bb_var('BUILDHISTORY_DIR')
+        PACKAGE_ARCH = get_bb_var('MULTIMACH_TARGET_SYS')
+        infofile = "{}/packages/{}/{}/{}-dbg/latest".format(pkghistdir, PACKAGE_ARCH, target, target)
+        expected = "LICENSE = GPLv2 & LGPLv2.1"
+        result = False
+        with open(infofile, "r") as f:
+            for line in f:
+                if line.strip() == expected:
+                    result = True
+                    break
+        if not result:
+            raise AssertionError("Expected License not found")
-- 
2.17.1

