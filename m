Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA6BC433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:48:46 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.3401.1647298125185189780
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DH7mGMS3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 v130-20020a1cac88000000b00389d0a5c511so405885wme.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nlQJ9QrtJtNbl8o68vtzo9O0LMgOrr/Unf6oFrq1rRM=;
        b=DH7mGMS3E4Cc8nps0Nu0gTmwjAHOBWpL82HwgrUGihUNHVJ3B+krvSkyxIVhxLuags
         lavBZxNu89oebpJJW6uTaWBPUrf9ZiD3BjngDKnRDO314MSbb3sHPYHnTsAwkJdkxQEK
         i2ANDH1ldqrKx08LBKx9V/71qNPnBV8xCY04s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nlQJ9QrtJtNbl8o68vtzo9O0LMgOrr/Unf6oFrq1rRM=;
        b=3c0DbRhd4JULfGFv5kRnEV2OT8BS/yr2IX7HuVWMFlyAfniVMEuc6ObYJO1bOUEMWf
         ApW+YBCm9nV9XBVHE+bohhU6nZMtUazyaJ+M8S5S8a4KMb7Q/KsSB9SFCX3MclOd2RK0
         seVwCdTVdRhyD6JQLObFMdoQDcsWznPEG1UT0bCVkzEynvqr3Va+iC6+B3IE50ovpnD5
         R+5oGoNhKd75t0pLVVk4z3pNmlndEtga0R7jum5l21YAm9+KcAQWAw634jaJ6HnB1+pv
         rYPGRL45y+nH6WJJpC5esrVk56BDa/68lRqXLEy3F3fE06EBxNPykBq2TN9hisdtQJXb
         Djdw==
X-Gm-Message-State: AOAM532b/+eTqwisDKgY+yMQ9PE2sWQJJTBGmFWbKzuJm3Qlu1Cj0JdM
	fvYuycTEMGRVspuODTu4EoVCdY4H99M085wE
X-Google-Smtp-Source: 
 ABdhPJwPZRNrh4i8nTGah4WGuDUR3nzJTY0cLeUhedlPijo0n53VRAr9IQqbG4/JOE66P0xMAPxRGg==
X-Received: by 2002:a1c:f605:0:b0:37b:b5de:89a0 with SMTP id
 w5-20020a1cf605000000b0037bb5de89a0mr1031551wmc.88.1647298123362;
        Mon, 14 Mar 2022 15:48:43 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 05/33] python3-cryptography: move from meta-python
Date: Mon, 14 Mar 2022 22:48:09 +0000
Message-Id: <20220314224837.834776-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:48:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163171

From: Tim Orling <tim.orling@konsulko.com>

* inherit new setuptools_rust class (which inherits new pyo3 class, which
  inherits cargo and python3-dir).
* RDEPENDS on python3-pytest-subtests for ptest
* Copy pyproject.toml for ptest as it defines the pytest.marker(s) needed
* Use 'cargo bitbake' to generate the crate:// SRC_URIs
   - Needed some hacks to the Cargo.toml in src/rust/ to make this work (probably
     only package.repository was strictly required):

     [package]
     description = "cryptography includes both high level recipes and low level interfaces to common cryptographic algorithms such as symmetric ciphers, message digests, and key derivation functions."
     homepage = "https://github.com/pyca/cryptography"
     repository = "https://github.com/pyca/cryptography"

* Add patches to src/rust/Cargo.toml to fix cargo errors including  pem version
* Add check-memfree.py to ptest to check for sufficient free memory

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../0001-Cargo.toml-specify-pem-version.patch |  31 +++++
 .../0002-Cargo.toml-edition-2018-2021.patch   |  28 ++++
 .../python3-cryptography/check-memfree.py     |  10 ++
 .../python/python3-cryptography/run-ptest     |   4 +
 .../python/python3-cryptography_36.0.1.bb     | 123 ++++++++++++++++++
 5 files changed, 196 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch
 create mode 100755 meta/recipes-devtools/python/python3-cryptography/check-memfree.py
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-cryptography_36.0.1.bb

diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch b/meta/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
new file mode 100644
index 00000000000..d7ab757bb51
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
@@ -0,0 +1,31 @@
+From ec8d3f3c61280c8140b34ed1479baef5e706f064 Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Fri, 14 Jan 2022 22:02:25 -0800
+Subject: [PATCH] Cargo.toml: specify pem version
+
+pem = "1.0" is not resolving, specify the current
+pem = { version: "1.0.2"}
+
+Upstream-Status: Pending
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ src/rust/Cargo.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/rust/Cargo.toml b/src/rust/Cargo.toml
+index 617167d0..174eaa80 100644
+--- a/src/rust/Cargo.toml
++++ b/src/rust/Cargo.toml
+@@ -9,7 +9,7 @@ publish = false
+ lazy_static = "1"
+ pyo3 = { version = "0.15.1" }
+ asn1 = { version = "0.8.7", default-features = false, features = ["derive"] }
+-pem = "1.0"
++pem = { version = "1.0.2" }
+ chrono = { version = "0.4", default-features = false, features = ["alloc", "clock"] }
+ ouroboros = "0.13"
+ 
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/python/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch b/meta/recipes-devtools/python/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch
new file mode 100644
index 00000000000..366e3a4d39a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch
@@ -0,0 +1,28 @@
+From 4b73298b214a5b69ea6edf3c2e21dd82b2b29708 Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Fri, 14 Jan 2022 22:34:59 -0800
+Subject: [PATCH 2/2] Cargo.toml: edition 2018 -> 2021
+
+Upstream-Status: Pending
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ src/rust/Cargo.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/rust/Cargo.toml b/src/rust/Cargo.toml
+index 174eaa80..7ad053d9 100644
+--- a/src/rust/Cargo.toml
++++ b/src/rust/Cargo.toml
+@@ -2,7 +2,7 @@
+ name = "cryptography-rust"
+ version = "0.1.0"
+ authors = ["The cryptography developers <cryptography-dev@python.org>"]
+-edition = "2018"
++edition = "2021"
+ publish = false
+ 
+ [dependencies]
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/python/python3-cryptography/check-memfree.py b/meta/recipes-devtools/python/python3-cryptography/check-memfree.py
new file mode 100755
index 00000000000..c111a9074c1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/check-memfree.py
@@ -0,0 +1,10 @@
+#!/usr/bin/env python3
+# https://stackoverflow.com/questions/22102999/get-total-physical-memory-in-python/28161352
+import sys
+meminfo = dict((i.split()[0].rstrip(':'),int(i.split()[1])) for i in open('/proc/meminfo').readlines())
+mem_free = meminfo['MemTotal']/1024./1024.
+if mem_free < 2.:
+    raise RuntimeError("Insufficient free memory({:.3f}): requires > 2 GB".format(mem_free))
+    sys.exit(1)
+else:
+    print("Free memory: {:.3f} GB".format(mem_free))
diff --git a/meta/recipes-devtools/python/python3-cryptography/run-ptest b/meta/recipes-devtools/python/python3-cryptography/run-ptest
new file mode 100644
index 00000000000..1e97dda63e7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+if ./check-memfree.py; then
+    pytest -vvvv tests/
+fi
diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
new file mode 100644
index 00000000000..00791dce2de
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
@@ -0,0 +1,123 @@
+SUMMARY = "Provides cryptographic recipes and primitives to python developers"
+HOMEPAGE = "https://cryptography.io/"
+SECTION = "devel/python"
+LICENSE = "( Apache-2.0 | BSD-3-Clause ) & PSF-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
+                    file://LICENSE.APACHE;md5=4e168cce331e5c827d4c2b68a6200e1b \
+                    file://LICENSE.BSD;md5=5ae30ba4123bc4f2fa49aa0b0dce887b \
+                    file://LICENSE.PSF;md5=43c37d21e1dbad10cddcd150ba2c0595 \
+                   "
+LDSHARED += "-pthread"
+
+SRC_URI[sha256sum] = "53e5c1dc3d7a953de055d77bef2ff607ceef7a2aac0353b5d630ab67f7423638"
+
+SRC_URI += " \
+    file://run-ptest \
+    file://check-memfree.py \
+    file://0001-Cargo.toml-specify-pem-version.patch \
+    file://0002-Cargo.toml-edition-2018-2021.patch \
+"
+
+inherit pypi setuptools3_rust
+
+PIP_INSTALL_DIST_PATH = "${S}/dist"
+
+DEPENDS += " \
+    ${PYTHON_PN}-asn1crypto-native \
+    ${PYTHON_PN}-cffi-native \
+    ${PYTHON_PN}-setuptools-rust-native \
+    ${PYTHON_PN}-six-native \
+"
+
+SRC_URI += " \
+    crate://crates.io/Inflector/0.11.4 \
+    crate://crates.io/aliasable/0.1.3 \
+    crate://crates.io/asn1/0.8.7 \
+    crate://crates.io/asn1_derive/0.8.7 \
+    crate://crates.io/autocfg/1.0.1 \
+    crate://crates.io/base64/0.13.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/chrono/0.4.19 \
+    crate://crates.io/indoc-impl/0.3.6 \
+    crate://crates.io/indoc/0.3.6 \
+    crate://crates.io/instant/0.1.12 \
+    crate://crates.io/lazy_static/1.4.0 \
+    crate://crates.io/libc/0.2.112 \
+    crate://crates.io/lock_api/0.4.5 \
+    crate://crates.io/num-integer/0.1.44 \
+    crate://crates.io/num-traits/0.2.14 \
+    crate://crates.io/once_cell/1.9.0 \
+    crate://crates.io/ouroboros/0.13.0 \
+    crate://crates.io/ouroboros_macro/0.13.0 \
+    crate://crates.io/parking_lot/0.11.2 \
+    crate://crates.io/parking_lot_core/0.8.5 \
+    crate://crates.io/paste-impl/0.1.18 \
+    crate://crates.io/paste/0.1.18 \
+    crate://crates.io/pem/1.0.2 \
+    crate://crates.io/proc-macro-error-attr/1.0.4 \
+    crate://crates.io/proc-macro-error/1.0.4 \
+    crate://crates.io/proc-macro-hack/0.5.19 \
+    crate://crates.io/proc-macro2/1.0.36 \
+    crate://crates.io/pyo3-build-config/0.15.1 \
+    crate://crates.io/pyo3-macros-backend/0.15.1 \
+    crate://crates.io/pyo3-macros/0.15.1 \
+    crate://crates.io/pyo3/0.15.1 \
+    crate://crates.io/quote/1.0.14 \
+    crate://crates.io/redox_syscall/0.2.10 \
+    crate://crates.io/scopeguard/1.1.0 \
+    crate://crates.io/smallvec/1.7.0 \
+    crate://crates.io/stable_deref_trait/1.2.0 \
+    crate://crates.io/syn/1.0.85 \
+    crate://crates.io/unicode-xid/0.2.2 \
+    crate://crates.io/unindent/0.1.7 \
+    crate://crates.io/version_check/0.9.4 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi/0.3.9 \
+"
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-asn1crypto \
+    ${PYTHON_PN}-cffi \
+    ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-six \
+"
+
+RDEPENDS:${PN}:append:class-target = " \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-threading \
+"
+
+RDEPENDS:${PN}-ptest += " \
+    ${PYTHON_PN}-bcrypt \
+    ${PYTHON_PN}-cryptography-vectors \
+    ${PYTHON_PN}-hypothesis \
+    ${PYTHON_PN}-iso8601 \
+    ${PYTHON_PN}-pretend \
+    ${PYTHON_PN}-psutil \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-pytest-subtests \
+    ${PYTHON_PN}-pytz \
+"
+
+inherit ptest
+
+do_install_ptest() {
+    install -D ${WORKDIR}/check-memfree.py ${D}${PTEST_PATH}/
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/tests/hazmat
+    cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/
+    cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/
+}
+
+FILES:${PN}-ptest += " \
+    ${PTEST_PATH}/check-memfree.py \
+"
+FILES:${PN}-dbg += " \
+    ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


