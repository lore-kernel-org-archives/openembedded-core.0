Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2F0C43217
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:41:10 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.9537.1633945269811804876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oSeKNhbv;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id e3so20541030wrc.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GoQSRJ2fukBXACdk0X2e8eI3jgNdtbodx90gYsgQIYM=;
        b=oSeKNhbvT9xHrYjNgGFBWCrRnyFgISlJ4hDexAWBtHp5Y8DYgOCeqUQeGjOfJk00XM
         KDrQFEbdqaPVER2iNqeiVrBagXNngmGxyEyztHdDJUW/LVKXi+pcOYCCuUGJQ5jFaP6K
         pUsNQv3VupUpqnoYPdf6zPFXzB/l5ezHfpxjGgruP0npUaS+cFtdecVtjvHAkH8q0YUv
         KJQjx4UIahpbXR1eP2BTAoy8XxTiNVGSa5l4YXmjLGqarF/vfz97Ry8hNbV9Uy2gz+Se
         jgk22/LbwGsB4ATkn4rXU6xbKZElIjCALD2/tq2sICREHqJhlyRmv0Avb3MNnRHg+6iu
         KIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GoQSRJ2fukBXACdk0X2e8eI3jgNdtbodx90gYsgQIYM=;
        b=OXffn11DNjYBj3/Q0JG4NSrmgEQny8Tukt9odjQmmqOMz4hjgW8q/Qea34T5I9ANIr
         XjBjWq8VQV61oR11+FCgoDo+Y9kx2o5L7e4GCFoSkXqrjkpevxtWKoQ4b5KgHmXSww7i
         iKOvqUi6XRxt0Q0ts4X6lM7N2x/kJXPrumIKKR48WsmzFuaNIyXay8UASfI1Ok1rNv+L
         Qx59t2aL2MLFZrHFZevNaLzw354LpyRPABVTiMQKOHzMFQtERLEkqgRfMi6EIon+nN6q
         pHHUs5Ufszqhqd744Kqoz75Y6rXPrIw/f/Cc5n7y2dIkO8boMXAyDJmzsbT0oj+7Qzep
         9BCA==
X-Gm-Message-State: AOAM5300lGPFy789nj0MibZ6J1ND/1FN4pnJIWPwShmYYAjNh+Ynj4Kq
	jLc92ZpIwiiJ6g1xlgUm5IoRYdCzP5U=
X-Google-Smtp-Source: 
 ABdhPJw0Bby9YL2kVx+W6sxFMT+aB9YGBKrCVIm47aJjezc9PvmAx1u1ah0aPnd8nusB8MpyH7wNdQ==
X-Received: by 2002:a1c:3584:: with SMTP id c126mr20181076wma.0.1633945268313;
        Mon, 11 Oct 2021 02:41:08 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k17sm7180758wrc.93.2021.10.11.02.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:41:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/25] cryptodev-tests: do not use -Werror with openssl 3
Date: Mon, 11 Oct 2021 11:40:42 +0200
Message-Id: <20211011094059.4184654-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:41:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156821

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cryptodev/cryptodev-tests_1.12.bb         |  1 +
 ...001-tests-Makefile-do-not-use-Werror.patch | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.12.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.12.bb
index c1adbb6245b..c5414787966 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.12.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.12.bb
@@ -6,6 +6,7 @@ DEPENDS += "openssl"
 
 SRC_URI += " \
 file://0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch \
+file://0001-tests-Makefile-do-not-use-Werror.patch \
 "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_EXECPREFIXDIR}" PREFIX="${D}"'
diff --git a/meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch b/meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch
new file mode 100644
index 00000000000..347a4aef0fd
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch
@@ -0,0 +1,24 @@
+From e2c2895d52761ddc6384a31364236dd13f677c34 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 10 Sep 2021 10:44:42 +0200
+Subject: [PATCH] tests/Makefile: do not use -Werror
+
+Otherwise, openssl 3 deprecation warnings become errors.
+Reported at https://github.com/cryptodev-linux/cryptodev-linux/issues/67
+
+Upstream-Status: Inappropriate [upstream needs to update the code]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ tests/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/Makefile b/tests/Makefile
+index 2fb7a9a..e94f80e 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -1,4 +1,4 @@
+-CFLAGS += -I.. $(CRYPTODEV_CFLAGS) -Wall -Werror
++CFLAGS += -I.. $(CRYPTODEV_CFLAGS) -Wall
+ 
+ comp_progs := cipher_comp hash_comp hmac_comp
+ 
-- 
2.20.1


