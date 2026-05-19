Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5AB0CD5BAE
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:51 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1018.1779233443141713734
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BeZqDxC8;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-444826c16ffso3690085f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233441; x=1779838241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8aV4GRZRpdMpkdCgv6z1BTGvWW7cmgc/G+pwWTzGnH0=;
        b=BeZqDxC8py0usBigFuykFJMomWy4YWGuidvDdSZ5kmE0VGdb4p+gwbQtuztwusNSlS
         dDhhGABgnVDtyY8ZbGFKlwSt65N3I1ayfpt535a439DC2LLGpZndyPy/b5F82LcXF/P9
         VngjRc+XEWyhF3U3XsIAB7PUybRqElFjraowc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233441; x=1779838241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8aV4GRZRpdMpkdCgv6z1BTGvWW7cmgc/G+pwWTzGnH0=;
        b=fvIPIGbZ4odOesR6PjKBcCjB2SbVbrmsRuQoAaeYoWqSbn5U8jBiBq1ybLXUGVAYPb
         WS2yPefPLwX0OgInd0auVBhVkJSnDlbvG8GlVlBSoc4RExBxtoCXbeomu1VlcHIFA3s8
         iRGX2alawsXiKBhW+JcAhUd5bR1JtTPX6/EJ7Ic5CujDe8bXnSsrPq32BouSyReOjLhh
         y5gV3Awh87iYl4UGteoOd66dA4IabPynD3Cgz0sweNyxEVUfVu6OtT+NdhRvXbtwsNXk
         Pw7k6iAqr2BmSpIkU4r0diuJtzVEoLC7Bsto//4HRNfZZHwwHfQL8WJj1m6QyQFs4kJc
         JyXA==
X-Gm-Message-State: AOJu0YzaHB1QISL1mlnOOo0VpGZRZFqo6Q0EB+fv1tWeulwUGJKhmjAy
	YICF0T11VB7WMjVELQMHDL8whlyf/JPBIFV09ntQQ2am24JDomQaHsuRBSAEC449xRHgi/O85mD
	Bcbeg
X-Gm-Gg: Acq92OHOc2LgiLvMlpLBNSBvA1/7LrAK4A929TRFqJboMoMrmEqwNy93ZK/uvM1T9qj
	yFJgW4iFrk1NG3ooL9XfkkyN+TvU0pod9HFTjxMcDxVoh9eFcSZ6lr4FFWhwvmKjaT7W0cVK9S7
	SsqDFCkrznub4L2Baa+AD4Q+YaLH2P1XR4KqA5RSvfZT0KtcaHauIs9tvchETs2BnwPA+zp3ynu
	e1whf2crNS38rgcUn0DUx/mM8IgReMPhxT4QZk743rFri6B6D1DOTAftCiv0JcZo7UrSwAD+PBM
	WC49niFQAINC3qZk+r/kJ00zBQJAC2yuLAWVr421Te1AeARAPjbnN70lk1UqLKPOil5xJUbmNby
	FPRdQOjCPnnswB56AQXtxz5wgGjaUgRt6j29dWyEqLO9q4bVE7BJcRz96YneOs0NBYE4NUdb89E
	ewjMV0VdjLZsdojY7uRQybeJfXoHRuRcGLQTeHd0qm/gpyEM4Wl1wg1RjLPyizWC/n+Xo+7AyWY
	SXmM+6nLf3E2iSuMjFRQBRTZa8=
X-Received: by 2002:a05:600c:4a1a:b0:48a:592c:e655 with SMTP id 5b1f17b1804b1-48fe6325f25mr201941105e9.17.1779233441282;
        Tue, 19 May 2026 16:30:41 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 25/28] bluez5: add patches to fix 8.56 gatt issue
Date: Wed, 20 May 2026 01:30:02 +0200
Message-ID: <ec9b329363db51d282a642f0630dbf039ce7e40d.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237372

From: Jinwang Li <jinwang.li@oss.qualcomm.com>

btd_gatt_client_service_removed() can be called reentrantly via
bt_gatt_client_unref() after the services queue has already been freed,
resulting in a use-after-free.

Reset client->ready to false before destroying the services queue to
prevent reentrant calls from dereferencing freed memory.

Upstream-Status: Backport [bluez/bluez@d01616f]
Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 37f8b40d68bdac279d363d946b935716e2843d00)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...use-after-free-caused-by-reentrant-c.patch | 59 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 843e36b78de..c792cc9c66c 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -70,6 +70,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-Revert-shared-shell-Don-t-init-input-for-non-interac.patch \
            file://0001-tools-Work-around-broken-stdin-handling-in-home-made.patch \
+           file://0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch
new file mode 100644
index 00000000000..0fcbc0808a2
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch
@@ -0,0 +1,59 @@
+From 45c167591d04e2dfecf5b4642168e54c23abbd40 Mon Sep 17 00:00:00 2001
+From: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Date: Sun, 26 Apr 2026 21:25:15 +0800
+Subject: [PATCH 2/2] gatt-client: Fix use-after-free caused by reentrant
+ client teardown
+
+btd_gatt_client_service_removed() can be called reentrantly via
+bt_gatt_client_unref() after the services queue has already been freed,
+resulting in a use-after-free.
+
+Reset client->ready to false before destroying the services queue to
+prevent reentrant calls from dereferencing freed memory.
+
+This was found with the following backtrace:
+
+    #0  match_service_handle ()
+    #1  queue_remove_if ()
+    #2  queue_remove_all ()
+    #3  btd_gatt_client_service_removed ()
+    #4  gatt_service_removed ()
+    #5  handle_notify ()
+    #6  queue_foreach ()
+    #7  notify_service_changed ()
+    #8  gatt_db_service_destroy ()
+    #9  queue_remove_all ()
+    #10 gatt_db_clear_range ()
+    #11 service_changed_failure ()
+    #12 discovery_op_unref ()
+    #13 bt_gatt_request_unref ()
+    #14 bt_gatt_client_cancel_all ()
+    #15 bt_gatt_client_free ()
+    #16 bt_gatt_client_unref ()
+    #17 bt_gatt_client_free ()
+    #18 bt_gatt_client_unref ()
+    #19 btd_gatt_client_destroy ()
+    #20 device_free ()
+
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Upstream-Status: Backport [commit d01616f0c276a441dad8afe4e8f7bb261b26ba0a]
+---
+ src/gatt-client.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/gatt-client.c b/src/gatt-client.c
+index 374e67c..3baf95c 100644
+--- a/src/gatt-client.c
++++ b/src/gatt-client.c
+@@ -2261,6 +2261,8 @@ void btd_gatt_client_destroy(struct btd_gatt_client *client)
+ 	if (!client)
+ 		return;
+ 
++	client->ready = false;
++
+ 	queue_destroy(client->services, unregister_service);
+ 	queue_destroy(client->all_notify_clients, NULL);
+ 	queue_destroy(client->ios, NULL);
+-- 
+2.34.1
+

