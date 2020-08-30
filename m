Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web10.25571.1598756441462804782
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 20:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fF6LJl6T;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id q14so3878313ilm.2
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2020 20:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VUg5gGEAfmb8M0Q9rcFxHHdV4Mtq1V8IJqk/n12Bvtw=;
        b=fF6LJl6TQizuPPsoqMObBZQhvkbU1TQjLjH7CrU1DczcDdXlm71XaBxr4KB2sNQM3A
         e3SA/RhpJp4dx/7Z9hjP5eS5ZrrybOMTvkHsFiIO2/ITWLh8ncJPg/eOvat9Ydc0dxZE
         xLiJkF4BZQbtLNqsvGJuDg8kO2EmDZkfaz3ReWQx6y21HghsOeHs62Th56Coqq3gDunh
         qsBl/sEIJE8A+rz7bCLyP3ZnAWu7nwyTAVROl+ulD+te9uM5YRuYg6ORd9yF8Y0jgOMz
         sdnIY7cgAMQglm+/PDG6sLUAmwiwuapdYRR5HdGR1Pay74r0dMm8bq/ycbY6eEakEJHE
         KYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VUg5gGEAfmb8M0Q9rcFxHHdV4Mtq1V8IJqk/n12Bvtw=;
        b=XmTx4CWGgN9VoN+/G/SstyfKRzt+7WOr7urorrYC/PnVpT9BeK0/lQ6u36GZA1hvFW
         mzSaMQ5pj50E0BLOb21EJRNzs93LIv7t41cZPaGi4KOHMl9dJM+oJvJH6jb9aH6jeOk6
         Pv6qojr6f8g36fHcM3Y00fzZpsa+o70wnFwAh6FYUdCpXeT8oFYm2i8GwEJ07qWUj4Qx
         UfWwtP5W/Ui6GtFT5uboW7pa7FT5+G9dupynVMissb37JNeTXMtcdvNqRx8XTc7j/t8V
         qsteG26GBwe/Noj7z/O9S9bjd5SUgenMiIHo9owEeE4UWM+oxgiORUox5/3sq3MvYc0D
         SjgQ==
X-Gm-Message-State: AOAM531Yft1Z3awpiDsbFm7WHHA1dZWlGg2MwgMhIDfFJ47UwMXHQz3S
	YrfOKi0Gkwy14kWlitmUWmRs4Zjf45I=
X-Google-Smtp-Source: ABdhPJyf3u5fQSh9AplAQGS7ktge5yOjM0dOammOjT1Hcvpah+9CHVGWqaZjDSbcTtjf7MTyeTOzLQ==
X-Received: by 2002:a92:2907:: with SMTP id l7mr4395290ilg.110.1598756440371;
        Sat, 29 Aug 2020 20:00:40 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:7282:816:6ef9:8e8c])
        by smtp.gmail.com with ESMTPSA id x24sm1724366ilk.82.2020.08.29.20.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2020 20:00:39 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] oeqa: reproducible: Fix test not producing diffs
Date: Sat, 29 Aug 2020 22:00:34 -0500
Message-Id: <20200830030034.30498-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Diffoscope changed the --exclude-directory-metadata option to require an
argument.

Add a test to validate that diffoscope is functioning as
expected to ensure that future upgrades do not unintentionally break
the reproducibility tests.

[YOCTO #14025]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../oeqa/selftest/cases/diffoscope/A/file.txt |  1 +
 .../oeqa/selftest/cases/diffoscope/B/file.txt |  1 +
 meta/lib/oeqa/selftest/cases/reproducible.py  | 28 ++++++++++++++++++-
 3 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/diffoscope/A/file.txt
 create mode 100644 meta/lib/oeqa/selftest/cases/diffoscope/B/file.txt

diff --git a/meta/lib/oeqa/selftest/cases/diffoscope/A/file.txt b/meta/lib/oeqa/selftest/cases/diffoscope/A/file.txt
new file mode 100644
index 0000000000..f70f10e4db
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/diffoscope/A/file.txt
@@ -0,0 +1 @@
+A
diff --git a/meta/lib/oeqa/selftest/cases/diffoscope/B/file.txt b/meta/lib/oeqa/selftest/cases/diffoscope/B/file.txt
new file mode 100644
index 0000000000..223b7836fb
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/diffoscope/B/file.txt
@@ -0,0 +1 @@
+B
diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 5d3959be77..a7ef336143 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -77,6 +77,32 @@ def compare_file(reference, test, diffutils_sysroot):
     result.status = SAME
     return result
 
+def run_diffoscope(a_dir, b_dir, html_dir, **kwargs):
+    return runCmd(['diffoscope', '--no-default-limits', '--exclude-directory-metadata', 'yes', '--html-dir', html_dir, a_dir, b_dir],
+                **kwargs)
+
+class DiffoscopeTests(OESelftestTestCase):
+    diffoscope_test_files = os.path.join(os.path.dirname(os.path.abspath(__file__)), "diffoscope")
+
+    def test_diffoscope(self):
+        bitbake("diffoscope-native -c addto_recipe_sysroot")
+        diffoscope_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "diffoscope-native")
+
+        # Check that diffoscope doesn't return an error when the files compare
+        # the same (a general check that diffoscope is working)
+        with tempfile.TemporaryDirectory() as tmpdir:
+            run_diffoscope('A', 'A', tmpdir,
+                native_sysroot=diffoscope_sysroot, cwd=self.diffoscope_test_files)
+
+        # Check that diffoscope generates an index.html file when the files are
+        # different
+        with tempfile.TemporaryDirectory() as tmpdir:
+            r = run_diffoscope('A', 'B', tmpdir,
+                native_sysroot=diffoscope_sysroot, ignore_status=True, cwd=self.diffoscope_test_files)
+
+            self.assertNotEqual(r.status, 0, msg="diffoscope was successful when an error was expected")
+            self.assertTrue(os.path.exists(os.path.join(tmpdir, 'index.html')), "HTML index not found!")
+
 class ReproducibleTests(OESelftestTestCase):
     package_classes = ['deb', 'ipk']
     images = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline']
@@ -232,7 +258,7 @@ class ReproducibleTests(OESelftestTestCase):
                 # Copy jquery to improve the diffoscope output usability
                 self.copy_file(os.path.join(jquery_sysroot, 'usr/share/javascript/jquery/jquery.min.js'), os.path.join(package_html_dir, 'jquery.js'))
 
-                runCmd(['diffoscope', '--no-default-limits', '--exclude-directory-metadata', '--html-dir', package_html_dir, 'reproducibleA', 'reproducibleB'],
+                run_diffoscope('reproducibleA', 'reproducibleB', package_html_dir,
                         native_sysroot=diffoscope_sysroot, ignore_status=True, cwd=package_dir)
 
         if fails:
-- 
2.28.0

