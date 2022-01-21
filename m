Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B0CC433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 14:51:23 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.12868.1642776670242435373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 06:51:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=fKuRjXsg;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642776682; x=1674312682;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=w0LdF/yjadfV/InyPVnUaQP9twmMPG8MPEbWCLwoMpo=;
  b=fKuRjXsgazsTXfRQWsu6ACMP0+ULYOy2U77PY8ZNqC5ugc4YyqNyxmKz
   EOKLFysrwjsF9jfhxxYMxqt6/4BIak38P/nLW7BDS5ZmdEx9ReevTKN16
   7NloLQrJFMJivJmy8HOMcYuZvv8P7GfO/vnwVnGDcdQW1r7pkBosC7K9f
   K30/A+WywTFxE0n5myt+sQSvE7c2MLWIuOzO1H48sWpyWKDKsUvtgbXLT
   qxNRMu3JtlJdAw9hN2ZCo1i7m8dV+QlOgXtg5pu0kRlwvO9mi5e6FduT8
   hAsqMRvd0dJ+CpiWvWQXjG+TuFgfq0uN6Wzpi496tYkl9Sf8KQfVnmWY6
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245886065"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="245886065"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="623336735"
Received: from gordonyx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.131.118])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:20 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 07/15] selftest: reproducible: Set maximum report
 size
Date: Fri, 21 Jan 2022 22:50:55 +0800
Message-Id: 
 <12c4da7e9986ae8a6207bcc3a4aa787579d7b863.1642736951.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642736950.git.anuj.mittal@intel.com>
References: <cover.1642736950.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 14:51:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160838

From: Joshua Watt <JPEWhacker@gmail.com>

Diffoscope can end up running for a very long time if there are a lot of
changes. To put a limit on how long it can run, cap the maximum report
size at 250 MB by default.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 52d5f76f54eac384f9480dffe96df089d9ee8f33)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index a62757399b..546dc91120 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -114,8 +114,9 @@ def compare_file(reference, test, diffutils_sysroot):
     result.status = SAME
     return result
 
-def run_diffoscope(a_dir, b_dir, html_dir, **kwargs):
-    return runCmd(['diffoscope', '--no-default-limits', '--exclude-directory-metadata', 'yes', '--html-dir', html_dir, a_dir, b_dir],
+def run_diffoscope(a_dir, b_dir, html_dir, max_report_size=0, **kwargs):
+    return runCmd(['diffoscope', '--no-default-limits', '--max-report-size', str(max_report_size),
+                   '--exclude-directory-metadata', 'yes', '--html-dir', html_dir, a_dir, b_dir],
                 **kwargs)
 
 class DiffoscopeTests(OESelftestTestCase):
@@ -145,6 +146,9 @@ class ReproducibleTests(OESelftestTestCase):
 
     package_classes = ['deb', 'ipk', 'rpm']
 
+    # Maximum report size, in bytes
+    max_report_size = 250 * 1024 * 1024
+
     # targets are the things we want to test the reproducibility of
     targets = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline', 'core-image-weston', 'world']
     # sstate targets are things to pull from sstate to potentially cut build/debugging time
@@ -321,7 +325,7 @@ class ReproducibleTests(OESelftestTestCase):
                 # Copy jquery to improve the diffoscope output usability
                 self.copy_file(os.path.join(jquery_sysroot, 'usr/share/javascript/jquery/jquery.min.js'), os.path.join(package_html_dir, 'jquery.js'))
 
-                run_diffoscope('reproducibleA', 'reproducibleB', package_html_dir,
+                run_diffoscope('reproducibleA', 'reproducibleB', package_html_dir, max_report_size=self.max_report_size,
                         native_sysroot=diffoscope_sysroot, ignore_status=True, cwd=package_dir)
 
         if fails:
-- 
2.34.1


