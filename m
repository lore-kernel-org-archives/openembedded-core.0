Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.8253.1620831488898991254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UBv1tyvV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id f75-20020a9d03d10000b0290280def9ab76so20777072otf.12
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eNrgI+Z9gL54ucRE5FOGqbwnGY+b4dgk8i8WCC62U60=;
        b=UBv1tyvVNJq69qcMReONf4Om5j2VHzW+ILh3DBUKSzF9cZj/vg/AEXIrBX8kfGJtpq
         N+WqFKXjv9wkueP5naFoNSF7n5pqWG3a6dl57mlrUcSBa6JG2keK06SqBCiP9hgMptkv
         DotGZcr3gD88bshAkf8jZbyHBzjWXaxvaQBL8Ji0KVR5wAG9DbnzlbiNMKHkCR9+voEK
         Cl6eSiKFlJ+kCfsWESm9rlyk0I1pVjCfTmNxYXR8YPCO+msZcznB7b5pSqRKBzgvoBCq
         EvWpxbhTWmAUq7lwFlgh5JTT+8uF/pgTX2kNJxrGacJ7hUsZlI6peblWO2esfYgo3A5t
         Z/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eNrgI+Z9gL54ucRE5FOGqbwnGY+b4dgk8i8WCC62U60=;
        b=ce4vjh6Mxz/E2o5Nea2dzsaUGDW2+I0FfGWgoRZoNQd67LemJkpOxpxyXCMWjtSN7S
         uJj0m+xW+r5RfH2FNIPdvg+f5x6oTIgzx0fxEqg/WKC096/wK4njEJ/s2/YukQ0DgPm8
         99Jm70kFCiTPRSPp640YUn8OPxsbeogbBKmJXZp8t0g5tUf5mxWKh8zWleJQD930g4NI
         Bfv5CuPxD20hErKIs+24b5SANzZwILYrezm3Wt3tElPCSAAY64KuS6Cn7XsI1RxxiQrJ
         SB2Y9ED5gAwHo1Q5Kbc7vunmfEiH45JPDN/XIbvrrXdZ3zZ/1qLhgTs/wQsTWNZiFjEB
         hRAQ==
X-Gm-Message-State: AOAM533ZQWUk8zbq6Dk/14Lhh9XI//gzy+V8kURh1aWsuVbInpDUhEmL
	PP4G2+t6m9NtMQC3Mo62ATJwG8fQtIGMq6+NRlA=
X-Google-Smtp-Source: ABdhPJzoGdQe0KW0dsjst/kHTJoKF+/gzz7f1dr0aegc9pUrkWZIAS+domVxO1zekk63NkiDSZA+Ig==
X-Received: by 2002:a9d:12b5:: with SMTP id g50mr30964804otg.97.1620831487793;
        Wed, 12 May 2021 07:58:07 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.58.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:58:07 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/22] cairo: backport patch for CVE-2020-35492
Date: Wed, 12 May 2021 04:56:45 -1000
Message-Id: <41f465f29f20d3652d2b5cf273532c5adf951178.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0c4e6f99332ae253855708845a41fdfeb72d4c30)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cairo/cairo/CVE-2020-35492.patch          | 60 +++++++++++++++++++
 meta/recipes-graphics/cairo/cairo_1.16.0.bb   |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch

diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch b/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
new file mode 100644
index 0000000000..fb6ce5cfdf
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
@@ -0,0 +1,60 @@
+Fix stack buffer overflow.
+
+CVE: CVE-2020-35492
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 03a820b173ed1fdef6ff14b4468f5dbc02ff59be Mon Sep 17 00:00:00 2001
+From: Heiko Lewin <heiko.lewin@worldiety.de>
+Date: Tue, 15 Dec 2020 16:48:19 +0100
+Subject: [PATCH] Fix mask usage in image-compositor
+
+---
+ src/cairo-image-compositor.c                |   8 ++--
+ test/Makefile.sources                       |   1 +
+ test/bug-image-compositor.c                 |  39 ++++++++++++++++++++
+ test/reference/bug-image-compositor.ref.png | Bin 0 -> 185 bytes
+ 4 files changed, 44 insertions(+), 4 deletions(-)
+ create mode 100644 test/bug-image-compositor.c
+ create mode 100644 test/reference/bug-image-compositor.ref.png
+
+diff --git a/src/cairo-image-compositor.c b/src/cairo-image-compositor.c
+index 79ad69f68..4f8aaed99 100644
+--- a/src/cairo-image-compositor.c
++++ b/src/cairo-image-compositor.c
+@@ -2601,14 +2601,14 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
+ 		    unsigned num_spans)
+ {
+     cairo_image_span_renderer_t *r = abstract_renderer;
+-    uint8_t *m;
++    uint8_t *m, *base = (uint8_t*)pixman_image_get_data(r->mask);
+     int x0;
+ 
+     if (num_spans == 0)
+ 	return CAIRO_STATUS_SUCCESS;
+ 
+     x0 = spans[0].x;
+-    m = r->_buf;
++    m = base;
+     do {
+ 	int len = spans[1].x - spans[0].x;
+ 	if (len >= r->u.composite.run_length && spans[0].coverage == 0xff) {
+@@ -2655,7 +2655,7 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
+ 				      spans[0].x, y,
+ 				      spans[1].x - spans[0].x, h);
+ 
+-	    m = r->_buf;
++	    m = base;
+ 	    x0 = spans[1].x;
+ 	} else if (spans[0].coverage == 0x0) {
+ 	    if (spans[0].x != x0) {
+@@ -2684,7 +2684,7 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
+ #endif
+ 	    }
+ 
+-	    m = r->_buf;
++	    m = base;
+ 	    x0 = spans[1].x;
+ 	} else {
+ 	    *m++ = spans[0].coverage;
+-- 
diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index 8663dec404..4827374ffc 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://CVE-2018-19876.patch \
            file://CVE-2019-6461.patch \
            file://CVE-2019-6462.patch \
+           file://CVE-2020-35492.patch \
           "
 
 SRC_URI[md5sum] = "f19e0353828269c22bd72e271243a552"
-- 
2.25.1

