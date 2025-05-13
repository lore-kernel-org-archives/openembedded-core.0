Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337F3C3ABDA
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 19:08:34 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.84427.1747163306858074748
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 12:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FksP8Tez;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af6a315b491so5266972a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747163306; x=1747768106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ixoyjIAeCAkmK9RJPXu2mahAn9mu9AFR2OUKixN2Ow=;
        b=FksP8TezPu1TYVmj2hw2DNihkf7Ej7nZsAPO1TKVDIlZoB8u+TGHigIfcKwl7lrkHA
         0qHLFAQG40/3bZBQ2l/sXPTFlKXPZ7F0MAceP1jBHpHAvsg8jq+DH3qVWMfm9b9ZwzYi
         Lq0CMNmo1kmHiRGzctQg+dNWYD9DMlDsQRQe+A46SiY1bHa/e377SXwvt+NIPMudKEd4
         1rmxDezZqAmwsDxvF5JezKXSCikpJ5e30EByvqNdwZNCnPWVtBVz7lnqpl+HEXZqmbGY
         a75mJvgdbdAJYFF1JWhnnhC93wf1aMmdx3u0lxdDkNdbVyYAVjX77lXhInFcDCZCXR2S
         ktUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747163306; x=1747768106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ixoyjIAeCAkmK9RJPXu2mahAn9mu9AFR2OUKixN2Ow=;
        b=oS+Cge8DCOsik6SSjXUWdrtz3sFp+iipdodNLbBc5yneExjGUUcRihWAUShz5r+V/u
         kWvQBABMazfhogrgC9XA969QyoVmCSUZvc1kp0Bc7g0RGBFqCmNPcuw7EWPHt7I5/ECp
         RiF9qR06+WP2E1MF+G6Ov93qBmrefa7Mz9Vn6S166mDRQAfoTUvARYnJAY1DrIFyRaE7
         iHTxyqFlevV4qCusfbCQl+cNuY0Jr3PexnP6nkekIeb7/ji5aOnjRCIxOB6szSosF/4K
         w9uBVLAB+wal206REdgaKAoRQqW5BE/Ar9MH+Ocqsxju7a0aEDYTKNlVyr20jKvGSZQc
         ohmA==
X-Gm-Message-State: AOJu0YzQNg5QijPH+VKyWXj2UkfSJNePTSykhlmgsHyTPJ8QVo43gdya
	QUR25HzZ6tbzwIi1sQZbw7CpK2di54X23Qvn/vX8WrOONHOlmV5r4Lg5BdTg4JHbfNHGvdWZD9W
	x
X-Gm-Gg: ASbGnctHneoF+XroiaDhyTIGQhdmNv0PWGWQA0/Cmqis/+HREeMVwP+y6RW41Tk5SWL
	c4jkJYWzz90+N8XAM+gFcGSFlDSG/y/+w4k3CHriZfZHM5uvXItmwiVlSpW5VhKsSSWu+AEd5kF
	VUCGjfszyjkkEQ78RRfsmz87OCmcHaZ6pI9tTPIEhzYwUocp4zCBYq30DPOGjjMm3sPz77eEoaV
	Y4/BPk06WFniF0+OlB+R+FPjRbdp/cXUYhHPz/OGElyHIO50psVTUW6MxpB2GFmMEsZJKrpQcCy
	+66bEhLFQd9XZzrZemTD2MFsTE6tx8YE+3WeWECsCv4=
X-Google-Smtp-Source: AGHT+IHWRwWw1CEg07EqBvEsmZGVcoEA/7FpSu/QlhrEHl++wOpJ84nvXtNhdhEpDSoMCFNMoxEKbg==
X-Received: by 2002:a17:903:8c3:b0:22e:5882:1812 with SMTP id d9443c01a7336-2319819ec3emr8282625ad.32.1747163306057;
        Tue, 13 May 2025 12:08:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:37ec:faaf:5b57:6b2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829d425sm84851005ad.202.2025.05.13.12.08.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:08:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/15] libsoup-2.4: Fix CVE-2025-32909
Date: Tue, 13 May 2025 12:08:01 -0700
Message-ID: <ad1244ee75b4169eab21c2c8744b86342b32dd07.1747163155.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747163155.git.steve@sakoman.com>
References: <cover.1747163155.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 19:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216437

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/comm
it/ba4c3a6f988beff59e45801ab36067293d24ce92

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32909.patch  | 36 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index f409816fc2..00f7fea41a 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52531-2.patch \
            file://CVE-2025-32906-1.patch \
            file://CVE-2025-32906-2.patch \
+           file://CVE-2025-32909.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.43.0


