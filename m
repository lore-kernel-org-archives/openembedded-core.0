Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD906C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:46:23 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.1936.1746805570921972598
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=alH/7cP4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-30ac268a8e0so2549886a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746805570; x=1747410370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mI0SPqSJ8B4VZs3fJC8KeKGWaq5+hGZ14igfpK+35kQ=;
        b=alH/7cP4WbvtF2Ad0sxJrKS9CdAqoO5ptU8o8lpMSMnAUY8d9Ln89J9s/RWTs/Pn/h
         EIPWNYtmBmVkHAOuXyHj5Ml2yiiuwpms8LmhNRtGMXLBMPCTS42HKZRZyR1fKWtLKcpX
         KqPImulqbiamRfGrAC/w7QTgMwxsb/Q7WVWNdpZQszsLwsKDT6LiKnADds77/mqBGvyB
         RGBsG+URouEhJ5eVcFAf9sFzkKpuZSsWkv08PVqWRXhHZpU3xEjorl5dNaRbw67L/XYK
         NsWZUuqjEUOooUdhro6MNGRAtwjflqwuTj5pBioMXi0F7MIkLCe7zgtWz2UA+yB3Ylkd
         pwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805570; x=1747410370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mI0SPqSJ8B4VZs3fJC8KeKGWaq5+hGZ14igfpK+35kQ=;
        b=U1w9X4phdS15Fmwi2IDzWEAnmFvq9ipe8Ir2kncw+C0zpKwhH1ct4pne7OsaGYkL69
         Fp8LP8ymp/GDW/f6TsWjOujaSTfxyLAy2V1kJG8JsPd75tB7DSYJLM0wkBGpuJdof94x
         lYK9XgPvRL2UWD27lQS2Qr7Hmtsysm06IZy+xDsmBOWMKQ28GhoiTDHCowO4wXF6IcS+
         erEix3DixuuUtW+Z75n6Y0G3vElXwSIFpTqbFKnRyJ4MzM+VrWr96R2TVhfXJkPNLzdf
         8D5vOV/6j1CJZmL8C4OIzMnk1U28QfL4UYlhwWZBssu7N80wBDQZn7w1V5OdtyP4D1VG
         XoKQ==
X-Gm-Message-State: AOJu0YxLjx7C12jjww2X2bpPEUYAEw0iJodtCuB3Pyhsc+ZecCIcRy1+
	bRFwGBuEpvxC+41TIroko9HGcufnBW8PwSTH0R033f2dBAKAeMKQGw0XuVmpQHbGVT+E38LALU0
	E
X-Gm-Gg: ASbGncvNASfYxTiqQ+L9aXL3H/IPdAj7n2OXohTBt2bA89fUD6Fx1p9TtIZMtLHh5dt
	pnVZvA/Jqy067t3VWDwyW2KOtftgGlAUjJGSyaQ22me/xPKzJN6tKE+cclolSRcuf8FOs7vf48F
	x3VdXtoKRkl8L4GLrRG1WIcm+vbw8P8FfHYyBaVCvmJgsjkimuZWpQq6OCrGxdeWDVl97KAXBML
	KIFn+UnViM8q8k7YzWE/tB3scctxmsTob/BFiqO+rRvfC/v0EwI75FwTj3Mp3k9VZThimkd5v6V
	DEqihM1jK5i2Z1LMqSTyvkNojPBIr377
X-Google-Smtp-Source: AGHT+IGdqPMAQsl4/Z+c7nY3NeM9rtMyt2L3TTwkYRhhLrV+r/oYjz8qEZorOjnGooY6mnsJ7CaUkQ==
X-Received: by 2002:a17:90b:2f84:b0:308:2945:3842 with SMTP id 98e67ed59e1d1-30c4011c2camr6032636a91.15.1746805569881;
        Fri, 09 May 2025 08:46:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39dee9aasm1983093a91.25.2025.05.09.08.46.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:46:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/8] libsoup-2.4: Fix CVE-2025-32909
Date: Fri,  9 May 2025 08:45:52 -0700
Message-ID: <90359036300731b6c26b646afbf3d66127b72fa2.1746805404.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746805404.git.steve@sakoman.com>
References: <cover.1746805404.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:46:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216231

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/comm
it/ba4c3a6f988beff59e45801ab36067293d24ce92

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


