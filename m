Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.327.1589327196822558672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 16:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AZ3rkkaS;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id s69so2006428pjb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 16:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fSXrn6t2oTIEUyccMvVvRNvs7Kmq8bDYdkj04LCif7o=;
        b=AZ3rkkaS3GYWwr1ijyGavALoSOocQN/xZ9TS8ranIuNC2V55veAAb27SCAaNaRtViZ
         lTtP01EV9JK4BHQ9a97vDOgEhZVid3kD6w3ygs7t+aGIq9yeJPexZQjAE332JAwiLkJw
         leEgy/0Y0JgkmF9fzfwd5USe1+UBMJGqKqAUm1HTojg7Tss2KrAhAYqITLxK4wgBNxfQ
         kuItrz8+1tRPUhYUBW077YazEXNWQZQIQ60W5kfbR7T25hbf+sn2VZ6hXRvTaz+I+E3c
         Hn1+PmD26SLDIn3fiFXffFXBLuy8VbiR0PpZuHaIjOJwyofu78AL/wOcu+Kvpojeq/RM
         tmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fSXrn6t2oTIEUyccMvVvRNvs7Kmq8bDYdkj04LCif7o=;
        b=UGN+9ge8jhOCZ2qcHjZEVgsVo9a45MFcKlqVX12vxRrnCdSJElnUBNpBWbplx6uOyb
         A0wjKE9/hjybYTkoubaVwEnt6W7NOgXhM7b4Aj17pQB4UTe7Jr0dK53ymrgkpP6rcyqp
         7C4WhL4l/OmLYDHkhCld73e7KXgfp9v0NB8W4YcWXzjI53aSNVy6pRQ0KRxRvaduv9d9
         lAifNUc17wE+IFHZQan7n/N6XDpumQj3TMRG1TyDO7YxphdB+oCsDQewtshsawaxQkmw
         wDl7Nhb3oK9g5dcrfLVQ6WRIv/QRDru8z1wAtyndn/5Xwfw3NRkzro9WEC7Cf4Watedt
         a6Jw==
X-Gm-Message-State: AGi0Pubk4a9Z1X+pPGGqX/oGoZTUmDnpWDusSsjTjqswMB2XaFLZtQ3a
	XXS7yQRbM7OLdZLQ9ExLxjHGgogdIuo=
X-Google-Smtp-Source: APiQypKUZfpWTErNcTDckcAoiA2oDWRGv1vTkp6wVdBzEEx+0sk57pfDjdAWZoTjqvOrOP2mJ48OVw==
X-Received: by 2002:a17:90a:df8b:: with SMTP id p11mr31007386pjv.137.1589327195767;
        Tue, 12 May 2020 16:46:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::8caf])
        by smtp.gmail.com with ESMTPSA id 127sm13175244pfw.72.2020.05.12.16.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 16:46:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] wayland: fix condition for strndup detection
Date: Tue, 12 May 2020 16:46:31 -0700
Message-Id: <20200512234631.2029050-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

current check does not work with gcc10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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

