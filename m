Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E307C0218E
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 03:03:37 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.34190.1737515012165601483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 19:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XgZoJeJn;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso8790785a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 19:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737515011; x=1738119811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6OdoIqQPJKC9x/s6uEtJ0AfAyjHKYUabBjv+nISApjQ=;
        b=XgZoJeJnNTDHbvpkOkcWj6H8ckgspKRgkxWeLoFz5VSQJ7UFndCTvfhT0mHBtTnqJY
         DglV++gNC62pTGrWam2ndQingLS+VoP3QDVwsSpNT7qjm9nYGm6UV8H6utItBzGX+w7r
         S/yEmkKuw3l0sAbHUH/IYN3qN+zvmqNZB8P+Hwu+R4S/xiKiaH6y0v9877J916hTdWGn
         K+lKLXBvlvZsmwp/vMllieKLgKOBf51wKymk7eNe0Nqj3fFF3tEsD+7LS0H8LjtYVyVm
         UzbD70R7hOaBdwU/fBHaa1Qkrw+pS6LkUDXKGfCHr1pCEMgY7eRSr2K3xgJ1ylqIdc22
         cZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737515011; x=1738119811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OdoIqQPJKC9x/s6uEtJ0AfAyjHKYUabBjv+nISApjQ=;
        b=KS2Vr5+KM2vnL37RA2eFTPgpxwIyx0tt5G0KEF3ZgLPppOpQKNXfXgROfx0NX5fZhN
         lHx+CiZrsC0iO5dmElbpqrr4AdiJe3dPezSmKpjs87xzsX2J8e7DpZ3w6vpxsyvKMQKw
         0YdMW1HNC8DB7otiyYEwKQeFTsLDBFBzgehrrfuX0Zw68zt/mRHmSKcnbYfcYxPntxs1
         G2Jwgtj2o3+C+PAHX7BbEEpBGPBbHmvkUVvaJh+CNnXLMNUBX8Fp7JC/p1AA/X6d6LGZ
         ENIaidF2w6/SXo3kDTst4TJTx3QGWTxHW700vK4yLl7B5o5lQCGcJcRLF0OnAkfK+Oxd
         niUw==
X-Gm-Message-State: AOJu0YxbXqCE1fSSisblBCH+SZKr8bjtJFETQPzvDbjSMgMgLvZhPeJr
	w+mTd2fmu5JNvW8TjI/h+IV2iuAbS1Y+qnXbdGusMWTkSQqBtzXtv33QzUEg6p5kqO3ZJHV8QM+
	kOl8=
X-Gm-Gg: ASbGnctdMyuxQ1Sd8IrsP1DqD9nbM1kczJd0rO23opygTc53gsshJ7cxZnTDTm7zVS/
	pGWPvW3nq/GhX1vlu8xWCXYG04BG0F7+cqc4yCr7oQUSpYifeTPX0y1Ptcz39MjbfdDorohKBJG
	UaFQyCjkuxVIMsOoA3KAbOkisdFxoCZ1oXtvl5PkeLJEzNik8KTg+05hxAKrn8FoL3vugUprc5Z
	dsNLlaZQqyrE9NE3WV8R7ZMLa0GBz+MaUoX8Xn1Y06OI+I33fgfPPpk7JA=
X-Google-Smtp-Source: AGHT+IGIN+FULxOTXc3lkuy1U3jvI0CcONcB38pACXXuDNMBLaiyxOah3GP3gHAgNFLUPqjP9NkSnA==
X-Received: by 2002:a05:6a00:8084:b0:724:d758:f35 with SMTP id d2e1a72fcca58-72daf9bd157mr26859937b3a.2.1737515011297;
        Tue, 21 Jan 2025 19:03:31 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab8112c1sm9800337b3a.37.2025.01.21.19.03.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 19:03:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/14] ofono: Fix multiple CVEs
Date: Tue, 21 Jan 2025 19:02:58 -0800
Message-ID: <d244d4d48615a7b08f1ab0231f074caa31790247.1737514842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737514842.git.steve@sakoman.com>
References: <cover.1737514842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210116

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport fixes for:

* CVE-2024-7539 - Upstream-Status: Backport from https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=389e2344f86319265fb72ae590b470716e038fdc
* CVE-2024-7543 - Upstream-Status: Backport from https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=90e60ada012de42964214d8155260f5749d0dcc7
* CVE-2024-7544 - Upstream-Status: Backport from https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=a240705a0d5d41eca6de4125ab2349ecde4c873a
* CVE-2024-7545 - Upstream-Status: Backport from https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=556e14548c38c2b96d85881542046ee7ed750bb5
* CVE-2024-7546 - Upstream-Status: Backport from https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=79ea6677669e50b0bb9c231765adb4f81c375f63
* CVE-2024-7547 - Upstream-Status: Backport from https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=305df050d02aea8532f7625d6642685aa530f9b0

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ofono/ofono/CVE-2024-7539.patch           | 88 +++++++++++++++++++
 .../ofono/ofono/CVE-2024-7543.patch           | 30 +++++++
 .../ofono/ofono/CVE-2024-7544.patch           | 30 +++++++
 .../ofono/ofono/CVE-2024-7545.patch           | 32 +++++++
 .../ofono/ofono/CVE-2024-7546.patch           | 30 +++++++
 .../ofono/ofono/CVE-2024-7547.patch           | 29 ++++++
 meta/recipes-connectivity/ofono/ofono_2.4.bb  |  6 ++
 7 files changed, 245 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7543.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7544.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7545.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7546.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7547.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch
new file mode 100644
index 0000000000..7fcc620fd8
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
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ drivers/atmodem/ussd.c      | 5 ++++-
+ drivers/huaweimodem/ussd.c  | 5 ++++-
+ drivers/speedupmodem/ussd.c | 5 ++++-
+ 3 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/atmodem/ussd.c b/drivers/atmodem/ussd.c
+index aaf47b2..cee9bc5 100644
+--- a/drivers/atmodem/ussd.c
++++ b/drivers/atmodem/ussd.c
+@@ -107,7 +107,7 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
+ 	const char *content;
+ 	int dcs;
+ 	enum sms_charset charset;
+-	unsigned char msg[160];
++	unsigned char msg[160] = {0};
+ 	const unsigned char *msg_ptr = NULL;
+ 	long msg_len;
+ 
+@@ -127,6 +127,9 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
+ 	if (!g_at_result_iter_next_number(&iter, &dcs))
+ 		dcs = 0;
+ 
++	if (strlen(content) > sizeof(msg) * 2)
++		goto out;
++
+ 	if (!cbs_dcs_decode(dcs, NULL, NULL, &charset, NULL, NULL, NULL)) {
+ 		ofono_error("Unsupported USSD data coding scheme (%02x)", dcs);
+ 		status = 4; /* Not supported */
+diff --git a/drivers/huaweimodem/ussd.c b/drivers/huaweimodem/ussd.c
+index ffb9b2a..cfdb4ee 100644
+--- a/drivers/huaweimodem/ussd.c
++++ b/drivers/huaweimodem/ussd.c
+@@ -52,7 +52,7 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
+ 	int status;
+ 	int dcs = 0;
+ 	const char *content;
+-	unsigned char msg[160];
++	unsigned char msg[160] = {0};
+ 	const unsigned char *msg_ptr = NULL;
+ 	long msg_len;
+ 
+@@ -69,6 +69,9 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
+ 
+ 	g_at_result_iter_next_number(&iter, &dcs);
+ 
++	if (strlen(content) > sizeof(msg) * 2)
++		goto out;
++
+ 	msg_ptr = decode_hex_own_buf(content, -1, &msg_len, 0, msg);
+ 
+ out:
+diff --git a/drivers/speedupmodem/ussd.c b/drivers/speedupmodem/ussd.c
+index 44da8ed..33441c6 100644
+--- a/drivers/speedupmodem/ussd.c
++++ b/drivers/speedupmodem/ussd.c
+@@ -51,7 +51,7 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
+ 	int status;
+ 	int dcs = 0;
+ 	const char *content;
+-	unsigned char msg[160];
++	unsigned char msg[160] = {0};
+ 	const unsigned char *msg_ptr = NULL;
+ 	long msg_len;
+ 
+@@ -68,6 +68,9 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
+ 
+ 	g_at_result_iter_next_number(&iter, &dcs);
+ 
++	if (strlen(content) > sizeof(msg) * 2)
++		goto out;
++
+ 	msg_ptr = decode_hex_own_buf(content, -1, &msg_len, 0, msg);
+ 
+ out:
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7543.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7543.patch
new file mode 100644
index 0000000000..e48579e59a
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7543.patch
@@ -0,0 +1,30 @@
+From 90e60ada012de42964214d8155260f5749d0dcc7 Mon Sep 17 00:00:00 2001
+From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
+Date: Tue, 3 Dec 2024 21:43:50 +0200
+Subject: [PATCH] stkutil: Fix CVE-2024-7543
+
+CVE: CVE-2024-7543
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=90e60ada012de42964214d8155260f5749d0dcc7]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/stkutil.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/stkutil.c b/src/stkutil.c
+index 4f31af4..fdd11ad 100644
+--- a/src/stkutil.c
++++ b/src/stkutil.c
+@@ -1876,6 +1876,10 @@ static bool parse_dataobj_mms_reference(struct comprehension_tlv_iter *iter,
+ 
+ 	data = comprehension_tlv_iter_get_data(iter);
+ 	mr->len = len;
++
++	if (len > sizeof(mr->ref))
++		return false;
++
+ 	memcpy(mr->ref, data, len);
+ 
+ 	return true;
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7544.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7544.patch
new file mode 100644
index 0000000000..7984bc6487
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7544.patch
@@ -0,0 +1,30 @@
+From a240705a0d5d41eca6de4125ab2349ecde4c873a Mon Sep 17 00:00:00 2001
+From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
+Date: Tue, 3 Dec 2024 21:43:49 +0200
+Subject: [PATCH] stkutil: Fix CVE-2024-7544
+
+CVE: CVE-2024-7544
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=a240705a0d5d41eca6de4125ab2349ecde4c873a]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/stkutil.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/stkutil.c b/src/stkutil.c
+index fdd11ad..475caaa 100644
+--- a/src/stkutil.c
++++ b/src/stkutil.c
+@@ -1898,6 +1898,10 @@ static bool parse_dataobj_mms_id(struct comprehension_tlv_iter *iter,
+ 
+ 	data = comprehension_tlv_iter_get_data(iter);
+ 	mi->len = len;
++
++	if (len > sizeof(mi->id))
++		return false;
++
+ 	memcpy(mi->id, data, len);
+ 
+ 	return true;
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7545.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7545.patch
new file mode 100644
index 0000000000..a3bf13a81e
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7545.patch
@@ -0,0 +1,32 @@
+From 556e14548c38c2b96d85881542046ee7ed750bb5 Mon Sep 17 00:00:00 2001
+From: Sicelo A. Mhlongo <absicsz@gmail.com>
+Date: Wed, Dec 4 12:07:34 2024 +0200
+Subject: [PATCH] stkutil: ensure data fits in buffer
+
+Fixes CVE-2024-7545
+
+CVE: CVE-2024-7545
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=556e14548c38c2b96d85881542046ee7ed750bb5]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/stkutil.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/stkutil.c b/src/stkutil.c
+index 475caaa..e1fd75c 100644
+--- a/src/stkutil.c
++++ b/src/stkutil.c
+@@ -1938,6 +1938,10 @@ static bool parse_dataobj_mms_content_id(
+ 
+ 	data = comprehension_tlv_iter_get_data(iter);
+ 	mci->len = len;
++
++	if (len > sizeof(mci->id))
++		return false;
++
+ 	memcpy(mci->id, data, len);
+ 
+ 	return true;
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7546.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7546.patch
new file mode 100644
index 0000000000..808458be2f
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7546.patch
@@ -0,0 +1,30 @@
+From 79ea6677669e50b0bb9c231765adb4f81c375f63 Mon Sep 17 00:00:00 2001
+From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
+Date: Tue, 3 Dec 2024 21:43:52 +0200
+Subject: [PATCH] Fix CVE-2024-7546
+
+CVE: CVE-2024-7546
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=79ea6677669e50b0bb9c231765adb4f81c375f63]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/stkutil.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/stkutil.c b/src/stkutil.c
+index e1fd75c..88a715d 100644
+--- a/src/stkutil.c
++++ b/src/stkutil.c
+@@ -1783,6 +1783,10 @@ static bool parse_dataobj_frame_layout(struct comprehension_tlv_iter *iter,
+ 
+ 	fl->layout = data[0];
+ 	fl->len = len - 1;
++
++	if (fl->len > sizeof(fl->size))
++		return false;
++
+ 	memcpy(fl->size, data + 1, fl->len);
+ 
+ 	return true;
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7547.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7547.patch
new file mode 100644
index 0000000000..d4feee7f7f
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7547.patch
@@ -0,0 +1,29 @@
+From 305df050d02aea8532f7625d6642685aa530f9b0 Mon Sep 17 00:00:00 2001
+From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
+Date: Tue, 3 Dec 2024 21:43:51 +0200
+Subject: [PATCH] Fix CVE-2024-7547
+
+CVE: CVE-2024-7547
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=305df050d02aea8532f7625d6642685aa530f9b0]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/smsutil.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/smsutil.c b/src/smsutil.c
+index def47e8..f79f59d 100644
+--- a/src/smsutil.c
++++ b/src/smsutil.c
+@@ -1475,6 +1475,9 @@ static gboolean decode_command(const unsigned char *pdu, int len,
+ 	if ((len - offset) < out->command.cdl)
+ 		return FALSE;
+ 
++	if (out->command.cdl > sizeof(out->command.cd))
++		return FALSE;
++
+ 	memcpy(out->command.cd, pdu + offset, out->command.cdl);
+ 
+ 	return TRUE;
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/ofono/ofono_2.4.bb b/meta/recipes-connectivity/ofono/ofono_2.4.bb
index f8ade2b2f8..852c71948e 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.4.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.4.bb
@@ -16,6 +16,12 @@ SRC_URI = "\
     file://CVE-2023-2794-0002.patch \
     file://CVE-2023-2794-0003.patch \
     file://CVE-2023-2794-0004.patch \
+    file://CVE-2024-7539.patch \
+    file://CVE-2024-7543.patch \
+    file://CVE-2024-7544.patch \
+    file://CVE-2024-7545.patch \
+    file://CVE-2024-7546.patch \
+    file://CVE-2024-7547.patch \
 "
 SRC_URI[sha256sum] = "93580adc1afd1890dc516efb069de0c5cdfef014415256ddfb28ab172df2d11d"
 
-- 
2.43.0


