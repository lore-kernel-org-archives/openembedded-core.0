Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SAUYz-0005CT-MN
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 00:03:30 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Mar 2012 15:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="142824470"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.49])
	by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2012 15:54:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 15:54:34 -0700
Message-Id: <1332370474-21099-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] readline: Fix RPATH Warnings for GPLv2
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
X-List-Received-Date: Wed, 21 Mar 2012 23:03:30 -0000

the norpath.patch with v2 and it worked correctly?
WARNING: QA Issue: readline: /work/i586-poky-linux/readline-5.2-r7/packages-split/readline/usr/lib/libhistory.so.5.2 contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: readline: /work/i586-poky-linux/readline-5.2-r7/packages-split/readline/usr/lib/libreadline.so.5.2 contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: readline: /work/i586-poky-linux/readline-5.2-r7/packages-split/readline/usr/lib/libreadline.so.5 contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: readline: /work/i586-poky-linux/readline-5.2-r7/packages-split/readline/usr/lib/libhistory.so.5 contains probably-redundant RPATH /usr/lib

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/readline/files/norpath.patch     |   21 --------------------
 .../readline-5.2/fix-redundant-rpath.patch         |   21 ++++++++++++++++++++
 .../readline/readline-6.2/norpath.patch            |   21 ++++++++++++++++++++
 meta/recipes-core/readline/readline_5.2.bb         |    5 ++-
 4 files changed, 45 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-core/readline/files/norpath.patch
 create mode 100644 meta/recipes-core/readline/readline-5.2/fix-redundant-rpath.patch
 create mode 100644 meta/recipes-core/readline/readline-6.2/norpath.patch

diff --git a/meta/recipes-core/readline/files/norpath.patch b/meta/recipes-core/readline/files/norpath.patch
deleted file mode 100644
index 5d71582..0000000
--- a/meta/recipes-core/readline/files/norpath.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-This support script ends up hardcoding unnecessary rpaths into the libraries. We
-will search $libdir automatically so this is just wastes space. There may be some
-cases this is necessary but our use cases aren't one of them.
-
-Upstream-Status: Inappropriate
-
-RP 2012/2/23
-
-Index: readline-6.2/support/shobj-conf
-===================================================================
---- readline-6.2.orig/support/shobj-conf	2012-02-23 11:06:37.193179379 +0000
-+++ readline-6.2/support/shobj-conf	2012-02-23 11:06:50.049178918 +0000
-@@ -114,7 +114,7 @@
- 	SHOBJ_LD='${CC}'
- 	SHOBJ_LDFLAGS='-shared -Wl,-soname,$@'
- 
--	SHLIB_XLDFLAGS='-Wl,-rpath,$(libdir) -Wl,-soname,`basename $@ $(SHLIB_MINOR)`'
-+	SHLIB_XLDFLAGS='-Wl,-soname,`basename $@ $(SHLIB_MINOR)`'
- 	SHLIB_LIBVERSION='$(SHLIB_LIBSUFF).$(SHLIB_MAJOR)$(SHLIB_MINOR)'
- 	;;
- 
diff --git a/meta/recipes-core/readline/readline-5.2/fix-redundant-rpath.patch b/meta/recipes-core/readline/readline-5.2/fix-redundant-rpath.patch
new file mode 100644
index 0000000..3166b47
--- /dev/null
+++ b/meta/recipes-core/readline/readline-5.2/fix-redundant-rpath.patch
@@ -0,0 +1,21 @@
+This support script ends up hardcoding unnecessary rpaths into the libraries. We
+will search $libdir automatically so this is just wastes space. There may be some
+cases this is necessary but our use cases aren't one of them.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: readline-5.2/support/shobj-conf
+===================================================================
+--- readline-5.2.orig/support/shobj-conf
++++ readline-5.2/support/shobj-conf
+@@ -110,7 +110,7 @@ linux*-*|gnu*-*|k*bsd*-gnu-*)
+ 	SHOBJ_LD='${CC}'
+ 	SHOBJ_LDFLAGS='-shared -Wl,-soname,$@'
+ 
+-	SHLIB_XLDFLAGS='-Wl,-rpath,$(libdir) -Wl,-soname,`basename $@ $(SHLIB_MINOR)`'
++	SHLIB_XLDFLAGS='-Wl,-soname,`basename $@ $(SHLIB_MINOR)`'
+ 	SHLIB_LIBVERSION='$(SHLIB_LIBSUFF).$(SHLIB_MAJOR)$(SHLIB_MINOR)'
+ 	;;
+ 
diff --git a/meta/recipes-core/readline/readline-6.2/norpath.patch b/meta/recipes-core/readline/readline-6.2/norpath.patch
new file mode 100644
index 0000000..5d71582
--- /dev/null
+++ b/meta/recipes-core/readline/readline-6.2/norpath.patch
@@ -0,0 +1,21 @@
+This support script ends up hardcoding unnecessary rpaths into the libraries. We
+will search $libdir automatically so this is just wastes space. There may be some
+cases this is necessary but our use cases aren't one of them.
+
+Upstream-Status: Inappropriate
+
+RP 2012/2/23
+
+Index: readline-6.2/support/shobj-conf
+===================================================================
+--- readline-6.2.orig/support/shobj-conf	2012-02-23 11:06:37.193179379 +0000
++++ readline-6.2/support/shobj-conf	2012-02-23 11:06:50.049178918 +0000
+@@ -114,7 +114,7 @@
+ 	SHOBJ_LD='${CC}'
+ 	SHOBJ_LDFLAGS='-shared -Wl,-soname,$@'
+ 
+-	SHLIB_XLDFLAGS='-Wl,-rpath,$(libdir) -Wl,-soname,`basename $@ $(SHLIB_MINOR)`'
++	SHLIB_XLDFLAGS='-Wl,-soname,`basename $@ $(SHLIB_MINOR)`'
+ 	SHLIB_LIBVERSION='$(SHLIB_LIBSUFF).$(SHLIB_MAJOR)$(SHLIB_MINOR)'
+ 	;;
+ 
diff --git a/meta/recipes-core/readline/readline_5.2.bb b/meta/recipes-core/readline/readline_5.2.bb
index bf64853..705c526 100644
--- a/meta/recipes-core/readline/readline_5.2.bb
+++ b/meta/recipes-core/readline/readline_5.2.bb
@@ -9,11 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=03b36fdd84f74b8d8189a202b980b67f"
 
 DEPENDS += "ncurses"
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "${GNU_MIRROR}/readline/${BPN}-${PV}.tar.gz \
            file://configure-fix.patch \
-           file://acinclude.m4"
+           file://acinclude.m4 \
+           file://fix-redundant-rpath.patch"
 
 SRC_URI[md5sum] = "e39331f32ad14009b9ff49cc10c5e751"
 SRC_URI[sha256sum] = "12e88d96aee2cd1192500356f0535540db499282ca7f76339fb4228c31249f45"
-- 
1.7.5.4



