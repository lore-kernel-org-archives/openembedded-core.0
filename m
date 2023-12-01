Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDE7C07E97
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 18:34:09 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.429.1701455645763765986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 10:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VbBXAzEx;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6cdd4aab5f5so2434623b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 10:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701455645; x=1702060445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KiZkophRm4c/OG30hj7RAPgzyLj64c6ujNDa7Av8jak=;
        b=VbBXAzExeK/WPHO5FxoFzUeesO0Lyntbw6BZ3kET9m7lhRv8kYAVt4q5912AXr62JR
         17qBc45RyL6i65KM5XkY9wgUWnHwmS2aiuLX0gceL9LzAyuu2LfJdcHziONQOOFamT93
         +ss94X1NerfS1ZrgjCpA4vMGLnoXplFDkN71C3mdVPav61/LWkfJYtuk74m21WH/bIIC
         7cz5YuacWI4rCKf4bIJmf0BCcmcUunznzKLdh1QkjhlwbKq4B0HlkQHRG6CKsamH55Vf
         hDe0jdzvxcR6zlHDtjSD5jxKFXQX47O6JUWY88P60n3T+iCHyaGQP+2dknUBUCX2ezF8
         yivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701455645; x=1702060445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KiZkophRm4c/OG30hj7RAPgzyLj64c6ujNDa7Av8jak=;
        b=Skp4dbQD5RRN/79CG27wnEiAa9KcnCCudnDXoNWoeW6hiwYSz5pWiN/cJqFUM4wa5F
         +zDO0NF1nA1woKQhD5QIMtAOyoGsLeg5vZKinITOWc4Pz1NP7gr2fNrCeyhimU+sX/+l
         TAJPmHyzPSqcBtHxdF5enKCxB/E/I2vbuyNgiEvtj5FsPbzFB4gGSe5ZCFapxA3qjMT0
         xXfE/tGCIS5s7j3rCRlo/J+SeZIlXahm4mmEi99D2vWjPbAKUTuyoLEkNGPuGsf0hDz3
         uznpg+tFid3+cn1U4bSPxX248SkSyPqjSZ2GP7F2ACXnAdzdzvFUpuHu0FoufYLGD+PJ
         UN4g==
X-Gm-Message-State: AOJu0Yywf2EHC24suW+pNoWGMXwjpHboChZORBjO98joEEYvG/9tYnVT
	PVin0sdKA13BUjspdQMbWDVA3ZrQAc4=
X-Google-Smtp-Source: AGHT+IEA3WTQbapIUZJYgH7pgeqiYfuJ7PrAVfrZuMZPHwRusf3WQtxi41C27jO8fE9npESCuhtQWg==
X-Received: by 2002:a05:6a00:2e95:b0:6cb:a1fe:5217 with SMTP id fd21-20020a056a002e9500b006cba1fe5217mr34606237pfb.16.1701455644794;
        Fri, 01 Dec 2023 10:34:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id g24-20020a056a00079800b006cde7dd80cbsm3297126pfu.191.2023.12.01.10.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 10:34:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/6] virglrenderer: Fix build with clang
Date: Fri,  1 Dec 2023 10:33:53 -0800
Message-ID: <20231201183356.311137-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231201183356.311137-1-raj.khem@gmail.com>
References: <20231201183356.311137-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 18:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191681

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


