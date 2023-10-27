Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE36C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 12:50:36 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.6070.1698411027726160345
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 05:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eMDlYmHR;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so3484404a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 05:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698411026; x=1699015826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iguo5wYcmdpRgfRlfsbK8ljHFJifvGRev7RtwGJqyVc=;
        b=eMDlYmHRXPzhppkl98AB+AQ7g+YwklN8oqrmbYFYzAMWn0UsdbzggNSJ3MDl8ofGji
         gJOpn2ftyNNAMbHVf2KC1uScFWEUsVEMDTFmKjN40Jbx1rpbPjR/w6w2C2uXpVZFlNLs
         aTm8HU1afNw1tf0iNNaoUrHZOHYD2ux2V4kQlh8maue/xlfK0lHIrfTwGxaxAadCnnwo
         9ON/K9ks1V+wL7yR99RjMbV/3aBTi1gAsfw3zME/ioxZOwdZl/WF9bWI4xaLrZNCCep+
         OLW4fojY8r2AimMZyppF1C0tkgUfDPFiqB6JNmGvYV8z+UaEyj4tLeLNhv5IMInTU+FO
         HHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698411026; x=1699015826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iguo5wYcmdpRgfRlfsbK8ljHFJifvGRev7RtwGJqyVc=;
        b=UkOfhJZnQupSCwS4kwsqaSrhafKXHf31WoM/2iIWx5W7wicLEiJ6Q2GJxW6XsTZbG4
         cGEdjtBXzC6Ww4ebTBFAcaYLlcJL3RRIV8PG/VM7B3OIA8EI9uv5DuYMurSxz/AOPLHA
         kPECKBNfQG+uxpHmeN1tYUVSvAVYwt/zRMU20xsVDNKCFZMtYQtAOCQHu2st5QcvUrIp
         Bf3l69fliMEyDNE8Q9WFbapyX8pDeQjVu8TXr/I0oBb7OmzVBwR/eWgA+l1ZbVlZI8eI
         xP9uh3AbBAmT8uDV4U2jzPY+PTkg9tc6ROIjKBt9wbWxEFJInumi9TsP4hmgvINQxNSR
         1xow==
X-Gm-Message-State: AOJu0Yz6/OHH4VDcGOdq86Ne1D3xF3lOD8997L+Vqqsx/kUpSGRS7Kxx
	8QnaDiN7lJcdheq8e8b0quda9asiOqg=
X-Google-Smtp-Source: AGHT+IG7rDpeNMXlJph5CublbI+12xmy4+BPnX9r7pPR3k7gN/NGuogoSYK3ZzcPpveX6n89B9zbHg==
X-Received: by 2002:a17:907:3f8b:b0:9bd:fa48:83c5 with SMTP id hr11-20020a1709073f8b00b009bdfa4883c5mr1845166ejc.70.1698411025607;
        Fri, 27 Oct 2023 05:50:25 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id r23-20020a170906365700b009a1a653770bsm1142224ejb.87.2023.10.27.05.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 05:50:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] selftest/sstatetests: add a test for CDN sstate cache
Date: Fri, 27 Oct 2023 14:50:19 +0200
Message-Id: <20231027125019.634489-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 12:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189743

Specifically, the test checks that everything needed for building
standard oe-core images for x86_64 and arm64 is available from
the cache (with minor exceptions). Going forward, a complete
world check could be enabled and additional configurations,
but that requires improvements to performance of hash equivalence
server in particular.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>

---
changes 27102023:
- print a list of cache paths that were requested from the server if test fails
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 48 +++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index b96eacc9ad8..329822a5e1e 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -14,6 +14,7 @@ import re
 
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer, get_bb_vars
 from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator import OETestTag
 
 import oe
 import bb.siggen
@@ -886,3 +887,50 @@ expected_sametmp_output, expected_difftmp_output)
 INHERIT += "base-do-configure-modified"
 """,
 expected_sametmp_output, expected_difftmp_output)
+
+@OETestTag("yocto-mirrors")
+class SStateMirrors(SStateBase):
+    def check_bb_output(self, output, exceptions):
+        in_tasks = False
+        missing_objects = []
+        checked_urls = []
+        for l in output.splitlines():
+            if "Testing URL" in l:
+                checked_urls.append(l.split()[3])
+            if "The differences between the current build and any cached tasks start at the following tasks" in l:
+                in_tasks = True
+                continue
+            if "Writing task signature files" in l:
+                in_tasks = False
+                continue
+            if in_tasks:
+                recipe_task = l.split("/")[-1]
+                recipe, task = recipe_task.split(":")
+                for e in exceptions:
+                    if e[0] in recipe and task == e[1]:
+                        break
+                else:
+                    missing_objects.append(recipe_task)
+        self.assertTrue(len(missing_objects) == 0, "URLs checked:\n{}\nMissing objects in the cache:\n{}".format("\n".join(checked_urls), "\n".join(missing_objects)))
+
+    def run_test_cdn_mirror(self, machine, targets, exceptions):
+        exceptions = exceptions + [[t, "do_deploy_source_date_epoch"] for t in targets.split()]
+        exceptions = exceptions + [[t, "do_image_qa"] for t in targets.split()]
+        self.config_sstate(True)
+        self.append_config("""
+MACHINE = "{}"
+BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
+SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
+""".format(machine))
+        result = bitbake("-D -S printdiff {}".format(targets))
+        self.check_bb_output(result.output, exceptions)
+
+    def test_cdn_mirror_qemux86_64(self):
+        # Example:
+        # exceptions = [ ["packagegroup-core-sdk","do_package"] ]
+        exceptions = []
+        self.run_test_cdn_mirror("qemux86-64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
+
+    def test_cdn_mirror_qemuarm64(self):
+        exceptions = []
+        self.run_test_cdn_mirror("qemuarm64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
-- 
2.39.2


