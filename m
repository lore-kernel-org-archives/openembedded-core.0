Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 083DB601D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 14:29:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Nov 2015 06:29:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,347,1444719600"; d="scan'208";a="829574528"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2015 06:29:01 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 16:26:07 +0200
Message-Id: <58160169e1590419007b703a31b2aeaf77211659.1448547850.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/29] gobject-introspection.bbclass: add a class that enables gobject introspection
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
X-List-Received-Date: Thu, 26 Nov 2015 14:29:00 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/gobject-introspection.bbclass | 34 ++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta/classes/gobject-introspection.bbclass

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
new file mode 100644
index 0000000..9db61b2
--- /dev/null
+++ b/meta/classes/gobject-introspection.bbclass
@@ -0,0 +1,34 @@
+# Inherit this class in recipes to enable building their introspection files
+
+EXTRA_OECONF_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', '--enable-introspection', '--disable-introspection', d)}"
+
+UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
+
+DEPENDS_append = " gobject-introspection"
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
2.6.2


