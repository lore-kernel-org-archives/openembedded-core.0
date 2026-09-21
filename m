Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60EBEC982E6
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 14:58:40 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50860.1790002719518503384
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 07:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tpu8UKOa;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so16477705e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790002718; x=1790607518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9CfHrcmxVsJmg/p/wkjgJLrxPUvNI4JKVeZIRKQxZwM=;
        b=Tpu8UKOaNqdUH/rvuUc0aoiAHL1n+myW1IxDtjPA7Mx18kpBZF/MQkRKvyxH8zwFPU
         SmTQfnJzdcchXP4b/b1S2CSndieFId3kcyIZXFvnYEujIx5exlorvYhcjm91Df1xqEMW
         1knFFEH3YD3jhL/O6w2CLbRQ9DcaV20YtmS4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002718; x=1790607518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9CfHrcmxVsJmg/p/wkjgJLrxPUvNI4JKVeZIRKQxZwM=;
        b=a+Ckcc/v9JmwaBvZ2uKcsQRzh5isPEny392uPwQDt90qJY+jIOL/QnnNE/Yz7eKTRL
         46LsbttFd9tiM8z5iOcWi11lQV7z972h5rPB2AtuB4qS85SR5kAeHAnmWdXJ59hIno9m
         smD7JNHUcrju4aKrS6mMa3OycmoOqCLzijINYVubiXY+qmHcN4VeUQ+2g1Q0b/O0sCkU
         P+qIq4F/g4dJFocDvAx8se3yzj18Y4GFs0AJ0OohsD8XGvKIMNf6J1ydS8/ob5fNoK84
         u1bfcIETEJrpO6JTu73fATsDFez+8zVjahZsTfhVfElL/+IX5XCh0V27YT9L61MKfIHv
         Skaw==
X-Gm-Message-State: AFuF++kmPbCwZ+myMVw9R2+ZfNW7kP/lSvOV/186jIyqUG/zJpGRIcEv
	d+Ey8e+nvnuG3aoP0WBN2v21eZUKH5j9HDqHe5S1x2Ba4zRhwkrYuOdbhBqmhonY2cJmGVH+ONB
	6fN7XVDw=
X-Gm-Gg: AYBFou2GKijvFanCs38gXI58zlLuRbWwb7VZRyXDuQkkt9nfmsh4CYeYUMUoXuo2kBz
	kVTifc/YcaauqDO70q1KXJqdWjOGoUTkx7l7lBqa+sN1sucDlz9tVktLOo0RkWu/aBHL1bD9Av/
	gjVxGVnHA8sTL9PW8EOPRYAfCCpWSqbkMub6Dsy7j1n70oOjbvjBPF/4KxOHCFWN1ujwEC+P7SS
	KsB5SriOygdabPvWuVbM3ilpj3phVy5M8Eq5b0YJjlHZj3UIh+GE/TuvBa0GOSckXPrSJm7zQqs
	zXUzPZJeMKkNfnyGR77WHPZu1/TPjCWNNwVtB8wm8RyVHCmMs+9iOGyosQo7fMHDoH3mO1yMCBJ
	X7jORC5uSaCOY3j6qD6lpMov8gUqL8CjE/L58/E7gW24h913ae/U+Qg+tfIhM3ORzDDIDZXkbFw
	hWZdWg7msCUvkRIlmZ5PVfvvv+ZhJESS/ZWCiHRTyd9IBP1Pi8K6CYXzEG+8YsIjm8wHicZcl/9
	XXlFAxDwhtGL6lGnccUKZUUcSoc
X-Received: by 2002:a05:600c:4ecb:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49fc56dbb15mr161675365e9.2.1790002717445;
        Mon, 21 Sep 2026 07:58:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a46d:d671:f81e:e5f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724596604sm23856287f8f.30.2026.09.21.07.58.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:58:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] cairo: upgrade 1.18.4 -> 1.18.6
Date: Mon, 21 Sep 2026 15:58:31 +0100
Message-ID: <20260921145835.1106731-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 14:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246334

Release 1.18.6 (2026-09-20 Emmanuele Bassi <ebassi@gnome.org>)
==============================================================

A new stable release.

The XCB surface triggered an UAF warning when building with GCC. [#898]

The clipping code was accessing various fields in a guard value, and
causing a crash inside Inkscape. See: https://gitlab.com/inkscape/inkscape/-/issues/5631

Multiple fixes for the Windows backends, including improvements in the
thread safety of the DirectWrite code. [#897]

The DirectWrite backend now supports COLRv1 fonts. [#903]

Multiple fixes for building with MSVC and ClangCL.

A leak in the PDF surfaces has been fixed. [!644]

Various gaps between abutting rectangles when drawing with ANTIALIAS_NONE
were removed by using absolute coordinates and avoiding rounding
errors. [#976]

Remove an overflow when computing the buffer size in the XRender code. [#950]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff  | 6 +++---
 .../cairo/{cairo_1.18.4.bb => cairo_1.18.6.bb}              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/cairo/{cairo_1.18.4.bb => cairo_1.18.6.bb} (97%)

diff --git a/meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff b/meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff
index 79ef16dfb91..c6c5ba09c62 100644
--- a/meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff
+++ b/meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff
@@ -1,4 +1,4 @@
-From 054ad9b65e074899c82e75cfc6623cfe29ab1fea Mon Sep 17 00:00:00 2001
+From e21fd76dc2572061d078a41fd5faa76592483e88 Mon Sep 17 00:00:00 2001
 From: Fan Xin <fan.xin@jp.fujitsu.com>
 Date: Tue, 6 Jun 2017 15:57:52 +0900
 Subject: [PATCH] Cairo: Fix Denial-of-Service Attack due to Logical Problem in
@@ -15,10 +15,10 @@ Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/cairo-ft-font.c b/src/cairo-ft-font.c
-index b5d08ee..5e20ae1 100644
+index b9bdf81..fa9c05d 100644
 --- a/src/cairo-ft-font.c
 +++ b/src/cairo-ft-font.c
-@@ -1220,7 +1220,7 @@ _get_bitmap_surface (FT_Bitmap		     *bitmap,
+@@ -1231,7 +1231,7 @@ _get_bitmap_surface (FT_Bitmap		     *bitmap,
      width = bitmap->width;
      height = bitmap->rows;
  
diff --git a/meta/recipes-graphics/cairo/cairo_1.18.4.bb b/meta/recipes-graphics/cairo/cairo_1.18.6.bb
similarity index 97%
rename from meta/recipes-graphics/cairo/cairo_1.18.4.bb
rename to meta/recipes-graphics/cairo/cairo_1.18.6.bb
index ae448101d90..138ad7492b1 100644
--- a/meta/recipes-graphics/cairo/cairo_1.18.4.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.18.6.bb
@@ -31,7 +31,7 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
           "
 
-SRC_URI[sha256sum] = "445ed8208a6e4823de1226a74ca319d3600e83f6369f99b14265006599c32ccb"
+SRC_URI[sha256sum] = "1c767308174337a74694da0f3ec069c271452163a1ef4540964c50c301f157d4"
 
 inherit meson pkgconfig upstream-version-is-even gtk-doc multilib_script
 

