Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58216C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 14:04:04 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.35955.1702044242429777082
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 06:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jo43gi3q;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c339d2b88so6478635e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 06:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702044240; x=1702649040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=voEIXEVYHhFoY0uRd/LyLnE9OM3Xb3HDLMj0vvmv5cQ=;
        b=Jo43gi3qjR5nVv8AEOB4YqUGtxTNEZ2o9J6VGsNFm8xZuS3a4KB3VWQ8YQ0x1xPNQ+
         +YlZOoXj/UKa30jpidqohRApxshYGvE/M4jXYbwuAPwB2IwJDVRGfULn841l4jRbh9GQ
         V8B6hRqpJKptbX4kHtM5PHmjjLI0ibtsDy22TREct6Gq0HXIInvxyB9jdCHSJ/bhHL3l
         xnViv1XNie1N1ckntKobd8SfI+iHkCURwLyAF7syvZd7FmG/TT02/AtOdgLVGDNyikaR
         iG2Y2KwDbEP/dj9FJ/JjctKt5L5G8l/0uwuMKkkGWj7k2QahJcklWM60TTE3whqhEKEJ
         95OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702044240; x=1702649040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=voEIXEVYHhFoY0uRd/LyLnE9OM3Xb3HDLMj0vvmv5cQ=;
        b=tRtaOqy864cc4U1DI9xbtjsNKQnujohFOK3Q3J1/rD4n4hb3Bv1JYwRP0QseLDnK8K
         0Q0rmUGJOAKHpG7kGtZ2FcVvtzFq1qdKE5GZ6L8XCsvmV+F1/pNdSg8AtSZ8cYnJWO/E
         2oD+Iu/cbXMCwhGgqIyql658TZ7NF+YEhtT8A3Qn2U1gw3SbhDD0JClOgjFAog4e99D0
         vTxmkG/k256IZo8Qzw7lUNaNXtiWButwFgkSaxiWOCJRp+o/z5vTBrgDQ1JqhAUkf5Y5
         PI/dz7Au684YaIQUV5CRnh/vEiQHf+hjU37jP/uDUEQtMLbYY9GMY1JgiCJPIMoe1Wyo
         PIMw==
X-Gm-Message-State: AOJu0YyxJJaMagPivCivMX6LSadba7XKr0h3lf7CG8fCCeb0eTYNnSTC
	l1Y9bMM8K5k5mCiBUOQglKG8wvPcuMM=
X-Google-Smtp-Source: AGHT+IGvstnV+pVGCHVcpXYwXZ1VK+SL6NFQ0sM7Cbb6KnQd7pvK1qmrDs6OvhAweUGOc4i/xo1N7w==
X-Received: by 2002:a05:600c:12c6:b0:40c:35bb:33a1 with SMTP id v6-20020a05600c12c600b0040c35bb33a1mr18878wmd.83.1702044240458;
        Fri, 08 Dec 2023 06:04:00 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:f8f3:2d97:de04:e800])
        by smtp.gmail.com with ESMTPSA id s12-20020a05600c45cc00b0040b3632e993sm5223722wmo.46.2023.12.08.06.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 06:04:00 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yash Shinde <Yash.Shinde@windriver.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 1/7] rust: Disable rust oe-selftest
Date: Fri,  8 Dec 2023 14:03:43 +0000
Message-Id: <20231208140349.3576-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 14:04:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192063

From: Yash Shinde <Yash.Shinde@windriver.com>

After rust is upgraded to 1.71 and later versions, the rust oe-selftest gives
build errors due to unstable nightly options(see the error mentioned below). Thus, disable the test suite
until the issue is fixed

error: the option `Z` is only accepted on the nightly compiler
thread 'main' panicked at 'failed to gather the target spec for x86_64-poky-linux-gnu', synthetic_targets.rs:66:9

Following issues are created in Yocto bugzilla and rust upstream to track this issue-

https://bugzilla.yoctoproject.org/show_bug.cgi?id=15275
https://github.com/rust-lang/rust/issues/115642
https://users.rust-lang.org/t/does-rust-test-suite-supports-nightly-options-during-bootstrapping-in-rust/103108
https://users.rust-lang.org/t/unable-to-read-target-specs-when-rust-1-73-is-bootstrapped-in-yocto-poky/102959

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/lib/oeqa/selftest/cases/rust.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 7d148142fc78..6dbc51700689 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -39,6 +39,9 @@ def parse_results(filename):
 @OETestTag("runqemu")
 class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
     def test_rust(self, *args, **kwargs):
+        # Disable Rust Oe-selftest
+        self.skipTest("The Rust Oe-selftest is disabled.")
+
         # build remote-test-server before image build
         recipe = "rust"
         start_time = time.time()
-- 
2.39.0


