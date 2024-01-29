Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7B6C47DA9
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 22:33:02 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.4619.1706567574130632006
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 14:32:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HHYyaOIl;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d7354ba334so24196845ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 14:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706567573; x=1707172373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6bKd5ixQpVOCtxAsBaxqJihj70TlOIfse8134O4xPq0=;
        b=HHYyaOIlXUGOvlytcCXHXDY93hyM1U83pGzQPjzDqGTJ8LtqllOJ0xjMT6RgnBxEEV
         jpeTHrypDFxlaawHOV34zQlVaxjjhEKNqOLYl6OwowJhJLq4H8QP/nxGm84m9pI+tuiJ
         2XvQW7BsiblHy2QQ2J5AN9PD5ZweivEU00QoMSACD39jGHgArqp5zw8FKy9YPatUhfj1
         JiRHyL3CVBg1fw0jLrHBKqBJGn9zUtQudiAbC7PNi+oyA/ILWguVDLsY5dtvOz/+YKLJ
         mrbiluOUoDkmTJ08+kt9T5O03dSjYy7LwVm3N9ugGDDypJOUvXljiJUipPfcqmiHjG9B
         PCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706567573; x=1707172373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bKd5ixQpVOCtxAsBaxqJihj70TlOIfse8134O4xPq0=;
        b=dsCpshaYehCtcaAyEpm+bgbNUYLR05eUdQpbubF9dIR682izQwIFfdaAqvt8UHTUYQ
         Bko31oSzx9j/ZT8acI3xYhJUoMtjubdJNEzb9iUL1QnXRhOT6zl9cCKbZCRsLOPby+3H
         3cmZQalp+Rf05TBJf9xMn3Lg28sL7qyYWvZlzo3a6aBBLbRIBJhIT49/vcvUf3/fD2Kh
         E8Ae7zGkJSA6ZoNxWLAkCFd/hYMzBYZZuz0diDYzfTPQdXVkBydcUF5SqDv3s093F6u9
         81Itxu4CEH2vYWmhO7C8yjeLh+KJIWuo+e6srvZBe6hARFTKbjox6mhvP/iH+m6i/Y8U
         rWow==
X-Gm-Message-State: AOJu0YxlhlnxIh5OD+Xj9napXq5eSM7Q+Lvg4B4xt7Eqjo2BX77rtsRB
	nsEIpVu9GnrQXtyDj4KI+jB8hWS4Li1AIcHAPhOa+3KnRj5xrzhgpiowoEBf9rY=
X-Google-Smtp-Source: AGHT+IEJnfqGeH9ZGDmY7lijBglFf/m1rrqpm0uKSLGN+jnltbekql557ExKGCfKAVmN350IIsHoLg==
X-Received: by 2002:a17:902:ea03:b0:1d7:7b3e:f6b5 with SMTP id s3-20020a170902ea0300b001d77b3ef6b5mr7914200plg.3.1706567572976;
        Mon, 29 Jan 2024 14:32:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3f31])
        by smtp.gmail.com with ESMTPSA id az10-20020a170902a58a00b001d7274cbd33sm5763321plb.121.2024.01.29.14.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 14:32:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc-runtime: Move gdb pretty printer file to auto-load location
Date: Mon, 29 Jan 2024 14:32:50 -0800
Message-ID: <20240129223250.42872-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 22:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194483

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


