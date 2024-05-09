Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032D4C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:05:20 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.8386.1715256310753029406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ll29UiKt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6f4521ad6c0so723549b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256310; x=1715861110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFq827j5dPIKy/T7inqIjx3kE+XT/B9+H0lAKiZfIfY=;
        b=ll29UiKt8QEPOzSYXMHHdO5zFIWVH38g8ie9DuiLW+lHqiyhWrKctMPJ+M/xfSbTgp
         L8aDNwnLn5cb4RQy2zwc/H1hAfqGNUuc85qmLNlKqkRz50nNCrjj5hK3plNc41DCV76k
         3C2tobBpQR5WzusrKeEgktfDMfZ9GyQ9gryx6vGTXXC2DmIKWlnZPL1z49l07Rn/kDoi
         j84MCJVVLEsd+vV9NyiFmszd/KShQYegmmg+vBhyct9FmAJo/CIr68cqox9YyZnYQL5+
         woXNAonUE8/lkckmvnjgReierqF3kJU6UiONn5GkY76YOiMnu8y8VUg9Ui0Z/BjzUCCv
         UBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256310; x=1715861110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFq827j5dPIKy/T7inqIjx3kE+XT/B9+H0lAKiZfIfY=;
        b=XcUqiZuPgVyPYlGo3uqUxCCDmFRbPqVRQXcHA5h2JbMd3F0zqMpf4r/LqlL/1Dxyih
         cIA4agT8A0VGAKbmzrInYCgHKZ8k7e2XyAsdAhzzIw/87FbV7nzIm969KIztiTOsZXRH
         sidgQ/oOReaPCcd8xUfTgSCX1Z8DyiiW98wOaAtHw8A/jCw5JS8Nfo76OpVKx7vKvdJp
         Ta3eDUU97LETJcb5TDnMPzb+eBshfTiHW6ilJNMgkJ9EJCHKgUE2k5T6l/0MO+phq1Lt
         Mg2k8dYPnXN5cGzL4P9SJDfJEJ4lIEoMNL/O/T3uNAQwD5iKzJ1CJruzRi29QyllQLjJ
         pdsQ==
X-Gm-Message-State: AOJu0YyEW29iBxtLtlFQ5ielRj+Bq9I01EPI46K67be7mtu3piDTM/lM
	rrmNP7ElxiZC5394BHbEpJe9dGqVXpTCmiRD+Pck2ypgXbV/mStlcdLwiPQEcAGwsbc5cZI9GWs
	r
X-Google-Smtp-Source: AGHT+IE7ESHwwMrN99UoUZbHhZGVJ44hTNaoszSgnYnlMZkuz9o6jBl98HztCSJqpTHOLNZNjXzHZg==
X-Received: by 2002:a05:6a00:741d:b0:6e7:20a7:9fc0 with SMTP id d2e1a72fcca58-6f49c2b1b5dmr4727458b3a.34.1715256309910;
        Thu, 09 May 2024 05:05:09 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/23] ofono: fix CVE-2023-4234
Date: Thu,  9 May 2024 05:04:39 -0700
Message-Id: <51cf006ac7b5b97e65864fb1cb6f5b47192c4ebf.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199148

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in ofono, an Open Source Telephony on Linux. A stack overflow bug
is triggered within the decode_submit_report() function during the SMS decoding.
It is assumed that the attack scenario is accessible from a compromised modem,
a malicious base station, or just SMS. There is a bound check for this memcpy
length in decode_submit(), but it was forgotten in decode_submit_report().

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ofono/ofono/CVE-2023-4234.patch           | 39 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-4234.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2023-4234.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4234.patch
new file mode 100644
index 0000000000..9d7b56c1ae
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4234.patch
@@ -0,0 +1,39 @@
+From 8d74bc66146ea78620d140640a0a57af86fc8936 Mon Sep 17 00:00:00 2001
+From: Denis Grigorev <d.grigorev@omp.ru>
+Date: Thu, 21 Dec 2023 17:16:38 +0300
+Subject: [PATCH] smsutil: Check that submit report fits in memory
+
+This addresses CVE-2023-4234.
+
+CVE: CVE-2023-4234.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=8d74bc66146ea786]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/smsutil.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/smsutil.c b/src/smsutil.c
+index 8e57a06..5a12708 100644
+--- a/src/smsutil.c
++++ b/src/smsutil.c
+@@ -938,10 +938,16 @@ static gboolean decode_submit_report(const unsigned char *pdu, int len,
+			return FALSE;
+
+		if (out->type == SMS_TYPE_SUBMIT_REPORT_ERROR) {
++			if (expected > (int) sizeof(out->submit_err_report.ud))
++                                return FALSE;
++
+			out->submit_err_report.udl = udl;
+			memcpy(out->submit_err_report.ud,
+					pdu + offset, expected);
+		} else {
++			if (expected > (int) sizeof(out->submit_ack_report.ud))
++                                return FALSE;
++
+			out->submit_ack_report.udl = udl;
+			memcpy(out->submit_ack_report.ud,
+					pdu + offset, expected);
+--
+2.40.0
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index 23631747a7..8aab312ff8 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -12,6 +12,7 @@ SRC_URI = "\
     file://ofono \
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
     file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
+    file://CVE-2023-4234.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
-- 
2.34.1


