Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF250C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 09:35:28 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.2771.1663061705027847457
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 02:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25,
 mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oY2Jp-00DSXU-Lw; Tue, 13 Sep 2022 12:35:02 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oY2Jp-000Cia-JX; Tue, 13 Sep 2022 12:35:01 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] python3-cryptography: workaround broken native functionality
Date: Tue, 13 Sep 2022 12:34:52 +0300
Message-Id: <20220913093452.47839-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: 1.8 (+)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20220913093452.47839-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 09:35:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170562

The python3-cryptography-native builds work but are functionally broken
on Ubuntu 18.04 build host since the update from 3.3.2 in
meta-openembedded/meta-python. If recipe needs and DEPENDS on
python3-cryptography-native for signing use cases, loading
the python modules fails:

$ python3 -c  "from OpenSSL import crypto"
Traceback (most recent call last):
  File "<string>", line 1, in <module>
  File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/OpenSSL/__init__.py", line 8, in <module>
    from OpenSSL import crypto, SSL
  File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/OpenSSL/crypto.py", line 11, in <module>
    from OpenSSL._util import (
  File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/OpenSSL/_util.py", line 5, in <module>
    from cryptography.hazmat.bindings.openssl.binding import Binding
  File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl/binding.py", line 228, in <module>
    Binding.init_static_locks()
  File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl/binding.py", line 188, in init_static_locks
    cls._ensure_ffi_initialized()
  File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl/binding.py", line 176, in _ensure_ffi_initialized
    _openssl_assert(
  File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl/binding.py", line 90, in _openssl_assert
    raise InternalError(
cryptography.exceptions.InternalError: Unknown OpenSSL error. This error is commonly encountered when another library is not cleaning up the OpenSSL error stack. If you are using cryptography with another library that uses OpenSSL try disabling it before reporting a bug. Otherwise please file an issue at https://github.com/pyca/cryptography/issues with information on how to reproduce this. ([_OpenSSLErrorWithText(code=310378599, lib=37, reason=103, reason_text=b'error:12800067:DSO support routines::could not load the shared library'), _OpenSSLErrorWithText(code=310378599, lib=37, reason=103, reason_text=b'error:12800067:DSO support routines::could not load the shared library'), _OpenSSLErrorWithText(code=126615813, lib=15, reason=786693, reason_text=b'error:078C0105:common libcrypto routines::init fail')])

This hacky patch enables enough functionality in
python3-cryptography-native to work so that basic secure boot
signing use cases work again.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...3-cryptography_hack_to_remove_legacy.patch | 54 +++++++++++++++++++
 .../python/python3-cryptography_37.0.4.bb     |  5 ++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/python3-cryptography_hack_to_remove_legacy.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography/python3-cryptography_hack_to_remove_legacy.patch b/meta/recipes-devtools/python/python3-cryptography/python3-cryptography_hack_to_remove_legacy.patch
new file mode 100644
index 0000000000..74b1cff248
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/python3-cryptography_hack_to_remove_legacy.patch
@@ -0,0 +1,54 @@
+python3-cryptography: ignore broken legacy providers
+
+These are broken on python3-cryptography-native builds
+since update from python3-cryptography 3.3.2 in meta-openembedded/meta-python
+to the new rust based versions 35 and newer.
+
+Test case on Ubuntu 18.04 build host, a recipe which needs
+python3-cryptography-native for e.g. signing secure boot binaries:
+
+# python3 -c  "from OpenSSL import crypto"
+Traceback (most recent call last):
+  File "<string>", line 1, in <module>
+  File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/OpenSSL/__init__.py", line 8, in <module>
+    from OpenSSL import crypto, SSL
+  File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/OpenSSL/crypto.py", line 11, in <module>
+    from OpenSSL._util import (
+  File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/OpenSSL/_util.py", line 5, in <module>
+    from cryptography.hazmat.bindings.openssl.binding import Binding
+  File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl/binding.py", line 228, in <module>
+    Binding.init_static_locks()
+  File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl/binding.py", line 188, in init_static_locks
+    cls._ensure_ffi_initialized()
+  File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl/binding.py", line 176, in _ensure_ffi_initialized
+    _openssl_assert(
+  File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cryptography/hazmat/bindings/openssl/binding.py", line 90, in _openssl_assert
+    raise InternalError(
+cryptography.exceptions.InternalError: Unknown OpenSSL error. This error is commonly encountered when another library is not cleaning up the OpenSSL error stack. If you are using cryptography with another library that uses OpenSSL try disabling it before reporting a bug. Otherwise please file an issue at https://github.com/pyca/cryptography/issues with information on how to reproduce this. ([_OpenSSLErrorWithText(code=310378599, lib=37, reason=103, reason_text=b'error:12800067:DSO support routines::could not load the shared library'), _OpenSSLErrorWithText(code=310378599, lib=37, reason=103, reason_text=b'error:12800067:DSO support routines::could not load the shared library'), _OpenSSLErrorWithText(code=126615813, lib=15, reason=786693, reason_text=b'error:078C0105:common libcrypto routines::init fail')])
+
+With this hacky patch, the needed signing functions of
+python3-cryptography-native still work.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+
+diff --git a/src/cryptography/hazmat/bindings/openssl/binding.py b/src/cryptography/hazmat/bindings/openssl/binding.py
+index a6fbc94..fffb669 100644
+--- a/src/cryptography/hazmat/bindings/openssl/binding.py
++++ b/src/cryptography/hazmat/bindings/openssl/binding.py
+@@ -173,9 +173,11 @@ class Binding:
+                     cls._legacy_provider = cls.lib.OSSL_PROVIDER_load(
+                         cls.ffi.NULL, b"legacy"
+                     )
+-                    _openssl_assert(
+-                        cls.lib, cls._legacy_provider != cls.ffi.NULL
+-                    )
++                    # HACK: for some reason this check is failing on native
++                    # but maybe it doesn't harm to break old, broken ciphers
++                    #_openssl_assert(
++                    #    cls.lib, cls._legacy_provider != cls.ffi.NULL
++                    #)
+                     cls._default_provider = cls.lib.OSSL_PROVIDER_load(
+                         cls.ffi.NULL, b"default"
+                     )
diff --git a/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb b/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb
index c91a8c7771..116871cd0b 100644
--- a/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb
@@ -63,6 +63,11 @@ SRC_URI += "file://run-ptest \
            crate://crates.io/winapi/0.3.9 \
            "
 
+# workaround for native builds to get some of the signing functions working
+SRC_URI:append:class-native = " \
+           file://python3-cryptography_hack_to_remove_legacy.patch \
+"
+
 inherit pypi python_setuptools3_rust
 
 DEPENDS += " \
-- 
2.17.1


