Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BAAF01804
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:23:10 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64465.1772781782464469865
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 23:23:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dfnCbV4M;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48375f10628so58882265e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772781780; x=1773386580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehiShr3c2C4v1lOrNUpIgEsACwgAJ96RiOm+Q3kxkoE=;
        b=dfnCbV4MoZtWDCez7GlZsXgKqQGnsPo/nanDv/mYi+iOTwKKj9mA0vctL5yclyCK3f
         xqGjaPXLjSixmKBo5IZtApRRVuzQMfMg8NLwAUXAJ+Irq3rDd1O8iS56SBTjgSrFk7mB
         D1Y1EIMAa8GcCW6ku8VSaKRXGVPjHh3Aun6xQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781780; x=1773386580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ehiShr3c2C4v1lOrNUpIgEsACwgAJ96RiOm+Q3kxkoE=;
        b=WRhjTFUBKdPK4G4jUDNwUO4VfVfIO85585gZg+W+HrqIiMDIhyYXjU/axSROCjJc75
         2+WzV2jH6fBA4ovm+p+YwSV17bOMpDdQ/WC4sklqaGNmXKd98d/REwTRyOTkusg3ObVY
         WrwWJn+B8iDyx0AkUIP2KFGCggKVaWni0omSTMdWUTITdS2Fyko9UnQ6iUQvCPLL4+oX
         HM6SUudJ6oi3Jg00MNJiFLiwzpG5ywRH4xGMnMVy1UdH/ZJPT34SmVtPoiN+6M+37UI1
         8dUhEhFdVH6qvUoDLMNPfhqeAzzJsjCTN1xKLx3vhinWCXlRvrUcOG9YIddWwQ9bJ5Z6
         +CMw==
X-Gm-Message-State: AOJu0YzAa/8jvIrXZmtJBtNczzfVgd7alAGnkkVuF62eFtmMYtx9sh+w
	JCDKZB8dUeNMJXaMPpdGjU8jFipp9i1ApPCeiq815fQn2HT5ME07g+Y6JErQAeeBs2wk66IanRr
	neGZU
X-Gm-Gg: ATEYQzyg/jUdg1dUzgHWCaGVKUPeO9ZzXEOx0NGTQcdeYxU9IMRipXSMVnZ2P9Trmij
	wDfsjTRaM1mpuuL9zloSsq+r7QAd0Nyyx5EsJbqeJWZyO3uReFaC8Tw6IE1Q7aOsB9Fq9yQ2uuS
	mWd+weT2EINExthtnxBV3gtVT1aVKs3ccZ+BQnt03geYI1qmieksWh5tt6G5/6K/hwqPR2RbPZ5
	P+mLtRmbC4wgXs7PMTRUnf5G3iKAJRbJUedz3qgC0/NZW863s3+hRywlcBJ9ZqzigkIwi2PEn/o
	3qosgDOK1p3mKA9IPP1osxa9BQ1kwLt6OPmfy8uE5jQf4gBQxpeCSgpAVqT6yaCsl8NWE7xye1O
	Mo+Vsd6dSH3cK3hfPsPthW129Y1RCmW0iEc9KXSu6+mtKpoODuRf7q4kyLzxvji3afyAp+aUMqZ
	Lflf7OyQqUQgvRYbYKVZoHEK7dtMcTwMaxCuOM2Dj2lK7gZX3WNb5y0eM8PUToEVj55//0XI6h3
	jo+2ZL4wvtYpoKke6kwJx35zHRn
X-Received: by 2002:a05:600c:37c9:b0:483:612d:7a9a with SMTP id 5b1f17b1804b1-485268bf171mr16605285e9.0.1772781780468;
        Thu, 05 Mar 2026 23:23:00 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b09casm23106445e9.11.2026.03.05.23.23.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:23:00 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 03/16] gdk-pixbuf: Fix CVE-2025-6199
Date: Fri,  6 Mar 2026 08:22:03 +0100
Message-ID: <7dd07c908c00be28866690e32c2e6c37b3136c27.1772780989.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772780989.git.yoann.congal@smile.fr>
References: <cover.1772780989.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232542

From: Shaik Moin <careers.myinfo@gmail.com>

Backport the fix for CVE-2025-6199
Add below patch to fix
CVE-2025-6199.patch

Reference: In Ubuntu and debian, fixed patch is given -> [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/c4986342b241cdc075259565f3fa7a7597d32a32]

Signed-off-by: Shaik Moin <moins@kpit.com>
[YC: Link to Debian security tracker: https://security-tracker.debian.org/tracker/CVE-2025-6199 ]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch | 36 +++++++++++++++++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch
new file mode 100644
index 00000000000..1952e3ceaf5
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch
@@ -0,0 +1,36 @@
+From 140200be0b4d5355aab76a6fd474e17d117045ca Mon Sep 17 00:00:00 2001
+From: lumi <lumi@suwi.moe>
+Date: Sat, 7 Jun 2025 22:27:06 +0200
+Subject: [PATCH] lzw: Fix reporting of bytes written in decoder
+
+When the LZW decoder encounters an invalid code, it stops
+processing the image and returns the whole buffer size.
+It should return the amount of bytes written, instead.
+
+Fixes #257
+
+CVE: CVE-2025-6199
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/c4986342b241cdc075259565f3fa7a7597d32a32]
+
+Signed-off-by: Shaik Moin <moins@kpit.com>
+---
+ gdk-pixbuf/lzw.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdk-pixbuf/lzw.c b/gdk-pixbuf/lzw.c
+index 15293560b..4f3dd8beb 100644
+--- a/gdk-pixbuf/lzw.c
++++ b/gdk-pixbuf/lzw.c
+@@ -208,7 +208,7 @@ lzw_decoder_feed (LZWDecoder *self,
+                                 /* Invalid code received - just stop here */
+                                 if (self->code >= self->code_table_size) {
+                                         self->last_code = self->eoi_code;
+-                                        return output_length;
++                                        return n_written;
+                                 }
+ 
+                                 /* Convert codeword into indexes */
+-- 
+2.34.1
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
index 98993cc07d7..f22dc2cd915 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -22,6 +22,7 @@ SRC_URI += "\
            file://run-ptest \
            file://fatal-loader.patch \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch \
+           file://CVE-2025-6199.patch \
            "
 
 GIR_MESON_OPTION = 'introspection'

