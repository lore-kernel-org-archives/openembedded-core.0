Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qk6ZE-0008BF-9O
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 05:38:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Jul 2011 20:34:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,245,1309762800"; d="scan'208";a="30175941"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 21 Jul 2011 20:34:14 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 14:08:44 -0700
Message-Id: <fb74f9b81844e2355c17692bd14b58ee441d3649.1311282465.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1311282465.git.nitin.a.kamble@intel.com>
References: <cover.1311282465.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1311282465.git.nitin.a.kamble@intel.com>
References: <cover.1311282465.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/2] python: fix security vulnerability
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jul 2011 03:38:24 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This Fixes bug: [Yocto #1254]

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-1015

Issue #2254: Fix CGIHTTPServer information disclosure.  Relative paths are
  now collapsed within the url properly before looking in cgi_directories.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/python/python.inc            |    2 +-
 .../python/python/security_issue_2254_fix.patch    |  184 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.6.6.bb       |    3 +-
 3 files changed, 187 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/security_issue_2254_fix.patch

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 25a458e..a6cc917 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.python.org"
 LICENSE = "PSF"
 SECTION = "devel/python"
 # bump this on every change in contrib/python/generate-manifest-2.6.py
-INC_PR = "nk2"
+INC_PR = "r2"
 
 DEFAULT_PREFERENCE = "-26"
 
diff --git a/meta/recipes-devtools/python/python/security_issue_2254_fix.patch b/meta/recipes-devtools/python/python/security_issue_2254_fix.patch
new file mode 100644
index 0000000..f032858
--- /dev/null
+++ b/meta/recipes-devtools/python/python/security_issue_2254_fix.patch
@@ -0,0 +1,184 @@
+Upstream-Status: Backport
+http://svn.python.org/view?view=revision&revision=71303
+
+Issue #2254: Fix CGIHTTPServer information disclosure.  Relative paths are
+  now collapsed within the url properly before looking in cgi_directories.
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 
+2011/07/19
+
+Index: Python-2.6.6/Lib/CGIHTTPServer.py
+===================================================================
+--- Python-2.6.6.orig/Lib/CGIHTTPServer.py
++++ Python-2.6.6/Lib/CGIHTTPServer.py
+@@ -70,27 +70,20 @@ class CGIHTTPRequestHandler(SimpleHTTPSe
+             return SimpleHTTPServer.SimpleHTTPRequestHandler.send_head(self)
+ 
+     def is_cgi(self):
+-        """Test whether self.path corresponds to a CGI script,
+-        and return a boolean.
++        """Test whether self.path corresponds to a CGI script.
+ 
+-        This function sets self.cgi_info to a tuple (dir, rest)
+-        when it returns True, where dir is the directory part before
+-        the CGI script name.  Note that rest begins with a
+-        slash if it is not empty.
+-
+-        The default implementation tests whether the path
+-        begins with one of the strings in the list
+-        self.cgi_directories (and the next character is a '/'
+-        or the end of the string).
++        Returns True and updates the cgi_info attribute to the tuple
++        (dir, rest) if self.path requires running a CGI script.
++        Returns False otherwise.
++
++        The default implementation tests whether the normalized url
++        path begins with one of the strings in self.cgi_directories
++        (and the next character is a '/' or the end of the string).
+         """
+-
+-        path = self.path
+-
+-        for x in self.cgi_directories:
+-            i = len(x)
+-            if path[:i] == x and (not path[i:] or path[i] == '/'):
+-                self.cgi_info = path[:i], path[i+1:]
+-                return True
++        splitpath = _url_collapse_path_split(self.path)
++        if splitpath[0] in self.cgi_directories:
++            self.cgi_info = splitpath
++            return True
+         return False
+ 
+     cgi_directories = ['/cgi-bin', '/htbin']
+@@ -299,6 +292,46 @@ class CGIHTTPRequestHandler(SimpleHTTPSe
+                 self.log_message("CGI script exited OK")
+ 
+ 
++# TODO(gregory.p.smith): Move this into an appropriate library.
++def _url_collapse_path_split(path):
++    """
++    Given a URL path, remove extra '/'s and '.' path elements and collapse
++    any '..' references.
++
++    Implements something akin to RFC-2396 5.2 step 6 to parse relative paths.
++
++    Returns: A tuple of (head, tail) where tail is everything after the final /
++    and head is everything before it.  Head will always start with a '/' and,
++    if it contains anything else, never have a trailing '/'.
++
++    Raises: IndexError if too many '..' occur within the path.
++    """
++    # Similar to os.path.split(os.path.normpath(path)) but specific to URL
++    # path semantics rather than local operating system semantics.
++    path_parts = []
++    for part in path.split('/'):
++        if part == '.':
++            path_parts.append('')
++        else:
++            path_parts.append(part)
++    # Filter out blank non trailing parts before consuming the '..'.
++    path_parts = [part for part in path_parts[:-1] if part] + path_parts[-1:]
++    if path_parts:
++        tail_part = path_parts.pop()
++    else:
++        tail_part = ''
++    head_parts = []
++    for part in path_parts:
++        if part == '..':
++            head_parts.pop()
++        else:
++            head_parts.append(part)
++    if tail_part and tail_part == '..':
++        head_parts.pop()
++        tail_part = ''
++    return ('/' + '/'.join(head_parts), tail_part)
++
++
+ nobody = None
+ 
+ def nobody_uid():
+Index: Python-2.6.6/Lib/test/test_httpservers.py
+===================================================================
+--- Python-2.6.6.orig/Lib/test/test_httpservers.py
++++ Python-2.6.6/Lib/test/test_httpservers.py
+@@ -7,6 +7,7 @@ Josip Dzolonga, and Michael Otteneder fo
+ from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
+ from SimpleHTTPServer import SimpleHTTPRequestHandler
+ from CGIHTTPServer import CGIHTTPRequestHandler
++import CGIHTTPServer
+ 
+ import os
+ import sys
+@@ -324,6 +325,45 @@ class CGIHTTPServerTestCase(BaseTestCase
+         finally:
+             BaseTestCase.tearDown(self)
+ 
++    def test_url_collapse_path_split(self):
++        test_vectors = {
++            '': ('/', ''),
++            '..': IndexError,
++            '/.//..': IndexError,
++            '/': ('/', ''),
++            '//': ('/', ''),
++            '/\\': ('/', '\\'),
++            '/.//': ('/', ''),
++            'cgi-bin/file1.py': ('/cgi-bin', 'file1.py'),
++            '/cgi-bin/file1.py': ('/cgi-bin', 'file1.py'),
++            'a': ('/', 'a'),
++            '/a': ('/', 'a'),
++            '//a': ('/', 'a'),
++            './a': ('/', 'a'),
++            './C:/': ('/C:', ''),
++            '/a/b': ('/a', 'b'),
++            '/a/b/': ('/a/b', ''),
++            '/a/b/c/..': ('/a/b', ''),
++            '/a/b/c/../d': ('/a/b', 'd'),
++            '/a/b/c/../d/e/../f': ('/a/b/d', 'f'),
++            '/a/b/c/../d/e/../../f': ('/a/b', 'f'),
++            '/a/b/c/../d/e/.././././..//f': ('/a/b', 'f'),
++            '../a/b/c/../d/e/.././././..//f': IndexError,
++            '/a/b/c/../d/e/../../../f': ('/a', 'f'),
++            '/a/b/c/../d/e/../../../../f': ('/', 'f'),
++            '/a/b/c/../d/e/../../../../../f': IndexError,
++            '/a/b/c/../d/e/../../../../f/..': ('/', ''),
++        }
++        for path, expected in test_vectors.iteritems():
++            if isinstance(expected, type) and issubclass(expected, Exception):
++                self.assertRaises(expected,
++                                  CGIHTTPServer._url_collapse_path_split, path)
++            else:
++                actual = CGIHTTPServer._url_collapse_path_split(path)
++                self.assertEquals(expected, actual,
++                                  msg='path = %r\nGot:    %r\nWanted: %r' % (
++                                  path, actual, expected))
++
+     def test_headers_and_content(self):
+         res = self.request('/cgi-bin/file1.py')
+         self.assertEquals(('Hello World\n', 'text/html', 200), \
+@@ -348,6 +388,12 @@ class CGIHTTPServerTestCase(BaseTestCase
+         self.assertEquals(('Hello World\n', 'text/html', 200), \
+              (res.read(), res.getheader('Content-type'), res.status))
+ 
++    def test_no_leading_slash(self):
++        # http://bugs.python.org/issue2254
++        res = self.request('cgi-bin/file1.py')
++        self.assertEquals(('Hello World\n', 'text/html', 200),
++             (res.read(), res.getheader('Content-type'), res.status))
++
+ 
+ def test_main(verbose=None):
+     cwd = os.getcwd()
+Index: Python-2.6.6/Misc/NEWS
+===================================================================
+--- Python-2.6.6.orig/Misc/NEWS
++++ Python-2.6.6/Misc/NEWS
+@@ -137,6 +137,9 @@ C-API
+ Library
+ -------
+ 
++- Issue #2254: Fix CGIHTTPServer information disclosure.  Relative paths are
++  now collapsed within the url properly before looking in cgi_directories.
++
+ - Issue #8447: Make distutils.sysconfig follow symlinks in the path to
+   the interpreter executable.  This fixes a failure of test_httpservers
+   on OS X.
diff --git a/meta/recipes-devtools/python/python_2.6.6.bb b/meta/recipes-devtools/python/python_2.6.6.bb
index 800ba04..d5e7d22 100644
--- a/meta/recipes-devtools/python/python_2.6.6.bb
+++ b/meta/recipes-devtools/python/python_2.6.6.bb
@@ -1,7 +1,7 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.8"
+PR = "${INC_PR}.9"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=38fdd546420fab09ac6bd3d8a1c83eb6"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
@@ -18,6 +18,7 @@ SRC_URI = "\
   file://99-ignore-optimization-flag.patch \
   ${DISTRO_SRC_URI} \
   file://multilib.patch \
+  file://security_issue_2254_fix.patch \
 "
 
 SRC_URI[md5sum] = "cf4e6881bb84a7ce6089e4a307f71f14"
-- 
1.7.6



