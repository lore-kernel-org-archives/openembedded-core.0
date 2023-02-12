Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D87AC636D4
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:33 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.6.1676236287926145052
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=u6s+gemX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id k13so11689205plg.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGHfctV/Bdyv6rnC0wDqtqPLuPVM9staiSFEH1XzJC4=;
        b=u6s+gemXlJFzto8HB//WTTqUB4XubgdXaOxPf/vD/G5Xt/l8Hoj4hnz5se4UcdxeSU
         ijCQRkXZzvkgq36Eg0nfov6PaZFznOogRBtAWjliNqWYL7+MzSx2Br3X1fDCzK/tWbKL
         aWMG/1Sp5uV6vMO97M9vMUFVKoBUO6dp/ozxMz/fK4JusDOBZL9FTwQkao7997yD7BlG
         sW4YLPsZOdtgk0O2cDG1KxvQ30tsD5PS+G5ov+KNR4Ra6uFxlIKdUu94l+xlXMvF/ys5
         Iuz8fiCH4lp1rJP3tPuPI9JdCqV03ShEYnR7KV2diLlBv/S/GCYlZuGfCBfwujKfoNZN
         8XGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGHfctV/Bdyv6rnC0wDqtqPLuPVM9staiSFEH1XzJC4=;
        b=2Pd3CiL/x3aIr991aKADyczMBKhsBSQ8WgR/9pAySDOg9J0qgW97BEXa1E4zZkOTda
         2dTPZkkycrMRMXjbqrEnRGG6zM2okZQHb4+l7WnHl9eHlJgorlBzh9xzksx6+K3/+qFW
         ft0wrwUTdFJWeVK7qL6Py2yC3eG/CnviFPsMDXnhSK1o2URQAiVuQGl1X1mlI3i9E4OO
         LdXIXjPzZ9146G53JXdK7pk/Gw+6bhSiJjS+wxCnWGfLqnTq9uyNY2e7Yn5r3soedq/o
         lUlFb37chQTlqvMCS0vcegS9K3EmF949Tv3yFzZTn5ubwnH4ER1w4+AdNdWvstEthEJ1
         r89Q==
X-Gm-Message-State: AO0yUKXD99UR2ORzHL7eC8TZJf+c4hgqmgemz/aXjZdFRoZyZJgb4a5H
	SkqTFwIxvZweLW4VeYSOonrKWnza9dAgtRRZ2LM=
X-Google-Smtp-Source: AK7set+qAjYsfiaWQdNJE5Pu1tNkoPoeAEB4oTrvQuAsGf2Nho8X3zk4ASijLEsYMuxxPEq83eg7ng==
X-Received: by 2002:a17:903:246:b0:198:ff11:2600 with SMTP id j6-20020a170903024600b00198ff112600mr26260970plh.2.1676236290395;
        Sun, 12 Feb 2023 13:11:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/27] oeqa/selftest/locales: Add selftest for locale generation/presence
Date: Sun, 12 Feb 2023 11:10:37 -1000
Message-Id: <7b7a03a5cd8a5c14918f56e4dc00629d0a109a2e.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177064

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


