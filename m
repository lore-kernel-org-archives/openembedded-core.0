Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CF6C44500
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:42:45 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140012.1783291363519146064
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rc0WO5fJ;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1596449f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291362; x=1783896162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArRlS3i4SZJMoJmZyxhB9v9/PauVAwV1QkWXRlGJbH4=;
        b=rc0WO5fJ7PNS+DKyH7SLIqT7OyiXGU0+/0EI+O6NqikT+knL7obRQJiUBZQkouZrmP
         n1DRh4SUUvsotbhVkoH7yro6SGa4JBSXi709qNBBgINGnWP3yX0va8WpZCsxUwmSFEuF
         /P0tM3phd6e/et174CsWVPQV+EURvye3vOBZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291362; x=1783896162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ArRlS3i4SZJMoJmZyxhB9v9/PauVAwV1QkWXRlGJbH4=;
        b=oVBPmpWCdm1U0O6K7xEfJP0HEKzdZk0cy2xhN8XsB5fEWlZKm3tbFy1vlLrx6/hj33
         2xTjWkUM85QEJph60VXTsclJjgA6YKXZvwuVyUHgl6TZZTu44zStVoxxWJq8Wb/Wi8sz
         uLrlCaayvqZR55BzNJgUvndkH3wEL2jGDs0Ljjg8pOpV5my83UusIHs8MbBi+KVXFpEk
         wWE8ADfVhZ3cnkJSEI3CHUYrl7L72RY09sII5JE/sZyf4DD++WwrYLL/JWqJzoN8ZTWy
         vUJRH1Sr7cUGAhBXUGiNOwNKjNhhWF9mScbLfYR/yxX71GLNB1LWJd4JrDCUfeH34/bD
         KOgg==
X-Gm-Message-State: AOJu0YyOHhzXC1q4GbhuQxv2VEWrJkBA+SrqsiY5mEXg3FY3cSpdHhp7
	CSBkp5P8V1XEiKPfhhYm6V3qfTcFriPU/VRdxFf5CplOhPwBYF0s3erQYey0YPbPEyQK55vclSk
	7vaaT/hk=
X-Gm-Gg: AfdE7cmRnuZqViWoBoj+xp4gA/BP9MgaSI/FIkx/lS293eDYN2PhUJNBRG8YBI3aOh0
	HvBbrHgDhff/E+5CECmcqhVEShmCCAvQe/ovidsFng0rg2cY2eOeN9acZQS9EMZ6ZE6b8z8j1ct
	yud2P72O64lQcv13LHj5oImQR4yZgWIsSGzFhvqkGcSO/cmbmPc0UKnveUClwRFZA+Vrz/iE4hG
	YEfeujZTIWzjJMmMQWn7jCqwKCKQz7LGGbT3DEGJhGLZmPIw2hxuJtmyYZJTI1nB4I0vE9jfYo3
	gnrEgW0vsUUM8HrwYCG9MpA4Twx5qk/7zn+Q0EpqQVBW2Le5bfpU2nGMEEnsdKG+44d89pG1iMv
	9hawC6p0JsM4V9CcTdSiO8xrfsBk1umvx2kmC1A0IpjOJ4ITfpFTgB/b2GxW4Xb5hpXmWI18HM2
	po25NzFtcpdF/vGErL97sM3HWVbQ==
X-Received: by 2002:a05:6000:2483:b0:46d:d6b2:395c with SMTP id ffacd0b85a97d-47abc8b7defmr8590363f8f.23.1783291361707;
        Sun, 05 Jul 2026 15:42:41 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/55] bluez5: Fix sending extra bytes with MGMT_OP_ADD_EXT_ADV_DATA
Date: Mon,  6 Jul 2026 00:40:52 +0200
Message-ID: <f4478e58293262cd4bf94bb1ce87aa06a468ecc9.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240156

From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>

MGMT_OP_ADD_EXT_ADV_DATA expects the command to be of struct mgmt_cp_add_ext_adv_data not mgmt_cp_add_advertising.

Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f143e23e2e378129d6eaaab912b701cc12cc044a)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...sending-extra-bytes-with-MGMT_OP_ADD.patch | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index c09a759244e..1600107b878 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -72,6 +72,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tools-Work-around-broken-stdin-handling-in-home-made.patch \
            file://0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch \
            file://0001-transport-Fix-set-volume-failure-with-invalid-device.patch \
+           file://0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch
new file mode 100644
index 00000000000..0a737413679
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch
@@ -0,0 +1,33 @@
+From b16441fbb7a24325f7c7d0c5ecedc88b46ddd439 Mon Sep 17 00:00:00 2001
+From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
+Date: Thu, 4 Jun 2026 17:32:27 +0800
+Subject: [PATCH] advertising: Fix sending extra bytes with
+ MGMT_OP_ADD_EXT_ADV_DATA
+
+MGMT_OP_ADD_EXT_ADV_DATA expects the command to be of size of
+struct mgmt_cp_add_ext_adv_data not mgmt_cp_add_advertising.
+
+Upstream-Status: Backport [2a6968b40378dca5650e18e03ad0407738c47be5]
+Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
+---
+ src/advertising.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/advertising.c b/src/advertising.c
+index 8970e65f7..0cb37d4ae 100644
+--- a/src/advertising.c
++++ b/src/advertising.c
+@@ -1487,8 +1487,7 @@ static void add_adv_params_callback(uint8_t status, uint16_t length,
+ 		}
+ 	}
+ 
+-	param_len = sizeof(struct mgmt_cp_add_advertising) + adv_data_len +
+-							scan_rsp_len;
++	param_len = sizeof(*cp) + adv_data_len + scan_rsp_len;
+ 
+ 	cp = malloc0(param_len);
+ 	if (!cp) {
+-- 
+2.43.0
+

