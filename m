Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0641ACC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 10:50:10 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4140.1791888600789002320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 03:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R9pE0PPL;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49ff680331aso23270945e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 03:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791888599; x=1792493399; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/j9iag7SFmf3Hfse0BIQHy0RfFliFSLuChwKvU/+NM=;
        b=R9pE0PPLU3pmwE+tlaIhondUnv6BI77Sl+H6hPbeseq/CJ+2zsQF4QwZOxwlROX9Wh
         E93xL7sFVpsTw68jbjQrkOyBU2o+4dt0uMLAeenN1RzzPPJmoZhBXmew1xnOnSHBTmf0
         yrozC74hSC/EWXxyRcLsv734UG/7Vyzh7C7bWyQlO5uT/R6o2t1w1Ht2uV745Ccsdi4C
         biv1mn5u7HDSmGG1kyCqfdqToQ398Xa5LiV4j66HXbQxIBXhJYApBZ7UOo2gSA3UpuKP
         1PgJRi8XKC5/H5ZoU2ZoE01FvbXkXnitJnZi8fo+G/NXYaJNSFTd/S+r+WxXHsKqvf7D
         84JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888599; x=1792493399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/j9iag7SFmf3Hfse0BIQHy0RfFliFSLuChwKvU/+NM=;
        b=DQsBXd4TXpZWe4bHrDgf0musqeLyUXLJ7XJ1FBjbn61EAYOscnBgb4jYEzqedBWcCP
         2RF20/KY6vusvPpkOAipMZbjglJPahPPSAtauPi1c5TvHe7Ax7xEh81E7mTE6nLPs5Xm
         5GWJqlmXq3v6lpZWjibZr4LSUxd1dRb4dELNorlBoGOdzhpnVbbN31wnwLCeueSAzVit
         52FpXqSCCww1M/xukWoRK3RwzwrG6z291ab789IiJSNXHekt2/4GCgZbHpnTatuL+Oqe
         LmjKxMyI9jO0gedT1jwHP5SE+NtekDSAwGkeNBdDj0PXg/dWEdjEv8LtZVsg2SUih5iY
         fFbg==
X-Gm-Message-State: AFq9FYKyxQSazr0ZJgyaud2/LgWKTZ7kNvROfOx/oWDFlwekwX+WLEz8
	rGEHL9n6laMI5QEeS8Dk6MCaJWJ6Er2BpNgGeZXbp+bO+LfXyopiyLge1zuw3g==
X-Gm-Gg: AYBFou1OTcmaaC8TH5xZePBVzQbkxloG3YKV4+HaSPXeI17C0SsmNytSzZzlNmxD9//
	gACQzhN4xaDa2SprgfyjCc8r6zF7Jg8rDhzR+US7YXhRCwVZTqI/2g55R1s2KNlIEwdYQyYhAq3
	P/HP+Ye2dPRs2QThMFIPU5+vHUQAJUzADxU/Eyez+BOjy074xDIWSExX7FvotusEpeCpHtBa/ix
	z94duUVVpguQtj1pOWRAo5JvbTzJZDSFtAboN92eVrbnaXSyskcelspSEAhagRXQBAPLFG831fT
	vuA3RpEJe521mNob1T+8eQiMmNLcMH/jeOr5u+qi2wSJpJJD/Rg9bkoXePZ2jh2NDqMiw3ySOQq
	5ANoNiUdkyF+oHnq9zWPepz7HEOhI3X1nOUx27/Ej1jqTSGbBq9DOxSaHHIBETVyN8mWM0sYXs4
	I7hf3xAEYUG86y333XlHpUat150aW+hM9x+b4S+fm5fGAQfMboRJ6+TsliaQA2LwREt83VP0bx8
	BB1BsVHGnqb2K99Rg63NluD8YBPcRW2Wlcy44aOJpuDw9Hvxw==
X-Received: by 2002:a05:600c:46d1:b0:4a1:7d56:663b with SMTP id 5b1f17b1804b1-4a18e4a7844mr256455185e9.24.1791888598864;
        Tue, 13 Oct 2026 03:49:58 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19303d4a9sm31623155e9.2.2026.10.13.03.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:49:55 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 13 Oct 2026 11:49:38 +0100
Subject: [PATCH 4/4] oeqa/selftest: check the font caches an image ships
 are used
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-fontcache-reproducible-mtime-v1-4-950f07b80f0f@gmail.com>
References: <20261013-fontcache-reproducible-mtime-v1-0-950f07b80f0f@gmail.com>
In-Reply-To: <20261013-fontcache-reproducible-mtime-v1-0-950f07b80f0f@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 10:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247720

Boot an image carrying a font and have fontconfig report the caches it
checks: every one must match its directory, and nothing may be written,
neither to the system cache nor to a per-user one.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/lib/oeqa/selftest/cases/fontcache.py | 42 +++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/fontcache.py b/meta/lib/oeqa/selftest/cases/fontcache.py
new file mode 100644
index 000000000000..df88a229aab2
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/fontcache.py
@@ -0,0 +1,42 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import re
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator import OETestTag
+from oeqa.utils.commands import bitbake, runqemu
+
+class FontCache(OESelftestTestCase):
+
+    @OETestTag("runqemu")
+    def test_image_font_cache_is_valid(self):
+        """
+        Summary:  Check the fontconfig caches built into an image are used
+        Expected: fontconfig accepts the cache of every font directory and
+                  writes no cache of its own, system or per-user
+        Product:  oe-core
+        """
+        features = 'EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login"\n'
+        features += 'IMAGE_INSTALL:append = " ttf-bitstream-vera"\n'
+        self.write_config(features)
+        bitbake('core-image-minimal')
+
+        with runqemu('core-image-minimal') as qemu:
+            # FC_DEBUG=16 reports each cache fontconfig checks and each one it
+            # writes. An empty HOME catches a per-user cache, which fontconfig
+            # writes whenever it cannot use the system one.
+            status, output = qemu.run_serial(
+                'H=$(mktemp -d); HOME=$H XDG_CACHE_HOME=$H FC_DEBUG=16 fc-match sans-serif; echo "user cache: [$(ls -A $H)]"')
+            self.assertEqual(status, 1, msg=output)
+
+            checks = re.findall(r'FcCacheTimeValid dir "([^"]+)" cache checksum (\d+) dir checksum (\d+)', output)
+            self.assertTrue(checks, msg="fontconfig checked no cache:\n" + output)
+            for directory, cache, mtime in checks:
+                self.assertEqual(cache, mtime, msg="%s: the cache records mtime %s, the directory has %s\n%s" % (directory, cache, mtime, output))
+
+            self.assertNotIn('FcDirCacheWriteDir', output, msg="fontconfig rewrote a cache:\n" + output)
+            self.assertIn('user cache: []', output, msg="fontconfig wrote a per-user cache:\n" + output)

-- 
2.43.0


