Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79298C4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 15:24:49 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.8505.1665761088595982858
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Oct 2022 08:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ea5TRVdV;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id r13so8062815wrj.11
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sd3MMHnbrzbIy5T/Uf9VdWT+aoqcoDPt5gxXkY05WpI=;
        b=Ea5TRVdVxsK/QYgghN/ikrbDcD8Lud/b1kK6YEan/NX0vycZ1+MWIIsLMqxCl14ruA
         fTKhsy/J3sybZoFiDWOJAwezid46hPOQu/nlB6nqGosAtOl0LDHsvzyomBg8ZOyf1tP1
         ar7P0M7Q3QbBOzfEN4XD+b7H7PtVV16vlIWJJFZYPtcjV/PYjIO7NZkepu7ysE1cA1VE
         rk5mb6XGK7f9t+mksgm1rEKeoAeBcFkTl9uaQBsNyXxkqWzDibD0H8dLC5U0DY146oTG
         vlLp5bNIMb3pTNiGCzowSy6j7e39YLLy3FC6NJlv4mujG9mvoXr0CcGr/yY8AbiDQ6Sp
         sCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sd3MMHnbrzbIy5T/Uf9VdWT+aoqcoDPt5gxXkY05WpI=;
        b=ruZVkAE646ZJqqapvfi2irugJLiQPNApyJRki9VUFoqG4XqWGJWbNDYGQAjtpka6UZ
         QiiT5HQk9NOFpIaXlpvHT7odyGDDlsaUtPS+n0g1wNnE/cUYQiZsFOLQvIXIvr72cxTd
         gtJwuBHZaC+yqc0PryszqbUQQaKQTFHeg6zWxIazXTeOoWBSC3d35euNOVa6jXI8ICQn
         dUdnKEyWGD2eJ3oJXZAqQBgOrkRnGk9AaaBJclu3CWmPAse5iBzJxC6QolX5FSVm7dP3
         DaMCIabbW0WtruXN+KYZWnt+qH6yb8lDedkri+V5+jFZ5i22faeHzeoK2frSsWf8dVmu
         Bs9A==
X-Gm-Message-State: ACrzQf3GqUTOgokBpW+t6kmx7tJS1GnNo8QdTI8eyVQmtyLjZ14A/ijt
	tpGRbo4FHobkm1YKh14ZudI3F5yMEM75JVVz
X-Google-Smtp-Source: AMsMyM4HIoj/RVxm/kLY7ifIvW0uP88BhImqMYbS9xOtWO/pbggbejwWP1bXEGR8EI12yFWPGBmxhw==
X-Received: by 2002:a05:6000:1b06:b0:22c:da6d:b199 with SMTP id f6-20020a0560001b0600b0022cda6db199mr3805859wrz.584.1665761086031;
        Fri, 14 Oct 2022 08:24:46 -0700 (PDT)
Received: from fio.lan (11.77.115.89.rev.vodafone.pt. [89.115.77.11])
        by smtp.gmail.com with ESMTPSA id bz13-20020a056000090d00b00228cd9f6349sm2148765wrb.106.2022.10.14.08.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 08:24:45 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v3 1/2] oeqa/selftest/archiver: Add multiconfig test for shared recipes
Date: Fri, 14 Oct 2022 16:22:45 +0100
Message-Id: <20221014152245.243292-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 15:24:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171735

From: Jose Quaresma <quaresma.jose@gmail.com>

Test that the shared recipes in original mode with diff enabled works in multiconfig,
otherwise it will not build when using the same TMP dir.

The test can be run with:

oe-selftest -r archiver.Archiver.test_archiver_multiconfig_shared_unpack_and_patch

| oe-selftest - INFO - test_archiver_multiconfig_shared_unpack_and_patch (archiver.Archiver)
| oe-selftest - INFO -  ... ok
| oe-selftest - INFO - ----------------------------------------------------------------------
| oe-selftest - INFO - Ran 1 test in 52.948s
| oe-selftest - INFO - OK
| oe-selftest - INFO - RESULTS:
| oe-selftest - INFO - RESULTS - archiver.Archiver.test_archiver_multiconfig_shared_unpack_and_patch: PASSED (49.98s)
| oe-selftest - INFO - SUMMARY:
| oe-selftest - INFO - oe-selftest () - Ran 1 test in 52.948s
| oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

v2: replace --runonly with --cmd (-c)
    update the runtime test time on the commit
    show the locked_sigs file used on the assert

v3: messed up v2 patch

 meta/lib/oeqa/selftest/cases/archiver.py | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index ffdea832be..3fa59fff51 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -6,6 +6,7 @@
 
 import os
 import glob
+import re
 from oeqa.utils.commands import bitbake, get_bb_vars
 from oeqa.selftest.case import OESelftestTestCase
 
@@ -119,7 +120,38 @@ class Archiver(OESelftestTestCase):
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
 
+        # We can use any machine in multiconfig as long as they are different
+        self.write_config('MACHINE = "qemuarm"\n', 'mc1')
+        self.write_config('MACHINE = "qemux86"\n', 'mc2')
+
+        task = 'do_unpack_and_patch'
+        # Use gcc-source as it is a shared recipe (appends the pv to the pn)
+        pn = 'gcc-source-%s' % get_bb_vars(['PV'], 'gcc')['PV']
+
+        # Generate the tasks signatures
+        bitbake('mc:mc1:%s mc:mc2:%s -c %s -S none' % (pn, pn, task))
+
+        # Check the tasks signatures
+        # To be machine agnostic the tasks needs to generate the same signature for each machine
+        locked_sigs_inc = "%s/locked-sigs.inc" % self.builddir
+        locked_sigs = open(locked_sigs_inc).read()
+        task_sigs = re.findall(r"%s:%s:.*" % (pn, task), locked_sigs)
+        uniq_sigs = set(task_sigs)
+        self.assertFalse(len(uniq_sigs) - 1, \
+            'The task "%s" of the recipe "%s" has different signatures in "%s" for each machine in multiconfig' \
+            % (task, pn, locked_sigs_inc))
 
     def test_archiver_srpm_mode(self):
         """
-- 
2.38.0


