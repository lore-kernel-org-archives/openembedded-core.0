Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U7TAq-0004Ma-1P
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 17:02:52 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 18 Feb 2013 07:46:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,688,1355126400"; d="scan'208";a="203616869"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Feb 2013 07:46:19 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 17:47:21 +0200
Message-Id: <1361202441-22679-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] jpeg: upgrade to 9
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
X-List-Received-Date: Mon, 18 Feb 2013 16:02:56 -0000

License checksum change due to:
- version modification
- links modification
- additional license explanations

fix_for_automake_1.12.1.patch: not needed anymore

fix-jmorecfg-boolean-enum.patch: added
- we have to undef TRUE & FALSE in order to define
the boolean enum

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../jpeg/jpeg-8d/fix_for_automake_1.12.1.patch     | 44 ----------------------
 .../{jpeg-8d => jpeg-9}/debian-libjpeg7_7-1.diff   |  0
 .../jpeg/jpeg-9/fix-jmorecfg-boolean-enum.patch    | 19 ++++++++++
 meta/recipes-core/jpeg/{jpeg_8d.bb => jpeg_9.bb}   | 12 +++---
 4 files changed, 25 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-core/jpeg/jpeg-8d/fix_for_automake_1.12.1.patch
 rename meta/recipes-core/jpeg/{jpeg-8d => jpeg-9}/debian-libjpeg7_7-1.diff (100%)
 create mode 100644 meta/recipes-core/jpeg/jpeg-9/fix-jmorecfg-boolean-enum.patch
 rename meta/recipes-core/jpeg/{jpeg_8d.bb => jpeg_9.bb} (81%)

diff --git a/meta/recipes-core/jpeg/jpeg-8d/fix_for_automake_1.12.1.patch b/meta/recipes-core/jpeg/jpeg-8d/fix_for_automake_1.12.1.patch
deleted file mode 100644
index 3a970ea..0000000
--- a/meta/recipes-core/jpeg/jpeg-8d/fix_for_automake_1.12.1.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Upstream-Status: Pending
-
-The support for automatic de-ANSI-fication has been deprecated in
-automake 1.11.2, and will be removed altogether in automake 1.12
-
-This avoids this error:
-| configure.ac:24: automatic de-ANSI-fication support is deprecated
-| autoreconf: automake failed with exit status: 1
-| ERROR: autoreconf execution failed.
-NOTE: package jpeg-native-8c-r2: task do_configure: Failed
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2011/12/28
-
-
-Index: jpeg-8d/configure.ac
-===================================================================
---- jpeg-8d.orig/configure.ac
-+++ jpeg-8d/configure.ac
-@@ -21,7 +21,7 @@ AC_CANONICAL_TARGET
- 
- # Initialize Automake
- # Don't require all the GNU mandated files
--AM_INIT_AUTOMAKE([-Wall -Werror -Wno-obsolete ansi2knr no-dist foreign])
-+AM_INIT_AUTOMAKE([-Wall -Werror -Wno-obsolete no-dist foreign])
- 
- # Make --enable-silent-rules the default.
- # To get verbose build output you may configure
-@@ -29,7 +29,14 @@ AM_INIT_AUTOMAKE([-Wall -Werror -Wno-obs
- AM_SILENT_RULES([yes])
- 
- # This is required when using the de-ANSI-fication feature.
--AM_C_PROTOTYPES
-+#AM_C_PROTOTYPES
-+# add following to avoid this error:
-+#| automake: warnings are treated as errors
-+#| /srv/home/nitin/builds2/build0/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libjpeg.la': linking libtool libraries using a non-POSIX
-+#| /srv/home/nitin/builds2/build0/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
-+#| Makefile.am:65:   while processing Libtool library 'libjpeg.la'
-+#| autoreconf: automake failed with exit status: 1
-+AM_PROG_AR
- 
- # Add configure option --enable-maintainer-mode which enables
- # dependency checking and generation useful to package maintainers.
diff --git a/meta/recipes-core/jpeg/jpeg-8d/debian-libjpeg7_7-1.diff b/meta/recipes-core/jpeg/jpeg-9/debian-libjpeg7_7-1.diff
similarity index 100%
rename from meta/recipes-core/jpeg/jpeg-8d/debian-libjpeg7_7-1.diff
rename to meta/recipes-core/jpeg/jpeg-9/debian-libjpeg7_7-1.diff
diff --git a/meta/recipes-core/jpeg/jpeg-9/fix-jmorecfg-boolean-enum.patch b/meta/recipes-core/jpeg/jpeg-9/fix-jmorecfg-boolean-enum.patch
new file mode 100644
index 0000000..089eb1d
--- /dev/null
+++ b/meta/recipes-core/jpeg/jpeg-9/fix-jmorecfg-boolean-enum.patch
@@ -0,0 +1,19 @@
+TRUE & FALSE have to be undefined in order to define
+the boolean enum
+
+Upstream-Status: Pending
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Index: jpeg-9/jmorecfg.h
+===================================================================
+--- jpeg-9.orig/jmorecfg.h
++++ jpeg-9/jmorecfg.h
+@@ -260,6 +260,8 @@ typedef void noreturn_t;
+ #define TRUE	1
+ #endif
+ #else
++#undef TRUE
++#undef FALSE
+ typedef enum { FALSE = 0, TRUE = 1 } boolean;
+ #endif
+ 
diff --git a/meta/recipes-core/jpeg/jpeg_8d.bb b/meta/recipes-core/jpeg/jpeg_9.bb
similarity index 81%
rename from meta/recipes-core/jpeg/jpeg_8d.bb
rename to meta/recipes-core/jpeg/jpeg_9.bb
index eba5bf4..8d0f541 100644
--- a/meta/recipes-core/jpeg/jpeg_8d.bb
+++ b/meta/recipes-core/jpeg/jpeg_9.bb
@@ -4,21 +4,21 @@ HOMEPAGE = "http://www.ijg.org/"
 BUGTRACKER = ""
 
 LICENSE ="BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://README;md5=4f46756b064c225fae088903300e5c98"
+LIC_FILES_CHKSUM = "file://README;md5=c7b449f4c8fb865866a8fc0231431526"
 
 SECTION = "libs"
 
 DEPENDS = "libtool-cross"
 DEPENDS_class-native = "libtool-native"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz \
-	   file://debian-libjpeg7_7-1.diff \
-           file://fix_for_automake_1.12.1.patch"
+           file://debian-libjpeg7_7-1.diff \
+           file://fix-jmorecfg-boolean-enum.patch"
 
-SRC_URI[md5sum] = "52654eb3b2e60c35731ea8fc87f1bd29"
-SRC_URI[sha256sum] = "00029b1473f0f0ea72fbca3230e8cb25797fbb27e58ae2e46bb8bf5a806fe0b3"
+SRC_URI[md5sum] = "b397211ddfd506b92cd5e02a22ac924d"
+SRC_URI[sha256sum] = "c4e29e9375aaf60b4b79db87a58b063fb5b84f923bee97a88280b3d159e7e535"
 
 inherit autotools 
 
-- 
1.7.11.7



