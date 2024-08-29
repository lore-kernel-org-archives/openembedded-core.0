Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B884CC7115E
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 03:40:11 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.4688.1724902800540075675
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 20:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=W0IoJbOu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a66b813745so9194585a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 20:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1724902799; x=1725507599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KG0BwvDdtsv3hrLe7J9WfIcBbx/u2ubpJfRzj9S48KM=;
        b=W0IoJbOu8g+Jw/uC7dnk1ig7fwWXiHBKa4VkAexxWFjd8o7bG0kz8QRar+OOWBYAD3
         eeGJTOoEwRsOdS4mmuXNM3qkDGJLgKYUg+FFPrODR2GPtfAwo/PM+aifxBiklklQRvOz
         VusJ9FznqywelcPjup07nLJvzotI+cJvMJ+D90to4exhgBLgYXtP1KwampACLcYcVRbE
         Cx8EwnZcriKiUs+iMWZy5s7jTTFtcW0l2h7gh2KsFAjuF3yLWqLo5EHuw8u0scOERyKt
         UUc8erKD9E+5a2rH0D6MdR2jvuRqoePaYIPzKeNBAgyCjAKJfghwiB12JkKNMIpvF3AH
         SzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724902799; x=1725507599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KG0BwvDdtsv3hrLe7J9WfIcBbx/u2ubpJfRzj9S48KM=;
        b=Vtf3IhiDbNEbRIorX1gQkN1vzjy3Qr2Zv7R/Fdg4FS7/M6ji0GzqzQ/XGxn2ViBy9U
         1VyvLMkhBQR5jsrJCNsDgorU+DRQ42qR7YfGkplvNA36+MC9g5LaxhuglAACltcNxXSe
         gEFh1mPWQHJhkmuM4c/2Sxz3EHiRdyDgq6vnwIFhH9Pwpq4qBWzcSnRIIrE8+UCehfG9
         vO5J98UJ8mj3il+bm3++Es4xiT9bKFpWFiZHg2jOCjmcw9D0Ab9C5trAx/kyOkM1qaKY
         Y7K6UhWFYrZaK+ZsCArZDXyHENxrruhdWXQhH6kHKixbPNTlR/JVQnkWzxQ4PWJb2wPw
         O1tQ==
X-Gm-Message-State: AOJu0YzvL5suzlzQf3sS5oO57XWD3VJ6JQ6DFoB6JwiRQ43l74ceVJWE
	xc+AqMmuih3l0dhpr3okNPP9qmSKZOV9QpK74DoymfctUpf4CvHgyo4NiTjxkFmZprMbFP46ff8
	=
X-Google-Smtp-Source: AGHT+IGJCZboDzhRdSc63b8rH9UovwS/U4bIQO1fICcvO9Bph4lpsQzgcnWYqpTPu2bY/Am7nDc30w==
X-Received: by 2002:a05:620a:40cf:b0:7a5:7c8:205b with SMTP id af79cd13be357-7a8042632e4mr157168885a.49.1724902799116;
        Wed, 28 Aug 2024 20:39:59 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806c2aeb0sm18317485a.44.2024.08.28.20.39.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 20:39:58 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] openssh: add backported header file include
Date: Wed, 28 Aug 2024 23:39:58 -0400
Message-Id: <20240829033958.3722508-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 03:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203901

Backport upstream patch to add a missing header.  The patch says it is
for systemd, but I am seeing build issues when building openssh with
clang and musl.  The issue being seen is:
 #warning usage of non-standard #include <sys/cdefs.h> is deprecated
And similar deprecated warnings.  This patch resolves the issue.

Original patch can be found at
https://github.com/openssh/openssh-portable/commit/88351eca17dcc55189991ba60e50819b6d4193c1

This issue was introduced with OE-Core 1c9d3c22718bf49ae85c2d06e0ee60ebdc2fd0c1
https://github.com/openembedded/openembedded-core/commit/1c9d3c22718bf49ae85c2d06e0ee60ebdc2fd0c1

Patch suggested by Khem Raj.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 ...sing-header-for-systemd-notification.patch | 27 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-Fix-missing-header-for-systemd-notification.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-Fix-missing-header-for-systemd-notification.patch b/meta/recipes-connectivity/openssh/openssh/0001-Fix-missing-header-for-systemd-notification.patch
new file mode 100644
index 000000000000..2baa4a6fe50f
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-Fix-missing-header-for-systemd-notification.patch
@@ -0,0 +1,27 @@
+From 88351eca17dcc55189991ba60e50819b6d4193c1 Mon Sep 17 00:00:00 2001
+From: 90 <hi@90.gripe>
+Date: Fri, 5 Apr 2024 19:36:06 +0100
+Subject: [PATCH] Fix missing header for systemd notification
+
+Upstream-Status: Backport [88351eca17dcc55189991ba60e50819b6d4193c1]
+Signed-off-by: Jon Mason <jdmason@kudzu.us>
+
+---
+ openbsd-compat/port-linux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/openbsd-compat/port-linux.c b/openbsd-compat/port-linux.c
+index df7290246df6..4c024c6d2d61 100644
+--- a/openbsd-compat/port-linux.c
++++ b/openbsd-compat/port-linux.c
+@@ -33,6 +33,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <time.h>
++#include <unistd.h>
+ 
+ #include "log.h"
+ #include "xmalloc.h"
+-- 
+2.39.2
+
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 042acffe6afb..3c507cf911a9 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://0001-notify-systemd-on-listen-and-reload.patch \
            file://CVE-2024-6387.patch \
            file://CVE-2024-39894.patch \
+           file://0001-Fix-missing-header-for-systemd-notification.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.39.2


