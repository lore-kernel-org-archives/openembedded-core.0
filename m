Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CFBEB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:26:59 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.9116.1689690410490540754
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=unv6i+SW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-666ecb21f86so5797675b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690409; x=1692282409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwqUG5YjN/Tqh3qGmfG8HBt13NIUMTuJ9x2rkELZ3is=;
        b=unv6i+SWaa1cYunxMj0/RAjpitVkn5NC1i9vDDyN75I3rJ7XZSULBgmzQJDeP06iIV
         2/O5RSVDVcaBMogUV5d7laaKkU5vQVqwhMTbtfW5oNRQ0+brAJ9eKKxv6dPgQqUsAzfT
         3BwJpA1fEb11RU560e0w4V7aDkWL1JC9pA44rQzUMnLqmmantAHvaxsfa68VMUJ9o6qk
         jgtoNZh8WMwC0lqy2J0QiPzpSy2BOe39udDXwE5em7DxXh0/N6H4v6U7neCTWURrN7H2
         +qCzI52e6SzneJSsQXKtrdG+d816mVqWv7wIPFfGc+hUq7BwwytokWjI5SQ0VxrRo0mF
         l9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690409; x=1692282409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwqUG5YjN/Tqh3qGmfG8HBt13NIUMTuJ9x2rkELZ3is=;
        b=AAbarVlCmSr0JsjGmIQc3z+gGK7AqYBQMT8CC2Wb7UrK7+gOoCjqhyjLxNvHOX1jKc
         HHPYB25lpD0zM0lH3/nCI8epr8mSZLcIjc01liw/rACW9KWbz9CnD+N0BI09rlL0o90s
         36JzHGbOsvm9LtgWiwwiUy5+NHBcyInBm9KBhv6hNCrYGz7BYuHNtajvh+hGxbtRGW7V
         bhJSWk1yQKPKZOLmuQ5qy6ICN9FIgeuPGr/qYvipp/d7Kf7pDW6+LVprWTfqjGdJAnem
         n6NNUBEsDJxc+EfhZDZU5e6OQy80FvIkP341tZh2p1jpO4kuHGBzPzZwkMdmpL6/AYmT
         2Gcw==
X-Gm-Message-State: ABy/qLbbhAyQYBIxUft7GT1X91YYpoWGj6LqcayMJp3JDoVrOG9kNU1A
	MKYm7H8vekSfmSnvmJ0Npo1QQo3XgnDCdlWJcE8=
X-Google-Smtp-Source: APBJJlFw63SOF8QqaxBc0G88W3gkWJURrM6LjbcXRtHy8y5VOVAkmyE7e48BwsXTwIRAD4YyoLo3aA==
X-Received: by 2002:a05:6a00:2481:b0:666:d78c:33ab with SMTP id c1-20020a056a00248100b00666d78c33abmr20292253pfv.21.1689690409591;
        Tue, 18 Jul 2023 07:26:49 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:26:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/27] libpng: Add ptest for libpng
Date: Tue, 18 Jul 2023 04:25:49 -1000
Message-Id: <2d58b38185ca7eed5d885b8d00ca549b57138554.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184519

From: Nikhil R <nikhilar2410@gmail.com>

libpng is a platform-independent library which
supports all PNG features.
This ptest executes the below binaries, parses
the png image and prints the image features.

1. pngfix - provides information about PNG image
copyrights details.

2. pngtest - tests, optimizes and optionally fixes
the zlib header in PNG files.

3. pngstest - verifies the integrity of PNG image by
dumping chunk level information.

4. timepng - provides details about PNG image chunks.

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-multimedia/libpng/files/run-ptest | 29 +++++++++++++++++++
 .../libpng/libpng_1.6.39.bb                   | 16 ++++++++--
 3 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/libpng/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 5bcff83093..5c6a30635f 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -29,6 +29,7 @@ PTESTS_FAST = "\
     libnl-ptest \
     libmodule-build-perl-ptest \
     libpcre-ptest \
+    libpng-ptest \
     libssh2-ptest \
     libtimedate-perl-ptest \
     libtest-needs-perl-ptest \
diff --git a/meta/recipes-multimedia/libpng/files/run-ptest b/meta/recipes-multimedia/libpng/files/run-ptest
new file mode 100644
index 0000000000..9ab5d0c1f4
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/run-ptest
@@ -0,0 +1,29 @@
+#!/bin/sh
+
+set -eux
+
+./pngfix pngtest.png &> log.txt  2>&1
+
+if grep -i "OK" log.txt 2>&1 ; then
+   echo "PASS: pngfix passed"
+else
+   echo "FAIL: pngfix failed"
+fi
+rm -f log.txt
+
+./pngtest pngtest.png &> log.txt 2>&1
+
+if grep -i "PASS" log.txt 2>&1 ; then
+   echo "PASS: pngtest passed"
+else
+   echo "FAIL: pngtest failed"
+fi
+rm -f log.txt
+
+for i in pngstest timepng; do
+    if "./${i}" pngtest.png 2>&1; then
+        echo "PASS: $i"
+    else
+        echo "FAIL: $i"
+    fi
+done
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
index d9dcf379e9..94db1d3f6b 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
@@ -10,7 +10,11 @@ DEPENDS = "zlib"
 
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
+SRC_URI = "\
+           ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
+           file://run-ptest \
+           "
+
 SRC_URI[sha256sum] = "1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/older-releases/"
@@ -19,7 +23,7 @@ UPSTREAM_CHECK_URI = "http://libpng.org/pub/png/libpng.html"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-inherit autotools binconfig-disabled pkgconfig
+inherit autotools binconfig-disabled pkgconfig ptest
 
 # Work around missing symbols
 EXTRA_OECONF:append:class-target = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off", d)}"
@@ -32,3 +36,11 @@ BBCLASSEXTEND = "native nativesdk"
 
 # CVE-2019-17371 is actually a memory leak in gif2png 2.x
 CVE_CHECK_IGNORE += "CVE-2019-17371"
+
+do_install_ptest() {
+    install -m644 "${S}/pngtest.png" "${D}${PTEST_PATH}"
+    install -m755 "${B}/.libs/pngfix" "${D}${PTEST_PATH}"
+    install -m755 "${B}/.libs/pngtest" "${D}${PTEST_PATH}"
+    install -m755 "${B}/.libs/pngstest" "${D}${PTEST_PATH}"
+    install -m755 "${B}/.libs/timepng" "${D}${PTEST_PATH}"
+}
-- 
2.34.1


