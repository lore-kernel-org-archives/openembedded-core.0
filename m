Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B364C3DA6E
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 05:42:25 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.14300.1702791738035820527
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 21:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DW7V7SlD;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6d2837297f3so1665345b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 21:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702791737; x=1703396537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbgTbxX5lAcAXv+gg8OxTQtuBK8jrjfuljn6V6GEp/g=;
        b=DW7V7SlD1V1/PZm4l912CfGJ3NbeDYJIuVQu1oYT4AGnl4+pxyadw5GIAJBYo/Jwov
         gLqQ6o4A8r3c8i8jnLRCkyLcQ2M5Vmu5f47XIEBQ9ElH/aIIgh+5zd/jqkN4nuMSChlS
         4c2PHwQHQsNTqCPVWYnZygJog1Vto7v7fitEOC9H3Q8aY2zgRIHLfjYKB8KnbZqLZMu3
         5M83kovwkpbSFQXi3ho2iTT75Bi6xljHhQ7oJ2eR2mqe/SJaKwZPRpEw70py/ZNuxGSo
         xch0h+e5Io7SlCUKg3nXwtFYLayK46dMA8yLhkUGF2Vnx6Oq5RMs6VK0mg5QaNeNBsDD
         BWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702791737; x=1703396537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbgTbxX5lAcAXv+gg8OxTQtuBK8jrjfuljn6V6GEp/g=;
        b=SqP0GaFA7l9MW3o0RaGLX8PM+HmGFpkftYqray6IxjLpAsrFIGDDMhwr1Dpb29QxRk
         ZD6rcym0hcGo8kuMtJspGWv41xKWIL+IQ/pmdtSUKWcHCkbyk0ZuXYoatJYrUHY/gtGL
         fF5ejk6oKiXvdOccEE9mf0CTrlt06iGSvoPfo6IMyzOHE1wwdMmxaMnmdFLH257Q5xQQ
         8AelsyZ0bQ8gilANoMLW0BmRwvnBJsKDM8y0CuqgTu7LjdLRdJV/XMCdcfYOhJFwZxda
         Pp6pRgiGAAeuPQXKZIOxCdit+bRPAzXl8f/pLvoGIzP91BRyGAFH4YWNyjfUV+2VEH01
         mmBw==
X-Gm-Message-State: AOJu0YxcBWdFI7lDIvRSSpa9BDm5YYG9z3wyaW3wUPQOeHV8TFWOCuRH
	zNFhwvBLUjNiHcwNxUsjXoHa0K7h0wE=
X-Google-Smtp-Source: AGHT+IHpPnw7Cs7tG712gXxMY8PGkL+6BjWcjkTSLK6E2Mkigg6J9r3MNH8sIxn9NjA+tGySe6gDhw==
X-Received: by 2002:a62:e410:0:b0:6d4:262f:f067 with SMTP id r16-20020a62e410000000b006d4262ff067mr1403330pfh.4.1702791737226;
        Sat, 16 Dec 2023 21:42:17 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:6e3d:56d2:3c7b:de95])
        by smtp.gmail.com with ESMTPSA id f16-20020a056a001ad000b006cedd530420sm15365545pfv.52.2023.12.16.21.42.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 21:42:16 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] oe-selfest: add maturn runtime (testimage) test
Date: Sat, 16 Dec 2023 21:41:31 -0800
Message-Id: <9293427154713367ebd917e574649a13b228d207.1702791173.git.tim.orling@konsulko.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192579

Basic smoke test for maturin to test the 'maturin list-python' case.

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


