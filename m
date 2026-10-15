Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F06CC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:50 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32821.1792040628845195165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3ZhrKMjB;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4d870d54so3010228f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040627; x=1792645427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qeCj9h8In//Mm6oMYawrfWoQCayQ5xjGqwUEes7MaVQ=;
        b=3ZhrKMjB24OGSrtO8VCI+utXIoIJK0fZwQXDDNUpPrL9sg5Hx/lO1zGB9nRxDvBwOS
         aS/vuJOLtMqr/mh/ITBMQ3crRZ3PiTiiqZD9bFnnPYyOeylFFV6Vx9aGDbMkzPnjvjCZ
         MABTKAw+tPwEnytYTJDrC0QJVCGZv6eRGDUkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040627; x=1792645427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qeCj9h8In//Mm6oMYawrfWoQCayQ5xjGqwUEes7MaVQ=;
        b=ov1OdjNJlWLHwmYWzAx/GQDb9K5ZYJOGJSOWAjhsBSsTxEUzyBCNvybKQ+r7JwdzeD
         rLxLZbtt3/6aSi+ajbTH3BFxxhbN+KQyKR6czWkMDRwHH4/alLGaGxkV+yAX52gJ0CqG
         3sJrlP/Kf9hlfpE997wIXNFzLjSD63QVbPrO7/02t5KDTxEy2cCZ52GGvxcebU/AuUj1
         Z6I2LpumnDKhuVG3ylhpSMWMffwwTMgadH24fS2smSMqj9c/PH5TTyPNAxUBdbSySw4j
         WP4vBMjT+5KFlX6ZyMvuPIkDDHwExW4lFelXMQvqCfHmphBiYz7uqBti+Tliunt4NLwF
         Okgw==
X-Gm-Message-State: AFq9FYKzuFS80FEymx0vJI8jmZeb7zPuo1WQuyBbkHUgODelmu9aIPfG
	mtIlbODK8E1Hd8otku4ECxb9c8iCxFrF8Neq9jG34tKesCW+hMQk6UDGGXw3D93bNhWBZVUNkgK
	VUQM6JyI=
X-Gm-Gg: AYBFou1D/68szBUB1AWFPfq51Ri/ENBqLBFd7uvVqZY5CCnfzlrSXw9UDu0Ml++WuZl
	EVj3G0giFXEQaJYVfqasw4Lt6WdpzNCiS12lrNpzFz3wFN0gVCfPacDwRMbIFR231PT93ns9Jhn
	4zhGyNko6/WF0XAmVowCZqelXRuPmI0nZmswr+UFrk2Hwib88PSNGhB2day4FOXlrxiJ9gqZqqM
	wHGkl7C07EEJW84iZhqXR3xdUz2JE7t+w6APQyryBYnF5i9DWIilMBIAoggJyCRsN6VRmgegnvn
	1zmEn45hrS1m6uq/0We4JJTAp0te+DNfvnvZSZ2RyHl88a0a+roGQnI63xnh+f/lsNY1heIPqg/
	hLRU4VEi2pqdZXJW02P74mSGdOn8CEPbeYszhfSAep6j112Kokqvn98id+gzMI25GaF3f/T+c8Y
	ZTuKth09kX3Q6EqQqyASQPwnt2e17rlsSwE4kxENYg3/QdSFI9Evf/6YYd2iANJ0wrPns9+9cSj
	lvQxtWYpJ/gVeCCNWMGQABxu9tmmgQM2TRpxAXriTxttDMy4FXm5EkVke9ykKVhlyzQzPuwLA==
X-Received: by 2002:a05:600c:3e05:b0:4a0:2391:6540 with SMTP id 5b1f17b1804b1-4a18e4cdbd0mr337769095e9.25.1792040627073;
        Wed, 14 Oct 2026 22:03:47 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/55] libxml2: Fix CVE-2026-86137
Date: Thu, 15 Oct 2026 07:02:37 +0200
Message-ID: <f91dd4ffea498d407893031da23cde93a58fb6f5.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247812

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/76fe08d97de88bfaef2f7d5cd27f11954cc5bee2
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86137

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libxml/libxml2/CVE-2026-86137.patch       | 63 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch
new file mode 100644
index 00000000000..4a224365634
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch
@@ -0,0 +1,63 @@
+From a9d489b86e46188d1c0fde7dbd0aa8281596e6d6 Mon Sep 17 00:00:00 2001
+From: Hieu Le Minh <leminhhieu.opensource@gmail.com>
+Date: Sat, 18 Apr 2026 21:18:24 +0700
+Subject: [PATCH] xmlregexp: Prevent out-of-bounds read in NXT macro
+
+Fixes: https://gitlab.gnome.org/GNOME/libxml2/-/issues/1099
+
+CVE: CVE-2026-86137
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/76fe08d97de88bfaef2f7d5cd27f11954cc5bee2]
+
+Backport Changes:
+- Add the parser-context length field and allocation-failure guard required by
+  the Scarthgap 2.12.10 source, which lacks both pieces of the upstream
+  context.
+- The allocation-failure guard is completed by the subsequent
+  CVE-2026-86141.patch, which moves strlen() after the xmlStrdup() null check;
+  keep that patch after this one in SRC_URI.
+
+(cherry picked from commit 76fe08d97de88bfaef2f7d5cd27f11954cc5bee2)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ xmlregexp.c | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/xmlregexp.c b/xmlregexp.c
+index f434a0cf..320a35ce 100644
+--- a/xmlregexp.c
++++ b/xmlregexp.c
+@@ -56,7 +56,9 @@
+     xmlRegexpErrCompile(ctxt, str);
+ #define NEXT ctxt->cur++
+ #define CUR (*(ctxt->cur))
+-#define NXT(index) (ctxt->cur[index])
++#define NXT(index)									\
++    (((size_t)(ctxt->cur + index - ctxt->string) < ctxt->len)				\
++      ? ctxt->cur[index] : 0)
+ 
+ #define NEXTL(l) ctxt->cur += l;
+ #define XML_REG_STRING_SEPARATOR '|'
+@@ -245,6 +247,7 @@ typedef xmlRegParserCtxt *xmlRegParserCtxtPtr;
+ struct _xmlAutomata {
+     xmlChar *string;
+     xmlChar *cur;
++    size_t len;
+ 
+     int error;
+     int neg;
+@@ -698,8 +701,14 @@ xmlRegNewParserCtxt(const xmlChar *string) {
+     if (ret == NULL)
+ 	return(NULL);
+     memset(ret, 0, sizeof(xmlRegParserCtxt));
+-    if (string != NULL)
++    if (string != NULL) {
+ 	ret->string = xmlStrdup(string);
++	ret->len = strlen((const char *) ret->string);
++        if (ret->string == NULL) {
++            xmlFree(ret);
++            return(NULL);
++        }
++    }
+     ret->cur = ret->string;
+     ret->neg = 0;
+     ret->negs = 0;
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index d476ba14b6e..e4db345af42 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -32,6 +32,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-0992-03.patch \
            file://CVE-2026-1757.patch \
            file://CVE-2026-11979.patch \
+           file://CVE-2026-86137.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"

