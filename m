Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F8FC98317
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 12:16:44 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6477.1790252199890859313
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 05:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kMjqM14x;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10342; q=dns/txt;
  s=iport01; t=1790252199; x=1791461799;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U2K0IA+FvhzW6a6RgW7y3D5YBPtT41cVkDsKAajd0/s=;
  b=kMjqM14xsDu4OC5Kq/R/ZxkPiqjRsQj2silTNbB8BKu+NWyCae1A1CmG
   bwPP31akwjFLybqIqbtvdb04NgVBhizb0wgf//jmqeJqwE+OQyr7oRdXT
   LHZWQ9SyOSq2QuXA3dGP8W0BgV40FctDs22V6JWLF3dZ0AKdrli/jWcit
   7G4BgwAlbFOTNwZ/i7ixWzKR4DUCTSfM4jfBITf2MLFNQ2PHMhIj2KE4i
   JKwrzu2n3vociDXkJj1J0GCTvN6xh6RLD5MrrSoCCOUAtObhnu4vlffHM
   tJyYRZtf4oxfL9sJi3ez7WPRNt/Gkn9karMFltp2bmLmw+OWzkbpE1RaP
   Q==;
X-CSE-ConnectionGUID: esCiIdMfTKC9HfgZLzJg6w==
X-CSE-MsgGUID: MeJpto6aQvG09GNWPARjyg==
X-IPAS-Result: =?us-ascii?q?A0BRAgDbE7Vq/4//Ja1aHgEBCxIMggULgld1YENJlCmCI?=
 =?us-ascii?q?YtnkjaBfg8BAQEPRA0EAQGEP0YCjgkCJjQJDgECBAMCAwEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QoBAQUBAQECAQcFgQ4Thk8NkBIBOAFyAwECTwsjIYMCAYI6AzcDEcAbgiyBA?=
 =?us-ascii?q?YNpAkNQ2EsNcoFoAQsUAYE4hUCCf4UkXRgBhHwnG4FJRIEVg2mBBYEaQgEBg?=
 =?us-ascii?q?TiGbQSDLoFaHpMJSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EHGwYFg?=
 =?us-ascii?q?R2BIIIaIxk2eoEJXoErKWEQF4EJggcCglSCAQIBSUMOB0VTCSVBChJHJiIIE?=
 =?us-ascii?q?gkBExowC4EjOkEKGA1IESw3FRkEPm4HkBMegmR7EwEKIYEFGzcmUZNOkgaBN?=
 =?us-ascii?q?Z5pcYQojCKPPoV8GjOFW6USC5h9jgqECZFqXYRpgWg8gUcLBzMaCBsVgyIJS?=
 =?us-ascii?q?hkPjisDCwuDYIF/g2XGVScyCzIBAQcCBw4DC4FokAGBfQEB?=
IronPort-Data: A9a23:mV63DqwbO+cqPqsrs5h6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUGy
 GsYD2uObKuOZDagLo8lO4jko0kOsJWByoJmSFRv+FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWYlaD5MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEwtFow59sN5PUJlp
 NwWJwIpfDKM2f3jldpXSsE07igiBNPgMIVavjRryivUSK54B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOHWjOX9PYH46tPa1nHDzfhVTqUmeouw85G27IAlZjeKzbYaKJozQLSlTtmOVh
 Hra+DrwOw81bI2w7wW920iul+CayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1jfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9FCjBnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:4590y6sak4LZl4v25FOVvG0e7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBEDjexLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: =?us-ascii?q?9a23=3APJqwgmtUEAv9E/iuZBvVe0Tg6IsoaVbc7Xv1LXO?=
 =?us-ascii?q?bIjdJRrKnbU2y9/17xp8=3D?=
X-Talos-MUID: 9a23:aRtNhAq1ijCzVjwKnhsezxRvFt905PqnMV4iycQpnfa8HBZyKjjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,120,1787011200"; 
   d="scan'208";a="526547482"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Sep 2026 12:16:00 +0000
Received: from sjc-ads-4926.cisco.com (sjc-ads-4926.cisco.com [10.28.39.190])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 33382180000B5
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 12:16:00 +0000 (GMT)
Received: by sjc-ads-4926.cisco.com (Postfix, from userid 1889728)
	id CDD54CC124A; Thu, 24 Sep 2026 05:15:59 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core[scarthgap][v2][PATCH 1/2] python3-pyasn1: fix CVE-2026-30922
Date: Thu, 24 Sep 2026 05:15:57 -0700
Message-ID: <20260924121559.3071108-1-yurade@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4926.cisco.com [10.28.39.190];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.190, sjc-ads-4926.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 12:16:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246584

This patch applies upstream fix for CVE-2026-30922 as referenced in [2],
using the upstream commit identified in [1].

[1] https://github.com/pyasn1/pyasn1/commit/25ad481c19fdb006e20485ef3fc2e5b3eff30ef0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-30922

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../recipes-devtools/python/python-pyasn1.inc |   1 +
 .../python3-pyasn1/CVE-2026-30922.patch       | 262 ++++++++++++++++++
 2 files changed, 263 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index ae96f09fb1..0fe5e70adf 100644
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
index 0000000000..c7b6fe4bff
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
-- 
2.44.4


