Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E59C83F22
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:59:21 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.40267.1752721157746558470
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zi3ynz9U;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23694cec0feso4297395ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752721157; x=1753325957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDTFvkWyNUI9byYvrzbP2iE5ipXQhV03/8lF437mwo4=;
        b=zi3ynz9UDxgXdIk/DG+a4U3Hg3SzaxHq5qnJ1qTOuME7PcLKClTafmYEo96dq7o5mm
         AFeBc98Izoq740W4SmdR+bX1/VpC3kUaKUMhFMAmQlTjlbMiycN/qvIvwLqZkdKEMjjB
         eXmymW/7Leq7azwA3CkTTJAtz/4Bsfkn1j0qFQgz++KnOE1H6ujVBD7wgDNeP81dkM4R
         FTxXHSr4c7r2f6370y9uKF1Cd79ncj0Fe6RVpac2fzjEMc8vtcTeMBJExMo3iqgy4u3v
         BIEznhZYR2JLZ/1vZVNqT1L2/Y2vZa48c8UeRCsSc62yt+9s5jmdND+BxTENcVZD7enB
         UuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752721157; x=1753325957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDTFvkWyNUI9byYvrzbP2iE5ipXQhV03/8lF437mwo4=;
        b=Mn2lxdtywVqm7XGQIxuuISoBgbGXh/Z5uDTFil7LAbfmcBvSE69b/7/y+8NvJscbKU
         84ntkWehDCUW2iQnNKWledHIfygw/WrbRZZf8wOCBVeA/jhePODi+/uAud28OiR4yGUH
         QF1nc9PKiIMS2dA/v2or3XuCdzN5rFZ9Bv9iCyGhAPfkm0rJZJ0hPsLvWfBXhaZ9R0Qz
         vpdP2bVH4/BTUzPtiTPgAKHwTv3VpQZiZe5RFQt2l6TDDNMowQKs7hOirWCvkgieRD2o
         3W9T+hqa4Yo1SSlThf7WroxjJ2Bq6fEmnCZL+DL0pQcxRB+NUz6hHgUXeoNacnEjV90/
         1Fqw==
X-Gm-Message-State: AOJu0Ywx4c452yEgwQSfvbF2l7GbznTbwJBPCQfbSUXHy7v1X0GodoDR
	ty4HetJD9bhjlDhBjkQvrDOLr3ujT54M/qqxEHdT6HLM3099DjGNLgQkSlTVD0+hU6ZLTFiqB4G
	qtYKW
X-Gm-Gg: ASbGncs257iOJiay56U02GSeWwlk4B9jjAZ4cVehEetegS1ibySpM1jti+25tIlAUoA
	g1FqFCYYkVN2Wv7nsIKEhz+8wTmFybVhItevJJewnG2jioMZFL0Uiq4IjXtKJvmifsypR16c3IZ
	bx35gSvOwe92OVqB71IGlqGk38528vl9HJNHs0IJcTkHIFS3VRlRyYUqhEAsEOPxgSvYtOAyZtL
	O1DgezKuUaCoIIre2HpXw7vyiqTuDgfrg+Xrm6PAiUqmkyLv//B8VXh5UGG0R/NtTzYQSRs3S48
	muW1Z1uvJf52IYZSD++vPZXWi0dYA3eOV+BCAU6Swa9mFTQCM5QcobgydJWeKG39olOx8KvO9vY
	IJZIG6megG/2GXA==
X-Google-Smtp-Source: AGHT+IE9BCZ8lqJo8ZpuJ0fISKpN6fEF/BUKuCcxIEGha66Bd2Yu7mGzMAIMXUZwfSeiw/I0AHuzXA==
X-Received: by 2002:a17:903:41c3:b0:235:eb8d:7fff with SMTP id d9443c01a7336-23e24f4aab3mr75742245ad.28.1752721156910;
        Wed, 16 Jul 2025 19:59:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29e313sm2204547a91.35.2025.07.16.19.59.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:59:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/12] gdk-pixbuf: fix CVE-2025-7345
Date: Wed, 16 Jul 2025 19:58:53 -0700
Message-ID: <78a52a7feb995b4ab4f4df6b16feaac60f6ad59b.1752721028.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752721028.git.steve@sakoman.com>
References: <cover.1752721028.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220505

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
 .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |  1 +
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
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
index 9f825a68ef..ff1c7a1fb2 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://fatal-loader.patch \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch \
+           file://CVE-2025-7345.patch \
            "
 
 SRC_URI[sha256sum] = "b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a148cb669ab748e3c7"
-- 
2.43.0


