Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CB0C61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 06:31:36 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30575.1787812291872326175
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 23:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=k+4BreY9;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7535; q=dns/txt;
  s=iport01; t=1787812291; x=1789021891;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ouNzZC4S8kfxgeGk6bImj7wkegHhiwPERqU7Hm1z9yM=;
  b=k+4BreY9wNgZRJC6HcEz+VgkliZouB0Y+kx0wR3yd/x6tYhKxHR/p0Sh
   Q+WGF+qZ8KV/8sn6Gwb0bWOC2dQ7ECJd7LiKhqTGapejD+zdL/UZJtxNk
   qVYR2OJQ60cGv5NQm7I9HHNwsYDtNRYUncYffFmuP6OYU4U3YfipC19/t
   PNg7oLLeBc5l1ofyAvBu+VjS32aHd++wlUIVW7n/yR98WPLIDVkFhtfbW
   /GQXbLcCN9+FVx3mTGWQKTYvAaQGA2BvTupcjh/I10J/cLwXyRxxi7iXf
   W9foN1d7QXCVC7iNYFqjFo+I+zx0qP4sBWPWoM3dIlv1eJvQgoBZG7NL+
   A==;
X-CSE-ConnectionGUID: X+MeFn1dQ2GEWnGmBpS6gQ==
X-CSE-MsgGUID: FN/CNo7RQfu6Ps76alqL2g==
X-IPAS-Result: =?us-ascii?q?A0AaAAAr2Y9q/5AQJK1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ0XkNJjHKHN4IhA4tkkjeBfg8BAQEPRA0EAQGEP0YCjW4CJjQJD?=
 =?us-ascii?q?gECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMyAVYcA?=
 =?us-ascii?q?wECLyALIwgZgwIBgjoDNwMRvm+CLIEBg2gCQ1DYSw1ygWYBCxQBgTgBhT6Cf?=
 =?us-ascii?q?4UjXRgBhHwnG4FJRIR+gQWBGkIBAYE4hm0Egy6BWh6Rb0iBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBDRsGBYEdgSiEECMZNnyBCV6BKylhEheBCYIHA?=
 =?us-ascii?q?oJaggUCAUlDDgdHQwsYDUgRLDcVGQQ+bgeObx+CRwd7EwErgQWBOJMnOJIGg?=
 =?us-ascii?q?TWeaXGEKIwijz6FfBozhVulEQuYfY4KhAmSR4RpgWg8gUcLBzMaCBsVgyIJS?=
 =?us-ascii?q?hkPjioDCwuDYIF/g2XGVScyCzIBAQcCBw4DC4FokAGBfQEB?=
IronPort-Data: A9a23:DyeBfKnqlVptr9nFRSpLT/vo5gzVJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcCmvXOK2PZmv0ctlybdjio04PuMDXzt4xGgs5/iw1EltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEsf3b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fb1b3+tZBzhCz
 KY3BQ8LQRWpn9noz4vuH4GAhux7RCXqFIobvnclyXTSCuwrBMicBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkETUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZC9aoCPJYPTFZQ9ckCwi
 ESB1EL+XSsjOsHB8SHarHuon8uVknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBWS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:LPFmwKlyLA5vi7dkGbkauaffPfrpDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:1EAWOGHMEiiks5g8qmJXt2sZNMZ8fkSH41rvJWC9I35SFrKsHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AHpE9sAxw+LY1BQ32oP4EyTmLN0maqIqIT2srlso?=
 =?us-ascii?q?8gseZaxRrZGmUiC2TGIByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,246,1779148800"; 
   d="scan'208";a="822277189"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Aug 2026 06:31:31 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id D671D180001DC
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 06:31:30 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 6D7B7CEF860; Wed, 26 Aug 2026 23:31:30 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 2/2] python3-pyasn1: fix CVE-2026-59885
Date: Wed, 26 Aug 2026 23:31:29 -0700
Message-Id: <20260827063129.3205882-2-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260827063129.3205882-1-yurade@cisco.com>
References: <20260827063129.3205882-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 06:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244456

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/pyasn1/pyasn1/commit/45bdb19eb7df4b3780fe9c912c63e99bffc39dd9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59885

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../recipes-devtools/python/python-pyasn1.inc |   1 +
 .../python3-pyasn1/CVE-2026-59885.patch       | 184 ++++++++++++++++++
 2 files changed, 185 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59885.patch

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index d69cdf8877..ec06281612 100644
--- a/meta/recipes-devtools/python/python-pyasn1.inc
+++ b/meta/recipes-devtools/python/python-pyasn1.inc
@@ -20,6 +20,7 @@ SRC_URI += " \
        file://run-ptest \
        file://CVE-2026-23490.patch \
        file://CVE-2026-30922.patch \
+       file://CVE-2026-59885.patch \
 "

 RDEPENDS:${PN}-ptest += " \
diff --git a/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59885.patch b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59885.patch
new file mode 100644
index 0000000000..d8cc924875
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59885.patch
@@ -0,0 +1,184 @@
+From 865e458893e475ab2e6a46022329f7f4870e8044 Mon Sep 17 00:00:00 2001
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
+index da2a048..72c9cb5 100644
+--- a/pyasn1/codec/ber/decoder.py
++++ b/pyasn1/codec/ber/decoder.py
+@@ -424,14 +424,14 @@ class ObjectIdentifierPayloadDecoder(AbstractSimplePayloadDecoder):
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
+@@ -447,11 +447,11 @@ class ObjectIdentifierPayloadDecoder(AbstractSimplePayloadDecoder):
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
+@@ -461,15 +461,17 @@ class ObjectIdentifierPayloadDecoder(AbstractSimplePayloadDecoder):
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
+index 62aa1c5..c7a75cb 100644
+--- a/tests/codec/ber/test_decoder.py
++++ b/tests/codec/ber/test_decoder.py
+@@ -26,6 +26,14 @@ from pyasn1.compat.octets import ints2octs, str2octs, null
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
+@@ -450,6 +458,20 @@ class ObjectIdentifierDecoderTestCase(BaseTestCase):
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
+2.44.1
+
--
2.35.6


