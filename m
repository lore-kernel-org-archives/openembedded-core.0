Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C385BCA6001
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:28 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48862.1791301587992684525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Yo8Mid3U;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso7553775e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301586; x=1791906386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GJmsW4/qLQD3iHvvmA+EvNv1nf4l+rok2jBKSufzwL4=;
        b=Yo8Mid3UYWIcUOUX13sC7YiGLSTKyYw3+7rnJ1wJP16hS2Ft4GWjpUcINeCoJ3CzOx
         46CFf1oI5d4+HhNG4U7xsb1TqDE2Mas9VTnmc7BypAzjg0BQImj/TEAbU/n7pa3Lh1bY
         hNxG2x2vbb+iOsp1oFEo6FHZhaSSfRwi8luaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301586; x=1791906386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GJmsW4/qLQD3iHvvmA+EvNv1nf4l+rok2jBKSufzwL4=;
        b=0gkl7gFGspcmLMTrAzgYaHkCRC+D06oSMiUj5VTMHT+YOHSZ4NVk3vTNXOzm6OLC+m
         QYesr9OHRUSYEzNMXWMlgKzTMBTl35M0sEevIpADH/MrkAA9y6hmuRO8A1/DoKFaqY+W
         U6eJg9yLrSni3QhQWCQNrAuCZUvbj0wQfr1HmGQKe20aC7R4xL7U9tqdmtFcCZMVSUOE
         b6V1VZMG9P35S4AVQU7EdRyRC6+S22liyXNNT6ZeNn72MyY8C6JALXtyqzqB+zbkG2O4
         WmPdqMtkcKlhuUjB4VLg3192XXkF6p3Hn/5/tdxyc43lWsAoozepERNIRYN6eAniBcza
         PSjQ==
X-Gm-Message-State: AFuF++mCw3m5ROK0ck6VcR172B4fBqMZGuEwPt5rIkslENlaEvU3dgMj
	Ys8KPoM+opR8QAbCmwyb2AHzJoALsx1ZasjxPIglcqbi1/LqTtG7A+51Uy5qOTmZqTCZkYLPAu8
	TNnTfYtw=
X-Gm-Gg: AYBFou1G5A0jhqlAn1cKBzmquJlq1i9Y2aoZ5W++Tvh0R1reQbD4hkcJLVGs5U9RunN
	kKy3Ax9YUjEW4AS2WzRoehKARoS0mQHzNMf7hAQ/3fRjNSg2FAhFjv7kK9IXEFsvG71PdHMAssb
	oQIOkEYKqCTDZTBWfJAIf644NPH6mgi7jepgAouGuHOcBcuimP5vn6L/WR6/aEHfcSPGF9FOzzf
	uM0/Y+jIaGmGluWF9oxwESDnZdR2Frg3AGQYVMwjkzq+/89rAmTroe8GdOPh0T1PYJ7G2DhlcjE
	SY8JGpA0fcn1Lqod/EtOnzbq0dVMM7FHDc65hl2t1IJMIjTTp+XZSzRpZcGDsu6yznxiaoG6YMj
	i5xbEofEYoulO+leyegdtFrFTF6c4jduExCJ6/8nS+ZwgQjUMkIDF6GwPDv+NPnzXq4vnMhpVM6
	VCpx+GQKPyn2486F+07Yrg7ewcSAELMvfJD3mEftlCn3rRFeUPRwzjiWQP0aie+BkfQqvIXUvBk
	bsNsuhh45Wi4Urzf6GdiZkphJYvm2l8DUct2GOIJnhdlhGpKw27Iy+mTu5G8Ynsh3TJgMpIxeyX
	AkVtcVLigCEx0ohjdg==
X-Received: by 2002:a05:600c:a45:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-4a17b537c3bmr30039445e9.21.1791301586168;
        Tue, 06 Oct 2026 08:46:26 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 05/19] bluez5: fix obexd/pbap u128_to_string skipping data[4]
Date: Tue,  6 Oct 2026 17:45:51 +0200
Message-ID: <de7fb253dd96bae2f01fd4e78d1f966ac520d42c.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247294

From: Jinwang Li <jinwang.li@oss.qualcomm.com>

u128_to_string() uses data[3] twice, causing data[4] to be skipped and
DatabaseIdentifier, PrimaryCounter and SecondaryCounter properties to
be printed with wrong values.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 57c9aead1d913a56b115f0cffdc73e4a1baa9b42)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...p-Fix-u128_to_string-skipping-data-4.patch | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 67bdb6017f7..22d50bc23f9 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -68,6 +68,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
            file://0001-gobex-Fix-ABORT-response-being-discarded.patch \
+           file://0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
new file mode 100644
index 00000000000..13adce3aa2e
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
@@ -0,0 +1,33 @@
+From 8b4a4176063831476bc9244d20f43b552e4b5554 Mon Sep 17 00:00:00 2001
+From: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Date: Wed, 23 Sep 2026 11:29:57 +0800
+Subject: [PATCH] obexd/pbap: Fix u128_to_string skipping data[4]
+
+u128_to_string uses data[3] twice causing data[4] to be skipped and
+DatabaseIdentifier, PrimaryCounter and SecondaryCounter properties to
+be printed with wrong values.
+
+Fixes: 5ee26d43c65c ("obexd/client: Add DatabaseIdentifier property")
+Assisted-by: opencode:claude-sonnet-5
+Upstream-Status: Backport [commit 8b4a4176063831476bc9244d20f43b552e4b5554]
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ obexd/client/pbap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/obexd/client/pbap.c b/obexd/client/pbap.c
+index ce5e6cd5d..1970d3357 100644
+--- a/obexd/client/pbap.c
++++ b/obexd/client/pbap.c
+@@ -1099,7 +1099,7 @@ static int u128_to_string(uint8_t *data, char *str, size_t len)
+ 	return snprintf(str, len, "%02X%02X%02X%02X%02X%02X%02X%02X"
+ 					"%02X%02X%02X%02X%02X%02X%02X%02X",
+ 					data[0], data[1], data[2], data[3],
+-					data[3], data[5], data[6], data[7],
++					data[4], data[5], data[6], data[7],
+ 					data[8], data[9], data[10], data[11],
+ 					data[12], data[13], data[14], data[15]);
+ }
+-- 
+2.34.1
+

