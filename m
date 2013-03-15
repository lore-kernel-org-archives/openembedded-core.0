Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UGKAd-00027I-8A for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2013 03:15:20 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2F26nhN008503; Fri, 15 Mar 2013 02:06:49 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KcnJUL3i0esn; Fri, 15 Mar 2013 02:06:49 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2F26bMY008480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 15 Mar 2013 02:06:42 GMT
Message-ID: <1363312663.14476.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Mar 2013 01:57:43 +0000
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: package: Add cachedpath optimisation
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
X-List-Received-Date: Fri, 15 Mar 2013 02:15:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently, various standard library operations like os.walk(),
os.path.isdir() and os.path.islink() each call stat or lstat which
involves a syscall into the kernel. There is no caching since they could
conceivably have changed on disk. The result is that for something like
the do_package task of the kernel we're spending over two minutes making
868,000 individual stat calls for 23,000 files. This is suboptimal.

This patch adds lib/oe/cachedpath.py which are a set of replacement
functions for these operations which use cached stat data rather than
hitting the kernel each time. It gives a nice performance improvement
halving the build time of the kernel do_package.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 4d69caf..9d5b0ad 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -10,7 +10,7 @@ inherit utility-tasks
 inherit metadata_scm
 inherit logging
 
-OE_IMPORTS += "os sys time oe.path oe.utils oe.data oe.package oe.packagegroup oe.sstatesig oe.lsb"
+OE_IMPORTS += "os sys time oe.path oe.utils oe.data oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath"
 OE_IMPORTS[type] = "list"
 
 def oe_import(d):
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 1625ebd..720e2b1 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -729,7 +729,7 @@ python split_and_strip_files () {
     baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir", True))
     if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', True) != '1') and \
             (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
-        for root, dirs, files in os.walk(dvar):
+        for root, dirs, files in oe.cachedpath.walk(dvar):
             for f in files:
                 file = os.path.join(root, f)
                 if file.endswith(".ko") and file.find("/lib/modules/") != -1:
@@ -743,7 +743,7 @@ python split_and_strip_files () {
                     continue
 
                 try:
-                    ltarget = oe.path.realpath(file, dvar, False)
+                    ltarget = oe.cachedpath.realpath(file, dvar, False)
                     s = os.lstat(ltarget)
                 except OSError, (err, strerror):
                     if err != errno.ENOENT:
@@ -969,7 +969,7 @@ python populate_packages () {
     os.chdir(workdir)
 
     unshipped = []
-    for root, dirs, files in os.walk(dvar):
+    for root, dirs, files in oe.cachedpath.walk(dvar):
         dir = root[len(dvar):]
         if not dir:
             dir = os.sep
@@ -1003,7 +1003,7 @@ python package_fixsymlinks () {
         for path in pkgfiles[pkg]:
                 rpath = path[len(inst_root):]
                 pkg_files[pkg].append(rpath)
-                rtarget = oe.path.realpath(path, inst_root, True, assume_dir = True)
+                rtarget = oe.cachedpath.realpath(path, inst_root, True, assume_dir = True)
                 if not os.path.lexists(rtarget):
                     dangling_links[pkg].append(os.path.normpath(rtarget[len(inst_root):]))
 
@@ -1775,6 +1775,9 @@ python do_package () {
     # as any change to rpmdeps requires this to be rerun.
     # PACKAGE_BBCLASS_VERSION = "1"
 
+    # Init cachedpath
+    oe.cachedpath.initcache()
+
     ###########################################################################
     # Sanity test the setup
     ###########################################################################
@@ -1835,7 +1838,7 @@ python do_package () {
     pkgdest = d.getVar('PKGDEST', True)
     for pkg in packages:
         pkgfiles[pkg] = []
-        for walkroot, dirs, files in os.walk(pkgdest + "/" + pkg):
+        for walkroot, dirs, files in oe.cachedpath.walk(pkgdest + "/" + pkg):
             for file in files:
                 pkgfiles[pkg].append(walkroot + os.sep + file)
 
diff --git a/meta/lib/oe/cachedpath.py b/meta/lib/oe/cachedpath.py
new file mode 100644
index 0000000..bc65665
--- /dev/null
+++ b/meta/lib/oe/cachedpath.py
@@ -0,0 +1,190 @@
+#
+# Based on standard python library functions but avoid
+# repeated stat calls. Its assumed the files will not change from under us
+# so we can cache stat calls.
+#
+cachedpathstatcache = {}
+cachedpathlstatcache = {}
+
+import os
+import errno
+import stat
+
+def initcache():
+    global cachedpathstatcache
+    global cachedpathlstatcache
+    cachedpathstatcache = {}
+    cachedpathlstatcache = {}
+
+def callstat(path):
+    if path in cachedpathstatcache:
+        return cachedpathstatcache[path]
+    #bb.error("Statpath:" + path)
+    try:
+        st = os.stat(path)
+        cachedpathstatcache[path] = st
+        return st
+    except os.error:
+        cachedpathstatcache[path] = False
+        return False
+
+def calllstat(path):
+    if path in cachedpathlstatcache:
+        return cachedpathlstatcache[path]
+    #bb.error("LStatpath:" + path)
+    try:
+        st = os.lstat(path)
+        cachedpathlstatcache[path] = st
+        return st
+    except (os.error, AttributeError):
+        cachedpathlstatcache[path] = False
+        return False
+
+# This follows symbolic links, so both islink() and isdir() can be true
+# for the same path ono systems that support symlinks
+def isfile(path):
+    """Test whether a path is a regular file"""
+    st = callstat(path)
+    if not st:
+        return False
+    return stat.S_ISREG(st.st_mode)
+
+# Is a path a directory?
+# This follows symbolic links, so both islink() and isdir()
+# can be true for the same path on systems that support symlinks
+def isdir(s):
+    """Return true if the pathname refers to an existing directory."""
+    st = callstat(s)
+    if not st:
+        return False
+    return stat.S_ISDIR(st.st_mode)
+
+def islink(path):
+    """Test whether a path is a symbolic link"""
+    st = calllstat(path)
+    if not st:
+        return False
+    return stat.S_ISLNK(st.st_mode)
+
+def walk(top, topdown=True, onerror=None, followlinks=False):
+    # Matches os.walk, not os.path.walk()
+
+    # We may not have read permission for top, in which case we can't
+    # get a list of the files the directory contains.  os.path.walk
+    # always suppressed the exception then, rather than blow up for a
+    # minor reason when (say) a thousand readable directories are still
+    # left to visit.  That logic is copied here.
+    try:
+        # Note that listdir and error are globals in this module due
+        # to earlier import-*.
+        names = os.listdir(top)
+    except error, err:
+        if onerror is not None:
+            onerror(err)
+        return
+
+    dirs, nondirs = [], []
+    for name in names:
+        if isdir(os.path.join(top, name)):
+            dirs.append(name)
+        else:
+            nondirs.append(name)
+
+    if topdown:
+        yield top, dirs, nondirs
+    for name in dirs:
+        new_path = os.path.join(top, name)
+        if followlinks or not islink(new_path):
+            for x in walk(new_path, topdown, onerror, followlinks):
+                yield x
+    if not topdown:
+        yield top, dirs, nondirs
+
+
+
+## realpath() related functions
+def __is_path_below(file, root):
+    return (file + os.path.sep).startswith(root)
+
+def __realpath_rel(start, rel_path, root, loop_cnt, assume_dir):
+    """Calculates real path of symlink 'start' + 'rel_path' below
+    'root'; no part of 'start' below 'root' must contain symlinks. """
+    have_dir = True
+
+    for d in rel_path.split(os.path.sep):
+        if not have_dir and not assume_dir:
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
+                                           root, loop_cnt, assume_dir)
+
+        assert(__is_path_below(start, root))
+
+    return start
+
+def __realpath(file, root, loop_cnt, assume_dir):
+    while islink(file) and len(file) >= len(root):
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
+        file = __realpath_rel(tdir, target, root, loop_cnt, assume_dir)
+
+    try:
+        is_dir = isdir(file)
+    except:
+        is_dir = False
+
+    return (file, is_dir)
+
+def realpath(file, root, use_physdir = True, loop_cnt = 100, assume_dir = False):
+    """ Returns the canonical path of 'file' with assuming a
+    toplevel 'root' directory. When 'use_physdir' is set, all
+    preceding path components of 'file' will be resolved first;
+    this flag should be set unless it is guaranteed that there is
+    no symlink in the path. When 'assume_dir' is not set, missing
+    path components will raise an ENOENT error"""
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
+            file = __realpath_rel(root, file[(len(root) - 1):], root, loop_cnt, assume_dir)
+        else:
+            file = __realpath(file, root, loop_cnt, assume_dir)[0]
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




