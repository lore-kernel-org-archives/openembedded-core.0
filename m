Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A166CE98FC5
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:17:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126442.1775715411011751840
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=D2DTGYA5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394GA8U4046678
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Apr 2026 23:16:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Dp0oy4g6m0zFCqOlOXzyt01ksSuwbQFaRbK/O6Lpa/I=; b=D2DTGYA5MUob
	o71iAW4NSPEJW6s0lsX0/aZ69CZGaElmaHYWRoVjZYpbo1KKPwnDQS7nnJeOwOCl
	cyQCP1HdZ4mWkWc6j/hc/0SIXX8mY8Z+Hz0eq0xom2vYhu7VUAIh7HQmdjnG4jwS
	+X9HwVczXaK456pjYRAGyyw7Ctg1aa3tmbDv0oCQybpuUJBLtZMOO/y/jBNmYTto
	Rar5Py5AsUAxAcggoZhJ//HbXwvkDlgY+9xRO9KSbvIxfVd6sfCxP22BKWGInSE6
	2jN60Kcmfbs9LkxBXAsMtFep+AUbefkkQDJwxb/M7/HY7BaOo/2end/oNmz400ZQ
	3GgW9bvRFw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmryknh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 23:16:50 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:16:50 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:16:49 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 09/12] python3-pyasn1: fix CVE-2026-30922
Date: Thu, 9 Apr 2026 14:16:36 +0800
Message-ID: <20260409061639.1688205-10-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: IF7G2sf4_JtfXm_IwWY-zMtsVbu1IaOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfX6zfoTKGEziDq
 XHXSrQla7iSg2HnI9QnxJ6qOYpodpSJOixG8VOZIIg94eCmErIGjcuaoEXfs0hYXB4y4eNxNhTA
 uYttjIbr3K3fLbLa72NkPUQqQflf0ZhDnm5E3BbBxioDtHMmgiRG+i1JOqzbftDfTyKVX1sWkZE
 MeTFmDYsQaTLVcqFKOgpfrAWygLzpx5igKUmf4UBL+vWlYRIgGb9JQaJUL9OF3TjX4BYL5HvbCq
 f3lYWWn1U4aTXNqmZRrv7/PH1gCHrATg8xxFe3yVnv20PgDFz9hYTil07sTbF0TrpeIkHjmUgdu
 gvAYlas3lNuWgef4Bs/EtotQjEEgn8pgIPy7urqrlrYy1QLsdPL2QARe24wf07LHor+v2uHynZx
 hKZc6qaiYpuNv22Gen2Fdgg8075VU0/gm8utysB46DqkD9q0PtwznwANr3QuQM0nL6r3jwKWIOR
 zm5lvrRDPwcpEvLTJfA==
X-Proofpoint-GUID: IF7G2sf4_JtfXm_IwWY-zMtsVbu1IaOf
X-Authority-Analysis: v=2.4 cv=Wcg8rUhX c=1 sm=1 tr=0 ts=69d74452 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=aETuk2ZcA24p7Y2J5eEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234885

From: Jiaying Song <jiaying.song.cn@windriver.com>

pyasn1 is a generic ASN.1 library for Python. Prior to 0.6.3, the
`pyasn1` library is vulnerable to a Denial of Service (DoS) attack
caused by uncontrolled recursion when decoding ASN.1 data with deeply
nested structures. An attacker can supply a crafted payload containing
thousands of nested `SEQUENCE` (`0x30`) or `SET` (`0x31`) tags with
"Indefinite Length" (`0x80`) markers. This forces the decoder to
recursively call itself until the Python interpreter crashes with a
`RecursionError` or consumes all available memory (OOM), crashing the
host application. This is a distinct vulnerability from CVE-2026-23490
(which addressed integer overflows in OID decoding). The fix for
CVE-2026-23490 (`MAX_OID_ARC_CONTINUATION_OCTETS`) does not mitigate
this recursion issue. Version 0.6.3 fixes this specific issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-30922

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../recipes-devtools/python/python-pyasn1.inc |   1 +
 .../python3-pyasn1/CVE-2026-30922.patch       | 257 ++++++++++++++++++
 2 files changed, 258 insertions(+)
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
index 0000000000..7eceaa2595
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch
@@ -0,0 +1,257 @@
+From 85e901d1dacdcd17363cc2dd18a91cfb72363eeb Mon Sep 17 00:00:00 2001
+From: Simon Pichugin <simon.pichugin@gmail.com>
+Date: Thu, 19 Mar 2026 17:11:40 +0800
+Subject: [PATCH] Merge commit from fork
+
+CVE: CVE-2026-30922
+
+Upstream-Status: Backport [https://github.com/pyasn1/pyasn1/commit/25ad481c19]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ pyasn1/codec/ber/decoder.py     |  10 +++
+ tests/codec/ber/test_decoder.py | 114 ++++++++++++++++++++++++++++++++
+ tests/codec/cer/test_decoder.py |  22 ++++++
+ tests/codec/der/test_decoder.py |  40 +++++++++++
+ 4 files changed, 186 insertions(+)
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
+index f033dfd..226381a 100644
+--- a/tests/codec/ber/test_decoder.py
++++ b/tests/codec/ber/test_decoder.py
+@@ -1987,6 +1987,120 @@ class CompressedFilesTestCase(BaseTestCase):
+         finally:
+             os.remove(path)
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
+ 
+ class NonStreamingCompatibilityTestCase(BaseTestCase):
+     def setUp(self):
+diff --git a/tests/codec/cer/test_decoder.py b/tests/codec/cer/test_decoder.py
+index 133affd..fbb1145 100644
+--- a/tests/codec/cer/test_decoder.py
++++ b/tests/codec/cer/test_decoder.py
+@@ -363,6 +363,28 @@ class SequenceDecoderWithExplicitlyTaggedSetOfOpenTypesTestCase(BaseTestCase):
+         assert s[0] == 3
+         assert s[1][0] == univ.OctetString(hexValue='02010C')
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
+ 
+ suite = unittest.TestLoader().loadTestsFromModule(sys.modules[__name__])
+ 
+diff --git a/tests/codec/der/test_decoder.py b/tests/codec/der/test_decoder.py
+index 5bc9deb..b0fa867 100644
+--- a/tests/codec/der/test_decoder.py
++++ b/tests/codec/der/test_decoder.py
+@@ -361,6 +361,46 @@ class SequenceDecoderWithExplicitlyTaggedSetOfOpenTypesTestCase(BaseTestCase):
+         assert s[0] == 3
+         assert s[1][0] == univ.OctetString(hexValue='02010C')
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
+ 
+ suite = unittest.TestLoader().loadTestsFromModule(sys.modules[__name__])
+ 
+-- 
+2.34.1
+
-- 
2.34.1


