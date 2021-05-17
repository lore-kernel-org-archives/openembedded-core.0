Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.19354.1621260854671668941
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=A8O0DzKW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id gb21-20020a17090b0615b029015d1a863a91so5648349pjb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eNrgI+Z9gL54ucRE5FOGqbwnGY+b4dgk8i8WCC62U60=;
        b=A8O0DzKWtLjEaZ12Y3XcyzEBylxWwT1sfyqS0pjHhRHH8d/vlC6FGTKv4/7z0/JbIN
         0+0ZLHhTG7bjxbFArixluX30Y3wcDYzHU/U8c5PtfoGVDNalQRroz281PfIAhCtAtqdh
         mjIBb2jyyPUpF2C3Vr4ascgR43T7tdC4SvIqo0Na/3cCVtUK9iSwWHpv3xdnw0ixyftc
         RfXHsp0c0IzXcHHMH789Z9ZXSG7udsTlqA0e92wRcvXF4ev0+HGyE1hGIwftdF91hYai
         VowIyF8azfAu+Cc4apQDpj1Ekh/kz9+9B6y6StHQ8WrcNRkTxZAbezIsYoyit+MGhP85
         l7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eNrgI+Z9gL54ucRE5FOGqbwnGY+b4dgk8i8WCC62U60=;
        b=NBKP0ytrF8Y2O/pHHUkumqVBZx1uKUv946HWcQRJDPVuUw0QQRgpKymMEnY2Ucth26
         eEC4z4A9OI73dJqwI8ekfcb6qzhXtzR3PeVjaAAeCT5Q5YHLdfu3DVOwUGgWfZ6ev0oR
         gXZl0zPGvBQF5YvFRw64BNktmyuD3ahAkESBSH/tvqc0epuJMuWSONEu2lQbiCeBU9PU
         l9X4v63lBctGw943JA2a3zlufYUE2y7X+9TdIq7hTS9x/6r+wNu2Ib5WoUkFFqrdjWiM
         oH7dBYVOjSiZ7DzScajqf59J7Jf9jM+jxx+PcgB8sI68++3bSBz+afX7D4plzgfZUK7R
         /PAA==
X-Gm-Message-State: AOAM532ZkSwqFBsbfqyeBdJBJ/kbHPbhF3s0BFUsUjKaKeZ0mSkrJO/o
	njkRB4wzlZhK9+6qAUieQ9h/nuHflJdjzDJULpc=
X-Google-Smtp-Source: ABdhPJyugwH2Pgbnc4Ubb0IGTv0octGzG/uyj92ffqXKMMkug/IrmKqqZWcDja1pgsJyo0MBW7+6mg==
X-Received: by 2002:a17:902:cec5:b029:f0:b123:44b2 with SMTP id d5-20020a170902cec5b02900f0b12344b2mr185336plg.55.1621260853685;
        Mon, 17 May 2021 07:14:13 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:13 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/35] cairo: backport patch for CVE-2020-35492
Date: Mon, 17 May 2021 04:13:12 -1000
Message-Id: <907e0edecbef830e1b057c58f5d398b57529f085.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
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

