Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E78C46CD3
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 05:42:25 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.14303.1702791744653297758
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 21:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BdtUcCJt;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ceba6c4b8dso1769045b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 21:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702791744; x=1703396544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImjcSKnCgA/UbHckyVYBx9GtHK8NM5HJQg1J8JsWvMg=;
        b=BdtUcCJtgy1zkGTRNgA9CeLOcB+wO/a/vzoQvO1it0U21BXBQuoOKF90haE3mz8tf2
         MrDbR7Qv5GxQcJcBgt8CRrjoS5ivisP07+CuiTgxJMTfrmxMk5JoJNSBsHgnNiHxkaiy
         yVw0W+NCB9lwnL1mLc1b+uziwfytYh9Lako0bdx5h4eGAgMR/ofWuCFAEZl6PLvJ72m3
         tr73mI9v5uvkBHEwOz0f9VrSHlC19KMxtUhjwNzF9EudWREY5dMHH6xcIEBpo7w/1TQe
         y8iSXu+lcPHskbM/TryPxpL6Mgf0TLNMS9iijkuDH73d25oAcg2eEwo1B2kV/AD+uQl0
         2VRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702791744; x=1703396544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImjcSKnCgA/UbHckyVYBx9GtHK8NM5HJQg1J8JsWvMg=;
        b=w5LstSUI98mGo09NT81JtKctDJlFXuYz9klP8/e4AgXQgtItANrSl2OprTiLU42fS0
         m9AuWv5cpuOwivVkEQtFtwBKUXvvLRZV92Qw1fabh2UAVIXjmeAUuI1PfY/dQ6n75dMy
         T6BGgHdwbPTxrAjHhVr2dx60vSHrpm96ICIFQhyaXIA3PwwmrFQYEk4pKNiflYgz28Af
         1soCq7KyiwVh8TsVX8xWdeiYj1usvXP9iHu7uW4B2mlDxJu5p0kBr5mpq51x7wStNB0i
         lgrYiQXtGfuQul60Hly0nrpu0ZQSdJKMob4FxcoXEPznghlbQSbl4cynIlrtkuYpeHCX
         kOFw==
X-Gm-Message-State: AOJu0YyeVDqc7PYHuHY/oJK9FX6nUPnr6uUlCa2cevHah95S6Xf0LDui
	7TlBOf3eCyxPLDAze5gjFJ2kXBAKZUk=
X-Google-Smtp-Source: AGHT+IEJZZV9kNaJuFc6+J38gEPHm+FvBGov7a4FhHIjTAUi2TRavspmnCaj0O/KA3MPlIqyC+Nn6Q==
X-Received: by 2002:a05:6a00:1993:b0:6ce:3f02:10a3 with SMTP id d19-20020a056a00199300b006ce3f0210a3mr16537390pfl.8.1702791743689;
        Sat, 16 Dec 2023 21:42:23 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:6e3d:56d2:3c7b:de95])
        by smtp.gmail.com with ESMTPSA id f16-20020a056a001ad000b006cedd530420sm15365545pfv.52.2023.12.16.21.42.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 21:42:23 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] oeqa: add simple 'maturin' SDK (testsdk) test case
Date: Sat, 16 Dec 2023 21:41:32 -0800
Message-Id: <403b882dd93344b2d268f92fd756dfbef2be48a5.1702791173.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702791173.git.tim.orling@konsulko.com>
References: <cover.1702791173.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 05:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192580

We expect 'maturin' will be used in SDKs, so it makes sense to also
test it in the testsdk environment.

To run this test case, you can add the following to local.conf:
TOOLCHAIN_HOST_TASK:append = " nativesdk-python3-maturin"

And then build and test the SDK:
bitbake -c populate_sdk core-image-full-cmdline
bitbake -c testsdk core-image-full-cmdline

You can substitute a different image recipe for "core-image-full-cmdline"

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


