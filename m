Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B09C27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 08:31:34 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.40962.1674635492422285304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 00:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=XMdNgMEc;
 spf=pass (domain: baylibre.com, ip: 209.85.128.51, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f51.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso678796wmc.4
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 00:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UlgcILdXzRueRG3SjjZgo3ctDKhuLY2qDy84IWOCnkc=;
        b=XMdNgMEcCG99XWGUYe5W3zUPH3TcK1l8Yo4RrcUo3NExxjkXnJig/qFNTq35h1TVE6
         Bj4ZworylgOPGsLQ3Wti8Vut0jQ+QDFl2J+7POqcOyWeWpEKrKijUIs8U70PO5l3eLBj
         UWQtT5tjMvfTSK/2caigMxBEasVa+ts27dCStut1i9FCCmYCOQXqAgfQSP/KXxSkfErJ
         MyF7EI6Rb75o2taonf5bjMmMDtvO+p4g3BZlul8EbwcF0+7f7Ksx6rbRdEc/TLi8FFLI
         EdaWSoekDV+5uWppbjF0FTGx5E5wv5h9gakIT8FzjaA1mTTNvRsKIZMjevRNdCvKtjcj
         ctiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlgcILdXzRueRG3SjjZgo3ctDKhuLY2qDy84IWOCnkc=;
        b=dw3PZ420qlbd81Pn9zpAhiiscHc3oaI8JvMO4bmWPZ9ca6tvjh9J46w9cTROK0igV0
         QzoYdnA0NqYefdRjWuf9SkiEu91Q+h4H3nPM5YM6F49AAJjzOuVM5jv5LsgPxA1rUbiJ
         rdHxB70RE2AbGk8yLOqVlZyjTbGexelxcF2iTp28VxqQbVQHibBQZoOgPPLyCyv1QqLa
         P/LLrSosJdBlkBT98Xa8Oe2C8RqyiKBnnd7lN2qCKQHJKHiJoOU6mKlhtRY6S9bAwIwK
         025r7oDdx9ctgYXw/bff47QL+0grdCqcYsgHj1PUUaesnyQRhuh/SVVDipkabrb513dX
         oHRQ==
X-Gm-Message-State: AFqh2krycV/A0HuWn7AIMh5KCCc+1KsCrITpv9xMqgQzDkLAE8Mv71fl
	r5xhCN65SNO9JTMxGj+SqCeSvEe2MbEpWLEr
X-Google-Smtp-Source: AMrXdXuaZYCI4vO6nCyits7G/NKxwWMm63dHDSs3mfLc9ek+jMgIZLSlpp3OJoSVlwHownRpg/9Ubg==
X-Received: by 2002:a1c:7712:0:b0:3da:1e35:dfec with SMTP id t18-20020a1c7712000000b003da1e35dfecmr31185555wmi.4.1674635490738;
        Wed, 25 Jan 2023 00:31:30 -0800 (PST)
Received: from midgar.. ([2001:912:1480:1c0::1])
        by smtp.gmail.com with ESMTPSA id p22-20020a05600c431600b003d99da8d30asm1072505wme.46.2023.01.25.00.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 00:31:30 -0800 (PST)
From: lrannou@baylibre.com
To: openembedded-core@lists.openembedded.org
Cc: Louis Rannou <lrannou@baylibre.com>
Subject: [PATCH] oeqa/selftest/locales: Create selftest for locales generation
Date: Wed, 25 Jan 2023 09:31:27 +0100
Message-Id: <20230125083127.53988-1-lrannou@baylibre.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 08:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176343

From: Louis Rannou <lrannou@baylibre.com>

[YOCTO #9070]

Add a new selftest to validate the locales generation. This selftest builds a
complete target with GLIBC_GENERATE_LOCALES, IMAGE_LINGUAS,
ENABLE_BINARY_LOCALE_GENERATION set. The locales are tested through a ssh
connection in three manners: checks if the locales exist in the locale-archive,
if it does exist for the glibc and if it can be generated.

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/locales.py | 54 +++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/locales.py

diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/oeqa/selftest/cases/locales.py
new file mode 100644
index 0000000000..089ca594a1
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/locales.py
@@ -0,0 +1,54 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator import OETestTag
+from oeqa.utils.commands import bitbake, runqemu
+from oeqa.utils.sshcontrol import SSHControl
+
+class LocalesTest(OESelftestTestCase):
+
+    @OETestTag("runqemu")
+    def test_locales(self):
+        """
+        Summary: Test the locales through a ssh connection
+        Expected: 1. Check the locale exist in the locale-archive
+                  2. Check it the locale exist for the glibc
+                  3. Check the locale can be generated
+        Product: oe-core
+        Author: Louis Rannou <lrannou@baylibre.com>
+        AutomatedBy: Louis Rannou <lrannou@baylibre.com>
+        """
+
+        features = []
+        features.append('EXTRA_IMAGE_FEATURES = "ssh-server-openssh empty-root-password allow-empty-password allow-root-login"')
+        features.append('IMAGE_INSTALL:append = " glibc-utils localedef"')
+        features.append('GLIBC_GENERATE_LOCALES = "en_US.UTF-8 fr_FR.UTF-8"')
+        features.append('IMAGE_LINGUAS:append = " en-us fr-fr"')
+        features.append('ENABLE_BINARY_LOCALE_GENERATION = "1"')
+        self.write_config("\n".join(features))
+
+        # Build a core-image-minimal
+        bitbake('core-image-minimal')
+
+        with runqemu("core-image-minimal") as qemu:
+            # Attempt to ssh with each user into qemu with empty password
+            ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user='root')
+            cmd = "locale -a"
+            status, output = ssh.run(cmd)
+            # output must includes fr_FR or fr_FR.UTF-8
+            self.assertEqual(status, 0, msg='locale -a test failed: %s' % output)
+            self.assertIn("fr_FR", output, msg='Incorrect output: %s' % output)
+
+            cmd = "localedef --list-archive -v | grep fr_FR.utf8"
+            status, output = ssh.run(cmd)
+            # output must includes fr_FR.utf8
+            self.assertEqual(status, 0, msg='localedef test failed: %s' % output)
+
+            cmd = "LANG=fr_FR.UTF-8 locale"
+            status, output = ssh.run(cmd)
+            # output must includes fr_FR.UTF-8
+            self.assertEqual(status, 0, msg='locale test failed: %s' % output)
+            self.assertIn("LANG=fr_FR.UTF-8", output,
+                          msg='Incorrect output: %s' % output)
-- 
2.39.1


