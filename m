Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD0CC77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 16:48:49 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.2450.1684860526092449963
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 09:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=MixldqeX;
 spf=pass (domain: baylibre.com, ip: 209.85.166.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-335394455ecso7534015ab.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 09:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684860525; x=1687452525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jdl2aooj0tO32+uk83B56o6HIg14ausdwsk79dwcMtk=;
        b=MixldqeXaD+6a7FueA46ITcsIHpg4QFICmaPEFTV6crozl6l++al7xgKGRn9Le3ebj
         fFIseR+wtKmdyVebxxo6eeBiqXOvoI01DRc55qFR4dwLklVuW7S891kY6Uk/v3mSnHQo
         VeGNBFgA1iDrclJdXMT8eXzTPyARr1/d/P9NK+jyzVLDjbZAD2K4YhtiL9MTPFMPvkl4
         7mv9lmAgc2guBnEkqmwYTOQjGw+WkcY56y2iF7A4/oWi6NnIUflq94TVFrdfVwG5t2Gr
         LxepwTy3bQrCta0xHl9YiiXWwHttrtYeaa6yG/fydQbmWmd+ATaxda6wv/No0mcexmy3
         2a9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684860525; x=1687452525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdl2aooj0tO32+uk83B56o6HIg14ausdwsk79dwcMtk=;
        b=Xlq2XWkM0VgOrPr4KWM3tCNLm8hHxB/qhSmLKrcJYBOA00XHBZj0TyG/J+X7W4FZud
         Dgo2WOZ6X29wR7Os8L/D7DfkL9asdHgRi2+7gRy7I1UY9mpUiJlXYoirH1sd9xx+KCyO
         i9FNC5BlD0IzkPrHA9QbMVQJGS3mUTL/RkN31InkrUo/++BGMmgHi9HTTB2NU05QRT6v
         s+PPAj8VzYrZDqfHKltfsRHRinw7gfQFirUa8KY2hWjW5/rC7tN0Ah0RXe32pd878d5P
         H/P/5F345KzNS3kvmjI0j/VrDRxVMHFYJdAeoC12HOF0SbdHaF8eCSNLNVGy3AmltnVJ
         tfww==
X-Gm-Message-State: AC+VfDzLRveeDnURmN1KPThh50U2Ung+/HitRonnnLgScd0ugiKxGVXb
	qXVqS+PM77S6LdgKCLKMvoe5RRC9mBx127N7yps=
X-Google-Smtp-Source: ACHHUZ5R+Tu0Ymz78CeVAezXB15C/KRXzZIwSgXEhPj4t94O64vpaxY/KZOMZKboeWpZWHnY8HYTbw==
X-Received: by 2002:a92:cc0b:0:b0:33a:7100:81ed with SMTP id s11-20020a92cc0b000000b0033a710081edmr996328ilp.12.1684860524893;
        Tue, 23 May 2023 09:48:44 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:4839:d997:f6ce:5f02])
        by smtp.gmail.com with ESMTPSA id c24-20020a5ea818000000b00769a9bad0bcsm2715234ioa.11.2023.05.23.09.48.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 09:48:44 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] b4: add recipe
Date: Tue, 23 May 2023 12:48:43 -0400
Message-Id: <20230523164843.1816160-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 16:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181652

b4 is a tool for handling email-based patch workflows. It is being
added to help modernize the patchtest tooling, but due to the state of
meta-patchtest and the possibility that others may find it useful, add
it to oe-core instead of that layer.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-devtools/b4/b4_0.12.2.bb         | 35 +++++++++++++++++++
 ...skip-tests-requiring-git-filter-repo.patch | 30 ++++++++++++++++
 meta/recipes-devtools/b4/files/run-ptest      |  3 ++
 5 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/b4/b4_0.12.2.bb
 create mode 100644 meta/recipes-devtools/b4/files/0001-test_ez-skip-tests-requiring-git-filter-repo.patch
 create mode 100644 meta/recipes-devtools/b4/files/run-ptest

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e99fbe4aef..72145a0a38 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -52,6 +52,7 @@ RECIPE_MAINTAINER:pn-autoconf = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-autoconf-archive = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-automake = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-b4 = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-babeltrace = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-babeltrace2 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-baremetal-helloworld = "Alejandro Hernandez <alejandro@enedino.org>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index da9153b998..2c9fb3433d 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -7,6 +7,7 @@ PTESTS_FAST = "\
     acl \
     apr-util \
     attr \
+    b4 \
     babeltrace \
     babeltrace2 \
     bc \
diff --git a/meta/recipes-devtools/b4/b4_0.12.2.bb b/meta/recipes-devtools/b4/b4_0.12.2.bb
new file mode 100644
index 0000000000..f222a8b2e5
--- /dev/null
+++ b/meta/recipes-devtools/b4/b4_0.12.2.bb
@@ -0,0 +1,35 @@
+SUMMARY = "B4 workflow tools"
+DESCRIPTION = "A tool to work with public-inbox and patch archives"
+HOMEPAGE = "https://git.kernel.org/pub/scm/utils/b4/b4.git/"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+SRC_URI[sha256sum] = "b6f4afd78bf78a28055b389f0909792b1c7805fb3557f5d71efbda3682aabe6e"
+
+inherit python_setuptools_build_meta ptest
+
+SRC_URI += "git://git.kernel.org/pub/scm/utils/b4/b4.git;branch=stable-0.12.y;protocol=https \
+            file://run-ptest \
+            file://0001-test_ez-skip-tests-requiring-git-filter-repo.patch \
+"
+
+SRCREV = "0529d7ae380c46f8006892d8fffb563326e2d131"
+
+RDEPENDS:${PN} += " \
+        ${PYTHON_PN}-mailbox \
+        ${PYTHON_PN}-requests \
+"
+
+RDEPENDS:${PN}-ptest += " \
+        git \
+        ${PYTHON_PN}-pytest \
+        ${PYTHON_PN}-unittest-automake-output \
+"
+
+S = "${WORKDIR}/git"
+
+do_install_ptest() {
+      install -d ${D}${PTEST_PATH}/tests
+      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/b4/files/0001-test_ez-skip-tests-requiring-git-filter-repo.patch b/meta/recipes-devtools/b4/files/0001-test_ez-skip-tests-requiring-git-filter-repo.patch
new file mode 100644
index 0000000000..579c31d090
--- /dev/null
+++ b/meta/recipes-devtools/b4/files/0001-test_ez-skip-tests-requiring-git-filter-repo.patch
@@ -0,0 +1,30 @@
+From 5b77018e0d5648f519345a682752df91d99a6a09 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Tue, 23 May 2023 11:09:07 -0400
+Subject: [PATCH] test_ez: skip tests requiring git-filter-repo
+
+git-filter-repo isn't available and is difficult to properly add as a
+recipe, so skip b4 ptests that require it to be installed.
+
+Upstream-Status: Inappropriate (oe-specific)
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ tests/test_ez.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/test_ez.py b/tests/test_ez.py
+index 1b02e7b..059c84c 100644
+--- a/tests/test_ez.py
++++ b/tests/test_ez.py
+@@ -32,6 +32,7 @@ def prepdir(gitdir):
+      ['log', '--format=%ae%n%s%n%b---', 'HEAD~4..'], 'trailers-thread-with-followups-and-tripledash',
+      None),
+ ])
++@pytest.mark.skip(reason="no git-filter-repo")
+ def test_trailers(sampledir, prepdir, mboxf, bundlef, rep, trargs, compareargs, compareout, b4cfg):
+     if b4cfg:
+         b4.MAIN_CONFIG.update(b4cfg)
+-- 
+2.40.1
+
diff --git a/meta/recipes-devtools/b4/files/run-ptest b/meta/recipes-devtools/b4/files/run-ptest
new file mode 100644
index 0000000000..b63c4de0d9
--- /dev/null
+++ b/meta/recipes-devtools/b4/files/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.40.1


