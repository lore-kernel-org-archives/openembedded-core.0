Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADFAC4332F
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:05:53 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.7344.1651727150812705581
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f65kH8u/;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id dk23so6549474ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=toyNDEdZ2cLOioJI1YkQgWGzkGKM9xUSrFY9pEYGAo0=;
        b=f65kH8u/XZj0sD3Az0yUVRLXJGfYhTzmBC2nzsuZzN+6+URdmieL/DZ/d0jYuFRbAS
         km9jDDx6yAz1DBDNZ3iZHst+BaVUmmETSVHFbpQrLZvfMdnEf5vV6HqctbC8NPK3Bswn
         tmj1UQnn9MADOBt/hXYc/w/o8oEq7ypkzi/SdRKQKWogU5K/01W/znNRznkGI4K8+2LA
         KSh2oCHIylIm0wEBhCJ/BGyxSJ1cC7bOJ3tIvJqaWkAQS18dBwO7G/VX+tcWfXDHidUI
         2ZUrns7mVl2AfeVBZA+yli2QSH7L+vlvCFa23QtBCDm9GcwNVNlXLNVq0ucPSy3wsoUW
         pNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=toyNDEdZ2cLOioJI1YkQgWGzkGKM9xUSrFY9pEYGAo0=;
        b=Vc50Lgxsfe82RVIoa2oFPru4n6en7ZD/Vnfj9q+rbcKRphn2fwCezapyFBht8ghQsW
         36/j+whqVgjVDDtsZgnMJjN9Izk+PFv2XcegKsrqVnSUP7NQwV061RyxLT3djiUhiIvi
         smZeuyLkKcwYZhnPW0jVk76ILaKeeiAj7PF4NndZRaI6XnxvcUBFRiAEIj7CN9syRrSI
         L4xGqiXSvfyOHcX2oalNdFJ/Y5mrsJKAoySAOB3fVT/YBvvH3kidfikMEY5l6e9JIF1s
         6a4Je3hBVjlKYeczfRL0PHnueDhX5CyqDPo/BuGnyyqxoK2yorTH659/T4KMEsXkqfyL
         +DyQ==
X-Gm-Message-State: AOAM532bfQwsmZzOnjF+JA22kjGiQPQ4x5u8Xz+ENRrVFR7KE9ZUwiq3
	TaiOc6gO0i31BkGfejAzGUTX0QaIlbc=
X-Google-Smtp-Source: 
 ABdhPJx8kFZ0sseKSmB5r6PgaOTgmTENyFp1UT/IlVJGcksJvQYZAfJxBGcFftxsO5JQ/jL+imVYCA==
X-Received: by 2002:a17:906:9744:b0:6da:9e49:9fe3 with SMTP id
 o4-20020a170906974400b006da9e499fe3mr24323628ejy.319.1651727149367;
        Wed, 04 May 2022 22:05:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:05:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/61] python3-cryptography: upgrade 36.0.2 -> 37.0.1
Date: Thu,  5 May 2022 07:04:46 +0200
Message-Id: <20220505050544.651895-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:05:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165231

Drop backported fix-leak-metric.patch.

Adjust versions of crate components.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Cargo.toml-specify-pem-version.patch |  12 +-
 .../fix-leak-metric.patch                     |  36 -----
 .../python/python3-cryptography_36.0.2.bb     | 123 ------------------
 .../python/python3-cryptography_37.0.1.bb     | 118 +++++++++++++++++
 4 files changed, 123 insertions(+), 166 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-cryptography/fix-leak-metric.patch
 delete mode 100644 meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-cryptography_37.0.1.bb

diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch b/meta/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
index d7ab757bb5..7266fd7bef 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
@@ -1,4 +1,4 @@
-From ec8d3f3c61280c8140b34ed1479baef5e706f064 Mon Sep 17 00:00:00 2001
+From d41203b9b79f5edc2d33b0d62921822294dfaa6b Mon Sep 17 00:00:00 2001
 From: Tim Orling <tim.orling@konsulko.com>
 Date: Fri, 14 Jan 2022 22:02:25 -0800
 Subject: [PATCH] Cargo.toml: specify pem version
@@ -9,23 +9,21 @@ pem = { version: "1.0.2"}
 Upstream-Status: Pending
 
 Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+
 ---
  src/rust/Cargo.toml | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/rust/Cargo.toml b/src/rust/Cargo.toml
-index 617167d0..174eaa80 100644
+index d17245d..f8f6416 100644
 --- a/src/rust/Cargo.toml
 +++ b/src/rust/Cargo.toml
 @@ -9,7 +9,7 @@ publish = false
  lazy_static = "1"
- pyo3 = { version = "0.15.1" }
+ pyo3 = { version = "0.15.2" }
  asn1 = { version = "0.8.7", default-features = false, features = ["derive"] }
 -pem = "1.0"
 +pem = { version = "1.0.2" }
  chrono = { version = "0.4", default-features = false, features = ["alloc", "clock"] }
- ouroboros = "0.13"
+ ouroboros = "0.15"
  
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/python/python3-cryptography/fix-leak-metric.patch b/meta/recipes-devtools/python/python3-cryptography/fix-leak-metric.patch
deleted file mode 100644
index 904984f43d..0000000000
--- a/meta/recipes-devtools/python/python3-cryptography/fix-leak-metric.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Trigger hashlib initialisation so that the test_create_certificate_with_extensions
-test doesn't fail.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From dc989d563ab6a078651160e5e6d4ee3df8cb08d7 Mon Sep 17 00:00:00 2001
-From: Alex Gaynor <alex.gaynor@gmail.com>
-Date: Thu, 7 Apr 2022 03:15:09 -0400
-Subject: [PATCH] Added Ubuntu Jammy to CI (#7047)
-
-* Added Ubuntu Jammy to CI
-
-* try thing
----
- .github/workflows/ci.yml                      | 1 +
- docs/installation.rst                         | 2 +-
- tests/hazmat/backends/test_openssl_memleak.py | 3 +++
- 3 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/tests/hazmat/backends/test_openssl_memleak.py b/tests/hazmat/backends/test_openssl_memleak.py
-index 835c9256a6..2605566bd5 100644
---- a/tests/hazmat/backends/test_openssl_memleak.py
-+++ b/tests/hazmat/backends/test_openssl_memleak.py
-@@ -82,8 +82,11 @@ def free(ptr, path, line):
-     assert result == 1
- 
-     # Trigger a bunch of initialization stuff.
-+    import hashlib
-     from cryptography.hazmat.backends.openssl.backend import backend
- 
-+    hashlib.sha256()
-+
-     start_heap = set(heap)
- 
-     try:
diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
deleted file mode 100644
index 9ef5ff39c8..0000000000
--- a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
+++ /dev/null
@@ -1,123 +0,0 @@
-SUMMARY = "Provides cryptographic recipes and primitives to python developers"
-HOMEPAGE = "https://cryptography.io/"
-SECTION = "devel/python"
-LICENSE = "( Apache-2.0 | BSD-3-Clause ) & PSF-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
-                    file://LICENSE.APACHE;md5=4e168cce331e5c827d4c2b68a6200e1b \
-                    file://LICENSE.BSD;md5=5ae30ba4123bc4f2fa49aa0b0dce887b \
-                    file://LICENSE.PSF;md5=43c37d21e1dbad10cddcd150ba2c0595 \
-                   "
-LDSHARED += "-pthread"
-
-SRC_URI[sha256sum] = "70f8f4f7bb2ac9f340655cbac89d68c527af5bb4387522a8413e841e3e6628c9"
-
-SRC_URI += " \
-    file://run-ptest \
-    file://check-memfree.py \
-    file://0001-Cargo.toml-specify-pem-version.patch \
-    file://0002-Cargo.toml-edition-2018-2021.patch \
-    file://fix-leak-metric.patch \
-"
-
-inherit pypi python_setuptools3_rust
-
-DEPENDS += " \
-    ${PYTHON_PN}-asn1crypto-native \
-    ${PYTHON_PN}-cffi-native \
-    ${PYTHON_PN}-setuptools-rust-native \
-    ${PYTHON_PN}-six-native \
-"
-
-SRC_URI += " \
-    crate://crates.io/Inflector/0.11.4 \
-    crate://crates.io/aliasable/0.1.3 \
-    crate://crates.io/asn1/0.8.7 \
-    crate://crates.io/asn1_derive/0.8.7 \
-    crate://crates.io/autocfg/1.0.1 \
-    crate://crates.io/base64/0.13.0 \
-    crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/chrono/0.4.19 \
-    crate://crates.io/indoc-impl/0.3.6 \
-    crate://crates.io/indoc/0.3.6 \
-    crate://crates.io/instant/0.1.12 \
-    crate://crates.io/lazy_static/1.4.0 \
-    crate://crates.io/libc/0.2.120 \
-    crate://crates.io/lock_api/0.4.5 \
-    crate://crates.io/num-integer/0.1.44 \
-    crate://crates.io/num-traits/0.2.14 \
-    crate://crates.io/once_cell/1.9.0 \
-    crate://crates.io/ouroboros/0.13.0 \
-    crate://crates.io/ouroboros_macro/0.13.0 \
-    crate://crates.io/parking_lot/0.11.2 \
-    crate://crates.io/parking_lot_core/0.8.5 \
-    crate://crates.io/paste-impl/0.1.18 \
-    crate://crates.io/paste/0.1.18 \
-    crate://crates.io/pem/1.0.2 \
-    crate://crates.io/proc-macro-error-attr/1.0.4 \
-    crate://crates.io/proc-macro-error/1.0.4 \
-    crate://crates.io/proc-macro-hack/0.5.19 \
-    crate://crates.io/proc-macro2/1.0.36 \
-    crate://crates.io/pyo3-build-config/0.15.1 \
-    crate://crates.io/pyo3-macros-backend/0.15.1 \
-    crate://crates.io/pyo3-macros/0.15.1 \
-    crate://crates.io/pyo3/0.15.1 \
-    crate://crates.io/quote/1.0.14 \
-    crate://crates.io/redox_syscall/0.2.10 \
-    crate://crates.io/scopeguard/1.1.0 \
-    crate://crates.io/smallvec/1.7.0 \
-    crate://crates.io/stable_deref_trait/1.2.0 \
-    crate://crates.io/syn/1.0.85 \
-    crate://crates.io/unicode-xid/0.2.2 \
-    crate://crates.io/unindent/0.1.7 \
-    crate://crates.io/version_check/0.9.4 \
-    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi/0.3.9 \
-"
-
-RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-asn1crypto \
-    ${PYTHON_PN}-cffi \
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-six \
-"
-
-RDEPENDS:${PN}:append:class-target = " \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-threading \
-"
-
-RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-bcrypt \
-    ${PYTHON_PN}-cryptography-vectors (= ${PV}) \
-    ${PYTHON_PN}-hypothesis \
-    ${PYTHON_PN}-iso8601 \
-    ${PYTHON_PN}-pretend \
-    ${PYTHON_PN}-psutil \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-pytest-subtests \
-    ${PYTHON_PN}-pytz \
-    ${PYTHON_PN}-tomli \
-"
-
-inherit ptest
-
-do_install_ptest() {
-    install -D ${WORKDIR}/check-memfree.py ${D}${PTEST_PATH}/
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-    install -d ${D}${PTEST_PATH}/tests/hazmat
-    cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/
-    cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/
-}
-
-FILES:${PN}-ptest += " \
-    ${PTEST_PATH}/check-memfree.py \
-"
-FILES:${PN}-dbg += " \
-    ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb
new file mode 100644
index 0000000000..1271954a08
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb
@@ -0,0 +1,118 @@
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
+SRC_URI[sha256sum] = "d610d0ee14dd9109006215c7c0de15eee91230b70a9bce2263461cf7c3720b83"
+
+SRC_URI += "file://run-ptest \
+           file://check-memfree.py \
+           file://0001-Cargo.toml-specify-pem-version.patch \
+           file://0002-Cargo.toml-edition-2018-2021.patch \
+           crate://crates.io/Inflector/0.11.4 \
+           crate://crates.io/aliasable/0.1.3 \
+           crate://crates.io/asn1/0.8.7 \
+           crate://crates.io/asn1_derive/0.8.7 \
+           crate://crates.io/autocfg/1.1.0 \
+           crate://crates.io/base64/0.13.0 \
+           crate://crates.io/bitflags/1.3.2 \
+           crate://crates.io/cfg-if/1.0.0 \
+           crate://crates.io/chrono/0.4.19 \
+           crate://crates.io/indoc-impl/0.3.6 \
+           crate://crates.io/indoc/0.3.6 \
+           crate://crates.io/instant/0.1.12 \
+           crate://crates.io/lazy_static/1.4.0 \
+           crate://crates.io/libc/0.2.124 \
+           crate://crates.io/lock_api/0.4.7 \
+           crate://crates.io/num-integer/0.1.44 \
+           crate://crates.io/num-traits/0.2.14 \
+           crate://crates.io/once_cell/1.10.0 \
+           crate://crates.io/ouroboros/0.15.0 \
+           crate://crates.io/ouroboros_macro/0.15.0 \
+           crate://crates.io/parking_lot/0.11.2 \
+           crate://crates.io/parking_lot_core/0.8.5 \
+           crate://crates.io/paste-impl/0.1.18 \
+           crate://crates.io/paste/0.1.18 \
+           crate://crates.io/pem/1.0.2 \
+           crate://crates.io/proc-macro-error-attr/1.0.4 \
+           crate://crates.io/proc-macro-error/1.0.4 \
+           crate://crates.io/proc-macro-hack/0.5.19 \
+           crate://crates.io/proc-macro2/1.0.37 \
+           crate://crates.io/pyo3-build-config/0.15.2 \
+           crate://crates.io/pyo3-macros-backend/0.15.2 \
+           crate://crates.io/pyo3-macros/0.15.2 \
+           crate://crates.io/pyo3/0.15.2 \
+           crate://crates.io/quote/1.0.18 \
+           crate://crates.io/redox_syscall/0.2.13 \
+           crate://crates.io/scopeguard/1.1.0 \
+           crate://crates.io/smallvec/1.8.0 \
+           crate://crates.io/stable_deref_trait/1.2.0 \
+           crate://crates.io/syn/1.0.91 \
+           crate://crates.io/unicode-xid/0.2.2 \
+           crate://crates.io/unindent/0.1.8 \
+           crate://crates.io/version_check/0.9.4 \
+           crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+           crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+           crate://crates.io/winapi/0.3.9 \
+           "
+
+inherit pypi python_setuptools3_rust
+
+DEPENDS += " \
+    ${PYTHON_PN}-asn1crypto-native \
+    ${PYTHON_PN}-cffi-native \
+    ${PYTHON_PN}-setuptools-rust-native \
+    ${PYTHON_PN}-six-native \
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
+    ${PYTHON_PN}-cryptography-vectors (= ${PV}) \
+    ${PYTHON_PN}-hypothesis \
+    ${PYTHON_PN}-iso8601 \
+    ${PYTHON_PN}-pretend \
+    ${PYTHON_PN}-psutil \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-pytest-subtests \
+    ${PYTHON_PN}-pytz \
+    ${PYTHON_PN}-tomli \
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
2.30.2


