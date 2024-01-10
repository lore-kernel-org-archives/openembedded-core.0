Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EFBC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 10:45:18 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.9026.1704883507837027589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 02:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b8LDIBDO;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5585fe04266so356656a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 02:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704883506; x=1705488306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mORaMypaUYqFcWOxIwYnbdOqGWQG083nT1gEhQGA2ow=;
        b=b8LDIBDOQ3Q8r/pYsrGQ9ywNyOg4wQ65AqtHVf1Mh5x8YdtYyjQ89nRVACQgEkLxyq
         YOy3ZWtbzn7aSMKBZPge5ITUPUF7eZFAXFBF413ODTOVxfs8ew2l5fS3m3YdYbekFw9C
         XfECvyBm6Uz9PZVBB+s3NwX8TxQFFQZ62vbSNwBqqSfgUguW8+HI7gLYcAhO1NtN9Jxs
         ZHbeUxiZb3a+GDqUZJTv7RbdlXDK8er6Z/zS6wKwDHGQqRa59J8vfm8xqc21NFUHo7db
         6Piy5dUSJ124INylM2fowVhzYFYNQfZhTUAYkI/1lbpUV5aRPjyg1NysRs7umIpzchFq
         sy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704883506; x=1705488306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mORaMypaUYqFcWOxIwYnbdOqGWQG083nT1gEhQGA2ow=;
        b=qWs0U32NUMMkC5S31+at6NzDiW2ZKb4K1HD3eH/Txki//KvmssifjurDt/2OqZQmG1
         70+hEroIZKGAEgpc++VVTLpHeBl1KiilmfAvczWCyd6tu6o9M5SzvRAYyTpKWVP3Dwik
         iodA1EX0j6vNbIo4eFrfFU72cjvgJDBWcYI6InCA/uavjZRPeuSP6KIxc7WNRnI1vDPU
         SUjCELD7LYmnXreqGXBVIyYbVNtSG5QjK4ZdsRZqm/Rmu2UjqfIRyxfhKFn3HUn8urJW
         iYhYmMwJvkVbVqoASfacwBf41HdBy7qFFj5BM2l7BK8CbazFqCVi0vC7OejnkwOYebJ9
         V38w==
X-Gm-Message-State: AOJu0YzRgVAb3SnRZ7FIDDvfGpS8oQuE0w+iPvlYSp/qQWe3DJUe9DEm
	nA2tLkuoPDs0C71VIY7Qub0ZfM+lxeY=
X-Google-Smtp-Source: AGHT+IG7HS+vYfsVSu6BjJMKctJilpoWNWeuYfRL5owPvEySJ1GK8r1wEMn9b50VzfbLSeSIUionXw==
X-Received: by 2002:a17:906:7ac6:b0:a29:36b2:820b with SMTP id k6-20020a1709067ac600b00a2936b2820bmr472957ejo.4.1704883505886;
        Wed, 10 Jan 2024 02:45:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z21-20020a17090655d500b00a26af905229sm1952057ejp.29.2024.01.10.02.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 02:45:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] selftest/SStatePrintdiff: ensure all base signatures are present in sstate in test_image_minimal_vs_base_do_configure
Date: Wed, 10 Jan 2024 11:44:59 +0100
Message-Id: <20240110104459.3606850-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 10:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193489

The test relies on all tasks in the dependency tree of the tasks being changed
having valid signatures in sstate, so that the recursive discovery of the
base invalid tasks stops there, and doesn't go further.

This may not always occur, particularly when hash equivalency combined with
different build host architectures prevents them from getting created in regular builds:
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2725/steps/15/logs/stdio

The other two tests (that change specific recipes) already ensure this, but
this test (which changes a basic task definition) does not.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 34 ++++++++++++---------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 6a6c2e5f11a..f7632286450 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -797,13 +797,14 @@ TMPDIR = "${{TOPDIR}}/tmp-sstateprintdiff-difftmp-{}"
         for item in expected_difftmp_output:
             self.assertIn(item, result_difftmp.output, msg = "Item {} not found in output:\n{}".format(item, result_difftmp.output))
 
-    def run_test_printdiff_changeconfig(self, target, change_content, expected_sametmp_output, expected_difftmp_output):
+    def run_test_printdiff_changeconfig(self, target, change_bbtasks, change_content, expected_sametmp_output, expected_difftmp_output):
         import time
         self.write_config("""
 TMPDIR = "${{TOPDIR}}/tmp-sstateprintdiff-sametmp-{}"
 """.format(time.time()))
         bitbake("--runall build --runall deploy_source_date_epoch {}".format(target))
         bitbake("-S none {}".format(target))
+        bitbake(" ".join(change_bbtasks))
         self.append_config(change_content)
         result_sametmp = bitbake("-S printdiff {}".format(target))
 
@@ -859,24 +860,27 @@ expected_sametmp_output, expected_difftmp_output)
 
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
+        change_bbtasks = ('zstd-native:do_configure',
+'texinfo-dummy-native:do_configure',
+'ldconfig-native:do_configure',
+'gettext-minimal-native:do_configure',
+'tzcode-native:do_configure',
+'makedevs-native:do_configure',
+'pigz-native:do_configure',
+'update-rc.d-native:do_configure',
+'unzip-native:do_configure',
+'gnu-config-native:do_configure')
+
+        expected_output = ["Task {} couldn't be used from the cache because:".format(t) for t in change_bbtasks] + [
 "We need hash",
-"most recent matching task was")
-        expected_sametmp_output = expected_output + (
+"most recent matching task was"]
+
+        expected_sametmp_output = expected_output + [
 "Variable base_do_configure value changed",
-'+	echo "this changes base_do_configure() definiton "')
+'+	echo "this changes base_do_configure() definiton "']
         expected_difftmp_output = expected_output
 
-        self.run_test_printdiff_changeconfig("core-image-minimal",
+        self.run_test_printdiff_changeconfig("core-image-minimal",change_bbtasks,
 """
 INHERIT += "base-do-configure-modified"
 """,
-- 
2.39.2


