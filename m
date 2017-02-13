Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 177BA71DA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:05:44 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 07:05:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64546526"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2017 07:05:43 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:05:36 +0200
Message-Id: <61313987c03f1af3ce513cfa48b9aa28dc3244cb.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/36] createrepo: remove the recipe
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
X-List-Received-Date: Mon, 13 Feb 2017 15:05:44 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../createrepo/createrepo/createrepo-dbpath.patch  |  61 --------
 .../createrepo/createrepo/createrepo-rpm549.patch  |  22 ---
 ...dumpMetadata-disable-signature-validation.patch |  31 ----
 .../createrepo/createrepo/fix-native-install.patch | 163 ---------------------
 .../createrepo/createrepo/fixstat.patch            |  19 ---
 ...n-scripts-should-use-interpreter-from-env.patch |  47 ------
 .../createrepo/createrepo/recommends.patch         |  71 ---------
 .../createrepo/createrepo/rpm-createsolvedb.py     |  64 --------
 .../createrepo/createrepo_0.4.11.bb                |  51 -------
 9 files changed, 529 deletions(-)
 delete mode 100644 meta/recipes-support/createrepo/createrepo/createrepo-dbpath.patch
 delete mode 100644 meta/recipes-support/createrepo/createrepo/createrepo-rpm549.patch
 delete mode 100644 meta/recipes-support/createrepo/createrepo/dumpMetadata-disable-signature-validation.patch
 delete mode 100644 meta/recipes-support/createrepo/createrepo/fix-native-install.patch
 delete mode 100644 meta/recipes-support/createrepo/createrepo/fixstat.patch
 delete mode 100644 meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch
 delete mode 100644 meta/recipes-support/createrepo/createrepo/recommends.patch
 delete mode 100755 meta/recipes-support/createrepo/createrepo/rpm-createsolvedb.py
 delete mode 100644 meta/recipes-support/createrepo/createrepo_0.4.11.bb

diff --git a/meta/recipes-support/createrepo/createrepo/createrepo-dbpath.patch b/meta/recipes-support/createrepo/createrepo/createrepo-dbpath.patch
deleted file mode 100644
index 72755981a91..00000000000
--- a/meta/recipes-support/createrepo/createrepo/createrepo-dbpath.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-createrepo: Implement --dbpath command line option
-
---dbpath option allows to specify path to the directory
-with rpm database. By default createrepo uses or creates
-rpm database in /var/lib/rpm/
-
-Upstream-Status: Pending
-
-Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
-
---- createrepo-0.4.11.orig/genpkgmetadata.py 2015-03-30 22:18:19.904000000 +0300
-+++ createrepo-0.4.11/genpkgmetadata.py 2015-03-30 22:28:49.208000000 +0300
-@@ -65,6 +65,7 @@
-      -p, --pretty = output xml files in pretty format.
-      --update = update existing metadata (if present)
-      -d, --database = generate the sqlite databases.
-+     --dbpath <dir> = specify path to rpm db directory.
-     """)
- 
-     sys.exit(retval)
-@@ -72,10 +73,13 @@
- class MetaDataGenerator:
-     def __init__(self, cmds):
-         self.cmds = cmds
--        self.ts = rpm.TransactionSet()
-         self.pkgcount = 0
-         self.files = []
- 
-+        if self.cmds['dbpath']:
-+            rpm.addMacro("_dbpath", self.cmds['dbpath'])
-+        self.ts = rpm.TransactionSet()
-+
-     def _os_path_walk(self, top, func, arg):
-         """Directory tree walk with callback function.
-          copy of os.path.walk, fixes the link/stating problem
-@@ -435,6 +439,7 @@
-     cmds['dir-pattern-match'] = ['.*bin\/.*', '^\/etc\/.*']
-     cmds['skip-symlinks'] = False
-     cmds['pkglist'] = []
-+    cmds['dbpath'] = None
- 
-     try:
-         gopts, argsleft = getopt.getopt(args, 'phqVvndg:s:x:u:c:o:CSi:', ['help', 'exclude=',
-@@ -442,7 +447,7 @@
-                                                                   'baseurl=', 'groupfile=', 'checksum=',
-                                                                   'version', 'pretty', 'split', 'outputdir=',
-                                                                   'noepoch', 'checkts', 'database', 'update',
--                                                                  'skip-symlinks', 'pkglist='])
-+                                                                  'skip-symlinks', 'pkglist=', 'dbpath='])
-     except getopt.error, e:
-         errorprint(_('Options Error: %s.') % e)
-         usage()
-@@ -516,6 +521,8 @@
-                 cmds['skip-symlinks'] = True
-             elif arg in ['-i', '--pkglist']:
-                 cmds['pkglist'] = a
-+            elif arg == '--dbpath':
-+                cmds['dbpath'] = os.path.realpath(a)
-                                 
-     except ValueError, e:
-         errorprint(_('Options Error: %s') % e)
diff --git a/meta/recipes-support/createrepo/createrepo/createrepo-rpm549.patch b/meta/recipes-support/createrepo/createrepo/createrepo-rpm549.patch
deleted file mode 100644
index bc7200d0722..00000000000
--- a/meta/recipes-support/createrepo/createrepo/createrepo-rpm549.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-dumpMetadata.py: Fix for RPM5 - 5.4.9 integration
-
-RPM5 no longer has a switch to disable signature validation.  (Due to security
-validation concerns.)
-
-Upstream-Status: Inappropriate [other]
-  createrepo does not support RPM5 upstream
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff -u createrepo-0.4.11.orig/dumpMetadata.py createrepo-0.4.11/dumpMetadata.py
---- createrepo-0.4.11.orig/dumpMetadata.py	2012-06-05 10:12:55.687964222 -0500
-+++ createrepo-0.4.11/dumpMetadata.py	2012-06-05 10:40:08.154060600 -0500
-@@ -92,7 +92,7 @@
-             fdno = package # let's assume this is an fdno and go with it :)
-     except OSError:
-         raise MDError, "Error opening file"
--    ts.setVSFlags((rpm._RPMVSF_NOSIGNATURES|rpm.RPMVSF_NOMD5|rpm.RPMVSF_NEEDPAYLOAD))
-+    ts.setVSFlags((rpm.RPMVSF_NOMD5|rpm.RPMVSF_NEEDPAYLOAD))
-     try:
-         hdr = ts.hdrFromFdno(fdno)
-     except rpm.error:
diff --git a/meta/recipes-support/createrepo/createrepo/dumpMetadata-disable-signature-validation.patch b/meta/recipes-support/createrepo/createrepo/dumpMetadata-disable-signature-validation.patch
deleted file mode 100644
index 905531f848a..00000000000
--- a/meta/recipes-support/createrepo/createrepo/dumpMetadata-disable-signature-validation.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-dumpMetadata: disable signature validation
-
-Makes it possible to work on RPM repositories that contain signed packages
-without the need of importing the public part of the signing key into the RPM
-database.
-
-Upstream-Status: Pending
-
-Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
----
- dumpMetadata.py | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/dumpMetadata.py b/dumpMetadata.py
-index e40e8ac..ca6a82d 100644
---- a/dumpMetadata.py
-+++ b/dumpMetadata.py
-@@ -92,7 +92,9 @@ def returnHdr(ts, package):
-             fdno = package # let's assume this is an fdno and go with it :)
-     except OSError:
-         raise MDError, "Error opening file"
--    ts.setVSFlags((rpm.RPMVSF_NOMD5|rpm.RPMVSF_NEEDPAYLOAD))
-+    ts.setVSFlags((rpm.RPMVSF_NOMD5|rpm.RPMVSF_NEEDPAYLOAD|
-+                   rpm.RPMVSF_NODSA|rpm.RPMVSF_NORSA|
-+                   rpm.RPMVSF_NODSAHEADER|rpm.RPMVSF_NORSAHEADER))
-     try:
-         hdr = ts.hdrFromFdno(fdno)
-     except rpm.error:
--- 
-2.1.4
-
diff --git a/meta/recipes-support/createrepo/createrepo/fix-native-install.patch b/meta/recipes-support/createrepo/createrepo/fix-native-install.patch
deleted file mode 100644
index d8202a4f7cd..00000000000
--- a/meta/recipes-support/createrepo/createrepo/fix-native-install.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Date: Jan 31, 2011
-
-There are two fixes:
-  1. -native needs to customize prefix
-  2. needs to change python reference in binaries
-
-Signed-off-by: Qing He <qing.he@intel.com>
-
-diff --git a/Makefile b/Makefile
-index b2d1a32..3c3639f 100644
---- a/Makefile
-+++ b/Makefile
-@@ -3,22 +3,22 @@ VERSION = 0.4.11
- SHELL = /bin/sh
- top_srcdir = .
- srcdir = .
--prefix = /usr
--exec_prefix = ${prefix}
--
--bindir = ${exec_prefix}/bin
--sbindir = ${exec_prefix}/sbin
--libexecdir = ${exec_prefix}/libexec
--datadir = ${prefix}/share
--sysconfdir = ${prefix}/etc
--sharedstatedir = ${prefix}/com
--localstatedir = ${prefix}/var
--libdir = ${exec_prefix}/lib
--infodir = ${prefix}/info
-+prefix ?= /usr
-+exec_prefix ?= ${prefix}
-+
-+bindir ?= ${exec_prefix}/bin
-+sbindir ?= ${exec_prefix}/sbin
-+libexecdir ?= ${exec_prefix}/libexec
-+datadir ?= ${prefix}/share
-+sysconfdir ?= ${prefix}/etc
-+sharedstatedir ?= ${prefix}/com
-+localstatedir ?= ${prefix}/var
-+libdir ?= ${exec_prefix}/lib
-+infodir ?= ${prefix}/info
- docdir = 
--includedir = ${prefix}/include
-+includedir ?= ${prefix}/include
- oldincludedir = /usr/include
--mandir = ${prefix}/share/man
-+mandir ?= ${prefix}/share/man
- 
- pkgdatadir = $(datadir)/$(PACKAGE)
- pkglibdir = $(libdir)/$(PACKAGE)
-diff --git a/bin/Makefile b/bin/Makefile
-index 52c1f50..e30610e 100644
---- a/bin/Makefile
-+++ b/bin/Makefile
-@@ -1,22 +1,22 @@
- SHELL = /bin/sh
- top_srcdir = ..
- srcdir = ../bin
--prefix = /usr
--exec_prefix = ${prefix}
--
--bindir = ${exec_prefix}/bin
--sbindir = ${exec_prefix}/sbin
--libexecdir = ${exec_prefix}/libexec
--datadir = ${prefix}/share
--sysconfdir = ${prefix}/etc
--sharedstatedir = ${prefix}/com
--localstatedir = ${prefix}/var
--libdir = ${exec_prefix}/lib
--infodir = ${prefix}/info
-+prefix ?= /usr
-+exec_prefix ?= ${prefix}
-+
-+bindir ?= ${exec_prefix}/bin
-+sbindir ?= ${exec_prefix}/sbin
-+libexecdir ?= ${exec_prefix}/libexec
-+datadir ?= ${prefix}/share
-+sysconfdir ?= ${prefix}/etc
-+sharedstatedir ?= ${prefix}/com
-+localstatedir ?= ${prefix}/var
-+libdir ?= ${exec_prefix}/lib
-+infodir ?= ${prefix}/info
- docdir = 
--includedir = ${prefix}/include
-+includedir ?= ${prefix}/include
- oldincludedir = /usr/include
--mandir = ${prefix}/man
-+mandir ?= ${prefix}/man
- 
- pkgdatadir = $(datadir)/$(PACKAGE)
- pkglibdir = $(libdir)/$(PACKAGE)
-@@ -40,8 +40,11 @@ all: $(srcdir)/$(PACKAGE)
- 
- 
- install: all installdirs
--	$(INSTALL_BIN) $(srcdir)/$(PACKAGE) $(DESTDIR)$(bindir)/$(PACKAGE)
--	$(INSTALL_BIN) $(srcdir)/modifyrepo $(DESTDIR)$(bindir)/modifyrepo
-+	sed -e "s|@DATADIR@|$(datadir)|" $(srcdir)/$(PACKAGE) > $(srcdir)/$(PACKAGE).tmp
-+	sed -e "s|@DATADIR@|$(datadir)|" $(srcdir)/modifyrepo > $(srcdir)/modifyrepo.tmp
-+	$(INSTALL_BIN) $(srcdir)/$(PACKAGE).tmp $(DESTDIR)$(bindir)/$(PACKAGE)
-+	$(INSTALL_BIN) $(srcdir)/modifyrepo.tmp $(DESTDIR)$(bindir)/modifyrepo
-+	rm -f $(srcdir)/$(PACKAGE).tmp $(srcdir)/modifyrepo.tmp
- 
- 
- uninstall:
-diff --git a/bin/createrepo b/bin/createrepo
-index b0de515..eaacb39 100755
---- a/bin/createrepo
-+++ b/bin/createrepo
-@@ -1,2 +1,2 @@
- #!/bin/sh
--exec /usr/share/createrepo/genpkgmetadata.py "$@"
-+exec @DATADIR@/createrepo/genpkgmetadata.py "$@"
-diff --git a/bin/modifyrepo b/bin/modifyrepo
-index c9732d8..6f7c1d4 100755
---- a/bin/modifyrepo
-+++ b/bin/modifyrepo
-@@ -1,2 +1,2 @@
- #!/bin/sh
--exec /usr/share/createrepo/modifyrepo.py "$@"
-+exec @DATADIR@/createrepo/modifyrepo.py "$@"
-diff --git a/docs/Makefile b/docs/Makefile
-index 0a41179..e128c85 100644
---- a/docs/Makefile
-+++ b/docs/Makefile
-@@ -1,22 +1,22 @@
- SHELL = /bin/sh
- top_srcdir = ..
- srcdir = ../docs
--prefix = /usr
--exec_prefix = ${prefix}
--
--bindir = ${exec_prefix}/bin
--sbindir = ${exec_prefix}/sbin
--libexecdir = ${exec_prefix}/libexec
--datadir = ${prefix}/share
--sysconfdir = ${prefix}/etc
--sharedstatedir = ${prefix}/com
--localstatedir = ${prefix}/var
--libdir = ${exec_prefix}/lib
--infodir = ${prefix}/info
-+prefix ?= /usr
-+exec_prefix ?= ${prefix}
-+
-+bindir ?= ${exec_prefix}/bin
-+sbindir ?= ${exec_prefix}/sbin
-+libexecdir ?= ${exec_prefix}/libexec
-+datadir ?= ${prefix}/share
-+sysconfdir ?= ${prefix}/etc
-+sharedstatedir ?= ${prefix}/com
-+localstatedir ?= ${prefix}/var
-+libdir ?= ${exec_prefix}/lib
-+infodir ?= ${prefix}/info
- docdir = 
--includedir = ${prefix}/include
-+includedir ?= ${prefix}/include
- oldincludedir = /usr/include
--mandir = ${datadir}/man
-+mandir ?= ${datadir}/man
- 
- pkgdatadir = $(datadir)/$(PACKAGE)
- pkglibdir = $(libdir)/$(PACKAGE)
diff --git a/meta/recipes-support/createrepo/createrepo/fixstat.patch b/meta/recipes-support/createrepo/createrepo/fixstat.patch
deleted file mode 100644
index d34eb56a8e7..00000000000
--- a/meta/recipes-support/createrepo/createrepo/fixstat.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-When reading the mtime from disk, the system can get a floating point 
-value. Convert this to an int for comparision purposes, else some
-packages always get reindexed as the value in the index is an int.
-RP 2016/3/2
-Upstream-Status: Pending
-
-Index: createrepo-0.4.11/readMetadata.py
-===================================================================
---- createrepo-0.4.11.orig/readMetadata.py
-+++ createrepo-0.4.11/readMetadata.py
-@@ -126,7 +126,7 @@ class MetadataIndex(object):
-             if self.opts.get('verbose'):
-                 print _("Size (%i -> %i) changed for file %s") % (size,st.st_size,filepath)
-             return
--        if st.st_mtime != mtime:
-+        if int(st.st_mtime) != mtime:
-             if self.opts.get('verbose'):
-                 print _("Modification time changed for %s") % filepath
-             return
diff --git a/meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch b/meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch
deleted file mode 100644
index 80205a1507f..00000000000
--- a/meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Author: Andrei Gherzan <andrei@gherzan.ro>
-
-Python interpreter should be use from PATH - native python - and not the one from
-host.
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: createrepo-0.4.11/genpkgmetadata.py
-===================================================================
---- createrepo-0.4.11.orig/genpkgmetadata.py	2012-04-10 17:14:05.278649384 +0300
-+++ createrepo-0.4.11/genpkgmetadata.py	2012-04-10 17:14:22.290648886 +0300
-@@ -1,4 +1,4 @@
--#!/usr/bin/python -t
-+#! /usr/bin/env python
- # primary functions and glue for generating the repository metadata
- #
- 
-Index: createrepo-0.4.11/modifyrepo.py
-===================================================================
---- createrepo-0.4.11.orig/modifyrepo.py	2012-04-10 17:14:09.106649272 +0300
-+++ createrepo-0.4.11/modifyrepo.py	2012-04-10 17:14:27.818648725 +0300
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#! /usr/bin/env python
- # $Id$
- #
- # This tools is used to insert arbitrary metadata into an RPM repository.
-Index: createrepo-0.4.11/dumpMetadata.py
-===================================================================
---- createrepo-0.4.11.orig/dumpMetadata.py	2012-04-10 17:19:23.874640068 +0300
-+++ createrepo-0.4.11/dumpMetadata.py	2012-04-10 17:19:34.502639756 +0300
-@@ -1,4 +1,4 @@
--#!/usr/bin/python -t
-+#! /usr/bin/env python
- # base classes and functions for dumping out package Metadata
- #
- # This program is free software; you can redistribute it and/or modify
-Index: createrepo-0.4.11/readMetadata.py
-===================================================================
---- createrepo-0.4.11.orig/readMetadata.py	2012-04-10 17:19:19.626640193 +0300
-+++ createrepo-0.4.11/readMetadata.py	2012-04-10 17:19:40.198639590 +0300
-@@ -1,4 +1,4 @@
--#!/usr/bin/python -t
-+#! /usr/bin/env python
- 
- # This program is free software; you can redistribute it and/or modify
- # it under the terms of the GNU General Public License as published by
diff --git a/meta/recipes-support/createrepo/createrepo/recommends.patch b/meta/recipes-support/createrepo/createrepo/recommends.patch
deleted file mode 100644
index dc5de2b5b01..00000000000
--- a/meta/recipes-support/createrepo/createrepo/recommends.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-createrepo: implement recommends support
-
-Record against the corresponding requires entry in the output metadata
-if a dependency relationship is marked with the RPMSENSE_MISSINGOK flag
-(indicating it is a recommendation, rather than a hard dependency).
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-diff --git a/dumpMetadata.py b/dumpMetadata.py
-index 70bb2d8..e40e8ac 100644
---- a/dumpMetadata.py
-+++ b/dumpMetadata.py
-@@ -319,6 +319,23 @@ class RpmMetaData:
-                     reqs.append(0)
-         return reqs
- 
-+    def _checkMissingOk(self, flags):
-+        reqs=[]
-+        if flags is None:
-+            return reqs
-+
-+        if type(flags) is not types.ListType:
-+            flags = [flags]
-+        for flag in flags:
-+            newflag = flag
-+            if flag is not None:
-+                newflag = flag & rpm.RPMSENSE_MISSINGOK
-+                if newflag:
-+                    reqs.append(1)
-+                else:
-+                    reqs.append(0)
-+        return reqs
-+
- 
-     def _correctVersion(self, vers):
-         returnvers = []
-@@ -537,9 +554,10 @@ class RpmMetaData:
-         tmpflags = self.hdr[rpm.RPMTAG_REQUIREFLAGS]
-         flags = self._correctFlags(tmpflags)
-         prereq = self._checkPreReq(tmpflags)
-+        missingok = self._checkMissingOk(tmpflags)
-         ver = self._correctVersion(self.hdr[rpm.RPMTAG_REQUIREVERSION])
-         if names is not None:
--            lst = zip(names, flags, ver, prereq)
-+            lst = zip(names, flags, ver, prereq, missingok)
-         return self._uniq(lst)
-         
-     def obsoletesList(self):
-@@ -692,7 +710,7 @@ def generateXML(doc, node, formatns, rpmObj, sumtype):
-     depsList = rpmObj.depsList()
-     if len(depsList) > 0:
-         rpconode = format.newChild(formatns, 'requires', None)    
--        for (name, flags, (e,v,r), prereq) in depsList:
-+        for (name, flags, (e,v,r), prereq, missingok) in depsList:
-             entry = rpconode.newChild(formatns, 'entry', None)
-             entry.newProp('name', name)
-             if flags != 0:
-@@ -711,6 +729,8 @@ def generateXML(doc, node, formatns, rpmObj, sumtype):
-                     entry.newProp('rel', str(r))
-             if prereq == 1:
-                 entry.newProp('pre', str(prereq))
-+            if missingok:
-+                entry.newProp('missingok', '1')
-         
-     for file in rpmObj.usefulFiles():
-         files = format.newChild(None, 'file', None)
--- 
-1.7.9.5
-
diff --git a/meta/recipes-support/createrepo/createrepo/rpm-createsolvedb.py b/meta/recipes-support/createrepo/createrepo/rpm-createsolvedb.py
deleted file mode 100755
index a5b61bade74..00000000000
--- a/meta/recipes-support/createrepo/createrepo/rpm-createsolvedb.py
+++ /dev/null
@@ -1,64 +0,0 @@
-#!/usr/bin/env python
-#
-# This script generates a solution database for a directory containing rpm packages
-# but tries to be efficient about this, only doing so when the packages have changed
-# in some way.
-#
-# It is assumed something already went through and removed all the solvedb.done stamp files
-# in advance.
-#
-# First argument - the rpm binary to use
-# Subsequent arguments - paths to process solution databases for
-#
-
-import sys, os
-import hashlib
-import stat
-import subprocess
-
-if len(sys.argv) < 1:
-    print("Error, rpm command not specified")
-    sys.exit(1)
-
-if len(sys.argv) < 2:
-    print("Error, no paths specified")
-    sys.exit(1)
-
-paths = sys.argv[2:]
-
-for path in paths:
-    if os.path.exists(path + "/solvedb.done"):
-        continue
-    data = ""
-    manifest = []
-    for root, dirs, files in os.walk(path):
-        for file in files:
-            f = os.path.join(root, file)
-            if f.startswith(path + "/" + "solvedb"):
-                continue
-            data = data + str(os.stat(f)[stat.ST_MTIME])
-            manifest.append(f)
-    checksum = hashlib.md5(data).hexdigest()
-
-    if os.path.exists(path + "/solvedb.checksum") and open(path + "/solvedb.checksum", "r").read() == checksum:
-        open(path + "/solvedb.done", "w")
-        continue
-
-    if os.path.exists(path + "/solvedb"):
-        subprocess.call("rm -rf %s" % (path + "/solvedb"), shell=True)
-    os.mkdir(path + "/solvedb")
-    m = open(path + "/solvedb/manifest", "w")
-    m.write("# Dynamically generated solve manifest\n")
-    for f in manifest:
-        m.write(f + "\n")
-    m.close()
-
-    cmd = sys.argv[1] + ' -i --replacepkgs --replacefiles --oldpackage -D "_dbpath ' + path + '/solvedb" --justdb \
-			--noaid --nodeps --noorder --noscripts --notriggers --noparentdirs --nolinktos --stats \
-			--ignoresize --nosignature --nodigest -D "__dbi_txn create nofsync" \
-			' + path + '/solvedb/manifest'
-    subprocess.call(cmd, shell=True)
-
-    open(path + "/solvedb.checksum", "w").write(checksum)
-    open(path + "/solvedb.done", "w")
-
diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
deleted file mode 100644
index 2a3231b3a4a..00000000000
--- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-SUMMARY = "Creates metadata indexes for RPM package repositories"
-HOMEPAGE = "http://createrepo.baseurl.org/"
-
-RECIPE_NO_UPDATE_REASON = "Versions after 0.9.* use YUM, so we hold at 0.4.11"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
-
-DEPENDS_class-native += "libxml2-native rpm-native"
-RDEPENDS_${PN}_class-target = "libxml2-python"
-
-PR = "r9"
-
-SRC_URI = "http://createrepo.baseurl.org/download/${BP}.tar.gz \
-           file://fix-native-install.patch \
-           file://python-scripts-should-use-interpreter-from-env.patch \
-           file://createrepo-rpm549.patch \
-           file://recommends.patch \
-           file://createrepo-dbpath.patch \
-           file://dumpMetadata-disable-signature-validation.patch \
-           file://rpm-createsolvedb.py \
-           file://fixstat.patch \
-           "
-
-SRC_URI[md5sum] = "3e9ccf4abcffe3f49af078c83611eda2"
-SRC_URI[sha256sum] = "a73ae11a0dcde8bde36d900bc3f7f8f1083ba752c70a5c61b72d1e1e7608f21b"
-
-BBCLASSEXTEND = "native"
-
-do_install () {
-	oe_runmake -e 'DESTDIR=${D}' install
-	install -m 0755 ${WORKDIR}/rpm-createsolvedb.py ${D}${bindir}/
-}
-
-# Wrap the python script since the native python is
-# ${bindir}/python-native/python, and the "#! /usr/bin/env python" can't
-# find it since it is not in PATH.
-do_install_append_class-native () {
-	# Not all the python scripts should be wrapped since some of
-	# them are modules (be imported).
-	for i in ${D}${datadir}/createrepo/genpkgmetadata.py \
-		 ${D}${datadir}/createrepo/modifyrepo.py \
-		 ${D}${bindir}/rpm-createsolvedb.py ; do
-		sed -i -e 's|^#!.*/usr/bin/env python|#! /usr/bin/env nativepython|' $i
-	done
-
-	create_wrapper ${D}/${bindir}/createrepo \
-			RPM_USRLIBRPM=${STAGING_LIBDIR_NATIVE}/rpm \
-			RPM_ETCRPM=${STAGING_ETCDIR_NATIVE}/rpm \
-			RPM_LOCALEDIRRPM=${STAGING_DATADIR_NATIVE}/locale
-}
-- 
2.11.0


