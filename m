Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.29384.1590731592716727128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: +GvZ+o3Ltemv3l5Gcd4GF1jXHx0ydNNl+GQoyl2O8Ds3hXTJ5qrRe3UpMHMMybAe3/W3DWfC2X
 gxfGDopJ6rOQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:18 -0700
IronPort-SDR: p6WF3/7j/kIMvrNznOfxi8hWQn2olvpmu2eo6GIJKg/WDjyKYgcoRYiNryL1zsxQ36gY6TyaNI
 6x7/DZ/dnAoQ==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866125"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:15 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 03/25] python3: fix CVE-2020-8492
Date: Fri, 29 May 2020 13:52:39 +0800
Message-Id: <5c8662e6ff870da917ed5efa02179d6da4addba9.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1590731377.git.anuj.mittal@intel.com>
References: <cover.1590731377.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

CVE: CVE-2020-8492

(From OE-Core rev: c9ee462bb606b34ab31cfb90f84a5302d15135cf)

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5811ed9140fab64da59d0d2ad6e6b0fec8341a20)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...20-8492-Fix-AbstractBasicAuthHandler.patch | 248 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.7.bb |   1 +
 2 files changed, 249 insertions(+)
 create mode 100644 meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch

diff --git a/meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch b/meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
new file mode 100644
index 0000000000..e16b99bcb9
--- /dev/null
+++ b/meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
@@ -0,0 +1,248 @@
+From 0b297d4ff1c0e4480ad33acae793fbaf4bf015b4 Mon Sep 17 00:00:00 2001
+From: Victor Stinner <vstinner@python.org>
+Date: Thu, 2 Apr 2020 02:52:20 +0200
+Subject: [PATCH] bpo-39503: CVE-2020-8492: Fix AbstractBasicAuthHandler
+ (GH-18284)
+
+Upstream-Status: Backport
+(https://github.com/python/cpython/commit/0b297d4ff1c0e4480ad33acae793fbaf4bf015b4)
+
+CVE: CVE-2020-8492
+
+The AbstractBasicAuthHandler class of the urllib.request module uses
+an inefficient regular expression which can be exploited by an
+attacker to cause a denial of service. Fix the regex to prevent the
+catastrophic backtracking. Vulnerability reported by Ben Caller
+and Matt Schwager.
+
+AbstractBasicAuthHandler of urllib.request now parses all
+WWW-Authenticate HTTP headers and accepts multiple challenges per
+header: use the realm of the first Basic challenge.
+
+Co-Authored-By: Serhiy Storchaka <storchaka@gmail.com>
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ Lib/test/test_urllib2.py                      | 90 ++++++++++++-------
+ Lib/urllib/request.py                         | 69 ++++++++++----
+ .../2020-03-25-16-02-16.bpo-39503.YmMbYn.rst  |  3 +
+ .../2020-01-30-16-15-29.bpo-39503.B299Yq.rst  |  5 ++
+ 4 files changed, 115 insertions(+), 52 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2020-03-25-16-02-16.bpo-39503.YmMbYn.rst
+ create mode 100644 Misc/NEWS.d/next/Security/2020-01-30-16-15-29.bpo-39503.B299Yq.rst
+
+diff --git a/Lib/test/test_urllib2.py b/Lib/test/test_urllib2.py
+index 8abedaac98..e69ac3e213 100644
+--- a/Lib/test/test_urllib2.py
++++ b/Lib/test/test_urllib2.py
+@@ -1446,40 +1446,64 @@ class HandlerTests(unittest.TestCase):
+         bypass = {'exclude_simple': True, 'exceptions': []}
+         self.assertTrue(_proxy_bypass_macosx_sysconf('test', bypass))
+ 
+-    def test_basic_auth(self, quote_char='"'):
+-        opener = OpenerDirector()
+-        password_manager = MockPasswordManager()
+-        auth_handler = urllib.request.HTTPBasicAuthHandler(password_manager)
+-        realm = "ACME Widget Store"
+-        http_handler = MockHTTPHandler(
+-            401, 'WWW-Authenticate: Basic realm=%s%s%s\r\n\r\n' %
+-            (quote_char, realm, quote_char))
+-        opener.add_handler(auth_handler)
+-        opener.add_handler(http_handler)
+-        self._test_basic_auth(opener, auth_handler, "Authorization",
+-                              realm, http_handler, password_manager,
+-                              "http://acme.example.com/protected",
+-                              "http://acme.example.com/protected",
+-                              )
+-
+-    def test_basic_auth_with_single_quoted_realm(self):
+-        self.test_basic_auth(quote_char="'")
+-
+-    def test_basic_auth_with_unquoted_realm(self):
+-        opener = OpenerDirector()
+-        password_manager = MockPasswordManager()
+-        auth_handler = urllib.request.HTTPBasicAuthHandler(password_manager)
+-        realm = "ACME Widget Store"
+-        http_handler = MockHTTPHandler(
+-            401, 'WWW-Authenticate: Basic realm=%s\r\n\r\n' % realm)
+-        opener.add_handler(auth_handler)
+-        opener.add_handler(http_handler)
+-        with self.assertWarns(UserWarning):
++    def check_basic_auth(self, headers, realm):
++        with self.subTest(realm=realm, headers=headers):
++            opener = OpenerDirector()
++            password_manager = MockPasswordManager()
++            auth_handler = urllib.request.HTTPBasicAuthHandler(password_manager)
++            body = '\r\n'.join(headers) + '\r\n\r\n'
++            http_handler = MockHTTPHandler(401, body)
++            opener.add_handler(auth_handler)
++            opener.add_handler(http_handler)
+             self._test_basic_auth(opener, auth_handler, "Authorization",
+-                                realm, http_handler, password_manager,
+-                                "http://acme.example.com/protected",
+-                                "http://acme.example.com/protected",
+-                                )
++                                  realm, http_handler, password_manager,
++                                  "http://acme.example.com/protected",
++                                  "http://acme.example.com/protected")
++
++    def test_basic_auth(self):
++        realm = "realm2@example.com"
++        realm2 = "realm2@example.com"
++        basic = f'Basic realm="{realm}"'
++        basic2 = f'Basic realm="{realm2}"'
++        other_no_realm = 'Otherscheme xxx'
++        digest = (f'Digest realm="{realm2}", '
++                  f'qop="auth, auth-int", '
++                  f'nonce="dcd98b7102dd2f0e8b11d0f600bfb0c093", '
++                  f'opaque="5ccc069c403ebaf9f0171e9517f40e41"')
++        for realm_str in (
++            # test "quote" and 'quote'
++            f'Basic realm="{realm}"',
++            f"Basic realm='{realm}'",
++
++            # charset is ignored
++            f'Basic realm="{realm}", charset="UTF-8"',
++
++            # Multiple challenges per header
++            f'{basic}, {basic2}',
++            f'{basic}, {other_no_realm}',
++            f'{other_no_realm}, {basic}',
++            f'{basic}, {digest}',
++            f'{digest}, {basic}',
++        ):
++            headers = [f'WWW-Authenticate: {realm_str}']
++            self.check_basic_auth(headers, realm)
++
++        # no quote: expect a warning
++        with support.check_warnings(("Basic Auth Realm was unquoted",
++                                     UserWarning)):
++            headers = [f'WWW-Authenticate: Basic realm={realm}']
++            self.check_basic_auth(headers, realm)
++
++        # Multiple headers: one challenge per header.
++        # Use the first Basic realm.
++        for challenges in (
++            [basic,  basic2],
++            [basic,  digest],
++            [digest, basic],
++        ):
++            headers = [f'WWW-Authenticate: {challenge}'
++                       for challenge in challenges]
++            self.check_basic_auth(headers, realm)
+ 
+     def test_proxy_basic_auth(self):
+         opener = OpenerDirector()
+diff --git a/Lib/urllib/request.py b/Lib/urllib/request.py
+index 7fe50535da..2a3d71554f 100644
+--- a/Lib/urllib/request.py
++++ b/Lib/urllib/request.py
+@@ -937,8 +937,15 @@ class AbstractBasicAuthHandler:
+ 
+     # allow for double- and single-quoted realm values
+     # (single quotes are a violation of the RFC, but appear in the wild)
+-    rx = re.compile('(?:.*,)*[ \t]*([^ \t]+)[ \t]+'
+-                    'realm=(["\']?)([^"\']*)\\2', re.I)
++    rx = re.compile('(?:^|,)'   # start of the string or ','
++                    '[ \t]*'    # optional whitespaces
++                    '([^ \t]+)' # scheme like "Basic"
++                    '[ \t]+'    # mandatory whitespaces
++                    # realm=xxx
++                    # realm='xxx'
++                    # realm="xxx"
++                    'realm=(["\']?)([^"\']*)\\2',
++                    re.I)
+ 
+     # XXX could pre-emptively send auth info already accepted (RFC 2617,
+     # end of section 2, and section 1.2 immediately after "credentials"
+@@ -950,27 +957,51 @@ class AbstractBasicAuthHandler:
+         self.passwd = password_mgr
+         self.add_password = self.passwd.add_password
+ 
++    def _parse_realm(self, header):
++        # parse WWW-Authenticate header: accept multiple challenges per header
++        found_challenge = False
++        for mo in AbstractBasicAuthHandler.rx.finditer(header):
++            scheme, quote, realm = mo.groups()
++            if quote not in ['"', "'"]:
++                warnings.warn("Basic Auth Realm was unquoted",
++                              UserWarning, 3)
++
++            yield (scheme, realm)
++
++            found_challenge = True
++
++        if not found_challenge:
++            if header:
++                scheme = header.split()[0]
++            else:
++                scheme = ''
++            yield (scheme, None)
++
+     def http_error_auth_reqed(self, authreq, host, req, headers):
+         # host may be an authority (without userinfo) or a URL with an
+         # authority
+-        # XXX could be multiple headers
+-        authreq = headers.get(authreq, None)
++        headers = headers.get_all(authreq)
++        if not headers:
++            # no header found
++            return
+ 
+-        if authreq:
+-            scheme = authreq.split()[0]
+-            if scheme.lower() != 'basic':
+-                raise ValueError("AbstractBasicAuthHandler does not"
+-                                 " support the following scheme: '%s'" %
+-                                 scheme)
+-            else:
+-                mo = AbstractBasicAuthHandler.rx.search(authreq)
+-                if mo:
+-                    scheme, quote, realm = mo.groups()
+-                    if quote not in ['"',"'"]:
+-                        warnings.warn("Basic Auth Realm was unquoted",
+-                                      UserWarning, 2)
+-                    if scheme.lower() == 'basic':
+-                        return self.retry_http_basic_auth(host, req, realm)
++        unsupported = None
++        for header in headers:
++            for scheme, realm in self._parse_realm(header):
++                if scheme.lower() != 'basic':
++                    unsupported = scheme
++                    continue
++
++                if realm is not None:
++                    # Use the first matching Basic challenge.
++                    # Ignore following challenges even if they use the Basic
++                    # scheme.
++                    return self.retry_http_basic_auth(host, req, realm)
++
++        if unsupported is not None:
++            raise ValueError("AbstractBasicAuthHandler does not "
++                             "support the following scheme: %r"
++                             % (scheme,))
+ 
+     def retry_http_basic_auth(self, host, req, realm):
+         user, pw = self.passwd.find_user_password(realm, host)
+diff --git a/Misc/NEWS.d/next/Library/2020-03-25-16-02-16.bpo-39503.YmMbYn.rst b/Misc/NEWS.d/next/Library/2020-03-25-16-02-16.bpo-39503.YmMbYn.rst
+new file mode 100644
+index 0000000000..be80ce79d9
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2020-03-25-16-02-16.bpo-39503.YmMbYn.rst
+@@ -0,0 +1,3 @@
++:class:`~urllib.request.AbstractBasicAuthHandler` of :mod:`urllib.request`
++now parses all WWW-Authenticate HTTP headers and accepts multiple challenges
++per header: use the realm of the first Basic challenge.
+diff --git a/Misc/NEWS.d/next/Security/2020-01-30-16-15-29.bpo-39503.B299Yq.rst b/Misc/NEWS.d/next/Security/2020-01-30-16-15-29.bpo-39503.B299Yq.rst
+new file mode 100644
+index 0000000000..9f2800581c
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2020-01-30-16-15-29.bpo-39503.B299Yq.rst
+@@ -0,0 +1,5 @@
++CVE-2020-8492: The :class:`~urllib.request.AbstractBasicAuthHandler` class of the
++:mod:`urllib.request` module uses an inefficient regular expression which can
++be exploited by an attacker to cause a denial of service. Fix the regex to
++prevent the catastrophic backtracking. Vulnerability reported by Ben Caller
++and Matt Schwager.
+-- 
+2.24.1
+
diff --git a/meta/recipes-devtools/python/python3_3.7.7.bb b/meta/recipes-devtools/python/python3_3.7.7.bb
index 0a78cdab44..bff84f640b 100644
--- a/meta/recipes-devtools/python/python3_3.7.7.bb
+++ b/meta/recipes-devtools/python/python3_3.7.7.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://reformat_sysconfig.py \
            file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
+           file://0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.25.4

