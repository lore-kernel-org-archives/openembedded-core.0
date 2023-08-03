Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690C7EB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 13:29:28 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.14665.1691069358217439724
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 06:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=RQyLfK7a;
 spf=pass (domain: baylibre.com, ip: 209.85.221.44, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3178fa77b27so860042f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 06:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691069356; x=1691674156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfo/1bvyb0+CpSWMSFKfHoBm+Z3pwS/xNPKUWWB2r/8=;
        b=RQyLfK7a0ubD+YcIcuLhdDTWdfOLQvosOOX4f/m3rwIReJU45Lg29QCbdaSmVDM174
         7pQGOfVsd+UHpCijpgDz/FQGuQ0lVIG6tNyJxFNIcO6L8Ehh0J3Xvcpsc+ycFgcEka2B
         7a9NHq+n07cIQ5NBAesfqR734y0Y5lJHKewQDzurFnRIfeY/kzlerPxKSZO9dqdzird5
         67bwsLflT0RkxVxAndf+yR+jXvHjMV5JF1JpgqZncqOC84+0LZbG7ak1+DPIOQEFTH4l
         scbJYbqdMRs1O2rROnM1OuzHv9lYyCHJRKgCacR5XGN/JeSsKDAG5DBUM6utecRSshbn
         RxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691069356; x=1691674156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfo/1bvyb0+CpSWMSFKfHoBm+Z3pwS/xNPKUWWB2r/8=;
        b=Fu2w+b9DLMXWJKm+E62OQQuOJ1N0S4byAaCj3sHAjHi2+UMGWoNcjEowjtShooUllh
         Wc34c1RMNtlJADN+/RYhxyJ+V7lCAGdwwQCbqr3yJW5pOegzCr+78Ep37I5Do3ry9yt4
         Vf3qCRG41rQD/NWrgWe/bl+vFtei/opoRnsVn9a5VzTyzD9PLLojTL7uJN/wmaMd8Xrh
         aBvP+QAr6crEq9YTJV+ziU3lQbhBgURyP1A+ypb2t73GThhQtH5t9BghwLU/bCE0sIdD
         ZIMQz0we7V+p6U3irLxKPDQjLfxBWQzHtNOje/JkhnGCjbKbJX7yFBohUfaAOcik0rnh
         wmgw==
X-Gm-Message-State: ABy/qLbqD+X69CMKoB4srTDP/LNskXw7IHae6MtwZeYAGm3BB2NhlXBH
	DHmXwcctIHFmZYoestaC4jDs7DS9W3r/jVB/QDQ=
X-Google-Smtp-Source: APBJJlHjyNh8m3R/ggDlSm7tvlCFlxLJMnvxd6kUC8yDjl1kjlovXpbrTyvUmDJxDFa60VIldMmcgw==
X-Received: by 2002:a5d:6a8e:0:b0:314:468d:ccab with SMTP id s14-20020a5d6a8e000000b00314468dccabmr6811133wru.45.1691069356394;
        Thu, 03 Aug 2023 06:29:16 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id r18-20020adfce92000000b0031272fced4dsm21833072wrn.52.2023.08.03.06.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 06:29:16 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [RESEND 1/1] libexif: add ptest support
Date: Thu,  3 Aug 2023 15:29:08 +0200
Message-ID: <20230803132908.4134002-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803132908.4134002-1-jstephan@baylibre.com>
References: <20230803132908.4134002-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 13:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185477

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
index 6250cf081e0..bbbef5b0431 100644
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


