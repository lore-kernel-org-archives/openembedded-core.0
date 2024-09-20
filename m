Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DEFFC78854
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 13:39:50 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.18456.1726839584771113743
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 06:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=REak2XH1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71788bfe60eso1699723b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 06:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726839584; x=1727444384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOva2QKKEeDG8Nigq/TFtCqcMMI4RCpYTZV0Lv22ouU=;
        b=REak2XH1YJsvAxPRTFEiFt6vMDEm+fBCgHQyJ7jHr2MGz3CegEEnpVn7MKoxu/eAnl
         QYLFnJZ2oy/pkcB08rD1SqgXzzDe8JiXRwsaxHMZimw1TxquORPuF+LCR0B+4ObVCbvP
         0hA+Li4OzGUnIM9yxuwl7Ns1STyC7oTx3n8sqXjn5/9FrsPGm1vKZ4v9qD7CS716h9Oq
         Qo+fg1bzcnVeBEhVk+ioJEeNRlHW4aLW0QNt1OHrghTNNka0OGDfgkbbssi0rjBVZMy0
         pLsUXncShHdQScA8gi/cpYXc9/KJXueIiwr7BpuFiRUXPfhkvOxM/avqM5nb0b9hrUtO
         vRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726839584; x=1727444384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOva2QKKEeDG8Nigq/TFtCqcMMI4RCpYTZV0Lv22ouU=;
        b=L2C4Twi095hixCutsc+HWx3ubA0SB+xHumlHBZvVU274SNWVRopLxrI9GoZDgZyamo
         BA21fXHuNyaFk2T38mP6SFrxgBzprxeqc1hEIuz2llt51fspMmJUHY/eFWwtNmES3n5p
         V1d+FgPvDPnk6wBy0Aeid8piKLl8AFulXijzOZlo8Wno2CJHmUXYtP1rfJgGyR377lnj
         uaMM9X0lDo78rE6l70uLPfIobFrvDDaFUZLkgcaBTdf3QWZ8Ne+gG9zf+Fnodn//jIlS
         7W+GSRq3fibsNFhTyW9KTzJ7rotYUxFLFFqeVdXiqbP8JJrf+xEq+A+8cDmQyooYEwxn
         RhsA==
X-Gm-Message-State: AOJu0YzWhkRHIJ5uA50kPuQ9CxMJqBIY11QQkAC20AMgfz4fUpc/0vlj
	iBnsfGeFvsC1G33AkiIayRW2rEEXqAw4ZumaM0bGYCfj2i44ulb31puaRtKAGt2lHD8MGaMAJkr
	q
X-Google-Smtp-Source: AGHT+IE1WM2Twlca6gYr3YH59T7R9le+0LEaZOZrruYqOe7z2Z9OIcq6X57I00LNdcA7pUqMnEGRjg==
X-Received: by 2002:a05:6a21:3409:b0:1d2:e888:3a8e with SMTP id adf61e73a8af0-1d30a97029bmr4670225637.18.1726839583924;
        Fri, 20 Sep 2024 06:39:43 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b97e45sm9811846b3a.164.2024.09.20.06.39.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 06:39:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/16] bluez5: remove redundant patch for MAX_INPUT
Date: Fri, 20 Sep 2024 06:39:12 -0700
Message-Id: <a2532944258334c9f64b673278040dd5e27489d2.1726839438.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726839438.git.steve@sakoman.com>
References: <cover.1726839438.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 13:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204753

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

The solution to the problem upstream was fixed by the following commit:
https://github.com/bluez/bluez/commit/ca6546fe521360fcf905bc115b893f322e706cb2

Now MAX_INPUT is defined for non-glibc systems such as musl.
This fix was added in BlueZ 5.67.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


