Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FB5C46CD2
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 16:20:56 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.171.1706631653864971083
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jan 2024 08:20:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VqyScvLo;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3be61772d9aso900623b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 08:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706631653; x=1707236453; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SGWvLzlkZ9AtyXyi2xBxrDINd6dPnM9BbiERmfDJsq4=;
        b=VqyScvLo5rKpMoWYEfgo4fgfAr+aHRDIlQ6db/L7kGd3PTkAhOnQ7a7qCQIGNbASc7
         jk3/FRI6Ir2Z2BqbbUQd+2hwX2Ga6iOdyivqB1aXYMj9HnxNNdgEsj8k/bl6xYCTKbdX
         fn3tn+7FAjjJIOlWUoKTRykh52u+XWPLdbZ+V2ZuAE4kqXIFVQCiGGcT9CNhqqbjWLZb
         goixY94hM5VudzgAb7+lqs/r7zV5BtkTT584uPDkgN6WuqeOj5hpwNbjGShkX3SQvPNL
         UyJf6rc8K4S5TL8TpxnFaZpjbnr4AIQniM1HS4oJbIRMUdNNjUTBRHaLXu9xa2QkGFtP
         LpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706631653; x=1707236453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGWvLzlkZ9AtyXyi2xBxrDINd6dPnM9BbiERmfDJsq4=;
        b=SFY2jLkOvV5JbWSD/lNJnY0acTAAqaKBsZ0LvUYNUJsVHM8iyxjFjfFVdSzpzFBXkZ
         6LpeDc8DjaMOYQ7IIrSM8YWtI11zb5F+XaXFSaUeROYK0Ph8hd7+XuEGXt0tk8oNj1IC
         9+tJjY36G4M9PhU4iIB4wEghLbQuRGMzL+ubUvH+0uP3r2783j1tbnJI4hoby0HmHuPv
         j3kvVM9Glpb//zIsCtxbaXlN8yUGZ/nlIC/cyjGlFu1Wv8KLmMUL7IVyw79rOZA/M1lC
         fnxkQJl0yaTF4H096BCa9MFh45dLaH5a2jZ1DCPlBkd3ofFAEGXKg8IHXvqB52hkAlpF
         iK0A==
X-Gm-Message-State: AOJu0YwBG2r6SyU1xoKV3g9eR6xGG84qRBR9USkxpxnLQr8ijEglh+lV
	b0IZx5+4/r4VKfnt+qUDBOvVHMNjqMJuOg8dGZwqV/1LsdHLlccC4nzepjPPrLA=
X-Google-Smtp-Source: AGHT+IF4hz7cjQwwmXEqwL3shsgW+QtxYc7CsgyWJ+jdcQ7bnp/JrmQyu9/3upxoodWqu2EYhTFpeQ==
X-Received: by 2002:a05:6358:590b:b0:178:7748:282f with SMTP id g11-20020a056358590b00b001787748282fmr3614089rwf.41.1706631652537;
        Tue, 30 Jan 2024 08:20:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3f31])
        by smtp.gmail.com with ESMTPSA id e14-20020a630f0e000000b005d8b59f1b29sm6091613pgl.92.2024.01.30.08.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 08:20:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] gcc-runtime: Move gdb pretty printer file to auto-load location
Date: Tue, 30 Jan 2024 08:20:49 -0800
Message-ID: <20240130162049.2019289-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 16:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194497

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
v2: Fix build on mingw

 meta/recipes-devtools/gcc/gcc-runtime.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 64b6168ba76..004deb6e41f 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -85,6 +85,8 @@ do_install () {
 		cd ${B}/${TARGET_SYS}/$d/
 		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/ install
 	done
+	install -d ${D}${datadir}/gdb/auto-load/${libdir}
+	mv ${D}${libdir}/libstdc++*-gdb.py ${D}${datadir}/gdb/auto-load/${libdir}
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


