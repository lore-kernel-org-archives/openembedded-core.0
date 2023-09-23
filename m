Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CB2CE7A8C
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 07:31:14 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.16671.1695454265425411747
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Sep 2023 00:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=apsn6DWs;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c5db4925f9so24219475ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Sep 2023 00:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695454264; x=1696059064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Q/G8xe4EfwMMm43E1d/zjKTH58BN1IEk+XPhs2zNfU=;
        b=apsn6DWsOPTU8+nCCgh45NRMW0nU+/Az70H8zmIbS38hKEo/gxOlig5fTJ2jbi2bLc
         4DimDd4lIFS1mpcPjS9B28TDNT0S+KR2Jt5XNnmEd6Iy85DmdEsJqpWhdq6iXULOLso+
         8Eor8LR5N9/iXpj9v0jCHwA/Gauq+uknPtFAerXLgYK7LnFgZ5oByrof9t/UkouoWZ0E
         4X3gvsUv4IR3nwYajnqdm0r9Bx8vjgLpe57B9faIwV/fbH7h3NbjPWRS01aX3BNdoEoJ
         cTg18lqsVT5SOJNdp2XIaXRI3ibyKJY9QDqW5w8tsSofoJbeQoBjgkAgZ0jMFsnJYBlS
         E+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695454264; x=1696059064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Q/G8xe4EfwMMm43E1d/zjKTH58BN1IEk+XPhs2zNfU=;
        b=pM6yDFYjfb3Pemw59A7H7fHNz2KYFcSvvkCn3037hu9jAZVgiY7KQoH4eGXTKZKR4f
         tci0Rqvw91HRm3w2cjm6besf2zJaZTRxjWUR+UWiYdU6VzxFrA4SwOrCgB9sCfg8ihCr
         cWrmDkEh+AhsDnvNikGMXdcpqhMhaijDXjL7SoUdFIkebZrgCCOW4xsudrG1Bxhzeo+d
         +6IuAilERT7vV09NkfB6SKqz5uJA3sslcJOAtLlQTdWLA4c0n0oh60hUrT472GS124i4
         kmXRGG+xqq/TdoVkvV2/Tz1fo3ZPEBR/uCy8GvEHiPdb/w5Ali1S2rf05it0T+jLDcL+
         OySQ==
X-Gm-Message-State: AOJu0YzI99bEtjXEdKOQaDCdGaLrdBPd3kNYcUTcgdaTPkFk0kfIIlvQ
	6E80nZSDaelxFffE1CVpyHGSap582N9zkw==
X-Google-Smtp-Source: AGHT+IGupJXEpD6QLBSLE/LJLh7C1281elv0z72TapZZeN1qpyn1QsP6wKFpLdsns7Fx4GMms2doYw==
X-Received: by 2002:a17:902:da8e:b0:1bc:1e17:6d70 with SMTP id j14-20020a170902da8e00b001bc1e176d70mr3077162plx.24.1695454264387;
        Sat, 23 Sep 2023 00:31:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id jw16-20020a170903279000b001b89b7e208fsm4730244plb.88.2023.09.23.00.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 00:31:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] oeqa: Use 2.14 release of cpio instead of 2.13
Date: Sat, 23 Sep 2023 00:31:00 -0700
Message-ID: <20230923073100.851867-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Sep 2023 07:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188141

2.13 may not be buildable with latest compilers without patching

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/runtime/cases/buildcpio.py | 2 +-
 meta/lib/oeqa/sdk/cases/buildcpio.py     | 4 ++--
 meta/lib/oeqa/selftest/cases/meta_ide.py | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
index 3728855d245..ce122ebcf98 100644
--- a/meta/lib/oeqa/runtime/cases/buildcpio.py
+++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
@@ -14,7 +14,7 @@ class BuildCpioTest(OERuntimeTestCase):
 
     @classmethod
     def setUpClass(cls):
-        uri = 'https://downloads.yoctoproject.org/mirror/sources/cpio-2.13.tar.gz'
+        uri = 'https://downloads.yoctoproject.org/mirror/sources/cpio-2.14.tar.gz'
         cls.project = TargetBuildProject(cls.tc.target,
                                          uri,
                                          dl_dir = cls.tc.td['DL_DIR'])
diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index c42c670add0..33b946fc166 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -19,10 +19,10 @@ class BuildCpioTest(OESDKTestCase):
     """
     def test_cpio(self):
         with tempfile.TemporaryDirectory(prefix="cpio-", dir=self.tc.sdk_dir) as testdir:
-            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz")
+            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftp.gnu.org/gnu/cpio/cpio-2.14.tar.gz")
 
             dirs = {}
-            dirs["source"] = os.path.join(testdir, "cpio-2.13")
+            dirs["source"] = os.path.join(testdir, "cpio-2.14")
             dirs["build"] = os.path.join(testdir, "build")
             dirs["install"] = os.path.join(testdir, "install")
 
diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index 59270fb3e06..e446d9308d5 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -44,7 +44,7 @@ class MetaIDE(OESelftestTestCase):
     def test_meta_ide_can_build_cpio_project(self):
         dl_dir = self.td.get('DL_DIR', None)
         self.project = SDKBuildProject(self.tmpdir_metaideQA + "/cpio/", self.environment_script_path,
-                        "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz",
+                        "https://ftp.gnu.org/gnu/cpio/cpio-2.14.tar.gz",
                         self.tmpdir_metaideQA, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
         self.assertEqual(self.project.run_configure('$CONFIGURE_FLAGS --disable-maintainer-mode','sed -i -e "/char \*program_name/d" src/global.c;'), 0,
-- 
2.42.0


