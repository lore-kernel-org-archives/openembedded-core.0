Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DAFCD98C5
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 10:13:02 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88533.1781345570240289582
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 03:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XShu7+Xf;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12397; q=dns/txt;
  s=iport01; t=1781345570; x=1782555170;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=8t6Jc2q7GS4lUhovSbaFSatNjXUHFkWZ3u1IobMglrk=;
  b=XShu7+Xf12K7aCnVjLrAOt/gH+xqsoOvtfIQw7Ypvf9ed3bbo3GSHTY+
   aIR5+9ClaUhY4xLbV4IQlCAn8fLXm5t7W6xxmsqFftEpWsFn4WyLQIzKk
   WBxjmzyANwZb2UHNWb8kNZKQ/HJe9m6WfThK+Dfix2pjIeVuHUUDS5Fah
   cB2qvKpWlJNazSVvMHSpRESEU4+/RSisd3DeZth8oHO4KRlCFo/rxo6Ik
   Vq2LTkLCs2xYJClO75cTiC7R5J03r2I+vT6gjA9vtLHNpykPw2ugkjjYT
   BY+6MacMdkCMNiDEwh7Ib7JwWWpAowxGRb6WinVnw8p+uyth1f9zg1SEQ
   w==;
X-CSE-ConnectionGUID: Qu/Ndn3ERWuSjuPNf21Avw==
X-CSE-MsgGUID: VSYXcAikTCS0wpo7u95i2Q==
X-IPAS-Result: =?us-ascii?q?A0A8AwBhLC1q/4z/Ja1aglmCV3RfQkkDlCeCIQOgGQ8BA?=
 =?us-ascii?q?QEPRA0EAQGEQEYCjUMCJjcGDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMnCwEYAT0cAwECLysjCBkJEYJoAYJzAgERs1iBeTOBA?=
 =?us-ascii?q?YMoATEFAwEFAkNQ2ysBCw0CBQGBOIMggh+IH1sYAYR8JxsbgXKBFYNpgQWBX?=
 =?us-ascii?q?AEBiCUEgg0VgQyBXR5SjktIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?QwbBwWBSoEraoEEhQ0jHwM5f4FzgShnZxUwNYECER8KHAMLGA1IESw3FBsEP?=
 =?us-ascii?q?m4HjF0XD4FMRS0xDAIkKwEHIgEBIAJdYUwRDZJzLpI3oQ8KKIN1jCGVOhozh?=
 =?us-ascii?q?VulEZkIjgqWUIRogX4mgUcLB3AVgyIJShkPji0LC4NggX+DFFHBKiQ1AgkDL?=
 =?us-ascii?q?wEBBwIHDgMLgWiRfQEB?=
IronPort-Data: A9a23:fx4qza0/hFaHTfTb+/bD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzxWy
 DQaCG/VbPeLamXxeo92bdy39xsA6sDdzdY1GgI93Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 bsen+WFYAX7g2AtaTpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGNVxxG4EeoctNPnx19
 +EgDj5XNzmdmLfjqF67YrEEasULNsLnOsYb/3pn1zycVa1gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiYC/FMEg9/5JYWh/qkm3z1czRwo1OOrq1x6G/WpOB0+OS8bIKLJ4fSHK25mG6mn
 VP29E34AS0xD4SA0T3a7yPxh7X2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7CQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:znLBF6FdaBA0RTgnpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3A5iRia2oXH0u0+SZzy8iHMgXmUfk4NVvRyiz9GXC?=
 =?us-ascii?q?lMmR0cJubEwa55rwxxg=3D=3D?=
X-Talos-MUID: 9a23:U+H7fAV6biYxnhHq/AHXtQFpHcZr34+VUF8Vlsob6pSFbxUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,202,1774310400"; 
   d="scan'208";a="494065301"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Jun 2026 10:12:49 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 0457118000587
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 10:12:49 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id A6265CB6A93; Sat, 13 Jun 2026 03:12:48 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 3/4] python3: Fix CVE-2026-6019
Date: Sat, 13 Jun 2026 03:11:39 -0700
Message-Id: <20260613101137.3690080-3-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260613101137.3690080-1-sudumbha@cisco.com>
References: <20260613101137.3690080-1-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 10:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238669

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix [1] and follow-up fix [2], as
referenced in [3] and [4], to address an http.cookies.Morsel.js_output()
flaw where inline JavaScript output escaped quotes but did not neutralize
the HTML parser-sensitive </script> sequence.

[1] https://github.com/python/cpython/commit/3c59b8b53fc75c7f9578d16fb8201ceb43e8f76c
[2] https://github.com/python/cpython/commit/e7d4c3ff421916986223690a8425d2383f6f3802
[3] https://github.com/python/cpython/issues/149144
[4] https://security-tracker.debian.org/tracker/CVE-2026-6019

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-6019

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../python/python3/CVE-2026-6019_p1.patch     | 133 ++++++++++++++++++
 .../python/python3/CVE-2026-6019_p2.patch     | 129 +++++++++++++++++
 .../python/python3_3.12.13.bb                 |   2 +
 3 files changed, 264 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-6019_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-6019_p2.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-6019_p1.patch b/meta/recipes-devtools/python/python3/CVE-2026-6019_p1.patch
new file mode 100644
index 0000000000..27a4160942
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-6019_p1.patch
@@ -0,0 +1,133 @@
+From be751c3f3a11d40c2133bee5fb6ab6931df31936 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Thu, 23 Apr 2026 15:05:17 +0200
+Subject: [PATCH] [3.13] gh-90309: Base64-encode cookie values embedded in
+ JS (GH-148888)
+
+CVE: CVE-2026-6019
+Upstream-Status: Backport [https://github.com/python/cpython/commit/3c59b8b53fc75c7f9578d16fb8201ceb43e8f76c]
+
+Backport Changes:
+- This file is not present in the current version and is therefore omitted.
+  Misc/NEWS.d/next/Security/2026-04-21-13-46-30.gh-issue-90309.srvj9q.rst
+
+(cherry picked from commit 76b3923d688c0efc580658476c5f525ec8735104)
+
+Co-authored-by: Seth Larson <seth@python.org>
+(cherry picked from commit 3c59b8b53fc75c7f9578d16fb8201ceb43e8f76c)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ Lib/http/cookies.py           |  8 ++++++--
+ Lib/test/test_http_cookies.py | 29 ++++++++++++++++++-----------
+ 2 files changed, 24 insertions(+), 13 deletions(-)
+
+diff --git a/Lib/http/cookies.py b/Lib/http/cookies.py
+index 63d119ad46c..aebc2a163e4 100644
+--- a/Lib/http/cookies.py
++++ b/Lib/http/cookies.py
+@@ -389,17 +389,21 @@ class Morsel(dict):
+         return '<%s: %s>' % (self.__class__.__name__, self.OutputString())
+ 
+     def js_output(self, attrs=None):
++        import base64
+         # Print javascript
+         output_string = self.OutputString(attrs)
+         if _has_control_character(output_string):
+             raise CookieError("Control characters are not allowed in cookies")
++        # Base64-encode value to avoid template
++        # injection in cookie values.
++        output_encoded = base64.b64encode(output_string.encode('utf-8')).decode("ascii")
+         return """
+         <script type="text/javascript">
+         <!-- begin hiding
+-        document.cookie = \"%s\";
++        document.cookie = atob(\"%s\");
+         // end hiding -->
+         </script>
+-        """ % (output_string.replace('"', r'\"'))
++        """ % (output_encoded,)
+ 
+     def OutputString(self, attrs=None):
+         # Build up our result
+diff --git a/Lib/test/test_http_cookies.py b/Lib/test/test_http_cookies.py
+index 2478a6c630f..6aa5df068f9 100644
+--- a/Lib/test/test_http_cookies.py
++++ b/Lib/test/test_http_cookies.py
+@@ -1,5 +1,5 @@
+ # Simple test suite for http/cookies.py
+-
++import base64
+ import copy
+ import unittest
+ import doctest
+@@ -152,17 +152,19 @@ class CookieTests(unittest.TestCase):
+ 
+         self.assertEqual(C.output(['path']),
+             'Set-Cookie: Customer="WILE_E_COYOTE"; Path=/acme')
+-        self.assertEqual(C.js_output(), r"""
++        cookie_encoded = base64.b64encode(b'Customer="WILE_E_COYOTE"; Path=/acme; Version=1').decode('ascii')
++        self.assertEqual(C.js_output(), fr"""
+         <script type="text/javascript">
+         <!-- begin hiding
+-        document.cookie = "Customer=\"WILE_E_COYOTE\"; Path=/acme; Version=1";
++        document.cookie = atob("{cookie_encoded}");
+         // end hiding -->
+         </script>
+         """)
+-        self.assertEqual(C.js_output(['path']), r"""
++        cookie_encoded = base64.b64encode(b'Customer="WILE_E_COYOTE"; Path=/acme').decode('ascii')
++        self.assertEqual(C.js_output(['path']), fr"""
+         <script type="text/javascript">
+         <!-- begin hiding
+-        document.cookie = "Customer=\"WILE_E_COYOTE\"; Path=/acme";
++        document.cookie = atob("{cookie_encoded}");
+         // end hiding -->
+         </script>
+         """)
+@@ -259,17 +261,19 @@ class CookieTests(unittest.TestCase):
+ 
+         self.assertEqual(C.output(['path']),
+                          'Set-Cookie: Customer="WILE_E_COYOTE"; Path=/acme')
+-        self.assertEqual(C.js_output(), r"""
++        expected_encoded_cookie = base64.b64encode(b'Customer=\"WILE_E_COYOTE\"; Path=/acme; Version=1').decode('ascii')
++        self.assertEqual(C.js_output(), fr"""
+         <script type="text/javascript">
+         <!-- begin hiding
+-        document.cookie = "Customer=\"WILE_E_COYOTE\"; Path=/acme; Version=1";
++        document.cookie = atob("{expected_encoded_cookie}");
+         // end hiding -->
+         </script>
+         """)
+-        self.assertEqual(C.js_output(['path']), r"""
++        expected_encoded_cookie = base64.b64encode(b'Customer=\"WILE_E_COYOTE\"; Path=/acme').decode('ascii')
++        self.assertEqual(C.js_output(['path']), fr"""
+         <script type="text/javascript">
+         <!-- begin hiding
+-        document.cookie = "Customer=\"WILE_E_COYOTE\"; Path=/acme";
++        document.cookie = atob("{expected_encoded_cookie}");
+         // end hiding -->
+         </script>
+         """)
+@@ -360,13 +364,16 @@ class MorselTests(unittest.TestCase):
+             self.assertEqual(
+                 M.output(),
+                 "Set-Cookie: %s=%s; Path=/foo" % (i, "%s_coded_val" % i))
++            expected_encoded_cookie = base64.b64encode(
++                ("%s=%s; Path=/foo" % (i, "%s_coded_val" % i)).encode("ascii")
++            ).decode('ascii')
+             expected_js_output = """
+         <script type="text/javascript">
+         <!-- begin hiding
+-        document.cookie = "%s=%s; Path=/foo";
++        document.cookie = atob("%s");
+         // end hiding -->
+         </script>
+-        """ % (i, "%s_coded_val" % i)
++        """ % (expected_encoded_cookie,)
+             self.assertEqual(M.js_output(), expected_js_output)
+         for i in ["foo bar", "foo@bar"]:
+             # Try some illegal characters
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-6019_p2.patch b/meta/recipes-devtools/python/python3/CVE-2026-6019_p2.patch
new file mode 100644
index 0000000000..0646bd2133
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-6019_p2.patch
@@ -0,0 +1,129 @@
+From de449bbc6ff4ce869c17fb551dacc69de25d73a9 Mon Sep 17 00:00:00 2001
+From: Stan Ulbrych <stan@python.org>
+Date: Mon, 8 Jun 2026 20:15:21 +0100
+Subject: [PATCH] [3.13] gh-149144: Use `decodeURIComponent()` for UTF-8
+ support in `js_output()` (GH-149157) (#150949)
+
+CVE: CVE-2026-6019
+Upstream-Status: Backport [https://github.com/python/cpython/commit/e7d4c3ff421916986223690a8425d2383f6f3802]
+
+Co-authored-by: Seth Larson <seth@python.org>
+(cherry picked from commit e7d4c3ff421916986223690a8425d2383f6f3802)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ Lib/http/cookies.py           |  6 +++---
+ Lib/test/test_http_cookies.py | 27 ++++++++++++++-------------
+ 2 files changed, 17 insertions(+), 16 deletions(-)
+
+diff --git a/Lib/http/cookies.py b/Lib/http/cookies.py
+index aebc2a163e4..2cffa2a9ad6 100644
+--- a/Lib/http/cookies.py
++++ b/Lib/http/cookies.py
+@@ -389,18 +389,18 @@ class Morsel(dict):
+         return '<%s: %s>' % (self.__class__.__name__, self.OutputString())
+ 
+     def js_output(self, attrs=None):
+-        import base64
++        import urllib.parse
+         # Print javascript
+         output_string = self.OutputString(attrs)
+         if _has_control_character(output_string):
+             raise CookieError("Control characters are not allowed in cookies")
+         # Base64-encode value to avoid template
+         # injection in cookie values.
+-        output_encoded = base64.b64encode(output_string.encode('utf-8')).decode("ascii")
++        output_encoded = urllib.parse.quote(output_string, safe='', encoding='utf-8')
+         return """
+         <script type="text/javascript">
+         <!-- begin hiding
+-        document.cookie = atob(\"%s\");
++        document.cookie = decodeURIComponent(\"%s\");
+         // end hiding -->
+         </script>
+         """ % (output_encoded,)
+diff --git a/Lib/test/test_http_cookies.py b/Lib/test/test_http_cookies.py
+index 6aa5df068f9..b9cc59cd1db 100644
+--- a/Lib/test/test_http_cookies.py
++++ b/Lib/test/test_http_cookies.py
+@@ -1,10 +1,10 @@
+ # Simple test suite for http/cookies.py
+-import base64
+ import copy
+ import unittest
+ import doctest
+ from http import cookies
+ import pickle
++import urllib.parse
+ from test import support
+ 
+ 
+@@ -152,19 +152,19 @@ class CookieTests(unittest.TestCase):
+ 
+         self.assertEqual(C.output(['path']),
+             'Set-Cookie: Customer="WILE_E_COYOTE"; Path=/acme')
+-        cookie_encoded = base64.b64encode(b'Customer="WILE_E_COYOTE"; Path=/acme; Version=1').decode('ascii')
++        cookie_encoded = urllib.parse.quote('Customer="WILE_E_COYOTE"; Path=/acme; Version=1', safe='', encoding='utf-8')
+         self.assertEqual(C.js_output(), fr"""
+         <script type="text/javascript">
+         <!-- begin hiding
+-        document.cookie = atob("{cookie_encoded}");
++        document.cookie = decodeURIComponent("{cookie_encoded}");
+         // end hiding -->
+         </script>
+         """)
+-        cookie_encoded = base64.b64encode(b'Customer="WILE_E_COYOTE"; Path=/acme').decode('ascii')
++        cookie_encoded = urllib.parse.quote('Customer="WILE_E_COYOTE"; Path=/acme', safe='', encoding='utf-8')
+         self.assertEqual(C.js_output(['path']), fr"""
+         <script type="text/javascript">
+         <!-- begin hiding
+-        document.cookie = atob("{cookie_encoded}");
++        document.cookie = decodeURIComponent("{cookie_encoded}");
+         // end hiding -->
+         </script>
+         """)
+@@ -261,19 +261,19 @@ class CookieTests(unittest.TestCase):
+ 
+         self.assertEqual(C.output(['path']),
+                          'Set-Cookie: Customer="WILE_E_COYOTE"; Path=/acme')
+-        expected_encoded_cookie = base64.b64encode(b'Customer=\"WILE_E_COYOTE\"; Path=/acme; Version=1').decode('ascii')
++        expected_encoded_cookie = urllib.parse.quote('Customer=\"WILE_E_COYOTE\"; Path=/acme; Version=1', safe='', encoding='utf-8')
+         self.assertEqual(C.js_output(), fr"""
+         <script type="text/javascript">
+         <!-- begin hiding
+-        document.cookie = atob("{expected_encoded_cookie}");
++        document.cookie = decodeURIComponent("{expected_encoded_cookie}");
+         // end hiding -->
+         </script>
+         """)
+-        expected_encoded_cookie = base64.b64encode(b'Customer=\"WILE_E_COYOTE\"; Path=/acme').decode('ascii')
++        expected_encoded_cookie = urllib.parse.quote('Customer=\"WILE_E_COYOTE\"; Path=/acme', safe='', encoding='utf-8')
+         self.assertEqual(C.js_output(['path']), fr"""
+         <script type="text/javascript">
+         <!-- begin hiding
+-        document.cookie = atob("{expected_encoded_cookie}");
++        document.cookie = decodeURIComponent("{expected_encoded_cookie}");
+         // end hiding -->
+         </script>
+         """)
+@@ -364,13 +364,14 @@ class MorselTests(unittest.TestCase):
+             self.assertEqual(
+                 M.output(),
+                 "Set-Cookie: %s=%s; Path=/foo" % (i, "%s_coded_val" % i))
+-            expected_encoded_cookie = base64.b64encode(
+-                ("%s=%s; Path=/foo" % (i, "%s_coded_val" % i)).encode("ascii")
+-            ).decode('ascii')
++            expected_encoded_cookie = urllib.parse.quote(
++                "%s=%s; Path=/foo" % (i, "%s_coded_val" % i),
++                safe='', encoding='utf-8',
++            )
+             expected_js_output = """
+         <script type="text/javascript">
+         <!-- begin hiding
+-        document.cookie = atob("%s");
++        document.cookie = decodeURIComponent("%s");
+         // end hiding -->
+         </script>
+         """ % (expected_encoded_cookie,)
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index 6ef67e8117..da23093285 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -38,6 +38,8 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2026-4519_p1.patch \
            file://CVE-2026-4519_p2.patch \
            file://CVE-2026-4519_CVE-2026-4786.patch \
+           file://CVE-2026-6019_p1.patch \
+           file://CVE-2026-6019_p2.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.35.6


