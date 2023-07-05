Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A325EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 15:31:47 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.20621.1688571106007936731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 08:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=K432/Qmy;
 spf=pass (domain: baylibre.com, ip: 209.85.128.44, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so65055205e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 08:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688571104; x=1691163104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lXPbBnsyHbdBrDxa58EKLAdn3ArOTOe7t03ee1ymdM=;
        b=K432/QmyVaB79dOhg6RSdzzPM6IlN8uza2jNzeaCygSVjCarp07w1JRSz5GqRqbgvY
         6H89bgylvxWITZ6bGyCQon81sgKQsNABreQ3Sc7JO5N33DcBCrXESyw7lItm2G0fyF/c
         Pab2SRbNMT6PmlW1pg7WGzRID81Eou5O9V/39W2m3hkbxT1znQbJYLzoBumNKo7jCz2d
         X0LXQSc9t7w6mpPWkM/cr1plFapjbbpbg+qoHJmPZS5CPqLaWTf2us74ywqLSCMj3TFa
         evvNppv0lAXP0NYOSOVOUyBDkLsdjgJ/yGjqOq/kvfNHFTbx1tSHLOa00IPeFLKuD5vU
         GjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688571104; x=1691163104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lXPbBnsyHbdBrDxa58EKLAdn3ArOTOe7t03ee1ymdM=;
        b=aC+NZR4Lx48Xb74iGVc4jOMenSux+Mybloxzz87DbowYcJON2qyJLMplEyBPDnzRb5
         ZM8/qIjTFaGNcgupPwNGx0fRxW3LN1vi9v/Jdsizw7VI6aql//t1sIL0txR5hnUw2+TJ
         adbq23tTWT1FOCOaj6LTwmhjpObojceId/BAOZr3+e7LqyDzUmxmxu3e3CxhLEbTc1qe
         2lzpSclV3l9ws2EYwDdBVgkQ3YsKKCeB9Vx85sBuBJ/vUfv+vZ3xdaqReibml72Gyel8
         X5RwpO5T5IdLNG4boBJEt0J5eRfcoqQkvSO+0E577VDCRSn0lbo+EM5JAGjT6YkVV0fl
         GfTg==
X-Gm-Message-State: AC+VfDz+G+6TSYXaZqQeHyvTHv1ZdtOPQO8xlLITLaMIEzwGz1u8WBei
	MvQn4AqBBYonND2WzjgqipyvUbk8hcndRodtYYv+RA==
X-Google-Smtp-Source: ACHHUZ44ZvWdYhFzHBifspJ+2o3Qa5PL3r5GIeXS74FXZ7TgYimIu8IvVxgarIY2UPDuMvPLk/piwA==
X-Received: by 2002:a05:600c:252:b0:3fb:b3aa:1c87 with SMTP id 18-20020a05600c025200b003fbb3aa1c87mr21349086wmj.40.1688571103918;
        Wed, 05 Jul 2023 08:31:43 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id k7-20020a05600c0b4700b003f9b155b148sm2447040wmr.34.2023.07.05.08.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 08:31:43 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 1/1] less: add ptest support
Date: Wed,  5 Jul 2023 17:31:37 +0200
Message-ID: <20230705153137.389584-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705153137.389584-1-jstephan@baylibre.com>
References: <20230705153137.389584-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 15:31:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183894

as of today, release tarball are fetched from
http://www.greenwoodsoftware.com/ but the less test code is not bundled
within these releases. A github issue has been opened asking for
maintainer to add the test code into the release [1].

So before test code gets bundled into the release tarballs, switch to
github URI.

[YOCTO #15073]

[1]: https://github.com/gwsw/less/issues/344

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 ...akefile-allow-CFLAGS-to-be-overitten.patch | 28 +++++++++++++
 ...esstest-Makefile-add-LDFLAGS-support.patch | 41 +++++++++++++++++++
 meta/recipes-extended/less/files/run-ptest    | 25 +++++++++++
 meta/recipes-extended/less/less_633.bb        | 37 ++++++++++++++---
 5 files changed, 127 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/less/files/0001-lesstest-Makefile-allow-CFLAGS-to-be-overitten.patch
 create mode 100644 meta/recipes-extended/less/files/0002-lesstest-Makefile-add-LDFLAGS-support.patch
 create mode 100644 meta/recipes-extended/less/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index da9153b998c..6f4b6912013 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -95,6 +95,7 @@ PTESTS_SLOW = "\
     glib-2.0 \
     gnutls \
     gstreamer1.0 \
+    less \
     libevent \
     libgcrypt \
     libmodule-build-perl \
diff --git a/meta/recipes-extended/less/files/0001-lesstest-Makefile-allow-CFLAGS-to-be-overitten.patch b/meta/recipes-extended/less/files/0001-lesstest-Makefile-allow-CFLAGS-to-be-overitten.patch
new file mode 100644
index 00000000000..f7f6efb7718
--- /dev/null
+++ b/meta/recipes-extended/less/files/0001-lesstest-Makefile-allow-CFLAGS-to-be-overitten.patch
@@ -0,0 +1,28 @@
+From 6499e388a0af8c4531f845ccc58f30ffb1a03c51 Mon Sep 17 00:00:00 2001
+From: Julien Stephan <jstephan@baylibre.com>
+Date: Tue, 4 Jul 2023 11:43:14 +0200
+Subject: [PATCH 1/2] lesstest: Makefile: allow CFLAGS to be overitten
+
+use weak assignment for CFLAGS so user can set its CFLAGS and still have
+a sane default value
+
+Upstream-Status: Submitted [https://github.com/gwsw/less/pull/398]
+
+Signed-off-by: Julien Stephan <jstephan@baylibre.com>
+---
+ lesstest/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lesstest/Makefile b/lesstest/Makefile
+index 387b7ae..a231900 100644
+--- a/lesstest/Makefile
++++ b/lesstest/Makefile
+@@ -1,5 +1,5 @@
+ CC ?= gcc
+-CFLAGS = -Wall -O2
++CFLAGS ?= -Wall -O2
+ TERMLIB = -lncurses
+
+ all: lesstest lt_screen 
+--
+2.41.0
diff --git a/meta/recipes-extended/less/files/0002-lesstest-Makefile-add-LDFLAGS-support.patch b/meta/recipes-extended/less/files/0002-lesstest-Makefile-add-LDFLAGS-support.patch
new file mode 100644
index 00000000000..ec5f6d82d52
--- /dev/null
+++ b/meta/recipes-extended/less/files/0002-lesstest-Makefile-add-LDFLAGS-support.patch
@@ -0,0 +1,41 @@
+From e7a0b9cce9c2b9e90b25f502c272e63de37e7def Mon Sep 17 00:00:00 2001
+From: Julien Stephan <jstephan@baylibre.com>
+Date: Tue, 4 Jul 2023 11:48:52 +0200
+Subject: [PATCH 2/2] lesstest: Makefile: add LDFLAGS support
+
+add LDFLAGS support. By default LDFLAGS will be empty so no functionnal
+change is expected
+
+Upstream-Status: Submitted [https://github.com/gwsw/less/pull/398]
+
+Signed-off-by: Julien Stephan <jstephan@baylibre.com>
+---
+ lesstest/Makefile | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/lesstest/Makefile b/lesstest/Makefile
+index a231900..8fc0d49 100644
+--- a/lesstest/Makefile
++++ b/lesstest/Makefile
+@@ -1,16 +1,17 @@
+ CC ?= gcc
+ CFLAGS ?= -Wall -O2
++LDFLAGS ?=
+ TERMLIB = -lncurses
+
+ all: lesstest lt_screen 
+
+ LESSTEST_OBJ = display.o env.o lesstest.o parse.o pipeline.o log.o run.o term.o wchar.o
+ lesstest: $(LESSTEST_OBJ)
+-	$(CC) $(CFLAGS) -o lesstest $(LESSTEST_OBJ) $(TERMLIB)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o lesstest $(LESSTEST_OBJ) $(TERMLIB)
+
+ LT_SCREEN_OBJ = lt_screen.o unicode.o wchar.o
+ lt_screen: $(LT_SCREEN_OBJ)
+-	$(CC) $(CFLAGS) -o lt_screen $(LT_SCREEN_OBJ)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o lt_screen $(LT_SCREEN_OBJ)
+
+ *.o: lesstest.h lt_types.h wchar.h
+
+--
+2.41.0
diff --git a/meta/recipes-extended/less/files/run-ptest b/meta/recipes-extended/less/files/run-ptest
new file mode 100644
index 00000000000..4cca02392a1
--- /dev/null
+++ b/meta/recipes-extended/less/files/run-ptest
@@ -0,0 +1,25 @@
+#! /bin/sh
+
+fail=0
+pass=0
+
+for i in lt/*; do
+	./runtest -l /usr/bin/less -t lesstest $i &> /dev/null
+
+	if [[ $? -eq 0 ]]; then
+		echo "PASS: $(basename $i)"
+		pass=$((pass+1))
+	else
+		echo "FAIL: $(basename $i)"
+		fail=$((fail+1))
+	fi
+done
+
+echo "============================================================================"
+echo Testsuite summary for less
+echo "============================================================================"
+echo "# TOTAL: $((fail+pass))"
+echo "# PASS: $pass"
+echo "# FAIL: $fail"
+echo "============================================================================"
+
diff --git a/meta/recipes-extended/less/less_633.bb b/meta/recipes-extended/less/less_633.bb
index 2defb5ccb7a..28a62e5d837 100644
--- a/meta/recipes-extended/less/less_633.bb
+++ b/meta/recipes-extended/less/less_633.bb
@@ -23,19 +23,46 @@ LICENSE = "GPL-3.0-or-later | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://LICENSE;md5=1b2446f5c8632bf63a97d7a49750e1c6 \
                     "
-DEPENDS = "ncurses"
+DEPENDS = "ncurses groff-native"
 
-SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI = "git://github.com/gwsw/less.git;protocol=https;branch=master \
+           file://run-ptest \
+           file://0001-lesstest-Makefile-allow-CFLAGS-to-be-overitten.patch \
+           file://0002-lesstest-Makefile-add-LDFLAGS-support.patch \
+           "
+SRCREV = "0d7ca880375bde651313f03f7115d26921b43722"
 
-SRC_URI[sha256sum] = "2f201d64b828b88af36dfe6cfdba3e0819ece2e446ebe6224813209aaefed04f"
+S = "${WORKDIR}/git"
 
-UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
+inherit autotools ptest update-alternatives
 
-inherit autotools update-alternatives
+EXTRA_OEMAKE += " LESSTEST=1"
+
+# According to the README of the project when getting code from git we should run
+# the following command before running the configure script
+do_configure:prepend () {
+        cd ${S}
+        make -f Makefile.aut distfiles
+        cd -
+}
+
+do_compile_ptest () {
+        cd ${S}/lesstest
+        oe_runmake
+}
 
 do_install () {
         oe_runmake 'bindir=${D}${bindir}' 'mandir=${D}${mandir}' install
 }
 
+do_install_ptest () {
+        cp ${S}/lesstest/lesstest ${D}${PTEST_PATH}
+        cp ${S}/lesstest/runtest ${D}${PTEST_PATH}
+        cp ${S}/lesstest/lt_screen ${D}${PTEST_PATH}
+        cp -r ${S}/lesstest/lt ${D}${PTEST_PATH}
+}
+
+RDEPENDS:${PN}-ptest:append = " perl-module-getopt-std perl-module-cwd"
+
 ALTERNATIVE:${PN} = "less"
 ALTERNATIVE_PRIORITY = "100"
-- 
2.41.0


