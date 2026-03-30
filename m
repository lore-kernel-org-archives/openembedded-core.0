Return-Path: <thond2009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70470F3D5E7
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 08:17:26 +0000 (UTC)
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46691.1774858644464255806
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 01:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: gmail.com, ip: 156.147.23.52, mailfrom: thond2009@gmail.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.52 with ESMTP; 30 Mar 2026 17:17:21 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: thond2009@gmail.com
Received: from unknown (HELO vsl.LGE.NET) (10.218.140.120)
	by 156.147.1.121 with ESMTP; 30 Mar 2026 17:17:21 +0900
X-Original-SENDERIP: 10.218.140.120
X-Original-MAILFROM: thond2009@gmail.com
From: thond2009@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Nguyen Dat Tho <tho3.nguyen@lge.com>
Subject: [scarthgap][PATCHv2] python3-cryptography: Fix CVE-2026-26007
Date: Mon, 30 Mar 2026 17:17:19 +0900
Message-ID: <20260330081719.3290756-1-thond2009@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 08:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234203

From: Nguyen Dat Tho <tho3.nguyen@lge.com>

CVE-2026-26007 is fixed upstream in version 46.0.5.
Our current version (42.0.5, scarthgap) is still reported as vulnerable
by NVD.
Backport the upstream fix to address this CVE.

Upstream commit:
  https://github.com/pyca/cryptography/commit/0eebb9dbb6343d9bc1d91e5a2482ed4e054a6d8c

CVE report:
  https://nvd.nist.gov/vuln/detail/CVE-2026-26007

Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
---
 .../python3-cryptography/CVE-2026-26007.patch | 149 ++++++++++++++++++
 .../python/python3-cryptography_42.0.5.bb     |   1 +
 2 files changed, 150 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-26007.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-2026-26007.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-26007.patch
new file mode 100644
index 0000000000..fb76bbfca3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-26007.patch
@@ -0,0 +1,149 @@
+From 42c914929b52eb16421a4ef1f7e09c8f9fdab7db Mon Sep 17 00:00:00 2001
+From: Paul Kehrer <paul.l.kehrer@gmail.com>
+Date: Wed, 18 Mar 2026 16:01:03 +0900
+Subject: [PATCH] EC check key on cofactor > 1
+
+An attacker could create a malicious public key that reveals portions of
+your private key when using certain uncommon elliptic curves (binary
+curves).  This version now includes additional security checks to
+prevent this attack.  This issue only affects binary elliptic curves,
+which are rarely used in real-world applications. Credit to **XlabAI
+Team of Tencent Xuanwu Lab and Atuin Automated Vulnerability Discovery
+Engine** for reporting the issue.  **CVE-2026-26007**
+
+This is a partial backport of upstream commit
+0eebb9dbb6343d9bc1d91e5a2482ed4e054a6d8c, to only include what's
+relevant for CVE-2026-26007.
+
+CVE: CVE-2026-26007
+
+Origin: backport, https://github.com/pyca/cryptography/commit/0eebb9dbb6343d9bc1d91e5a2482ed4e054a6d8c
+Reference: https://salsa.debian.org/python-team/packages/python-cryptography/-/commit/464e7ca3b0b4493d5906d0c3685de71fda770c59
+
+Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
+Signed-off-by: Paul Kehrer <paul.l.kehrer@gmail.com>
+Co-authored-by: Alex Gaynor <alex.gaynor@gmail.com>
+
+Upstream-Status: Backport [Backport from https://github.com/pyca/cryptography/commit/0eebb9dbb6343d9bc1d91e5a2482ed4e054a6d8c]
+---
+ src/rust/src/backend/ec.rs         | 39 ++++++++++++++++++++----------
+ tests/hazmat/primitives/test_ec.py | 37 ++++++++++++++++++++++++++++
+ 2 files changed, 63 insertions(+), 13 deletions(-)
+
+diff --git a/src/rust/src/backend/ec.rs b/src/rust/src/backend/ec.rs
+index 6a224b49f..27fced086 100644
+--- a/src/rust/src/backend/ec.rs
++++ b/src/rust/src/backend/ec.rs
+@@ -155,12 +155,9 @@ pub(crate) fn public_key_from_pkey(
+ ) -> CryptographyResult<ECPublicKey> {
+     let ec = pkey.ec_key()?;
+     let curve = py_curve_from_curve(py, ec.group())?;
+-    check_key_infinity(&ec)?;
+-    Ok(ECPublicKey {
+-        pkey: pkey.to_owned(),
+-        curve: curve.into(),
+-    })
++    ECPublicKey::new(pkey.to_owned(), curve.into())
+ }
++
+ #[pyo3::prelude::pyfunction]
+ fn generate_private_key(
+     py: pyo3::Python<'_>,
+@@ -215,10 +212,7 @@ fn from_public_bytes(
+     let ec = openssl::ec::EcKey::from_public_key(&curve, &point)?;
+     let pkey = openssl::pkey::PKey::from_ec_key(ec)?;
+ 
+-    Ok(ECPublicKey {
+-        pkey,
+-        curve: py_curve.into(),
+-    })
++    ECPublicKey::new(pkey, py_curve.into())
+ }
+ 
+ #[pyo3::prelude::pymethods]
+@@ -357,6 +351,28 @@ impl ECPrivateKey {
+     }
+ }
+ 
++impl ECPublicKey {
++    fn new(
++        pkey: openssl::pkey::PKey<openssl::pkey::Public>,
++        curve: pyo3::Py<pyo3::PyAny>,
++    ) -> CryptographyResult<ECPublicKey> {
++        let ec = pkey.ec_key()?;
++        check_key_infinity(&ec)?;
++        let mut bn_ctx = openssl::bn::BigNumContext::new()?;
++        let mut cofactor = openssl::bn::BigNum::new()?;
++        ec.group().cofactor(&mut cofactor, &mut bn_ctx)?;
++        let one = openssl::bn::BigNum::from_u32(1)?;
++        if cofactor != one {
++            ec.check_key().map_err(|_| {
++                pyo3::exceptions::PyValueError::new_err(
++                    "Invalid EC key (key out of range, infinity, etc.)",
++                )
++            })?;
++        }
++
++        Ok(ECPublicKey { pkey, curve })
++    }
++}
+ #[pyo3::prelude::pymethods]
+ impl ECPublicKey {
+     #[getter]
+@@ -591,10 +607,7 @@ impl EllipticCurvePublicNumbers {
+ 
+         let pkey = openssl::pkey::PKey::from_ec_key(public_key)?;
+ 
+-        Ok(ECPublicKey {
+-            pkey,
+-            curve: self.curve.clone_ref(py),
+-        })
++        ECPublicKey::new(pkey, self.curve.clone_ref(py))
+     }
+ 
+     fn __eq__(
+diff --git a/tests/hazmat/primitives/test_ec.py b/tests/hazmat/primitives/test_ec.py
+index 334e76dcc..f7f2242f6 100644
+--- a/tests/hazmat/primitives/test_ec.py
++++ b/tests/hazmat/primitives/test_ec.py
+@@ -1340,3 +1340,40 @@ class TestECDH:
+ 
+         with pytest.raises(ValueError):
+             key.exchange(ec.ECDH(), public_key)
++
++
++def test_invalid_sect_public_keys(backend):
++    _skip_curve_unsupported(backend, ec.SECT571K1())
++    public_numbers = ec.EllipticCurvePublicNumbers(1, 1, ec.SECT571K1())
++    with pytest.raises(ValueError):
++        public_numbers.public_key()
++
++    point = binascii.unhexlify(
++        b"0400000000000000000000000000000000000000000000000000000000000000000"
++        b"0000000000000000000000000000000000000000000000000000000000000000000"
++        b"0000000000010000000000000000000000000000000000000000000000000000000"
++        b"0000000000000000000000000000000000000000000000000000000000000000000"
++        b"0000000000000000000001"
++    )
++    with pytest.raises(ValueError):
++        ec.EllipticCurvePublicKey.from_encoded_point(ec.SECT571K1(), point)
++
++    der = binascii.unhexlify(
++        b"3081a7301006072a8648ce3d020106052b810400260381920004000000000000000"
++        b"0000000000000000000000000000000000000000000000000000000000000000000"
++        b"0000000000000000000000000000000000000000000000000000000000000100000"
++        b"0000000000000000000000000000000000000000000000000000000000000000000"
++        b"0000000000000000000000000000000000000000000000000000000000000000000"
++        b"00001"
++    )
++    with pytest.raises(ValueError):
++        serialization.load_der_public_key(der)
++
++    pem = textwrap.dedent("""-----BEGIN PUBLIC KEY-----
++    MIGnMBAGByqGSM49AgEGBSuBBAAmA4GSAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
++    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
++    AAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
++    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAE=
++    -----END PUBLIC KEY-----""").encode()
++    with pytest.raises(ValueError):
++        serialization.load_pem_public_key(pem)
diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
index 732f925d92..c4573fa689 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
@@ -11,6 +11,7 @@ LDSHARED += "-pthread"
 SRC_URI[sha256sum] = "6fe07eec95dfd477eb9530aef5bead34fec819b3aaf6c5bd6d20565da607bfe1"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
+            file://CVE-2026-26007.patch \
             file://check-memfree.py \
             file://run-ptest \
            "

