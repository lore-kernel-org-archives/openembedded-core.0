Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4BC2978980
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32652013"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:23 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:56:00 +0200
Message-Id: <20180309185614.31113-22-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 22/36] newt: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:23 -0000

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
 meta/recipes-extended/newt/files/cross_ar.patch | 26 ++++++++++++-------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-extended/newt/files/cross_ar.patch b/meta/recipes-extended/newt/files/cross_ar.patch
index 03007aa4f4e..86cc0be1d38 100644
--- a/meta/recipes-extended/newt/files/cross_ar.patch
+++ b/meta/recipes-extended/newt/files/cross_ar.patch
@@ -18,18 +18,19 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  configure.ac | 4 ++++
  2 files changed, 6 insertions(+), 1 deletion(-)
 
-diff --git a/Makefile.in b/Makefile.in
---- a/Makefile.in
-+++ b/Makefile.in
+Index: newt-0.52.20/Makefile.in
+===================================================================
+--- newt-0.52.20.orig/Makefile.in
++++ newt-0.52.20/Makefile.in
 @@ -7,6 +7,7 @@ CFLAGS = @CFLAGS@
  LDFLAGS = @LDFLAGS@
- CPPFLAGS = -D_GNU_SOURCE @CPPFLAGS@ 
+ CPPFLAGS = -D_GNU_SOURCE @CPPFLAGS@
  GNU_LD = @GNU_LD@
 +AR = @AR@
  
  VERSION = @VERSION@
  TAG = r$(subst .,-,$(VERSION))
-@@ -109,7 +110,7 @@ whiptcl.$(SOEXT): $(WHIPTCLOBJS) $(LIBNEWTSH)
+@@ -109,7 +110,7 @@ whiptcl.$(SOEXT): $(WHIPTCLOBJS) $(LIBNE
  	$(CC) -shared $(SHCFLAGS) $(LDFLAGS) -o whiptcl.$(SOEXT) $(WHIPTCLOBJS) -L. -lnewt  $(LIBTCL) -lpopt $(LIBS)
  
  $(LIBNEWT): $(LIBOBJS)
@@ -38,10 +39,10 @@ diff --git a/Makefile.in b/Makefile.in
  
  newt.o $(SHAREDDIR)/newt.o: newt.c Makefile
  
-diff --git a/configure.ac b/configure.ac
-index 92e6da8..cd83d57 100644
---- a/configure.ac
-+++ b/configure.ac
+Index: newt-0.52.20/configure.ac
+===================================================================
+--- newt-0.52.20.orig/configure.ac
++++ newt-0.52.20/configure.ac
 @@ -15,6 +15,10 @@ AC_PROG_INSTALL
  AC_PROG_LN_S
  AC_PROG_GREP
@@ -51,8 +52,5 @@ index 92e6da8..cd83d57 100644
 +AC_DEFUN([AC_PROG_AR], [AC_CHECK_TOOL(AR, ar, :)])
 +AC_PROG_AR
  
- # Are we using GNU ld?
- AC_MSG_CHECKING([for GNU ld])
--- 
-1.8.1.2
-
+ AC_CHECK_SIZEOF([long])
+ AC_CHECK_SIZEOF([long long])
-- 
2.16.1


