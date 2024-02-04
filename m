Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8FEC4828F
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 06:00:26 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.33909.1707026424765129345
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 22:00:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h+tHaSPD;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d93b525959so28873295ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 22:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707026424; x=1707631224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jsZiBS3RHXcmoI0G5RLZkaIMYx6QDFGoWWzWZWO+BY4=;
        b=h+tHaSPDSENVs8BzFiiruKhGB25JuI9p5UfzQmStH2hhGtsTwsFaGouk9bCcDFY773
         JmnPPLHeI8EG/a3QH563woDjr0+G+jtr69qpOKGU1RqVopOvVSH97TkOvoMQVTCIAd/C
         AOaGrcOSDKNSEVxx+HmjstHBngs9pkXktHBdm5u7Yv6R/TKJ921DHKmkB8fIiW2010gQ
         qilfq5IF5p25hbrxESIWvNKqE1a55CgNq3HMirApe4iLpKD0eMMkVHMSOf4EtvVK0SbV
         spPZWpNbqQFHGvxbqrfgB4hF8hOUiz+qA6RaDrXFR+L9Kbq+cBF2DMG6kFNTFCMx6bPk
         +JVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707026424; x=1707631224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jsZiBS3RHXcmoI0G5RLZkaIMYx6QDFGoWWzWZWO+BY4=;
        b=aBHr6BZFc0E6tGSQpKQ9OlhT94SD41QtlrpmApxlHCy7udnAkMkGmYloX2Rvt4aqc8
         sHVZESfF2MQZchHHzOHDxgCZW0ouIMD3jGwoMsHAx55mUdxx6op/wcxV8Ou11oPPeIRt
         bmLfXtC7053YwNnXhnd9KAzrafOQOugfOMYGXEcfNQmq4Ty0t3iFd+rUXC2kg26fRK/R
         M3a4ep5et/JMXGTAiA69Ph4w1K1ID1Gh3k9drweT7rw/1sfK+sR1NnIML1xSp0yTfIYC
         yfMX4VtTPQvhvdcMJmTorBcwVq07G8zPnMAVsgIi24v/iFWXu21icn/Rd3B6bgtu0jkU
         Pqkw==
X-Gm-Message-State: AOJu0YxFjUelm9iYPM9Y1KcV2ZJQ9tsRx+q65S2w0rqaJBbNK+kaIOvQ
	8ZbNglyEIcSguRZcJi4olvtpZx7FkukZSwmWitgL9tngG7Tb89y8Fmz/ehXuVgU=
X-Google-Smtp-Source: AGHT+IEuKezlnfGtwQY1JbB4e2REFvZmze/V3h9RdKEE8prrk/w3+Y1lcKwrG84tC3Qot/VT8VUVDg==
X-Received: by 2002:a17:902:e547:b0:1d9:5563:431 with SMTP id n7-20020a170902e54700b001d955630431mr5001010plf.7.1707026422584;
        Sat, 03 Feb 2024 22:00:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d977])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902ed1100b001d752c4f36asm4017603pld.78.2024.02.03.22.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 22:00:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] gcc-runtime: Move gdb pretty printer file to auto-load location
Date: Sat,  3 Feb 2024 22:00:20 -0800
Message-ID: <20240204060020.912187-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 06:00:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194876

When debugging a C++ program on target using libcstdc++, gdb does not
find the pretty printer python support, this is because the init file is
installed into /usr/lib which is excluded from gdb's default list of
directories to load config's from, where as defaults to load from
datadir is still on, it therefore does not load this file

warning: File "/usr/lib/libstdc++.so.6.0.33-gdb.py" auto-loading has been declined by your `auto-load safe-path' set to "$debugdir:$datadir/auto-load".

This leaves the libstdc++ pretty-printers disabled even though added via
IMAGE_INSTALL += "gcc-runtime-dbg"

Comment on adding missing runtime dependency on datetime python module for the pretty
printer to work/load successfully.

Once the pretty-printer gdb file is moved out of libdir, it may become
empty therefore delete it if its empty.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix build on mingw
v3: Remove depending on datetime python module

 meta/recipes-devtools/gcc/gcc-runtime.inc | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 64b6168ba76..dbc9141000d 100644
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
@@ -182,9 +187,14 @@ RRECOMMENDS:${PN}-dbg = ""
 
 # include python debugging scripts
 FILES:${PN}-dbg += "\
-    ${libdir}/libstdc++.*-gdb.py \
     ${datadir}/gcc-${BINV}/python/libstdcxx \
+    ${datadir}/gdb/auto-load \
 "
+# Needed by libstdcxx pretty printer, however it is disabled intentionally
+# as it adds build time dependency on bash and some cases e.g. no GPL3 cases
+# bash is not availbale and builds fails
+# So it needs to be added manually to images sadly.
+# RDEPENDS:${PN}-dbg += "python3-datetime"
 
 FILES:libg2c = "${target_libdir}/libg2c.so.*"
 SUMMARY:libg2c = "Companion runtime library for g77"
-- 
2.43.0


