Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B12C61DFD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:26:47 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5534.1788326800676521095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vwIJhgvb;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so6284335e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326799; x=1788931599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tN7R5Bk+iMhD5tQkk6d3W3kEfJdA9cJJCkHIZi7EGRQ=;
        b=vwIJhgvbTdFQ0ImBEtxOBNEjQ4JNbWbLUNJS0Qj7HNrcIpnTTOQgVokl3FPzw/JBo9
         myRKmZz5WI9+4jQY4iN/3JxImaQTWCISzYvRyCuf8Pf6Nj5VK+MHFitiVkdyQ9zbhve9
         Toz351nGyess5PwPNzVqZ+o83WdW7B9OwL0ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326799; x=1788931599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tN7R5Bk+iMhD5tQkk6d3W3kEfJdA9cJJCkHIZi7EGRQ=;
        b=EVEWunq+kdzI7voK8XZBzrvcUhh/nv/yTHOxF3aecmuiEKxYGqBTLB4Fo6V0qbIHhJ
         HTKJdSSEBMY6MLWtqooHdzNPF64R/bpOjWoocXWi52HiM1odYo9ZGadllDHBwkJCaJsG
         D/g6rBR9OkibbwhCgArZqrLFoBhVmol1ezYHOMRiKIWinYsl3nA83kFVR07m4QRj/jIe
         0st3HMGhTgWnmw+A1IFj64qe26wNxM2SJfFP7LC/bFT62S7IhVPnnVQHYRevh9Vill02
         4llRI9ehTqx6TzxBn59Mk9YrsEpdVUmYeoNE0d2fxfsKTzQ+AXAetBkN+s996nZDi9sY
         RGfw==
X-Gm-Message-State: AFuF++n9TLsax/ultcrsxuFeqi/hmi1p3wSREoJNs424Mk16sPEowcLa
	QKyhXCG2Sa/DZ/wdsA1XErLzp6fpvI7+TIQWj6WYdRWlZgVRzFy+bijVQyiarbsWt2R7Bf4Qxk9
	+FIl0Bc0=
X-Gm-Gg: AR+sD13KTQpb7AUU2QD/V9EQ5dZepJvXkM2NBl3JhcFf9tAtxZHnFjseqamcBkDAKoa
	5D884KCUwOS0u6yMpW0+x4HwSRo44otM7ryq1y8QHVCxHOu9vey8qFnoJC12hqoUR1dKv7adP4t
	YT6VjZsYdPfLq45zhj8wHnBNusW8ikZcb+mH9i2lVE7gABzaARqQ9TKvuVkYVHlq9xQVLHfaX9D
	h1WT1qMG2xT/F3GYXfuboPP34qdPaGy4zPsFFdimnXdpFmYwO7DpPtnBX7pIun4KELK6pAwwfQC
	o0C8I4vZfIbWIivhpDy6OTfuIhly600vBOeFJosnqsxeeUs4bGDJdvK+ieXrDQOMXnftnOFSxKN
	b7jwiSQg5jVSIulHvty5CHm0g/+V/rMiGWaSlm1vSWeQH71cftTLPGBJTEfVyWc3I7kl3glraOt
	+g82BPPI2JKBlw5bvUMcdV3OlnIgkoVJo684+1O6rhXWBKKPb82l1YO57ZH7aj1lhfyvJngzD7L
	o44YiheA8qkPDpLfhqhDslwIy7v
X-Received: by 2002:a05:600c:3b13:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49ce580a8cbmr27677855e9.2.1788326798836;
        Tue, 01 Sep 2026 22:26:38 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.26.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:26:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/27] python3-pyasn1: Fix CVE-2026-59884
Date: Wed,  2 Sep 2026 07:25:22 +0200
Message-ID: <75ff4b187cf1b5e4e874cab8273ea84377b3c873.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244856

From: Emily Vekariya <evekariy@cisco.com>

The BER decoder shared by the CER and DER codecs parses long-form tags by
accumulating continuation octets without an upper bound on the tag ID size.
A crafted input can force construction of an arbitrarily large integer with
CPU cost growing quadratically, and can trigger unhandled ValueError
exceptions in the Python 3.11+ error formatting paths. Any application
decoding untrusted BER, CER, or DER input is affected.

scarthgap ships pyasn1 0.5.1, which is affected as the issue is present in
all versions before 0.6.4.

Pick the upstream patch [1] as mentioned in [2].

[1] https://github.com/pyasn1/pyasn1/commit/628e36ecbb5277a3f01572ce418ef54271b165a5
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59884

Signed-off-by: Emily Vekariya <evekariy@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-devtools/python/python-pyasn1.inc |   1 +
 .../python3-pyasn1/CVE-2026-59884.patch       | 245 ++++++++++++++++++
 2 files changed, 246 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59884.patch

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index 1780ee1d888..ae96f09fb1d 100644
--- a/meta/recipes-devtools/python/python-pyasn1.inc
+++ b/meta/recipes-devtools/python/python-pyasn1.inc
@@ -20,6 +20,7 @@ SRC_URI += " \
        file://run-ptest \
        file://CVE-2026-23490.patch \
        file://CVE-2026-59886.patch \
+       file://CVE-2026-59884.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \
diff --git a/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59884.patch b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59884.patch
new file mode 100644
index 00000000000..dd897e2d758
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59884.patch
@@ -0,0 +1,245 @@
+From 38e8ae286160eb27620e7cb42108b3b28d1f299f Mon Sep 17 00:00:00 2001
+From: Simon Pichugin <simon.pichugin@gmail.com>
+Date: Wed, 8 Jul 2026 17:36:30 -0700
+Subject: [PATCH] Merge commit from fork
+
+CVE: CVE-2026-59884
+Upstream-Status: Backport [https://github.com/pyasn1/pyasn1/commit/628e36ecbb5277a3f01572ce418ef54271b165a5]
+
+(cherry picked from commit 628e36ecbb5277a3f01572ce418ef54271b165a5)
+Signed-off-by: Emily Vekariya <evekariy@cisco.com>
+---
+ pyasn1/codec/ber/decoder.py     | 13 +++++++++++--
+ pyasn1/type/tag.py              | 20 ++++++++++++++++----
+ tests/codec/ber/test_decoder.py | 25 +++++++++++++++++++++++++
+ tests/codec/cer/test_decoder.py | 15 +++++++++++++++
+ tests/codec/der/test_decoder.py | 15 +++++++++++++++
+ tests/type/test_tag.py          | 20 ++++++++++++++++++++
+ 6 files changed, 102 insertions(+), 6 deletions(-)
+
+diff --git a/pyasn1/codec/ber/decoder.py b/pyasn1/codec/ber/decoder.py
+index be8ba65..18865c2 100644
+--- a/pyasn1/codec/ber/decoder.py
++++ b/pyasn1/codec/ber/decoder.py
+@@ -39,6 +39,10 @@ SubstrateUnderrunError = error.SubstrateUnderrunError
+ # 20 octets allows up to 140-bit integers, supporting UUID-based OIDs
+ MAX_OID_ARC_CONTINUATION_OCTETS = 20
+ 
++# Maximum number of octets in a long-form tag ID (20 octets = up to
++# 140-bit tag IDs, matching the OID arc limit)
++MAX_TAG_OCTETS = 20
++
+ 
+ class AbstractPayloadDecoder(object):
+     protoComponent = None
+@@ -1570,7 +1574,7 @@ class SingleItemDecoder(object):
+ 
+                     if tagId == 0x1F:
+                         isShortTag = False
+-                        lengthOctetIdx = 0
++                        tagOctetCount = 0
+                         tagId = 0
+ 
+                         while True:
+@@ -1584,7 +1588,12 @@ class SingleItemDecoder(object):
+                                 )
+ 
+                             integerTag = ord(integerByte)
+-                            lengthOctetIdx += 1
++                            tagOctetCount += 1
++                            if tagOctetCount > MAX_TAG_OCTETS:
++                                raise error.PyAsn1Error(
++                                    'Tag ID octet count exceeds limit (%d)' % (
++                                        MAX_TAG_OCTETS,)
++                                )
+                             tagId <<= 7
+                             tagId |= (integerTag & 0x7F)
+ 
+diff --git a/pyasn1/type/tag.py b/pyasn1/type/tag.py
+index a21a405..bbbdd85 100644
+--- a/pyasn1/type/tag.py
++++ b/pyasn1/type/tag.py
+@@ -34,6 +34,16 @@ tagCategoryExplicit = 0x02
+ tagCategoryUntagged = 0x04
+ 
+ 
++def _tagIdToStr(tagId):
++    # Decimal rendering of a huge tag ID can exceed the interpreter's
++    # integer-to-string conversion limit (sys.get_int_max_str_digits(),
++    # Python 3.11+) and raise ValueError; hexadecimal is not limited
++    try:
++        return str(tagId)
++    except ValueError:
++        return hex(tagId)
++
++
+ class Tag(object):
+     """Create ASN.1 tag
+ 
+@@ -56,7 +66,8 @@ class Tag(object):
+     """
+     def __init__(self, tagClass, tagFormat, tagId):
+         if tagId < 0:
+-            raise error.PyAsn1Error('Negative tag ID (%s) not allowed' % tagId)
++            raise error.PyAsn1Error(
++                'Negative tag ID (%s) not allowed' % _tagIdToStr(tagId))
+         self.__tagClass = tagClass
+         self.__tagFormat = tagFormat
+         self.__tagId = tagId
+@@ -65,7 +76,7 @@ class Tag(object):
+ 
+     def __repr__(self):
+         representation = '[%s:%s:%s]' % (
+-            self.__tagClass, self.__tagFormat, self.__tagId)
++            self.__tagClass, self.__tagFormat, _tagIdToStr(self.__tagId))
+         return '<%s object, tag %s>' % (
+             self.__class__.__name__, representation)
+ 
+@@ -194,8 +205,9 @@ class TagSet(object):
+         self.__hash = hash(self.__superTagsClassId)
+ 
+     def __repr__(self):
+-        representation = '-'.join(['%s:%s:%s' % (x.tagClass, x.tagFormat, x.tagId)
+-                                   for x in self.__superTags])
++        representation = '-'.join(
++            ['%s:%s:%s' % (x.tagClass, x.tagFormat, _tagIdToStr(x.tagId))
++             for x in self.__superTags])
+         if representation:
+             representation = 'tags ' + representation
+         else:
+diff --git a/tests/codec/ber/test_decoder.py b/tests/codec/ber/test_decoder.py
+index f6ff7b0..0152027 100644
+--- a/tests/codec/ber/test_decoder.py
++++ b/tests/codec/ber/test_decoder.py
+@@ -34,6 +34,31 @@ class LargeTagDecoderTestCase(BaseTestCase):
+     def testLongTag(self):
+         assert decoder.decode(ints2octs((0x1f, 2, 1, 0)))[0].tagSet == univ.Integer.tagSet
+ 
++    def testVeryLongTagRoundTrip(self):
++        # (1 << 140) - 1 is the largest tag ID fitting the 20 octet limit
++        for tagId in (1 << 77, (1 << 140) - 1):
++            largeTag = tag.Tag(tag.tagClassContext, tag.tagFormatSimple, tagId)
++            asn1Spec = univ.Integer().subtype(implicitTag=largeTag)
++            value = univ.Integer(1).subtype(implicitTag=largeTag)
++
++            decoded, rest = decoder.decode(encoder.encode(value), asn1Spec=asn1Spec)
++
++            assert rest == b''
++            assert decoded == 1
++
++    def testExcessiveLongTag(self):
++        # 1 << 140 is the smallest tag ID needing 21 octets, one over the limit
++        excessiveTag = tag.Tag(tag.tagClassContext, tag.tagFormatSimple, 1 << 140)
++        asn1Spec = univ.Integer().subtype(implicitTag=excessiveTag)
++        substrate = encoder.encode(univ.Integer(1).subtype(implicitTag=excessiveTag))
++
++        try:
++            decoder.decode(substrate, asn1Spec=asn1Spec)
++        except error.PyAsn1Error:
++            pass
++        else:
++            assert 0, 'excessive long tag tolerated'
++
+     def testTagsEquivalence(self):
+         integer = univ.Integer(2).subtype(implicitTag=tag.Tag(tag.tagClassContext, 0, 0))
+         assert decoder.decode(ints2octs((0x9f, 0x80, 0x00, 0x02, 0x01, 0x02)), asn1Spec=integer) == decoder.decode(
+diff --git a/tests/codec/cer/test_decoder.py b/tests/codec/cer/test_decoder.py
+index 3d27194..d759f76 100644
+--- a/tests/codec/cer/test_decoder.py
++++ b/tests/codec/cer/test_decoder.py
+@@ -67,6 +67,21 @@ class OctetStringDecoderTestCase(BaseTestCase):
+     # TODO: test failures on short chunked and long unchunked substrate samples
+ 
+ 
++class LargeTagDecoderTestCase(BaseTestCase):
++    def testExcessiveLongTag(self):
++        # 1 << 140 is the smallest tag ID needing 21 octets, one over the limit
++        excessiveTag = tag.Tag(tag.tagClassContext, tag.tagFormatSimple, 1 << 140)
++        asn1Spec = univ.Integer().subtype(implicitTag=excessiveTag)
++        substrate = encoder.encode(univ.Integer(1).subtype(implicitTag=excessiveTag))
++
++        try:
++            decoder.decode(substrate, asn1Spec=asn1Spec)
++        except PyAsn1Error:
++            pass
++        else:
++            assert 0, 'excessive long tag tolerated'
++
++
+ class RealDecoderTestCase(BaseTestCase):
+     def testLargeBinaryRoundTrip(self):
+         substrate = encoder.encode(univ.Real((-1, 2, 76354972)))
+diff --git a/tests/codec/der/test_decoder.py b/tests/codec/der/test_decoder.py
+index 553563c..726c999 100644
+--- a/tests/codec/der/test_decoder.py
++++ b/tests/codec/der/test_decoder.py
+@@ -73,6 +73,21 @@ class OctetStringDecoderTestCase(BaseTestCase):
+             assert 0, 'chunked encoding tolerated'
+ 
+ 
++class LargeTagDecoderTestCase(BaseTestCase):
++    def testExcessiveLongTag(self):
++        # 1 << 140 is the smallest tag ID needing 21 octets, one over the limit
++        excessiveTag = tag.Tag(tag.tagClassContext, tag.tagFormatSimple, 1 << 140)
++        asn1Spec = univ.Integer().subtype(implicitTag=excessiveTag)
++        substrate = encoder.encode(univ.Integer(1).subtype(implicitTag=excessiveTag))
++
++        try:
++            decoder.decode(substrate, asn1Spec=asn1Spec)
++        except PyAsn1Error:
++            pass
++        else:
++            assert 0, 'excessive long tag tolerated'
++
++
+ class RealDecoderTestCase(BaseTestCase):
+     def testCanonicalLargeBinaryReal(self):
+         substrate = encoder.encode(univ.Real((1, 2, 1000000)))
+diff --git a/tests/type/test_tag.py b/tests/type/test_tag.py
+index d0ffa07..ab9b8b1 100644
+--- a/tests/type/test_tag.py
++++ b/tests/type/test_tag.py
+@@ -9,6 +9,7 @@ import unittest
+ 
+ from tests.base import BaseTestCase
+ 
++from pyasn1 import error
+ from pyasn1.type import tag
+ 
+ 
+@@ -23,6 +24,19 @@ class TagReprTestCase(TagTestCaseBase):
+     def testRepr(self):
+         assert 'Tag' in repr(self.t1)
+ 
++    def testReprHugeTagId(self):
++        # must not hit the interpreter's int-to-str conversion limit
++        hugeTag = tag.Tag(tag.tagClassContext, tag.tagFormatSimple, 1 << 100000)
++        assert 'Tag' in repr(hugeTag)
++
++    def testNegativeHugeTagId(self):
++        try:
++            tag.Tag(tag.tagClassContext, tag.tagFormatSimple, -(1 << 100000))
++        except error.PyAsn1Error:
++            pass
++        else:
++            assert 0, 'negative tag ID tolerated'
++
+ 
+ class TagCmpTestCase(TagTestCaseBase):
+     def testCmp(self):
+@@ -54,6 +68,12 @@ class TagSetReprTestCase(TagSetTestCaseBase):
+     def testRepr(self):
+         assert 'TagSet' in repr(self.ts1)
+ 
++    def testReprHugeTagId(self):
++        # must not hit the interpreter's int-to-str conversion limit
++        hugeTagSet = self.ts1.tagImplicitly(
++            tag.Tag(tag.tagClassContext, tag.tagFormatSimple, 1 << 100000))
++        assert 'TagSet' in repr(hugeTagSet)
++
+ 
+ class TagSetCmpTestCase(TagSetTestCaseBase):
+     def testCmp(self):
+-- 
+2.34.1
+

