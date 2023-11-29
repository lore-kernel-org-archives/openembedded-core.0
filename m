Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3ADC4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 06:12:31 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.25511.1701238344661855541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 22:12:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QRmx6hue;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-35cb62e3905so13243405ab.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701238344; x=1701843144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KiZkophRm4c/OG30hj7RAPgzyLj64c6ujNDa7Av8jak=;
        b=QRmx6hue2/AvzOnAdAPcD0Bnz9kpWb2b2PnTHgKJArSXUFKwK4LzLxdMS/+xB0uucH
         0FclZi132Tius8Abco6UDp4qjMcqJP2BlzS4m6g8/gk0lPWPoS2+icQeu7sgqNFYQzQ8
         ySzxGa9bw6T7odMRHpcnlTIG4o5+lHyEsbAiUV+LU9n0VdzSnlrbUReEU+luP18L9+re
         u8hurmI9A+84a3lkxCn/dcSu7U1WIXvLHYQo1oDiA6PYzFm6xusSXKkJEp9yaGjgBskb
         LXc559N+9RL6nIkVASLW0b74zYm8MH9Bltswyutkqhhf5NZX/Hy5ElgLITqfT/fV3Zzx
         /JeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701238344; x=1701843144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KiZkophRm4c/OG30hj7RAPgzyLj64c6ujNDa7Av8jak=;
        b=g1r2qe68Rmm6FucJ+u82hSXaJ5DQFnOJvCE2wbzd3isdNkltDrz02Mm4kTCx+CgUel
         CMyx/OdP8VTD/AbCI+6iKLZHnb771GNX2f/EhPfmrSwMCVz9/7/utXfNI6Vt+PT2hoBO
         DmzcaQ6kb9NdQLl2OXWxcu2/OB1n6p9dyhfoEHQg3yvw02mcvSyMKeVzl/VqvQd9YO0c
         cCm+5IKnMKA7WDpjX5fSS74zroI3eG9tIY2RpJ6hHwa/NLEYtDgNjKMQoDn47kgvz/B8
         NB+IAY8KSKYrmY5WRaEbLh7pC7ZkNorKc56mpFNd/Hu4Bl6bndiRArcBZ1uBvqNmBvEP
         ZNeA==
X-Gm-Message-State: AOJu0YxUBdzb80ei4hOE9Sc7kzPiooOORJU323mqhKrw0tef7Y7ddp1i
	sYT4s3DcEcvS6bl27LE8PrXVNf2ex+fKHw==
X-Google-Smtp-Source: AGHT+IH+lgrvcBA/DJNWULtONd0JDPj7CyaBvoI2NMR/kJdmUK1EqOivu4YNH7ysfv7oYtu5Sd+eqQ==
X-Received: by 2002:a92:d585:0:b0:35c:8c73:b42e with SMTP id a5-20020a92d585000000b0035c8c73b42emr13254721iln.3.1701238343600;
        Tue, 28 Nov 2023 22:12:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id j2-20020aa783c2000000b006c3069547bfsm345124pfn.79.2023.11.28.22.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 22:12:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] virglrenderer: Fix build with clang
Date: Tue, 28 Nov 2023 22:12:20 -0800
Message-ID: <20231129061220.445046-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 06:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191428

Fix warnigns seen with -Wembedded-directive -D_FORTIFY_SOURCE=2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>
---
 ...st-Fix-undefined-behavior-with-clang.patch | 56 +++++++++++++++++++
 .../virglrenderer/virglrenderer_1.0.0.bb      |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-Fix-undefined-behavior-with-clang.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-Fix-undefined-behavior-with-clang.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-Fix-undefined-behavior-with-clang.patch
new file mode 100644
index 00000000000..48488d7be12
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-Fix-undefined-behavior-with-clang.patch
@@ -0,0 +1,56 @@
+From ea328b246d093477cf26a68b42e975aaaef6abad Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Nov 2023 21:55:36 -0800
+Subject: [PATCH] vtest: Fix undefined behavior with clang
+
+This is seen when compiling with CC="clang -D_FORTIFY_SOURCE=2"
+Move #ifdef outside of printf() call.
+
+Fixes
+
+| ../git/vtest/vtest_server.c:244:2: error: embedding a directive within macro arguments has undefined behavior [-Werror,-Wembedded-directive]
+|   244 | #ifdef ENABLE_VENUS
+|       |  ^
+| ../git/vtest/vtest_server.c:246:2: error: embedding a directive within macro arguments has undefined behavior [-Werror,-Wembedded-directive]
+|   246 | #endif
+|       |  ^
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1309]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ vtest/vtest_server.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/vtest/vtest_server.c b/vtest/vtest_server.c
+index 1ca7f74f..93d949d7 100644
+--- a/vtest/vtest_server.c
++++ b/vtest/vtest_server.c
+@@ -197,6 +197,12 @@ static void vtest_server_parse_args(int argc, char **argv)
+    /* getopt_long stores the option index here. */
+    int option_index = 0;
+ 
++#ifdef ENABLE_VENUS
++   char* ven = " [--venus]";
++#else
++   char* ven = "";
++#endif
++
+    do {
+       ret = getopt_long(argc, argv, "", long_options, &option_index);
+ 
+@@ -244,10 +250,8 @@ static void vtest_server_parse_args(int argc, char **argv)
+          printf("Usage: %s [--no-fork] [--no-loop-or-fork] [--multi-clients] "
+                 "[--use-glx] [--use-egl-surfaceless] [--use-gles] [--no-virgl]"
+                 "[--rendernode <dev>] [--socket-path <path>] "
+-#ifdef ENABLE_VENUS
+-                " [--venus]"
+-#endif
+-                " [file]\n", argv[0]);
++                "%s"
++                " [file]\n", argv[0], ven);
+          exit(EXIT_FAILURE);
+          break;
+       }
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
index ffe30a9c525..eb7ba1089f6 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
@@ -12,6 +12,7 @@ DEPENDS = "libdrm libepoxy virtual/egl virtual/libgbm"
 SRCREV = "9c9d55ecbe502e0d71ee99529709efcca69aac42"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
+           file://0001-vtest-Fix-undefined-behavior-with-clang.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.43.0


