Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.466.1614701555327941041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 08:12:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: PsSLFMxtbkzHGaKmtsRQ9/2Bcb6si5R6k4ERNuo9RTUTvQKeIQJSaQGhsnKIiFeJG5j4iBYM/W
 Vd5f9d6YkPSg==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="166107815"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="166107815"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2021 08:12:31 -0800
IronPort-SDR: GJ5InNycsRWqYbI9HKVuJmk+r0UPJOAUu2c9nT+A1gbbCcm7vHEmwfl9sQAtSTclYc8iqj/tOm
 TTwHU7lgoO+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="406782253"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga008.jf.intel.com with ESMTP; 02 Mar 2021 08:12:24 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 1/2] python3: fix CVE-2021-3177 CVE-2021-23336
Date: Wed,  3 Mar 2021 00:12:22 +0800
Message-Id: <20210302161223.43040-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../python/CVE-2021-23336.patch               | 530 ++++++++++++++++++
 .../python/python3/CVE-2021-23336.patch       | 530 ++++++++++++++++++
 .../python/python3/CVE-2021-3177.patch        | 191 +++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |   2 +
 4 files changed, 1253 insertions(+)
 create mode 100644 meta/recipes-devtools/python/CVE-2021-23336.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-23336.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-3177.patch

diff --git a/meta/recipes-devtools/python/CVE-2021-23336.patch b/meta/recipes-devtools/python/CVE-2021-23336.patch
new file mode 100644
index 0000000000..2a885b9d37
--- /dev/null
+++ b/meta/recipes-devtools/python/CVE-2021-23336.patch
@@ -0,0 +1,530 @@
+From 3ab6f812653e79d008d5eba31dc25d34f3ca7170 Mon Sep 17 00:00:00 2001
+From: Senthil Kumaran <senthil@uthcode.com>
+Date: Mon, 15 Feb 2021 10:15:02 -0800
+Subject: [PATCH] bpo-42967: only use '&' as a query string separator
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+ (GH-24297)  (#24529)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* bpo-42967: only use '&' as a query string separator (#24297)
+
+bpo-42967: [security] Address a web cache-poisoning issue reported in
+urllib.parse.parse_qsl().
+
+urllib.parse will only us "&" as query string separator by default
+instead of both ";" and "&" as allowed in earlier versions. An optional
+argument seperator with default value "&" is added to specify the
+separator.
+
+Co-authored-by: Éric Araujo <merwok@netwok.org>
+Co-authored-by: blurb-it[bot] <43283697+blurb-it[bot]@users.noreply.github.com>
+Co-authored-by: Ken Jin <28750310+Fidget-Spinner@users.noreply.github.com>
+Co-authored-by: Éric Araujo <merwok@netwok.org>
+(cherry picked from commit fcbe0cb04d35189401c0c880ebfb4311e952d776)
+
+* [3.8] bpo-42967: only use '&' as a query string separator (GH-24297)
+
+bpo-42967: [security] Address a web cache-poisoning issue reported in urllib.parse.parse_qsl().
+
+urllib.parse will only us "&" as query string separator by default instead of both ";" and "&" as allowed in earlier versions. An optional argument seperator with default value "&" is added to specify the separator.
+
+Co-authored-by: Éric Araujo <merwok@netwok.org>
+Co-authored-by: blurb-it[bot] <43283697+blurb-it[bot]@users.noreply.github.com>
+Co-authored-by: Ken Jin <28750310+Fidget-Spinner@users.noreply.github.com>
+Co-authored-by: Éric Araujo <merwok@netwok.org>.
+(cherry picked from commit fcbe0cb04d35189401c0c880ebfb4311e952d776)
+
+Co-authored-by: Adam Goldschmidt <adamgold7@gmail.com>
+
+* Update correct version information.
+
+* fix docs and make logic clearer
+
+Co-authored-by: Adam Goldschmidt <adamgold7@gmail.com>
+Co-authored-by: Fidget-Spinner <28750310+Fidget-Spinner@users.noreply.github.com>
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/e3110c3cfbb7daa690d54d0eff6c264c870a71bf]
+CVE: CVE-2020-23336
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ Doc/library/cgi.rst                           | 11 ++-
+ Doc/library/urllib.parse.rst                  | 22 +++++-
+ Doc/whatsnew/3.6.rst                          | 13 ++++
+ Doc/whatsnew/3.7.rst                          | 13 ++++
+ Lib/cgi.py                                    | 23 ++++---
+ Lib/test/test_cgi.py                          | 29 ++++++--
+ Lib/test/test_urlparse.py                     | 68 +++++++++++++------
+ Lib/urllib/parse.py                           | 19 ++++--
+ .../2021-02-14-15-59-16.bpo-42967.YApqDS.rst  |  1 +
+ 9 files changed, 153 insertions(+), 46 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rst
+
+diff --git a/Doc/library/cgi.rst b/Doc/library/cgi.rst
+index 4048592..880074b 100644
+--- a/Doc/library/cgi.rst
++++ b/Doc/library/cgi.rst
+@@ -277,14 +277,16 @@ These are useful if you want more control, or if you want to employ some of the
+ algorithms implemented in this module in other circumstances.
+ 
+ 
+-.. function:: parse(fp=None, environ=os.environ, keep_blank_values=False, strict_parsing=False)
++.. function:: parse(fp=None, environ=os.environ, keep_blank_values=False, strict_parsing=False, separator="&")
+ 
+    Parse a query in the environment or from a file (the file defaults to
+-   ``sys.stdin``).  The *keep_blank_values* and *strict_parsing* parameters are
++   ``sys.stdin``).  The *keep_blank_values*, *strict_parsing* and *separator* parameters are
+    passed to :func:`urllib.parse.parse_qs` unchanged.
+ 
++   .. versionchanged:: 3.8.8
++      Added the *separator* parameter.
+ 
+-.. function:: parse_multipart(fp, pdict, encoding="utf-8", errors="replace")
++.. function:: parse_multipart(fp, pdict, encoding="utf-8", errors="replace", separator="&")
+ 
+    Parse input of type :mimetype:`multipart/form-data` (for  file uploads).
+    Arguments are *fp* for the input file, *pdict* for a dictionary containing
+@@ -303,6 +305,9 @@ algorithms implemented in this module in other circumstances.
+       Added the *encoding* and *errors* parameters.  For non-file fields, the
+       value is now a list of strings, not bytes.
+ 
++   .. versionchanged:: 3.8.8
++      Added the *separator* parameter.
++
+ 
+ .. function:: parse_header(string)
+ 
+diff --git a/Doc/library/urllib.parse.rst b/Doc/library/urllib.parse.rst
+index 52f98ef..45ca03a 100644
+--- a/Doc/library/urllib.parse.rst
++++ b/Doc/library/urllib.parse.rst
+@@ -165,7 +165,7 @@ or on combining URL components into a URL string.
+       now raise :exc:`ValueError`.
+ 
+ 
+-.. function:: parse_qs(qs, keep_blank_values=False, strict_parsing=False, encoding='utf-8', errors='replace', max_num_fields=None)
++.. function:: parse_qs(qs, keep_blank_values=False, strict_parsing=False, encoding='utf-8', errors='replace', max_num_fields=None, separator='&')
+ 
+    Parse a query string given as a string argument (data of type
+    :mimetype:`application/x-www-form-urlencoded`).  Data are returned as a
+@@ -190,6 +190,9 @@ or on combining URL components into a URL string.
+    read. If set, then throws a :exc:`ValueError` if there are more than
+    *max_num_fields* fields read.
+ 
++   The optional argument *separator* is the symbol to use for separating the
++   query arguments. It defaults to ``&``.
++
+    Use the :func:`urllib.parse.urlencode` function (with the ``doseq``
+    parameter set to ``True``) to convert such dictionaries into query
+    strings.
+@@ -201,8 +204,14 @@ or on combining URL components into a URL string.
+    .. versionchanged:: 3.8
+       Added *max_num_fields* parameter.
+ 
++   .. versionchanged:: 3.8.8
++      Added *separator* parameter with the default value of ``&``. Python
++      versions earlier than Python 3.8.8 allowed using both ``;`` and ``&`` as
++      query parameter separator. This has been changed to allow only a single
++      separator key, with ``&`` as the default separator.
++
+ 
+-.. function:: parse_qsl(qs, keep_blank_values=False, strict_parsing=False, encoding='utf-8', errors='replace', max_num_fields=None)
++.. function:: parse_qsl(qs, keep_blank_values=False, strict_parsing=False, encoding='utf-8', errors='replace', max_num_fields=None, separator='&')
+ 
+    Parse a query string given as a string argument (data of type
+    :mimetype:`application/x-www-form-urlencoded`).  Data are returned as a list of
+@@ -226,6 +235,9 @@ or on combining URL components into a URL string.
+    read. If set, then throws a :exc:`ValueError` if there are more than
+    *max_num_fields* fields read.
+ 
++   The optional argument *separator* is the symbol to use for separating the
++   query arguments. It defaults to ``&``.
++
+    Use the :func:`urllib.parse.urlencode` function to convert such lists of pairs into
+    query strings.
+ 
+@@ -235,6 +247,12 @@ or on combining URL components into a URL string.
+    .. versionchanged:: 3.8
+       Added *max_num_fields* parameter.
+ 
++   .. versionchanged:: 3.8.8
++      Added *separator* parameter with the default value of ``&``. Python
++      versions earlier than Python 3.8.8 allowed using both ``;`` and ``&`` as
++      query parameter separator. This has been changed to allow only a single
++      separator key, with ``&`` as the default separator.
++
+ 
+ .. function:: urlunparse(parts)
+ 
+diff --git a/Doc/whatsnew/3.6.rst b/Doc/whatsnew/3.6.rst
+index 04c1f7e..4409a3a 100644
+--- a/Doc/whatsnew/3.6.rst
++++ b/Doc/whatsnew/3.6.rst
+@@ -2443,3 +2443,16 @@ because of the behavior of the socket option ``SO_REUSEADDR`` in UDP. For more
+ details, see the documentation for ``loop.create_datagram_endpoint()``.
+ (Contributed by Kyle Stanley, Antoine Pitrou, and Yury Selivanov in
+ :issue:`37228`.)
++
++Notable changes in Python 3.6.13
++================================
++
++Earlier Python versions allowed using both ``;`` and ``&`` as
++query parameter separators in :func:`urllib.parse.parse_qs` and
++:func:`urllib.parse.parse_qsl`.  Due to security concerns, and to conform with
++newer W3C recommendations, this has been changed to allow only a single
++separator key, with ``&`` as the default.  This change also affects
++:func:`cgi.parse` and :func:`cgi.parse_multipart` as they use the affected
++functions internally. For more details, please see their respective
++documentation.
++(Contributed by Adam Goldschmidt, Senthil Kumaran and Ken Jin in :issue:`42967`.)
+diff --git a/Doc/whatsnew/3.7.rst b/Doc/whatsnew/3.7.rst
+index b9b5021..8f47a9f 100644
+--- a/Doc/whatsnew/3.7.rst
++++ b/Doc/whatsnew/3.7.rst
+@@ -2556,3 +2556,16 @@ because of the behavior of the socket option ``SO_REUSEADDR`` in UDP. For more
+ details, see the documentation for ``loop.create_datagram_endpoint()``.
+ (Contributed by Kyle Stanley, Antoine Pitrou, and Yury Selivanov in
+ :issue:`37228`.)
++
++Notable changes in Python 3.7.10
++================================
++
++Earlier Python versions allowed using both ``;`` and ``&`` as
++query parameter separators in :func:`urllib.parse.parse_qs` and
++:func:`urllib.parse.parse_qsl`.  Due to security concerns, and to conform with
++newer W3C recommendations, this has been changed to allow only a single
++separator key, with ``&`` as the default.  This change also affects
++:func:`cgi.parse` and :func:`cgi.parse_multipart` as they use the affected
++functions internally. For more details, please see their respective
++documentation.
++(Contributed by Adam Goldschmidt, Senthil Kumaran and Ken Jin in :issue:`42967`.)
+diff --git a/Lib/cgi.py b/Lib/cgi.py
+index 5ace46a..13255a9 100755
+--- a/Lib/cgi.py
++++ b/Lib/cgi.py
+@@ -106,7 +106,8 @@ log = initlog           # The current logging function
+ # 0 ==> unlimited input
+ maxlen = 0
+ 
+-def parse(fp=None, environ=os.environ, keep_blank_values=0, strict_parsing=0):
++def parse(fp=None, environ=os.environ, keep_blank_values=0,
++          strict_parsing=0, separator='&'):
+     """Parse a query in the environment or from a file (default stdin)
+ 
+         Arguments, all optional:
+@@ -125,6 +126,9 @@ def parse(fp=None, environ=os.environ, keep_blank_values=0, strict_parsing=0):
+         strict_parsing: flag indicating what to do with parsing errors.
+             If false (the default), errors are silently ignored.
+             If true, errors raise a ValueError exception.
++
++        separator: str. The symbol to use for separating the query arguments.
++            Defaults to &.
+     """
+     if fp is None:
+         fp = sys.stdin
+@@ -145,7 +149,7 @@ def parse(fp=None, environ=os.environ, keep_blank_values=0, strict_parsing=0):
+     if environ['REQUEST_METHOD'] == 'POST':
+         ctype, pdict = parse_header(environ['CONTENT_TYPE'])
+         if ctype == 'multipart/form-data':
+-            return parse_multipart(fp, pdict)
++            return parse_multipart(fp, pdict, separator=separator)
+         elif ctype == 'application/x-www-form-urlencoded':
+             clength = int(environ['CONTENT_LENGTH'])
+             if maxlen and clength > maxlen:
+@@ -169,10 +173,10 @@ def parse(fp=None, environ=os.environ, keep_blank_values=0, strict_parsing=0):
+             qs = ""
+         environ['QUERY_STRING'] = qs    # XXX Shouldn't, really
+     return urllib.parse.parse_qs(qs, keep_blank_values, strict_parsing,
+-                                 encoding=encoding)
++                                 encoding=encoding, separator=separator)
+ 
+ 
+-def parse_multipart(fp, pdict, encoding="utf-8", errors="replace"):
++def parse_multipart(fp, pdict, encoding="utf-8", errors="replace", separator='&'):
+     """Parse multipart input.
+ 
+     Arguments:
+@@ -193,7 +197,7 @@ def parse_multipart(fp, pdict, encoding="utf-8", errors="replace"):
+     headers.set_type(ctype)
+     headers['Content-Length'] = pdict['CONTENT-LENGTH']
+     fs = FieldStorage(fp, headers=headers, encoding=encoding, errors=errors,
+-        environ={'REQUEST_METHOD': 'POST'})
++        environ={'REQUEST_METHOD': 'POST'}, separator=separator)
+     return {k: fs.getlist(k) for k in fs}
+ 
+ def _parseparam(s):
+@@ -303,7 +307,7 @@ class FieldStorage:
+     def __init__(self, fp=None, headers=None, outerboundary=b'',
+                  environ=os.environ, keep_blank_values=0, strict_parsing=0,
+                  limit=None, encoding='utf-8', errors='replace',
+-                 max_num_fields=None):
++                 max_num_fields=None, separator='&'):
+         """Constructor.  Read multipart/* until last part.
+ 
+         Arguments, all optional:
+@@ -351,6 +355,7 @@ class FieldStorage:
+         self.keep_blank_values = keep_blank_values
+         self.strict_parsing = strict_parsing
+         self.max_num_fields = max_num_fields
++        self.separator = separator
+         if 'REQUEST_METHOD' in environ:
+             method = environ['REQUEST_METHOD'].upper()
+         self.qs_on_post = None
+@@ -577,7 +582,7 @@ class FieldStorage:
+         query = urllib.parse.parse_qsl(
+             qs, self.keep_blank_values, self.strict_parsing,
+             encoding=self.encoding, errors=self.errors,
+-            max_num_fields=self.max_num_fields)
++            max_num_fields=self.max_num_fields, separator=self.separator)
+         self.list = [MiniFieldStorage(key, value) for key, value in query]
+         self.skip_lines()
+ 
+@@ -593,7 +598,7 @@ class FieldStorage:
+             query = urllib.parse.parse_qsl(
+                 self.qs_on_post, self.keep_blank_values, self.strict_parsing,
+                 encoding=self.encoding, errors=self.errors,
+-                max_num_fields=self.max_num_fields)
++                max_num_fields=self.max_num_fields, separator=self.separator)
+             self.list.extend(MiniFieldStorage(key, value) for key, value in query)
+ 
+         klass = self.FieldStorageClass or self.__class__
+@@ -637,7 +642,7 @@ class FieldStorage:
+                 else self.limit - self.bytes_read
+             part = klass(self.fp, headers, ib, environ, keep_blank_values,
+                          strict_parsing, limit,
+-                         self.encoding, self.errors, max_num_fields)
++                         self.encoding, self.errors, max_num_fields, self.separator)
+ 
+             if max_num_fields is not None:
+                 max_num_fields -= 1
+diff --git a/Lib/test/test_cgi.py b/Lib/test/test_cgi.py
+index ab86771..bda03ee 100644
+--- a/Lib/test/test_cgi.py
++++ b/Lib/test/test_cgi.py
+@@ -53,12 +53,9 @@ parse_strict_test_cases = [
+     ("", ValueError("bad query field: ''")),
+     ("&", ValueError("bad query field: ''")),
+     ("&&", ValueError("bad query field: ''")),
+-    (";", ValueError("bad query field: ''")),
+-    (";&;", ValueError("bad query field: ''")),
+     # Should the next few really be valid?
+     ("=", {}),
+     ("=&=", {}),
+-    ("=;=", {}),
+     # This rest seem to make sense
+     ("=a", {'': ['a']}),
+     ("&=a", ValueError("bad query field: ''")),
+@@ -73,8 +70,6 @@ parse_strict_test_cases = [
+     ("a=a+b&b=b+c", {'a': ['a b'], 'b': ['b c']}),
+     ("a=a+b&a=b+a", {'a': ['a b', 'b a']}),
+     ("x=1&y=2.0&z=2-3.%2b0", {'x': ['1'], 'y': ['2.0'], 'z': ['2-3.+0']}),
+-    ("x=1;y=2.0&z=2-3.%2b0", {'x': ['1'], 'y': ['2.0'], 'z': ['2-3.+0']}),
+-    ("x=1;y=2.0;z=2-3.%2b0", {'x': ['1'], 'y': ['2.0'], 'z': ['2-3.+0']}),
+     ("Hbc5161168c542333633315dee1182227:key_store_seqid=400006&cuyer=r&view=bustomer&order_id=0bb2e248638833d48cb7fed300000f1b&expire=964546263&lobale=en-US&kid=130003.300038&ss=env",
+      {'Hbc5161168c542333633315dee1182227:key_store_seqid': ['400006'],
+       'cuyer': ['r'],
+@@ -187,6 +182,30 @@ Content-Length: 3
+                     else:
+                         self.assertEqual(fs.getvalue(key), expect_val[0])
+ 
++    def test_separator(self):
++        parse_semicolon = [
++            ("x=1;y=2.0", {'x': ['1'], 'y': ['2.0']}),
++            ("x=1;y=2.0;z=2-3.%2b0", {'x': ['1'], 'y': ['2.0'], 'z': ['2-3.+0']}),
++            (";", ValueError("bad query field: ''")),
++            (";;", ValueError("bad query field: ''")),
++            ("=;a", ValueError("bad query field: 'a'")),
++            (";b=a", ValueError("bad query field: ''")),
++            ("b;=a", ValueError("bad query field: 'b'")),
++            ("a=a+b;b=b+c", {'a': ['a b'], 'b': ['b c']}),
++            ("a=a+b;a=b+a", {'a': ['a b', 'b a']}),
++        ]
++        for orig, expect in parse_semicolon:
++            env = {'QUERY_STRING': orig}
++            fs = cgi.FieldStorage(separator=';', environ=env)
++            if isinstance(expect, dict):
++                for key in expect.keys():
++                    expect_val = expect[key]
++                    self.assertIn(key, fs)
++                    if len(expect_val) > 1:
++                        self.assertEqual(fs.getvalue(key), expect_val)
++                    else:
++                        self.assertEqual(fs.getvalue(key), expect_val[0])
++
+     def test_log(self):
+         cgi.log("Testing")
+ 
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index 4ae6ed3..90c8d69 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -32,16 +32,10 @@ parse_qsl_test_cases = [
+     (b"&a=b", [(b'a', b'b')]),
+     (b"a=a+b&b=b+c", [(b'a', b'a b'), (b'b', b'b c')]),
+     (b"a=1&a=2", [(b'a', b'1'), (b'a', b'2')]),
+-    (";", []),
+-    (";;", []),
+-    (";a=b", [('a', 'b')]),
+-    ("a=a+b;b=b+c", [('a', 'a b'), ('b', 'b c')]),
+-    ("a=1;a=2", [('a', '1'), ('a', '2')]),
+-    (b";", []),
+-    (b";;", []),
+-    (b";a=b", [(b'a', b'b')]),
+-    (b"a=a+b;b=b+c", [(b'a', b'a b'), (b'b', b'b c')]),
+-    (b"a=1;a=2", [(b'a', b'1'), (b'a', b'2')]),
++    (";a=b", [(';a', 'b')]),
++    ("a=a+b;b=b+c", [('a', 'a b;b=b c')]),
++    (b";a=b", [(b';a', b'b')]),
++    (b"a=a+b;b=b+c", [(b'a', b'a b;b=b c')]),
+ ]
+ 
+ # Each parse_qs testcase is a two-tuple that contains
+@@ -68,16 +62,10 @@ parse_qs_test_cases = [
+     (b"&a=b", {b'a': [b'b']}),
+     (b"a=a+b&b=b+c", {b'a': [b'a b'], b'b': [b'b c']}),
+     (b"a=1&a=2", {b'a': [b'1', b'2']}),
+-    (";", {}),
+-    (";;", {}),
+-    (";a=b", {'a': ['b']}),
+-    ("a=a+b;b=b+c", {'a': ['a b'], 'b': ['b c']}),
+-    ("a=1;a=2", {'a': ['1', '2']}),
+-    (b";", {}),
+-    (b";;", {}),
+-    (b";a=b", {b'a': [b'b']}),
+-    (b"a=a+b;b=b+c", {b'a': [b'a b'], b'b': [b'b c']}),
+-    (b"a=1;a=2", {b'a': [b'1', b'2']}),
++    (";a=b", {';a': ['b']}),
++    ("a=a+b;b=b+c", {'a': ['a b;b=b c']}),
++    (b";a=b", {b';a': [b'b']}),
++    (b"a=a+b;b=b+c", {b'a':[ b'a b;b=b c']}),
+ ]
+ 
+ class UrlParseTestCase(unittest.TestCase):
+@@ -884,10 +872,46 @@ class UrlParseTestCase(unittest.TestCase):
+     def test_parse_qsl_max_num_fields(self):
+         with self.assertRaises(ValueError):
+             urllib.parse.parse_qs('&'.join(['a=a']*11), max_num_fields=10)
+-        with self.assertRaises(ValueError):
+-            urllib.parse.parse_qs(';'.join(['a=a']*11), max_num_fields=10)
+         urllib.parse.parse_qs('&'.join(['a=a']*10), max_num_fields=10)
+ 
++    def test_parse_qs_separator(self):
++        parse_qs_semicolon_cases = [
++            (";", {}),
++            (";;", {}),
++            (";a=b", {'a': ['b']}),
++            ("a=a+b;b=b+c", {'a': ['a b'], 'b': ['b c']}),
++            ("a=1;a=2", {'a': ['1', '2']}),
++            (b";", {}),
++            (b";;", {}),
++            (b";a=b", {b'a': [b'b']}),
++            (b"a=a+b;b=b+c", {b'a': [b'a b'], b'b': [b'b c']}),
++            (b"a=1;a=2", {b'a': [b'1', b'2']}),
++        ]
++        for orig, expect in parse_qs_semicolon_cases:
++            with self.subTest(f"Original: {orig!r}, Expected: {expect!r}"):
++                result = urllib.parse.parse_qs(orig, separator=';')
++                self.assertEqual(result, expect, "Error parsing %r" % orig)
++
++
++    def test_parse_qsl_separator(self):
++        parse_qsl_semicolon_cases = [
++            (";", []),
++            (";;", []),
++            (";a=b", [('a', 'b')]),
++            ("a=a+b;b=b+c", [('a', 'a b'), ('b', 'b c')]),
++            ("a=1;a=2", [('a', '1'), ('a', '2')]),
++            (b";", []),
++            (b";;", []),
++            (b";a=b", [(b'a', b'b')]),
++            (b"a=a+b;b=b+c", [(b'a', b'a b'), (b'b', b'b c')]),
++            (b"a=1;a=2", [(b'a', b'1'), (b'a', b'2')]),
++        ]
++        for orig, expect in parse_qsl_semicolon_cases:
++            with self.subTest(f"Original: {orig!r}, Expected: {expect!r}"):
++                result = urllib.parse.parse_qsl(orig, separator=';')
++                self.assertEqual(result, expect, "Error parsing %r" % orig)
++
++
+     def test_urlencode_sequences(self):
+         # Other tests incidentally urlencode things; test non-covered cases:
+         # Sequence and object values.
+diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
+index e2b6f13..5a3e847 100644
+--- a/Lib/urllib/parse.py
++++ b/Lib/urllib/parse.py
+@@ -648,7 +648,7 @@ def unquote(string, encoding='utf-8', errors='replace'):
+ 
+ 
+ def parse_qs(qs, keep_blank_values=False, strict_parsing=False,
+-             encoding='utf-8', errors='replace', max_num_fields=None):
++             encoding='utf-8', errors='replace', max_num_fields=None, separator='&'):
+     """Parse a query given as a string argument.
+ 
+         Arguments:
+@@ -672,12 +672,15 @@ def parse_qs(qs, keep_blank_values=False, strict_parsing=False,
+         max_num_fields: int. If set, then throws a ValueError if there
+             are more than n fields read by parse_qsl().
+ 
++        separator: str. The symbol to use for separating the query arguments.
++            Defaults to &.
++
+         Returns a dictionary.
+     """
+     parsed_result = {}
+     pairs = parse_qsl(qs, keep_blank_values, strict_parsing,
+                       encoding=encoding, errors=errors,
+-                      max_num_fields=max_num_fields)
++                      max_num_fields=max_num_fields, separator=separator)
+     for name, value in pairs:
+         if name in parsed_result:
+             parsed_result[name].append(value)
+@@ -687,7 +690,7 @@ def parse_qs(qs, keep_blank_values=False, strict_parsing=False,
+ 
+ 
+ def parse_qsl(qs, keep_blank_values=False, strict_parsing=False,
+-              encoding='utf-8', errors='replace', max_num_fields=None):
++              encoding='utf-8', errors='replace', max_num_fields=None, separator='&'):
+     """Parse a query given as a string argument.
+ 
+         Arguments:
+@@ -710,19 +713,25 @@ def parse_qsl(qs, keep_blank_values=False, strict_parsing=False,
+         max_num_fields: int. If set, then throws a ValueError
+             if there are more than n fields read by parse_qsl().
+ 
++        separator: str. The symbol to use for separating the query arguments.
++            Defaults to &.
++
+         Returns a list, as G-d intended.
+     """
+     qs, _coerce_result = _coerce_args(qs)
+ 
++    if not separator or (not isinstance(separator, (str, bytes))):
++        raise ValueError("Separator must be of type string or bytes.")
++
+     # If max_num_fields is defined then check that the number of fields
+     # is less than max_num_fields. This prevents a memory exhaustion DOS
+     # attack via post bodies with many fields.
+     if max_num_fields is not None:
+-        num_fields = 1 + qs.count('&') + qs.count(';')
++        num_fields = 1 + qs.count(separator)
+         if max_num_fields < num_fields:
+             raise ValueError('Max number of fields exceeded')
+ 
+-    pairs = [s2 for s1 in qs.split('&') for s2 in s1.split(';')]
++    pairs = [s1 for s1 in qs.split(separator)]
+     r = []
+     for name_value in pairs:
+         if not name_value and not strict_parsing:
+diff --git a/Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rst b/Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rst
+new file mode 100644
+index 0000000..f08489b
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rst
+@@ -0,0 +1 @@
++Fix web cache poisoning vulnerability by defaulting the query args separator to ``&``, and allowing the user to choose a custom separator.
diff --git a/meta/recipes-devtools/python/python3/CVE-2021-23336.patch b/meta/recipes-devtools/python/python3/CVE-2021-23336.patch
new file mode 100644
index 0000000000..2a885b9d37
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2021-23336.patch
@@ -0,0 +1,530 @@
+From 3ab6f812653e79d008d5eba31dc25d34f3ca7170 Mon Sep 17 00:00:00 2001
+From: Senthil Kumaran <senthil@uthcode.com>
+Date: Mon, 15 Feb 2021 10:15:02 -0800
+Subject: [PATCH] bpo-42967: only use '&' as a query string separator
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+ (GH-24297)  (#24529)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* bpo-42967: only use '&' as a query string separator (#24297)
+
+bpo-42967: [security] Address a web cache-poisoning issue reported in
+urllib.parse.parse_qsl().
+
+urllib.parse will only us "&" as query string separator by default
+instead of both ";" and "&" as allowed in earlier versions. An optional
+argument seperator with default value "&" is added to specify the
+separator.
+
+Co-authored-by: Éric Araujo <merwok@netwok.org>
+Co-authored-by: blurb-it[bot] <43283697+blurb-it[bot]@users.noreply.github.com>
+Co-authored-by: Ken Jin <28750310+Fidget-Spinner@users.noreply.github.com>
+Co-authored-by: Éric Araujo <merwok@netwok.org>
+(cherry picked from commit fcbe0cb04d35189401c0c880ebfb4311e952d776)
+
+* [3.8] bpo-42967: only use '&' as a query string separator (GH-24297)
+
+bpo-42967: [security] Address a web cache-poisoning issue reported in urllib.parse.parse_qsl().
+
+urllib.parse will only us "&" as query string separator by default instead of both ";" and "&" as allowed in earlier versions. An optional argument seperator with default value "&" is added to specify the separator.
+
+Co-authored-by: Éric Araujo <merwok@netwok.org>
+Co-authored-by: blurb-it[bot] <43283697+blurb-it[bot]@users.noreply.github.com>
+Co-authored-by: Ken Jin <28750310+Fidget-Spinner@users.noreply.github.com>
+Co-authored-by: Éric Araujo <merwok@netwok.org>.
+(cherry picked from commit fcbe0cb04d35189401c0c880ebfb4311e952d776)
+
+Co-authored-by: Adam Goldschmidt <adamgold7@gmail.com>
+
+* Update correct version information.
+
+* fix docs and make logic clearer
+
+Co-authored-by: Adam Goldschmidt <adamgold7@gmail.com>
+Co-authored-by: Fidget-Spinner <28750310+Fidget-Spinner@users.noreply.github.com>
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/e3110c3cfbb7daa690d54d0eff6c264c870a71bf]
+CVE: CVE-2020-23336
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ Doc/library/cgi.rst                           | 11 ++-
+ Doc/library/urllib.parse.rst                  | 22 +++++-
+ Doc/whatsnew/3.6.rst                          | 13 ++++
+ Doc/whatsnew/3.7.rst                          | 13 ++++
+ Lib/cgi.py                                    | 23 ++++---
+ Lib/test/test_cgi.py                          | 29 ++++++--
+ Lib/test/test_urlparse.py                     | 68 +++++++++++++------
+ Lib/urllib/parse.py                           | 19 ++++--
+ .../2021-02-14-15-59-16.bpo-42967.YApqDS.rst  |  1 +
+ 9 files changed, 153 insertions(+), 46 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rst
+
+diff --git a/Doc/library/cgi.rst b/Doc/library/cgi.rst
+index 4048592..880074b 100644
+--- a/Doc/library/cgi.rst
++++ b/Doc/library/cgi.rst
+@@ -277,14 +277,16 @@ These are useful if you want more control, or if you want to employ some of the
+ algorithms implemented in this module in other circumstances.
+ 
+ 
+-.. function:: parse(fp=None, environ=os.environ, keep_blank_values=False, strict_parsing=False)
++.. function:: parse(fp=None, environ=os.environ, keep_blank_values=False, strict_parsing=False, separator="&")
+ 
+    Parse a query in the environment or from a file (the file defaults to
+-   ``sys.stdin``).  The *keep_blank_values* and *strict_parsing* parameters are
++   ``sys.stdin``).  The *keep_blank_values*, *strict_parsing* and *separator* parameters are
+    passed to :func:`urllib.parse.parse_qs` unchanged.
+ 
++   .. versionchanged:: 3.8.8
++      Added the *separator* parameter.
+ 
+-.. function:: parse_multipart(fp, pdict, encoding="utf-8", errors="replace")
++.. function:: parse_multipart(fp, pdict, encoding="utf-8", errors="replace", separator="&")
+ 
+    Parse input of type :mimetype:`multipart/form-data` (for  file uploads).
+    Arguments are *fp* for the input file, *pdict* for a dictionary containing
+@@ -303,6 +305,9 @@ algorithms implemented in this module in other circumstances.
+       Added the *encoding* and *errors* parameters.  For non-file fields, the
+       value is now a list of strings, not bytes.
+ 
++   .. versionchanged:: 3.8.8
++      Added the *separator* parameter.
++
+ 
+ .. function:: parse_header(string)
+ 
+diff --git a/Doc/library/urllib.parse.rst b/Doc/library/urllib.parse.rst
+index 52f98ef..45ca03a 100644
+--- a/Doc/library/urllib.parse.rst
++++ b/Doc/library/urllib.parse.rst
+@@ -165,7 +165,7 @@ or on combining URL components into a URL string.
+       now raise :exc:`ValueError`.
+ 
+ 
+-.. function:: parse_qs(qs, keep_blank_values=False, strict_parsing=False, encoding='utf-8', errors='replace', max_num_fields=None)
++.. function:: parse_qs(qs, keep_blank_values=False, strict_parsing=False, encoding='utf-8', errors='replace', max_num_fields=None, separator='&')
+ 
+    Parse a query string given as a string argument (data of type
+    :mimetype:`application/x-www-form-urlencoded`).  Data are returned as a
+@@ -190,6 +190,9 @@ or on combining URL components into a URL string.
+    read. If set, then throws a :exc:`ValueError` if there are more than
+    *max_num_fields* fields read.
+ 
++   The optional argument *separator* is the symbol to use for separating the
++   query arguments. It defaults to ``&``.
++
+    Use the :func:`urllib.parse.urlencode` function (with the ``doseq``
+    parameter set to ``True``) to convert such dictionaries into query
+    strings.
+@@ -201,8 +204,14 @@ or on combining URL components into a URL string.
+    .. versionchanged:: 3.8
+       Added *max_num_fields* parameter.
+ 
++   .. versionchanged:: 3.8.8
++      Added *separator* parameter with the default value of ``&``. Python
++      versions earlier than Python 3.8.8 allowed using both ``;`` and ``&`` as
++      query parameter separator. This has been changed to allow only a single
++      separator key, with ``&`` as the default separator.
++
+ 
+-.. function:: parse_qsl(qs, keep_blank_values=False, strict_parsing=False, encoding='utf-8', errors='replace', max_num_fields=None)
++.. function:: parse_qsl(qs, keep_blank_values=False, strict_parsing=False, encoding='utf-8', errors='replace', max_num_fields=None, separator='&')
+ 
+    Parse a query string given as a string argument (data of type
+    :mimetype:`application/x-www-form-urlencoded`).  Data are returned as a list of
+@@ -226,6 +235,9 @@ or on combining URL components into a URL string.
+    read. If set, then throws a :exc:`ValueError` if there are more than
+    *max_num_fields* fields read.
+ 
++   The optional argument *separator* is the symbol to use for separating the
++   query arguments. It defaults to ``&``.
++
+    Use the :func:`urllib.parse.urlencode` function to convert such lists of pairs into
+    query strings.
+ 
+@@ -235,6 +247,12 @@ or on combining URL components into a URL string.
+    .. versionchanged:: 3.8
+       Added *max_num_fields* parameter.
+ 
++   .. versionchanged:: 3.8.8
++      Added *separator* parameter with the default value of ``&``. Python
++      versions earlier than Python 3.8.8 allowed using both ``;`` and ``&`` as
++      query parameter separator. This has been changed to allow only a single
++      separator key, with ``&`` as the default separator.
++
+ 
+ .. function:: urlunparse(parts)
+ 
+diff --git a/Doc/whatsnew/3.6.rst b/Doc/whatsnew/3.6.rst
+index 04c1f7e..4409a3a 100644
+--- a/Doc/whatsnew/3.6.rst
++++ b/Doc/whatsnew/3.6.rst
+@@ -2443,3 +2443,16 @@ because of the behavior of the socket option ``SO_REUSEADDR`` in UDP. For more
+ details, see the documentation for ``loop.create_datagram_endpoint()``.
+ (Contributed by Kyle Stanley, Antoine Pitrou, and Yury Selivanov in
+ :issue:`37228`.)
++
++Notable changes in Python 3.6.13
++================================
++
++Earlier Python versions allowed using both ``;`` and ``&`` as
++query parameter separators in :func:`urllib.parse.parse_qs` and
++:func:`urllib.parse.parse_qsl`.  Due to security concerns, and to conform with
++newer W3C recommendations, this has been changed to allow only a single
++separator key, with ``&`` as the default.  This change also affects
++:func:`cgi.parse` and :func:`cgi.parse_multipart` as they use the affected
++functions internally. For more details, please see their respective
++documentation.
++(Contributed by Adam Goldschmidt, Senthil Kumaran and Ken Jin in :issue:`42967`.)
+diff --git a/Doc/whatsnew/3.7.rst b/Doc/whatsnew/3.7.rst
+index b9b5021..8f47a9f 100644
+--- a/Doc/whatsnew/3.7.rst
++++ b/Doc/whatsnew/3.7.rst
+@@ -2556,3 +2556,16 @@ because of the behavior of the socket option ``SO_REUSEADDR`` in UDP. For more
+ details, see the documentation for ``loop.create_datagram_endpoint()``.
+ (Contributed by Kyle Stanley, Antoine Pitrou, and Yury Selivanov in
+ :issue:`37228`.)
++
++Notable changes in Python 3.7.10
++================================
++
++Earlier Python versions allowed using both ``;`` and ``&`` as
++query parameter separators in :func:`urllib.parse.parse_qs` and
++:func:`urllib.parse.parse_qsl`.  Due to security concerns, and to conform with
++newer W3C recommendations, this has been changed to allow only a single
++separator key, with ``&`` as the default.  This change also affects
++:func:`cgi.parse` and :func:`cgi.parse_multipart` as they use the affected
++functions internally. For more details, please see their respective
++documentation.
++(Contributed by Adam Goldschmidt, Senthil Kumaran and Ken Jin in :issue:`42967`.)
+diff --git a/Lib/cgi.py b/Lib/cgi.py
+index 5ace46a..13255a9 100755
+--- a/Lib/cgi.py
++++ b/Lib/cgi.py
+@@ -106,7 +106,8 @@ log = initlog           # The current logging function
+ # 0 ==> unlimited input
+ maxlen = 0
+ 
+-def parse(fp=None, environ=os.environ, keep_blank_values=0, strict_parsing=0):
++def parse(fp=None, environ=os.environ, keep_blank_values=0,
++          strict_parsing=0, separator='&'):
+     """Parse a query in the environment or from a file (default stdin)
+ 
+         Arguments, all optional:
+@@ -125,6 +126,9 @@ def parse(fp=None, environ=os.environ, keep_blank_values=0, strict_parsing=0):
+         strict_parsing: flag indicating what to do with parsing errors.
+             If false (the default), errors are silently ignored.
+             If true, errors raise a ValueError exception.
++
++        separator: str. The symbol to use for separating the query arguments.
++            Defaults to &.
+     """
+     if fp is None:
+         fp = sys.stdin
+@@ -145,7 +149,7 @@ def parse(fp=None, environ=os.environ, keep_blank_values=0, strict_parsing=0):
+     if environ['REQUEST_METHOD'] == 'POST':
+         ctype, pdict = parse_header(environ['CONTENT_TYPE'])
+         if ctype == 'multipart/form-data':
+-            return parse_multipart(fp, pdict)
++            return parse_multipart(fp, pdict, separator=separator)
+         elif ctype == 'application/x-www-form-urlencoded':
+             clength = int(environ['CONTENT_LENGTH'])
+             if maxlen and clength > maxlen:
+@@ -169,10 +173,10 @@ def parse(fp=None, environ=os.environ, keep_blank_values=0, strict_parsing=0):
+             qs = ""
+         environ['QUERY_STRING'] = qs    # XXX Shouldn't, really
+     return urllib.parse.parse_qs(qs, keep_blank_values, strict_parsing,
+-                                 encoding=encoding)
++                                 encoding=encoding, separator=separator)
+ 
+ 
+-def parse_multipart(fp, pdict, encoding="utf-8", errors="replace"):
++def parse_multipart(fp, pdict, encoding="utf-8", errors="replace", separator='&'):
+     """Parse multipart input.
+ 
+     Arguments:
+@@ -193,7 +197,7 @@ def parse_multipart(fp, pdict, encoding="utf-8", errors="replace"):
+     headers.set_type(ctype)
+     headers['Content-Length'] = pdict['CONTENT-LENGTH']
+     fs = FieldStorage(fp, headers=headers, encoding=encoding, errors=errors,
+-        environ={'REQUEST_METHOD': 'POST'})
++        environ={'REQUEST_METHOD': 'POST'}, separator=separator)
+     return {k: fs.getlist(k) for k in fs}
+ 
+ def _parseparam(s):
+@@ -303,7 +307,7 @@ class FieldStorage:
+     def __init__(self, fp=None, headers=None, outerboundary=b'',
+                  environ=os.environ, keep_blank_values=0, strict_parsing=0,
+                  limit=None, encoding='utf-8', errors='replace',
+-                 max_num_fields=None):
++                 max_num_fields=None, separator='&'):
+         """Constructor.  Read multipart/* until last part.
+ 
+         Arguments, all optional:
+@@ -351,6 +355,7 @@ class FieldStorage:
+         self.keep_blank_values = keep_blank_values
+         self.strict_parsing = strict_parsing
+         self.max_num_fields = max_num_fields
++        self.separator = separator
+         if 'REQUEST_METHOD' in environ:
+             method = environ['REQUEST_METHOD'].upper()
+         self.qs_on_post = None
+@@ -577,7 +582,7 @@ class FieldStorage:
+         query = urllib.parse.parse_qsl(
+             qs, self.keep_blank_values, self.strict_parsing,
+             encoding=self.encoding, errors=self.errors,
+-            max_num_fields=self.max_num_fields)
++            max_num_fields=self.max_num_fields, separator=self.separator)
+         self.list = [MiniFieldStorage(key, value) for key, value in query]
+         self.skip_lines()
+ 
+@@ -593,7 +598,7 @@ class FieldStorage:
+             query = urllib.parse.parse_qsl(
+                 self.qs_on_post, self.keep_blank_values, self.strict_parsing,
+                 encoding=self.encoding, errors=self.errors,
+-                max_num_fields=self.max_num_fields)
++                max_num_fields=self.max_num_fields, separator=self.separator)
+             self.list.extend(MiniFieldStorage(key, value) for key, value in query)
+ 
+         klass = self.FieldStorageClass or self.__class__
+@@ -637,7 +642,7 @@ class FieldStorage:
+                 else self.limit - self.bytes_read
+             part = klass(self.fp, headers, ib, environ, keep_blank_values,
+                          strict_parsing, limit,
+-                         self.encoding, self.errors, max_num_fields)
++                         self.encoding, self.errors, max_num_fields, self.separator)
+ 
+             if max_num_fields is not None:
+                 max_num_fields -= 1
+diff --git a/Lib/test/test_cgi.py b/Lib/test/test_cgi.py
+index ab86771..bda03ee 100644
+--- a/Lib/test/test_cgi.py
++++ b/Lib/test/test_cgi.py
+@@ -53,12 +53,9 @@ parse_strict_test_cases = [
+     ("", ValueError("bad query field: ''")),
+     ("&", ValueError("bad query field: ''")),
+     ("&&", ValueError("bad query field: ''")),
+-    (";", ValueError("bad query field: ''")),
+-    (";&;", ValueError("bad query field: ''")),
+     # Should the next few really be valid?
+     ("=", {}),
+     ("=&=", {}),
+-    ("=;=", {}),
+     # This rest seem to make sense
+     ("=a", {'': ['a']}),
+     ("&=a", ValueError("bad query field: ''")),
+@@ -73,8 +70,6 @@ parse_strict_test_cases = [
+     ("a=a+b&b=b+c", {'a': ['a b'], 'b': ['b c']}),
+     ("a=a+b&a=b+a", {'a': ['a b', 'b a']}),
+     ("x=1&y=2.0&z=2-3.%2b0", {'x': ['1'], 'y': ['2.0'], 'z': ['2-3.+0']}),
+-    ("x=1;y=2.0&z=2-3.%2b0", {'x': ['1'], 'y': ['2.0'], 'z': ['2-3.+0']}),
+-    ("x=1;y=2.0;z=2-3.%2b0", {'x': ['1'], 'y': ['2.0'], 'z': ['2-3.+0']}),
+     ("Hbc5161168c542333633315dee1182227:key_store_seqid=400006&cuyer=r&view=bustomer&order_id=0bb2e248638833d48cb7fed300000f1b&expire=964546263&lobale=en-US&kid=130003.300038&ss=env",
+      {'Hbc5161168c542333633315dee1182227:key_store_seqid': ['400006'],
+       'cuyer': ['r'],
+@@ -187,6 +182,30 @@ Content-Length: 3
+                     else:
+                         self.assertEqual(fs.getvalue(key), expect_val[0])
+ 
++    def test_separator(self):
++        parse_semicolon = [
++            ("x=1;y=2.0", {'x': ['1'], 'y': ['2.0']}),
++            ("x=1;y=2.0;z=2-3.%2b0", {'x': ['1'], 'y': ['2.0'], 'z': ['2-3.+0']}),
++            (";", ValueError("bad query field: ''")),
++            (";;", ValueError("bad query field: ''")),
++            ("=;a", ValueError("bad query field: 'a'")),
++            (";b=a", ValueError("bad query field: ''")),
++            ("b;=a", ValueError("bad query field: 'b'")),
++            ("a=a+b;b=b+c", {'a': ['a b'], 'b': ['b c']}),
++            ("a=a+b;a=b+a", {'a': ['a b', 'b a']}),
++        ]
++        for orig, expect in parse_semicolon:
++            env = {'QUERY_STRING': orig}
++            fs = cgi.FieldStorage(separator=';', environ=env)
++            if isinstance(expect, dict):
++                for key in expect.keys():
++                    expect_val = expect[key]
++                    self.assertIn(key, fs)
++                    if len(expect_val) > 1:
++                        self.assertEqual(fs.getvalue(key), expect_val)
++                    else:
++                        self.assertEqual(fs.getvalue(key), expect_val[0])
++
+     def test_log(self):
+         cgi.log("Testing")
+ 
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index 4ae6ed3..90c8d69 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -32,16 +32,10 @@ parse_qsl_test_cases = [
+     (b"&a=b", [(b'a', b'b')]),
+     (b"a=a+b&b=b+c", [(b'a', b'a b'), (b'b', b'b c')]),
+     (b"a=1&a=2", [(b'a', b'1'), (b'a', b'2')]),
+-    (";", []),
+-    (";;", []),
+-    (";a=b", [('a', 'b')]),
+-    ("a=a+b;b=b+c", [('a', 'a b'), ('b', 'b c')]),
+-    ("a=1;a=2", [('a', '1'), ('a', '2')]),
+-    (b";", []),
+-    (b";;", []),
+-    (b";a=b", [(b'a', b'b')]),
+-    (b"a=a+b;b=b+c", [(b'a', b'a b'), (b'b', b'b c')]),
+-    (b"a=1;a=2", [(b'a', b'1'), (b'a', b'2')]),
++    (";a=b", [(';a', 'b')]),
++    ("a=a+b;b=b+c", [('a', 'a b;b=b c')]),
++    (b";a=b", [(b';a', b'b')]),
++    (b"a=a+b;b=b+c", [(b'a', b'a b;b=b c')]),
+ ]
+ 
+ # Each parse_qs testcase is a two-tuple that contains
+@@ -68,16 +62,10 @@ parse_qs_test_cases = [
+     (b"&a=b", {b'a': [b'b']}),
+     (b"a=a+b&b=b+c", {b'a': [b'a b'], b'b': [b'b c']}),
+     (b"a=1&a=2", {b'a': [b'1', b'2']}),
+-    (";", {}),
+-    (";;", {}),
+-    (";a=b", {'a': ['b']}),
+-    ("a=a+b;b=b+c", {'a': ['a b'], 'b': ['b c']}),
+-    ("a=1;a=2", {'a': ['1', '2']}),
+-    (b";", {}),
+-    (b";;", {}),
+-    (b";a=b", {b'a': [b'b']}),
+-    (b"a=a+b;b=b+c", {b'a': [b'a b'], b'b': [b'b c']}),
+-    (b"a=1;a=2", {b'a': [b'1', b'2']}),
++    (";a=b", {';a': ['b']}),
++    ("a=a+b;b=b+c", {'a': ['a b;b=b c']}),
++    (b";a=b", {b';a': [b'b']}),
++    (b"a=a+b;b=b+c", {b'a':[ b'a b;b=b c']}),
+ ]
+ 
+ class UrlParseTestCase(unittest.TestCase):
+@@ -884,10 +872,46 @@ class UrlParseTestCase(unittest.TestCase):
+     def test_parse_qsl_max_num_fields(self):
+         with self.assertRaises(ValueError):
+             urllib.parse.parse_qs('&'.join(['a=a']*11), max_num_fields=10)
+-        with self.assertRaises(ValueError):
+-            urllib.parse.parse_qs(';'.join(['a=a']*11), max_num_fields=10)
+         urllib.parse.parse_qs('&'.join(['a=a']*10), max_num_fields=10)
+ 
++    def test_parse_qs_separator(self):
++        parse_qs_semicolon_cases = [
++            (";", {}),
++            (";;", {}),
++            (";a=b", {'a': ['b']}),
++            ("a=a+b;b=b+c", {'a': ['a b'], 'b': ['b c']}),
++            ("a=1;a=2", {'a': ['1', '2']}),
++            (b";", {}),
++            (b";;", {}),
++            (b";a=b", {b'a': [b'b']}),
++            (b"a=a+b;b=b+c", {b'a': [b'a b'], b'b': [b'b c']}),
++            (b"a=1;a=2", {b'a': [b'1', b'2']}),
++        ]
++        for orig, expect in parse_qs_semicolon_cases:
++            with self.subTest(f"Original: {orig!r}, Expected: {expect!r}"):
++                result = urllib.parse.parse_qs(orig, separator=';')
++                self.assertEqual(result, expect, "Error parsing %r" % orig)
++
++
++    def test_parse_qsl_separator(self):
++        parse_qsl_semicolon_cases = [
++            (";", []),
++            (";;", []),
++            (";a=b", [('a', 'b')]),
++            ("a=a+b;b=b+c", [('a', 'a b'), ('b', 'b c')]),
++            ("a=1;a=2", [('a', '1'), ('a', '2')]),
++            (b";", []),
++            (b";;", []),
++            (b";a=b", [(b'a', b'b')]),
++            (b"a=a+b;b=b+c", [(b'a', b'a b'), (b'b', b'b c')]),
++            (b"a=1;a=2", [(b'a', b'1'), (b'a', b'2')]),
++        ]
++        for orig, expect in parse_qsl_semicolon_cases:
++            with self.subTest(f"Original: {orig!r}, Expected: {expect!r}"):
++                result = urllib.parse.parse_qsl(orig, separator=';')
++                self.assertEqual(result, expect, "Error parsing %r" % orig)
++
++
+     def test_urlencode_sequences(self):
+         # Other tests incidentally urlencode things; test non-covered cases:
+         # Sequence and object values.
+diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
+index e2b6f13..5a3e847 100644
+--- a/Lib/urllib/parse.py
++++ b/Lib/urllib/parse.py
+@@ -648,7 +648,7 @@ def unquote(string, encoding='utf-8', errors='replace'):
+ 
+ 
+ def parse_qs(qs, keep_blank_values=False, strict_parsing=False,
+-             encoding='utf-8', errors='replace', max_num_fields=None):
++             encoding='utf-8', errors='replace', max_num_fields=None, separator='&'):
+     """Parse a query given as a string argument.
+ 
+         Arguments:
+@@ -672,12 +672,15 @@ def parse_qs(qs, keep_blank_values=False, strict_parsing=False,
+         max_num_fields: int. If set, then throws a ValueError if there
+             are more than n fields read by parse_qsl().
+ 
++        separator: str. The symbol to use for separating the query arguments.
++            Defaults to &.
++
+         Returns a dictionary.
+     """
+     parsed_result = {}
+     pairs = parse_qsl(qs, keep_blank_values, strict_parsing,
+                       encoding=encoding, errors=errors,
+-                      max_num_fields=max_num_fields)
++                      max_num_fields=max_num_fields, separator=separator)
+     for name, value in pairs:
+         if name in parsed_result:
+             parsed_result[name].append(value)
+@@ -687,7 +690,7 @@ def parse_qs(qs, keep_blank_values=False, strict_parsing=False,
+ 
+ 
+ def parse_qsl(qs, keep_blank_values=False, strict_parsing=False,
+-              encoding='utf-8', errors='replace', max_num_fields=None):
++              encoding='utf-8', errors='replace', max_num_fields=None, separator='&'):
+     """Parse a query given as a string argument.
+ 
+         Arguments:
+@@ -710,19 +713,25 @@ def parse_qsl(qs, keep_blank_values=False, strict_parsing=False,
+         max_num_fields: int. If set, then throws a ValueError
+             if there are more than n fields read by parse_qsl().
+ 
++        separator: str. The symbol to use for separating the query arguments.
++            Defaults to &.
++
+         Returns a list, as G-d intended.
+     """
+     qs, _coerce_result = _coerce_args(qs)
+ 
++    if not separator or (not isinstance(separator, (str, bytes))):
++        raise ValueError("Separator must be of type string or bytes.")
++
+     # If max_num_fields is defined then check that the number of fields
+     # is less than max_num_fields. This prevents a memory exhaustion DOS
+     # attack via post bodies with many fields.
+     if max_num_fields is not None:
+-        num_fields = 1 + qs.count('&') + qs.count(';')
++        num_fields = 1 + qs.count(separator)
+         if max_num_fields < num_fields:
+             raise ValueError('Max number of fields exceeded')
+ 
+-    pairs = [s2 for s1 in qs.split('&') for s2 in s1.split(';')]
++    pairs = [s1 for s1 in qs.split(separator)]
+     r = []
+     for name_value in pairs:
+         if not name_value and not strict_parsing:
+diff --git a/Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rst b/Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rst
+new file mode 100644
+index 0000000..f08489b
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2021-02-14-15-59-16.bpo-42967.YApqDS.rst
+@@ -0,0 +1 @@
++Fix web cache poisoning vulnerability by defaulting the query args separator to ``&``, and allowing the user to choose a custom separator.
diff --git a/meta/recipes-devtools/python/python3/CVE-2021-3177.patch b/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
new file mode 100644
index 0000000000..af95b5eee1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
@@ -0,0 +1,191 @@
+From ece5dfd403dac211f8d3c72701fe7ba7b7aa5b5f Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 18 Jan 2021 13:28:52 -0800
+Subject: [PATCH] closes bpo-42938: Replace snprintf with Python unicode
+ formatting in ctypes param reprs. (GH-24248)
+
+(cherry picked from commit 916610ef90a0d0761f08747f7b0905541f0977c7)
+
+Co-authored-by: Benjamin Peterson <benjamin@python.org>
+
+Co-authored-by: Benjamin Peterson <benjamin@python.org>
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/ece5dfd403dac211f8d3c72701fe7ba7b7aa5b5f]
+CVE: CVE-2021-3177
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ Lib/ctypes/test/test_parameters.py            | 43 ++++++++++++++++
+ .../2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst  |  2 +
+ Modules/_ctypes/callproc.c                    | 51 +++++++------------
+ 3 files changed, 64 insertions(+), 32 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
+
+diff --git a/Lib/ctypes/test/test_parameters.py b/Lib/ctypes/test/test_parameters.py
+index e4c25fd880cef..531894fdec838 100644
+--- a/Lib/ctypes/test/test_parameters.py
++++ b/Lib/ctypes/test/test_parameters.py
+@@ -201,6 +201,49 @@ def __dict__(self):
+         with self.assertRaises(ZeroDivisionError):
+             WorseStruct().__setstate__({}, b'foo')
+ 
++    def test_parameter_repr(self):
++        from ctypes import (
++            c_bool,
++            c_char,
++            c_wchar,
++            c_byte,
++            c_ubyte,
++            c_short,
++            c_ushort,
++            c_int,
++            c_uint,
++            c_long,
++            c_ulong,
++            c_longlong,
++            c_ulonglong,
++            c_float,
++            c_double,
++            c_longdouble,
++            c_char_p,
++            c_wchar_p,
++            c_void_p,
++        )
++        self.assertRegex(repr(c_bool.from_param(True)), r"^<cparam '\?' at 0x[A-Fa-f0-9]+>$")
++        self.assertEqual(repr(c_char.from_param(97)), "<cparam 'c' ('a')>")
++        self.assertRegex(repr(c_wchar.from_param('a')), r"^<cparam 'u' at 0x[A-Fa-f0-9]+>$")
++        self.assertEqual(repr(c_byte.from_param(98)), "<cparam 'b' (98)>")
++        self.assertEqual(repr(c_ubyte.from_param(98)), "<cparam 'B' (98)>")
++        self.assertEqual(repr(c_short.from_param(511)), "<cparam 'h' (511)>")
++        self.assertEqual(repr(c_ushort.from_param(511)), "<cparam 'H' (511)>")
++        self.assertRegex(repr(c_int.from_param(20000)), r"^<cparam '[li]' \(20000\)>$")
++        self.assertRegex(repr(c_uint.from_param(20000)), r"^<cparam '[LI]' \(20000\)>$")
++        self.assertRegex(repr(c_long.from_param(20000)), r"^<cparam '[li]' \(20000\)>$")
++        self.assertRegex(repr(c_ulong.from_param(20000)), r"^<cparam '[LI]' \(20000\)>$")
++        self.assertRegex(repr(c_longlong.from_param(20000)), r"^<cparam '[liq]' \(20000\)>$")
++        self.assertRegex(repr(c_ulonglong.from_param(20000)), r"^<cparam '[LIQ]' \(20000\)>$")
++        self.assertEqual(repr(c_float.from_param(1.5)), "<cparam 'f' (1.5)>")
++        self.assertEqual(repr(c_double.from_param(1.5)), "<cparam 'd' (1.5)>")
++        self.assertEqual(repr(c_double.from_param(1e300)), "<cparam 'd' (1e+300)>")
++        self.assertRegex(repr(c_longdouble.from_param(1.5)), r"^<cparam ('d' \(1.5\)|'g' at 0x[A-Fa-f0-9]+)>$")
++        self.assertRegex(repr(c_char_p.from_param(b'hihi')), "^<cparam 'z' \(0x[A-Fa-f0-9]+\)>$")
++        self.assertRegex(repr(c_wchar_p.from_param('hihi')), "^<cparam 'Z' \(0x[A-Fa-f0-9]+\)>$")
++        self.assertRegex(repr(c_void_p.from_param(0x12)), r"^<cparam 'P' \(0x0*12\)>$")
++
+ ################################################################
+ 
+ if __name__ == '__main__':
+diff --git a/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
+new file mode 100644
+index 0000000000000..7df65a156feab
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
+@@ -0,0 +1,2 @@
++Avoid static buffers when computing the repr of :class:`ctypes.c_double` and
++:class:`ctypes.c_longdouble` values.
+diff --git a/Modules/_ctypes/callproc.c b/Modules/_ctypes/callproc.c
+index a9b8675cd951b..de75918d49f37 100644
+--- a/Modules/_ctypes/callproc.c
++++ b/Modules/_ctypes/callproc.c
+@@ -484,58 +484,47 @@ is_literal_char(unsigned char c)
+ static PyObject *
+ PyCArg_repr(PyCArgObject *self)
+ {
+-    char buffer[256];
+     switch(self->tag) {
+     case 'b':
+     case 'B':
+-        sprintf(buffer, "<cparam '%c' (%d)>",
++        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
+             self->tag, self->value.b);
+-        break;
+     case 'h':
+     case 'H':
+-        sprintf(buffer, "<cparam '%c' (%d)>",
++        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
+             self->tag, self->value.h);
+-        break;
+     case 'i':
+     case 'I':
+-        sprintf(buffer, "<cparam '%c' (%d)>",
++        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
+             self->tag, self->value.i);
+-        break;
+     case 'l':
+     case 'L':
+-        sprintf(buffer, "<cparam '%c' (%ld)>",
++        return PyUnicode_FromFormat("<cparam '%c' (%ld)>",
+             self->tag, self->value.l);
+-        break;
+ 
+     case 'q':
+     case 'Q':
+-        sprintf(buffer,
+-#ifdef MS_WIN32
+-            "<cparam '%c' (%I64d)>",
+-#else
+-            "<cparam '%c' (%lld)>",
+-#endif
++        return PyUnicode_FromFormat("<cparam '%c' (%lld)>",
+             self->tag, self->value.q);
+-        break;
+     case 'd':
+-        sprintf(buffer, "<cparam '%c' (%f)>",
+-            self->tag, self->value.d);
+-        break;
+-    case 'f':
+-        sprintf(buffer, "<cparam '%c' (%f)>",
+-            self->tag, self->value.f);
+-        break;
+-
++    case 'f': {
++        PyObject *f = PyFloat_FromDouble((self->tag == 'f') ? self->value.f : self->value.d);
++        if (f == NULL) {
++            return NULL;
++        }
++        PyObject *result = PyUnicode_FromFormat("<cparam '%c' (%R)>", self->tag, f);
++        Py_DECREF(f);
++        return result;
++    }
+     case 'c':
+         if (is_literal_char((unsigned char)self->value.c)) {
+-            sprintf(buffer, "<cparam '%c' ('%c')>",
++            return PyUnicode_FromFormat("<cparam '%c' ('%c')>",
+                 self->tag, self->value.c);
+         }
+         else {
+-            sprintf(buffer, "<cparam '%c' ('\\x%02x')>",
++            return PyUnicode_FromFormat("<cparam '%c' ('\\x%02x')>",
+                 self->tag, (unsigned char)self->value.c);
+         }
+-        break;
+ 
+ /* Hm, are these 'z' and 'Z' codes useful at all?
+    Shouldn't they be replaced by the functionality of c_string
+@@ -544,22 +533,20 @@ PyCArg_repr(PyCArgObject *self)
+     case 'z':
+     case 'Z':
+     case 'P':
+-        sprintf(buffer, "<cparam '%c' (%p)>",
++        return PyUnicode_FromFormat("<cparam '%c' (%p)>",
+             self->tag, self->value.p);
+         break;
+ 
+     default:
+         if (is_literal_char((unsigned char)self->tag)) {
+-            sprintf(buffer, "<cparam '%c' at %p>",
++            return PyUnicode_FromFormat("<cparam '%c' at %p>",
+                 (unsigned char)self->tag, (void *)self);
+         }
+         else {
+-            sprintf(buffer, "<cparam 0x%02x at %p>",
++            return PyUnicode_FromFormat("<cparam 0x%02x at %p>",
+                 (unsigned char)self->tag, (void *)self);
+         }
+-        break;
+     }
+-    return PyUnicode_FromString(buffer);
+ }
+ 
+ static PyMemberDef PyCArgType_members[] = {
+
diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index a448b3ed97..c870fc4f05 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -37,6 +37,8 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2020-14422.patch \
            file://CVE-2020-26116.patch \
            file://CVE-2020-27619.patch \
+           file://CVE-2021-3177.patch \
+           file://CVE-2021-23336.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.17.1

