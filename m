Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA896C71130
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:08:57 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.90685.1749571733981038995
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=t0w2n4Xa;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2350b1b9129so37163065ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571733; x=1750176533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIIrbz1QgyoT+Ym4DrUGznUQOoox+0yJGGNfHgmnFkw=;
        b=t0w2n4XaHMdwIrYdKdBBYz0lnzPHNsOmbqw0ESTKkHIZTZzgXR3LeXtyUaW4+XUuSq
         0+i8ZctV0OnYGdZ5I/jvAFfzHSLNAAjDa9ivo16qPjD5tjS9fYcXdT3mANGX1HpE71Uk
         TJfkRdynvOELsY18jesf/ArouqnqJB2AqKO3HrBRy+6VzqO8DVX3oixBpQU5YwLFb3e/
         /5qzUyuRhVT8JwLgabl+D9jABoNFnu9FvA1SyqLsABAZLl8ilia/8huykZglde29J707
         vwPg8bNpTOrd5FuZBna3hUtgEtXW3XGex6vtGTpYkesUxMS0rXZY24P78tOfxCWiyx0+
         cN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571733; x=1750176533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIIrbz1QgyoT+Ym4DrUGznUQOoox+0yJGGNfHgmnFkw=;
        b=pVHwCJ7ot73ecT/5RbbsKa4fxNFWQNwxw+YehdEmx0q5y75cZByQAps/JrrfNx5gJL
         6806zWD/lIiasY5Bp9g0IZAAsLLpCFY4572t1oYU1KLJei8qUInE/079biWAVG6HRRBk
         1iS/vruZA/uNi8DRlKTb9gO6yRYGiVV8wGKsB0BSW2f8tGVRUT6j3bwT+tiWknoDrwb6
         /g26Jy0DDHcMRz2MqjJbJJGlj+VTD0t2z5Frg5RKwGPm801lr3utXhHkXQIDyOHxj8+s
         I9IIVmrgJeaZuHxWX+PIilDwLruhqEX7HjkJzh4hELtfYRWDKoYV+XdxisHibjogfTIo
         ovKQ==
X-Gm-Message-State: AOJu0YypMJ0bd/REp1weuL82ov9OfeMHY8plNBanMXQcTIUyB6HYREPq
	DnxzSCwLvZ112UXuLeOLbaFBhLGYo4RSvrupbR5dnjQn0BJXzLCsNosJdosj8GfTQvbm5LDG2DS
	oRN59
X-Gm-Gg: ASbGncuaur+X4ASZfykzMeukU1+zMh9c+MqpDXx62ISgCcI+7TrK2TLWeJo70ramlbA
	lKC8+mlLxxFXiBLphswIENFUmz6B+pGxpSyKDf/h4n692vwF35s23eU5+Al2kji7KR9mczf2FbW
	yqq8l+RPOGZDZj0FC7VBvp1mxbKbPJhzK/A6/j7+jh0dQjm6w/FWria/Ao74LAIpPKBOLuJ2qlE
	WxqhDsl90bJni6rpB6/eQl6JmFZaNzmD7nOZg0tNMvei+dgSsp2xUASX3fumQ+9pDePU/hBGduh
	cSbokWE3z2wLoiMgHMNkoJ4K23e/xnkb4Oj+BQ6PIH39p5Rlc/NQag==
X-Google-Smtp-Source: AGHT+IF5jJ+4+ycsucfCb11V0dLsXGVEIqIXLtrBohi6GS7FVUbbTJ8ns6DnGKFCvT/LBCigHMKxsw==
X-Received: by 2002:a17:902:e845:b0:234:9670:cc73 with SMTP id d9443c01a7336-23601cf2f3amr266075535ad.5.1749571733085;
        Tue, 10 Jun 2025 09:08:53 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.08.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:08:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 02/32] libsoup-2.4: fix CVE-2025-32053
Date: Tue, 10 Jun 2025 09:08:15 -0700
Message-ID: <2f8307a3795ccaff50fbfb4fe716cdf37f1c82f2.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218371

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/426

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32053.patch  | 39 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  4 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
new file mode 100644
index 0000000000..0d829d6200
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
@@ -0,0 +1,39 @@
+From d9bcffd6cd5e8ec32889a594f7348d67a5101b3a Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 12 May 2025 13:58:42 +0800
+Subject: [PATCH] Fix heap buffer overflow in
+ soup-content-sniffer.c:sniff_feed_or_html()
+
+CVE: CVE-2025-32053
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/eaed42ca8d40cd9ab63764e3d63641180505f40a]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-content-sniffer.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
+index 967ec61..5f2896e 100644
+--- a/libsoup/soup-content-sniffer.c
++++ b/libsoup/soup-content-sniffer.c
+@@ -620,7 +620,7 @@ skip_insignificant_space (const char *resource, int *pos, int resource_length)
+ 	       (resource[*pos] == '\x0D')) {
+ 		*pos = *pos + 1;
+ 
+-		if (*pos > resource_length)
++		if (*pos >= resource_length)
+ 			return TRUE;
+ 	}
+ 
+@@ -682,7 +682,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, SoupBuffer *buffer)
+ 		do {
+ 			pos++;
+ 
+-			if (pos > resource_length)
++			if ((pos + 1) > resource_length)
+ 				goto text_html;
+ 		} while (resource[pos] != '>');
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 22cbbdb1b8..b42a8f9520 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -16,7 +16,9 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://0001-CVE-2025-32911.patch \
            file://CVE-2024-52532-1.patch \
            file://CVE-2024-52532-2.patch \
-           file://CVE-2024-52532-3.patch"
+           file://CVE-2024-52532-3.patch \
+           file://CVE-2025-32053.patch \
+"
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
 CVE_PRODUCT = "libsoup"
-- 
2.43.0


