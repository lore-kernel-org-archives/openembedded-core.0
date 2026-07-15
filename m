Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E97C4450A
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 05:54:15 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.578.1784094845794876748
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 22:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=f5PzvKI0;
 spf=pass (domain: mvista.com, ip: 209.85.215.175, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9d1fc053e0so1543599a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 22:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784094845; x=1784699645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qzWa2+fj81mfvbnRQnpqySdU9swZEaWRVcEAQJZgSkw=;
        b=f5PzvKI0sQqcwq3UycIdX0ujXbpmbB8XvP3mEWlDJA1yfR+NJAnXnn7hclWM2LpyUu
         RnYkcUaXuGgC8uGI2P1kFGtiu09Npj/42c4O0DJs47Sowh1orXxGUbtwrhWp9K8cqS90
         b+Tml6/yp283zMGE4ufHzRmNHMWosAQLkKc3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784094845; x=1784699645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzWa2+fj81mfvbnRQnpqySdU9swZEaWRVcEAQJZgSkw=;
        b=DQVjOulAc90vnSDkq5ePAmragFsAy2c82yORKsbywJ2yfN5iK0p8pUy20fHWsdZSgf
         343H0meePUC9p2JdTo4hJps/Jte4X8tU1aW7QCpjG59GwWIdfBKEofmy8LVpOXI65obB
         bpV3I5T5FfGaYGdCTLrc5XNI9cd/VPLACkwsIH8OCYvIHidj0SOurw+SS/kMPLTCkbWp
         R/HVZ5Zvd2+NfFEozpkex69iQ24l5NrEJsZc6wuSAPSoCxuL7M249kAocwdxVMUpvSGB
         3VCrevIrklp+POVXk9LsPTEmrzDs4CNsf+ng6tlbMcAGm70BuYzNKVunql6MdX+xd2ks
         Kpig==
X-Gm-Message-State: AOJu0YydOhqe5IL8jvf2WLOu08/cNEDNlS/lJVOFX+V306RnliF+E1Z3
	LqobfONx1o74kOKcqm9sfLHdQ6zsTkkMqmY+EXj0AMT3FewITK9lqD4zalLV1LbqNNlHT6ZP04A
	32gdZgjM=
X-Gm-Gg: AfdE7ckTMBwIlZMvryUO83n8I+P4tZ1Q3E2a+HjoV58UAIdPLC++2WCWW3VhYJNMF/q
	PT2O4C7T4UF83n5/XeMVUlLXFLzCTPs2j3EoYWtYOg7zuYTE0xjB02zHkVByg6uReCWoSBrX5Nz
	ziIqt2cnwsW2hSo+LLBFBOU3S3a1Z+FiFt/1g8nisUpKzWitGDTcmxP0A09TyBSpjAGF2jW/Ihk
	w9rEOOAH9oRPI6/TuA2wDCpmcYJlWNTkKWVNr3wlaSRFVVwjw4rquJLi9l3+vjvgnCztjMai0o4
	Zujmvi1TmGIkH+K2yszcURWN3dJB6L0o66Ki/VrsnLc+KPKrTy2g3zi/qzu3lSC7NMHmDCLYiu0
	N/FVmC63tLlSOoq6ppATThKetsuBBHLZi9AmFX1MnZ9KwoFAgju+VF4wLZsrW0BW5bJAfwFocWF
	a2+M+pOvBcM/7DoTBBYHRb/j09uA==
X-Received: by 2002:a05:6a20:d12e:b0:3bf:bcef:fedd with SMTP id adf61e73a8af0-3c110775a66mr18449692637.39.1784094844941;
        Tue, 14 Jul 2026 22:54:04 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b8deb2a21sm35702168c88.3.2026.07.14.22.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:54:04 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [wrynose][PATCH] python3-pyasn1: Fix for CVE-2026-30922
Date: Wed, 15 Jul 2026 11:23:55 +0530
Message-ID: <20260715055355.20351-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 05:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240937

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://github.com/pyasn1/pyasn1/commit/25ad481c19fdb006e20485ef3fc2e5b3eff30ef0
[2] https://security-tracker.debian.org/tracker/CVE-2026-30922

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-30922

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../python3-pyasn1/CVE-2026-30922.patch       | 261 ++++++++++++++++++
 .../python/python3-pyasn1_0.6.2.bb            |   4 +
 2 files changed, 265 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch

diff --git a/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch
new file mode 100644
index 0000000000..69de7fdce8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch
@@ -0,0 +1,261 @@
+From 25ad481c19fdb006e20485ef3fc2e5b3eff30ef0 Mon Sep 17 00:00:00 2001
+From: Simon Pichugin <simon.pichugin@gmail.com>
+Date: Mon, 16 Mar 2026 17:23:11 -0700
+Subject: [PATCH] Merge commit from fork
+
+CVE: CVE-2026-30922
+Upstream-Status: Backport [https://github.com/pyasn1/pyasn1/commit/25ad481c19fdb006e20485ef3fc2e5b3eff30ef0]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ pyasn1/codec/ber/decoder.py     |  10 +++
+ tests/codec/ber/test_decoder.py | 116 ++++++++++++++++++++++++++++++++
+ tests/codec/cer/test_decoder.py |  24 +++++++
+ tests/codec/der/test_decoder.py |  42 ++++++++++++
+ 4 files changed, 192 insertions(+)
+
+diff --git a/pyasn1/codec/ber/decoder.py b/pyasn1/codec/ber/decoder.py
+index 853e837..47da67c 100644
+--- a/pyasn1/codec/ber/decoder.py
++++ b/pyasn1/codec/ber/decoder.py
+@@ -36,6 +36,7 @@ SubstrateUnderrunError = error.SubstrateUnderrunError
+ # Maximum number of continuation octets (high-bit set) allowed per OID arc.
+ # 20 octets allows up to 140-bit integers, supporting UUID-based OIDs
+ MAX_OID_ARC_CONTINUATION_OCTETS = 20
++MAX_NESTING_DEPTH = 100
+ 
+ 
+ class AbstractPayloadDecoder(object):
+@@ -1565,6 +1566,15 @@ class SingleItemDecoder(object):
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
+index 741605f..3e0e09a 100644
+--- a/tests/codec/ber/test_decoder.py
++++ b/tests/codec/ber/test_decoder.py
+@@ -2117,6 +2117,122 @@ class CompressedFilesTestCase(BaseTestCase):
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
+index 864bffb..24d1999 100644
+--- a/tests/codec/cer/test_decoder.py
++++ b/tests/codec/cer/test_decoder.py
+@@ -363,6 +363,30 @@ class SequenceDecoderWithExplicitlyTaggedSetOfOpenTypesTestCase(BaseTestCase):
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
+index 96eb3cd..ab24c07 100644
+--- a/tests/codec/der/test_decoder.py
++++ b/tests/codec/der/test_decoder.py
+@@ -361,6 +361,48 @@ class SequenceDecoderWithExplicitlyTaggedSetOfOpenTypesTestCase(BaseTestCase):
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
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
index 01157e251e..119d632d1f 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
@@ -7,6 +7,10 @@ SRC_URI[sha256sum] = "9b59a2b25ba7e4f8197db7686c09fb33e658b98339fadb826e95126290
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
+SRC_URI += " \
+           file://CVE-2026-30922.patch \
+"
+
 RDEPENDS:${PN}:class-target += " \
     python3-codecs \
     python3-logging \
-- 
2.50.1


