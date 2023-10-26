Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F86C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 10:33:35 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.67479.1698316406649157677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 03:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LjggDOuh;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-53e2308198eso1098821a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 03:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698316405; x=1698921205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADrpjGm2PfCHfjPGr4YSnjKQLIDeeqbMxYGLeZHf5BQ=;
        b=LjggDOuhHkociQed2m0/4y3vekGmnazOhCu2Nm8fTSPDx1Ghb3VCjNmTX02OyHAEvy
         nG4pvrT7qQVRUNS70LBtBd2usIDsfWq+86b0PF3/IDywwjoq+0G7qsew0BP3vygZS/fs
         iAQo0j33z8c6osVR7rGTxihjeQXBbfYtrxGv1BPyQ2Gk4bhAS+79ZHQDARZC/raqT/tQ
         JTXRV2etKOe2GHwQV0/xEWYmhzvOlVYvX1Ym3i7hEGSJmjfGUPt48WvkhD3xsxJcVY1W
         2DNVI37QLoj6fEYATRFVR2gzjHmYRxuGboo76W7vFFDjapmOW/9BWTOFvmGPFzV4POYt
         94UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698316405; x=1698921205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADrpjGm2PfCHfjPGr4YSnjKQLIDeeqbMxYGLeZHf5BQ=;
        b=uEpAhTR4zY1fK13TREMMY7G8rxBqyQo28/tgDcLDyR7kCK6jXb7Xo/DpI0JFGqpGzy
         YXxVfzKWNxk2R9E1ai23VKaV7BDZjsxtvoJmPFMaYLVJSO+jIOlWGQp5ZFqyT3g5Ot8I
         8SEOoRNs111KEuBuSO40TYPt/BmVEzaFsxRUGrgYl3WupXVJ3APcISqs6I+jDfj3f92U
         3ANrp3gZvunV1KoRfr4PGMe2PXD2qfPd7ntpxN5U/iuZh4Rad0KdhnfhHhEpAOv/5tOR
         gqdhjjwziUYBvJio8y9BjwgRX8biHW4mYKtGHUv/NBNUrJXGMUD/AVHTY3OqISBD10dp
         LOeg==
X-Gm-Message-State: AOJu0YwKan1ueTLbxyjE8Tw0ihsgnfplDsqYbJhR0MsnNbZURLbo/FSI
	3tiui0qJtNZULuM/QkqeLlqrrSUyPzo=
X-Google-Smtp-Source: AGHT+IHohqwh8D9+AsQOZvv7y1GqamsBUQ3vI6miB9t4H29VQQyRCdJvcwrlPiuExUo0mQaargT2nA==
X-Received: by 2002:a17:906:fe46:b0:9b2:b7f2:bc7b with SMTP id wz6-20020a170906fe4600b009b2b7f2bc7bmr13234655ejb.37.1698316404847;
        Thu, 26 Oct 2023 03:33:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id u24-20020a170906409800b009bf94de8971sm11444747ejj.70.2023.10.26.03.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 03:33:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] selftest/sstatetests: add a test for CDN sstate cache
Date: Thu, 26 Oct 2023 12:33:20 +0200
Message-Id: <20231026103320.2751277-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231026103320.2751277-1-alex@linutronix.de>
References: <20231026103320.2751277-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 10:33:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189708

Specifically, the test checks that everything needed for building
standard oe-core images for x86_64 and arm64 is available from
the cache (with minor exceptions). Going forward, a complete
world check could be enabled and additional configurations,
but that requires improvements to performance of hash equivalence
server in particular.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 46 +++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index b96eacc9ad8..6a0531ae4c8 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -14,6 +14,7 @@ import re
 
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer, get_bb_vars
 from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator import OETestTag
 
 import oe
 import bb.siggen
@@ -886,3 +887,48 @@ expected_sametmp_output, expected_difftmp_output)
 INHERIT += "base-do-configure-modified"
 """,
 expected_sametmp_output, expected_difftmp_output)
+
+@OETestTag("yocto-mirrors")
+class SStateMirrors(SStateBase):
+    def check_bb_output(self, output, exceptions):
+        in_tasks = False
+        missing_objects = []
+        for l in output.splitlines():
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
+        self.assertTrue(len(missing_objects) == 0, "Missing objects in the cache:\n{}".format("\n".join(missing_objects)))
+
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
+        result = bitbake("-S printdiff {}".format(targets))
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


