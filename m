Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A041088E50
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 22:41:24 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27225.1773873681825116330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 15:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nMSLCnHn;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486b9675d36so146305e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 15:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773873680; x=1774478480; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=da81p4eYFNmkJSPeMP5LfOfhGrOilFmDFC+nKdKaZB8=;
        b=nMSLCnHn4XFtE5M13SWlJhMrh5KGhciaQ8iCaTp2FNHvuWqHP3TQAmUUkli4uaoLEg
         /fbGO3AZkv51I/7EvmJZ370m86iZhRQgjHxeFOjK0/7z/mZzySJ/51/O3vfEXTmU8y3L
         f/r1TQ3CD32KuWs0x6n3DVADd8eLYi+C+ew2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773873680; x=1774478480;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=da81p4eYFNmkJSPeMP5LfOfhGrOilFmDFC+nKdKaZB8=;
        b=D1s2XPNZsfDnLSLiLsowL6P2ENUTUwQ4gukBAvD+NEusVQjTWokm6ozMEVHfGhYG9T
         dtrU2509b10lWiOJ73i3RfvsAqRHti5+xEMyCPAPvVE765fL3qaRiBIDm0POzAuXwBdG
         8VN/UR/Y3V8JNgvcAUOtVjypA36kBMkOjng8nxbbIMBFTPzzCW616++W0UDfMl4NE5/J
         eyO3SsMBFBu/Ie/j8VHFzsJPrGhALxl2wGtAWIMNzSGRpQTyudvFnxhZ0/31Rt3ayq3d
         7tI/ewVP7qi8sLLBR+EWjwjZr9uLP2dGUHfC8zjK0ZDg7TboBuNdiTfb9IAu29HHYaF6
         DYTA==
X-Forwarded-Encrypted: i=1; AJvYcCU+3yb6ZmpzwWTrmsHJc7Eb84FAykGJXC2CFfJwruAPjDLeC2/3nrte+Jd/bAc61CrcDHa4WEG1OvxIlPWra6dPPg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YystB6E35MHh7RUPkDOzCEG+MAg7N+ZYSy9e17v15/J4h1Zo6mf
	BMze/7xGToEp/bJrkpYNicclHBcW70mYYMBZ70w0TEdYQhh+eTwmE7NzTXg00qGRbBI=
X-Gm-Gg: ATEYQzw9wpep89lApaMbFuU1mTFO2RolZMnHln7LCBWyXxoiRyh47AEfbv/T01x2zW9
	gHlfiVim/E64RpEF0XiHmedS/u1sk4gDwtPoSh/QMjKfSqyF/EkTLQSNIb8KYd3nVg9K3KrmpoS
	PmB8bWJcXrU/oV5loTzcUa8khcuLQ7qI2Z/1ux1ZlcdxZNfpQ0qc/lD145NzrCqJca6XdWcznAJ
	sZNKxNvww/YnvbxACmFy0uDRjas1Pk+z7NbYAuULQ3/U+OE7VpGkQ5WLinFu02HIYW3R7LmOvUB
	nB38g1Tn0j+lqYseR5T8nO7/oLutLHGeqHVbzQKj4EjT4B1q9XKw6jrRD9i38n9Vd4NUCcASC7g
	AKYcEjUmc/LgPnZ/13k4g6ioeO3BicJmboRvWVA0qe44RRoCM3OmPu+57M7nQOQCRdn1ACak6ZW
	pXozlcZUTSB1tVp0P0zFhZJsvVwHqSo8L+svARt6qGPmy8rV4xOXBrO6qHCCmi23KuzCMMptnMf
	ohV52HmmYnzYmQ=
X-Received: by 2002:a05:600c:c8d:b0:485:469f:5320 with SMTP id 5b1f17b1804b1-486f446d7camr85031745e9.30.1773873679978;
        Wed, 18 Mar 2026 15:41:19 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba847fsm37139685e9.25.2026.03.18.15.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 15:41:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 23:41:19 +0100
Message-Id: <DH69QMBJ8PT9.296JRMO0KND2R@smile.fr>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap] [PATCH] python3: Fix CVE-2025-12781
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>, <to@cisco.com>
X-Mailer: aerc 0.20.0
References: <20260316140553.76583-1-adongare@cisco.com>
In-Reply-To: <20260316140553.76583-1-adongare@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 22:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233447

On Mon Mar 16, 2026 at 3:05 PM CET, Anil Dongare -X (adongare - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> Pick patch from [1] and [2] also mentioned in [3]
> [1] https://github.com/python/cpython/commit/13360efd385d
> [2] https://github.com/python/cpython/commit/9060b4abbe47
> [3] https://nvd.nist.gov/vuln/detail/CVE-2025-12781

Hello,

As mentioned by the CVE text itself:
> The attached patches DOES NOT make the base64-decode behavior raise
> an error, as this would be a change in behavior and break existing
> programs
The only thing the patch does is to raise a warning in case of "bad"
characters in input. I would not call this CVE patched with that "fix".

I'd rather leave this CVE applicable and let downstream users notice the
CVE, implement the mitigation:
> Users are recommended to mitigate by verifying user-controlled inputs
> match the base64 alphabet they are expecting or verify that their
> application would not be affected if the b64decode() functions
> accepted "+" or "/" outside of altchars.
... then use CVE_STATUS to mark the CVE as fixed in their system.
We can't make this for them and, thus, I can't take this patch.

Regards,
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---
>  .../python/python3/CVE-2025-12781_p1.patch    | 120 +++++++++++
>  .../python/python3/CVE-2025-12781_p2.patch    | 190 ++++++++++++++++++
>  .../python/python3_3.12.12.bb                 |   2 +
>  3 files changed, 312 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-12781_p=
1.patch
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-12781_p=
2.patch
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2025-12781_p1.patch=
 b/meta/recipes-devtools/python/python3/CVE-2025-12781_p1.patch
> new file mode 100644
> index 0000000000..ea92915f4c
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2025-12781_p1.patch
> @@ -0,0 +1,120 @@
> +From 3055c9622df972f0b055f42761b12de7a1998444 Mon Sep 17 00:00:00 2001
> +From: Serhiy Storchaka <storchaka@gmail.com>
> +Date: Thu, 6 Nov 2025 11:34:32 +0200
> +Subject: [PATCH] gh-125346: Add more base64 tests (GH-141061)
> +
> +Add more tests for the altchars argument of b64decode() and for the map0=
1
> +argument of b32decode().
> +
> +CVE: CVE-2025-12781
> +Upstream-Status: Backport [https://github.com/python/cpython/commit/1336=
0efd385d1a7d0659beba03787ea3d063ef9b]
> +
> +(cherry picked from commit 13360efd385d1a7d0659beba03787ea3d063ef9b)
> +Signed-off-by: Anil Dongare <adongare@cisco.com>
> +---
> + Lib/test/test_base64.py | 63 +++++++++++++++++++++++++++--------------
> + 1 file changed, 41 insertions(+), 22 deletions(-)
> +
> +diff --git a/Lib/test/test_base64.py b/Lib/test/test_base64.py
> +index f6171d3ed4e..5167b8560e6 100644
> +--- a/Lib/test/test_base64.py
> ++++ b/Lib/test/test_base64.py
> +@@ -200,18 +200,6 @@ def test_b64decode(self):
> +         self.check_other_types(base64.b64decode, b"YWJj", b"abc")
> +         self.check_decode_type_errors(base64.b64decode)
> +
> +-        # Test with arbitrary alternative characters
> +-        tests_altchars =3D {(b'01a*b$cd', b'*$'): b'\xd3V\xbeo\xf7\x1d'=
,
> +-                          }
> +-        for (data, altchars), res in tests_altchars.items():
> +-            data_str =3D data.decode('ascii')
> +-            altchars_str =3D altchars.decode('ascii')
> +-
> +-            eq(base64.b64decode(data, altchars=3Daltchars), res)
> +-            eq(base64.b64decode(data_str, altchars=3Daltchars), res)
> +-            eq(base64.b64decode(data, altchars=3Daltchars_str), res)
> +-            eq(base64.b64decode(data_str, altchars=3Daltchars_str), res=
)
> +-
> +         # Test standard alphabet
> +         for data, res in tests.items():
> +             eq(base64.standard_b64decode(data), res)
> +@@ -232,6 +220,20 @@ def test_b64decode(self):
> +                                b'\xd3V\xbeo\xf7\x1d')
> +         self.check_decode_type_errors(base64.urlsafe_b64decode)
> +
> ++    def test_b64decode_altchars(self):
> ++        # Test with arbitrary alternative characters
> ++        eq =3D self.assertEqual
> ++        res =3D b'\xd3V\xbeo\xf7\x1d'
> ++        for altchars in b'*$', b'+/', b'/+', b'+_', b'-+', b'-/', b'/_'=
:
> ++            data =3D b'01a%cb%ccd' % tuple(altchars)
> ++            data_str =3D data.decode('ascii')
> ++            altchars_str =3D altchars.decode('ascii')
> ++
> ++            eq(base64.b64decode(data, altchars=3Daltchars), res)
> ++            eq(base64.b64decode(data_str, altchars=3Daltchars), res)
> ++            eq(base64.b64decode(data, altchars=3Daltchars_str), res)
> ++            eq(base64.b64decode(data_str, altchars=3Daltchars_str), res=
)
> ++
> +     def test_b64decode_padding_error(self):
> +         self.assertRaises(binascii.Error, base64.b64decode, b'abc')
> +         self.assertRaises(binascii.Error, base64.b64decode, 'abc')
> +@@ -264,9 +266,12 @@ def test_b64decode_invalid_chars(self):
> +                 base64.b64decode(bstr.decode('ascii'), validate=3DTrue)
> +
> +         # Normal alphabet characters not discarded when alternative giv=
en
> +-        res =3D b'\xFB\xEF\xBE\xFF\xFF\xFF'
> +-        self.assertEqual(base64.b64decode(b'++[[//]]', b'[]'), res)
> +-        self.assertEqual(base64.urlsafe_b64decode(b'++--//__'), res)
> ++        res =3D b'\xfb\xef\xff'
> ++        self.assertEqual(base64.b64decode(b'++//', validate=3DTrue), re=
s)
> ++        self.assertEqual(base64.b64decode(b'++//', '-_', validate=3DTru=
e), res)
> ++        self.assertEqual(base64.b64decode(b'--__', '-_', validate=3DTru=
e), res)
> ++        self.assertEqual(base64.urlsafe_b64decode(b'++//'), res)
> ++        self.assertEqual(base64.urlsafe_b64decode(b'--__'), res)
> +
> +     def test_b32encode(self):
> +         eq =3D self.assertEqual
> +@@ -325,19 +330,33 @@ def test_b32decode_casefold(self):
> +         eq(base64.b32decode(b'MLO23456'), b'b\xdd\xad\xf3\xbe')
> +         eq(base64.b32decode('MLO23456'), b'b\xdd\xad\xf3\xbe')
> +
> +-        map_tests =3D {(b'M1023456', b'L'): b'b\xdd\xad\xf3\xbe',
> +-                     (b'M1023456', b'I'): b'b\x1d\xad\xf3\xbe',
> +-                     }
> +-        for (data, map01), res in map_tests.items():
> +-            data_str =3D data.decode('ascii')
> ++    def test_b32decode_map01(self):
> ++        # Mapping zero and one
> ++        eq =3D self.assertEqual
> ++        res_L =3D b'b\xdd\xad\xf3\xbe'
> ++        res_I =3D b'b\x1d\xad\xf3\xbe'
> ++        eq(base64.b32decode(b'MLO23456'), res_L)
> ++        eq(base64.b32decode('MLO23456'), res_L)
> ++        eq(base64.b32decode(b'MIO23456'), res_I)
> ++        eq(base64.b32decode('MIO23456'), res_I)
> ++        self.assertRaises(binascii.Error, base64.b32decode, b'M1023456'=
)
> ++        self.assertRaises(binascii.Error, base64.b32decode, b'M1O23456'=
)
> ++        self.assertRaises(binascii.Error, base64.b32decode, b'ML023456'=
)
> ++        self.assertRaises(binascii.Error, base64.b32decode, b'MI023456'=
)
> ++
> ++        data =3D b'M1023456'
> ++        data_str =3D data.decode('ascii')
> ++        for map01, res in [(b'L', res_L), (b'I', res_I)]:
> +             map01_str =3D map01.decode('ascii')
> +
> +             eq(base64.b32decode(data, map01=3Dmap01), res)
> +             eq(base64.b32decode(data_str, map01=3Dmap01), res)
> +             eq(base64.b32decode(data, map01=3Dmap01_str), res)
> +             eq(base64.b32decode(data_str, map01=3Dmap01_str), res)
> +-            self.assertRaises(binascii.Error, base64.b32decode, data)
> +-            self.assertRaises(binascii.Error, base64.b32decode, data_st=
r)
> ++
> ++            eq(base64.b32decode(b'M1O23456', map01=3Dmap01), res)
> ++            eq(base64.b32decode(b'M%c023456' % map01, map01=3Dmap01), r=
es)
> ++            eq(base64.b32decode(b'M%cO23456' % map01, map01=3Dmap01), r=
es)
> +
> +     def test_b32decode_error(self):
> +         tests =3D [b'abc', b'ABCDEF=3D=3D', b'=3D=3DABCDEF']
> +--
> +2.43.7
> diff --git a/meta/recipes-devtools/python/python3/CVE-2025-12781_p2.patch=
 b/meta/recipes-devtools/python/python3/CVE-2025-12781_p2.patch
> new file mode 100644
> index 0000000000..6cc7fc54d4
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2025-12781_p2.patch
> @@ -0,0 +1,190 @@
> +From 7b93c8c741c2770962273a217d6216e2eaaa0301 Mon Sep 17 00:00:00 2001
> +From: Serhiy Storchaka <storchaka@gmail.com>
> +Date: Wed, 21 Jan 2026 09:41:58 +0200
> +Subject: [PATCH] gh-125346: Deprecate accepting standard Base64 alphabet=
 when
> + alternative alphabet is used (GH-141128)
> +
> +Emit a warning in base64.urlsafe_b64decode() and base64.b64decode() when
> +the "+" or "/" characters occur in the Base64 data with alternative
> +alphabet if they are not the part of the alternative alphabet.
> +
> +It is a DeprecationWarning in the strict mode (will be error) and
> +a FutureWarning in non-strict mode (will be ignored).
> +
> +CVE: CVE-2025-12781
> +Upstream-Status: Backport [https://github.com/python/cpython/commit/9060=
b4abbe475591b6230b23c2afefeff26fcca5]
> +
> +Backport Changes:
> +- The upstream commit adds documentation and news entry files
> +  (Doc/whatsnew/3.15.rst and Misc/NEWS.d/next/Library/...) which are
> +  specific to the upstream development branch and not present in this
> +  source tree. These changes were excluded from the backport.
> +
> +(cherry picked from commit 9060b4abbe475591b6230b23c2afefeff26fcca5)
> +Signed-off-by: Anil Dongare <adongare@cisco.com>
> +---
> + Doc/library/base64.rst  | 18 +++++++++++++-----
> + Lib/base64.py           | 40 +++++++++++++++++++++++++++++++++++-----
> + Lib/test/test_base64.py | 31 ++++++++++++++++++++++++-------
> + 3 files changed, 72 insertions(+), 17 deletions(-)
> +
> +diff --git a/Doc/library/base64.rst b/Doc/library/base64.rst
> +index 9171e414a79..a6c32ada179 100644
> +--- a/Doc/library/base64.rst
> ++++ b/Doc/library/base64.rst
> +@@ -74,15 +74,20 @@ The modern interface provides:
> +    A :exc:`binascii.Error` exception is raised
> +    if *s* is incorrectly padded.
> +
> +-   If *validate* is ``False`` (the default), characters that are neithe=
r
> ++   If *validate* is false (the default), characters that are neither
> +    in the normal base-64 alphabet nor the alternative alphabet are
> +-   discarded prior to the padding check.  If *validate* is ``True``,
> +-   these non-alphabet characters in the input result in a
> +-   :exc:`binascii.Error`.
> ++   discarded prior to the padding check, but the ``+`` and ``/`` charac=
ters
> ++   keep their meaning if they are not in *altchars* (they will be disca=
rded
> ++   in future Python versions).
> ++   If *validate* is true, these non-alphabet characters in the input
> ++   result in a :exc:`binascii.Error`.
> +
> +    For more information about the strict base64 check, see :func:`binas=
cii.a2b_base64`
> +
> +-   May assert or raise a :exc:`ValueError` if the length of *altchars* =
is not 2.
> ++   .. deprecated:: next
> ++      Accepting the ``+`` and ``/`` characters with an alternative alph=
abet
> ++      is now deprecated.
> ++
> +
> + .. function:: standard_b64encode(s)
> +
> +@@ -113,6 +118,9 @@ The modern interface provides:
> +    ``/`` in the standard Base64 alphabet, and return the decoded
> +    :class:`bytes`.
> +
> ++   .. deprecated:: next
> ++      Accepting the ``+`` and ``/`` characters is now deprecated.
> ++
> +
> + .. function:: b32encode(s)
> +
> +diff --git a/Lib/base64.py b/Lib/base64.py
> +index 846767a3d5a..d21705134d2 100755
> +--- a/Lib/base64.py
> ++++ b/Lib/base64.py
> +@@ -72,20 +72,39 @@ def b64decode(s, altchars=3DNone, validate=3DFalse):
> +     The result is returned as a bytes object.  A binascii.Error is rais=
ed if
> +     s is incorrectly padded.
> +
> +-    If validate is False (the default), characters that are neither in =
the
> ++    If validate is false (the default), characters that are neither in =
the
> +     normal base-64 alphabet nor the alternative alphabet are discarded =
prior
> +-    to the padding check.  If validate is True, these non-alphabet char=
acters
> ++    to the padding check.  If validate is true, these non-alphabet char=
acters
> +     in the input result in a binascii.Error.
> +     For more information about the strict base64 check, see:
> +
> +     https://docs.python.org/3.11/library/binascii.html#binascii.a2b_bas=
e64
> +     """
> +     s =3D _bytes_from_decode_data(s)
> ++    badchar =3D None
> +     if altchars is not None:
> +         altchars =3D _bytes_from_decode_data(altchars)
> +-        assert len(altchars) =3D=3D 2, repr(altchars)
> ++        if len(altchars) !=3D 2:
> ++            raise ValueError(f'invalid altchars: {altchars!r}')
> ++        for b in b'+/':
> ++            if b not in altchars and b in s:
> ++                badchar =3D b
> ++                break
> +         s =3D s.translate(bytes.maketrans(altchars, b'+/'))
> +-    return binascii.a2b_base64(s, strict_mode=3Dvalidate)
> ++    result =3D binascii.a2b_base64(s, strict_mode=3Dvalidate)
> ++    if badchar is not None:
> ++        import warnings
> ++        if validate:
> ++            warnings.warn(f'invalid character {chr(badchar)!a} in Base6=
4 data '
> ++                          f'with altchars=3D{altchars!r} and validate=
=3DTrue '
> ++                          f'will be an error in future Python versions'=
,
> ++                          DeprecationWarning, stacklevel=3D2)
> ++        else:
> ++            warnings.warn(f'invalid character {chr(badchar)!a} in Base6=
4 data '
> ++                          f'with altchars=3D{altchars!r} and validate=
=3DFalse '
> ++                          f'will be discarded in future Python versions=
',
> ++                          FutureWarning, stacklevel=3D2)
> ++    return result
> +
> +
> + def standard_b64encode(s):
> +@@ -130,8 +149,19 @@ def urlsafe_b64decode(s):
> +     The alphabet uses '-' instead of '+' and '_' instead of '/'.
> +     """
> +     s =3D _bytes_from_decode_data(s)
> ++    badchar =3D None
> ++    for b in b'+/':
> ++        if b in s:
> ++            badchar =3D b
> ++            break
> +     s =3D s.translate(_urlsafe_decode_translation)
> +-    return b64decode(s)
> ++    result =3D binascii.a2b_base64(s, strict_mode=3DFalse)
> ++    if badchar is not None:
> ++        import warnings
> ++        warnings.warn(f'invalid character {chr(badchar)!a} in URL-safe =
Base64 data '
> ++                      f'will be discarded in future Python versions',
> ++                      FutureWarning, stacklevel=3D2)
> ++    return result
> +
> +
> +
> +diff --git a/Lib/test/test_base64.py b/Lib/test/test_base64.py
> +index 5167b8560e6..4f6284f1139 100644
> +--- a/Lib/test/test_base64.py
> ++++ b/Lib/test/test_base64.py
> +@@ -234,6 +234,11 @@ def test_b64decode_altchars(self):
> +             eq(base64.b64decode(data, altchars=3Daltchars_str), res)
> +             eq(base64.b64decode(data_str, altchars=3Daltchars_str), res=
)
> +
> ++        self.assertRaises(ValueError, base64.b64decode, b'', altchars=
=3Db'+')
> ++        self.assertRaises(ValueError, base64.b64decode, b'', altchars=
=3Db'+/-')
> ++        self.assertRaises(ValueError, base64.b64decode, '', altchars=3D=
'+')
> ++        self.assertRaises(ValueError, base64.b64decode, '', altchars=3D=
'+/-')
> ++
> +     def test_b64decode_padding_error(self):
> +         self.assertRaises(binascii.Error, base64.b64decode, b'abc')
> +         self.assertRaises(binascii.Error, base64.b64decode, 'abc')
> +@@ -265,13 +270,25 @@ def test_b64decode_invalid_chars(self):
> +             with self.assertRaises(binascii.Error):
> +                 base64.b64decode(bstr.decode('ascii'), validate=3DTrue)
> +
> +-        # Normal alphabet characters not discarded when alternative giv=
en
> +-        res =3D b'\xfb\xef\xff'
> +-        self.assertEqual(base64.b64decode(b'++//', validate=3DTrue), re=
s)
> +-        self.assertEqual(base64.b64decode(b'++//', '-_', validate=3DTru=
e), res)
> +-        self.assertEqual(base64.b64decode(b'--__', '-_', validate=3DTru=
e), res)
> +-        self.assertEqual(base64.urlsafe_b64decode(b'++//'), res)
> +-        self.assertEqual(base64.urlsafe_b64decode(b'--__'), res)
> ++        # Normal alphabet characters will be discarded when alternative=
 given
> ++        with self.assertWarns(FutureWarning):
> ++            self.assertEqual(base64.b64decode(b'++++', altchars=3Db'-_'=
),
> ++                             b'\xfb\xef\xbe')
> ++        with self.assertWarns(FutureWarning):
> ++            self.assertEqual(base64.b64decode(b'////', altchars=3Db'-_'=
),
> ++                             b'\xff\xff\xff')
> ++        with self.assertWarns(DeprecationWarning):
> ++            self.assertEqual(base64.b64decode(b'++++', altchars=3Db'-_'=
, validate=3DTrue),
> ++                             b'\xfb\xef\xbe')
> ++        with self.assertWarns(DeprecationWarning):
> ++            self.assertEqual(base64.b64decode(b'////', altchars=3Db'-_'=
, validate=3DTrue),
> ++                             b'\xff\xff\xff')
> ++        with self.assertWarns(FutureWarning):
> ++            self.assertEqual(base64.urlsafe_b64decode(b'++++'), b'\xfb\=
xef\xbe')
> ++        with self.assertWarns(FutureWarning):
> ++            self.assertEqual(base64.urlsafe_b64decode(b'////'), b'\xff\=
xff\xff')
> ++        with self.assertRaises(binascii.Error):
> ++            base64.b64decode(b'+/!', altchars=3Db'-_')
> +
> +     def test_b32encode(self):
> +         eq =3D self.assertEqual
> +--
> +2.43.7
> diff --git a/meta/recipes-devtools/python/python3_3.12.12.bb b/meta/recip=
es-devtools/python/python3_3.12.12.bb
> index ce2c830655..05d723b4c5 100644
> --- a/meta/recipes-devtools/python/python3_3.12.12.bb
> +++ b/meta/recipes-devtools/python/python3_3.12.12.bb
> @@ -38,6 +38,8 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
>             file://CVE-2025-12084.patch \
>             file://CVE-2025-13836.patch \
>             file://CVE-2025-13837.patch \
> +           file://CVE-2025-12781_p1.patch \
> +           file://CVE-2025-12781_p2.patch \
>             "
> =20
>  SRC_URI:append:class-native =3D " \


--=20
Yoann Congal
Smile ECS


