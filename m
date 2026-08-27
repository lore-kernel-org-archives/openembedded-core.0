Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37B8C5DF9D
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 06:31:36 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30209.1787812291936981484
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 23:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QAKK1cxn;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10224; q=dns/txt;
  s=iport01; t=1787812291; x=1789021891;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HUFRxhn9CTV0M7BC0qTcnPQD0h+abxeTr5BkBaCzH6k=;
  b=QAKK1cxnu0P9x0maXoU3FhAqPUyEAGtv63CGtDQNdak1/yfXZhmNF6Lo
   OqouMukQl+gKRdehjJomEgdjPXV5KLfxSxcfIvID+GnaoauybLbWJY1Id
   4SgRoHnoS/RRKaxxmeizzYpJ4YAAnIB8YDZNYolaidgmF39pRH87D13jT
   P2sftc0deZnFNWHtnmC1L072GQYtotf4qonf7M/l/IoHLxahcMBCZKtpw
   XCLq40bDv700eprrQGi65bXCXjuIlSrDY2rJQ3w8t3jkE6QmH30/0l9L8
   66wLXGvuaxAiT7nyktbHWCaCe54yRs7+fxyruMykVQfg6VccwjkJ0Sjab
   A==;
X-CSE-ConnectionGUID: reStC1o5TguiP2mziOpQ2Q==
X-CSE-MsgGUID: uunsesn6TTy1mHgZ3BJSEA==
X-IPAS-Result: =?us-ascii?q?A0BEAgDF2I9q/4sQJK1aHgEBCxIMggULgld0XkNJlCmCI?=
 =?us-ascii?q?YtnkjeBfg8BAQEPRA0EAQGEP0YCjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QoBAQUBAQECAQcFgQ4Thk8NhloBOAFyAwECTwsjIYMCAYI6AzcDEb5ugiyBA?=
 =?us-ascii?q?YNoAkNQ2EsNcoFmAQsUAYE4hT+Cf4UjXRgBhHwnG4FJRIEVg2mBBYEaQgEBg?=
 =?us-ascii?q?TiGbQSDLoFaHpFvSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFg?=
 =?us-ascii?q?R2BKIQQIxk2fIEJXoErKWESF4EJggcCglqCBQIBSUMOB0dDCxgNSBEsNxUZB?=
 =?us-ascii?q?D5uB45vH4JOexMBK4EFGzcmUZNOkgaBNZ5pcYQojCKPPoV8GjOFW6URC5h9j?=
 =?us-ascii?q?gqECZFqXYRpgWg8gUcLBzMaCBsVgyIJShkPjioDCwuDYIF/g2XGVScyCzIBA?=
 =?us-ascii?q?QcCBw4DC4FokAGBfQEB?=
IronPort-Data: A9a23:FCsGGqx++bx+fvR+Q3p6t+djxyrEfRIJ4+MujC+fZmUNrF6WrkVVm
 2tKXj/TPv6OYWShKtp+bozi/BwE7ZSGydNlGVRkrlhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHybuiJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaD1MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFs7BpEzo+EqPW5T9
 MRCLSIMSQi63dvjldpXSsE07igiBMDvOIVavjRryivUSK58B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNU+RC/FMEg9/5JYWjfqyj3XyWzZZs1mS46Ew5gA/ySQhi+e9aYuKK4DiqcN9g1uev
 W/d+TrFPgBDMfyQ+2Gv0EmBr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++MuUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:y4hdFqmKSfqev1iK4c5sHOePy4LpDfIc3DAbv31ZSRFFG/Fw8P
 re/sjzuiWbtN98YhwdcLO7Scq9qA3nlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadE/DFCm5rY4ts3CBxWPGVXV50=
X-Talos-CUID: =?us-ascii?q?9a23=3A/7ImKmpA0noppWA9DvDIH3/mUdooSWH2lXCNH0C?=
 =?us-ascii?q?lCF4zTa+Ubkepopoxxg=3D=3D?=
X-Talos-MUID: 9a23:Ey5zWQWngbkXBFvq/CLxgipvL8E235i/UUUtnqddkeu/GAUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,246,1779148800"; 
   d="scan'208";a="837819794"
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Aug 2026 06:31:31 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id CB1531800021A
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 06:31:30 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 692CFCEA2DD; Wed, 26 Aug 2026 23:31:30 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 1/2] python3-pyasn1: fix CVE-2026-30922
Date: Wed, 26 Aug 2026 23:31:28 -0700
Message-Id: <20260827063129.3205882-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 06:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244457

This patch applies upstream fix for CVE-2026-30922 as referenced in [2],
using the upstream commit identified in [1].

[1] https://github.com/pyasn1/pyasn1/commit/25ad481c19fdb006e20485ef3fc2e5b3eff30ef0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-30922

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../recipes-devtools/python/python-pyasn1.inc |   1 +
 .../python3-pyasn1/CVE-2026-30922.patch       | 260 ++++++++++++++++++
 2 files changed, 261 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index 96b4a3b52a..d69cdf8877 100644
--- a/meta/recipes-devtools/python/python-pyasn1.inc
+++ b/meta/recipes-devtools/python/python-pyasn1.inc
@@ -19,6 +19,7 @@ inherit ptest
 SRC_URI += " \
        file://run-ptest \
        file://CVE-2026-23490.patch \
+       file://CVE-2026-30922.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \
diff --git a/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch
new file mode 100644
index 0000000000..aad4829f82
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch
@@ -0,0 +1,260 @@
+From b10f9a671c66a99b91bd916e62a0c81541094dd6 Mon Sep 17 00:00:00 2001
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
+index be8ba65..da2a048 100644
+--- a/pyasn1/codec/ber/decoder.py
++++ b/pyasn1/codec/ber/decoder.py
+@@ -38,6 +38,7 @@ SubstrateUnderrunError = error.SubstrateUnderrunError
+ # Maximum number of continuation octets (high-bit set) allowed per OID arc.
+ # 20 octets allows up to 140-bit integers, supporting UUID-based OIDs
+ MAX_OID_ARC_CONTINUATION_OCTETS = 20
++MAX_NESTING_DEPTH = 100
+ 
+ 
+ class AbstractPayloadDecoder(object):
+@@ -1515,6 +1516,15 @@ class SingleItemDecoder(object):
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
+index f033dfd..62aa1c5 100644
+--- a/tests/codec/ber/test_decoder.py
++++ b/tests/codec/ber/test_decoder.py
+@@ -1988,6 +1988,122 @@ class CompressedFilesTestCase(BaseTestCase):
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
+index 133affd..cdaa742 100644
+--- a/tests/codec/cer/test_decoder.py
++++ b/tests/codec/cer/test_decoder.py
+@@ -364,6 +364,30 @@ class SequenceDecoderWithExplicitlyTaggedSetOfOpenTypesTestCase(BaseTestCase):
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
+index 5bc9deb..17de466 100644
+--- a/tests/codec/der/test_decoder.py
++++ b/tests/codec/der/test_decoder.py
+@@ -362,6 +362,48 @@ class SequenceDecoderWithExplicitlyTaggedSetOfOpenTypesTestCase(BaseTestCase):
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
-- 
2.35.6


