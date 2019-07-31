Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 147CF7F31B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 04:54:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jul 2019 21:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,328,1559545200"; d="scan'208";a="323604822"
Received: from anmitta2-mobl1.png.intel.com ([172.30.199.133])
	by orsmga004.jf.intel.com with ESMTP; 30 Jul 2019 21:54:58 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2019 12:54:54 +0800
Message-Id: <20190731045454.11752-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] python: fix CVE-2018-20852
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
X-List-Received-Date: Wed, 31 Jul 2019 04:54:58 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/python/python.inc       |   1 +
 .../python/python/CVE-2018-20852.patch        | 123 ++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/CVE-2018-20852.patch

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 8d0e90862c..70481002bb 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -13,6 +13,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://bpo-36216-cve-2019-9636.patch \
            file://bpo-36216-cve-2019-9636-fix.patch \
            file://CVE-2019-9740.patch \
+           file://CVE-2018-20852.patch \
            "
 
 SRC_URI[md5sum] = "30157d85a2c0479c09ea2cbe61f2aaf5"
diff --git a/meta/recipes-devtools/python/python/CVE-2018-20852.patch b/meta/recipes-devtools/python/python/CVE-2018-20852.patch
new file mode 100644
index 0000000000..23c784a210
--- /dev/null
+++ b/meta/recipes-devtools/python/python/CVE-2018-20852.patch
@@ -0,0 +1,123 @@
+From 979daae300916adb399ab5b51410b6ebd0888f13 Mon Sep 17 00:00:00 2001
+From: Xtreak <tir.karthi@gmail.com>
+Date: Sat, 15 Jun 2019 20:59:43 +0530
+Subject: [PATCH] [2.7] bpo-35121: prefix dot in domain for proper subdomain
+ validation (GH-10258) (GH-13426)
+
+This is a manual backport of ca7fe5063593958e5efdf90f068582837f07bd14 since 2.7 has `http.cookiejar` in `cookielib`
+
+
+https://bugs.python.org/issue35121
+CVE: CVE-2018-20852
+Upstream-Status: Backport [https://github.com/python/cpython/pull/13426]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ Lib/cookielib.py                              | 13 ++++++--
+ Lib/test/test_cookielib.py                    | 30 +++++++++++++++++++
+ .../2019-05-20-00-35-12.bpo-35121.RRi-HU.rst  |  4 +++
+ 3 files changed, 45 insertions(+), 2 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-05-20-00-35-12.bpo-35121.RRi-HU.rst
+
+diff --git a/Lib/cookielib.py b/Lib/cookielib.py
+index 2dd7c48728e0..0b471a42f296 100644
+--- a/Lib/cookielib.py
++++ b/Lib/cookielib.py
+@@ -1139,6 +1139,11 @@ def return_ok_domain(self, cookie, request):
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
+@@ -1151,7 +1156,7 @@ def return_ok_domain(self, cookie, request):
+             _debug("   effective request-host name %s does not domain-match "
+                    "RFC 2965 cookie domain %s", erhn, domain)
+             return False
+-        if cookie.version == 0 and not ("."+erhn).endswith(domain):
++        if cookie.version == 0 and not ("."+erhn).endswith(dotdomain):
+             _debug("   request-host %s does not match Netscape cookie domain "
+                    "%s", req_host, domain)
+             return False
+@@ -1165,7 +1170,11 @@ def domain_return_ok(self, domain, request):
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
+diff --git a/Lib/test/test_cookielib.py b/Lib/test/test_cookielib.py
+index f2dd9727d137..7f7ff614d61d 100644
+--- a/Lib/test/test_cookielib.py
++++ b/Lib/test/test_cookielib.py
+@@ -368,6 +368,7 @@ def test_domain_return_ok(self):
+             ("http://foo.bar.com/", ".foo.bar.com", True),
+             ("http://foo.bar.com/", "foo.bar.com", True),
+             ("http://foo.bar.com/", ".bar.com", True),
++            ("http://foo.bar.com/", "bar.com", True),
+             ("http://foo.bar.com/", "com", True),
+             ("http://foo.com/", "rhubarb.foo.com", False),
+             ("http://foo.com/", ".foo.com", True),
+@@ -378,6 +379,8 @@ def test_domain_return_ok(self):
+             ("http://foo/", "foo", True),
+             ("http://foo/", "foo.local", True),
+             ("http://foo/", ".local", True),
++            ("http://barfoo.com", ".foo.com", False),
++            ("http://barfoo.com", "foo.com", False),
+             ]:
+             request = urllib2.Request(url)
+             r = pol.domain_return_ok(domain, request)
+@@ -938,6 +941,33 @@ def test_domain_block(self):
+         c.add_cookie_header(req)
+         self.assertFalse(req.has_header("Cookie"))
+ 
++        c.clear()
++
++        pol.set_blocked_domains([])
++        req = Request("http://acme.com/")
++        res = FakeResponse(headers, "http://acme.com/")
++        cookies = c.make_cookies(res, req)
++        c.extract_cookies(res, req)
++        self.assertEqual(len(c), 1)
++
++        req = Request("http://acme.com/")
++        c.add_cookie_header(req)
++        self.assertTrue(req.has_header("Cookie"))
++
++        req = Request("http://badacme.com/")
++        c.add_cookie_header(req)
++        self.assertFalse(pol.return_ok(cookies[0], req))
++        self.assertFalse(req.has_header("Cookie"))
++
++        p = pol.set_blocked_domains(["acme.com"])
++        req = Request("http://acme.com/")
++        c.add_cookie_header(req)
++        self.assertFalse(req.has_header("Cookie"))
++
++        req = Request("http://badacme.com/")
++        c.add_cookie_header(req)
++        self.assertFalse(req.has_header("Cookie"))
++
+     def test_secure(self):
+         from cookielib import CookieJar, DefaultCookiePolicy
+ 
+diff --git a/Misc/NEWS.d/next/Security/2019-05-20-00-35-12.bpo-35121.RRi-HU.rst b/Misc/NEWS.d/next/Security/2019-05-20-00-35-12.bpo-35121.RRi-HU.rst
+new file mode 100644
+index 000000000000..77251806163b
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-05-20-00-35-12.bpo-35121.RRi-HU.rst
+@@ -0,0 +1,4 @@
++Don't send cookies of domain A without Domain attribute to domain B when
++domain A is a suffix match of domain B while using a cookiejar with
++:class:`cookielib.DefaultCookiePolicy` policy. Patch by Karthikeyan
++Singaravelan.
-- 
2.21.0


