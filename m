Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6DFFF884D
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:02 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32582.1777064212367009879
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qU8AuaHc;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso86444545e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064210; x=1777669010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PHTAoYMechlICcHFSLBbuvfuG1b0qobvUGKIP9HpNM=;
        b=qU8AuaHcz/0DXFqqrWDSv06oOwoYun5dqiW4cxstAaPkHflhCZrw7VWK4YtcNuHO+k
         +YqqIGTwbyI/j045Rr4MMHlsdEfE/zSFYxo2Lr/nStOJPAzy5FuKlb5cmXdmUxacrhdU
         Qp/xvxECb/WE6PN/sY2tcW95OBGxvKFSlwQ5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064210; x=1777669010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8PHTAoYMechlICcHFSLBbuvfuG1b0qobvUGKIP9HpNM=;
        b=m4DySYd9wCpBEfuKG+OZX1Mwl/K7vbw4DZydfGtQX22w+z3c9uSL0LDcPm2vg7NPzR
         jsleA5icnG7t6oyU3lXI/OfxdCQM0eKsCSjGVl11i+YBg+YJS7OHGBkcNYUCtBfQNKCT
         XayDnujNhvOxrtuMjhmJM/w/6sor3lp8mNQBlUli6jWMLzuJOCp6zJIQ2wgIVG+XmAXT
         oxnSyQ7zRe8D04euztXUvgxaqpSwTBwt8c5vpXTI6xXpd2o4+oVq2p2S6fF4/76/LDYh
         jcAw5mZKh1P0pXKmsrlzGEQzgnj0Ijd9ufgbIi5kGr63mFBWHdBlP0F3qNivs4fooLIY
         FOBw==
X-Gm-Message-State: AOJu0YyydHH0l9P6C+vtN8eswg0z4+9s5Wd7GlPwglhQDITan3H7ZGA+
	xmx7s1pzNxqUk1VoWP7qYDvZCtLBCxg7AQK8L5u4PMjk3lVdoafadrylttb6oqthIXu9RGAQ++x
	picyJPEUBSPZM
X-Gm-Gg: AeBDieuzI5Skwh2zwuLgHjR5xP0RVIHlxKavo9dzdPumj9s49OU4I/nFhaIr77Rhswu
	2D+HDcwH57FpqDOpODSoqZM24dE8cMv75ixofW8EUzQ4wu1iR/prjCzIs0lPWqKkCSUKhbzWP03
	JWrW98aT2G3HOpsfLeNToLpqhuyu8b0mb6/itoA+pIL7/QBvRrj3TsBIcsHM7zwKcHjVQsqE1+v
	/g/NpWHLJOsCDCO5Ong5x4tgok0tEwCiTeqOHpHV0o6t5pS7E91/EaDXxBGkNR/grlfpWxPfkD6
	riX1FGeZ4afILwJMJ3AjdIIZ4vdGJDkd77uitZPfnwx+KYC2vOTBKNalkZBDAEH45JAt/IAv7Yf
	mrZE0va7iyygF8r19Vh4nP2cwMeb6LDbf4F5Dr+X06WqjnN+L3ptK2NsGV0J7yg9G1I+3GpXThv
	n7U5NlMhoT6R/OE04tax1cEumowOX7DX/broZsFTpmbFAfIAnLuEXO5/AwHCK2ralaOpO1fHeda
	eiK6lpkqlGXIct6LI2qjQkQTDgFaHS2jb5E1A==
X-Received: by 2002:a05:600d:8408:b0:488:b8bc:6a32 with SMTP id 5b1f17b1804b1-488fb7857c6mr353663885e9.23.1777064210488;
        Fri, 24 Apr 2026 13:56:50 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/66] python3-pyasn1: fix CVE-2026-23490
Date: Fri, 24 Apr 2026 22:55:22 +0200
Message-ID: <205d360b49c7bbaa8709cb5a0b2e57457c32ad22.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235896

From: Jiaying Song <jiaying.song.cn@windriver.com>

pyasn1 is a generic ASN.1 library for Python. Prior to 0.6.2, a
Denial-of-Service issue has been found that leads to memory exhaustion
from malformed RELATIVE-OID with excessive continuation octets. This
vulnerability is fixed in 0.6.2.

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-23490

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-devtools/python/python-pyasn1.inc |   3 +-
 .../python3-pyasn1/CVE-2026-23490.patch       | 136 ++++++++++++++++++
 2 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-23490.patch

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index 530ff1c7c36..96b4a3b52a6 100644
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
index 00000000000..a79774003be
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

