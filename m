Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7052CCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 10:22:41 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.17011.1761214959762815259
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 03:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cnRKadAT;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so3409205e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 03:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761214958; x=1761819758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AOFeYRBm05eLktJn6ca7LuW5JKbLfeRlB8TbDk0ji1k=;
        b=cnRKadATgU5YnWX1PPwQhjqur0eQloXYjGvDHIMqjVYG7OOYK9u8WjA9yqLlvmQzD4
         ZJaKLSIjSFiEiI7/MtvZo3bp+owovaqlBb3bGNAOEdetniSWVJWT5u1t11AmHitPIeCB
         LD/y8UXlL2KOQzCIYQLbt2AJ7AmflSJJFEJXxe0TVzpzkabTFpsWAqRSz+jcQC4Bq8/a
         RG+Wh47NDljFqaBr9+MVi93llv3qL9xIdXDqAKualWes4pIx2bkHQIv1cTeXlMT/jEiG
         SMRLgNlyz/aeGT5U4Sc6ApUT0zWph01WfiQBXtvYE128P//VYFYFTRVwMYKlKl/5SLjE
         3xjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761214958; x=1761819758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AOFeYRBm05eLktJn6ca7LuW5JKbLfeRlB8TbDk0ji1k=;
        b=iMIYJUIl2xxJ5x/GmOHmwCq6xMKHptIq685AdAQ5Bi8x6uGgJktmcNJc2GN1aTP6mC
         46CbSSI6DDi9a/7jvTRfFgW6RW9Rq/iq48T6LM0jcq6axsHgd1rwVfXP2dHZEvkBM5tB
         828seREH/yxZTJJRgJA+q5WJxbDOHVzvVyut2vmMByXLdx/qtVyGH/iMViMjiFnndeWL
         z+rS4o1uBPByuLJNQJ5ud7tg8BK+V1iNuFw1HW4S4BR0Kyt34ACZx9s1WCp30xkLRrRH
         u9Kf5ouDNnVUY6JCHlw/fRB0Hn4IqG6rlM16JEJmn9N2OUtV3xtz7gZXlKERNzBp/wsc
         MYZA==
X-Gm-Message-State: AOJu0YzLitNJFt7F7bpErt86BNWYHlcJqHjkrUAI0RqXiT/VAn4j6X8o
	YD0vPJ6o5leb5G6noHf6WvSaVJ3tOkZjedu2ZEe5UZULPE4suAq82Qk4bfs9Qg==
X-Gm-Gg: ASbGncs9OHF8+KTiqpF8aH6dyqIWT464xaRIUHlZd+tSj/VMaujCAm6wICepo5NErBW
	ke2e/g/sf0pp/F78U6kf5OqxklZ+pIlHbW1jBSSNAQltkZ4sM9k/1Wb30VQ1RvjcWy4WuMOTqTe
	HBzOYypLAyZ8Dhx+vQ49DEIH2bjwjMy/lGZ6SmBHLvFkihAvSM3yYOhwRKKAD8Hoj9UzHveIwPw
	32iq+WDoVzERgJyqT2FtJF1XsasqrCvW9ZHmcWUwWwztXi0KTdiIsEfW7HwAroJofylg0XU9nQx
	3YlfX8yfNVCx9XPAkQiSRiAnNJY6mo+KqcLUt/RI63bgtp/c8S1ENujPWjXvBuiuymIiLqGeMO8
	pBJt6kMs5WXr2+HdmPZGN7I0ad5yCRIoEpUyfZEciunGklx7QVF19NAJ2lOEAAGNVZTjHgKN3lw
	==
X-Google-Smtp-Source: AGHT+IEj4UdjlApaEgBeBqbuyObxUWRHtY+/VLyNmNQXOv4zmaLTGe6gweo6c8v8XZ0YLn/W42pkxA==
X-Received: by 2002:a05:600c:8b78:b0:471:d2f:7987 with SMTP id 5b1f17b1804b1-47117902dbcmr156244155e9.26.1761214957725;
        Thu, 23 Oct 2025 03:22:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c43900e1sm103597735e9.17.2025.10.23.03.22.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:22:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: extend check_cwm test timeout
Date: Thu, 23 Oct 2025 12:22:36 +0200
Message-ID: <20251023102236.4184982-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 10:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225228

Fixes [YOCTO 14649]

The default 3s test execution timeout isn't always enough for the check_cwm test
on the autobuilder in case there is a high load on the host machine,
and due to this this case fails sometimes.

This patch doubles the timeout for this testcase to 6 seconds to allow enough
time for execution even if there is high CPU usage by other processes.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-extend-check_cwm-test-timeout.patch  | 32 +++++++++++++++++++
 .../openssl/openssl_3.5.4.bb                  |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
new file mode 100644
index 0000000000..8b6d69f6ca
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
@@ -0,0 +1,32 @@
+From c7000672296f4c367341aa3415f26c4d9f5e4749 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 23 Oct 2025 11:24:36 +0200
+Subject: [PATCH] extend check_cwm test timeout
+
+The default, 3s long test timeout isn't always enough for this
+particular test in case there is a high load on the host machine
+(assuming it is running in qemu). Extend the default timeout to 6s
+for the check_cwm test to avoid timeouts.
+
+Upstream-Status: Inappropriate [oe-specific: qemu on AB doesn't always get enough CPU]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ test/radix/main.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/test/radix/main.c b/test/radix/main.c
+index 4a1e886a71..39f8c61ef9 100644
+--- a/test/radix/main.c
++++ b/test/radix/main.c
+@@ -25,6 +25,11 @@ static int test_script(int idx)
+     int testresult;
+     TERP_CONFIG cfg = {0};
+ 
++    // check_cwm test sometimes times out, the default 3000ms is
++    // not enough if the test execution starves for CPU
++    if (!strncmp("check_cwm", script_info->name, strlen("check_cwm")))
++        cfg.max_execution_time = ossl_ms2time(6000);
++
+     if (!TEST_true(bindings_process_init(0, 0)))
+         return 0;
+ 
diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.4.bb b/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
index c222b1533b..e760baf3a0 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
+           file://0001-extend-check_cwm-test-timeout.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \

