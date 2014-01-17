Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 156D06E4D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 09:17:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0H9H0vZ008563
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 01:17:00 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 17 Jan 2014 01:17:00 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jan 2014 17:16:51 +0800
Message-ID: <b8e9e0a5f63f86c5c705ce3f3e33a643e64df4a5.1389950168.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1389950168.git.liezhi.yang@windriver.com>
References: <cover.1389950168.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] tcl: fix the TCL_INCLUDE_SPEC
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
X-List-Received-Date: Fri, 17 Jan 2014 09:17:00 -0000
Content-Type: text/plain

We have moved the header files to ${includedir}/tcl${VERSION}, but we
didn't fix the TCL_INCLUDE_SPEC which is still ${includedir}, it should
also be ${includedir}/tcl${VERSION}

Note: this commit modifiey alter-includedir.patch, so it doesn't look
very clear, I only fixed one line in both configure and configure.in:

-eval "TCL_INCLUDE_SPEC=\"-I${includedir}\""
+eval "TCL_INCLUDE_SPEC=\"-I${includedir}/tcl${VERSION}\""

The other changes are because I use git to create the patch while the
previous one uses svn.

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20140117

[YOCTO #5732]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../tcltk/tcl/alter-includedir.patch               | 60 ++++++++++++++++------
 1 file changed, 45 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch b/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
index f543910..c8530e1 100644
--- a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
@@ -5,11 +5,20 @@ Upstream-Status: Inappropriate [Configuration Specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmai.com>
 
-Index: unix/Makefile.in
-===================================================================
---- unix.orig/Makefile.in	2013-11-11 01:00:36.431550403 -0800
-+++ unix/Makefile.in	2013-11-11 01:05:09.587557282 -0800
-@@ -53,7 +53,7 @@
+Fixed the TCL_INCLUDE_SPEC
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile.in  |    2 +-
+ configure    |    4 ++--
+ configure.in |    4 ++--
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 97b983b..dc2a4df 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -53,7 +53,7 @@ DLL_INSTALL_DIR		= @DLL_INSTALL_DIR@
  SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
  
  # Directory in which to install the include file tcl.h:
@@ -18,11 +27,11 @@ Index: unix/Makefile.in
  
  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
-Index: unix/configure.in
-===================================================================
---- unix.orig/configure.in	2013-11-11 01:00:36.467550403 -0800
-+++ unix/configure.in	2013-11-11 01:00:36.503550404 -0800
-@@ -791,7 +791,7 @@
+diff --git a/configure b/configure
+index 3e78b49..24b3f92 100755
+--- a/configure
++++ b/configure
+@@ -19134,7 +19134,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
  TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
@@ -31,11 +40,20 @@ Index: unix/configure.in
  HTML_DIR='$(DISTDIR)/html'
  
  # Note:  in the following variable, it's important to use the absolute
-Index: unix/configure
-===================================================================
---- unix.orig/configure	2013-11-11 01:00:36.467550403 -0800
-+++ unix/configure	2013-11-11 01:00:36.503550404 -0800
-@@ -19134,7 +19134,7 @@
+@@ -19293,7 +19293,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
+ TCL_STUB_LIB_PATH="${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
+ 
+ # Install time header dir can be set via --includedir
+-eval "TCL_INCLUDE_SPEC=\"-I${includedir}\""
++eval "TCL_INCLUDE_SPEC=\"-I${includedir}/tcl${VERSION}\""
+ 
+ #------------------------------------------------------------------------
+ # tclConfig.sh refers to this by a different name
+diff --git a/configure.in b/configure.in
+index 0e28b14..62d9b41 100755
+--- a/configure.in
++++ b/configure.in
+@@ -791,7 +791,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
  TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
@@ -44,3 +62,15 @@ Index: unix/configure
  HTML_DIR='$(DISTDIR)/html'
  
  # Note:  in the following variable, it's important to use the absolute
+@@ -912,7 +912,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
+ TCL_STUB_LIB_PATH="${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
+ 
+ # Install time header dir can be set via --includedir
+-eval "TCL_INCLUDE_SPEC=\"-I${includedir}\""
++eval "TCL_INCLUDE_SPEC=\"-I${includedir}/tcl${VERSION}\""
+ 
+ #------------------------------------------------------------------------
+ # tclConfig.sh refers to this by a different name
+-- 
+1.7.10.4
+
-- 
1.8.3.1


