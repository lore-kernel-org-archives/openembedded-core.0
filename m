Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1567C46CA0
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 23:14:01 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.107160.1701990840864268302
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 15:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VqkYQMFL;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d048c171d6so13456945ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 15:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701990840; x=1702595640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oatBoY9oLK+i1c6gUAK1iAz6XGfR9O6uWCdtEzajqc=;
        b=VqkYQMFL9ePMhHVmhY/N0eYY8NcyNC7Kfm2+bbggSz03DZg2NDZvlp81pVrqDyxLhv
         sxejMfc8yLv0smAsT5hVf9/cSN8Iw/wwS12RXHkzFEG61Wuj7Y/p3cJbRdqTjY1wssYT
         R3Tb0a88/K6ZQD7BKeuV1VRd1jrna9D9DCHOQge/sTQokX9BEkmw+KtH4IqvRM3yXdGK
         5GnThxzs4sTG1Nf8fvzZJ6LH++ZWK/DcmKFpeYB6G1iOYcG6CAj1fUilk5XONz8FD49W
         AdcO7t6MiSKMcvb5A9P6mqCsiiwEjECqjMc3jRTTHCXTD2VAe7UFjb5eIMLtRbvlOUjA
         AfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701990840; x=1702595640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9oatBoY9oLK+i1c6gUAK1iAz6XGfR9O6uWCdtEzajqc=;
        b=d+nd4iqmgVrgKXvp0QhtyFBOzJ0aOOwCYYm75ext/wJsCE+oB0fhDkWFSCx+p9QQ1Y
         ymU9ESGfLFWPr2Tew+dTJA5RzQyBGy7aqd54YxIresgZBXLAzxm3zFkbFXGlBvEOSgBE
         Y5YmhBG+xXHu7BYK+6R0PAkVNhPRVlmQOMgHMqvanoiv2KHplVPL8DqZyBkoEULi8pWI
         3jiW66Oc6u2BZtvDqmlE4Fn7LQ4fjzgAdWMXtC593gcqZgawTQbujQ2HYdgslmb34fLy
         5ghBdtS5GFJwa0Sn84g7Cls9BMI0a+uN5PNcniDrXUKC4ExLEuTg1wY2/fGZ8nwEuRQ3
         p+Fg==
X-Gm-Message-State: AOJu0YxaofndsMbVhYx7hf/M1HqqQAcFFdY5JoR0+yzPyZ/ImQqjw1MK
	fx4W07L6hn7SR7XL09GI+fEUUULYSmw=
X-Google-Smtp-Source: AGHT+IHcl7zGR5fOzbfDKvnIjQZpiiGmxZ/tyDtDcA3EWe4oQXwwWNvKVYAkCCz/nxSylmSyzvrl4Q==
X-Received: by 2002:a17:902:da83:b0:1d0:5ed4:4bf with SMTP id j3-20020a170902da8300b001d05ed404bfmr3870450plx.54.1701990839859;
        Thu, 07 Dec 2023 15:13:59 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f523:dc1d:b135:87b9])
        by smtp.gmail.com with ESMTPSA id o12-20020a170902bccc00b001d0696e9237sm349695pls.118.2023.12.07.15.13.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 15:13:59 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] oe-selfest: add maturn runtime (testimage) test
Date: Thu,  7 Dec 2023 15:13:22 -0800
Message-Id: <ef9e58f253d371c8ae864f7cd89c1fb1dcd3602e.1701989368.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701989368.git.tim.orling@konsulko.com>
References: <cover.1701989368.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 23:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191986

Basic smoke test for maturin to test the 'maturin list-python' case.

[YOCTO #15312]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/lib/oeqa/runtime/cases/maturin.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/maturin.py

diff --git a/meta/lib/oeqa/runtime/cases/maturin.py b/meta/lib/oeqa/runtime/cases/maturin.py
new file mode 100644
index 00000000000..b9a3b4acbcd
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/maturin.py
@@ -0,0 +1,23 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class MaturinTest(OERuntimeTestCase):
+    @OETestDepends(['ssh.SSHTest.test_ssh', 'python.PythonTest.test_python3'])
+    @OEHasPackage(['python3-maturin'])
+    def test_maturin_list_python(self):
+        status, output = self.target.run("maturin list-python")
+        self.assertEqual(status, 0)
+        _, py_major = self.target.run("python3 -c 'import sys; print(sys.version_info.major)'")
+        _, py_minor = self.target.run("python3 -c 'import sys; print(sys.version_info.minor)'")
+        python_version = "%s.%s" % (py_major, py_minor)
+        self.assertEqual(output, "🐍 1 python interpreter found:\n"
+                                 " - CPython %s at /usr/bin/python%s" % (python_version, python_version))
-- 
2.34.1


