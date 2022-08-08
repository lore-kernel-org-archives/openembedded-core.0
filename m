Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3B6C25B0E
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:42:56 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web08.22245.1659940972632707890
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nMIHxkvl;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id r4so10048717edi.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oY4bXkP0NiZX6esyfMCqWzAM0PbtZ+wWSWVjvZ2U/7w=;
        b=nMIHxkvlF8ernSdJPWB5IOL2JtRhYKLIywvgXF0LfSmGZhtULj+v9Ud18HNh+PQH/W
         3F6QplnjMNXCmXeoHrmb2wcqYj0aP8Yoyt0eGIsP+4TbrkaSL012OLxLPJFtAsiRyYZy
         bFhNDHChV8f28N5d2R0eapLu4bflz6R4Kuccl0YVKqt9uFNWugwOTlEKSZtmZfslvvoX
         QHA+cx3H2mV+o+4R+Oyt/Kq6XT1HTB6XotS0ioC/6iNpXrrnTUoyLOUZdf4twG9TrVfx
         F8iea3iQXl/O5Leu8hG83jzPZZJpfO1BrWXGuB9/sBQUSyOsO0xMJcqmadUZOeGgqhLq
         dJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oY4bXkP0NiZX6esyfMCqWzAM0PbtZ+wWSWVjvZ2U/7w=;
        b=MAPWWEtac43DlbYIdjrcAEP54OV2oeY4qXyfAE5lC+t/Q/sdELJZ8l97Eq1va/6ovi
         jUKcsdUv2nZsAHcJgcTFCY9ZVcQVX/L1l++QbGd5MnOu/eDj9w0ip4FaCjzZqB2BhqGY
         Gk2DykWd3mKtOaYu7NhuhUZQKcHmh5mmFcy3RYVVN6nSLNgfE4/E0Um9pEL1+9e6W8b4
         Jv06m6nBfe0PDoJzzkTJtdq4vUb977JVYsJJ0AD2PV37DUH0KPG2WsGY1zJ1SewSqXnN
         aBTPrV7GhObNbEssRS0YaMXaotwCZGH+S3P8xnrEdBV/mnkIbIXOK4gtciU8Dt/qqf1T
         qqKA==
X-Gm-Message-State: ACgBeo0JRNFrmdA2wlVx55Yc69XVX6B+8nhXiwWbzk9HvbSd7M18A86j
	MLBPNWkYFWlAZxxEF1KjP/hXDo66vaQ=
X-Google-Smtp-Source: 
 AA6agR7mW3P8LcdA8KstsBG56vzcFOC/agGw423uhj1CCYwf+xGA2NM2dz87n70gXibXUNQ0sdDoBQ==
X-Received: by 2002:a05:6402:1d4e:b0:43d:9822:b4d1 with SMTP id
 dz14-20020a0564021d4e00b0043d9822b4d1mr16679057edb.212.1659940971194;
        Sun, 07 Aug 2022 23:42:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 11/44] iproute2: upgrade 5.18.0 -> 5.19.0
Date: Mon,  8 Aug 2022 08:42:04 +0200
Message-Id: <20220808064237.3975347-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:42:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169035

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-add-an-include-where-MIN-is-defined.patch | 25 +++++++++++++++++++
 ...{iproute2_5.18.0.bb => iproute2_5.19.0.bb} |  3 ++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-ip-ipstats.c-add-an-include-where-MIN-is-defined.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_5.18.0.bb => iproute2_5.19.0.bb} (61%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-ip-ipstats.c-add-an-include-where-MIN-is-defined.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-ip-ipstats.c-add-an-include-where-MIN-is-defined.patch
new file mode 100644
index 0000000000..edd73818ba
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-ip-ipstats.c-add-an-include-where-MIN-is-defined.patch
@@ -0,0 +1,25 @@
+From c8a99f1035ec7b158a204f90e9a7ed3c0b1e3d52 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 5 Aug 2022 11:31:56 +0200
+Subject: [PATCH] ip/ipstats.c: add an include where MIN is defined
+
+Otherwise, non-glibc systems error out (e.g. on musl).
+
+Upstream-Status: Submitted [by email to stephen@networkplumber.org,netdev@vger.kernel.org]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ ip/ipstats.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ip/ipstats.c b/ip/ipstats.c
+index 5cdd15a..1ac275b 100644
+--- a/ip/ipstats.c
++++ b/ip/ipstats.c
+@@ -1,6 +1,7 @@
+ // SPDX-License-Identifier: GPL-2.0+
+ #include <assert.h>
+ #include <errno.h>
++#include <sys/param.h>
+ 
+ #include "list.h"
+ #include "utils.h"
diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.18.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb
similarity index 61%
rename from meta/recipes-connectivity/iproute2/iproute2_5.18.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb
index 3e01c70801..c45920b015 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.18.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb
@@ -2,9 +2,10 @@ require iproute2.inc
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
+           file://0001-ip-ipstats.c-add-an-include-where-MIN-is-defined.patch \
            "
 
-SRC_URI[sha256sum] = "5ba3d464d51c8c283550d507ffac3d10f7aec587b7c66b0ccb6950643646389e"
+SRC_URI[sha256sum] = "26b7a34d6a7fd2f7a42e2b39c5a90cb61bac522d1096067ffeb195e5693d7791"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.30.2


