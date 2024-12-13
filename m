Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08055E77183
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 19:48:29 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.4047.1734119306653884196
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 11:48:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3eb7ca55c3bso1121165b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 11:48:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734119305; x=1734724105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+AEVkY6kwMF2XPegY9OPnHcrQeuo1+rmmJABCnnnbQ=;
        b=fD76jf4B8GwqkvQwQrFQgQP/EslVFRRQHdfYaRUa3MstcOhxXCDVp/3l1BLtpGajDe
         R87I2bf+f3NCuaTdJ07J5V9slgJYsGQcZPTAoc1KMjqZlzWN6BhinrY0xN+M1Jng89HM
         ftSmriMyTfvrvpNqi9jkrCzA5WlvmLnXCLiqk0I7LlAOpfk1Iu58TYWIAKtvmhZ4HKaN
         wxgdMKRxmT/u0vKCG2nl3mbhxQx0TsNb2iFzr4Hxk0ukLulj/aMWRhdM8w8HoUn/zUH+
         VLts2AmjVL2hyfA34iKM5oPMntpjYTd/xYztTRvjLg+fWZ2gTG2l8N09O3Ld+neJTfOl
         obOw==
X-Gm-Message-State: AOJu0YzmRoyToQXQKodQilFAcAYTS8kLEijrV9QTxGUtBZmszo73YtaP
	v4H/652GjI0kQIlibumaiNuArh058RdS8H/PIikUjocMX1nN0C/ATTbW5w==
X-Gm-Gg: ASbGncsImOD3y0XNEgeMMtiGHLhQdpfxDgqhbX1aP3W7dnbZzKdtVcM521xfGXrEwwK
	Ip2mMOewKNzsf83hI0HB4jo0bzwSpMjVVY9aOAZBZqkWWrPa2QcfZBYh0VGkPWvF6B0xVxJGlv5
	JGJpzedv+UojUGJydggd96WqGvYnYI6H+1jjNmCfUGIpx00Ns+Qf58sylnGoralLUYpkM24EYoK
	DSAeB+RRQh2VL3b0Q9k0gEU0e6b1VneJCJJr6ofKmyY+2UXqUqKkVEBfgtWLcGCPK6EZxtG2kYY
	NFpWtuaEeOCuHZ7AFlbADmrEug==
X-Google-Smtp-Source: AGHT+IEYWjwiffrQVNJnRTqYLzI4IACnliyZl1kI40z+x9fT2yAIvaS4N/1DuZzzUM/ShhVWyRsPrA==
X-Received: by 2002:a05:6808:1886:b0:3e7:b2b4:ee7a with SMTP id 5614622812f47-3eba691e5f0mr2151139b6e.26.1734119305208;
        Fri, 13 Dec 2024 11:48:25 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ebb493a875sm13895b6e.46.2024.12.13.11.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 11:48:23 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [OE-core][PATCHv3 2/2] python3-*: Update recipes to correctly check the upstream packages
Date: Fri, 13 Dec 2024 19:48:02 +0000
Message-Id: <20241213194802.2416431-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213194802.2416431-1-derek@asterius.io>
References: <20241213194802.2416431-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 19:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208693

With the upstream check migrated to the simple repo API, a number of the
recipes required updates to:
1. Remove outdated UPSTREAM_CHECK_REGEX checks
2. Add recipe specific UPSTREAM_CHECK_PYPI_PACKAGE definitions for
   packages that use '_', CamelCase, or other deviations from PEP625 in
   the source archive

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python3-booleanpy_4.0.bb          | 1 +
 meta/recipes-devtools/python/python3-click_8.1.7.bb            | 2 --
 meta/recipes-devtools/python/python3-cython_3.0.11.bb          | 2 --
 meta/recipes-devtools/python/python3-git_3.1.43.bb             | 1 +
 .../python/python3-hatch-fancy-pypi-readme_24.1.0.bb           | 3 +--
 meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb        | 3 +--
 meta/recipes-devtools/python/python3-jinja2_3.1.4.bb           | 1 -
 .../python/python3-jsonschema-specifications_2024.10.1.bb      | 1 +
 .../python/python3-license-expression_30.4.0.bb                | 1 +
 meta/recipes-devtools/python/python3-mako_1.3.6.bb             | 1 -
 meta/recipes-devtools/python/python3-markdown_3.7.bb           | 1 -
 meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb       | 1 -
 meta/recipes-devtools/python/python3-meson-python_0.17.1.bb    | 1 +
 meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb  | 3 +--
 meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb      | 1 +
 meta/recipes-devtools/python/python3-pygments_2.18.0.bb        | 1 -
 meta/recipes-devtools/python/python3-pyopenssl_24.2.1.bb       | 1 -
 meta/recipes-devtools/python/python3-pyparsing_3.2.0.bb        | 2 --
 meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb  | 1 +
 .../python/python3-pyproject-metadata_0.9.0.bb                 | 1 +
 meta/recipes-devtools/python/python3-pysocks_1.7.1.bb          | 2 ++
 meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb | 1 +
 meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb           | 2 --
 .../recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb | 2 +-
 meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb         | 1 +
 meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb     | 1 +
 meta/recipes-devtools/python/python3-scons_4.8.1.bb            | 1 -
 .../recipes-devtools/python/python3-semantic-version_2.10.0.bb | 3 ++-
 meta/recipes-devtools/python/python3-setuptools-rust_1.10.2.bb | 1 +
 meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb   | 3 +--
 meta/recipes-devtools/python/python3-smartypants_2.0.0.bb      | 2 --
 meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.2.bb | 2 +-
 meta/recipes-devtools/python/python3-sphinx_8.1.3.bb           | 1 -
 .../python/python3-sphinxcontrib-applehelp_2.0.0.bb            | 1 +
 .../python/python3-sphinxcontrib-devhelp_2.0.0.bb              | 1 +
 .../python/python3-sphinxcontrib-htmlhelp_2.1.0.bb             | 1 +
 .../python/python3-sphinxcontrib-qthelp_2.0.0.bb               | 1 +
 .../python/python3-sphinxcontrib-serializinghtml_2.0.0.bb      | 1 +
 .../python/python3-trove-classifiers_2024.10.21.16.bb          | 1 +
 .../python/python3-typing-extensions_4.12.2.bb                 | 3 +--
 40 files changed, 29 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-booleanpy_4.0.bb b/meta/recipes-devtools/python/python3-booleanpy_4.0.bb
index 41fd3d960a..4563cb8c4b 100644
--- a/meta/recipes-devtools/python/python3-booleanpy_4.0.bb
+++ b/meta/recipes-devtools/python/python3-booleanpy_4.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d118b5feceee598ebeca76e13395c2bd"
 SRC_URI[sha256sum] = "17b9a181630e43dde1851d42bef546d616d5d9b4480357514597e78b203d06e4"
 
 PYPI_PACKAGE = "boolean.py"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta/recipes-devtools/python/python3-click_8.1.7.bb b/meta/recipes-devtools/python/python3-click_8.1.7.bb
index 7d91e1af83..baff4cbd45 100644
--- a/meta/recipes-devtools/python/python3-click_8.1.7.bb
+++ b/meta/recipes-devtools/python/python3-click_8.1.7.bb
@@ -27,8 +27,6 @@ do_install_ptest() {
     cp -rf ${S}/docs ${D}${PTEST_PATH}/
 }
 
-UPSTREAM_CHECK_REGEX = "click/(?P<pver>\d+(\.\d+)+)/"
-
 CLEANBROKEN = "1"
 
 RDEPENDS:${PN} += "\
diff --git a/meta/recipes-devtools/python/python3-cython_3.0.11.bb b/meta/recipes-devtools/python/python3-cython_3.0.11.bb
index 2501e6ed23..c1d45eaff5 100644
--- a/meta/recipes-devtools/python/python3-cython_3.0.11.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.0.11.bb
@@ -15,8 +15,6 @@ inherit pypi setuptools3 cython
 # No need to depend on self
 DEPENDS:remove = "python3-cython-native"
 
-UPSTREAM_CHECK_PYPI_PACKAGE = "Cython"
-
 do_install:append() {
     # rename scripts that would conflict with the Python 2 build of Cython
     mv ${D}${bindir}/cython ${D}${bindir}/cython3
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 45c988117b..2126b5e92b 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -9,6 +9,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5279a7ab369ba336989dcf2a107e5c8e"
 
 PYPI_PACKAGE = "GitPython"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
diff --git a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_24.1.0.bb b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_24.1.0.bb
index 1e5c67f832..b32527f949 100644
--- a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_24.1.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_24.1.0.bb
@@ -6,9 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ba5633c60bd3e243091013aa83b4d807"
 inherit pypi python_hatchling
 
 PYPI_PACKAGE = "hatch_fancy_pypi_readme"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "44dd239f1a779b9dcf8ebc9401a611fd7f7e3e14578dcf22c265dfaf7c1514b8"
 
 BBCLASSEXTEND = "native nativesdk"
-
-UPSTREAM_CHECK_REGEX = "/hatch-fancy-pypi-readme/(?P<pver>(\d+[\.\-_]*)+)/"
diff --git a/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb b/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb
index 2e49aba469..ac70295f45 100644
--- a/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb
@@ -6,9 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26501cfd0bbddf830ee820e95551fa3d"
 inherit pypi python_hatchling
 
 PYPI_PACKAGE = "hatch_vcs"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "093810748fe01db0d451fabcf2c1ac2688caefd232d4ede967090b1c1b07d9f7"
 
 BBCLASSEXTEND = "native nativesdk"
-
-UPSTREAM_CHECK_REGEX = "/hatch-vcs/(?P<pver>(\d+[\.\-_]*)+)/"
diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
index a11878496c..fd0afc1cb1 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
@@ -13,7 +13,6 @@ CVE_PRODUCT = "jinja2 jinja"
 CLEANBROKEN = "1"
 
 inherit pypi python_flit_core ptest
-UPSTREAM_CHECK_PYPI_PACKAGE = "Jinja2"
 
 SRC_URI += " \
 	file://run-ptest \
diff --git a/meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb b/meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb
index 6ef83e0554..c45e5c25c7 100644
--- a/meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb
@@ -10,6 +10,7 @@ SRC_URI[sha256sum] = "0f38b83639958ce1152d02a7f062902c41c8fd20d558b0c34344292d41
 inherit pypi python_hatchling
 
 PYPI_PACKAGE = "jsonschema_specifications"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 DEPENDS += "python3-hatch-vcs-native"
 
diff --git a/meta/recipes-devtools/python/python3-license-expression_30.4.0.bb b/meta/recipes-devtools/python/python3-license-expression_30.4.0.bb
index 7a035206da..fc92026c79 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.4.0.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.4.0.bb
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "6464397f8ed4353cc778999caec43b099f8d8d5b335f282e26a9eb9435
 
 inherit pypi ptest python_setuptools_build_meta
 PYPI_PACKAGE = "license_expression"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 DEPENDS += "python3-setuptools-scm-native"
 
diff --git a/meta/recipes-devtools/python/python3-mako_1.3.6.bb b/meta/recipes-devtools/python/python3-mako_1.3.6.bb
index 6d334991ff..27e2082dc0 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.6.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.6.bb
@@ -5,7 +5,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d0995d6f7ba3f186a03118f244e88f57"
 
 PYPI_PACKAGE = "mako"
-UPSTREAM_CHECK_PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta ptest
 
diff --git a/meta/recipes-devtools/python/python3-markdown_3.7.bb b/meta/recipes-devtools/python/python3-markdown_3.7.bb
index 619779d769..6a2ab36494 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.7.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.7.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-UPSTREAM_CHECK_PYPI_PACKAGE = "Markdown"
 SRC_URI[sha256sum] = "2ae2471477cfd02dbbf038d5d9bc226d40def84b4fe2986e49b59b6b472bbed2"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb b/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb
index 7e48bc36c7..e5feb8fe5f 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 SRC_URI[sha256sum] = "ee55d3edf80167e48ea11a923c7386f4669df67d7994554387f84e7d8b0a2bf0"
 
 PYPI_PACKAGE = "markupsafe"
-UPSTREAM_CHECK_PYPI_PACKAGE = "MarkupSafe"
 inherit pypi python_setuptools_build_meta ptest
 
 RDEPENDS:${PN} += "python3-html python3-stringold"
diff --git a/meta/recipes-devtools/python/python3-meson-python_0.17.1.bb b/meta/recipes-devtools/python/python3-meson-python_0.17.1.bb
index 04f0a1eff8..4dc7177557 100644
--- a/meta/recipes-devtools/python/python3-meson-python_0.17.1.bb
+++ b/meta/recipes-devtools/python/python3-meson-python_0.17.1.bb
@@ -11,6 +11,7 @@ DEPENDS = " \
 "
 
 PYPI_PACKAGE = "meson_python"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_mesonpy
 SRC_URI[sha256sum] = "efb91f69f2e19eef7bc9a471ed2a4e730088cc6b39eacaf3e49fc4f930eb5f83"
diff --git a/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb b/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
index 68d8668a41..60909c0376 100644
--- a/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
+++ b/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
@@ -9,6 +9,7 @@ SRC_URI[sha256sum] = "d72faed0376ab039736c2ba12e30695e2788c4aa569c9c3e3d72131de2
 inherit pypi setuptools3 update-alternatives
 
 PYPI_PACKAGE = "ndg_httpsclient"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 DEPENDS += " \
     python3-pyopenssl \
@@ -24,8 +25,6 @@ RDEPENDS:${PN} += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-UPSTREAM_CHECK_REGEX = ""
-
 ALTERNATIVE:${PN} = "ndg_httpclient"
 ALTERNATIVE_LINK_NAME[ndg_httpclient] = "${bindir}/ndg_httpclient"
 ALTERNATIVE_PRIORITY = "30"
diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb b/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
index ea4164d06a..25c2aeb1e7 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
@@ -20,6 +20,7 @@ SRC_URI[sha256sum] = "7a2d49214bf58b4f17f99d6891d947a9836c9899a67a5069f52d7b6721
 inherit python_poetry_core pypi
 
 PYPI_PACKAGE = "poetry_core"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN}:append:class-target = "\
     python3-compression \
diff --git a/meta/recipes-devtools/python/python3-pygments_2.18.0.bb b/meta/recipes-devtools/python/python3-pygments_2.18.0.bb
index fd37365681..459490f824 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.18.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.18.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 inherit python_hatchling
 SRC_URI[sha256sum] = "786ff802f32e91311bff3889f6e9a86e81505fe99f2735bb6d60ae0c5004f199"
 
-UPSTREAM_CHECK_PYPI_PACKAGE = "Pygments"
 inherit pypi
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pyopenssl_24.2.1.bb b/meta/recipes-devtools/python/python3-pyopenssl_24.2.1.bb
index d9ccd553a1..74c23fb614 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_24.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_24.2.1.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 DEPENDS += "openssl python3-cryptography"
 
 SRC_URI[sha256sum] = "4247f0dbe3748d560dcbb2ff3ea01af0f9a1a001ef5f7c4c647956ed8cbf0e95"
-UPSTREAM_CHECK_PYPI_PACKAGE = "pyOpenSSL"
 
 inherit pypi setuptools3
 
diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.2.0.bb b/meta/recipes-devtools/python/python3-pyparsing_3.2.0.bb
index de28d71fab..f1be9debbc 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.2.0.bb
@@ -12,8 +12,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
 SRC_URI[sha256sum] = "cbf74e27246d595d9a74b186b810f6fbb86726dbf3b9532efb343f6d7294fe9c"
 
-UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
-
 inherit pypi python_flit_core
 
 RDEPENDS:${PN} += " \
diff --git a/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb b/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb
index cdb9fc78c9..c68760e293 100644
--- a/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "1e859bd5c40fae9448642dd871adf459e5e2084186e8d2c2a79a824c97
 inherit pypi python_flit_core
 
 PYPI_PACKAGE = "pyproject_hooks"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.0.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.0.bb
index 946fd415fa..a73d4277b1 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.0.bb
@@ -13,6 +13,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
 PYPI_PACKAGE = "pyproject_metadata"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
diff --git a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
index 7f2c217f19..db69901444 100644
--- a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
+++ b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
@@ -7,6 +7,8 @@ SRC_URI[md5sum] = "89b1a6865c61bae67a32417517612ee6"
 SRC_URI[sha256sum] = "3f8804571ebe159c380ac6de37643bb4685970655d3bba243530d6558b799aa0"
 
 PYPI_PACKAGE = "PySocks"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN}:class-target += "\
diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb
index f89b40c8e1..743442ea30 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 SRC_URI[sha256sum] = "989e38f0f1c01bc7c6b2e04db7d9fd859db35d77c2c1a430c831a70cbf3fde2d"
 
 PYPI_PACKAGE = "pytest_subtests"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb
index 9f9320a594..6ea342eae3 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb
@@ -12,8 +12,6 @@ SRC_URI += "\
 "
 SRC_URI[test.sha256sum] = "b6a8a2825d89fdc8aee226560f66b8196e872012a0ea7118cbef1a832359434a"
 
-UPSTREAM_CHECK_PYPI_PACKAGE = "PyYAML"
-
 inherit pypi python_setuptools_build_meta ptest cython
 
 PACKAGECONFIG ?= "libyaml"
diff --git a/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb b/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
index e809c2280d..1e60c763d8 100644
--- a/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
+++ b/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
@@ -8,7 +8,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/python-rfc3339-validator:"
 SRC_URI[sha256sum] = "138a2abdf93304ad60530167e51d2dfb9549521a836871b88d7f4695d0022f6b"
 
 PYPI_PACKAGE = "rfc3339_validator"
-UPSTREAM_CHECK_REGEX = "/rfc3339-validator/(?P<pver>(\d+[\.\-_]*)+)/"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb b/meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb
index e97459a444..81a8cb79a4 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb
@@ -13,6 +13,7 @@ require ${BPN}-crates.inc
 inherit pypi cargo-update-recipe-crates python_maturin ptest
 
 PYPI_PACKAGE = "rpds_py"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN}-ptest += " \
     python3-iniconfig \
diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb
index 5df1f102d9..8cdcee9ec2 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb
@@ -5,6 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=30cbbccd94bf3a2b0285ec35671a1938"
 
 PYPI_PACKAGE = "ruamel.yaml"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
diff --git a/meta/recipes-devtools/python/python3-scons_4.8.1.bb b/meta/recipes-devtools/python/python3-scons_4.8.1.bb
index 4564aa368f..8f5e268af8 100644
--- a/meta/recipes-devtools/python/python3-scons_4.8.1.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.8.1.bb
@@ -5,7 +5,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
 SRC_URI[sha256sum] = "5b641357904d2f56f7bfdbb37e165ab996b6143c948b9df0efc7305f54949daa"
-UPSTREAM_CHECK_PYPI_PACKAGE = "SCons"
 
 inherit pypi python_setuptools_build_meta
 
diff --git a/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb b/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
index 27e3f534b8..78763a911e 100644
--- a/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
+++ b/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4fb31e3c1c7eeb8b5e8c07657cdd54e2"
 SRC_URI[sha256sum] = "bdabb6d336998cbb378d4b9db3a4b56a1e3235701dc05ea2690d9a997ed5041c"
 
 PYPI_PACKAGE = "semantic_version"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
@@ -15,4 +17,3 @@ RDEPENDS:${PN} += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-UPSTREAM_CHECK_REGEX = "/semantic-version/(?P<pver>(\d+[\.\-_]*)+)/"
diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.10.2.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.10.2.bb
index a58d57ac70..df39d61d86 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.10.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.10.2.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 SRC_URI[sha256sum] = "5d73e7eee5f87a6417285b617c97088a7c20d1a70fcea60e3bdc94ff567c29dc"
 
 PYPI_PACKAGE = "setuptools_rust"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit cargo pypi python_setuptools_build_meta
 
diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb b/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb
index d8b9f8f262..4bcc8e438a 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb
@@ -9,11 +9,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 SRC_URI[sha256sum] = "42dea1b65771cba93b7a515d65a65d8246e560768a66b9106a592c8e7f26c8a7"
 
 PYPI_PACKAGE = "setuptools_scm"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-UPSTREAM_CHECK_REGEX = "scm-(?P<pver>.*)\.tar"
-
 DEPENDS += "python3-packaging-native python3-typing-extensions-native"
 
 RDEPENDS:${PN} = "\
diff --git a/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb b/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
index d089a89b95..9bb07eab52 100644
--- a/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
@@ -10,5 +10,3 @@ SRC_URI += "file://0001-Change-hash-bang-to-python3.patch"
 SRC_URI[sha256sum] = "7812353a32022699a1aa8cd5626e01c94a946dcaeedaee2d0b382bae4c4cbf36"
 
 BBCLASSEXTEND = "native nativesdk"
-
-UPSTREAM_CHECK_REGEX = "/${PYPI_PACKAGE}/(?P<pver>(?!2\.0\.1)(\d+[\.\-_]*)+)/"
diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.2.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.2.bb
index b2c6b892bb..03e7a50125 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.2.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.2.bb
@@ -13,9 +13,9 @@ RDEPENDS:${PN} += " \
 "
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "b7457bc25dda723b20b086a670b9953c859eab60a2a03ee8eb2bb23e176e5f85"
-UPSTREAM_CHECK_REGEX ?= "/sphinx-rtd-theme/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit setuptools3 pypi
 
diff --git a/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb b/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb
index da4e23a187..38cceb068a 100644
--- a/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=4ab44940eeb9c0ec044da326d904a683"
 SRC_URI[sha256sum] = "43c1911eecb0d3e161ad78611bc905d1ad0e523e4ddc202a58a821773dc4c927"
 
 inherit python_flit_core pypi
-UPSTREAM_CHECK_REGEX = "/Sphinx/(?P<pver>(\d+[\.\-_]*)+)/"
 
 do_install:append () {
 	# The cache format of "{None, 'en', 'ja'}" doesn't seem to be consistent (dict ordering?)
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb
index 686a4a17ae..a63b7ad014 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=c7715857042d4c8c0105999ca0c072c5"
 SRC_URI[sha256sum] = "2f29ef331735ce958efa4734873f084941970894c6090408b079c61b2e1c06d1"
 
 PYPI_PACKAGE = "sphinxcontrib_applehelp"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_flit_core
 
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb
index 9f53973708..abce915a19 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=fd30d9972a142c857a80c9f312e92b93"
 SRC_URI[sha256sum] = "411f5d96d445d1d73bb5d52133377b4248ec79db5c793ce7dbe59e074b4dd1ad"
 
 PYPI_PACKAGE = "sphinxcontrib_devhelp"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_flit_core
 
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb
index 1a15ccd0c4..44885d7dc3 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=24dce5ef6a13563241c24bc366f48886"
 SRC_URI[sha256sum] = "c9e2916ace8aad64cc13a0d233ee22317f2b9025b9cf3295249fa985cc7082e9"
 
 PYPI_PACKAGE = "sphinxcontrib_htmlhelp"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_flit_core
 
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb
index f51a0ba64b..141d1c4862 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=f7a83b72ea86d04827575ec0b63430eb"
 SRC_URI[sha256sum] = "4fe7d0ac8fc171045be623aba3e2a8f613f8682731f9153bb2e40ece16b9bbab"
 
 PYPI_PACKAGE = "sphinxcontrib_qthelp"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_flit_core
 
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb
index 63c55d36ae..95ee596b3b 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=32a84ac5cd3bbd10c4d479233ad588b6"
 SRC_URI[sha256sum] = "e9d912827f872c029017a53f0ef2180b327c3f7fd23c87229f7a8e8b70031d4d"
 
 PYPI_PACKAGE = "sphinxcontrib_serializinghtml"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_flit_core
 
diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb
index 9d841ffb52..8640ee156b 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 SRC_URI[sha256sum] = "17cbd055d67d5e9d9de63293a8732943fabc21574e4c7b74edf112b4928cf5f3"
 
 PYPI_PACKAGE = "trove_classifiers"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta ptest
 
diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb
index 8f0755473e..7bd23e3470 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb
@@ -14,11 +14,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "1a7ead55c7e559dd4dee8856e3a88b41225abfe1ce8df57b7c13915fe121ffb8"
 
 inherit pypi python_flit_core
 
-UPSTREAM_CHECK_REGEX = "/typing-extensions/(?P<pver>(\d+[\.\-_]*)+)/"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


