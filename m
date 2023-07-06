Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66473EB64DD
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 13:09:50 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.21879.1688648983828657346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 06:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=rFAT9eWu;
 spf=pass (domain: baylibre.com, ip: 209.85.221.53, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-313e09a5b19so1672808f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688648982; x=1691240982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPZd9wvkUdHrSjUEH9GYdPyUTL1JqbjIjm8+vHE4l54=;
        b=rFAT9eWu8H0lQJQoeYd2AKj+38glauE8HRqUCzRw1Is3XatZSZJ54ncPruYbw4dzPy
         utKA+YpV7/ycAxBJdoEA8DIhK3IzHvpxs3RR7ImgjjqL+1IxCb2Knu1A/OD/EtATTHac
         NdSeZnJs+EFe0HJCux69UoJhlrTgRQJi37eLJo7YS6fzpXqMs3OqmwPUWzLQF0su0kCu
         JbT8oTGuIYZ138dGSw/wx0JPwe6GtyfvZQUsFpeNzyqbhsj8BcWiosEDceOh9l4YI0S2
         e7GgLHDqNOT/HH7DTLp4zMU8xrgiZDubAM7R+tP4S3wA2dN6ae7IGy5FQz8LVD5n+i5j
         pu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688648982; x=1691240982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPZd9wvkUdHrSjUEH9GYdPyUTL1JqbjIjm8+vHE4l54=;
        b=aq703+YG+tf8aW9x3kcUl8NfLiL+T/HMWusLhOvCj49STI1zUuRUB2cxiv6Zjb0HIB
         pzMziFssUBbGnRYOHry6KiqnMpCfyscyAftuzIocPSFPW+wIyN+/VXaA9OSpcJmjeLFU
         qPeq2dbaikxAA7wRkDprOSRw7zxW2HtV1ulRXtPpOWdeKdJvXm9VEe7oDURqo9fnYMJj
         coZ6tfv4Tf2lHHX4eBGgLZQnldY9zad3AcARYnfG1b17pMqkTE4Zphf7/qrWuhkqtssp
         yWMWDEpv1VJQyKBMKT5/9BMuLjdqJnaNRI+u6NRv4piCP2Y6+s/bb+8PUG1a1JlfvNP1
         pQIA==
X-Gm-Message-State: ABy/qLY7BGcnw2l3p6HsUXixPXh8Ss+tKcp8Vdnx8QW/PSJwP5NoNp9s
	3zwoAN1vAI8HpKushHmlovXaPAFV2rJXRkFv5u2k4w==
X-Google-Smtp-Source: APBJJlG5Ut8UKnaAyTYAM1XkaxC9xvTkvW/kEbRh+v8o4Eqipbf5G/0SKp8deSM7D0IPIFL1I3E6Vg==
X-Received: by 2002:a5d:4c89:0:b0:314:327:2edf with SMTP id z9-20020a5d4c89000000b0031403272edfmr1911695wrs.16.1688648982158;
        Thu, 06 Jul 2023 06:09:42 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id v13-20020a5d43cd000000b00314427091a2sm1828419wrr.98.2023.07.06.06.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 06:09:41 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v4 2/2] less: add ptest support
Date: Thu,  6 Jul 2023 15:09:34 +0200
Message-ID: <20230706130934.586539-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706130934.586539-1-jstephan@baylibre.com>
References: <20230706130934.586539-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 13:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183945

add ptest support for less

[YOCTO #15073]

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 ...akefile-allow-CFLAGS-to-be-overitten.patch | 28 +++++++++++++
 ...esstest-Makefile-add-LDFLAGS-support.patch | 41 +++++++++++++++++++
 meta/recipes-extended/less/files/run-ptest    | 26 ++++++++++++
 meta/recipes-extended/less/less_633.bb        | 24 ++++++++++-
 5 files changed, 118 insertions(+), 2 deletions(-)
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
index 00000000000..b3245ac825f
--- /dev/null
+++ b/meta/recipes-extended/less/files/run-ptest
@@ -0,0 +1,26 @@
+#! /bin/sh
+
+fail=0
+pass=0
+
+for i in lt/*; do
+	output=$(./runtest -l /usr/bin/less -t lesstest -O d $i)
+
+	if [[ $? -eq 0 ]]; then
+		echo "PASS: $(basename $i)"
+		pass=$((pass+1))
+	else
+		echo "$output"
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


