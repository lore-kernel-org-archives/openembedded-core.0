Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3727CD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 16:11:05 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1443.1781626262879342867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 09:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nlb9Zn24;
 spf=pass (domain: konsulko.com, ip: 209.85.216.49, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso4808624a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 09:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781626262; x=1782231062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=175r4LDAUZ8zqIReunruOEBZrjMpuwdNPGdiBZYEKH0=;
        b=nlb9Zn24CfcPj0Zy4xCdR5d2GSCuTd8gztEaY+Z0phjhQ3Hb/e6IqmsI7Jla0huL3m
         UO4NJk8dAakhGSOWLNTKUM4MWIZCrvXVVEQ+13BdN2VE6L8b739Ko+HgoroVLbsCy1jJ
         /FINK+AiG6yFCFI5LtHA7LURp2Khn9a9mcF04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781626262; x=1782231062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=175r4LDAUZ8zqIReunruOEBZrjMpuwdNPGdiBZYEKH0=;
        b=o9ad56bFU2gvAkNj7ZWUG2fk19HA7d/AewQDM9nBXXmUM2ggC1KhSpuCVwfmetpCZI
         zmeDtKhF8cMcmXXYw2/RWi0NqnB7UQNfxGapIX/Z2JWiQ8w4YwBne6kVTD379TNHu33U
         aPyHA/2Z36c0KpVk/C+fyDNPOQBfC21c9ybiKnJH+p0Y7oYNMF48Sk5DDRdQ81lZV4tE
         DOz+ffBiGlnWSLTbgM2bi+WB3z21b1DodHEBrBmrFYUFAMH+04BWFiQE8mdJH3E+pnl0
         GWLeIhkAx3WDy1EJzCxOJao8U0vlr+ZKQD9THoMbv+iEKkhjzR4AG/0hdWogJWSRcP+v
         gyuw==
X-Gm-Message-State: AOJu0YySKGmxIa4QRnoxCaSCiF7cAodYnYO5i57jK8tES424p36gQqwk
	sfgk8mVfKu7gTb8nm7ItHLb9TzFPkGWffQDF1lFl75zqe3DHjh6Y2SZtJ04D1Y1mIPKOttTs5jK
	j5VBR
X-Gm-Gg: Acq92OHZpWxdqdzs/pln5idIFRm8uwtG7TnOoV1urgFWpA9zbqFDCrfp/6f/POlK/Av
	kMHPwV+veR5k4cb1C49oidsfwKr3+gr+EZ/h+qr0FDElk6XhLWTuQZ/0e6oiRk2Wi+D5Fbbllb+
	rRh4Gmdt277L8xqHySZV15KV4OdWcJQEOaq+FhWrl14q7E6q85ord/56/M10JRRkdYxHpZFUlbq
	vNXzQsYQ8ZTchOar9ZcvT1Ph/19cqbnLZTcU+82mwCIsxdeyVRg+u5Dpcc5MoX59bYzH9anKMgr
	3LA0YxN3kXhlqIUxObzR+eFkb71hii2ph9M7KvelvdjBD8y44wfvxnEVpRMxpPBjWySOut9pVzN
	V3QPc9Q3OUIGkGfxJDT2ObaX0T+3UO7W7SKGDiZjGQu79Q2m040ebxGoO7Di4q23jCM1hjzo/JT
	IazURTqw3WlU/0TwyqVYUgrwM8u//UWp3tA4mC5/s=
X-Received: by 2002:a17:90b:3d47:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-37c93729213mr114772a91.18.1781626262140;
        Tue, 16 Jun 2026 09:11:02 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:186b:f68:30bc:109f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c6cc4e1aasm921087a91.14.2026.06.16.09.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:11:01 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-cryptography{-vectors}: upgrade 48.0.1 -> 49.0.0
Date: Tue, 16 Jun 2026 09:10:00 -0700
Message-ID: <20260616160959.2655187-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:11:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238916

From: Tim Orling <tim.orling@konsulko.com>

Add:
TARGET_CFLAGS:append = "-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}"

to fix an error in do_compile:

warning: cryptography-cffi@0.49.0: .../release/build/cryptography-cffi-d4ad0316804194ce/out/_openssl.c:57:10:
         fatal error: Python.h: No such file or directory
warning: cryptography-cffi@0.49.0:    57 | #include <Python.h>
warning: cryptography-cffi@0.49.0:       |          ^~~~~~~~~~
warning: cryptography-cffi@0.49.0: compilation terminated.

Backwards incompatible subset of upstream release notes:

49.0.0 - 2026-06-12
* BACKWARDS INCOMPATIBLE: Support for x86_64 macOS has been removed. We
  now only publish arm64 wheels for macOS.
* BACKWARDS INCOMPATIBLE: Support for 32-bit Windows has been removed.
  Users should move to a 64-bit Python installation.
* BACKWARDS INCOMPATIBLE: Removed the deprecated PUBLIC_KEY_TYPES,
  PRIVATE_KEY_TYPES, CERTIFICATE_PRIVATE_KEY_TYPES,
  CERTIFICATE_ISSUER_PUBLIC_KEY_TYPES, and CERTIFICATE_PUBLIC_KEY_TYPES
  type aliases. Use PublicKeyTypes, PrivateKeyTypes,
  CertificateIssuerPrivateKeyTypes, CertificateIssuerPublicKeyTypes, and
  CertificatePublicKeyTypes instead. These were deprecated in version
  40.0.
* BACKWARDS INCOMPATIBLE: ChaCha20 now treats the first 4 bytes of the
  nonce as a 32-bit little-endian block counter (as defined in RFC 7539)
  and tracks the number of bytes processed. Attempting to encrypt or
  decrypt more data than the counter allows before it would overflow now
  raises a ValueError rather than silently diverging from RFC 7539.
  Setting the counter portion of the nonce to zero allows encrypting up
  to 256 GiB with a given nonce.
* BACKWARDS INCOMPATIBLE: Loading an X.509 certificate whose ECDSA or DSA
  signature AlgorithmIdentifier contains encoded NULL parameters now
  raises a ValueError. Such certificates are invalid, but older versions
  of Java emitted them; previously they loaded with a deprecation
  warning.

For full upstream changelog, see:
https://cryptography.io/en/latest/changelog/#v49-0-0

Full comparison of changes:
https://github.com/pyca/cryptography/compare/48.0.1...49.0.0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass on qemux86-64 for core-image-ptest-python3-cryptography:
============================================================================
Testsuite summary
# TOTAL: 4441
# PASS: 4237
# SKIP: 204
# XFAIL: 0
# FAIL: 0
# XPASS: 0
# ERROR: 0
DURATION: 32
END: /usr/lib/python3-cryptography/ptest
2026-06-16T16:08
STOP: ptest-runner
TOTAL: 1 FAIL: 0

 .../python/python3-cryptography-common.inc    |  2 +-
 .../python/python3-cryptography-crates.inc    | 40 +++++++++----------
 .../python/python3-cryptography-vectors.bb    |  2 +-
 .../python/python3-cryptography.bb            |  4 +-
 ...toml-remove-benchmark-disable-option.patch |  4 +-
 5 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 4077fdebbf..fe43af3f13 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "48.0.1"
+PV = "49.0.0"
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index 0301b1f49c..ab54bae6bc 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -5,8 +5,8 @@ SRC_URI += " \
     crate://crates.io/asn1/0.24.1 \
     crate://crates.io/asn1_derive/0.24.1 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bitflags/2.11.1 \
-    crate://crates.io/cc/1.2.61 \
+    crate://crates.io/bitflags/2.13.0 \
+    crate://crates.io/cc/1.2.64 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/foreign-types/0.3.2 \
@@ -15,21 +15,21 @@ SRC_URI += " \
     crate://crates.io/itoa/1.0.18 \
     crate://crates.io/libc/0.2.186 \
     crate://crates.io/once_cell/1.21.4 \
-    crate://crates.io/openssl/0.10.79 \
+    crate://crates.io/openssl/0.10.81 \
     crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-sys/0.9.115 \
+    crate://crates.io/openssl-sys/0.9.117 \
     crate://crates.io/pem/3.0.6 \
     crate://crates.io/pkg-config/0.3.33 \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/pyo3/0.28.3 \
-    crate://crates.io/pyo3-build-config/0.28.3 \
-    crate://crates.io/pyo3-ffi/0.28.3 \
-    crate://crates.io/pyo3-macros/0.28.3 \
-    crate://crates.io/pyo3-macros-backend/0.28.3 \
+    crate://crates.io/pyo3/0.29.0 \
+    crate://crates.io/pyo3-build-config/0.29.0 \
+    crate://crates.io/pyo3-ffi/0.29.0 \
+    crate://crates.io/pyo3-macros/0.29.0 \
+    crate://crates.io/pyo3-macros-backend/0.29.0 \
     crate://crates.io/quote/1.0.45 \
     crate://crates.io/self_cell/1.2.2 \
-    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/shlex/2.0.1 \
     crate://crates.io/syn/2.0.117 \
     crate://crates.io/target-lexicon/0.13.5 \
     crate://crates.io/unicode-ident/1.0.24 \
@@ -39,8 +39,8 @@ SRC_URI += " \
 SRC_URI[asn1-0.24.1.sha256sum] = "c9795210620c0cb3f9a7ce4f882808c38e1ef7b347c90591dceae0886e031fb1"
 SRC_URI[asn1_derive-0.24.1.sha256sum] = "909e307f1cc32bb8bccbd98f446e6d1bf03fa30f7b53a4337da7181ad30fa11a"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bitflags-2.11.1.sha256sum] = "c4512299f36f043ab09a583e57bceb5a5aab7a73db1805848e8fef3c9e8c78b3"
-SRC_URI[cc-1.2.61.sha256sum] = "d16d90359e986641506914ba71350897565610e87ce0ad9e6f28569db3dd5c6d"
+SRC_URI[bitflags-2.13.0.sha256sum] = "b4388bee8683e3d04af747c73422af53102d2bd24d9eadb6cbc100baef4b43f8"
+SRC_URI[cc-1.2.64.sha256sum] = "dad887fd958be91b5098c0248def011f4523ab786cd411be668777e55063501f"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
@@ -49,21 +49,21 @@ SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7
 SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
 SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
 SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
-SRC_URI[openssl-0.10.79.sha256sum] = "bf0b434746ee2832f4f0baf10137e1cabb18cbe6912c69e2e33263c45250f542"
+SRC_URI[openssl-0.10.81.sha256sum] = "77823a27f0babb03091cb9ed9ef80af3b39dbc82f97e8fa530374b7dafd87a45"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.115.sha256sum] = "158fe5b292746440aa6e7a7e690e55aeb72d41505e2804c23c6973ad0e9c9781"
+SRC_URI[openssl-sys-0.9.117.sha256sum] = "b47e7e6bb2c38cd930d25a23b40fa52e068c10e85f3e03a7f5ba5aaca5713695"
 SRC_URI[pem-3.0.6.sha256sum] = "1d30c53c26bc5b31a98cd02d20f25a7c8567146caf63ed593a9d87b2775291be"
 SRC_URI[pkg-config-0.3.33.sha256sum] = "19f132c84eca552bf34cab8ec81f1c1dcc229b811638f9d283dceabe58c5569e"
 SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[pyo3-0.28.3.sha256sum] = "91fd8e38a3b50ed1167fb981cd6fd60147e091784c427b8f7183a7ee32c31c12"
-SRC_URI[pyo3-build-config-0.28.3.sha256sum] = "e368e7ddfdeb98c9bca7f8383be1648fd84ab466bf2bc015e94008db6d35611e"
-SRC_URI[pyo3-ffi-0.28.3.sha256sum] = "7f29e10af80b1f7ccaf7f69eace800a03ecd13e883acfacc1e5d0988605f651e"
-SRC_URI[pyo3-macros-0.28.3.sha256sum] = "df6e520eff47c45997d2fc7dd8214b25dd1310918bbb2642156ef66a67f29813"
-SRC_URI[pyo3-macros-backend-0.28.3.sha256sum] = "c4cdc218d835738f81c2338f822078af45b4afdf8b2e33cbb5916f108b813acb"
+SRC_URI[pyo3-0.29.0.sha256sum] = "cd274650b21d4bfc26a0a47587962c1edb425f69287324355cd040c3ea66071c"
+SRC_URI[pyo3-build-config-0.29.0.sha256sum] = "c5e2a7d2f0d013342f295c048ad19237add5154a55b1c5a254c0ec93d4109078"
+SRC_URI[pyo3-ffi-0.29.0.sha256sum] = "ca85c467da1bbc8d866eea5deff9cf29ea5f7785054a17da36e65bda9c05845b"
+SRC_URI[pyo3-macros-0.29.0.sha256sum] = "9ac53762fd065daa3194dd09337a38bd793a188100fd1a9304c4ab312d901771"
+SRC_URI[pyo3-macros-backend-0.29.0.sha256sum] = "4ca3a1557399783172dc5bf39cfca835157732532cba56b71d2292161e53b362"
 SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
 SRC_URI[self_cell-1.2.2.sha256sum] = "b12e76d157a900eb52e81bc6e9f3069344290341720e9178cde2407113ac8d89"
-SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
+SRC_URI[shlex-2.0.1.sha256sum] = "f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba"
 SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
 SRC_URI[target-lexicon-0.13.5.sha256sum] = "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 0119b70b7e..fe4307a4d9 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "52bfaaf93b50e013d59a5ba070b510e4c1272f8cfabcb2e4fb58bc327c69b8f1"
+SRC_URI[sha256sum] = "9e3352b1e652d2f986755edf79228a385f6b0bd53d5b248c087ff79b24a7b516"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 915b35f3a5..4730c34997 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "266f4ee051abb2f725b74ef8072b521ce1feacf685a3364fa6a6b45548db791a"
+SRC_URI[sha256sum] = "f89660a348f4f78a92366240a61404e337586ef7f5909a2fef59ca88ef505493"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
@@ -27,6 +27,8 @@ PACKAGECONFIG[legacy-openssl] = ",,,openssl-ossl-module-legacy"
 
 export CRYPTOGRAPHY_BUILD_OPENSSL_NO_LEGACY = "${@bb.utils.contains('PACKAGECONFIG', 'legacy-openssl', '0', '1', d)}"
 
+TARGET_CFLAGS:append = " -I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}"
+
 DEPENDS += " \
     python3-cffi-native \
     openssl \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index de0718ec03..42b4c56c0d 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From f870c1b00a302999fc3a7dd9cc6bb1d340511803 Mon Sep 17 00:00:00 2001
+From c8fd85d80eb64fede8447842042977b70b3c96bc Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index f9d05bb..3aaf9fe 100644
+index cddaf7f..921badf 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -139,7 +139,7 @@ exclude = [
-- 
2.47.3


