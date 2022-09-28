Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D12C04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 06:03:36 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.4667.1664345012830122969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 23:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FWeA0STc;
 spf=pass (domain: mvista.com, ip: 209.85.215.175,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f175.google.com with SMTP id bh13so11338830pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 23:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=8RtFOP8yTRgjKwF2hE8CDaHbu8PTtEsFijU0cWzp3wU=;
        b=FWeA0STcdBaqZ8D91syP241jTDffOvJHKiokEKldWxovk1o6FYL6nPtFFbww/5rCP2
         w0rchG6OZ+hugKoj2UBP8Wx0Ltiq0si+JV5y24AEN5fFaEAIr5RX0K8QL6YmR3SW7/zh
         SVgENt8ocZpHQxTyhwzxzPRn9TjzR8u3nhdOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=8RtFOP8yTRgjKwF2hE8CDaHbu8PTtEsFijU0cWzp3wU=;
        b=fanZorjn/bBo+77tRfhkYPAwhYh4uLBUiDXQlERXHrJKrFJ4mxvkb1Xu9vSj8Umzod
         E7QgU0L8ElK5bFj75rnJyw5zo/2gFYvj3sC4npoWdsJVeQ/ftZ1Y1TX+4vpmb1/V+WU9
         T86pvNkxLv4z0vcZAyxjg+7cwTgn5vTqUWhe4Y5/8IReYZX6hGZIo3e2Hj1sjRivo7RN
         4xMHmcOjgfRVWdACR0/Qs04+TZ21r9ePnqmYjnFfZwNNCLJAQ0Ck5ugNaH3+ASBQPwvh
         ZLFs3akHVgDHji5GvIs/aKuNa5wg2oQXK7KFRlGaY44XDGZOCCUh4jsJPg3fW7pKs0YC
         nFSg==
X-Gm-Message-State: ACrzQf0TwLWauefMVaFeGfYe+ZPdehRlref4Nbu0FtepeV+b3GmOKiWC
	5V4ma1Mj3Gjsf2fpbckeJx29MYkVRNdkBw==
X-Google-Smtp-Source: 
 AMsMyM6BF4fS3RGGrDy1EddL+SZLJTpIF6P5Yz6rySVxbSLRC4jMo+adzHGN+6A+/DKDg9iVCRFJQw==
X-Received: by 2002:a05:6a00:2488:b0:540:e5e5:ba48 with SMTP id
 c8-20020a056a00248800b00540e5e5ba48mr33142596pfv.51.1664345011828;
        Tue, 27 Sep 2022 23:03:31 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.172])
        by smtp.gmail.com with ESMTPSA id
 r11-20020aa7988b000000b00540d75197f2sm3013696pfl.143.2022.09.27.23.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 23:03:31 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Wed, 28 Sep 2022 11:33:25 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] bluez: CVE-2022-39176 BlueZ allows physically
 proximate attackers
Date: Wed, 28 Sep 2022 11:33:24 +0530
Message-Id: <20220928060324.33519-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 06:03:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171139

Source: https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/1977968
MR: 122140
Type: Security Fix
Disposition: Backport from https://launchpad.net/ubuntu/+source/bluez/5.53-0ubuntu3.6
ChangeID: b989c7670a9b2bd1d11221e981eab0d162f3271c
Description:
	 CVE-2022-39176 bluez: BlueZ allows physically proximate attackers to obtain sensitive information because profiles/audio/avrcp.c does not validate params_len.
Affects "bluez < 5.59"

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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


