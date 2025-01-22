Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A06BC0218F
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 03:03:47 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.34432.1737515018904832596
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 19:03:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ItZ24hSw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f441904a42so11524580a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 19:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737515018; x=1738119818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFbN/mEV9Y5Mm/0BpnO6G7l8VJDfBKz0Q1H6wTjXqYs=;
        b=ItZ24hSwbK7MeKCUKplkVpQLon/PCy85mR2cYXeT7L69ros+8BU/7wscyiMRHruKRg
         n4FgYcsiUqYDgiD1RnlgZyQYTDeh8fO354NWADk5DFSKyJUHZQB7dReRsgo7bk6BZRcg
         KOWXlYpsnzcH+DopgFfOFtQq2QXk2iiQXXBISoEvGmmESI/lVsdjZyFmAOM5iwdr/a1q
         Am+gQixrYMkD1HkXeYVkL5fvoCW2x4jV68U6ByAouEgIAun3EsFoRtfvjOxO79KQtg8Z
         BYQavGc8yyRufhPzh1itqmxD21jbr3Z+uGkx7k+K18QOqieZFLIkQi2ClU7k1/eILY9E
         InpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737515018; x=1738119818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFbN/mEV9Y5Mm/0BpnO6G7l8VJDfBKz0Q1H6wTjXqYs=;
        b=s1/45SosvkpMSb1SXitHzdQQ4EA94NdiYiQ7T8ShwE8b1rvDtIEDTeP21DeqEDdfbt
         gNmMMyBY0SWOTw61wHO12Gu/MwpRD4t+bh8VG7cZjRujNarERVrLUdcGUgOYK7IzAgpY
         fCbT7jWL7F4uFlGwnNJXe+dmBugab8z+juUJPoNAFCZQ4iQBD6fUNrJFPx5+ZKfHT8yk
         c6oM6Cwf9wTocPBt69CpmB4w8MvHfAFiX4KjhUdtpE0waUkHsCxDLo7S5xTwp1A4SKBb
         fTbG0B0Qzk3xb9FscG/nwUA5dwC2YPAoQXTY6Aw4BZJEHnk7SqCbInfwE7XjcrRpgLtv
         3XRw==
X-Gm-Message-State: AOJu0YyLpW9P/Euz4Hk448TOauoes9fPyubJZkgTeyv6nGkIUerXIoy+
	Pd00oGSYKZ3jljl0oC7MfK+uY2USo32Nc0oV7SBd2tHfld0aalF7AMjao/0sETUT3NRqfdfP4KR
	ZO1I=
X-Gm-Gg: ASbGncuBw7PpFvT6DRKKrRAYz1b1WSUjz4xWSgFCstjXWsbqItbSTDrBAbEBnEbLJR1
	8JyfPRoYJohBFXjZACkm350aK3/M1/AJF8u7ndfPEiVe9R/yM4r6+XFLeXZfKWZUdxoG6X0Zg9x
	+OlT/Nl3a85t8+PMyB+z4xGIgfplIbeRVF/1UChnA4H3jKkFlhUNIXs1Fg1hxgGHdHDM9RvOQ5O
	/ocheF4ZvxtK3237Wuq3qRzWvRupDzHdeX/RsJ0SB4yJlSjXFcLlUZjdAQ=
X-Google-Smtp-Source: AGHT+IGIHDJfl5vF8Rvi7TEt01YJn4rJglheaR2uVSkVPMd8VH5Dobn7YXwvEc8YA++uakW1wVMAZw==
X-Received: by 2002:a05:6a00:4293:b0:727:3cd0:122f with SMTP id d2e1a72fcca58-72dafa04710mr26067837b3a.9.1737515018124;
        Tue, 21 Jan 2025 19:03:38 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab8112c1sm9800337b3a.37.2025.01.21.19.03.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 19:03:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/14] ofono: patch CVE-2023-4232
Date: Tue, 21 Jan 2025 19:03:02 -0800
Message-ID: <476ef12ab91aada032ea0e6acc5a0044497ace25.1737514842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737514842.git.steve@sakoman.com>
References: <cover.1737514842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210120

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick commit
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=2ff2da7ac374a790f8b2a0216bcb4e3126498225

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ofono/ofono/CVE-2023-4232.patch           | 31 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_2.4.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-4232.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2023-4232.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4232.patch
new file mode 100644
index 0000000000..516cbf779c
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4232.patch
@@ -0,0 +1,31 @@
+From 2ff2da7ac374a790f8b2a0216bcb4e3126498225 Mon Sep 17 00:00:00 2001
+From: "Sicelo A. Mhlongo" <absicsz@gmail.com>
+Date: Wed, 4 Dec 2024 10:18:52 +0200
+Subject: [PATCH] smsutil: check status report fits in buffer
+
+Fixes CVE-2023-4232
+
+CVE: CVE-2023-4232
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=2ff2da7ac374a790f8b2a0216bcb4e3126498225]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/smsutil.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/smsutil.c b/src/smsutil.c
+index ac89f16c..a706e26f 100644
+--- a/src/smsutil.c
++++ b/src/smsutil.c
+@@ -1088,6 +1088,9 @@ static gboolean decode_status_report(const unsigned char *pdu, int len,
+ 		if ((len - offset) < expected)
+ 			return FALSE;
+ 
++		if (expected > (int)sizeof(out->status_report.ud))
++			return FALSE;
++
+ 		memcpy(out->status_report.ud, pdu + offset, expected);
+ 	}
+ 
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/ofono/ofono_2.4.bb b/meta/recipes-connectivity/ofono/ofono_2.4.bb
index 097a0e0566..a6a4852a63 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.4.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.4.bb
@@ -23,6 +23,7 @@ SRC_URI = "\
     file://CVE-2024-7546.patch \
     file://CVE-2024-7547.patch \
     file://CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch \
+    file://CVE-2023-4232.patch \
 "
 SRC_URI[sha256sum] = "93580adc1afd1890dc516efb069de0c5cdfef014415256ddfb28ab172df2d11d"
 
-- 
2.43.0


