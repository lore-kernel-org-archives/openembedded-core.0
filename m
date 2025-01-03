Return-Path: <sanakazi720@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7117E77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 10:46:45 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.28181.1735901198095560415
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 02:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EWwCV3SE;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: sanakazi720@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso17084078a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 02:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735901197; x=1736505997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=65sovcSkFwy8FicxmL7rbliHfywQvCT9/YuRpLtZVeQ=;
        b=EWwCV3SEpAAsjXm4cEwZghADj0L9/FPQJss8VMkI02G8xyVRDKvSwemb73z7HGeacY
         3Wwqb575MZ2Zpqv5h4cukEC6ALJUQh42WZbSGH1cjU/cmMoIlKz3lwziSjaDDBOzYI+G
         hiMPJtE+okAIDphk40wlNCtgTY3MGF0sMCPSXFE/k+5BdC4xjAVXzZ1rsclkqFflV9SG
         zKVpAaeYXpvEqxHoomNFfwe50U4LoIY4pv7fe7vobmncic8uaW074zSYd4jciqE9u8uA
         dvRh7NYCt0h3mPaP1hbtyvdptzgy8oWLrb8YsIuUlz0y7CHdwoOzDc2SpyD88Dxyzehv
         mYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735901197; x=1736505997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=65sovcSkFwy8FicxmL7rbliHfywQvCT9/YuRpLtZVeQ=;
        b=SLACjBtm9cWR8rLHa5oeV0uTsDWvkF1VaZOTZ/U90I2nw2OWCXXGfMfyrloRVhTXIb
         n8VC97seciCtJn3lZ9cr7iea+1170hlnPwdX2nPUL5eVkN4htlloxs5r4vhVXfopUKyY
         UI//+qYVt223HG9rDXpJlOGrfP5NRxJk0SctM/IfaXPghP8vT0JQyhX+917wCQNc2N0p
         ZFmlWcEePN7o2LsAaOpV7rH1rZI0JSjA0qe7+Fx5TeHhzxI8in7SIf4EtwUXGBpDKFVc
         ZNhqP32pviH721IS9D253irnnqgBPhIGfxXcPF3aRA/BYmkJVlS0slBIyTi+1h8CZpzL
         xkIA==
X-Gm-Message-State: AOJu0YzuxPKfs/rhgw/v8cQ/iPu7lm17IGrLFnbNB0oD1g3X/wH0RKi8
	d9T4bvZDuTNZ46yi8AoecozzgVDlnxznsuFvMKFrIfM/YtwYJQzNh3DxDQ==
X-Gm-Gg: ASbGncsd5qglVw41I2qdaLqkxZkXJe5TFYOyhEAkD6iv84e8yrPRNrjDlg1ByPPHj1l
	TRD2lldwy/Yn9TYqTC3fL4y/c8T8ot/GxS3h2TmfW5y7xbImT6uGD5JzafNsppyqPNImedEFUJq
	Z80vtYhaamhVe87YcxOv6JuEXcpjDJ3voIGj3/hLxxxsVzw6/CGX7khzl0ZZt1+Vzl+UmKvLCBE
	7rwGd8opUzcF8UMfIr4lMllrl22cvDQFH6tdEpIveykhAF2jI2dhdIUfdEDqdgLi31CyOzlzSw=
X-Google-Smtp-Source: AGHT+IEjk0BqNb1t2Liez4Xv7IJ1FpJWOh/r2dpD/IJM7IrdstFQ4/km3Tr4WX0coKBaV26EbF9utQ==
X-Received: by 2002:a17:90a:f94d:b0:2ea:4a6b:79d1 with SMTP id 98e67ed59e1d1-2f452e149bbmr71519579a91.11.1735901197256;
        Fri, 03 Jan 2025 02:46:37 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c17:8a0c:a2f:eb28:c57a:9f74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6285sm242148555ad.215.2025.01.03.02.46.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:46:36 -0800 (PST)
From: Sana Kazi <sanakazi720@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH] libpng: Add ptest for libpng
Date: Fri,  3 Jan 2025 16:16:25 +0530
Message-Id: <20250103104625.2945957-1-sanakazi720@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 10:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209343

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

Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-multimedia/libpng/files/run-ptest | 29 +++++++++++++++++++
 .../libpng/libpng_1.6.44.bb                   | 14 +++++++--
 3 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/libpng/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index e2a90c1c2e..7b02c5fb74 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -32,6 +32,7 @@ PTESTS_FAST = "\
     libgpg-error\
     libnl \
     libpcre \
+    libpng \
     libssh2 \
     libtest-fatal-perl \
     libtest-needs-perl \
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
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.44.bb b/meta/recipes-multimedia/libpng/libpng_1.6.44.bb
index dce4fadc47..50f689eec4 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.44.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.44.bb
@@ -10,7 +10,9 @@ DEPENDS = "zlib"
 
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
+           file://run-ptest \
+"
 SRC_URI[sha256sum] = "60c4da1d5b7f0aa8d158da48e8f8afa9773c1c8baa5d21974df61f1886b8ce8e"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
@@ -19,7 +21,7 @@ UPSTREAM_CHECK_URI = "http://libpng.org/pub/png/libpng.html"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-inherit autotools binconfig-disabled pkgconfig
+inherit autotools binconfig-disabled pkgconfig ptest
 
 # Work around missing symbols
 ARMNEON = "${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off", d)}"
@@ -30,4 +32,12 @@ PACKAGES =+ "${PN}-tools"
 
 FILES:${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix ${bindir}/pngcp"
 
+do_install_ptest() {
+    install -m644 "${S}/pngtest.png" "${D}${PTEST_PATH}"
+    install -m755 "${B}/.libs/pngfix" "${D}${PTEST_PATH}"
+    install -m755 "${B}/.libs/pngtest" "${D}${PTEST_PATH}"
+    install -m755 "${B}/.libs/pngstest" "${D}${PTEST_PATH}"
+    install -m755 "${B}/.libs/timepng" "${D}${PTEST_PATH}"
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


