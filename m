Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DA7C7115D
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:21:05 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.31422.1750195261177065573
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QG5F2P/c;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-748e378ba4fso392256b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195260; x=1750800060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=776AGtm1GUAsf2d8a4E/DtcHPM1G3jvwfP/nT02CJvg=;
        b=QG5F2P/cEt65aeFCe+Pa/4Dvs+ygBHju4iDQw5mqqSPuk5R/tOPbA/zqqHUi6f27uv
         wMGYHIUE1REnG1cO1TkamDsT2BOk2E1vdfHi1P0yuAu7YIbJ8wSKOqtw5mZi8k+UkUhE
         9EtvamgWVNxhUCQ+ZhDFYVHu/Gi6d33b1Q9DQHoANtQZrGsnV4+X+HYoBln5VFmuzyn0
         X3P4Qi32rf7wbdpwb+Lc063Dhe3ujnstydJNz3AfAEMKO8sGF/DHzidkBXm5wyM/D8l4
         +hVZQWL8l7CmlAR0atlF91ZsBNTJxX/3xFgXYN5UpfttveBK+7WVOa3wWW/gaz/FelWD
         +6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195260; x=1750800060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=776AGtm1GUAsf2d8a4E/DtcHPM1G3jvwfP/nT02CJvg=;
        b=Q3dGWMxCfzJvmSX5JRHzXZhn/PiKDUZVE8etypeuCGl9u1A6j1+/q6thWSH+s6lA89
         c01DehDLu1c9yBiBFPjboxegfJRfboEv2jVlTSuqLlfOYo4EYi50m0RnGH8Q+8FAQ+Eb
         5nbJJVuRVWvmb5/H/IsXbQigKC+DOVi958F+Twv1Yw0mWdAMf7x99n51yXfWZRaP1BRq
         Ku8TrVuip6Y9BVZ4+jiIZVnXWNtfgMrBmq9huk6tjsqo7/yggboPLsCnGOPD9TK4GwaZ
         Ipbb0/5edI4IRXHu9v4n42V9tiNssHIK8g1pn7CtVpJNoBMuzNdZjThGTbV6pK0crTvN
         +okQ==
X-Gm-Message-State: AOJu0Yz3TlI9Ib21xbc9P1YwL07sPpzJL8LmlLBaBEFy7ZY5AYYy5LIg
	5a3hEImp4xajgH5aB6dBcVkiB7FOjatVRiI/F9v0C+kkiZ0iIvcLeIUO3ZFecmQ/l/Iun3Jcu/t
	MaEWL
X-Gm-Gg: ASbGncs2TZZx54AH8NZxcMcmvZfwYPp8fiv/qSfMFXl5vWkwi/ufh2YdW6kKgDXrxyI
	TA580pgsNbVR88QjP1lb69y+ymXWsAZWsn+Vqo1+jr5WztPdNB9vNm+qJF675DdY9NccSVncmsD
	IxoK4PWlduHm9RpWVV4442pcy+SbPpybtxZjWDLglQ1AOwUP4IdCrAQtsTLHUYuQh1ddameHEpj
	b5/ib21MkDB4nGDYhM7ntpJ6JDl0NTUN7qER/OE1fW/fCruCLAKeYmrTeSRek8JtwMCTtI+Iols
	o+lqEcf0l5kaRstxvZL68R/RetST53Ez3xGx8NfeCG9oKXHUzF675w==
X-Google-Smtp-Source: AGHT+IEef9MPmHpLrsSOfvbdpUOLmusjvAgd9KNp55HIfc550dcobfUhHOGllm7h+fD6+SvhvSgowA==
X-Received: by 2002:a05:6a00:3c8f:b0:73c:c11:b42e with SMTP id d2e1a72fcca58-7489d0309f3mr21723315b3a.20.1750195260181;
        Tue, 17 Jun 2025 14:21:00 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.20.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:20:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/27] libpng: Improve ptest
Date: Tue, 17 Jun 2025 14:20:14 -0700
Message-ID: <5835b803acc255c227213670588dd01c5168c266.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218934

From: Poonam Jadhav <ppjadhav456@gmail.com>

Install libpng test-suite to run it as a ptest.
As the test-suite takes more than 30 seconds to run,
add libpng-ptest to PTESTS_SLOW in ptest-packagelists.inc

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../distro/include/ptest-packagelists.inc     |  2 +-
 .../recipes-multimedia/libpng/files/run-ptest | 26 +----------
 .../libpng/libpng_1.6.39.bb                   | 43 +++++++++++++++----
 3 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 5c6a30635f..53c023bb81 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -29,7 +29,6 @@ PTESTS_FAST = "\
     libnl-ptest \
     libmodule-build-perl-ptest \
     libpcre-ptest \
-    libpng-ptest \
     libssh2-ptest \
     libtimedate-perl-ptest \
     libtest-needs-perl-ptest \
@@ -88,6 +87,7 @@ PTESTS_SLOW = "\
     glib-2.0-ptest \
     gstreamer1.0-ptest \
     libevent-ptest \
+    libpng-ptest \
     lttng-tools-ptest \
     openssh-ptest \
     openssl-ptest \
diff --git a/meta/recipes-multimedia/libpng/files/run-ptest b/meta/recipes-multimedia/libpng/files/run-ptest
index 9ab5d0c1f4..85051a59f5 100644
--- a/meta/recipes-multimedia/libpng/files/run-ptest
+++ b/meta/recipes-multimedia/libpng/files/run-ptest
@@ -2,28 +2,6 @@
 
 set -eux
 
-./pngfix pngtest.png &> log.txt  2>&1
+cd src
 
-if grep -i "OK" log.txt 2>&1 ; then
-   echo "PASS: pngfix passed"
-else
-   echo "FAIL: pngfix failed"
-fi
-rm -f log.txt
-
-./pngtest pngtest.png &> log.txt 2>&1
-
-if grep -i "PASS" log.txt 2>&1 ; then
-   echo "PASS: pngtest passed"
-else
-   echo "FAIL: pngtest failed"
-fi
-rm -f log.txt
-
-for i in pngstest timepng; do
-    if "./${i}" pngtest.png 2>&1; then
-        echo "PASS: $i"
-    else
-        echo "FAIL: $i"
-    fi
-done
+make check-TESTS
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
index 94db1d3f6b..011eec94a2 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
@@ -13,7 +13,7 @@ LIBV = "16"
 SRC_URI = "\
            ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
-           "
+"
 
 SRC_URI[sha256sum] = "1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937"
 
@@ -32,15 +32,42 @@ PACKAGES =+ "${PN}-tools"
 
 FILES:${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix ${bindir}/pngcp"
 
-BBCLASSEXTEND = "native nativesdk"
-
 # CVE-2019-17371 is actually a memory leak in gif2png 2.x
 CVE_CHECK_IGNORE += "CVE-2019-17371"
 
+RDEPENDS:${PN}-ptest += "make bash gawk"
+
 do_install_ptest() {
-    install -m644 "${S}/pngtest.png" "${D}${PTEST_PATH}"
-    install -m755 "${B}/.libs/pngfix" "${D}${PTEST_PATH}"
-    install -m755 "${B}/.libs/pngtest" "${D}${PTEST_PATH}"
-    install -m755 "${B}/.libs/pngstest" "${D}${PTEST_PATH}"
-    install -m755 "${B}/.libs/timepng" "${D}${PTEST_PATH}"
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
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


