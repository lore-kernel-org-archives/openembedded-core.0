Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627B9C83F2D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 20:36:50 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.5500.1752611801284996552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 13:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZeSihVjQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234fcadde3eso73266195ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 13:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752611800; x=1753216600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8qaytqthQITPkUR/BdVbU4+lJsWGCnwZRiBaXAH958=;
        b=ZeSihVjQjiUDeoZdZx5Q4q8BcQRbCIziVG4hT78Rvfj9W8LQYTLrofVKjukf3UXCyU
         mn2OHXAEcTltsyl23z32KKTIb2OmUejMIZGW79Do4SRgVTcmKcoCFVJlcLrZLoDraqO8
         RC5N9j+zeg4xloF5r9f10XE/F9JQUalzSMj/XT/M/zPwdN/O0fT4xjltttdmuYkkYMB8
         8TrF9x9d7tgYelU814jk7OU3M+ZbxUKOoyby+FGbyvLZicQZT6mfNRq79JIQS6Myo3Tu
         0g9RMuxRBAxR/a7WUvU9S+kK41eUYCXXKob46Tw6ElXmrbIthNeHEO14yRp6664OemuB
         EG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611800; x=1753216600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8qaytqthQITPkUR/BdVbU4+lJsWGCnwZRiBaXAH958=;
        b=O1TbnzcrE0BkOMLAyOGOAp+qk10/n0bqUEdnhd05frqSomCmB+e0n5fOipVTpHHq4h
         2DPOQmlkxOyvZjBac/qfx0XH/IfFyQiJpMvd3ez7H+2VcYR6AxxXxUqWxXoNxOzL3Twf
         bbGNTkJKnyiocD0ukbUM3Y7L8q0C6n32IuEmxKyW+UwrBPXPQOPBcLxp+sjzzgeu7n4l
         +GLzfhOFozuPkmHbCEdAIiz+aG84j3wgrxOyMWi2pAlKhpUaC//i70IrrxiAbd24Twc5
         1dmQacWeESvzp1hxUZAbHx+iCs40ytWIC0Q+hw6geSYVLac8+eAmQRKkCXiC0rLixStd
         ef7Q==
X-Gm-Message-State: AOJu0YzcDoiQ2WT/CK4HeVFzKCxbfbPvCqxqumhip2qAx3EuajiWpiad
	EBiuLZv2Trenec9KgI6zPb1ENoYkj8TLH1igoNfX375my9MyQFlSHZvPswwDlN5QDqZnowYRyQk
	a9MaH
X-Gm-Gg: ASbGncvtfLD1L6AoqNPAxLOkQQb+dcynrFDN5rH5ohk3d/USrHSn1IftAlQlvd4WTGn
	qdEFBKqdD87FyqHskXYEkYbHCGinrYHBIiOI1meePcYzg4Fxc0nrThTtPX3e/s3cPpnQSnqkzr+
	lRyNNrzD44W9SI6nbzolE60TezLktdc4n8IQBWQgVsqjsghF/fWkF2KE8DPSffzMD45Gimi/TqR
	eL5Y68Z9kAZkmIFMlKhd8keepY4K5V2x6qCpNHvOqU0YT3CtmDw/umwox7l6z2wPpRSOkeUByZg
	hwxkUQvW08ChoAmhhRfOLz0klQ8ixhdU5Yry1p9mewpUS8AkSWaiXmMq9XjzITwhtyKrBOnHyVA
	fMvC3+eXIqtb8RA==
X-Google-Smtp-Source: AGHT+IGMcy+FoPVKegMM+VH3gnfSHwKShR82TphcjJ7QlAVJpP5AR+3qgPe7pmVBFGtZJb0O03RH8g==
X-Received: by 2002:a17:902:ec8f:b0:23c:8f12:3f90 with SMTP id d9443c01a7336-23e25765f62mr1474635ad.41.1752611800540;
        Tue, 15 Jul 2025 13:36:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5c42:3781:50b6:b9d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43637f2sm115585595ad.241.2025.07.15.13.36.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:36:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/16] gdk-pixbuf: fix CVE-2025-7345
Date: Tue, 15 Jul 2025 13:36:12 -0700
Message-ID: <1803f965e4990be3fbdcd52544f0080e9c83800d.1752611671.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752611671.git.steve@sakoman.com>
References: <cover.1752611671.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 20:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220420

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw exists in gdk‑pixbuf within the gdk_pixbuf__jpeg_image_load_increment function
(io-jpeg.c) and in glib’s g_base64_encode_step (glib/gbase64.c). When processing
maliciously crafted JPEG images, a heap buffer overflow can occur during Base64 encoding,
allowing out-of-bounds reads from heap memory, potentially causing application crashes or
arbitrary code execution.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gdk-pixbuf/gdk-pixbuf/CVE-2025-7345.patch | 55 +++++++++++++++++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.10.bb          |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-7345.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-7345.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-7345.patch
new file mode 100644
index 0000000000..a8f23d3501
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-7345.patch
@@ -0,0 +1,55 @@
+From 4af78023ce7d3b5e3cec422a59bb4f48fa4f5886 Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Fri, 11 Jul 2025 11:02:05 -0400
+Subject: [PATCH] jpeg: Be more careful with chunked icc data
+
+We we inadvertendly trusting the sequence numbers not to lie.
+If they do we would report a larger data size than we actually
+allocated, leading to out of bounds memory access in base64
+encoding later on.
+
+This has been assigned CVE-2025-7345.
+
+Fixes: #249
+
+CVE: CVE-2025-7345
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/4af78023ce7d3b5e3cec422a59bb4f48fa4f5886]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ gdk-pixbuf/io-jpeg.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/gdk-pixbuf/io-jpeg.c b/gdk-pixbuf/io-jpeg.c
+index 3841fc0..9ee1d21 100644
+--- a/gdk-pixbuf/io-jpeg.c
++++ b/gdk-pixbuf/io-jpeg.c
+@@ -356,6 +356,7 @@ jpeg_parse_exif_app2_segment (JpegExifContext *context, jpeg_saved_marker_ptr ma
+		context->icc_profile = g_new (gchar, chunk_size);
+		/* copy the segment data to the profile space */
+		memcpy (context->icc_profile, marker->data + 14, chunk_size);
++                ret = TRUE;
+		goto out;
+	}
+
+@@ -377,12 +378,15 @@ jpeg_parse_exif_app2_segment (JpegExifContext *context, jpeg_saved_marker_ptr ma
+	/* copy the segment data to the profile space */
+	memcpy (context->icc_profile + offset, marker->data + 14, chunk_size);
+
+-	/* it's now this big plus the new data we've just copied */
+-	context->icc_profile_size += chunk_size;
++        context->icc_profile_size = MAX (context->icc_profile_size, offset + chunk_size);
+
+	/* success */
+	ret = TRUE;
+ out:
++        if (!ret) {
++                g_free (context->icc_profile);
++                context->icc_profile = NULL;
++        }
+	return ret;
+ }
+
+--
+2.40.0
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
index cca89a9059..471d72d8dd 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://fatal-loader.patch \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch \
+           file://CVE-2025-7345.patch \
            "
 
 SRC_URI[sha256sum] = "ee9b6c75d13ba096907a2e3c6b27b61bcd17f5c7ebeab5a5b439d2f2e39fe44b"
-- 
2.43.0


