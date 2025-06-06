Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA76C678DA
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 16:00:33 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.37091.1749225627590584306
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 09:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OkPPJzLy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742c73f82dfso1880584b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 09:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749225627; x=1749830427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VSk8ft0i2bMWMvRgk6uRO91eUpVswEFWtff0PpYLOWQ=;
        b=OkPPJzLy0n0kftKzwRVqyE22JZYJYcE8qVk19bgQ3l58IRTfD8dNFeAkXA1FNlole3
         vRngaUWYFuurCAvok8sUQu/xfWpXJwfqUGC82qeZx9Q7ipiGRe7KaEjyYumfhBjVI0oq
         YucTr7fdi/XZQUvdkkKleNQRjtx7WYUfnGM2Y0RM9Fy5Ju+Jv4Y+aBYLeZ1qLmemvtKt
         XiRjJ0ubZ3DYgoMCthhZMJoHDYbYYa2/EuFkL1vKarsbivF4lx5b46mv35FAoLnN3P6b
         hacSjGXZMcGnw7uAZJ3wJOnnHQYmFohqjVFrlFXnhXkb9TZ2p+5ITT/0Z47wCjSFCgzS
         uM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749225627; x=1749830427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VSk8ft0i2bMWMvRgk6uRO91eUpVswEFWtff0PpYLOWQ=;
        b=E0Q3DiLbcdkd20Z1oiEVCX511Ie2YGm4L3L4i8jC1o9zFhGZwiDDShD7rjOh4uYidp
         8J/UlPdC7R4gy6zGYpMsnR4AIQf6zsi6sBxRFOts4veM4intv9+Cgcuwu+rQTYdJWzty
         UR+OKsVcAfKKAEKMx7HTl56m06RDjc13tzHzHzI7zoffWzwYFEFoUIN9NlIfcQvXL2/u
         X9+TjyL6LBGTmTdvcoqcSgNcJ0ImlBk+ixiYIfTSIbDRMSFrtZoZlfnf/6PjUlzexzOV
         hBmggiLvbIMTmuSePKwEROEpzK5IJQImezfSr8K4W3Ywr4CEoPj/LwgiBcCfq4INUNkM
         R02w==
X-Gm-Message-State: AOJu0YweybdOfKskjyTtY2D3M+t3fs/NaVoF9zm2yVIZ8B7KztejluTq
	OYZ4X+sbOAlZ8gM4LQ3lzcbw4w3liDjTVGr0AYb0+SKJjGPpzHkFLKLI2w+CpWJwgPOocLSr9nN
	meQCG
X-Gm-Gg: ASbGncviV4xVndb2lz5+jsJW+z4nQJQvaLfhwApS60k77qVGe6HyotlgGkbX/0fMOjz
	OhOJoGOnHWVcfKbzsgK0M/gAlA4vBGMIwOYrmFzW7Iu2bv2Npz4/jWlPTuLs7BfMakbmKl+8E/i
	7VLzIKYM1bLAU4pFHZteNQ01CRQX7gdhMrehAmAtoR2/vxqoPkF3gAg0lCHBfkyu2ZcQd2Y5AyY
	923nNMUt9eI+K6x0axnx50FnJu+Cdw11EZVn+h2G7FRTdtq4A00OHFQq56w5Dp6+vnbzwadSEB9
	mxLfykOljT9FiDTkGbgJkmJM2AI0FfpfKb+sfO+RRJc=
X-Google-Smtp-Source: AGHT+IHUbNESd6XZXpJBiFybhSAmpZFdxKyv/GiV3Xr7i8OhI1WjP+S53Yqb1fFMoeL/sHTT3qRQ+w==
X-Received: by 2002:a05:6a00:14d4:b0:73e:10ea:b1e9 with SMTP id d2e1a72fcca58-74827e7315emr6146796b3a.6.1749225626397;
        Fri, 06 Jun 2025 09:00:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:742a:4153:2a1f:f028])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b083a9bsm1436489b3a.77.2025.06.06.09.00.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:00:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/12] libsoup: fix CVE-2025-32053
Date: Fri,  6 Jun 2025 08:59:59 -0700
Message-ID: <7ce73ed9b7125d02abcf8ec34c80270c2e340d55.1749225418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749225417.git.steve@sakoman.com>
References: <cover.1749225417.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 16:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218168

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/426

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-3.4.4/CVE-2025-32053.patch        | 40 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32053.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32053.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32053.patch
new file mode 100644
index 0000000000..93fa69e06c
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32053.patch
@@ -0,0 +1,40 @@
+From 819dbc0fcf174b8182cdb279f7be15ea1cde649f Mon Sep 17 00:00:00 2001
+From: Ar Jun <pkillarjun@protonmail.com>
+Date: Mon, 18 Nov 2024 14:59:51 -0600
+Subject: [PATCH] Fix heap buffer overflow in
+ soup-content-sniffer.c:sniff_feed_or_html()
+
+CVE: CVE-2025-32053
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/commit/eaed42ca8d40cd9ab63764e3d63641180505f40a]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/content-sniffer/soup-content-sniffer.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index 2351c3f..23d5aaa 100644
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
+@@ -646,7 +646,7 @@ skip_insignificant_space (const char *resource, int *pos, int resource_length)
+ 	       (resource[*pos] == '\x0D')) {
+ 		*pos = *pos + 1;
+ 
+-		if (*pos > resource_length)
++		if (*pos >= resource_length)
+ 			return TRUE;
+ 	}
+ 
+@@ -709,7 +709,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, GBytes *buffer)
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 687b14d9d6..ff0ae0afad 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -36,6 +36,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32908-2.patch \
            file://CVE-2025-32907-1.patch \
            file://CVE-2025-32907-2.patch \
+           file://CVE-2025-32053.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.43.0


