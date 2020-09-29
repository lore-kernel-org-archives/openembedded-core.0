Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.14601.1601359666214856153
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 23:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: li.zhou@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08T67O2L021660
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 23:07:34 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Mon, 28 Sep 2020
 23:07:07 -0700
From: "Li Zhou" <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe][zeus][PATCH] python3: Security Advisory - python - CVE-2020-26116
Date: Tue, 29 Sep 2020 14:06:22 +0800
Message-ID: <1601359582-125209-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain

Backport patch from <https://github.com/python/cpython/commit/
ca75fec1ed358f7324272608ca952b2d8226d11a> to solve CVE-2020-26116.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../python/python3/CVE-2020-26116.patch            | 106 +++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.8.bb      |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-26116.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2020-26116.patch b/meta/recipes-devtools/python/python3/CVE-2020-26116.patch
new file mode 100644
index 0000000..2820999
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2020-26116.patch
@@ -0,0 +1,106 @@
+From ca75fec1ed358f7324272608ca952b2d8226d11a Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Sun, 19 Jul 2020 02:27:35 -0700
+Subject: [PATCH] bpo-39603: Prevent header injection in http methods
+ (GH-18485) (GH-21538)
+
+reject control chars in http method in http.client.putrequest to prevent http header injection
+(cherry picked from commit 8ca8a2e8fb068863c1138f07e3098478ef8be12e)
+
+Co-authored-by: AMIR <31338382+amiremohamadi@users.noreply.github.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-26116
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ Lib/http/client.py                            | 15 +++++++++++++
+ Lib/test/test_httplib.py                      | 22 +++++++++++++++++++
+ .../2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst  |  2 ++
+ 3 files changed, 39 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst
+
+diff --git a/Lib/http/client.py b/Lib/http/client.py
+index 09c57af865..04cd8f7d84 100644
+--- a/Lib/http/client.py
++++ b/Lib/http/client.py
+@@ -150,6 +150,10 @@ _contains_disallowed_url_pchar_re = re.compile('[\x00-\x20\x7f]')
+ #  _is_allowed_url_pchars_re = re.compile(r"^[/!$&'()*+,;=:@%a-zA-Z0-9._~-]+$")
+ # We are more lenient for assumed real world compatibility purposes.
+ 
++# These characters are not allowed within HTTP method names
++# to prevent http header injection.
++_contains_disallowed_method_pchar_re = re.compile('[\x00-\x1f]')
++
+ # We always set the Content-Length header for these methods because some
+ # servers will otherwise respond with a 411
+ _METHODS_EXPECTING_BODY = {'PATCH', 'POST', 'PUT'}
+@@ -1109,6 +1113,8 @@ class HTTPConnection:
+         else:
+             raise CannotSendRequest(self.__state)
+ 
++        self._validate_method(method)
++
+         # Save the method for use later in the response phase
+         self._method = method
+ 
+@@ -1199,6 +1205,15 @@ class HTTPConnection:
+         # ASCII also helps prevent CVE-2019-9740.
+         return request.encode('ascii')
+ 
++    def _validate_method(self, method):
++        """Validate a method name for putrequest."""
++        # prevent http header injection
++        match = _contains_disallowed_method_pchar_re.search(method)
++        if match:
++            raise ValueError(
++                    f"method can't contain control characters. {method!r} "
++                    f"(found at least {match.group()!r})")
++
+     def _validate_path(self, url):
+         """Validate a url for putrequest."""
+         # Prevent CVE-2019-9740.
+diff --git a/Lib/test/test_httplib.py b/Lib/test/test_httplib.py
+index 891393ab86..3fa0691d3a 100644
+--- a/Lib/test/test_httplib.py
++++ b/Lib/test/test_httplib.py
+@@ -363,6 +363,28 @@ class HeaderTests(TestCase):
+         self.assertEqual(lines[3], "header: Second: val2")
+ 
+ 
++class HttpMethodTests(TestCase):
++    def test_invalid_method_names(self):
++        methods = (
++            'GET\r',
++            'POST\n',
++            'PUT\n\r',
++            'POST\nValue',
++            'POST\nHOST:abc',
++            'GET\nrHost:abc\n',
++            'POST\rRemainder:\r',
++            'GET\rHOST:\n',
++            '\nPUT'
++        )
++
++        for method in methods:
++            with self.assertRaisesRegex(
++                    ValueError, "method can't contain control characters"):
++                conn = client.HTTPConnection('example.com')
++                conn.sock = FakeSocket(None)
++                conn.request(method=method, url="/")
++
++
+ class TransferEncodingTest(TestCase):
+     expected_body = b"It's just a flesh wound"
+ 
+diff --git a/Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst b/Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst
+new file mode 100644
+index 0000000000..990affc3ed
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst
+@@ -0,0 +1,2 @@
++Prevent http header injection by rejecting control characters in
++http.client.putrequest(...).
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python3_3.7.8.bb b/meta/recipes-devtools/python/python3_3.7.8.bb
index b18b3cd..cd4bee5 100644
--- a/meta/recipes-devtools/python/python3_3.7.8.bb
+++ b/meta/recipes-devtools/python/python3_3.7.8.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
            file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
            file://CVE-2020-14422.patch \
+           file://CVE-2020-26116.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
1.9.1

