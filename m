Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22574C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:38:14 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.22651.1736951888639284028
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 06:38:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nhMJ2TIz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2163b0c09afso127514165ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 06:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736951888; x=1737556688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXMcnIU0paSF/P/aSqVLFF/pLHiVI29Zuz3MXKNo358=;
        b=nhMJ2TIz3VwAOPUWvXwUDeweZDXK09L1aw9v0YcxRvicUHOHKGyuEJ4FlOxqTdaL3q
         E5PM0uZrNrpNFFPiN6gcBgyt7zPhrGhEwFUOEbPj6r7NPwtVALIih3evXGyXIAbjgp3A
         7srQ2nuTxbQ690XsG+62sA29W8zMlpfFyZDdR75Rl523vxpCXrYPodQNdth/XfZVzc0d
         EkwBTBI7E+nY6Gxituw/hyRU4QJr4LJGjZoBGh6LNiyduULTYFIN2JEyjC1RtWn+n4rI
         H1/KtUlkQuN1pHA0z+SsTfhBcE0inwErgRbYK6ANS7PrwbEVcG5cc91gcE53Dx9Ttm2e
         F4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736951888; x=1737556688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXMcnIU0paSF/P/aSqVLFF/pLHiVI29Zuz3MXKNo358=;
        b=doDw5LX3nYePzkzkv2EJxMgV6z2R2iUwD6+BwvOLKq8ue+a+EuoB+nF6FIXBFEJaDL
         QtanCuYELtWyBl7qenbdbyeIBkRUkbVT3E2/Vpz0awc0yt26Lk3ORLlQSA7BsIg6wkHJ
         wga4fg+qnuVjm0r/BtYouZlFRBcrQzJN7vzFrcS08ZcX+nYbWlovnPi2PnYi9xYe1oG7
         QbZv8eCVc85Q+a/jDVN+P0Beiphi6tz4mcZaMZcyP8rbXzo0FJi1OG4u1r/5uu6Rwwix
         9HDxmAv8MqnwFniu+9urCNtO/3lNbU58RPpHQnPNRpzMK/gmdmFpM0q0LvJMFIfaoH1V
         t8/g==
X-Gm-Message-State: AOJu0YzCsiOVAuVQo5HNGLVGtUsKegHCmFL2YjnwprUYq9mv77H22FnB
	YGDW7WFpmuu25fWlX0r8Q6aoQ+CNhuZ4TWi5eB3KX8GY8Oyq5Zf1NRhDKEMAhNvq1vFKzsKBpdf
	fFpk=
X-Gm-Gg: ASbGnct7MU/cGDuTR7xfWQKEZJ4EXrSsZ3b324JkTLfpZMTWdBpryXZSUmgeCw09jNQ
	5jhY4hZeWwhhvCHPy7kQy/CFrfllvF9JrlX4nokbpkBpfbLlDh9FoNYjitCpYksBU3KoQzJsrmz
	fITh0q85FIQPAsuQ010sUfTDGBcYtmFgziVMWoFIRywrZ9u2aKpp7L65aeb8vC7kMiTXUUenRnK
	1aD2kfkhql8sJ+mqyeGGPat7JuDOc69d7MQp3+ul+tWPQ==
X-Google-Smtp-Source: AGHT+IGicSfNu+iMGLwawozbkQJdKmf1M8BTVDuY9bnIxQalso/s2zw87NN5sojPZ2u/u2mT7uDY0w==
X-Received: by 2002:a17:903:41c3:b0:215:9a73:6c45 with SMTP id d9443c01a7336-21a83f4cc87mr543590435ad.22.1736951887880;
        Wed, 15 Jan 2025 06:38:07 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f244cccsm82333295ad.210.2025.01.15.06.38.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:38:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/11] ofono: fix CVE-2024-7539
Date: Wed, 15 Jan 2025 06:37:44 -0800
Message-ID: <b1626a0df6911172adafa85a99d36486eb7e2c62.1736951751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736951751.git.steve@sakoman.com>
References: <cover.1736951751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 14:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209911

From: Yogita Urade <yogita.urade@windriver.com>

oFono CUSD Stack-based Buffer Overflow Code Execution Vulnerability.
This vulnerability allows local attackers to execute arbitrary code
on affected installations of oFono. An attacker must first obtain
the ability to execute code on the target modem in order to exploit
this vulnerability.

The specific flaw exists within the parsing of responses from AT+CUSD
commands. The issue results from the lack of proper validation of the
length of user-supplied data prior to copying it to a stack-based buffer.
An attacker can leverage this vulnerability to execute code in the
context of root. Was ZDI-CAN-23195.

Reference:
https://security-tracker.debian.org/tracker/CVE-2024-7539

Upstream Patch:
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=389e2344f86319265fb72ae590b470716e038fdc

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ofono/ofono/CVE-2024-7539.patch           | 88 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch
new file mode 100644
index 0000000000..46e45580c2
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch
@@ -0,0 +1,88 @@
+From 389e2344f86319265fb72ae590b470716e038fdc Mon Sep 17 00:00:00 2001
+From: "Sicelo A. Mhlongo" <absicsz@gmail.com>
+Date: Tue, 17 Dec 2024 11:31:29 +0200
+Subject: [PATCH] ussd: ensure ussd content fits in buffers
+
+Fixes: CVE-2024-7539
+
+CVE: CVE-2024-7539
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=389e2344f86319265fb72ae590b470716e038fdc]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ drivers/atmodem/ussd.c      | 5 ++++-
+ drivers/huaweimodem/ussd.c  | 5 ++++-
+ drivers/speedupmodem/ussd.c | 5 ++++-
+ 3 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/atmodem/ussd.c b/drivers/atmodem/ussd.c
+index 3be1832..29f86dc 100644
+--- a/drivers/atmodem/ussd.c
++++ b/drivers/atmodem/ussd.c
+@@ -106,7 +106,7 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
+	const char *content;
+	int dcs;
+	enum sms_charset charset;
+-	unsigned char msg[160];
++	unsigned char msg[160] = {0};
+	const unsigned char *msg_ptr = NULL;
+	long msg_len;
+
+@@ -124,6 +124,9 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
+	if (!g_at_result_iter_next_number(&iter, &dcs))
+		dcs = 0;
+
++	if (strlen(content) > sizeof(msg) * 2)
++		goto out;
++
+	if (!cbs_dcs_decode(dcs, NULL, NULL, &charset, NULL, NULL, NULL)) {
+		ofono_error("Unsupported USSD data coding scheme (%02x)", dcs);
+		status = 4; /* Not supported */
+diff --git a/drivers/huaweimodem/ussd.c b/drivers/huaweimodem/ussd.c
+index fbed3cd..4160b7d 100644
+--- a/drivers/huaweimodem/ussd.c
++++ b/drivers/huaweimodem/ussd.c
+@@ -50,7 +50,7 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
+	GAtResultIter iter;
+	int status, dcs;
+	const char *content;
+-	unsigned char msg[160];
++	unsigned char msg[160] = {0};
+	const unsigned char *msg_ptr = NULL;
+	long msg_len;
+
+@@ -68,6 +68,9 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
+	if (!g_at_result_iter_next_number(&iter, &dcs))
+		dcs = 0;
+
++	if (strlen(content) > sizeof(msg) * 2)
++		goto out;
++
+	msg_ptr = decode_hex_own_buf(content, -1, &msg_len, 0, msg);
+
+ out:
+diff --git a/drivers/speedupmodem/ussd.c b/drivers/speedupmodem/ussd.c
+index 57b91d7..99af19a 100644
+--- a/drivers/speedupmodem/ussd.c
++++ b/drivers/speedupmodem/ussd.c
+@@ -49,7 +49,7 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
+	GAtResultIter iter;
+	int status, dcs;
+	const char *content;
+-	unsigned char msg[160];
++	unsigned char msg[160] = {0};
+	const unsigned char *msg_ptr = NULL;
+	long msg_len;
+
+@@ -67,6 +67,9 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
+	if (!g_at_result_iter_next_number(&iter, &dcs))
+		dcs = 0;
+
++	if (strlen(content) > sizeof(msg) * 2)
++		goto out;
++
+	msg_ptr = decode_hex_own_buf(content, -1, &msg_len, 0, msg);
+
+ out:
+--
+2.40.0
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index 3ffb713472..a7c3a9085d 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -18,6 +18,7 @@ SRC_URI = "\
     file://CVE-2023-2794-0002.patch \
     file://CVE-2023-2794-0003.patch \
     file://CVE-2023-2794-0004.patch \
+    file://CVE-2024-7539.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
-- 
2.43.0


