Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EE8C7115B
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:04:53 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.23250.1750176287027430146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ge5hvgKG;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2fb8226e1cso6579895a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176286; x=1750781086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OydPDF6Qz3g8De6UTxCHOqLcDFzmMlRvjvYPw0Hw750=;
        b=Ge5hvgKG/HLuryMbs6YCR25pswe3par8qJ0ERe6OhJwIEJwzYiMquMxBgL3Fw9LCK3
         dNl6L1+EJyE1i8w7wUfQ0CzMiqy1w8knRoergVU9oXxOjum0j+uIj28DKveUaNzmfZb9
         iyiX3bY/KOFDxSE+pX0bpoMUCkUyXjRIZC7wph6AFk3rZQKJwwi8uPpY1/gHmjsteaVb
         CPxrtIedtqGbuLgd5vdEbFv76b5dMBEWFCmqv3wONfXhPjgCILx82vL+AtEo8uVH8EJM
         sEGbXABYt9dS+pGDdGlbldfa60QNwJ//7UzioIMMbRNJq0d/SPhmIWyVksLHYNUQfcO/
         emkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176286; x=1750781086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OydPDF6Qz3g8De6UTxCHOqLcDFzmMlRvjvYPw0Hw750=;
        b=Z8UZeKICQ6iyGrmu0AX0flMsc8+I5oMyQuLpHzUyCVJSod+cQw0FbsqwMAW/4j1jju
         RmPtOToyI5vQ9P2D0VHkavxUdSc4og6u+g3RJF5s84i4gQ/j7tsI2jTTAYj8E3il8Q+k
         qQP29nudWzyzgH77xr0tXq384otjU0kSIZZp538R0ORQ1FjfarWLBd8c5jGGvUtA/UkL
         ShjLmy8d/3BY/4MSrGKnHtTQrKPLfmvjzZ+MEL4a5ZDT4sRAJmNakVggSJum1SXxZ3en
         +Xoo9QSGPTCakvAW8l1R31guck1paA2XFgG/QonXIq+nnOmUexP7s7ZjSWm8O7sZZc4i
         q9kg==
X-Gm-Message-State: AOJu0Yx6d1OTKJddNSrfl5FVfN79vOOZcu1skLFaJZlhApAPfJ2NoXPa
	KGmxCJH6FOszlZwcd4waY/BTtNUmf5odL6JPbgBT07Pi0f7jb/xocavSkHI/U43/+1mEAN/9wgm
	DJfE5
X-Gm-Gg: ASbGncud6HUOexMIpuDtSZNP/wG12CWe3kMeDtyhba4U1MmZGMIqpFTUsgIJ+BxLnfm
	XBN6sDaO/OCZCgfSS/nYgRaExKg/pDFrRSS+9HBmytjhBWsOh29K9nrEqhOLMyanKMIJaM1a5FM
	X50VpFfCuwDYm7eabPp/qGD5+BIxUkfHj8O2yIXisM1AYSrgCofK6ixl/bYBavgFexAnGf+m3Yc
	exuWLJfgfloyXdsyZLlCZ8NKSwmRpKVKIze6jmreX+j+5/CNJowGoD8zZ0qqYASiO+L92MsXPTp
	AG0lx+uLuExOuOr/eLxTgEKqYXWG+qzEsa+d3EdEyTIlX4jLHanfCg==
X-Google-Smtp-Source: AGHT+IF4MCoHyJHiZMZttMnVxnTYY84Q6dAWsUTxv9rE1LTv2rOm6g1N1SGmATOgA/9fjdtpNoXgsQ==
X-Received: by 2002:a17:90b:2783:b0:2fa:562c:c1cf with SMTP id 98e67ed59e1d1-31427ce9b73mr4503971a91.1.1750176286110;
        Tue, 17 Jun 2025 09:04:46 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decaf71sm82043365ad.217.2025.06.17.09.04.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:04:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/8] libpng: Add ptest
Date: Tue, 17 Jun 2025 09:04:25 -0700
Message-ID: <1b52b7ebe5f8fb490088622181cdb95e6b7f5a29.1750176125.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750176125.git.steve@sakoman.com>
References: <cover.1750176125.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218908

From: Poonam Jadhav <ppjadhav456@gmail.com>

Install libpng test-suite to run it as a ptest.
As the test-suite takes more than 30 seconds to run,
add libpng-ptest to PTESTS_SLOW in ptest-packagelists.inc

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-multimedia/libpng/files/run-ptest |  7 ++++
 .../libpng/libpng_1.6.42.bb                   | 42 ++++++++++++++++++-
 3 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/libpng/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 3387e19191..9950e46776 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -102,6 +102,7 @@ PTESTS_SLOW = "\
     libevent \
     libgcrypt \
     libmodule-build-perl \
+    libpng \
     lttng-tools \
     openssh \
     openssl \
diff --git a/meta/recipes-multimedia/libpng/files/run-ptest b/meta/recipes-multimedia/libpng/files/run-ptest
new file mode 100644
index 0000000000..85051a59f5
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+set -eux
+
+cd src
+
+make check-TESTS
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index 673133bb4a..4c21e8d597 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -10,7 +10,10 @@ DEPENDS = "zlib"
 
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz \
+           file://run-ptest \
+"
+
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
@@ -19,7 +22,7 @@ UPSTREAM_CHECK_URI = "http://libpng.org/pub/png/libpng.html"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-inherit autotools binconfig-disabled pkgconfig
+inherit autotools binconfig-disabled pkgconfig ptest
 
 # Work around missing symbols
 ARMNEON = "${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off", d)}"
@@ -30,4 +33,39 @@ PACKAGES =+ "${PN}-tools"
 
 FILES:${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix ${bindir}/pngcp"
 
+RDEPENDS:${PN}-ptest += "make bash gawk"
+
+do_install_ptest() {
+    # Install test scripts to ptest path
+    install -d ${D}${PTEST_PATH}/src/tests
+    install -m 755 ${S}/tests/* ${D}${PTEST_PATH}/src/tests
+    install -m 755 ${S}/test-driver ${D}${PTEST_PATH}/src
+    install -d ${D}${PTEST_PATH}/src/tests/scripts
+    install -m 755 ${S}/scripts/*.awk ${D}${PTEST_PATH}/src/tests/scripts
+    install -m 644 ${S}/scripts/pnglib* ${S}/scripts/*.c ${S}/scripts/*.def ${S}/scripts/macro.lst ${D}${PTEST_PATH}/src/tests/scripts
+    install -m 644 ${S}/scripts/pnglibconf.h.prebuilt ${D}${PTEST_PATH}/src/tests/scripts/pnglibconf.h
+    install -d ${D}${PTEST_PATH}/src/contrib/tools
+    install -m 755 ${S}/contrib/tools/*.sh ${D}${PTEST_PATH}/src/contrib/tools
+    install -m 644 ${S}/contrib/tools/*.c ${S}/contrib/tools/*.h ${D}${PTEST_PATH}/src/contrib/tools
+
+    # Install .libs directory binaries to ptest path
+    install -m 755 ${B}/.libs/pngtest ${B}/.libs/pngstest ${B}/.libs/pngimage ${B}/.libs/pngunknown ${B}/.libs/pngvalid ${D}${PTEST_PATH}/src
+
+    # Copy png files to ptest path
+    cd ${S} && find contrib -name '*.png' | cpio -pd ${D}${PTEST_PATH}/src
+
+    # Install Makefile and png files
+    install -m 644 ${S}/pngtest.png ${D}${PTEST_PATH}/src
+    install -m 644 ${S}/*.png ${S}/*.h ${S}/*.c ${S}/*.dfa ${B}/pnglibconf.out ${S}/Makefile.am ${S}/Makefile.in ${D}${PTEST_PATH}/src/tests
+
+    sed -e 's/^abs_srcdir = ..*/abs_srcdir = \.\./'          \
+        -e 's/^top_srcdir = ..*/top_srcdir = \.\./'          \
+        -e 's/^srcdir = ..*/srcdir = \./'                    \
+        -e 's/^Makefile: ..*/Makefile: /'                    \
+        -e 's/check-TESTS: $(check_PROGRAMS)/check-TESTS:/g' \
+        ${B}/Makefile > ${D}${PTEST_PATH}/src/Makefile
+
+    sed -e 's|#!/bin/awk|#!/usr/bin/awk|g' -i ${D}${PTEST_PATH}/src/tests/scripts/*.awk
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


