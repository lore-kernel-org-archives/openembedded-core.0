Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web11.37949.1591020743184921271
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 07:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=rKClc4io;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id 5so5160694pjd.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 07:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Rgg52MRUFpf7Do1LcVSHK931lR4fV2Z4YO9QCeg6SkY=;
        b=rKClc4iobYbEFW//d2jurtqNzPBiY2dzbOTV3DU8A2OHGfpVaR1pjhQzEipEYoWMJ8
         2dt6oZI525gF2Q2JlkcdJn4BrG5476xteWgR26vKcGRYoo43S4eyApiTXFzn7URsGiGm
         z978QF7AN5o9V31eyILXE0FrdgIHa/zQwnZnyCsqCL8FAkMY262fLpHArJFGWZct0jEl
         2g6HQouTJ4I4Y53CHVlBJiBvHTfcu/YJjIkWdg3B8Vdjfe8jwpIvdBLb6bDEpeQXn5pe
         TTkCntKDaAbT3FIrZgOPwJ1U+FOOuQgc9/mVYMdVfnRUZJ7PFGnjIzlJrerZsrCNI2Rc
         BsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Rgg52MRUFpf7Do1LcVSHK931lR4fV2Z4YO9QCeg6SkY=;
        b=jPpJrc59/QKsDCn2aceVGdvF2qF2WJ9ZylYraUacdFQIBlLJEUMNTyjguoZ57aQUem
         DaiPOkHT2tHB+s5h6x0+cFXidH94ONKNWUDX67xQdorRLzQUme+x1cxpdCuBZeF2Lzie
         6eJ55oCXCa43n9kgnfs4cfgbrWgZN8G37PexonuVR1PKwp6qwP6vAK3EE+DCr9kJUvBt
         lJKyybSXhdRm3GVFyvKTxZiA/G6IBCrskMPwzlxPZGU+NP/kNz8asjdOZ0hLHXrU9uqs
         S28g6JDy2ZtIV1bLJdKrHDwzyZ/teXotWNFXZVJdtJHboatoK1yy1iEjaJFXcb3St18r
         Zh7Q==
X-Gm-Message-State: AOAM533ZWvl0+PPpLNZ4Hb0PIYR4XvIfZMlRKm3qhZRopgALtThrnSqR
	3CyVXC3RKHsr5K7i/v+rbZ6/8xU68jU=
X-Google-Smtp-Source: ABdhPJyo7e01yhN+/TsoN7MxeZwRDDpxWWYj7c3mJrcyiiYHNFI3m+T92NAxkQs7xgGwVJhGctcHVw==
X-Received: by 2002:a17:90a:d809:: with SMTP id a9mr5558312pjv.212.1591020742236;
        Mon, 01 Jun 2020 07:12:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u19sm5509859pfk.98.2020.06.01.07.12.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:12:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/16] make-mod-scripts: Fix a rare build race condition
Date: Mon,  1 Jun 2020 04:11:21 -1000
Message-Id: <8a7da39c04fbab1280c464f39a791e4fbd1e7da9.1591020366.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591020366.git.steve@sakoman.com>
References: <cover.1591020366.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

There is a build break which rarely happens but is seen often enough
with 4.1 kernel based builds

/bin/sh: 1: scripts/basic/fixdep: Permission denied
scripts/Makefile.host:124: recipe for target 'scripts/dtc/srcpos.o' failed
make[3]: *** [scripts/dtc/srcpos.o] Error 126

this patch sequences the build targets so it can work reliably with
different kernel versions

Divide the target into scripts_basic scripts is not
strictly necessary and was simply what was used for
testing on kernel 4.1, which is quite an old kernel

perhaps just using scripts is sufficient, but it is not tested to not
known will cause the build race as seen above.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 55ac6e2d251287419138931aa0d0894cf1267787)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../make-mod-scripts/make-mod-scripts_1.0.bb               | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 0be1422a24..c7edb20ee4 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -23,7 +23,8 @@ EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="
 #
 do_configure() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
-	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts prepare
-
+	for t in prepare scripts_basic scripts; do
+		oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+		-C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
+	done
 }
-- 
2.17.1

