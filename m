Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BA1C02190
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 03:03:37 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.34193.1737515017216995664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 19:03:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IiZKzUpw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-219f8263ae0so114037265ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 19:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737515016; x=1738119816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VjNJ0pOwi5xr5ImzUmoZ2K3PCaFepFf79j4TX/PnlU=;
        b=IiZKzUpwNctijXg+z7H6rt82jp6cyae7ryYuGO/73M4IGg/R9hlg7jKfg5geMGFX3u
         KEReHpFH7WlSLlc3E5PpAIRT/rK7nu13QSX4/eTKcIvUsZ7GIQRQEFIKFXe758eXaHEM
         C+jG6LJaHtUtZUj0ZqHgHh5Qh2VcEofILvtYc+d+uPjeKDtkoVev/i/CN8JIIKkgotZh
         tvcWUgYei9+KsGZTjQBDcwgc15ButheZZqQRQ8i74yrbWjDB1P42D/3cNmVib+eNi8dy
         JpLxRKh/c7BLJ75wW/nxWnz61NrQDNlmxMDcUsewXbWtudS/vi1Y4Su1wPxhLIM/VoPX
         4kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737515016; x=1738119816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VjNJ0pOwi5xr5ImzUmoZ2K3PCaFepFf79j4TX/PnlU=;
        b=wGRoaVCj7E4qBAl0sYNpWjhYEyYiEZfljcriYgSZffYi0vrrVddZFBIJ43I5sJ4pty
         8D81W3Fc4ec61GUerXbr2+eypqnHSpmjM6nUzbXzQniT3n1BOacaP1x79PnsC9OIdiTe
         RCeLQeskqAG3Q7+qJ9qSU8cZLzVmP1mbNXcr3eR24Ipg5MZ29L8sOPQVIJOqtFdY+nv4
         zEPbBKmVCUwlul9EHOtRXlug3zA9y/tmFcpXC9C4gVpmE01QtvC/I1MWZEQRpAC8rRAj
         MeMAVBx833MN5HJxFkNbs6vEcaT5g/NgimwrmsWUHfD3PzRYAnOmzhHnniA6Dez85XX7
         YOFw==
X-Gm-Message-State: AOJu0YyweozyBvZtmnz1qlJdprjJ6M1ln4kWQMsHyYwjxOWD4JekaTF9
	4UPwecDS6ObhNKWCor/Vey13ydWQO9p6ingue+tNZRgtYcEFW5S3IS0kqGdPW1ySkIFK8UzxL5e
	u4T8=
X-Gm-Gg: ASbGncttPiSSwehDKcr/pkKZmczDI4bP7X5qvnz/of22PD4zrbRhNb27Fmvxh4ovlds
	+J0XXt5ZlYQQlIxCbehcFkQjNlI4iWHBm0yWkgbAUPx5+CudCrIgovCFNVZcYGWF5O/YpQF90MT
	gQ8Yg3NbfMMw20LkWd+bzEGdWO3azLr25DJdqj/MA8kz3ZU6ymeaMnJW9vTqmn+uCbCgxkcK7MK
	PqfgnF23hFUEyOr+DCaRwxWVtFDFIXP/PDKby9EGf9ghfHbrjzEpdlXCxs=
X-Google-Smtp-Source: AGHT+IGnLjN+KRPhSsjPngJ39rgmZiEoh7zAg1kz1seR2LLHjSvhK71zqvsPqPNoQwHYCGdtt+LgEQ==
X-Received: by 2002:a05:6a00:928b:b0:72d:8d98:c257 with SMTP id d2e1a72fcca58-72daf930ff5mr24671416b3a.2.1737515016520;
        Tue, 21 Jan 2025 19:03:36 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab8112c1sm9800337b3a.37.2025.01.21.19.03.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 19:03:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/14] ofono: patch CVE-2024-7540, CVE-2024-7541, CVE-2024-7542
Date: Tue, 21 Jan 2025 19:03:01 -0800
Message-ID: <6f55cecbff1e5be7dda7484b8b04f7ccfbdceb1b.1737514842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737514842.git.steve@sakoman.com>
References: <cover.1737514842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210119

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick commit
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=29ff6334b492504ace101be748b256e6953d2c2f

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...024-7540_CVE-2024-7541_CVE-2024-7542.patch | 52 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_2.4.bb  |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch
new file mode 100644
index 0000000000..0b06e057e5
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch
@@ -0,0 +1,52 @@
+From 29ff6334b492504ace101be748b256e6953d2c2f Mon Sep 17 00:00:00 2001
+From: "Sicelo A. Mhlongo" <absicsz@gmail.com>
+Date: Tue, 17 Dec 2024 11:31:28 +0200
+Subject: [PATCH] atmodem: sms: ensure buffer is initialized before use
+
+Fixes: CVE-2024-7540
+Fixes: CVE-2024-7541
+Fixes: CVE-2024-7542
+
+CVE: CVE-2024-7540
+CVE: CVE-2024-7541
+CVE: CVE-2024-7542
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=29ff6334b492504ace101be748b256e6953d2c2f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ drivers/atmodem/sms.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/atmodem/sms.c b/drivers/atmodem/sms.c
+index d994856b..0668c631 100644
+--- a/drivers/atmodem/sms.c
++++ b/drivers/atmodem/sms.c
+@@ -412,7 +412,7 @@ static void at_cmt_notify(GAtResult *result, gpointer user_data)
+ 	struct sms_data *data = ofono_sms_get_data(sms);
+ 	GAtResultIter iter;
+ 	const char *hexpdu;
+-	unsigned char pdu[176];
++	unsigned char pdu[176] = {0};
+ 	long pdu_len;
+ 	int tpdu_len;
+ 
+@@ -479,7 +479,7 @@ static void at_cmgr_notify(GAtResult *result, gpointer user_data)
+ 	struct sms_data *data = ofono_sms_get_data(sms);
+ 	GAtResultIter iter;
+ 	const char *hexpdu;
+-	unsigned char pdu[176];
++	unsigned char pdu[176] = {0};
+ 	long pdu_len;
+ 	int tpdu_len;
+ 
+@@ -661,7 +661,7 @@ static void at_cmgl_notify(GAtResult *result, gpointer user_data)
+ 	struct sms_data *data = ofono_sms_get_data(sms);
+ 	GAtResultIter iter;
+ 	const char *hexpdu;
+-	unsigned char pdu[176];
++	unsigned char pdu[176] = {0};
+ 	long pdu_len;
+ 	int tpdu_len;
+ 	int index;
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/ofono/ofono_2.4.bb b/meta/recipes-connectivity/ofono/ofono_2.4.bb
index 852c71948e..097a0e0566 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.4.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.4.bb
@@ -22,6 +22,7 @@ SRC_URI = "\
     file://CVE-2024-7545.patch \
     file://CVE-2024-7546.patch \
     file://CVE-2024-7547.patch \
+    file://CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch \
 "
 SRC_URI[sha256sum] = "93580adc1afd1890dc516efb069de0c5cdfef014415256ddfb28ab172df2d11d"
 
-- 
2.43.0


