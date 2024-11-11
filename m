Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E67ED2E9EA
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 13:16:59 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.59062.1731331011774433402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 05:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=o0e0h+u8;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so5630239e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 05:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731331010; x=1731935810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+9oXnFTTsfMYrzugtoc0h/K5AgkTIhJxioz+sxkK9E=;
        b=o0e0h+u8pa4Bi0XaeQOl9IeiJNDMfz9+fURBQV8G15EShppIhfMJt9JUt2PcD47nAX
         kexsqH40V1d+s/6BJ3KAi2D3n7EpkvVTy68wK3SM0htnpAN4SssDxqVdhh2qkcc10Bhc
         aX6PnlsX8S5snMlXfwo4RyDh3VyjYleigGFjWxNIhKNzLsRRZi2m5qaaDO1m3NmNsVnD
         5Q3fHmmPXPZMd41L56+ikSF6NyclOFKCZpy2kSiRRKTY8i/HL0C6E7XpQF6p9rroUtY7
         RkSxpJ+8JFJyHwRUpWs3jD2Ds4aLp+1CJLXz9VXKKmUZf3XpBfHtm/3TjOFbcqRDd39w
         IjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731331010; x=1731935810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+9oXnFTTsfMYrzugtoc0h/K5AgkTIhJxioz+sxkK9E=;
        b=T6+fyrBofTMgfaBfaN4y9t2smT+DCpIoXfgtADmXVAzL91OWbwNY1P7NSwuomGcqiP
         fUadmOLZQHCouehB1zdp0G5EMFgYUN/oqNcMh549quafn8qr325ihqX/7VL8pG3JBbvv
         Xb3T/2bxZRhkPqkCV3Z0uhZbUEvF2ArpsA6Jrv23PEJ6UO+OGaGzkrK+hcZuaesWqtFz
         3M7NsGWHP1Uot49827FRck+EgDnWR69J28si2sazNmBzi3B64Q29uiY+nql1+OziieoR
         gQg94IPsP3wyy/y2zXKDtP19vJ1RxKJ7ajj7S1+lj4tfG4GJzxYT5jnjDjnZxG5RpnCu
         FyAw==
X-Gm-Message-State: AOJu0YwsSlNE1Z577nQVvIeN9kFrjvREKqJ8MwVHWpI1N7Vb4oduzHaY
	dugxXCDuG4iUCgsjgNw3wfqYKGmhZd9VFj1b2CBXO6YUitnOUZgLFOz8u0HmxYtWZNIL3wYiOq7
	95Hs=
X-Google-Smtp-Source: AGHT+IGfvIEAkEMZ42O550941hn58BHxYWoP9PXX9Xakv+rN82Lld+5xhy5PcsWT5VpjZLCR/mYV0Q==
X-Received: by 2002:a05:6512:1255:b0:539:fcba:cc6d with SMTP id 2adb3069b0e04-53d8626c818mr5166049e87.42.1731331009953;
        Mon, 11 Nov 2024 05:16:49 -0800 (PST)
Received: from localhost.localdomain ([95.214.66.65])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9dc9sm1515554e87.208.2024.11.11.05.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 05:16:47 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/3] oeqa runtime uki.py: add tests
Date: Mon, 11 Nov 2024 13:16:03 +0000
Message-ID: <20241111131604.364308-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111131604.364308-1-mikko.rapeli@linaro.org>
References: <20241111131604.364308-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 13:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206954

If Unified Kernel Image was enabled via IMAGE_CLASSES, then
target should also boot the same uki at runtime.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/runtime/cases/uki.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/uki.py

diff --git a/meta/lib/oeqa/runtime/cases/uki.py b/meta/lib/oeqa/runtime/cases/uki.py
new file mode 100644
index 0000000000..77bc5b9791
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/uki.py
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.data import skipIfNotInDataVar
+
+class UkiTest(OERuntimeTestCase):
+
+    @skipIfNotInDataVar('IMAGE_CLASSES', 'uki', 'Test case uki is for images which use uki.bbclass')
+    def test_uki(self):
+        uki_filename = self.td.get('UKI_FILENAME')
+        status, output = self.target.run('ls /boot/EFI/Linux/%s' % uki_filename)
+        self.assertEqual(status, 0, output)
+
+        status, output = self.target.run('echo $( cat /sys/firmware/efi/efivars/LoaderEntrySelected-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f  ) | grep %s' % uki_filename)
+        self.assertEqual(status, 0, output)
-- 
2.34.1


