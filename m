Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B01C98317
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 12:16:54 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6480.1790252211452721916
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 05:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QPgpevtp;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7543; q=dns/txt;
  s=iport01; t=1790252211; x=1791461811;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=dFdi8LLnme7Y/7hJPBx/lYs4X5DkhFzzIqX2dZjfQA0=;
  b=QPgpevtpn/xFp4neKS7PN1satMpQoAvUFhSSCp3Z4bwvPMueRl+5XuGR
   WVeCUNMc85xhoeaSB7wpkCUwtiz6H/sk6k0tlB8JDGVCaKPPjFjdhcHdr
   XEhxrHHWMuO19A+L7HRBpDs/eCNneplzeex4dHuyzBZiJNAP5ipF7cI2w
   diRiTO5aoqt6VAnveOlhcwEYUXv1lmM/ckoatwSufqlwkEoc6aBXYZ7kU
   jTp+LFfAVaekNbO9VfaP2t3pfS0I+C94NDAJBpvM86mwP9D/6jmWBAdWz
   NrnsEdZ8zr/schDdjKmhs2fJKGcd/5oj2saw+MBhaY9FGAVajffjSFmeO
   Q==;
X-CSE-ConnectionGUID: mDUQ3AnfQo6mqCJc+oWp7A==
X-CSE-MsgGUID: nSAelXA0RxiLi1SSdV2mnA==
X-IPAS-Result: =?us-ascii?q?A0AbAADbE7Vq/4r/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJjHKHN4IhA4tkkjaBfg8BAQEPRA0EAQGEP0YCjgkCJjQJD?=
 =?us-ascii?q?gECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDMgFWH?=
 =?us-ascii?q?AMBAi8gCyMIGYMCAYI6AzcDEcAbgiyBAYNpAkNQ2EsNcoFoAQsUAYE4AYU/g?=
 =?us-ascii?q?n+FJF0YAYR8JxuBSUSEfoEFgRpCAQGBOIZtBIMugVoekwlIgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFmAzUSKhVuMh2BIz4XgQcbBgWBHYEgghojGTZ6gQlegSspYRAXgQmCB?=
 =?us-ascii?q?wKCVIIBAgFJQw4HRVMJJUEKEkcmIggSCQETGjALgSM6QQoYDUgRLDcVGQQ+b?=
 =?us-ascii?q?geQEx6CXQd7EwErgQWBOJMnOJIGgTWeaXGEKIwijz6FfBozhVulEguYfY4Kh?=
 =?us-ascii?q?AmSR4RpgWg8gUcLBzMaCBsVgyIJShkPjisDCwuDYIF/g2XGVScyCzIBAQcCB?=
 =?us-ascii?q?w4DC4FokAGBfQEB?=
IronPort-Data: A9a23:BiFsB6IXaRy6p3VOFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS0DUHm
 zFNCG3Ta/3YZWSjfIwgYY6+9UlQ7ZHdy4M3SwMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH9imQoajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1rIHwPZqQe9N9wX2RX3
 t4Tazcydk+q0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBVLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2N0Sojx5nYj/7DLovgf2hinTXeDxDo1XTrq0yi4TW5FErjuWxb4qKILRmQ+1TpW+Vo
 lLvp17pAzUbbeekxQTf93SF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KNpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOfJEhpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:lGA0CKODuXeLzcBcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoWpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:8WNRVWycxkltRscXjOJ3BgURNv0cKVTbwk7XfUqhIkRiC7qqUQC5rfY=
X-Talos-MUID: 9a23:TaKkSAQtVhA3OuybRXTqvxhvMPdBu56+CWQMyK49t/feMCpZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,120,1787011200"; 
   d="scan'208";a="526547872"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Sep 2026 12:16:29 +0000
Received: from sjc-ads-4926.cisco.com (sjc-ads-4926.cisco.com [10.28.39.190])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 354A318000599
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 12:16:00 +0000 (GMT)
Received: by sjc-ads-4926.cisco.com (Postfix, from userid 1889728)
	id D0ACCCC124B; Thu, 24 Sep 2026 05:15:59 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][v2][PATCH 2/2] python3-pyasn1: fix CVE-2026-59885
Date: Thu, 24 Sep 2026 05:15:58 -0700
Message-ID: <20260924121559.3071108-2-yurade@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260924121559.3071108-1-yurade@cisco.com>
References: <20260924121559.3071108-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4926.cisco.com [10.28.39.190];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.190, sjc-ads-4926.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 12:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246585

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/pyasn1/pyasn1/commit/45bdb19eb7df4b3780fe9c912c63e99bffc39dd9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59885

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../recipes-devtools/python/python-pyasn1.inc |   1 +
 .../python3-pyasn1/CVE-2026-59885.patch       | 183 ++++++++++++++++++
 2 files changed, 184 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59885.patch

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index 0fe5e70adf..9ab2ca9a84 100644
--- a/meta/recipes-devtools/python/python-pyasn1.inc
+++ b/meta/recipes-devtools/python/python-pyasn1.inc
@@ -22,6 +22,7 @@ SRC_URI += " \
        file://CVE-2026-59886.patch \
        file://CVE-2026-59884.patch \
        file://CVE-2026-30922.patch \
+       file://CVE-2026-59885.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \
diff --git a/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59885.patch b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59885.patch
new file mode 100644
index 0000000000..af2e7abc8b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59885.patch
@@ -0,0 +1,183 @@
+From 844a3c11d47d346469f5b9ffd49f91e9b76a2572 Mon Sep 17 00:00:00 2001
+From: Simon Pichugin <simon.pichugin@gmail.com>
+Date: Wed, 8 Jul 2026 17:37:40 -0700
+Subject: [PATCH] Merge commit from fork
+
+CVE: CVE-2026-59885
+Upstream-Status: Backport [https://github.com/pyasn1/pyasn1/commit/45bdb19eb7df4b3780fe9c912c63e99bffc39dd9]
+
+Backport Changes:
+- Omitted RelativeOID decoder and encoder changes, together with their
+  decoder and encoder regression tests, because RelativeOID support was
+  introduced in pyasn1 0.6.0 and is absent from pyasn1 0.5.1
+
+(cherry picked from commit 45bdb19eb7df4b3780fe9c912c63e99bffc39dd9)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ pyasn1/codec/ber/decoder.py     | 18 ++++++++++--------
+ pyasn1/codec/ber/encoder.py     | 12 ++++++------
+ tests/codec/ber/test_decoder.py | 22 ++++++++++++++++++++++
+ tests/codec/ber/test_encoder.py | 10 ++++++++++
+ 4 files changed, 48 insertions(+), 14 deletions(-)
+
+diff --git a/pyasn1/codec/ber/decoder.py b/pyasn1/codec/ber/decoder.py
+index 4d34080..3c95a59 100644
+--- a/pyasn1/codec/ber/decoder.py
++++ b/pyasn1/codec/ber/decoder.py
+@@ -428,14 +428,14 @@ class ObjectIdentifierPayloadDecoder(AbstractSimplePayloadDecoder):
+ 
+         chunk = octs2ints(chunk)
+ 
+-        oid = ()
++        oid = []
+         index = 0
+         substrateLen = len(chunk)
+         while index < substrateLen:
+             subId = chunk[index]
+             index += 1
+             if subId < 128:
+-                oid += (subId,)
++                oid.append(subId)
+             elif subId > 128:
+                 # Construct subid from a number of octets
+                 nextSubId = subId
+@@ -451,11 +451,11 @@ class ObjectIdentifierPayloadDecoder(AbstractSimplePayloadDecoder):
+                     subId = (subId << 7) + (nextSubId & 0x7F)
+                     if index >= substrateLen:
+                         raise error.SubstrateUnderrunError(
+-                            'Short substrate for sub-OID past %s' % (oid,)
++                            'Short substrate for sub-OID past %s' % (tuple(oid),)
+                         )
+                     nextSubId = chunk[index]
+                     index += 1
+-                oid += ((subId << 7) + nextSubId,)
++                oid.append((subId << 7) + nextSubId)
+             elif subId == 128:
+                 # ASN.1 spec forbids leading zeros (0x80) in OID
+                 # encoding, tolerating it opens a vulnerability. See
+@@ -465,15 +465,17 @@ class ObjectIdentifierPayloadDecoder(AbstractSimplePayloadDecoder):
+ 
+         # Decode two leading arcs
+         if 0 <= oid[0] <= 39:
+-            oid = (0,) + oid
++            oid.insert(0, 0)
+         elif 40 <= oid[0] <= 79:
+-            oid = (1, oid[0] - 40) + oid[1:]
++            oid[0] -= 40
++            oid.insert(0, 1)
+         elif oid[0] >= 80:
+-            oid = (2, oid[0] - 80) + oid[1:]
++            oid[0] -= 80
++            oid.insert(0, 2)
+         else:
+             raise error.PyAsn1Error('Malformed first OID octet: %s' % chunk[0])
+ 
+-        yield self._createComponent(asn1Spec, tagSet, oid, **options)
++        yield self._createComponent(asn1Spec, tagSet, tuple(oid), **options)
+ 
+ 
+ class RealPayloadDecoder(AbstractSimplePayloadDecoder):
+diff --git a/pyasn1/codec/ber/encoder.py b/pyasn1/codec/ber/encoder.py
+index c59b43e..7c3c5cf 100644
+--- a/pyasn1/codec/ber/encoder.py
++++ b/pyasn1/codec/ber/encoder.py
+@@ -327,30 +327,30 @@ class ObjectIdentifierEncoder(AbstractItemEncoder):
+         else:
+             raise error.PyAsn1Error('Impossible first/second arcs at %s' % (value,))
+ 
+-        octets = ()
++        octets = []
+ 
+         # Cycle through subIds
+         for subOid in oid:
+             if 0 <= subOid <= 127:
+                 # Optimize for the common case
+-                octets += (subOid,)
++                octets.append(subOid)
+ 
+             elif subOid > 127:
+                 # Pack large Sub-Object IDs
+-                res = (subOid & 0x7f,)
++                res = [subOid & 0x7f]
+                 subOid >>= 7
+ 
+                 while subOid:
+-                    res = (0x80 | (subOid & 0x7f),) + res
++                    res.append(0x80 | (subOid & 0x7f))
+                     subOid >>= 7
+ 
+                 # Add packed Sub-Object ID to resulted Object ID
+-                octets += res
++                octets.extend(reversed(res))
+ 
+             else:
+                 raise error.PyAsn1Error('Negative OID arc %s at %s' % (subOid, value))
+ 
+-        return octets, False, False
++        return tuple(octets), False, False
+ 
+ 
+ class RealEncoder(AbstractItemEncoder):
+diff --git a/tests/codec/ber/test_decoder.py b/tests/codec/ber/test_decoder.py
+index 672c9af..43b9617 100644
+--- a/tests/codec/ber/test_decoder.py
++++ b/tests/codec/ber/test_decoder.py
+@@ -27,6 +27,14 @@ from pyasn1.compat.octets import ints2octs, str2octs, null
+ from pyasn1 import error
+ 
+ 
++def encode_length(length):
++    if length < 128:
++        return bytes([length])
++
++    lengthBytes = length.to_bytes((length.bit_length() + 7) // 8, 'big')
++    return bytes([0x80 | len(lengthBytes)]) + lengthBytes
++
++
+ class LargeTagDecoderTestCase(BaseTestCase):
+     def testLargeTag(self):
+         assert decoder.decode(ints2octs((127, 141, 245, 182, 253, 47, 3, 2, 1, 1))) == (1, null)
+@@ -476,6 +484,20 @@ class ObjectIdentifierDecoderTestCase(BaseTestCase):
+             ints2octs((0x06, 0x13, 0x88, 0x37, 0x83, 0xC6, 0xDF, 0xD4, 0xCC, 0xB3, 0xFF, 0xFF, 0xFE, 0xF0, 0xB8, 0xD6, 0xB8, 0xCB, 0xE2, 0xB6, 0x47))
+         ) == ((2, 999, 18446744073709551535184467440737095), null)
+ 
++    def testManySingleByteArcs(self):
++        encodedArcCount = 4096
++        substrate = (
++            bytes([0x06]) +
++            encode_length(encodedArcCount) +
++            bytes([0x01] * encodedArcCount)
++        )
++
++        value, rest = decoder.decode(substrate)
++        assert rest == b''
++        assert len(value) == encodedArcCount + 1
++        assert tuple(value[:3]) == (0, 1, 1)
++        assert tuple(value[-3:]) == (1, 1, 1)
++
+     def testExcessiveContinuationOctets(self):
+         """Test that OID arcs with excessive continuation octets are rejected."""
+         # Create a payload with 25 continuation octets (exceeds 20 limit)
+diff --git a/tests/codec/ber/test_encoder.py b/tests/codec/ber/test_encoder.py
+index 3d7567a..ef38eef 100644
+--- a/tests/codec/ber/test_encoder.py
++++ b/tests/codec/ber/test_encoder.py
+@@ -349,6 +349,16 @@ class ObjectIdentifierEncoderTestCase(BaseTestCase):
+         ) == ints2octs((0x06, 0x13, 0x88, 0x37, 0x83, 0xC6, 0xDF, 0xD4, 0xCC, 0xB3, 0xFF, 0xFF, 0xFE, 0xF0, 0xB8, 0xD6,
+                         0xB8, 0xCB, 0xE2, 0xB6, 0x47))
+ 
++    def testManySingleByteArcs(self):
++        arcCount = 4096
++        substrate = encoder.encode(
++            univ.ObjectIdentifier((1, 3) + (1,) * arcCount)
++        )
++
++        assert substrate == (
++            bytes([0x06, 0x82, 0x10, 0x01, 0x2B]) + bytes([0x01] * arcCount)
++        )
++
+ 
+ class ObjectIdentifierWithSchemaEncoderTestCase(BaseTestCase):
+     def testOne(self):
+-- 
+2.44.4
-- 
2.44.4


