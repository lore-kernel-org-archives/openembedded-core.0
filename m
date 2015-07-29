Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 15EAF73D13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 06:23:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6T6Ngvj015825
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Jul 2015 23:23:42 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 28 Jul 2015 23:23:25 -0700
From: <rongqing.li@windriver.com>
To: <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 14:21:15 +0800
Message-ID: <1438150875-979-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] attr: remove some meaningless codes
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
X-List-Received-Date: Wed, 29 Jul 2015 06:23:46 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

what relative-libdir.patch done is reverted by fix_symlink for native,
and add a race since libacl.so/libattr.so are created, then removed, and
recreated it.
relative-libdir.patch say it fixed udev issue, but can not reproduce
current, and if udev has issue, the fix should be in udev

Cc: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-support/attr/ea-acl.inc               | 23 --------------------
 .../attr/files/relative-libdir.patch               | 25 ----------------------
 2 files changed, 48 deletions(-)
 delete mode 100644 meta/recipes-support/attr/files/relative-libdir.patch

diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index 474291a..088f058 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -1,8 +1,5 @@
 # this build system is mostly shared by attr and acl
 
-SRC_URI += "file://relative-libdir.patch;striplevel=0 \
-           "
-
 inherit autotools-brokensep gettext
 
 # the package comes with a custom config.h.in, it cannot be
@@ -25,23 +22,3 @@ BBCLASSEXTEND = "native"
 # Only append ldflags for target recipe and if USE_NLS is enabled
 LDFLAGS_append_libc-uclibc_class-target = "${@['', ' -lintl '][(d.getVar('USE_NLS', True) == 'yes')]}"
 EXTRA_OECONF_append_libc-uclibc_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS', True) == 'no')]}"
-
-fix_symlink () {
-	if test "${libdir}" = "${base_libdir}" ; then
-		return
-	fi
-	# Remove bad symlinks & create the correct symlinks
-	if test -L ${libdir}/lib${BPN}.so ; then
-		rm -rf ${libdir}/lib${BPN}.so
-		ln -sf ${base_libdir}/lib${BPN}.so ${libdir}/lib${BPN}.so
-	fi
-	if test -L ${base_libdir}/lib${BPN}.a ; then
-		rm -rf ${base_libdir}/lib${BPN}.a
-		ln -sf ${libdir}/lib${BPN}.a ${base_libdir}/lib${BPN}.a
-	fi
-	if test -L  ${base_libdir}/lib${BPN}.la ; then
-		rm -rf ${base_libdir}/lib${BPN}.la
-		ln -sf ${libdir}/lib${BPN}.la ${base_libdir}/lib${BPN}.la
-	fi
-}
-SSTATEPOSTINSTFUNCS_class-native += "fix_symlink"
diff --git a/meta/recipes-support/attr/files/relative-libdir.patch b/meta/recipes-support/attr/files/relative-libdir.patch
deleted file mode 100644
index b72bf18..0000000
--- a/meta/recipes-support/attr/files/relative-libdir.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Pending
-
-use relative path in symbolic links, or it fails in staging
-sed expression from udev
-
-7/29/2010 - created by Qing He <qing.he@intel.com>
-
-diff -u include.orig/buildmacros include/buildmacros
---- include.orig/buildmacros	2010-07-29 17:39:48.000000000 +0800
-+++ include/buildmacros	2010-07-29 18:20:34.000000000 +0800
-@@ -88,9 +88,11 @@
- 	../$(INSTALL) -m 755 -d $(PKG_LIB_DIR); \
- 	../$(INSTALL) -T so_base $(LIBNAME).lai $(PKG_LIB_DIR); \
- 	if test "x$(PKG_DEVLIB_DIR)" != "x$(PKG_LIB_DIR)" ; then \
--	../$(INSTALL) -S $(PKG_DEVLIB_DIR)/$(LIBNAME).a $(PKG_LIB_DIR)/$(LIBNAME).a; \
--	../$(INSTALL) -S $(PKG_DEVLIB_DIR)/$(LIBNAME).la $(PKG_LIB_DIR)/$(LIBNAME).la; \
--	../$(INSTALL) -S $(PKG_LIB_DIR)/$(LIBNAME).so $(PKG_DEVLIB_DIR)/$(LIBNAME).so; \
-+	rel_lib_prefix=$$(echo $(PKG_LIB_DIR) | sed 's,\(^/\|\)[^/][^/]*,..,g'); \
-+	../$(INSTALL) -S $$rel_lib_prefix$(PKG_DEVLIB_DIR)/$(LIBNAME).a $(PKG_LIB_DIR)/$(LIBNAME).a; \
-+	../$(INSTALL) -S $$rel_lib_prefix$(PKG_DEVLIB_DIR)/$(LIBNAME).la $(PKG_LIB_DIR)/$(LIBNAME).la; \
-+	rel_devlib_prefix=$$(echo $(PKG_DEVLIB_DIR) | sed 's,\(^/\|\)[^/][^/]*,..,g'); \
-+	../$(INSTALL) -S $$rel_devlib_prefix$(PKG_LIB_DIR)/$(LIBNAME).so $(PKG_DEVLIB_DIR)/$(LIBNAME).so; \
- 	fi
- else
- INSTALL_LTLIB_DEV = $(INSTALL_LTLIB_STATIC)
-- 
1.9.1


