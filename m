Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13CCC369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 12:27:30 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.15683.1746016048902481084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 05:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cxxKeaLA;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30db2c2c609so82426131fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 05:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746016047; x=1746620847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1X9R/H1qWj0LT8KgTXYRPgwBPrFVBiXJSw/ivypdVs=;
        b=cxxKeaLAGbfx1inUn6UB63wT0R/9JXpUAQiapYZJ9GjpCwsqaSrMC1Fen8SEAXDvF6
         rIflnkIbu2fr3X46GExN4YgZs9ObCnDloCrR+x2ZJiPFa6OJBfwZBgwXB1p4KeUx/eQs
         4IEaX3QOlSlAD2Ah3Z7qF991thRfR1OUT2yicjqT9BhyIZR/W2zkKvbew1V1hjsVKw83
         +8jTpI8a5TTKym5M4Q2tBdhY5Aww7z4Bctrf2tE6dT8Z9BKhzDgPZ39zwekcq4ggv6mz
         Yhf+WGVwpPhyBO62YUwM21ClNp27/2GoOYO/eXvrYDHHogvDpfjAvfUh+S5Z8QNHyP2n
         pOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016047; x=1746620847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1X9R/H1qWj0LT8KgTXYRPgwBPrFVBiXJSw/ivypdVs=;
        b=U5aUcGlAIRQQfS6HFq8zCY0OuugTbnWF5nIJXpE1U67dZkzP1z9B3sFZj4SdBH9G0s
         WKP9UaN+BHNLprxZ7ODMZEJXbVui/zrBrf6YNr2IUOvzbOHw9XgEJZIKNI6n1ZU/YI5P
         urHdPWJY2caOh60WMl9hfIWdKrvBnSyJ1ltrrw0vEppB6mACs53QKNvRzn/vTDMWDWbj
         ZE//w/DOFCugst1q3u/MTpAZmk77uf6mQHCfF0n5L+eiFWMCWTT1X9mFnZI91/HLgCqt
         tAcllZ82ZOc00rL35iViMscJhfZKPCv4ZDtXeV3NEN3c30yysq8I8e8UaKEt6PzGK5jK
         +I0w==
X-Gm-Message-State: AOJu0Yz0Naql3s/rU1y/10RHSgqt563MrgJuKuhY+yqHY/aU4nwNdRVz
	Zd8Dkof1Jn0fuSXPUVPN9CyIJSzDHzPxr1uaoRg5Es9xIvvCwUpKci6l5ollLHS//ykrhgk1r+u
	kd+8=
X-Gm-Gg: ASbGncsY+z/UmPDHAcG046cSAslNkpwVZI5NeLcgasuEWSOEZuz1m9ZQ6sF6QFXCTrj
	6Hu1J73rAzowHxjivBSV52c23PILvpLrvuccEQ+HzbMDbTR8C2z1gdZd45+Pwjsyiipe/4jpmdS
	7qalqD3W3qzoy6xKCr7dS6vdAeMfZkiCgBRasFm72SsEp+XB9PwpN/6kePe5oBmKyyR3LxVVa9B
	4i4EmszzM23yx/l/vdVsgEyYwM1BUf4f1SreDLHX/fN/4l/hDZ+KfhWURoI87CHKkkRgP8dsSjf
	CXD1x4SIXwXyj7ekGEk3MX+iEwmBawkT21LqAvAl8DZU3LbHXm454AjG+cGpuW8oC2QsN201uBv
	jEC1f3sbq9bN8cAUNRA==
X-Google-Smtp-Source: AGHT+IHMICUQ6l8bTmrCrznjpUv/njOAAvts+qRDhmXxKczaTj5EigTIuLR5l8JBf/Uk29azQHtdPA==
X-Received: by 2002:a2e:bd02:0:b0:30b:d17b:269a with SMTP id 38308e7fff4ca-31e69e31111mr11284031fa.7.1746016047043;
        Wed, 30 Apr 2025 05:27:27 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31e95ee3750sm2314491fa.80.2025.04.30.05.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:27:26 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/2] oeqa selftest wic.py: increase rootfs size in test_offset
Date: Wed, 30 Apr 2025 15:27:00 +0300
Message-ID: <20250430122701.747803-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430122701.747803-1-mikko.rapeli@linaro.org>
References: <20250430122701.747803-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 12:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215743

This test is failing on genericarm64 which includes all kernel
modules on rootfs by default. Recently added kernel modules
triggered the size limits to be exceeded. Fixes:

ERROR: Actual rootfs size (112884 kB) is larger than allowed size 102400 kB

Doubling the size to avoid issues like this on machines which
may include a lot of packages on default images. Size of the
rootfs does not matter for the test, only that the offsets are
correct in various usecases.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 42 ++++++++++++++---------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 60dce33911..1bb6191327 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1156,71 +1156,71 @@ class Wic2(WicTestCase):
         with NamedTemporaryFile("w", suffix=".wks") as tempf:
             # Test that partitions are placed at the correct offsets, default KB
             tempf.write("bootloader --ptable gpt\n" \
-                        "part /    --source rootfs --ondisk hda --offset 32     --fixed-size 100M --fstype=ext4\n" \
-                        "part /bar                 --ondisk hda --offset 102432 --fixed-size 100M --fstype=ext4\n")
+                        "part /    --source rootfs --ondisk hda --offset 32     --fixed-size 200M --fstype=ext4\n" \
+                        "part /bar                 --ondisk hda --offset 204832 --fixed-size 100M --fstype=ext4\n")
             tempf.flush()
 
             _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
             self.assertEqual(partlns, [
-                "1:32.0kiB:102432kiB:102400kiB:ext4:primary:;",
-                "2:102432kiB:204832kiB:102400kiB:ext4:primary:;",
+                "1:32.0kiB:204832kiB:204800kiB:ext4:primary:;",
+                "2:204832kiB:307232kiB:102400kiB:ext4:primary:;",
                 ])
 
         with NamedTemporaryFile("w", suffix=".wks") as tempf:
             # Test that partitions are placed at the correct offsets, same with explicit KB
             tempf.write("bootloader --ptable gpt\n" \
-                        "part /    --source rootfs --ondisk hda --offset 32K     --fixed-size 100M --fstype=ext4\n" \
-                        "part /bar                 --ondisk hda --offset 102432K --fixed-size 100M --fstype=ext4\n")
+                        "part /    --source rootfs --ondisk hda --offset 32K     --fixed-size 200M --fstype=ext4\n" \
+                        "part /bar                 --ondisk hda --offset 204832K --fixed-size 100M --fstype=ext4\n")
             tempf.flush()
 
             _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
             self.assertEqual(partlns, [
-                "1:32.0kiB:102432kiB:102400kiB:ext4:primary:;",
-                "2:102432kiB:204832kiB:102400kiB:ext4:primary:;",
+                "1:32.0kiB:204832kiB:204800kiB:ext4:primary:;",
+                "2:204832kiB:307232kiB:102400kiB:ext4:primary:;",
                 ])
 
         with NamedTemporaryFile("w", suffix=".wks") as tempf:
             # Test that partitions are placed at the correct offsets using MB
             tempf.write("bootloader --ptable gpt\n" \
-                        "part /    --source rootfs --ondisk hda --offset 32K  --fixed-size 100M --fstype=ext4\n" \
-                        "part /bar                 --ondisk hda --offset 101M --fixed-size 100M --fstype=ext4\n")
+                        "part /    --source rootfs --ondisk hda --offset 32K  --fixed-size 200M --fstype=ext4\n" \
+                        "part /bar                 --ondisk hda --offset 201M --fixed-size 100M --fstype=ext4\n")
             tempf.flush()
 
             _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
             self.assertEqual(partlns, [
-                "1:32.0kiB:102432kiB:102400kiB:ext4:primary:;",
-                "2:103424kiB:205824kiB:102400kiB:ext4:primary:;",
+                "1:32.0kiB:204832kiB:204800kiB:ext4:primary:;",
+                "2:205824kiB:308224kiB:102400kiB:ext4:primary:;",
                 ])
 
         with NamedTemporaryFile("w", suffix=".wks") as tempf:
             # Test that partitions can be placed on a 512 byte sector boundary
             tempf.write("bootloader --ptable gpt\n" \
-                        "part /    --source rootfs --ondisk hda --offset 65s --fixed-size 99M --fstype=ext4\n" \
-                        "part /bar                 --ondisk hda --offset 102432 --fixed-size 100M --fstype=ext4\n")
+                        "part /    --source rootfs --ondisk hda --offset 65s --fixed-size 199M --fstype=ext4\n" \
+                        "part /bar                 --ondisk hda --offset 204832 --fixed-size 100M --fstype=ext4\n")
             tempf.flush()
 
             _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
             self.assertEqual(partlns, [
-                "1:32.5kiB:101408kiB:101376kiB:ext4:primary:;",
-                "2:102432kiB:204832kiB:102400kiB:ext4:primary:;",
+                "1:32.5kiB:203808kiB:203776kiB:ext4:primary:;",
+                "2:204832kiB:307232kiB:102400kiB:ext4:primary:;",
                 ])
 
         with NamedTemporaryFile("w", suffix=".wks") as tempf:
             # Test that a partition can be placed immediately after a MSDOS partition table
             tempf.write("bootloader --ptable msdos\n" \
-                        "part /    --source rootfs --ondisk hda --offset 1s --fixed-size 100M --fstype=ext4\n")
+                        "part /    --source rootfs --ondisk hda --offset 1s --fixed-size 200M --fstype=ext4\n")
             tempf.flush()
 
             _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
             self.assertEqual(partlns, [
-                "1:0.50kiB:102400kiB:102400kiB:ext4::;",
+                "1:0.50kiB:204800kiB:204800kiB:ext4::;",
                 ])
 
         with NamedTemporaryFile("w", suffix=".wks") as tempf:
             # Test that image creation fails if the partitions would overlap
             tempf.write("bootloader --ptable gpt\n" \
-                        "part /    --source rootfs --ondisk hda --offset 32     --fixed-size 100M --fstype=ext4\n" \
-                        "part /bar                 --ondisk hda --offset 102431 --fixed-size 100M --fstype=ext4\n")
+                        "part /    --source rootfs --ondisk hda --offset 32     --fixed-size 200M --fstype=ext4\n" \
+                        "part /bar                 --ondisk hda --offset 204831 --fixed-size 100M --fstype=ext4\n")
             tempf.flush()
 
             p, _ = self._get_wic_partitions(tempf.name, ignore_status=True)
@@ -1229,7 +1229,7 @@ class Wic2(WicTestCase):
         with NamedTemporaryFile("w", suffix=".wks") as tempf:
             # Test that partitions are not allowed to overlap with the booloader
             tempf.write("bootloader --ptable gpt\n" \
-                        "part /    --source rootfs --ondisk hda --offset 8 --fixed-size 100M --fstype=ext4\n")
+                        "part /    --source rootfs --ondisk hda --offset 8 --fixed-size 200M --fstype=ext4\n")
             tempf.flush()
 
             p, _ = self._get_wic_partitions(tempf.name, ignore_status=True)
-- 
2.43.0


