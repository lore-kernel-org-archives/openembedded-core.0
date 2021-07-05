Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web12.547.1625524588368807907
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 15:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=znth+KiB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.41, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f41.google.com with SMTP id n99-20020a9d206c0000b029045d4f996e62so19738091ota.4
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 15:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=g9QSiMvSJZ6L7vE9Q++REOZ4DcdtG0htyHFZHLyxLZw=;
        b=znth+KiBED1PJF5pjuCXOirKt8WdKHPube+qfTmMmte45N85ee7DGMqjn9y+dknE9G
         xciCDRS9hUDHyfihxwUDtpE9aXNlAj/859aYYUCWaXF6/hLUmCNly2x4QspB9LvFka7U
         EIKlcY+mkNarub2rg67mcq2Wfug0Xk/EXgWyRhc1ABUvYiFwlhj7sTcthLHPiXFMkBlB
         GOoGxWdnWJI7VJj4wNTCjlMou9WU2QmxFQElrKF5oyrm6FBCCSiLpiyWWuucPK8rzWJP
         wJBcvskN69fbMk4Ohl4vqKF6q67at4utqxytZTjMkheQwtYW7OS6VSW/8KHIihAYWc0I
         S00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g9QSiMvSJZ6L7vE9Q++REOZ4DcdtG0htyHFZHLyxLZw=;
        b=NAKzupkAyrcoZS9OlKtNoLBwebLu3zegC8whbsCUGoJsLg+YB34z+gSnLU4rnSesHJ
         U35z57ZY+v4jSJc7b/vQEBWzuoC4Hqpf0+lww7y+gISiRQW6FzdlYqSli9sedXC37kjS
         YfhlohHCbuAbTAHKpGO2Hihuw1j2nlxalD5l+42yFAFh4RNq3TiwmbnRPyLimIhhQlJ7
         sWgFtAc7lNtf+k7A8+9ZqsPKU3SOzep3gjKlMRLEoJzKA5/9sLzfxGhDv+ay9qaV4kGL
         TDtYsYP79VEA4hyseKukCDmAg7tsWGGhwLLB+mPHDWi5DrOT6VbyOfrYK9IlLUs8UnaT
         mwMA==
X-Gm-Message-State: AOAM533f3SgfDK2otPcgc3/YhCnAz0NDdj3r4VgvuLUozlXgNCjWzHzl
	93W9TyZ3kVWuMtUcSVu5ClUkM415nx1BoBy/
X-Google-Smtp-Source: ABdhPJxb5Q2OX/He0WAaPxzGxWu0LJ41c9LwULUe62l0fQZfuhLS025qU1E6pa7Zum9PX+/e9kl7KQ==
X-Received: by 2002:a05:6830:211a:: with SMTP id i26mr7454533otc.136.1625524587339;
        Mon, 05 Jul 2021 15:36:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id i16sm2870178otp.7.2021.07.05.15.36.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 15:36:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/19] selftest: do not hardcode /tmp/sdk
Date: Mon,  5 Jul 2021 12:34:48 -1000
Message-Id: <969c29c39b0ceb73ace615c478ca4544be803c9a.1625511812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625511812.git.steve@sakoman.com>
References: <cover.1625511812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

This races if there are several copies of the test running at the same
time.

[YOCTO #14438]

(From OE-Core rev: deab11848036941771f2b3dc5cdaee83395280b5)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit ea707e8726cd7012d101d02e69503b7c98bdaf3e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 28 +++++++++-----------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 976b513727..353d411681 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -14,11 +14,6 @@ from oeqa.core.decorator.data import skipIfNotQemu
 
 class TestExport(OESelftestTestCase):
 
-    @classmethod
-    def tearDownClass(cls):
-        runCmd("rm -rf /tmp/sdk")
-        super(TestExport, cls).tearDownClass()
-
     def test_testexport_basic(self):
         """
         Summary: Check basic testexport functionality with only ping test enabled.
@@ -95,19 +90,20 @@ class TestExport(OESelftestTestCase):
         msg = "Couldn't find SDK tarball: %s" % tarball_path
         self.assertEqual(os.path.isfile(tarball_path), True, msg)
 
-        # Extract SDK and run tar from SDK
-        result = runCmd("%s -y -d /tmp/sdk" % tarball_path)
-        self.assertEqual(0, result.status, "Couldn't extract SDK")
+        with tempfile.TemporaryDirectory() as tmpdirname:
+            # Extract SDK and run tar from SDK
+            result = runCmd("%s -y -d %s" % (tarball_path, tmpdirname))
+            self.assertEqual(0, result.status, "Couldn't extract SDK")
 
-        env_script = result.output.split()[-1]
-        result = runCmd(". %s; which tar" % env_script, shell=True)
-        self.assertEqual(0, result.status, "Couldn't setup SDK environment")
-        is_sdk_tar = True if "/tmp/sdk" in result.output else False
-        self.assertTrue(is_sdk_tar, "Couldn't setup SDK environment")
+            env_script = result.output.split()[-1]
+            result = runCmd(". %s; which tar" % env_script, shell=True)
+            self.assertEqual(0, result.status, "Couldn't setup SDK environment")
+            is_sdk_tar = True if tmpdirname in result.output else False
+            self.assertTrue(is_sdk_tar, "Couldn't setup SDK environment")
 
-        tar_sdk = result.output
-        result = runCmd("%s --version" % tar_sdk)
-        self.assertEqual(0, result.status, "Couldn't run tar from SDK")
+            tar_sdk = result.output
+            result = runCmd("%s --version" % tar_sdk)
+            self.assertEqual(0, result.status, "Couldn't run tar from SDK")
 
 
 class TestImage(OESelftestTestCase):
-- 
2.25.1

