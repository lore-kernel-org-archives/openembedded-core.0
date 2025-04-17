Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5401EC369D1
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 14:04:48 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.9758.1744898687769223875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 07:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CkhENQxI;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736c062b1f5so642273b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 07:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744898687; x=1745503487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iwphMBGlTY25vfn5AjfjyeCZTTgksIlGA0dYtp7hSI=;
        b=CkhENQxIl5/Sf6R537wEjsrQvXw+s4x3AloNGRfWJFLwpbqpa1tLxjb8Z8bh+g5IkF
         QNhqxk4TYzZZr+XFXR3BvQ5DSJHIMchyWWvOFCcWpLQ5rfTWnm6AXfwLqgRVDvuPxMHp
         KULvW6/kfl2zJ/T1jvgpL7cgS/erHb7OXDooM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744898687; x=1745503487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9iwphMBGlTY25vfn5AjfjyeCZTTgksIlGA0dYtp7hSI=;
        b=f/TUxMrK88F88ZGLZm+KmQBopiO70QI8qAdOEj9GzaceThTKQneXw28Q5CtOMDUdTf
         XE138IF4d6KlaXa6FEy3YWhT+4Sm80FsbFk5DTTBy6gL5BpWIkGhu7+tRl+3hyFOJIgG
         ixQDLL77/+ookqC9gS0ubP9x++iyTTQz0LiUF67vW+qNSGDED81jfZf9z4F4uV4bcJ5c
         UJfyfArgksnMBG/2Xlj89HA8MiGW1cxTG+VSEUocPbgHpymGda95Bhbp49qsNDRy3U8J
         nXQWf9MbSw9jPYbA/UZmi3t6EEW6ezH0fndxknRwzGhdAqokHcqdIX2PWGoviaNv7tyg
         2ezw==
X-Gm-Message-State: AOJu0Ywx/WgS9sTzKU6+iEw2IOxrYyHd6ZMEIrqaYz8TBjuf0829qKOq
	pQ0ZqgpCfUqUvMhQ0oTWFMzKV8MWrbPHG8NI3vFTs0CpJR0P30iF4oRr1LndPvwo3aB+6AshjGw
	rFAU=
X-Gm-Gg: ASbGncuUTwgn8pF0kWTwUvCJMgss/M5bET88yA7uPyokKwRDHDua5LyGdmg++P+vy4Z
	l4qRu44l2ktaXOg1chPosUt0DCfXqTnyc6mmUpnhZK9fnjLrSJ1lfKjB5dzSqteOsgE90A4PyWU
	/POZxijggfepgH41TqqBFYwpFjipzhSLsnh75Q/bBI7qSL8Y/ZlWw+Iet2588tbPhF6iI93w+Z/
	zpXfXpyMqdXMnhtWNUo/BDw8fVl9TLQWQe2Lnl92AAsZ15MiN4EcVM7ijsM42+h2FJMoUzcTuK3
	SIJN35rloGBGvlETcOzWlktSy78oLUjNd9qdy0bHGNGwYwwJeK4h
X-Google-Smtp-Source: AGHT+IEQaZ5PMbtIIuO3iTjYczWZier7aQvwxOLEAvrOw6mn9MtY8PAcLrgDcE9Bb/9g4dG/Z/iPkA==
X-Received: by 2002:a05:6a00:e0f:b0:736:4ebd:e5a with SMTP id d2e1a72fcca58-73c267f2c4bmr9581780b3a.20.1744898686680;
        Thu, 17 Apr 2025 07:04:46 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.223.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73db4717bfasm1127812b3a.129.2025.04.17.07.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:04:46 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH v3 2/5] libsoup: Fix CVE-2025-32909
Date: Thu, 17 Apr 2025 19:34:26 +0530
Message-Id: <20250417140429.136534-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250417140429.136534-1-vanusuri@mvista.com>
References: <20250417140429.136534-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 14:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215080

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/comm
it/ba4c3a6f988beff59e45801ab36067293d24ce92

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup-3.4.4/CVE-2025-32909.patch        | 36 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32909.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32909.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32909.patch
new file mode 100644
index 0000000000..8982da58f1
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32909.patch
@@ -0,0 +1,36 @@
+From ba4c3a6f988beff59e45801ab36067293d24ce92 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 8 Jan 2025 16:30:17 -0600
+Subject: [PATCH] content-sniffer: Handle sniffing resource shorter than 4
+ bytes
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/ba4c3a6f988beff59e45801ab36067293d24ce92]
+CVE: CVE-2025-32909
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/content-sniffer/soup-content-sniffer.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index 5a181ff1..aeee2e25 100644
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
+@@ -243,9 +243,14 @@ sniff_mp4 (SoupContentSniffer *sniffer, GBytes *buffer)
+ 	gsize resource_length;
+ 	const char *resource = g_bytes_get_data (buffer, &resource_length);
+ 	resource_length = MIN (512, resource_length);
+-	guint32 box_size = *((guint32*)resource);
++	guint32 box_size;
+ 	guint i;
+ 
++        if (resource_length < sizeof (guint32))
++                return FALSE;
++
++	box_size = *((guint32*)resource);
++
+ #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+ 	box_size = ((box_size >> 24) |
+ 		    ((box_size << 8) & 0x00FF0000) |
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 80cbbdf8ea..afba5ac12d 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32910-1.patch \
            file://CVE-2025-32910-2.patch \
            file://CVE-2025-32910-3.patch \
+           file://CVE-2025-32909.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.25.1


