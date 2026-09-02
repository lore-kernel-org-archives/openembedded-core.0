Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92ED3C624D7
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:26:47 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5664.1788326797932268783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ucWENmrw;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956869750eso3476675e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326796; x=1788931596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zxFdS8NvSPpssBJNW0ub8csbCQgk5CGHv3afFwCrAng=;
        b=ucWENmrwphL7W1YixLcSg4ImeRvhRTVq3KrhLnVofRZqANpbmUgpfpWoXyR0iposgg
         AhpBDNL5BYPW9Sh42mhY9d4Rw0N/ZeqWh7JiTtOMjzEYYLRVDFTzDFQTXCU8QYhKr9aD
         T3oz/lsVk+Li+Xnf37P85f4lGYltc0G3pBtdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326796; x=1788931596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zxFdS8NvSPpssBJNW0ub8csbCQgk5CGHv3afFwCrAng=;
        b=Ly2G9KtY2iQXBjmuxY32SEZYmcpyrhZfiZVXstmHaSBlfni2IMpWu5YFtZj0XzkLhg
         wUIRbz/gzGP9j7ggEo+Opcnm2LsLSh3Gf3g0LTzdOO/kMicyKFhHpCpLPjIEs5nmV1W5
         RFshpwSLgaFIG+iVBbEVo8OBWcxK3s6BftlHjgt8xykRpbR6SwBKLB6v+YeA5Q0p0SWX
         T9c35osEIkoQPhjXDXCN/+1ONG4VFjosjFafKxOjd120XQs1rWAM/Wr86N3NFpehFmS/
         TuxCi6n4clmCD82dZVZZDaoQ5h1ZkOtN1vrWbI8O97O95ytvDSv5s8+5FN3nutcaKZ+G
         mCUg==
X-Gm-Message-State: AFuF++lihbmyfd1ytzjadzTcwPCeIXYpq8REsMWwe3cFJSKlm1wdtslM
	wp5An7NBMaNxFAwxtUpETZnB0oC6SjSBCKbtzqmp2bazsrOZDFG9r9pSJt/RUDIPGj4mQNIATkW
	eDfLSZDc=
X-Gm-Gg: AR+sD10CfSeT6U7xMgCUKfUcYhlmGadVX5m8XrCJLdKIBFL7DxJu8664QPXKB9O+Cbo
	ZhrE7+l2nMr++YpCFOLSuSoHkgYzUnmTdfhvAq01mWaVcqumh0bpDDRLrmjTv6+w0vLrucAA8gV
	3ATlg2X1KaKn1CzgKitJlK/XNmI+RcBCaQo0eHEW934y8AU5BmJH+txIsTugKapiGcHFx1LvoY2
	GzN44m3FZYw1gN6VB6SUYTdKpP2kRSvLbuA1p5D2eyE1lVfE28fuEeoafWBVaBDw7AqebGe2tfz
	gnNkPTrrUoLfDsztRcWfqBuMPk489+0eYZahScIvCkmAwlvy8EfQV/ZEoBsh4LoiLqnSh8hVAmX
	ZWFAV7xkMhaqCfkETi0yf8MMXEkcVzzOqxvLwIuoLIdDlCFVXUlCTMmltrPlBUWEgVFz7Dme9nn
	so2TFkSq0zU5siHsF5Qu7XcfcVq1AeQI/JXMHut8Vpu81UE5o8PCIRVWiin5KwlOZDIaPmQ77bS
	BUuE2nKf/yyTadG9w==
X-Received: by 2002:a05:600c:530f:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-49ce55ecdf2mr37825015e9.3.1788326796106;
        Tue, 01 Sep 2026 22:26:36 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.26.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:26:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/27] python3-pyasn1: Fix CVE-2026-59886
Date: Wed,  2 Sep 2026 07:25:21 +0200
Message-ID: <24991f7383dbe229a696ad209ae7d58115a051a1.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244855

From: Emily Vekariya <evekariy@cisco.com>

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-devtools/python/python-pyasn1.inc |   1 +
 .../python3-pyasn1/CVE-2026-59886.patch       | 252 ++++++++++++++++++
 2 files changed, 253 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59886.patch

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index 96b4a3b52a6..1780ee1d888 100644
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
index 00000000000..80468c6a5e8
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

