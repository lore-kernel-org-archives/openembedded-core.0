Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9252BC433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 19:24:58 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.1722.1638905097888982882
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 11:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pQG9uXQj;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id g16so6346998pgi.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 11:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uTE8Yvdd3OvpCRDOQU662lSCd/VLfOb6LQTJIxLSnso=;
        b=pQG9uXQjAhRHc2yrstuoiy41fBrxbVlBhrl8y7UHJ48LmhMX4SC1XBbD+A7m6Yc/DS
         1bqtSOIqWkFX9BRCfZ5EaCzmG2AGGYB6IFx0hAn7yYMtIivXvd0yH79IbiAm5zGcs6Wf
         OM8daha35ofIuU7x2UbcwuRjNcBeULjzt4QCD9TGK8fCSIMoREaKCWJ6zJ9RSUun3MqD
         D0wWpP/7S9stXeaBYeGgbmhesSCoU3PonTRltP3VaG6GpqyvssY9qc2vgi5Loni2ZVGl
         i7Rg914bAHAGmLRlzeFDJsIQBozO+eInmK97401vtkSZnBqPn/QDsrrjObMZGURGf+uF
         xVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uTE8Yvdd3OvpCRDOQU662lSCd/VLfOb6LQTJIxLSnso=;
        b=Iyn+7T3x2qZivQQZ4Xwv4T7xozSlXmu4Rn62PNMsPkNkwRzJ9SxiL5MbETpQLH58A6
         /ktIzwaiLF7wY9wVujv8vyuq0B2v5foGw/hQH2f/3a5xR2NFKL7GXPQbnZvAqwrsHBeB
         o1GadsIJ/bewvNawX2YQU2TzIp7cowDmHSgsVitf56CJBliNCS+mOfuJQzjNffDe+wCc
         2ZgIy2IP4Do6f0YJ7Uh3jXctqVkrPu8vDcWH2sLOAeH0zGZsZ0kLaTkMn7zyXTsui7m4
         dv/M6KBa8GEn8oQNv+/lnueBOZU0kQBjyBa2zOOVpwogwtIsRBRKDg09Ej80r7+eMeWd
         a9yw==
X-Gm-Message-State: AOAM530EJW1zSdTU8ovEqBPAskkrXjaLeZ/ddw6N3CJ7f/5t589ClPfP
	+wcPK6itOMc+GYn0Wl6d7HS6S4MGZZPxjg==
X-Google-Smtp-Source: 
 ABdhPJw/4bFjqfCt8Sf1G3m1+7XmwLqFsn1vjBHwP2ToycMZKF5ku65lQZvu82x776diJRUdjgctdA==
X-Received: by 2002:a63:4551:: with SMTP id
 u17mr25907265pgk.568.1638905097045;
        Tue, 07 Dec 2021 11:24:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id y8sm530437pfi.56.2021.12.07.11.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 11:24:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] mesa: Fix broadcom vulkan driver build on 32bit arches
 with 64bit time_t
Date: Tue,  7 Dec 2021 11:24:52 -0800
Message-Id: <20211207192454.477297-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 19:24:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159328

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...unt-for-64bit-time_t-on-32bit-arches.patch | 41 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch b/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch
new file mode 100644
index 00000000000..9032eaba0f1
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch
@@ -0,0 +1,41 @@
+From e2e2fe86dd61b6fae682a1fec31bd0755ced5cd5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 7 Dec 2021 11:13:27 -0800
+Subject: [PATCH] v3dv: account for 64bit time_t on 32bit arches
+
+This makes is a bit more portable, especially on 32bit architectures
+with 64bit time_t defaults. Especially on musl its a must.
+
+Fixes
+../mesa-21.3.0/src/broadcom/vulkan/v3dv_bo.c:71:15: error: format specifies type 'long' but the argument has type 'time_t' (aka 'long long') [-Werror,-Wformat]
+              time.tv_sec);
+              ^~~~~~~~~~~
+
+Also reported here [1]
+
+[1] https://github.com/agherzan/meta-raspberrypi/issues/969
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/broadcom/vulkan/v3dv_bo.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/broadcom/vulkan/v3dv_bo.c b/src/broadcom/vulkan/v3dv_bo.c
+index 71679ce..dc5e7f5 100644
+--- a/src/broadcom/vulkan/v3dv_bo.c
++++ b/src/broadcom/vulkan/v3dv_bo.c
+@@ -67,8 +67,8 @@ bo_dump_stats(struct v3dv_device *device)
+ 
+       struct timespec time;
+       clock_gettime(CLOCK_MONOTONIC, &time);
+-      fprintf(stderr, "  now:               %ld\n",
+-              time.tv_sec);
++      fprintf(stderr, "  now:               %lld\n",
++              (long long)time.tv_sec);
+    }
+ 
+    if (cache->size_list_size) {
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 30b9e93f630..31ff38dfdca 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,6 +20,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
+           file://0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch \
            "
 
 SRC_URI[sha256sum] = "a2753c09deef0ba14d35ae8a2ceff3fe5cd13698928c7bb62c2ec8736eb09ce1"
-- 
2.34.1


