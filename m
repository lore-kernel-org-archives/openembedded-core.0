Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4625A6014F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 05:58:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8Q5wKwe026505
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2016 22:58:20 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 25 Sep 2016 22:58:19 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2016 13:54:34 +0800
Message-ID: <1474869274-11704-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] python: fix CVE-2016-1000110
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
X-List-Received-Date: Mon, 26 Sep 2016 05:58:22 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Mingli Yu <Mingli.Yu@windriver.com>

Backport patch to fix CVE-2016-1000110 from python upstream:
for python2.7
https://hg.python.org/cpython/rev/ba915d561667/
for python3
https://hg.python.org/cpython/rev/a0ac52ed8f79

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../python/python-fix-CVE-2016-1000110.patch       | 162 +++++++++++++++++++++
 .../python3/python3-fix-CVE-2016-1000110.patch     | 148 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.2.bb      |   1 +
 meta/recipes-devtools/python/python_2.7.12.bb      |   1 +
 4 files changed, 312 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/python-fix-CVE-2016-1000110.patch
 create mode 100644 meta/recipes-devtools/python/python3/python3-fix-CVE-2016-1000110.patch

diff --git a/meta/recipes-devtools/python/python/python-fix-CVE-2016-1000110.patch b/meta/recipes-devtools/python/python/python-fix-CVE-2016-1000110.patch
new file mode 100644
index 0000000..97888e2
--- /dev/null
+++ b/meta/recipes-devtools/python/python/python-fix-CVE-2016-1000110.patch
@@ -0,0 +1,162 @@
+From cb25fbd5abc0f4eb07dbb8ea819e9c26bda4fc99 Mon Sep 17 00:00:00 2001
+From: Senthil Kumaran <senthil@uthcode.com>
+Date: Sat, 30 Jul 2016 05:49:53 -0700
+Subject: [PATCH] python: fix CVE-2016-1000110
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Prevent HTTPoxy attack (CVE-2016-1000110)
+
+Ignore the HTTP_PROXY variable when REQUEST_METHOD environment is set, which
+indicates that the script is in CGI mode.
+
+Issue reported and patch contributed by Rémi Rampin.
+
+Backport patch from https://hg.python.org/cpython/rev/ba915d561667/
+
+Upstream-Status: Backport
+CVE: CVE-2016-1000110
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ Doc/howto/urllib2.rst   |  5 +++++
+ Doc/library/urllib.rst  | 10 ++++++++++
+ Doc/library/urllib2.rst |  5 +++++
+ Lib/test/test_urllib.py | 12 ++++++++++++
+ Lib/urllib.py           |  9 +++++++++
+ Misc/ACKS               |  1 +
+ Misc/NEWS               |  4 ++++
+ 7 files changed, 46 insertions(+)
+
+diff --git a/Doc/howto/urllib2.rst b/Doc/howto/urllib2.rst
+index 6bb06d4..5cf2c0c 100644
+--- a/Doc/howto/urllib2.rst
++++ b/Doc/howto/urllib2.rst
+@@ -525,6 +525,11 @@ setting up a `Basic Authentication`_ handler: ::
+     through a proxy.  However, this can be enabled by extending urllib2 as
+     shown in the recipe [#]_.
+ 
++.. note::
++
++    ``HTTP_PROXY`` will be ignored if a variable ``REQUEST_METHOD`` is set; see
++    the documentation on :func:`~urllib.getproxies`.
++
+ 
+ Sockets and Layers
+ ==================
+diff --git a/Doc/library/urllib.rst b/Doc/library/urllib.rst
+index 3b5dc16..bddcba9 100644
+--- a/Doc/library/urllib.rst
++++ b/Doc/library/urllib.rst
+@@ -295,6 +295,16 @@ Utility functions
+    If both lowercase and uppercase environment variables exist (and disagree),
+    lowercase is preferred.
+ 
++    .. note::
++
++        If the environment variable ``REQUEST_METHOD`` is set, which usually
++        indicates your script is running in a CGI environment, the environment
++        variable ``HTTP_PROXY`` (uppercase ``_PROXY``) will be ignored. This is
++        because that variable can be injected by a client using the "Proxy:"
++        HTTP header. If you need to use an HTTP proxy in a CGI environment,
++        either use ``ProxyHandler`` explicitly, or make sure the variable name
++        is in lowercase (or at least the ``_proxy`` suffix).
++
+ .. note::
+     urllib also exposes certain utility functions like splittype, splithost and
+     others parsing URL into various components. But it is recommended to use
+diff --git a/Doc/library/urllib2.rst b/Doc/library/urllib2.rst
+index 8a4c80e..b808b98 100644
+--- a/Doc/library/urllib2.rst
++++ b/Doc/library/urllib2.rst
+@@ -229,6 +229,11 @@ The following classes are provided:
+ 
+    To disable autodetected proxy pass an empty dictionary.
+ 
++    .. note::
++
++       ``HTTP_PROXY`` will be ignored if a variable ``REQUEST_METHOD`` is set;
++       see the documentation on :func:`~urllib.getproxies`.
++
+ 
+ .. class:: HTTPPasswordMgr()
+ 
+diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
+index 434d533..27a1d38 100644
+--- a/Lib/test/test_urllib.py
++++ b/Lib/test/test_urllib.py
+@@ -170,6 +170,18 @@ class ProxyTests(unittest.TestCase):
+         self.assertTrue(urllib.proxy_bypass_environment('anotherdomain.com:8888'))
+         self.assertTrue(urllib.proxy_bypass_environment('newdomain.com:1234'))
+ 
++    def test_proxy_cgi_ignore(self):
++        try:
++            self.env.set('HTTP_PROXY', 'http://somewhere:3128')
++            proxies = urllib.getproxies_environment()
++            self.assertEqual('http://somewhere:3128', proxies['http'])
++            self.env.set('REQUEST_METHOD', 'GET')
++            proxies = urllib.getproxies_environment()
++            self.assertNotIn('http', proxies)
++        finally:
++            self.env.unset('REQUEST_METHOD')
++            self.env.unset('HTTP_PROXY')
++
+     def test_proxy_bypass_environment_host_match(self):
+         bypass = urllib.proxy_bypass_environment
+         self.env.set('NO_PROXY',
+diff --git a/Lib/urllib.py b/Lib/urllib.py
+index 139fab9..c3ba2c9 100644
+--- a/Lib/urllib.py
++++ b/Lib/urllib.py
+@@ -1380,12 +1380,21 @@ def getproxies_environment():
+     If you need a different way, you can pass a proxies dictionary to the
+     [Fancy]URLopener constructor.
+     """
++    # Get all variables
+     proxies = {}
+     for name, value in os.environ.items():
+         name = name.lower()
+         if value and name[-6:] == '_proxy':
+             proxies[name[:-6]] = value
+ 
++    # CVE-2016-1000110 - If we are running as CGI script, forget HTTP_PROXY
++    # (non-all-lowercase) as it may be set from the web server by a "Proxy:"
++    # header from the client
++    # If "proxy" is lowercase, it will still be used thanks to the next block
++    if 'REQUEST_METHOD' in os.environ:
++        proxies.pop('http', None)
++
++    # Get lowercase variables
+     for name, value in os.environ.items():
+         if name[-6:] == '_proxy':
+             name = name.lower()
+diff --git a/Misc/ACKS b/Misc/ACKS
+index ee3a465..9c374b7 100644
+--- a/Misc/ACKS
++++ b/Misc/ACKS
+@@ -1121,6 +1121,7 @@ Burton Radons
+ Jeff Ramnani
+ Varpu Rantala
+ Brodie Rao
++Rémi Rampin
+ Senko Rasic
+ Antti Rasinen
+ Nikolaus Rath
+diff --git a/Misc/NEWS b/Misc/NEWS
+index 4ab3a70..cc2f65b 100644
+--- a/Misc/NEWS
++++ b/Misc/NEWS
+@@ -187,6 +187,10 @@ Library
+ - Issue #26644: Raise ValueError rather than SystemError when a negative
+   length is passed to SSLSocket.recv() or read().
+ 
++- Issue #27568: Prevent HTTPoxy attack (CVE-2016-1000110). Ignore the
++  HTTP_PROXY variable when REQUEST_METHOD environment is set, which indicates
++  that the script is in CGI mode.
++
+ - Issue #23804: Fix SSL recv(0) and read(0) methods to return zero bytes
+   instead of up to 1024.
+ 
+-- 
+2.8.1
+
diff --git a/meta/recipes-devtools/python/python3/python3-fix-CVE-2016-1000110.patch b/meta/recipes-devtools/python/python3/python3-fix-CVE-2016-1000110.patch
new file mode 100644
index 0000000..ab1b723
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/python3-fix-CVE-2016-1000110.patch
@@ -0,0 +1,148 @@
+From aab3e8c432b90508ac14755128f5a687be2fdf43 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Thu, 22 Sep 2016 16:39:49 +0800
+Subject: [PATCH] python3: fix CVE-2016-1000110
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Ignore the HTTP_PROXY variable when REQUEST_METHOD environment is set, which
+indicates that the script is in CGI mode.
+
+Issue #27568 Reported and patch contributed by Rémi Rampin. [#27568]
+
+Backport patch from https://hg.python.org/cpython/rev/a0ac52ed8f79
+
+Upstream-Status: Backport
+CVE: CVE-2016-1000110
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ Doc/howto/urllib2.rst          |  5 +++++
+ Doc/library/urllib.request.rst | 17 ++++++++++++++++-
+ Lib/test/test_urllib.py        | 14 +++++++++++++-
+ Lib/urllib/request.py          |  6 ++++++
+ Misc/NEWS                      |  4 ++++
+ 5 files changed, 44 insertions(+), 2 deletions(-)
+
+diff --git a/Doc/howto/urllib2.rst b/Doc/howto/urllib2.rst
+index 24a4156..d2c7991 100644
+--- a/Doc/howto/urllib2.rst
++++ b/Doc/howto/urllib2.rst
+@@ -538,6 +538,11 @@ setting up a `Basic Authentication`_ handler: ::
+     through a proxy.  However, this can be enabled by extending urllib.request as
+     shown in the recipe [#]_.
+ 
++.. note::
++
++    ``HTTP_PROXY`` will be ignored if a variable ``REQUEST_METHOD`` is set; see
++    the documentation on :func:`~urllib.request.getproxies`.
++
+ 
+ Sockets and Layers
+ ==================
+diff --git a/Doc/library/urllib.request.rst b/Doc/library/urllib.request.rst
+index 1338906..1291aeb 100644
+--- a/Doc/library/urllib.request.rst
++++ b/Doc/library/urllib.request.rst
+@@ -173,6 +173,16 @@ The :mod:`urllib.request` module defines the following functions:
+    If both lowercase and uppercase environment variables exist (and disagree),
+    lowercase is preferred.
+ 
++    .. note::
++
++       If the environment variable ``REQUEST_METHOD`` is set, which usually
++       indicates your script is running in a CGI environment, the environment
++       variable ``HTTP_PROXY`` (uppercase ``_PROXY``) will be ignored. This is
++       because that variable can be injected by a client using the "Proxy:" HTTP
++       header. If you need to use an HTTP proxy in a CGI environment, either use
++       ``ProxyHandler`` explicitly, or make sure the variable name is in
++       lowercase (or at least the ``_proxy`` suffix).
++
+ 
+ The following classes are provided:
+ 
+@@ -280,6 +290,11 @@ The following classes are provided:
+    list of hostname suffixes, optionally with ``:port`` appended, for example
+    ``cern.ch,ncsa.uiuc.edu,some.host:8080``.
+ 
++    .. note::
++
++       ``HTTP_PROXY`` will be ignored if a variable ``REQUEST_METHOD`` is set;
++       see the documentation on :func:`~urllib.request.getproxies`.
++
+ 
+ .. class:: HTTPPasswordMgr()
+ 
+@@ -1138,7 +1153,7 @@ the returned bytes object to string once it determines or guesses
+ the appropriate encoding.
+ 
+ The following W3C document, https://www.w3.org/International/O-charset\ , lists
+-the various ways in which a (X)HTML or a XML document could have specified its
++the various ways in which an (X)HTML or an XML document could have specified its
+ encoding information.
+ 
+ As the python.org website uses *utf-8* encoding as specified in its meta tag, we
+diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
+index 5d05f8d..247598a 100644
+--- a/Lib/test/test_urllib.py
++++ b/Lib/test/test_urllib.py
+@@ -1,4 +1,4 @@
+-"""Regresssion tests for what was in Python 2's "urllib" module"""
++"""Regression tests for what was in Python 2's "urllib" module"""
+ 
+ import urllib.parse
+ import urllib.request
+@@ -232,6 +232,18 @@ class ProxyTests(unittest.TestCase):
+         self.assertTrue(urllib.request.proxy_bypass_environment('anotherdomain.com:8888'))
+         self.assertTrue(urllib.request.proxy_bypass_environment('newdomain.com:1234'))
+ 
++    def test_proxy_cgi_ignore(self):
++        try:
++            self.env.set('HTTP_PROXY', 'http://somewhere:3128')
++            proxies = urllib.request.getproxies_environment()
++            self.assertEqual('http://somewhere:3128', proxies['http'])
++            self.env.set('REQUEST_METHOD', 'GET')
++            proxies = urllib.request.getproxies_environment()
++            self.assertNotIn('http', proxies)
++        finally:
++            self.env.unset('REQUEST_METHOD')
++            self.env.unset('HTTP_PROXY')
++
+     def test_proxy_bypass_environment_host_match(self):
+         bypass = urllib.request.proxy_bypass_environment
+         self.env.set('NO_PROXY',
+diff --git a/Lib/urllib/request.py b/Lib/urllib/request.py
+index 1731fe3..3be327d 100644
+--- a/Lib/urllib/request.py
++++ b/Lib/urllib/request.py
+@@ -2412,6 +2412,12 @@ def getproxies_environment():
+         name = name.lower()
+         if value and name[-6:] == '_proxy':
+             proxies[name[:-6]] = value
++    # CVE-2016-1000110 - If we are running as CGI script, forget HTTP_PROXY
++    # (non-all-lowercase) as it may be set from the web server by a "Proxy:"
++    # header from the client
++    # If "proxy" is lowercase, it will still be used thanks to the next block
++    if 'REQUEST_METHOD' in os.environ:
++        proxies.pop('http', None)
+     for name, value in os.environ.items():
+         if name[-6:] == '_proxy':
+             name = name.lower()
+diff --git a/Misc/NEWS b/Misc/NEWS
+index 4ad2551..2fcc95b 100644
+--- a/Misc/NEWS
++++ b/Misc/NEWS
+@@ -329,6 +329,10 @@ Library
+ - Issue #26644: Raise ValueError rather than SystemError when a negative
+   length is passed to SSLSocket.recv() or read().
+ 
++- Issue #27568: Prevent HTTPoxy attack (CVE-2016-1000110). Ignore the
++  HTTP_PROXY variable when REQUEST_METHOD environment is set, which indicates
++  that the script is in CGI mode.
++
+ - Issue #23804: Fix SSL recv(0) and read(0) methods to return zero bytes
+   instead of up to 1024.
+ 
+-- 
+2.8.1
+
diff --git a/meta/recipes-devtools/python/python3_3.5.2.bb b/meta/recipes-devtools/python/python3_3.5.2.bb
index 456147d..e6cbb9c 100644
--- a/meta/recipes-devtools/python/python3_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3_3.5.2.bb
@@ -36,6 +36,7 @@ SRC_URI += "\
             file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
             file://setup.py-find-libraries-in-staging-dirs.patch \
             file://configure.ac-fix-LIBPL.patch \
+            file://python3-fix-CVE-2016-1000110.patch \
            "
 SRC_URI[md5sum] = "8906efbacfcdc7c3c9198aeefafd159e"
 SRC_URI[sha256sum] = "0010f56100b9b74259ebcd5d4b295a32324b58b517403a10d1a2aa7cb22bca40"
diff --git a/meta/recipes-devtools/python/python_2.7.12.bb b/meta/recipes-devtools/python/python_2.7.12.bb
index 65b57171..9fe35db 100644
--- a/meta/recipes-devtools/python/python_2.7.12.bb
+++ b/meta/recipes-devtools/python/python_2.7.12.bb
@@ -26,6 +26,7 @@ SRC_URI += "\
   file://parallel-makeinst-create-bindir.patch \
   file://use_sysroot_ncurses_instead_of_host.patch \
   file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
+  file://python-fix-CVE-2016-1000110.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.8.1


