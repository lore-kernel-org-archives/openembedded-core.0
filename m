Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5486CC282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:22 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.31772.1742141533256277106
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VQbYWS9o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43948021a45so13854215e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141531; x=1742746331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5J99g3K762xN1ekv/LmWPrKK6ksJqyNT6TJ5jMFdu4c=;
        b=VQbYWS9oLqUq4mB5oc9VmUWUJBqvWgr/fvh48dI/z71DMRfEtSc1/z8FdsIXRlcXjG
         vmgRIkDQOLzlJDiksDUhOODapUM6jWi6gH1ERi6mmFpj1c/a3IsjjfpKF3xvsRYWllLs
         vasorfi89J65Ye3hA1fFmVs+A0cs1E+A+7an0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141531; x=1742746331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5J99g3K762xN1ekv/LmWPrKK6ksJqyNT6TJ5jMFdu4c=;
        b=qjONY9CtQpDaa2j7QaUDhyI4gK4rYmgBOgi+tfcx6tMD7hhsZnoSo25loTZl+hJpxZ
         5BkL75ENruQLYcvgJu37QmPRGYUIOKOuEfPR5IK01sPgImvACgATb8mA5uT5tI8H25Rl
         KkWiUcZS9wCNam8TTBvR2YJa76Sz5IM1RYOncE96OgBQWNmaxOVwyyyjSz/ghKnxeAuz
         mjiwD9bLKoZTr4nBPphwQztvUT0SEmJK9MWAio87zGFCzB6Ba93fUiSEnte63KhswrRB
         yfuaqyZLRDllHVrS1hbBGg/KWcsQgFNSjl+Ybz5JEvGTT72CrRYic6Sc4G4rwxpXGcDU
         SLtQ==
X-Gm-Message-State: AOJu0YwH4n6sO0WNueQ2r53oVG/Qx9lg5HC94G/gdd2mNhHmqGdyllWM
	6M4FTRRHS50gchZ++E07ZgevD+Pb8ksFzkduUJ05kRYDPREOY8nYBz0v9NBYWotMTWJV+/pbdbJ
	z
X-Gm-Gg: ASbGncvYXTOt7HSRQZdlX/YJQf5UuVfqRsz2tBT6hubsRIGHRKBCImHHx2OpZ+5Li8M
	yPNfn6tybzSSlXkJNsklhtvvTS1rSQ3VhLqxp8TWgGjPEBfdbEojcj5EVnAK0H5Uraceaij80C+
	WV+1jRRY0yTxH4StuEkoXOUcJbaKuofpk6XQYI4AgH3Dg6n2ex9xk9OvgxGLK+fsmFbjopeZWuj
	MS/XK7jsRQnPv3e467PhdOfkaExy6pKDMuoQ6ZW2EQOZ5XXraDpoTdu3EfQNYlur9X3Cl2hNtwo
	KnWvFs0m3RtbrS+H64O/G0wxEymC/twRb32h7vynX+3VEHsnaekISPw/V0O/Y6LsZ50LMhe+oQ=
	=
X-Google-Smtp-Source: AGHT+IH/oW9nbN4ZBVmEawwjdDnjq7GF/eWNIbc/IZVt8A029uiKtX3yA9DT8Tmd1JSIU2R8yDx2Tw==
X-Received: by 2002:a05:600c:3505:b0:43c:efae:a73 with SMTP id 5b1f17b1804b1-43d1ec72abemr116569705e9.10.1742141530955;
        Sun, 16 Mar 2025 09:12:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/43] cairo: upgrade 1.18.2 -> 1.18.4
Date: Sun, 16 Mar 2025 16:11:27 +0000
Message-ID: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213004

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...tmap_surface-bsc1036789-CVE-2017-7475.diff | 19 +++++++++++++------
 .../{cairo_1.18.2.bb => cairo_1.18.4.bb}      |  2 +-
 2 files changed, 14 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/cairo/{cairo_1.18.2.bb => cairo_1.18.4.bb} (97%)

diff --git a/meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff b/meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff
index 6c761bf2a70..79ef16dfb91 100644
--- a/meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff
+++ b/meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff
@@ -1,4 +1,8 @@
-Cairo: Fix Denial-of-Service Attack due to Logical Problem in Program
+From 054ad9b65e074899c82e75cfc6623cfe29ab1fea Mon Sep 17 00:00:00 2001
+From: Fan Xin <fan.xin@jp.fujitsu.com>
+Date: Tue, 6 Jun 2017 15:57:52 +0900
+Subject: [PATCH] Cairo: Fix Denial-of-Service Attack due to Logical Problem in
+ Program
 
 https://bugs.freedesktop.org/show_bug.cgi?id=100763
 
@@ -6,12 +10,15 @@ CVE: CVE-2017-7475
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/cairo/cairo/-/issues/80]
 
 Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+---
+ src/cairo-ft-font.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: cairo-1.15.4/src/cairo-ft-font.c
-===================================================================
---- cairo-1.15.4.orig/src/cairo-ft-font.c
-+++ cairo-1.15.4/src/cairo-ft-font.c
-@@ -1149,7 +1149,7 @@ _get_bitmap_surface (FT_Bitmap		     *bi
+diff --git a/src/cairo-ft-font.c b/src/cairo-ft-font.c
+index b5d08ee..5e20ae1 100644
+--- a/src/cairo-ft-font.c
++++ b/src/cairo-ft-font.c
+@@ -1220,7 +1220,7 @@ _get_bitmap_surface (FT_Bitmap		     *bitmap,
      width = bitmap->width;
      height = bitmap->rows;
  
diff --git a/meta/recipes-graphics/cairo/cairo_1.18.2.bb b/meta/recipes-graphics/cairo/cairo_1.18.4.bb
similarity index 97%
rename from meta/recipes-graphics/cairo/cairo_1.18.2.bb
rename to meta/recipes-graphics/cairo/cairo_1.18.4.bb
index 65ee3102120..81c7aa66f01 100644
--- a/meta/recipes-graphics/cairo/cairo_1.18.2.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.18.4.bb
@@ -32,7 +32,7 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
           "
 
-SRC_URI[sha256sum] = "a62b9bb42425e844cc3d6ddde043ff39dbabedd1542eba57a2eb79f85889d45a"
+SRC_URI[sha256sum] = "445ed8208a6e4823de1226a74ca319d3600e83f6369f99b14265006599c32ccb"
 
 inherit meson pkgconfig upstream-version-is-even gtk-doc multilib_script
 

