Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E39C282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:42 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.31787.1742141553106386246
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PQ3FfDHH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394036c0efso7980215e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141551; x=1742746351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tqVqeDboEI2ignamM2KEX+HDSpyuJotYjCvhBLFQ8gI=;
        b=PQ3FfDHHgNOeUdFtKisgJLqDHJAM3863Nwo0n60R1Y34zT2FtiayirOiN9X5QU4ifB
         7reUi8khNutcAgzAxaV9DuVLq4V8EGQoX3KGXkxS/oEMBYUMgLHVWm2MfqXFf9cy5mII
         gS5utW9MmM6uHaFvJJjvgtRmTVl6GuCh2RjgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141551; x=1742746351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqVqeDboEI2ignamM2KEX+HDSpyuJotYjCvhBLFQ8gI=;
        b=RWxapyqNRIi6gBlg8tE9zHEcweCpiA/2u5DPIZ1enL2CtkDE5IVgQ48o21Y3Hn6ABP
         RFiv+4YQddUSpXtpc+SvNCq+LHO/ja1Bd/1m3dXLOPKlPDGmHtU8UZBXVc77BzhoRNT9
         qXY0lJO9EdoGjOjZGD8VCW7sHAY3Cy4e4jYTkRrLXp8+Jup+crKqroYzxWq9dtZo4kR7
         e73ldyV58WrRJIVjJ7D078kR0fUckpIvQdhsBPaEGf+CUh6u1fqBsl1rYR183deUs3b2
         cNdItOdS3hTzxzcDlZiW8B/wVoUqNH1IdRwb0koMJyBi8RDXNVbR/WFIaQ4aI/V7RpeP
         8D0A==
X-Gm-Message-State: AOJu0YwnhsbN2xki4ZTF6haVw8/SAkDX0DsqfMrxljOVU8zyouI1YZqm
	QsycHafACIxhYt4ZvuPuWcvfCuv9w7gX6Go8NcNZ7/D1AIfciezLEyzY+5ujxyGwSvZYEgMK+82
	4
X-Gm-Gg: ASbGncuCDryT7YNvmhKPqSyRP0HiwbHKzSvHne1gdGut8ATUuBVDHc53FJpTK/gzpob
	h32irXmWGP9zh8kr3mdYuGyV7jWBB5VM5I/RKENKtgte36Z4D78HAWfe7ezUoY/xMHfoO2fkqeB
	tTnqIECl2gHYOO2hC6yiGfIRvEPuiCA/W4/KFRj+SabikIGEjaGhIdX9hXgvOSLidvbkgIafQUY
	3lljPpRFasViHmCUKR4YYhrZWUknTZQoUE6ngKZLOcDsKaLad4s4BV+rF8Aauw9hBZfS4uBe/y/
	11A4hsXsJWF5TTfOIr5k7z09bTH4WoTBk/+7Wb2rEgaMYjIKprwCC46dXcGwmislMON4nvrARw=
	=
X-Google-Smtp-Source: AGHT+IFnqvLWNkg5BMgHYRd+dPJ9bu28vBjBrs3STfLH2srFxnB2Id9qZKMFLkri+Bbr3NWDTsAy6w==
X-Received: by 2002:a05:600c:524c:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-43d1ecca1f8mr94403995e9.23.1742141550766;
        Sun, 16 Mar 2025 09:12:30 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/43] ofono: upgrade 2.14 -> 2.15
Date: Sun, 16 Mar 2025 16:11:41 +0000
Message-ID: <20250316161209.3629986-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213018

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ofono/ofono/CVE-2024-7539.patch           | 88 -------------------
 ...024-7540_CVE-2024-7541_CVE-2024-7542.patch | 52 -----------
 .../ofono/ofono/rmnet.patch                   | 45 ----------
 .../ofono/{ofono_2.14.bb => ofono_2.15.bb}    | 12 +--
 4 files changed, 4 insertions(+), 193 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/rmnet.patch
 rename meta/recipes-connectivity/ofono/{ofono_2.14.bb => ofono_2.15.bb} (84%)

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch
deleted file mode 100644
index e41596959bd..00000000000
--- a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 389e2344f86319265fb72ae590b470716e038fdc Mon Sep 17 00:00:00 2001
-From: Sicelo A. Mhlongo <absicsz@gmail.com>
-Date: Tue, 17 Dec 2024 11:31:29 +0200
-Subject: [PATCH] ussd: ensure ussd content fits in buffers
-
-Fixes: CVE-2024-7539
-
-CVE: CVE-2024-7539
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=389e2344f86319265fb72ae590b470716e038fdc]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- drivers/atmodem/ussd.c      | 5 ++++-
- drivers/huaweimodem/ussd.c  | 5 ++++-
- drivers/speedupmodem/ussd.c | 5 ++++-
- 3 files changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/drivers/atmodem/ussd.c b/drivers/atmodem/ussd.c
-index 32a9fe9..99da559 100644
---- a/drivers/atmodem/ussd.c
-+++ b/drivers/atmodem/ussd.c
-@@ -93,7 +93,7 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
-	const char *content;
-	int dcs;
-	enum sms_charset charset;
--	unsigned char msg[160];
-+	unsigned char msg[160] = {0};
-	const unsigned char *msg_ptr = NULL;
-	long msg_len;
-
-@@ -113,6 +113,9 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
-	if (!g_at_result_iter_next_number(&iter, &dcs))
-		dcs = 0;
-
-+	if (strlen(content) > sizeof(msg) * 2)
-+		goto out;
-+
-	if (!cbs_dcs_decode(dcs, NULL, NULL, &charset, NULL, NULL, NULL)) {
-		ofono_error("Unsupported USSD data coding scheme (%02x)", dcs);
-		status = 4; /* Not supported */
-diff --git a/drivers/huaweimodem/ussd.c b/drivers/huaweimodem/ussd.c
-index 5e1c907..3d165c8 100644
---- a/drivers/huaweimodem/ussd.c
-+++ b/drivers/huaweimodem/ussd.c
-@@ -38,7 +38,7 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
-	int status;
-	int dcs = 0;
-	const char *content;
--	unsigned char msg[160];
-+	unsigned char msg[160] = {0};
-	const unsigned char *msg_ptr = NULL;
-	long msg_len;
-
-@@ -55,6 +55,9 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
-
-	g_at_result_iter_next_number(&iter, &dcs);
-
-+	if (strlen(content) > sizeof(msg) * 2)
-+		goto out;
-+
-	msg_ptr = decode_hex_own_buf(content, -1, &msg_len, 0, msg);
-
- out:
-diff --git a/drivers/speedupmodem/ussd.c b/drivers/speedupmodem/ussd.c
-index aafa4bc..a5efde0 100644
---- a/drivers/speedupmodem/ussd.c
-+++ b/drivers/speedupmodem/ussd.c
-@@ -37,7 +37,7 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
-	int status;
-	int dcs = 0;
-	const char *content;
--	unsigned char msg[160];
-+	unsigned char msg[160] = {0};
-	const unsigned char *msg_ptr = NULL;
-	long msg_len;
-
-@@ -54,6 +54,9 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
-
-	g_at_result_iter_next_number(&iter, &dcs);
-
-+	if (strlen(content) > sizeof(msg) * 2)
-+		goto out;
-+
-	msg_ptr = decode_hex_own_buf(content, -1, &msg_len, 0, msg);
-
- out:
---
-2.40.0
diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch
deleted file mode 100644
index fd97d4b51ba..00000000000
--- a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 29ff6334b492504ace101be748b256e6953d2c2f Mon Sep 17 00:00:00 2001
-From: "Sicelo A. Mhlongo" <absicsz@gmail.com>
-Date: Tue, 17 Dec 2024 11:31:28 +0200
-Subject: [PATCH] atmodem: sms: ensure buffer is initialized before use
-
-Fixes: CVE-2024-7540
-Fixes: CVE-2024-7541
-Fixes: CVE-2024-7542
-
-CVE: CVE-2024-7540
-CVE: CVE-2024-7541
-CVE: CVE-2024-7542
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=29ff6334b492504ace101be748b256e6953d2c2f]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- drivers/atmodem/sms.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/drivers/atmodem/sms.c b/drivers/atmodem/sms.c
-index d994856b..0668c631 100644
---- a/drivers/atmodem/sms.c
-+++ b/drivers/atmodem/sms.c
-@@ -399,7 +399,7 @@ static void at_cmt_notify(GAtResult *result, gpointer user_data)
- 	struct sms_data *data = ofono_sms_get_data(sms);
- 	GAtResultIter iter;
- 	const char *hexpdu;
--	unsigned char pdu[176];
-+	unsigned char pdu[176] = {0};
- 	long pdu_len;
- 	int tpdu_len;
- 
-@@ -466,7 +466,7 @@ static void at_cmgr_notify(GAtResult *result, gpointer user_data)
- 	struct sms_data *data = ofono_sms_get_data(sms);
- 	GAtResultIter iter;
- 	const char *hexpdu;
--	unsigned char pdu[176];
-+	unsigned char pdu[176] = {0};
- 	long pdu_len;
- 	int tpdu_len;
- 
-@@ -648,7 +648,7 @@ static void at_cmgl_notify(GAtResult *result, gpointer user_data)
- 	struct sms_data *data = ofono_sms_get_data(sms);
- 	GAtResultIter iter;
- 	const char *hexpdu;
--	unsigned char pdu[176];
-+	unsigned char pdu[176] = {0};
- 	long pdu_len;
- 	int tpdu_len;
- 	int index;
--- 
-2.30.2
-
diff --git a/meta/recipes-connectivity/ofono/ofono/rmnet.patch b/meta/recipes-connectivity/ofono/ofono/rmnet.patch
deleted file mode 100644
index 11dfd5db183..00000000000
--- a/meta/recipes-connectivity/ofono/ofono/rmnet.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From git@z Thu Jan  1 00:00:00 1970
-Subject: [PATCH] rmnet: Handle toolchains with old kernel headers
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 19 Dec 2024 13:47:15 +0000
-Message-Id: <e2b6a94dd9a3789e31dafadfc70c53b565d1db04.camel@linuxfoundation.org>
-MIME-Version: 1.0
-Content-Type: text/plain; charset="utf-8"
-Content-Transfer-Encoding: 7bit
-
-The RMNET_FLAGS_*GRESS_MAP_CKSUMV5 defines were added to the kernel in
-5.14[1] and some toolchains use older headers, so add fallback defines
-in case they are needed.
-
-[1] linux b6e5d27e32ef6089d316ce7e1ecaf595584d4b84
-
-Upstream-Status: Submitted [https://lore.kernel.org/ofono/e2b6a94dd9a3789e31dafadfc70c53b565d1db04.camel@linuxfoundation.org/T/#u]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/rmnet.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/src/rmnet.c b/src/rmnet.c
-index 42b03249..9a7f52fb 100644
---- a/src/rmnet.c
-+++ b/src/rmnet.c
-@@ -27,6 +27,16 @@
- #define MAX_MUX_IDS 254U
- #define DEFAULT_MTU 1400U
- 
-+/*
-+ * These were added in 5.14 so define them here if the toolchain's kernel headers are old.
-+ */
-+#ifndef RMNET_FLAGS_INGRESS_MAP_CKSUMV5
-+#define RMNET_FLAGS_INGRESS_MAP_CKSUMV5 (1U << 4)
-+#endif
-+#ifndef RMNET_FLAGS_EGRESS_MAP_CKSUMV5
-+#define RMNET_FLAGS_EGRESS_MAP_CKSUMV5 (1U << 5)
-+#endif
-+
- struct rmnet_request {
- 	uint32_t parent_ifindex;
- 	rmnet_new_interfaces_func_t new_cb;
--- 
-2.43.0
-
diff --git a/meta/recipes-connectivity/ofono/ofono_2.14.bb b/meta/recipes-connectivity/ofono/ofono_2.15.bb
similarity index 84%
rename from meta/recipes-connectivity/ofono/ofono_2.14.bb
rename to meta/recipes-connectivity/ofono/ofono_2.15.bb
index 9a91afaa7be..40eeb3a086d 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.14.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.15.bb
@@ -7,14 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://src/ofono.h;beginline=1;endline=6;md5=13e42133935ceecfc9bcb547f256e277"
 DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 
-SRC_URI = "\
-    ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-    file://rmnet.patch \
-    file://ofono \
-    file://CVE-2024-7539.patch \
-    file://CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch \
-"
-SRC_URI[sha256sum] = "983cbfd5e1e1a410ba7ad2db7f50fadc91e50b29f1ede40cdc73f941da7ba95f"
+SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+           file://ofono \
+           "
+SRC_URI[sha256sum] = "1af93ab72a70502452fe3d0297a6eaea13750cacae1fff3b643dd2245a6408ca"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 

