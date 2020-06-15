Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.26709.1592249805209807185
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Sjzm2IbH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id e9so8011884pgo.9
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+qX8W/tp/Gje8U4finEOlXYbSywnvSL++XECcmyXdXM=;
        b=Sjzm2IbH3GQcblgP6SdC7ZKuG7LRhx3LKFgZpmBmHV7c0lMgE0/QQyADZngf463D0c
         rw2xTPplP0avYvLrWGurJBQy071GXfldy65A+5S4XfYLTKhcSIrBINmZ/B6aIRbrr4in
         vPaS26ouoaPTqvfodlGH7vWZ0jSEgKPcQRFhyeKVipSY4LECASLdmIVMhqo/9S4dPM/c
         QkxNYclm2Nb/jdBvS4yc4kNaJZMZap7ASczvJy6/3IIf3M8N5JpHwK9rr5PjpTC4tsgS
         ObkSQ2LW+Ip5YQtna+IvzCzHMTD8AMnstCGXlp8/Jnc3z8u6nVinYv8WT0r+VbpZ4np3
         OYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+qX8W/tp/Gje8U4finEOlXYbSywnvSL++XECcmyXdXM=;
        b=JK9IKbjOF0kYPxk+oV6kKLTxrJLeUVhn4nJ9yZgIqURIT3kJo5t/r6kVfxmZB1XgX0
         vSMkyvbHlXZTwis1BtHx1RFFVhvZD5Fo6pmr51x70o1TJVqc3rh+dsrKfKJ79a2QoUVr
         NSDIgbGyaz3dZo/9ypCF7wePzbrh5hM21YOe1w48AROP0JWGbl7BHBWUeS33svcwFw7m
         ODXZAjDcFCd8+3BxZ1+oFKkZQV5HJbslYyAu7al2S0G+De94jjbgPnRrriBcoV+GOXyO
         wIscv0HMjcrcNGXWr9ghjTUIV2qnIli8iJgkKH6sxI6kc09ZX+L9CC46RX+DaZUNC5ht
         sBjA==
X-Gm-Message-State: AOAM5326V3sZr34M34yvvLHy5thq2+ZsGwpe/kx/lHwO9t2IsinxaVQx
	sy2/HU6V9w35G5gYtRZ7NOiN25hWA1U=
X-Google-Smtp-Source: ABdhPJzBbrrLmI2GexPoEvkGiqC7Z9hq1Dj7bt+KHgAJ2JjRbv7rYzXaFipwZ4ljG15YUZdXwBtMOw==
X-Received: by 2002:a63:7d59:: with SMTP id m25mr21213621pgn.298.1592249803772;
        Mon, 15 Jun 2020 12:36:43 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:43 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/21] qemu: force build type to production
Date: Mon, 15 Jun 2020 09:35:36 -1000
Message-Id: <b7f1bf26abb7b6221d65f75b1b3671ae8d40385f.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Joe Slater <joe.slater@windriver.com>

qemu will not build for -Og optimization because macros
in lockable.h expect dead-code elimination.  Override DEBUG_BUILD.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad404b2e51223625bd95f9a7da4c7a690c37bdfb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu_4.2.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu_4.2.0.bb b/meta/recipes-devtools/qemu/qemu_4.2.0.bb
index f0c1daabe1..9c76144749 100644
--- a/meta/recipes-devtools/qemu/qemu_4.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_4.2.0.bb
@@ -10,6 +10,11 @@ DEPENDS = "glib-2.0 zlib pixman bison-native"
 
 RDEPENDS_${PN}_class-target += "bash"
 
+# Does not compile for -Og because that level does not clean up dead-code.
+# See lockable.h.
+#
+DEBUG_BUILD = "0"
+
 EXTRA_OECONF_append_class-target = " --target-list=${@get_qemu_target_list(d)}"
 EXTRA_OECONF_append_class-target_mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
 EXTRA_OECONF_append_class-nativesdk = " --target-list=${@get_qemu_target_list(d)}"
-- 
2.17.1

