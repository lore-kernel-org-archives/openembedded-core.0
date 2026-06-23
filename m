Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD407CDB471
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:14 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32857.1782253624821900977
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mlihI9TQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4924e6fda5dso1921075e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253623; x=1782858423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MraQ6tvhm2y7hfkdi90CD4uwdt6iTPHXX5P2IRgoHY=;
        b=mlihI9TQ8Tj0QB+zGW8xSr6wmYkDmJrQ0U6iqy8Oh43RzVLj+z5tDSeqwEA1NdHyp5
         9niqBjVma7Jx9LqUNya+5uWZDyYqraabf/CvLjp5PvQUJ9d0EwVZODunKcISVALocsM9
         yww9x1fMdBRvgE9nvrNZLQKosGpFSWc5WZZas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253623; x=1782858423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0MraQ6tvhm2y7hfkdi90CD4uwdt6iTPHXX5P2IRgoHY=;
        b=jK7BcRnA7doOGxWI6R+zJk3Pb5tITOOXjuDW55Ln2Y4tcDXGPjcbtMlD7mZ+7rqwck
         v7jMlAFq+KgqcM8yg45h0uYWp5oPwyKLHglYJv4D+y6e2oKiaJXpOVVDruL6o5AspxL8
         qbKqvUrgnr6Xw10nD/e3FKLI1KOLYVbhFlnK6hrESmiBpCP/Dt8DQjfU7iSUW3QzEZ6s
         Of6c4bEm57harbo7BxU7YTKcvchoH+SOog9JL65tq06+fkWl+GG2unnjbK9fW9eXoMRl
         tVoCVbuCCX/IgByEzHLooVJtt53aTp2qH8KXti5N/AFzbzqAC6j+vMEnIqesumveW9hL
         BmTQ==
X-Gm-Message-State: AOJu0YzfdGUptwaG+vakIoygI+rZBQmzb63lrf6TfG8bf73fh14mHzWh
	bErFyyl9+0iqmyzVYo/XhJ0g5I5jUWc3gXPOIACNHzR9kkGU8LNTHqHsTCUPeLWB5ekIJskBIN/
	st9wN
X-Gm-Gg: AfdE7clxJtXPhjYjLAyUPFPr1fJfHMgruYzglo4SLb31KxG7HTALtIb51wyf0w+6Io7
	1VZPV5HTbKYA4wWVHTWwYbFyCtNZ0A4xMjRjF0NdaspKfDKA2Px/uLXQytxWxL7CSx4sl6hDxwo
	+uxkQsqJGCaBv+oHm0jJMs7zcwZdX20AS9ytErULipcyeJElmWG1xXjRqe7bp85w1UIh7iKyZ1e
	Le1NXoAf1pkQbNvWzxR5EPhD4YBTEK4hmrFtj1E9dobuwErP+d0QFGobau2XnPsDR1TV2qZRiR3
	iFUp/9uUDkYqck6BK8mpZmLgOozzT0JEPZ1Zoj11Qj3BpIxr44MVe/hxCsot0XdBcX4ncTgoYe1
	ldiclhIe2nymUHKY3FUhJhwpdPTljZ1oS4Mvf/qf9TW4IrmGLA2gn4472Y54KqDgqDH358wRtq3
	hraZN1Ey2J6tTz94NPvisu1CYXK3W3EPHu8BLFJAROMxyOLOjk6aWURsh7a9egvTcMNRF9zGjOq
	onijT/nKAa3gXNN
X-Received: by 2002:a05:600c:8b4c:b0:490:be1e:6ce6 with SMTP id 5b1f17b1804b1-4924908ab39mr252834345e9.9.1782253622890;
        Tue, 23 Jun 2026 15:27:02 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 10/41] python3: Fix CVE-2026-6019
Date: Wed, 24 Jun 2026 00:26:09 +0200
Message-ID: <e17af14ae72e21f7f63407ba5c88da160c73bea9.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239432

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3/CVE-2026-6019_p1.patch     | 133 ++++++++++++++++++
 .../python/python3/CVE-2026-6019_p2.patch     | 129 +++++++++++++++++
 .../python/python3_3.12.13.bb                 |   2 +
 3 files changed, 264 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-6019_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-6019_p2.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-6019_p1.patch b/meta/recipes-devtools/python/python3/CVE-2026-6019_p1.patch
new file mode 100644
index 00000000000..78b01574c91
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
index 00000000000..0646bd2133f
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
index ec9ea94824e..be080c6a362 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -40,6 +40,8 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2026-4519_p1.patch \
            file://CVE-2026-4519_p2.patch \
            file://CVE-2026-4519_CVE-2026-4786.patch \
+           file://CVE-2026-6019_p1.patch \
+           file://CVE-2026-6019_p2.patch \
            "
 
 SRC_URI:append:class-native = " \

