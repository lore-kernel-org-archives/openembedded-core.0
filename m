Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED1BC4167B
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 13:46:18 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.22350.1702561569123060730
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 05:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OCv6n/x5;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c41df5577so49535855e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 05:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702561567; x=1703166367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFiRefpgRKlkCGzi5QCtI+ODA24uuFXrgdpr0+dEMMM=;
        b=OCv6n/x51Elq+8Xncvw6N01ATbzsOG5UYx4cDZc0AT1QUx1p/AIuNlM6JwRHW6U2md
         gYQejk+mwv1l2Raesu6cZpnWnGPAeksCmnSLoHLXye82/2tOcm8yYktsSLN7UVJJTOTE
         utvfK/xU0qNUiO0eberJT+BO7vW4xjOqhWnYUhrXchnGWVT42Aprjmook5KMSc2vWe4f
         GIVwagCY09TniZ6EB7hQY+Jp7c17+YrongEaaTWeJh9Us/IImfbZ6isLKtXgBsqLbOCB
         lBNG0/zmaVQe/CfkHDvFwrt7DpBcxbnsk7pSvFHFjYrjgtLhQi2p/y9VkbIyPpwuAum7
         cUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702561567; x=1703166367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFiRefpgRKlkCGzi5QCtI+ODA24uuFXrgdpr0+dEMMM=;
        b=iCSpjpKQ1SkwEMByb5kPoGRa8Ebgh2H30T7934WRhulislQYaMhCNCl8rgAY9pRfw5
         t9vgPK7Rtmrtp3vSmpnhAFG/bTDZZwCW7lfE0jdYtX+d4fUFQQbYvQsoSi4icFYm+T2Y
         f9CQdFoRbQD6ZhLWSlsWhiwxQyUI0/NDQokGBBDbHrin70dulmING4QPCTGzfYtfsySS
         ZVBVjZejgvZldGipkpMiA6SG88W87Soxwd2wygSZmSiPrrmTcoG8Yu8i8cNlcIi50zxX
         htdfrkiqlT4t44Ws0N/s2rjecw1U0mUo4IvRXCIKCNwjxlgt9CsvhrPeuOgc5XIBvYEF
         V0YA==
X-Gm-Message-State: AOJu0Yx5Xq9ty0TRyEhZCgGG++yvQ55kP0/w+/mWbpr9LODh+YPBfw+a
	patA4NxZUd9G89ZZCEJEqklPGtYLiUI=
X-Google-Smtp-Source: AGHT+IFawwrJO3Z2YvpzuNgvR3mcay1dUOFdEWeHohMZI48yIXf2fBihwRMGKn3M5jgOByG7h/DhXA==
X-Received: by 2002:a05:600c:17d0:b0:40c:3617:ee1a with SMTP id y16-20020a05600c17d000b0040c3617ee1amr2422701wmo.142.1702561567372;
        Thu, 14 Dec 2023 05:46:07 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c1d0f00b003feae747ff2sm27293710wms.35.2023.12.14.05.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:46:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/9] selftest/sstatetests: fix up printdiff test to match rework of printdiff logic
Date: Thu, 14 Dec 2023 14:45:24 +0100
Message-Id: <20231214134528.1973602-5-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231214134528.1973602-1-alex@linutronix.de>
References: <20231214134528.1973602-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 13:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192375

The rework changes the console output significantly: where previously
printdiff would report the most basic invalid tasks it could find,
with this change the most top-level tasks are reported instead. This
is not a problem as diffsigs has its own task recursion facility, and will
track down the actual change anyway. However the changes still need to be reflected
in the selftests.

Note that printdiff is run on one specific target task rather than
overall do_build for a recipe. Otherwise find_siginfo would run
glob.glob("*/*/*taskname*") against autobuilder sstate cache for each
of those tasks (six or seven times) - this is an expensive operation
taking several minutes, and it's best to do it only once per test.

[YOCTO #15289]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../perlcross_%.bbappend}                     |  0
 meta/lib/oeqa/selftest/cases/sstatetests.py   | 40 +++++++++----------
 2 files changed, 18 insertions(+), 22 deletions(-)
 rename meta-selftest/recipes-test/{quilt-native/quilt-native_%.bbappend => perlcross/perlcross_%.bbappend} (100%)

diff --git a/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend b/meta-selftest/recipes-test/perlcross/perlcross_%.bbappend
similarity index 100%
rename from meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
rename to meta-selftest/recipes-test/perlcross/perlcross_%.bbappend
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index f52ca77c09c..f5b3437d86b 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -824,14 +824,17 @@ TMPDIR = "${{TOPDIR}}/tmp-sstateprintdiff-difftmp-{}"
 
 
     # Check if printdiff walks the full dependency chain from the image target to where the change is in a specific recipe
-    def test_image_minimal_vs_quilt(self):
-        expected_output = ("Task quilt-native:do_install couldn't be used from the cache because:",
+    def test_image_minimal_vs_perlcross(self):
+        expected_output = ("Task core-image-minimal:do_create_spdx couldn't be used from the cache because:",
 "We need hash",
 "most recent matching task was")
-        expected_sametmp_output = expected_output + ("Variable do_install value changed",'+    echo "this changes the task signature"')
+        expected_sametmp_output = expected_output + (
+"Hash for task dependency perlcross-native:do_install changed from",
+"Variable do_install value changed",
+'+    echo "this changes the task signature"')
         expected_difftmp_output = expected_output
 
-        self.run_test_printdiff_changerecipe("core-image-minimal", "quilt-native", "-c do_install quilt-native",
+        self.run_test_printdiff_changerecipe("core-image-minimal:do_create_spdx", "perlcross", "-c do_install perlcross-native",
 """
 do_install:append() {
     echo "this changes the task signature"
@@ -843,15 +846,15 @@ expected_sametmp_output, expected_difftmp_output)
     def test_gcc_runtime_vs_gcc_source(self):
         gcc_source_pn = 'gcc-source-%s' % get_bb_vars(['PV'], 'gcc')['PV']
 
-        expected_output = ("Task {}:do_preconfigure couldn't be used from the cache because:".format(gcc_source_pn),
+        expected_output = ("Task gcc-runtime:do_package_write_rpm couldn't be used from the cache because:",
 "We need hash",
 "most recent matching task was")
-        expected_sametmp_output = expected_output + ("Variable do_preconfigure value changed",'+    print("this changes the task signature")')
-        #FIXME: printdiff is supposed to find at least one preconfigure task signature in the sstate cache, but isn't able to
-        #expected_difftmp_output = expected_output
-        expected_difftmp_output = ()
+        expected_sametmp_output = expected_output + ("Hash for task dependency {}:do_preconfigure changed from".format(gcc_source_pn),
+"Variable do_preconfigure value changed",
+'+    print("this changes the task signature")')
+        expected_difftmp_output = expected_output
 
-        self.run_test_printdiff_changerecipe("gcc-runtime", "gcc-source", "-c do_preconfigure {}".format(gcc_source_pn),
+        self.run_test_printdiff_changerecipe("gcc-runtime:do_package_write_rpm", "gcc-source", "-c do_preconfigure {}".format(gcc_source_pn),
 """
 python do_preconfigure:append() {
     print("this changes the task signature")
@@ -861,22 +864,15 @@ expected_sametmp_output, expected_difftmp_output)
 
     # Check if changing a really base task definiton is reported against multiple core recipes using it
     def test_image_minimal_vs_base_do_configure(self):
-        expected_output = ("Task zstd-native:do_configure couldn't be used from the cache because:",
-"Task texinfo-dummy-native:do_configure couldn't be used from the cache because:",
-"Task ldconfig-native:do_configure couldn't be used from the cache because:",
-"Task gettext-minimal-native:do_configure couldn't be used from the cache because:",
-"Task tzcode-native:do_configure couldn't be used from the cache because:",
-"Task makedevs-native:do_configure couldn't be used from the cache because:",
-"Task pigz-native:do_configure couldn't be used from the cache because:",
-"Task update-rc.d-native:do_configure couldn't be used from the cache because:",
-"Task unzip-native:do_configure couldn't be used from the cache because:",
-"Task gnu-config-native:do_configure couldn't be used from the cache because:",
+        expected_output = ("Task core-image-minimal:do_populate_lic_deploy couldn't be used from the cache because:",
 "We need hash",
 "most recent matching task was")
-        expected_sametmp_output = expected_output + ("Variable base_do_configure value changed",'+	echo "this changes base_do_configure() definiton "')
+        expected_sametmp_output = expected_output + ("Hash for task dependency gnu-config-native:do_configure changed from",
+"Variable base_do_configure value changed",
+'+	echo "this changes base_do_configure() definiton "')
         expected_difftmp_output = expected_output
 
-        self.run_test_printdiff_changeconfig("core-image-minimal",
+        self.run_test_printdiff_changeconfig("core-image-minimal:do_populate_lic_deploy",
 """
 INHERIT += "base-do-configure-modified"
 """,
-- 
2.39.2


