Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0032E7316D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:53:54 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498010"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:53:50 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:54:00 +0300
Message-Id: <d6a3b1762cfe611fcc10b28c8aad389fa15c3482.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/45] glib: move to Python 3
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
X-List-Received-Date: Tue, 24 May 2016 11:53:55 -0000

Drop python-pygobject and python-dbus dependencies, because nothing in
ptests depends on them, and it creates a circular dependency chain.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index ddf5e40..1da0bfd 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -17,13 +17,16 @@ SECTION = "libs"
 
 BBCLASSEXTEND = "native nativesdk"
 
-DEPENDS = "virtual/libiconv libffi zlib glib-2.0-native"
+DEPENDS = "virtual/libiconv libffi zlib glib-2.0-native python3"
 DEPENDS_append = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' dbus', '', d)}"
 DEPENDS_class-native = "pkgconfig-native gettext-native libffi-native zlib-native"
 DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-gettext nativesdk-libffi nativesdk-zlib glib-2.0-native"
 
 PACKAGES += "${PN}-codegen ${PN}-utils"
 
+RDEPENDS_${PN}-codegen += "python3-core"
+RDEPENDS_${PN}-utils += "python3-core"
+
 LEAD_SONAME = "libglib-2.0.*"
 
 inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache
@@ -44,7 +47,7 @@ EXTRA_OECONF_class-native = "${CORECONF} --disable-selinux"
 EXTRA_OECONF_append_libc-uclibc = " --with-libiconv=gnu"
 
 do_configure_prepend() {
-	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
+	sed -i -e '1s,#!.*,#!${USRBINPATH}/python3,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
 }
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS} \
@@ -73,7 +76,7 @@ USE_NLS = "yes"
 
 do_install_append () {
 	if [ -f ${D}${bindir}/gtester-report ]; then
-		sed ${D}${bindir}/gtester-report -i -e '1s|^#!.*|#!/usr/bin/env python|'
+		sed ${D}${bindir}/gtester-report -i -e '1s|^#!.*|#!/usr/bin/python3|'
 	fi
 
 	# Remove some unpackaged files
@@ -109,8 +112,6 @@ RDEPENDS_${PN}-ptest += "\
             tzdata-asia \
             tzdata-europe \
             tzdata-posix \
-            python-pygobject \
-            python-dbus \
             shared-mime-info \
            "
 
-- 
2.8.1


