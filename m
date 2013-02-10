Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U4WTq-0000NP-Qn
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Feb 2013 13:58:04 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r1ACfrep027421
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 10 Feb 2013 13:41:54 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1U4WED-00075m-3I; Sun, 10 Feb 2013 13:41:53 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Feb 2013 13:41:46 +0100
Message-Id: <7acaf76adbd1f0c29b17da721267392533d3a703.1360499939.git.enrico.scholz@sigma-chemnitz.de>
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
Subject: [PATCH 1/3] lib: implemented oe.path.realpath()
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
X-List-Received-Date: Sun, 10 Feb 2013 12:58:12 -0000

Various parts of the buildsystem have to work with symlinks. Resolving
them is not trivial because they are always relative to a sysroot
directory.

Patch adds a function which returns the destination of a symlink by
assuming a given path as the / toplevel directory.  A testsuite was
added too.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/lib/oe/path.py            | 87 +++++++++++++++++++++++++++++++++++++++++
 meta/lib/oe/tests/test_path.py | 89 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 176 insertions(+)
 create mode 100644 meta/lib/oe/tests/test_path.py

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index ea58bed..0b34ceb 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -2,6 +2,7 @@ import errno
 import glob
 import shutil
 import subprocess
+import os.path
 
 def join(*paths):
     """Like os.path.join but doesn't treat absolute RHS specially"""
@@ -161,3 +162,89 @@ def find(dir, **walkoptions):
     for root, dirs, files in os.walk(dir, **walkoptions):
         for file in files:
             yield os.path.join(root, file)
+
+
+## realpath() related functions
+def __is_path_below(file, root):
+    return (file + os.path.sep).startswith(root)
+
+def __realpath_rel(start, rel_path, root, loop_cnt):
+    """Calculates real path of symlink 'start' + 'rel_path' below
+    'root'; no part of 'start' below 'root' must contain symlinks. """
+    have_dir = True
+
+    for d in rel_path.split(os.path.sep):
+        if not have_dir:
+            raise OSError(errno.ENOENT, "no such directory %s" % start)
+
+        if d == os.path.pardir: # '..'
+            if len(start) >= len(root):
+                # do not follow '..' before root
+                start = os.path.dirname(start)
+            else:
+                # emit warning?
+                pass
+        else:
+            (start, have_dir) = __realpath(os.path.join(start, d),
+                                           root, loop_cnt)
+
+        assert(__is_path_below(start, root))
+
+    return start
+
+def __realpath(file, root, loop_cnt):
+    while os.path.islink(file) and len(file) >= len(root):
+        if loop_cnt == 0:
+            raise OSError(errno.ELOOP, file)
+
+        loop_cnt -= 1
+        target = os.path.normpath(os.readlink(file))
+
+        if not os.path.isabs(target):
+            tdir = os.path.dirname(file)
+            assert(__is_path_below(tdir, root))
+        else:
+            tdir = root
+
+        file = __realpath_rel(tdir, target, root, loop_cnt)
+
+    try:
+        is_dir = os.path.isdir(file)
+    except:
+        is_dir = false
+
+    return (file, is_dir)
+
+def realpath(file, root, use_physdir = True, loop_cnt = 100):
+    """ Returns the canonical path of 'file' with assuming a toplevel
+    'root' directory. When 'use_physdir' is set, all preceding path
+    components of 'file' will be resolved first; this flag should be
+    set unless it is guaranteed that there is no symlink in the path."""
+
+    root = os.path.normpath(root)
+    file = os.path.normpath(file)
+
+    if not root.endswith(os.path.sep):
+        # letting root end with '/' makes some things easier
+        root = root + os.path.sep
+
+    if not __is_path_below(file, root):
+        raise OSError(errno.EINVAL, "file '%s' is not below root" % file)
+
+    try:
+        if use_physdir:
+            file = __realpath_rel(root, file[(len(root) - 1):], root, loop_cnt)
+        else:
+            file = __realpath(file, root, loop_cnt)[0]
+    except OSError, e:
+        if e.errno == errno.ELOOP:
+            # make ELOOP more readable; without catching it, there will
+            # be printed a backtrace with 100s of OSError exceptions
+            # else
+            raise OSError(errno.ELOOP,
+                          "too much recursions while resolving '%s'; loop in '%s'" %
+                          (file, e.strerror))
+
+        raise
+
+    return file
diff --git a/meta/lib/oe/tests/test_path.py b/meta/lib/oe/tests/test_path.py
new file mode 100644
index 0000000..e6aa601
--- /dev/null
+++ b/meta/lib/oe/tests/test_path.py
@@ -0,0 +1,89 @@
+import unittest
+import oe, oe.path
+import tempfile
+import os
+import errno
+import shutil
+
+class TestRealPath(unittest.TestCase):
+    DIRS = [ "a", "b", "etc", "sbin", "usr", "usr/bin", "usr/binX", "usr/sbin", "usr/include", "usr/include/gdbm" ]
+    FILES = [ "etc/passwd", "b/file" ]
+    LINKS = [
+        ( "bin",             "/usr/bin",             "/usr/bin" ),
+        ( "binX",            "usr/binX",             "/usr/binX" ),
+        ( "c",               "broken",               "/broken" ),
+        ( "etc/passwd-1",    "passwd",               "/etc/passwd" ),
+        ( "etc/passwd-2",    "passwd-1",             "/etc/passwd" ),
+        ( "etc/passwd-3",    "/etc/passwd-1",        "/etc/passwd" ),
+        ( "etc/shadow-1",    "/etc/shadow",          "/etc/shadow" ),
+        ( "etc/shadow-2",    "/etc/shadow-1",        "/etc/shadow" ),
+        ( "prog-A",          "bin/prog-A",           "/usr/bin/prog-A" ),
+        ( "prog-B",          "/bin/prog-B",          "/usr/bin/prog-B" ),
+        ( "usr/bin/prog-C",  "../../sbin/prog-C",    "/sbin/prog-C" ),
+        ( "usr/bin/prog-D",  "/sbin/prog-D",         "/sbin/prog-D" ),
+        ( "usr/binX/prog-E", "../sbin/prog-E",       None ),
+        ( "usr/bin/prog-F",  "../../../sbin/prog-F", "/sbin/prog-F" ),
+        ( "loop",            "a/loop",               None ),
+        ( "a/loop",          "../loop",              None ),
+        ( "b/test",          "file/foo",             None ),
+    ]
+
+    LINKS_PHYS = [
+        ( "./",          "/",                "" ),
+        ( "binX/prog-E", "/usr/sbin/prog-E", "/sbin/prog-E" ),
+    ]
+
+    EXCEPTIONS = [
+        ( "loop",   errno.ELOOP ),
+        ( "b/test", errno.ENOENT ),
+    ]
+
+    def __del__(self):
+        try:
+            #os.system("tree -F %s" % self.tmpdir)
+            shutil.rmtree(self.tmpdir)
+        except:
+            pass
+
+    def setUp(self):
+        self.tmpdir = tempfile.mkdtemp(prefix = "oe-test_path")
+        self.root = os.path.join(self.tmpdir, "R")
+
+        os.mkdir(os.path.join(self.tmpdir, "_real"))
+        os.symlink("_real", self.root)
+
+        for d in self.DIRS:
+            os.mkdir(os.path.join(self.root, d))
+        for f in self.FILES:
+            file(os.path.join(self.root, f), "w")
+        for l in self.LINKS:
+            os.symlink(l[1], os.path.join(self.root, l[0]))
+
+    def __realpath(self, file, use_physdir):
+        return oe.path.realpath(os.path.join(self.root, file), self.root, use_physdir)
+
+    def test_norm(self):
+        for l in self.LINKS:
+            if l[2] == None:
+                continue
+
+            target_p = self.__realpath(l[0], True)
+            target_l = self.__realpath(l[0], False)
+
+            if l[2] != False:
+                self.assertEqual(target_p, target_l)
+                self.assertEqual(l[2], target_p[len(self.root):])
+
+    def test_phys(self):
+        for l in self.LINKS_PHYS:
+            target_p = self.__realpath(l[0], True)
+            target_l = self.__realpath(l[0], False)
+
+            self.assertEqual(l[1], target_p[len(self.root):])
+            self.assertEqual(l[2], target_l[len(self.root):])
+
+    def test_loop(self):
+        for e in self.EXCEPTIONS:
+            self.assertRaisesRegexp(OSError, r'\[Errno %u\]' % e[1],
+                                    self.__realpath, e[0], False)
+
-- 
1.7.11.7



