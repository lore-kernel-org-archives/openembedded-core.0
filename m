Return-Path: <evekariy@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA787C5DF8C
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 18:26:26 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1149.1787336785440482826
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 11:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ae7AsEbq;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: evekariy@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10135; q=dns/txt;
  s=iport01; t=1787336785; x=1788546385;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I3BFnP84FzrggciQFTiJiDaUJcWTJLUO/QAuhW8oUgQ=;
  b=ae7AsEbqo0kk00Dod3GhaCHMmB8VHYGNZw3FQVQFVbWTRCEBsFQqsWlw
   PsxWQqiNLvSlECO7owVWfMwLZqlVHvzQKVubk8mb8kj/6BP4G7k3uV434
   XsKe0rvnsn2dX4mjrVK6gpsNq1JoGMUR5a/4UM+2ymZUSTbHJc3lDW3Sz
   RGDdNR2C75L+8UOOpxevXV4Mo/Bg9iOohOYRlFNVdKHwwbiVYfBSavyiz
   CvB0vsp306q38uRWds6LoidtwYfhWeAhOTqLt6/Hu1uV3V+arbM30JbeZ
   KPhY9WZn57oikiFiifrFa27FP+fgBmOk7X5XL8EkquhQx98q7VwgE/nFQ
   w==;
X-CSE-ConnectionGUID: IiWzMCdlT5u8ZMURz8jcIg==
X-CSE-MsgGUID: e10ixrskRiGpiuZq/bNtGg==
X-IPAS-Result: =?us-ascii?q?A0AbAAAil4hq/5AQJK1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ0X0JJjHKJWItnEJIngX4PAQEBD0QNBAEBhD9GjW4CJjQJDgECB?=
 =?us-ascii?q?AMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECATUBRiwDAQJPC?=
 =?us-ascii?q?yMhgwIBgjoDNwIBEcIDgiyBAYNoAkPZGw1ygWYBCxQBgTgBhT4fgmCFI10YA?=
 =?us-ascii?q?YR8JxuBSUSBFYNpgQWBGkIBAYglBIMugVoekVZIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ6gQlegSspYAESF4EJggcCglqCB?=
 =?us-ascii?q?QIBSUMOB0gVCxgNSBEsNxQZBD5uB45UH4JNexMBCiEggQBlk1VEkgSBNZ5pc?=
 =?us-ascii?q?YQojCKPPoV8GjOFW6URC5h9jgqECZJHhGmBaDyBRwsHTSMVgyIJShkPjioOC?=
 =?us-ascii?q?4NggX+DZcZVJDULMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:moIOE6q4b0tlPDm012qK4ermSLBeBmJOZBIvgKrLsJaIsI4StFCzt
 garIBmBbviMNmvyc9pzb43k9RhX78KDxoA2SwBupHtkRnkT+ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrT8ko35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0sd2PnNr3
 vAcFG0QPiKmutikkLCwa+Y506zPLOGzVG8eknhkyTecCbMtRorOBv2Vo9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtLYH49tL/Aan3XfiNVq1uPpLsf6GnIxws327/oWDbQUozTGZUExhfB+
 woq+Uz0W0kbJMaEygCE3Wqtm93W2indRK0dQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwAiJzqyR50OSAXIJC2YeLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:578eFqDD3Bb5nEXlHema55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njdLz7lq+P3lpxBQozlvhBQcT0=
X-Talos-CUID: 9a23:O2ngu24f2Txs9gQ9hdss1U8rCOUOfnnhkWqAEWqFM3Q5Sra0RgrF
X-Talos-MUID: 9a23:i9+cDAor75HbKce+sLoezzw7bMZ4+b+tMkEiiZQbidDDPwpsFDjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,235,1779148800"; 
   d="scan'208";a="814890915"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Aug 2026 18:26:24 +0000
Received: from sjc-ads-4126.cisco.com (sjc-ads-4126.cisco.com [171.70.54.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 4C79B180001D1;
	Fri, 21 Aug 2026 18:26:24 +0000 (GMT)
Received: by sjc-ads-4126.cisco.com (Postfix, from userid 1834987)
	id E22A4CC12A6; Fri, 21 Aug 2026 11:26:23 -0700 (PDT)
From: Emily Vekariya <evekariy@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: sankpare@cisco.com,
	ipasha@cisco.com,
	ranjirat@cisco.com,
	vchavda@cisco.com,
	Emily Vekariya <evekariy@cisco.com>
Subject: [OE-core][scarthgap][PATCH 1/2] python3-pyasn1: Fix CVE-2026-59886
Date: Fri, 21 Aug 2026 11:25:49 -0700
Message-Id: <20260821182550.23177-1-evekariy@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4126.cisco.com [171.70.54.147];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.147, sjc-ads-4126.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 18:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243950

The univ.Real type converts its mantissa, base, and exponent to a Python
float using exact big-integer exponentiation. A BER, CER, or DER encoded
REAL value only a few bytes long can carry a very large exponent, causing
float conversion through prettyPrint(), str(), comparison, arithmetic,
int(), or an explicit float() call to consume excessive CPU and memory and
hang applications that decode untrusted ASN.1 data and then print, log, or
compare the decoded objects.

scarthgap ships pyasn1 0.5.1, which is affected as the issue is present in
all versions before 0.6.4.

Pick the upstream patch [1] as mentioned in [2].

[1] https://github.com/pyasn1/pyasn1/commit/e60c691cb91addb8fcefa2f537e85ede6fb1e886
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59886

Signed-off-by: Emily Vekariya <evekariy@cisco.com>
---
 .../recipes-devtools/python/python-pyasn1.inc |   1 +
 .../python3-pyasn1/CVE-2026-59886.patch       | 252 ++++++++++++++++++
 2 files changed, 253 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59886.patch

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index 96b4a3b52a..1780ee1d88 100644
--- a/meta/recipes-devtools/python/python-pyasn1.inc
+++ b/meta/recipes-devtools/python/python-pyasn1.inc
@@ -19,6 +19,7 @@ inherit ptest
 SRC_URI += " \
        file://run-ptest \
        file://CVE-2026-23490.patch \
+       file://CVE-2026-59886.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \
diff --git a/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59886.patch b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59886.patch
new file mode 100644
index 0000000000..80468c6a5e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59886.patch
@@ -0,0 +1,252 @@
+From 9b89b511a7284f17ef3a2de6d05fbf6030133abb Mon Sep 17 00:00:00 2001
+From: Simon Pichugin <simon.pichugin@gmail.com>
+Date: Wed, 8 Jul 2026 17:32:09 -0700
+Subject: [PATCH] Merge commit from fork
+
+CVE: CVE-2026-59886
+Upstream-Status: Backport [https://github.com/pyasn1/pyasn1/commit/e60c691cb91addb8fcefa2f537e85ede6fb1e886]
+
+(cherry picked from commit e60c691cb91addb8fcefa2f537e85ede6fb1e886)
+Signed-off-by: Emily Vekariya <evekariy@cisco.com>
+---
+ pyasn1/type/univ.py             | 21 +++++++++----
+ tests/codec/ber/test_decoder.py | 53 +++++++++++++++++++++++++++------
+ tests/codec/cer/test_decoder.py | 10 +++++++
+ tests/codec/der/test_decoder.py | 19 ++++++++++++
+ tests/type/test_univ.py         | 40 +++++++++++++++++++++++++
+ 5 files changed, 129 insertions(+), 14 deletions(-)
+
+diff --git a/pyasn1/type/univ.py b/pyasn1/type/univ.py
+index c5d0778..adff2df 100644
+--- a/pyasn1/type/univ.py
++++ b/pyasn1/type/univ.py
+@@ -1318,7 +1318,7 @@ class Real(base.SimpleAsn1Type):
+     def __normalizeBase10(value):
+         m, b, e = value
+         while m and m % 10 == 0:
+-            m /= 10
++            m //= 10
+             e += 1
+         return m, b, e
+ 
+@@ -1457,10 +1457,21 @@ class Real(base.SimpleAsn1Type):
+     def __float__(self):
+         if self._value in self._inf:
+             return self._value
+-        else:
+-            return float(
+-                self._value[0] * pow(self._value[1], self._value[2])
+-            )
++
++        mantissa, base, exponent = self._value
++
++        if not mantissa:
++            return 0.0
++
++        if base == 2:
++            return math.ldexp(float(mantissa), exponent)
++
++        # base is 10 (prettyIn() rejects everything else); refuse to
++        # materialize astronomically large integers via pow()
++        if exponent > sys.float_info.max_10_exp:
++            raise OverflowError('Real value too large to convert to float')
++
++        return float(mantissa * pow(base, exponent))
+ 
+     def __abs__(self):
+         return self.clone(abs(float(self)))
+diff --git a/tests/codec/ber/test_decoder.py b/tests/codec/ber/test_decoder.py
+index f033dfd..f6ff7b0 100644
+--- a/tests/codec/ber/test_decoder.py
++++ b/tests/codec/ber/test_decoder.py
+@@ -21,6 +21,7 @@ from pyasn1.type import univ
+ from pyasn1.type import char
+ from pyasn1.codec import streaming
+ from pyasn1.codec.ber import decoder
++from pyasn1.codec.ber import encoder
+ from pyasn1.codec.ber import eoo
+ from pyasn1.compat.octets import ints2octs, str2octs, null
+ from pyasn1 import error
+@@ -547,17 +548,51 @@ class RealDecoderTestCase(BaseTestCase):
+             ints2octs((9, 4, 161, 255, 1, 3))
+         ) == (univ.Real((3, 2, -1020)), null)
+ 
+-# TODO: this requires Real type comparison fix
++    def testBin6(self):  # large exponent, base = 16
++        value, rest = decoder.decode(
++            bytes((9, 5, 162, 0, 255, 255, 1))
++        )
++
++        assert tuple(value) == (1, 2, 262140)
++        assert rest == b''
++
++    def testBin7(self):  # large exponent in 4-octet form, base = 16
++        value, rest = decoder.decode(
++            bytes((9, 7, 227, 4, 1, 35, 69, 103, 1))
++        )
+ 
+-#    def testBin6(self):
+-#        assert decoder.decode(
+-#            ints2octs((9, 5, 162, 0, 255, 255, 1))
+-#        ) == (univ.Real((1, 2, 262140)), null)
++        assert tuple(value) == (-1, 2, 76354972)
++        assert rest == b''
++
++    def testLargeBinaryRoundTrip(self):
++        substrate = encoder.encode(univ.Real((-1, 2, 76354972)))
++        value, rest = decoder.decode(substrate)
++
++        assert tuple(value) == (-1, 2, 76354972)
++        assert rest == b''
++
++    def testLongFormBinaryRealExponentLength(self):
++        value, rest = decoder.decode(
++            bytes((9, 6, 0x83, 3, 0x0f, 0x42, 0x40, 1))
++        )
+ 
+-#    def testBin7(self):
+-#        assert decoder.decode(
+-#            ints2octs((9, 7, 227, 4, 1, 35, 69, 103, 1))
+-#        ) == (univ.Real((-1, 2, 76354972)), null)
++        assert tuple(value) == (1, 2, 1000000)
++        assert rest == b''
++
++    def testLargeBinaryPrettyPrintOverflow(self):
++        value, rest = decoder.decode(
++            b'\t\t\xeb\x060662.666\xd0B\x00\x00\x00\x00\x00\x00\x00'
++        )
++
++        assert value.prettyPrint() == '<overflow>'
++        assert rest == b'6\xd0B\x00\x00\x00\x00\x00\x00\x00'
++
++        try:
++            float(value)
++        except OverflowError:
++            pass
++        else:
++            assert 0, '__float__() tolerated overflow'
+ 
+     def testPlusInf(self):
+         assert decoder.decode(
+diff --git a/tests/codec/cer/test_decoder.py b/tests/codec/cer/test_decoder.py
+index 133affd..3d27194 100644
+--- a/tests/codec/cer/test_decoder.py
++++ b/tests/codec/cer/test_decoder.py
+@@ -15,6 +15,7 @@ from pyasn1.type import opentype
+ from pyasn1.type import univ
+ from pyasn1.codec.cer import decoder
+ from pyasn1.compat.octets import ints2octs, str2octs, null
++from pyasn1.codec.cer import encoder
+ from pyasn1.error import PyAsn1Error
+ 
+ 
+@@ -66,6 +67,15 @@ class OctetStringDecoderTestCase(BaseTestCase):
+     # TODO: test failures on short chunked and long unchunked substrate samples
+ 
+ 
++class RealDecoderTestCase(BaseTestCase):
++    def testLargeBinaryRoundTrip(self):
++        substrate = encoder.encode(univ.Real((-1, 2, 76354972)))
++        value, rest = decoder.decode(substrate)
++
++        assert tuple(value) == (-1, 2, 76354972)
++        assert rest == b''
++
++
+ class SequenceDecoderWithUntaggedOpenTypesTestCase(BaseTestCase):
+     def setUp(self):
+         openType = opentype.OpenType(
+diff --git a/tests/codec/der/test_decoder.py b/tests/codec/der/test_decoder.py
+index 5bc9deb..553563c 100644
+--- a/tests/codec/der/test_decoder.py
++++ b/tests/codec/der/test_decoder.py
+@@ -15,6 +15,7 @@ from pyasn1.type import opentype
+ from pyasn1.type import univ
+ from pyasn1.codec.der import decoder
+ from pyasn1.compat.octets import ints2octs, null
++from pyasn1.codec.der import encoder
+ from pyasn1.error import PyAsn1Error
+ 
+ 
+@@ -72,6 +73,24 @@ class OctetStringDecoderTestCase(BaseTestCase):
+             assert 0, 'chunked encoding tolerated'
+ 
+ 
++class RealDecoderTestCase(BaseTestCase):
++    def testCanonicalLargeBinaryReal(self):
++        substrate = encoder.encode(univ.Real((1, 2, 1000000)))
++        assert substrate == bytes((9, 5, 0x82, 0x0f, 0x42, 0x40, 1))
++
++        value, rest = decoder.decode(substrate)
++
++        assert tuple(value) == (1, 2, 1000000)
++        assert rest == b''
++
++    def testLargeBinaryRoundTrip(self):
++        substrate = encoder.encode(univ.Real((-1, 2, 76354972)))
++        value, rest = decoder.decode(substrate)
++
++        assert tuple(value) == (-1, 2, 76354972)
++        assert rest == b''
++
++
+ class SequenceDecoderWithUntaggedOpenTypesTestCase(BaseTestCase):
+     def setUp(self):
+         openType = opentype.OpenType(
+diff --git a/tests/type/test_univ.py b/tests/type/test_univ.py
+index 8aec183..bc21c37 100644
+--- a/tests/type/test_univ.py
++++ b/tests/type/test_univ.py
+@@ -780,9 +780,49 @@ class RealTestCase(BaseTestCase):
+     def testFloat(self):
+         assert float(univ.Real(4.0)) == 4.0, '__float__() fails'
+ 
++    def testFloatBase10Precision(self):
++        assert float(univ.Real((3, 10, 23))) == 3e23, '__float__() lost base-10 behavior'
++
++    def testFloatOverflow(self):
++        try:
++            float(univ.Real((1, 2, 1000000)))
++        except OverflowError:
++            pass
++        else:
++            assert 0, '__float__() tolerated overflow'
++
++        assert univ.Real((1, 2, 1000000)).prettyPrint() == '<overflow>'
++
++    def testFloatUnderflow(self):
++        assert float(univ.Real((1, 2, -1000000))) == 0.0, '__float__() failed underflow'
++
++    def testFloatZeroMantissa(self):
++        assert float(univ.Real((0, 10, 1000000000))) == 0.0, '__float__() failed zero mantissa'
++        assert float(univ.Real((0, 2, 1000000000))) == 0.0, '__float__() failed zero mantissa'
++
++    def testFloatBase10Overflow(self):
++        try:
++            float(univ.Real((1, 10, sys.float_info.max_10_exp + 1)))
++        except OverflowError:
++            pass
++        else:
++            assert 0, '__float__() tolerated base-10 overflow'
++
++    def testFloatBase10NormalizedOverflow(self):
++        try:
++            float(univ.Real((10, 10, sys.float_info.max_10_exp)))
++        except OverflowError:
++            pass
++        else:
++            assert 0, '__float__() tolerated normalized base-10 overflow'
++
+     def testPrettyIn(self):
+         assert univ.Real((3, 10, 0)) == 3, 'prettyIn() fails'
+ 
++    def testPrettyInBigBase10Mantissa(self):
++        assert tuple(univ.Real((10 ** 400, 10, 0))) == (1, 10, 400), \
++            'prettyIn() big mantissa normalization fails'
++
+     # infinite float values
+     def testStrInf(self):
+         assert str(univ.Real('inf')) == 'inf', 'str() fails'
+-- 
+2.34.1
+
-- 
2.35.6


