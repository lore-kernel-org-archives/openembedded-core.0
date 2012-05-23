Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzDD-0006Lj-Do
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:13:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 17:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146507159"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 17:03:47 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:03:22 -0700
Message-Id: <b2e66d5a1f680906edc4d113f98777d7a253f985.1337731367.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
References: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731367.git.nitin.a.kamble@intel.com>
References: <cover.1337731367.git.nitin.a.kamble@intel.com>
Subject: [PATCH 07/30] jpeg: fix build with automake 1.12
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
X-List-Received-Date: Wed, 23 May 2012 00:13:59 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../jpeg/jpeg-8c/jpeg_fix_for_automake-1.12.patch  |   41 ++++++++++++++++++++
 meta/recipes-core/jpeg/jpeg_8c.bb                  |    6 ++-
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/jpeg/jpeg-8c/jpeg_fix_for_automake-1.12.patch

diff --git a/meta/recipes-core/jpeg/jpeg-8c/jpeg_fix_for_automake-1.12.patch b/meta/recipes-core/jpeg/jpeg-8c/jpeg_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..e8a2f75
--- /dev/null
+++ b/meta/recipes-core/jpeg/jpeg-8c/jpeg_fix_for_automake-1.12.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Pending
+
+automake 1.12 has deprecated  automatic de-ANSI-fication support
+
+this patch avoids this error with automake 1.12
+
+| configure.ac:32: error: automatic de-ANSI-fication support has been removed
+...
+| automake: warnings are treated as errors
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libjpeg.la': linking libtool libraries using a non-POSIX
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
+
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/02
+
+Index: jpeg-8c/configure.ac
+===================================================================
+--- jpeg-8c.orig/configure.ac
++++ jpeg-8c/configure.ac
+@@ -28,9 +28,6 @@ AM_INIT_AUTOMAKE([-Wall -Werror no-dist
+ # with --disable-silent-rules or use "make V=1".
+ AM_SILENT_RULES([yes])
+ 
+-# This is required when using the de-ANSI-fication feature.
+-AM_C_PROTOTYPES
+-
+ # Add configure option --enable-maintainer-mode which enables
+ # dependency checking and generation useful to package maintainers.
+ # This is made an option to avoid confusing end users.
+@@ -44,6 +41,10 @@ AC_PROG_INSTALL
+ AC_PROG_MAKE_SET
+ AC_PROG_LN_S
+ 
++# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
++m4_pattern_allow([AM_PROG_AR])
++AM_PROG_AR
++
+ # Check if LD supports linker scripts,
+ # and define automake conditional HAVE_LD_VERSION_SCRIPT if so.
+ AC_ARG_ENABLE([ld-version-script],
diff --git a/meta/recipes-core/jpeg/jpeg_8c.bb b/meta/recipes-core/jpeg/jpeg_8c.bb
index 6aeaeaa..c276a51 100644
--- a/meta/recipes-core/jpeg/jpeg_8c.bb
+++ b/meta/recipes-core/jpeg/jpeg_8c.bb
@@ -13,11 +13,13 @@ SECTION = "libs"
 DEPENDS = "libtool-cross"
 DEPENDS_virtclass-native = "libtool-native"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz \
 	   file://debian-libjpeg7_7-1.diff \
-           file://fix_for_automake_1.11.2.patch"
+           file://fix_for_automake_1.11.2.patch \
+           file://jpeg_fix_for_automake-1.12.patch \
+          "
 
 SRC_URI[md5sum] = "a2c10c04f396a9ce72894beb18b4e1f9"
 SRC_URI[sha256sum] = "edfc0b3e004b2fe58ffeeec89f96e3a3c28972c46725ec127d01edf8a1cc7c9a"
-- 
1.7.7



