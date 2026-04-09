Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFA4E98FC4
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:16:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126105.1775715407903002274
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GsJ/Xfme;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394sTps1739904
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Apr 2026 06:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=KMpUh1qZev+yp6Ri4lm0J3fzvXslxNQBgYp6C0L35RA=; b=GsJ/Xfme6cHA
	zBAvvuuWQx8x1RdobKDZcM/E64L4dW77IgMdheIypUbE4DkiiV5ah4uFPG7zIjtn
	ehWqguNTq0oZPhilbrcCxwYL847ejaTr0MrcRM9hS6YsZr8VMsNwe+pVNv8Pwm+S
	4VoARXPv/tiWEXFp6uk4gLUmUcmd4TT8ARyuHhtho2Z46mAD+SmAnB8EIkRnb8gd
	f5aXwWhuRazOo35gLXrPcZ/Q53lo4eZm1JRbcIYJldAKRs+KlxNWfx7j0V+pMzkP
	eLMtjiLy6JAEXbbToaVRAbT9WVtLXQtkKParfQ91mm1RJfy1IZD9J9K4ScE+UH/E
	woTmFryPiA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrybr27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:16:46 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:16:45 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:16:45 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 05/12] python3-pyasn1: fix CVE-2026-23490
Date: Thu, 9 Apr 2026 14:16:32 +0800
Message-ID: <20260409061639.1688205-6-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QoduG1yd c=1 sm=1 tr=0 ts=69d7444e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=PFni5qg7xeUOiS69ewsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 2t0_WF_oVrmcshVT5n0943mKmzfQhuZ4
X-Proofpoint-ORIG-GUID: 2t0_WF_oVrmcshVT5n0943mKmzfQhuZ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfX/yZ2Fid0Hnng
 M/unQZZVbVX5jyXl88cfBpLCXN4zXkh0+ThHV8x8dpCcNNETTGNoNBnTIvgJeqxGs8gLB0rtB/H
 r4UTKRXepF4BSvlOdxj94Gdh8VQTBA3afKYPLBJtYxTa5aYQAkJWa5X7xMncBPxBkz0QN3HX4dG
 5M1C3LinzQYgdW1b4SLa8lrpjdqsyR6+Tu0I1LKpWoV/gU4/vSMH4R+qSkgM+EA9y6xhbYywMrZ
 6rzbcro84VSH1sZupuAfzE8ReZ11X6PBgtl9GQx1S8wiLcbrD4InEdScimfRWHxFqyRf52zzbdn
 yyzoPszMrpI8JqsCFL0sjBfAnRK/kzceeLU834Nn7pdeSmw0n4tI05Xw7Z0Ryi7wWK0D3Z88RGT
 7C8B/k2aHkyuxHdST0AYryPF0kOChJafTHwKfXWCV4mM74Zw8bHMbSGTb/VcdwhnTMVxcO+vY19
 +GiYQCR2Zc0eiNzeaDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234881

From: Jiaying Song <jiaying.song.cn@windriver.com>

pyasn1 is a generic ASN.1 library for Python. Prior to 0.6.2, a
Denial-of-Service issue has been found that leads to memory exhaustion
from malformed RELATIVE-OID with excessive continuation octets. This
vulnerability is fixed in 0.6.2.

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-23490

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../recipes-devtools/python/python-pyasn1.inc |   3 +-
 .../python3-pyasn1/CVE-2026-23490.patch       | 136 ++++++++++++++++++
 2 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-23490.patch

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index 530ff1c7c3..96b4a3b52a 100644
--- a/meta/recipes-devtools/python/python-pyasn1.inc
+++ b/meta/recipes-devtools/python/python-pyasn1.inc
@@ -18,7 +18,8 @@ inherit ptest
 
 SRC_URI += " \
        file://run-ptest \
-           "
+       file://CVE-2026-23490.patch \
+"
 
 RDEPENDS:${PN}-ptest += " \
 	python3-pytest \
diff --git a/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-23490.patch b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-23490.patch
new file mode 100644
index 0000000000..a79774003b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-23490.patch
@@ -0,0 +1,136 @@
+From d98d7bc91864e1e368d4849c26568e33c0dd0e27 Mon Sep 17 00:00:00 2001
+From: Simon Pichugin <simon.pichugin@gmail.com>
+Date: Wed, 28 Jan 2026 16:31:29 +0800
+Subject: [PATCH] Merge commit from fork
+
+Add limit of 20 continuation octets per OID arc to prevent a potential
+memory exhaustion from excessive continuation bytes input.
+
+CVE: CVE-2026-23490
+
+Upstream-Status: Backport [https://github.com/pyasn1/pyasn1/commit/3908f14422]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ pyasn1/codec/ber/decoder.py     | 13 ++++++-
+ tests/codec/ber/test_decoder.py | 65 +++++++++++++++++++++++++++++++++
+ 2 files changed, 77 insertions(+), 1 deletion(-)
+
+diff --git a/pyasn1/codec/ber/decoder.py b/pyasn1/codec/ber/decoder.py
+index 7cc863d..be8ba65 100644
+--- a/pyasn1/codec/ber/decoder.py
++++ b/pyasn1/codec/ber/decoder.py
+@@ -35,6 +35,10 @@ noValue = base.noValue
+ 
+ SubstrateUnderrunError = error.SubstrateUnderrunError
+ 
++# Maximum number of continuation octets (high-bit set) allowed per OID arc.
++# 20 octets allows up to 140-bit integers, supporting UUID-based OIDs
++MAX_OID_ARC_CONTINUATION_OCTETS = 20
++
+ 
+ class AbstractPayloadDecoder(object):
+     protoComponent = None
+@@ -431,7 +435,14 @@ class ObjectIdentifierPayloadDecoder(AbstractSimplePayloadDecoder):
+                 # Construct subid from a number of octets
+                 nextSubId = subId
+                 subId = 0
++                continuationOctetCount = 0
+                 while nextSubId >= 128:
++                    continuationOctetCount += 1
++                    if continuationOctetCount > MAX_OID_ARC_CONTINUATION_OCTETS:
++                        raise error.PyAsn1Error(
++                            'OID arc exceeds maximum continuation octets limit (%d) '
++                            'at position %d' % (MAX_OID_ARC_CONTINUATION_OCTETS, index)
++                        )
+                     subId = (subId << 7) + (nextSubId & 0x7F)
+                     if index >= substrateLen:
+                         raise error.SubstrateUnderrunError(
+@@ -1872,7 +1883,7 @@ class StreamingDecoder(object):
+         :py:class:`~pyasn1.error.SubstrateUnderrunError` object indicating
+         insufficient BER/CER/DER serialization on input to fully recover ASN.1
+         objects from it.
+-        
++
+         In the latter case the caller is advised to ensure some more data in
+         the input stream, then call the iterator again. The decoder will resume
+         the decoding process using the newly arrived data.
+diff --git a/tests/codec/ber/test_decoder.py b/tests/codec/ber/test_decoder.py
+index 3b97ce4..f033dfd 100644
+--- a/tests/codec/ber/test_decoder.py
++++ b/tests/codec/ber/test_decoder.py
+@@ -450,6 +450,71 @@ class ObjectIdentifierDecoderTestCase(BaseTestCase):
+             ints2octs((0x06, 0x13, 0x88, 0x37, 0x83, 0xC6, 0xDF, 0xD4, 0xCC, 0xB3, 0xFF, 0xFF, 0xFE, 0xF0, 0xB8, 0xD6, 0xB8, 0xCB, 0xE2, 0xB6, 0x47))
+         ) == ((2, 999, 18446744073709551535184467440737095), null)
+ 
++    def testExcessiveContinuationOctets(self):
++        """Test that OID arcs with excessive continuation octets are rejected."""
++        # Create a payload with 25 continuation octets (exceeds 20 limit)
++        # 0x81 bytes are continuation octets, 0x01 terminates
++        malicious_payload = bytes([0x06, 26]) + bytes([0x81] * 25) + bytes([0x01])
++        try:
++            decoder.decode(malicious_payload)
++        except error.PyAsn1Error:
++            pass
++        else:
++            assert 0, 'Excessive continuation octets tolerated'
++
++    def testMaxAllowedContinuationOctets(self):
++        """Test that OID arcs at the maximum continuation octets limit work."""
++        # Create a payload with exactly 20 continuation octets (at limit)
++        # This should succeed
++        payload = bytes([0x06, 21]) + bytes([0x81] * 20) + bytes([0x01])
++        try:
++            decoder.decode(payload)
++        except error.PyAsn1Error:
++            assert 0, 'Valid OID with 20 continuation octets rejected'
++
++    def testOneOverContinuationLimit(self):
++        """Test boundary: 21 continuation octets (one over limit) is rejected."""
++        payload = bytes([0x06, 22]) + bytes([0x81] * 21) + bytes([0x01])
++        try:
++            decoder.decode(payload)
++        except error.PyAsn1Error:
++            pass
++        else:
++            assert 0, '21 continuation octets tolerated (should be rejected)'
++
++    def testExcessiveContinuationInSecondArc(self):
++        """Test that limit applies to subsequent arcs, not just the first."""
++        # First arc: valid simple byte (0x55 = 85, decodes to arc 2.5)
++        # Second arc: excessive continuation octets
++        payload = bytes([0x06, 27]) + bytes([0x55]) + bytes([0x81] * 25) + bytes([0x01])
++        try:
++            decoder.decode(payload)
++        except error.PyAsn1Error:
++            pass
++        else:
++            assert 0, 'Excessive continuation in second arc tolerated'
++
++    def testMultipleArcsAtLimit(self):
++        """Test multiple arcs each at the continuation limit work correctly."""
++        # Two arcs, each with 20 continuation octets (both at limit)
++        arc1 = bytes([0x81] * 20) + bytes([0x01])  # 21 bytes
++        arc2 = bytes([0x81] * 20) + bytes([0x01])  # 21 bytes
++        payload = bytes([0x06, 42]) + arc1 + arc2
++        try:
++            decoder.decode(payload)
++        except error.PyAsn1Error:
++            assert 0, 'Multiple valid arcs at limit rejected'
++
++    def testExcessiveContinuationWithMaxBytes(self):
++        """Test with 0xFF continuation bytes (maximum value, not just 0x81)."""
++        # 0xFF bytes are also continuation octets (high bit set)
++        malicious_payload = bytes([0x06, 26]) + bytes([0xFF] * 25) + bytes([0x01])
++        try:
++            decoder.decode(malicious_payload)
++        except error.PyAsn1Error:
++            pass
++        else:
++            assert 0, 'Excessive 0xFF continuation octets tolerated'
+ 
+ class RealDecoderTestCase(BaseTestCase):
+     def testChar(self):
+-- 
+2.34.1
+
-- 
2.34.1


