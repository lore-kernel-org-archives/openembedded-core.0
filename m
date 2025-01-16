Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A157E77188
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 08:01:49 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.43634.1737014505400900511
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 00:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DSsyQmk2;
 spf=pass (domain: mvista.com, ip: 209.85.216.52, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so1275795a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 00:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1737014505; x=1737619305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pKLAbJE4o2hPeKBxCN4dF9irZYa1SJGEycsc5qniU1g=;
        b=DSsyQmk2SvuFc+Li/YxYRtTZl4Nal/3hWuj4LynO3XL2SwNf/sBmhOG//3UriWUfak
         QvZv2NDqamvXU05dh+1TUWPK3jNXFezvwZMfOBQhdjfMSaHVr/9A8kM+vMGzPsCQjJN0
         eZwviA4nnKaK/tEKKh0j3Wk0iM7QH4Js1eyhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737014505; x=1737619305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKLAbJE4o2hPeKBxCN4dF9irZYa1SJGEycsc5qniU1g=;
        b=AKq67c0d52+zN8uBYTVsxtJa3NFN2S2HP+foamRvo6fONGpWh1Vbq/qyrX/TQjtHAB
         KTHYKk6k/jmGYUwLmOwO76glp9pMT6arkFCPxXdgiFlPMbeWdczLHzwRP3SIuTmONkRz
         4zRCa/UH6av9JXF1zJEslgYHJByg4WFBZWRJvqLTTTpCUVl8BZOBQZDk5CzSNxXO6bvo
         1gXI1Kzb4DS3/qZYk/W3uHwQNqNU8oXWR8efbcdaxDHHA4cOPMqqzOMq1EsKHrFMxoRK
         dnFI1mzwkQGcphH3cjOvt4m6d1/vdQL0Le04CxxAtM7ahE055hvxbC38+uC6KTbSYs+Q
         vhbg==
X-Gm-Message-State: AOJu0YyTI+16apqLU9S2qA1pFgFNrtfe1o1D/yuMHPZxm7SYk2G/fqmy
	PVs3KIygWgEYrBB44spvkpnLTzIvk2K5gQXmqrjZWvfT53K2cMM+6UsZMr8LfXddOJYOfgsq1YU
	0
X-Gm-Gg: ASbGnctrKtlw2svY5Z5FoY77zz8h2qTnZu8+3bu8qDjQf77eX+Fv4SEHsKTGUtTs0qp
	zNO6UaclFbZU6kpu+/H5kbdLpPZZEvUwSx7hcWHsRqrRjLDy3i2ud3h8TAv5YG8mVHN+lwgY2cI
	ZDL80Yt7FR1ecFW2AkR69JXur76Luh/qdc5yVJYjwbQJbHjkl1/36Y4t4OJZU6wEJejKYW4uINd
	v4l6jqbJSaPGUA+1yQcCxNv0KA3wmOBxZSxazDLpUQeE8FnC/iXcLh5cn/1fDwuarxZZ/E=
X-Google-Smtp-Source: AGHT+IH6uOsAitsu3ID9Y6XBtc7n8tw8R6CsRXLPN5mIFYEReD0B3EisndqoKrc8ouN7YL652KX7TQ==
X-Received: by 2002:a17:90b:28c8:b0:2ee:b2e6:4276 with SMTP id 98e67ed59e1d1-2f5490bd7fbmr44212368a91.27.1737014504438;
        Thu, 16 Jan 2025 00:01:44 -0800 (PST)
Received: from MVIN00016.mvista.com ([150.129.170.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f708527029sm1378973a91.0.2025.01.16.00.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 00:01:44 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] ofono: Fix multiple CVEs
Date: Thu, 16 Jan 2025 13:31:35 +0530
Message-Id: <20250116080135.177451-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 08:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209939

Backport fixes for:

* CVE-2024-7539 - Upstream-Status: Backport from https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=389e2344f86319265fb72ae590b470716e038fdc
* CVE-2024-7543 - Upstream-Status: Backport from https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=90e60ada012de42964214d8155260f5749d0dcc7
* CVE-2024-7544 - Upstream-Status: Backport from https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=a240705a0d5d41eca6de4125ab2349ecde4c873a
* CVE-2024-7545 - Upstream-Status: Backport from https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=556e14548c38c2b96d85881542046ee7ed750bb5
* CVE-2024-7546 - Upstream-Status: Backport from https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=79ea6677669e50b0bb9c231765adb4f81c375f63
* CVE-2024-7547 - Upstream-Status: Backport from https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=305df050d02aea8532f7625d6642685aa530f9b0

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.25.1


