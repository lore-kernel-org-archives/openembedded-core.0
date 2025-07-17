Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AFDC83F22
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:55:51 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.40201.1752720948895266648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G2HdHGlj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-311e2cc157bso475638a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752720948; x=1753325748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7usODZMEXSEB6TcmT/ZguZuBvh9JpfkAV3KcC1QKSw=;
        b=G2HdHGljyudfMTigcOxd0DzFXMEvpbZ9KXur26TvshHlsX4PETLQcjzcu2cOFKHSJ3
         OTeEKpcYP7TpBXGYNN5+OM2hP+9fQ0b5VaVpxLqGvx06IUM40pi8ZqsoNJETukGk0o+b
         ovBwgtElHP5gtdpMs/Mc3WAa7+X2PTGbWF/6JSble38D6Qw6qYN3A+tfcK/6W11syFO3
         SWK5iu4vgTsvBngopMNHvfB9sjUxMfwOmOZt2oBshXwK7qOU6c6X4cdYEyq/rrB7LFnF
         KWe9BiEeJd9DIAtGHTR+EKg0ajZORJlWe3GYU8U+ZKDPmXXD/EPdsdLDW+iT11i0p6zV
         GO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752720948; x=1753325748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7usODZMEXSEB6TcmT/ZguZuBvh9JpfkAV3KcC1QKSw=;
        b=c4SOI70aCUGWaaSciw2e5e7rAB4CeL/BN9VDFDw7wjZb5ZDR4+y++YJCGup8ocnrJY
         lhJxMYCNUbjfaygm2/XkUxGNvIVKg42qMqYJsBCyni9BgM1TPz1dlEvAC+i0xYPddTAf
         5WoZ6WOT2UHhsEptqAdVZ8ftXS9/x3g2/ZByu/NWzy7l4g6A5duMuuCLBuUxMDT0PYRd
         mYWOBfE5vCnwoRuNI61i527bY8gxaHzZLggVvfdCxhcc0XBuzXhtFpEkAolyGMHHKINg
         3bHF7K7DlRMq1I+XhWXcV/7tqa4LCcIs8bYWLfIjGi2OvlGW+QkC6GgxucVYP0AA1Y3E
         lwGg==
X-Gm-Message-State: AOJu0YzeEze8yrf1jhwUDbvPrcpi5AdyqjiDzODRpIiVBOui3l+2a1JK
	0WGCtPZJ6eNOwvWYxO2umnVxNoFR43F+g5z/SAY5p63BbVcX6wHaA1MdgTJOpCxTeIfkhi5ANZR
	D2NcW
X-Gm-Gg: ASbGncuArf7VbUXSpFhTRsKFKqK72iSSQ5V8Y5l18etC4cjzkcCpH+y8F8ORrh7D20r
	doZBhxYDenPZ0JmBjGZVS2VqH+od0LmkAMTZQ0o65be/Wpb/Bbmy9XtlFB+3r53YcM+qLM/FH/7
	AM+pGodmzGoq/FdEPkMGxhB891gGnpuqclpEv8h/SVaxS8I4fcxl8cQaH9PTcV1JLNrJXnV822H
	3e62Sl85QFsHIRlfLAQvx1NktSbbb2hLphmGCrEMir7nJg1eEhBebs3XtjrlyL+3yaC/MTgshXP
	nKOkXwk6viwwkq8XPvFHomxEN9z3XBV2NHFVgwzgjXtSkCAuHqO/WUBXE+OoEwd4MB8vXA1jWyO
	RvCRyqNV1YYfH6w==
X-Google-Smtp-Source: AGHT+IHXLbMAcaEggsf8qGJSrl06GtWS01jB26EVi5Fh4OEFcvO/QCmnH+fhBAfQJdaCBIGbhu2G8w==
X-Received: by 2002:a17:90b:2584:b0:313:d79d:87eb with SMTP id 98e67ed59e1d1-31c9e795521mr7253201a91.35.1752720947968;
        Wed, 16 Jul 2025 19:55:47 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f288173sm2333256a91.25.2025.07.16.19.55.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:55:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 04/13] gdk-pixbuf: fix CVE-2025-7345
Date: Wed, 16 Jul 2025 19:55:27 -0700
Message-ID: <bb80f57bc3818937d5a207040bfd44021dee4e6e.1752720827.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752720827.git.steve@sakoman.com>
References: <cover.1752720827.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220490

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
index 96487a284a..48f3c778c9 100644
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


