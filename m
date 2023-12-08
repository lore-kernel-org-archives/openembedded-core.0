Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686E3C46CA3
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 10:15:32 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.17060.1702030529908686140
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 02:15:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hrGNZ25t;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40c2308faedso19726215e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702030528; x=1702635328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouPqT8stXnd/8PZJ4mPjocEERjQu7mN7hq+NnHCnA40=;
        b=hrGNZ25tCJ05uXkICi34N0EGFsjvAeh7g7KPn0a/4mc8S8s3PDLCGHaMCgPS0//l+n
         kDe/Jbj1H60mp56knjnIP/hOOwfmdd6K4EmPntEqtUXo8YH60Rmo8AyVTKXQzsUL2o0q
         YdP+mCxcr16216FF4GiXK7uHyUzucNPfxWcEhS36BV8phG/tluMmju4wfVr1snJuxyUa
         CgJauFXsIMyH8oDi1Jk4P1fkCOYUywKjrTYA9At2dhrFxXC5q8+Ik6y1y5WZBygjFnCK
         u2uM9OhJOrNKJXG54kgay2DRk1JURSmln7vXlL8oraXT7Rw7GnnWntEsf3RwKdJdDvmT
         AHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030528; x=1702635328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ouPqT8stXnd/8PZJ4mPjocEERjQu7mN7hq+NnHCnA40=;
        b=WrpsZjLLWBcHN8tR8KDz5SHINXFAiZCb+QBL0ecCSpGv4C3XiBW4yLxoD6YD0x46Bs
         ja5sqZA+OEqPKfuBVO7DB0ZOJ9K9v+i8+qGnqaSVsYXt2XwT1qRwNdgcTh9I73AODnxH
         MbyelnFeJzK7cxrYhu97Oqzp8sEyGQNm7k45cRUX2h/9GbE6Q4iXBTTlBzlGEByAh0bh
         jgPVV+Eeu/gcy3jHLIabTJzF+ViABTYfxTykn+6LACdhFw+u3St1V4lIm2jVBGtjWxo0
         abTmCcA89sXtyqeQYNGwdEsU0KzD4ITV9ETNhW2bGjvvfKoVuFVnyOyCzmcPL1tQdiPm
         NOmA==
X-Gm-Message-State: AOJu0Ywz4ApEJt40pq06SHkj4uL4qlZtBnTxpXW99AmYORAAjGoqN9Df
	iiUJ0/bL10M9CxYUuG+JtNb/3L5KiXA=
X-Google-Smtp-Source: AGHT+IH+9bEAL+DKGved3pX7cGyeVQOHmj7MyewHYH/K9cj1TbjyWGj8R3LV4syt2fCssF0z9hfzKA==
X-Received: by 2002:a05:600c:220a:b0:40b:5e59:c557 with SMTP id z10-20020a05600c220a00b0040b5e59c557mr2191957wml.129.1702030527898;
        Fri, 08 Dec 2023 02:15:27 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b16-20020a05600c4e1000b0040c310abc4bsm2746707wmq.43.2023.12.08.02.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:15:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/6] selftest/sstatetests: do not delete custom $TMPDIRs under build-st when testing printdiff
Date: Fri,  8 Dec 2023 11:15:18 +0100
Message-Id: <20231208101522.198832-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208101522.198832-1-alex@linutronix.de>
References: <20231208101522.198832-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 10:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192029

If the tests fail, these contain useful artefacts, and so should
be kept. If the test succeeds the whole build-st/ is deleted.

Also, give them unique names, as otherwise the tests would
step on each other.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 22 ++++++++++-----------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 79001854501..795cd5bd85f 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -777,10 +777,10 @@ addtask tmptask2 before do_tmptask1
 
 class SStatePrintdiff(SStateBase):
     def run_test_printdiff_changerecipe(self, target, change_recipe, change_bbtask, change_content, expected_sametmp_output, expected_difftmp_output):
+        import time
         self.write_config("""
-TMPDIR = "${TOPDIR}/tmp-sstateprintdiff"
-""")
-        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff")
+TMPDIR = "${{TOPDIR}}/tmp-sstateprintdiff-sametmp-{}"
+""".format(time.time()))
         # Use runall do_build to ensure any indirect sstate is created, e.g. tzcode-native on both x86 and
         # aarch64 hosts since only allarch target recipes depend upon it and it may not be built otherwise.
         # A bitbake -c cleansstate tzcode-native would cause some of these tests to error for example.
@@ -791,9 +791,8 @@ TMPDIR = "${TOPDIR}/tmp-sstateprintdiff"
         result_sametmp = bitbake("-S printdiff {}".format(target))
 
         self.write_config("""
-TMPDIR = "${TOPDIR}/tmp-sstateprintdiff-2"
-""")
-        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff-2")
+TMPDIR = "${{TOPDIR}}/tmp-sstateprintdiff-difftmp-{}"
+""".format(time.time()))
         result_difftmp = bitbake("-S printdiff {}".format(target))
 
         self.delete_recipeinc(change_recipe)
@@ -803,20 +802,19 @@ TMPDIR = "${TOPDIR}/tmp-sstateprintdiff-2"
             self.assertIn(item, result_difftmp.output, msg = "Item {} not found in output:\n{}".format(item, result_difftmp.output))
 
     def run_test_printdiff_changeconfig(self, target, change_content, expected_sametmp_output, expected_difftmp_output):
+        import time
         self.write_config("""
-TMPDIR = "${TOPDIR}/tmp-sstateprintdiff"
-""")
-        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff")
+TMPDIR = "${{TOPDIR}}/tmp-sstateprintdiff-sametmp-{}"
+""".format(time.time()))
         bitbake("--runall build --runall deploy_source_date_epoch {}".format(target))
         bitbake("-S none {}".format(target))
         self.append_config(change_content)
         result_sametmp = bitbake("-S printdiff {}".format(target))
 
         self.write_config("""
-TMPDIR = "${TOPDIR}/tmp-sstateprintdiff-2"
-""")
+TMPDIR = "${{TOPDIR}}/tmp-sstateprintdiff-difftmp-{}"
+""".format(time.time()))
         self.append_config(change_content)
-        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff-2")
         result_difftmp = bitbake("-S printdiff {}".format(target))
 
         for item in expected_sametmp_output:
-- 
2.39.2


