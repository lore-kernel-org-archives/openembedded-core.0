Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC95C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 23:14:11 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.106732.1701990844707946498
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 15:14:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DlVYhvkV;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5c5f0e325a6so1100155a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 15:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701990844; x=1702595644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JDRle+aVV4jYIBwzd+wY9RxB7JGx/OZEopxfLcYk9oU=;
        b=DlVYhvkVApiKC+tO8R4xRaft1qXFoIScB6npwp0RxMBFMFRU38UAgc24miNkpYIA2s
         KB3qcts+mjyoXfbgjb5Z9aZtUtRIhDAdP9t+sFGGUeTI9bmI7aE5y1ruKCChtTAMQkfK
         mmw2a+g/VJfO0Xw1wCX1HLBAcXRwp23wG49qrb8+95/vG2SS7T4L7qDW3pUsijF9dLGE
         Q+JmNqSPpxzFFXftPH6KJ9veCBdLVoGR2aL81g5xfDv1LhqJ6UvhiLH+f0vFvrhIDSJZ
         irpmd1NJXzQ7p1Qd2DCQ6H+Kf3drWTc8m6EGidrXPMrT5kwe+2z8HbSyemSOkIBzJUsg
         3yNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701990844; x=1702595644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JDRle+aVV4jYIBwzd+wY9RxB7JGx/OZEopxfLcYk9oU=;
        b=Bbp/3QamaQ/1XE/rj6+ZVtFEZ1MhoYgAK4G3BK1JlgNJLDGJSMwyNFsMDB+IDxT31U
         C/jOCMq7R+FBvZjsrX3XqwCUYpSZjbKW97uYeboWwtBGPgi9xll/CWhlPyfb4YaIuPr5
         XKkc4t3ougrr4eAiQUKEuYQrOrtnPrkkokAQ2n5lF7ZwSjQTdt0HD3GOsJHL0erRXd0l
         MleLJ6Nbni5XqFEQ/2dVkvSH6NQ5+lSnET0THHt+RUL5Vf3OXxxcLXK7w7xVIkpPnEwP
         eemHTcquKywQlcSKb3IfThnqz/yUcuU8XtV0muOrqSe3vR/2/sHw60tV2jKw5RBzdL9t
         aOmg==
X-Gm-Message-State: AOJu0Yxze/8KZU/nA7LQmo70Z+oE5P6+yZH5kmm3JYwPxT+RtFSXUqbt
	hgvPdNzE9xBrcHQu4XfDfLt+FGFRRoY=
X-Google-Smtp-Source: AGHT+IHS7eNTReULUVfxZz3Fpb8WSL1ioIgx8ZDts1VUjCHjEUJtLDgRpYAygIpmCs0fZdOap+CJlA==
X-Received: by 2002:a17:902:d2c6:b0:1d0:7619:e8b6 with SMTP id n6-20020a170902d2c600b001d07619e8b6mr3023478plc.34.1701990843745;
        Thu, 07 Dec 2023 15:14:03 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f523:dc1d:b135:87b9])
        by smtp.gmail.com with ESMTPSA id o12-20020a170902bccc00b001d0696e9237sm349695pls.118.2023.12.07.15.14.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 15:14:03 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] python3-maturin: add sdk (testsdk) test case
Date: Thu,  7 Dec 2023 15:13:23 -0800
Message-Id: <24841a7636bd1e83411c87ba4332f6f863542c6f.1701989368.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701989368.git.tim.orling@konsulko.com>
References: <cover.1701989368.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 23:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191987

We expect 'maturin' will be used in SDKs, so it makes sense to also
test it in the testsdk environment.

To run this test case, you can add the following to local.conf:
TOOLCHAIN_HOST_TASK:append = " nativesdk-python3-maturin"

And the build and test the SDK:
bitbake -c populate_sdk core-image-full-cmdline
bitbake -c testsdk core-image-full-cmdline

You can substitute a different image recipe for "core-image-full-cmdline"

[YOCTO #15312]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/lib/oeqa/sdk/cases/maturin.py | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/cases/maturin.py

diff --git a/meta/lib/oeqa/sdk/cases/maturin.py b/meta/lib/oeqa/sdk/cases/maturin.py
new file mode 100644
index 00000000000..14245bc36e5
--- /dev/null
+++ b/meta/lib/oeqa/sdk/cases/maturin.py
@@ -0,0 +1,33 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import unittest
+from oeqa.sdk.case import OESDKTestCase
+
+from oeqa.utils.subprocesstweak import errors_have_output
+
+errors_have_output()
+
+
+class MaturinTest(OESDKTestCase):
+    def setUp(self):
+        if not (
+            self.tc.hasHostPackage("nativesdk-python3-maturin")
+            or self.tc.hasHostPackage("python3-maturin-native")
+        ):
+            raise unittest.SkipTest("No python3-maturin package in the SDK")
+
+    def test_maturin_list_python(self):
+        py_major = self._run("python3 -c 'import sys; print(sys.version_info.major)'")
+        py_minor = self._run("python3 -c 'import sys; print(sys.version_info.minor)'")
+        python_version = "%s.%s" % (py_major.strip(), py_minor.strip())
+        cmd = "maturin list-python"
+        output = self._run(cmd)
+        self.assertRegex(output, r"^🐍 1 python interpreter found:\n")
+        self.assertRegex(
+            output,
+            r" - CPython %s (.+)/usr/bin/python%s$" % (python_version, python_version),
+        )
-- 
2.34.1


