Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7108DC02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 03:03:47 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.34195.1737515020629193500
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 19:03:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DFUb8gpY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f43da61ba9so8410016a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 19:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737515020; x=1738119820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KgKdcH/wdD6aFcxZdHCuv0n1RGp8D6Z9Y3y7r+iNFo=;
        b=DFUb8gpYrhkKRZWSVBrVC3jYtE+SJ0yM/Ah9beO3MgmpAsFehRYmgYapNh38pMGWIA
         ynwQJPyfAFedbbFWjtB9YZaclkNoQtcCTlvsCgGV9A0xkLOi0+//1GzsHW/WqkihhYpf
         EsLiA9rBHqpAq7F8lpVj9S5JARA4q9EgeLKR2LLO6nI32/51qRDUIzym34Eu3g3YAx+e
         PoGgWYrqwqMftvGH4w3PT8ax+s3X4vWllTEjVCtsmIW99c5Q7yngz2LY1afecIz+61DY
         hFSOuOocy7nbPXB7gJyqEkcUN0VOlzNOFC3eB7zn/HGMN8R1cZ2+V70IYQOoctaLZnDJ
         8Dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737515020; x=1738119820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KgKdcH/wdD6aFcxZdHCuv0n1RGp8D6Z9Y3y7r+iNFo=;
        b=epj+QHT4ag+zrgQnJexqcD92pNlWSBoFD2dyBEf7jZWitx/fGZH8XEntWKUOTawRt/
         f4Ociw9+99NuLjPeTb5e1V47Y35fuPH32oUcG4eujmYDQh6I+PsxKLiMRURP9BSo6Zx3
         OelJMROFmHv2iumHr0wsXfGPafyzRHz7dymi52TjwM47drb5XA0YlebOHp5+JBowZLS2
         yNq5U5YQKSFKcKagi9qOIGWp6OK6op0c55WFInlvxQb/BBlGeyPkreS2GWunaM2QJEtV
         R4qdbYWAwPgm698uYHMnv5UUmgg8eBdZ9M455KUOERXjdOXGkMOPvw6O+k1td6rJ/L3/
         5yDQ==
X-Gm-Message-State: AOJu0YxPoPaPfaoujy9aHt2qA0oarPUUaN23DZYc6cqyHkArxZB77kUW
	aLQw2VB8pasRFrSIma/fJh6H+xBjCj7qnCVE/d13J8wWoRTfHy8rx4iF3JkafMGwffqw2XplTkX
	a4aw=
X-Gm-Gg: ASbGncuMLi65KkXpUryvgxhLRPm0YE6vcBnPKHndbjwo1ObhSTL1bA3Tzs51gZQboOq
	RiOMrpH7+8gQxr1HpRmHFeTtd8JGboNDHcZrNt/Uh6ldaWQsYSfhtdM0TzMuFI8Cv6oloMFzS7o
	QDMhFrTzdYCm0JMI0VrDvx0IMYMn7xV0TPnyJyqIhVH3ChecxIl/r74v+gn/ft2tdaVSJpyZo6Z
	5KR6OxxzErA8SoOvuKa/+jRkJQ66XeXEsIMFZEQVVW8KIbi7S26P0adSac=
X-Google-Smtp-Source: AGHT+IEwgUd03bSpVTE+5I1TBbCFg3dghwWiDIJXhW/TGLX5zmTGvROq0TFcBlIxowH9e6JRxBmyrQ==
X-Received: by 2002:a05:6a00:4c94:b0:724:e75b:22d1 with SMTP id d2e1a72fcca58-72dafa800c4mr28352406b3a.16.1737515019877;
        Tue, 21 Jan 2025 19:03:39 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab8112c1sm9800337b3a.37.2025.01.21.19.03.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 19:03:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/14] ofono: patch CVE-2023-4235
Date: Tue, 21 Jan 2025 19:03:03 -0800
Message-ID: <5adbece7dcbb547ea44207fa1a9ddc7d56766b1b.1737514842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737514842.git.steve@sakoman.com>
References: <cover.1737514842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210121

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick commit
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=02aa0f9bad3d9e47a152fc045d0f51874d901d7e

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ofono/ofono/CVE-2023-4235.patch           | 38 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_2.4.bb  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-4235.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2023-4235.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4235.patch
new file mode 100644
index 0000000000..059f9bbfee
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4235.patch
@@ -0,0 +1,38 @@
+From 02aa0f9bad3d9e47a152fc045d0f51874d901d7e Mon Sep 17 00:00:00 2001
+From: "Sicelo A. Mhlongo" <absicsz@gmail.com>
+Date: Wed, 4 Dec 2024 10:18:51 +0200
+Subject: [PATCH] smsutil: check deliver reports fit in buffer
+
+Fixes CVE-2023-4235
+
+CVE: CVE-2023-4235
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=02aa0f9bad3d9e47a152fc045d0f51874d901d7e]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/smsutil.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/smsutil.c b/src/smsutil.c
+index 484bfd0b..ac89f16c 100644
+--- a/src/smsutil.c
++++ b/src/smsutil.c
+@@ -1240,10 +1240,16 @@ static gboolean decode_deliver_report(const unsigned char *pdu, int len,
+ 			return FALSE;
+ 
+ 		if (out->type == SMS_TYPE_DELIVER_REPORT_ERROR) {
++			if (expected > (int) sizeof(out->deliver_err_report.ud))
++				return FALSE;
++
+ 			out->deliver_err_report.udl = udl;
+ 			memcpy(out->deliver_err_report.ud,
+ 					pdu + offset, expected);
+ 		} else {
++			if (expected > (int) sizeof(out->deliver_ack_report.ud))
++				return FALSE;
++
+ 			out->deliver_ack_report.udl = udl;
+ 			memcpy(out->deliver_ack_report.ud,
+ 					pdu + offset, expected);
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/ofono/ofono_2.4.bb b/meta/recipes-connectivity/ofono/ofono_2.4.bb
index a6a4852a63..5ae63e6ef6 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.4.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.4.bb
@@ -24,6 +24,7 @@ SRC_URI = "\
     file://CVE-2024-7547.patch \
     file://CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch \
     file://CVE-2023-4232.patch \
+    file://CVE-2023-4235.patch \
 "
 SRC_URI[sha256sum] = "93580adc1afd1890dc516efb069de0c5cdfef014415256ddfb28ab172df2d11d"
 
-- 
2.43.0


