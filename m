Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A46C02185
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 17:51:25 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.42246.1737395481574814529
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 09:51:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VHbzrSNZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21680814d42so76918065ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 09:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737395481; x=1738000281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEvEX0kAC+Ypa3s3SEafmlMytcX9xgDlWiE6OToSukI=;
        b=VHbzrSNZ9Cb0AW+G/DrkQHNdt0C3D52SC8nIYfWdmvk+vD7h8I72mxMU0izHa+qabf
         5+xwUHcD96bnXv7gOH0MYZ50eP2x/T3ea9VyRGMDT9S253OlE1Cw8JL+qjav4cZMM8QI
         LqA6lz1P6WMEr6a2Lv5Xzl2dsAwudgZcI/3dx4eiseM5syCyzJuDxaSNkxstKPCJWfb6
         jCVTLOqA4u4jVweM4I8b9Eh7R29RSsubWBHi+DOojgBLtVO49fDmOX2t/EM90RCcIsUE
         lvJPPulUXqAU9Ksh5x2fIgV/0QJ+UHxA0Fr3Vlfkz10OfNr2aVR+QKzjdyh5fvkj2k/T
         xByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737395481; x=1738000281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEvEX0kAC+Ypa3s3SEafmlMytcX9xgDlWiE6OToSukI=;
        b=vni244lp2yBQH+At6DZc/TMq4Xd2j6Wvo0ggJCoZqVyPR8LflQ6QUgHUyw1lhgUA5n
         kg/YgWbTDm9Xt17yt3V72GBQIPtqlx9dQhQw6RbUUCoNwhAOgvePTxGVimucIHfP9y3a
         Jra9MKeSKQDEzc3zWKfOZeFoXlaD421I/BwrYD3sMfLZrmW7ParrO2FXPThC+H9IQ2mM
         NC62x/ZXHXqwrfd7HL73dT7fKOEzoHDujjnP+76G/TkG/oeLhbDCy5nRmyGEmaL0TkKP
         fHT4aPmN/VqTkwUus7uXug5u/7VjWXAm7UOyWYkAucz+lu97bb1Sw7bKqpobcxhz/D/5
         90TA==
X-Gm-Message-State: AOJu0YzKQirEHggwmYJEFoMyoDjxrZz+c/Fc7Zn8azFtjbINy5JN4cRr
	Zx2EQfZrIBunuCt6iLkZ8Q6kEyUSfnMRaKfe+A5RxYeie2l/6VfEgk/DO6SUIYaMpYkJekld6WE
	30wU=
X-Gm-Gg: ASbGncuVskbxyHBMSnsNabr4aEbUKuOVdLeHKtLCxZwPZJySxhazjhYOU3iEvk7I045
	sP6ChyP3eCHhpd+SBAhBsGQ0nQfJPjUtEurjRxpdBqP5G2rIoxdmWG3u5gz8YpA9KhML0AYguK7
	86KRdU6lq12TZIOv67VPfio6TvoATnFppcD7XPuJAL+gLCwcCTkV1mhmL0tUzfnrxdYSpuQXm75
	ZcnYy7HwB+jfJcJXKZagCfH+cqw2W0E7Zn1wlg9CNsKLcr09up08OGVdiI=
X-Google-Smtp-Source: AGHT+IHHgKt45yqSNSRzuv5jUcd3aHGvJwuMRYE0uvLpvQdtMGck+HV/Gg9wZyVq6lKNz7ye+cxCvw==
X-Received: by 2002:a05:6a20:72ab:b0:1e5:b0d6:5496 with SMTP id adf61e73a8af0-1eb21481796mr22129958637.15.1737395480803;
        Mon, 20 Jan 2025 09:51:20 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf643esm6155565a12.38.2025.01.20.09.51.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:51:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/16] rsync: fix CVE-2024-12085
Date: Mon, 20 Jan 2025 09:50:52 -0800
Message-ID: <3fd8bea3e72573cca03cd3f6f4fc077cd2fd45a3.1737395091.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737395091.git.steve@sakoman.com>
References: <cover.1737395091.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 17:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210052

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the rsync daemon which could be triggered when rsync compares
file checksums. This flaw allows an attacker to manipulate the checksum length
(s2length) to cause a comparison between a checksum and uninitialized memory and
leak one byte of uninitialized stack data at a time.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../rsync/files/CVE-2024-12085.patch          | 32 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12085.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12085.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12085.patch
new file mode 100644
index 0000000000..165d5a62f9
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12085.patch
@@ -0,0 +1,32 @@
+From 589b0691e59f761ccb05ddb8e1124991440db2c7 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Thu, 14 Nov 2024 09:57:08 +1100
+Subject: [PATCH] prevent information leak off the stack
+
+prevent leak of uninitialised stack data in hash_search
+
+CVE: CVE-2024-12085
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=589b0691e59f761ccb05ddb8e1124991440db2c7]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ match.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/match.c b/match.c
+index 36e78ed2..dfd6af2c 100644
+--- a/match.c
++++ b/match.c
+@@ -147,6 +147,9 @@ static void hash_search(int f,struct sum_struct *s,
+	int more;
+	schar *map;
+
++	// prevent possible memory leaks
++	memset(sum2, 0, sizeof sum2);
++
+	/* want_i is used to encourage adjacent matches, allowing the RLL
+	 * coding of the output to work more efficiently. */
+	want_i = 0;
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index 749d44948d..6f4d539e4a 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            file://CVE-2024-12084-0001.patch \
            file://CVE-2024-12084-0002.patch \
+           file://CVE-2024-12085.patch \
            "
 
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
-- 
2.43.0


