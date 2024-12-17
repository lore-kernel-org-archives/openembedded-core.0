Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA5DE77188
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 23:12:21 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web10.94289.1734477137800894225
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 15:12:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a8aed87a0dso20171085ab.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 15:12:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734477136; x=1735081936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+ohKiwIGkACgdMg/QCEwvHAh0ptLPgzS4IlAA40MFI=;
        b=XH6aYks3HKwk1m7KPJQKWPpkYPOTFik1B6ahfUZ/XVN+9B/wlxrw925hPuvYbwbcIU
         Rt+v01xNxbkT/1rNtZrh27Tro1MC3IXi9krxd8VOmQ5IlCr0RjhmD/5YR0WYgC6lT3PO
         c8/oRnMvjOadthF6/KSaPYSwj3Kv16F8mqZErUvDnZ5XFZkHqoW8MyEOHvrwLgalXnlL
         FPRaAvbX78g/IlOmxbVwiMCrvFzLISY5oqUiBYA9GllBbeAmO8obMJto7fAVmuwFJNFu
         pIn6MOxTFpJUgsJPkCrlaR9kyu2sk+t9KE2xEbZ2kKSvO97la4IV/b62S3y744jqMHzt
         n5DQ==
X-Gm-Message-State: AOJu0YySbbCt8xB5Fz0yHiItEaZKzVGyV4Ddl3MFp/Gj6NuqiwPA0Cnw
	FPpBqaTK2TjpB1CSYVDd++uOZhZr73Iw+FjKkfZyazHpgJc1miVNCMp9fw==
X-Gm-Gg: ASbGnct6km7/S8VWM7f6C+cTCPWwfdXw7H320QGh/E/Kik6EJdf2dYhgwKy/azmFZ2P
	QHQ9jDKaNDFUs3R1F6EDtCVpvVELqy08q497++AZMbRRqWquKvGG70S7Z5I/NPgeQDwWikb7Iss
	4XpJ+Xg/fYZC9vgS82BKM7198Gx3WOzMG49cZQDoTBookYUGQLKbmt8Ur8tOIJP0/niNiRtTcIC
	/HfRn8aILuB2yBIkZy/r5qOmViHUeq+G2WdrcK7dtIG/JfRlUW6PRhyJFTHqucVy/xDDN3U62zs
	bIoFkq+6KW9TICUqUZdbCloL1w==
X-Google-Smtp-Source: AGHT+IE7r63ys6cDo30oq3B/uP/cja4dlMou5o1Df9muKG0s+3HHk22hYP1EihAYhR/porcfP1780g==
X-Received: by 2002:a05:6e02:1b0e:b0:3a7:e286:a56b with SMTP id e9e14a558f8ab-3bdc003e81amr7840755ab.5.1734477135716;
        Tue, 17 Dec 2024 15:12:15 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e5e0368817sm1867355173.6.2024.12.17.15.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 15:12:14 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [OE-core][PATCHv2 2/2] python3-*: Update recipes with pytest ptests to use the new ptest-python-pytest class
Date: Tue, 17 Dec 2024 23:12:02 +0000
Message-Id: <20241217231202.3384873-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217231202.3384873-1-derek@asterius.io>
References: <20241217231202.3384873-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 23:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208865

The newly added ptest-python-pytest removes duplication for:
  1. Copying pytest files to the ptest directory
  2. Adding standard pytest dependencies
  3. Adding a common run-ptest script using pytest

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-atomicwrites/run-ptest        |  3 ---
 .../python/python3-atomicwrites_1.4.1.bb         | 13 +------------
 .../python/python3-attrs/run-ptest               |  3 ---
 .../python/python3-attrs_24.2.0.bb               | 12 ++----------
 .../python/python3-bcrypt/run-ptest              |  3 ---
 .../python/python3-bcrypt_4.2.1.bb               |  6 +-----
 .../python/python3-calver/run-ptest              |  3 ---
 .../python/python3-calver_2022.6.26.bb           | 10 +---------
 .../python/python3-click/run-ptest               |  3 ---
 .../python/python3-click_8.1.7.bb                |  8 ++------
 .../python/python3-idna/run-ptest                |  3 ---
 .../recipes-devtools/python/python3-idna_3.10.bb |  8 +-------
 .../python/python3-jinja2/run-ptest              |  3 ---
 .../python/python3-jinja2_3.1.4.bb               | 10 +---------
 .../python/python3-libarchive-c_5.1.bb           |  8 ++------
 .../python/python3-license-expression/run-ptest  |  3 ---
 .../python/python3-license-expression_30.4.0.bb  | 13 +------------
 .../python/python3-mako/run-ptest                |  3 ---
 .../python/python3-mako_1.3.6.bb                 | 15 ++++-----------
 .../python/python3-markupsafe/run-ptest          |  3 ---
 .../python/python3-markupsafe_3.0.2.bb           | 16 +---------------
 .../python/python3-more-itertools/run-ptest      |  3 ---
 .../python/python3-more-itertools_10.5.0.bb      | 13 +------------
 .../python/python3-pefile_2024.8.26.bb           | 11 +----------
 .../python/python3-pluggy/run-ptest              |  3 ---
 .../python/python3-pluggy_1.5.0.bb               | 16 ++--------------
 .../python/python3-pyasn1/run-ptest              |  3 ---
 .../python/python3-pyasn1_0.6.1.bb               | 16 +---------------
 .../python/python3-pytz/run-ptest                |  3 ---
 .../python/python3-pytz_2024.2.bb                | 14 ++++----------
 .../python/python3-pyyaml/run-ptest              |  3 ---
 .../python/python3-pyyaml_6.0.2.bb               | 13 +------------
 .../python/python3-rpds-py/run-ptest             |  3 ---
 .../python/python3-rpds-py_0.21.0.bb             | 11 +----------
 .../python/python3-trove-classifiers/run-ptest   |  3 ---
 .../python3-trove-classifiers_2024.10.21.16.bb   | 16 +---------------
 .../python/python3-uritools/run-ptest            |  3 ---
 .../python/python3-uritools_4.0.3.bb             | 13 +------------
 .../python/python3-wcwidth/run-ptest             |  3 ---
 .../python/python3-wcwidth_0.2.13.bb             | 15 ++-------------
 .../python/python3-webcolors/run-ptest           |  3 ---
 .../python/python3-webcolors_24.8.0.bb           | 16 +---------------
 .../python/python3-xmltodict/run-ptest           |  3 ---
 .../python/python3-xmltodict_0.14.2.bb           | 14 +-------------
 44 files changed, 34 insertions(+), 316 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-atomicwrites/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-attrs/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-bcrypt/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-calver/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-click/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-idna/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-jinja2/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-license-expression/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-mako/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-markupsafe/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-more-itertools/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-pluggy/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-pyasn1/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-pytz/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-pyyaml/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-rpds-py/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-trove-classifiers/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-uritools/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-wcwidth/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-webcolors/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-xmltodict/run-ptest

diff --git a/meta/recipes-devtools/python/python3-atomicwrites/run-ptest b/meta/recipes-devtools/python/python3-atomicwrites/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta/recipes-devtools/python/python3-atomicwrites/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb b/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb
index 848f74d612..b14b62ab2f 100644
--- a/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb
+++ b/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb
@@ -5,23 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4"
 
 SRC_URI[sha256sum] = "81b2c9071a49367a7f770170e5eec8cb66567cfbbc8c73d20ce5ca4a8d71cf11"
 
-inherit pypi setuptools3 ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
+inherit pypi setuptools3 ptest-python-pytest
 
 RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
-	python3-unittest-automake-output \
 	python3-unixadmin \
 "
 
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 RDEPENDS:${PN} = "python3-misc"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-attrs/run-ptest b/meta/recipes-devtools/python/python3-attrs/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta/recipes-devtools/python/python3-attrs/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-attrs_24.2.0.bb b/meta/recipes-devtools/python/python3-attrs_24.2.0.bb
index a6cb60a8c8..97fda386e6 100644
--- a/meta/recipes-devtools/python/python3-attrs_24.2.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_24.2.0.bb
@@ -5,11 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
 SRC_URI[sha256sum] = "5cfb1b9148b5b086569baec03f20d7b6bf3bcacc9a42bebf87ffaaca362f6346"
 
-inherit pypi ptest python_hatchling
-
-SRC_URI += " \
-	file://run-ptest \
-"
+inherit pypi ptest-python-pytest python_hatchling
 
 DEPENDS += " \
     python3-hatch-vcs-native \
@@ -23,13 +19,9 @@ RDEPENDS:${PN}+= " \
 
 RDEPENDS:${PN}-ptest += " \
     python3-hypothesis \
-    python3-pytest \
-    python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+do_install_ptest:append() {
     install ${S}/conftest.py ${D}${PTEST_PATH}/
 }
 
diff --git a/meta/recipes-devtools/python/python3-bcrypt/run-ptest b/meta/recipes-devtools/python/python3-bcrypt/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta/recipes-devtools/python/python3-bcrypt/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb b/meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb
index 7ca73acc48..ce9237de36 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb
@@ -8,11 +8,7 @@ LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-fuse-ld=bfd', '',
 
 SRC_URI[sha256sum] = "6765386e3ab87f569b276988742039baab087b2cdb01e809d74e74503c2faafe"
 
-inherit pypi python_setuptools3_rust ptest-cargo cargo-update-recipe-crates
-
-SRC_URI += " \
-	file://run-ptest \
-"
+inherit pypi python_setuptools3_rust cargo-update-recipe-crates ptest-python-pytest
 
 CARGO_SRC_DIR = "src/_bcrypt"
 
diff --git a/meta/recipes-devtools/python/python3-calver/run-ptest b/meta/recipes-devtools/python/python3-calver/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta/recipes-devtools/python/python3-calver/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-calver_2022.6.26.bb b/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
index 71b5431400..b2e7e0769d 100644
--- a/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
+++ b/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
@@ -5,24 +5,16 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = " \
     git://github.com/di/calver;branch=master;protocol=https \
-    file://run-ptest \
     file://0001-setup.py-hard-code-version.patch \
 "
 SRCREV = "3268d8acf2c345f32a1c5f08ba25dc67f76cca81"
 
-inherit python_setuptools_build_meta ptest
+inherit python_setuptools_build_meta ptest-python-pytest
 
 S = "${WORKDIR}/git"
 
 RDEPENDS:${PN}-ptest += " \
     python3-pretend \
-    python3-pytest \
-    python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/tests ${D}${PTEST_PATH}/
-}
-
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-click/run-ptest b/meta/recipes-devtools/python/python3-click/run-ptest
deleted file mode 100644
index b63c4de0d9..0000000000
--- a/meta/recipes-devtools/python/python3-click/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta/recipes-devtools/python/python3-click_8.1.7.bb b/meta/recipes-devtools/python/python3-click_8.1.7.bb
index baff4cbd45..e8eeec36e8 100644
--- a/meta/recipes-devtools/python/python3-click_8.1.7.bb
+++ b/meta/recipes-devtools/python/python3-click_8.1.7.bb
@@ -10,9 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8"
 
 SRC_URI[sha256sum] = "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
 
-inherit pypi setuptools3 ptest
-
-SRC_URI += "file://run-ptest"
+inherit pypi setuptools3 ptest-python-pytest
 
 RDEPENDS:${PN}-ptest += " \
 	python3-pytest \
@@ -20,9 +18,7 @@ RDEPENDS:${PN}-ptest += " \
 	python3-unixadmin \
 "
 
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+do_install_ptest:append() {
     cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
     cp -rf ${S}/docs ${D}${PTEST_PATH}/
 }
diff --git a/meta/recipes-devtools/python/python3-idna/run-ptest b/meta/recipes-devtools/python/python3-idna/run-ptest
deleted file mode 100644
index d9693bb30f..0000000000
--- a/meta/recipes-devtools/python/python3-idna/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-python3 -mputao.unittest discover --top-level-directory . --start-directory tests
diff --git a/meta/recipes-devtools/python/python3-idna_3.10.bb b/meta/recipes-devtools/python/python3-idna_3.10.bb
index 854dc35242..bd6529e720 100644
--- a/meta/recipes-devtools/python/python3-idna_3.10.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.10.bb
@@ -5,13 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=204c0612e40a4dd46012a78d02c80fb1"
 
 SRC_URI[sha256sum] = "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"
 
-SRC_URI += "file://run-ptest"
-
-inherit pypi python_flit_core ptest
-
-do_install_ptest() {
-    cp -r ${S}/tests ${D}${PTEST_PATH}/
-}
+inherit pypi python_flit_core ptest-python-pytest
 
 RDEPENDS:${PN} += "python3-codecs"
 RDEPENDS:${PN}-ptest += "python3-unittest-automake-output"
diff --git a/meta/recipes-devtools/python/python3-jinja2/run-ptest b/meta/recipes-devtools/python/python3-jinja2/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta/recipes-devtools/python/python3-jinja2/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
index fd0afc1cb1..84c40796c6 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
@@ -12,21 +12,13 @@ CVE_PRODUCT = "jinja2 jinja"
 
 CLEANBROKEN = "1"
 
-inherit pypi python_flit_core ptest
+inherit pypi python_flit_core ptest-python-pytest
 
 SRC_URI += " \
-	file://run-ptest \
 	file://fix-3.13.patch \
 "
 
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
     python3-unixadmin \
 "
 
diff --git a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
index 333831c4b6..8b5de01b69 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
 
 PYPI_PACKAGE = "libarchive-c"
 
-inherit pypi setuptools3 ptest
+inherit pypi setuptools3 ptest-python-pytest
 
 SRC_URI[sha256sum] = "7bcce24ea6c0fa3bc62468476c6d2f6264156db2f04878a372027c10615a2721"
 
@@ -34,16 +34,12 @@ RDEPENDS:${PN} += "\
 
 RDEPENDS:${PN}-ptest += " \
         locale-base-en-us \
-        python3-pytest \
-        python3-unittest-automake-output \
 "
 
 BBCLASSEXTEND = "native"
 
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
+do_install_ptest:append() {
     install -d ${D}${PTEST_PATH}/libarchive
-    cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/
     cp ${S}/libarchive/* ${D}${PTEST_PATH}/libarchive/
     cp ${S}/README.rst ${D}${PTEST_PATH}/README.rst
 }
diff --git a/meta/recipes-devtools/python/python3-license-expression/run-ptest b/meta/recipes-devtools/python/python3-license-expression/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta/recipes-devtools/python/python3-license-expression/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-license-expression_30.4.0.bb b/meta/recipes-devtools/python/python3-license-expression_30.4.0.bb
index fc92026c79..3af739bed4 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.4.0.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.4.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=86d3f3a95c324c9479bd8986968f43
 
 SRC_URI[sha256sum] = "6464397f8ed4353cc778999caec43b099f8d8d5b335f282e26a9eb9435522f05"
 
-inherit pypi ptest python_setuptools_build_meta
+inherit pypi ptest-python-pytest python_setuptools_build_meta
 PYPI_PACKAGE = "license_expression"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
@@ -22,19 +22,8 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
-	python3-unittest-automake-output \
-"
-
 do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
     install -d ${D}${PTEST_PATH}/src
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
     cp -rf ${S}/src/* ${D}${PTEST_PATH}/src/
     cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
 }
diff --git a/meta/recipes-devtools/python/python3-mako/run-ptest b/meta/recipes-devtools/python/python3-mako/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta/recipes-devtools/python/python3-mako/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-mako_1.3.6.bb b/meta/recipes-devtools/python/python3-mako_1.3.6.bb
index 27e2082dc0..c10cfa20c8 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.6.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.6.bb
@@ -6,11 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d0995d6f7ba3f186a03118f244e88f57"
 
 PYPI_PACKAGE = "mako"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
 
-SRC_URI:append = " \
-    file://run-ptest \
-"
 
 SRC_URI[sha256sum] = "9ec3a1583713479fae654f83ed9fa8c9a4c16b7bb0daba0e6bbebff50c0d983d"
 
@@ -22,15 +20,10 @@ RDEPENDS:${PN} = "python3-html \
                   python3-threading \
 "
 
-RDEPENDS:${PN}-ptest += "\
-    python3-pytest \
-    python3-unittest-automake-output \
-"
+PTEST_PYTEST_DIR = "test"
 
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/test
+do_install_ptest:append() {
     install -m 0644 ${S}/setup.cfg ${D}${PTEST_PATH}/
-    cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-markupsafe/run-ptest b/meta/recipes-devtools/python/python3-markupsafe/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta/recipes-devtools/python/python3-markupsafe/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb b/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb
index e5feb8fe5f..b90dd84f48 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb
@@ -6,22 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 SRC_URI[sha256sum] = "ee55d3edf80167e48ea11a923c7386f4669df67d7994554387f84e7d8b0a2bf0"
 
 PYPI_PACKAGE = "markupsafe"
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN} += "python3-html python3-stringold"
 
 BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
-	python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -f ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta/recipes-devtools/python/python3-more-itertools/run-ptest b/meta/recipes-devtools/python/python3-more-itertools/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta/recipes-devtools/python/python3-more-itertools/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb b/meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb
index a98b412b5d..eda9bf1004 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb
@@ -5,11 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
 SRC_URI[sha256sum] = "5482bfef7849c25dc3c6dd53a6173ae4795da2a41a80faea6700d9f5846c5da6"
 
-inherit pypi python_flit_core ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
+inherit pypi python_flit_core ptest-python-pytest
 
 RDEPENDS:${PN} += " \
         python3-asyncio \
@@ -17,13 +13,6 @@ RDEPENDS:${PN} += " \
 
 RDEPENDS:${PN}-ptest += " \
 	python3-statistics \
-	python3-pytest \
-	python3-unittest-automake-output \
         "
 
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pefile_2024.8.26.bb b/meta/recipes-devtools/python/python3-pefile_2024.8.26.bb
index 87e651d9d5..6e72c93741 100644
--- a/meta/recipes-devtools/python/python3-pefile_2024.8.26.bb
+++ b/meta/recipes-devtools/python/python3-pefile_2024.8.26.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/erocarrera/pefile"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e34c75178086aca0a17551ffbacaca53"
 
-inherit setuptools3 ptest
+inherit setuptools3 ptest-python-pytest
 SRCREV = "4b3b1e2e568a88d4f1897d694d684f23d9e270c4"
 SRC_URI = "git://github.com/erocarrera/pefile;branch=master;protocol=https \
            file://run-ptest"
@@ -12,17 +12,8 @@ S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native nativesdk"
 
-do_install_ptest() {
-   install -d ${D}${PTEST_PATH}/tests
-   cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 RDEPENDS:${PN} += " \
     python3-mmap \
     python3-netclient \
     python3-stringold \
 "
-RDEPENDS:${PN}-ptest += "\
-    python3-pytest \
-    python3-unittest-automake-output \
-"
diff --git a/meta/recipes-devtools/python/python3-pluggy/run-ptest b/meta/recipes-devtools/python/python3-pluggy/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta/recipes-devtools/python/python3-pluggy/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-pluggy_1.5.0.bb b/meta/recipes-devtools/python/python3-pluggy_1.5.0.bb
index 4f8412d4b3..1f9bb6d1cb 100644
--- a/meta/recipes-devtools/python/python3-pluggy_1.5.0.bb
+++ b/meta/recipes-devtools/python/python3-pluggy_1.5.0.bb
@@ -7,20 +7,8 @@ SRC_URI[sha256sum] = "2cffa88e94fdc978c4c574f15f9e59b7f4201d439195c3715ca9e2486f
 
 DEPENDS += "python3-setuptools-scm-native"
 
-inherit pypi ptest python_setuptools_build_meta
+inherit pypi ptest-python-pytest python_setuptools_build_meta
 
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
-	python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/testing
-	cp -rf ${S}/testing/* ${D}${PTEST_PATH}/testing/
-}
+PTEST_PYTEST_DIR = "testing"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pyasn1/run-ptest b/meta/recipes-devtools/python/python3-pyasn1/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta/recipes-devtools/python/python3-pyasn1/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb
index 3913cb51d2..820ef27d2b 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
 SRC_URI[sha256sum] = "6f580d2bdd84365380830acf45550f2511469f673cb4a5ae3857a3170128b034"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN}:class-target += " \
     python3-codecs \
@@ -14,18 +14,4 @@ RDEPENDS:${PN}:class-target += " \
     python3-shell \
 "
 
-SRC_URI += " \
-       file://run-ptest \
-           "
-
-RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
-	python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pytz/run-ptest b/meta/recipes-devtools/python/python3-pytz/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta/recipes-devtools/python/python3-pytz/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-pytz_2024.2.bb b/meta/recipes-devtools/python/python3-pytz_2024.2.bb
index 04bd1d632d..a379e19234 100644
--- a/meta/recipes-devtools/python/python3-pytz_2024.2.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2024.2.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "http://pythonhosted.org/pytz"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
 
-inherit pypi setuptools3 ptest
+inherit pypi setuptools3 ptest-python-pytest
+
+PTEST_PYTEST_DIR = "pytz/tests"
 
 SRC_URI[sha256sum] = "2aa355083c50a0f93fa581709deac0c9ad65cca8a9e9beac660adcbd493c798a"
 
@@ -18,19 +20,11 @@ RDEPENDS:${PN}:class-target += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI += " \
-	file://run-ptest \
-"
-
 RDEPENDS:${PN}-ptest += " \
 	python3-pytest \
 	python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/pytz
-	install -d ${D}${PTEST_PATH}/pytz/tests
-	cp -rf ${S}/pytz/tests/* ${D}${PTEST_PATH}/pytz/tests/
+do_install_ptest:append() {
 	cp -f ${S}/README.rst ${D}${PTEST_PATH}/
-
 }
diff --git a/meta/recipes-devtools/python/python3-pyyaml/run-ptest b/meta/recipes-devtools/python/python3-pyyaml/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta/recipes-devtools/python/python3-pyyaml/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb
index 6ea342eae3..7ebe3f7d9f 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb
@@ -8,28 +8,17 @@ SRC_URI[sha256sum] = "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff
 
 SRC_URI += "\
     https://raw.githubusercontent.com/yaml/pyyaml/a98fd6088e81d7aca571220c966bbfe2ac43c335/tests/test_dump_load.py;name=test \
-    file://run-ptest \
 "
 SRC_URI[test.sha256sum] = "b6a8a2825d89fdc8aee226560f66b8196e872012a0ea7118cbef1a832359434a"
 
-inherit pypi python_setuptools_build_meta ptest cython
+inherit pypi python_setuptools_build_meta ptest-python-pytest cython
 
 PACKAGECONFIG ?= "libyaml"
 PACKAGECONFIG[libyaml] = "--with-libyaml,--without-libyaml,libyaml"
 
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${UNPACKDIR}/test_dump_load.py ${D}${PTEST_PATH}/tests/
-}
-
 RDEPENDS:${PN} += "\
     python3-datetime \
     python3-netclient \
 "
 
-RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
-	python3-unittest-automake-output \
-"
-
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-rpds-py/run-ptest b/meta/recipes-devtools/python/python3-rpds-py/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta/recipes-devtools/python/python3-rpds-py/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb b/meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb
index 81a8cb79a4..d162f71c19 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb
@@ -4,13 +4,11 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI += "file://run-ptest"
-
 SRC_URI[sha256sum] = "ed6378c9d66d0de903763e7706383d60c33829581f0adff47b6535f1802fa6db"
 
 require ${BPN}-crates.inc
 
-inherit pypi cargo-update-recipe-crates python_maturin ptest
+inherit pypi cargo-update-recipe-crates python_maturin ptest-python-pytest
 
 PYPI_PACKAGE = "rpds_py"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
@@ -19,13 +17,6 @@ RDEPENDS:${PN}-ptest += " \
     python3-iniconfig \
     python3-packaging \
     python3-pluggy \
-    python3-pytest \
-    python3-unittest-automake-output \
     "
 
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-trove-classifiers/run-ptest b/meta/recipes-devtools/python/python3-trove-classifiers/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta/recipes-devtools/python/python3-trove-classifiers/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb
index 8640ee156b..b63d39b784 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb
@@ -8,22 +8,8 @@ SRC_URI[sha256sum] = "17cbd055d67d5e9d9de63293a8732943fabc21574e4c7b74edf112b492
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 DEPENDS += " python3-calver-native"
 
-SRC_URI += " \
-        file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-       python3-pytest \
-       python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-      install -d ${D}${PTEST_PATH}/tests
-      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-uritools/run-ptest b/meta/recipes-devtools/python/python3-uritools/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta/recipes-devtools/python/python3-uritools/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-uritools_4.0.3.bb b/meta/recipes-devtools/python/python3-uritools_4.0.3.bb
index 640c3f3ab6..4210407e00 100644
--- a/meta/recipes-devtools/python/python3-uritools_4.0.3.bb
+++ b/meta/recipes-devtools/python/python3-uritools_4.0.3.bb
@@ -6,17 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=539275e657c6b7af026bb908356f7541"
 
 SRC_URI[sha256sum] = "ee06a182a9c849464ce9d5fa917539aacc8edd2a4924d1b7aabeeecabcae3bc2"
 
-SRC_URI += "file://run-ptest"
-
-inherit pypi python_setuptools_build_meta ptest
-
-do_install_ptest() {
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/
-}
-
-RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
-	python3-unittest-automake-output \
-"
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-wcwidth/run-ptest b/meta/recipes-devtools/python/python3-wcwidth/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta/recipes-devtools/python/python3-wcwidth/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb b/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
index 4a9bf75323..71bb1a2703 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
@@ -6,20 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
 SRC_URI[sha256sum] = "72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5"
 
-inherit pypi setuptools3 ptest
+inherit pypi setuptools3 ptest-python-pytest
 
-SRC_URI += " \
-        file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-       python3-pytest \
-       python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-      install -d ${D}${PTEST_PATH}/tests 
-      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+do_install_ptest:aapend() {
       install -d ${D}${PTEST_PATH}/bin
       cp -rf ${S}/bin/* ${D}${PTEST_PATH}/bin/
 }
diff --git a/meta/recipes-devtools/python/python3-webcolors/run-ptest b/meta/recipes-devtools/python/python3-webcolors/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta/recipes-devtools/python/python3-webcolors/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb b/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
index 1998cfc4c1..c5ed4bd7d3 100644
--- a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
+++ b/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
@@ -5,24 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cbaebec43b7d199c7fd8f5411b3b0448"
 
 SRC_URI[sha256sum] = "08b07af286a01bcd30d583a7acadf629583d1f79bfef27dd2c2c5c263817277d"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN}:class-target = "\
     python3-stringold \
 "
 
-SRC_URI += " \
-    file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-xmltodict/run-ptest b/meta/recipes-devtools/python/python3-xmltodict/run-ptest
deleted file mode 100644
index 3385d68939..0000000000
--- a/meta/recipes-devtools/python/python3-xmltodict/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb b/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
index e99fa3826e..56cdf6ff4a 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
@@ -9,11 +9,7 @@ PYPI_PACKAGE = "xmltodict"
 
 BBCLASSEXTEND = "native nativesdk"
 
-inherit pypi setuptools3 ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
+inherit pypi setuptools3 ptest-python-pytest
 
 RDEPENDS:${PN} += " \
 	python3-core \
@@ -21,11 +17,3 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.34.1


