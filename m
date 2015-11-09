Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 54C7777151
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 14:50:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 06:50:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,266,1444719600"; d="scan'208";a="596917426"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 06:49:59 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 16:50:27 +0200
Message-Id: <a4bcfe89cdad3ab3cdfe4a5d148f0a96a0413789.1447080392.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/29] gobject-introspection.bbclass: add a class that enables gobject introspection
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
X-List-Received-Date: Mon, 09 Nov 2015 14:50:01 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/gobject-introspection.bbclass | 36 ++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta/classes/gobject-introspection.bbclass

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
new file mode 100644
index 0000000..be4f5d4
--- /dev/null
+++ b/meta/classes/gobject-introspection.bbclass
@@ -0,0 +1,36 @@
+# Inherit this class in recipes to enable building their introspection files
+
+EXTRA_OECONF_append = " --enable-introspection"
+UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection"
+
+DEPENDS_append = " gobject-introspection"
+
+# This is necessary for python scripts to succeed - distutils
+# failes if these are not set
+export BUILD_SYS
+export HOST_SYS
+
+# This is used by introspection tools to find .gir includes
+export XDG_DATA_DIRS = "${STAGING_DATADIR}"
+
+do_configure_prepend_class-target () {
+    # introspection.m4 pre-packaged with upstream tarballs does not yet
+    # have our fixes
+    mkdir -p ${S}/m4
+    cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/m4
+
+    # Sometimes tarballs package it in common/ instead of m4/,
+    # remove that too.
+    rm -f ${S}/common/introspection.m4
+    rm -f ${S}/common/m4/introspection.m4
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
2.1.4


