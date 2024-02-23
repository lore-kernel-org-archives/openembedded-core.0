Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0544C54E4C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 12:01:56 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.9019.1708689709696090317
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 04:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P0VEsv9S;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a3d5e77cfbeso141095766b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 04:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708689708; x=1709294508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BF2shshDxKBtCT7/MXQqYBl25A0ZFLNv5UbtYZIopXs=;
        b=P0VEsv9ShfRY9TvySRBs72zMsPMMsQN013nL8XaEGFb2hYuBA3+qI/EsD9jofD6loa
         QLyWMbQpAKb3Mrq+YpPqJVYCwXvytwRLfDmhwElzHAaQT1NVEsv6ZfdtVRNqb2fxi8IN
         CpC5DgboSNFlS+CJdTBs7mLDZp1SCy5Fd3jEZkXFwE3uLiP4ZLWQ3Dvo6EuP/9FJvNsh
         rqt68wwOISSdTdbG1R1V8exEwplBm+C/TeQjRCMrd9WPDQRX7BWQhXA5GIJQJCWWrAC8
         qPmgfOmlHV5OATfIqJMn8nEB/64SLW3daRJnT6J1ksw/Uhx1WKHET4EmoB/eKoAeJBBb
         qL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708689708; x=1709294508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BF2shshDxKBtCT7/MXQqYBl25A0ZFLNv5UbtYZIopXs=;
        b=M6qHkUyltr00+UWiDoYqZOawSouMoENjSNoRlKlp4h+YQpLh98kkkJc/NQQO+GMP63
         4Dmc8e0Qg0CduujF1C1l+tzE4mUvjLckrNcgaIs3EEhQ2OiIVweDtQS2X4WyIw8uHUpI
         mIHZaTdSH/Zsl3MlsFtHtg4h1WyDERdL5ij5KN1mAM6QeWjzIBVmcvVTndhbGX63ne/X
         lqj8hAGysIL7Z4sNmkCZMKHw015WwVKNqCT4JhIYOlPVn8PO6BMzoLbMW7nATkGX+OSl
         YJNCYusGAQpCGHKXiN0CyL5MvMDcxL8tA/NEADZFbLDrV997YQHz5APXgsQU93B2G1qg
         cFAw==
X-Gm-Message-State: AOJu0Yz0GJ9kMAnLffCUKLvGppnIQTVo1BsW+mLT+XBYPhRl4pNzKJfs
	juSy9SbHUJ9yvbrbyAkD932N7j9MHoUCDbPub72IiD/jfr9mqgKWMR+8GbnD
X-Google-Smtp-Source: AGHT+IF8URTG1yxsIMHIDsxF+SA17Ko2xt/b0WrhgdjsTP40HIyw5Um2UQoLbCMtyLE8/myyf7CWEQ==
X-Received: by 2002:a17:906:c354:b0:a3f:adad:9ce1 with SMTP id ci20-20020a170906c35400b00a3fadad9ce1mr2119516ejb.18.1708689707167;
        Fri, 23 Feb 2024 04:01:47 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906345100b00a3d125b9c0asm220330ejb.81.2024.02.23.04.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 04:01:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 09/10] selftest/sstatetests: move exception list for cache objects to the parent class
Date: Fri, 23 Feb 2024 13:01:33 +0100
Message-Id: <20240223120134.3713127-9-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240223120134.3713127-1-alex@linutronix.de>
References: <20240223120134.3713127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 12:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196069

This is useful not just in cdn/local cache tests, but also in the build bundle test,
and so should be applied by default.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 26 ++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 8d41ead8abf..bb2a1a2fb8c 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -891,13 +891,24 @@ INHERIT += "base-do-configure-modified"
 expected_sametmp_output, expected_difftmp_output)
 
 class SStateCheckObjectPresence(SStateBase):
-    def check_bb_output(self, output, exceptions, check_cdn):
+    def check_bb_output(self, output, targets, exceptions, check_cdn):
         def is_exception(object, exceptions):
             for e in exceptions:
                 if re.search(e, object):
                     return True
             return False
 
+        # sstate is checked for existence of these, but they never get written out to begin with
+        exceptions += ["{}.*image_qa".format(t) for t in targets.split()]
+        exceptions += ["{}.*deploy_source_date_epoch".format(t) for t in targets.split()]
+        exceptions += ["{}.*image_complete".format(t) for t in targets.split()]
+        exceptions += ["linux-yocto.*shared_workdir"]
+        # these get influnced by IMAGE_FSTYPES tweaks in yocto-autobuilder-helper's config.json (on x86-64)
+        # additionally, they depend on noexec (thus, absent stamps) package, install, etc. image tasks,
+        # which makes tracing other changes difficult
+        exceptions += ["{}.*create_spdx".format(t) for t in targets.split()]
+        exceptions += ["{}.*create_runtime_spdx".format(t) for t in targets.split()]
+
         output_l = output.splitlines()
         for l in output_l:
             if l.startswith("Sstate summary"):
@@ -935,17 +946,6 @@ class SStateCheckObjectPresence(SStateBase):
 @OETestTag("yocto-mirrors")
 class SStateMirrors(SStateCheckObjectPresence):
     def run_test(self, machine, targets, exceptions, check_cdn = True):
-        # sstate is checked for existence of these, but they never get written out to begin with
-        exceptions += ["{}.*image_qa".format(t) for t in targets.split()]
-        exceptions += ["{}.*deploy_source_date_epoch".format(t) for t in targets.split()]
-        exceptions += ["{}.*image_complete".format(t) for t in targets.split()]
-        exceptions += ["linux-yocto.*shared_workdir"]
-        # these get influnced by IMAGE_FSTYPES tweaks in yocto-autobuilder-helper's config.json (on x86-64)
-        # additionally, they depend on noexec (thus, absent stamps) package, install, etc. image tasks,
-        # which makes tracing other changes difficult
-        exceptions += ["{}.*create_spdx".format(t) for t in targets.split()]
-        exceptions += ["{}.*create_runtime_spdx".format(t) for t in targets.split()]
-
         if check_cdn:
             self.config_sstate(True)
             self.append_config("""
@@ -959,7 +959,7 @@ MACHINE = "{}"
 """.format(machine))
         result = bitbake("-DD -n {}".format(targets))
         bitbake("-S none {}".format(targets))
-        self.check_bb_output(result.output, exceptions, check_cdn)
+        self.check_bb_output(result.output, targets, exceptions, check_cdn)
 
     def test_cdn_mirror_qemux86_64(self):
         exceptions = []
-- 
2.39.2


