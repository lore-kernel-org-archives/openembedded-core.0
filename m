Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q7wvY-0008M4-Hy
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 23:39:45 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Apr 2011 14:37:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,319,1299484800"; d="scan'208";a="906923601"
Received: from unknown (HELO localhost) ([10.255.12.228])
	by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2011 14:37:34 -0700
Message-Id: <b0c524eac124b2857a48a93ceb35fdfb34f6b343.1302211549.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302211549.git.sgw@linux.intel.com>
References: <cover.1302211549.git.sgw@linux.intel.com>
Old-Date: Wed, 6 Apr 2011 15:15:56 -0700
Date: Thu, 07 Apr 2011 14:37:34 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 01/11] createrepo: Update to 0.9.9
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
X-List-Received-Date: Thu, 07 Apr 2011 21:39:45 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../createrepo/createrepo/fix-native-install.patch |   88 ++++++++++---------
 .../{createrepo_0.4.11.bb => createrepo_0.9.9.bb}  |    7 +-
 2 files changed, 49 insertions(+), 46 deletions(-)
 rename meta/recipes-support/createrepo/{createrepo_0.4.11.bb => createrepo_0.9.9.bb} (73%)

diff --git a/meta/recipes-support/createrepo/createrepo/fix-native-install.patch b/meta/recipes-support/createrepo/createrepo/fix-native-install.patch
index 2ed2202..53266b5 100644
--- a/meta/recipes-support/createrepo/createrepo/fix-native-install.patch
+++ b/meta/recipes-support/createrepo/createrepo/fix-native-install.patch
@@ -4,19 +4,24 @@ There are two fixes:
   1. -native needs to customize prefix
   2. needs to change python reference in binaries
 
+Upstream-Status: Inappropriate [native]
+
 Signed-off-by: Qing He <qing.he@intel.com>
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
-diff --git a/Makefile b/Makefile
-index b2d1a32..3c3639f 100644
---- a/Makefile
-+++ b/Makefile
-@@ -3,22 +3,22 @@ VERSION = 0.4.11
+Index: createrepo-0.9.9/Makefile
+===================================================================
+--- createrepo-0.9.9.orig/Makefile	2011-01-26 09:14:30.000000000 -0800
++++ createrepo-0.9.9/Makefile	2011-04-06 14:12:06.608923997 -0700
+@@ -10,22 +10,22 @@
  SHELL = /bin/sh
  top_srcdir = .
  srcdir = .
 -prefix = /usr
 -exec_prefix = ${prefix}
--
++prefix ?= /usr
++exec_prefix ?= ${prefix}
+ 
 -bindir = ${exec_prefix}/bin
 -sbindir = ${exec_prefix}/sbin
 -libexecdir = ${exec_prefix}/libexec
@@ -26,9 +31,6 @@ index b2d1a32..3c3639f 100644
 -localstatedir = ${prefix}/var
 -libdir = ${exec_prefix}/lib
 -infodir = ${prefix}/info
-+prefix ?= /usr
-+exec_prefix ?= ${prefix}
-+
 +bindir ?= ${exec_prefix}/bin
 +sbindir ?= ${exec_prefix}/sbin
 +libexecdir ?= ${exec_prefix}/libexec
@@ -45,19 +47,21 @@ index b2d1a32..3c3639f 100644
 -mandir = ${prefix}/share/man
 +mandir ?= ${prefix}/share/man
  
- pkgdatadir = $(datadir)/$(PACKAGE)
- pkglibdir = $(libdir)/$(PACKAGE)
-diff --git a/bin/Makefile b/bin/Makefile
-index 52c1f50..e30610e 100644
---- a/bin/Makefile
-+++ b/bin/Makefile
+ pkgdatadir = $(datadir)/$(PKGNAME)
+ pkglibdir = $(libdir)/$(PKGNAME)
+Index: createrepo-0.9.9/bin/Makefile
+===================================================================
+--- createrepo-0.9.9.orig/bin/Makefile	2011-01-26 09:14:30.000000000 -0800
++++ createrepo-0.9.9/bin/Makefile	2011-04-06 14:15:07.212923998 -0700
 @@ -1,22 +1,22 @@
  SHELL = /bin/sh
  top_srcdir = ..
  srcdir = ../bin
 -prefix = /usr
 -exec_prefix = ${prefix}
--
++prefix ?= /usr
++exec_prefix ?= ${prefix}
+ 
 -bindir = ${exec_prefix}/bin
 -sbindir = ${exec_prefix}/sbin
 -libexecdir = ${exec_prefix}/libexec
@@ -67,9 +71,6 @@ index 52c1f50..e30610e 100644
 -localstatedir = ${prefix}/var
 -libdir = ${exec_prefix}/lib
 -infodir = ${prefix}/info
-+prefix ?= /usr
-+exec_prefix ?= ${prefix}
-+
 +bindir ?= ${exec_prefix}/bin
 +sbindir ?= ${exec_prefix}/sbin
 +libexecdir ?= ${exec_prefix}/libexec
@@ -86,49 +87,55 @@ index 52c1f50..e30610e 100644
 -mandir = ${prefix}/man
 +mandir ?= ${prefix}/man
  
- pkgdatadir = $(datadir)/$(PACKAGE)
- pkglibdir = $(libdir)/$(PACKAGE)
-@@ -40,8 +40,11 @@ all: $(srcdir)/$(PACKAGE)
+ pkgdatadir = $(datadir)/$(PKGNAME)
+ pkglibdir = $(libdir)/$(PKGNAME)
+@@ -41,9 +41,14 @@
  
  
  install: all installdirs
--	$(INSTALL_BIN) $(srcdir)/$(PACKAGE) $(DESTDIR)$(bindir)/$(PACKAGE)
+-	$(INSTALL_BIN) $(srcdir)/$(PKGNAME) $(DESTDIR)$(bindir)/$(PKGNAME)
 -	$(INSTALL_BIN) $(srcdir)/modifyrepo $(DESTDIR)$(bindir)/modifyrepo
+-	$(INSTALL_BIN) $(srcdir)/mergerepo $(DESTDIR)$(bindir)/mergerepo
 +	sed -e "s|@DATADIR@|$(datadir)|" $(srcdir)/$(PACKAGE) > $(srcdir)/$(PACKAGE).tmp
 +	sed -e "s|@DATADIR@|$(datadir)|" $(srcdir)/modifyrepo > $(srcdir)/modifyrepo.tmp
++	sed -e "s|@DATADIR@|$(datadir)|" $(srcdir)/mergerepo > $(srcdir)/mergerepo.tmp
 +	$(INSTALL_BIN) $(srcdir)/$(PACKAGE).tmp $(DESTDIR)$(bindir)/$(PACKAGE)
 +	$(INSTALL_BIN) $(srcdir)/modifyrepo.tmp $(DESTDIR)$(bindir)/modifyrepo
-+	rm -f $(srcdir)/$(PACKAGE).tmp $(srcdir)/modifyrepo.tmp
++	$(INSTALL_BIN) $(srcdir)/mergerepo.tmp $(DESTDIR)$(bindir)/mergerepo
++	rm -f $(srcdir)/$(PACKAGE).tmp $(srcdir)/modifyrepo.tmp $(srcdir)/mergerepo.tmp
++
  
  
  uninstall:
-diff --git a/bin/createrepo b/bin/createrepo
-index b0de515..eaacb39 100755
---- a/bin/createrepo
-+++ b/bin/createrepo
+Index: createrepo-0.9.9/bin/createrepo
+===================================================================
+--- createrepo-0.9.9.orig/bin/createrepo	2011-01-26 09:14:30.000000000 -0800
++++ createrepo-0.9.9/bin/createrepo	2011-04-06 14:12:06.608923997 -0700
 @@ -1,2 +1,2 @@
  #!/bin/sh
 -exec /usr/share/createrepo/genpkgmetadata.py "$@"
 +exec @DATADIR@/createrepo/genpkgmetadata.py "$@"
-diff --git a/bin/modifyrepo b/bin/modifyrepo
-index c9732d8..6f7c1d4 100755
---- a/bin/modifyrepo
-+++ b/bin/modifyrepo
+Index: createrepo-0.9.9/bin/modifyrepo
+===================================================================
+--- createrepo-0.9.9.orig/bin/modifyrepo	2011-01-26 09:14:30.000000000 -0800
++++ createrepo-0.9.9/bin/modifyrepo	2011-04-06 14:12:06.608923997 -0700
 @@ -1,2 +1,2 @@
  #!/bin/sh
 -exec /usr/share/createrepo/modifyrepo.py "$@"
 +exec @DATADIR@/createrepo/modifyrepo.py "$@"
-diff --git a/docs/Makefile b/docs/Makefile
-index 0a41179..e128c85 100644
---- a/docs/Makefile
-+++ b/docs/Makefile
+Index: createrepo-0.9.9/docs/Makefile
+===================================================================
+--- createrepo-0.9.9.orig/docs/Makefile	2011-01-26 09:14:30.000000000 -0800
++++ createrepo-0.9.9/docs/Makefile	2011-04-06 14:12:06.608923997 -0700
 @@ -1,22 +1,22 @@
  SHELL = /bin/sh
  top_srcdir = ..
  srcdir = ../docs
 -prefix = /usr
 -exec_prefix = ${prefix}
--
++prefix ?= /usr
++exec_prefix ?= ${prefix}
+ 
 -bindir = ${exec_prefix}/bin
 -sbindir = ${exec_prefix}/sbin
 -libexecdir = ${exec_prefix}/libexec
@@ -138,9 +145,6 @@ index 0a41179..e128c85 100644
 -localstatedir = ${prefix}/var
 -libdir = ${exec_prefix}/lib
 -infodir = ${prefix}/info
-+prefix ?= /usr
-+exec_prefix ?= ${prefix}
-+
 +bindir ?= ${exec_prefix}/bin
 +sbindir ?= ${exec_prefix}/sbin
 +libexecdir ?= ${exec_prefix}/libexec
@@ -157,5 +161,5 @@ index 0a41179..e128c85 100644
 -mandir = ${datadir}/man
 +mandir ?= ${datadir}/man
  
- pkgdatadir = $(datadir)/$(PACKAGE)
- pkglibdir = $(libdir)/$(PACKAGE)
+ pkgdatadir = $(datadir)/$(PKGNAME)
+ pkglibdir = $(libdir)/$(PKGNAME)
diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.9.9.bb
similarity index 73%
rename from meta/recipes-support/createrepo/createrepo_0.4.11.bb
rename to meta/recipes-support/createrepo/createrepo_0.9.9.bb
index ba1d04b..89f18f4 100644
--- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
+++ b/meta/recipes-support/createrepo/createrepo_0.9.9.bb
@@ -4,14 +4,13 @@ HOMEPAGE = "http://createrepo.baseurl.org/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI= "http://createrepo.baseurl.org/download/${BP}.tar.gz \
           file://fix-native-install.patch \
          "
-
-SRC_URI[md5sum] = "3e9ccf4abcffe3f49af078c83611eda2"
-SRC_URI[sha256sum] = "a73ae11a0dcde8bde36d900bc3f7f8f1083ba752c70a5c61b72d1e1e7608f21b"
+SRC_URI[md5sum] = "10641f19a40e9f633b300e23dde00349"
+SRC_URI[sha256sum] = "ee897463837b299fb20bf6e970f8c5324cd8b7f26ad3675a9938a2d7ae42ff03"
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.1



