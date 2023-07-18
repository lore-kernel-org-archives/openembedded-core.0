Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68764C001DF
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 16:01:50 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.11769.1689696107188429345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 09:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=BjtjEITi;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-676f16e0bc4so3877248b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 09:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689696106; x=1692288106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwWSBjiI5zABpALWWRK+2muegwqmZ05IymCwjv7wyMg=;
        b=BjtjEITiZ0cwMPlWPKG/ZFaq6XD1fiS1bc0YNjC6b8LP1xm8GT7F3GqYt2lrLZURAF
         RkJqgZhFwcB42DWkMSqSX3nQ/ANE3Y7FmDbJ+44O3+kjBRSBACXRtA8JvVEIpusTx68p
         wakErssp7LOFMKItOto5gdECHxPNvzxCFNvAj8bUM1fhzxAPU1TS58qAk91/S8fle4+8
         hIF4V2xhWloto1wtE9LFAeVc9n4k1UBjBMvW52JC8ZJkbf8rT58ifiiMyFYONOxsIVA+
         +H9NWm5SqkMkjq+WrFvj+yb6LnucA/81Dzt7HovOjGJADzbJHb5UZVXXQ7DGvFbli7sO
         Bbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689696106; x=1692288106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwWSBjiI5zABpALWWRK+2muegwqmZ05IymCwjv7wyMg=;
        b=hm6r3IWl/XxXL5DhxuKfAZ170/YasgFy9tXU5D2JHgH8Ojz4hw1lI2Mzn8KRUXwsU/
         4/4WiYldyOBDV/qMd07+df6ZCihhoi441k6V9dS7WssYuMVGRN+VN6vIh2ZmlKrY17+B
         MZZw1AJzD4U0/o92kaYjkhygPNS0BJ+4T8Tw+kSjL27+0E3pce6PayGSYY91ZgFzRRQ3
         78SSkPvY05bbz7zWAnYMx7ahn34FZnphSRo4TxvaBBJOKerqXGdC1mO85o/tecN+SWST
         QecMZtFefXAGiHVdHWa4Wx+hSJD/3pbtUaXf0RhJ288DeGWRq6oYJLuD6gDl3NEB2FeN
         bDNw==
X-Gm-Message-State: ABy/qLaG4TC+tE6fp0nQw1hXjOkmtTs+Ei+4bc1UzJi7tOuM+/wFpHoW
	LIY051Auafg8yU7q6EYHx8lhxT1tHrUmmzZmxK0=
X-Google-Smtp-Source: APBJJlGB8RYVbkR02rjxA1j6TFhKjjjpWagbGWE9/iwQperf1Muw02vABJb5ZBNqllyUI87eB2I3Dg==
X-Received: by 2002:a05:6a00:17a1:b0:682:4ef7:9b17 with SMTP id s33-20020a056a0017a100b006824ef79b17mr19782112pfg.32.1689696106217;
        Tue, 18 Jul 2023 09:01:46 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q17-20020a62e111000000b0064928cb5f03sm1710089pfh.69.2023.07.18.09.01.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:01:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/13] libpng: Add ptest for libpng
Date: Tue, 18 Jul 2023 06:01:03 -1000
Message-Id: <843803bcc248b18cdefb29d610a1371e32e815ce.1689690585.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689690585.git.steve@sakoman.com>
References: <cover.1689690585.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 16:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184549

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
 .../libpng/libpng_1.6.37.bb                   | 15 ++++++++--
 3 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/libpng/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index badfd69325..3fb7ec2657 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -26,6 +26,7 @@ PTESTS_FAST = "\
     liberror-perl-ptest \
     libmodule-build-perl-ptest \
     libpcre-ptest \
+    libpng-ptest \
     libtimedate-perl-ptest \
     libtest-needs-perl-ptest \
     liburi-perl-ptest \
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
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
index 3c46fa3302..9387fc8e2e 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
@@ -10,7 +10,10 @@ DEPENDS = "zlib"
 
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
+SRC_URI = "\
+           ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
+           file://run-ptest \
+           "
 SRC_URI[md5sum] = "015e8e15db1eecde5f2eb9eb5b6e59e9"
 SRC_URI[sha256sum] = "505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca"
 
@@ -20,7 +23,7 @@ UPSTREAM_CHECK_URI = "http://libpng.org/pub/png/libpng.html"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-inherit autotools binconfig-disabled pkgconfig
+inherit autotools binconfig-disabled pkgconfig ptest
 
 # Work around missing symbols
 EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
@@ -33,3 +36,11 @@ BBCLASSEXTEND = "native nativesdk"
 
 # CVE-2019-17371 is actually a memory leak in gif2png 2.x
 CVE_CHECK_WHITELIST += "CVE-2019-17371"
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


