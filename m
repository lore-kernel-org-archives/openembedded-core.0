Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6E36FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:07:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 09 Mar 2016 07:06:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083619"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:20 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:01:52 +0200
Message-Id: <c9d3e96135173503ef0e3730cc80c993b5bf951e.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/24] gobject-introspection.bbclass: add a class that enables gobject introspection
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
X-List-Received-Date: Wed, 09 Mar 2016 15:07:11 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/gobject-introspection.bbclass | 39 ++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta/classes/gobject-introspection.bbclass

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
new file mode 100644
index 0000000..ef51629
--- /dev/null
+++ b/meta/classes/gobject-introspection.bbclass
@@ -0,0 +1,39 @@
+# Inherit this class in recipes to enable building their introspection files
+
+# This allows disabling introspection support in recipes
+# (and therefore avoiding the use of qemu)
+# if gobject-introspection-data is omitted from DISTRO_FEATURES and MACHINE_FEATURES.
+EXTRA_OECONF_prepend = "${@bb.utils.contains('COMBINED_FEATURES', 'gobject-introspection-data', '--enable-introspection', '--disable-introspection', d)} "
+
+UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
+
+# Generating introspection data depends on a combination of native and target introspection tools,
+# and qemu to run the target tools.
+DEPENDS_append = " gobject-introspection gobject-introspection-native qemu-native"
+
+# This is necessary for python scripts to succeed - distutils
+# failes if these are not set
+export BUILD_SYS
+export HOST_SYS
+export STAGING_LIBDIR
+export STAGING_INCDIR
+
+# This is used by introspection tools to find .gir includes
+export XDG_DATA_DIRS = "${STAGING_DATADIR}"
+
+do_configure_prepend_class-target () {
+    # introspection.m4 pre-packaged with upstream tarballs does not yet
+    # have our fixes
+    mkdir -p ${S}/m4
+    cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/m4
+}
+
+
+# .typelib files are needed at runtime and so they go to the main package
+# (so they'll be together with libraries they support).
+FILES_${PN}_append = " ${libdir}/girepository-*/*.typelib" 
+    
+# .gir files go to dev package, as they're needed for developing (but not for running)
+# things that depends on introspection.
+FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir"
+
-- 
2.7.0


