Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B868DC55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 23:27:00 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5784.1785799612311993978
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 16:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hqHc7TE3;
 spf=pass (domain: konsulko.com, ip: 209.85.214.176, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caea3f742bso40661325ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 16:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785799612; x=1786404412; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGYdhzoxg9NZeds5aibo1VT2+vjMJXUWqvzwDsP6+CU=;
        b=hqHc7TE3hNwK6kAGyB4ywK2qpkCY9DXao8X2g8HTCdNh+rt3rTFgiIDaeP/1CETj0z
         hoNsaOb6d/xBEC/IfHMzFELLvIwPnudvDfbLz+3YWH/3a6b82HjLccY/+vA//di815kw
         j2SaY3JX1eo9hCm5WitMx307dUndrgzy34KTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785799612; x=1786404412;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGYdhzoxg9NZeds5aibo1VT2+vjMJXUWqvzwDsP6+CU=;
        b=IHAy/wEGOXn/GjtdFkUKd9wVdA8VodEjX433QX+NfiHEfvRZUPnnEsdx8mt+qaCn+P
         V1m+N4Tvb07IUYKc/YXrfbXwj6nnmQSAN+1a09uC44PI8jK4HzWBVoPE2M7COSmFHRba
         VG9p+22DMYUWvIYQC6P3hNW82RXcgtJpspUeCO88+20Hg2Hc3fDFGvhm8lPl2MEAxPTa
         Jw8qK3k/Kc43AqGLKxNZTDp0tZZeAz+uf/MlJEzwocJv3EpFFw14qj+OloLiUdIZDiyd
         VBlFo/z35lRMyqCHhChMxiKUFhvkeueanIoX4Tm7ld0sgDy5w4IUXY+X3ijXH/gQ98CE
         fN0Q==
X-Gm-Message-State: AOJu0Yw9YQ2xOaHGvSBcOO1dUIJP23Z1pKAgC5aIs1phuNhXkngoUHOO
	envYiBIKOoRGfgT+hbojw+uvo7sBIhyIMJGljtcoMq8uIYqjlW+uX6mEQgKEXFO7W6UKTFjFNK/
	rH5vx
X-Gm-Gg: AR+sD10z6oulvujjQddasO7n7fEtsi+0MTt6stzDxqifATyZpg9r1Vr/yxx8NVqu9wv
	4Gxn4duYpSizG5Z63NdzHQrOJfCHH1r4wicejjhIk+z2hTp1KRsA/TVVt2DzWju9Jj/2uNTcG1Y
	/FgFgtbq9fsR9ee3rgh7pgnknCJ3J0x9gQvaEHM0by1XOoEyOX+chNB2wrwVpBjO3RGnH1DC94P
	9Ji3A0l3t9Y8eqHrxxoyN5BUOWigZSMtRkwEJoW4s3q3rKaJcG//uf2+6x2mV+5a0xFUO7bUXCV
	+qf7YOyUk8DyQUwHQjNMlfUpXLXyrN2Tsq+Yy3qXOEKEfkLCjvkgTDKvCgajOqXvbLkikbQCHo+
	GP3st2uPzmuK7Z0wkmCIinhKWZTOqPQvmYfL50ThounnYXJzVRy30Z/a7sVVK7j/7qjw3pZbUeY
	NVz+DiqGq1zKs0uCpkaKsxLZ81OX/d8ZYhPj9BgeRFhV3S0z/9AZxWs8KnMPZ4LNQ7B1Uj+sQeL
	g7TYROoiAD+nxBH71j77h8vH3qI
X-Received: by 2002:a17:902:f542:b0:2ce:88d7:a233 with SMTP id d9443c01a7336-2d052428c82mr111088175ad.33.1785799611476;
        Mon, 03 Aug 2026 16:26:51 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6808:583f:6e91:c834])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b11f99csm44342545ad.58.2026.08.03.16.26.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 16:26:51 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] python3-cryptography{-vectors}: upgrade 49.0.0 -> 50.0.0
Date: Mon,  3 Aug 2026 16:26:38 -0700
Message-ID: <ad642c02d76ee92a7b9808293f25f3dd5536275b.1785799308.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785799308.git.tim.orling@konsulko.com>
References: <cover.1785799308.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 23:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242673

From: Tim Orling <tim.orling@konsulko.com>

* Update python3-cryptography-crates.inc
* Refresh 0001-pyproject.toml-remove-benchmark-disable-option.patch

For full comparison of changes (298 commits, 202 files changed), see:
https://github.com/pyca/cryptography/compare/49.0.0...50.0.0

Upstream release notes:
https://cryptography.io/en/50.0.0/changelog/#v50-0-0

50.0.0 - 2026-07-31
SECURITY ISSUE: pkcs7_decrypt_der() and its PEM and S/MIME variants no
longer expose distinguishable errors or timing when unwrapping a
RecipientInfo’s encryptedKey, which could act as a Bleichenbacher oracle
for callers that decrypt untrusted messages. A random key is now
substituted on failure, as described in RFC 3218. Credit to X1AOxiang
for reporting the issue

Deprecated Diffie-Hellman key exchange over finite fields (FFDH).
Everything FFDH is deprecated, including the types in
cryptography.hazmat.primitives.asymmetric.dh and loading FFDH keys or
parameters with the key loading APIs. Users should migrate to a more
modern key exchange algorithm.

Added xof() class methods to SHAKE128 and SHAKE256 for constructing
algorithm instances configured for use with XOFHash.

The X.509 verification APIs are now considered stable and are subject to
our API stability policy.

Added the Cobblestone (streaming symmetric encryption) recipe, an
implementation of the Cobblestone-128 and Cobblestone-256 instantiations
of the C2SP chunked-encryption specification for streaming authenticated
encryption of large messages.

Parsing a Signed Certificate Timestamp list now rejects encodings that
carry trailing bytes after the list or after an individual SCT, instead
of silently ignoring them.

Added support for using Name as a field type in the ASN.1 module.

Loading a public key or an EC private key now rejects DER where the
subjectPublicKey (or EC publicKey) BIT STRING declares a non-zero number
of unused bits, instead of silently ignoring it.

Parsing a CRL entry’s InvalidityDate extension now rejects a
GeneralizedTime that carries fractional seconds or another non-DER form,
matching the strict encoding already required for every other X.509 time
field.

load_der_ocsp_request() and load_der_ocsp_response() now reject a request
or response whose version field is not v1, the only version defined by
RFC 6960, matching the version validation already performed when loading
certificates, CSRs and CRLs.

XOFHash is now supported when building against AWS-LC.

HMAC (and therefore PBKDF2-HMAC) with SHA-3 hashes is now supported when
building against AWS-LC.

Diffie-Hellman (Diffie-Hellman key exchange) is now supported when
building against AWS-LC.

load_der_public_key() and load_pem_public_key() now reject Diffie-Hellman
public keys whose modulus is smaller than 512 bits, matching the minimum
already enforced when loading DH private keys and when constructing
DHParameterNumbers.

Added MLDSAMuHasher for incrementally computing the ML-DSA mu (message
representative) used by the external-mu signing and verification APIs.

The builtin HashAlgorithm classes and the classes in padding can now be
compared with ==.

CertificateBuilder now supports creating unsigned certificates (RFC 9925)
with the create_unsigned method.

The X.509 verification APIs now permit ML-DSA-44, ML-DSA-65, and ML-DSA-87
(RFC 9881) public keys and signatures by default.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-cryptography-common.inc    |  2 +-
 .../python/python3-cryptography-crates.inc    | 40 +++++++++----------
 .../python/python3-cryptography-vectors.bb    |  2 +-
 .../python/python3-cryptography.bb            |  2 +-
 ...toml-remove-benchmark-disable-option.patch | 12 +++---
 5 files changed, 30 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index fe43af3f13..298c52d1d3 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "49.0.0"
+PV = "50.0.0"
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index ab54bae6bc..f626556e13 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -4,33 +4,33 @@
 SRC_URI += " \
     crate://crates.io/asn1/0.24.1 \
     crate://crates.io/asn1_derive/0.24.1 \
-    crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bitflags/2.13.0 \
-    crate://crates.io/cc/1.2.64 \
+    crate://crates.io/base64/0.23.0 \
+    crate://crates.io/bitflags/2.13.1 \
+    crate://crates.io/cc/1.4.0 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/itoa/1.0.18 \
-    crate://crates.io/libc/0.2.186 \
+    crate://crates.io/libc/0.2.189 \
     crate://crates.io/once_cell/1.21.4 \
     crate://crates.io/openssl/0.10.81 \
     crate://crates.io/openssl-macros/0.1.1 \
     crate://crates.io/openssl-sys/0.9.117 \
-    crate://crates.io/pem/3.0.6 \
+    crate://crates.io/pem/4.0.0 \
     crate://crates.io/pkg-config/0.3.33 \
-    crate://crates.io/portable-atomic/1.13.1 \
-    crate://crates.io/proc-macro2/1.0.106 \
+    crate://crates.io/portable-atomic/1.14.0 \
+    crate://crates.io/proc-macro2/1.0.107 \
     crate://crates.io/pyo3/0.29.0 \
     crate://crates.io/pyo3-build-config/0.29.0 \
     crate://crates.io/pyo3-ffi/0.29.0 \
     crate://crates.io/pyo3-macros/0.29.0 \
     crate://crates.io/pyo3-macros-backend/0.29.0 \
-    crate://crates.io/quote/1.0.45 \
-    crate://crates.io/self_cell/1.2.2 \
+    crate://crates.io/quote/1.0.47 \
+    crate://crates.io/self_cell/1.3.0 \
     crate://crates.io/shlex/2.0.1 \
-    crate://crates.io/syn/2.0.117 \
+    crate://crates.io/syn/2.0.119 \
     crate://crates.io/target-lexicon/0.13.5 \
     crate://crates.io/unicode-ident/1.0.24 \
     crate://crates.io/vcpkg/0.2.15 \
@@ -38,33 +38,33 @@ SRC_URI += " \
 
 SRC_URI[asn1-0.24.1.sha256sum] = "c9795210620c0cb3f9a7ce4f882808c38e1ef7b347c90591dceae0886e031fb1"
 SRC_URI[asn1_derive-0.24.1.sha256sum] = "909e307f1cc32bb8bccbd98f446e6d1bf03fa30f7b53a4337da7181ad30fa11a"
-SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bitflags-2.13.0.sha256sum] = "b4388bee8683e3d04af747c73422af53102d2bd24d9eadb6cbc100baef4b43f8"
-SRC_URI[cc-1.2.64.sha256sum] = "dad887fd958be91b5098c0248def011f4523ab786cd411be668777e55063501f"
+SRC_URI[base64-0.23.0.sha256sum] = "b25655df2c3cdd83c5e5b293b88acd880332b2ddadd7c30ac43144fdc0033da9"
+SRC_URI[bitflags-2.13.1.sha256sum] = "b588b76d00fde79687d7646a9b5bdf3cc0f655e0bbd080335a95d7e96f3587da"
+SRC_URI[cc-1.4.0.sha256sum] = "5add81bb678e6cb321aff7fa0dc7689ad82b112dbc032cea19f91d6b8e3582b9"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
-SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
+SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
 SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
 SRC_URI[openssl-0.10.81.sha256sum] = "77823a27f0babb03091cb9ed9ef80af3b39dbc82f97e8fa530374b7dafd87a45"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
 SRC_URI[openssl-sys-0.9.117.sha256sum] = "b47e7e6bb2c38cd930d25a23b40fa52e068c10e85f3e03a7f5ba5aaca5713695"
-SRC_URI[pem-3.0.6.sha256sum] = "1d30c53c26bc5b31a98cd02d20f25a7c8567146caf63ed593a9d87b2775291be"
+SRC_URI[pem-4.0.0.sha256sum] = "d354a98a3d1251555de99e8fdd8afda05573c31b82f59063a7b0a29b5527f120"
 SRC_URI[pkg-config-0.3.33.sha256sum] = "19f132c84eca552bf34cab8ec81f1c1dcc229b811638f9d283dceabe58c5569e"
-SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
-SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
+SRC_URI[portable-atomic-1.14.0.sha256sum] = "3d20d5497ef88037a52ff98267d066e7f11fcc5e99bbfbd58a42336193aacec3"
+SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
 SRC_URI[pyo3-0.29.0.sha256sum] = "cd274650b21d4bfc26a0a47587962c1edb425f69287324355cd040c3ea66071c"
 SRC_URI[pyo3-build-config-0.29.0.sha256sum] = "c5e2a7d2f0d013342f295c048ad19237add5154a55b1c5a254c0ec93d4109078"
 SRC_URI[pyo3-ffi-0.29.0.sha256sum] = "ca85c467da1bbc8d866eea5deff9cf29ea5f7785054a17da36e65bda9c05845b"
 SRC_URI[pyo3-macros-0.29.0.sha256sum] = "9ac53762fd065daa3194dd09337a38bd793a188100fd1a9304c4ab312d901771"
 SRC_URI[pyo3-macros-backend-0.29.0.sha256sum] = "4ca3a1557399783172dc5bf39cfca835157732532cba56b71d2292161e53b362"
-SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
-SRC_URI[self_cell-1.2.2.sha256sum] = "b12e76d157a900eb52e81bc6e9f3069344290341720e9178cde2407113ac8d89"
+SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
+SRC_URI[self_cell-1.3.0.sha256sum] = "2ab42ca02749e120097e328d91d415325bdf43b1c72c4c8badf37375fe40a813"
 SRC_URI[shlex-2.0.1.sha256sum] = "f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba"
-SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
+SRC_URI[syn-2.0.119.sha256sum] = "872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297"
 SRC_URI[target-lexicon-0.13.5.sha256sum] = "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
 SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index f5dd5757a4..d62d681c6d 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "9e3352b1e652d2f986755edf79228a385f6b0bd53d5b248c087ff79b24a7b516"
+SRC_URI[sha256sum] = "6760814930443e6d73a6afcad09463d3ffdc42084ee0bdcfb2f05697250c3c8d"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index caffb0a24e..d6a1bb53f3 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "f89660a348f4f78a92366240a61404e337586ef7f5909a2fef59ca88ef505493"
+SRC_URI[sha256sum] = "eeac2acb5a20ed25e0ad6d1df9891a520b78b404266b6d11778f25d5d691a6c9"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 42b4c56c0d..967b661c6e 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -19,22 +19,24 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 
-Refresh for 42.02
+Refresh for 50.0.0
 Signed-off-by: Tim Orling <tim.orling@konsulko.com>
 ---
  pyproject.toml | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index cddaf7f..921badf 100644
+index fb8185913..29d0b3e08 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -139,7 +139,7 @@ exclude = [
+@@ -140,7 +140,7 @@ exclude = [
  ]
- 
+
  [tool.pytest.ini_options]
 -addopts = "-r s --capture=no --strict-markers --benchmark-disable"
 +addopts = "-r s --capture=no --strict-markers"
+ testpaths = ["tests"]
  console_output_style = "progress-even-when-capture-no"
  markers = [
-     "skip_fips: this test is not executed in FIPS mode",
+--
+2.43.0
-- 
2.47.3


