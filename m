Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DE5C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:18 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.90692.1749571748452841414
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G++2tPFC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-235e1d710d8so69455855ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571748; x=1750176548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4J/cpgv3Sf7hviWIGB3BwFK15nn6RlGtLGg3SXJRrVU=;
        b=G++2tPFCfKL821M+zqgNe8yZWqUTPuY/hbduM6FWTYiLzun5aJ86heqLSmo+RCltwN
         xQNRU9AoW0TrXAdsJp5jtHHCvuy9KICYL/bLvKOHtd9jiHDuyxeO19GvO66kiZdLjBES
         mnpinhmqrROKxLw/LTvDdY/RashreWHlPQe3tdBkzFb4iOUKjnDZJ9OlQiAhh9XBb7dN
         6xihTCXv5LTPSIFQto1B9qrKWGqxIsN+vjQ0qwFkGMRZX8SPx+adMB74QPguinE9yqeh
         XuAabzXD3bNXv9gsQlDuHzKLIAp77myy/n5y6IT3B2f27GYTblfdrwJDp2Ju1/vfNrLa
         +aLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571748; x=1750176548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4J/cpgv3Sf7hviWIGB3BwFK15nn6RlGtLGg3SXJRrVU=;
        b=cYPJpRkmRdOhs2eQ7xGj9/Nv/GdbWJjlJpdSQck35+vlmPxdJgfiWgTH996RdSxJlV
         l1HNK/rLKrK2/JB7feY2/tvvSfqzjzpws1lW53T/N8Mhv/u+VmECCopUoQTff5aS17Zd
         B++A+I9EUymDmPFAwDfcQtkOpB300fk9Xo95JGq3UdGj3yxuLGq91TXfjTY4MBPVX3dN
         eyXmh3NbyXPfvCOC81Y35Zp+vVapthFvPGjF/du0SHpqDZTG+u1bi/FQOC2poWszRXRc
         FiiN3l7DUnO0eCXaqfj1+/as8fMlD8Arj5RpS+iW/j75L3g2uztEiyWVCKtKCURYW3Cw
         OF4Q==
X-Gm-Message-State: AOJu0YzaOFQFmG7kzcTJhTNlaeUT94m+sYG97pjpk73VaJbWadF+9TX7
	2JHTzPXCvXmMK7kgSKWAtE0HTn6dhYPrsS+u3hVVLAaNIkgFH4w2E7XglVN5sM8v+Jh26KxlaAe
	pFKMI
X-Gm-Gg: ASbGncsEv5FFbxHPzwZlqAadrf/y+4RG+kTP53UlCKIjtlBUQC/SugOmfUis41yMEGr
	oRZm61MGjXjyzmkNqI2+vmryddgutKeGEcPSBSXg+Ml4OaV8OzdyIIjJSZRZZDb1VS9blS6IMU0
	WBaDr+A5MKgyGUZfD+78j9CtqVGkp6ABkVYHsq+n6y0zyQYT9wkrUKlDm6iFcqb/Xn47I30Ayke
	shde2EUKanBC0ZHWUYTaPyjuVI5LaH2VFqP2BMYdFDZ5kn3JGIeQAHrtO0oJEBohj81oYX1SDFx
	S9sISOa3X+nSgYHbXUFUugCc6lnxpeWzNhWb5R9LaOPXtxCPgOdvPg==
X-Google-Smtp-Source: AGHT+IHdDSHPGmNO4EF/JnU0I1REJLkhBufepwCtWxWvHNzzZG7DNp87E5/w151O8zQt204KF9pA6w==
X-Received: by 2002:a17:903:1aad:b0:235:caa8:1a72 with SMTP id d9443c01a7336-23640d0b967mr5384815ad.30.1749571747673;
        Tue, 10 Jun 2025 09:09:07 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 11/32] libsoup-2.4: fix CVE-2025-32909
Date: Tue, 10 Jun 2025 09:08:24 -0700
Message-ID: <2329f4f77fc9403e42b0c97dbd693c5d8bc906ae.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218380

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/431

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32909.patch  | 38 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
new file mode 100644
index 0000000000..2f5366348d
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
@@ -0,0 +1,38 @@
+From e6e088e62c10ab91fa2f2ad5c122332aa7cde97c Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 12 May 2025 16:55:37 +0800
+Subject: [PATCH] content-sniffer: Handle sniffing resource shorter than
+ 4 bytes
+
+CVE: CVE-2025-32909
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/commit/ba4c3a6f988beff59e45801ab36067293d24ce92]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-content-sniffer.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
+index eac9e7b..73d2245 100644
+--- a/libsoup/soup-content-sniffer.c
++++ b/libsoup/soup-content-sniffer.c
+@@ -227,9 +227,14 @@ sniff_mp4 (SoupContentSniffer *sniffer, SoupBuffer *buffer)
+ {
+ 	const char *resource = (const char *)buffer->data;
+ 	guint resource_length = MIN (512, buffer->length);
+-	guint32 box_size = *((guint32*)resource);
++	guint32 box_size;
+ 	guint i;
+ 
++	if (resource_length < sizeof (guint32))
++		return FALSE;
++
++	box_size = *((guint32*)resource);
++
+ #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+ 	box_size = ((box_size >> 24) |
+ 		    ((box_size << 8) & 0x00FF0000) |
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 01ca9f8966..510d1128db 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -26,6 +26,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-46421.patch \
            file://CVE-2025-32050.patch \
            file://CVE-2025-32052.patch \
+           file://CVE-2025-32909.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


