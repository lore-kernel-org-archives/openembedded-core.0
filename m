Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SOz7L-00084L-IU
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 00:30:52 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2012 15:21:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="138453897"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 30 Apr 2012 15:21:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 15:20:46 -0700
Message-Id: <0b7cb7b85df2e42a682d41f0e311cd97c57f9852.1335824356.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/19] opkg-utils: bump SRCREV for Packages cache fix and other fixes
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
X-List-Received-Date: Mon, 30 Apr 2012 22:30:52 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../opkg-utils/opkg-utils/add-license-field.patch  |   39 -----------
 .../opkg-utils/arfile_header_split.patch           |   27 -------
 .../opkg-utils/index-ignore-filenotfound.patch     |   73 --------------------
 .../opkg-utils/opkg-utils/mtime-int.patch          |   30 --------
 .../opkg-utils/opkg-utils/shebang.patch            |   46 ------------
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    7 +--
 6 files changed, 1 insertions(+), 221 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/add-license-field.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/add-license-field.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/add-license-field.patch
deleted file mode 100644
index 0d33459..0000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/add-license-field.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Add knowledge about License field in ipk headers
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: opkg-utils/opkg.py
-===================================================================
---- opkg-utils.orig/opkg.py	2010-11-01 04:52:35.000000000 -0700
-+++ opkg-utils/opkg.py	2011-07-13 15:18:03.900037344 -0700
-@@ -145,6 +145,7 @@
-         self.priority = None
-         self.tags = None
-         self.fn = fn
-+        self.license = None
- 
-         if fn:
-             # see if it is deb format
-@@ -319,6 +320,12 @@
-     def get_section(self, section):
-         return self.section
- 
-+    def set_license(self, license):
-+        self.license = license
-+
-+    def get_license(self, license):
-+        return self.license
-+
-     def get_file_list(self):
-         if not self.fn:
-             return []
-@@ -425,6 +432,7 @@
-         if self.description: out = out + "Description: %s\n" % (self.description)
-         if self.oe: out = out + "OE: %s\n" % (self.oe)
-         if self.homepage: out = out + "HomePage: %s\n" % (self.homepage)
-+        if self.license: out = out + "License: %s\n" % (self.license)
-         if self.priority: out = out + "Priority: %s\n" % (self.priority)
-         if self.tags: out = out + "Tags: %s\n" % (self.tags)
-         out = out + "\n"
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch
deleted file mode 100644
index b679f8b..0000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From: Scott Anderson <o2e@saaworld.com>
-Subject: ipkg-utils: Make arfile.py handle six digit UIDs
-    
-    Essentially, the problem is that arfile.py is splitting the ar header with
-    white-space instead of fixed-width fields, so two fields would get treated
-    as a single field.  This makes things better than before as it now honors
-    the fixed field widths.
-    
-Upstream-Status: Pending (there is no upstream after openmoko imploded)
-
---- ipkg-utils/arfile.py.orig	2010-09-29 13:38:15.000000000 -0700
-+++ ipkg-utils/arfile.py	2010-10-01 16:06:00.000000000 -0700
-@@ -74,7 +74,12 @@
-             if l == "\n":
-                 l = self.f.readline()
-                 if not l: break
-             l = l.replace('`', '')
--            descriptor = l.split()
-+            # Field lengths from /usr/include/ar.h:
-+            ar_field_lens = [ 16, 12, 6, 6, 8, 10, 2 ]
-+            descriptor = []
-+            for field_len in ar_field_lens:
-+                descriptor.append(l[:field_len].strip())
-+                l = l[field_len:]
- #            print descriptor
-             size = int(descriptor[5])
-             memberName = descriptor[0][:-1]
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
deleted file mode 100644
index f0f0fcf..0000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-If we're building an image and some package rebuilds while this is happening
-some package can be removed/added to the ipk deploy directory. The image will
-not depend on this package so we can safely ignore these cases rather than 
-error out.
-
-RP - 26/8/09
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: opkg-utils/opkg-make-index
-===================================================================
---- opkg-utils.orig/opkg-make-index	2009-08-26 17:21:26.000000000 +0100
-+++ opkg-utils/opkg-make-index	2009-08-27 16:11:22.000000000 +0100
-@@ -96,6 +96,7 @@
- files=glob(pkg_dir + '/*.ipk') + glob(pkg_dir + '/*.deb')
- files.sort()
- for filename in files:
-+  try:
-      basename = os.path.basename(filename)
-      pkg = None
-      fnameStat = os.stat(filename)
-@@ -130,6 +131,12 @@
-                to_morgue(basename)
-           if opt_s:
-                print filename
-+  except OSError:
-+      sys.stderr.write("Package %s disappeared on us!\n" % (filename))
-+      continue
-+  except IOError:
-+      sys.stderr.write("Package %s disappeared on us!\n" % (filename))
-+      continue
- 
- pkgsStampsFile = open(stamplist_filename, "w")
- for f in pkgsStamps.keys():
-@@ -148,6 +155,7 @@
- names = packages.packages.keys()
- names.sort()
- for name in names:
-+  try:
-      pkg = packages.packages[name]
-      if locales_dir and pkg.depends:
-          depends = string.split(pkg.depends, ',')
-@@ -165,6 +173,13 @@
-      if (verbose):
-           sys.stderr.write("Writing info for package %s\n" % (pkg.package,))
-      print pkg
-+  except OSError:
-+      sys.stderr.write("Package %s disappeared on us!\n" % (name))
-+      continue
-+  except IOError:
-+      sys.stderr.write("Package %s disappeared on us!\n" % (name))
-+      continue
-+
- if packages_filename:
-      sys.stdout.close()
-      sys.stdout = old_stdout
-@@ -197,7 +197,15 @@
- names = packages.packages.keys()
- names.sort()
- for name in names:
--     for fn in packages[name].get_file_list():
-+     try:
-+          fnlist = packages[name].get_file_list()
-+     except OSError, e:
-+          sys.stderr.write("Package %s disappeared on us!\n" % (name))
-+          continue
-+     except IOError, e:
-+          sys.stderr.write("Package %s disappeared on us!\n" % (name))
-+          continue
-+     for fn in fnlist:
-           (h,t) = os.path.split(fn)
-           if not t: continue
-           if not files.has_key(t): files[t] = name+':'+fn
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
deleted file mode 100644
index 483a62a..0000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Convert mtime to int before comparing it
-
-The st_mtime attribute (which is a float) is compared against a value
-from the timestamp database, which was stored as an integer there.
-
-When working on a filesystem with precise timestamps the comparision
-will fail nearly everytime hence.
-
-Although it might be possible to enhance the database to store the
-fractional part too, this will complicate things more than we would
-gain by this change.
-
-Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
-
-Upstream-Status: Pending
-(Contacting the original author, no response yet.)
-
-Index: opkg-utils/opkg-make-index
-===================================================================
---- opkg-utils.orig/opkg-make-index
-+++ opkg-utils/opkg-make-index
-@@ -100,7 +100,7 @@ for filename in files:
-      pkg = None
-      fnameStat = os.stat(filename)
-      if old_pkg_hash.has_key(basename):
--          if pkgsStamps.has_key(basename) and fnameStat.st_mtime == pkgsStamps[basename]:
-+          if pkgsStamps.has_key(basename) and int(fnameStat.st_mtime) == pkgsStamps[basename]:
-             if (verbose):
-                sys.stderr.write("Found %s in Packages\n" % (filename,))
-             pkg = old_pkg_hash[basename]
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch
deleted file mode 100644
index f6a2ef9..0000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Use python via the PATH, rather than hardcoding /usr/bin/python
-
-Upstream-Status: Pending
-
-Signed-off-by: Christopher Larson <kergoth@gmail.com>
-
---- opkg-utils.orig/opkg-list-fields
-+++ opkg-utils/opkg-list-fields
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/env python
- 
- import sys, opkg
- 
---- opkg-utils.orig/opkg-make-index
-+++ opkg-utils/opkg-make-index
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/env python
- 
- import sys, os, posixpath
- from glob import glob
---- opkg-utils.orig/opkg-show-deps
-+++ opkg-utils/opkg-show-deps
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/env python
- 
- import sys, os, posixpath
- from glob import glob
---- opkg-utils.orig/opkg-unbuild
-+++ opkg-utils/opkg-unbuild
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/env python
- 
- import sys, os, re
- 
---- opkg-utils.orig/opkg-update-index
-+++ opkg-utils/opkg-update-index
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python2.1
-+#!/usr/bin/env python
- 
- import sys, os
- from glob import glob
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 4fe4038..1996c75 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -6,16 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
-SRCREV = "16665959c330b5958c0f0f4624a9ca7f823f98de"
+SRCREV = "44df9dd3dc411ca1255cb4b23bde7eb71aed4778"
 PV = "0.1.8+git${SRCPV}"
 PR = "r1"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
-           file://index-ignore-filenotfound.patch \
-           file://mtime-int.patch \
-           file://add-license-field.patch \
-           file://arfile_header_split.patch \
-           file://shebang.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
1.7.7.6



