Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 58D01772E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 09:26:26 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 02 Jun 2016 02:26:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="114703330"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2016 02:26:17 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 12:25:41 +0300
Message-Id: <bfcccd1ac4c01e46f6615fa8c0891f9bf4d2a04a.1464859158.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
References: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
References: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/31] glib: move to Python 3
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
X-List-Received-Date: Thu, 02 Jun 2016 09:26:26 -0000

Drop python-pygobject and python-dbus dependencies, because nothing in
ptests depends on them, and it creates a circular dependency chain.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index ddf5e40..c6b8e57 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -26,7 +26,7 @@ PACKAGES += "${PN}-codegen ${PN}-utils"
 
 LEAD_SONAME = "libglib-2.0.*"
 
-inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache
+inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache python3native
 
 S = "${WORKDIR}/glib-${PV}"
 
@@ -44,7 +44,7 @@ EXTRA_OECONF_class-native = "${CORECONF} --disable-selinux"
 EXTRA_OECONF_append_libc-uclibc = " --with-libiconv=gnu"
 
 do_configure_prepend() {
-	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
+	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
 }
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS} \
@@ -73,7 +73,7 @@ USE_NLS = "yes"
 
 do_install_append () {
 	if [ -f ${D}${bindir}/gtester-report ]; then
-		sed ${D}${bindir}/gtester-report -i -e '1s|^#!.*|#!/usr/bin/env python|'
+		sed ${D}${bindir}/gtester-report -i -e '1s|^#!.*|#!/usr/bin/env python3|'
 	fi
 
 	# Remove some unpackaged files
@@ -109,8 +109,6 @@ RDEPENDS_${PN}-ptest += "\
             tzdata-asia \
             tzdata-europe \
             tzdata-posix \
-            python-pygobject \
-            python-dbus \
             shared-mime-info \
            "
 
-- 
2.8.1


