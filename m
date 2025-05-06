Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A536C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 15:58:06 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.79930.1746547083489920717
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 08:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KqOEci1Z;
 spf=pass (domain: mvista.com, ip: 209.85.214.178, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22438c356c8so58624075ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 08:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1746547082; x=1747151882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIqxomu6IrY+nWkj7iEqf6jBurb4eos5MX2EBA2lgoY=;
        b=KqOEci1Z1qleKXI8z6qjuPjhlTkwsH8DBkNrXxWBSzElXEOhvpW3M3V9Q3zNe9bI5q
         +P5+n+vdB2IOViJnFL7Xbmhpu3prYg98hR50t1qq91gQlxGNDLs6MVRG5SvdnM/TKwJR
         fAmm9j6X7RQBl4Ru/K2jyFJebmKUPgeLFQifc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746547082; x=1747151882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIqxomu6IrY+nWkj7iEqf6jBurb4eos5MX2EBA2lgoY=;
        b=UsYKNdF9+sMA+Iitf8hpC2G/sN3US15jZznSVPDqBuncuML275nRcyobFHIRFLrWdQ
         kjLPiVycGfIhxIgxN7mc9OVo+bL/M28B7CUmDq9NfE6rpN40MhDi7Hnl8fb6El4vruGe
         BDi7R24nTTGQGmdT89vAv0iIbq/uNIKZJdQQW0DaXol3RkstMlUjjmXi9WcKiS75Ujuw
         hqCeNjPji1u/zw1Hpl1MX+2QXqnpNyr+/m0Dm/vhlsFsQGJjHCMNd8MzP9YxeRq1uYAR
         Pvhck62RhFincUlZM+BvXsbimqj7OTu6kD1I58cTMMtAmyN7dijkpd0fb3hkpGohW2l8
         OgFA==
X-Gm-Message-State: AOJu0Yxd8FHcypWHfbGKrmatoo113HJuR7+pyK7XPLVO5TLU94oLE8tj
	xCy9yuLyKmxq7pA1nxCeK2E7vB/h6LNok2F2V1fYhQ+d0eaHxgMEOJVUNdXNiv4cJEZ/fnSlhLP
	kaf4=
X-Gm-Gg: ASbGnctz9+ESSm+1EZmFGYJPUdQVgyNZlx/FoLWBOXYW/YbNW52YaK6nO6uzLpdCp6j
	57D9xyLI0dpX1ch3WBepPOXCix6Lsqkb5DCjldTKn/t0wKo5oZD8CmzNu5mn5WvtOWakfNKMqIY
	XVxYk2VUkrars4rJVhOQInyncFzqr0HfrGJcg3Yw39hIpSzbnPezjJn8eK0v6GDJnrF8ZwF8q9P
	mXrwoFfszkd6L1bE7/T9isGt6HpQwUP79DaoSkXyImzA+N0t9W3dtbbNgq9rRF5u4abrnw1ZtlK
	XtmzPPJL2B1mGCba8K3cYTEOjD2sIqXkziHkFak3FrfpfTjpm1g=
X-Google-Smtp-Source: AGHT+IFuR6hL6uF0Wtdx5BPWbW/CrDbOhejwlq4/OzJuDxdMNSdsjAlNUGto8CapuIOkDtxADS4Ppw==
X-Received: by 2002:a17:902:d490:b0:223:fbc7:25f4 with SMTP id d9443c01a7336-22e1e8e8234mr180956535ad.14.1746547082549;
        Tue, 06 May 2025 08:58:02 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.214.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152204desm75502685ad.140.2025.05.06.08.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:58:02 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 5/5] libsoup-2.4: Fix CVE-2025-32909
Date: Tue,  6 May 2025 21:27:31 +0530
Message-Id: <20250506155731.677168-5-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506155731.677168-1-vanusuri@mvista.com>
References: <20250506155731.677168-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 15:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216072

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/comm
it/ba4c3a6f988beff59e45801ab36067293d24ce92

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32909.patch  | 36 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
new file mode 100644
index 0000000000..046f20203f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
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
+ libsoup/soup-content-sniffer.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
+index 967ec61..a1f23c2 100644
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
++	  if (resource_length < sizeof (guint32))
++		  return FALSE;
++
++	  box_size = *((guint32*)resource);
++
+ #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+ 	box_size = ((box_size >> 24) |
+ 		    ((box_size << 8) & 0x00FF0000) |
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index c0c2209501..3aaa06a541 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52532-3.patch \
            file://CVE-2025-32906-1.patch \
            file://CVE-2025-32906-2.patch \
+           file://CVE-2025-32909.patch \
           "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.25.1


