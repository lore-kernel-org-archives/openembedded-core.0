Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB47C43602
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:42:45 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139205.1783291363131476273
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=V5eSjVam;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-476d8e647e9so2022168f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291361; x=1783896161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSOQr1j24zkJ1M4Cuy8YiK4CjYhtWbf6k+EdfEUa7/o=;
        b=V5eSjVamjM5GR+R3Z/H71GXOMzU5J2mf63C8xwHZL5Ni4VgcH7RpKyXVC8hH0rm2i6
         aseu3H4w9jOyg1AuNB+ZqoRje5snAG8nMwtIRo3fHWliJLnOtTyfziM8K6mYSswSxVOk
         EKuMJiPXnjGV1h0oHYU/1BIQAhxSs4qV9dRQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291361; x=1783896161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gSOQr1j24zkJ1M4Cuy8YiK4CjYhtWbf6k+EdfEUa7/o=;
        b=SXgmzn6MaVgjF3xaa+yv1M23TzucYjVLN/4IxKA/qPkSE0pL9aQrV/N8jRKax1+kOi
         BwBdDZx9T16ba3MIGlomCXsG8SQJLRfjkI3NOOcNq1wzvB0kDTcaeuxZwHCKtSvI8pDF
         H3jloRUCVOmxPciMW36vXgbzUsNwcdskTH3DnDUaJIPS9iq0eqCrXbnhPa78V1MmqiGG
         SXun2kiDJNol9/QQlhwUIG/vzshJsBz9DwsZJ0SW1x0fGUf01jD7+0gFNKDoiZTAhok7
         aNvpusq+TmjzkjgncaQf8OQj0HFwPmJxhdAKZQcG6Wzd5kB4o6Jkew1osCZqXuB+hbOx
         twaQ==
X-Gm-Message-State: AOJu0YzRF8zONLziFb6xI01vPiTyjSy8/mWuvnPC4mZYNrfIH0rmNcOO
	ZL0niLiaUXhm1ovdeP5g5QpAkLbb9K2BKsVxeOhKBOwzODGKG3EbITn2BJvC6MgPWMLRuMbOVjy
	nxSgFYPQ=
X-Gm-Gg: AfdE7cmt8Y2gFB4+3qZj1EI5n0ZYYZuc6rY2CGKHs4Tqtyu9NZOFcRrQhUHyobmRtHI
	rv6N/S0vtF/LiUU8XkeB0gR0ddl8lTWDZtM0gOpqAN0t4S9ll8k0E+ZHCrVEHe1H2J0kTS/7gkG
	dl+BOHUCIdh4e2i6MtxhiVhq4AS1ZdI4wtzNkOGk700b8VYu42Pir818J94QkIu44nauzWZU2aJ
	FfI68iGL4tFFJjl2fHLv0X9DOirBFXWiazJZstLUxT1HCkz5d+zvcoyq7Jt1xvDBLoQWQX8slNz
	tWAU5QA8TTyxa63YXadx3yY+rYEnBXoCr7hUE1y8EIvF04+VcCDv2eg2CzvlnvjVYrqGbuGQ1fn
	sFII8pI7ipFOmsSJFY/fY6Sy4dtdkjHEmd0WWznaxSEvuwiUwv2A0rZQNAzrHuRbf6LM6uGhPJd
	9TIiDH2kLCwVBKuUeEGZH+QS1ez7zAFwMqFeL6
X-Received: by 2002:a05:6000:4284:b0:46e:8226:96b1 with SMTP id ffacd0b85a97d-47aae0da376mr9301050f8f.42.1783291361168;
        Sun, 05 Jul 2026 15:42:41 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/55] bluez5: fix set volume failure
Date: Mon,  6 Jul 2026 00:40:51 +0200
Message-ID: <b12aa0f5d5afc8e5fbcefb007857aad1d77c9fc5.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240155

From: Jinwang Li <jinwang.li@oss.qualcomm.com>

Backport upstream fix for AVRCP volume initialization failure when
AVRCP connects before AVDTP.

Upstream-Status: Backport [bluez/bluez@121e5ca]
Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit ec27d1e5cf5010a51dca698274fea342f28958ea)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...t-volume-failure-with-invalid-device.patch | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index c792cc9c66c..c09a759244e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -71,6 +71,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-Revert-shared-shell-Don-t-init-input-for-non-interac.patch \
            file://0001-tools-Work-around-broken-stdin-handling-in-home-made.patch \
            file://0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch \
+           file://0001-transport-Fix-set-volume-failure-with-invalid-device.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch
new file mode 100644
index 00000000000..b5846dec47f
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch
@@ -0,0 +1,46 @@
+From 8a80f70c23ca5f93b1db7e3956cc7ee28c1fa767 Mon Sep 17 00:00:00 2001
+From: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Date: Mon, 9 Mar 2026 19:18:26 +0800
+Subject: [PATCH] transport: Fix set volume failure with invalid device volume
+
+When AVRCP is connected before AVDTP, an invalid device volume causes
+the target to reject registration for the EVENT_VOLUME_CHANGED
+notification, which breaks subsequent volume updates.
+
+Fix this by initializing the volume to the maximum value in the AVRCP
+target init path when it is invalid, allowing the controller to
+subscribe to AVRCP_EVENT_VOLUME_CHANGED.
+
+Fixes: fa7828bddd21 ("transport: Fix not being able to initialize volume properly")
+Suggested-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/121e5ca79be559c5374f8a54c6fb6e233e383379]
+---
+ profiles/audio/avrcp.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
+index 724b46c59..326dfdab7 100644
+--- a/profiles/audio/avrcp.c
++++ b/profiles/audio/avrcp.c
+@@ -4296,9 +4296,16 @@ static void target_init(struct avrcp *session)
+ 	if (target->version < 0x0104)
+ 		return;
+ 
+-	if (avrcp_volume_supported(target))
++	if (avrcp_volume_supported(target)) {
+ 		session->supported_events |=
+ 				(1 << AVRCP_EVENT_VOLUME_CHANGED);
++		/* Check if transport volume hasn't been initialized then set it
++		 * to max so it works properly if the controller attempts to
++		 * subscribe to AVRCP_EVENT_VOLUME_CHANGED.
++		 */
++		if (media_transport_get_a2dp_volume(session->dev) < 0)
++			media_transport_set_a2dp_volume(session->dev, 127);
++	}
+ 
+ 	session->supported_events |=
+ 				(1 << AVRCP_EVENT_ADDRESSED_PLAYER_CHANGED) |
+-- 
+2.34.1
+

