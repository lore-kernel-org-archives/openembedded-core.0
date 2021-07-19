Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.26341.1626693717996541303
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 19 Jul 2021 04:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QpHX1R6i;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: sanakazisk19@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 70so15273856pgh.2
        for <Openembedded-core@lists.openembedded.org>; Mon, 19 Jul 2021 04:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=y2T+SAjr9fG/9hCZm88ew0uyqC4hKga/Oi81ZY6LnFE=;
        b=QpHX1R6ivja278wo/6EDFG+fBV5KiOBOIewVvSiTdpZa1GLHYHnOWICj1cSPi5aNKr
         QIm+m/XYUJdb6a9n+eD/OR3wpOeYppB6AcuzUSWC622j8bihicNrS5d8gqvak/hfLwDb
         KYTWril2DtsQRMvKrL6dg8lgWJADBkqVsxDlnWvIMfZ+Rpd4R3jLuTYOzK4+waR5prwC
         ZCdDKfONf8xHVHHiNr7F5Lbbs1ApC3+mWekylRSyjJtMydtRZIkgNVH5E1xBAe+sSY9F
         ffhkhjPOEmAr2gEC/XGnS35CFzKw7m6dpyf9hJMAVVezfBvvY4+0+f4qyhNTfJ2Ju5Cf
         V+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=y2T+SAjr9fG/9hCZm88ew0uyqC4hKga/Oi81ZY6LnFE=;
        b=A906V2I1WMuTMkBwPe/oDR3Ub4THblPn7GVpTD3ZbYMApxfZm4Owjk7iJFnPPgqkiV
         QBa+Wu6Vw0oiQaqn9lxR/uB+UxKxmXx1BrG99M+EyibjnU0CMQct5eHW5NH6x8HBKdkQ
         JhcLg8AuMRDVHUDES9sAlt2/NgnuWCij8IKbpjwOi6UusgXQgr+DZbEk4VO35ua0GNvZ
         37Y5lhEjemSL/FqDnDI2vF3vcDavVPIcYlqAxCjLsckWqOtQxGEdsxejgjol4mVGOzC6
         HmJvUeazYVu3ZeSRvIWBPGT0+75nklf7Rhk0A+8sUU0kw1hWpxqod5G+eUGjf7Cxv0fu
         P5OQ==
X-Gm-Message-State: AOAM532ldasvwMxpxurtkRkSLS7HF0mxW3AERdmii+dLtZauQRh/+6wr
	vGe5QNB67kFcllC1nxysSvPSpKChL+qQvg==
X-Google-Smtp-Source: ABdhPJwBALKevUdb9XufhniAJBkZjbihowMnPADgSSSpuqzyfQNZyNVVZA0/0U+LD6W7qi5XWOFzDw==
X-Received: by 2002:a05:6a00:214a:b029:323:3c6e:a24a with SMTP id o10-20020a056a00214ab02903233c6ea24amr25218457pfk.4.1626693717333;
        Mon, 19 Jul 2021 04:21:57 -0700 (PDT)
Return-Path: <sanakazisk19@gmail.com>
Received: from localhost.localdomain ([2402:8100:30a2:fc49:89df:80af:d1f0:faa3])
        by smtp.gmail.com with ESMTPSA id d1sm10633294pfj.24.2021.07.19.04.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:21:56 -0700 (PDT)
From: "sana kazi" <sanakazisk19@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: nishaparrakat@gmail.com,
	Sana Kazi <Sana.Kazi@kpit.com>
Subject: [poky][dunfell][PATCH] test_buildhistory: Add test to verify that LICENSE is added
Date: Mon, 19 Jul 2021 16:51:32 +0530
Message-Id: <20210719112132.3755-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Sana Kazi <Sana.Kazi@kpit.com>

Added test case which uses BUILDHISTORY_EXPORT_RECIPE_VARIABLES
and BUILDHISTORY_EXPORT_PACKAGE_VARIABLES to add LICENSE for glibc as a
sample recipe to buildhistory and the test verifies that expected
license value is written in latest file.

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 .../recipes-test/glibc/glibc_%.bbappend       |  2 +
 .../oeqa/selftest/cases/test_buildhistory.py  | 46 +++++++++++++++++++
 2 files changed, 48 insertions(+)
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
index 0000000000..c6a2aad54e
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/test_buildhistory.py
@@ -0,0 +1,46 @@
+import unittest
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.selftest.cases.buildhistory import BuildhistoryBase
+from oeqa.utils.commands import bitbake, get_bb_var
+
+class BuildhistoryTests(BuildhistoryBase):
+
+    def test_write_license_to_latest_recipe(self):
+        target = 'glibc'
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

