Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C056C4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 15:12:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.8378.1665760377904755341
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Oct 2022 08:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g8kJLyb2;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id az22-20020a05600c601600b003c6b72797fdso3728953wmb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 08:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ahLhYHNFCKdlHniZcA0VgzxAYAdmc+DNwgupJg1FxBE=;
        b=g8kJLyb2GnLdXlpDsaxcrkvMYo1rkMtxgHoJSIiQWhI3aKe0pvf/2lmCjsc9Gt1MX5
         hJJysEAmx39yMkETJahEjf/SolV4MFZUrjU846ltP6QVcISTNecR1UPbaIJUzjOlG3bH
         FL0+7GoLE56EZDeQQcZ3K0PUTC/G3BOw4dhR/WHT1DQiM6rTC/iAnJ3OjBkBwkYe2lMj
         3x5y4yr0jledTUbzHxTVcBsdTKh7ByXdAtSKqqmaYV749v9JRCxxQiILS5qAw040tgNX
         zzPrM12WkH2NtuKNnkihx2Yn7XoainUbaANFnUSx7vSHtGpm1E5KSIaGP7X/qsbmPJL4
         vrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahLhYHNFCKdlHniZcA0VgzxAYAdmc+DNwgupJg1FxBE=;
        b=ChHPWidvuC9Ws33vrKPIkO5IUDBjNzy0oNVkaDIrwwiS/OdPsbbePQ0ga0wJ17DX8Y
         fqCRBOjy7zHNupOaDmI6HJgOy+STKgJyD+xCmUE/Ra8CQ1eOb8l1zouwBQo9U+EXLH+K
         hLRrTBImCmyDhufezitEwkw2EMTGmMYqo3odFjJT4mEFr913a5LxSuT/cFaSZHXP/jKQ
         4sJKM3ZW8gycvKd2OgAr8E7/DVMhrYIuFKtrCQ6k3NXr5M4qprr8/In/OVMzI9+kptlt
         nTjFP6zcdWcbiec+jMrAG42zjLq7AouEqX4Uo8KtLBUHqugkzuZXqUbcqvRbG+eESW9h
         iBRQ==
X-Gm-Message-State: ACrzQf0gS8hk9e6wL3fbo7SNnqmzXD+fguXu5xqKh5mVcopivnYKqMV8
	jKPbxGf9BfRoGUlNpjKLnpqHMsMbJWCl/nnQ
X-Google-Smtp-Source: AMsMyM620fIiIWygpgfOi/TXHoIjMG3yDGIqaO79ga2y7h+E0OMXCANE69BSgNF3rUlKQ8vlwvTPxQ==
X-Received: by 2002:a05:600c:35ce:b0:3c6:809a:b5c3 with SMTP id r14-20020a05600c35ce00b003c6809ab5c3mr3942879wmq.206.1665760375676;
        Fri, 14 Oct 2022 08:12:55 -0700 (PDT)
Received: from fio.lan (11.77.115.89.rev.vodafone.pt. [89.115.77.11])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c1c1300b003c6c1686b10sm8074146wms.7.2022.10.14.08.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 08:12:54 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v2 1/2] oeqa/selftest/archiver: Add multiconfig test for shared recipes
Date: Fri, 14 Oct 2022 16:08:32 +0100
Message-Id: <20221014150832.241817-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 15:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171732

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
2.38.0


