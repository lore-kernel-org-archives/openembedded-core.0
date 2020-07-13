Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web11.20221.1594649856787517027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 07:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QjTYlAnu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.195, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f195.google.com with SMTP id 1so6054001pfn.9
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 07:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=vK5lYI9LnTlOX0Xec3D1WRTjljrgIS07PAYZffhn4u8=;
        b=QjTYlAnuCAZePHGw5vRF2VNyqc2dSfGl0NrZbYf2fxZihmoR/w+muadp8YEN9mpZXP
         Oxq54JyOLOwOIdet2QjfX5W+Cdr1NKrmqMu5vDnajzim1IfJbkKsoKXXchSL/wllXNVq
         h6HI15R9gRY+DVNns7JxzywlFlOtKqIrsWV7/x+J1EROTyoULqFRbLWyeE7sICr9f+Gz
         CYfenud/Bt1QV0rcgblltFS+FZuOz0wm48VJgd0yuYUXCB9DWdZj8gABuAQH9ZRRAU/6
         y7wn5QzH76HBFoOXOpb8bwcZfwSqsBgnBE8imzsJLElt+aR+hzp/9ffVb3Sfslg4Ltwg
         ij1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=vK5lYI9LnTlOX0Xec3D1WRTjljrgIS07PAYZffhn4u8=;
        b=B2APm99qUEVK0GRPExDqOaTB3GsM67EMFzM/MBIiL3Yrmm5tUoZ0fDHMqIwvGP/R+B
         QcW6RftccKDmhE9nNXSJp2PzBc/H7XDq5XPo8mQkFQYOfBj5/EXmA/z04WP0bNKHO1K4
         xYxAmgS1l/B20LCFl8lEZi077bgGf36C7Sl4zfBN5xFyRE9gahQJwAyjGBKZTXRCNEy7
         GC5abJto41KChrCdMzve7pGFpVFaLa4BBDN6PEVoqBV2O3vt+NAe1ocwCRBBuh9nXs06
         eK0dErRquo/n3ZPfV7KhlEnTsZdOYPc7D1ECINTkt0g8E6qhL9wljnxaitMV6UyMIy9B
         YmAQ==
X-Gm-Message-State: AOAM533keKIgHYQ+h1SJt3uAhz6lLviUBSS0gDoJlKq0F4Wd+SrxxnZ/
	NanFlxF7eSihhle/5pJpi/w0TJ2xFaSBkQ==
X-Google-Smtp-Source: ABdhPJzcAQn7szYFwkwv7hEy0ypSs1ORybLattWZGiU4zP6mT54w2EzyfGJXZWk4AXHqCe6gI7jeBA==
X-Received: by 2002:a62:2c48:: with SMTP id s69mr92462pfs.63.1594649855935;
        Mon, 13 Jul 2020 07:17:35 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k7sm13723738pgh.46.2020.07.13.07.17.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:17:35 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/15] kernel.bbclass: add lz4 dependency and fix the call to lz4
Date: Mon, 13 Jul 2020 04:16:55 -1000
Message-Id: <589b2d7e902125199377d5f1550597bcb38a1bf6.1594649587.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594649587.git.steve@sakoman.com>
References: <cover.1594649587.git.steve@sakoman.com>

From: Timon Ulrich <t.ulrich@anapur.de>

If the initramfs image is type lz4, then a native lz4 is needed.

Additionally an output filename needs to be specified when calling lz4,
otherwise STDOUT will be used implicitly.

Signed-off-by: Timon Ulrich <t.ulrich@anapur.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c83a7aec59defbbc049d44ba34a7a409ada4fa19)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6d07b29e2d..9e3c34ad48 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -5,6 +5,7 @@ KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel")
 
 PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
 DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native bison-native"
+DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
 PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
 
 do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot"
@@ -210,7 +211,7 @@ copy_initramfs() {
 				;;
 			*lz4)
 				echo "lz4 decompressing image"
-				lz4 -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
+				lz4 -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
 				break
 				;;
 			*lzo)
-- 
2.17.1

