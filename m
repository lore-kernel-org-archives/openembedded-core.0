Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBFDBEB64D9
	for <webhook@archiver.kernel.org>; Sun,  2 Jul 2023 20:02:57 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.13127.1688328172986696851
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jul 2023 13:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=diAayPwk;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b88e99673eso3768165ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 13:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688328172; x=1690920172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=As9jJIIbrsn8qzqA8qIuB+CmnF9lgQllCbB/00VKn8g=;
        b=diAayPwkeyrEa8TsG5AhRtmiiM+XlO2nvq08KKVsIxLZjTw8ZAB+PstcZIBWrQsmwV
         Wq93TA1Kh4SQS1gsEDVHrfMdJf7heXHxmpcfhcd3ygWjH96i3qv24txVsL9Z8/PT2v1P
         GaXCu6dcrk4PC14CQGP0zNE/Z8YvdHD3c/kKj2C1x6OyTxjAWtRxS+OY09DlQdfrNDtO
         IwZqxN/arAFqa6IfRqneSDGHDK587xae4OHFBoz5OIURx057axHTkSdEqfyPj2PnfnRD
         bah6ecrPB2fNIkDmh8+WndS+WjKW2/g3qmtk1jMU6f0xGdMDQr+fI9flMhSuZFz9ngOx
         otGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688328172; x=1690920172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=As9jJIIbrsn8qzqA8qIuB+CmnF9lgQllCbB/00VKn8g=;
        b=WPouG1XjDgTHk84Ky/3RyenvvSIfR1P7pqRN05o1loB2qzV4pWQlNILCodbV3dVSQ6
         5YvbCvtPgHmEK8hvWOalGmcktqtqd0mOX2MkFhi2Z2DJPJdKuBc2fv20nPrEtD7jZUVT
         EHWIGYDmqePfECrWSNjuMqDcMHIp7ggP2PhuCy3SVTqfaOQWt5XpX5bjPVVi4CYZW0KJ
         obJNZuCbKCwSEeRK1HYgug/uFcvzxc1OTUT/5PHOLkKQKuCDN6T12yBqJt56WLkIgAoY
         GlRV5pVgstXpYbOkvcgAEJmEHv8yZRkXPRjxkoNOotTfp4Pum4oY4XV1nr/zqChjTZ3+
         TRFQ==
X-Gm-Message-State: ABy/qLYgTfATZ1BhKV9kcUPNNyUj3Xvdeh02USgCjJKsVj1MV8Nj96rZ
	5vJZi7S7nYBPEYZ+S4Pc7E043OzDKB8=
X-Google-Smtp-Source: APBJJlEhMVHATYtqW6/+w1JOEgllkVWXnV9XBLokMOOeI0DqMPrlE9WV6KIVcWeZfl/d8TsGK9qmDw==
X-Received: by 2002:a17:902:f54e:b0:1b8:5406:a34 with SMTP id h14-20020a170902f54e00b001b854060a34mr9478560plf.24.1688328172081;
        Sun, 02 Jul 2023 13:02:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::1fb3])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902b08a00b001b882880550sm2620188plr.282.2023.07.02.13.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 13:02:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libpam: Fix examples build on musl
Date: Sun,  2 Jul 2023 13:02:49 -0700
Message-ID: <20230702200249.1323744-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 20:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183782

This came with latest libpam upgrade

../../Linux-PAM-1.5.3/examples/tty_conv.c:9:10: fatal error: 'termio.h' file not found
         ^~~~~~~~~~
1 error generated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...place-use-of-termio.h-with-termios.h.patch | 39 +++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.3.bb     |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/0001-examples-Replace-use-of-termio.h-with-termios.h.patch

diff --git a/meta/recipes-extended/pam/libpam/0001-examples-Replace-use-of-termio.h-with-termios.h.patch b/meta/recipes-extended/pam/libpam/0001-examples-Replace-use-of-termio.h-with-termios.h.patch
new file mode 100644
index 00000000000..95c437df4f1
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/0001-examples-Replace-use-of-termio.h-with-termios.h.patch
@@ -0,0 +1,39 @@
+From 9b96fcfa5748934b8b6a4db4ee25a5e3165905c0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 1 Jul 2023 07:48:17 -0700
+Subject: [PATCH] examples: Replace use of termio.h with termios.h
+
+Fixes build with musl and makes it portable
+
+Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit/5374f677e4cae669eb9accf2449178b602e8a40a]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ examples/tty_conv.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/examples/tty_conv.c b/examples/tty_conv.c
+index 23f0684..db22500 100644
+--- a/examples/tty_conv.c
++++ b/examples/tty_conv.c
+@@ -6,7 +6,8 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <unistd.h>
+-#include <termio.h>
++#include <termios.h>
++#include <sys/ioctl.h>
+ #include <security/pam_appl.h>
+ 
+ /***************************************
+@@ -16,7 +17,7 @@
+  ***************************************/
+ static void echoOff(int fd, int off)
+ {
+-    struct termio tty;
++    struct termios tty;
+     if (ioctl(fd, TCGETA, &tty) < 0)
+     {
+         fprintf(stderr, "TCGETA failed: %s\n", strerror(errno));
+-- 
+2.41.0
+
diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-extended/pam/libpam_1.5.3.bb
index c8f1e164593..eafb5aae43e 100644
--- a/meta/recipes-extended/pam/libpam_1.5.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://pam.d/common-session-noninteractive \
            file://pam.d/other \
            file://libpam-xtests.patch \
+           file://0001-examples-Replace-use-of-termio.h-with-termios.h.patch \
            file://run-ptest \
            file://pam-volatiles.conf \
            "
-- 
2.41.0


