Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61664C64EC4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:37 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.19578.1676150673676544518
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1VeirDLV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 78so5914611pgb.8
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGHfctV/Bdyv6rnC0wDqtqPLuPVM9staiSFEH1XzJC4=;
        b=1VeirDLVNygNvY1i4AJzfSBWjCaPyWCnVnkwfYSoifkmNX4qJzZjV8yYn0fQ7qQE2c
         A6gVixi7x6QNcbtMYy8WYg6d3aY0TaY8WFAZv6Eua+jPPM13X7k3xlPZ4EjIUi0v2rRA
         t7esZ7e0REVqC6qPQfS7QRsQRLSNbDIVUn0OLX6BN8LwdGfZH9NL2SuT1+nDZ2yt4Bs9
         HBagTLVQc/k1ITFBS5LnWXYQCXddc8QeDHU1bAsdhrBgvZYyP56QvRcjZRuk8P0Vgudb
         IGUBUq4r6eAAJnc7uZFfBWntdYLjDIE9qw0Chza303tYAtY0uDafzcV8/V5upQhI3iZn
         MTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGHfctV/Bdyv6rnC0wDqtqPLuPVM9staiSFEH1XzJC4=;
        b=SnfgYSstpO5M2AYea+nzkIGvRQmTzJCGEQOpaccCCAN85oz+CdGoWgi5EMEbAeJzSA
         nIDQYWuqcCK4Q8OYqFIBuJ9587cr+7vcWXR3mdXE2JdxQsGZZeKUMT7s6GSYUP/4gRl9
         6KJVIn/2Qfs5r/eE6ggNGVV38w+FPCqcp5JFMuVc/vn3s+aQb0hcE9MlvwYqKDjEXbiJ
         2x4XVcGkuUOSJEMiVUq034MytczB1RdbuZAhVrweck3OR6V7RP3Jwx6+jZM0qxy13Zkl
         b/WBQNEDBkhRclbnyVdsMikAuaH0JqiEY+jWNYqV60HismjBF+A0mX3PYZ2W5BtfVca5
         zD6Q==
X-Gm-Message-State: AO0yUKX9yNKio9r9dU1pnHNkhuS+il28Wp4c5W/1DHpS9Y0EyJg6ypdG
	3tQlnucupXrYNfnBKM4f1bMWEd6iS9kwy7iTfhk=
X-Google-Smtp-Source: AK7set/NBxOqyY7jspCuApahv9kEk0/lzUyusuS/IurYg0AVJDaBBlHXque562kcvJSv1NSC+ptOQQ==
X-Received: by 2002:aa7:954b:0:b0:590:6a57:9904 with SMTP id w11-20020aa7954b000000b005906a579904mr17928469pfq.14.1676150672624;
        Sat, 11 Feb 2023 13:24:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 20/28] oeqa/selftest/locales: Add selftest for locale generation/presence
Date: Sat, 11 Feb 2023 11:23:43 -1000
Message-Id: <cbb6344c583a4aaef6514120b4f38f376859368d.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177030

From: Louis Rannou <lrannou@baylibre.com>

[YOCTO #9070]

Add a new selftest to validate locale generation. This selftest builds a
complete target with GLIBC_GENERATE_LOCALES, IMAGE_LINGUAS,
ENABLE_BINARY_LOCALE_GENERATION set.

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 53258fd810bea6475af9f908f7b712a13a02b628)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


