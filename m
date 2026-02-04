Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39CFE9537F
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 11:04:56 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18022.1770203086851634835
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 03:04:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZHC6iQOj;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-482f454be5bso6389465e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 03:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770203085; x=1770807885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ecNNQbaB2lUMf3+k4oGpwJexiWeVUr+ZhGp+O4b7dw4=;
        b=ZHC6iQOjkVgeJ1atWkr8A6+rIzouQtJh9WHWjiHkOwdgk1gFNgPcNcLjACxg+jeSZU
         HCRs6kx0TWikZ/CCRrF0gwFhvC++In1enOPt+ysujV4e++6B6Lml2AfjNGp+3u1R5+ux
         10EANVi5Q0QFWK7nEsZC5C3BbKHluv6LCYYVTM5Mrure7g+VkRUJUUYGF24V2Evl0jbt
         30PXKLLgXymfwDrdHibzZyqfrSIByPahtEkaIW/mQJz2kqhpaqemqJ+tVH6erdO8qwDL
         CPRXuatNdkOpNzbWbwW0Zc7BA4lveKoaAKHg4bsZ7RJ9BuxHzGKO7FKzwPXS7TrrZuo+
         gVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770203085; x=1770807885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecNNQbaB2lUMf3+k4oGpwJexiWeVUr+ZhGp+O4b7dw4=;
        b=OSUrdnMovZBgWg4sjwwF9qsUMwayQdJvDb0Fjz/TS8Oxb+Jhu2J7JzJeZTJp8r9Dhi
         7tuY88Ryh58801SsKe4fWA7iAECT0cmIwN4XaSgV0ipbvzgCEhnzzA4c7WLB33ZGar5f
         sdYBzirLWuf6w8gxPZHPyXvnfnYAdYFby3WNOYxbAK8Loo7HcgUltPc6CJfXEWroX2Jz
         7S/BXZMGvYm669NgF1yA9ypkBzYLhLLSv2NX4RJawqtyyGD5hnsMUi/beRx8GbCWIV4z
         kt83uCJtbTieXWC0nB5HGeKzouo0rCf1l9SpaVzpI+ci9qzWvXbfZNaUpNck5XB8wKnE
         ufSg==
X-Gm-Message-State: AOJu0YyY47EdQrGQkwydUo284gznhh4P+AlXW+1kQZ6rNYStbdQkdMxo
	syukJ0PfhrxYehpwgI3U040sm04s551XI/sSVN9eGr6xydqa2N4Ty08HJzbM8g==
X-Gm-Gg: AZuq6aL4xcpsfb6CVPx2qgDt4/FAUhYqsefFNNdYAahucl0cxZtmcRXmnRSeU3NifpQ
	CTUy/Z3KeG+UtEc+8GQigygGyBYUAYB6WrLl0W+HYB+OwWTHoWTje/hYleZW6lN38aDzboRNYph
	yBouh1hHkCWxHH1/4o4NlAppxuEeKl3EFiq3KMf7rII6R9wFgWUPf+cR2UKdqcpqDoul8lKgMTS
	LYW1H7OCJ8TGxM6t8K89h/Y0pmSv8QBfQfy9VFof+E2PfQIR7qMIYYSUyHeUDniD7YC5l2Hl0pT
	iNy0kkckfAhgxjk2Wl/3H2JYV4vX96PkrUarCQZ9iXD7Hv9g74sg3CVox9Uh9MAysTQxIATW6FJ
	dtp7trAMoS7vbiIYMDwk9FYtaiRfXY7bbf25x2I59O/d7X0w7fsToOS8gkYL26x3C1LHra3jQLo
	dXFL3xNBKRGM6/DkyTBb2uGgzlutE2nWRKPny1hGf4b8/QWbqEQf82z0IsYQ==
X-Received: by 2002:a7b:ce8d:0:b0:477:a71c:d200 with SMTP id 5b1f17b1804b1-48305164e85mr61326895e9.11.1770203084677;
        Wed, 04 Feb 2026 03:04:44 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48310894f18sm53468225e9.13.2026.02.04.03.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 03:04:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] Revert "libconfig: add ptest support"
Date: Wed,  4 Feb 2026 12:04:39 +0100
Message-ID: <20260204110439.2688729-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 11:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230509

From: Alexander Kanavin <alex@linutronix.de>

This reverts commit 4c31a7b410fc9c14815c6853431c7bd56c0e173c.

It is cauding package_qa and reproducibility issues:

ERROR: lib32-libconfig-1.8.2-r0 do_package_qa: QA Issue: File /usr/lib/libconfig/ptest/tests/libconfig_tests in package lib32-libconfig-ptest contains reference to TMPDIR [buildpaths]
ERROR: lib32-libconfig-1.8.2-r0 do_package_qa: QA Issue: /usr/lib/libconfig/ptest/tests/libconfig_tests contained in package lib32-libconfig-ptest requires /bin/bash, but no providers found in RDEPENDS:lib32-libconfig-ptest? [file-rdeps]

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3165

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../distro/include/ptest-packagelists.inc     |  1 -
 .../libconfig/libconfig/run-ptest             | 16 ----------------
 .../libconfig/libconfig_1.8.2.bb              | 19 +------------------
 3 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100755 meta/recipes-extended/libconfig/libconfig/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index df8b0eae8d..b9616e9bf4 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -29,7 +29,6 @@ PTESTS_FAST = "\
     json-c \
     json-glib \
     libcheck \
-    libconfig \
     libconvert-asn1-perl \
     libexif \
     libgpg-error\
diff --git a/meta/recipes-extended/libconfig/libconfig/run-ptest b/meta/recipes-extended/libconfig/libconfig/run-ptest
deleted file mode 100755
index d81fcf4def..0000000000
--- a/meta/recipes-extended/libconfig/libconfig/run-ptest
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-cd tests
-
-for t in libconfig_tests; do
-    if [ -x ./$t ]; then
-        ./$t
-        if [ $? -eq 0 ]; then
-            echo "PASS: $t"
-        else
-            echo "FAIL: $t"
-        fi
-    else
-        echo "SKIP: $t"
-    fi
-done
diff --git a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb b/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
index f4319545f3..6e08a7b04b 100644
--- a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
+++ b/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=17c8e32f0f72580cc2906b409d46b5ac"
 
 SRC_URI = " \
     git://github.com/hyperrealm/libconfig.git;protocol=https;branch=master;tag=v${PV} \
-    file://run-ptest \
 "
 SRCREV = "a42cb47c1526a4f2ed025fcbb2289863375bc898"
 
@@ -18,7 +17,7 @@ DEPENDS += "bison-native flex-native"
 
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
-inherit autotools pkgconfig ptest
+inherit autotools pkgconfig
 
 PACKAGE_BEFORE_PN = "${PN}++"
 FILES:${PN}++ = "${libdir}/${BPN}++*${SOLIBS}"
@@ -28,19 +27,3 @@ do_compile:prepend() {
     rm -f ${S}/lib/grammar.[ch]
     rm -f ${S}/lib/scanner.[ch]
 }
-
-do_compile_ptest() {
-    oe_runmake -C tests check TESTS=
-}
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-
-    if [ -f ${B}/tests/libconfig_tests ]; then
-        libtool --mode=install install -m 0755 ${B}/tests/libconfig_tests ${D}${PTEST_PATH}/tests/libconfig_tests
-    fi
-
-    if [ -d ${S}/tests/testdata ]; then
-        cp -r ${S}/tests/testdata ${D}${PTEST_PATH}/tests/
-    fi
-}
-- 
2.47.3


