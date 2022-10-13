Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0C3C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 19:25:56 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.438.1665689155675348179
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 12:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AtkYLhL2;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id r8-20020a1c4408000000b003c47d5fd475so3954028wma.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 12:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LlwO69XdsXHir7U5XG371mt3FgbKlmrY3haVgUhqvxI=;
        b=AtkYLhL2jf4zquk2S26QcgwMCEMKTi9rc3cPKsZo+H5/PYjvINHsa15ZZgsRCUc3v/
         6PQ+Ldtpe5hke72C4MrfN8vrrTM0IIIwe153RlGU4SU9mvncEGc/+701BGNLnPNVvZZ1
         TOeVKX8OPNX6PQ2/HvsxQVOOqfVMG5FysNDV23cGTVmBOt5ZRx5Hlg6ck1/CrYxvQCg2
         Kv7csAK+L1H2kSLUsQs4Xa/yETq3Dh2PS36zC0OJonO6dluzHM3Ea6An7fYSmyEuBM6E
         tZ0DlTdzsGZHA0DxywAFN5TCw0CMUhY58Tmhb7BVps853qtrOTviTqllrYpfxKeN2h0c
         AvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LlwO69XdsXHir7U5XG371mt3FgbKlmrY3haVgUhqvxI=;
        b=liDBZ4dta532SZiTdfuF8VygxJf72eWW0j/j8kwr5uE5yHHuaKTd+Ps9xD2ZvYuWG2
         CrhhJmnVR0zghkMA6LtMnIL03fkQipRFdIB8CAghNuYMZ5y/VtH98L1f5IjROofU1fiG
         PCqpRLuRs65R3RRqSfn49jOBm5F06uW8n9WOmuyfmBFXkyeIRTRpJzSKRGczoGqLLY91
         U4ujlH7NnbyEYGNjyjkV8HhRyAqz+CaYaOPExouPgg6s8HO6I9RgThzkHtuTCH8AtLEp
         NtpvyX76toTjfvJ9kiGXXAOTCxTT5X3bKgFgEpl6ThMcnY5XIIFFXyDGwKjUzsGOSRcB
         cxsg==
X-Gm-Message-State: ACrzQf1vQx2gRBV5WXYjT/0PLx8o/5tCmIiD52z7dZC5tVvKgkq3Ljxc
	Bu7vF735qdJzKO7Au459Csa9dR5DxXUF9g==
X-Google-Smtp-Source: AMsMyM4RihvUaBrFknXnVtRRLQfwnWZ49bESSXlsZCKLsTzqMA7PXKdj/xZq+DYFg/87Zt+MXxcXzQ==
X-Received: by 2002:a05:600c:458a:b0:3c6:d5b5:106 with SMTP id r10-20020a05600c458a00b003c6d5b50106mr1033401wmo.114.1665689153544;
        Thu, 13 Oct 2022 12:25:53 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id f7-20020a1cc907000000b003b31c560a0csm304371wmb.12.2022.10.13.12.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 12:25:52 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 1/2] oeqa/selftest/archiver: Add multiconfig test for shared recipes
Date: Thu, 13 Oct 2022 19:25:29 +0000
Message-Id: <20221013192530.1761915-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 19:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171719

Test that the shared recipes in original mode with diff enabled works in multiconfig,
otherwise it will not build when using the same TMP dir.

The test can be run with:

oe-selftest -r archiver.Archiver.test_archiver_multiconfig_shared_unpack_and_patch

| oe-selftest - INFO - test_archiver_multiconfig_shared_unpack_and_patch (archiver.Archiver)
| oe-selftest - INFO -  ... ok
| oe-selftest - INFO - ----------------------------------------------------------------------
| oe-selftest - INFO - Ran 1 test in 199.710s
| oe-selftest - INFO - OK
| oe-selftest - INFO - RESULTS:
| oe-selftest - INFO - RESULTS - archiver.Archiver.test_archiver_multiconfig_shared_unpack_and_patch: PASSED (192.24s)
| oe-selftest - INFO - SUMMARY:
| oe-selftest - INFO - oe-selftest () - Ran 1 test in 199.711s
| oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/lib/oeqa/selftest/cases/archiver.py | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index ffdea832be..1d4985dacf 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -6,6 +6,7 @@
 
 import os
 import glob
+import re
 from oeqa.utils.commands import bitbake, get_bb_vars
 from oeqa.selftest.case import OESelftestTestCase
 
@@ -119,7 +120,35 @@ class Archiver(OESelftestTestCase):
         excluded_present = len(glob.glob(src_path_target + '/%s-*/*' % target_recipes[1]))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % target_recipes[1])
 
+    def test_archiver_multiconfig_shared_unpack_and_patch(self):
+        """
+        Test that shared recipes in original mode with diff enabled works in multiconfig,
+        otherwise it will not build when using the same TMP dir.
+        """
+
+        features = 'BBMULTICONFIG = "mc1 mc2"\n'
+        features += 'INHERIT += "archiver"\n'
+        features += 'ARCHIVER_MODE[src] = "original"\n'
+        features += 'ARCHIVER_MODE[diff] = "1"\n'
+        self.write_config(features)
+
+        # We can use any machine in multiconfig as long as they are different
+        self.write_config('MACHINE = "qemuarm"\n', 'mc1')
+        self.write_config('MACHINE = "qemux86"\n', 'mc2')
+
+        task = 'do_unpack_and_patch'
+        # Use gcc-source as it is a shared recipe (appends the pv to the pn)
+        pn = 'gcc-source-%s' % get_bb_vars(['PV'], 'gcc')['PV']
+
+        # Generate the tasks signatures
+        bitbake('mc:mc1:%s mc:mc2:%s --runonly=%s --dump-signatures=none' % (pn, pn, task))
 
+        # Check the tasks signatures
+        # To be machine agnostic the tasks needs to generate the same signature for each machine
+        locked_sigs = open("%s/locked-sigs.inc" % self.builddir).read()
+        task_sigs = re.findall(r"%s:%s:.*" % (pn, task), locked_sigs)
+        uniq_sigs = set(task_sigs)
+        self.assertFalse(len(uniq_sigs) - 1, 'The task "%s" of the recipe "%s" has diferent signatures for each machine in multiconfig' % (task, pn))
 
     def test_archiver_srpm_mode(self):
         """
-- 
2.34.1


