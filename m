Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A39D1731C9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:54:21 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498226"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:54:21 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:54:30 +0300
Message-Id: <bc333689f690d5018769b50d563f0343145b99c9.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 41/45] python3-mako: add a Python 3 recipe
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
X-List-Received-Date: Tue, 24 May 2016 11:54:21 -0000

This will be necessary for transiting piglit to Python 3.
Python 2 recipe should be kept as it is used by mesa (and
gobject-introspection, for now).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/python/python-mako_1.0.3.bb  |  6 ++++++
 meta/recipes-devtools/python/python3-mako_1.0.3.bb | 24 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-mako_1.0.3.bb

diff --git a/meta/recipes-devtools/python/python-mako_1.0.3.bb b/meta/recipes-devtools/python/python-mako_1.0.3.bb
index 9efd700..d4f426d 100644
--- a/meta/recipes-devtools/python/python-mako_1.0.3.bb
+++ b/meta/recipes-devtools/python/python-mako_1.0.3.bb
@@ -22,3 +22,9 @@ RDEPENDS_${PN} = "python-threading \
 RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native nativesdk"
+
+# The same utility is packaged in python3-mako, so it would conflict
+do_install_append() {
+    rm -f ${D}${bindir}/mako-render
+    rm -df ${D}${bindir}
+}
diff --git a/meta/recipes-devtools/python/python3-mako_1.0.3.bb b/meta/recipes-devtools/python/python3-mako_1.0.3.bb
new file mode 100644
index 0000000..c770603
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-mako_1.0.3.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Templating library for Python"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=deb3ff8e4c17aaf7b80889b6b2bf4c83"
+
+SRC_URI = "https://pypi.python.org/packages/source/M/Mako/Mako-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "a78f20f6366a8a0659ce5532f8614e53"
+SRC_URI[sha256sum] = "7644bc0ee35965d2e146dde31827b8982ed70a58281085fac42869a09764d38c"
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/mako/"
+UPSTREAM_CHECK_REGEX = "/Mako/(?P<pver>(\d+[\.\-_]*)+)"
+
+S = "${WORKDIR}/Mako-${PV}"
+
+inherit setuptools3
+
+RDEPENDS_${PN} = "python3-threading \
+                  python3-netclient \
+                  python3-html \
+"
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.8.1


