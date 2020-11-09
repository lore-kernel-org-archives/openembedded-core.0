Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.8709.1604910706303531771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OBytC+Xh;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id q3so7773906edr.12
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 00:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q8hx6tiPDAeiESxnkbvg3Sre1XZS74l8duqixtCUsaA=;
        b=OBytC+Xhj9sqsAtRzRPEexzTtv4/mRzds7VnhsYWUtdaPQulglyCdCSZHEQMqnlwUe
         ZnSpnF8JhqSSWdZuQNI3dq6BjRnjs5ohg6CE/Nl651U3I7V8DBDqCS7QFGRBwU5fcbV0
         +esnrnia+p0pk1b2cEjXEo4ewh7fJo7HvVO6FrOEzlFidoWT6cGGYPYpXhKvkcFX7dK4
         sD6CvMhZw+81x1Ajd0tUBeP5FVfwoyMFktepb9+P26NXbBUiHBkZoN0h+81DJqjUOCV4
         i27SGkNr51JzPl9rMLEF6sK1T1hIB9BI/ZWAXOeiY0ikZY6klCsdyHHucGZn/0whbOMg
         SZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q8hx6tiPDAeiESxnkbvg3Sre1XZS74l8duqixtCUsaA=;
        b=JUfmv+inJE5Z5zblCpf0mh5HPga/uyZ59mjWTWKHMkvHozzDAumaMbETHE7XwABZw+
         yutE5lLw9oMwdrgYZEkiwi9MWX+e3OOM4AxcULLHBuMq23V8cFxogRB43PsqKG8ZqOBX
         9BLMQEwRsq/jGB+76Dc+LtEVuX/Ut+Uaz64FWAeJBa28pG2tNq9fEhGYs6r1Q6rIUH94
         LHfOldR2UMVVioGZoVgj256i0CBTViEggSJv8Xtn75WnHjP1JOZtKX9YRKQiGaUNMInG
         x7+54RVIoaeXZ4jV4CY2mQI4VulVAEOu+N1X6iCsknjdX1AAxFYV5/rFrvxFk/dlFAk1
         E0rw==
X-Gm-Message-State: AOAM530VDpLRVayy+y9S5XgOeq97wzo97GE7QW4D70iCoGK727RDdtPP
	Xk0ZU9PGwE8TTCFD3NmqU/lDMCCfZGNHoA==
X-Google-Smtp-Source: ABdhPJwTmEPLVftUD8heo1u3DJyaecyppfLNIwMa0ZDwWEcrN+XPg6FeGlI6WMnuBK1HwzO/90yHdA==
X-Received: by 2002:aa7:cad6:: with SMTP id l22mr14375334edt.229.1604910704671;
        Mon, 09 Nov 2020 00:31:44 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id sa23sm8187691ejb.80.2020.11.09.00.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 00:31:44 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 02/12] oeqa/buildperf: use weston image instead of sato
Date: Mon,  9 Nov 2020 09:31:23 +0100
Message-Id: <20201109083133.16503-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109083133.16503-1-alex.kanavin@gmail.com>
References: <20201109083133.16503-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/buildperf/test_basic.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/test_basic.py b/meta/lib/oeqa/buildperf/test_basic.py
index 2104617ba3..0fe7d3c8dc 100644
--- a/meta/lib/oeqa/buildperf/test_basic.py
+++ b/meta/lib/oeqa/buildperf/test_basic.py
@@ -11,10 +11,10 @@ from oeqa.buildperf import BuildPerfTestCase
 from oeqa.utils.commands import get_bb_var, get_bb_vars
 
 class Test1P1(BuildPerfTestCase):
-    build_target = 'core-image-sato'
+    build_target = 'core-image-weston'
 
     def test1(self):
-        """Build core-image-sato"""
+        """Build core-image-weston"""
         self.rm_tmp()
         self.rm_sstate()
         self.rm_cache()
@@ -40,10 +40,10 @@ class Test1P2(BuildPerfTestCase):
 
 
 class Test1P3(BuildPerfTestCase):
-    build_target = 'core-image-sato'
+    build_target = 'core-image-weston'
 
     def test13(self):
-        """Build core-image-sato with rm_work enabled"""
+        """Build core-image-weston with rm_work enabled"""
         postfile = os.path.join(self.tmp_dir, 'postfile.conf')
         with open(postfile, 'w') as fobj:
             fobj.write('INHERIT += "rm_work"\n')
@@ -60,10 +60,10 @@ class Test1P3(BuildPerfTestCase):
 
 
 class Test2(BuildPerfTestCase):
-    build_target = 'core-image-sato'
+    build_target = 'core-image-weston'
 
     def test2(self):
-        """Run core-image-sato do_rootfs with sstate"""
+        """Run core-image-weston do_rootfs with sstate"""
         # Build once in order to populate sstate cache
         self.run_cmd(['bitbake', self.build_target])
 
@@ -93,7 +93,7 @@ class Test3(BuildPerfTestCase):
 
 
 class Test4(BuildPerfTestCase):
-    build_target = 'core-image-sato'
+    build_target = 'core-image-weston'
 
     def test4(self):
         """eSDK metrics"""
-- 
2.29.1

