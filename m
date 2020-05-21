Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.9563.1590077753463424604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 09:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YB0clA0p;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id nu7so3317729pjb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 09:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kbiJLdss8eGhHkGtVSDuKFVDEVj0nNUMBlaVTd/dRaw=;
        b=YB0clA0pRsklj0laKq6BVUK9xaW2P3wm9dexfCQlzedjhWdtDzNgd67emQUUc08Qu2
         Z4C3WAFEyRsz/AL/NVS0vwyEelkAP1MLVr+lPQh8wnIlV6iN7bnjGPIttfsyzx8A2lu6
         6lwgPHIVTAyEMKWl7NN8/Yd0/dmS1TjRN7XO+vTCsTcpxjLgOFsIImCN/6/3PCgSFQWM
         iSLiO+8eVSzhd4Fn/zF2qBtHxWNbACcTHjyVeG1ArJ+0WYnOEgScKrcu0RHOaDTs55/B
         9PQ1CXoyMdWc1JUmcwspHC7C+39z7hAi8aZ+44ysYUZW6Q9jvIfmxDgTZNHwzYYc1DEc
         gW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kbiJLdss8eGhHkGtVSDuKFVDEVj0nNUMBlaVTd/dRaw=;
        b=luMw6SCDLAWPuWVqgU6b3RwYCdQt5JZJWvVSwB4S0F7yUEg52CtUszVA7ENBxMqSTy
         MI8EbQvk+Hwe/cQhZ+h51hM+jUHocmyKgKxWGE5BExWCSPxKqP1/PPY1KTIlUr56I6qx
         ac+KZjJtICvhnG3Ws25HK+Foqrrrf07siOTi0YhDDNigBVvonmJbZIYM69IwHaMeaqY4
         HirjSRZOqfx1XT2nD/hldeBdOdoXx/fCAygJ9SvrGDSHxkmYu43FWlN7jDobE/WL9I1E
         zEGHB4Sof+OAL9k3XjYgqM0KKx2zuQVdBAlxR3RmhbRKQ1s3Ywpc0Gb+IwYCJoYwCoAG
         Ejrw==
X-Gm-Message-State: AOAM533quKNWL0dGkJsWzC94YGjRNhVNhrm8vVbX2p33nM1GBeadw059
	Pf9YY9v+xwQufmnFIc+4xvU1exxHRmQ=
X-Google-Smtp-Source: ABdhPJxGHLwsefauI6g9W44weIaluI2Sv+9L6A7W+Vv5D73whwXXuNpKCp2v1vVZE7stzXO0Wejn6A==
X-Received: by 2002:a17:90a:2542:: with SMTP id j60mr13103138pje.70.1590077752645;
        Thu, 21 May 2020 09:15:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id r24sm3636427pgm.25.2020.05.21.09.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 09:15:51 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][ 04/10] wayland: fix condition for strndup detection
Date: Thu, 21 May 2020 09:15:37 -0700
Message-Id: <20200521161543.3273063-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200521161543.3273063-1-raj.khem@gmail.com>
References: <20200521161543.3273063-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

current check does not work with gcc10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-build-Fix-strndup-detection-on-MinGW.patch        | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
index e445838750..c2ceae4a47 100644
--- a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
+++ b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
@@ -17,8 +17,6 @@ Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/wayland/merge
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/meson.build b/meson.build
-index 26b084f..c05d019 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -36,11 +36,11 @@ have_funcs = [
@@ -30,10 +28,7 @@ index 26b084f..c05d019 100644
  foreach f: have_funcs
  	config_h.set('HAVE_' + f.underscorify().to_upper(), cc.has_function(f))
  endforeach
-+config_h.set('HAVE_STRNDUP', cc.has_function('strndup', prefix:'#include <string.h>'))
++config_h.set('HAVE_STRNDUP', cc.has_function('strndup') and cc.has_header_symbol('string.h', 'strndup'))
  
  if get_option('libraries')
  	ffi_dep = dependency('libffi')
--- 
-2.17.1
-
-- 
2.26.2

