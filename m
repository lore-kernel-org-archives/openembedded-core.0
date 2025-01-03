Return-Path: <sanakazi720@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0451E77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 10:49:35 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.27915.1735901369979652670
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 02:49:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=enkRavkF;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: sanakazi720@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-218c8aca5f1so211201305ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 02:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735901369; x=1736506169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LZicZymOQKDyuMrP85k3Lx4ODVKKLL1morgno1iwmPU=;
        b=enkRavkFrNaFkyi6AwSiOPaZciZtbncFpR1Rq1S6OShoL8rDKlKc6IKMi3vnLGqS1H
         OcJ7j2dGoGKRui9g3gFIQG2jG69kPZ1LddI8aCrP6+JGznW+eAhExPU4wVV+jigyLzYx
         kTD5KDXTx2sNsk8cbV0YfohBG94kXp57OP/vzlRprvKf1WjjwtDfeE2AHNhtjF1b4TrM
         1oZzvyiTOlDogaBAM45NnsBKYmISTL/SS/ym+eon5KVO8jhINkzYg563QcWFRy5bRk1+
         k5yjP+qLRKc0hBdC+rfuj0atROkQjWe7giGQ08umf1ZWuHsZb4crli3TTHuyyR+YKGRl
         MJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735901369; x=1736506169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZicZymOQKDyuMrP85k3Lx4ODVKKLL1morgno1iwmPU=;
        b=eGoYhnwZovkJYbutMvquVBvYfNc7xAPuWV3UwXkC05ceyLi5Qi7VUBSqOctq7filt6
         SWIlcQ5p9BOj3vD/eniMZxp6qKlN4S2zcENtMXrZRF4M42W/BIYCPLCCBJDa8ThcZvCt
         nhEyztlezv3axwFIPQVI94bPJ/b2rbyTbt1AlskJZTzkyDbRcaMzu4RruLAWwdFUsgUe
         tTu8GlKewwbjagoqa1nCMPTnc92RD9kvp98rq7lMMpookirwUaauPR8K/PhAg1pj+UT9
         zOcsYY8EM+MdrLdIKXNUORj1tATbj2vD0kAYpmH7PdvhlrAr6i8y50ZdXBq0vueE60Zg
         wVMg==
X-Gm-Message-State: AOJu0YzrvqoYyCr87TvKG1UNZsyF0784FkBWRXwozyB+j7OJTivLZ0B3
	thn39NrHxEOI4CGgjjz8pyYBGv0wUbgFe/1Fe7cArq03GldzjkbS1UE4GQ==
X-Gm-Gg: ASbGncvRyODq+R4PkNl2bRZuGEbgOUY+6BoUURgdMCVOklqMBfEU33bHCYRIYmrwpk9
	xliOatP1IBN/F4Oiv6CXupISw0v7R9u/UVtgZjyJ/ORMhswyqLsuCvTFk+thZbsYuIrU4y83KUj
	7COoFocFHnoq/xJtF1Vdn88imEs9p3Xw1+J3BEjSnQ2zwZdwXRK+NfGXd1HMvkf4kq4aiiWyMH0
	Ncsecmu2z9npIQW6tlSq9Sa8VlfF1EO1y21iPWt3MjduGnhwNc7aa0R88buQZ8XoxDQzOR7YMA=
X-Google-Smtp-Source: AGHT+IFnKoX+5O4TptQKjPdtEDhz1gqLAhMDu6RPGv2OXL/THMoStXzpvi3nOtoosIV36siiwxdMxw==
X-Received: by 2002:a05:6a20:7f82:b0:1e0:d575:8d4f with SMTP id adf61e73a8af0-1e5e081c5acmr78540522637.37.1735901369225;
        Fri, 03 Jan 2025 02:49:29 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c17:8a0c:a2f:eb28:c57a:9f74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c24fsm25931947b3a.193.2025.01.03.02.49.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:49:28 -0800 (PST)
From: Sana Kazi <sanakazi720@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] libpng: Add ptest for libpng
Date: Fri,  3 Jan 2025 16:19:03 +0530
Message-Id: <20250103104903.2946151-1-sanakazi720@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 10:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209344

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
 .../libpng/libpng_1.6.42.bb                   | 14 +++++++--
 3 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/libpng/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 5975db25cc..8878af92ff 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -31,6 +31,7 @@ PTESTS_FAST = "\
     libgpg-error\
     libnl \
     libpcre \
+    libpng \
     libssh2 \
     libtimedate-perl \
     libtest-fatal-perl \
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
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index 673133bb4a..6438bf190e 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -10,7 +10,9 @@ DEPENDS = "zlib"
 
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz \
+           file://run-ptest \
+"
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
 
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


