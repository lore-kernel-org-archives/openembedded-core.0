Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A4AEB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 15:59:33 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.11232.1689177567240913786
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 08:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=Akl53kLS;
 spf=pass (domain: baylibre.com, ip: 209.85.221.41, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31434226a2eso8115685f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 08:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689177565; x=1691769565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEnWgzNWzMFZaQUBUaQaDZKCSdqWAEklXnDjik18n6k=;
        b=Akl53kLSQ5mvwGlxsdacZSiFNxGv2ukfAvQjuHpBZQ8VtHxYxWOvt3AlNZvcZZteGN
         JCGVqZLUeSi6+p03eaCenVEw2SGnj1C3G7+HmbKHuayZ33Xfm65s6tjE746zp6AIA6nw
         GJDoklR3BUHqc5BRS8PFAn588yzCE3WCEW+pgDfDXQg8rd/b0Gpj0tRXc7OHfLubB7LL
         uXmtaiE7HjfJtK311HHbJQ3/KjX2nuusJ3VpWK9l/6vHPO98gy/Ykv3IxT3dnSD3QxIK
         Qocvary94zEwbrLnC49M3UDmUSvRudJY7rZIEQ1z8FE/9u//TYsQiEHXDs3Zl3e6M18k
         7CqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689177565; x=1691769565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEnWgzNWzMFZaQUBUaQaDZKCSdqWAEklXnDjik18n6k=;
        b=Beyxg/4zM2tUNkLTPbExzuUj6dzgpume6EmXBW2PH4ykWL09HuAnew5rPMsfI4LjTd
         P7S/FTJswkV6rJAiJQUdLItGiVuiwbRWsWNBNOrAj1iSZtgZdcdn9Q4TEHHKqjtBxft1
         qbpCH5YapxDSJewNMgCwJS7X4eoJ2KK9gcC5kedixzP/j51HqPpaepkHm3NdllrGKudM
         tJdfRGumnzV1DD9A07UFmO6WK/RPLis3Ph5j71WllRB6HvZE7dPX3EA1yGbavPZ5Z15b
         CwQQwwpGUIN1cREEuK0yInYVJWR39hmL6nMXckYzMpr9vVmvFGmspIpOuN6SsJs5bYD7
         5r5A==
X-Gm-Message-State: ABy/qLaK1FlofbIb7Or4fowTc5ECLgn/hGXdlzWyZTXe9H6fQQitK3wN
	cAWmtg6jLdnFhgAGPoAAhiQKqJVwrt5w090dN47Q5A==
X-Google-Smtp-Source: APBJJlHZs+AxObEnCEqBSVzTaGiMQYu0jirLwUnXcaVdH9jLu2O7LzN9wLoVz87bMwBoPJyU2xKZSw==
X-Received: by 2002:a5d:4909:0:b0:314:545b:4f3 with SMTP id x9-20020a5d4909000000b00314545b04f3mr19416456wrq.36.1689177564838;
        Wed, 12 Jul 2023 08:59:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
        by smtp.gmail.com with ESMTPSA id p6-20020a7bcc86000000b003fa95890484sm5412550wma.20.2023.07.12.08.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 08:59:24 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH] libexif: add ptest support
Date: Wed, 12 Jul 2023 17:59:18 +0200
Message-ID: <20230712155918.415721-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712155918.415721-1-jstephan@baylibre.com>
References: <20230712155918.415721-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 15:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184204

adds ptest support for libexif

Ptest was executed on a core-image-minimal:
root@qemux86-64:~# ptest-runner libexif
START: ptest-runner
2023-07-12T15:45
BEGIN: /usr/lib/libexif/ptest
[...]
i====================
All 13 tests passed
(1 test was not run)
====================
[...]
DURATION: 35
END: /usr/lib/libexif/ptest
2023-07-12T15:45
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 ...-serial-tests-config-needed-by-ptest.patch | 26 ++++++++++++++++
 .../recipes-support/libexif/libexif/run-ptest |  3 ++
 .../recipes-support/libexif/libexif_0.6.24.bb | 30 ++++++++++++++++++-
 4 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch
 create mode 100644 meta/recipes-support/libexif/libexif/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index da9153b998c..aa409bbf998 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -75,6 +75,7 @@ PTESTS_FAST = "\
     slang \
     wayland \
     zlib \
+    libexif \
 "
 PTESTS_FAST:append:libc-glibc = " glibc-tests"
 PTESTS_PROBLEMS:remove:libc-glibc = "glibc-tests"
diff --git a/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch b/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch
new file mode 100644
index 00000000000..505aa073309
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch
@@ -0,0 +1,26 @@
+From 1ee7217c8ae724d793f9a9876c3608057a2ccbf8 Mon Sep 17 00:00:00 2001
+From: Julien Stephan <jstephan@baylibre.com>
+Date: Tue, 11 Jul 2023 16:07:54 +0200
+Subject: [PATCH] Add serial-tests config needed by ptest
+
+Add serial-tests support, ptest needs it.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Julien Stephan <jstephan@baylibre.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index cd48047..5413907 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -16,6 +16,7 @@ AM_INIT_AUTOMAKE([
+   dist-zip
+   check-news
+   subdir-objects
++  serial-tests
+ ])
+ AM_MAINTAINER_MODE
+ 
diff --git a/meta/recipes-support/libexif/libexif/run-ptest b/meta/recipes-support/libexif/libexif/run-ptest
new file mode 100644
index 00000000000..2d23159eb03
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+make -o Makefile runtest-TESTS
diff --git a/meta/recipes-support/libexif/libexif_0.6.24.bb b/meta/recipes-support/libexif/libexif_0.6.24.bb
index 367f012f8cf..27e369a89a5 100644
--- a/meta/recipes-support/libexif/libexif_0.6.24.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.24.bb
@@ -11,12 +11,40 @@ def version_underscore(v):
     return "_".join(v.split("."))
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libexif-${PV}.tar.bz2 \
+           file://0001-Add-serial-tests-config-needed-by-ptest.patch \
+           file://run-ptest \
            "
 
 SRC_URI[sha256sum] = "d47564c433b733d83b6704c70477e0a4067811d184ec565258ac563d8223f6ae"
 
-inherit autotools gettext github-releases
+inherit autotools gettext github-releases ptest
 
 EXTRA_OECONF += "--disable-docs"
 
+do_compile_ptest() {
+    oe_runmake -C test buildtest-TESTS
+}
+
+do_install_ptest() {
+    install ${B}/test/test*[!\.o] ${D}${PTEST_PATH}
+    for f in ${D}${PTEST_PATH}/test*; do
+        sed -i "s/\(LD_LIBRARY_PATH=\).*\(:\$LD_LIBRARY_PATH\)\"/\1.\2/" $f
+    done
+
+    install ${B}/test/Makefile ${D}${PTEST_PATH}
+    sed -i -e "/^srcdir/c srcdir = \$\{PWD\}" ${D}${PTEST_PATH}/Makefile
+
+    install -d ${D}${PTEST_PATH}/nls
+    install ${B}/test/nls/*[!\.o] ${D}${PTEST_PATH}/nls
+    install -d ${D}${PTEST_PATH}/.libs
+    install ${B}/test/.libs/* ${D}${PTEST_PATH}/.libs
+
+    install ${S}/test/*.sh ${D}${PTEST_PATH}
+
+    install -d ${D}${PTEST_PATH}/testdata
+    install ${S}/test/testdata/* ${D}${PTEST_PATH}/testdata
+}
+
+RDEPENDS:${PN}-ptest += "make bash"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.41.0


