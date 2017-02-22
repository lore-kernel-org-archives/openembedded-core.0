Return-Path: <amarnath.valluri@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CFF1673097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 08:27:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 00:27:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,193,1484035200"; d="scan'208";a="1114018022"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2017 00:27:46 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 10:27:09 +0200
Message-Id: <1487752042-19804-38-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
References: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH v2 12/25] attr/acl: Do not create broken static library link when not needed
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
X-List-Received-Date: Wed, 22 Feb 2017 08:27:46 -0000

Stop creating the static library archieve(liba(ttr|cl).a) when --disable-static
configure option used.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/recipes-support/attr/ea-acl.inc               |  2 +
 ...gure-option-to-enable-disable-static-libr.patch | 70 ++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-support/attr/files/0001-Added-configure-option-to-enable-disable-static-libr.patch

diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index a88ce90..c587b3c 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -2,6 +2,8 @@
 
 SRC_URI += "file://relative-libdir.patch;striplevel=0 \
            "
+# This patch should be applied after '(attr\|acl)-Missing-configure.ac.patch' 
+SRC_URI_append = " file://0001-Added-configure-option-to-enable-disable-static-libr.patch"
 
 inherit autotools-brokensep gettext
 
diff --git a/meta/recipes-support/attr/files/0001-Added-configure-option-to-enable-disable-static-libr.patch b/meta/recipes-support/attr/files/0001-Added-configure-option-to-enable-disable-static-libr.patch
new file mode 100644
index 0000000..1c1159f
--- /dev/null
+++ b/meta/recipes-support/attr/files/0001-Added-configure-option-to-enable-disable-static-libr.patch
@@ -0,0 +1,70 @@
+From 01256c61ba126449c46dd4ab5d5e145488b981fa Mon Sep 17 00:00:00 2001
+From: Amarnath Valluri <amarnath.valluri@intel.com>
+Date: Mon, 23 Jan 2017 13:25:13 +0200
+Subject: [PATCH] Added configure option to enable/disable static library
+
+Create static library archive only in case of --enable-static.
+
+Upstream-Status: Pending
+
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+---
+ configure.ac         | 6 ++++++
+ include/builddefs.in | 1 +
+ include/buildmacros  | 3 +++
+ 3 files changed, 10 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index b966d0e..e48268b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -26,6 +26,12 @@ AC_ARG_ENABLE(shared,
+ 	enable_shared=yes)
+ AC_SUBST(enable_shared)
+ 
++AC_ARG_ENABLE(static,
++[ --enable-static=[yes/no] Enable use of static libraries [default=yes]],,
++	enable_static=yes)
++AC_SUBST(enable_static)
++
++
+ AC_ARG_ENABLE(gettext,
+ [ --enable-gettext=[yes/no] Enable alternate language support [default=yes]],,
+ 	enable_gettext=yes)
+diff --git a/include/builddefs.in b/include/builddefs.in
+index d9931db..3b3dbd2 100644
+--- a/include/builddefs.in
++++ b/include/builddefs.in
+@@ -71,6 +71,7 @@ RPMBUILD	= @rpmbuild@
+ RPM_VERSION	= @rpm_version@
+ 
+ ENABLE_SHARED	= @enable_shared@
++ENABLE_STATIC 	= @enable_static@
+ ENABLE_GETTEXT	= @enable_gettext@
+ 
+ HAVE_ZIPPED_MANPAGES = @have_zipped_manpages@
+diff --git a/include/buildmacros b/include/buildmacros
+index 39fa7e2..b0f25c5 100644
+--- a/include/buildmacros
++++ b/include/buildmacros
+@@ -80,6 +80,7 @@ endif
+ # /usr/lib.
+ ifeq ($(ENABLE_SHARED),yes)
+ INSTALL_LTLIB_DEV = \
++	set -x; \
+ 	cd $(TOPDIR)/$(LIBNAME)/.libs; \
+ 	../$(INSTALL) -m 755 -d $(PKG_DEVLIB_DIR); \
+ 	../$(INSTALL) -m 644 -T old_lib $(LIBNAME).lai $(PKG_DEVLIB_DIR); \
+@@ -88,7 +89,9 @@ INSTALL_LTLIB_DEV = \
+ 	../$(INSTALL) -T so_base $(LIBNAME).lai $(PKG_LIB_DIR); \
+ 	if test "x$(PKG_DEVLIB_DIR)" != "x$(PKG_LIB_DIR)" ; then \
+ 	rel_lib_prefix=$$(echo $(PKG_LIB_DIR) | sed 's,\(^/\|\)[^/][^/]*,..,g'); \
++	if test "$(ENABLE_STATIC)" = "yes" ; then \
+ 	../$(INSTALL) -S $$rel_lib_prefix$(PKG_DEVLIB_DIR)/$(LIBNAME).a $(PKG_LIB_DIR)/$(LIBNAME).a; \
++	fi ;\
+ 	../$(INSTALL) -S $$rel_lib_prefix$(PKG_DEVLIB_DIR)/$(LIBNAME).la $(PKG_LIB_DIR)/$(LIBNAME).la; \
+ 	rel_devlib_prefix=$$(echo $(PKG_DEVLIB_DIR) | sed 's,\(^/\|\)[^/][^/]*,..,g'); \
+ 	../$(INSTALL) -S $$rel_devlib_prefix$(PKG_LIB_DIR)/$(LIBNAME).so $(PKG_DEVLIB_DIR)/$(LIBNAME).so; \
+-- 
+2.7.4
+
-- 
2.7.4


