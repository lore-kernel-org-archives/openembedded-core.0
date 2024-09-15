Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2032CC3ABAD
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 21:14:15 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.122850.1726434853660435602
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 14:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WD1lnpnX;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: gudni.m.g@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c42bcf35fbso2047095a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726434851; x=1727039651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p7IH3y661TQlcBShJYNpg1Lv2DmEYIRXVKCByIwqVhU=;
        b=WD1lnpnX8aqTnVGFbkl6h+5bfrm+fTV8mdNMMaGyjwb0d5Ib/kW0rFR7XNQ/NkFwZB
         wmGFMCaM73/P7uCe2mjCQ6aJSYA7DntPpFg8xvCXi64Fsi1CqH+eGOqgDMSBjbwoVal5
         GZZIUQfDuS0dc/zr0XfaRTv9jsS6gAFZvit9qdngMuEL9IOYoWXQsVf4VnoaG7qVR1eL
         8f6tJ/k36N1cTjcjkTGyIfujsnjsPV/KAG8BW9wCdsEB3+dVUXp+2VhJPF6fuh6dS72A
         hBVOAR8uD3RlSAxIQXGUukr8LqHrZ8Dw0WbjkrApdj0IvsySChk7z9tstw4v0VlKltP8
         35HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726434851; x=1727039651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p7IH3y661TQlcBShJYNpg1Lv2DmEYIRXVKCByIwqVhU=;
        b=GuSk3m+eJoNVFfQmpWJsEKbwWGotbtMkTS04iAPdXs6w180x0shuR/hvde6n750uup
         QVX/WF1p92Q39a6ADrKfIQBl8m/igsDkZZLhdvfReU2x97aO3J5tFTQyzUpPMQcEIOTV
         TsqD/7uwZMG9V9j9Vd3zh6r7BUKuCv6l6r3D6BYiepWKLl5/8i3bQoIJpo7JdAYYv93r
         45vx5qGSmBxiwtpRX/c3j6u9o6vE84J95/rMUWzShnbJwPtgaQB4ppR7tsCwpgP2Sw8j
         RDQ3EMaL7Zz3NMkAIOdSv7WvBY6d8VMZpQ755WktUqGwrIq9fT46+abZQzQJqlWtMPji
         0Vhg==
X-Gm-Message-State: AOJu0YzCmlqWY0/tlafWbCtjDspvmog1k085ppD5NzPtEpsSrs9uF6js
	xhMcWs9BNjm6QZSPAh90x7T3zURHEJDEBmaPiupDWcwac8tATnNtwuWhyQ==
X-Google-Smtp-Source: AGHT+IEay+TJBzM0d46xIKtxOejBj7MFaV2rvqA+kOWH/XNyYkh3Kw8P3F+TYtu7YdIDQ3SbLx1mUg==
X-Received: by 2002:a17:907:ea5:b0:a8d:1970:db07 with SMTP id a640c23a62f3a-a9048045fc5mr948370566b.52.1726434850607;
        Sun, 15 Sep 2024 14:14:10 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612e0159sm234319966b.163.2024.09.15.14.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 14:14:10 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH v2] bluez5: remove redundant patch for MAX_INPUT
Date: Sun, 15 Sep 2024 21:14:01 +0000
Message-ID: <20240915211401.5556-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 21:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204588

The solution to the problem upstream was fixed by the following commit:
https://github.com/bluez/bluez/commit/ca6546fe521360fcf905bc115b893f322e706cb2

Now MAX_INPUT is defined for non-glibc systems such as musl.
This fix was added in BlueZ 5.67.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 -
 ...shared-util.c-include-linux-limits.h.patch | 26 -------------------
 2 files changed, 27 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index e0d3e65187..eda0f8d6c7 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -69,7 +69,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://run-ptest \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
-           file://0004-src-shared-util.c-include-linux-limits.h.patch \
            file://0001-Provide-GNU-basename-compatible-implementation.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
deleted file mode 100644
index 14afdf025b..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 409b2247f0003bc474a73aed78fa4c5a86bc30ec Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 12 Dec 2022 13:10:19 +0100
-Subject: [PATCH] src/shared/util.c: include linux/limits.h
-
-MAX_INPUT is defined in that file. This matters on non-glibc
-systems such as those using musl.
-
-Upstream-Status: Submitted [to linux-bluetooth@vger.kernel.org,luiz.von.dentz@intel.com,frederic.danis@collabora.com]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/shared/util.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/shared/util.c b/src/shared/util.c
-index 6e7634a..45fcd6a 100644
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


