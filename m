Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF1ECFA46B
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 14:40:08 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15716.1763908803060913134
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Nov 2025 06:40:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AbAxL4dk;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47789cd2083so20192535e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Nov 2025 06:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763908801; x=1764513601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mdf6LtrhaHWa5aUFrSQohIdQ9OwMRjO8bZ1IFqnxYaw=;
        b=AbAxL4dkBz67LXggkqMBn7G2czIxcAsbiHaxt4BZ6c4/qLJZ4wkFJGw6BUGvlANBMt
         cjuO7LPO/yrO/fPiZWjJ6ZLRJ+8Sov9oOCJbvQvz8PnQ7URzwqQFyUiIgq5tkwf7aUE6
         J8RzKeivPdXw+8buslxD47uxBaNW8toOul0XqW6UmPtwEoFhE60aKZ70x38JmXWRp5x8
         SMe7Gtk6sC+xBRmtvviuOuvTg4brRM5ro0nS69ITZUcFBvtkLH1WjBd9CVJH1BSvQMDJ
         924ZDY+ibq4h7dWYH1tcmVDFpod8Cpy+i8gS340/RE1mpV/rLeI2YBmElTmTJswiAd8U
         zRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763908801; x=1764513601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mdf6LtrhaHWa5aUFrSQohIdQ9OwMRjO8bZ1IFqnxYaw=;
        b=RrtRuFfTVSV8OFUsbAyDfjnMqhNF7Sfr1EEU0GTjRyHauwIjtULZvRgwDNqWFVf1EU
         ktgINDkvhQsWNWopeiezl6cUyMFiGe1G+FrevzLee4feVSrUvWF+f+f0jErafVvPqAx5
         omWuDBU31qtfdJ/dX9cw5fdnOsi3jEL49ETgx93WBf/5uxkK/s1Zr+pkDHSFBHzN3dZI
         irOuz/lc0r5qCKBEGAe4ZJInuKVJIQO8Hu71vvPrKfNeMBab43m3P2je1zvE6DWIO1Dq
         aRJW75Ep1TOrCIRmZhumJu/Y6e++wNmMoGRVo/z4zN79U+hodAdtjKx5fkfMYjIL2a3U
         yDCA==
X-Gm-Message-State: AOJu0YyCIGmYFmq4UJI87fbvik6A/5KNnYKU8HCZg9orkqy6tMn0klPz
	yDGi0AYJlzjGCB3KAldUhfpoIcLDEeIA27Lygi64yuHLFpC54p9oNvHpQXB8cQ==
X-Gm-Gg: ASbGnctxRAtum4P8h55p6tZZAaQy3vSBBILQSDyq0xjLLWmc2gRqaMf/+sEpJYsR7p+
	oYfKuOiuknhZWK72I+gF7N+s7bxOCRi1MqkWtPKKLArcmR79439fdBFNdhm+s/w1+GX4IaiPimN
	mxZsw+7wJHj/LomJBfv270pBfnfnElLXGdrDN2EsCwP01q2cr3EbJN6Lmqj5utSW1GnE9K7i8a+
	u/1nbXm108GWekO5SOd/SaCuEcqKScwXrD8Mow18JtJHpEm3zNvRF3jK5VH/JOPh6ChKVTHzLMX
	FK7yxnkvVD9ZDL1JD1rmQ9LwI9ZvlpkPxv7gNUeuG70zGQesInVk7zp6IGvgWd3B31XIKKtvkP8
	eqd4Yb+zSUK55XkmRS4y03TXiqrdzdpR/zyc2vV67a1gm+q7Hv74eSkbD4Pjtaf1Dz8NTg0gyEH
	8zBIrPZa3nH3twU6ALntR1kojdV62XlkX4iqw=
X-Google-Smtp-Source: AGHT+IEZiq3+obkjNNifBAjOoI3lkzG9/q4Uo1NFlNBFEeyPR+Ls1FEWlg4LxoCsZPlFK6aA8mT64g==
X-Received: by 2002:a05:600c:1c82:b0:477:9650:3175 with SMTP id 5b1f17b1804b1-477c1057310mr103967525e9.0.1763908800709;
        Sun, 23 Nov 2025 06:40:00 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9741cbfsm127775525e9.6.2025.11.23.06.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 06:40:00 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] bluez5: upgrade 5.84 -> 5.85
Date: Sun, 23 Nov 2025 14:39:46 +0000
Message-ID: <20251123143946.3445210-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Nov 2025 14:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226727

Changelog:
- Fix issue with handling display of battery charge level.
- Fix issue with BASS permissions not requiring encryption.
- Fix issue with handling abort for OBEX SRM operation.
- Fix issue with handling device privacy.
- Add support for HFP call answer support.
- Add support for HFP simple 3-way call support.

Full changelog:
https://github.com/bluez/bluez/compare/5.84...5.85

----
Other notes:
- A new testing tool is added called 6lowpan-tester
- A patch is removed since it is included in the 5.85 release

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 -
 ...-fix-pac_config_cb-error-code-return.patch | 29 -------------------
 .../bluez5/{bluez5_5.84.bb => bluez5_5.85.bb} |  3 +-
 3 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-media-fix-pac_config_cb-error-code-return.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.84.bb => bluez5_5.85.bb} (93%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index aac38a54a9..24a41f92df 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -64,7 +64,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://init \
            file://run-ptest \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
-           file://0001-media-fix-pac_config_cb-error-code-return.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-media-fix-pac_config_cb-error-code-return.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-media-fix-pac_config_cb-error-code-return.patch
deleted file mode 100644
index a67fd07137..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-media-fix-pac_config_cb-error-code-return.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From d7966dbb7bcf39f9615c906c47ef7ad895796756 Mon Sep 17 00:00:00 2001
-From: Pauli Virtanen <pav@iki.fi>
-Date: Thu, 18 Sep 2025 20:19:35 +0300
-Subject: [PATCH] media: fix pac_config_cb() error code return
-
-Fixes: a887b1a1b91f ("audio: Add support for specific error codes for A2DP configuration")
-
-Upstream-Status: Backport [https://github.com/bluez/bluez/commit/6b0a08776ae44a9102d7c6875a77e83dc6a11a37]
-Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
----
- profiles/audio/media.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/profiles/audio/media.c b/profiles/audio/media.c
-index 332f643bb..deb321e6c 100644
---- a/profiles/audio/media.c
-+++ b/profiles/audio/media.c
-@@ -1110,7 +1110,7 @@ static void pac_config_cb(struct media_endpoint *endpoint, void *ret, int size,
- 	if (!transport)
- 		return;
- 
--	data->cb(data->stream, error_code == 0 ? 0 : -EINVAL);
-+	data->cb(data->stream, (error_code && *error_code == 0) ? 0 : -EINVAL);
- }
- 
- static struct media_transport *pac_ucast_config(struct bt_bap_stream *stream,
--- 
-2.43.0
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.84.bb b/meta/recipes-connectivity/bluez5/bluez5_5.85.bb
similarity index 93%
rename from meta/recipes-connectivity/bluez5/bluez5_5.84.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.85.bb
index 874db9df64..d8965fef4b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.84.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.85.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "5ba73d030f7b00087d67800b0e321601aec0f892827c72e5a2c8390d8c886b11"
+SRC_URI[sha256sum] = "ad028e49254bc4551a13f08fe7904c63d02ba650d77be8ae15bb3b0a0ad94a6f"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
@@ -35,6 +35,7 @@ NOINST_TOOLS_TESTING ?= " \
     tools/iso-tester \
     tools/mesh-tester \
     tools/ioctl-tester \
+    tools/6lowpan-tester \
 "
 
 # noinst programs in Makefile.tools that are conditional on TOOLS
-- 
2.43.0


