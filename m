Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3C7C47DB3
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 19:07:06 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.3857.1706555218434442152
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 11:06:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wl83b2cA;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d8d747a3bcso9743655ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 11:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706555217; x=1707160017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6bKd5ixQpVOCtxAsBaxqJihj70TlOIfse8134O4xPq0=;
        b=Wl83b2cAqgPPZcAGXZpn3pu9srQKTX88gkbcs/NhEAtdJS7ANPZ/QYnxyl1aaWQYOc
         AWcGPvH2jkAAJ47/F9yMyTUQyfoumrKL41R9ZqvKkCSVch4XNCzs8uLE1zJDGMy1aV/K
         5CGbVyEnJb1r3gjsfGPFr4P56VUGF4CrWnU20FULJkPJ4h+YhuAcKmehgOULo3cLNcYW
         qX9U1JxKJ3gmjc5GaWhV/02o/tCsTTLKkZJCGU2GKVi8PoSmcIlfSCg4beIRQnHxwxS9
         6DWTUjmjaKz6JaIIc+dNBTs+g2JZA+EiurBLWz/n+aU/X9+9hNz2TBpiF3Dt6dPoXxBz
         GHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706555217; x=1707160017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bKd5ixQpVOCtxAsBaxqJihj70TlOIfse8134O4xPq0=;
        b=BfRuTlkXdLNts1Dfrs2pKTeh1dD/kPh/5YKBUV3TbamfjdxSKZxR6dbYuymy7uXeGb
         AXxKLYcxFYAumxGDNydxuHnbyZLrr9oweCbABxB3mcphRG1OzwK17DTzwq9YRATkH0je
         Z5OR9q9ZrskxzvumOLJNfu6q+naxbDLkFzpaoeulfLBxCoKf8eAwk1rYa4ifsBxXBYxX
         QockGqgo0lqVCvwMULYCHp49r+D87AqIVLwmUcv6cv1QMMrX/CpA0Lk+3syL6iimrb39
         b2mGOzv+QnUgIvb4w/HOtBBIxOcLStKERoH88HOQ1UIzvazzfQNJMJa/UMYP9v/EcOec
         j2Eg==
X-Gm-Message-State: AOJu0YwV129p+dsYteKAcK+kdAwrcok5zTJ6uUaO3gJImfrnFJmoHwk/
	wzG/VtxTkqQ6Fk3hJZt38UkmtXRqMFRkVL2/0RaAOxzZ0Tc3FBBB66esiRti1lo=
X-Google-Smtp-Source: AGHT+IHXZLA7qW+DW0G9W2nuY488MigvGF91Z9ehPGydEfHzjmv+un8+i7QksH2nfk1QhabzAbOjYg==
X-Received: by 2002:a17:902:e9cd:b0:1d8:d225:699b with SMTP id 13-20020a170902e9cd00b001d8d225699bmr3605659plk.24.1706555217387;
        Mon, 29 Jan 2024 11:06:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5e7f])
        by smtp.gmail.com with ESMTPSA id w7-20020a1709029a8700b001d755acec64sm5678115plp.189.2024.01.29.11.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 11:06:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc-runtime: Move gdb pretty printer file to auto-load location
Date: Mon, 29 Jan 2024 11:06:54 -0800
Message-ID: <20240129190654.2553357-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 19:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194480

When debugging a C++ program on target using libcstdc++, gdb does not
find the pretty printer python support, this is because the init file is
installed into /usr/lib which is excluded from gdb's default list of
directories to load config's from, where as defaults to load from
datadir is still on, it therefore does not load this file

warning: File "/usr/lib/libstdc++.so.6.0.33-gdb.py" auto-loading has been declined by your `auto-load safe-path' set to "$debugdir:$datadir/auto-load".

This leaves the libstdc++ pretty-printers disabled even though added via
IMAGE_INSTALL += "gcc-runtime-dbg"

Add missing runtime dependency on datetime python module for the pretty
printer to work/load successfully.

Once the pretty-printer gdb file is moved out of libdir, it may become
empty therefore delete it if its empty.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 64b6168ba76..403ad76b5f2 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -85,6 +85,8 @@ do_install () {
 		cd ${B}/${TARGET_SYS}/$d/
 		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/ install
 	done
+	install -d ${D}${datadir}/gdb/auto-load/${libdir}
+	mv ${D}${libdir}/libstdc++.so.*-gdb.py ${D}${datadir}/gdb/auto-load/${libdir}
 	if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include ]; then
 		install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/include 
 		mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${D}${libdir}/${TARGET_SYS}/${BINV}/include
@@ -99,6 +101,9 @@ do_install () {
 	if [ -d ${D}${infodir} ]; then
 		rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
 	fi
+	if [ -d ${D}${libdir} ]; then
+		rmdir --ignore-fail-on-non-empty -p ${D}${libdir}
+	fi
 }
 
 do_install:append:class-target () {
@@ -182,9 +187,11 @@ RRECOMMENDS:${PN}-dbg = ""
 
 # include python debugging scripts
 FILES:${PN}-dbg += "\
-    ${libdir}/libstdc++.*-gdb.py \
     ${datadir}/gcc-${BINV}/python/libstdcxx \
+    ${datadir}/gdb/auto-load \
 "
+# Needed by libstdcxx pretty printer
+RDEPENDS:${PN}-dbg += "python3-datetime"
 
 FILES:libg2c = "${target_libdir}/libg2c.so.*"
 SUMMARY:libg2c = "Companion runtime library for g77"
-- 
2.43.0


