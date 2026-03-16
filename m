Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9E6F506D7
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 14:06:03 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51098.1773669959173922242
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 07:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FZ55+EQ7;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14911; q=dns/txt;
  s=iport01; t=1773669959; x=1774879559;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uBp3S6jbY/FYnaW9nN/gfnkYJoF/XypcvFMQdbVqSbA=;
  b=FZ55+EQ7Zf+69dJhfUnQrzUAL9LUzh6J8/4jA0KAstxdjey1AOEo2jAv
   4LU+btubN2th5ENCQTT8x2AtB6hJ1UlBHsRJY+odGXDSYrKucdq2xv01V
   yR1OUlx8dJ/WO56d6OU9tmcKGsbky+U7OuQB60YnWkRUufFtPaxzXjg9h
   4i0ZQK6RilZaFkRBccvWJniqiEM8F4JKtJ/rQZr6Qavxtwu7nlUb5LWBY
   u+WdZUvyVcceyr3jKHNQ+6uMkgUyZSCeHQh42N9MN0CJttcR7ajVjPqME
   JjmQKOieZzxTPiayw71lX3JzlHJYec6cTcyFhzb/VeNOBroorEdC8T9Lp
   w==;
X-CSE-ConnectionGUID: wTyqQJphTy2Yss0Affp8HA==
X-CSE-MsgGUID: oBKh+UuTQJaAt6DMkSolhg==
X-IPAS-Result: =?us-ascii?q?A0CRAAAYDbhp/5L/Ja1aHQEBAQEJARIBBQUBgWsQBggBC?=
 =?us-ascii?q?wGCQw9xXkNJjHOJWItnkjaBfw8BAQEPRA0EAQGEQUaNJAImNAkOAQIEAQEBA?=
 =?us-ascii?q?QMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NhloBAgE1ARgBLSwDA?=
 =?us-ascii?q?QJPCyMhCRGCaAGCOgM2AxEGuWOCLIEBgygBPwICQAFPsikNglIBCxQBgTgBh?=
 =?us-ascii?q?TuCeYUgWxgBhHonGxuBcoEVg2iBBYEaQgEBAogiBIIigQ6BYR6JN4c7SIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ELGwcFhCQPiG10bYETgywDCxgNS?=
 =?us-ascii?q?BEsNxQbBD5uB403PIIHLQFgGhMBKQEBF5VUkjWgHXEKKIN0jB6PPoV8GjOFW?=
 =?us-ascii?q?6UQC5h7jgmECZFfMTeEaIFoPIFHCwdwFYMiCUkZD44qDguDXoF/gxRRwFwmM?=
 =?us-ascii?q?gIBAQcyAQEHAgcNAwuBaJACLYFOAQE?=
IronPort-Data: A9a23:ciy/C6N2JrH0M2/vrR3hlsFynXyQoLVcMsEvi/4bfWQNrUp00jIPn
 2oZUG2FbqvZYWOgctF0Ot6y/R5S6MOBydJjTXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmH+E3F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVjlV
 e/a+ZWFZgf+gmAsaQr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQrl58R7PSq
 07rldlVz0uBl/sfIorNfoXTLiXmdoXv0T2m0RK6bUQNbi9q/UTe2o5jXBYVhNw+Zz+hx7idw
 /0V3XC8pJtA0qDkwIwgvxdk/y5WIpFX4YblOXiDoJai1FaeWnXi26VOJRRjVWEY0r4f7WBm7
 /cULnUJKxuEne/zmOP9Qeh3jcNlJ87uVG8dkig/lneCUrB8HM2FGvmUjTNb9G9YasRmFPrZY
 cUQczdHZxXbaBoJMVASYH47tLjw1iWuL2EJ9zp5o4IwyUvTjzFs7IHPOfPJJPCvRv5SmkaX8
 zeuE2PRR0ty2Mak4T2d/3Shg+XCkS/2VMcZE6e13vprm0GIgGsLBRsbUFG2rfW0hgi5Qd03F
 qAP0jAloa538AmgScPwGkXp5nWFpRUbHdFXFoXW9T2w90Yd2C7BbkBsc9KLQIdOWBMeLdDy6
 mK0og==
IronPort-HdrOrdr: A9a23:2ahQRqk1nFoevySW9EbGJXdHKQzpDfIn3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdg7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6U
 +lGJIOb+EZyjNB/KLH3DU=
X-Talos-CUID: 9a23:TMW7xm++xCYwQfpnABCVv1EoC9kcUGXd8GaKElSjUU9nRqXFaXbFrQ==
X-Talos-MUID: 9a23:6XEoIwS11dzjE9jiRXTrrhJid/p1352MAWkRz7kjuPKDMSx/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,124,1770595200"; 
   d="scan'208";a="708494497"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Mar 2026 14:05:58 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id E2EE218000214;
	Mon, 16 Mar 2026 14:05:57 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 8C77BCC12A6; Mon, 16 Mar 2026 07:05:57 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH] python3: Fix CVE-2025-12781
Date: Mon, 16 Mar 2026 07:05:46 -0700
Message-ID: <20260316140553.76583-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 14:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233253

From: Anil Dongare <adongare@cisco.com>

Pick patch from [1] and [2] also mentioned in [3]
[1] https://github.com/python/cpython/commit/13360efd385d
[2] https://github.com/python/cpython/commit/9060b4abbe47
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-12781

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../python/python3/CVE-2025-12781_p1.patch    | 120 +++++++++++
 .../python/python3/CVE-2025-12781_p2.patch    | 190 ++++++++++++++++++
 .../python/python3_3.12.12.bb                 |   2 +
 3 files changed, 312 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-12781_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-12781_p2.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-12781_p1.patch b/meta/recipes-devtools/python/python3/CVE-2025-12781_p1.patch
new file mode 100644
index 0000000000..ea92915f4c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2025-12781_p1.patch
@@ -0,0 +1,120 @@
+From 3055c9622df972f0b055f42761b12de7a1998444 Mon Sep 17 00:00:00 2001
+From: Serhiy Storchaka <storchaka@gmail.com>
+Date: Thu, 6 Nov 2025 11:34:32 +0200
+Subject: [PATCH] gh-125346: Add more base64 tests (GH-141061)
+
+Add more tests for the altchars argument of b64decode() and for the map01
+argument of b32decode().
+
+CVE: CVE-2025-12781
+Upstream-Status: Backport [https://github.com/python/cpython/commit/13360efd385d1a7d0659beba03787ea3d063ef9b]
+
+(cherry picked from commit 13360efd385d1a7d0659beba03787ea3d063ef9b)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ Lib/test/test_base64.py | 63 +++++++++++++++++++++++++++--------------
+ 1 file changed, 41 insertions(+), 22 deletions(-)
+
+diff --git a/Lib/test/test_base64.py b/Lib/test/test_base64.py
+index f6171d3ed4e..5167b8560e6 100644
+--- a/Lib/test/test_base64.py
++++ b/Lib/test/test_base64.py
+@@ -200,18 +200,6 @@ def test_b64decode(self):
+         self.check_other_types(base64.b64decode, b"YWJj", b"abc")
+         self.check_decode_type_errors(base64.b64decode)
+
+-        # Test with arbitrary alternative characters
+-        tests_altchars = {(b'01a*b$cd', b'*$'): b'\xd3V\xbeo\xf7\x1d',
+-                          }
+-        for (data, altchars), res in tests_altchars.items():
+-            data_str = data.decode('ascii')
+-            altchars_str = altchars.decode('ascii')
+-
+-            eq(base64.b64decode(data, altchars=altchars), res)
+-            eq(base64.b64decode(data_str, altchars=altchars), res)
+-            eq(base64.b64decode(data, altchars=altchars_str), res)
+-            eq(base64.b64decode(data_str, altchars=altchars_str), res)
+-
+         # Test standard alphabet
+         for data, res in tests.items():
+             eq(base64.standard_b64decode(data), res)
+@@ -232,6 +220,20 @@ def test_b64decode(self):
+                                b'\xd3V\xbeo\xf7\x1d')
+         self.check_decode_type_errors(base64.urlsafe_b64decode)
+
++    def test_b64decode_altchars(self):
++        # Test with arbitrary alternative characters
++        eq = self.assertEqual
++        res = b'\xd3V\xbeo\xf7\x1d'
++        for altchars in b'*$', b'+/', b'/+', b'+_', b'-+', b'-/', b'/_':
++            data = b'01a%cb%ccd' % tuple(altchars)
++            data_str = data.decode('ascii')
++            altchars_str = altchars.decode('ascii')
++
++            eq(base64.b64decode(data, altchars=altchars), res)
++            eq(base64.b64decode(data_str, altchars=altchars), res)
++            eq(base64.b64decode(data, altchars=altchars_str), res)
++            eq(base64.b64decode(data_str, altchars=altchars_str), res)
++
+     def test_b64decode_padding_error(self):
+         self.assertRaises(binascii.Error, base64.b64decode, b'abc')
+         self.assertRaises(binascii.Error, base64.b64decode, 'abc')
+@@ -264,9 +266,12 @@ def test_b64decode_invalid_chars(self):
+                 base64.b64decode(bstr.decode('ascii'), validate=True)
+
+         # Normal alphabet characters not discarded when alternative given
+-        res = b'\xFB\xEF\xBE\xFF\xFF\xFF'
+-        self.assertEqual(base64.b64decode(b'++[[//]]', b'[]'), res)
+-        self.assertEqual(base64.urlsafe_b64decode(b'++--//__'), res)
++        res = b'\xfb\xef\xff'
++        self.assertEqual(base64.b64decode(b'++//', validate=True), res)
++        self.assertEqual(base64.b64decode(b'++//', '-_', validate=True), res)
++        self.assertEqual(base64.b64decode(b'--__', '-_', validate=True), res)
++        self.assertEqual(base64.urlsafe_b64decode(b'++//'), res)
++        self.assertEqual(base64.urlsafe_b64decode(b'--__'), res)
+
+     def test_b32encode(self):
+         eq = self.assertEqual
+@@ -325,19 +330,33 @@ def test_b32decode_casefold(self):
+         eq(base64.b32decode(b'MLO23456'), b'b\xdd\xad\xf3\xbe')
+         eq(base64.b32decode('MLO23456'), b'b\xdd\xad\xf3\xbe')
+
+-        map_tests = {(b'M1023456', b'L'): b'b\xdd\xad\xf3\xbe',
+-                     (b'M1023456', b'I'): b'b\x1d\xad\xf3\xbe',
+-                     }
+-        for (data, map01), res in map_tests.items():
+-            data_str = data.decode('ascii')
++    def test_b32decode_map01(self):
++        # Mapping zero and one
++        eq = self.assertEqual
++        res_L = b'b\xdd\xad\xf3\xbe'
++        res_I = b'b\x1d\xad\xf3\xbe'
++        eq(base64.b32decode(b'MLO23456'), res_L)
++        eq(base64.b32decode('MLO23456'), res_L)
++        eq(base64.b32decode(b'MIO23456'), res_I)
++        eq(base64.b32decode('MIO23456'), res_I)
++        self.assertRaises(binascii.Error, base64.b32decode, b'M1023456')
++        self.assertRaises(binascii.Error, base64.b32decode, b'M1O23456')
++        self.assertRaises(binascii.Error, base64.b32decode, b'ML023456')
++        self.assertRaises(binascii.Error, base64.b32decode, b'MI023456')
++
++        data = b'M1023456'
++        data_str = data.decode('ascii')
++        for map01, res in [(b'L', res_L), (b'I', res_I)]:
+             map01_str = map01.decode('ascii')
+
+             eq(base64.b32decode(data, map01=map01), res)
+             eq(base64.b32decode(data_str, map01=map01), res)
+             eq(base64.b32decode(data, map01=map01_str), res)
+             eq(base64.b32decode(data_str, map01=map01_str), res)
+-            self.assertRaises(binascii.Error, base64.b32decode, data)
+-            self.assertRaises(binascii.Error, base64.b32decode, data_str)
++
++            eq(base64.b32decode(b'M1O23456', map01=map01), res)
++            eq(base64.b32decode(b'M%c023456' % map01, map01=map01), res)
++            eq(base64.b32decode(b'M%cO23456' % map01, map01=map01), res)
+
+     def test_b32decode_error(self):
+         tests = [b'abc', b'ABCDEF==', b'==ABCDEF']
+--
+2.43.7
diff --git a/meta/recipes-devtools/python/python3/CVE-2025-12781_p2.patch b/meta/recipes-devtools/python/python3/CVE-2025-12781_p2.patch
new file mode 100644
index 0000000000..6cc7fc54d4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2025-12781_p2.patch
@@ -0,0 +1,190 @@
+From 7b93c8c741c2770962273a217d6216e2eaaa0301 Mon Sep 17 00:00:00 2001
+From: Serhiy Storchaka <storchaka@gmail.com>
+Date: Wed, 21 Jan 2026 09:41:58 +0200
+Subject: [PATCH] gh-125346: Deprecate accepting standard Base64 alphabet when
+ alternative alphabet is used (GH-141128)
+
+Emit a warning in base64.urlsafe_b64decode() and base64.b64decode() when
+the "+" or "/" characters occur in the Base64 data with alternative
+alphabet if they are not the part of the alternative alphabet.
+
+It is a DeprecationWarning in the strict mode (will be error) and
+a FutureWarning in non-strict mode (will be ignored).
+
+CVE: CVE-2025-12781
+Upstream-Status: Backport [https://github.com/python/cpython/commit/9060b4abbe475591b6230b23c2afefeff26fcca5]
+
+Backport Changes:
+- The upstream commit adds documentation and news entry files
+  (Doc/whatsnew/3.15.rst and Misc/NEWS.d/next/Library/...) which are
+  specific to the upstream development branch and not present in this
+  source tree. These changes were excluded from the backport.
+
+(cherry picked from commit 9060b4abbe475591b6230b23c2afefeff26fcca5)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ Doc/library/base64.rst  | 18 +++++++++++++-----
+ Lib/base64.py           | 40 +++++++++++++++++++++++++++++++++++-----
+ Lib/test/test_base64.py | 31 ++++++++++++++++++++++++-------
+ 3 files changed, 72 insertions(+), 17 deletions(-)
+
+diff --git a/Doc/library/base64.rst b/Doc/library/base64.rst
+index 9171e414a79..a6c32ada179 100644
+--- a/Doc/library/base64.rst
++++ b/Doc/library/base64.rst
+@@ -74,15 +74,20 @@ The modern interface provides:
+    A :exc:`binascii.Error` exception is raised
+    if *s* is incorrectly padded.
+
+-   If *validate* is ``False`` (the default), characters that are neither
++   If *validate* is false (the default), characters that are neither
+    in the normal base-64 alphabet nor the alternative alphabet are
+-   discarded prior to the padding check.  If *validate* is ``True``,
+-   these non-alphabet characters in the input result in a
+-   :exc:`binascii.Error`.
++   discarded prior to the padding check, but the ``+`` and ``/`` characters
++   keep their meaning if they are not in *altchars* (they will be discarded
++   in future Python versions).
++   If *validate* is true, these non-alphabet characters in the input
++   result in a :exc:`binascii.Error`.
+
+    For more information about the strict base64 check, see :func:`binascii.a2b_base64`
+
+-   May assert or raise a :exc:`ValueError` if the length of *altchars* is not 2.
++   .. deprecated:: next
++      Accepting the ``+`` and ``/`` characters with an alternative alphabet
++      is now deprecated.
++
+
+ .. function:: standard_b64encode(s)
+
+@@ -113,6 +118,9 @@ The modern interface provides:
+    ``/`` in the standard Base64 alphabet, and return the decoded
+    :class:`bytes`.
+
++   .. deprecated:: next
++      Accepting the ``+`` and ``/`` characters is now deprecated.
++
+
+ .. function:: b32encode(s)
+
+diff --git a/Lib/base64.py b/Lib/base64.py
+index 846767a3d5a..d21705134d2 100755
+--- a/Lib/base64.py
++++ b/Lib/base64.py
+@@ -72,20 +72,39 @@ def b64decode(s, altchars=None, validate=False):
+     The result is returned as a bytes object.  A binascii.Error is raised if
+     s is incorrectly padded.
+
+-    If validate is False (the default), characters that are neither in the
++    If validate is false (the default), characters that are neither in the
+     normal base-64 alphabet nor the alternative alphabet are discarded prior
+-    to the padding check.  If validate is True, these non-alphabet characters
++    to the padding check.  If validate is true, these non-alphabet characters
+     in the input result in a binascii.Error.
+     For more information about the strict base64 check, see:
+
+     https://docs.python.org/3.11/library/binascii.html#binascii.a2b_base64
+     """
+     s = _bytes_from_decode_data(s)
++    badchar = None
+     if altchars is not None:
+         altchars = _bytes_from_decode_data(altchars)
+-        assert len(altchars) == 2, repr(altchars)
++        if len(altchars) != 2:
++            raise ValueError(f'invalid altchars: {altchars!r}')
++        for b in b'+/':
++            if b not in altchars and b in s:
++                badchar = b
++                break
+         s = s.translate(bytes.maketrans(altchars, b'+/'))
+-    return binascii.a2b_base64(s, strict_mode=validate)
++    result = binascii.a2b_base64(s, strict_mode=validate)
++    if badchar is not None:
++        import warnings
++        if validate:
++            warnings.warn(f'invalid character {chr(badchar)!a} in Base64 data '
++                          f'with altchars={altchars!r} and validate=True '
++                          f'will be an error in future Python versions',
++                          DeprecationWarning, stacklevel=2)
++        else:
++            warnings.warn(f'invalid character {chr(badchar)!a} in Base64 data '
++                          f'with altchars={altchars!r} and validate=False '
++                          f'will be discarded in future Python versions',
++                          FutureWarning, stacklevel=2)
++    return result
+
+
+ def standard_b64encode(s):
+@@ -130,8 +149,19 @@ def urlsafe_b64decode(s):
+     The alphabet uses '-' instead of '+' and '_' instead of '/'.
+     """
+     s = _bytes_from_decode_data(s)
++    badchar = None
++    for b in b'+/':
++        if b in s:
++            badchar = b
++            break
+     s = s.translate(_urlsafe_decode_translation)
+-    return b64decode(s)
++    result = binascii.a2b_base64(s, strict_mode=False)
++    if badchar is not None:
++        import warnings
++        warnings.warn(f'invalid character {chr(badchar)!a} in URL-safe Base64 data '
++                      f'will be discarded in future Python versions',
++                      FutureWarning, stacklevel=2)
++    return result
+
+
+
+diff --git a/Lib/test/test_base64.py b/Lib/test/test_base64.py
+index 5167b8560e6..4f6284f1139 100644
+--- a/Lib/test/test_base64.py
++++ b/Lib/test/test_base64.py
+@@ -234,6 +234,11 @@ def test_b64decode_altchars(self):
+             eq(base64.b64decode(data, altchars=altchars_str), res)
+             eq(base64.b64decode(data_str, altchars=altchars_str), res)
+
++        self.assertRaises(ValueError, base64.b64decode, b'', altchars=b'+')
++        self.assertRaises(ValueError, base64.b64decode, b'', altchars=b'+/-')
++        self.assertRaises(ValueError, base64.b64decode, '', altchars='+')
++        self.assertRaises(ValueError, base64.b64decode, '', altchars='+/-')
++
+     def test_b64decode_padding_error(self):
+         self.assertRaises(binascii.Error, base64.b64decode, b'abc')
+         self.assertRaises(binascii.Error, base64.b64decode, 'abc')
+@@ -265,13 +270,25 @@ def test_b64decode_invalid_chars(self):
+             with self.assertRaises(binascii.Error):
+                 base64.b64decode(bstr.decode('ascii'), validate=True)
+
+-        # Normal alphabet characters not discarded when alternative given
+-        res = b'\xfb\xef\xff'
+-        self.assertEqual(base64.b64decode(b'++//', validate=True), res)
+-        self.assertEqual(base64.b64decode(b'++//', '-_', validate=True), res)
+-        self.assertEqual(base64.b64decode(b'--__', '-_', validate=True), res)
+-        self.assertEqual(base64.urlsafe_b64decode(b'++//'), res)
+-        self.assertEqual(base64.urlsafe_b64decode(b'--__'), res)
++        # Normal alphabet characters will be discarded when alternative given
++        with self.assertWarns(FutureWarning):
++            self.assertEqual(base64.b64decode(b'++++', altchars=b'-_'),
++                             b'\xfb\xef\xbe')
++        with self.assertWarns(FutureWarning):
++            self.assertEqual(base64.b64decode(b'////', altchars=b'-_'),
++                             b'\xff\xff\xff')
++        with self.assertWarns(DeprecationWarning):
++            self.assertEqual(base64.b64decode(b'++++', altchars=b'-_', validate=True),
++                             b'\xfb\xef\xbe')
++        with self.assertWarns(DeprecationWarning):
++            self.assertEqual(base64.b64decode(b'////', altchars=b'-_', validate=True),
++                             b'\xff\xff\xff')
++        with self.assertWarns(FutureWarning):
++            self.assertEqual(base64.urlsafe_b64decode(b'++++'), b'\xfb\xef\xbe')
++        with self.assertWarns(FutureWarning):
++            self.assertEqual(base64.urlsafe_b64decode(b'////'), b'\xff\xff\xff')
++        with self.assertRaises(binascii.Error):
++            base64.b64decode(b'+/!', altchars=b'-_')
+
+     def test_b32encode(self):
+         eq = self.assertEqual
+--
+2.43.7
diff --git a/meta/recipes-devtools/python/python3_3.12.12.bb b/meta/recipes-devtools/python/python3_3.12.12.bb
index ce2c830655..05d723b4c5 100644
--- a/meta/recipes-devtools/python/python3_3.12.12.bb
+++ b/meta/recipes-devtools/python/python3_3.12.12.bb
@@ -38,6 +38,8 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2025-12084.patch \
            file://CVE-2025-13836.patch \
            file://CVE-2025-13837.patch \
+           file://CVE-2025-12781_p1.patch \
+           file://CVE-2025-12781_p2.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.44.1


