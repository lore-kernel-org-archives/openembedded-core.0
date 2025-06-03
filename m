Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95690C5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 22:02:45 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.2235.1748988159946570108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 15:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ifN4egZx;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so2138510f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 15:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1748988158; x=1749592958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FvAELd+8RyC/AjzJwAvVwzixeeluxVGMuFgGpC3ojN8=;
        b=ifN4egZxnAEfwBfjCBkiIpfuSTQh0Wb/RwuRYoNXrENWZujEsz8xkj5TXaNae5gRCC
         zv0YaffMakNNpj7c6wduPIavd25bUU3W3zrgBhQHfIXY3GogB6/hkt1KxEWO0yfX85YJ
         Lxq92dUAxjQH0kxpH0TCui9ZHH80ZQxEsZAaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748988158; x=1749592958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvAELd+8RyC/AjzJwAvVwzixeeluxVGMuFgGpC3ojN8=;
        b=Ab8NPHhmgvBYjla5TmlRYYb0j1dZ47hvpoKYmYOPBnF7HR+t7AxhOK9L+w9OhPfcTQ
         2+L2oetI1C6ZerPoiPDowzh2WYG64Sx+v/VLWn/gYupvZcukIIrMInlDjRGg3ewMw/x9
         AkUG5KuY90TN/rd9PyksziSmIFQ9jil7ZQZBvcBhgfhl0Iqn0aaNf/5M9rEAWmSD+L7N
         eFapFYEXLOwWPN69HWpr9IYEenPeEoB9pNddx2rB7SOKmnc+tVRUG5HvF0kiHw5udAhO
         rbeX6VslbT1d8Oxo6NPa0mObQ2EWc7jyahx2zxMiQpOyBP4hZn8gu7Oiu5c+b9oVPFm7
         bgbg==
X-Gm-Message-State: AOJu0YyBqnm2aEke3Sg26c/J8JTGejKocChy9GhFOUz33skLUols3s6I
	kuEXmLp5bf9lHP4nzrVhqnpldpAieVOmoHnHwSgyLTKkUK7SWqIUyIhuLs5tpbg3l2YRvfLCC1K
	26w/kfo0=
X-Gm-Gg: ASbGncusMom9aeIOjKkMqV1oD8SbyxkAuOR0Gnv3Eh+QxbYv90F0wAD/T1HFPtbj0Mj
	vXlGqQb2XuJ07sElsHriItBnw/dE3So4CqR8k405d1owF78o3jywik384z0duFZL0K2GgE3Vj3S
	uKbzdfSD9Qgydb7oLP539ukeL+Xsi+WV2n2VxSMbB+OjCTonaz+ojhWKHQX8eiXnlyUFXEL22us
	vfrs7UrCuh0WBN1KFIsE1Yv3hg/xmqOO8qk4WfLrj/L/mqwt39RP9QO+4bn0v2hwCDm2YB0X9kJ
	qL0bJNYiCZQMcMj7BGMXcikrLLe4aYsRfHEEs2rOtglEQPRFfZtWLhmO2f3pSu8999WZ+rH85Y7
	uQyVLINTBhxMgUUKwJZX7+jKlSqGkE7kb1XnFbQDCmDM0m/pdXSDQVPM6AudHqsf4k0cz/Q==
X-Google-Smtp-Source: AGHT+IE1hm3SYyHrVgvPB2ihFJTliW4K/ax2CnFA33rg55z0+KvXr76o/BvV+34aRk9jggj4x4DMQA==
X-Received: by 2002:a5d:64ec:0:b0:3a4:fc3f:8d5b with SMTP id ffacd0b85a97d-3a51dc31407mr203685f8f.47.1748988158042;
        Tue, 03 Jun 2025 15:02:38 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b887sm19999534f8f.18.2025.06.03.15.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 15:02:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [PATCH] reproducible: allow each layer to define its known non-repro packages
Date: Tue,  3 Jun 2025 23:59:16 +0200
Message-Id: <20250603215916.2429422-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 22:02:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217827

From: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>

With this change, layers can use a conf/include/known_non_repro.inc file
to extend the KNOWN_NON_REPRO_PACKAGES_LIST variable with its own known
non-reproducible packages to make them automatically excluded from the
reproducible test.

Example of usage, in conf/include/known_non_repro.inc:
  KNOWN_NON_REPRO_PACKAGES_LIST += " \
        this-package-is-not-reproducible \
  "

This uses the new "include_all" in the reproducible test and will move
the maintenance burden from AB config[0] to the layers themselves.

Fixes [YOCTO #15699]

[0]: https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n343

Co-Developed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index f06027cb03..e2c3a10f06 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -14,6 +14,7 @@ import shutil
 import stat
 import os
 import datetime
+import oeqa.utils.ftools as ftools
 
 exclude_packages = [
 	]
@@ -158,6 +159,12 @@ class ReproducibleTests(OESelftestTestCase):
     # reproducible, disable this in your derived test class
     build_from_sstate = True
 
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+        ftools.append_file(os.path.join(cls.builddir, "conf/local.conf"), \
+             "\ninclude_all conf/include/known_non_repro.inc\n")
+
     def setUpLocal(self):
         super().setUpLocal()
         needed_vars = [
@@ -170,6 +177,7 @@ class ReproducibleTests(OESelftestTestCase):
             'OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS',
             'OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES',
             'OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS',
+            'KNOWN_NON_REPRO_PACKAGES_LIST',
         ]
         bb_vars = get_bb_vars(needed_vars)
         for v in needed_vars:
@@ -189,6 +197,10 @@ class ReproducibleTests(OESelftestTestCase):
             for leaf_recipe in bb_vars['OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS'].split():
                 self.sstate_targets.extend(get_bb_var('DEPENDS', leaf_recipe).split())
 
+        # Apply exclusion from layers (conf/include/known_non_repro.inc files)
+        if bb_vars['KNOWN_NON_REPRO_PACKAGES_LIST']:
+            self.oeqa_reproducible_excluded_packages = (self.oeqa_reproducible_excluded_packages or "") + bb_vars['KNOWN_NON_REPRO_PACKAGES_LIST']
+
         self.extraresults = {}
         self.extraresults.setdefault('reproducible', {}).setdefault('files', {})
 

