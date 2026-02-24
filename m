Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8115F357C2
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:01 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21653.1771943568756189479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:32:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SiiHvbfB;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4837584120eso39308855e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943567; x=1772548367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfoMCTDbOGTRkzfkAF+74yefCDXlElQt7AVu8ytUDIk=;
        b=SiiHvbfBWfHba5w/lOGUgaGWLTc4h4ZGs7t7Gzd/Zfdx54vYzrb0ou+2yfg4KVV7hK
         6VLLfY2McZN6r4PF8J6gFE45GgBb7/psYgs7rbatXKTUrSl+pAqq88w0b2CYcZ/0GG66
         a3bqn/ZS0PJMpx5Cp3mzAEBml0xxTFtetdJXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943567; x=1772548367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HfoMCTDbOGTRkzfkAF+74yefCDXlElQt7AVu8ytUDIk=;
        b=TmRiwIPe30YbwBSCysBhxGW7wez23f0rqbqtk0uCzmanzJ5g59WUsSupWZbtk5Z3rE
         lw+GE3oHnQguVg7ur8YEyfKmwIUGv26Z0KxPTuM3x7Ap4Iyjab82ESOllMzi2xti3R/3
         17uNkRKC9fHRKxKjX5620px31Lg1eSMXZCd7T0uPhbwVHUtNndH6/iWGDmyoAML3+6sE
         ZaLn7C7EsoIcoJlX9sRCnySD7aO+wiS3Bk9C85+GxhFEu2oHhD1f+k3io/tf1GhdX1RU
         getZk4bF5IdYUUDLGFZOFQisxaWcGBwrARawUaR7VWNCzH0zhVDpZlXmNWcsnNTBTV7C
         ml6w==
X-Gm-Message-State: AOJu0YwDqvs8FD/IBt3AY2oxtnBn2swKhGvourBvJEYyzfSjo1vln03a
	WcEw4mbOTSNMghLD304fj29AU6OdR9Q3RQu6Wo2ims2qJoad9RpdWZN/Sq0y99lV9s0xM7xcb8l
	Hy8fU
X-Gm-Gg: AZuq6aIB/2f3xf8ZMSosA3c8mIWGWr56yASCoVBZzAMWbRsYBEysapElaKvcNnDeRlo
	YbD7ytbHr6DPtbRI6tJnnDK8R6XQhhRi8D7NIdLZfPJ/pc9l56QBJYvweuPLZwX8lnYnG75ndt8
	CLmQfQVBGtrV0/nkR7TQ7a1P9Rpj+hRh+KsyBhO2N82Nn9QjwMi3epiLF2PMMcDRZINbAs/gXqY
	KcW9S10ZZEfQZxnCmwOkGSq0r08xreDLXYZdc7R9k2V6FV0Ryqfc9rlw/YdjFSTuQWIDwZAb6uL
	jSTDN91XYoIUvDknSXO9qZ6VntnuaFjZChY4DhCUsTHRTznGLqUl735KEgq2cR/tnl7h9MXgONQ
	nDy8Iu7hgGiXOTgTxDdj68aV4WMPGFJMI6JVRuA+9wshc3CHZVhDEGm831c8v5keZfBTxERqrh3
	qcP92ZFoZa80UBDEReB8FSJlXRWLVFhyMZ0kgcEowMZytTMSwQtYKL8zr24r7WC4k8dNIuBHVw8
	ROv9yfrcD5lzO7zVEvdh+EDjC9cTN9zVQ==
X-Received: by 2002:a05:600c:4e12:b0:483:1403:c47f with SMTP id 5b1f17b1804b1-483a95bd8bemr183776625e9.6.1771943566963;
        Tue, 24 Feb 2026 06:32:46 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.32.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:32:46 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/44] avahi: patch CVE-2025-68468
Date: Tue, 24 Feb 2026 15:31:31 +0100
Message-ID: <f6964aa6c7ee2e8fea71aee7a705c494400f7386.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231808

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f2ed8adc37a42b561b3c4853cf8106fba39889e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68468.patch          | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index bb20fd17ccd..34d95f48cd6 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -38,6 +38,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2024-52616.patch \
            file://CVE-2024-52615.patch \
            file://CVE-2025-68276.patch \
+           file://CVE-2025-68468.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
new file mode 100644
index 00000000000..3635cc8d53e
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
@@ -0,0 +1,32 @@
+From 483f83828cfda965fac914ff1b39c63c256372b2 Mon Sep 17 00:00:00 2001
+From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
+Date: Sun, 2 Mar 2025 18:06:24 +0100
+Subject: [PATCH] core: fix DoS bug by removing incorrect assertion
+
+Closes https://github.com/avahi/avahi/issues/683
+
+CVE: CVE-2025-68468
+
+Upstream-Status: Backport
+[https://github.com/avahi/avahi/commit/f66be13d7f31a3ef806d226bf8b67240179d309a]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ avahi-core/browse.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index 86e4432..79595fe 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -295,7 +295,6 @@ static void lookup_multicast_callback(
+                 lookup_drop_cname(l, interface, protocol, 0, r);
+             else {
+                 /* It's a normal record, so let's call the user callback */
+-                assert(avahi_key_equal(b->key, l->key));
+ 
+                 b->callback(b, interface, protocol, event, r, flags, b->userdata);
+             }
+-- 
+2.43.0
+

