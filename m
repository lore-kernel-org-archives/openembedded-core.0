Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDA0EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 09:28:19 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.17907.1688635696193779604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 02:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=BQJt4Isv;
 spf=pass (domain: baylibre.com, ip: 209.85.221.48, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3112f5ab0b1so373687f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 02:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688635694; x=1691227694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66LLpd9L8j4W9pc4R7vDWHg1BgXchaJRGnLv62Cd850=;
        b=BQJt4IsvDHWEC+ixmMdr+zZ1iqdBSLSOGRfAtp4+lpKITsvhBfr0ecSqvQy8AcD2M6
         UQWzMwLqYDqlEAwk9S7r/U4B9yG59h9CgS10OpWPwZ7RUQ0tJpITFCNT6IfxW4zUA38N
         glbcZhnKHGIY15Q+3MWUl/L5/hW6pftwmOn0aAxfGPWAan/fkIQ6sT9Po5I47fQ9GsuJ
         Q3yFoYlHa+1b/jdkRHp1diEYpqdN3YxmcfmRDO1lcyz+ojqVZb+5bDUaVs8no6E1PY54
         lQ/nJAP8fPUYRjMTCm56pbyjpFoCmKwfAWgxJoI4LvOKpnypsQgvMEFXpoFSk4TqE1cN
         2sZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688635694; x=1691227694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66LLpd9L8j4W9pc4R7vDWHg1BgXchaJRGnLv62Cd850=;
        b=ZxFERJ/IERr50uTpOoPQlfslOsIPALrAlhmcePWjOPzhU2+bkcZBa9VBrGRhkto31Q
         v/VVoOzRVWJRx3D0mubp8K4P5xTjmprOfilf3JJXS8NG0ZMY41xsbSsgD+JEpSB/5FX4
         l+Lwx/bEcrSsJs30u1LEZeW/pS/ixpnwMy+BsBNo37kMlqEnQDEtQqn8te2d5UOo4Uv8
         TynJg8e/WYd7/yGRU60XA6E1ZHpV5e5YfhbnT7suJXw5TbZBdsQAgP6PsRNIwXBnypa6
         LaFkJe4yvoqk5wqng5vFGNGnfGJqwQn+cNn9zIdr0hoGmbV6f6N8mSZQsrXEljQj6q0Q
         Y7uQ==
X-Gm-Message-State: ABy/qLaVumC8U/dsIHSuQN77Cowpx9tgkqh92Fdw13KcHVo/muQXgpCv
	7VaTIWh5oIbHpt1tUXMRa26AKGARXrxLyCZDUl/3Vg==
X-Google-Smtp-Source: APBJJlGUvoOtuPv9/evSlNIq5tM3029w2qX5nyl8yXCWnBPcZEufAbuyS+Udp1aUqJEMx29kLY6nag==
X-Received: by 2002:adf:f781:0:b0:311:1501:ba53 with SMTP id q1-20020adff781000000b003111501ba53mr915871wrp.49.1688635694447;
        Thu, 06 Jul 2023 02:28:14 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id p14-20020a056000018e00b003113ed02080sm1339926wrx.95.2023.07.06.02.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 02:28:14 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 2/2] less: add ptest support
Date: Thu,  6 Jul 2023 11:28:06 +0200
Message-ID: <20230706092806.507075-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706092806.507075-1-jstephan@baylibre.com>
References: <20230706092806.507075-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 09:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183921

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
index e6535d16a78..28a62e5d837 100644
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
+RDEPENDS:${PN}-ptest:append = " perl-module-getopt-std perl-module-cwd"
+
 ALTERNATIVE:${PN} = "less"
 ALTERNATIVE_PRIORITY = "100"
-- 
2.41.0


