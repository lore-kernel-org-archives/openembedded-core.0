Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U4zCV-0002Zj-OF
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 20:38:03 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r1BJM0mJ018939
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 11 Feb 2013 20:22:01 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1U4ywy-0007dW-CV; Mon, 11 Feb 2013 20:22:00 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2013 20:21:52 +0100
Message-Id: <1360610513-29322-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.11.7
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.9575
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 1/2] lib/oe/path.py: support missing directory components in realpath()
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Feb 2013 19:38:03 -0000

Some use cases in OE operate on symlinks which dangling path components.
Assume that these are directories instead of raising ENOENT.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/lib/oe/path.py            | 26 ++++++++++++++------------
 meta/lib/oe/tests/test_path.py | 10 +++++-----
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 0b34ceb..faa0f61 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -168,13 +168,13 @@ def find(dir, **walkoptions):
 def __is_path_below(file, root):
     return (file + os.path.sep).startswith(root)
 
-def __realpath_rel(start, rel_path, root, loop_cnt):
+def __realpath_rel(start, rel_path, root, loop_cnt, assume_dir):
     """Calculates real path of symlink 'start' + 'rel_path' below
     'root'; no part of 'start' below 'root' must contain symlinks. """
     have_dir = True
 
     for d in rel_path.split(os.path.sep):
-        if not have_dir:
+        if not have_dir and not assume_dir:
             raise OSError(errno.ENOENT, "no such directory %s" % start)
 
         if d == os.path.pardir: # '..'
@@ -186,13 +186,13 @@ def __realpath_rel(start, rel_path, root, loop_cnt):
                 pass
         else:
             (start, have_dir) = __realpath(os.path.join(start, d),
-                                           root, loop_cnt)
+                                           root, loop_cnt, assume_dir)
 
         assert(__is_path_below(start, root))
 
     return start
 
-def __realpath(file, root, loop_cnt):
+def __realpath(file, root, loop_cnt, assume_dir):
     while os.path.islink(file) and len(file) >= len(root):
         if loop_cnt == 0:
             raise OSError(errno.ELOOP, file)
@@ -206,7 +206,7 @@ def __realpath(file, root, loop_cnt):
         else:
             tdir = root
 
-        file = __realpath_rel(tdir, target, root, loop_cnt)
+        file = __realpath_rel(tdir, target, root, loop_cnt, assume_dir)
 
     try:
         is_dir = os.path.isdir(file)
@@ -215,11 +215,13 @@ def __realpath(file, root, loop_cnt):
 
     return (file, is_dir)
 
-def realpath(file, root, use_physdir = True, loop_cnt = 100):
-    """ Returns the canonical path of 'file' with assuming a toplevel
-    'root' directory. When 'use_physdir' is set, all preceding path
-    components of 'file' will be resolved first; this flag should be
-    set unless it is guaranteed that there is no symlink in the path."""
+def realpath(file, root, use_physdir = True, loop_cnt = 100, assume_dir = False):
+    """ Returns the canonical path of 'file' with assuming a
+    toplevel 'root' directory. When 'use_physdir' is set, all
+    preceding path components of 'file' will be resolved first;
+    this flag should be set unless it is guaranteed that there is
+    no symlink in the path. When 'assume_dir' is not set, missing
+    path components will raise an ENOENT error"""
 
     root = os.path.normpath(root)
     file = os.path.normpath(file)
@@ -233,9 +235,9 @@ def realpath(file, root, use_physdir = True, loop_cnt = 100):
 
     try:
         if use_physdir:
-            file = __realpath_rel(root, file[(len(root) - 1):], root, loop_cnt)
+            file = __realpath_rel(root, file[(len(root) - 1):], root, loop_cnt, assume_dir)
         else:
-            file = __realpath(file, root, loop_cnt)[0]
+            file = __realpath(file, root, loop_cnt, assume_dir)[0]
     except OSError, e:
         if e.errno == errno.ELOOP:
             # make ELOOP more readable; without catching it, there will
diff --git a/meta/lib/oe/tests/test_path.py b/meta/lib/oe/tests/test_path.py
index e6aa601..3d41ce1 100644
--- a/meta/lib/oe/tests/test_path.py
+++ b/meta/lib/oe/tests/test_path.py
@@ -25,7 +25,7 @@ class TestRealPath(unittest.TestCase):
         ( "usr/bin/prog-F",  "../../../sbin/prog-F", "/sbin/prog-F" ),
         ( "loop",            "a/loop",               None ),
         ( "a/loop",          "../loop",              None ),
-        ( "b/test",          "file/foo",             None ),
+        ( "b/test",          "file/foo",             "/b/file/foo" ),
     ]
 
     LINKS_PHYS = [
@@ -59,8 +59,9 @@ class TestRealPath(unittest.TestCase):
         for l in self.LINKS:
             os.symlink(l[1], os.path.join(self.root, l[0]))
 
-    def __realpath(self, file, use_physdir):
-        return oe.path.realpath(os.path.join(self.root, file), self.root, use_physdir)
+    def __realpath(self, file, use_physdir, assume_dir = True):
+        return oe.path.realpath(os.path.join(self.root, file), self.root,
+                                use_physdir, assume_dir = assume_dir)
 
     def test_norm(self):
         for l in self.LINKS:
@@ -85,5 +86,4 @@ class TestRealPath(unittest.TestCase):
     def test_loop(self):
         for e in self.EXCEPTIONS:
             self.assertRaisesRegexp(OSError, r'\[Errno %u\]' % e[1],
-                                    self.__realpath, e[0], False)
-
+                                    self.__realpath, e[0], False, False)
-- 
1.7.11.7



