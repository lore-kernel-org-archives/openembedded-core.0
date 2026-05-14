Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC505CD4F3D
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 19:42:37 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19899.1778787752459068888
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 12:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=QvBu3Fh3;
 spf=pass (domain: baylibre.com, ip: 209.85.222.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-90f850473f9so289650385a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 12:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778787751; x=1779392551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEBrnzmKW2ahcR9vqTby4oO5YaS5ofAUWHok1tmp6hM=;
        b=QvBu3Fh3eHxgAnWMTTTZokVujLjHHmgG/YZJmcmLUXLMOyXq5V05ZB3IOoOn8r49I7
         FPksuasa0s2w0qVoToiNx6cbhhg57M43LSmTeJ8Jy1n9Z8J8ulI4xFK2m2HLb2fhOUIk
         H35kOyHmPeZYDCwTov8rSzhFnVYRgmKiDxBhmKaHHQPHBq7Nnqj8bumFkv/+6B0saKl9
         pg6w2p+QiXUJnqMWm2NvUI8gUHm5iZI3N6lWlcv5gxZI/VOPrd72jcRsb7BFf24F2LSm
         Hq6oEN+lfF+Iafx5N97WQy6/0PuJftwo6YXlc5otmfWMZOlBLOPUMVmicu+1gsf2byze
         Gemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778787751; x=1779392551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xEBrnzmKW2ahcR9vqTby4oO5YaS5ofAUWHok1tmp6hM=;
        b=KWTo0+nsyHNuoXYbS4mELyueJEd3lFaXs7kgqlsJlflts0CYl52Fjn0g8wSRnYuedr
         0ZmC0O6Eq/Lh8zflXN2InyYMBb3lmIFUvZbSbNEs1mN876jQNz/zpx3X+pskZsqSfVSX
         WLXL3wlIAkhGgf+cVQt83QsGcjkSxkK7nrKnRLxGSRWbHTxk2MhO59YXDKRH2nEmSkyO
         2OMltJ//jJ9Os7f1A04iPAHTBQEPKMODZt1tFZgtUaQKn6vOWEtImVK0nM9X18dz+84f
         t2HYEiUvXvvTg/HZ8FfK0tRGlJbZRq8lJWn7NLEayKuGdoDLlk2e7xQx4aLxO98kTL9k
         eGfQ==
X-Gm-Message-State: AOJu0YxO2rCrnSCt/WW2sCaehne+oVaNTApAj6PPMHApei9V07P1cirt
	Yf5J60V+aiqOy1Fnq3l2sBs0Gj5+Mct0kHPe2cy/r7GPR3yGZU2iP776mO1y5NI4R/Lo0ZydQ7g
	BdaZttws=
X-Gm-Gg: Acq92OEj1YWtByW7wFeLv9qi/aQQEohTkLy/BMHcMtM+YgiONmm0oFet9RhiVQogvlb
	0agg/HRgqxfJX1zrGd3JoDPZB2oloWkiKfi9eoIn0qNnk82T85Dlktljmxk+qV094BAwpWlPs5t
	ppNNpcWGS9V+V+CCO3nfuiLHCxywDqHyhT4Z98lsf/dVoaBrno6SZuAkvx6zB2+/9UI75hjgHvY
	wjw0KJyWbsWyhlN+C/8l97p4IMwMvt4WE8TxmDryQ+2n4LGjgFwLTKiDOCVvyhEu+PzC4nSZYan
	/dfvoExGMZ1XMEY/G+Yov/zmIge7DzUZgrPTy547gc97glWA/yvWSNMdEITSXdvIA/WxVCBFhx6
	OTx7xOYFsHHd8YBSZgsPiX9MjZiExjq5nv9wRJ7/o8rf4fCmj/AmiHbwAvcJjXYseEdVuNZlY7R
	Mstjm9nuSu4zbTtgV9SOKdA1JICg==
X-Received: by 2002:a05:620a:2942:b0:8cd:8569:b957 with SMTP id af79cd13be357-911cec0dccamr170856185a.43.1778787751152;
        Thu, 14 May 2026 12:42:31 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bad2dd8esm330062085a.19.2026.05.14.12.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:42:30 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 11/11] patchtest: selftest: extend test file suite
Date: Thu, 14 May 2026 15:42:07 -0400
Message-ID: <20260514194207.1958325-12-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514194207.1958325-1-tgamblin@baylibre.com>
References: <20260514194207.1958325-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237058

- Tweak the carried-but-unused test_series_merge_on_head selftest files
  so that one should pass and one should fail, since we can now test
  mergeability.

- Add thirteen new selftest files for the following tests:
  - TestMbox.test_non_auh_upgrade
  - TestMbox.test_target_mailing_list
  - TestMetadata.test_max_line_length
  - TestPatch.test_upstream_status_presence_format
  - TestPatch.test_patch_malformed_context
  - TestPatch.test_patch_trailing_whitespace

The selftest suite now runs a total of 51 tests:

|============================================================================
|Testsuite summary for patchtest
|============================================================================
|# TOTAL: 51
|# XPASS: 25
|# XFAIL: 26
|# XSKIP: 0
|# PASS: 0
|# FAIL: 0
|# SKIP: 0
|# ERROR: 0
|============================================================================

AI-Generated: Uses Claude Code

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...x.pretest_series_applies_on_branch.1.pass} | 22 +++----
 ...x.pretest_series_applies_on_branch.2.fail} |  0
 .../files/TestMbox.test_non_auh_upgrade.fail  | 25 ++++++++
 .../files/TestMbox.test_non_auh_upgrade.pass  | 25 ++++++++
 .../TestMbox.test_target_mailing_list.1.fail  | 26 ++++++++
 .../TestMbox.test_target_mailing_list.2.fail  | 24 +++++++
 .../TestMbox.test_target_mailing_list.pass    | 25 ++++++++
 .../TestMetadata.test_max_line_length.fail    | 26 ++++++++
 .../TestMetadata.test_max_line_length.pass    | 25 ++++++++
 ...estPatch.test_patch_malformed_context.fail | 38 ++++++++++++
 ...estPatch.test_patch_malformed_context.pass | 38 ++++++++++++
 ...tPatch.test_patch_trailing_whitespace.fail | 38 ++++++++++++
 ...tPatch.test_patch_trailing_whitespace.pass | 38 ++++++++++++
 ....test_upstream_status_presence_format.fail | 61 ++++++++++++++++++
 ....test_upstream_status_presence_format.pass | 62 +++++++++++++++++++
 15 files changed, 458 insertions(+), 15 deletions(-)
 rename meta/lib/patchtest/selftest/files/{TestMbox.test_series_merge_on_head.1.skip => TestMbox.pretest_series_applies_on_branch.1.pass} (66%)
 rename meta/lib/patchtest/selftest/files/{TestMbox.test_series_merge_on_head.2.skip => TestMbox.pretest_series_applies_on_branch.2.fail} (100%)
 create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_non_auh_upgrade.fail
 create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_non_auh_upgrade.pass
 create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_target_mailing_list.1.fail
 create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_target_mailing_list.2.fail
 create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_target_mailing_list.pass
 create mode 100644 meta/lib/patchtest/selftest/files/TestMetadata.test_max_line_length.fail
 create mode 100644 meta/lib/patchtest/selftest/files/TestMetadata.test_max_line_length.pass
 create mode 100644 meta/lib/patchtest/selftest/files/TestPatch.test_patch_malformed_context.fail
 create mode 100644 meta/lib/patchtest/selftest/files/TestPatch.test_patch_malformed_context.pass
 create mode 100644 meta/lib/patchtest/selftest/files/TestPatch.test_patch_trailing_whitespace.fail
 create mode 100644 meta/lib/patchtest/selftest/files/TestPatch.test_patch_trailing_whitespace.pass
 create mode 100644 meta/lib/patchtest/selftest/files/TestPatch.test_upstream_status_presence_format.fail
 create mode 100644 meta/lib/patchtest/selftest/files/TestPatch.test_upstream_status_presence_format.pass

diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_series_merge_on_head.1.skip b/meta/lib/patchtest/selftest/files/TestMbox.pretest_series_applies_on_branch.1.pass
similarity index 66%
rename from meta/lib/patchtest/selftest/files/TestMbox.test_series_merge_on_head.1.skip
rename to meta/lib/patchtest/selftest/files/TestMbox.pretest_series_applies_on_branch.1.pass
index 072ccc28c0..7a004fb426 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_series_merge_on_head.1.skip
+++ b/meta/lib/patchtest/selftest/files/TestMbox.pretest_series_applies_on_branch.1.pass
@@ -3,19 +3,19 @@ From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Wed, 30 Aug 2023 12:15:00 -0400
 Subject: [PATCH] selftest-hello: upgrade 1.0 -> 1.1
 
-This file should skip the test_series_merge_on_head test.
+This patch should pass the pretest_series_applies_on_branch selftest.
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- .../{selftest-hello_1.0.bb => selftest-hello_1.1.bb}           | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
- rename meta-selftest/recipes-test/selftest-hello/{selftest-hello_1.0.bb => selftest-hello_1.1.bb} (88%)
+ .../selftest-hello/{selftest-hello_1.0.bb => selftest-hello_1.1.bb} | 1 +
+ 1 file changed, 1 insertion(+)
+ rename meta-selftest/recipes-test/selftest-hello/{selftest-hello_1.0.bb => selftest-hello_1.1.bb} (95%)
 
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
-similarity index 88%
+similarity index 95%
 rename from meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 rename to meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
-index 547587bef4..acc388ec2c 100644
+index 0ffe7308ba..0000000000 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.1.bb
 @@ -1,3 +1,4 @@
@@ -23,13 +23,5 @@ index 547587bef4..acc388ec2c 100644
  DESCRIPTION = "Simple helloworld application -- selftest variant"
  SECTION = "examples"
  LICENSE = "MIT"
-@@ -16,4 +17,4 @@ do_install() {
- 	install -m 0755 helloworld ${D}${bindir}
- }
- 
--BBCLASSEXTEND = "native nativesdk"
-\ No newline at end of file
-+BBCLASSEXTEND = "native nativesdk"
--- 
+--
 2.41.0
-
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_series_merge_on_head.2.skip b/meta/lib/patchtest/selftest/files/TestMbox.pretest_series_applies_on_branch.2.fail
similarity index 100%
rename from meta/lib/patchtest/selftest/files/TestMbox.test_series_merge_on_head.2.skip
rename to meta/lib/patchtest/selftest/files/TestMbox.pretest_series_applies_on_branch.2.fail
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_non_auh_upgrade.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_non_auh_upgrade.fail
new file mode 100644
index 0000000000..b8b2cd45e0
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_non_auh_upgrade.fail
@@ -0,0 +1,25 @@
+From 1234567890abcdef1234567890abcdef12345678 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:18:17 -0400
+Subject: [PATCH] selftest-hello: add CVE_STATUS
+
+This upgrade was performed by the Auto Upgrade Helper (auh@yoctoproject.org).
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 2dc352d479e..88c5c98608f 100644
+--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -17,4 +17,5 @@ do_install() {
+ 	install -m 0755 helloworld ${D}${bindir}
+ }
+
++CVE_STATUS[CVE-2024-12345] = "not-applicable-platform: Issue only applies on Windows"
+ BBCLASSEXTEND = "native nativesdk"
+--
+2.45.1
+
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_non_auh_upgrade.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_non_auh_upgrade.pass
new file mode 100644
index 0000000000..2eb77ada3e
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_non_auh_upgrade.pass
@@ -0,0 +1,25 @@
+From f91073242268d2b2c1a1a705e7fd585679f78a59 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:18:17 -0400
+Subject: [PATCH] selftest-hello: add CVE_STATUS
+
+This should pass the test_non_auh_upgrade selftest.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 2dc352d479e..88c5c98608f 100644
+--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -17,4 +17,5 @@ do_install() {
+ 	install -m 0755 helloworld ${D}${bindir}
+ }
+
++CVE_STATUS[CVE-2024-12345] = "not-applicable-platform: Issue only applies on Windows"
+ BBCLASSEXTEND = "native nativesdk"
+--
+2.45.1
+
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_target_mailing_list.1.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_target_mailing_list.1.fail
new file mode 100644
index 0000000000..5ec8dd13b6
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_target_mailing_list.1.fail
@@ -0,0 +1,26 @@
+From f91073242268d2b2c1a1a705e7fd585679f78a59 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:18:17 -0400
+Subject: [meta-openembedded][PATCH] selftest-hello: add CVE_STATUS
+
+This should fail test_target_mailing_list because the subject contains
+a [meta-openembedded] tag indicating it targets the wrong mailing list.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 2dc352d479e..88c5c98608f 100644
+--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -17,4 +17,5 @@ do_install() {
+ 	install -m 0755 helloworld ${D}${bindir}
+ }
+
++CVE_STATUS[CVE-2024-12345] = "not-applicable-platform: Issue only applies on Windows"
+ BBCLASSEXTEND = "native nativesdk"
+--
+2.45.1
+
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_target_mailing_list.2.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_target_mailing_list.2.fail
new file mode 100644
index 0000000000..21dac46db8
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_target_mailing_list.2.fail
@@ -0,0 +1,24 @@
+From 1234567890abcdef1234567890abcdef12345678 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:18:17 -0400
+Subject: [PATCH] bitbake: add patchtest selftest note
+
+This should fail test_target_mailing_list because it touches the
+bitbake/ directory, which belongs to the bitbake mailing list.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ bitbake/contrib/patchtest-selftest.txt | 1 +
+ 1 file changed, 1 insertion(+)
+ create mode 100644 bitbake/contrib/patchtest-selftest.txt
+
+diff --git a/bitbake/contrib/patchtest-selftest.txt b/bitbake/contrib/patchtest-selftest.txt
+new file mode 100644
+index 00000000000..9a8f3b2e1c4
+--- /dev/null
++++ b/bitbake/contrib/patchtest-selftest.txt
+@@ -0,0 +1 @@
++This file is used by the patchtest selftest suite.
+--
+2.45.1
+
diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_target_mailing_list.pass b/meta/lib/patchtest/selftest/files/TestMbox.test_target_mailing_list.pass
new file mode 100644
index 0000000000..9f3cd4d09a
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_target_mailing_list.pass
@@ -0,0 +1,25 @@
+From f91073242268d2b2c1a1a705e7fd585679f78a59 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:18:17 -0400
+Subject: [PATCH] selftest-hello: add CVE_STATUS
+
+This should pass the test_target_mailing_list selftest.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 2dc352d479e..88c5c98608f 100644
+--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -17,4 +17,5 @@ do_install() {
+ 	install -m 0755 helloworld ${D}${bindir}
+ }
+
++CVE_STATUS[CVE-2024-12345] = "not-applicable-platform: Issue only applies on Windows"
+ BBCLASSEXTEND = "native nativesdk"
+--
+2.45.1
+
diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_max_line_length.fail b/meta/lib/patchtest/selftest/files/TestMetadata.test_max_line_length.fail
new file mode 100644
index 0000000000..e4a6130d1c
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_max_line_length.fail
@@ -0,0 +1,26 @@
+From 1234567890abcdef1234567890abcdef12345678 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:18:17 -0400
+Subject: [PATCH] selftest-hello: update DESCRIPTION
+
+This should fail the test_max_line_length selftest.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 2dc352d479e..d937759f157 100644
+--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -1,4 +1,5 @@
+-DESCRIPTION = "Simple helloworld application -- selftest variant"
++DESCRIPTION = "Simple helloworld application -- selftest variant, \
++               and this continuation line is intentionally very long to exceed the maximum allowed line length of two hundred characters as enforced by the patchtest framework for recipe metadata files"
+ SECTION = "examples"
+ LICENSE = "MIT"
+ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+--
+2.45.1
+
diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_max_line_length.pass b/meta/lib/patchtest/selftest/files/TestMetadata.test_max_line_length.pass
new file mode 100644
index 0000000000..ae53374eef
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_max_line_length.pass
@@ -0,0 +1,25 @@
+From f91073242268d2b2c1a1a705e7fd585679f78a59 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:18:17 -0400
+Subject: [PATCH] selftest-hello: add CVE_STATUS
+
+This should pass the test_max_line_length selftest.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 2dc352d479e..88c5c98608f 100644
+--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -17,4 +17,5 @@ do_install() {
+ 	install -m 0755 helloworld ${D}${bindir}
+ }
+
++CVE_STATUS[CVE-2024-12345] = "not-applicable-platform: Issue only applies on Windows"
+ BBCLASSEXTEND = "native nativesdk"
+--
+2.45.1
+
diff --git a/meta/lib/patchtest/selftest/files/TestPatch.test_patch_malformed_context.fail b/meta/lib/patchtest/selftest/files/TestPatch.test_patch_malformed_context.fail
new file mode 100644
index 0000000000..31f481daa8
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestPatch.test_patch_malformed_context.fail
@@ -0,0 +1,38 @@
+From bbbb2222bbbb2222bbbb2222bbbb2222bbbb2222 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:54:50 -0400
+Subject: [PATCH] selftest-hello: add patch format test
+
+This should fail the test_patch_malformed_context test.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ .../selftest-hello/files/0001-test-format.patch | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-test-format.patch
+
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-test-format.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-test-format.patch
+new file mode 100644
+index 00000000000..210ff38b0a4
+--- /dev/null
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-test-format.patch
+@@ -0,0 +1,17 @@
++From abc123def456abc123def456abc123def456abc1 Mon Sep 17 00:00:00 2001
++From: Test Author <test@example.com>
++Date: Mon, 01 Jan 2024 00:00:00 +0000
++Subject: [PATCH] example: fix
++
++Upstream-Status: Backport [https://example.com/fix]
++
++Signed-off-by: Test Author <test@example.com>
++---
++diff --git a/example.c b/example.c
++--- a/example.c
+++++ b/example.c
++@@ -1,3 +1,3 @@
++context line
++-old line
+++new line
++ closing line
+-- 
+2.45.1
diff --git a/meta/lib/patchtest/selftest/files/TestPatch.test_patch_malformed_context.pass b/meta/lib/patchtest/selftest/files/TestPatch.test_patch_malformed_context.pass
new file mode 100644
index 0000000000..f594f4715f
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestPatch.test_patch_malformed_context.pass
@@ -0,0 +1,38 @@
+From aaaa1111aaaa1111aaaa1111aaaa1111aaaa1111 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:54:50 -0400
+Subject: [PATCH] selftest-hello: add patch format test
+
+This should pass the test_patch_malformed_context test.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ .../selftest-hello/files/0001-test-format.patch | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-test-format.patch
+
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-test-format.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-test-format.patch
+new file mode 100644
+index 00000000000..cdc7ae9a2ab
+--- /dev/null
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-test-format.patch
+@@ -0,0 +1,17 @@
++From abc123def456abc123def456abc123def456abc1 Mon Sep 17 00:00:00 2001
++From: Test Author <test@example.com>
++Date: Mon, 01 Jan 2024 00:00:00 +0000
++Subject: [PATCH] example: fix
++
++Upstream-Status: Backport [https://example.com/fix]
++
++Signed-off-by: Test Author <test@example.com>
++---
++diff --git a/example.c b/example.c
++--- a/example.c
+++++ b/example.c
++@@ -1,3 +1,3 @@
++ context line
++-old line
+++new line
++ closing line
+-- 
+2.45.1
diff --git a/meta/lib/patchtest/selftest/files/TestPatch.test_patch_trailing_whitespace.fail b/meta/lib/patchtest/selftest/files/TestPatch.test_patch_trailing_whitespace.fail
new file mode 100644
index 0000000000..9f70cc1145
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestPatch.test_patch_trailing_whitespace.fail
@@ -0,0 +1,38 @@
+From dddd4444dddd4444dddd4444dddd4444dddd4444 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:54:50 -0400
+Subject: [PATCH] selftest-hello: add patch format test
+
+This should fail the test_patch_trailing_whitespace test.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ .../selftest-hello/files/0001-test-format.patch | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-test-format.patch
+
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-test-format.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-test-format.patch
+new file mode 100644
+index 00000000000..5eaaab7dc49
+--- /dev/null
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-test-format.patch
+@@ -0,0 +1,17 @@
++From abc123def456abc123def456abc123def456abc1 Mon Sep 17 00:00:00 2001
++From: Test Author <test@example.com>
++Date: Mon, 01 Jan 2024 00:00:00 +0000
++Subject: [PATCH] example: fix
++
++Upstream-Status: Backport [https://example.com/fix]
++
++Signed-off-by: Test Author <test@example.com>
++---
++diff --git a/example.c b/example.c
++--- a/example.c
+++++ b/example.c
++@@ -1,3 +1,3 @@
++ context line
++-old line
+++new line   
++ closing line
+-- 
+2.45.1
diff --git a/meta/lib/patchtest/selftest/files/TestPatch.test_patch_trailing_whitespace.pass b/meta/lib/patchtest/selftest/files/TestPatch.test_patch_trailing_whitespace.pass
new file mode 100644
index 0000000000..6bb39c9592
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestPatch.test_patch_trailing_whitespace.pass
@@ -0,0 +1,38 @@
+From cccc3333cccc3333cccc3333cccc3333cccc3333 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:54:50 -0400
+Subject: [PATCH] selftest-hello: add patch format test
+
+This should pass the test_patch_trailing_whitespace test.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ .../selftest-hello/files/0001-test-format.patch | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-test-format.patch
+
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-test-format.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-test-format.patch
+new file mode 100644
+index 00000000000..cdc7ae9a2ab
+--- /dev/null
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-test-format.patch
+@@ -0,0 +1,17 @@
++From abc123def456abc123def456abc123def456abc1 Mon Sep 17 00:00:00 2001
++From: Test Author <test@example.com>
++Date: Mon, 01 Jan 2024 00:00:00 +0000
++Subject: [PATCH] example: fix
++
++Upstream-Status: Backport [https://example.com/fix]
++
++Signed-off-by: Test Author <test@example.com>
++---
++diff --git a/example.c b/example.c
++--- a/example.c
+++++ b/example.c
++@@ -1,3 +1,3 @@
++ context line
++-old line
+++new line
++ closing line
+-- 
+2.45.1
diff --git a/meta/lib/patchtest/selftest/files/TestPatch.test_upstream_status_presence_format.fail b/meta/lib/patchtest/selftest/files/TestPatch.test_upstream_status_presence_format.fail
new file mode 100644
index 0000000000..b00aac5fbb
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestPatch.test_upstream_status_presence_format.fail
@@ -0,0 +1,61 @@
+From 1234567890abcdef1234567890abcdef12345678 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:54:50 -0400
+Subject: [PATCH] selftest-hello: add upstream fix
+
+This should fail the test_upstream_status_presence_format selftest
+because the embedded patch is missing Upstream-Status.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ .../files/0001-Fix-upstream-issue.patch       | 23 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 26 insertions(+), 1 deletion(-)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-upstream-issue.patch
+
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-upstream-issue.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-upstream-issue.patch
+new file mode 100644
+index 00000000000..8a4f9329303
+--- /dev/null
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-upstream-issue.patch
+@@ -0,0 +1,23 @@
++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
++From: Trevor Gamblin <tgamblin@baylibre.com>
++Date: Tue, 29 Aug 2023 14:08:20 -0400
++Subject: [PATCH] Fix upstream issue
++
++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
++---
++ strlen.c | 1 +
++ 1 file changed, 1 insertion(+)
++
++diff --git a/strlen.c b/strlen.c
++index 1788f38..83d7918 100644
++--- a/strlen.c
+++++ b/strlen.c
++
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("FIXED!!!\n");
++
++	return 0;
++}
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 2dc352d479e..d937759f157 100644
+--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -3,6 +3,8 @@ SECTION = "examples"
+ LICENSE = "MIT"
+ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+-SRC_URI = "file://helloworld.c"
++SRC_URI = "file://helloworld.c \
++           file://0001-Fix-upstream-issue.patch \
++	   "
+
+ S = "${UNPACKDIR}"
+--
+2.45.1
+
diff --git a/meta/lib/patchtest/selftest/files/TestPatch.test_upstream_status_presence_format.pass b/meta/lib/patchtest/selftest/files/TestPatch.test_upstream_status_presence_format.pass
new file mode 100644
index 0000000000..0316316cd7
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestPatch.test_upstream_status_presence_format.pass
@@ -0,0 +1,62 @@
+From c9519f11502d5bb5c143ed43b4c981b6a211bdf9 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 31 May 2024 09:54:50 -0400
+Subject: [PATCH] selftest-hello: add upstream fix
+
+This should pass the test_upstream_status_presence_format selftest.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ .../files/0001-Fix-upstream-issue.patch       | 25 +++++++++++++++++++
+ .../selftest-hello/selftest-hello_1.0.bb      |  4 ++-
+ 2 files changed, 28 insertions(+), 1 deletion(-)
+ create mode 100644 meta-selftest/recipes-test/selftest-hello/files/0001-Fix-upstream-issue.patch
+
+diff --git a/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-upstream-issue.patch b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-upstream-issue.patch
+new file mode 100644
+index 00000000000..8a4f9329303
+--- /dev/null
++++ b/meta-selftest/recipes-test/selftest-hello/files/0001-Fix-upstream-issue.patch
+@@ -0,0 +1,25 @@
++From b26a31186e6ee2eb1f506d5f2f9394d327a0df2f Mon Sep 17 00:00:00 2001
++From: Trevor Gamblin <tgamblin@baylibre.com>
++Date: Tue, 29 Aug 2023 14:08:20 -0400
++Subject: [PATCH] Fix upstream issue
++
++Upstream-Status: Backport(http://example.com/example)
++
++Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
++---
++ strlen.c | 1 +
++ 1 file changed, 1 insertion(+)
++
++diff --git a/strlen.c b/strlen.c
++index 1788f38..83d7918 100644
++--- a/strlen.c
+++++ b/strlen.c
++
++int main() {
++
++	printf("%d\n", str_len(string1));
++	printf("%d\n", str_len(string2));
++	printf("FIXED!!!\n");
++
++	return 0;
++}
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 2dc352d479e..d937759f157 100644
+--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -3,6 +3,8 @@ SECTION = "examples"
+ LICENSE = "MIT"
+ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+-SRC_URI = "file://helloworld.c"
++SRC_URI = "file://helloworld.c \
++           file://0001-Fix-upstream-issue.patch \
++	   "
+
+ S = "${UNPACKDIR}"
+--
+2.45.1
+
-- 
2.54.0


