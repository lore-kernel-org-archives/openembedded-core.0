Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1B16C7F18F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 04:03:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2019 21:03:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,305,1559545200"; d="scan'208";a="189233228"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jul 2019 21:03:32 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2019 12:02:58 +0800
Message-Id: <1564027386-8107-3-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564027386-8107-1-git-send-email-anuj.mittal@intel.com>
References: <1564027386-8107-1-git-send-email-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [warrior][PATCH 03/11] python: fix CVE-2019-9740
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Jul 2019 04:03:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

(From OE-Core rev: 8eddac3305b7b428565103cde88cba444e3f0dd0)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python/CVE-2019-9740.patch              | 215 +++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.16.bb      |   1 +
 2 files changed, 216 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/CVE-2019-9740.patch

diff --git a/meta/recipes-devtools/python/python/CVE-2019-9740.patch b/meta/recipes-devtools/python/python/CVE-2019-9740.patch
new file mode 100644
index 0000000..066ac68
--- /dev/null
+++ b/meta/recipes-devtools/python/python/CVE-2019-9740.patch
@@ -0,0 +1,215 @@
+From bb8071a4cae5ab3fe321481dd3d73662ffb26052 Mon Sep 17 00:00:00 2001
+From: Victor Stinner <victor.stinner@gmail.com>
+Date: Tue, 21 May 2019 15:12:33 +0200
+Subject: [PATCH] bpo-30458: Disallow control chars in http URLs (GH-12755)
+ (GH-13154) (GH-13315)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Disallow control chars in http URLs in urllib2.urlopen.  This
+addresses a potential security problem for applications that do not
+sanity check their URLs where http request headers could be injected.
+
+Disable https related urllib tests on a build without ssl (GH-13032)
+These tests require an SSL enabled build. Skip these tests when
+python is built without SSL to fix test failures.
+
+Use httplib.InvalidURL instead of ValueError as the new error case's
+exception. (GH-13044)
+
+Backport Co-Authored-By: Miro Hrončok <miro@hroncok.cz>
+
+(cherry picked from commit 7e200e0763f5b71c199aaf98bd5588f291585619)
+
+Notes on backport to Python 2.7:
+
+* test_urllib tests urllib.urlopen() which quotes the URL and so is
+  not vulerable to HTTP Header Injection.
+* Add tests to test_urllib2 on urllib2.urlopen().
+* Reject non-ASCII characters: range 0x80-0xff.
+
+Upstream-Status: Backport
+CVE: CVE-2019-9740
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ Lib/httplib.py                                | 16 ++++++
+ Lib/test/test_urllib.py                       | 25 +++++++++
+ Lib/test/test_urllib2.py                      | 51 ++++++++++++++++++-
+ Lib/test/test_xmlrpc.py                       |  8 ++-
+ .../2019-04-10-08-53-30.bpo-30458.51E-DA.rst  |  1 +
+ 5 files changed, 99 insertions(+), 2 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
+
+diff --git a/Lib/httplib.py b/Lib/httplib.py
+index 60a8fb4e355f..1b41c346e090 100644
+--- a/Lib/httplib.py
++++ b/Lib/httplib.py
+@@ -247,6 +247,16 @@
+ _is_legal_header_name = re.compile(r'\A[^:\s][^:\r\n]*\Z').match
+ _is_illegal_header_value = re.compile(r'\n(?![ \t])|\r(?![ \t\n])').search
+ 
++# These characters are not allowed within HTTP URL paths.
++#  See https://tools.ietf.org/html/rfc3986#section-3.3 and the
++#  https://tools.ietf.org/html/rfc3986#appendix-A pchar definition.
++# Prevents CVE-2019-9740.  Includes control characters such as \r\n.
++# Restrict non-ASCII characters above \x7f (0x80-0xff).
++_contains_disallowed_url_pchar_re = re.compile('[\x00-\x20\x7f-\xff]')
++# Arguably only these _should_ allowed:
++#  _is_allowed_url_pchars_re = re.compile(r"^[/!$&'()*+,;=:@%a-zA-Z0-9._~-]+$")
++# We are more lenient for assumed real world compatibility purposes.
++
+ # We always set the Content-Length header for these methods because some
+ # servers will otherwise respond with a 411
+ _METHODS_EXPECTING_BODY = {'PATCH', 'POST', 'PUT'}
+@@ -927,6 +937,12 @@ def putrequest(self, method, url, skip_host=0, skip_accept_encoding=0):
+         self._method = method
+         if not url:
+             url = '/'
++        # Prevent CVE-2019-9740.
++        match = _contains_disallowed_url_pchar_re.search(url)
++        if match:
++            raise InvalidURL("URL can't contain control characters. %r "
++                             "(found at least %r)"
++                             % (url, match.group()))
+         hdr = '%s %s %s' % (method, url, self._http_vsn_str)
+ 
+         self._output(hdr)
+diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
+index 1ce9201c0693..d7778d4194f3 100644
+--- a/Lib/test/test_urllib.py
++++ b/Lib/test/test_urllib.py
+@@ -257,6 +257,31 @@ def test_url_fragment(self):
+         finally:
+             self.unfakehttp()
+ 
++    def test_url_with_control_char_rejected(self):
++        for char_no in range(0, 0x21) + range(0x7f, 0x100):
++            char = chr(char_no)
++            schemeless_url = "//localhost:7777/test%s/" % char
++            self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
++            try:
++                # urllib quotes the URL so there is no injection.
++                resp = urllib.urlopen("http:" + schemeless_url)
++                self.assertNotIn(char, resp.geturl())
++            finally:
++                self.unfakehttp()
++
++    def test_url_with_newline_header_injection_rejected(self):
++        self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
++        host = "localhost:7777?a=1 HTTP/1.1\r\nX-injected: header\r\nTEST: 123"
++        schemeless_url = "//" + host + ":8080/test/?test=a"
++        try:
++            # urllib quotes the URL so there is no injection.
++            resp = urllib.urlopen("http:" + schemeless_url)
++            self.assertNotIn(' ', resp.geturl())
++            self.assertNotIn('\r', resp.geturl())
++            self.assertNotIn('\n', resp.geturl())
++        finally:
++            self.unfakehttp()
++
+     def test_read_bogus(self):
+         # urlopen() should raise IOError for many error codes.
+         self.fakehttp('''HTTP/1.1 401 Authentication Required
+diff --git a/Lib/test/test_urllib2.py b/Lib/test/test_urllib2.py
+index 6d24d5ddf83c..9531818e16b2 100644
+--- a/Lib/test/test_urllib2.py
++++ b/Lib/test/test_urllib2.py
+@@ -15,6 +15,9 @@
+ except ImportError:
+     ssl = None
+ 
++from test.test_urllib import FakeHTTPMixin
++
++
+ # XXX
+ # Request
+ # CacheFTPHandler (hard to write)
+@@ -1262,7 +1265,7 @@ def _test_basic_auth(self, opener, auth_handler, auth_header,
+         self.assertEqual(len(http_handler.requests), 1)
+         self.assertFalse(http_handler.requests[0].has_header(auth_header))
+ 
+-class MiscTests(unittest.TestCase):
++class MiscTests(unittest.TestCase, FakeHTTPMixin):
+ 
+     def test_build_opener(self):
+         class MyHTTPHandler(urllib2.HTTPHandler): pass
+@@ -1317,6 +1320,52 @@ def test_unsupported_algorithm(self):
+             "Unsupported digest authentication algorithm 'invalid'"
+         )
+ 
++    @unittest.skipUnless(ssl, "ssl module required")
++    def test_url_with_control_char_rejected(self):
++        for char_no in range(0, 0x21) + range(0x7f, 0x100):
++            char = chr(char_no)
++            schemeless_url = "//localhost:7777/test%s/" % char
++            self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
++            try:
++                # We explicitly test urllib.request.urlopen() instead of the top
++                # level 'def urlopen()' function defined in this... (quite ugly)
++                # test suite.  They use different url opening codepaths.  Plain
++                # urlopen uses FancyURLOpener which goes via a codepath that
++                # calls urllib.parse.quote() on the URL which makes all of the
++                # above attempts at injection within the url _path_ safe.
++                escaped_char_repr = repr(char).replace('\\', r'\\')
++                InvalidURL = httplib.InvalidURL
++                with self.assertRaisesRegexp(
++                    InvalidURL, "contain control.*" + escaped_char_repr):
++                    urllib2.urlopen("http:" + schemeless_url)
++                with self.assertRaisesRegexp(
++                    InvalidURL, "contain control.*" + escaped_char_repr):
++                    urllib2.urlopen("https:" + schemeless_url)
++            finally:
++                self.unfakehttp()
++
++    @unittest.skipUnless(ssl, "ssl module required")
++    def test_url_with_newline_header_injection_rejected(self):
++        self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
++        host = "localhost:7777?a=1 HTTP/1.1\r\nX-injected: header\r\nTEST: 123"
++        schemeless_url = "//" + host + ":8080/test/?test=a"
++        try:
++            # We explicitly test urllib2.urlopen() instead of the top
++            # level 'def urlopen()' function defined in this... (quite ugly)
++            # test suite.  They use different url opening codepaths.  Plain
++            # urlopen uses FancyURLOpener which goes via a codepath that
++            # calls urllib.parse.quote() on the URL which makes all of the
++            # above attempts at injection within the url _path_ safe.
++            InvalidURL = httplib.InvalidURL
++            with self.assertRaisesRegexp(
++                InvalidURL, r"contain control.*\\r.*(found at least . .)"):
++                urllib2.urlopen("http:" + schemeless_url)
++            with self.assertRaisesRegexp(InvalidURL, r"contain control.*\\n"):
++                urllib2.urlopen("https:" + schemeless_url)
++        finally:
++            self.unfakehttp()
++
++
+ 
+ class RequestTests(unittest.TestCase):
+ 
+diff --git a/Lib/test/test_xmlrpc.py b/Lib/test/test_xmlrpc.py
+index 36b3be67fd6b..90ccb30716ff 100644
+--- a/Lib/test/test_xmlrpc.py
++++ b/Lib/test/test_xmlrpc.py
+@@ -659,7 +659,13 @@ def test_dotted_attribute(self):
+     def test_partial_post(self):
+         # Check that a partial POST doesn't make the server loop: issue #14001.
+         conn = httplib.HTTPConnection(ADDR, PORT)
+-        conn.request('POST', '/RPC2 HTTP/1.0\r\nContent-Length: 100\r\n\r\nbye')
++        conn.send('POST /RPC2 HTTP/1.0\r\n'
++                  'Content-Length: 100\r\n\r\n'
++                  'bye HTTP/1.1\r\n'
++                  'Host: %s:%s\r\n'
++                  'Accept-Encoding: identity\r\n'
++                  'Content-Length: 0\r\n\r\n'
++                  % (ADDR, PORT))
+         conn.close()
+ 
+ class SimpleServerEncodingTestCase(BaseServerTestCase):
+diff --git a/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst b/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
+new file mode 100644
+index 000000000000..47cb899df1af
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
+@@ -0,0 +1 @@
++Address CVE-2019-9740 by disallowing URL paths with embedded whitespace or control characters through into the underlying http client request.  Such potentially malicious header injection URLs now cause an httplib.InvalidURL exception to be raised.
diff --git a/meta/recipes-devtools/python/python_2.7.16.bb b/meta/recipes-devtools/python/python_2.7.16.bb
index d70342f..c6160ae 100644
--- a/meta/recipes-devtools/python/python_2.7.16.bb
+++ b/meta/recipes-devtools/python/python_2.7.16.bb
@@ -34,6 +34,7 @@ SRC_URI += " \
     file://bpo-35907-cve-2019-9948-fix.patch \
     file://bpo-36216-cve-2019-9636.patch \
     file://bpo-36216-cve-2019-9636-fix.patch \
+    file://CVE-2019-9740.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.7.4


