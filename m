Return-Path: <mateuszmar2@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B12DC32774
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 19:29:07 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.2192.1661282939104919064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 12:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fl5rw+13;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: mateuszmar2@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id v10so14427392ljh.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 12:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=AZi0M7TRLsyQWEu9KmfGsIYhRk+BKnl9aFyY6EBEAWM=;
        b=fl5rw+13IhZ2fztd8YCZL+ndD9JNflYX9MCt8RBki9oTxIB4kcruvTKR4Ujx1Um8aZ
         wOHyGfxu3YdC2gq9+9qnAdN6bw6bGoiw+NIM96Hc+WJVCoCrx9eTnEroc6xRCAwKCLmI
         mdc7zMpSYERwdEyMFAu5xaumi+mq+yL8I77oLXhHbidLS4i11ccwHb796jRjZV9GYIfX
         yiOiMRB4duuRADp3QZSIHqA1P9qbv7IyEgszVeCM18PtByU/aiLz8xSkma1VqhfjiPdR
         ma+2/G4G7H1S7idmUisaizQtyoaHG9sQUdz5MbJvCTr+hCdEWS2M69DswZ7/bIVyIhdT
         QUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=AZi0M7TRLsyQWEu9KmfGsIYhRk+BKnl9aFyY6EBEAWM=;
        b=I3Lp2kVUZFhsOpOKSpNNWjCVPVVV37x2xQJlF+ppsOwqBfXnxuxVEAGRYW9c3r9j7X
         yRFThZzFLaJl4MqMDwYUapWwvVphSt618QeMUEffZHV2eFlcc2afssgs4QE+4EPt2r7w
         xcP6pqcWpcr+W5+KaoX01CVtSRblMjDRrQJEWLFFQUpjJx3aoav6tgq4V7hwZd6LXtZD
         wVRgYqCg14B3MEdTJ4W/ZyOQov9uHInfeGfN+K4XKkkWV/c36aN2e4zABoOzMh5FP3Tf
         fKawdGNKYskrB92fWjqu9R6ve82ULpBaVgjgbrnfxFnXhmQSmNtNXBdM6CFdaWQY6Ify
         oNhA==
X-Gm-Message-State: ACgBeo2wmJ2ev9w1DtR9BwT+/s+r2qGBfP/b2NT3k4ie3X07uVFgam09
	Dt5Gxl4jPTAb8BMnvLsEN9Ao2LBd7AI=
X-Google-Smtp-Source: 
 AA6agR4K591lltBQLQHolwyQ6Fbn2+WVHWG5X1UaX8deiwxZYS3n/t9iQK8p0rRF5BTSZY0LnyY5jQ==
X-Received: by 2002:a2e:7c19:0:b0:261:b31b:6f6 with SMTP id
 x25-20020a2e7c19000000b00261b31b06f6mr7482903ljc.318.1661282936811;
        Tue, 23 Aug 2022 12:28:56 -0700 (PDT)
Received: from mateusz-gf75thin8rd.NAT.wroclaw_krzyki.vectranet.pl
 (178235146065.dynamic-3-poz-k-0-0-0.vectranet.pl. [178.235.146.65])
        by smtp.gmail.com with ESMTPSA id
 w12-20020a05651204cc00b0048b0696d0b1sm2626355lfq.90.2022.08.23.12.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 12:28:56 -0700 (PDT)
From: Mateusz Marciniec <mateuszmar2@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mateusz Marciniec <mateuszmar2@gmail.com>,
	Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH v2] util-linux: Improve check for magic in configure.ac
Date: Tue, 23 Aug 2022 21:28:52 +0200
Message-Id: <20220823192852.8812-1-mateuszmar2@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 19:29:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169726

Check whether magic.h header exists before defining HAVE_MAGIC.

Despite library availability there still can be missing header.
Current test doesn't cover that possibility which will lead compilation
to fail in case of separate sysroot.

Upstream-Status: Backport
[https://github.com/util-linux/util-linux/commit/263381ddd46eea2293c70bc811273b66bc52087b]

Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
v2: Corrected commit title and changed Upstream-Status.

 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...configure.ac-Improve-check-for-magic.patch | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 416550a6b2..3868b1c41d 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -36,6 +36,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            file://0001-check-for-sys-pidfd.h.patch \
+           file://0001-configure.ac-Improve-check-for-magic.patch \
            "
 
 SRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch b/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
new file mode 100644
index 0000000000..00611fe578
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
@@ -0,0 +1,40 @@
+From 263381ddd46eea2293c70bc811273b66bc52087b Mon Sep 17 00:00:00 2001
+From: Mateusz Marciniec <mateuszmar2@gmail.com>
+Date: Fri, 19 Aug 2022 14:47:49 +0200
+Subject: [PATCH] configure.ac: Improve check for magic
+
+Check whether magic.h header exists before defining HAVE_MAGIC.
+
+Despite library availability there still can be missing header.
+Current test doesn't cover that possibility which will lead compilation
+to fail in case of separate sysroot.
+
+Upstream-Status: Backport
+[https://github.com/util-linux/util-linux/commit/263381ddd46eea2293c70bc811273b66bc52087b]
+
+Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
+Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
+---
+ configure.ac | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index daa8f0dca..968a0daf0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1570,8 +1570,10 @@ AC_ARG_WITH([libmagic],
+ )
+ AS_IF([test "x$with_libmagic" = xno], [have_magic=no], [
+   AC_CHECK_LIB([magic], [magic_open], [
+-    AC_DEFINE([HAVE_MAGIC], [1], [Define to 1 if you have the libmagic present.])
+-    MAGIC_LIBS="-lmagic"
++    AC_CHECK_HEADER(magic.h, [
++      AC_DEFINE([HAVE_MAGIC], [1], [Define to 1 if you have the libmagic present.])
++      MAGIC_LIBS="-lmagic"
++    ])
+   ])
+ ])
+ AC_SUBST([MAGIC_LIBS])
+-- 
+2.37.1
+
-- 
2.37.2


