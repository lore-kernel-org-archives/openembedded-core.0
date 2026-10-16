Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800CDCC6B2D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:32:44 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13947.1792121560658981870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Mukc78sm;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=18302; q=dns/txt;
  s=iport01; t=1792121560; x=1793331160;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jInHBaPjGslCF8iMc55M0oJmh4BAbbB7RBd2lzILr8o=;
  b=Mukc78smJ67pFYYYb0D+6/fcOOx6OLjlCI+MDqnWZ+A+fZl2fCuzeUE5
   l1CJnfxDSyFKfDUx1jNb5MB01ErM3HgZvGWio70XuawMq+euosonapkd+
   /q2BsvolVFqQ8GUGYwQkkkvibWK/e58Vqw8lqAiD2DwmX029uY/V2tdRp
   fERbvCS/MXwtiUC4C8pTAs+2d7XJ5r9BLiMrVmXdgq/Kql5Gj9tM2qa9Z
   mH0wZYqUDoGkM+OC0k8RJq0JGbMepY9U/No/zrO2dq+g1SSHoW8/eGOXP
   FmGaS0qAcWL6b4e9/aRGsMOOb4854m5+6SMhcTBWFfDikNTC76k+tBHBJ
   g==;
X-CSE-ConnectionGUID: Fps9Yg87St6Jo84vqstq0A==
X-CSE-MsgGUID: OtepfSTbRZqx+bUrQv/ejQ==
X-IPAS-Result: =?us-ascii?q?A0BaAgA8mdFq/5D/Ja1aHgEBCxIMggULgld1YENJA5ZHi?=
 =?us-ascii?q?2iFZYxSgX4PAQEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBKgsBFDIsAwECTwsjIYMCAYI6AzcDE?=
 =?us-ascii?q?bx4gXkzgQGCT4EeQVDYSw2CWgELFAEFgTOBYYNfgn+FJF0YAUSCBYIzBwEfG?=
 =?us-ascii?q?xuBcoEVg2mBBYEaQgEBAgGIIgSCIoEMgQ1NHoEvk3pIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgghYjGTZ6gQlegSspYAEQF4EJggcCg?=
 =?us-ascii?q?lSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JB?=
 =?us-ascii?q?ykYDUgRLDcVGQQ+bgeSEx6CLSYLBQIBFRcEJwEIGgkBCQEpAhdkBCFFGAYCJ?=
 =?us-ascii?q?xERkm8UCZAmgiGBNZ5pcQoog3aMIo8+BIV4GjOEBIFXpRQLmH2CWYsxhAmRS?=
 =?us-ascii?q?UY3hGmBaDyBWXAVgyIJShkPjisDCwuCO4ElhRNRMMhGJzICCQMvAQEHAgcOA?=
 =?us-ascii?q?wuBaJACLYFPAQE?=
IronPort-Data: A9a23:HdrNr6qFYDzV0kfmciyMMAHmGhteBmJOZBIvgKrLsJaIsI4StFCzt
 garIBnVbvyDM2b9fYhxa4Tk/B4HuMLVn4VhHAc5rCA2FShE9OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0shvGjB/+
 qxHEyxTTBfT2/yv266iEsA506zPLOGzVG8ekmtrwTecCbMtRorOBv2Vo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVPrSn8/w7pX7Wz1EqFuWrLAf6GnIxws327/oWDbQUoHRGJ8FwhrA9
 goq+UzeHhwCOuejwwC362LvjNLVpD28VYArQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YeLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:pbASvq9P0M9N76DW3H1uk+D0I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WLK+UyFJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:egNwAWzqlOkNNfBjVreVBgU6Att0Q3KNk0zMfW2/WTp3UaaJUAe5rfY=
X-Talos-MUID: 9a23:eInKbAtePW9JmGlsXM2noy1vLMlT366UOlkd0p87ofCaciFyAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535284408"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:32:39 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 6DC3D180004B7;
	Fri, 16 Oct 2026 03:32:39 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 14CDDCC1611; Thu, 15 Oct 2026 20:32:39 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH] python3-cryptography: fix CVE-2026-69247
Date: Thu, 15 Oct 2026 20:32:39 -0700
Message-Id: <20261016033239.422310-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247903

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

A direct backport is used because the fixed 50.0.0
release also contains backward-incompatible API changes
and new features, which are unsuitable for a stable
Wrynose update.

[1] https://github.com/pyca/cryptography/commit/53fccd93413a8d7f07d6d8999681f27b75cffa3f
[2] https://github.com/pyca/cryptography/security/advisories/GHSA-g6cj-pr64-35w5

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/python3-cryptography.bb            |   1 +
 .../python3-cryptography/CVE-2026-69247.patch | 435 ++++++++++++++++++
 2 files changed, 436 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-69247.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index f3cb755ed5..a94b79ed4c 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -19,6 +19,7 @@ SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://CVE-2026-69249.patch \
             file://check-memfree.py \
             file://run-ptest \
+            file://CVE-2026-69247.patch \
            "
 
 require ${BPN}-crates.inc
diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69247.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69247.patch
new file mode 100644
index 0000000000..85b47faac5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69247.patch
@@ -0,0 +1,435 @@
+From 53fccd93413a8d7f07d6d8999681f27b75cffa3f Mon Sep 17 00:00:00 2001
+From: Alex Gaynor <alex.gaynor@gmail.com>
+Date: Fri, 31 Jul 2026 09:24:53 -0400
+Subject: [PATCH] Don't leak how PKCS#7 encryptedKey decryption failed (#15369)
+
+* Don't leak how PKCS#7 encryptedKey decryption failed
+
+pkcs7_decrypt_der and its PEM and S/MIME variants reported invalid RSA
+PKCS#1 v1.5 padding, a recovered key of the wrong length, and a wrong
+key as three distinct errors, and the middle one disclosed the exact
+recovered length. That is a Bleichenbacher oracle for any caller that
+decrypts untrusted messages. The wrong-length case also returned before
+the AES-CBC pass, so the same distinction was observable by timing,
+proportional to a content size the attacker chooses.
+
+Substitute a random key of the expected length on failure, per RFC 3218,
+and continue down an identical path so that every outcome looks alike.
+
+EnvelopedData still authenticates nothing, so revealing whether
+decryption succeeded remains a CBC padding oracle regardless. That is a
+property of PKCS#7 rather than of this implementation, and is now
+documented instead.
+
+Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
+
+* Cover the non-ValueError path out of encryptedKey decryption
+
+Only a ValueError from unwrapping the key is attacker controlled and so
+deliberately silenced. A private key implemented outside of this library
+can fail in other ways, and those still reach the caller -- but nothing
+exercised that arm, leaving it uncovered.
+
+Add a DummyRSAPrivateKey double whose decrypt() raises a TypeError, and
+tests for each of its methods.
+
+Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
+
+* fix?
+
+* error message
+
+---------
+
+Co-authored-by: Claude Opus 5 <noreply@anthropic.com>
+
+CVE: CVE-2026-69247
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/53fccd93413a8d7f07d6d8999681f27b75cffa3f]
+
+Backport Changes:
+- Dropped the CHANGELOG.rst update because it targets the 50.0.0 release.
+- Adapted DummyRSAPrivateKey to the 46.0.7 RSA abstract API, which lacks
+  NoDigestInfo and __deepcopy__.
+- Added only the RSA tests from tests/test_doubles.py because the older
+  source does not contain the unrelated Ed25519 test double.
+
+(cherry picked from commit 53fccd93413a8d7f07d6d8999681f27b75cffa3f)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ .../primitives/asymmetric/serialization.rst   | 21 +++++
+ docs/spelling_wordlist.txt                    |  1 +
+ src/rust/src/pkcs7.rs                         | 81 +++++++++++--------
+ tests/doubles.py                              | 46 ++++++++++-
+ tests/hazmat/primitives/test_pkcs7.py         | 62 ++++++++++++++
+ tests/test_doubles.py                         | 53 ++++++++++++
+ 6 files changed, 229 insertions(+), 35 deletions(-)
+ create mode 100644 tests/test_doubles.py
+
+diff --git a/docs/hazmat/primitives/asymmetric/serialization.rst b/docs/hazmat/primitives/asymmetric/serialization.rst
+index fb49c7d14..8364131da 100644
+--- a/docs/hazmat/primitives/asymmetric/serialization.rst
++++ b/docs/hazmat/primitives/asymmetric/serialization.rst
+@@ -1436,6 +1436,15 @@ contain certificates, CRLs, and much more. PKCS7 files commonly have a ``p7b``,
+     Deserialize and decrypt a DER-encoded PKCS7 message. PKCS7 (or S/MIME) has multiple versions,
+     but this supports a subset of :rfc:`5751`, also known as S/MIME Version 3.2.
+ 
++    .. warning::
++
++        ``EnvelopedData`` does not authenticate its content. An application
++        that decrypts attacker-supplied messages and reveals whether
++        decryption succeeded -- through an error, a status code, or timing --
++        gives the attacker a CBC padding oracle sufficient to recover the
++        plaintext. This is a property of PKCS#7 and cannot be fixed here,
++        so avoid decrypting untrusted ``EnvelopedData``.
++
+     :param data: The data, encoded in DER format.
+     :type data: bytes
+ 
+@@ -1491,6 +1500,12 @@ contain certificates, CRLs, and much more. PKCS7 files commonly have a ``p7b``,
+     Deserialize and decrypt a PEM-encoded PKCS7E message. PKCS7 (or S/MIME) has multiple versions,
+     but this supports a subset of :rfc:`5751`, also known as S/MIME Version 3.2.
+ 
++    .. warning::
++
++        The padding oracle described in
++        :func:`~cryptography.hazmat.primitives.serialization.pkcs7.pkcs7_decrypt_der`
++        applies equally here.
++
+     :param data: The data, encoded in PEM format.
+     :type data: bytes
+ 
+@@ -1548,6 +1563,12 @@ contain certificates, CRLs, and much more. PKCS7 files commonly have a ``p7b``,
+     Deserialize and decrypt a S/MIME-encoded PKCS7 message. PKCS7 (or S/MIME) has multiple versions,
+     but this supports a subset of :rfc:`5751`, also known as S/MIME Version 3.2.
+ 
++    .. warning::
++
++        The padding oracle described in
++        :func:`~cryptography.hazmat.primitives.serialization.pkcs7.pkcs7_decrypt_der`
++        applies equally here.
++
+     :param data: The data. It should be in S/MIME format, meaning MIME with content type
+         ``application/pkcs7-mime`` or ``application/x-pkcs7-mime``.
+     :type data: bytes
+diff --git a/docs/spelling_wordlist.txt b/docs/spelling_wordlist.txt
+index 831369fe9..956325782 100644
+--- a/docs/spelling_wordlist.txt
++++ b/docs/spelling_wordlist.txt
+@@ -151,6 +151,7 @@ Ubuntu
+ unencrypted
+ unicode
+ unpadded
++untrusted
+ unpadding
+ validator
+ Ventura
+diff --git a/src/rust/src/pkcs7.rs b/src/rust/src/pkcs7.rs
+index 3fb5abf15..dd64c3aff 100644
+--- a/src/rust/src/pkcs7.rs
++++ b/src/rust/src/pkcs7.rs
+@@ -266,27 +266,6 @@ fn decrypt_der<'p>(
+                 }
+             };
+ 
+-            // Raise error when the key encryption algorithm is not RSA
+-            let key = match recipient_info.key_encryption_algorithm.oid() {
+-                &oid::RSA_OID => {
+-                    let padding = types::PKCS1V15.get(py)?.call0()?;
+-                    private_key
+-                        .call_method1(
+-                            pyo3::intern!(py, "decrypt"),
+-                            (recipient_info.encrypted_key, &padding),
+-                        )?
+-                        .extract::<pyo3::pybacked::PyBackedBytes>()?
+-                }
+-                _ => {
+-                    return Err(CryptographyError::from(
+-                        exceptions::UnsupportedAlgorithm::new_err((
+-                            "Only RSA with PKCS #1 v1.5 padding is currently supported for key decryption.",
+-                            exceptions::Reasons::UNSUPPORTED_SERIALIZATION,
+-                        )),
+-                    ));
+-                }
+-            };
+-
+             // The function can decrypt content encrypted with AES-128-CBC, which the S/MIME v3.2
+             // RFC specifies as MUST support, and AES-256-CBC, which is specified as SHOULD+
+             // support. More info: https://datatracker.ietf.org/doc/html/rfc5751#section-2.7
+@@ -294,19 +273,9 @@ fn decrypt_der<'p>(
+             let algorithm_identifier = enveloped_data
+                 .encrypted_content_info
+                 .content_encryption_algorithm;
+-            let (algorithm, mode) = match algorithm_identifier.params {
+-                AlgorithmParameters::Aes128Cbc(iv) => (
+-                    types::AES128.get(py)?.call1((key,))?,
+-                    types::CBC
+-                        .get(py)?
+-                        .call1((pyo3::types::PyBytes::new(py, &iv),))?,
+-                ),
+-                AlgorithmParameters::Aes256Cbc(iv) => (
+-                    types::AES256.get(py)?.call1((key,))?,
+-                    types::CBC
+-                        .get(py)?
+-                        .call1((pyo3::types::PyBytes::new(py, &iv),))?,
+-                ),
++            let (algorithm_type, key_size, iv) = match algorithm_identifier.params {
++                AlgorithmParameters::Aes128Cbc(iv) => (&types::AES128, 16, iv),
++                AlgorithmParameters::Aes256Cbc(iv) => (&types::AES256, 32, iv),
+                 _ => {
+                     return Err(CryptographyError::from(
+                         exceptions::UnsupportedAlgorithm::new_err((
+@@ -317,6 +286,50 @@ fn decrypt_der<'p>(
+                 }
+             };
+ 
++            // Raise error when the key encryption algorithm is not RSA
++            if recipient_info.key_encryption_algorithm.oid() != &oid::RSA_OID {
++                return Err(CryptographyError::from(
++                    exceptions::UnsupportedAlgorithm::new_err((
++                        "Only RSA with PKCS #1 v1.5 padding is currently supported for key decryption.",
++                        exceptions::Reasons::UNSUPPORTED_SERIALIZATION,
++                    )),
++                ));
++            }
++
++            // Unwrap the content encryption key. RFC 3218 requires that a
++            // failure to recover a usable key is not distinguishable from
++            // recovering a key that simply isn't the right one -- otherwise
++            // this becomes a Bleichenbacher oracle for anything that decrypts
++            // attacker-supplied data. We substitute a random key of the
++            // expected size, so that every failure surfaces as the same
++            // content decryption error.
++            let padding = types::PKCS1V15.get(py)?.call0()?;
++            let random_key = crate::backend::rand::get_rand_bytes(py, key_size)?;
++            let key = match private_key.call_method1(
++                pyo3::intern!(py, "decrypt"),
++                (recipient_info.encrypted_key, &padding),
++            ) {
++                Ok(key) => {
++                    let key = key.extract::<pyo3::Bound<'_, pyo3::types::PyBytes>>()?;
++                    if key.as_bytes().len() == key_size {
++                        key
++                    } else {
++                        random_key
++                    }
++                }
++                // A ValueError here is entirely attacker controlled (invalid
++                // padding, or an encrypted key of the wrong length) and must
++                // stay silent. Any other exception reflects a caller mistake
++                // rather than the contents of the message.
++                Err(e) if e.is_instance_of::<pyo3::exceptions::PyValueError>(py) => random_key,
++                Err(e) => return Err(e.into()),
++            };
++
++            let algorithm = algorithm_type.get(py)?.call1((key,))?;
++            let mode = types::CBC
++                .get(py)?
++                .call1((pyo3::types::PyBytes::new(py, &iv),))?;
++
+             // Decrypt the content using the key and proper algorithm
+             let encrypted_content = match enveloped_data.encrypted_content_info.encrypted_content {
+                 Some(content) => content,
+diff --git a/tests/doubles.py b/tests/doubles.py
+index cf2c96a3e..25f1b4c59 100644
+--- a/tests/doubles.py
++++ b/tests/doubles.py
+@@ -2,9 +2,11 @@
+ # 2.0, and the BSD License. See the LICENSE file in the root of this repository
+ # for complete details.
+ 
++from __future__ import annotations
+ 
+ from cryptography.hazmat.primitives import hashes, serialization
+-from cryptography.hazmat.primitives.asymmetric import padding
++from cryptography.hazmat.primitives.asymmetric import padding, rsa
++from cryptography.hazmat.primitives.asymmetric import utils as asym_utils
+ from cryptography.hazmat.primitives.ciphers import (
+     BlockCipherAlgorithm,
+     CipherAlgorithm,
+@@ -53,3 +55,45 @@ class DummyKeySerializationEncryption(
+ 
+ class DummyAsymmetricPadding(padding.AsymmetricPadding):
+     name = "dummy-padding"
++
++
++class DummyRSAPrivateKey(rsa.RSAPrivateKey):
++    """
++    A fake RSAPrivateKey whose decrypt() raises a non-ValueError. Used for
++    testing that a failure originating outside of this library is not
++    mistaken for an attacker controlled decryption failure.
++    """
++
++    def decrypt(
++        self, ciphertext: bytes, padding: padding.AsymmetricPadding
++    ) -> bytes:
++        raise TypeError("TypeError for testing")
++
++    @property
++    def key_size(self) -> int:
++        raise NotImplementedError
++
++    def public_key(self) -> rsa.RSAPublicKey:
++        raise NotImplementedError
++
++    def sign(
++        self,
++        data: bytes,
++        padding: padding.AsymmetricPadding,
++        algorithm: asym_utils.Prehashed | hashes.HashAlgorithm,
++    ) -> bytes:
++        raise NotImplementedError
++
++    def private_numbers(self) -> rsa.RSAPrivateNumbers:
++        raise NotImplementedError
++
++    def private_bytes(
++        self,
++        encoding: serialization.Encoding,
++        format: serialization.PrivateFormat,
++        encryption_algorithm: serialization.KeySerializationEncryption,
++    ) -> bytes:
++        raise NotImplementedError
++
++    def __copy__(self) -> rsa.RSAPrivateKey:
++        raise NotImplementedError
+diff --git a/tests/hazmat/primitives/test_pkcs7.py b/tests/hazmat/primitives/test_pkcs7.py
+index 1496a23e1..87f2bec1a 100644
+--- a/tests/hazmat/primitives/test_pkcs7.py
++++ b/tests/hazmat/primitives/test_pkcs7.py
+@@ -18,6 +18,7 @@ from cryptography.hazmat.primitives import hashes, serialization
+ from cryptography.hazmat.primitives.asymmetric import ed25519, padding, rsa
+ from cryptography.hazmat.primitives.ciphers import algorithms
+ from cryptography.hazmat.primitives.serialization import pkcs7
++from tests.doubles import DummyRSAPrivateKey
+ from tests.x509.test_x509 import _generate_ca_and_leaf
+ 
+ from ...hazmat.primitives.fixtures_rsa import (
+@@ -1406,6 +1407,67 @@ class TestPKCS7Decrypt:
+                 email_message.as_bytes(), certificate, private_key, []
+             )
+ 
++    def test_decrypt_encrypted_key_is_not_an_oracle(
++        self, data, certificate, private_key
++    ):
++        # An attacker who replaces the encryptedKey must not be able to tell
++        # the RSA decryption outcomes apart. Recovering an unusable key, or
++        # failing to recover one at all, has to look exactly like recovering
++        # a key of the right length that simply isn't the right key. See
++        # RFC 3218 and Bleichenbacher's '98 attack.
++        enveloped = (
++            pkcs7.PKCS7EnvelopeBuilder()
++            .set_data(data)
++            .add_recipient(certificate)
++        )
++        der = enveloped.encrypt(serialization.Encoding.DER, [])
++
++        public_key = certificate.public_key()
++        assert isinstance(public_key, rsa.RSAPublicKey)
++
++        # The encryptedKey is the only OCTET STRING in the structure as long
++        # as the RSA modulus, so it can be located by its DER header.
++        key_bytes = public_key.key_size // 8
++        marker = b"\x04\x82" + key_bytes.to_bytes(2, "big")
++        assert der.count(marker) == 1
++        offset = der.index(marker) + len(marker)
++
++        for encrypted_key in [
++            # Invalid PKCS#1 v1.5 padding.
++            b"\x00" * key_bytes,
++            # Valid padding concealing a key of the wrong length.
++            public_key.encrypt(b"A" * 15, padding.PKCS1v15()),
++            public_key.encrypt(b"A" * 17, padding.PKCS1v15()),
++            public_key.encrypt(b"A" * 32, padding.PKCS1v15()),
++            # Valid padding concealing a correctly sized but wrong key.
++            public_key.encrypt(b"A" * 16, padding.PKCS1v15()),
++        ]:
++            tampered = der[:offset] + encrypted_key + der[offset + key_bytes :]
++            try:
++                pkcs7.pkcs7_decrypt_der(tampered, certificate, private_key, [])
++            except ValueError as exc:
++                # Decrypting under a substituted random key leaves plausible
++                # PKCS#7 padding roughly one time in 256, in which case the
++                # caller gets garbage instead of an error. That is equally
++                # uninformative, so it is an acceptable outcome here.
++                assert str(exc) == "Invalid padding bytes."
++
++    def test_decrypt_key_error_is_not_swallowed(self, data, certificate):
++        # Only a ValueError from unwrapping the key is attacker controlled and
++        # therefore silenced. A private key implemented outside this library
++        # can fail in other ways, and those must still reach the caller.
++        enveloped = (
++            pkcs7.PKCS7EnvelopeBuilder()
++            .set_data(data)
++            .add_recipient(certificate)
++            .encrypt(serialization.Encoding.DER, [])
++        )
++
++        with pytest.raises(TypeError, match="TypeError for testing"):
++            pkcs7.pkcs7_decrypt_der(
++                enveloped, certificate, DummyRSAPrivateKey(), []
++            )
++
+ 
+ @pytest.mark.supported(
+     only_if=lambda backend: backend.pkcs7_supported(),
+diff --git a/tests/test_doubles.py b/tests/test_doubles.py
+new file mode 100644
+index 000000000..f52bd3bbf
+--- /dev/null
++++ b/tests/test_doubles.py
+@@ -0,0 +1,53 @@
++# This file is dual licensed under the terms of the Apache License, Version
++# 2.0, and the BSD License. See the LICENSE file in the root of this repository
++# for complete details.
++
++import copy
++
++import pytest
++
++from cryptography.hazmat.primitives import hashes, serialization
++from cryptography.hazmat.primitives.asymmetric import padding
++
++from .doubles import DummyRSAPrivateKey
++
++
++class TestDummyRSAPrivateKey:
++    def test_decrypt(self):
++        key = DummyRSAPrivateKey()
++        with pytest.raises(TypeError):
++            key.decrypt(b"ciphertext", padding.PKCS1v15())
++
++    def test_key_size_not_implemented(self):
++        key = DummyRSAPrivateKey()
++        with pytest.raises(NotImplementedError):
++            key.key_size
++
++    def test_public_key_not_implemented(self):
++        key = DummyRSAPrivateKey()
++        with pytest.raises(NotImplementedError):
++            key.public_key()
++
++    def test_sign_not_implemented(self):
++        key = DummyRSAPrivateKey()
++        with pytest.raises(NotImplementedError):
++            key.sign(b"data", padding.PKCS1v15(), hashes.SHA256())
++
++    def test_private_numbers_not_implemented(self):
++        key = DummyRSAPrivateKey()
++        with pytest.raises(NotImplementedError):
++            key.private_numbers()
++
++    def test_private_bytes_not_implemented(self):
++        key = DummyRSAPrivateKey()
++        with pytest.raises(NotImplementedError):
++            key.private_bytes(
++                serialization.Encoding.PEM,
++                serialization.PrivateFormat.PKCS8,
++                serialization.NoEncryption(),
++            )
++
++    def test_copy_not_implemented(self):
++        key = DummyRSAPrivateKey()
++        with pytest.raises(NotImplementedError):
++            copy.copy(key)
+-- 
+2.35.6
-- 
2.35.6


