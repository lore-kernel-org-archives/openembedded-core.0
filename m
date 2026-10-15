Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759C0CC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:50 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32817.1792040623312133762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BzWPuwYf;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso34871865e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040621; x=1792645421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bUGm5y+jdP8tQ2H9aQlKzsTlG2in/4SjEFet4mqsDAM=;
        b=BzWPuwYfmLfpilb9DodO6XaanTTmdJfS5d+JCXZWx86XPpyKN4PVL3SWrm4x8FcD9M
         2Xk8V9NDlWmmflTWv5R1fQSzm9vNifMenBS5OcfudkMUm0F0AljQh9JNt84PpkgqS4cm
         blGEEPN5HozZus32toZgOOg4SGftTR2PqwJLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040621; x=1792645421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bUGm5y+jdP8tQ2H9aQlKzsTlG2in/4SjEFet4mqsDAM=;
        b=jOs/DOs5GPdLFw6xeAM9u/6rJMhfTY7DaGJ/PEyRdvM3GsOgtVxD9eF/gZM+CuyTIe
         Fbw/S9GZC9eRXTMjrz0Fsck6DsnLWjnvVzBrzHdu3oOeV/NPMKojcSY8dKX5n3Bz9mJm
         4YHQlB7pCqF2K9Sg3Buop6nn/i8b1NcNi6RgjpWyK3HcJqCaZQeJZWgY4d+H5xZAjBet
         aiZzdz0sMleq9BWrscC+779zoEgNaHwHRQagaV3pdUz0euptEl2SszgF2W6ogDgghzUY
         W73AWqUwBSDLAmVr3orY+c/33iLR2XLOUTl2zl6NPrt2cGAc7afBMbWG/gKJ2tN/wIDe
         jZYA==
X-Gm-Message-State: AFq9FYJJrmlBopFcMS+EN8NIMj931XrNk9aq7ZnkF/9WGZScvUv9mjYY
	cEm9n+DO2WNcdmj+B2rB14Ds7+kdih5LDSb6sOJueJ7RAqfYTGTFwcPE3odNTp3Np/c2GMcw23m
	QHsjtnYA=
X-Gm-Gg: AYBFou19Q0gdtDRFcDa3GK+3f3rDdTiUWYp/+zAqnKdhf3VvhFqTpQLFHUtfIE5+7EA
	75m4P6M+tjWLiUPxUhIcxizglfXw4+h24SE6bXLqOCUWoEkbwOwZUuPASnflpbnjwYS1rHKR1fp
	VHFuuxKJbRcncF4pz+e9Yn1QaB6W5Y3NukCC8j6GgtVHnlDeNyfxUkm/Or0+zaXV5HwdL4Y9vBl
	Nc/JiWuOphm3nkQqKzFvh6TV4iQmexekRk8rEh50YqKU3yvOpLUv+QCy3DVhqz+1v3mJnim8LXG
	YdWuwlTyuuP/cB0yKKxxSBXWrKKkqcESVgJu2DHAluCehw1g82QQGI3yHyh8QcIhp+MlhKyLD7G
	Dt9DkKG/be+4yT6JSnrNX0vDYa+Ei3GZheb3gPkzRu80A1CPY/AFmTWLrpFlnDPb5p7gfkuIdaW
	o+z4XaILWWyxjXJHK/asTRcXRu73VMakoz5iZYvUkahIkmqNUWunquiLnEVT5KI2sYduZE2a2fg
	wp6zYttX/1yviMn9LZjgDkEihzAq9mWGcr8NrL1UzFGAv2TJz6Cm3MCN+Pyj22y9ndUK10AvaA=
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c10:1372 with SMTP id 5b1f17b1804b1-4a18e4aa206mr375340015e9.27.1792040621466;
        Wed, 14 Oct 2026 22:03:41 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/55] gstreamer1.0-plugins-bad: Security fix for CVE-2026-3082
Date: Thu, 15 Oct 2026 07:02:30 +0200
Message-ID: <131827198caa3c9c7b8988f1fb016fb2c2e08385.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247805

From: Rohini Sangam <rsangam@mvista.com>

Pick patch from [1] also mentioned at Debian tracker in [2]

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/83e9225bb9e89948e7b1c9f37ef9218d2dcde354
[2] https://security-tracker.debian.org/tracker/CVE-2026-3082

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../CVE-2026-3082.patch                       | 46 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.22.12.bb       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2026-3082.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2026-3082.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2026-3082.patch
new file mode 100644
index 00000000000..26e27ee5f59
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2026-3082.patch
@@ -0,0 +1,46 @@
+From 83e9225bb9e89948e7b1c9f37ef9218d2dcde354 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
+ <vjaquez@igalia.com>
+Date: Wed, 11 Feb 2026 22:07:49 +0100
+Subject: [PATCH] libs: jpegparser: boundary checks before copying it
+
+READ_BYTES macro reads data from a byte reader and then copy it to a storage
+variable. This patch adds a validation that the length to read cannot be bigger
+than the storage size.
+
+This macro right now is used only for storage variables of guint8 arrays.
+
+We have validated in the specification (sections F.1.2.1.2 and F.1.2.2.1 in ITU
+T.81) that Huffman tables (both AC and DC) aren't bigger than 256.
+
+Fixes SA-2026-0003, CVE-2026-3082, ZDI-CAN-28840.
+
+Fixes: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4899>
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/10946>
+
+CVE: CVE-2026-3082
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/83e9225bb9e89948e7b1c9f37ef9218d2dcde354]
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ gst-libs/gst/codecparsers/gstjpegparser.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/gst-libs/gst/codecparsers/gstjpegparser.c b/gst-libs/gst/codecparsers/gstjpegparser.c
+index 6411076..86125b3 100644
+--- a/gst-libs/gst/codecparsers/gstjpegparser.c
++++ b/gst-libs/gst/codecparsers/gstjpegparser.c
+@@ -79,6 +79,10 @@ ensure_debug_category (void)
+ 
+ #define READ_BYTES(reader, buf, length) G_STMT_START {          \
+     const guint8 *vals;                                         \
++    if (length > sizeof (buf)) {                                \
++      GST_WARNING ("data size is bigger than its storage");     \
++      goto failed;                                              \
++    }                                                           \
+     if (!gst_byte_reader_get_data (reader, length, &vals)) {    \
+       GST_WARNING ("failed to read bytes, size:%d", length);    \
+       goto failed;                                              \
+-- 
+2.44.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb
index f6d0711bd8f..64e0aa6dcbe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0005-v4l2codecs-Always-chain-up-to-parent-decide_allocati.patch \
            file://CVE-2025-3887-1.patch \
            file://CVE-2025-3887-2.patch \
+           file://CVE-2026-3082.patch \
            "
 SRC_URI[sha256sum] = "388b4c4412f42e36a38b17cc34119bc11879bd4d9fbd4ff6d03b2c7fc6b4d494"
 

