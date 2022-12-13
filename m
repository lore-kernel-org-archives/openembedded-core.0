Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C691AC04FDE
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:36 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.70630.1670929887012599922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TBxAAvW3;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id co23so15230588wrb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ee0/zQzAkvvjCbBv2T6SuSMKng8d4yD2bIrpAuBqsT8=;
        b=TBxAAvW3nRGHi3IB4DYgAMP0AIjqjWRtuhI8BOMJP9XL2eteMpU5GzolVKsqQfz85N
         pqOhu+K5X5PoNOCfOlAY5W2JTyzxIBsJHRs/p9AJ6I69H5j/nHwtRV/6u6YrHneKZpM3
         2FNRJLEoSpx3Wm/gEpswmZJtTWPjrVq4nIYQqyb48sXvc0lWHnSpTlwNmf5cfNh6+zW5
         ruysoAKV1OcPN0T6t5BMgZLZn6xByx1NCjsPZK7aAr4SJgWFt0fcr/BHBxZjrgkgmBDT
         piNuipf8tKvV23mtc1qcGToNljA0RsETtGaoezYziP4kj0WhTnlP7yuHnlBEZQxPd+Jn
         zrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ee0/zQzAkvvjCbBv2T6SuSMKng8d4yD2bIrpAuBqsT8=;
        b=ieNKiJ1XBni2kwwvzH/ZlSEWbkHF+UI39EG2juVvXeBDR963PpNb3+4Mw0DUh4P7Sa
         f5FffSAy70vBhq3mMgF8+ZY2WQs5dJoB8kpoXgXmq78mN9iw4j0ydm3xOFAkgVvam2PS
         /J+ot677UWpgljioRcKRkfv+HmJce8wlyaKLCpkUPjy5x5VzRafnf0T3t1ILJWhNaCQ9
         0xN4jlSlQsMCpPcHU/rmknIDwsrYDebycGhAoCFMIaHzBV5DOGQacfCSn87zUrfOp6Mf
         8o+sD3FhqdX4jSws9Try2SS1GANXpp+Ni/J3OfMmUWhSR+gbORJYH4xO/Nq2GveFJ1gx
         nvlA==
X-Gm-Message-State: ANoB5pmg2WxCM2THxcYVdkvj9M+tDh7w7zGbRSvf6haRw28SH7tTBXKz
	P5QliDN2eNF0TKYwZF1SFz58lSvgPoU=
X-Google-Smtp-Source: AA0mqf6Ed7bv/ZhZx23UyKI/43mcWyWkzuil4cFHFtMUvT3mT5ObqOaQa1pgChzEgPR6MZAio0LADg==
X-Received: by 2002:adf:ef10:0:b0:242:5728:8f16 with SMTP id e16-20020adfef10000000b0024257288f16mr11513974wro.35.1670929892376;
        Tue, 13 Dec 2022 03:11:32 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/24] bluez: update 5.65 -> 5.66
Date: Tue, 13 Dec 2022 12:11:07 +0100
Message-Id: <20221213111118.149697-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174522

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...shared-util.c-include-linux-limits.h.patch | 26 +++++++++++++++++++
 .../bluez5/{bluez5_5.65.bb => bluez5_5.66.bb} |  2 +-
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.65.bb => bluez5_5.66.bb} (95%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 976297127d..e10158a6e5 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -54,6 +54,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
+           file://0004-src-shared-util.c-include-linux-limits.h.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
new file mode 100644
index 0000000000..f954f6dab2
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
@@ -0,0 +1,26 @@
+From 51584158b9a2e58f3790f8a7387b5cf167eca88b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 12 Dec 2022 13:10:19 +0100
+Subject: [PATCH] src/shared/util.c: include linux/limits.h
+
+MAX_INPUT is defined in that file. This matters on non-glibc
+systems such as those using musl.
+
+Upstream-Status: Submitted [to linux-bluetooth@vger.kernel.org,luiz.von.dentz@intel.com,frederic.danis@collabora.com]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/shared/util.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/shared/util.c b/src/shared/util.c
+index 0a0308c..1f61314 100644
+--- a/src/shared/util.c
++++ b/src/shared/util.c
+@@ -22,6 +22,7 @@
+ #include <unistd.h>
+ #include <dirent.h>
+ #include <limits.h>
++#include <linux/limits.h>
+ #include <string.h>
+ 
+ #ifdef HAVE_SYS_RANDOM_H
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.65.bb b/meta/recipes-connectivity/bluez5/bluez5_5.66.bb
similarity index 95%
rename from meta/recipes-connectivity/bluez5/bluez5_5.65.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.66.bb
index 4c15aeb46d..2208b730b0 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.65.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.66.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "2565a4d48354b576e6ad92e25b54ed66808296581c8abb80587051f9993d96d4"
+SRC_URI[sha256sum] = "39fea64b590c9492984a0c27a89fc203e1cdc74866086efb8f4698677ab2b574"
 
 # These issues have kernel fixes rather than bluez fixes so exclude here
 CVE_CHECK_IGNORE += "CVE-2020-12352 CVE-2020-24490"
-- 
2.30.2


