Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA0CEB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 04:52:48 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.14619.1688619159640867912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 21:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AVdLgVud;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: nikhilar2410@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3a3df1ee4a3so84340b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 21:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688619158; x=1691211158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oii29ucmQxC3nc6gsGebzcNb5gBgO+EPxMlcgsRrJ+4=;
        b=AVdLgVudeDxGxujcKyXYUeW31j3NGLqdjR1acFAWYi4nj1Haa+dYdiTU74pKEfyWSE
         6FhGMt3Is/5tx9lNdDg6niCXleaMFByO3Mw6BjR4E2T35jCyMmq1SCLklbjRwR/9QZ2K
         Jg2m3JTC6kMnH0GdTz824Mr0j7LExpkMDat/GrUjC993c5EpdLdSAfEMzeB1exWp24RU
         KA8GdUlDJlKhmjXibDTCexMJ0z1k29ColXc7T8RNtJTLV7l+96JNXcT4Q/zZfTcdCIGN
         UGvTB4RWyUjX9qTvS83g1eff3VR4cqiR6NbNHxx2axVnSYhEV4o0yA/gW8FO1TahsaEJ
         isog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688619158; x=1691211158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oii29ucmQxC3nc6gsGebzcNb5gBgO+EPxMlcgsRrJ+4=;
        b=kvwa8s2nAgAwQXdzBzi2FU/0H3IHTWQ1fSO/cOeb0W2b3s5DAlKU7y6ktQW3vSN73I
         pjlMqe7OMiR7MstFf8TGJMOwMVI+MNthV+cRKs6k+nw7YssR6r+uFUSB5mM23f5oIU12
         YJwmcKW0ApL3PZSrXeeQ55dmbMjV87m5EhA8sjCqeaWwxR5lu33x8hrz0hjNIOe9ZqnH
         50KnNuc54j7WF0TCFZkq/NO+JGK8Y7c4tfuTvbekcD2M9KTHuC32AZY1a25yv7MCcTy8
         GKTKHzyAz1uFVGxbakizUhCpVz9hjXDyZI7J1ggTyIj6IoptE1wexPeEUnJeveYAyHTP
         7tIQ==
X-Gm-Message-State: ABy/qLZ6llV4HmLKaCnxy4lUm9FVQC+gkUdDPb8xnp80UrSzqEPJKkJ5
	MUaGTp2YS0pXNFmD8wZwI7K+5Y13+VpS
X-Google-Smtp-Source: APBJJlGs2UAXka3+I9hnKEY7++U6IBmAZghppqk6Oiot49fdpRLzOplLnyhSzF2GD1NR105Rpth4Kg==
X-Received: by 2002:a05:6808:7c1:b0:3a3:7e6f:d5f5 with SMTP id f1-20020a05680807c100b003a37e6fd5f5mr487813oij.25.1688619158298;
        Wed, 05 Jul 2023 21:52:38 -0700 (PDT)
Received: from localhost.localdomain ([103.171.59.27])
        by smtp.gmail.com with ESMTPSA id w14-20020a63b74e000000b0055bc1a28968sm334408pgt.73.2023.07.05.21.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 21:52:37 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
X-Google-Original-From: Nikhil R <nikhil.r@kpit.com>
To: openembedded-core@lists.openembedded.org,
	nikhil.r@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH] libpng: Add ptest for libpng
Date: Thu,  6 Jul 2023 10:22:28 +0530
Message-Id: <20230706045228.50659-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 04:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183911

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
2.25.1


