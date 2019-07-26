Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E7F187F119
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 04:47:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jul 2019 21:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,309,1559545200"; d="scan'208";a="172069565"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2019 21:47:41 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2019 12:47:28 +0800
Message-Id: <1564116449-69248-6-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564116449-69248-1-git-send-email-anuj.mittal@intel.com>
References: <1564116449-69248-1-git-send-email-anuj.mittal@intel.com>
Subject: [warrior][PATCH 6/7] python3: fix CVE-2018-20852 CVE-2019-9636
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
X-List-Received-Date: Fri, 26 Jul 2019 04:47:41 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../python/python3/CVE-2018-20852.patch            | 124 +++++++++++++++++
 .../python/python3/CVE-2019-9636.patch             | 154 +++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.2.bb      |   2 +
 3 files changed, 280 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2018-20852.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9636.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2018-20852.patch b/meta/recipes-devtools/python/python3/CVE-2018-20852.patch
new file mode 100644
index 0000000..ff671d3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2018-20852.patch
@@ -0,0 +1,124 @@
+From e5123d81ffb3be35a1b2767d6ced1a097aaf77be Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Sat, 9 Mar 2019 18:58:25 -0800
+Subject: [PATCH] bpo-35121: prefix dot in domain for proper subdomain
+ validation (GH-10258) (GH-12261)
+
+Don't send cookies of domain A without Domain attribute to domain B when domain A is a suffix match of domain B while using a cookiejar with `http.cookiejar.DefaultCookiePolicy` policy.  Patch by Karthikeyan Singaravelan.
+(cherry picked from commit ca7fe5063593958e5efdf90f068582837f07bd14)
+
+Co-authored-by: Xtreak <tir.karthi@gmail.com>
+Upstream-Status: Backport
+CVE: CVE-2018-20852
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com> 
+---
+ Lib/http/cookiejar.py                         | 13 ++++++--
+ Lib/test/test_http_cookiejar.py               | 30 +++++++++++++++++++
+ .../2018-10-31-15-39-17.bpo-35121.EgHv9k.rst  |  4 +++
+ 3 files changed, 45 insertions(+), 2 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst
+
+diff --git a/Lib/http/cookiejar.py b/Lib/http/cookiejar.py
+index e0f1032b2816..00cb1250a07e 100644
+--- a/Lib/http/cookiejar.py
++++ b/Lib/http/cookiejar.py
+@@ -1145,6 +1145,11 @@ def return_ok_domain(self, cookie, request):
+         req_host, erhn = eff_request_host(request)
+         domain = cookie.domain
+ 
++        if domain and not domain.startswith("."):
++            dotdomain = "." + domain
++        else:
++            dotdomain = domain
++
+         # strict check of non-domain cookies: Mozilla does this, MSIE5 doesn't
+         if (cookie.version == 0 and
+             (self.strict_ns_domain & self.DomainStrictNonDomain) and
+@@ -1157,7 +1162,7 @@ def return_ok_domain(self, cookie, request):
+             _debug("   effective request-host name %s does not domain-match "
+                    "RFC 2965 cookie domain %s", erhn, domain)
+             return False
+-        if cookie.version == 0 and not ("."+erhn).endswith(domain):
++        if cookie.version == 0 and not ("."+erhn).endswith(dotdomain):
+             _debug("   request-host %s does not match Netscape cookie domain "
+                    "%s", req_host, domain)
+             return False
+@@ -1171,7 +1176,11 @@ def domain_return_ok(self, domain, request):
+             req_host = "."+req_host
+         if not erhn.startswith("."):
+             erhn = "."+erhn
+-        if not (req_host.endswith(domain) or erhn.endswith(domain)):
++        if domain and not domain.startswith("."):
++            dotdomain = "." + domain
++        else:
++            dotdomain = domain
++        if not (req_host.endswith(dotdomain) or erhn.endswith(dotdomain)):
+             #_debug("   request domain %s does not match cookie domain %s",
+             #       req_host, domain)
+             return False
+diff --git a/Lib/test/test_http_cookiejar.py b/Lib/test/test_http_cookiejar.py
+index abc625d672a7..6e1b30881310 100644
+--- a/Lib/test/test_http_cookiejar.py
++++ b/Lib/test/test_http_cookiejar.py
+@@ -415,6 +415,7 @@ def test_domain_return_ok(self):
+             ("http://foo.bar.com/", ".foo.bar.com", True),
+             ("http://foo.bar.com/", "foo.bar.com", True),
+             ("http://foo.bar.com/", ".bar.com", True),
++            ("http://foo.bar.com/", "bar.com", True),
+             ("http://foo.bar.com/", "com", True),
+             ("http://foo.com/", "rhubarb.foo.com", False),
+             ("http://foo.com/", ".foo.com", True),
+@@ -425,6 +426,8 @@ def test_domain_return_ok(self):
+             ("http://foo/", "foo", True),
+             ("http://foo/", "foo.local", True),
+             ("http://foo/", ".local", True),
++            ("http://barfoo.com", ".foo.com", False),
++            ("http://barfoo.com", "foo.com", False),
+             ]:
+             request = urllib.request.Request(url)
+             r = pol.domain_return_ok(domain, request)
+@@ -959,6 +962,33 @@ def test_domain_block(self):
+         c.add_cookie_header(req)
+         self.assertFalse(req.has_header("Cookie"))
+ 
++        c.clear()
++
++        pol.set_blocked_domains([])
++        req = urllib.request.Request("http://acme.com/")
++        res = FakeResponse(headers, "http://acme.com/")
++        cookies = c.make_cookies(res, req)
++        c.extract_cookies(res, req)
++        self.assertEqual(len(c), 1)
++
++        req = urllib.request.Request("http://acme.com/")
++        c.add_cookie_header(req)
++        self.assertTrue(req.has_header("Cookie"))
++
++        req = urllib.request.Request("http://badacme.com/")
++        c.add_cookie_header(req)
++        self.assertFalse(pol.return_ok(cookies[0], req))
++        self.assertFalse(req.has_header("Cookie"))
++
++        p = pol.set_blocked_domains(["acme.com"])
++        req = urllib.request.Request("http://acme.com/")
++        c.add_cookie_header(req)
++        self.assertFalse(req.has_header("Cookie"))
++
++        req = urllib.request.Request("http://badacme.com/")
++        c.add_cookie_header(req)
++        self.assertFalse(req.has_header("Cookie"))
++
+     def test_secure(self):
+         for ns in True, False:
+             for whitespace in " ", "":
+diff --git a/Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst b/Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst
+new file mode 100644
+index 000000000000..d2eb8f1f352c
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst
+@@ -0,0 +1,4 @@
++Don't send cookies of domain A without Domain attribute to domain B
++when domain A is a suffix match of domain B while using a cookiejar
++with :class:`http.cookiejar.DefaultCookiePolicy` policy. Patch by
++Karthikeyan Singaravelan.
diff --git a/meta/recipes-devtools/python/python3/CVE-2019-9636.patch b/meta/recipes-devtools/python/python3/CVE-2019-9636.patch
new file mode 100644
index 0000000..72128f0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2019-9636.patch
@@ -0,0 +1,154 @@
+From daad2c482c91de32d8305abbccc76a5de8b3a8be Mon Sep 17 00:00:00 2001
+From: Steve Dower <steve.dower@microsoft.com>
+Date: Thu, 7 Mar 2019 09:08:18 -0800
+Subject: [PATCH] bpo-36216: Add check for characters in netloc that normalize
+ to separators (GH-12201)
+
+Upstream-Status: Backport
+CVE: CVE-2019-9636
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+---
+ Doc/library/urllib.parse.rst                  | 18 +++++++++++++++
+ Lib/test/test_urlparse.py                     | 23 +++++++++++++++++++
+ Lib/urllib/parse.py                           | 17 ++++++++++++++
+ .../2019-03-06-09-38-40.bpo-36216.6q1m4a.rst  |  3 +++
+ 4 files changed, 61 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
+
+diff --git a/Doc/library/urllib.parse.rst b/Doc/library/urllib.parse.rst
+index 0c8f0f607314..b565e1edd321 100644
+--- a/Doc/library/urllib.parse.rst
++++ b/Doc/library/urllib.parse.rst
+@@ -124,6 +124,11 @@ or on combining URL components into a URL string.
+    Unmatched square brackets in the :attr:`netloc` attribute will raise a
+    :exc:`ValueError`.
+ 
++   Characters in the :attr:`netloc` attribute that decompose under NFKC
++   normalization (as used by the IDNA encoding) into any of ``/``, ``?``,
++   ``#``, ``@``, or ``:`` will raise a :exc:`ValueError`. If the URL is
++   decomposed before parsing, no error will be raised.
++
+    .. versionchanged:: 3.2
+       Added IPv6 URL parsing capabilities.
+ 
+@@ -136,6 +141,10 @@ or on combining URL components into a URL string.
+       Out-of-range port numbers now raise :exc:`ValueError`, instead of
+       returning :const:`None`.
+ 
++   .. versionchanged:: 3.7.3
++      Characters that affect netloc parsing under NFKC normalization will
++      now raise :exc:`ValueError`.
++
+ 
+ .. function:: parse_qs(qs, keep_blank_values=False, strict_parsing=False, encoding='utf-8', errors='replace', max_num_fields=None)
+ 
+@@ -257,10 +266,19 @@ or on combining URL components into a URL string.
+    Unmatched square brackets in the :attr:`netloc` attribute will raise a
+    :exc:`ValueError`.
+ 
++   Characters in the :attr:`netloc` attribute that decompose under NFKC
++   normalization (as used by the IDNA encoding) into any of ``/``, ``?``,
++   ``#``, ``@``, or ``:`` will raise a :exc:`ValueError`. If the URL is
++   decomposed before parsing, no error will be raised.
++
+    .. versionchanged:: 3.6
+       Out-of-range port numbers now raise :exc:`ValueError`, instead of
+       returning :const:`None`.
+ 
++   .. versionchanged:: 3.7.3
++      Characters that affect netloc parsing under NFKC normalization will
++      now raise :exc:`ValueError`.
++
+ 
+ .. function:: urlunsplit(parts)
+ 
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index be50b47603aa..e6638aee2244 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -1,3 +1,5 @@
++import sys
++import unicodedata
+ import unittest
+ import urllib.parse
+ 
+@@ -984,6 +986,27 @@ def test_all(self):
+                 expected.append(name)
+         self.assertCountEqual(urllib.parse.__all__, expected)
+ 
++    def test_urlsplit_normalization(self):
++        # Certain characters should never occur in the netloc,
++        # including under normalization.
++        # Ensure that ALL of them are detected and cause an error
++        illegal_chars = '/:#?@'
++        hex_chars = {'{:04X}'.format(ord(c)) for c in illegal_chars}
++        denorm_chars = [
++            c for c in map(chr, range(128, sys.maxunicode))
++            if (hex_chars & set(unicodedata.decomposition(c).split()))
++            and c not in illegal_chars
++        ]
++        # Sanity check that we found at least one such character
++        self.assertIn('\u2100', denorm_chars)
++        self.assertIn('\uFF03', denorm_chars)
++
++        for scheme in ["http", "https", "ftp"]:
++            for c in denorm_chars:
++                url = "{}://netloc{}false.netloc/path".format(scheme, c)
++                with self.subTest(url=url, char='{:04X}'.format(ord(c))):
++                    with self.assertRaises(ValueError):
++                        urllib.parse.urlsplit(url)
+ 
+ class Utility_Tests(unittest.TestCase):
+     """Testcase to test the various utility functions in the urllib."""
+diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
+index f691ab74f87f..39c5d6a80824 100644
+--- a/Lib/urllib/parse.py
++++ b/Lib/urllib/parse.py
+@@ -391,6 +391,21 @@ def _splitnetloc(url, start=0):
+             delim = min(delim, wdelim)     # use earliest delim position
+     return url[start:delim], url[delim:]   # return (domain, rest)
+ 
++def _checknetloc(netloc):
++    if not netloc or netloc.isascii():
++        return
++    # looking for characters like \u2100 that expand to 'a/c'
++    # IDNA uses NFKC equivalence, so normalize for this check
++    import unicodedata
++    netloc2 = unicodedata.normalize('NFKC', netloc)
++    if netloc == netloc2:
++        return
++    _, _, netloc = netloc.rpartition('@') # anything to the left of '@' is okay
++    for c in '/?#@:':
++        if c in netloc2:
++            raise ValueError("netloc '" + netloc2 + "' contains invalid " +
++                             "characters under NFKC normalization")
++
+ def urlsplit(url, scheme='', allow_fragments=True):
+     """Parse a URL into 5 components:
+     <scheme>://<netloc>/<path>?<query>#<fragment>
+@@ -419,6 +434,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
+                 url, fragment = url.split('#', 1)
+             if '?' in url:
+                 url, query = url.split('?', 1)
++            _checknetloc(netloc)
+             v = SplitResult('http', netloc, url, query, fragment)
+             _parse_cache[key] = v
+             return _coerce_result(v)
+@@ -442,6 +458,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
+         url, fragment = url.split('#', 1)
+     if '?' in url:
+         url, query = url.split('?', 1)
++    _checknetloc(netloc)
+     v = SplitResult(scheme, netloc, url, query, fragment)
+     _parse_cache[key] = v
+     return _coerce_result(v)
+diff --git a/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
+new file mode 100644
+index 000000000000..5546394157f9
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
+@@ -0,0 +1,3 @@
++Changes urlsplit() to raise ValueError when the URL contains characters that
++decompose under IDNA encoding (NFKC-normalization) into characters that
++affect how the URL is parsed.
diff --git a/meta/recipes-devtools/python/python3_3.7.2.bb b/meta/recipes-devtools/python/python3_3.7.2.bb
index 7ef7cb5..dc851cb 100644
--- a/meta/recipes-devtools/python/python3_3.7.2.bb
+++ b/meta/recipes-devtools/python/python3_3.7.2.bb
@@ -22,6 +22,8 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0002-Don-t-do-runtime-test-to-get-float-byte-order.patch \
            file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
+           file://CVE-2018-20852.patch \
+           file://CVE-2019-9636.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.7.4


