Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F61EC3ABAC
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 21:10:25 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.122792.1726434623692084703
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 14:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cA6rYIUT;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: gudni.m.g@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c4226a5af8so3107450a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726434622; x=1727039422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K72SmKENuunA8Kn+8yUn7e3XPBTLmY4+xkfEwyl2o5s=;
        b=cA6rYIUT2Gjoe0Bfgk5Yl1cXg4KS4NFNB6f5NJ6ggZlzKAG+dSP9O1wm9f2Rv2wiM8
         7wS8leCe6OZ3BmhPTmB2Wgp5SmaswYDYQwLFsOjquTMkYRa7Te7C7TT40jt+QPVtFhBt
         UH8b0hu0oT7cYcu/kZiefwRVn1Th4gB9GdS8Pbji+vd8KbCQvaEVqqUAwZK3oD0fTxiG
         6V8B6WPrQ8Q5Mio7onSbqpv8UzQOPN87OtUFt05oixGU7izw/CN1IB7BWnsiyva/GxqV
         MSEwla/qzz923CjUbG7Vx11c24FmB/lxIj64HoGgQGk93PtL+Wp/r4L6gPM6dQVhXy8O
         iNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726434622; x=1727039422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K72SmKENuunA8Kn+8yUn7e3XPBTLmY4+xkfEwyl2o5s=;
        b=vx8UyboGcP8eUzsUhmYUjLUG56VkS6NbcCzNqL4GguxERLUh2upH6iGEX7zCxM75Bb
         ZsSS7PJlawSd8fa7SuwHoyLFFr/v5gq7ORmAx71u9q/O0vzJVva4KCKQOW6Mjq/hyFzr
         /g8lVOo/nfDXz1oOhrtB+129VRj8rGMDn53l/4oPOcpvFx7fVdRkdK+z6ZuAKw5lz2Zs
         FylI8M8vnHR4pLDqG8Mf9O0nwdkbX9/XW7esHjAki0kWeS5LFXCpcLDa5Vghz7oKVdca
         /u618iE+R5uZDTLZPkghOJV9KcmVzDBB+7Xu4Ep2RIxs0HM5OscxbP6PDiX6uxQLM0TM
         /sxg==
X-Gm-Message-State: AOJu0YzVgbrOSxkp7ve3do11+b3rJJFd+DO6E4w2fR10dl+MBJwac7px
	Vglr0ffo6Xx2ETmoBWtVEYVyhO4Y88KDKRrYUrD18S8EVTRv/pD2llYm2A==
X-Google-Smtp-Source: AGHT+IFkCS23bbhNAI+jRXzndv3ZxKDrPXFpoUWx7lHZRaQVjyL7pfL/OgyRkYZbokNSly7Z10Hpsg==
X-Received: by 2002:a05:6402:1d51:b0:5c0:aa23:e1c1 with SMTP id 4fb4d7f45d1cf-5c413e11a4emr13575590a12.14.1726434620654;
        Sun, 15 Sep 2024 14:10:20 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bc890f8sm2007346a12.89.2024.09.15.14.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 14:10:19 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] bluez5: remove redundant patch for MAX_INPUT
Date: Sun, 15 Sep 2024 21:09:36 +0000
Message-ID: <20240915210936.5169-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 21:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204586

The solution to the problem upstream was fixed by the following commit:
https://github.com/bluez/bluez/commit/ca6546fe521360fcf905bc115b893f322e706cb2

Now MAX_INPUT is defined for non-glibc systems such as musl.
This fix was added in BlueZ 5.69.

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


