Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12746.1603112401054954403
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 06:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: 5eVf5lo6zrtQNoETqgDXcmHF2RErKP+3noJ3y3bBc3AcWXJRdiV7UsXxOLIajhfzLYTTUfOBf+
 FVpYRIkwtC0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="184632580"
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
   d="scan'208";a="184632580"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 06:00:00 -0700
IronPort-SDR: m68yfXL/eQ7HwcEZnbTPqF5MPIUE3JSoHS62koeMtbwWiOCQLTSCMMlFdJak9AxSoPzQfQOE+W
 +YEIn6L+Xhwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
   d="scan'208";a="301360985"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga008.fm.intel.com with ESMTP; 19 Oct 2020 05:59:59 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 2/3] python3: fix CVE-2020-26116
Date: Mon, 19 Oct 2020 20:59:56 +0800
Message-Id: <20201019125957.70874-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019125957.70874-1-chee.yang.lee@intel.com>
References: <20201019125957.70874-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../python/python3/CVE-2020-26116.patch       | 104 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-26116.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2020-26116.patch b/meta/recipes-devtools/python/python3/CVE-2020-26116.patch
new file mode 100644
index 0000000000..c019db2a76
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2020-26116.patch
@@ -0,0 +1,104 @@
+From 668d321476d974c4f51476b33aaca870272523bf Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Sat, 18 Jul 2020 13:39:12 -0700
+Subject: [PATCH] bpo-39603: Prevent header injection in http methods
+ (GH-18485)
+
+reject control chars in http method in http.client.putrequest to prevent http header injection
+(cherry picked from commit 8ca8a2e8fb068863c1138f07e3098478ef8be12e)
+
+Co-authored-by: AMIR <31338382+amiremohamadi@users.noreply.github.com>
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/668d321476d974c4f51476b33aaca870272523bf]
+CVE: CVE-2020-26116
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ Lib/http/client.py                            | 15 +++++++++++++
+ Lib/test/test_httplib.py                      | 22 +++++++++++++++++++
+ .../2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst  |  2 ++
+ 3 files changed, 39 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst
+
+diff --git a/Lib/http/client.py b/Lib/http/client.py
+index 019380a720318..c2ad0471bfee5 100644
+--- a/Lib/http/client.py
++++ b/Lib/http/client.py
+@@ -147,6 +147,10 @@
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
+@@ -1087,6 +1091,8 @@ def putrequest(self, method, url, skip_host=False,
+         else:
+             raise CannotSendRequest(self.__state)
+ 
++        self._validate_method(method)
++
+         # Save the method for use later in the response phase
+         self._method = method
+ 
+@@ -1177,6 +1183,15 @@ def _encode_request(self, request):
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
+index 8f0e27a1fb836..5a5fcecbc9c15 100644
+--- a/Lib/test/test_httplib.py
++++ b/Lib/test/test_httplib.py
+@@ -364,6 +364,28 @@ def test_headers_debuglevel(self):
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
+index 0000000000000..990affc3edd9d
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst
+@@ -0,0 +1,2 @@
++Prevent http header injection by rejecting control characters in
++http.client.putrequest(...).
diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index 99d9f6748f..169bc87988 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch \
            file://CVE-2020-14422.patch \
+           file://CVE-2020-26116.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.17.1

