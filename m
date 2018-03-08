Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC76789FB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24054006"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:28 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:52 +0200
Message-Id: <20180308181804.31261-30-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 30/42] apt: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/apt/apt/disable-test.patch   | 23 ++++++++++------------
 .../apt/apt/fix-gcc-4.6-null-not-defined.patch     | 10 ++++++----
 meta/recipes-devtools/apt/apt/makerace.patch       | 10 +++++-----
 meta/recipes-devtools/apt/apt/no-nls-dpkg.patch    | 12 ++++++-----
 meta/recipes-devtools/apt/apt/nodoc.patch          | 12 +++++------
 5 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt/disable-test.patch b/meta/recipes-devtools/apt/apt/disable-test.patch
index 0532671747e..d16b5c771b6 100644
--- a/meta/recipes-devtools/apt/apt/disable-test.patch
+++ b/meta/recipes-devtools/apt/apt/disable-test.patch
@@ -17,10 +17,10 @@ Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
  configure.ac | 7 -------
  2 files changed, 3 insertions(+), 13 deletions(-)
 
-diff --git a/Makefile b/Makefile
-index 7680f08..69527a5 100644
---- a/Makefile
-+++ b/Makefile
+Index: apt-1.2.24/Makefile
+===================================================================
+--- apt-1.2.24.orig/Makefile
++++ apt-1.2.24/Makefile
 @@ -9,8 +9,8 @@ endif
  .PHONY: default
  default: startup all
@@ -32,9 +32,9 @@ index 7680f08..69527a5 100644
  	$(MAKE) -C vendor $@
  	$(MAKE) -C apt-pkg $@
  	$(MAKE) -C apt-inst $@
-@@ -21,8 +21,6 @@ all headers library clean veryclean binary program doc manpages docbook test upd
+@@ -21,8 +21,6 @@ all headers library clean veryclean bina
  	$(MAKE) -C dselect $@
- 	$(MAKE) -C doc $@
+ #	$(MAKE) -C doc $@
  	$(MAKE) -C po $@
 -	# FIXME: -C test has issue swith parallel builds, investigate!
 -	-$(MAKE) -C test $@
@@ -52,10 +52,10 @@ index 7680f08..69527a5 100644
  
  dirs: startup
  
-diff --git a/configure.ac b/configure.ac
-index 1f05da5..e47f459 100644
---- a/configure.ac
-+++ b/configure.ac
+Index: apt-1.2.24/configure.ac
+===================================================================
+--- apt-1.2.24.orig/configure.ac
++++ apt-1.2.24/configure.ac
 @@ -90,13 +90,6 @@ AC_CHECK_LIB(curl, curl_easy_init,
       AC_MSG_ERROR([failed: I need CURL due https support]),
  )
@@ -70,6 +70,3 @@ index 1f05da5..e47f459 100644
  AC_SUBST(BDBLIB)
  
  HAVE_ZLIB=no
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/apt/apt/fix-gcc-4.6-null-not-defined.patch b/meta/recipes-devtools/apt/apt/fix-gcc-4.6-null-not-defined.patch
index 801ae6dddb4..899c6ef2fcf 100644
--- a/meta/recipes-devtools/apt/apt/fix-gcc-4.6-null-not-defined.patch
+++ b/meta/recipes-devtools/apt/apt/fix-gcc-4.6-null-not-defined.patch
@@ -1,12 +1,14 @@
 Upstream-Status: Pending
 
---- a/apt-pkg/contrib/weakptr.h
-+++ b/apt-pkg/contrib/weakptr.h
+Index: apt-1.2.24/apt-pkg/contrib/weakptr.h
+===================================================================
+--- apt-1.2.24.orig/apt-pkg/contrib/weakptr.h
++++ apt-1.2.24/apt-pkg/contrib/weakptr.h
 @@ -21,6 +21,7 @@
  #ifndef WEAK_POINTER_H
  #define WEAK_POINTER_H
  
 +#include <cstdlib>
  #include <set>
- /**
-  * Class for objects providing support for weak pointers.
+ #include <stddef.h>
+ 
diff --git a/meta/recipes-devtools/apt/apt/makerace.patch b/meta/recipes-devtools/apt/apt/makerace.patch
index 46e3161b673..0c686d6e276 100644
--- a/meta/recipes-devtools/apt/apt/makerace.patch
+++ b/meta/recipes-devtools/apt/apt/makerace.patch
@@ -8,16 +8,16 @@ RP 2012/3/19
 
 Upstream-Status: Pending
 
-Index: apt-0.9.9.4/buildlib/library.mak
+Index: apt-1.2.24/buildlib/library.mak
 ===================================================================
---- apt-0.9.9.4.orig/buildlib/library.mak	2013-07-31 15:45:07.320440575 +0300
-+++ apt-0.9.9.4/buildlib/library.mak	2013-07-31 15:46:49.440440561 +0300
-@@ -61,7 +61,7 @@
+--- apt-1.2.24.orig/buildlib/library.mak
++++ apt-1.2.24/buildlib/library.mak
+@@ -65,7 +65,7 @@ $(LIB)/lib$(LIBRARY).so.$(MAJOR).$(MINOR
  
  # Compilation rules
  vpath %.cc $(SUBDIRS)
 -$(OBJ)/%.opic: %.cc $(LIBRARYDEPENDS)
 +$(OBJ)/%.opic: %.cc $(LIBRARYDEPENDS) $($(LOCAL)-HEADERS)
  	echo Compiling $< to $@
- 	$(CXX) -c $(INLINEDEPFLAG) $(CPPFLAGS) $(CXXFLAGS) $(PICFLAGS) -o $@ $<
+ 	$(CXX) -c $(INLINEDEPFLAG) $(CPPFLAGS) $(CXXSTD) $(CXXFLAGS) $(PICFLAGS) -o $@ '$(abspath $<)'
  	$(DoDep)
diff --git a/meta/recipes-devtools/apt/apt/no-nls-dpkg.patch b/meta/recipes-devtools/apt/apt/no-nls-dpkg.patch
index a0996d4d440..98b6c96caac 100644
--- a/meta/recipes-devtools/apt/apt/no-nls-dpkg.patch
+++ b/meta/recipes-devtools/apt/apt/no-nls-dpkg.patch
@@ -1,8 +1,10 @@
 Upstream-Status: Pending
 
---- a/apt-pkg/deb/dpkgpm.cc
-+++ b/apt-pkg/deb/dpkgpm.cc
-@@ -42,6 +42,12 @@
+Index: apt-1.2.24/apt-pkg/deb/dpkgpm.cc
+===================================================================
+--- apt-1.2.24.orig/apt-pkg/deb/dpkgpm.cc
++++ apt-1.2.24/apt-pkg/deb/dpkgpm.cc
+@@ -54,6 +54,12 @@
  #include <apti18n.h>
  									/*}}}*/
  
@@ -14,8 +16,8 @@ Upstream-Status: Pending
 +
  using namespace std;
  
- namespace
-@@ -1279,7 +1285,7 @@ void pkgDPkgPM::WriteApportReport(const
+ APT_PURE static string
+@@ -1703,7 +1709,7 @@ void pkgDPkgPM::WriteApportReport(const
     }
  
     // check if its not a follow up error 
diff --git a/meta/recipes-devtools/apt/apt/nodoc.patch b/meta/recipes-devtools/apt/apt/nodoc.patch
index 449e42df4a9..78cf53884a4 100644
--- a/meta/recipes-devtools/apt/apt/nodoc.patch
+++ b/meta/recipes-devtools/apt/apt/nodoc.patch
@@ -3,16 +3,16 @@ Disable documentation
 Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
-Index: apt-0.9.7.7/Makefile
+Index: apt-1.2.24/Makefile
 ===================================================================
---- apt-0.9.7.7.orig/Makefile
-+++ apt-0.9.7.7/Makefile
-@@ -17,7 +17,7 @@ all headers library clean veryclean bina
+--- apt-1.2.24.orig/Makefile
++++ apt-1.2.24/Makefile
+@@ -19,7 +19,7 @@ all headers library clean veryclean bina
  	$(MAKE) -C cmdline $@
  	$(MAKE) -C ftparchive $@
  	$(MAKE) -C dselect $@
 -	$(MAKE) -C doc $@
 +#	$(MAKE) -C doc $@
  	$(MAKE) -C po $@
- 	$(MAKE) -C test $@
- 
+ 	# FIXME: -C test has issue swith parallel builds, investigate!
+ 	-$(MAKE) -C test $@
-- 
2.16.1


