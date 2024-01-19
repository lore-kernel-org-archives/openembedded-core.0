Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46424C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 12:43:37 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.21104.1705668209435569246
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 04:43:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JVpe1VQt;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40e913e3f03so8240535e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 04:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705668207; x=1706273007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I2pv/yX5mzYdG/qRJuNM9sGjQQbST2LEdpmejDJJexk=;
        b=JVpe1VQtoG8kTHIEEgMGqxVD9xdqb5YtxmsfFEgElUl5mAuXQUt5Z5lgFx+8fj1GH3
         xpwPuioTEMC6vEV/pqEJwPSui/TuB7AOFzhmyIXi1mHHwMTdqvAvKtUVg3R/86mQyX5X
         BLcUBg6f+ItY0vCDJwXVHtdJbkvsUZYBBrP8NDONZLzxCG38wHxrwS1n4CmG7iO1FvVE
         FdkCIDdLWNKHt70/Kjac5Ghp7jaHDFyvUl4l1tzC9pHgmwlW9uYxKutrhrzwMOuyQ3cd
         NG3fRt5Job4Q5DrLhJ+PGDcctvqVU5aRStTVdXLBWmPjtZminb14pHXJL7du+mbfgcYa
         aSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705668207; x=1706273007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2pv/yX5mzYdG/qRJuNM9sGjQQbST2LEdpmejDJJexk=;
        b=G61aA0b6UkslgzppXUhdliEtmBewbl+0OUY6I5vE2IE0XqmzAdtpGRegUROvMDSSwJ
         N0VDmOYFj4+CFQ+SkWwjtDvifGY0OYidQLIh/XbbG5i85rQk/DOw57qRlnZ/eqIeCqrr
         GTBBE5AQ3oOyceqgATNmc4teMyJiXUB1+zOpUd5NDaO2clslXGBZFx/kbaom2q/X/3dA
         FqZ2L4z8t+zWmrJWBrFu4tdYP9zazAcTHWjGe32HYDq1ZyLvl8fXEuxJU7aYSTMSfU1E
         AIcIDKqEPWvS/nR4RX5pqwm67+ZkM2oGoKLSmUcL0vVbigKHIFb6PTc4GjJ8csrF08PR
         BiMg==
X-Gm-Message-State: AOJu0Yy9ZnaSqPv0Sw1FKp+/3pQ67op6NuHYjg1vKF6MEQr9ZHTnHjbK
	yb567r9Rj0o3WKQrk1lmDfProrA2kc26PtjpgBQo1EC9YrLKCUQRuXsztZ/w
X-Google-Smtp-Source: AGHT+IGJ6ziz1q8lfJ682rjWfXOS12C7tvLYKHsqF/nP0v/3R+zNvr0DxZrPJUhcB3gMPRzzUVoBxg==
X-Received: by 2002:a05:600c:3b83:b0:40e:70e8:5cca with SMTP id n3-20020a05600c3b8300b0040e70e85ccamr1619673wms.185.1705668207362;
        Fri, 19 Jan 2024 04:43:27 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id v4-20020a05600c470400b0040e45799541sm32731610wmo.15.2024.01.19.04.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 04:43:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] shadow: replace static linking with dynamic libraries in a custom location and bundled with shadow
Date: Fri, 19 Jan 2024 13:43:23 +0100
Message-Id: <20240119124323.3823059-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 12:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194041

Despite our efforts to make static linking work, there have
been new reports of bizarre build failures:
https://lists.openembedded.org/g/openembedded-core/message/194006
https://lists.openembedded.org/g/openembedded-core/message/193907

This commit changes back to dynamic linking, but places
the libraries in a custom location, per RP's suggestion.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/no-static-libs.inc |  5 -----
 meta/recipes-extended/shadow/shadow.inc     | 24 ++++++++++++---------
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
index 8898d53d756..75359928a14 100644
--- a/meta/conf/distro/include/no-static-libs.inc
+++ b/meta/conf/distro/include/no-static-libs.inc
@@ -21,11 +21,6 @@ DISABLE_STATIC:pn-libusb1-native = ""
 # needed by rust
 DISABLE_STATIC:pn-musl = ""
 
-# needed by shadow-native to build static executables, particularly useradd
-DISABLE_STATIC:pn-attr-native = ""
-DISABLE_STATIC:pn-libbsd-native = ""
-DISABLE_STATIC:pn-libmd-native = ""
-
 EXTRA_OECONF:append = "${DISABLE_STATIC}"
 
 EXTRA_OECMAKE:append:pn-libical = " -DSHARED_ONLY=True"
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 43f456251a5..b8e5e285c45 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -47,16 +47,6 @@ EXTRA_OECONF += "--without-libcrack \
 
 CFLAGS:append:libc-musl = " -DLIBBSD_OVERLAY"
 
-# Force static linking of utilities so we can use from the sysroot/sstate for useradd
-# without worrying about the dependency libraries being available
-LDFLAGS:append:class-native = " -no-pie"
-do_compile:prepend:class-native () {
-	sed -i -e 's#\(LIBS.*\)-lbsd#\1 ${STAGING_LIBDIR}/libbsd.a ${STAGING_LIBDIR}/libmd.a#g' \
-	       -e 's#\(LIBBSD.*\)-lbsd#\1 ${STAGING_LIBDIR}/libbsd.a ${STAGING_LIBDIR}/libmd.a#g' \
-	       -e 's#\(LIBATTR.*\)-lattr#\1 ${STAGING_LIBDIR}/libattr.a#g' \
-               ${B}/lib/Makefile ${B}/src/Makefile
-}
-
 NSCDOPT = ""
 NSCDOPT:class-native = "--without-nscd"
 NSCDOPT:class-nativesdk = "--without-nscd"
@@ -161,6 +151,20 @@ do_install:append() {
 	touch ${D}${sysconfdir}/subgid
 }
 
+# Make executables look for dynamically linked libraries in a custom location, and install
+# the needed libraries there. That way we can use them from sstate
+# in setscene tasks without worrying about the dependency libraries being available.
+do_install:append:class-native() {
+        binaries=$(find ${D}${base_bindir}/ ${D}${base_sbindir}/ ${D}${bindir}/ ${D}${sbindir}/ -executable -type f)
+        chrpath -k -r ${STAGING_DIR_NATIVE}/lib-shadow-deps $binaries
+        mkdir -p ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
+        install ${STAGING_LIBDIR_NATIVE}/libattr.so.* ${STAGING_LIBDIR_NATIVE}/libbsd.so.* ${STAGING_LIBDIR_NATIVE}/libmd.so.* ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
+        install ${D}${libdir}/*.so.* ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
+}
+
+SYSROOT_DIRS:append:class-native = " ${STAGING_DIR_NATIVE}/lib-shadow-deps/"
+INSANE_SKIP:${PN}:class-native = "already-stripped"
+
 PACKAGES =+ "${PN}-base"
 FILES:${PN}-base = "\
     ${base_bindir}/login.shadow \
-- 
2.39.2


