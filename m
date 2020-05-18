Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web11.800.1589820565958221566
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CZMIwh0B;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.193, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f193.google.com with SMTP id f4so5087270pgi.10
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=cojsNC1avtNzCbYiMPUXMhwvfrx/LQunKhVYrt+mE7g=;
        b=CZMIwh0BqszVKKRevF96qNbc08RrL0vetOc8zZ0RsNGAeGq/J/uPX9Yduy/FexnGP2
         bLj8Q3Qv+PLQo1qPMMGXEXkPMIzjBtry6uvNNlvkKTInZ/FHXDWDVWwQcr20hYHSmRbA
         hHlnNAyl61XrI7ensZH03mALuPDF+JE0dfgCghBFIcjHhFyp6yXUbhQHhv/5gOfLlbAQ
         nwnOQI7o9zStFup/DeMb0yLmv15Z4KB4oMGr5pAku8iM/dailo+1PsVhpx1UU5cNgRkK
         reDBRvCrieGNBYrUy6WdbumyW+1DfCqftDLBat98tStMW0dgIHtpnsfSSzHa7udUqf/A
         0qUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=cojsNC1avtNzCbYiMPUXMhwvfrx/LQunKhVYrt+mE7g=;
        b=eljhPOCRThATDDjqOfcp9SJ67bskHV+Acw5Fibs/qlhQn+wEwR2WdQ39CIc4krjMy0
         BN3P6u+0y/usf1lHDzQb0LkuMwRQCQ0+ULZQBf36HtkiVLuq79VGzpqMgG69gvsbgyad
         LUM5lKPK+hhCs2XhLL2gNVir/pXG2sSCsIcNQ3KIUAXD8epTM6XQiqm0WCOqlVz8zeue
         9qeYFNY1DnLwMP2wyX8YgLtK3vfM9c/DFdmccygqHGF8wr3l0tXCox9LM8c90M6ZVR9t
         MhuanWTf2VtsuME4lf6lUUrYp+Hk4KWBoC59AoaVqdlDicm2GewMCzePX1kvsfoc8iXS
         s7oA==
X-Gm-Message-State: AOAM531H7bmUxoMekGRfRyplYt1nudKSXulY41O67iDLuRDN48pH6ivF
	yPVDhnoqOIwFnWOBXZhOYWsfPZB+k00sjg==
X-Google-Smtp-Source: ABdhPJw2frs7Kq6M5zE0kfXLNqsoH1TI+cSo7Bi+ooXgpzYsiAjfJe7NAbcN1VsDjrxPlf4j59bnVg==
X-Received: by 2002:a63:5f41:: with SMTP id t62mr16024325pgb.252.1589820565008;
        Mon, 18 May 2020 09:49:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.49.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:49:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/19] wget: improve reproducible build
Date: Mon, 18 May 2020 06:48:28 -1000
Message-Id: <fcd6c105bee1c689f06b46659779bddfad07d9c9.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: Joe Slater <joe.slater@windriver.com>

Modify DEBUG_PREFIX_MAP as used by sed to handle
whitespace correctly.

This modifies an existing patch.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../wget/wget/0002-improve-reproducibility.patch         | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch b/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
index 8781df21c0..050fc2c7e1 100644
--- a/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
+++ b/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
@@ -34,6 +34,11 @@ Link: gcc -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+sed use of DEBUG_PREFIX_MAP must treat whitespace the same as the
+echo command building version.c or the expression match will fail.
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
 ---
  src/Makefile.am | 4 ++++
  1 file changed, 4 insertions(+)
@@ -47,12 +52,12 @@ index 28c0be2..44084a3 100644
  	echo 'const char *version_string = "@VERSION@";' >> $@
  	echo 'const char *compilation_string = "'$(COMPILE)'";' \
 +	    | sed -e "s,$(TOOLCHAIN_OPTIONS),,g" \
-+	          -e "s,$(DEBUG_PREFIX_MAP),,g" \
++	          -e "s,$$(echo $(DEBUG_PREFIX_MAP)),,g" \
  	    | $(ESCAPEQUOTE) >> $@
  	echo 'const char *link_string = "'$(CCLD) $(AM_CFLAGS) $(CFLAGS) \
  	$(AM_LDFLAGS) $(LDFLAGS) $(LIBS) $(wget_LDADD)'";' \
 +	    | sed -e "s,$(TOOLCHAIN_OPTIONS),,g" \
-+	          -e "s,$(DEBUG_PREFIX_MAP),,g" \
++	          -e "s,$$(echo $(DEBUG_PREFIX_MAP)),,g" \
  	    | $(ESCAPEQUOTE) >> $@
  
  css.c: $(srcdir)/css.l
-- 
2.17.1

