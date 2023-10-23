Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABB8C00A8F
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 11:06:30 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.117784.1698059183795755633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Oct 2023 04:06:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KjofNH8v;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-53e751aeb3cso4832869a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 04:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698059182; x=1698663982; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riiG64E49WOTyJaAJUOvqGRzEX8RZlJ7fttWYWyixS4=;
        b=KjofNH8vCekxmVDacdmgM39CNryRYkJm+J/QadMF2jqUBsgufD7Iv6q7uO9w9WsRYa
         myFKwsqx75Lyt2kjUYDCzbNW3QyWE2fBNhGEk3C8Ss7vzE+yZkMWOcbAaTHaMHb5fVS2
         A8Yw/xKFcZ97trDKL6M2YJ0FDbCf/63C2mDu7iMppBg7H3ds9BgAD2Jrga11UO6+nwMD
         tnv+cJD6H1REwQQzygRnbMN8uXFVRPbdZWnrGpvklUm3AXWWdvcW04SljXOU8XE+FCIe
         79gbcLumd+roIBu7djnUZih8fQVNJiIjI1nNYVxOillp36AzhJtsTNkwT6CEnN+JTit5
         +kyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698059182; x=1698663982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riiG64E49WOTyJaAJUOvqGRzEX8RZlJ7fttWYWyixS4=;
        b=f0cFtIMwfrgr2IpC6EjIuiyl5RCwFQI+tCgCdXvrQXwKJsSyrProOMzM6hxBZ8g9dY
         D1p+TiCd8SDAvUark2E2sUMFtJWUS4eSLUghr7jK3KU6L1suXGbJZg4n4hyjZFjL8NMb
         3wYEZ3dFsFJ/EihgMDidXkHXEXHOD6CSgTbReeAVCrgTVGOxWpCLO8nlvJLNTt9zyeGT
         bO/fMHe2Z3SBCWEZjfapyAxK/2ZHJ2BJTa7LhzAfab1O9Jip9Zc45n7NN+dv1GtazYY6
         4l02/urMJh2w2oRpflpy85tahgzNKkQvRo6MhG/EqEybPELAEQ95r4XeGpLYzzdDadDz
         nnKQ==
X-Gm-Message-State: AOJu0YwW2yvOpxXTWNUwcm0L54v6rw5LpUaFfDsWdv7zXfEWDDYUFSKF
	7v5xxDviVcn/5Z26Vm35b0ljFF9UZZo=
X-Google-Smtp-Source: AGHT+IHekj02FS8Bk1Wy6JDneYs5bgNYJ8Mqr5XUWpZNneSrKZBZlw4C7vRRGPmWAEoq3mQ87DNEeQ==
X-Received: by 2002:a50:d094:0:b0:53e:df4:fe72 with SMTP id v20-20020a50d094000000b0053e0df4fe72mr5920312edd.32.1698059181847;
        Mon, 23 Oct 2023 04:06:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id v28-20020a50d59c000000b00536159c6c45sm6234798edi.15.2023.10.23.04.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 04:06:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] selftest/sstatetests: add a test for CDN sstate cache
Date: Mon, 23 Oct 2023 13:06:18 +0200
Message-Id: <20231023110618.3525311-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231023110618.3525311-1-alex@linutronix.de>
References: <20231023110618.3525311-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 11:06:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189620

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
index b96eacc9ad8..e895f66360c 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -14,6 +14,7 @@ import re
 
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer, get_bb_vars
 from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator import OETestTag
 
 import oe
 import bb.siggen
@@ -886,3 +887,49 @@ expected_sametmp_output, expected_difftmp_output)
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


