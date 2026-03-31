Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9568CFF60D8
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 06:57:33 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14329.1774940249292553667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 23:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=H8vKYOJy;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48541edecf9so64542965e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 23:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774940247; x=1775545047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1N6tQ4HehJqWtoMI/L/REbT6mb2hLsImePjVku3M5M=;
        b=H8vKYOJyjWSp2xC35tzQI292Pj3QdUAVkOMqUfYEFKeJTI70WPO7hYLIfCg/Ayixwr
         vBOYk1KVgsgHey7RuJo/f8Xo4ftnY4dh5uaJUh2/rcGJygWdBVjv2Zmo6m3x4yaQw+xA
         og9l2Ho/4FJnOPMgtSx8EZm9fD/T8a086BQB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774940247; x=1775545047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X1N6tQ4HehJqWtoMI/L/REbT6mb2hLsImePjVku3M5M=;
        b=fN/X94w9liyFXANhu6/4BgQoC/hPcs8mk9VnOUVI9TRDTbbuQ8GHYB6JBPby2xg8dr
         AqjJbzRqBA15GUzb0TCR7GCo8oSkVuzYsYP8CoZJ6eMxoT0YeOBmXRBLH/4sAd1C4Ez9
         uEcC0GUN3uErrgQcD/92SEIk2wK9xXScyR21aqVSswCbjM4qiJb1T0SDU16SLev6TLl6
         i5+YuoJPVnVbzfHelzonoBpHv6KF5OI/ABakVQ9rbpkS6jbildJC8Od6kK0Gj22G0Kka
         +pog2Y8bI9RJpsUBzMiLpBA+PliwkoOix0NJ/OPqCehbzBGaCgEOibR/7EIwZiiBYGgD
         /jug==
X-Gm-Message-State: AOJu0YwO3Du1q0tS+DE/Wuk5Jw//2AKQDNpQgR4ZgdUmM5xfwmf79Oj0
	G+VnlHnoh6ZVfF5n/9wEatkXMhvsIHqB0MGpWXSlxXyQNAmaQXx4L5Xz+BBlOLiZp94xeIxBHmC
	frn+vQKs=
X-Gm-Gg: ATEYQzxxvRSQY0e4Dsf26LM+PdcxmMKeTs4jxW3xVqk+Ek1o8jNtiwXgLQyLzLmpWAx
	/hckyGkQ8nCBR/dfeetCc1Xyu5cezdNpf9Pl2anAYwi9hTjEbgqLWX4V+2Lh6Ng/ohILnCNfOCT
	Ej8JK4GUvCi4lme2RLP5fP69CkkV+rI1ghOd7DxKfrJklxUtG9YssieLQ9FG+m1/rKXNuQTpLDu
	lm1fLpEetccdnjLn1pGHx9wBDe5d4mExUANLSiVVU1Fnw2hdM3FVbUpW9nKEdaHbtejTEIFNCT0
	O+zZvT1+8egEi0ZTpIdvRtflMPpBe/RldzJaH4S6342L1tOUOaNSOhI60ZmgdF1+SdacN24aRhF
	lMUTZRXQOQ76iUH8rl44yzDS5J3luRVRIy3p1f1lr4YfmLMQwBKqVZZRXBuL8JwsKIvMmD2jRhl
	u9bCH8azynKtm/SOxorBYMVvxaDbkOrdBMsfPEM5z8YBGgHt1UyMIxDuCCnHADjWMcfUFj1mMAi
	jZx2NmNR5RMZyhY0aYLQXpeMPI=
X-Received: by 2002:a05:600c:8b86:b0:485:3f58:d9f with SMTP id 5b1f17b1804b1-48727f405fbmr257713835e9.30.1774940247235;
        Mon, 30 Mar 2026 23:57:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8a546esm11016455e9.5.2026.03.30.23.57.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:57:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 2/6] python3-cryptography: Fix CVE-2026-26007
Date: Tue, 31 Mar 2026 08:56:59 +0200
Message-ID: <a363958725430237160b0a83a6a6acbe8380fba3.1774939987.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774939987.git.yoann.congal@smile.fr>
References: <cover.1774939987.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 06:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234264

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-cryptography/CVE-2026-26007.patch | 149 ++++++++++++++++++
 .../python/python3-cryptography_42.0.5.bb     |   1 +
 2 files changed, 150 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-26007.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-2026-26007.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-26007.patch
new file mode 100644
index 00000000000..fb76bbfca38
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
index 732f925d926..c4573fa6891 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
@@ -11,6 +11,7 @@ LDSHARED += "-pthread"
 SRC_URI[sha256sum] = "6fe07eec95dfd477eb9530aef5bead34fec819b3aaf6c5bd6d20565da607bfe1"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
+            file://CVE-2026-26007.patch \
             file://check-memfree.py \
             file://run-ptest \
            "

