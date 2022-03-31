Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470DBC433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 19:38:23 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web09.1534.1648755502703040714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 12:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rSLla7a7;
 spf=pass (domain: linaro.org, ip: 209.85.160.178,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qt1-f178.google.com with SMTP id m21so399693qtw.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 12:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xEzVcJVBUdXuJGtOOj+7q6doX4z6BVx1Mc4f+D7oyXU=;
        b=rSLla7a7L7WY2cypWgaMwodSjBkcvn6ffNbQd1kErVXVezW2rz6CR4Pj7OzusYtT/S
         +yhYOjvkxoH6hiN/a5LvUZ6pFqmLwifC+RDFBzUH9Ki2dnM7aJY94LVcbLGvExe8RmxS
         LsQVYSZVKNbmpG8nv/QnPOMUyMxiQHZT8pr4Nb3neON+FBNcHRiC482SnE6ntthFxdSn
         NlWW1abCweedeQzAokNLWDyMeIq/jgMjvm7aLC3AZT3ovCgDa+vIbSTO8fGEDFahAOWP
         T6dhvw5LrXCbzjRh5e1uCV+jxo3r/LIdatFBqWfTBHZsl2gj/ggnccPIPuA3jQUVpE33
         /5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xEzVcJVBUdXuJGtOOj+7q6doX4z6BVx1Mc4f+D7oyXU=;
        b=GpaN6l7qSVodEl3nI9Vn2qoDWkkPoVPga4xLinpRhVGzY/DV/RLSiTCbwEJ5qTp03I
         CI1a4FATmvWorgpdnxZbz8jfsi7mv4ol2kEYpVeX6/OEG/W0CZqVauRQfXbowEZraXMH
         2dS85ZVJWKOa/+2aAaEhbvy/9kxa0JWVtKzq68PA3Op5WkMxRjC+AkRTaeGJdJlmbEkD
         gfHEiOhXoToP1Qa5cAvUOdOIeZLqz0XEfKi/G/VehiekbhPGb1tPaBpE5XrO0KATifIN
         VlXMoT2V8VSfTp/XW9p2MK2nVB0Xnr6BbQ4Ro7dY8svr1cju1X/A9K07Ct+4CpC38GYC
         odQg==
X-Gm-Message-State: AOAM533tM6mYJX1IfLcsx4J6yU2sqIrtEQ+3LRLxde+sw6lhK0b1ttwc
	q85dTpWPYvYadQ8a17P3vE6bh1bCRzt+KQ==
X-Google-Smtp-Source: 
 ABdhPJx9MePIEYjNZpD3GYe2iyX8ArSJh87tBn76Wn0BtWckfcoiaQH/VFAA5MFlv/8tRxCgycv7xw==
X-Received: by 2002:a05:622a:13d0:b0:2e1:cb3e:bb8a with SMTP id
 p16-20020a05622a13d000b002e1cb3ebb8amr5939635qtk.16.1648755501815;
        Thu, 31 Mar 2022 12:38:21 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 i68-20020a375447000000b006809e0adfffsm152443qkb.25.2022.03.31.12.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 12:38:21 -0700 (PDT)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH] bluez5: fix CVE-2022-0204
Date: Thu, 31 Mar 2022 15:38:19 -0400
Message-Id: <20220331193819.1623580-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 19:38:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163867

Fix heap overflow when appending prepare writes

The code shall check if the prepare writes would append more the
allowed maximum attribute length.

Upstream-Status: Backport [https://github.com/bluez/bluez/commit/591c546c536b42bef696d027f64aa22434f8c3f0]
CVE: CVE-2022-0204

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
Status on other branches:
- master/kirkstone 5.64 includes the fix
- honister         5.61 needs patch
- hardknott        5.56 needs patch

meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
.../bluez5/bluez5/CVE-2022-0204.patch         | 66 +++++++++++++++++++
2 files changed, 67 insertions(+)
create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2022-0204.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 7cf061dcf6..4d4348898a 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -55,6 +55,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
    file://CVE-2021-0129.patch \
    file://CVE-2021-3588.patch \
   file://CVE-2021-3658.patch \
+           file://CVE-2022-0204.patch \
    "
S = "${WORKDIR}/bluez-${PV}"

diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-0204.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-0204.patch
new file mode 100644
index 0000000000..646b5ddfc8
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-0204.patch
@@ -0,0 +1,66 @@
+From 0d328fdf6564b67fc2ec3533e3da201ebabcc9e3 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Tue, 8 Jun 2021 16:46:49 -0700
+Subject: [PATCH] shared/gatt-server: Fix heap overflow when appending prepare
+ writes
+
+The code shall check if the prepare writes would append more the
+allowed maximum attribute length.
+
+Fixes https://github.com/bluez/bluez/security/advisories/GHSA-479m-xcq5-9g2q
+
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/591c546c536b42bef696d027f64aa22434f8c3f0]
+Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
+CVE: CVE-2022-0204
+
+---
+ src/shared/gatt-server.c | 22 ++++++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+
+diff --git a/src/shared/gatt-server.c b/src/shared/gatt-server.c
+index 0c25a97..20e14bc 100644
+--- a/src/shared/gatt-server.c
++++ b/src/shared/gatt-server.c
+@@ -816,6 +816,20 @@ static uint8_t authorize_req(struct bt_gatt_server *server,
+ 						server->authorize_data);
+ }
+ 
++static uint8_t check_length(uint16_t length, uint16_t offset)
++{
++	if (length > BT_ATT_MAX_VALUE_LEN)
++		return BT_ATT_ERROR_INVALID_ATTRIBUTE_VALUE_LEN;
++
++	if (offset > BT_ATT_MAX_VALUE_LEN)
++		return BT_ATT_ERROR_INVALID_OFFSET;
++
++	if (length + offset > BT_ATT_MAX_VALUE_LEN)
++		return BT_ATT_ERROR_INVALID_ATTRIBUTE_VALUE_LEN;
++
++	return 0;
++}
++
+ static void write_cb(struct bt_att_chan *chan, uint8_t opcode, const void *pdu,
+ 					uint16_t length, void *user_data)
+ {
+@@ -846,6 +860,10 @@ static void write_cb(struct bt_att_chan *chan, uint8_t opcode, const void *pdu,
+ 				(opcode == BT_ATT_OP_WRITE_REQ) ? "Req" : "Cmd",
+ 				handle);
+ 
++	ecode = check_length(length, 0);
++	if (ecode)
++		goto error;
++
+ 	ecode = check_permissions(server, attr, BT_ATT_PERM_WRITE_MASK);
+ 	if (ecode)
+ 		goto error;
+@@ -1353,6 +1371,10 @@ static void prep_write_cb(struct bt_att_chan *chan, uint8_t opcode,
+ 	util_debug(server->debug_callback, server->debug_data,
+ 				"Prep Write Req - handle: 0x%04x", handle);
+ 
++	ecode = check_length(length, offset);
++	if (ecode)
++		goto error;
++
+ 	ecode = check_permissions(server, attr, BT_ATT_PERM_WRITE_MASK);
+ 	if (ecode)
+ 		goto error;
-- 
2.25.1


