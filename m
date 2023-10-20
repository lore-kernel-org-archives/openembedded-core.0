Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D2EC001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 17:12:40 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.60084.1697821958753827009
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 10:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TfVNxKh+;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9c53e8b7cf4so163627466b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 10:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697821957; x=1698426757; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85PDFRU5wAKNf5AkuKS08TOSCcKg2dMFYwgsgjCF1Ko=;
        b=TfVNxKh+Qp74+P0rIoVJyGjAMQKJw3Ta98YSERVAo6Y+92q7NzUODE0NbzwTz+CbS/
         wD0Ic19umqQbhoFIIqpqR003lpr0l5AD7uN0ROHK6nlDhwao0uLyKySJ0sDEjVdZdHzp
         cRwzjKop9hWAUOZOCLAJoKB2giwBdt+E0h913ZsDrsb3qXfadP8Dj9tOY6UVEXcF04Zh
         TC3YLF1uf+usE9zP4J+g5FI49dV5PN/PGExUrtvVWCs/0Fr60o730Qi/rihqrTjiy+YU
         hHQYNUkZuhz5EXLO8viZgClKMLCLCRaY30qKhVvuGWSb0gz/BE8fV34ksF7c4Nq/25ls
         3cAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697821957; x=1698426757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85PDFRU5wAKNf5AkuKS08TOSCcKg2dMFYwgsgjCF1Ko=;
        b=nj2/326rBf+cdLU2AAn1OWBTc6C6qDCzEuP4Y6+qVWlMb79hMfmn+REnMy8Nijqplo
         2E6eK8kIA3NTkSvGr392amsvSZD3Y1YEML/HQUBIAPhmIoM8sGuE8bjoWj/t/dBunR6W
         sOhAJCsc7kwdjelEXZyNDNExmr3UTZDCzTtVN2U1IjcnYC2aS682odzeiw9VbmhPwght
         5oNMNdRprxEI1pRIEfwB0D7O3Zjhh/LeaOE6ozkNb00L3iOS3VzcHjNwC3/Vh2M3MHJ1
         uDsnKG8dgSQsKOPpOgbQoijy0owrNVke1nfmd2sSQ88Ml4Q9LEE8K1dCb6Lp2Udr2BsC
         4zyA==
X-Gm-Message-State: AOJu0Yw5JPrxm9lu3nk36TjJt+wupKq3Z+DX+r0xw4I+jVQJKckGBmTa
	w53N8XqlYHIFGYP/kZnd0waBhfGlo1M=
X-Google-Smtp-Source: AGHT+IE2b6ghWEumgkPkcsbGnspJszWSImdZ9X39LOZ1c8EV2iRrLTwkFjPC3hz2iu6JEz6QuHjJyQ==
X-Received: by 2002:a17:907:d505:b0:9ae:73ca:bbad with SMTP id wb5-20020a170907d50500b009ae73cabbadmr1510657ejc.43.1697821957168;
        Fri, 20 Oct 2023 10:12:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id u10-20020a17090657ca00b009b8dbdd5203sm1857751ejr.107.2023.10.20.10.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 10:12:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] selftest/sstatetests: add a test for CDN sstate cache
Date: Fri, 20 Oct 2023 19:12:32 +0200
Message-Id: <20231020171232.3072396-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020171232.3072396-1-alex@linutronix.de>
References: <20231020171232.3072396-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 17:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189575

Specifically, the test checks that everything needed for building
standard oe-core images for x86_64 and arm64 is available from
the cache (with minor exceptions). Going forward, a complete
world check could be enabled and additional configurations,
but that requires improvements to performance of hash equivalence
server in particular.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 47 +++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 6ef339897bf..e392d6a1a63 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -14,6 +14,7 @@ import re
 
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer, get_bb_vars
 from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator import OETestTag
 
 import oe
 import bb.siggen
@@ -879,3 +880,49 @@ expected_sametmp_output, expected_difftmp_output)
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
+        self.run_test_cdn_mirror("qemux86-64", "core-image-minimal core-image-full-cmdline core-image-weston core-image-sato-sdk", exceptions)
+
+    def test_cdn_mirror_qemuarm64(self):
+        exceptions = []
+        # core-image-weston isn't produced for arm64 currently
+        self.run_test_cdn_mirror("qemuarm64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
-- 
2.39.2


