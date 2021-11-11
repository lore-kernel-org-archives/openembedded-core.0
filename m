Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D38C433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 04:09:05 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.6219.1636603743880586327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=vevOp3Qw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id
 gb13-20020a17090b060d00b001a674e2c4a8so3646857pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kROlpBElfao70aiF9OlLIs9PY5kZ5orPknu08ntgS7c=;
        b=vevOp3QwJLfxrMG05+/OcsUyeo4UcGcnDpXSSqne1hLyIaprbj6vUI6/XCzuK8Gpj6
         7WkEXg+vO00We8BJ4R5kyWCy3qnawM3AaBclfgsHRYXmVE8+NW818DxEf8xzK0LbWrsI
         h8nv77NEzo27kbOqYj6IbEQYLLTgpm1sr7veolmxlC9WOXBaYXDRXMB1gk8YUo3hjB2f
         ucp3fCwwnjagnbjO/8XeyBWlXqZAe/M2eFkK1LHhJaKdPkqJAt89E8kMHdnsu9PtZQBm
         qudbD/kXf1zMssFKJMR2WBuXk7T2YQ2mLXTCxmVcWWVTWGoM8h8bMjb6TPwjVTqD9L6V
         ZyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kROlpBElfao70aiF9OlLIs9PY5kZ5orPknu08ntgS7c=;
        b=131AWmZDm8h763CabUTj2BJcQ9nthxvxyqsMe9vctGJiTj9nE2pYW6+EfRe40whM3U
         F3Z10KXIsa7HSb73tNOiulNDpxprELi82McCt4mPwarjX2/JKD3uhc4EcleZ6A4WfT9s
         8KyGBolOB6pFkZJLF9tfuIDF9nRAZWBz1p+jyasx0MFsEolsuKfx7HHsj3eOlsN3sK/r
         kHI9wjcSuJD8QXJZ1zR4K/vW34LNGuJGrm47aN1htuwFtbmzP30cjEBB+8z2/npqtfm8
         vL9Kyz1YhLiL8LRbd4AzeJchXlgKfIhmmTLS8f9KbwIjXck9T/lvAEWyYCXkO7YADz5e
         DALg==
X-Gm-Message-State: AOAM532UJvQakmspPlkSQLKHRdNv+wF+WuFc+P24yF1KA4E9021Xddse
	OdVnbZpBqU6RRA1jzW4t+QAW2gQsb6mSYUx3RDc=
X-Google-Smtp-Source: 
 ABdhPJx1Dvf6aJK/LbEyxmnZhqTkDGPBxVWZ9w0WN+qU6wL33LR8L7oHCRt1QsDzTkqUmy4grtAXCw==
X-Received: by 2002:a17:90b:3b48:: with SMTP id
 ot8mr23772368pjb.78.1636603742534;
        Wed, 10 Nov 2021 20:09:02 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm1207686pfg.90.2021.11.10.20.09.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 20:09:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/14] oeqa: reproducible: Fix test not producing
 diffs
Date: Wed, 10 Nov 2021 18:08:26 -1000
Message-Id: 
 <a1087756221b8fcfe9c6903e678920f96e12292e.1636591208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636591208.git.steve@sakoman.com>
References: <cover.1636591208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 04:09:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158133

From: Joshua Watt <JPEWhacker@gmail.com>

Diffoscope changed the --exclude-directory-metadata option to require an
argument.

Add a test to validate that diffoscope is functioning as
expected to ensure that future upgrades do not unintentionally break
the reproducibility tests.

[YOCTO #14025]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ea8fbcb7978ce48d7a9a83143d09402329535f86)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index c8604a2054..60ddc76340 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -139,6 +139,32 @@ def compare_file(reference, test, diffutils_sysroot):
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
     # Test the reproducibility of whatever is built between sstate_targets and targets
 
@@ -316,7 +342,7 @@ class ReproducibleTests(OESelftestTestCase):
                 # Copy jquery to improve the diffoscope output usability
                 self.copy_file(os.path.join(jquery_sysroot, 'usr/share/javascript/jquery/jquery.min.js'), os.path.join(package_html_dir, 'jquery.js'))
 
-                runCmd(['diffoscope', '--no-default-limits', '--exclude-directory-metadata', '--html-dir', package_html_dir, 'reproducibleA', 'reproducibleB'],
+                run_diffoscope('reproducibleA', 'reproducibleB', package_html_dir,
                         native_sysroot=diffoscope_sysroot, ignore_status=True, cwd=package_dir)
 
         if fails:
-- 
2.25.1


