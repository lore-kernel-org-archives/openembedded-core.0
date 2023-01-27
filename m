Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240D9C38142
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 15:34:11 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.104889.1674833641292219120
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 07:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=e33hhYgO;
 spf=pass (domain: baylibre.com, ip: 209.85.128.42, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f42.google.com with SMTP id fl24so3735529wmb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 07:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRdVYInyWcdlScUDiOsRSHGRMnxAlfFmB29QGzsJb/s=;
        b=e33hhYgOUJ4HhquccQPI5d2Z9tSLu0A5e5RK4CksxLiS9C8iZkLtMIuwzjPzynCZ9R
         Ub2Ud7By8RYDniJGJUNebDxOqmFmOCIEq5gRUDBUfn8tjMz91AxN4OAnzL+rC2Q92UQm
         7eRaAcjp2AMWN6PBqy33ayzi1PG9muCRkGzFkoebPxZiRT1QsBA9QeLO7aNDsSOt1oKm
         6cIVMORS6yGcflUDcHgg4unhYK07XhojC+hT4YYHFYn9K4MWxv2LuAKClNg6+UxHu7IP
         6w4XEtV+6tj8wMk0WxJXOSICy3PwibOi5vdFRGJzdrHFDNlvDYtF6S9lUpMeBNlhHE28
         38PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRdVYInyWcdlScUDiOsRSHGRMnxAlfFmB29QGzsJb/s=;
        b=WKbKfmYgt/QTpL1g4A72Owb4UDhrySNaGlyiApLVCdtPguAzVWrEqB9pTwfNOSOu5b
         wxEkQkI5XaXbdRIhFEMzFY7YUIBbqvvvwawuRcxqSL3fVOZAAT3jhmlrAeF3Hmd4KZg7
         Q0akaTu1tztbGUt16gTlp7coNqH6yjfnFouuZ0wGswfWoc1Vh/HvgwvWUvXpOFMD4/Yt
         YnqrmkZocH7RylPeUTLH5kAVB5siw8rzSn2VIJxzNBVf2nPEmbE8dtZtMOQmHKB91e9G
         oVwtMoAp3LQksRzJLCwiwSle2mmWEB76QrdMSahMwYCu36BF855USGKWgiZyWJqkOHFf
         sFww==
X-Gm-Message-State: AO0yUKVzXHo+ubB3eTusnZ41aPrh4T2VCxbUd++ZJPuQrfmGWPA71dN1
	cO82kOogMV5QBxhP0xGmKlwbYmPAX3541fqy
X-Google-Smtp-Source: AK7set9N3li5IsZgSKvZetjhI9UASnlTb2/u+lJZMQ3EcEd6rJ/1F1EGcTyVeYl5pQiRkz6AhKubqw==
X-Received: by 2002:a05:600c:a39b:b0:3dc:4355:25f6 with SMTP id hn27-20020a05600ca39b00b003dc435525f6mr209908wmb.26.1674833639636;
        Fri, 27 Jan 2023 07:33:59 -0800 (PST)
Received: from midgar.. ([2001:912:1480:1c0::1])
        by smtp.gmail.com with ESMTPSA id m3-20020a056000180300b002755e301eeasm4390993wrh.100.2023.01.27.07.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:33:58 -0800 (PST)
From: lrannou@baylibre.com
To: openembedded-core@lists.openembedded.org
Cc: Louis Rannou <lrannou@baylibre.com>
Subject: [PATCH v2] oeqa/selftest/locales: Create selftest for locales generation
Date: Fri, 27 Jan 2023 16:33:44 +0100
Message-Id: <20230127153344.2868589-1-lrannou@baylibre.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 15:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176451

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
 meta/lib/oeqa/selftest/cases/locales.py | 81 +++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/locales.py

diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/oeqa/selftest/cases/locales.py
new file mode 100644
index 0000000000..f053cc8e31
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/locales.py
@@ -0,0 +1,81 @@
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
+            self.assertEqual(status, 1, msg='localedef test failed: output: %s' % output)
+            self.assertIn("fr_FR", output, msg='locale -a test failed: output: %s' % output)
+
+            cmd = "localedef --list-archive -v"
+            status, output = qemu.run_serial(cmd)
+            # output must includes fr_FR.utf8
+            self.assertEqual(status, 1, msg='localedef test failed: output: %s' % output)
+            self.assertIn("fr_FR.utf8", output, msg='locale -a test failed: output: %s' % output)
+
+    @OETestTag("runqemu")
+    def test_locales_off(self):
+        """
+        Summary: Test the locales are not generated
+        Expected: 1. Check the locale does not exist in the locale-archive
+                  2. Check the locale does not exist for the glibc
+                  3. Check the locale cannot be generated
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
+        features.append('ENABLE_BINARY_LOCALE_GENERATION = "0"')
+        self.write_config("\n".join(features))
+
+        # Build a core-image-minimal
+        bitbake('core-image-minimal')
+
+        with runqemu("core-image-minimal", ssh=False, runqemuparams='nographic') as qemu:
+            cmd = "locale -a"
+            status, output = qemu.run_serial(cmd)
+            # output must not includes fr_FR or fr_FR.UTF-8
+            self.assertEqual(status, 1, msg='localedef test failed: output: %s' % output)
+            self.assertNotIn("fr_FR", output, msg='locale -a test failed: output: %s' % output)
+
+            cmd = "localedef --list-archive -v"
+            status, output = qemu.run_serial(cmd)
+            # output must not includes fr_FR.utf8
+            self.assertEqual(status, 1, msg='localedef test failed: output: %s' % output)
+            self.assertNotIn("fr_FR.utf8", output, msg='locale -a test failed: output: %s' % output)
-- 
2.39.1


