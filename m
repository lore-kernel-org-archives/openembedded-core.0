Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B148FC0032E
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 12:56:16 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.78697.1697892971706326531
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Oct 2023 05:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E9rvk20E;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-533d31a8523so2465212a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697892970; x=1698497770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/czLsZ+JURRJqfe0qCeu/Zspgmo54O8EYu7+t8zVQ8M=;
        b=E9rvk20E1+x7lAfUj+n0dfUqrOomHkqhdrzJQvDLziRlZbmLDvlq/vxjPIjBxwVCkN
         xfAc2RHMUyqT1LpiqFxM66LSNUe5SVx1uUlXOfra6u9LwGAMl1iedmbMrU98lpIB+HIe
         H/XBZDrlLI1tyBeHrDYv2KvrP5GslVxq8e0OeETAYpMxzFmh/MwKROYAwIjaWtq4F1sx
         wqIqCw5rtRANPNHYQFHYzMJZlBeacNoFM6ATW2N8zlny0dkTh4SQ6cX7vS5B25saXo1J
         DBFk/9pSXVeIvGEtp/+MwXDc1KJfIgCL1MlNiqNMg3msvJ2lWRmwar2fj5zW+8aazlta
         PEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697892970; x=1698497770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/czLsZ+JURRJqfe0qCeu/Zspgmo54O8EYu7+t8zVQ8M=;
        b=I5HHuvWRPKKNrWTCbMku0Z1h/YJSQyRCMwk+5qxXr9fyPkTxiUcc9kHvIP0MotUfud
         b7lu/rQJ6DBcNGESpxEEtnsHbCuNfDHJIwqigwfuw6vZc1DALojqfn0j92mwRBaxVzqO
         LFcOGtg4dIn8Bi2WsPOIiyvHOT6Yy8FJDaPDfxl0LLL89och4z9aoTo9iB8VdmG15wsj
         WfO0I9U7TA4oEqN+FbgAPK5cAO4NsjTIp3TKher3lLqHExh53Oy5SHegzVnXuXNGHkga
         Dkc6eDniXO2d+jv+fa7osdLv4aBMW/hEr2ALugBZvsB5DxlXajU6BtyF3c4TkcC2Ld7X
         3SeQ==
X-Gm-Message-State: AOJu0YygJOUQKxiRgMSDcpbUGWALoHhR5t27hxlGs+cFjEHLMjPiJJ8S
	7voPCnholKu9oWQjI4evO3p+fsl/5Nc=
X-Google-Smtp-Source: AGHT+IFfiRaELDsEoRoaDiJrKX/ghjsEm88oUr+VkZ+G4ojvR+ZWJaasPvobVhUtf6uvO/MwwoH38w==
X-Received: by 2002:a17:907:70e:b0:9bf:5771:a8cf with SMTP id xb14-20020a170907070e00b009bf5771a8cfmr3158908ejb.70.1697892969584;
        Sat, 21 Oct 2023 05:56:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n13-20020a170906088d00b0098ec690e6d7sm3572666eje.73.2023.10.21.05.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 05:56:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] selftest/sstatetests: add a test for CDN sstate cache
Date: Sat, 21 Oct 2023 14:56:04 +0200
Message-Id: <20231021125604.3078754-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231021125604.3078754-1-alex@linutronix.de>
References: <20231021125604.3078754-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 12:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189585

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
index bdad9088d37..1b470453c6e 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -14,6 +14,7 @@ import re
 
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer, get_bb_vars
 from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator import OETestTag
 
 import oe
 import bb.siggen
@@ -773,3 +774,49 @@ addtask tmptask2 before do_tmptask1
                 latestfiles = sorted(filedates.keys(), key=lambda f: filedates[f])[-2:]
                 bb.siggen.compare_sigfiles(latestfiles[-2], latestfiles[-1], recursecb)
                 self.assertEqual(recursecb_count,1)
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


