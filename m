Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QPjhe-0001h8-MP
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 01:10:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 May 2011 16:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,276,1304319600"; 
   d="scan'208";a="5588270"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.104])
	by orsmga001.jf.intel.com with ESMTP; 26 May 2011 16:07:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 16:07:36 -0700
Message-Id: <421b36c1266ea4f7bde101f00ab89d2239d4ed79.1306451124.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306451124.git.sgw@linux.intel.com>
References: <cover.1306451124.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306451124.git.sgw@linux.intel.com>
References: <cover.1306451124.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 5/9] Revert "createrepo: Update to 0.9.9"
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
X-List-Received-Date: Thu, 26 May 2011 23:10:55 -0000

This was just the wrong update to go to, it was not fully vetted
and contains yum requirements which is not a direction we are moving
in.

This reverts commit 7576eba58cdfebf0606623c25ae969ef52774099.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../createrepo/createrepo/fix-native-install.patch |   88 +++++++++----------
 .../{createrepo_0.9.9.bb => createrepo_0.4.11.bb}  |    7 +-
 2 files changed, 46 insertions(+), 49 deletions(-)
 rename meta/recipes-support/createrepo/{createrepo_0.9.9.bb => createrepo_0.4.11.bb} (73%)

diff --git a/meta/recipes-support/createrepo/createrepo/fix-native-install.patch b/meta/recipes-support/createrepo/createrepo/fix-native-install.patch
index ece205b..d8202a4 100644
--- a/meta/recipes-support/createrepo/createrepo/fix-native-install.patch
+++ b/meta/recipes-support/createrepo/createrepo/fix-native-install.patch
@@ -6,24 +6,19 @@ There are two fixes:
   1. -native needs to customize prefix
   2. needs to change python reference in binaries
 
-Upstream-Status: Inappropriate [native]
-
 Signed-off-by: Qing He <qing.he@intel.com>
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
-Index: createrepo-0.9.9/Makefile
-===================================================================
---- createrepo-0.9.9.orig/Makefile	2011-01-26 09:14:30.000000000 -0800
-+++ createrepo-0.9.9/Makefile	2011-04-06 14:12:06.608923997 -0700
-@@ -10,22 +10,22 @@
+diff --git a/Makefile b/Makefile
+index b2d1a32..3c3639f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -3,22 +3,22 @@ VERSION = 0.4.11
  SHELL = /bin/sh
  top_srcdir = .
  srcdir = .
 -prefix = /usr
 -exec_prefix = ${prefix}
-+prefix ?= /usr
-+exec_prefix ?= ${prefix}
- 
+-
 -bindir = ${exec_prefix}/bin
 -sbindir = ${exec_prefix}/sbin
 -libexecdir = ${exec_prefix}/libexec
@@ -33,6 +28,9 @@ Index: createrepo-0.9.9/Makefile
 -localstatedir = ${prefix}/var
 -libdir = ${exec_prefix}/lib
 -infodir = ${prefix}/info
++prefix ?= /usr
++exec_prefix ?= ${prefix}
++
 +bindir ?= ${exec_prefix}/bin
 +sbindir ?= ${exec_prefix}/sbin
 +libexecdir ?= ${exec_prefix}/libexec
@@ -49,21 +47,19 @@ Index: createrepo-0.9.9/Makefile
 -mandir = ${prefix}/share/man
 +mandir ?= ${prefix}/share/man
  
- pkgdatadir = $(datadir)/$(PKGNAME)
- pkglibdir = $(libdir)/$(PKGNAME)
-Index: createrepo-0.9.9/bin/Makefile
-===================================================================
---- createrepo-0.9.9.orig/bin/Makefile	2011-01-26 09:14:30.000000000 -0800
-+++ createrepo-0.9.9/bin/Makefile	2011-04-06 14:15:07.212923998 -0700
+ pkgdatadir = $(datadir)/$(PACKAGE)
+ pkglibdir = $(libdir)/$(PACKAGE)
+diff --git a/bin/Makefile b/bin/Makefile
+index 52c1f50..e30610e 100644
+--- a/bin/Makefile
++++ b/bin/Makefile
 @@ -1,22 +1,22 @@
  SHELL = /bin/sh
  top_srcdir = ..
  srcdir = ../bin
 -prefix = /usr
 -exec_prefix = ${prefix}
-+prefix ?= /usr
-+exec_prefix ?= ${prefix}
- 
+-
 -bindir = ${exec_prefix}/bin
 -sbindir = ${exec_prefix}/sbin
 -libexecdir = ${exec_prefix}/libexec
@@ -73,6 +69,9 @@ Index: createrepo-0.9.9/bin/Makefile
 -localstatedir = ${prefix}/var
 -libdir = ${exec_prefix}/lib
 -infodir = ${prefix}/info
++prefix ?= /usr
++exec_prefix ?= ${prefix}
++
 +bindir ?= ${exec_prefix}/bin
 +sbindir ?= ${exec_prefix}/sbin
 +libexecdir ?= ${exec_prefix}/libexec
@@ -89,55 +88,49 @@ Index: createrepo-0.9.9/bin/Makefile
 -mandir = ${prefix}/man
 +mandir ?= ${prefix}/man
  
- pkgdatadir = $(datadir)/$(PKGNAME)
- pkglibdir = $(libdir)/$(PKGNAME)
-@@ -41,9 +41,14 @@
+ pkgdatadir = $(datadir)/$(PACKAGE)
+ pkglibdir = $(libdir)/$(PACKAGE)
+@@ -40,8 +40,11 @@ all: $(srcdir)/$(PACKAGE)
  
  
  install: all installdirs
--	$(INSTALL_BIN) $(srcdir)/$(PKGNAME) $(DESTDIR)$(bindir)/$(PKGNAME)
+-	$(INSTALL_BIN) $(srcdir)/$(PACKAGE) $(DESTDIR)$(bindir)/$(PACKAGE)
 -	$(INSTALL_BIN) $(srcdir)/modifyrepo $(DESTDIR)$(bindir)/modifyrepo
--	$(INSTALL_BIN) $(srcdir)/mergerepo $(DESTDIR)$(bindir)/mergerepo
 +	sed -e "s|@DATADIR@|$(datadir)|" $(srcdir)/$(PACKAGE) > $(srcdir)/$(PACKAGE).tmp
 +	sed -e "s|@DATADIR@|$(datadir)|" $(srcdir)/modifyrepo > $(srcdir)/modifyrepo.tmp
-+	sed -e "s|@DATADIR@|$(datadir)|" $(srcdir)/mergerepo > $(srcdir)/mergerepo.tmp
 +	$(INSTALL_BIN) $(srcdir)/$(PACKAGE).tmp $(DESTDIR)$(bindir)/$(PACKAGE)
 +	$(INSTALL_BIN) $(srcdir)/modifyrepo.tmp $(DESTDIR)$(bindir)/modifyrepo
-+	$(INSTALL_BIN) $(srcdir)/mergerepo.tmp $(DESTDIR)$(bindir)/mergerepo
-+	rm -f $(srcdir)/$(PACKAGE).tmp $(srcdir)/modifyrepo.tmp $(srcdir)/mergerepo.tmp
-+
++	rm -f $(srcdir)/$(PACKAGE).tmp $(srcdir)/modifyrepo.tmp
  
  
  uninstall:
-Index: createrepo-0.9.9/bin/createrepo
-===================================================================
---- createrepo-0.9.9.orig/bin/createrepo	2011-01-26 09:14:30.000000000 -0800
-+++ createrepo-0.9.9/bin/createrepo	2011-04-06 14:12:06.608923997 -0700
+diff --git a/bin/createrepo b/bin/createrepo
+index b0de515..eaacb39 100755
+--- a/bin/createrepo
++++ b/bin/createrepo
 @@ -1,2 +1,2 @@
  #!/bin/sh
 -exec /usr/share/createrepo/genpkgmetadata.py "$@"
 +exec @DATADIR@/createrepo/genpkgmetadata.py "$@"
-Index: createrepo-0.9.9/bin/modifyrepo
-===================================================================
---- createrepo-0.9.9.orig/bin/modifyrepo	2011-01-26 09:14:30.000000000 -0800
-+++ createrepo-0.9.9/bin/modifyrepo	2011-04-06 14:12:06.608923997 -0700
+diff --git a/bin/modifyrepo b/bin/modifyrepo
+index c9732d8..6f7c1d4 100755
+--- a/bin/modifyrepo
++++ b/bin/modifyrepo
 @@ -1,2 +1,2 @@
  #!/bin/sh
 -exec /usr/share/createrepo/modifyrepo.py "$@"
 +exec @DATADIR@/createrepo/modifyrepo.py "$@"
-Index: createrepo-0.9.9/docs/Makefile
-===================================================================
---- createrepo-0.9.9.orig/docs/Makefile	2011-01-26 09:14:30.000000000 -0800
-+++ createrepo-0.9.9/docs/Makefile	2011-04-06 14:12:06.608923997 -0700
+diff --git a/docs/Makefile b/docs/Makefile
+index 0a41179..e128c85 100644
+--- a/docs/Makefile
++++ b/docs/Makefile
 @@ -1,22 +1,22 @@
  SHELL = /bin/sh
  top_srcdir = ..
  srcdir = ../docs
 -prefix = /usr
 -exec_prefix = ${prefix}
-+prefix ?= /usr
-+exec_prefix ?= ${prefix}
- 
+-
 -bindir = ${exec_prefix}/bin
 -sbindir = ${exec_prefix}/sbin
 -libexecdir = ${exec_prefix}/libexec
@@ -147,6 +140,9 @@ Index: createrepo-0.9.9/docs/Makefile
 -localstatedir = ${prefix}/var
 -libdir = ${exec_prefix}/lib
 -infodir = ${prefix}/info
++prefix ?= /usr
++exec_prefix ?= ${prefix}
++
 +bindir ?= ${exec_prefix}/bin
 +sbindir ?= ${exec_prefix}/sbin
 +libexecdir ?= ${exec_prefix}/libexec
@@ -163,5 +159,5 @@ Index: createrepo-0.9.9/docs/Makefile
 -mandir = ${datadir}/man
 +mandir ?= ${datadir}/man
  
- pkgdatadir = $(datadir)/$(PKGNAME)
- pkglibdir = $(libdir)/$(PKGNAME)
+ pkgdatadir = $(datadir)/$(PACKAGE)
+ pkglibdir = $(libdir)/$(PACKAGE)
diff --git a/meta/recipes-support/createrepo/createrepo_0.9.9.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
similarity index 73%
rename from meta/recipes-support/createrepo/createrepo_0.9.9.bb
rename to meta/recipes-support/createrepo/createrepo_0.4.11.bb
index 89f18f4..ba1d04b 100644
--- a/meta/recipes-support/createrepo/createrepo_0.9.9.bb
+++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
@@ -4,13 +4,14 @@ HOMEPAGE = "http://createrepo.baseurl.org/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI= "http://createrepo.baseurl.org/download/${BP}.tar.gz \
           file://fix-native-install.patch \
          "
-SRC_URI[md5sum] = "10641f19a40e9f633b300e23dde00349"
-SRC_URI[sha256sum] = "ee897463837b299fb20bf6e970f8c5324cd8b7f26ad3675a9938a2d7ae42ff03"
+
+SRC_URI[md5sum] = "3e9ccf4abcffe3f49af078c83611eda2"
+SRC_URI[sha256sum] = "a73ae11a0dcde8bde36d900bc3f7f8f1083ba752c70a5c61b72d1e1e7608f21b"
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.3.4



