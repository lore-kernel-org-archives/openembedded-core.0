Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EBAC43217
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:37 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.4709.1642588896144137966
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BoPP4zwz;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so4989142wmq.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=08fWo6NEx8AXr4GBASZvppMHemmMJmwbO15b5x4Modw=;
        b=BoPP4zwzGelnIHY+aOSuGp5umahM/iA1gTs1eXkCGRu1NS6NJg22It3T2AmqSEKApt
         /0G7ppaQtT2Tgtwyt5YUTn/C7UIQ42a66YuJA812tXcDm+darL5TPixXcLhu4MlfwvVG
         5Xw8h01IvFfTYxgIdxxD+Q5Uocjkxt1KsvX31tPMViMHFPg9nu4oQbaP3HKqnlMEFPI3
         IPVCqTR0aKtyAKQgG3MsIL4lRo5CEouXvOJ5cxZ8uUiutS+V8pEE3V8Q2DGcrHl0t8JV
         +lutE+qVb/lKukD7ffbeqZBXAjYdJbZk3q0th0ES5gCA0PFEiPWn8LF8niBukANu0Oct
         v3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=08fWo6NEx8AXr4GBASZvppMHemmMJmwbO15b5x4Modw=;
        b=irzP/XvJ1i1MWnd43hwupwx/gwmzs/eQXvUKYr1rqkffvZckMeGM4Kxf9epWUTglVj
         T4i6+JKbMjF5891D0vD29BPWfJW+mGrsp4dlU7+xFuJ2cQJzZkaNvRoPn7DwONsUNbwG
         5/dkM1zuWEcqH7qKZGiW7XbwW/A8T4GwkTMLCmUaX48mGhc5rRilfs5lv4yTGHNH/fTI
         ShU4qXvbYUHuC6MwJ/vFto0FSliCvD70oM4OrB18NUedbGS0Cj51Ce9vMS8+GsG1UMQ8
         2e/bSxdPQt4f5khjwUq3RRFVyaRYfsQBNBuHR3I25ORwDwasTpSjj2LHV3QaXbTwU6Ap
         5kSA==
X-Gm-Message-State: AOAM531oG14ukGenWn8n/zvcjSeESpJZD2GMJe+W2IccEiT4WYvgqybG
	8vI/AT7HIYhHqPde33o+XgZgSKxbTQA=
X-Google-Smtp-Source: 
 ABdhPJxt7ftruBh9aKi8tecPW53cWU5ejtSAF23S4DrPvLHVKJ5bUhf4UWvnS7GaIzHinhNxBH5gDg==
X-Received: by 2002:a05:600c:3d86:: with SMTP id
 bi6mr2910912wmb.1.1642588894775;
        Wed, 19 Jan 2022 02:41:34 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/39] iproute2: upgrade 5.15.0 -> 5.16.0
Date: Wed, 19 Jan 2022 11:40:51 +0100
Message-Id: <20220119104117.2120127-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160704

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...d38a941a181f1468fa39541e872e51b6022f.patch | 35 +++++++++++++++++++
 ...{iproute2_5.15.0.bb => iproute2_5.16.0.bb} |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/8bced38a941a181f1468fa39541e872e51b6022f.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_5.15.0.bb => iproute2_5.16.0.bb} (63%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/8bced38a941a181f1468fa39541e872e51b6022f.patch b/meta/recipes-connectivity/iproute2/iproute2/8bced38a941a181f1468fa39541e872e51b6022f.patch
new file mode 100644
index 0000000000..289712683e
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/8bced38a941a181f1468fa39541e872e51b6022f.patch
@@ -0,0 +1,35 @@
+From 8bced38a941a181f1468fa39541e872e51b6022f Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Thu, 13 Jan 2022 08:14:13 +0000
+Subject: [PATCH] lib: fix ax25.h include for musl
+
+ax25.h isn't guaranteed to be avilable in netax25/*;
+it's dependent on our choice of libc (it's not available
+on musl at least) [0].
+
+Let's use the version from linux-headers.
+
+[0] https://sourceware.org/glibc/wiki/Synchronizing_Headers
+Bug: https://bugs.gentoo.org/831102
+
+Signed-off-by: Sam James <sam@gentoo.org>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ lib/ax25_ntop.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/ax25_ntop.c b/lib/ax25_ntop.c
+index cfd0e04b0..3a72a43e9 100644
+--- a/lib/ax25_ntop.c
++++ b/lib/ax25_ntop.c
+@@ -2,7 +2,7 @@
+ 
+ #include <errno.h>
+ #include <sys/socket.h>
+-#include <netax25/ax25.h>
++#include <linux/ax25.h>
+ 
+ #include "utils.h"
+ 
diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.15.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.16.0.bb
similarity index 63%
rename from meta/recipes-connectivity/iproute2/iproute2_5.15.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.16.0.bb
index 99a743391a..46c1b045c1 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.15.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.16.0.bb
@@ -2,9 +2,10 @@ require iproute2.inc
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
+           file://8bced38a941a181f1468fa39541e872e51b6022f.patch \
            "
 
-SRC_URI[sha256sum] = "38e3e4a5f9a7f5575c015027a10df097c149111eeb739993128e5b2b35b291ff"
+SRC_URI[sha256sum] = "c064b66f6b001c2a35aa5224b5b1ac8aa4bee104d7dce30d6f10a84cb8b01e2f"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.20.1


