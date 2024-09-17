Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E70BCAC599
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 19:35:21 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.29728.1726601719043792710
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Sep 2024 12:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BliOQmAu;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so58410475e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 12:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726601717; x=1727206517; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R64z04KME7GNmo+5zgEL42igtFoJp6APnNMK5SsVog8=;
        b=BliOQmAu490tMLbIlzM72uiz5Kg4dodOgLMI47r1iZeSeOxFkHslQaZdMy0fmCScP2
         ZBOjWGOP8R8ubwvEoGPmlD8CszffYawWBZg7l0uFSbcimbfeZ4H7r9p1NVGvt2GNNqmU
         ZFrbhGgvI8VygbjJ7fqMCN5YqcR11biG8vrCyKWwnSPGdbwf34hG32OrJA2/8RxOEPbe
         TsgGjGXTXmLMRXK24X4V5XlzC7o/1k0D3gbvJXMeVOzoJ62kgezPPUfn8XSsQJbycpVo
         ZrN2mR3wlEEJcdSuUppO8I0Drmo5FKJn80k7JXMw+Wo2wTzW3i/CBY6reyZn2M8e46mP
         +8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726601717; x=1727206517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R64z04KME7GNmo+5zgEL42igtFoJp6APnNMK5SsVog8=;
        b=LeQzCO/9p32BgsDN2ROTF4GUO7mGYc62vQpbuaKBO8PlbOHjeiosgr6V09mVBxl571
         6nMr/B1EOy7iDqmk1y6R9q1rzs4jv204FsGHLxtBH+WKlJ/jPXLpjvvUegyhoOz9ddLD
         YwY5egJKONbqesdk99yFNs6+DN12A4beQeS0jncLq1kt4r0e64gJnJM29Ng+WbNB+YRZ
         9uzKjMeso5QMvfcsi79KxsXkBCj0BGk68B3vcZV3KyG0/od2/x1yoXXyMvEiusp/ykeh
         MM4HuYRHO6mgjkgdWfGvV+UO1qLhSx0RYdF1EqNQufuLw+6vkITxOryRhZlQCldfaEC1
         l0Tg==
X-Gm-Message-State: AOJu0Yw+Zmmg/8JRPhPMyE9pTCPe/i3KZEZC7tg3VEVCzR0a9AQ/WS9U
	p0NMwL5lgPI+IfLsbFK1KX4vxDHgCpaeLnJaID0pMX5oEN/EshTQIhLxU7yo
X-Google-Smtp-Source: AGHT+IHZEWiN5juM8JI8QeTLyxbS+D4xRRlCyDcLlZklpZbhiC+wGQQz0MRINVLjmHQWXDCVdsN/fg==
X-Received: by 2002:adf:eb81:0:b0:371:8cc1:2024 with SMTP id ffacd0b85a97d-378c285dbbcmr10226196f8f.0.1726601716440;
        Tue, 17 Sep 2024 12:35:16 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb49770sm4009178a12.12.2024.09.17.12.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 12:35:15 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] bluez5: remove redundant patch for MAX_INPUT
Date: Tue, 17 Sep 2024 19:34:46 +0000
Message-ID: <20240917193447.5607-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 19:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204627

The solution to the problem upstream was fixed by the following commit:
https://github.com/bluez/bluez/commit/ca6546fe521360fcf905bc115b893f322e706cb2

Now MAX_INPUT is defined for non-glibc systems such as musl.
This fix was added in BlueZ 5.67.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 -
 ...shared-util.c-include-linux-limits.h.patch | 27 -------------------
 2 files changed, 28 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index a31d7076ba..3f2f096aac 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -54,7 +54,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
-           file://0004-src-shared-util.c-include-linux-limits.h.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
deleted file mode 100644
index 516d859069..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From b53df61b41088b68c127ac76cc71683ac3453b9d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 12 Dec 2022 13:10:19 +0100
-Subject: [PATCH] src/shared/util.c: include linux/limits.h
-
-MAX_INPUT is defined in that file. This matters on non-glibc
-systems such as those using musl.
-
-Upstream-Status: Submitted [to linux-bluetooth@vger.kernel.org,luiz.von.dentz@intel.com,frederic.danis@collabora.com]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- src/shared/util.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/shared/util.c b/src/shared/util.c
-index c0c2c4a..036dc0d 100644
---- a/src/shared/util.c
-+++ b/src/shared/util.c
-@@ -23,6 +23,7 @@
- #include <unistd.h>
- #include <dirent.h>
- #include <limits.h>
-+#include <linux/limits.h>
- #include <string.h>
- 
- #ifdef HAVE_SYS_RANDOM_H
-- 
2.43.0


