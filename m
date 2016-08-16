Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4E68977087
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 04:45:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9958319"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Aug 2016 12:44:54 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8DCDB42BC503
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 12:44:50 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 16 Aug 2016 12:44:48 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Aug 2016 00:44:46 -0400
Message-ID: <1471322686-1783-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 8DCDB42BC503.A7BF6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] createrepo: 0.4.11 -> 0.10.4
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
X-List-Received-Date: Tue, 16 Aug 2016 04:45:04 -0000
Content-Type: text/plain

1) Upgrade createrepo from 0.4.11 to 0.10.4.
2) Delete some patches, since they are no use.
    createrepo-rpm549.patch 
    recommends.patch 
    createrepo-dbpath.patch 
    dumpMetadata-disable-signature-validation.patch 
    fixstat.patch

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../createrepo/createrepo/fix-native-install.patch | 29 +++++++-------
 ...n-scripts-should-use-interpreter-from-env.patch | 44 +++++++++++-----------
 .../{createrepo_0.4.11.bb => createrepo_0.10.4.bb} | 11 ++----
 3 files changed, 42 insertions(+), 42 deletions(-)
 rename meta/recipes-support/createrepo/{createrepo_0.4.11.bb => createrepo_0.10.4.bb} (80%)

diff --git a/meta/recipes-support/createrepo/createrepo/fix-native-install.patch b/meta/recipes-support/createrepo/createrepo/fix-native-install.patch
index d8202a4..feb91eb 100644
--- a/meta/recipes-support/createrepo/createrepo/fix-native-install.patch
+++ b/meta/recipes-support/createrepo/createrepo/fix-native-install.patch
@@ -12,7 +12,7 @@ diff --git a/Makefile b/Makefile
 index b2d1a32..3c3639f 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -3,22 +3,22 @@ VERSION = 0.4.11
+@@ -11,22 +11,22 @@ PYFILES = $(wildcard *.py)
  SHELL = /bin/sh
  top_srcdir = .
  srcdir = .
@@ -46,9 +46,9 @@ index b2d1a32..3c3639f 100644
  oldincludedir = /usr/include
 -mandir = ${prefix}/share/man
 +mandir ?= ${prefix}/share/man
- 
- pkgdatadir = $(datadir)/$(PACKAGE)
- pkglibdir = $(libdir)/$(PACKAGE)
+ compdir = $(shell pkg-config --variable=completionsdir bash-completion)
+ compdir := $(or $(compdir), "/etc/bash_completion.d")
+
 diff --git a/bin/Makefile b/bin/Makefile
 index 52c1f50..e30610e 100644
 --- a/bin/Makefile
@@ -90,19 +90,22 @@ index 52c1f50..e30610e 100644
  
  pkgdatadir = $(datadir)/$(PACKAGE)
  pkglibdir = $(libdir)/$(PACKAGE)
-@@ -40,8 +40,11 @@ all: $(srcdir)/$(PACKAGE)
- 
- 
+@@ -41,9 +41,13 @@ all:
+
+
  install: all installdirs
--	$(INSTALL_BIN) $(srcdir)/$(PACKAGE) $(DESTDIR)$(bindir)/$(PACKAGE)
+-	$(INSTALL_BIN) $(srcdir)/$(PKGNAME) $(DESTDIR)$(bindir)/$(PKGNAME)
 -	$(INSTALL_BIN) $(srcdir)/modifyrepo $(DESTDIR)$(bindir)/modifyrepo
-+	sed -e "s|@DATADIR@|$(datadir)|" $(srcdir)/$(PACKAGE) > $(srcdir)/$(PACKAGE).tmp
+-	$(INSTALL_BIN) $(srcdir)/mergerepo $(DESTDIR)$(bindir)/mergerepo
++	sed -e "s|@DATADIR@|$(datadir)|" $(srcdir)/$(PKGNAME) > $(srcdir)/$(PKGNAME).tmp
 +	sed -e "s|@DATADIR@|$(datadir)|" $(srcdir)/modifyrepo > $(srcdir)/modifyrepo.tmp
-+	$(INSTALL_BIN) $(srcdir)/$(PACKAGE).tmp $(DESTDIR)$(bindir)/$(PACKAGE)
++	sed -e "s|@DATADIR@|$(datadir)|" $(srcdir)/mergerepo > $(srcdir)/mergerepo.tmp
++	$(INSTALL_BIN) $(srcdir)/$(PKGNAME).tmp $(DESTDIR)$(bindir)/$(PKGNAME)
 +	$(INSTALL_BIN) $(srcdir)/modifyrepo.tmp $(DESTDIR)$(bindir)/modifyrepo
-+	rm -f $(srcdir)/$(PACKAGE).tmp $(srcdir)/modifyrepo.tmp
- 
- 
++	$(INSTALL_BIN) $(srcdir)/mergerepo.tmp $(DESTDIR)$(bindir)/mergerepo
++	rm -f $(srcdir)/$(PKGNAME).tmp $(srcdir)/modifyrepo.tmp $(srcdir)/mergerepo.tmp
+
+
  uninstall:
 diff --git a/bin/createrepo b/bin/createrepo
 index b0de515..eaacb39 100755
diff --git a/meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch b/meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch
index 80205a1..e1d0e26 100644
--- a/meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch
+++ b/meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch
@@ -5,43 +5,43 @@ host.
 
 Upstream-Status: Inappropriate [configuration]
 
-Index: createrepo-0.4.11/genpkgmetadata.py
+Index: createrepo-0.10.4/genpkgmetadata.py
 ===================================================================
---- createrepo-0.4.11.orig/genpkgmetadata.py	2012-04-10 17:14:05.278649384 +0300
-+++ createrepo-0.4.11/genpkgmetadata.py	2012-04-10 17:14:22.290648886 +0300
+--- createrepo-0.10.4.orig/genpkgmetadata.py	2012-04-10 17:14:05.278649384 +0300
++++ createrepo-0.10.4/genpkgmetadata.py	2012-04-10 17:14:22.290648886 +0300
 @@ -1,4 +1,4 @@
 -#!/usr/bin/python -t
 +#! /usr/bin/env python
  # primary functions and glue for generating the repository metadata
  #
  
-Index: createrepo-0.4.11/modifyrepo.py
+Index: createrepo-0.10.4/modifyrepo.py
 ===================================================================
---- createrepo-0.4.11.orig/modifyrepo.py	2012-04-10 17:14:09.106649272 +0300
-+++ createrepo-0.4.11/modifyrepo.py	2012-04-10 17:14:27.818648725 +0300
+--- createrepo-0.10.4.orig/modifyrepo.py	2012-04-10 17:14:09.106649272 +0300
++++ createrepo-0.10.4/modifyrepo.py	2012-04-10 17:14:27.818648725 +0300
 @@ -1,4 +1,4 @@
--#!/usr/bin/env python
+-#!/usr/bin/python
 +#! /usr/bin/env python
- # $Id$
- #
- # This tools is used to insert arbitrary metadata into an RPM repository.
-Index: createrepo-0.4.11/dumpMetadata.py
+ # This tool is used to manipulate arbitrary metadata in a RPM repository.
+ # Example:
+ #           ./modifyrepo.py updateinfo.xml myrepo/repodata
+Index: createrepo-0.10.4/mergerepo.py
 ===================================================================
---- createrepo-0.4.11.orig/dumpMetadata.py	2012-04-10 17:19:23.874640068 +0300
-+++ createrepo-0.4.11/dumpMetadata.py	2012-04-10 17:19:34.502639756 +0300
+--- createrepo-0.10.4.orig/mergerepo.py	2012-04-10 17:19:23.874640068 +0300
++++ createrepo-0.10.4/mergerepo.py	2012-04-10 17:19:34.502639756 +0300
 @@ -1,4 +1,4 @@
--#!/usr/bin/python -t
+-#!/usr/bin/python -tt
 +#! /usr/bin/env python
- # base classes and functions for dumping out package Metadata
- #
  # This program is free software; you can redistribute it and/or modify
-Index: createrepo-0.4.11/readMetadata.py
+ # it under the terms of the GNU General Public License as published by
+ # the Free Software Foundation; either version 2 of the License, or
+Index: createrepo-0.10.4/worker.py
 ===================================================================
---- createrepo-0.4.11.orig/readMetadata.py	2012-04-10 17:19:19.626640193 +0300
-+++ createrepo-0.4.11/readMetadata.py	2012-04-10 17:19:40.198639590 +0300
+--- createrepo-0.10.4.orig/worker.py	2012-04-10 17:19:19.626640193 +0300
++++ createrepo-0.10.4/worker.py	2012-04-10 17:19:40.198639590 +0300
 @@ -1,4 +1,4 @@
--#!/usr/bin/python -t
+-#!/usr/bin/python -tt
 +#! /usr/bin/env python
  
- # This program is free software; you can redistribute it and/or modify
- # it under the terms of the GNU General Public License as published by
+ import sys
+ import yum
diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.10.4.bb
similarity index 80%
rename from meta/recipes-support/createrepo/createrepo_0.4.11.bb
rename to meta/recipes-support/createrepo/createrepo_0.10.4.bb
index 2a3231b..1d599c4 100644
--- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
+++ b/meta/recipes-support/createrepo/createrepo_0.10.4.bb
@@ -14,18 +14,14 @@ PR = "r9"
 SRC_URI = "http://createrepo.baseurl.org/download/${BP}.tar.gz \
            file://fix-native-install.patch \
            file://python-scripts-should-use-interpreter-from-env.patch \
-           file://createrepo-rpm549.patch \
-           file://recommends.patch \
-           file://createrepo-dbpath.patch \
-           file://dumpMetadata-disable-signature-validation.patch \
            file://rpm-createsolvedb.py \
-           file://fixstat.patch \
            "
 
-SRC_URI[md5sum] = "3e9ccf4abcffe3f49af078c83611eda2"
-SRC_URI[sha256sum] = "a73ae11a0dcde8bde36d900bc3f7f8f1083ba752c70a5c61b72d1e1e7608f21b"
+SRC_URI[md5sum] = "1f499e055d64f03127aea3ae84c9ef1a"
+SRC_URI[sha256sum] = "f850504a3ec7e556aaaa626d487e8b0def84ffea666fd30774cbbd575c128261"
 
 BBCLASSEXTEND = "native"
+BBCLASSEXTEND += " nativesdk"
 
 do_install () {
 	oe_runmake -e 'DESTDIR=${D}' install
@@ -49,3 +45,4 @@ do_install_append_class-native () {
 			RPM_ETCRPM=${STAGING_ETCDIR_NATIVE}/rpm \
 			RPM_LOCALEDIRRPM=${STAGING_DATADIR_NATIVE}/locale
 }
+FILES_${PN} += "${libdir}/*"
-- 
2.7.4




