Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EEBCD6E49
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 22:46:04 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15809.1780181153312546289
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 May 2026 15:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fZmSZBoD;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa6792e7b8so210699e87.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 15:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780181151; cv=none;
        d=google.com; s=arc-20240605;
        b=QumX9sjqFwINe5W+5t7n3LNqQHVLwq+VzTSJwIrlC2CM5DGRiRIHPefAq549TQEpjm
         q0BfOn7lYjtS9WM1w8asQvJIEcu/JrFWRl+i5pvZ6I3anwwQrKSye7434sTBhinNz0qU
         VkoAp6GU/C/6nLAq+eiyvAnSlrBNShOkQvHRwUHiZP8oTaZfZT0VEzlepr5fn1DbYM1H
         S8KR60u7Ts+anbEA43l5P4bFxCJYMtObwoWVv6urt/f9WUwCoYx7zTs7e7gaTjt3HbYO
         rhf29K32WXMdGvW/fYYo0jNlK9XdM7uhw0UCd9/Md7O4b5pqavr/NRujWiDizyA//8xB
         v2sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PnKCgfOrVMEEwLl3/Zc6Nngv8hFzArbhEyS1rYzeK18=;
        fh=r2HniydW6rAF8eOyyIsBLfvKd1mq7Lta9RXtVye45zM=;
        b=e8lElcGN3s1rAdNIF7S7EHVheOxVYwN41RNu97nsIpWVAUHCddkflp3ONk3bD89sCl
         WxmahSrvAfHohYE+p9LX2ngK52jlymEnkOH5f265t7UEzsQOSblyX2XcbZfGqanBs4Xy
         VMp+8s/c/55qz5/LbUuRL+oCSiekzehKriQ9wNoQ6b/FZeQL1+RJ6JM/9wRBGKUhSmwc
         WK/fjrlu9JsWKOWfBjukQik/GTcwSP6gWtyOlsDc3xurQSv+EazEDxgomeiNpTbbffo2
         1wg7Pos6UDq/6yzEqTP1YSabFYqahIt5iUDAZl0PRmhbjYzeCDBLQ2ShXqfw9PeZlvDi
         4WkQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780181151; x=1780785951; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PnKCgfOrVMEEwLl3/Zc6Nngv8hFzArbhEyS1rYzeK18=;
        b=fZmSZBoD2atvrFg8FvDXnohGbZFviPL9Z0MjOR718/YP5XZxll21op0Zay8rZgoudr
         JtzMqynX1wwqzr52/yLIqZeoOzgrdtTehNBtPJPllX8UBENf0nlKJM3OvTYm6fV0BVcF
         byaPMS7j/AI8nqpx/ZBJ26GPbTze5cpMOEhyfSjLKrDNWAwEF3KKIc4frhassrH3EBS7
         CRUexIF+BVmIbi+EWZjd8FteBVFO9sxBLehZ2imKkLXVvPlB58SeTIr1/IhaLC+55aIw
         oauSrr3HUwkff6+e8tyrmjbDpmppPLgkClR2IEeuchkTuDH/Ew2g7iLDPqKIBPZwaQwz
         sFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780181151; x=1780785951;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnKCgfOrVMEEwLl3/Zc6Nngv8hFzArbhEyS1rYzeK18=;
        b=jBIAPyNMEataPyqjw31weCa7u0/JTBAB0hs1AFZmbBsCXHL0FjgbrDOEfrNx4WyCJh
         wCYNA0Bd+Vwp7s84AK0kdj5NuzV3i2t5qdBMrHA0U5wvJtiBaQYQUBx1TLSg/E/x/JRU
         3MPdOMoi1ZqWt80fR2LWtX4vFKkOBW0jZ/4LraR5610TqDLEfnx902roo2eDoUAG8YbE
         8SIXNlhcrSyyrhJAyCBtTcElq7mtc9yt6hHoAQIwuYy7LlFAZ+gylbUk34S/e0fkrzbD
         5dc4sVdsHZc9+2JHPpLP8t6Km0o/a2i/FHhYBxja4FzsfJG8FahqA38nI1EaJgVrFt1p
         vbBA==
X-Gm-Message-State: AOJu0YzkGjhkpkL7rNSutLCy2t9aigtmfdk50qOK3Au7wf3QdMQHn26M
	H6zcpQcBgLe/TKVCQP7cBiV73HP7uYZ4XnaFDR7dqOGS0uxl7zea06gTX/Y3ov0Y2XWB83c5pL7
	p0sFYkeOx7RIR+irv7LsNFvqZbusBbek=
X-Gm-Gg: Acq92OHXYREzcdXJZZP3jmpcLmaUy7XBtMFsBHG5mNLs4r6p1aowiGkHaulRLsdeuhV
	qMCbnLUP/p3TOeSTjC/7Cbr3zLKBCfvs+ohQVFytJorcpZOnfMndY2jUqGKZ4mzXVvexImvgdky
	v4wDRy0Kd2YXffTPPf2rC/D8OrS5bshA1xUVRD5KK6dgnMZxS57GNl53gPfmpBSStPU6gNYTw1I
	iMHzkOJUk18qOlp46cTReC4Srb2Gv/K4n297pdmyRszHRmQhc1MEE5L5YtcVU1dC4p/OKFyTuzJ
	RGbU6jn8B89jDem/ADnL5Vmsb+ZG
X-Received: by 2002:a05:6512:40d0:10b0:5aa:5d04:b4bc with SMTP id
 2adb3069b0e04-5aa6091a2damr959110e87.32.1780181150552; Sat, 30 May 2026
 15:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260530224301.1456167-1-tim.orling@konsulko.com> <20260530224301.1456167-4-tim.orling@konsulko.com>
In-Reply-To: <20260530224301.1456167-4-tim.orling@konsulko.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 30 May 2026 15:45:38 -0700
X-Gm-Features: AVHnY4KZPX4snB9Mce93hq5eNUZv9a11FxtnA5TOXp-jJjvKmmIjqqGB16mGVvI
Message-ID: <CANx9H-ARDom2Ksrj8OaCZ7zQDb71s5V9gg5c6LB1Z8xbtKoZTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] python3-cryptography{-vectors}: upgrade
 46.0.7 -> 48.0.0
To: tim.orling@konsulko.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001d561b065310b93c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 22:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237779

--0000000000001d561b065310b93c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ptests pass on qemux86-64 core-image-ptest-python3-cryptography:
Testsuite summary
# TOTAL: 4330
# PASS: 4132
# SKIP: 198
# XFAIL: 0
# FAIL: 0
# XPASS: 0
# ERROR: 0
DURATION: 33
END: /usr/lib/python3-cryptography/ptest
2026-05-30T22:36
STOP: ptest-runner
TOTAL: 1 FAIL: 0

On Sat, May 30, 2026 at 3:43=E2=80=AFPM Tim Orling via lists.openembedded.o=
rg
<tim.orling=3Dkonsulko.com@lists.openembedded.org> wrote:

> From: Tim Orling <tim.orling@konsulko.com>
>
> * Drop 0001-bump-uv_build-to-0.11.0.patch; change is included in upgrade.
> * Refresh python3-crytpography-crates.inc
>
> 48.0.0 - 2026-05-04 [1]
> * BACKWARDS INCOMPATIBLE: Support for Python 3.8 has been removed.
>   cryptography now requires Python 3.9 or later.
>
> * BACKWARDS INCOMPATIBLE: Loading an X.509 CRL whose inner
>   TBSCertList.signature algorithm does not match the outer
>   signatureAlgorithm now raises ValueError. Previously, such CRLs
>   were parsed successfully and only rejected during signature validation.
>
> * Added support for ML-KEM key encapsulation and ML-DSA signing when
>   using OpenSSL 3.5.0 or later, in addition to the existing AWS-LC and
>   BoringSSL support. This means post-quantum algorithms are now available
>   to users of our wheels.
>
>   - Note: Going forward, we do not guarantee that all functionality in
>     cryptography will be available when building against OpenSSL. See
>     The State of OpenSSL for pyca/cryptography for more information.
>
> 47.0.0 - 2026-04-24 [2]
> * Support for Python 3.8 is deprecated and will be removed in the next
>   cryptography release.
>
> * BACKWARDS INCOMPATIBLE: Support for binary elliptic curves
>   (SECT* classes) has been removed. These curves are rarely used and
>   have additional security considerations that make them undesirable.
>
> * BACKWARDS INCOMPATIBLE: Support for OpenSSL 1.1.x has been removed.
>   OpenSSL 3.0.0 or later is now required. LibreSSL, BoringSSL, and
>   AWS-LC continue to be supported.
>
> * BACKWARDS INCOMPATIBLE: Dropped support for LibreSSL < 4.1.
>
> * BACKWARDS INCOMPATIBLE: Loading keys with unsupported algorithms or
>   keys with unsupported explicit curve encodings now raises
>   UnsupportedAlgorithm instead of ValueError. This change affects
>   load_pem_private_key(), load_der_private_key(), load_pem_public_key(),
>   load_der_public_key(), and public_key() when called on certificates
>   with unsupported public key algorithms.
>
> * BACKWARDS INCOMPATIBLE: When parsing elliptic curve private keys, we
>   now reject keys that incorrectly encode a private key of the wrong
>   length because such keys are impossible to process in a constant-time
>   manner. We do not believe keys with this problem are in wide use,
>   however we may revert this change based on the feedback we receive.
>
> * Deprecated passing 64-bit (8-byte) and 128-bit (16-byte) keys to
>   TripleDES. In a future release, only 192-bit (24-byte) keys will be
>   accepted. Users should expand shorter keys themselves (e.g., for
>   single DES: key + key + key, for two-key: key + key[:8]).
>
> See [2] for the rest of 47.0.0 changes.
>
> For full comparison of changes, see [3].
>
> [1] https://cryptography.io/en/latest/changelog/#v48-0-0
> [2] https://cryptography.io/en/latest/changelog/#v47-0-0
> [3] https://github.com/pyca/cryptography/compare/46.0.7...48.0.0
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  .../python/python3-cryptography-common.inc    |   2 +-
>  .../python/python3-cryptography-crates.inc    | 108 ++++++++----------
>  .../python/python3-cryptography-vectors.bb    |   7 +-
>  .../0001-bump-uv_build-to-0.11.0.patch        |  26 -----
>  .../python/python3-cryptography.bb            |   2 +-
>  5 files changed, 54 insertions(+), 91 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_bu=
ild-to-0.11.0.patch
>
> diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc
> b/meta/recipes-devtools/python/python3-cryptography-common.inc
> index 0515cf7705..77d9781688 100644
> --- a/meta/recipes-devtools/python/python3-cryptography-common.inc
> +++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
> @@ -3,4 +3,4 @@
>  #
>  # Additionally AUH will detect that they share this .inc file and
>  # perform a lockstep upgrade for both.
> -PV =3D "46.0.7"
> +PV =3D "48.0.0"
> diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc
> b/meta/recipes-devtools/python/python3-cryptography-crates.inc
> index 6e3667eef1..0301b1f49c 100644
> --- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
> +++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
> @@ -2,77 +2,69 @@
>
>  # from Cargo.lock
>  SRC_URI +=3D " \
> -    crate://crates.io/asn1/0.22.0 \
> -    crate://crates.io/asn1_derive/0.22.0 \
> -    crate://crates.io/autocfg/1.5.0 \
> +    crate://crates.io/asn1/0.24.1 \
> +    crate://crates.io/asn1_derive/0.24.1 \
>      crate://crates.io/base64/0.22.1 \
> -    crate://crates.io/bitflags/2.9.4 \
> -    crate://crates.io/cc/1.2.37 \
> -    crate://crates.io/cfg-if/1.0.3 \
> -    crate://crates.io/find-msvc-tools/0.1.1 \
> +    crate://crates.io/bitflags/2.11.1 \
> +    crate://crates.io/cc/1.2.61 \
> +    crate://crates.io/cfg-if/1.0.4 \
> +    crate://crates.io/find-msvc-tools/0.1.9 \
>      crate://crates.io/foreign-types/0.3.2 \
>      crate://crates.io/foreign-types-shared/0.1.1 \
>      crate://crates.io/heck/0.5.0 \
> -    crate://crates.io/indoc/2.0.6 \
> -    crate://crates.io/itoa/1.0.15 \
> -    crate://crates.io/libc/0.2.175 \
> -    crate://crates.io/memoffset/0.9.1 \
> -    crate://crates.io/once_cell/1.21.3 \
> -    crate://crates.io/openssl/0.10.74 \
> +    crate://crates.io/itoa/1.0.18 \
> +    crate://crates.io/libc/0.2.186 \
> +    crate://crates.io/once_cell/1.21.4 \
> +    crate://crates.io/openssl/0.10.79 \
>      crate://crates.io/openssl-macros/0.1.1 \
> -    crate://crates.io/openssl-sys/0.9.110 \
> -    crate://crates.io/pem/3.0.5 \
> -    crate://crates.io/pkg-config/0.3.32 \
> -    crate://crates.io/portable-atomic/1.11.1 \
> -    crate://crates.io/proc-macro2/1.0.101 \
> -    crate://crates.io/pyo3/0.26.0 \
> -    crate://crates.io/pyo3-build-config/0.26.0 \
> -    crate://crates.io/pyo3-ffi/0.26.0 \
> -    crate://crates.io/pyo3-macros/0.26.0 \
> -    crate://crates.io/pyo3-macros-backend/0.26.0 \
> -    crate://crates.io/quote/1.0.40 \
> -    crate://crates.io/self_cell/1.2.0 \
> +    crate://crates.io/openssl-sys/0.9.115 \
> +    crate://crates.io/pem/3.0.6 \
> +    crate://crates.io/pkg-config/0.3.33 \
> +    crate://crates.io/portable-atomic/1.13.1 \
> +    crate://crates.io/proc-macro2/1.0.106 \
> +    crate://crates.io/pyo3/0.28.3 \
> +    crate://crates.io/pyo3-build-config/0.28.3 \
> +    crate://crates.io/pyo3-ffi/0.28.3 \
> +    crate://crates.io/pyo3-macros/0.28.3 \
> +    crate://crates.io/pyo3-macros-backend/0.28.3 \
> +    crate://crates.io/quote/1.0.45 \
> +    crate://crates.io/self_cell/1.2.2 \
>      crate://crates.io/shlex/1.3.0 \
> -    crate://crates.io/syn/2.0.106 \
> -    crate://crates.io/target-lexicon/0.13.3 \
> -    crate://crates.io/unicode-ident/1.0.19 \
> -    crate://crates.io/unindent/0.2.4 \
> +    crate://crates.io/syn/2.0.117 \
> +    crate://crates.io/target-lexicon/0.13.5 \
> +    crate://crates.io/unicode-ident/1.0.24 \
>      crate://crates.io/vcpkg/0.2.15 \
>  "
>
> -SRC_URI[asn1-0.22.0.sha256sum] =3D
> "df42c2b01c5e1060b8281f67b4e5fb858260694916a667345a7305cd11e5dbfa"
> -SRC_URI[asn1_derive-0.22.0.sha256sum] =3D
> "cdccf849b54365e3693e9a90ad36e4482b79937e6373ac8e2cf229c985187b21"
> -SRC_URI[autocfg-1.5.0.sha256sum] =3D
> "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
> +SRC_URI[asn1-0.24.1.sha256sum] =3D
> "c9795210620c0cb3f9a7ce4f882808c38e1ef7b347c90591dceae0886e031fb1"
> +SRC_URI[asn1_derive-0.24.1.sha256sum] =3D
> "909e307f1cc32bb8bccbd98f446e6d1bf03fa30f7b53a4337da7181ad30fa11a"
>  SRC_URI[base64-0.22.1.sha256sum] =3D
> "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
> -SRC_URI[bitflags-2.9.4.sha256sum] =3D
> "2261d10cca569e4643e526d8dc2e62e433cc8aba21ab764233731f8d369bf394"
> -SRC_URI[cc-1.2.37.sha256sum] =3D
> "65193589c6404eb80b450d618eaf9a2cafaaafd57ecce47370519ef674a7bd44"
> -SRC_URI[cfg-if-1.0.3.sha256sum] =3D
> "2fd1289c04a9ea8cb22300a459a72a385d7c73d3259e2ed7dcb2af674838cfa9"
> -SRC_URI[find-msvc-tools-0.1.1.sha256sum] =3D
> "7fd99930f64d146689264c637b5af2f0233a933bef0d8570e2526bf9e083192d"
> +SRC_URI[bitflags-2.11.1.sha256sum] =3D
> "c4512299f36f043ab09a583e57bceb5a5aab7a73db1805848e8fef3c9e8c78b3"
> +SRC_URI[cc-1.2.61.sha256sum] =3D
> "d16d90359e986641506914ba71350897565610e87ce0ad9e6f28569db3dd5c6d"
> +SRC_URI[cfg-if-1.0.4.sha256sum] =3D
> "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
> +SRC_URI[find-msvc-tools-0.1.9.sha256sum] =3D
> "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
>  SRC_URI[foreign-types-0.3.2.sha256sum] =3D
> "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
>  SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D
> "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
>  SRC_URI[heck-0.5.0.sha256sum] =3D
> "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
> -SRC_URI[indoc-2.0.6.sha256sum] =3D
> "f4c7245a08504955605670dbf141fceab975f15ca21570696aebe9d2e71576bd"
> -SRC_URI[itoa-1.0.15.sha256sum] =3D
> "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
> -SRC_URI[libc-0.2.175.sha256sum] =3D
> "6a82ae493e598baaea5209805c49bbf2ea7de956d50d7da0da1164f9c6d28543"
> -SRC_URI[memoffset-0.9.1.sha256sum] =3D
> "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
> -SRC_URI[once_cell-1.21.3.sha256sum] =3D
> "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
> -SRC_URI[openssl-0.10.74.sha256sum] =3D
> "24ad14dd45412269e1a30f52ad8f0664f0f4f4a89ee8fe28c3b3527021ebb654"
> +SRC_URI[itoa-1.0.18.sha256sum] =3D
> "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
> +SRC_URI[libc-0.2.186.sha256sum] =3D
> "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
> +SRC_URI[once_cell-1.21.4.sha256sum] =3D
> "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
> +SRC_URI[openssl-0.10.79.sha256sum] =3D
> "bf0b434746ee2832f4f0baf10137e1cabb18cbe6912c69e2e33263c45250f542"
>  SRC_URI[openssl-macros-0.1.1.sha256sum] =3D
> "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
> -SRC_URI[openssl-sys-0.9.110.sha256sum] =3D
> "0a9f0075ba3c21b09f8e8b2026584b1d18d49388648f2fbbf3c97ea8deced8e2"
> -SRC_URI[pem-3.0.5.sha256sum] =3D
> "38af38e8470ac9dee3ce1bae1af9c1671fffc44ddfd8bd1d0a3445bf349a8ef3"
> -SRC_URI[pkg-config-0.3.32.sha256sum] =3D
> "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
> -SRC_URI[portable-atomic-1.11.1.sha256sum] =3D
> "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
> -SRC_URI[proc-macro2-1.0.101.sha256sum] =3D
> "89ae43fd86e4158d6db51ad8e2b80f313af9cc74f5c0e03ccb87de09998732de"
> -SRC_URI[pyo3-0.26.0.sha256sum] =3D
> "7ba0117f4212101ee6544044dae45abe1083d30ce7b29c4b5cbdfa2354e07383"
> -SRC_URI[pyo3-build-config-0.26.0.sha256sum] =3D
> "4fc6ddaf24947d12a9aa31ac65431fb1b851b8f4365426e182901eabfb87df5f"
> -SRC_URI[pyo3-ffi-0.26.0.sha256sum] =3D
> "025474d3928738efb38ac36d4744a74a400c901c7596199e20e45d98eb194105"
> -SRC_URI[pyo3-macros-0.26.0.sha256sum] =3D
> "2e64eb489f22fe1c95911b77c44cc41e7c19f3082fc81cce90f657cdc42ffded"
> -SRC_URI[pyo3-macros-backend-0.26.0.sha256sum] =3D
> "100246c0ecf400b475341b8455a9213344569af29a3c841d29270e53102e0fcf"
> -SRC_URI[quote-1.0.40.sha256sum] =3D
> "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
> -SRC_URI[self_cell-1.2.0.sha256sum] =3D
> "0f7d95a54511e0c7be3f51e8867aa8cf35148d7b9445d44de2f943e2b206e749"
> +SRC_URI[openssl-sys-0.9.115.sha256sum] =3D
> "158fe5b292746440aa6e7a7e690e55aeb72d41505e2804c23c6973ad0e9c9781"
> +SRC_URI[pem-3.0.6.sha256sum] =3D
> "1d30c53c26bc5b31a98cd02d20f25a7c8567146caf63ed593a9d87b2775291be"
> +SRC_URI[pkg-config-0.3.33.sha256sum] =3D
> "19f132c84eca552bf34cab8ec81f1c1dcc229b811638f9d283dceabe58c5569e"
> +SRC_URI[portable-atomic-1.13.1.sha256sum] =3D
> "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
> +SRC_URI[proc-macro2-1.0.106.sha256sum] =3D
> "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
> +SRC_URI[pyo3-0.28.3.sha256sum] =3D
> "91fd8e38a3b50ed1167fb981cd6fd60147e091784c427b8f7183a7ee32c31c12"
> +SRC_URI[pyo3-build-config-0.28.3.sha256sum] =3D
> "e368e7ddfdeb98c9bca7f8383be1648fd84ab466bf2bc015e94008db6d35611e"
> +SRC_URI[pyo3-ffi-0.28.3.sha256sum] =3D
> "7f29e10af80b1f7ccaf7f69eace800a03ecd13e883acfacc1e5d0988605f651e"
> +SRC_URI[pyo3-macros-0.28.3.sha256sum] =3D
> "df6e520eff47c45997d2fc7dd8214b25dd1310918bbb2642156ef66a67f29813"
> +SRC_URI[pyo3-macros-backend-0.28.3.sha256sum] =3D
> "c4cdc218d835738f81c2338f822078af45b4afdf8b2e33cbb5916f108b813acb"
> +SRC_URI[quote-1.0.45.sha256sum] =3D
> "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
> +SRC_URI[self_cell-1.2.2.sha256sum] =3D
> "b12e76d157a900eb52e81bc6e9f3069344290341720e9178cde2407113ac8d89"
>  SRC_URI[shlex-1.3.0.sha256sum] =3D
> "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
> -SRC_URI[syn-2.0.106.sha256sum] =3D
> "ede7c438028d4436d71104916910f5bb611972c5cfd7f89b8300a8186e6fada6"
> -SRC_URI[target-lexicon-0.13.3.sha256sum] =3D
> "df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c"
> -SRC_URI[unicode-ident-1.0.19.sha256sum] =3D
> "f63a545481291138910575129486daeaf8ac54aee4387fe7906919f7830c7d9d"
> -SRC_URI[unindent-0.2.4.sha256sum] =3D
> "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
> +SRC_URI[syn-2.0.117.sha256sum] =3D
> "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
> +SRC_URI[target-lexicon-0.13.5.sha256sum] =3D
> "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
> +SRC_URI[unicode-ident-1.0.24.sha256sum] =3D
> "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
>  SRC_URI[vcpkg-0.2.15.sha256sum] =3D
> "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
> diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
> b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
> index 0d2b638527..6abb727915 100644
> --- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
> @@ -9,13 +9,10 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab91511e4 \
>  # NOTE: Make sure to keep this recipe at the same version as
> python3-cryptography
>  #       Upgrade both recipes at the same time
>  require python3-cryptography-common.inc
> -SRC_URI +=3D "file://0001-bump-uv_build-to-0.11.0.patch"
> -SRC_URI[sha256sum] =3D
> "08f3d13846fdd86d4c1138a88c695cee203b3dd3825c784d64a3b06d000cdda1"
> +SRC_URI[sha256sum] =3D
> "69836f597ddfbe3920b3c90d1f18e5560973f0791b90e1921ad345e8111ac23e"
>
>  PYPI_PACKAGE =3D "cryptography_vectors"
>
> -DEPENDS +=3D "python3-uv-build-native"
> -
> -inherit pypi python_flit_core
> +inherit pypi python_uv_build
>
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git
> a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_=
build-to-0.11.0.patch
> b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_=
build-to-0.11.0.patch
> deleted file mode 100644
> index 05f225de2f..0000000000
> ---
> a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_=
build-to-0.11.0.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From b1e8722ccf79ef02ae929df2e7fd7547e8615e68 Mon Sep 17 00:00:00 2001
> -From: Wang Mingyu <wangmy@fujitsu.com>
> -Date: Wed, 22 Apr 2026 10:09:16 +0000
> -Subject: [PATCH] bump uv_build to 0.11.0
> -
> -Upstream-Status: Backport [
> https://github.com/pyca/cryptography/pull/14545]
> -
> -Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ----
> - pyproject.toml | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/pyproject.toml b/pyproject.toml
> -index eac1a07..6bc8d46 100644
> ---- a/pyproject.toml
> -+++ b/pyproject.toml
> -@@ -1,5 +1,5 @@
> - [build-system]
> --requires =3D ["uv_build>=3D0.7.19,<0.9.0"]
> -+requires =3D ["uv_build>=3D0.7.19,<0.12.0"]
> - build-backend =3D "uv_build"
> -
> - [project]
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-devtools/python/python3-cryptography.bb
> b/meta/recipes-devtools/python/python3-cryptography.bb
> index 7cff4ddacf..5e24dbaf5a 100644
> --- a/meta/recipes-devtools/python/python3-cryptography.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography.bb
> @@ -11,7 +11,7 @@ LDSHARED +=3D "-pthread"
>  # NOTE: Make sure to keep this recipe at the same version as
> python3-cryptography-vectors
>  #       Upgrade both recipes at the same time
>  require python3-cryptography-common.inc
> -SRC_URI[sha256sum] =3D
> "e4cfd68c5f3e0bfdad0d38e023239b96a2fe84146481852dffbcca442c245aa5"
> +SRC_URI[sha256sum] =3D
> "5c3932f4436d1cccb036cb0eaef46e6e2db91035166f1ad6505c3c9d5a635920"
>
>  SRC_URI +=3D
> "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
>              file://check-memfree.py \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237778):
> https://lists.openembedded.org/g/openembedded-core/message/237778
> Mute This Topic: https://lists.openembedded.org/mt/119569088/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001d561b065310b93c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ptests pass on qemux86-64 core-image-ptest-python3-cryptog=
raphy:<div>Testsuite summary<br># TOTAL: 4330<br># PASS: 4132<br># SKIP: 19=
8<br># XFAIL: 0<br># FAIL: 0<br># XPASS: 0<br># ERROR: 0<br>DURATION: 33<br=
>END: /usr/lib/python3-cryptography/ptest<br>2026-05-30T22:36<br>STOP: ptes=
t-runner<br>TOTAL: 1 FAIL: 0</div></div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 30, 202=
6 at 3:43=E2=80=AFPM Tim Orling via <a href=3D"http://lists.openembedded.or=
g">lists.openembedded.org</a> &lt;tim.orling=3D<a href=3D"mailto:konsulko.c=
om@lists.openembedded.org">konsulko.com@lists.openembedded.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Tim Orl=
ing &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.or=
ling@konsulko.com</a>&gt;<br>
<br>
* Drop 0001-bump-uv_build-to-0.11.0.patch; change is included in upgrade.<b=
r>
* Refresh python3-crytpography-crates.inc<br>
<br>
48.0.0 - 2026-05-04 [1]<br>
* BACKWARDS INCOMPATIBLE: Support for Python 3.8 has been removed.<br>
=C2=A0 cryptography now requires Python 3.9 or later.<br>
<br>
* BACKWARDS INCOMPATIBLE: Loading an X.509 CRL whose inner<br>
=C2=A0 TBSCertList.signature algorithm does not match the outer<br>
=C2=A0 signatureAlgorithm now raises ValueError. Previously, such CRLs<br>
=C2=A0 were parsed successfully and only rejected during signature validati=
on.<br>
<br>
* Added support for ML-KEM key encapsulation and ML-DSA signing when<br>
=C2=A0 using OpenSSL 3.5.0 or later, in addition to the existing AWS-LC and=
<br>
=C2=A0 BoringSSL support. This means post-quantum algorithms are now availa=
ble<br>
=C2=A0 to users of our wheels.<br>
<br>
=C2=A0 - Note: Going forward, we do not guarantee that all functionality in=
<br>
=C2=A0 =C2=A0 cryptography will be available when building against OpenSSL.=
 See<br>
=C2=A0 =C2=A0 The State of OpenSSL for pyca/cryptography for more informati=
on.<br>
<br>
47.0.0 - 2026-04-24 [2]<br>
* Support for Python 3.8 is deprecated and will be removed in the next<br>
=C2=A0 cryptography release.<br>
<br>
* BACKWARDS INCOMPATIBLE: Support for binary elliptic curves<br>
=C2=A0 (SECT* classes) has been removed. These curves are rarely used and<b=
r>
=C2=A0 have additional security considerations that make them undesirable.<=
br>
<br>
* BACKWARDS INCOMPATIBLE: Support for OpenSSL 1.1.x has been removed.<br>
=C2=A0 OpenSSL 3.0.0 or later is now required. LibreSSL, BoringSSL, and<br>
=C2=A0 AWS-LC continue to be supported.<br>
<br>
* BACKWARDS INCOMPATIBLE: Dropped support for LibreSSL &lt; 4.1.<br>
<br>
* BACKWARDS INCOMPATIBLE: Loading keys with unsupported algorithms or<br>
=C2=A0 keys with unsupported explicit curve encodings now raises<br>
=C2=A0 UnsupportedAlgorithm instead of ValueError. This change affects<br>
=C2=A0 load_pem_private_key(), load_der_private_key(), load_pem_public_key(=
),<br>
=C2=A0 load_der_public_key(), and public_key() when called on certificates<=
br>
=C2=A0 with unsupported public key algorithms.<br>
<br>
* BACKWARDS INCOMPATIBLE: When parsing elliptic curve private keys, we<br>
=C2=A0 now reject keys that incorrectly encode a private key of the wrong<b=
r>
=C2=A0 length because such keys are impossible to process in a constant-tim=
e<br>
=C2=A0 manner. We do not believe keys with this problem are in wide use,<br=
>
=C2=A0 however we may revert this change based on the feedback we receive.<=
br>
<br>
* Deprecated passing 64-bit (8-byte) and 128-bit (16-byte) keys to<br>
=C2=A0 TripleDES. In a future release, only 192-bit (24-byte) keys will be<=
br>
=C2=A0 accepted. Users should expand shorter keys themselves (e.g., for<br>
=C2=A0 single DES: key + key + key, for two-key: key + key[:8]).<br>
<br>
See [2] for the rest of 47.0.0 changes.<br>
<br>
For full comparison of changes, see [3].<br>
<br>
[1] <a href=3D"https://cryptography.io/en/latest/changelog/#v48-0-0" rel=3D=
"noreferrer" target=3D"_blank">https://cryptography.io/en/latest/changelog/=
#v48-0-0</a><br>
[2] <a href=3D"https://cryptography.io/en/latest/changelog/#v47-0-0" rel=3D=
"noreferrer" target=3D"_blank">https://cryptography.io/en/latest/changelog/=
#v47-0-0</a><br>
[3] <a href=3D"https://github.com/pyca/cryptography/compare/46.0.7...48.0.0=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/pyca/cryptography=
/compare/46.0.7...48.0.0</a><br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" ta=
rget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../python/python3-cryptography-common.inc=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0.../python/python3-cryptography-crates.inc=C2=A0 =C2=A0 | 108 +++++++=
+----------<br>
=C2=A0.../python/<a href=3D"http://python3-cryptography-vectors.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-cryptography-vectors.bb</a>=C2=A0 =C2=
=A0 |=C2=A0 =C2=A07 +-<br>
=C2=A0.../0001-bump-uv_build-to-0.11.0.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 26 -----<br>
=C2=A0.../python/<a href=3D"http://python3-cryptography.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-cryptography.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A05 files changed, 54 insertions(+), 91 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3-cryptography-=
vectors/0001-bump-uv_build-to-0.11.0.patch<br>
<br>
diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b=
/meta/recipes-devtools/python/python3-cryptography-common.inc<br>
index 0515cf7705..77d9781688 100644<br>
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc<br>
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc<br>
@@ -3,4 +3,4 @@<br>
=C2=A0#<br>
=C2=A0# Additionally AUH will detect that they share this .inc file and<br>
=C2=A0# perform a lockstep upgrade for both.<br>
-PV =3D &quot;46.0.7&quot;<br>
+PV =3D &quot;48.0.0&quot;<br>
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b=
/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
index 6e3667eef1..0301b1f49c 100644<br>
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
@@ -2,77 +2,69 @@<br>
<br>
=C2=A0# from Cargo.lock<br>
=C2=A0SRC_URI +=3D &quot; \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1/0.22.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/asn1/0.22.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1_derive/0.22.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/asn1_derive/0.22.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.5.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/autocfg/1.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1/0.24.1" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/asn1/0.24.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1_derive/0.24.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/asn1_derive/0.24.1</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/base64/0.22.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/base64/0.22.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/2.9.4" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/bitflags/2.9.4</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.2.37" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/cc/1.2.37</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.3" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/cfg-if/1.0.3</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/find-msvc-tools/0.1.1" r=
el=3D"noreferrer" target=3D"_blank">crates.io/find-msvc-tools/0.1.1</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/2.11.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/bitflags/2.11.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.2.61" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/cc/1.2.61</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.4" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/cfg-if/1.0.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/find-msvc-tools/0.1.9" r=
el=3D"noreferrer" target=3D"_blank">crates.io/find-msvc-tools/0.1.9</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/foreign-types/0.3.2=
" rel=3D"noreferrer" target=3D"_blank">crates.io/foreign-types/0.3.2</a> \<=
br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/foreign-types-share=
d/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/foreign-types-share=
d/0.1.1</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/heck/0.5.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/heck/0.5.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indoc/2.0.6" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/indoc/2.0.6</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/itoa/1.0.15" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/itoa/1.0.15</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.175" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/libc/0.2.175</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.9.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/memoffset/0.9.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.21.3" rel=3D=
"noreferrer" target=3D"_blank">crates.io/once_cell/1.21.3</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl/0.10.74" rel=3D"=
noreferrer" target=3D"_blank">crates.io/openssl/0.10.74</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/itoa/1.0.18" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/itoa/1.0.18</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.186" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/libc/0.2.186</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.21.4" rel=3D=
"noreferrer" target=3D"_blank">crates.io/once_cell/1.21.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl/0.10.79" rel=3D"=
noreferrer" target=3D"_blank">crates.io/openssl/0.10.79</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/openssl-macros/0.1.=
1" rel=3D"noreferrer" target=3D"_blank">crates.io/openssl-macros/0.1.1</a> =
\<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-sys/0.9.110" rel=
=3D"noreferrer" target=3D"_blank">crates.io/openssl-sys/0.9.110</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pem/3.0.5" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/pem/3.0.5</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkg-config/0.3.32" rel=
=3D"noreferrer" target=3D"_blank">crates.io/pkg-config/0.3.32</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/portable-atomic/1.11.1" =
rel=3D"noreferrer" target=3D"_blank">crates.io/portable-atomic/1.11.1</a> \=
<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.101" rel=
=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.101</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.26.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/pyo3/0.26.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-config/0.26.0=
" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-config/0.26.0</=
a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.26.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.26.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.26.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.26.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-backend/0.26=
.0" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros-backend/0.26=
.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.40" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/quote/1.0.40</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/self_cell/1.2.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/self_cell/1.2.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-sys/0.9.115" rel=
=3D"noreferrer" target=3D"_blank">crates.io/openssl-sys/0.9.115</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pem/3.0.6" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/pem/3.0.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkg-config/0.3.33" rel=
=3D"noreferrer" target=3D"_blank">crates.io/pkg-config/0.3.33</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/portable-atomic/1.13.1" =
rel=3D"noreferrer" target=3D"_blank">crates.io/portable-atomic/1.13.1</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.106" rel=
=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.106</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.28.3" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/pyo3/0.28.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-config/0.28.3=
" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-config/0.28.3</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.28.3" rel=3D"=
noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.28.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.28.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.28.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-backend/0.28=
.3" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros-backend/0.28=
.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.45" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/quote/1.0.45</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/self_cell/1.2.2" rel=3D"=
noreferrer" target=3D"_blank">crates.io/self_cell/1.2.2</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/shlex/1.3.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/shlex/1.3.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.106" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/syn/2.0.106</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/target-lexicon/0.13.3" r=
el=3D"noreferrer" target=3D"_blank">crates.io/target-lexicon/0.13.3</a> \<b=
r>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-ident/1.0.19" re=
l=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1.0.19</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unindent/0.2.4" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/unindent/0.2.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.117" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/syn/2.0.117</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/target-lexicon/0.13.5" r=
el=3D"noreferrer" target=3D"_blank">crates.io/target-lexicon/0.13.5</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-ident/1.0.24" re=
l=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1.0.24</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/vcpkg/0.2.15" rel=
=3D"noreferrer" target=3D"_blank">crates.io/vcpkg/0.2.15</a> \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[asn1-0.22.0.sha256sum] =3D &quot;df42c2b01c5e1060b8281f67b4e5fb858=
260694916a667345a7305cd11e5dbfa&quot;<br>
-SRC_URI[asn1_derive-0.22.0.sha256sum] =3D &quot;cdccf849b54365e3693e9a90ad=
36e4482b79937e6373ac8e2cf229c985187b21&quot;<br>
-SRC_URI[autocfg-1.5.0.sha256sum] =3D &quot;c08606f8c3cbf4ce6ec8e28fb0014a2=
c086708fe954eaa885384a6165172e7e8&quot;<br>
+SRC_URI[asn1-0.24.1.sha256sum] =3D &quot;c9795210620c0cb3f9a7ce4f882808c38=
e1ef7b347c90591dceae0886e031fb1&quot;<br>
+SRC_URI[asn1_derive-0.24.1.sha256sum] =3D &quot;909e307f1cc32bb8bccbd98f44=
6e6d1bf03fa30f7b53a4337da7181ad30fa11a&quot;<br>
=C2=A0SRC_URI[base64-0.22.1.sha256sum] =3D &quot;72b3254f16251a8381aa12e40e=
3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6&quot;<br>
-SRC_URI[bitflags-2.9.4.sha256sum] =3D &quot;2261d10cca569e4643e526d8dc2e62=
e433cc8aba21ab764233731f8d369bf394&quot;<br>
-SRC_URI[cc-1.2.37.sha256sum] =3D &quot;65193589c6404eb80b450d618eaf9a2cafa=
aafd57ecce47370519ef674a7bd44&quot;<br>
-SRC_URI[cfg-if-1.0.3.sha256sum] =3D &quot;2fd1289c04a9ea8cb22300a459a72a38=
5d7c73d3259e2ed7dcb2af674838cfa9&quot;<br>
-SRC_URI[find-msvc-tools-0.1.1.sha256sum] =3D &quot;7fd99930f64d146689264c6=
37b5af2f0233a933bef0d8570e2526bf9e083192d&quot;<br>
+SRC_URI[bitflags-2.11.1.sha256sum] =3D &quot;c4512299f36f043ab09a583e57bce=
b5a5aab7a73db1805848e8fef3c9e8c78b3&quot;<br>
+SRC_URI[cc-1.2.61.sha256sum] =3D &quot;d16d90359e986641506914ba71350897565=
610e87ce0ad9e6f28569db3dd5c6d&quot;<br>
+SRC_URI[cfg-if-1.0.4.sha256sum] =3D &quot;9330f8b2ff13f34540b44e946ef35111=
825727b38d33286ef986142615121801&quot;<br>
+SRC_URI[find-msvc-tools-0.1.9.sha256sum] =3D &quot;5baebc0774151f905a1a2cc=
41989300b1e6fbb29aff0ceffa1064fdd3088d582&quot;<br>
=C2=A0SRC_URI[foreign-types-0.3.2.sha256sum] =3D &quot;f6f339eb8adc052cd2ca=
78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1&quot;<br>
=C2=A0SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D &quot;00b0228411908=
ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b&quot;<br>
=C2=A0SRC_URI[heck-0.5.0.sha256sum] =3D &quot;2304e00983f87ffb38b55b444b5e3=
b60a884b5d30c0fca7d82fe33449bbe55ea&quot;<br>
-SRC_URI[indoc-2.0.6.sha256sum] =3D &quot;f4c7245a08504955605670dbf141fceab=
975f15ca21570696aebe9d2e71576bd&quot;<br>
-SRC_URI[itoa-1.0.15.sha256sum] =3D &quot;4a5f13b858c8d314ee3e8f639011f7cce=
fe71f97f96e50151fb991f267928e2c&quot;<br>
-SRC_URI[libc-0.2.175.sha256sum] =3D &quot;6a82ae493e598baaea5209805c49bbf2=
ea7de956d50d7da0da1164f9c6d28543&quot;<br>
-SRC_URI[memoffset-0.9.1.sha256sum] =3D &quot;488016bfae457b036d996092f6cb4=
48677611ce4449e970ceaf42695203f218a&quot;<br>
-SRC_URI[once_cell-1.21.3.sha256sum] =3D &quot;42f5e15c9953c5e4ccceeb2e7382=
a716482c34515315f7b03532b8b4e8393d2d&quot;<br>
-SRC_URI[openssl-0.10.74.sha256sum] =3D &quot;24ad14dd45412269e1a30f52ad8f0=
664f0f4f4a89ee8fe28c3b3527021ebb654&quot;<br>
+SRC_URI[itoa-1.0.18.sha256sum] =3D &quot;8f42a60cbdf9a97f5d2305f08a87dc4e0=
9308d1276d28c869c684d7777685682&quot;<br>
+SRC_URI[libc-0.2.186.sha256sum] =3D &quot;68ab91017fe16c622486840e4c83c9a3=
7afeff978bd239b5293d61ece587de66&quot;<br>
+SRC_URI[once_cell-1.21.4.sha256sum] =3D &quot;9f7c3e4beb33f85d45ae3e3a1792=
185706c8e16d043238c593331cc7cd313b50&quot;<br>
+SRC_URI[openssl-0.10.79.sha256sum] =3D &quot;bf0b434746ee2832f4f0baf10137e=
1cabb18cbe6912c69e2e33263c45250f542&quot;<br>
=C2=A0SRC_URI[openssl-macros-0.1.1.sha256sum] =3D &quot;a948666b637a0f465e8=
564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c&quot;<br>
-SRC_URI[openssl-sys-0.9.110.sha256sum] =3D &quot;0a9f0075ba3c21b09f8e8b202=
6584b1d18d49388648f2fbbf3c97ea8deced8e2&quot;<br>
-SRC_URI[pem-3.0.5.sha256sum] =3D &quot;38af38e8470ac9dee3ce1bae1af9c1671ff=
fc44ddfd8bd1d0a3445bf349a8ef3&quot;<br>
-SRC_URI[pkg-config-0.3.32.sha256sum] =3D &quot;7edddbd0b52d732b21ad9a5fab5=
c704c14cd949e5e9a1ec5929a24fded1b904c&quot;<br>
-SRC_URI[portable-atomic-1.11.1.sha256sum] =3D &quot;f84267b20a16ea918e43c6=
a88433c2d54fa145c92a811b5b047ccbe153674483&quot;<br>
-SRC_URI[proc-macro2-1.0.101.sha256sum] =3D &quot;89ae43fd86e4158d6db51ad8e=
2b80f313af9cc74f5c0e03ccb87de09998732de&quot;<br>
-SRC_URI[pyo3-0.26.0.sha256sum] =3D &quot;7ba0117f4212101ee6544044dae45abe1=
083d30ce7b29c4b5cbdfa2354e07383&quot;<br>
-SRC_URI[pyo3-build-config-0.26.0.sha256sum] =3D &quot;4fc6ddaf24947d12a9aa=
31ac65431fb1b851b8f4365426e182901eabfb87df5f&quot;<br>
-SRC_URI[pyo3-ffi-0.26.0.sha256sum] =3D &quot;025474d3928738efb38ac36d4744a=
74a400c901c7596199e20e45d98eb194105&quot;<br>
-SRC_URI[pyo3-macros-0.26.0.sha256sum] =3D &quot;2e64eb489f22fe1c95911b77c4=
4cc41e7c19f3082fc81cce90f657cdc42ffded&quot;<br>
-SRC_URI[pyo3-macros-backend-0.26.0.sha256sum] =3D &quot;100246c0ecf400b475=
341b8455a9213344569af29a3c841d29270e53102e0fcf&quot;<br>
-SRC_URI[quote-1.0.40.sha256sum] =3D &quot;1885c039570dc00dcb4ff087a89e185f=
d56bae234ddc7f056a945bf36467248d&quot;<br>
-SRC_URI[self_cell-1.2.0.sha256sum] =3D &quot;0f7d95a54511e0c7be3f51e8867aa=
8cf35148d7b9445d44de2f943e2b206e749&quot;<br>
+SRC_URI[openssl-sys-0.9.115.sha256sum] =3D &quot;158fe5b292746440aa6e7a7e6=
90e55aeb72d41505e2804c23c6973ad0e9c9781&quot;<br>
+SRC_URI[pem-3.0.6.sha256sum] =3D &quot;1d30c53c26bc5b31a98cd02d20f25a7c856=
7146caf63ed593a9d87b2775291be&quot;<br>
+SRC_URI[pkg-config-0.3.33.sha256sum] =3D &quot;19f132c84eca552bf34cab8ec81=
f1c1dcc229b811638f9d283dceabe58c5569e&quot;<br>
+SRC_URI[portable-atomic-1.13.1.sha256sum] =3D &quot;c33a9471896f1c69cecef8=
d20cbe2f7accd12527ce60845ff44c153bb2a21b49&quot;<br>
+SRC_URI[proc-macro2-1.0.106.sha256sum] =3D &quot;8fd00f0bb2e90d81d1044c2b3=
2617f68fcb9fa3bb7640c23e9c748e53fb30934&quot;<br>
+SRC_URI[pyo3-0.28.3.sha256sum] =3D &quot;91fd8e38a3b50ed1167fb981cd6fd6014=
7e091784c427b8f7183a7ee32c31c12&quot;<br>
+SRC_URI[pyo3-build-config-0.28.3.sha256sum] =3D &quot;e368e7ddfdeb98c9bca7=
f8383be1648fd84ab466bf2bc015e94008db6d35611e&quot;<br>
+SRC_URI[pyo3-ffi-0.28.3.sha256sum] =3D &quot;7f29e10af80b1f7ccaf7f69eace80=
0a03ecd13e883acfacc1e5d0988605f651e&quot;<br>
+SRC_URI[pyo3-macros-0.28.3.sha256sum] =3D &quot;df6e520eff47c45997d2fc7dd8=
214b25dd1310918bbb2642156ef66a67f29813&quot;<br>
+SRC_URI[pyo3-macros-backend-0.28.3.sha256sum] =3D &quot;c4cdc218d835738f81=
c2338f822078af45b4afdf8b2e33cbb5916f108b813acb&quot;<br>
+SRC_URI[quote-1.0.45.sha256sum] =3D &quot;41f2619966050689382d2b44f664f4bc=
593e129785a36d6ee376ddf37259b924&quot;<br>
+SRC_URI[self_cell-1.2.2.sha256sum] =3D &quot;b12e76d157a900eb52e81bc6e9f30=
69344290341720e9178cde2407113ac8d89&quot;<br>
=C2=A0SRC_URI[shlex-1.3.0.sha256sum] =3D &quot;0fda2ff0d084019ba4d7c6f371c9=
5d8fd75ce3524c3cb8fb653a3023f6323e64&quot;<br>
-SRC_URI[syn-2.0.106.sha256sum] =3D &quot;ede7c438028d4436d71104916910f5bb6=
11972c5cfd7f89b8300a8186e6fada6&quot;<br>
-SRC_URI[target-lexicon-0.13.3.sha256sum] =3D &quot;df7f62577c25e07834649fc=
3b39fafdc597c0a3527dc1c60129201ccfcbaa50c&quot;<br>
-SRC_URI[unicode-ident-1.0.19.sha256sum] =3D &quot;f63a54548129113891057512=
9486daeaf8ac54aee4387fe7906919f7830c7d9d&quot;<br>
-SRC_URI[unindent-0.2.4.sha256sum] =3D &quot;7264e107f553ccae879d21fbea1d67=
24ac785e8c3bfc762137959b5802826ef3&quot;<br>
+SRC_URI[syn-2.0.117.sha256sum] =3D &quot;e665b8803e7b1d2a727f4023456bbbbe7=
4da67099c585258af0ad9c5013b9b99&quot;<br>
+SRC_URI[target-lexicon-0.13.5.sha256sum] =3D &quot;adb6935a6f5c20170eeceb1=
a3835a49e12e19d792f6dd344ccc76a985ca5a6ca&quot;<br>
+SRC_URI[unicode-ident-1.0.24.sha256sum] =3D &quot;e6e4313cd5fcd3dad5cafa17=
9702e2b244f760991f45397d14d4ebf38247da75&quot;<br>
=C2=A0SRC_URI[vcpkg-0.2.15.sha256sum] =3D &quot;accd4ea62f7bb7a82fe23066fb0=
957d48ef677f6eeb8215f372f52e48bb32426&quot;<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptog=
raphy-vectors.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography=
-vectors.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-cr=
yptography-vectors.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptog=
raphy-vectors.bb</a><br>
index 0d2b638527..6abb727915 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography-v=
ectors.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography-vector=
s.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography-v=
ectors.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography-vector=
s.bb</a><br>
@@ -9,13 +9,10 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8c3617db4=
fb6fae01f1d253ab91511e4 \<br>
=C2=A0# NOTE: Make sure to keep this recipe at the same version as python3-=
cryptography<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0Upgrade both recipes at the same time<br>
=C2=A0require python3-cryptography-common.inc<br>
-SRC_URI +=3D &quot;file://0001-bump-uv_build-to-0.11.0.patch&quot;<br>
-SRC_URI[sha256sum] =3D &quot;08f3d13846fdd86d4c1138a88c695cee203b3dd3825c7=
84d64a3b06d000cdda1&quot;<br>
+SRC_URI[sha256sum] =3D &quot;69836f597ddfbe3920b3c90d1f18e5560973f0791b90e=
1921ad345e8111ac23e&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;cryptography_vectors&quot;<br>
<br>
-DEPENDS +=3D &quot;python3-uv-build-native&quot;<br>
-<br>
-inherit pypi python_flit_core<br>
+inherit pypi python_uv_build<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors/0001=
-bump-uv_build-to-0.11.0.patch b/meta/recipes-devtools/python/python3-crypt=
ography-vectors/0001-bump-uv_build-to-0.11.0.patch<br>
deleted file mode 100644<br>
index 05f225de2f..0000000000<br>
--- a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-u=
v_build-to-0.11.0.patch<br>
+++ /dev/null<br>
@@ -1,26 +0,0 @@<br>
-From b1e8722ccf79ef02ae929df2e7fd7547e8615e68 Mon Sep 17 00:00:00 2001<br>
-From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_bla=
nk">wangmy@fujitsu.com</a>&gt;<br>
-Date: Wed, 22 Apr 2026 10:09:16 +0000<br>
-Subject: [PATCH] bump uv_build to 0.11.0<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/pyca/cryptography=
/pull/14545" rel=3D"noreferrer" target=3D"_blank">https://github.com/pyca/c=
ryptography/pull/14545</a>]<br>
-<br>
-Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" targe=
t=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
----<br>
- pyproject.toml | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/pyproject.toml b/pyproject.toml<br>
-index eac1a07..6bc8d46 100644<br>
---- a/pyproject.toml<br>
-+++ b/pyproject.toml<br>
-@@ -1,5 +1,5 @@<br>
- [build-system]<br>
--requires =3D [&quot;uv_build&gt;=3D0.7.19,&lt;0.9.0&quot;]<br>
-+requires =3D [&quot;uv_build&gt;=3D0.7.19,&lt;0.12.0&quot;]<br>
- build-backend =3D &quot;uv_build&quot;<br>
- <br>
- [project]<br>
--- <br>
-2.43.0<br>
-<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptog=
raphy.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography.bb</a> =
b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-cryptography.bb</a><br>
index 7cff4ddacf..5e24dbaf5a 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-cryptography.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-cryptography.bb</a><br>
@@ -11,7 +11,7 @@ LDSHARED +=3D &quot;-pthread&quot;<br>
=C2=A0# NOTE: Make sure to keep this recipe at the same version as python3-=
cryptography-vectors<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0Upgrade both recipes at the same time<br>
=C2=A0require python3-cryptography-common.inc<br>
-SRC_URI[sha256sum] =3D &quot;e4cfd68c5f3e0bfdad0d38e023239b96a2fe841464818=
52dffbcca442c245aa5&quot;<br>
+SRC_URI[sha256sum] =3D &quot;5c3932f4436d1cccb036cb0eaef46e6e2db91035166f1=
ad6505c3c9d5a635920&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0001-pyproject.toml-remove-benchmark-disabl=
e-option.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://check-memfree.py \<b=
r>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#237778): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/237778" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/237778</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119569088/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/119569088/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000001d561b065310b93c--

