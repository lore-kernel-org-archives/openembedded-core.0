Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E02AC48BE5
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:43 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.30306.1649039465539727160
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 19:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=x4StOIJH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so7695432pjk.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 19:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=K9mm3IrQj24FH6lS+k5mGuT+NSj/Ogd5s/v1ZDUeVTI=;
        b=x4StOIJHSKxMPf0tXucl3+CvpyyG09J3sCVpXxK9Hdj3M/TCx901jSvRwqA7yG7v2K
         B3RsqA2pEK+mezt9r1ujynha41EEAahzEbn/pm8/d4zJzYaI9Cjqk4CnUkiC2J7YqGhV
         jGO/1azToxtSAKjqROAwRWA8eLKAUBz4oFWbaCtGsF1HkQrqyzCVGBsj9ZdXCMkDlyrW
         yZ6/2cafe+aFryoKjbx4adCpMnCTnm1mwzCqLV1JRAMA+IQoxWj6MxTZbuBBWtToAlAy
         63BIArQ3W6A9U8Qb/EZn5YZuvf/QtrP7g/29jyNYIFsNcITPKCvm1ByvHtDfBMhQisDc
         nXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K9mm3IrQj24FH6lS+k5mGuT+NSj/Ogd5s/v1ZDUeVTI=;
        b=BIgmoJtPDKv+YXE93BaXJ/1qTP+OSjnS6V67lBMXxh/xy3g6/N+iuAuOZAAceQkXrL
         rEMBBY9LMOQ8aeiwwYmx3Lmp4kG/h33H1INS4egiOzE+dSaT6xZPyTp6r097RvxkMahs
         w3KTfuJAToStYQmwfhVeiOd7cVl8ZDpTvnlSCrIZIwOpG3ELu9MFNOyWs2FwzOQAQDfc
         ufGTQ229Ay6hX2NIDJAo3Hd7IgmJk7agsqvseertpBfwKdMaL4DaWGxKFGHL243TJ8Yq
         rod2jqjczAdN4RPy1iMafJ9SOTQptMEheEU5M3Hx1vBq0UgYUVShi2bZltd5jV7192Ky
         f+DA==
X-Gm-Message-State: AOAM5332JENKmem5w+y7uveWAYLqyZ7qytx4XmkgUWcFCHulrvTCqhQl
	9oG9f3yNLzjTfohwo5uFJo44Tya3l67p58uwJt0=
X-Google-Smtp-Source: 
 ABdhPJxkMaHniuHew23HIYanYYNUMHWeqhEtH9H4RqW1VA2cLkPt54s+0zdAv1jAqGnaMV9R4m9+wQ==
X-Received: by 2002:a17:902:7ec1:b0:156:17a4:a2f8 with SMTP id
 p1-20020a1709027ec100b0015617a4a2f8mr21481098plb.155.1649039464691;
        Sun, 03 Apr 2022 19:31:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p26-20020a63951a000000b003826aff3e41sm8471117pgd.33.2022.04.03.19.31.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 19:31:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/8] bluez5: fix CVE-2022-0204
Date: Sun,  3 Apr 2022 16:30:24 -1000
Message-Id: 
 <7ee504b8381a1f2b385aa4e0ed7b99ea662d6535.1649026624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649026624.git.steve@sakoman.com>
References: <cover.1649026624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163975

From: Ralph Siemsen <ralph.siemsen@linaro.org>

Fix heap overflow when appending prepare writes

The code shall check if the prepare writes would append more the
allowed maximum attribute length.

Upstream-Status: Backport [https://github.com/bluez/bluez/commit/591c546c536b42bef696d027f64aa22434f8c3f0]
CVE: CVE-2022-0204

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
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


