Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Tim Orling" <ticotimo@gmail.com>
Subject: [PATCH 06/10] python3-bcrypt: upgrade 3.2.2 -> 4.0.0
Date: Sat,  8 Oct 2022 16:54:50 -0700
Message-Id: <1f3cf8a674dd24b5bcf1e97d6cbf7256f41722ab.1665270768.git.tim.orling@konsulko.com>
In-Reply-To: <cover.1665270768.git.tim.orling@konsulko.com>
References: <cover.1665270768.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

* Switch to python_setuptools3_rust.bbclass
* Add crate:// (from cargo bitbake output)
* Manually fix crate:// versions to satisfy cargo

4.0.0
    bcrypt is now implemented in Rust. Users building from source will
need to have a Rust compiler available. Nothing will change for users
downloading wheels.
    We no longer ship manylinux2010 wheels. Users should upgrade to the
latest pip to ensure this doesn’t cause issues downloading wheels on
their platform. We now ship manylinux_2_28 wheels for users on new
enough platforms.
    NUL bytes are now allowed in inputs.

https://github.com/pyca/bcrypt/#400

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-bcrypt_3.2.2.bb            | 30 -------
 .../python/python3-bcrypt_4.0.0.bb            | 79 +++++++++++++++++++
 2 files changed, 79 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb

diff --git a/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb b/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb
deleted file mode 100644
index 54070e4b9ca..00000000000
--- a/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "Modern password hashing for your software and your servers."
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
-HOMEPAGE = "https://pypi.org/project/bcrypt/"
-
-DEPENDS += "${PYTHON_PN}-cffi-native"
-
-SRC_URI[sha256sum] = "433c410c2177057705da2a9f2cd01dd157493b2a7ac14c8593a16b3dab6b6bfb"
-
-inherit pypi python_setuptools_build_meta ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-RDEPENDS:${PN}:class-target += "\
-    ${PYTHON_PN}-cffi \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-six \
-"
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb b/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb
new file mode 100644
index 00000000000..ac795ca8ab9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb
@@ -0,0 +1,79 @@
+DESCRIPTION = "Modern password hashing for your software and your servers."
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
+HOMEPAGE = "https://pypi.org/project/bcrypt/"
+
+DEPENDS += "${PYTHON_PN}-cffi-native"
+
+SRC_URI[sha256sum] = "c59c170fc9225faad04dde1ba61d85b413946e8ce2e5f5f5ff30dfd67283f319"
+
+inherit pypi python_setuptools3_rust ptest
+
+SRC_URI += " \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/base64/0.13.0 \
+    crate://crates.io/bcrypt-pbkdf/0.8.1 \
+    crate://crates.io/bcrypt/0.13.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/block-buffer/0.10.2 \
+    crate://crates.io/blowfish/0.9.1 \
+    crate://crates.io/byteorder/1.4.3 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/cipher/0.4.3 \
+    crate://crates.io/cpufeatures/0.2.4 \
+    crate://crates.io/crypto-common/0.1.6 \
+    crate://crates.io/digest/0.10.3 \
+    crate://crates.io/generic-array/0.14.6 \
+    crate://crates.io/getrandom/0.2.7 \
+    crate://crates.io/indoc-impl/0.3.6 \
+    crate://crates.io/indoc/0.3.6 \
+    crate://crates.io/inout/0.1.3 \
+    crate://crates.io/instant/0.1.12 \
+    crate://crates.io/libc/0.2.132 \
+    crate://crates.io/lock_api/0.4.7 \
+    crate://crates.io/once_cell/1.13.1 \
+    crate://crates.io/parking_lot/0.11.2 \
+    crate://crates.io/parking_lot_core/0.8.5 \
+    crate://crates.io/paste-impl/0.1.18 \
+    crate://crates.io/paste/0.1.18 \
+    crate://crates.io/pbkdf2/0.10.1 \
+    crate://crates.io/proc-macro-hack/0.5.19 \
+    crate://crates.io/proc-macro2/1.0.43 \
+    crate://crates.io/pyo3-build-config/0.15.2 \
+    crate://crates.io/pyo3-macros-backend/0.15.2 \
+    crate://crates.io/pyo3-macros/0.15.2 \
+    crate://crates.io/pyo3/0.15.2 \
+    crate://crates.io/quote/1.0.21 \
+    crate://crates.io/redox_syscall/0.2.16 \
+    crate://crates.io/scopeguard/1.1.0 \
+    crate://crates.io/sha2/0.10.2 \
+    crate://crates.io/smallvec/1.9.0 \
+    crate://crates.io/subtle/2.4.1 \
+    crate://crates.io/syn/1.0.99 \
+    crate://crates.io/typenum/1.15.0 \
+    crate://crates.io/unicode-ident/1.0.3 \
+    crate://crates.io/unindent/0.1.10 \
+    crate://crates.io/version_check/0.9.4 \
+    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/zeroize/1.5.7 \
+    file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN}:class-target += "\
+    ${PYTHON_PN}-cffi \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-six \
+"
-- 
2.34.1

