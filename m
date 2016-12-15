Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 427FF772D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 12:48:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 15 Dec 2016 04:48:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,351,1477983600"; d="scan'208";a="18480827"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2016 04:48:38 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 14:48:02 +0200
Message-Id: <b5c7a1f074bf1ac39ffb366e4707f573a330cf5c.1481805889.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
References: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/16] gnutls: update to 3.5.7
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
X-List-Received-Date: Thu, 15 Dec 2016 12:48:37 -0000

Add a 0001-Do-not-add-cli-args.h-to-cli-args.stamp-Makefile-tar.patch
to fix a compile issue (incorrect creation of an empty header).

Add a libunistring dependency as gnutls has gained it.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/gnutls/gnutls.inc             |  2 +-
 ...cli-args.h-to-cli-args.stamp-Makefile-tar.patch | 27 ++++++++++++++++++++++
 .../correct_rpl_gettimeofday_signature.patch       | 11 +++++----
 .../gnutls/{gnutls_3.5.6.bb => gnutls_3.5.7.bb}    |  5 ++--
 4 files changed, 37 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-Do-not-add-cli-args.h-to-cli-args.stamp-Makefile-tar.patch
 rename meta/recipes-support/gnutls/{gnutls_3.5.6.bb => gnutls_3.5.7.bb} (48%)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 51b9d2b..883c8be 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
                     file://doc/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://doc/COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-DEPENDS = "nettle gmp virtual/libiconv"
+DEPENDS = "nettle gmp virtual/libiconv libunistring"
 DEPENDS_append_libc-musl = " argp-standalone"
 
 SHRT_VER = "${@d.getVar('PV', True).split('.')[0]}.${@d.getVar('PV', True).split('.')[1]}"
diff --git a/meta/recipes-support/gnutls/gnutls/0001-Do-not-add-cli-args.h-to-cli-args.stamp-Makefile-tar.patch b/meta/recipes-support/gnutls/gnutls/0001-Do-not-add-cli-args.h-to-cli-args.stamp-Makefile-tar.patch
new file mode 100644
index 0000000..0990810
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-Do-not-add-cli-args.h-to-cli-args.stamp-Makefile-tar.patch
@@ -0,0 +1,27 @@
+From 68ef47ab3472472780939671731c295481b5535f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 14 Dec 2016 17:42:45 +0200
+Subject: [PATCH] Do not add cli-args.h to cli-args.stamp Makefile target
+
+Upstream-Status: Submitted [https://gitlab.com/gnutls/gnutls/issues/155]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 49d3af3..827638e 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -261,7 +261,7 @@ cli-debug-args.stamp: $(srcdir)/cli-debug-args.def $(srcdir)/args-std.def
+ 
+ cli-args.h: cli-args.stamp
+ cli-args.c: cli-args.stamp
+-cli-args.stamp cli-args.h: $(srcdir)/cli-args.def $(srcdir)/args-std.def
++cli-args.stamp: $(srcdir)/cli-args.def $(srcdir)/args-std.def
+ 	-$(AUTOGEN) $<
+ 	touch $@
+ 
+-- 
+2.10.2
+
diff --git a/meta/recipes-support/gnutls/gnutls/correct_rpl_gettimeofday_signature.patch b/meta/recipes-support/gnutls/gnutls/correct_rpl_gettimeofday_signature.patch
index 5e452c5..96b023a 100644
--- a/meta/recipes-support/gnutls/gnutls/correct_rpl_gettimeofday_signature.patch
+++ b/meta/recipes-support/gnutls/gnutls/correct_rpl_gettimeofday_signature.patch
@@ -1,7 +1,7 @@
-From ae3370788ed3447bba16969d9eb1bf1b9631e1b7 Mon Sep 17 00:00:00 2001
+From 81b0f04c14f673b99778d2e7d8e85461e0bf2018 Mon Sep 17 00:00:00 2001
 From: Valentin Popa <valentin.popa@intel.com>
 Date: Fri, 25 Apr 2014 13:58:55 +0300
-Subject: [PATCH] Correct rpl_gettimeofday signature
+Subject: [PATCH 1/3] Correct rpl_gettimeofday signature
 
 Currently we fail on uclibc like below
 
@@ -29,12 +29,13 @@ eglibc otherwise we will have same issue there too
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Pending
+
 ---
  gl/sys_time.in.h | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/gl/sys_time.in.h b/gl/sys_time.in.h
-index 84a17c9..6ceadc3 100644
+index 5a8caf3..2dc5718 100644
 --- a/gl/sys_time.in.h
 +++ b/gl/sys_time.in.h
 @@ -93,20 +93,20 @@ struct timeval
@@ -61,7 +62,7 @@ index 84a17c9..6ceadc3 100644
 +                       (struct timeval *__restrict, void *__restrict));
  # endif
  _GL_CXXALIASWARN (gettimeofday);
- #elif defined GNULIB_POSIXCHECK
+ # if defined __cplusplus && defined GNULIB_NAMESPACE
 -- 
-1.9.1
+2.10.2
 
diff --git a/meta/recipes-support/gnutls/gnutls_3.5.6.bb b/meta/recipes-support/gnutls/gnutls_3.5.7.bb
similarity index 48%
rename from meta/recipes-support/gnutls/gnutls_3.5.6.bb
rename to meta/recipes-support/gnutls/gnutls_3.5.7.bb
index 2e70734..cf77a20 100644
--- a/meta/recipes-support/gnutls/gnutls_3.5.6.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.5.7.bb
@@ -3,7 +3,8 @@ require gnutls.inc
 SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
             file://0001-configure.ac-fix-sed-command.patch \
             file://use-pkg-config-to-locate-zlib.patch \
+            file://0001-Do-not-add-cli-args.h-to-cli-args.stamp-Makefile-tar.patch \
            "
-SRC_URI[md5sum] = "7a38b23757aae009c3eb5bb12fb0afda"
-SRC_URI[sha256sum] = "6338b715bf31c758606ffa489c7f87ee1beab947114fbd2ffefd73170a8c6b9a"
+SRC_URI[md5sum] = "08ad2c539bc1d91283f610539deef34e"
+SRC_URI[sha256sum] = "60cbfc119e6268cfa38d712621daa473298a0c5b129c0842caec4c1ed4d7861a"
 
-- 
2.10.2


