Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4CDC433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 01:13:37 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web08.5344.1648775616177793700
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 18:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nb+9nrc8;
 spf=pass (domain: linaro.org, ip: 209.85.160.182,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qt1-f182.google.com with SMTP id t19so1051987qtc.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 18:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VLx+bA9Ku+ZYCE4wKEmrFW5KQhaDGeJNFYC8g3RILfc=;
        b=nb+9nrc8trVj30JKjt6JdUE4zxCsBtg9HD6OJ5pM3aFx3hU6BAcatpgd8DzyoqO32I
         8uyHfLQfFMKJf6A+UXAIitgdV+f4naf85ralKrSortwQt1Bmi8F4/YfP4Uwm4J7qbMdx
         +nYIpsMajDMz6H0qDZ3mFagFHkKmG1Po/S8aSS1VJFgxrglgNjAifEBqUw0+diE7SzUZ
         BPqmdruVT+MWbCPGWzcHAm85Vco7lp66/fi+G5m2aR40U1De3d3rE78LzlBLzU3SsDDC
         RerTaboeSUuTh3JIn5z4A2bsdFaHN4eTozwkUOUfr6bR8Khe+i7oDx6eFCb32anWd6wi
         V/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VLx+bA9Ku+ZYCE4wKEmrFW5KQhaDGeJNFYC8g3RILfc=;
        b=juukAryTkSu8DUMYC5bYEC+bPyhcAPt1ABjmfszEnmBUW5RutjewRART3WIDuUeIXE
         E8FnQePTC5gKSuOPgA8CKotAobxZasLZ/n9S0uo2xbUxnyPDjEs8TT0Fl4X8zsgadb7f
         XBgcaWVxu/u7ErcCxJ0gvklWnVdGX54Btqu1UKBTtn05Zi/+wx62hAJsiO4eECXAvN+S
         iJ6e9iJjxsq+yy3RykifPFePpq7PshwDQxn/79Nd5ZtMHgv0LwfLTCtQjD/nuPGvFIW9
         kuUD8fR0XV/xLQGaYKI0M4MIR8Q4QxEisozG9thNotxKNkYtqi5CU8fR55XeiBBxf8bU
         fcEw==
X-Gm-Message-State: AOAM531e3APAGYJeqE0DqR82cv6enXgcuPrK4lT4aGXe/cmABzyNAJz7
	yo88/zj2ic71EbudfAqRurhgbqP1u8XRGw==
X-Google-Smtp-Source: 
 ABdhPJyWWhJcmsAHwkH8onTCU5/hpmW4D8TgHpIQgk0bOTHEUrXPp0CTSucWfXb6A8S8pSmgDTkrjw==
X-Received: by 2002:ac8:5944:0:b0:2e2:e4b:f4b6 with SMTP id
 4-20020ac85944000000b002e20e4bf4b6mr6741321qtz.89.1648775615209;
        Thu, 31 Mar 2022 18:13:35 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 21-20020ac85715000000b002e1ce9605ffsm801639qtw.65.2022.03.31.18.13.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 18:13:34 -0700 (PDT)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH v2] bluez5: fix CVE-2022-0204
Date: Thu, 31 Mar 2022 21:13:33 -0400
Message-Id: <20220401011333.1770802-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331193819.1623580-1-ralph.siemsen@linaro.org>
References: <20220331193819.1623580-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 01:13:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163877

Fix heap overflow when appending prepare writes

The code shall check if the prepare writes would append more the
allowed maximum attribute length.

Upstream-Status: Backport [https://github.com/bluez/bluez/commit/591c546c536b42bef696d027f64aa22434f8c3f0]
CVE: CVE-2022-0204

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
v2: fix accidental patch damage

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


