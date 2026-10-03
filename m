Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3021CA5FDD
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 21:43:18 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13641.1791063797218132585
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 14:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VyCdYwyA;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso494740f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 14:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791063795; x=1791668595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=impcnMZXQN+7KeLEU2PZJ1OmKgBOirEtWLZen/jDAIA=;
        b=VyCdYwyAq+4fLtDL80ivcaF2u1atPUPJNEJzgiwAh5Wr//cIK7nNR4gAqVA5a2wDzI
         NubUVfkFzj5lkCPCk1mpGDobx+aPhF7tmz/AvdTq87UzPocU+4w4p6YYDr8MEq2QKkuv
         TAppC6rwwZ1Jlu5RScvl8Xik71T2qI89J7LQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791063795; x=1791668595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=impcnMZXQN+7KeLEU2PZJ1OmKgBOirEtWLZen/jDAIA=;
        b=T8FgTrXTPHvUECT474U7sz5XOeFxof7RQKDmQR+3nlZeP2wa9dGickOtKxi1VBFBgw
         BZh8Y6JTTapb2wQ+p0LVRJOMw+1ytK0MqV1HRg3Ft+45Z+0ZREURTaRWGlF3rMoiHQce
         lX8pguc2vS132fV6Vdr6fwmD5neMRvkaZjazpOc58b27mR75TxyQpDE6AWImKb4yHB8K
         PQEUM46vCjNpSATy3ERxf/v4cecJ8vrbVEdXhUJJ6f/VJdcbBBzJATcNnCiJXJ3y6Uw+
         +hC8lwXNgSqsts1VhIXn4/M7V+O+fcb2eJdTdl20RSJ5J2aFTk6B9IZKcNGYQkMctMMD
         tP9A==
X-Gm-Message-State: AFq9FYLJoJMJOgtYRFubRM3vlB3vt7MHoZpxChGVA/IocqdX+7a69CVD
	TW2crpjjCfvCSOoF4i1uHAO2ZhXCIcn1qOEVLlQT45pvUNcHJkk8vAlosP+W44X5KPaVlBoJtR6
	x58+nkNI=
X-Gm-Gg: AYBFou08TLyr7gNsmSLUyvMe+gbLx+8J5VRmh9Kse3oxdXugoBql10zWP8aYUrNp5vr
	lMH0tZizZ0a7TrBXPJM9ZCBLTxeUNQWjTaMWrGNZ0ZBtUgwyaU3NObPfTO1Yhs2q9JHQlFYv3Rj
	r3O9oSszI6/oubep2MsjysKpCu9BqheOJgxP9ZQqYj2Dii623YNWVL67NFrXTk9KockXouZD1mN
	Mev40Ww1kcbbFlceM5Y6KxfzUsktdlseULuQVxL9DgPTDryQsyi4uh1zgZpayWnUoxV4lmqqUFo
	hWI+qFkYXxA4+kF+x4IDavoLEl4wgEhdfzaywR2OPzjUGOf9LvFfnlUYl0ZDpruGQ3vYSNXUliX
	1/SRLQGNRoLkKTxEY6mXNdsu4NCRY/VB+DNBRllK0fbCaGRkQhvxiyOHUrYajLJlgzP221TDGQg
	gEaaaJbMCMuqj1qzs9/BtDdo0CtamyEo3Tz3Ork2vfNykoc3o2xRoJgTapRi3fpw0rTgZkg1F0Y
	9vbGvX4ulNQJM3N3YAkm0t7APNMonVZixjyyDI9S6ntua+HR5CBn7d6SKUfE9H5o0g=
X-Received: by 2002:a05:6000:40cb:b0:48a:f29b:27d with SMTP id ffacd0b85a97d-48c47c6707dmr5277444f8f.7.1791063795397;
        Sat, 03 Oct 2026 14:43:15 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f04e2sm12832952f8f.15.2026.10.03.14.43.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:43:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 8/8] python3-pyasn1: fix CVE-2026-59885
Date: Sat,  3 Oct 2026 23:42:16 +0200
Message-ID: <827730f97b522c4ab31dd2b7b5a33a4933c94750.1791061402.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791061402.git.yoann.congal@smile.fr>
References: <cover.1791061402.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 21:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247184

From: Yogita Urade <yurade@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/pyasn1/pyasn1/commit/45bdb19eb7df4b3780fe9c912c63e99bffc39dd9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59885

Signed-off-by: Yogita Urade <yurade@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-devtools/python/python-pyasn1.inc |   1 +
 .../python3-pyasn1/CVE-2026-59885.patch       | 183 ++++++++++++++++++
 2 files changed, 184 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59885.patch

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index 0fe5e70adfc..9ab2ca9a84d 100644
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
index 00000000000..af2e7abc8be
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

