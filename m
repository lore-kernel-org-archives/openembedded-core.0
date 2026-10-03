Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8347CA5FF2
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 21:43:20 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13638.1791063796714823771
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 14:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SV503HaH;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b02a2359aso234463f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 14:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791063795; x=1791668595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eefE7+d+3qkAlciloRcPj/XCNULTBH0KHfXblshVcMk=;
        b=SV503HaHOSFaNflAzTvCwKngdhlExBUUj+mZPQiUVNp4feyqOa6okqloKKqBMqPUwn
         fq9j9in5kbkLI+hN/DnyxQa2HdJ1Gj8wFmZnYNMybO6TUxmprEvilaK9szomhpAz6XKH
         6EXNYb4hcn4ZyTZsUfL/2bcuDmZNIiEPDFQpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791063795; x=1791668595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eefE7+d+3qkAlciloRcPj/XCNULTBH0KHfXblshVcMk=;
        b=LyQWD4uAFH+QfrBt9qRmJrQnixVGeUeXQB9jJugtQqAXACzbtldtKolUdAJRSiRvDg
         0CJ3iua1z4Joz20/ijN+nCBq8OJmbcxQv4uHSajg6sZ1JrPZA3F1DaxNShTDvNBYcnkT
         3aZjeZ8N5qCaGFIpwvcawLuQ03p51KU215nApKSd7kz63ryrr544ilCEDhbIsf0we17m
         psZ27VHoQ8s1TIvpHlx2XAQuiKLlPpTbJfSIuWlDSsDWeMS+4gd2fmPJw5wjIhMbbqDB
         +bh9kMTFzUfRvvGM3p/fic2ajOtxakLoPjpJ1HQKJnRD5PYfnXMLhAViwPYc9rfPF46k
         Bgew==
X-Gm-Message-State: AFq9FYLZ+nxOEFGg58NyJd9K8YsuO10fO5XLQlruVp5M/9+SowdIGmoF
	aoGY0VUbHaFu8u/BTYEmZf9/Ogs+8IQjX+N1pdj5lOeDQjvA9CBpJCUcNAM1B6C9AQ9Ny9+sfYR
	JC1R7lZY=
X-Gm-Gg: AYBFou0yuSVQelM07LV+Cx82s9GT6/eV12Y4AE2ktCgIq3OgoxHHqzM7exNbyPjHHku
	uQyYQUcQ1h1Xm0/je70U8/NeJqnv9cfSg4zXgI+aJK3NJvCXng1RFhwJXa0afhBu0zKM8q7Nscu
	3fIAtHHM8gA0WXhKKyoc+GZcXz2Y7GVXRgOUfujlzt7eFZfDX9cpG83wk4k7V66Z/6lcWGkOagw
	VEHWzR8xVI7lnpxB6KLde5KLbMbXFUE6F/kgmAvLlHHvlC6Jf8el/WryVHoeatcH2vOhzgsXiig
	mD4Xcu/CQYEnHnk9xDVrSclltbb84qFo1ALH6vTMhTBXTgZRxODPrKEsqnwBFl4v8H38W9qWiej
	a2uC27cJSn4HjQvhaVnBBxEa43SS5Kjfyj4iAwfTRRl795GY13V5X7MWIJwUKu5AyJIeziWnGVE
	WT66dYt8ZlMn7JTcYuEC3JSy9xDkvX8441ga6kRcRgFImzTlwoRZV2CTS3dr41I3DAYh3CmRFuG
	gQk7WKZbzFlukp6NPZeHJRu54gFswWuyjWvEe91xWGuQvg6wGLJfuDksZo8poz80gg=
X-Received: by 2002:a05:6000:2086:b0:48c:54ec:ea3 with SMTP id ffacd0b85a97d-48c54ec1528mr478717f8f.13.1791063794982;
        Sat, 03 Oct 2026 14:43:14 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f04e2sm12832952f8f.15.2026.10.03.14.43.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:43:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/8] python3-pyasn1: fix CVE-2026-30922
Date: Sat,  3 Oct 2026 23:42:15 +0200
Message-ID: <a06649f7300f68d8eb9bc3dd12a3f4148aad26e9.1791061402.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791061402.git.yoann.congal@smile.fr>
References: <cover.1791061402.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 21:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247183

From: Yogita Urade <yurade@cisco.com>

This patch applies upstream fix for CVE-2026-30922 as referenced in [2],
using the upstream commit identified in [1].

[1] https://github.com/pyasn1/pyasn1/commit/25ad481c19fdb006e20485ef3fc2e5b3eff30ef0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-30922

Signed-off-by: Yogita Urade <yurade@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-devtools/python/python-pyasn1.inc |   1 +
 .../python3-pyasn1/CVE-2026-30922.patch       | 262 ++++++++++++++++++
 2 files changed, 263 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index ae96f09fb1d..0fe5e70adfc 100644
--- a/meta/recipes-devtools/python/python-pyasn1.inc
+++ b/meta/recipes-devtools/python/python-pyasn1.inc
@@ -21,6 +21,7 @@ SRC_URI += " \
        file://CVE-2026-23490.patch \
        file://CVE-2026-59886.patch \
        file://CVE-2026-59884.patch \
+       file://CVE-2026-30922.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \
diff --git a/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch
new file mode 100644
index 00000000000..c7b6fe4bff5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch
@@ -0,0 +1,262 @@
+From bcab1fc8f72230ad7ee6d9612a5216cc556e2d0a Mon Sep 17 00:00:00 2001
+From: Simon Pichugin <simon.pichugin@gmail.com>
+Date: Mon, 16 Mar 2026 17:23:11 -0700
+Subject: [PATCH] Merge commit from fork
+
+CVE: CVE-2026-30922
+Upstream-Status: Backport [https://github.com/pyasn1/pyasn1/commit/25ad481c19fdb006e20485ef3fc2e5b3eff30ef0]
+
+(cherry picked from commit 25ad481c19fdb006e20485ef3fc2e5b3eff30ef0)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ pyasn1/codec/ber/decoder.py     |  10 +++
+ tests/codec/ber/test_decoder.py | 116 ++++++++++++++++++++++++++++++++
+ tests/codec/cer/test_decoder.py |  24 +++++++
+ tests/codec/der/test_decoder.py |  42 ++++++++++++
+ 4 files changed, 192 insertions(+)
+
+diff --git a/pyasn1/codec/ber/decoder.py b/pyasn1/codec/ber/decoder.py
+index 18865c2..4d34080 100644
+--- a/pyasn1/codec/ber/decoder.py
++++ b/pyasn1/codec/ber/decoder.py
+@@ -38,6 +38,7 @@ SubstrateUnderrunError = error.SubstrateUnderrunError
+ # Maximum number of continuation octets (high-bit set) allowed per OID arc.
+ # 20 octets allows up to 140-bit integers, supporting UUID-based OIDs
+ MAX_OID_ARC_CONTINUATION_OCTETS = 20
++MAX_NESTING_DEPTH = 100
+ 
+ # Maximum number of octets in a long-form tag ID (20 octets = up to
+ # 140-bit tag IDs, matching the OID arc limit)
+@@ -1519,6 +1520,15 @@ class SingleItemDecoder(object):
+                  decodeFun=None, substrateFun=None,
+                  **options):
+ 
++        _nestingLevel = options.get('_nestingLevel', 0)
++
++        if _nestingLevel > MAX_NESTING_DEPTH:
++            raise error.PyAsn1Error(
++                'ASN.1 structure nesting depth exceeds limit (%d)' % MAX_NESTING_DEPTH
++            )
++
++        options['_nestingLevel'] = _nestingLevel + 1
++
+         allowEoo = options.pop('allowEoo', False)
+ 
+         if LOG:
+diff --git a/tests/codec/ber/test_decoder.py b/tests/codec/ber/test_decoder.py
+index 0152027..672c9af 100644
+--- a/tests/codec/ber/test_decoder.py
++++ b/tests/codec/ber/test_decoder.py
+@@ -2048,6 +2048,122 @@ class CompressedFilesTestCase(BaseTestCase):
+             os.remove(path)
+ 
+ 
++class NestingDepthLimitTestCase(BaseTestCase):
++    """Test protection against deeply nested ASN.1 structures (CVE prevention)."""
++
++    def testIndefLenSequenceNesting(self):
++        """Deeply nested indefinite-length SEQUENCEs must raise PyAsn1Error."""
++        # Each \x30\x80 opens a new indefinite-length SEQUENCE
++        payload = b'\x30\x80' * 200
++        try:
++            decoder.decode(payload)
++        except error.PyAsn1Error:
++            pass
++        else:
++            assert False, 'Deeply nested indef-length SEQUENCEs not rejected'
++
++    def testIndefLenSetNesting(self):
++        """Deeply nested indefinite-length SETs must raise PyAsn1Error."""
++        # Each \x31\x80 opens a new indefinite-length SET
++        payload = b'\x31\x80' * 200
++        try:
++            decoder.decode(payload)
++        except error.PyAsn1Error:
++            pass
++        else:
++            assert False, 'Deeply nested indef-length SETs not rejected'
++
++    def testDefiniteLenNesting(self):
++        """Deeply nested definite-length SEQUENCEs must raise PyAsn1Error."""
++        inner = b'\x05\x00'  # NULL
++        for _ in range(200):
++            length = len(inner)
++            if length < 128:
++                inner = b'\x30' + bytes([length]) + inner
++            else:
++                length_bytes = length.to_bytes(
++                    (length.bit_length() + 7) // 8, 'big')
++                inner = b'\x30' + bytes([0x80 | len(length_bytes)]) + \
++                    length_bytes + inner
++        try:
++            decoder.decode(inner)
++        except error.PyAsn1Error:
++            pass
++        else:
++            assert False, 'Deeply nested definite-length SEQUENCEs not rejected'
++
++    def testNestingUnderLimitWorks(self):
++        """Nesting within the limit must decode successfully."""
++        inner = b'\x05\x00'  # NULL
++        for _ in range(50):
++            length = len(inner)
++            if length < 128:
++                inner = b'\x30' + bytes([length]) + inner
++            else:
++                length_bytes = length.to_bytes(
++                    (length.bit_length() + 7) // 8, 'big')
++                inner = b'\x30' + bytes([0x80 | len(length_bytes)]) + \
++                    length_bytes + inner
++        asn1Object, _ = decoder.decode(inner)
++        assert asn1Object is not None, 'Valid nested structure rejected'
++
++    def testSiblingsDontIncreaseDepth(self):
++        """Sibling elements at the same level must not inflate depth count."""
++        # SEQUENCE containing 200 INTEGER siblings - should decode fine
++        components = b'\x02\x01\x01' * 200  # 200 x INTEGER(1)
++        length = len(components)
++        length_bytes = length.to_bytes(
++            (length.bit_length() + 7) // 8, 'big')
++        payload = b'\x30' + bytes([0x80 | len(length_bytes)]) + \
++            length_bytes + components
++        asn1Object, _ = decoder.decode(payload)
++        assert asn1Object is not None, 'Siblings incorrectly rejected'
++
++    def testErrorMessageContainsLimit(self):
++        """Error message must indicate the nesting depth limit."""
++        payload = b'\x30\x80' * 200
++        try:
++            decoder.decode(payload)
++        except error.PyAsn1Error as exc:
++            assert 'nesting depth' in str(exc).lower(), \
++                'Error message missing depth info: %s' % exc
++        else:
++            assert False, 'Expected PyAsn1Error'
++
++    def testNoRecursionError(self):
++        """Must raise PyAsn1Error, not RecursionError."""
++        payload = b'\x30\x80' * 50000
++        try:
++            decoder.decode(payload)
++        except error.PyAsn1Error:
++            pass
++        except RecursionError:
++            assert False, 'Got RecursionError instead of PyAsn1Error'
++
++    def testMixedNesting(self):
++        """Mixed SEQUENCE and SET nesting must be caught."""
++        # Alternate SEQUENCE (0x30) and SET (0x31) with indef length
++        payload = b''
++        for i in range(200):
++            payload += b'\x30\x80' if i % 2 == 0 else b'\x31\x80'
++        try:
++            decoder.decode(payload)
++        except error.PyAsn1Error:
++            pass
++        else:
++            assert False, 'Mixed nesting not rejected'
++
++    def testWithSchema(self):
++        """Deeply nested structures must be caught even with schema."""
++        payload = b'\x30\x80' * 200
++        try:
++            decoder.decode(payload, asn1Spec=univ.Sequence())
++        except error.PyAsn1Error:
++            pass
++        else:
++            assert False, 'Deeply nested with schema not rejected'
++
++
+ class NonStreamingCompatibilityTestCase(BaseTestCase):
+     def setUp(self):
+         from pyasn1 import debug
+diff --git a/tests/codec/cer/test_decoder.py b/tests/codec/cer/test_decoder.py
+index d759f76..2994846 100644
+--- a/tests/codec/cer/test_decoder.py
++++ b/tests/codec/cer/test_decoder.py
+@@ -389,6 +389,30 @@ class SequenceDecoderWithExplicitlyTaggedSetOfOpenTypesTestCase(BaseTestCase):
+         assert s[1][0] == univ.OctetString(hexValue='02010C')
+ 
+ 
++class NestingDepthLimitTestCase(BaseTestCase):
++    """Test CER decoder protection against deeply nested structures."""
++
++    def testIndefLenNesting(self):
++        """Deeply nested indefinite-length SEQUENCEs must raise PyAsn1Error."""
++        payload = b'\x30\x80' * 200
++        try:
++            decoder.decode(payload)
++        except PyAsn1Error:
++            pass
++        else:
++            assert False, 'Deeply nested indef-length SEQUENCEs not rejected'
++
++    def testNoRecursionError(self):
++        """Must raise PyAsn1Error, not RecursionError."""
++        payload = b'\x30\x80' * 50000
++        try:
++            decoder.decode(payload)
++        except PyAsn1Error:
++            pass
++        except RecursionError:
++            assert False, 'Got RecursionError instead of PyAsn1Error'
++
++
+ suite = unittest.TestLoader().loadTestsFromModule(sys.modules[__name__])
+ 
+ if __name__ == '__main__':
+diff --git a/tests/codec/der/test_decoder.py b/tests/codec/der/test_decoder.py
+index 726c999..3a81a6e 100644
+--- a/tests/codec/der/test_decoder.py
++++ b/tests/codec/der/test_decoder.py
+@@ -396,6 +396,48 @@ class SequenceDecoderWithExplicitlyTaggedSetOfOpenTypesTestCase(BaseTestCase):
+         assert s[1][0] == univ.OctetString(hexValue='02010C')
+ 
+ 
++class NestingDepthLimitTestCase(BaseTestCase):
++    """Test DER decoder protection against deeply nested structures."""
++
++    def testDefiniteLenNesting(self):
++        """Deeply nested definite-length SEQUENCEs must raise PyAsn1Error."""
++        inner = b'\x05\x00'  # NULL
++        for _ in range(200):
++            length = len(inner)
++            if length < 128:
++                inner = b'\x30' + bytes([length]) + inner
++            else:
++                length_bytes = length.to_bytes(
++                    (length.bit_length() + 7) // 8, 'big')
++                inner = b'\x30' + bytes([0x80 | len(length_bytes)]) + \
++                    length_bytes + inner
++        try:
++            decoder.decode(inner)
++        except PyAsn1Error:
++            pass
++        else:
++            assert False, 'Deeply nested definite-length SEQUENCEs not rejected'
++
++    def testNoRecursionError(self):
++        """Must raise PyAsn1Error, not RecursionError."""
++        inner = b'\x05\x00'
++        for _ in range(200):
++            length = len(inner)
++            if length < 128:
++                inner = b'\x30' + bytes([length]) + inner
++            else:
++                length_bytes = length.to_bytes(
++                    (length.bit_length() + 7) // 8, 'big')
++                inner = b'\x30' + bytes([0x80 | len(length_bytes)]) + \
++                    length_bytes + inner
++        try:
++            decoder.decode(inner)
++        except PyAsn1Error:
++            pass
++        except RecursionError:
++            assert False, 'Got RecursionError instead of PyAsn1Error'
++
++
+ suite = unittest.TestLoader().loadTestsFromModule(sys.modules[__name__])
+ 
+ if __name__ == '__main__':
+-- 
+2.44.4

