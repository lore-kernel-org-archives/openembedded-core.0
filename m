Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC28C83F37
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 20:36:40 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.5342.1752611794929661651
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 13:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FTnwoTA7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23c703c471dso2747615ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 13:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752611794; x=1753216594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bh1tgzRWXezm0SwXsPZ+Z1XHmejd3kFUwFx2AZI+Ovo=;
        b=FTnwoTA7NWJZ8qnJd3P/Mv5JrAn7LW5hLNH+dsGMjXguXurZB9cw9JtPO3czfjX8tn
         6jRVRyxCZ7Kgw98C8DcTDUGYqSqDCL0pPB0Asg/yxe5gQHjJIYcSWfRproyLYCkHiTLF
         0AM1zx8P7LuSSA469FtPm8IxpjP0IdTA3/S+hmaHO/+QoLHMzJYn7UKcRYmK4hK6Ghu0
         we+pcAruSFqwwaaKr61YAbC02KaOU/n/JAiDsLM52qVsM/uTa7+vj72kS9Yhxkd9XmY8
         bypfoBkndihtkEZzjb/j7NGslIkfY6WQ5pzJ7B/9ltMg/14mu787z1XiikWkzOHPgaNb
         SSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611794; x=1753216594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bh1tgzRWXezm0SwXsPZ+Z1XHmejd3kFUwFx2AZI+Ovo=;
        b=RtT+CxPZiz1LeibLaqSkxd4A9bxY+dfX55NilPqchgoMx2qjE84T9Xb0wcnvzyt/8b
         A1w5llYI4RUBi5E4ugZLDMIcm/gvsl0d16YvshvepCK/JJU1sRiPw9bCARFuOCFqoFP2
         iQLycXIwvUdSGf2CFx2ptLqWHXVcQqJf/rQpje11nru/xYRuRy5Uy7DT/zAcQb/nEKHb
         eGG9w+hKTPps7s+x4656iIjcZKO4Tn2NZJKSUmqB0r+ZkyGDz+GzfuI8OQSdiVouCjTk
         syU4ai1u6ftymARS8T0w1jQ1izBkwpQnPUmRr6gRP5P5aNuGmf3CREahmfp2zJIBi2r/
         ePHg==
X-Gm-Message-State: AOJu0YzewavZzXxxUyx0xSB7qXErFJf9cLevE7YhJTsWEoB3JKxKTdPe
	kF5ItGdOFawl/FJ7hfo/hUFbyOeU/9dX2r6Rz/IEPnKvuReJEMy8VM2ZwlgZaFS2bgSjJFK7Hwj
	Oo6Oh
X-Gm-Gg: ASbGncuTFOcV/IUv4y7MWPSSRMvW6KI19hhD7O3A735Qdu4XWu8uIVlykNqvYfdOJNZ
	u/0Mbnd5lkawrnD8idL+hZVtQSXV9uoHOEJ2ZzMs8TdsGvXX+roBlLEfRMSptXi2OBX7k7R5HJ1
	qhKG6RUSLDlEs8u/yK4ZUsq9HSohLguyFl5P5TEiOZJevlPx6K0qnxheDbm60T/MJfruUAkCfrE
	zINZBHr58QR9JVml3dpYpomF8LJZhoYIsHUZrktYECLzY+M0hdmlfY5FZwAtjtvasYufnMKbNfx
	FsixMLqv8S9ARGpC9rMc+EyDkoPhffYvSiN/Lq7TaBqcnyuqNZeVQaILS6hsKzkJon5oDFwEkQ3
	puSh9NO2zaA6mTw==
X-Google-Smtp-Source: AGHT+IHeBHKQZpaD916hz17bUZEhgB1d2sKyyLvp8XEB/JAlq4YW1xLECYcLBreTklf7KU57SS2iRA==
X-Received: by 2002:a17:903:120e:b0:221:751f:cfbe with SMTP id d9443c01a7336-23e24b33eaamr9418495ad.19.1752611794084;
        Tue, 15 Jul 2025 13:36:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5c42:3781:50b6:b9d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43637f2sm115585595ad.241.2025.07.15.13.36.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:36:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/16] ofono: fix CVE-2023-4232
Date: Tue, 15 Jul 2025 13:36:08 -0700
Message-ID: <02005c81a55930d9f57d44674cdc5eb6171c8c76.1752611671.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752611671.git.steve@sakoman.com>
References: <cover.1752611671.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 20:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220416

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in ofono, an Open Source Telephony on Linux. A stack overflow bug
is triggered within the decode_status_report() function during the SMS decoding.
It is assumed that the attack scenario is accessible from a compromised modem,
a malicious base station, or just SMS. There is a bound check for this memcpy
length in decode_submit(), but it was forgotten in decode_status_report().

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ofono/ofono/CVE-2023-4232.patch           | 30 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-4232.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2023-4232.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4232.patch
new file mode 100644
index 0000000000..da714f6a87
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4232.patch
@@ -0,0 +1,30 @@
+From 2ff2da7ac374a790f8b2a0216bcb4e3126498225 Mon Sep 17 00:00:00 2001
+From: "Sicelo A. Mhlongo" <absicsz@gmail.com>
+Date: Wed, 4 Dec 2024 10:18:52 +0200
+Subject: [PATCH] smsutil: check status report fits in buffer
+
+Fixes CVE-2023-4232
+
+CVE: CVE-2023-4232
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=2ff2da7ac374a790f8b2a0216bcb4e3126498225]
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/smsutil.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/smsutil.c b/src/smsutil.c
+index ac89f16c..a706e26f 100644
+--- a/src/smsutil.c
++++ b/src/smsutil.c
+@@ -1088,6 +1088,9 @@ static gboolean decode_status_report(const unsigned char *pdu, int len,
+		if ((len - offset) < expected)
+			return FALSE;
+
++		if (expected > (int)sizeof(out->status_report.ud))
++			return FALSE;
++
+		memcpy(out->status_report.ud, pdu + offset, expected);
+	}
+
+--
+2.30.2
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index 9f11af9236..8a298bfade 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -26,6 +26,7 @@ SRC_URI = "\
     file://CVE-2024-7547.patch \
     file://CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch \
     file://CVE-2024-7537.patch \
+    file://CVE-2023-4232.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
-- 
2.43.0


