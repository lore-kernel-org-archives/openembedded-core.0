Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBD8EDA68E
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 15:40:59 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21483.1772552449197606127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 07:40:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=b2dtc/Gu;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5069b3e0c66so93965701cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 07:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772552448; x=1773157248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jVlZBm8NaKZGgqb9/ipuEs0r4BZ53h2P/YnKCN/GX40=;
        b=b2dtc/Gud5X5ehysjMfi2mqd3sYZ+QVMF681zG1mKGcccwE2DQ1uKbk2XTCyKCFvty
         pUI181VS/YZTgtuhieK7muCLap2QnrjSPWurLLW8p46DkxARiZDenBJTcIoOg6DAqJPB
         seOpgESfUqH87iAa3NQ52H+Fn6iJCGk9YC3XY5j3iwSMvSGNq8YEwdtaHBHoDSFvocGi
         0Ae64gqyHn+eO6KVNaXHZh+Y35SOJzgqM+dHJQ+5qV6vlvNI1kIVeHT5CJTrTpCMoXlM
         GPrJD79HXPrwJPT9PjQxxMg3/EKFF17cZd3yxWeuAdjV8/thmE8+wTkHJYRWI4aO9YU+
         +SPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772552448; x=1773157248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVlZBm8NaKZGgqb9/ipuEs0r4BZ53h2P/YnKCN/GX40=;
        b=bPYI3XbDvoKm10FGyJ97zqMmcph+udmiUjAKYLh25qIK2j1dgKtsm3/28fYTAKPxOY
         raKtuDKvxsPRlj/wngIXE+VQk8YZ57QrD5n3PJNG9QfyDe1zIh810gQw9NzYg3OVdJ4u
         0vq04VYYC/VTOBH5aIE8Yl4JNIMPiI9XovJwaGc6GgyItU2SFtTma97kRn2FCfbWUVWN
         mzO0S6oF4dsqhZoLzwoJojAJ4ppUMnwkdasdqHLjncOF9y3pZsu9dp/f0NoVjyF2lGN8
         UjorfPB7DksNoJ1PWgd//LPFu6FMFDiKOWTEbUSYarye8wd8TFwwk7IoCNxKxQEMHdhM
         y37A==
X-Gm-Message-State: AOJu0Yw6YAdqzPe7WeYl2uu/xnq6KKX0wB9U4ouqDKAEXw6PXRn63lsq
	s+1whFZUP/ImZ29Zw3Mo0QJCM6Wd4f6iaav98pCkcThAvNX0nXQj0zq5Zcz/uOmba95MhnVV3mG
	bqT8JkKY=
X-Gm-Gg: ATEYQzzo3vuzKMcR06DDB1iGoPH7GLoI8BzvKMp4/7ZUw9D0034fnFlradx42YvbOZp
	R+91/9I4dLz28F0pBGjR+skAfCw0xgGkD0SoTJthP+PeMZJVaK0G/E+kTMILBO4altxiYRSuXdD
	uwuZEOT1X2ciZziDaVK+RY0Hn5jmezfBWOn5spFH2GbpxLFPtoZNiiE9wEQDqeRColjzrH68TT8
	zgSOHv3c07Cmy++8XGgycyZnNYObYMu1UffImKVZf4gYTqnql01yJOkCZZQGilr+U4JHMU8AV3N
	0RbzGPhBXbqljtguFx+ex7HBn8lz54v2KFIproRp3zqONHCB0fdq+T5WMiL95clKpQYXuZzIi0W
	WtproI8IKQ3l+mmuG1z8x9JftacD8EnC2hcgTmlCCXT2Aj+X1ahr3UDkUmfuubTiA/EyJlqX3FX
	EeqaYsNcJJga6E1tIYJ23fF47BHoY=
X-Received: by 2002:a05:622a:134a:b0:4ed:a6b0:5c14 with SMTP id d75a77b69052e-508cea9b444mr27830191cf.23.1772552447467;
        Tue, 03 Mar 2026 07:40:47 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a0c1fd01bsm14073466d6.49.2026.03.03.07.40.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 07:40:46 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3: skip test_only_active_thread test
Date: Tue,  3 Mar 2026 10:40:45 -0500
Message-ID: <20260303154045.1657268-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 15:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232323

Skip a test we've seen failing intermittently, since it may be another
occurring due to variable load on the Autobuilder.

Fixes: [YOCTO #16178]

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ..._active_thread-skip-problematic-test.patch | 30 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.14.3.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_only_active_thread-skip-problematic-test.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_only_active_thread-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_only_active_thread-skip-problematic-test.patch
new file mode 100644
index 0000000000..4886b7e386
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_only_active_thread-skip-problematic-test.patch
@@ -0,0 +1,30 @@
+From 0524821f8fcbdea2fbd90f199e7fb4950f50530f Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Tue, 3 Mar 2026 09:27:10 -0500
+Subject: [PATCH] test_only_active_thread: skip problematic test
+
+This test hangs frequently when run on the Autobuilder. Disable it in
+testing for now.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Lib/test/test_external_inspection.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Lib/test/test_external_inspection.py b/Lib/test/test_external_inspection.py
+index a709b837161..7a87092c10e 100644
+--- a/Lib/test/test_external_inspection.py
++++ b/Lib/test/test_external_inspection.py
+@@ -1111,6 +1111,7 @@ def test_self_trace(self):
+             ],
+         )
+ 
++    @unittest.skip("skipping problematic test")
+     @skip_if_not_supported
+     @unittest.skipIf(
+         sys.platform == "linux" and not PROCESS_VM_READV_SUPPORTED,
+-- 
+2.53.0
+
diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.3.bb
index e475c6e042..7047cd8e8d 100644
--- a/meta/recipes-devtools/python/python3_3.14.3.bb
+++ b/meta/recipes-devtools/python/python3_3.14.3.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch \
            file://0001-Skip-flaky-test_default_timeout-tests.patch \
            file://0001-gh-144787-tests-Allow-TLS-v1.2-to-be-minimum-version.patch \
+	   file://0001-test_only_active_thread-skip-problematic-test.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
-- 
2.53.0


