Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160C7FB44C7
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 07:36:09 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15853.1777016166532612095
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 00:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PyrzqCtm;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso81400645e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 00:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777016165; x=1777620965; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2dhAamv1noCIu88Ge9KksmfdlCN4AGrfefeySntn/I=;
        b=PyrzqCtmrh3xewRUyBs4TUjAeDTtRG+22OGCx3BJ74E9DSD8v9sffQQSqsBVdCWm5R
         AgdLLnrjbeXqtFoZPd+SWd349f1N8UDoPY1yQfsLwbVhju96lc9rS8ZbwX0JzZFLO5vW
         CHSaeinOQxtNNXrIZBQ3jVEVrzd031JSE9ndE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777016165; x=1777620965;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q2dhAamv1noCIu88Ge9KksmfdlCN4AGrfefeySntn/I=;
        b=pAmZgd/yhPo3OR3UAD4q6ebnCpXCIMQP2evgXbudBNU9IGN9fVjBdF4JVAUP3+evSs
         5JEXcOYI9FIMnL8g7GWXc9AqtXwVqJXnPmOqTDI5+E5e7WgLdvTOS1b65iCVrm3YrcEd
         yHeVlcu2mRKaZpZpUSgMqPlfxCuAir1cj0OBMNNndkJrNDUD5bPvGLdwV3FqWhOKRtd5
         aLdm4AoSGwpLi7yLgxt6zYubknb6kgi+hLJIYGMLsTMsC0+y1sNg87l5UYrHu9IGOz1o
         YuCrnWEhBLGQQ6V5fk41D/R+8SudNDk4YO8WyP7KXTk0NNsJzAP7GBhjXUeSZ9eo3vso
         TExA==
X-Forwarded-Encrypted: i=1; AFNElJ8zPabKYbtRjdD/N4sOJ5vLoEwaqqT8RpiJ8GyuzxwaKCsVlorpirfHedNrL9f2ZKQA+gwKDBtcVTXl7vg4JgqbJQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxrRbo8I/QTyZV8jqI2a6EFsdPFf9mnormzJBAE4v5Fz+bcGPBL
	kT7rw1R5ePtSadDxnGIu2HkrYEFGe7Fxxm7dI4L06s55tbeAeAoQU4qNgB97QV0Ffko=
X-Gm-Gg: AeBDiet/l8s6Q8X6MO/ciDdw1srm6waI4CbiEZ27/bp8HluAJJt4ab0f0qXjd1Hh40b
	UJIS3ykVpr0L1SE/wm2X2h9yHGPBC5sZm3alE95yrODOrtd5RaRF08+AbVDkgc/tnzhzvYRkh8C
	RQOQrLGkFBzu++y7mI6pUi6i5fvgXqag8eefnliZtxxCMB0Dy/7FJXEcwMFO0accWECbYbh+GkZ
	C6HOudcuKDyDI6KbnzvUvJ21aBp4DqF6OuXGtkskdSwu2FyORPbyPqF73GF8nINGa/QmxNYal60
	Vm9xON3nJSmxeDNvuz+srOKG578POpDeHWcYpP25lRIoR+YVU5gYNIRLgXGK+BRvLc3GzG2Ovx7
	1ZBOIvKEbsc5udub9VHm0iKhNNZGyfYjb53OPICMDfbKy8IWty9HyNakm76TS8w3ZzWihii7d3r
	0l2xky4AmdF6tQCKwVmYPkwLKSRBYeEpPegj4JUxEFqpAhHeW/eiF60Jo+AMHf6t8XkIalFAS6A
	VSTQJTlc9ws+EndxGDAcGnPoQ==
X-Received: by 2002:a05:600c:5299:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48a54514646mr228729465e9.21.1777016164513;
        Fri, 24 Apr 2026 00:36:04 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffc558f2sm434239005e9.1.2026.04.24.00.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 00:36:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 09:36:03 +0200
Message-Id: <DI17NNT0X7YI.3HOA397O2P5FL@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 09/12] python3-pyasn1: fix
 CVE-2026-30922
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <Jinfeng.Wang.CN@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
 <20260409061639.1688205-10-jinfeng.wang.cn@windriver.com>
In-Reply-To: <20260409061639.1688205-10-jinfeng.wang.cn@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 07:36:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235840

On Thu Apr 9, 2026 at 8:16 AM CEST, Jinfeng (CN) via lists.openembedded.org=
 Wang wrote:
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> pyasn1 is a generic ASN.1 library for Python. Prior to 0.6.3, the
> `pyasn1` library is vulnerable to a Denial of Service (DoS) attack
> caused by uncontrolled recursion when decoding ASN.1 data with deeply
> nested structures. An attacker can supply a crafted payload containing
> thousands of nested `SEQUENCE` (`0x30`) or `SET` (`0x31`) tags with
> "Indefinite Length" (`0x80`) markers. This forces the decoder to
> recursively call itself until the Python interpreter crashes with a
> `RecursionError` or consumes all available memory (OOM), crashing the
> host application. This is a distinct vulnerability from CVE-2026-23490
> (which addressed integer overflows in OID decoding). The fix for
> CVE-2026-23490 (`MAX_OID_ARC_CONTINUATION_OCTETS`) does not mitigate
> this recursion issue. Version 0.6.3 fixes this specific issue.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2026-30922
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> ---

AFAIK, this CVE also apply to master (I'm not sure why it does not
appear on https://valkyrie.yocto.io/pub/non-release/patchmetrics/)

I'll hold this patch until "python3-pyasn1: upgrade 0.6.2 -> 0.6.3"
merges.

>  .../recipes-devtools/python/python-pyasn1.inc |   1 +
>  .../python3-pyasn1/CVE-2026-30922.patch       | 257 ++++++++++++++++++
>  2 files changed, 258 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-=
30922.patch
>
> diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipe=
s-devtools/python/python-pyasn1.inc
> index 96b4a3b52a..d69cdf8877 100644
> --- a/meta/recipes-devtools/python/python-pyasn1.inc
> +++ b/meta/recipes-devtools/python/python-pyasn1.inc
> @@ -19,6 +19,7 @@ inherit ptest
>  SRC_URI +=3D " \
>         file://run-ptest \
>         file://CVE-2026-23490.patch \
> +       file://CVE-2026-30922.patch \
>  "
> =20
>  RDEPENDS:${PN}-ptest +=3D " \
> diff --git a/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.p=
atch b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch
> new file mode 100644
> index 0000000000..7eceaa2595
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch
> @@ -0,0 +1,257 @@
> +From 85e901d1dacdcd17363cc2dd18a91cfb72363eeb Mon Sep 17 00:00:00 2001
> +From: Simon Pichugin <simon.pichugin@gmail.com>
> +Date: Thu, 19 Mar 2026 17:11:40 +0800
> +Subject: [PATCH] Merge commit from fork
> +
> +CVE: CVE-2026-30922
> +
> +Upstream-Status: Backport [https://github.com/pyasn1/pyasn1/commit/25ad4=
81c19]
> +
> +Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> +---
> + pyasn1/codec/ber/decoder.py     |  10 +++
> + tests/codec/ber/test_decoder.py | 114 ++++++++++++++++++++++++++++++++
> + tests/codec/cer/test_decoder.py |  22 ++++++
> + tests/codec/der/test_decoder.py |  40 +++++++++++
> + 4 files changed, 186 insertions(+)
> +
> +diff --git a/pyasn1/codec/ber/decoder.py b/pyasn1/codec/ber/decoder.py
> +index be8ba65..da2a048 100644
> +--- a/pyasn1/codec/ber/decoder.py
> ++++ b/pyasn1/codec/ber/decoder.py
> +@@ -38,6 +38,7 @@ SubstrateUnderrunError =3D error.SubstrateUnderrunErro=
r
> + # Maximum number of continuation octets (high-bit set) allowed per OID =
arc.
> + # 20 octets allows up to 140-bit integers, supporting UUID-based OIDs
> + MAX_OID_ARC_CONTINUATION_OCTETS =3D 20
> ++MAX_NESTING_DEPTH =3D 100
> +=20
> +=20
> + class AbstractPayloadDecoder(object):
> +@@ -1515,6 +1516,15 @@ class SingleItemDecoder(object):
> +                  decodeFun=3DNone, substrateFun=3DNone,
> +                  **options):
> +=20
> ++        _nestingLevel =3D options.get('_nestingLevel', 0)
> ++
> ++        if _nestingLevel > MAX_NESTING_DEPTH:
> ++            raise error.PyAsn1Error(
> ++                'ASN.1 structure nesting depth exceeds limit (%d)' % MA=
X_NESTING_DEPTH
> ++            )
> ++
> ++        options['_nestingLevel'] =3D _nestingLevel + 1
> ++
> +         allowEoo =3D options.pop('allowEoo', False)
> +=20
> +         if LOG:
> +diff --git a/tests/codec/ber/test_decoder.py b/tests/codec/ber/test_deco=
der.py
> +index f033dfd..226381a 100644
> +--- a/tests/codec/ber/test_decoder.py
> ++++ b/tests/codec/ber/test_decoder.py
> +@@ -1987,6 +1987,120 @@ class CompressedFilesTestCase(BaseTestCase):
> +         finally:
> +             os.remove(path)
> +=20
> ++class NestingDepthLimitTestCase(BaseTestCase):
> ++    """Test protection against deeply nested ASN.1 structures (CVE prev=
ention)."""
> ++
> ++    def testIndefLenSequenceNesting(self):
> ++        """Deeply nested indefinite-length SEQUENCEs must raise PyAsn1E=
rror."""
> ++        # Each \x30\x80 opens a new indefinite-length SEQUENCE
> ++        payload =3D b'\x30\x80' * 200
> ++        try:
> ++            decoder.decode(payload)
> ++        except error.PyAsn1Error:
> ++            pass
> ++        else:
> ++            assert False, 'Deeply nested indef-length SEQUENCEs not rej=
ected'
> ++
> ++    def testIndefLenSetNesting(self):
> ++        """Deeply nested indefinite-length SETs must raise PyAsn1Error.=
"""
> ++        # Each \x31\x80 opens a new indefinite-length SET
> ++        payload =3D b'\x31\x80' * 200
> ++        try:
> ++            decoder.decode(payload)
> ++        except error.PyAsn1Error:
> ++            pass
> ++        else:
> ++            assert False, 'Deeply nested indef-length SETs not rejected=
'
> ++
> ++    def testDefiniteLenNesting(self):
> ++        """Deeply nested definite-length SEQUENCEs must raise PyAsn1Err=
or."""
> ++        inner =3D b'\x05\x00'  # NULL
> ++        for _ in range(200):
> ++            length =3D len(inner)
> ++            if length < 128:
> ++                inner =3D b'\x30' + bytes([length]) + inner
> ++            else:
> ++                length_bytes =3D length.to_bytes(
> ++                    (length.bit_length() + 7) // 8, 'big')
> ++                inner =3D b'\x30' + bytes([0x80 | len(length_bytes)]) +=
 \
> ++                    length_bytes + inner
> ++        try:
> ++            decoder.decode(inner)
> ++        except error.PyAsn1Error:
> ++            pass
> ++        else:
> ++            assert False, 'Deeply nested definite-length SEQUENCEs not =
rejected'
> ++
> ++    def testNestingUnderLimitWorks(self):
> ++        """Nesting within the limit must decode successfully."""
> ++        inner =3D b'\x05\x00'  # NULL
> ++        for _ in range(50):
> ++            length =3D len(inner)
> ++            if length < 128:
> ++                inner =3D b'\x30' + bytes([length]) + inner
> ++            else:
> ++                length_bytes =3D length.to_bytes(
> ++                    (length.bit_length() + 7) // 8, 'big')
> ++                inner =3D b'\x30' + bytes([0x80 | len(length_bytes)]) +=
 \
> ++                    length_bytes + inner
> ++        asn1Object, _ =3D decoder.decode(inner)
> ++        assert asn1Object is not None, 'Valid nested structure rejected=
'
> ++
> ++    def testSiblingsDontIncreaseDepth(self):
> ++        """Sibling elements at the same level must not inflate depth co=
unt."""
> ++        # SEQUENCE containing 200 INTEGER siblings - should decode fine
> ++        components =3D b'\x02\x01\x01' * 200  # 200 x INTEGER(1)
> ++        length =3D len(components)
> ++        length_bytes =3D length.to_bytes(
> ++            (length.bit_length() + 7) // 8, 'big')
> ++        payload =3D b'\x30' + bytes([0x80 | len(length_bytes)]) + \
> ++            length_bytes + components
> ++        asn1Object, _ =3D decoder.decode(payload)
> ++        assert asn1Object is not None, 'Siblings incorrectly rejected'
> ++
> ++    def testErrorMessageContainsLimit(self):
> ++        """Error message must indicate the nesting depth limit."""
> ++        payload =3D b'\x30\x80' * 200
> ++        try:
> ++            decoder.decode(payload)
> ++        except error.PyAsn1Error as exc:
> ++            assert 'nesting depth' in str(exc).lower(), \
> ++                'Error message missing depth info: %s' % exc
> ++        else:
> ++            assert False, 'Expected PyAsn1Error'
> ++
> ++    def testNoRecursionError(self):
> ++        """Must raise PyAsn1Error, not RecursionError."""
> ++        payload =3D b'\x30\x80' * 50000
> ++        try:
> ++            decoder.decode(payload)
> ++        except error.PyAsn1Error:
> ++            pass
> ++        except RecursionError:
> ++            assert False, 'Got RecursionError instead of PyAsn1Error'
> ++
> ++    def testMixedNesting(self):
> ++        """Mixed SEQUENCE and SET nesting must be caught."""
> ++        # Alternate SEQUENCE (0x30) and SET (0x31) with indef length
> ++        payload =3D b''
> ++        for i in range(200):
> ++            payload +=3D b'\x30\x80' if i % 2 =3D=3D 0 else b'\x31\x80'
> ++        try:
> ++            decoder.decode(payload)
> ++        except error.PyAsn1Error:
> ++            pass
> ++        else:
> ++            assert False, 'Mixed nesting not rejected'
> ++
> ++    def testWithSchema(self):
> ++        """Deeply nested structures must be caught even with schema."""
> ++        payload =3D b'\x30\x80' * 200
> ++        try:
> ++            decoder.decode(payload, asn1Spec=3Duniv.Sequence())
> ++        except error.PyAsn1Error:
> ++            pass
> ++        else:
> ++            assert False, 'Deeply nested with schema not rejected'
> +=20
> + class NonStreamingCompatibilityTestCase(BaseTestCase):
> +     def setUp(self):
> +diff --git a/tests/codec/cer/test_decoder.py b/tests/codec/cer/test_deco=
der.py
> +index 133affd..fbb1145 100644
> +--- a/tests/codec/cer/test_decoder.py
> ++++ b/tests/codec/cer/test_decoder.py
> +@@ -363,6 +363,28 @@ class SequenceDecoderWithExplicitlyTaggedSetOfOpenT=
ypesTestCase(BaseTestCase):
> +         assert s[0] =3D=3D 3
> +         assert s[1][0] =3D=3D univ.OctetString(hexValue=3D'02010C')
> +=20
> ++class NestingDepthLimitTestCase(BaseTestCase):
> ++    """Test CER decoder protection against deeply nested structures."""
> ++
> ++    def testIndefLenNesting(self):
> ++        """Deeply nested indefinite-length SEQUENCEs must raise PyAsn1E=
rror."""
> ++        payload =3D b'\x30\x80' * 200
> ++        try:
> ++            decoder.decode(payload)
> ++        except PyAsn1Error:
> ++            pass
> ++        else:
> ++            assert False, 'Deeply nested indef-length SEQUENCEs not rej=
ected'
> ++
> ++    def testNoRecursionError(self):
> ++        """Must raise PyAsn1Error, not RecursionError."""
> ++        payload =3D b'\x30\x80' * 50000
> ++        try:
> ++            decoder.decode(payload)
> ++        except PyAsn1Error:
> ++            pass
> ++        except RecursionError:
> ++            assert False, 'Got RecursionError instead of PyAsn1Error'
> +=20
> + suite =3D unittest.TestLoader().loadTestsFromModule(sys.modules[__name_=
_])
> +=20
> +diff --git a/tests/codec/der/test_decoder.py b/tests/codec/der/test_deco=
der.py
> +index 5bc9deb..b0fa867 100644
> +--- a/tests/codec/der/test_decoder.py
> ++++ b/tests/codec/der/test_decoder.py
> +@@ -361,6 +361,46 @@ class SequenceDecoderWithExplicitlyTaggedSetOfOpenT=
ypesTestCase(BaseTestCase):
> +         assert s[0] =3D=3D 3
> +         assert s[1][0] =3D=3D univ.OctetString(hexValue=3D'02010C')
> +=20
> ++class NestingDepthLimitTestCase(BaseTestCase):
> ++    """Test DER decoder protection against deeply nested structures."""
> ++
> ++    def testDefiniteLenNesting(self):
> ++        """Deeply nested definite-length SEQUENCEs must raise PyAsn1Err=
or."""
> ++        inner =3D b'\x05\x00'  # NULL
> ++        for _ in range(200):
> ++            length =3D len(inner)
> ++            if length < 128:
> ++                inner =3D b'\x30' + bytes([length]) + inner
> ++            else:
> ++                length_bytes =3D length.to_bytes(
> ++                    (length.bit_length() + 7) // 8, 'big')
> ++                inner =3D b'\x30' + bytes([0x80 | len(length_bytes)]) +=
 \
> ++                    length_bytes + inner
> ++        try:
> ++            decoder.decode(inner)
> ++        except PyAsn1Error:
> ++            pass
> ++        else:
> ++            assert False, 'Deeply nested definite-length SEQUENCEs not =
rejected'
> ++
> ++    def testNoRecursionError(self):
> ++        """Must raise PyAsn1Error, not RecursionError."""
> ++        inner =3D b'\x05\x00'
> ++        for _ in range(200):
> ++            length =3D len(inner)
> ++            if length < 128:
> ++                inner =3D b'\x30' + bytes([length]) + inner
> ++            else:
> ++                length_bytes =3D length.to_bytes(
> ++                    (length.bit_length() + 7) // 8, 'big')
> ++                inner =3D b'\x30' + bytes([0x80 | len(length_bytes)]) +=
 \
> ++                    length_bytes + inner
> ++        try:
> ++            decoder.decode(inner)
> ++        except PyAsn1Error:
> ++            pass
> ++        except RecursionError:
> ++            assert False, 'Got RecursionError instead of PyAsn1Error'
> +=20
> + suite =3D unittest.TestLoader().loadTestsFromModule(sys.modules[__name_=
_])
> +=20
> +--=20
> +2.34.1
> +


--=20
Yoann Congal
Smile ECS


