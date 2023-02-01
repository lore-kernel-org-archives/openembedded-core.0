Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33C5C05027
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 15:12:02 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.26032.1675264312800281393
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 07:11:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=WkCGgc8F;
 spf=pass (domain: baylibre.com, ip: 209.85.221.46, mailfrom: lrannou@baylibre.com)
Received: by mail-wr1-f46.google.com with SMTP id o18so8149300wrj.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 07:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ImahLHX1tDVjGwGqM8zZ9TprUZI97SHXcVbi4AiraQ=;
        b=WkCGgc8FpLlPyAo0iQsXKf0URBw6WBqNiecH0T4rt2tTIm6m2o2ETZ4x/r4U1YyCSd
         3ZVU1i0VcnRmVUwrRqrI2szs/AFE7ocxp2zdumABaONUDS82s2icj+qNbOlHTDHsfYFP
         J/Tmp/SO4+stzMQkqGMIhUAMf20Bp57OTeEG+ipEcdyVuv6wIGSXXZBHfryPg5O/F9NM
         yABtGinw87hv8VCtJiT5YK6/hE96umd0oiTi78rWLyEZugmq2VmPY0itAKmqj/vlLCuh
         xXHWSL63Fmsubtm6v1RDTMIwLK+fvRGAVBKZ1s2axvpBZsCP5KUibKHuFa2MsBEczq1M
         i/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ImahLHX1tDVjGwGqM8zZ9TprUZI97SHXcVbi4AiraQ=;
        b=rfpCVvtHn7uOKAMm9dms/KKluuyG8Gg1jDLcpVXuatLEUnTimFzdqs2tOF58lDvmcJ
         wVBe86+beTQjR6uImXbMo5SF85CXEH6YTC0rKuwlPt8e00zjM6Pvn4yC5nPwIstVNlDc
         w6qHkTFB80kHcAgEdgdyeDElZdoNL3ZAvCypaRWA0csHnqnGHvX//z4+iFgv063tssNx
         xHXQhp4r4elWGviDgEcuWEU+Vh4TE3JF/r9v4/H2vAlWqe+IiFBKXzdw+umyDmIt2CKu
         u225LfY/eWnFifOgAx+AIGZwctbM/8Vvp1x2pQVAFR6eRqqL1VLoLoW6Op0j5IC5eMfR
         sEsA==
X-Gm-Message-State: AO0yUKWkWbE2PLw9cysLkGnsRu1PJvF9GU5483DqL/lMkz+oZDJvf0RU
	bePpZ5dFyreoA4MF7KSAm2yA0d+CZ4kR61vC
X-Google-Smtp-Source: AK7set9JRWvWcSfqDAfVG+3A6TxuVkSstzT88MyTiqrWT52zhWucqJ8wBPFKbfzOm25TMgCVFusrng==
X-Received: by 2002:a05:6000:188:b0:2c3:477c:f10a with SMTP id p8-20020a056000018800b002c3477cf10amr2610431wrx.24.1675264311305;
        Wed, 01 Feb 2023 07:11:51 -0800 (PST)
Received: from midgar.. (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id b14-20020adff90e000000b002be34f87a34sm17759510wrr.1.2023.02.01.07.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:11:50 -0800 (PST)
From: lrannou@baylibre.com
To: openembedded-core@lists.openembedded.org
Cc: khilman@baylibre.com,
	Louis Rannou <lrannou@baylibre.com>
Subject: [PATCH v3] oeqa/selftest/locales: Create selftest for locales generation
Date: Wed,  1 Feb 2023 16:11:41 +0100
Message-Id: <20230201151141.22027-1-lrannou@baylibre.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 15:12:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176555

From: Louis Rannou <lrannou@baylibre.com>

[YOCTO #9070]

Add a new selftest to validate the locales generation. This selftest builds a
complete target with GLIBC_GENERATE_LOCALES, IMAGE_LINGUAS,
ENABLE_BINARY_LOCALE_GENERATION set.

The tests has two cases: GLIBC_GENERATE_LOCALES=1 and
GLIBC_GENERATE_LOCALES=0. When set to 1, we check that the locales exist in the
local-archive and if it does exist for the glibc. When set to 0, we check it
does not.

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/locales.py | 45 +++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/locales.py

diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/oeqa/selftest/cases/locales.py
new file mode 100644
index 0000000000..433991abf9
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/locales.py
@@ -0,0 +1,45 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator import OETestTag
+from oeqa.utils.commands import bitbake, runqemu
+
+class LocalesTest(OESelftestTestCase):
+
+    @OETestTag("runqemu")
+    def test_locales_on(self):
+        """
+        Summary: Test the locales are generated
+        Expected: 1. Check the locale exist in the locale-archive
+                  2. Check the locale exist for the glibc
+                  3. Check the locale can be generated
+        Product: oe-core
+        Author: Louis Rannou <lrannou@baylibre.com>
+        AutomatedBy: Louis Rannou <lrannou@baylibre.com>
+        """
+
+        features = []
+        features.append('EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login"')
+        features.append('IMAGE_INSTALL:append = " glibc-utils localedef"')
+        features.append('GLIBC_GENERATE_LOCALES = "en_US.UTF-8 fr_FR.UTF-8"')
+        features.append('IMAGE_LINGUAS:append = " en-us fr-fr"')
+        features.append('ENABLE_BINARY_LOCALE_GENERATION = "1"')
+        self.write_config("\n".join(features))
+
+        # Build a core-image-minimal
+        bitbake('core-image-minimal')
+
+        with runqemu("core-image-minimal", ssh=False, runqemuparams='nographic') as qemu:
+            cmd = "locale -a"
+            status, output = qemu.run_serial(cmd)
+            # output must includes fr_FR or fr_FR.UTF-8
+            self.assertEqual(status, 1, msg='locale test command failed: output: %s' % output)
+            self.assertIn("fr_FR", output, msg='locale -a test failed: output: %s' % output)
+
+            cmd = "localedef --list-archive -v"
+            status, output = qemu.run_serial(cmd)
+            # output must includes fr_FR.utf8
+            self.assertEqual(status, 1, msg='localedef test command failed: output: %s' % output)
+            self.assertIn("fr_FR.utf8", output, msg='localedef test failed: output: %s' % output)
-- 
2.39.1


