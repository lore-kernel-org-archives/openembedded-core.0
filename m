Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96230C36002
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:49 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.2964.1742372203199753405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S2PYAudd;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-224171d6826so33728645ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372202; x=1742977002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tv+bQen5DRBu5hIKf2m9RCRKa9x4Vp2jKB+VM+8bOYY=;
        b=S2PYAuddG3ZvE+MlmdbE6IYvadd6dSueFks4rxktqQUE1Zg3bp3PrWHOTL8YMx7S6X
         GgF3XTlahIghE2qRXpyDrsVDRjHi4w6L8XVuoUwB5MavVLE0w5QVeOsUP8/u9m+w6nda
         xTP6TAFvSGNPXbXDShNHKmv866Fk1AR5BDPO2jjODBBOsbnJWUpKkCly+LAKkDNxW91x
         awrWWc6EEpeudU3Fq4l3b9xfCZbb49SLmbFeVsEpWGyacrOyDE3f2PwXpzkKV4k4CVDn
         le0BNM38z0xQI6U+xReJ7qj6jdYv8ybptGpCODLeb+3fkfpBvNvgiAugV3ylzLocCdZV
         56+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372202; x=1742977002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tv+bQen5DRBu5hIKf2m9RCRKa9x4Vp2jKB+VM+8bOYY=;
        b=u7XpE2Ujx1fFJUji5CubFhSB36Xid3g657M330YmOGXTHukP024uZbQZ6DZETrDTp5
         iiq+A+rzmWaUuuohgh2eCBmFskUzWdKamhBLCzERzc+MgxIlrPcSpiHaM/3R5q/pzcjj
         O6IlOpkM+JS8uJiA3irottuz8IpZO3pdTU64wJLA/i0o3pGK1DJ53TS2OMdMJdYtbTE4
         lsw2Q//v3YIWFMqhqldkOoRyniZ86PN6ivT/T+vzOUOLvY+ioCamqOri748sOtD0Nbxo
         ln06fK+frYa5Q9aW++m0KH/NyS1a1iPgYjcIMUNGR8hZsWfMtVnehftnM/vN6qqd/E9R
         jbdg==
X-Gm-Message-State: AOJu0Yxx9wjcVuMtCGMpwCyIZ5V4+JNQd2a5aYwd4PhP63MQH9DkoX3I
	oKZG62OKnaAgs1b0ZzWwUP7V5x11k4MXXnR0S5+teNjw/0RUMeZsMOQeHD7q
X-Gm-Gg: ASbGncvk2YUnt5ckxDm6EfdAUEaDpHh2S0S2pg7dbxqh2NSAW94D/gcuBtcgaFUDLfw
	4Gln0vA+AWPEZaRyb3Sqkgec1WNXhpGpdXuT6pbjk0AIXAN2RLlehHPBZxi5GC97b+lehje6gew
	pgUa4i4A2f/6hmDaRtSei+7Sb42AhK589GJu8PJKWPywmGhasdvC60QG5OUnlyf3Td/qKQi/i/o
	72T9+SFQiE4mbhJebFicInCEF6z8XvgpEuWUDdvbR5Ds7pqre35/UaZ+EFHmxqP2FRmsN3HL4yO
	+qkzfuXjNp3Kun2VS/olfJvj7K9MP/NRrsx6+olasznk8BI=
X-Google-Smtp-Source: AGHT+IHJFGJFa07G3vz8hnb2wHVCh9SXgYNzUGeM/QQwFLopwoHZjElynPio822jXUvebg+SKnqPaQ==
X-Received: by 2002:a05:6a21:7011:b0:1f5:80a3:afed with SMTP id adf61e73a8af0-1fbecd4736dmr4039918637.32.1742372202408;
        Wed, 19 Mar 2025 01:16:42 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 23/27] time: Fix build with musl
Date: Wed, 19 Mar 2025 01:16:03 -0700
Message-ID: <20250319081610.3536475-35-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213300

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-the-type-for-sighandler_t.patch  | 27 +++++++++++++++++++
 meta/recipes-extended/time/time_1.9.bb        |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch

diff --git a/meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch b/meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch
new file mode 100644
index 00000000000..0f8bf6e03e0
--- /dev/null
+++ b/meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch
@@ -0,0 +1,27 @@
+From cfef684e2c2c93c4a871d6c2a7af8f4c1b7c6741 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Mar 2025 09:29:58 -0700
+Subject: [PATCH] Fix the type for sighandler_t
+
+__sighandler_t is private interface in glibc so its
+better to not use it, as an aside fixes build with musl
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-time/2025-03/msg00000.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/time.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/time.c b/src/time.c
+index 7ff29a4..82eb66a 100644
+--- a/src/time.c
++++ b/src/time.c
+@@ -728,7 +728,7 @@ run_command (cmd, resp)
+      RESUSE *resp;
+ {
+   pid_t pid;			/* Pid of child.  */
+-  __sighandler_t interrupt_signal, quit_signal;
++  sighandler_t interrupt_signal, quit_signal;
+   int saved_errno;
+ 
+   resuse_start (resp);
diff --git a/meta/recipes-extended/time/time_1.9.bb b/meta/recipes-extended/time/time_1.9.bb
index d9e2d06b32d..366a64d8e5d 100644
--- a/meta/recipes-extended/time/time_1.9.bb
+++ b/meta/recipes-extended/time/time_1.9.bb
@@ -16,6 +16,7 @@ BBCLASSEXTEND = "native nativesdk"
 SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz \
            file://0001-include-string.h-for-memset.patch \
            file://time-1.9-Fix-compiling-with-GCC15.patch \
+           file://0001-Fix-the-type-for-sighandler_t.patch \
            "
 
 SRC_URI[md5sum] = "d2356e0fe1c0b85285d83c6b2ad51b5f"

