Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F89AEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 12:01:30 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.20452.1688644882599213611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 05:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=rW22XUK3;
 spf=pass (domain: baylibre.com, ip: 209.85.128.53, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fbf1b82d9cso6113275e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 05:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688644881; x=1691236881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POnN4PmjS3xi4ODrXvlEI78YezHGrutyyY0pTmzVPp0=;
        b=rW22XUK3A+FgzG3LGZ6XMx2VquKQIZQo7r32gf0MHeJmOVNUcAfFOD6yHQYWa6Jeww
         i8PwckTx/zfMi690BF2oiVkwBLKm1IvuPQeSqcazJxw6wVMyCBN9qNbi0Uosf5wDYLOO
         Av2HpyXq3fsz4Iy7c8P2XH3dp1WxW+AevVVYxA+HlE83QBIPdFV/XjxN0/L5R+I5vbki
         +x/cZ33ZRW09hGUrUjvzlh3KlSzSnO4ygPN8HQDBR/CJGlfXXVyhYB7yIOq8I0IQ+cXz
         23rD8TqaUXgvRrdbve8UKt2E5yWEIkwkypQIVXoEgssi+pEngAfFtOV0A74lTCl8/6SW
         W3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688644881; x=1691236881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POnN4PmjS3xi4ODrXvlEI78YezHGrutyyY0pTmzVPp0=;
        b=aD11bZo+Oh82qYUXLUVNSx0T772GMGisz6ZT4l5I01qHx3BOqj46dwmIJzg56et2yJ
         FQwrpC4s05AYmcV9xreo3ulduQOQgzHuBAHl3xp05Us/5Q+xOQgEg7iC3wLdOcM7+R2m
         MA169EMnDORJiEMkX7CDnp2nWn10ViX5Bw8Zy9BW8lObJtOllPtqXufKINzhSFtCOUmr
         uxQ13+vlP1aCYGnRTwNwRmmTC1+BMhn0RDnEzxQMkB+y959Gj1Av3+AWYyA3p4a/L+I8
         0QwketFi+3uor0DUq0bKXSYIQl6XhztzWfylH6uDJ+YJ0988W7bLmjfa0xMEnPVG9xuf
         70jA==
X-Gm-Message-State: ABy/qLb3ackbenp9TbqgZr34SXV7P1S2SzZ0wGR445dXKuWrSJn7+rz5
	EDYwwNW4uA3wNsr+qddflfmRf97onNuI0tVwsasuJA==
X-Google-Smtp-Source: APBJJlGjAEKa1Sgm0aysuObAHZxNS5exlwvpNIlsd9Rz2SsgRz0BntCpa9bzLddOxQ3Bq+qT6fBw+Q==
X-Received: by 2002:a7b:c457:0:b0:3fb:739d:27b2 with SMTP id l23-20020a7bc457000000b003fb739d27b2mr1226415wmi.8.1688644880716;
        Thu, 06 Jul 2023 05:01:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id e20-20020a05600c219400b003fbca942499sm4910848wme.14.2023.07.06.05.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 05:01:20 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 2/2] less: add ptest support
Date: Thu,  6 Jul 2023 14:01:05 +0200
Message-ID: <20230706120105.553140-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706120105.553140-1-jstephan@baylibre.com>
References: <20230706120105.553140-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 12:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183933

add ptest support for less

[YOCTO #15073]

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 ...akefile-allow-CFLAGS-to-be-overitten.patch | 28 +++++++++++++
 ...esstest-Makefile-add-LDFLAGS-support.patch | 41 +++++++++++++++++++
 meta/recipes-extended/less/files/run-ptest    | 25 +++++++++++
 meta/recipes-extended/less/less_633.bb        | 24 ++++++++++-
 5 files changed, 117 insertions(+), 2 deletions(-)
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
index e6535d16a78..92fa61a50a9 100644
--- a/meta/recipes-extended/less/less_633.bb
+++ b/meta/recipes-extended/less/less_633.bb
@@ -25,12 +25,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     "
 DEPENDS = "ncurses groff-native"
 
-SRC_URI = "git://github.com/gwsw/less.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/gwsw/less.git;protocol=https;branch=master \
+           file://run-ptest \
+           file://0001-lesstest-Makefile-allow-CFLAGS-to-be-overitten.patch \
+           file://0002-lesstest-Makefile-add-LDFLAGS-support.patch \
+           "
 SRCREV = "0d7ca880375bde651313f03f7115d26921b43722"
 
 S = "${WORKDIR}/git"
 
-inherit autotools update-alternatives
+inherit autotools ptest update-alternatives
+
+EXTRA_OEMAKE += " LESSTEST=1"
 
 # According to the README of the project when getting code from git we should run
 # the following command before running the configure script
@@ -40,9 +46,23 @@ do_configure:prepend () {
         cd -
 }
 
+do_compile_ptest () {
+        cd ${S}/lesstest
+        oe_runmake
+}
+
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
+RDEPENDS:${PN}-ptest:append = " perl-module-getopt-std perl-module-cwd locale-base-en-us"
+
 ALTERNATIVE:${PN} = "less"
 ALTERNATIVE_PRIORITY = "100"
-- 
2.41.0


