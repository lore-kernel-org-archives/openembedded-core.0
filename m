Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3FCFF4956
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 07:58:16 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45986.1774857495239678433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 00:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JpGcxF/M;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so2052028f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 00:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774857494; x=1775462294; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9V8RRfLqII2+UrJ1Bv8Hf9BMrfggkF5KRcnFY8jSwo=;
        b=JpGcxF/MsjQNqjXeT+27Lv5sQmDHJciUPZS6PQjCydK2xuVHtTNlfBuRA/FPVuztq+
         N5YTtJauc5rAgakfSt5cYCGHeWBgRiNnYijYkXu/1u9XFX7zy9aJP/K4jI57WpPk5F83
         CLaMDJGn8RDOFQKQoyAC0mjUg8HiGJk+UrIoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857494; x=1775462294;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C9V8RRfLqII2+UrJ1Bv8Hf9BMrfggkF5KRcnFY8jSwo=;
        b=s7CCusFMQWP4Co42BAQ/Keds7hpwTDALtLVC3k5VWRzbXgLcvchzlpdlevOiEyDr2x
         3xyl5SH2L7yjKqzywVploPaxrhrgntrvM7sYmlxS6c8JaJlEZTr3l2gd5MGfVwZtlBJl
         Sto3p/rK2cI0zIaimOxtS4V2O44IgqizDSS5ddBUeH13oqFFRd1+mPI0n4dR10aYnsqu
         TDDlV8FRdMUm6Q/2uAWK6ho0ojDBmbG44N/V7tHuHzsTUDxrJCHtc45TfsGDbCB3sgfV
         kZHGhii4PwjrMq4PF3Flol0bY6JVGnpPQxM0QRVPbnTJJoSoh7fvRwzhqpUbnW6HIpZR
         iVBw==
X-Forwarded-Encrypted: i=1; AJvYcCVddjD/LZGBiB79AUHJMqpu2crP2rCtjIYYmI2CnjVatuIqUXXLvMc+OykRq7ICPKHJHvP/Zo7TVyfvQWW+91GY6A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyzON5Ua9CKP154xht1TPWGCnEU2uvkMrALjuluNvAX/fryAlRb
	8YJClbnYRtT5rjKJ5PPSBsV7OqRd+LwQyQEblmzyVTTLq/1tHnzZP4dIrPvpczb6HPQ=
X-Gm-Gg: ATEYQzxBYoSxd5yLORbWYCK5tHgG4WIJruRRTn7llYVn96uPJsepLZ0Hn7F3MxQtFA9
	g0hQlYiBP7HVDRhBqAYm7ky5On7e2ZYxjjiyqmkOxllEMsasOp1LU7tYPLY2bZOn2sbNxvZDWSa
	1WNZg3Z5q4r1lkDHZ4b53YX8wssvlUEtK9lkpI5MULXzUKAEWd2NgekiaH9aqUnKyC7ir4rqZZi
	+pHGDCV0qHxRLbDQGk1hOVJiX56U+BCqnlf2QZ+qDVHwc15jXG7VGHmvr1UuaocfsBNeK8GphIM
	KgiI2Tlg1yVkGinx/LmPnMLoo5uoGLeoOf+xQOcQNp2KXnTp1hW3K5IrcN3mMdob0d7d+3KXZH7
	Fpb4uhtwF1NfmeMptRz74ebkokQTRkbsWm9d2sDsSnDYOEbqRkpfjwYfWfvPBRPT3HRtBQ2UJQ1
	FrbsJUbanrdQLwTybAPR7/dvZD8cxL0U1F+/yT1drr3alPAqwYIyP2i7oJTCTgkEjwCV3PDHXly
	u2G2D8FsjA=
X-Received: by 2002:a05:6000:228a:b0:43c:fde6:212e with SMTP id ffacd0b85a97d-43cfde62207mr5769530f8f.24.1774857493467;
        Mon, 30 Mar 2026 00:58:13 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21eba4dsm17897838f8f.11.2026.03.30.00.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 00:58:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 09:58:12 +0200
Message-Id: <DHFYGZZDZ2YZ.2UZT8D03BWNPH@smile.fr>
Subject: Re: [OE-core][scarthgap 02/11] python3-cryptography: Fix
 CVE-2026-26007
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Nguyen Dat Tho" <tho3.nguyen@lge.com>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1774824253.git.yoann.congal@smile.fr>
 <80637cd1b9e2045e9f19fb8337704007fef67e41.1774824253.git.yoann.congal@smile.fr>
In-Reply-To: <80637cd1b9e2045e9f19fb8337704007fef67e41.1774824253.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 07:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234202

On Mon Mar 30, 2026 at 12:46 AM CEST, Yoann Congal wrote:
> From: Nguyen Dat Tho <tho3.nguyen@lge.com>
>
> CVE-2026-26007 is fixed upstream in version 46.0.5.
> Our current version (42.0.5, scarthgap) is still reported as vulnerable
> by NVD.
> Backport the upstream fix to address this CVE.
>
> Upstream commit:
>   https://github.com/pyca/cryptography/commit/0eebb9dbb6343d9bc1d91e5a248=
2ed4e054a6d8c
>
> CVE report:
>   https://nvd.nist.gov/vuln/detail/CVE-2026-26007
>
> Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../python3-cryptography/CVE-2026-26007.patch | 149 ++++++++++++++++++
>  .../python/python3-cryptography_42.0.5.bb     |   1 +
>  2 files changed, 150 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE=
-2026-26007.patch
>
> diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-2026-2=
6007.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-260=
07.patch
> new file mode 100644
> index 00000000000..a78d287ccdd
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-26007.pa=
tch
> @@ -0,0 +1,149 @@
> +From 42c914929b52eb16421a4ef1f7e09c8f9fdab7db Mon Sep 17 00:00:00 2001
> +From: Paul Kehrer <paul.l.kehrer@gmail.com>
> +Date: Wed, 18 Mar 2026 16:01:03 +0900
> +Subject: [PATCH] EC check key on cofactor > 1
> +
> +An attacker could create a malicious public key that reveals portions of
> +your private key when using certain uncommon elliptic curves (binary
> +curves).  This version now includes additional security checks to
> +prevent this attack.  This issue only affects binary elliptic curves,
> +which are rarely used in real-world applications. Credit to **XlabAI
> +Team of Tencent Xuanwu Lab and Atuin Automated Vulnerability Discovery
> +Engine** for reporting the issue.  **CVE-2026-26007**
> +
> +This is a partial backport of upstream commit
> +0eebb9dbb6343d9bc1d91e5a2482ed4e054a6d8c, to only include what's
> +relevant for CVE-2026-26007.
> +
> +CVE: CVE-2026-26007
> +
> +Origin: backport, https://github.com/pyca/cryptography/commit/0eebb9dbb6=
343d9bc1d91e5a2482ed4e054a6d8c
> +Reference: https://salsa.debian.org/python-team/packages/python-cryptogr=
aphy/-/commit/464e7ca3b0b4493d5906d0c3685de71fda770c59
> +
> +Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
> +Signed-off-by: Paul Kehrer <paul.l.kehrer@gmail.com>
> +Co-authored-by: Alex Gaynor <alex.gaynor@gmail.com>
> +---
> +Upstream-Status: Backport [Backport from https://github.com/pyca/cryptog=
raphy/commit/0eebb9dbb6343d9bc1d91e5a2482ed4e054a6d8c]

Tho, (I hope this is the proper way to address you, if not, sorry!)

This "Upstream-Status:" after the "---" triggers a patchtest failure:
  FAIL: test Upstream-Status presence: Upstream-Status is present only
  after the patch scissors. It must be placed in the patch header before
  the scissors line.
  (test_patch.TestPatch.test_upstream_status_presence_format)

This is very minor for stables where a patch rebase following an upgrade
is a very rare event.
But, that said, if you can send a v2 patch with the "Upstream-Status"
above the "---", I'll take it.

As a side note: this particular patchtest test is not in scarthgap
patchtech, I'll try to backport it.

Thanks!

> +
> + src/rust/src/backend/ec.rs         | 39 ++++++++++++++++++++----------
> + tests/hazmat/primitives/test_ec.py | 37 ++++++++++++++++++++++++++++
> + 2 files changed, 63 insertions(+), 13 deletions(-)
> +
> +diff --git a/src/rust/src/backend/ec.rs b/src/rust/src/backend/ec.rs
> +index 6a224b49f..27fced086 100644
> +--- a/src/rust/src/backend/ec.rs
> ++++ b/src/rust/src/backend/ec.rs
> +@@ -155,12 +155,9 @@ pub(crate) fn public_key_from_pkey(
> + ) -> CryptographyResult<ECPublicKey> {
> +     let ec =3D pkey.ec_key()?;
> +     let curve =3D py_curve_from_curve(py, ec.group())?;
> +-    check_key_infinity(&ec)?;
> +-    Ok(ECPublicKey {
> +-        pkey: pkey.to_owned(),
> +-        curve: curve.into(),
> +-    })
> ++    ECPublicKey::new(pkey.to_owned(), curve.into())
> + }
> ++
> + #[pyo3::prelude::pyfunction]
> + fn generate_private_key(
> +     py: pyo3::Python<'_>,
> +@@ -215,10 +212,7 @@ fn from_public_bytes(
> +     let ec =3D openssl::ec::EcKey::from_public_key(&curve, &point)?;
> +     let pkey =3D openssl::pkey::PKey::from_ec_key(ec)?;
> +=20
> +-    Ok(ECPublicKey {
> +-        pkey,
> +-        curve: py_curve.into(),
> +-    })
> ++    ECPublicKey::new(pkey, py_curve.into())
> + }
> +=20
> + #[pyo3::prelude::pymethods]
> +@@ -357,6 +351,28 @@ impl ECPrivateKey {
> +     }
> + }
> +=20
> ++impl ECPublicKey {
> ++    fn new(
> ++        pkey: openssl::pkey::PKey<openssl::pkey::Public>,
> ++        curve: pyo3::Py<pyo3::PyAny>,
> ++    ) -> CryptographyResult<ECPublicKey> {
> ++        let ec =3D pkey.ec_key()?;
> ++        check_key_infinity(&ec)?;
> ++        let mut bn_ctx =3D openssl::bn::BigNumContext::new()?;
> ++        let mut cofactor =3D openssl::bn::BigNum::new()?;
> ++        ec.group().cofactor(&mut cofactor, &mut bn_ctx)?;
> ++        let one =3D openssl::bn::BigNum::from_u32(1)?;
> ++        if cofactor !=3D one {
> ++            ec.check_key().map_err(|_| {
> ++                pyo3::exceptions::PyValueError::new_err(
> ++                    "Invalid EC key (key out of range, infinity, etc.)"=
,
> ++                )
> ++            })?;
> ++        }
> ++
> ++        Ok(ECPublicKey { pkey, curve })
> ++    }
> ++}
> + #[pyo3::prelude::pymethods]
> + impl ECPublicKey {
> +     #[getter]
> +@@ -591,10 +607,7 @@ impl EllipticCurvePublicNumbers {
> +=20
> +         let pkey =3D openssl::pkey::PKey::from_ec_key(public_key)?;
> +=20
> +-        Ok(ECPublicKey {
> +-            pkey,
> +-            curve: self.curve.clone_ref(py),
> +-        })
> ++        ECPublicKey::new(pkey, self.curve.clone_ref(py))
> +     }
> +=20
> +     fn __eq__(
> +diff --git a/tests/hazmat/primitives/test_ec.py b/tests/hazmat/primitive=
s/test_ec.py
> +index 334e76dcc..f7f2242f6 100644
> +--- a/tests/hazmat/primitives/test_ec.py
> ++++ b/tests/hazmat/primitives/test_ec.py
> +@@ -1340,3 +1340,40 @@ class TestECDH:
> +=20
> +         with pytest.raises(ValueError):
> +             key.exchange(ec.ECDH(), public_key)
> ++
> ++
> ++def test_invalid_sect_public_keys(backend):
> ++    _skip_curve_unsupported(backend, ec.SECT571K1())
> ++    public_numbers =3D ec.EllipticCurvePublicNumbers(1, 1, ec.SECT571K1=
())
> ++    with pytest.raises(ValueError):
> ++        public_numbers.public_key()
> ++
> ++    point =3D binascii.unhexlify(
> ++        b"0400000000000000000000000000000000000000000000000000000000000=
000000"
> ++        b"0000000000000000000000000000000000000000000000000000000000000=
000000"
> ++        b"0000000000010000000000000000000000000000000000000000000000000=
000000"
> ++        b"0000000000000000000000000000000000000000000000000000000000000=
000000"
> ++        b"0000000000000000000001"
> ++    )
> ++    with pytest.raises(ValueError):
> ++        ec.EllipticCurvePublicKey.from_encoded_point(ec.SECT571K1(), po=
int)
> ++
> ++    der =3D binascii.unhexlify(
> ++        b"3081a7301006072a8648ce3d020106052b810400260381920004000000000=
000000"
> ++        b"0000000000000000000000000000000000000000000000000000000000000=
000000"
> ++        b"0000000000000000000000000000000000000000000000000000000000000=
100000"
> ++        b"0000000000000000000000000000000000000000000000000000000000000=
000000"
> ++        b"0000000000000000000000000000000000000000000000000000000000000=
000000"
> ++        b"00001"
> ++    )
> ++    with pytest.raises(ValueError):
> ++        serialization.load_der_public_key(der)
> ++
> ++    pem =3D textwrap.dedent("""-----BEGIN PUBLIC KEY-----
> ++    MIGnMBAGByqGSM49AgEGBSuBBAAmA4GSAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
> ++    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
> ++    AAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
> ++    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAE=3D
> ++    -----END PUBLIC KEY-----""").encode()
> ++    with pytest.raises(ValueError):
> ++        serialization.load_pem_public_key(pem)
> diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb =
b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
> index 732f925d926..c4573fa6891 100644
> --- a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
> @@ -11,6 +11,7 @@ LDSHARED +=3D "-pthread"
>  SRC_URI[sha256sum] =3D "6fe07eec95dfd477eb9530aef5bead34fec819b3aaf6c5bd=
6d20565da607bfe1"
> =20
>  SRC_URI +=3D "file://0001-pyproject.toml-remove-benchmark-disable-option=
.patch \
> +            file://CVE-2026-26007.patch \
>              file://check-memfree.py \
>              file://run-ptest \
>             "


--=20
Yoann Congal
Smile ECS


