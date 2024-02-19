Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA7FC48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 16:10:02 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.44649.1708359001544792116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 08:10:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BfjPdjyI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41264c364fbso9241155e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 08:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708358999; x=1708963799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WxhrlQiaaLvrHO3qpQmO2t30gStdTCZQM7GcE0SZCEc=;
        b=BfjPdjyIX2Wtj2yokNjQpva1i/KTxOw0QSpVskoWmFBY54QiK7fDfuOVpFMAazbJR+
         8goSZdQ6QyZq62JV+hnRAzcIuSjgFGKNglI2fdP8+Qf+bNXONGe0LgmWmkJbaXQoNl29
         wVhxry65sDLDr2J8udxFiRCpwwCU7Xrv86eq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708358999; x=1708963799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WxhrlQiaaLvrHO3qpQmO2t30gStdTCZQM7GcE0SZCEc=;
        b=WrCV6n8rtfj8Jm+scdS4nzQS4At2S6fdLg8c4Ofjt2cWPNb5toTcINHTCaQLcCctEy
         Z72EdsfDMlxi2e8xdVrV4f5Hn346Q40HZc9t565kTVR/rWo3atPg2iKCIsjNsTuoXtY6
         /lNHHON6wYzC8FCWYpIDiCnOGanK5FfWjbPE5aOa2fXagW4OyowKrtHhUJWt1xDeYkid
         +Xmq7EcHDyJX3wednXyGLPsEHmci8RIU8hOTwH7XHDP8xPbmqW9AKNvk7Ze66Yq+JMS0
         8baJ9yWe4jmgIsU9ilmE6G1qfmAu+mC5titOq7f40V2f/eZdQgePv95UvYZvVRd0zKg0
         tqjw==
X-Gm-Message-State: AOJu0Yxkp3VssOpAuFnvrTN3olfUu2GV3bYwqyXinViuTPRAwYJ2ctOn
	Shl6Qa2sj3/bMQd8AzeAWMNtNDsEVCAjxJTIZ15kakC4+xhVLGNraOdBa0cqvbJ+lzo1fV2YhtU
	/
X-Google-Smtp-Source: AGHT+IFqD3ZU9DAXxuQUD56GgtxEr3RTZekZxHqwIoI28A/6CLzeMsr3SpylGDQ/HXgKWcKgvuM2DQ==
X-Received: by 2002:a5d:69ce:0:b0:33d:27d4:2fec with SMTP id s14-20020a5d69ce000000b0033d27d42fecmr5079433wrw.35.1708358998197;
        Mon, 19 Feb 2024 08:09:58 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f060:69a2:69c4:ec75])
        by smtp.gmail.com with ESMTPSA id m2-20020a5d6a02000000b0033d071c0477sm10686045wru.59.2024.02.19.08.09.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 08:09:57 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python: Drop ${PYTHON_PN}
Date: Mon, 19 Feb 2024 16:09:56 +0000
Message-Id: <20240219160956.506354-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 16:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195883

python 2 is gone and we don't need the abstraction now, drop the remaining usage
of this variable.

The definition in python3-dir.bbclass is left for now for other layers.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python-async-test.inc              |  2 +-
 meta/classes-recipe/setuptools3-base.bbclass  |  6 +--
 meta/classes-recipe/setuptools3.bbclass       |  4 +-
 .../classes-recipe/setuptools3_legacy.bbclass |  8 +--
 meta/lib/oeqa/selftest/cases/recipeutils.py   |  2 +-
 .../recipes-devtools/python/python-cython.inc | 30 +++++------
 meta/recipes-devtools/python/python-pbr.inc   |  2 +-
 .../recipes-devtools/python/python-pyasn1.inc | 12 ++---
 meta/recipes-devtools/python/python-six.inc   |  2 +-
 .../python/python-testtools.inc               | 12 ++---
 .../python/python3-asn1crypto_1.5.1.bb        | 16 +++---
 .../python/python3-atomicwrites_1.4.1.bb      |  8 +--
 .../python/python3-attrs_23.2.0.bb            |  6 +--
 .../python/python3-babel_2.14.0.bb            | 18 +++----
 .../python/python3-bcrypt_4.1.2.bb            | 14 ++---
 .../python/python3-calver_2022.6.26.bb        |  6 +--
 .../python/python3-cffi_1.16.0.bb             | 10 ++--
 .../python/python3-chardet_5.2.0.bb           |  4 +-
 .../python/python3-click_8.1.7.bb             | 10 ++--
 .../python3-cryptography-vectors_42.0.2.bb    |  2 +-
 .../python/python3-cryptography_42.0.2.bb     | 30 +++++------
 .../python/python3-dbusmock_0.30.2.bb         |  8 +--
 .../python/python3-git_3.1.41.bb              | 20 +++----
 .../python/python3-hypothesis_6.97.3.bb       |  2 +-
 .../python/python3-idna_3.6.bb                |  2 +-
 .../python3-importlib-metadata_7.0.1.bb       |  4 +-
 .../python/python3-iso8601_2.1.0.bb           |  4 +-
 .../python/python3-jinja2_3.1.3.bb            | 32 ++++++------
 .../python/python3-jsonpointer_2.4.bb         |  8 +--
 .../python/python3-jsonschema_4.17.3.bb       | 44 ++++++++--------
 .../python/python3-libarchive-c_5.0.bb        |  6 +--
 .../python3-license-expression_30.2.0.bb      | 16 +++---
 .../python/python3-lxml_5.0.0.bb              |  2 +-
 .../python/python3-magic_0.4.27.bb            |  8 +--
 .../python/python3-mako_1.3.2.bb              | 10 ++--
 .../python/python3-markdown_3.5.2.bb          |  2 +-
 .../python/python3-markupsafe_2.1.5.bb        |  6 +--
 .../python/python3-more-itertools_10.2.0.bb   |  8 +--
 .../python/python3-ndg-httpsclient_0.5.1.bb   | 12 ++---
 .../python/python3-numpy_1.26.4.bb            | 48 ++++++++---------
 .../python/python3-pathlib2_2.3.7.bb          |  2 +-
 .../python/python3-pluggy_1.4.0.bb            | 10 ++--
 .../python/python3-ply_3.11.bb                |  4 +-
 .../python/python3-psutil_5.9.8.bb            | 14 ++---
 .../python/python3-py_1.11.0.bb               |  4 +-
 .../python/python3-pycparser_2.21.bb          |  6 +--
 .../python/python3-pyelftools_0.30.bb         |  2 +-
 .../python/python3-pyopenssl_24.0.0.bb        |  8 +--
 .../python/python3-pyparsing_3.1.1.bb         | 16 +++---
 .../python/python3-pyrsistent_0.20.0.bb       |  2 +-
 .../python/python3-pysocks_1.7.1.bb           | 10 ++--
 .../python/python3-pytest-runner_6.0.1.bb     |  6 +--
 .../python/python3-pytest-subtests_0.11.0.bb  |  4 +-
 .../python/python3-pytest_8.0.0.bb            | 32 ++++++------
 .../python/python3-pytz_2023.4.bb             | 16 +++---
 .../python/python3-pyyaml_6.0.1.bb            | 10 ++--
 .../python/python3-rdflib_7.0.0.bb            | 14 ++---
 .../python/python3-requests_2.31.0.bb         | 22 ++++----
 .../python/python3-rfc3339-validator_0.1.4.bb |  6 +--
 .../python/python3-ruamel-yaml_0.17.35.bb     |  6 +--
 .../python/python3-semantic-version_2.10.0.bb |  2 +-
 .../python/python3-setuptools-scm_8.0.4.bb    | 16 +++---
 .../python/python3-setuptools_69.0.3.bb       | 52 +++++++++----------
 .../python/python3-smmap_6.0.0.bb             |  4 +-
 .../python/python3-toml_0.10.2.bb             |  2 +-
 .../python3-trove-classifiers_2024.1.8.bb     |  4 +-
 .../python/python3-typogrify_2.0.7.bb         |  2 +-
 .../python/python3-urllib3_2.1.0.bb           | 18 +++----
 .../python/python3-wcwidth_0.2.12.bb          |  4 +-
 .../python/python3-webcolors_1.13.bb          |  6 +--
 .../python/python3-xmltodict_0.13.0.bb        |  8 +--
 .../python/python3-yamllint_1.33.0.bb         |  4 +-
 .../python/python3-zipp_3.17.0.bb             | 10 ++--
 73 files changed, 386 insertions(+), 386 deletions(-)

diff --git a/meta-selftest/recipes-devtools/python/python-async-test.inc b/meta-selftest/recipes-devtools/python/python-async-test.inc
index 6d7c7458b03..a7dd1744f2d 100644
--- a/meta-selftest/recipes-devtools/python/python-async-test.inc
+++ b/meta-selftest/recipes-devtools/python/python-async-test.inc
@@ -11,6 +11,6 @@ PYPI_PACKAGE = "async"
 SRC_URI[md5sum] = "9b06b5997de2154f3bc0273f80bcef6b"
 SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8343051"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-threading"
+RDEPENDS:${PN} += "python3-threading"
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/classes-recipe/setuptools3-base.bbclass b/meta/classes-recipe/setuptools3-base.bbclass
index d1c1fa095fc..27af6abc58e 100644
--- a/meta/classes-recipe/setuptools3-base.bbclass
+++ b/meta/classes-recipe/setuptools3-base.bbclass
@@ -4,9 +4,9 @@
 # SPDX-License-Identifier: MIT
 #
 
-DEPENDS:append:class-target = " ${PYTHON_PN}-native ${PYTHON_PN}"
-DEPENDS:append:class-nativesdk = " ${PYTHON_PN}-native ${PYTHON_PN}"
-RDEPENDS:${PN}:append:class-target = " ${PYTHON_PN}-core"
+DEPENDS:append:class-target = " python3-native python3"
+DEPENDS:append:class-nativesdk = " python3-native python3"
+RDEPENDS:${PN}:append:class-target = " python3-core"
 
 export STAGING_INCDIR
 export STAGING_LIBDIR
diff --git a/meta/classes-recipe/setuptools3.bbclass b/meta/classes-recipe/setuptools3.bbclass
index 4c6e79ee9ab..d71a0895398 100644
--- a/meta/classes-recipe/setuptools3.bbclass
+++ b/meta/classes-recipe/setuptools3.bbclass
@@ -21,9 +21,9 @@ setuptools3_do_compile() {
         NO_FETCH_BUILD=1 \
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
+        ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py \
         bdist_wheel --verbose --dist-dir ${PEP517_WHEEL_PATH} ${SETUPTOOLS_BUILD_ARGS} || \
-        bbfatal_log "'${PYTHON_PN} setup.py bdist_wheel ${SETUPTOOLS_BUILD_ARGS}' execution failed."
+        bbfatal_log "'python3 setup.py bdist_wheel ${SETUPTOOLS_BUILD_ARGS}' execution failed."
 }
 setuptools3_do_compile[vardepsexclude] = "MACHINE"
 do_compile[cleandirs] += "${PEP517_WHEEL_PATH}"
diff --git a/meta/classes-recipe/setuptools3_legacy.bbclass b/meta/classes-recipe/setuptools3_legacy.bbclass
index 57de956d0a7..264b1f5cfb1 100644
--- a/meta/classes-recipe/setuptools3_legacy.bbclass
+++ b/meta/classes-recipe/setuptools3_legacy.bbclass
@@ -38,9 +38,9 @@ setuptools3_legacy_do_compile() {
         NO_FETCH_BUILD=1 \
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
+        ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py \
         build --build-base=${B} ${SETUPTOOLS_BUILD_ARGS} || \
-        bbfatal_log "'${PYTHON_PN} setup.py build ${SETUPTOOLS_BUILD_ARGS}' execution failed."
+        bbfatal_log "'python3 setup.py build ${SETUPTOOLS_BUILD_ARGS}' execution failed."
 }
 setuptools3_legacy_do_compile[vardepsexclude] = "MACHINE"
 
@@ -50,9 +50,9 @@ setuptools3_legacy_do_install() {
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR}:$PYTHONPATH \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
+        ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py \
         build --build-base=${B} install --skip-build ${SETUPTOOLS_INSTALL_ARGS} || \
-        bbfatal_log "'${PYTHON_PN} setup.py install ${SETUPTOOLS_INSTALL_ARGS}' execution failed."
+        bbfatal_log "'python3 setup.py install ${SETUPTOOLS_INSTALL_ARGS}' execution failed."
 
         # support filenames with *spaces*
         find ${D} -name "*.py" -exec grep -q ${D} {} \; \
diff --git a/meta/lib/oeqa/selftest/cases/recipeutils.py b/meta/lib/oeqa/selftest/cases/recipeutils.py
index 6334f1c91a7..2cb4445f81b 100644
--- a/meta/lib/oeqa/selftest/cases/recipeutils.py
+++ b/meta/lib/oeqa/selftest/cases/recipeutils.py
@@ -50,7 +50,7 @@ class RecipeUtilsTests(OESelftestTestCase):
 +SRC_URI[md5sum] = "aaaaaa"
  SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8343051"
  
- RDEPENDS:${PN} += "${PYTHON_PN}-threading"
+ RDEPENDS:${PN} += "python3-threading"
 """
         patchlines = []
         for f in patches:
diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index d116eb826d9..e54926ae6d1 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -15,29 +15,29 @@ UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 inherit pypi
 
 RDEPENDS:${PN}:class-target += "\
-    ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-pkgutil \
-    ${PYTHON_PN}-pyparsing \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-xml \
+    python3-misc \
+    python3-netserver \
+    python3-pkgutil \
+    python3-pyparsing \
+    python3-setuptools \
+    python3-shell \
+    python3-xml \
 "
 
 RDEPENDS:${PN}:class-nativesdk += "\
-    nativesdk-${PYTHON_PN}-misc \
-    nativesdk-${PYTHON_PN}-netserver \
-    nativesdk-${PYTHON_PN}-pkgutil \
-    nativesdk-${PYTHON_PN}-pyparsing \
-    nativesdk-${PYTHON_PN}-setuptools \
-    nativesdk-${PYTHON_PN}-shell \
-    nativesdk-${PYTHON_PN}-xml \
+    nativesdk-python3-misc \
+    nativesdk-python3-netserver \
+    nativesdk-python3-pkgutil \
+    nativesdk-python3-pyparsing \
+    nativesdk-python3-setuptools \
+    nativesdk-python3-shell \
+    nativesdk-python3-xml \
 "
 
 do_install:append() {
 	# Make sure we use /usr/bin/env python
 	for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
-		sed -i -e '1s|^#!.*|#!/usr/bin/env ${PYTHON_PN}|' $PYTHSCRIPT
+		sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
 	done
 
         # remove build paths from generated sources
diff --git a/meta/recipes-devtools/python/python-pbr.inc b/meta/recipes-devtools/python/python-pbr.inc
index 59fbc6dce41..f08d9fd3819 100644
--- a/meta/recipes-devtools/python/python-pbr.inc
+++ b/meta/recipes-devtools/python/python-pbr.inc
@@ -9,6 +9,6 @@ SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
 inherit pypi
 
-RDEPENDS:${PN} += "${PYTHON_PN}-pip"
+RDEPENDS:${PN} += "python3-pip"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index 52fd98589d3..530ff1c7c36 100644
--- a/meta/recipes-devtools/python/python-pyasn1.inc
+++ b/meta/recipes-devtools/python/python-pyasn1.inc
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 SRC_URI[sha256sum] = "6d391a96e59b23130a5cfa74d6fd7f388dbbe26cc8f1edf39fdddf08d9d6676c"
 
 RDEPENDS:${PN}:class-target += " \
-    ${PYTHON_PN}-codecs \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-math \
-    ${PYTHON_PN}-shell \
+    python3-codecs \
+    python3-logging \
+    python3-math \
+    python3-shell \
 "
 
 BBCLASSEXTEND = "native nativesdk"
@@ -21,8 +21,8 @@ SRC_URI += " \
            "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-unittest-automake-output \
+	python3-pytest \
+	python3-unittest-automake-output \
 "
 
 do_install_ptest() {
diff --git a/meta/recipes-devtools/python/python-six.inc b/meta/recipes-devtools/python/python-six.inc
index aac6765149c..6b1b4ba4819 100644
--- a/meta/recipes-devtools/python/python-six.inc
+++ b/meta/recipes-devtools/python/python-six.inc
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=43cfc9e4ac0e377acfb9b76f56b8415d"
 
 inherit pypi
 
-RDEPENDS:${PN} = "${PYTHON_PN}-io"
+RDEPENDS:${PN} = "python3-io"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python-testtools.inc b/meta/recipes-devtools/python/python-testtools.inc
index 759166d63dc..e9dd97ec1c1 100644
--- a/meta/recipes-devtools/python/python-testtools.inc
+++ b/meta/recipes-devtools/python/python-testtools.inc
@@ -9,19 +9,19 @@ inherit pypi
 SRC_URI[sha256sum] = "df6de96010e29ee21f637a147eabf30d50b25e3841dd1d68f93ee89ce77e366c"
 
 DEPENDS += " \
-    ${PYTHON_PN}-pbr \
+    python3-pbr \
     "
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
-    ${PYTHON_PN}-pbr-native \
+    python3-pbr-native \
     "
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-doctest \
-    ${PYTHON_PN}-extras \
-    ${PYTHON_PN}-pbr \
-    ${PYTHON_PN}-six \
+    python3-doctest \
+    python3-extras \
+    python3-pbr \
+    python3-six \
     "
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb b/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
index 3b8c5f9fc57..322497b09bb 100644
--- a/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
+++ b/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
@@ -11,14 +11,14 @@ SRC_URI[sha256sum] = "13ae38502be632115abf8a24cbe5f4da52e3b5231990aff31123c80530
 inherit pypi setuptools3
 
 RDEPENDS:${PN}:class-target += " \
-    ${PYTHON_PN}-codecs \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-shell \
+    python3-codecs \
+    python3-crypt \
+    python3-ctypes \
+    python3-datetime \
+    python3-io \
+    python3-netclient \
+    python3-numbers \
+    python3-shell \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb b/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb
index f29be378e19..848f74d612a 100644
--- a/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb
+++ b/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb
@@ -12,9 +12,9 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-unittest-automake-output \
-	${PYTHON_PN}-unixadmin \
+	python3-pytest \
+	python3-unittest-automake-output \
+	python3-unixadmin \
 "
 
 do_install_ptest() {
@@ -22,6 +22,6 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-RDEPENDS:${PN} = "${PYTHON_PN}-misc"
+RDEPENDS:${PN} = "python3-misc"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
index cdd78c2bd9d..3945798ba5e 100644
--- a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
@@ -24,9 +24,9 @@ RDEPENDS:${PN}+= " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-hypothesis \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-unittest-automake-output \
+    python3-hypothesis \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
diff --git a/meta/recipes-devtools/python/python3-babel_2.14.0.bb b/meta/recipes-devtools/python/python3-babel_2.14.0.bb
index 1f79a35b4df..cd40d4222bf 100644
--- a/meta/recipes-devtools/python/python3-babel_2.14.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.14.0.bb
@@ -12,15 +12,15 @@ inherit pypi setuptools3
 CLEANBROKEN = "1"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-codecs \
-    ${PYTHON_PN}-difflib \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-pytz \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-threading \
+    python3-codecs \
+    python3-difflib \
+    python3-netserver \
+    python3-numbers \
+    python3-pickle \
+    python3-pytz \
+    python3-setuptools \
+    python3-shell \
+    python3-threading \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
index 860f2914769..8328594bad6 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
@@ -3,7 +3,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
 HOMEPAGE = "https://pypi.org/project/bcrypt/"
 
-DEPENDS += "${PYTHON_PN}-cffi-native"
+DEPENDS += "python3-cffi-native"
 LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' -fuse-ld=bfd', '', d)}"
 
 SRC_URI[sha256sum] = "33313a1200a3ae90b75587ceac502b048b840fc69e7f7a0905b5f87fac7a1258"
@@ -19,8 +19,8 @@ CARGO_SRC_DIR = "src/_bcrypt"
 require ${BPN}-crates.inc
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-unittest-automake-output \
+	python3-pytest \
+	python3-unittest-automake-output \
 "
 
 do_install_ptest() {
@@ -29,8 +29,8 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN}:class-target += "\
-    ${PYTHON_PN}-cffi \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-six \
+    python3-cffi \
+    python3-ctypes \
+    python3-shell \
+    python3-six \
 "
diff --git a/meta/recipes-devtools/python/python3-calver_2022.6.26.bb b/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
index 58b33f19ffd..71b5431400b 100644
--- a/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
+++ b/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
@@ -15,9 +15,9 @@ inherit python_setuptools_build_meta ptest
 S = "${WORKDIR}/git"
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pretend \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-unittest-automake-output \
+    python3-pretend \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
diff --git a/meta/recipes-devtools/python/python3-cffi_1.16.0.bb b/meta/recipes-devtools/python/python3-cffi_1.16.0.bb
index a351029ef26..c5f6578ab20 100644
--- a/meta/recipes-devtools/python/python3-cffi_1.16.0.bb
+++ b/meta/recipes-devtools/python/python3-cffi_1.16.0.bb
@@ -2,17 +2,17 @@ SUMMARY = "Foreign Function Interface for Python calling C code"
 HOMEPAGE = "http://cffi.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
-DEPENDS += "libffi ${PYTHON_PN}-pycparser"
+DEPENDS += "libffi python3-pycparser"
 
 SRC_URI[sha256sum] = "bcb3ef43e58665bbda2fb198698fcae6776483e0c4a631aa5647806c25e02cc0"
 
 inherit pypi setuptools3
 
 RDEPENDS:${PN}:class-target = " \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-pycparser \
-    ${PYTHON_PN}-shell \
+    python3-ctypes \
+    python3-io \
+    python3-pycparser \
+    python3-shell \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-chardet_5.2.0.bb b/meta/recipes-devtools/python/python3-chardet_5.2.0.bb
index cea7ebc94d8..ed792b1c7ed 100644
--- a/meta/recipes-devtools/python/python3-chardet_5.2.0.bb
+++ b/meta/recipes-devtools/python/python3-chardet_5.2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI[sha256sum] = "1b3b6ff479a8c414bc3fa2c0852995695c4a026dcd6d0633b2dd092ca39c1cf7"
 
 # setup.py of chardet needs this.
-DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+DEPENDS += "python3-pytest-runner-native"
 
 inherit pypi python_setuptools_build_meta
 
@@ -18,7 +18,7 @@ FILES:${PN}-cli += " \
 RDEPENDS:${PN}-cli = "${PN} "
 
 RDEPENDS:${PN}:class-target += " \
-    ${PYTHON_PN}-logging \
+    python3-logging \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-click_8.1.7.bb b/meta/recipes-devtools/python/python3-click_8.1.7.bb
index a4ec6cd1ef8..7d91e1af838 100644
--- a/meta/recipes-devtools/python/python3-click_8.1.7.bb
+++ b/meta/recipes-devtools/python/python3-click_8.1.7.bb
@@ -15,9 +15,9 @@ inherit pypi setuptools3 ptest
 SRC_URI += "file://run-ptest"
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-terminal \
-	${PYTHON_PN}-unixadmin \
+	python3-pytest \
+	python3-terminal \
+	python3-unixadmin \
 "
 
 do_install_ptest() {
@@ -32,8 +32,8 @@ UPSTREAM_CHECK_REGEX = "click/(?P<pver>\d+(\.\d+)+)/"
 CLEANBROKEN = "1"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-threading \
+    python3-io \
+    python3-threading \
     "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.2.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.2.bb
index 46778e426f5..94fbc94c555 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.2.bb
@@ -16,7 +16,7 @@ PYPI_PACKAGE = "cryptography_vectors"
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += " \
-    ${PYTHON_PN}-cryptography \
+    python3-cryptography \
 "
 
 do_install:append () {
diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
index 7ac0225a391..c21c4d1a03b 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
@@ -20,30 +20,30 @@ require ${BPN}-crates.inc
 inherit pypi python_setuptools3_rust cargo-update-recipe-crates pkgconfig
 
 DEPENDS += " \
-    ${PYTHON_PN}-cffi-native \
+    python3-cffi-native \
 "
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-cffi \
+    python3-cffi \
 "
 
 RDEPENDS:${PN}:append:class-target = " \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-threading \
+    python3-numbers \
+    python3-threading \
 "
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-bcrypt \
-    ${PYTHON_PN}-cryptography-vectors (= ${PV}) \
-    ${PYTHON_PN}-hypothesis \
-    ${PYTHON_PN}-iso8601 \
-    ${PYTHON_PN}-mmap \
-    ${PYTHON_PN}-pretend \
-    ${PYTHON_PN}-psutil \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-unittest-automake-output \
-    ${PYTHON_PN}-pytest-subtests \
-    ${PYTHON_PN}-pytz \
+    python3-bcrypt \
+    python3-cryptography-vectors (= ${PV}) \
+    python3-hypothesis \
+    python3-iso8601 \
+    python3-mmap \
+    python3-pretend \
+    python3-psutil \
+    python3-pytest \
+    python3-unittest-automake-output \
+    python3-pytest-subtests \
+    python3-pytz \
 "
 
 inherit ptest
diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.30.2.bb b/meta/recipes-devtools/python/python3-dbusmock_0.30.2.bb
index 17438cd7562..8e1f0f93fef 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.30.2.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.30.2.bb
@@ -12,11 +12,11 @@ inherit pypi python_setuptools_build_meta
 DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-dbus \
-    ${PYTHON_PN}-unittest \
-    ${PYTHON_PN}-xml \
+    python3-dbus \
+    python3-unittest \
+    python3-xml \
     "
 
-RRECOMMENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', '${MLPREFIX}${PYTHON_PN}-pygobject', '', d)}"
+RRECOMMENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', '${MLPREFIX}python3-pygobject', '', d)}"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/python/python3-git_3.1.41.bb b/meta/recipes-devtools/python/python3-git_3.1.41.bb
index de199ef18b6..dd0440fe59e 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.41.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.41.bb
@@ -14,18 +14,18 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "ed66e624884f76df22c8e16066d567aaa5a37d5b5fa19db2c6df6f7156db9048"
 
-DEPENDS += " ${PYTHON_PN}-gitdb"
+DEPENDS += " python3-gitdb"
 
 RDEPENDS:${PN} += " \
-                   ${PYTHON_PN}-datetime \
-                   ${PYTHON_PN}-gitdb \
-                   ${PYTHON_PN}-io \
-                   ${PYTHON_PN}-logging \
-                   ${PYTHON_PN}-math \
-                   ${PYTHON_PN}-netclient \
-                   ${PYTHON_PN}-stringold \
-                   ${PYTHON_PN}-unittest \
-                   ${PYTHON_PN}-unixadmin \
+                   python3-datetime \
+                   python3-gitdb \
+                   python3-io \
+                   python3-logging \
+                   python3-math \
+                   python3-netclient \
+                   python3-stringold \
+                   python3-unittest \
+                   python3-unixadmin \
                    git \
 "
 
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.97.3.bb b/meta/recipes-devtools/python/python3-hypothesis_6.97.3.bb
index c93727f36c2..52ed2da5752 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.97.3.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.97.3.bb
@@ -27,7 +27,7 @@ RDEPENDS:${PN} += " \
     "
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-unittest-automake-output \
+    python3-unittest-automake-output \
     "
 
 do_install_ptest() {
diff --git a/meta/recipes-devtools/python/python3-idna_3.6.bb b/meta/recipes-devtools/python/python3-idna_3.6.bb
index 228dce62d7f..47c080cdf82 100644
--- a/meta/recipes-devtools/python/python3-idna_3.6.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.6.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "9ecdbbd083b06798ae1e86adcbfe8ab1479cf864e4ee30fe4e46a003d1
 inherit pypi python_flit_core
 
 RDEPENDS:${PN}:class-target = "\
-    ${PYTHON_PN}-codecs \
+    python3-codecs \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb b/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb
index c7c6e3b2645..0d3f0a50012 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb
@@ -12,8 +12,8 @@ SRC_URI[sha256sum] = "f238736bb06590ae52ac1fab06a3a9ef1d8dce2b7a35b5ab329371d6c8
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-toml-native"
-RDEPENDS:${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
+DEPENDS += "python3-setuptools-scm-native python3-toml-native"
+RDEPENDS:${PN} += "python3-zipp python3-pathlib2"
 RDEPENDS:${PN}:append:class-target = " python3-misc"
 RDEPENDS:${PN}:append:class-nativesdk = " python3-misc"
 
diff --git a/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb b/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb
index 40ca5177bee..d7ab4a5a77d 100644
--- a/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb
+++ b/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb
@@ -8,8 +8,8 @@ SRC_URI[sha256sum] = "6b1d3829ee8921c4301998c909f7829fa9ed3cbdac0d3b16af2d743aed
 inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-numbers \
+    python3-datetime \
+    python3-numbers \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
index 18057809c8a..636fb35811b 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
@@ -24,25 +24,25 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-unittest-automake-output \
-    ${PYTHON_PN}-toml \
-    ${PYTHON_PN}-unixadmin \
+    python3-pytest \
+    python3-unittest-automake-output \
+    python3-toml \
+    python3-unixadmin \
 "
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-asyncio \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-markupsafe \
-    ${PYTHON_PN}-math \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers\
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-threading \
+    python3-asyncio \
+    python3-crypt \
+    python3-io \
+    python3-json \
+    python3-markupsafe \
+    python3-math \
+    python3-netclient \
+    python3-numbers\
+    python3-pickle \
+    python3-pprint \
+    python3-shell \
+    python3-threading \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb b/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb
index d7a1fea70ae..062fa5243f9 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb
@@ -8,7 +8,7 @@ inherit pypi ptest setuptools3
 SRC_URI[sha256sum] = "585cee82b70211fa9e6043b7bb89db6e1aa49524340dde8ad6b63206ea689d88"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-json \
+    python3-json \
 "
 
 BBCLASSEXTEND = "native nativesdk"
@@ -18,9 +18,9 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-doctest \
-	${PYTHON_PN}-unittest \
-	${PYTHON_PN}-unittest-automake-output \
+	python3-doctest \
+	python3-unittest \
+	python3-unittest-automake-output \
 "
 
 do_install_ptest() {
diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb b/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
index 77f94924f91..be51a158a97 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
@@ -11,36 +11,36 @@ inherit pypi python_hatchling
 PACKAGES =+ "${PN}-tests"
 FILES:${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/jsonschema/tests"
 
-DEPENDS += "${PYTHON_PN}-hatch-fancy-pypi-readme-native ${PYTHON_PN}-hatch-vcs-native "
+DEPENDS += "python3-hatch-fancy-pypi-readme-native python3-hatch-vcs-native "
 
 PACKAGECONFIG ??= "format"
 PACKAGECONFIG[format] = ",,,\
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-jsonpointer \
-    ${PYTHON_PN}-webcolors \
-    ${PYTHON_PN}-rfc3987 \
-    ${PYTHON_PN}-rfc3339-validator \
+    python3-idna \
+    python3-jsonpointer \
+    python3-webcolors \
+    python3-rfc3987 \
+    python3-rfc3339-validator \
 "
 PACKAGECONFIG[nongpl] = ",,,\
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-jsonpointer \
-    ${PYTHON_PN}-webcolors \
-    ${PYTHON_PN}-rfc3986-validator \
-    ${PYTHON_PN}-rfc3339-validator \
+    python3-idna \
+    python3-jsonpointer \
+    python3-webcolors \
+    python3-rfc3986-validator \
+    python3-rfc3339-validator \
 "
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-attrs \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-importlib-metadata \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-pyrsistent \
-    ${PYTHON_PN}-zipp \
+    python3-attrs \
+    python3-core \
+    python3-datetime \
+    python3-importlib-metadata \
+    python3-io \
+    python3-json \
+    python3-netclient \
+    python3-numbers \
+    python3-pprint \
+    python3-pyrsistent \
+    python3-zipp \
 "
 
 RDEPENDS:${PN}-tests = "${PN}"
diff --git a/meta/recipes-devtools/python/python3-libarchive-c_5.0.bb b/meta/recipes-devtools/python/python3-libarchive-c_5.0.bb
index 5ada76fbf4c..6ac86fc7a1a 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_5.0.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_5.0.bb
@@ -13,9 +13,9 @@ SRC_URI[sha256sum] = "d673f56673d87ec740d1a328fa205cafad1d60f5daca4685594deb039d
 
 RDEPENDS:${PN} += "\
   libarchive \
-  ${PYTHON_PN}-ctypes \
-  ${PYTHON_PN}-mmap \
-  ${PYTHON_PN}-logging \
+  python3-ctypes \
+  python3-mmap \
+  python3-logging \
 "
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/python/python3-license-expression_30.2.0.bb b/meta/recipes-devtools/python/python3-license-expression_30.2.0.bb
index 76ce58e58f8..7059cf76ee4 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.2.0.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.2.0.bb
@@ -8,14 +8,14 @@ SRC_URI[sha256sum] = "599928edd995c43fc335e0af342076144dc71cb858afa1ed9c1c30c4e8
 
 inherit pypi ptest python_setuptools_build_meta
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-booleanpy \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-logging \
+    python3-booleanpy \
+    python3-core \
+    python3-json \
+    python3-stringold \
+    python3-logging \
 "
 
 BBCLASSEXTEND = "native nativesdk"
@@ -25,8 +25,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-unittest-automake-output \
+	python3-pytest \
+	python3-unittest-automake-output \
 "
 
 do_install_ptest() {
diff --git a/meta/recipes-devtools/python/python3-lxml_5.0.0.bb b/meta/recipes-devtools/python/python3-lxml_5.0.0.bb
index e27405fd237..66cb8b09383 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.0.0.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.0.0.bb
@@ -38,6 +38,6 @@ BUILD_OPTIMIZATION:append:mipsel = " -O"
 
 BBCLASSEXTEND = "native nativesdk"
 
-RDEPENDS:${PN} += "libxml2 libxslt ${PYTHON_PN}-compression"
+RDEPENDS:${PN} += "libxml2 libxslt python3-compression"
 
 CLEANBROKEN = "1"
diff --git a/meta/recipes-devtools/python/python3-magic_0.4.27.bb b/meta/recipes-devtools/python/python3-magic_0.4.27.bb
index be58cdb71a4..2e561e69d71 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.27.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.27.bb
@@ -14,9 +14,9 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] = "c1ba14b08e4a5f5c31a302b7721239695b2f0f058d125bd5ce1ee36b9d9d3c3b"
 
 RDEPENDS:${PN} += "file \
-                   ${PYTHON_PN}-ctypes \
-                   ${PYTHON_PN}-io \
-                   ${PYTHON_PN}-logging \
-                   ${PYTHON_PN}-shell"
+                   python3-ctypes \
+                   python3-io \
+                   python3-logging \
+                   python3-shell"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/python/python3-mako_1.3.2.bb b/meta/recipes-devtools/python/python3-mako_1.3.2.bb
index c3391a60305..5b7df9192f8 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.2.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.2.bb
@@ -10,11 +10,11 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "2a0c8ad7f6274271b3bb7467dd37cf9cc6dab4bc19cb69a4ef10669402de698e"
 
-RDEPENDS:${PN} = "${PYTHON_PN}-html \
-                  ${PYTHON_PN}-markupsafe \
-                  ${PYTHON_PN}-netclient \
-                  ${PYTHON_PN}-pygments \
-                  ${PYTHON_PN}-threading \
+RDEPENDS:${PN} = "python3-html \
+                  python3-markupsafe \
+                  python3-netclient \
+                  python3-pygments \
+                  python3-threading \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-markdown_3.5.2.bb b/meta/recipes-devtools/python/python3-markdown_3.5.2.bb
index 6836c5638f2..1df7a981835 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.5.2.bb
@@ -10,4 +10,4 @@ SRC_URI[sha256sum] = "e1ac7b3dc550ee80e602e71c1d168002f062e49f1b11e26a36264dafd4
 
 BBCLASSEXTEND = "native nativesdk"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-logging ${PYTHON_PN}-setuptools"
+RDEPENDS:${PN} += "python3-logging python3-setuptools"
diff --git a/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb b/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb
index 170aa8a56a3..821332fe7cd 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "d283d37a890ba4c1ae73ffadf8046435c76e7bc2247bbb63c00bd1a709
 PYPI_PACKAGE = "MarkupSafe"
 inherit pypi python_setuptools_build_meta ptest
 
-RDEPENDS:${PN} += "${PYTHON_PN}-stringold"
+RDEPENDS:${PN} += "python3-stringold"
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -17,8 +17,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-unittest-automake-output \
+	python3-pytest \
+	python3-unittest-automake-output \
 "
 
 do_install_ptest() {
diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.2.0.bb b/meta/recipes-devtools/python/python3-more-itertools_10.2.0.bb
index fb28c35cbda..e1e1f5e18fc 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.2.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_10.2.0.bb
@@ -12,13 +12,13 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN} += " \
-        ${PYTHON_PN}-asyncio \
+        python3-asyncio \
         "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-statistics \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-unittest-automake-output \
+	python3-statistics \
+	python3-pytest \
+	python3-unittest-automake-output \
         "
 
 do_install_ptest() {
diff --git a/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb b/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
index 6a3d6d30ae9..68d8668a41f 100644
--- a/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
+++ b/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
@@ -11,15 +11,15 @@ inherit pypi setuptools3 update-alternatives
 PYPI_PACKAGE = "ndg_httpsclient"
 
 DEPENDS += " \
-    ${PYTHON_PN}-pyopenssl \
-    ${PYTHON_PN}-pyasn1 \
+    python3-pyopenssl \
+    python3-pyasn1 \
 "
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-pyopenssl \
-    ${PYTHON_PN}-pyasn1 \
+    python3-datetime \
+    python3-logging \
+    python3-pyopenssl \
+    python3-pyasn1 \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
index d11b03efc3d..ccd08147af6 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
@@ -33,31 +33,31 @@ do_compile:prepend() {
 FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a"
 
 # install what is needed for numpy.test()
-RDEPENDS:${PN} = "${PYTHON_PN}-unittest \
-                  ${PYTHON_PN}-difflib \
-                  ${PYTHON_PN}-pprint \
-                  ${PYTHON_PN}-pickle \
-                  ${PYTHON_PN}-shell \
-                  ${PYTHON_PN}-doctest \
-                  ${PYTHON_PN}-datetime \
-                  ${PYTHON_PN}-misc \
-                  ${PYTHON_PN}-mmap \
-                  ${PYTHON_PN}-netclient \
-                  ${PYTHON_PN}-numbers \
-                  ${PYTHON_PN}-pydoc \
-                  ${PYTHON_PN}-pkgutil \
-                  ${PYTHON_PN}-email \
-                  ${PYTHON_PN}-compression \
-                  ${PYTHON_PN}-ctypes \
-                  ${PYTHON_PN}-threading \
-                  ${PYTHON_PN}-multiprocessing \
-                  ${PYTHON_PN}-json \
+RDEPENDS:${PN} = "python3-unittest \
+                  python3-difflib \
+                  python3-pprint \
+                  python3-pickle \
+                  python3-shell \
+                  python3-doctest \
+                  python3-datetime \
+                  python3-misc \
+                  python3-mmap \
+                  python3-netclient \
+                  python3-numbers \
+                  python3-pydoc \
+                  python3-pkgutil \
+                  python3-email \
+                  python3-compression \
+                  python3-ctypes \
+                  python3-threading \
+                  python3-multiprocessing \
+                  python3-json \
 "
-RDEPENDS:${PN}-ptest += "${PYTHON_PN}-pytest \
-                         ${PYTHON_PN}-hypothesis \
-                         ${PYTHON_PN}-sortedcontainers \
-                         ${PYTHON_PN}-resource \
-                         ${PYTHON_PN}-typing-extensions \
+RDEPENDS:${PN}-ptest += "python3-pytest \
+                         python3-hypothesis \
+                         python3-sortedcontainers \
+                         python3-resource \
+                         python3-typing-extensions \
                          ldd \
 "
 
diff --git a/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb b/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb
index 92285d1d72f..d4de40893a6 100644
--- a/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb
+++ b/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb
@@ -7,6 +7,6 @@ SRC_URI[sha256sum] = "7a4329d67beff9a712e1d3ae147e4e3e108b0bfd284ffdea03a635126c
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-ctypes"
+RDEPENDS:${PN} += "python3-six python3-ctypes"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pluggy_1.4.0.bb b/meta/recipes-devtools/python/python3-pluggy_1.4.0.bb
index 6e4c0cd98cc..76acc4ae27e 100644
--- a/meta/recipes-devtools/python/python3-pluggy_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-pluggy_1.4.0.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
 
 SRC_URI[sha256sum] = "8c85c2876142a764e5b7548e7d9a0e0ddb46f5185161049a79b7e974454223be"
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-RDEPENDS:${PN} += "${PYTHON_PN}-importlib-metadata \
-                   ${PYTHON_PN}-more-itertools \
+DEPENDS += "python3-setuptools-scm-native"
+RDEPENDS:${PN} += "python3-importlib-metadata \
+                   python3-more-itertools \
 "
 
 inherit pypi ptest python_setuptools_build_meta
@@ -17,8 +17,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-unittest-automake-output \
+	python3-pytest \
+	python3-unittest-automake-output \
 "
 
 do_install_ptest() {
diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/recipes-devtools/python/python3-ply_3.11.bb
index 4a559e44f85..a05bd6702dc 100644
--- a/meta/recipes-devtools/python/python3-ply_3.11.bb
+++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
@@ -11,8 +11,8 @@ SRC_URI[sha256sum] = "00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446
 inherit pypi setuptools3
 
 RDEPENDS:${PN}:class-target += "\
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-shell \
+    python3-netclient \
+    python3-shell \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-psutil_5.9.8.bb b/meta/recipes-devtools/python/python3-psutil_5.9.8.bb
index f07f1131a69..1a394eda338 100644
--- a/meta/recipes-devtools/python/python3-psutil_5.9.8.bb
+++ b/meta/recipes-devtools/python/python3-psutil_5.9.8.bb
@@ -16,17 +16,17 @@ FILES:${PN}-tests += " \
 
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-xml \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-resource \
+    python3-shell \
+    python3-threading \
+    python3-xml \
+    python3-netclient \
+    python3-ctypes \
+    python3-resource \
 "
 
 RDEPENDS:${PN}-tests += " \
      ${PN} \
-     ${PYTHON_PN} \
+     python3 \
      coreutils \
      procps \
      binutils \
diff --git a/meta/recipes-devtools/python/python3-py_1.11.0.bb b/meta/recipes-devtools/python/python3-py_1.11.0.bb
index a2bd2d84fc1..31d5a377a7e 100644
--- a/meta/recipes-devtools/python/python3-py_1.11.0.bb
+++ b/meta/recipes-devtools/python/python3-py_1.11.0.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
 SRC_URI[sha256sum] = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719"
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 
 inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-netclient"
+RDEPENDS:${PN} += "python3-netclient"
diff --git a/meta/recipes-devtools/python/python3-pycparser_2.21.bb b/meta/recipes-devtools/python/python3-pycparser_2.21.bb
index 53b7367903e..00deceebf9f 100644
--- a/meta/recipes-devtools/python/python3-pycparser_2.21.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_2.21.bb
@@ -10,9 +10,9 @@ inherit pypi setuptools3
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN}:class-target += "\
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-ply \
-    ${PYTHON_PN}-pprint \
+    python3-netclient \
+    python3-ply \
+    python3-pprint \
     "
 
 RSUGGESTS:${PN}:class-target += "\
diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.30.bb b/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
index e976d6cae81..837edb71653 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
@@ -12,4 +12,4 @@ inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-debugger ${PYTHON_PN}-pprint"
+RDEPENDS:${PN} += "python3-debugger python3-pprint"
diff --git a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
index 47850220ea0..9ea30754821 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pyopenssl.org/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-DEPENDS += "openssl ${PYTHON_PN}-cryptography"
+DEPENDS += "openssl python3-cryptography"
 
 SRC_URI[sha256sum] = "6aa33039a93fffa4563e655b61d11364d01264be8ccb49906101e02a334530bf"
 
@@ -14,9 +14,9 @@ PACKAGES =+ "${PN}-tests"
 FILES:${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
 
 RDEPENDS:${PN}:class-target = " \
-    ${PYTHON_PN}-cryptography \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-threading \
+    python3-cryptography \
+    python3-six \
+    python3-threading \
 "
 RDEPENDS:${PN}-tests = "${PN}"
 
diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb b/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb
index 5f791cfb7e3..6f34091c869 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb
@@ -17,14 +17,14 @@ UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
 inherit pypi python_flit_core
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-debugger \
-    ${PYTHON_PN}-html \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-threading \
+    python3-datetime \
+    python3-debugger \
+    python3-html \
+    python3-json \
+    python3-netclient \
+    python3-pprint \
+    python3-stringold \
+    python3-threading \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb b/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb
index 9661f1474e5..7de70942a97 100644
--- a/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "4c48f78f62ab596c679086084d0dd13254ae4f3d6c72a83ffdf5ebdef8
 inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-numbers \
+    python3-numbers \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
index b77bf0fb8d8..7f2c217f192 100644
--- a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
+++ b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
@@ -10,11 +10,11 @@ PYPI_PACKAGE = "PySocks"
 inherit pypi setuptools3
 
 RDEPENDS:${PN}:class-target += "\
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-shell \
+    python3-email \
+    python3-io \
+    python3-logging \
+    python3-netclient \
+    python3-shell \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pytest-runner_6.0.1.bb b/meta/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
index deb9ab002ec..cce9ce33e22 100644
--- a/meta/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
@@ -8,9 +8,9 @@ SRC_URI[sha256sum] = "70d4739585a7008f37bf4933c013fdb327b8878a5a69fcbb3316c88882
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += " \
-    ${PYTHON_PN}-setuptools-scm-native"
+    python3-setuptools-scm-native"
 
-RDEPENDS:${PN} = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-debugger ${PYTHON_PN}-json \
-                  ${PYTHON_PN}-io"
+RDEPENDS:${PN} = "python3-py python3-setuptools python3-debugger python3-json \
+                  python3-io"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb
index ddba0318800..44fa1e2b80c 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb
@@ -11,10 +11,10 @@ SRC_URI[sha256sum] = "51865c88457545f51fb72011942f0a3c6901ee9e24cbfb6d1b9dc1348b
 
 inherit pypi python_setuptools_build_meta
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-pytest \
+    python3-pytest \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pytest_8.0.0.bb b/meta/recipes-devtools/python/python3-pytest_8.0.0.bb
index 994f6cbdaf5..f43796710a2 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.0.0.bb
@@ -12,22 +12,22 @@ DEPENDS += "python3-setuptools-scm-native"
 inherit update-alternatives pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-atomicwrites \
-    ${PYTHON_PN}-attrs \
-    ${PYTHON_PN}-debugger \
-    ${PYTHON_PN}-doctest \
-    ${PYTHON_PN}-importlib-metadata \
-    ${PYTHON_PN}-iniconfig \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-more-itertools \
-    ${PYTHON_PN}-packaging \
-    ${PYTHON_PN}-pathlib2 \
-    ${PYTHON_PN}-pluggy \
-    ${PYTHON_PN}-py \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-tomllib \
-    ${PYTHON_PN}-wcwidth \
+    python3-atomicwrites \
+    python3-attrs \
+    python3-debugger \
+    python3-doctest \
+    python3-importlib-metadata \
+    python3-iniconfig \
+    python3-json \
+    python3-more-itertools \
+    python3-packaging \
+    python3-pathlib2 \
+    python3-pluggy \
+    python3-py \
+    python3-setuptools \
+    python3-six \
+    python3-tomllib \
+    python3-wcwidth \
 "
 
 ALTERNATIVE:${PN} += "py.test pytest"
diff --git a/meta/recipes-devtools/python/python3-pytz_2023.4.bb b/meta/recipes-devtools/python/python3-pytz_2023.4.bb
index c2e8e3707a6..78d2b323dee 100644
--- a/meta/recipes-devtools/python/python3-pytz_2023.4.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2023.4.bb
@@ -8,12 +8,12 @@ inherit pypi setuptools3 ptest
 SRC_URI[sha256sum] = "31d4583c4ed539cd037956140d695e42c033a19e984bfce9964a3f7d59bc2b40"
 
 RDEPENDS:${PN}:class-target += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-doctest \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-threading \
+    python3-datetime \
+    python3-doctest \
+    python3-io \
+    python3-pickle \
+    python3-pprint \
+    python3-threading \
 "
 
 BBCLASSEXTEND = "native nativesdk"
@@ -23,8 +23,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-unittest-automake-output \
+	python3-pytest \
+	python3-unittest-automake-output \
 "
 
 do_install_ptest() {
diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
index 62be059df52..33883125570 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Python support for YAML"
-DEPENDS += "libyaml ${PYTHON_PN}-cython-native"
+DEPENDS += "libyaml python3-cython-native"
 HOMEPAGE = "https://pyyaml.org/"
 
 LICENSE = "MIT"
@@ -16,8 +16,8 @@ PACKAGECONFIG ?= "libyaml"
 PACKAGECONFIG[libyaml] = "--with-libyaml,--without-libyaml,libyaml"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-netclient \
+    python3-datetime \
+    python3-netclient \
 "
 
 inherit ptest
@@ -28,8 +28,8 @@ SRC_URI += "\
 SRC_URI[test.sha256sum] = "b6a8a2825d89fdc8aee226560f66b8196e872012a0ea7118cbef1a832359434a"
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-unittest-automake-output \
+	python3-pytest \
+	python3-unittest-automake-output \
 "
 
 do_install_ptest() {
diff --git a/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb b/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb
index 09515337c5a..4057c1dbbca 100644
--- a/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb
+++ b/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb
@@ -9,13 +9,13 @@ SRC_URI[sha256sum] = "9995eb8569428059b8c1affd26b25eac510d64f5043d9ce8c84e0d0036
 inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-isodate \
-    ${PYTHON_PN}-pyparsing \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-xml \
-    ${PYTHON_PN}-compression \
-    ${PYTHON_PN}-core \
+    python3-isodate \
+    python3-pyparsing \
+    python3-logging \
+    python3-numbers \
+    python3-xml \
+    python3-compression \
+    python3-core \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-requests_2.31.0.bb b/meta/recipes-devtools/python/python3-requests_2.31.0.bb
index 7ac43f2eb9e..df48cd54c3d 100644
--- a/meta/recipes-devtools/python/python3-requests_2.31.0.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.31.0.bb
@@ -8,17 +8,17 @@ SRC_URI[sha256sum] = "942c5a758f98d790eaed1a29cb6eefc7ffb0d1cf7af05c3d2791656dbd
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-ndg-httpsclient \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-pyasn1 \
-    ${PYTHON_PN}-pyopenssl \
-    ${PYTHON_PN}-pysocks \
-    ${PYTHON_PN}-urllib3 \
-    ${PYTHON_PN}-chardet \
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-compression \
+    python3-email \
+    python3-json \
+    python3-ndg-httpsclient \
+    python3-netserver \
+    python3-pyasn1 \
+    python3-pyopenssl \
+    python3-pysocks \
+    python3-urllib3 \
+    python3-chardet \
+    python3-idna \
+    python3-compression \
 "
 
 CVE_PRODUCT = "requests"
diff --git a/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb b/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
index 9bc5fed9219..e809c2280d0 100644
--- a/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
+++ b/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
@@ -13,9 +13,9 @@ UPSTREAM_CHECK_REGEX = "/rfc3339-validator/(?P<pver>(\d+[\.\-_]*)+)/"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-six \
+    python3-core \
+    python3-datetime \
+    python3-six \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
index 1760fec7ee4..02911ebde0e 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
@@ -11,9 +11,9 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] = "801046a9caacb1b43acc118969b49b96b65e8847f29029563b29ac61d02db61b"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-netclient \
+    python3-shell \
+    python3-datetime \
+    python3-netclient \
 "
 
 do_install:prepend() {
diff --git a/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb b/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
index 0a24ca9ebc9..27e3f534b88 100644
--- a/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
+++ b/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
@@ -10,7 +10,7 @@ PYPI_PACKAGE = "semantic_version"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-pkg-resources \
+    python3-pkg-resources \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb b/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb
index 5467b793ce0..64b5050c3b3 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb
@@ -15,17 +15,17 @@ UPSTREAM_CHECK_REGEX = "scm-(?P<pver>.*)\.tar"
 DEPENDS += "python3-tomli-native python3-packaging-native python3-typing-extensions-native"
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-packaging \
-    ${PYTHON_PN}-pip \
-    ${PYTHON_PN}-pyparsing \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-tomli \
-    ${PYTHON_PN}-typing-extensions \
+    python3-packaging \
+    python3-pip \
+    python3-pyparsing \
+    python3-setuptools \
+    python3-tomli \
+    python3-typing-extensions \
 "
 
 RDEPENDS:${PN}:append:class-target = " \
-    ${PYTHON_PN}-debugger \
-    ${PYTHON_PN}-json \
+    python3-debugger \
+    python3-json \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb b/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb
index ae8944f8b31..715c89338f7 100644
--- a/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb
@@ -13,27 +13,27 @@ SRC_URI += " \
 
 SRC_URI[sha256sum] = "be1af57fc409f93647f2e8e4573a142ed38724b8cdd389706a867bb4efcf1e78"
 
-DEPENDS += "${PYTHON_PN}"
+DEPENDS += "python3"
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-2to3 \
-    ${PYTHON_PN}-compile \
-    ${PYTHON_PN}-compression \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-html \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-pkg-resources \
-    ${PYTHON_PN}-pkgutil \
-    ${PYTHON_PN}-plistlib \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-unittest \
-    ${PYTHON_PN}-xml \
+    python3-2to3 \
+    python3-compile \
+    python3-compression \
+    python3-ctypes \
+    python3-email \
+    python3-html \
+    python3-json \
+    python3-netserver \
+    python3-numbers \
+    python3-pickle \
+    python3-pkg-resources \
+    python3-pkgutil \
+    python3-plistlib \
+    python3-shell \
+    python3-stringold \
+    python3-threading \
+    python3-unittest \
+    python3-xml \
 "
 
 BBCLASSEXTEND = "native nativesdk"
@@ -41,13 +41,13 @@ BBCLASSEXTEND = "native nativesdk"
 # The pkg-resources module can be used by itself, without the package downloader
 # and easy_install. Ship it in a separate package so that it can be used by
 # minimal distributions.
-PACKAGES =+ "${PYTHON_PN}-pkg-resources "
-FILES:${PYTHON_PN}-pkg-resources = "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
-RDEPENDS:${PYTHON_PN}-pkg-resources = "\
-    ${PYTHON_PN}-compression \
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-plistlib \
-    ${PYTHON_PN}-pprint \
+PACKAGES =+ "python3-pkg-resources "
+FILES:python3-pkg-resources = "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
+RDEPENDS:python3-pkg-resources = "\
+    python3-compression \
+    python3-email \
+    python3-plistlib \
+    python3-pprint \
 "
 
 # This used to use the bootstrap install which didn't compile. Until we bump the
diff --git a/meta/recipes-devtools/python/python3-smmap_6.0.0.bb b/meta/recipes-devtools/python/python3-smmap_6.0.0.bb
index 02c43e069bf..6abed1205fd 100644
--- a/meta/recipes-devtools/python/python3-smmap_6.0.0.bb
+++ b/meta/recipes-devtools/python/python3-smmap_6.0.0.bb
@@ -13,7 +13,7 @@ PYPI_PACKAGE = "smmap"
 
 SRC_URI[sha256sum] = "8d79028ea6cc131da5eab099a5d95a998d43c6779956fffe3b455040911076da"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-codecs \
-                   ${PYTHON_PN}-mmap \
+RDEPENDS:${PN} += "python3-codecs \
+                   python3-mmap \
 "
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-toml_0.10.2.bb b/meta/recipes-devtools/python/python3-toml_0.10.2.bb
index be29cac798c..649464b961b 100644
--- a/meta/recipes-devtools/python/python3-toml_0.10.2.bb
+++ b/meta/recipes-devtools/python/python3-toml_0.10.2.bb
@@ -11,5 +11,5 @@ inherit pypi setuptools3
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-misc \
+    python3-misc \
 "
diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb
index 9e7e61a37ef..6b923bb43fa 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb
@@ -14,8 +14,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-       ${PYTHON_PN}-pytest \
-       ${PYTHON_PN}-unittest-automake-output \
+       python3-pytest \
+       python3-unittest-automake-output \
 "
 
 do_install_ptest() {
diff --git a/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb b/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
index 826f126ad9f..8ba2788c9b4 100644
--- a/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
+++ b/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
@@ -10,5 +10,5 @@ SRC_URI[sha256sum] = "8be4668cda434163ce229d87ca273a11922cb1614cb359970b7dc96eed
 
 BBCLASSEXTEND = "native nativesdk"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-smartypants"
+RDEPENDS:${PN} += "python3-smartypants"
 
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.1.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.1.0.bb
index b5b37e29243..ad6dc6d4052 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.1.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.1.0.bb
@@ -8,15 +8,15 @@ SRC_URI[sha256sum] = "df7aa8afb0148fa78488e7899b2c59b5f4ffcfa82e6c54ccb9dd37c1d7
 inherit pypi python_hatchling
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-certifi \
-    ${PYTHON_PN}-cryptography \
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-pyopenssl \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-logging \
+    python3-certifi \
+    python3-cryptography \
+    python3-email \
+    python3-idna \
+    python3-json \
+    python3-netclient \
+    python3-pyopenssl \
+    python3-threading \
+    python3-logging \
 "
 
 CVE_PRODUCT = "urllib3"
diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb b/meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb
index ae845a39a70..6ce5e70c2a6 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb
@@ -13,8 +13,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-       ${PYTHON_PN}-pytest \
-       ${PYTHON_PN}-unittest-automake-output \
+       python3-pytest \
+       python3-unittest-automake-output \
 "
 
 do_install_ptest() {
diff --git a/meta/recipes-devtools/python/python3-webcolors_1.13.bb b/meta/recipes-devtools/python/python3-webcolors_1.13.bb
index 2a6be3f9cbb..cea2a971d33 100644
--- a/meta/recipes-devtools/python/python3-webcolors_1.13.bb
+++ b/meta/recipes-devtools/python/python3-webcolors_1.13.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "c225b674c83fa923be93d235330ce0300373d02885cef23238813b0d56
 inherit pypi python_setuptools_build_meta ptest
 
 RDEPENDS:${PN}:class-target = "\
-    ${PYTHON_PN}-stringold \
+    python3-stringold \
 "
 
 SRC_URI += " \
@@ -16,8 +16,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-unittest-automake-output \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
diff --git a/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb b/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
index 132aae89293..e8e275647c7 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
@@ -16,13 +16,13 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN} += " \
-	${PYTHON_PN}-core \
-	${PYTHON_PN}-xml \
-	${PYTHON_PN}-io \
+	python3-core \
+	python3-xml \
+	python3-io \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+	python3-pytest \
 "
 
 do_install_ptest() {
diff --git a/meta/recipes-devtools/python/python3-yamllint_1.33.0.bb b/meta/recipes-devtools/python/python3-yamllint_1.33.0.bb
index 7e51fc93959..155b65b0081 100644
--- a/meta/recipes-devtools/python/python3-yamllint_1.33.0.bb
+++ b/meta/recipes-devtools/python/python3-yamllint_1.33.0.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "yamllint"
 
 SRC_URI[sha256sum] = "2dceab9ef2d99518a2fcf4ffc964d44250ac4459be1ba3ca315118e4a1a81f7d"
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-RDEPENDS:${PN} += "${PYTHON_PN}-pathspec ${PYTHON_PN}-pyyaml"
+DEPENDS += "python3-setuptools-scm-native"
+RDEPENDS:${PN} += "python3-pathspec python3-pyyaml"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-zipp_3.17.0.bb b/meta/recipes-devtools/python/python3-zipp_3.17.0.bb
index 11f3b5cda0f..e9e220e3158 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.17.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.17.0.bb
@@ -5,14 +5,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
 SRC_URI[sha256sum] = "84e64a1c28cf7e91ed2078bb8cc8c259cb19b76942096c8d7b84947690cabaf0"
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 
 inherit pypi python_setuptools_build_meta
 
-DEPENDS += "${PYTHON_PN}-toml-native"
+DEPENDS += "python3-toml-native"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-compression \
-                   ${PYTHON_PN}-math \
-                   ${PYTHON_PN}-more-itertools"
+RDEPENDS:${PN} += "python3-compression \
+                   python3-math \
+                   python3-more-itertools"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.40.1


