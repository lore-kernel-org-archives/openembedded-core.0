Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B921C52D1D
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:27 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.55948.1722258802177594274
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T7VdgAyy;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7515437ff16so2581761a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258801; x=1722863601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDW26OTb7871Bx8YpL40xB+uY01YMRvefyDPdaaZa+E=;
        b=T7VdgAyy+RMnLTHPL+LXBzEo3mdgg5U0gv+WytEiajvoWyHUwR4TuBc2uHhz270qOp
         oqCOYdpfliOmIRrUJIC9eJ52/StXcnD9O+zfzl38NF1aSF/UPRE7GGeRTrYx++TpSYCS
         z9GYVKfJ98SlgJcHEITQJ9X6qPnSsAf6kibh7+RwYxrbkuRCCqNCbxQUb7BFhkyexmWR
         EcsAKAFNuHwSECmr5ILnhrBucZox6rcD8B5aMMN7Vh7yVRtXGeXY9uRRp66LxD834VJF
         Z16KBspQ+aBlGprXDjsHQFyBZQou4VhMQjgtXOtUlytOnzIvxDOyqhGJqONiT14qIWgM
         nvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258801; x=1722863601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDW26OTb7871Bx8YpL40xB+uY01YMRvefyDPdaaZa+E=;
        b=Gy2NSdkGMo7e4baIOtxY+G+3hPRwRoxQ9ay+K4w8NG74AOUdjPtPrfmOPMQBYCAKFd
         zvzd1TOSmCEeJbh2VJyhIYsYviGoS89GxbxBlDkhNbtKKSVnbKAhKJluTr6Gz8uyj2PV
         i8lRMzYc4Wqsvj9My9OMF9u/N50PZtsVS449QDn4aLIz44vb9lmiTq6GYnIKh9pi0MSw
         ezavzRcUy9MzSoQxpzVxpzZ15q/KUtZf/JC/y+8NRL5NyxOXwasAd73Q11pcQnG3/GXm
         zElGfY5ltsHDG2dhD97c1R17gxXJ6n+F+ijsCT52ylcezMuAo/WmUsLsXtvULOWcKH1b
         Qw3A==
X-Gm-Message-State: AOJu0YxldNWcSyD6ODaWZFxg7qkpHqoupOs+1za1MRQDLNiqNZlNq+GF
	PfQL2wlAfByPDQXwXpij14hBJ61+D8GlhrlK2xIVEQ9McPBzk4ihJG832+IVJTJh3VHS3lInV23
	F0HIrFg==
X-Google-Smtp-Source: AGHT+IHx7yKqk9fM66JM27JBFSBCqUfTR7Hx1ajKEuugPleVJgTspIXviyNfnAcBZui2suOOk0e45w==
X-Received: by 2002:a17:90a:668b:b0:2c9:649c:5e10 with SMTP id 98e67ed59e1d1-2cf7e1df022mr9924858a91.10.1722258801379;
        Mon, 29 Jul 2024 06:13:21 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/37] python3: skip test_concurrent_futures/test_deadlock
Date: Mon, 29 Jul 2024 06:12:28 -0700
Message-Id: <141c348ce83552beae88e115d9c4db5802c6e0f4.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202632

From: Trevor Gamblin <tgamblin@baylibre.com>

These tests are causing hangs on the Autobuilder, so disable them for
now.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 291f37808f1a2b2fdc8190696867f974994457c0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-test_deadlock-skip-problematic-test.patch | 30 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.4.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
new file mode 100644
index 0000000000..f0a7cfd39b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
@@ -0,0 +1,30 @@
+From d7e3f26e7094fbe20e2271d75f18ac3b23a67f58 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Wed, 12 Jun 2024 10:29:03 -0400
+Subject: [PATCH] test_deadlock: skip problematic test
+
+This test hangs frequently when run on the Autobuilder. Disable it in
+testing until the cause can be determined.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Lib/test/test_concurrent_futures/test_deadlock.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Lib/test/test_concurrent_futures/test_deadlock.py b/Lib/test/test_concurrent_futures/test_deadlock.py
+index 1db4cd0099..fd07895a17 100644
+--- a/Lib/test/test_concurrent_futures/test_deadlock.py
++++ b/Lib/test/test_concurrent_futures/test_deadlock.py
+@@ -90,6 +90,7 @@ def __reduce__(self):
+         return _raise_error_ignore_stderr, (UnpicklingError, )
+ 
+ 
++@unittest.skip("skipping problematic test")
+ class ExecutorDeadlockTest:
+     TIMEOUT = support.LONG_TIMEOUT
+ 
+-- 
+2.45.2
+
diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.4.bb
index c5ba009e7f..9dd1417f2a 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.4.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-gh-114492-Initialize-struct-termios-before-calling-t.patch \
            file://0001-test_shutdown-skip-problematic-test.patch \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
+	   file://0001-test_deadlock-skip-problematic-test.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.34.1


