Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB882C6FA8E
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 02:06:12 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.5837.1664417166126105433
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 19:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KYa6GcJ0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d24so28615pls.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 19:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=94R1jo4fWxpJGCI9+pnKvHny4G9k3lufm5o/fFh2U8k=;
        b=KYa6GcJ0MNxFQuUP43Ht0nT7Nmy0REbFUarvtmM9b1AygSK75f8koEItQ9JefbtTbK
         2rCyCQlCGDLzkzBPLJ5zAomJ5I1SZm2qqLVudv5qfz79Byqw07CATwq/S+J7PR3kuUrv
         w8zpUoy6v61lpehjbnExIQNQl5T3osFAsVPsw7PfTkkUmr3okOHZLI8ZyOQUp6Owq9Wo
         tJaGTDSIACMQm7zr11zqeIBx2aFUNdAUTBM59birhUshGJ2m62oL4cs2SmmW8wbD0gDO
         r8OvSBWtjemy9c88gNUr4pl039E01qSVPKQtzyTSJYeEYjmi1QWAnrQpJ0tZN4X6qIYI
         7iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=94R1jo4fWxpJGCI9+pnKvHny4G9k3lufm5o/fFh2U8k=;
        b=5eitZrp2mQrIUubmEUMzSChelQ2LCU/ov8IiGPP/XaXty9lCzw7sntQOv7wLznhS9r
         2rqEA23HkdziYO701TzlsI3Sjw0oDrnSwNl1J5PRU+EI7k+NNAAG06etmIowu2K8hEoc
         Tyg71Q//IQK45w2Qo/id8O4xADSMh7t9ASJWsL8Uc9xJ6oKtqMqlohuAhKYZncX33+9v
         MbhW3/l9aA+q1cuXjGMxV/d30Orb7lCKx0yXl0+RTgPQzA++RQzsoM5OTL4Eq/jTPXlj
         71gNM61r4VAWxluG1BySx2HdB7Y1oCnzzAJI76OJ3mohQ9z4wd62vK2YYge69HsNiQHk
         w3Bw==
X-Gm-Message-State: ACrzQf3EUdvLVjucGwzHysOKf6g+cHsrbYOhT2Vfz8uujr8NWPJ5doo+
	I2YEvt4lawSP8kGo9UILbDUiGfIrWnHS4Dcc
X-Google-Smtp-Source: 
 AMsMyM45DesjJ31BVluJQ6TbganXhMwFKlBLMXfx6dPEPYMkZiW69YFuBa1z4Db9iIGdVkP01hI50Q==
X-Received: by 2002:a17:902:f78c:b0:17a:ef1:e902 with SMTP id
 q12-20020a170902f78c00b0017a0ef1e902mr953767pln.5.1664417164896;
        Wed, 28 Sep 2022 19:06:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x1-20020a1709027c0100b0017680faa1a8sm4464214pll.112.2022.09.28.19.06.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 19:06:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/3] bluez: CVE-2022-39176 BlueZ allows physically
 proximate attackers
Date: Wed, 28 Sep 2022 16:05:50 -1000
Message-Id: 
 <3750b576035d87633c69c0a5fc6de4854179f9b0.1664417041.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664417041.git.steve@sakoman.com>
References: <cover.1664417041.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 02:06:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171161

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/1977968
MR: 122140
Type: Security Fix
Disposition: Backport from https://launchpad.net/ubuntu/+source/bluez/5.53-0ubuntu3.6
ChangeID: b989c7670a9b2bd1d11221e981eab0d162f3271c
Description:
	 CVE-2022-39176 bluez: BlueZ allows physically proximate attackers to obtain sensitive information because profiles/audio/avrcp.c does not validate params_len.
Affects "bluez < 5.59"

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 .../bluez5/bluez5/CVE-2022-39176.patch        | 126 ++++++++++++++++++
 2 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2022-39176.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 4d4348898a..eaac9ee849 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -56,6 +56,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://CVE-2021-3588.patch \
           file://CVE-2021-3658.patch \
            file://CVE-2022-0204.patch \
+           file://CVE-2022-39176.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-39176.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-39176.patch
new file mode 100644
index 0000000000..7bd1f5f80f
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-39176.patch
@@ -0,0 +1,126 @@
+From 752c7f707c3cc1eb12eadc13bc336a5c484d4bdf Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 28 Sep 2022 10:45:53 +0530
+Subject: [PATCH] CVE-2022-39176
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/bluez/5.53-0ubuntu3.6]
+CVE: CVE-2022-39176
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ profiles/audio/avdtp.c | 56 +++++++++++++++++++++++++++---------------
+ profiles/audio/avrcp.c |  8 ++++++
+ 2 files changed, 44 insertions(+), 20 deletions(-)
+
+diff --git a/profiles/audio/avdtp.c b/profiles/audio/avdtp.c
+index 782268c..0adf413 100644
+--- a/profiles/audio/avdtp.c
++++ b/profiles/audio/avdtp.c
+@@ -1261,43 +1261,53 @@ struct avdtp_remote_sep *avdtp_find_remote_sep(struct avdtp *session,
+ 	return NULL;
+ }
+ 
+-static GSList *caps_to_list(uint8_t *data, int size,
++static GSList *caps_to_list(uint8_t *data, size_t size,
+ 				struct avdtp_service_capability **codec,
+ 				gboolean *delay_reporting)
+ {
++	struct avdtp_service_capability *cap;
+ 	GSList *caps;
+-	int processed;
+ 
+ 	if (delay_reporting)
+ 		*delay_reporting = FALSE;
+ 
+-	for (processed = 0, caps = NULL; processed + 2 <= size;) {
+-		struct avdtp_service_capability *cap;
+-		uint8_t length, category;
++	if (size < sizeof(*cap))
++		return NULL;
++
++	for (caps = NULL; size >= sizeof(*cap);) {
++		struct avdtp_service_capability *cpy;
+ 
+-		category = data[0];
+-		length = data[1];
++		cap = (struct avdtp_service_capability *)data;
+ 
+-		if (processed + 2 + length > size) {
++		if (sizeof(*cap) + cap->length > size) {
+ 			error("Invalid capability data in getcap resp");
+ 			break;
+ 		}
+ 
+-		cap = g_malloc(sizeof(struct avdtp_service_capability) +
+-					length);
+-		memcpy(cap, data, 2 + length);
++		if (cap->category == AVDTP_MEDIA_CODEC &&
++					cap->length < sizeof(**codec)) {
++			error("Invalid codec data in getcap resp");
++			break;
++		}
++
++		cpy = btd_malloc(sizeof(*cpy) + cap->length);
++		memcpy(cpy, cap, sizeof(*cap) + cap->length);
+ 
+-		processed += 2 + length;
+-		data += 2 + length;
++		size -= sizeof(*cap) + cap->length;
++		data += sizeof(*cap) + cap->length;
+ 
+-		caps = g_slist_append(caps, cap);
++		caps = g_slist_append(caps, cpy);
+ 
+-		if (category == AVDTP_MEDIA_CODEC &&
+-				length >=
+-				sizeof(struct avdtp_media_codec_capability))
+-			*codec = cap;
+-		else if (category == AVDTP_DELAY_REPORTING && delay_reporting)
+-			*delay_reporting = TRUE;
++		switch (cap->category) {
++		case AVDTP_MEDIA_CODEC:
++			if (codec)
++				*codec = cpy;
++			break;
++		case AVDTP_DELAY_REPORTING:
++			if (delay_reporting)
++				*delay_reporting = TRUE;
++			break;
++		}
+ 	}
+ 
+ 	return caps;
+@@ -1494,6 +1504,12 @@ static gboolean avdtp_setconf_cmd(struct avdtp *session, uint8_t transaction,
+ 					&stream->codec,
+ 					&stream->delay_reporting);
+ 
++	if (!stream->caps || !stream->codec) {
++		err = AVDTP_UNSUPPORTED_CONFIGURATION;
++		category = 0x00;
++		goto failed_stream;
++	}
++
+ 	/* Verify that the Media Transport capability's length = 0. Reject otherwise */
+ 	for (l = stream->caps; l != NULL; l = g_slist_next(l)) {
+ 		struct avdtp_service_capability *cap = l->data;
+diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
+index d9471c0..0233d53 100644
+--- a/profiles/audio/avrcp.c
++++ b/profiles/audio/avrcp.c
+@@ -1916,6 +1916,14 @@ static size_t handle_vendordep_pdu(struct avctp *conn, uint8_t transaction,
+ 		goto err_metadata;
+ 	}
+ 
++	operands += sizeof(*pdu);
++	operand_count -= sizeof(*pdu);
++
++	if (pdu->params_len != operand_count) {
++		DBG("AVRCP PDU parameters length don't match");
++		pdu->params_len = operand_count;
++	}
++
+ 	for (handler = session->control_handlers; handler->pdu_id; handler++) {
+ 		if (handler->pdu_id == pdu->pdu_id)
+ 			break;
+-- 
+2.25.1
+
-- 
2.25.1


