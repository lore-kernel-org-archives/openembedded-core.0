Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 82D8660069
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 06:47:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 03 Apr 2017 23:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,274,1486454400"; d="scan'208";a="1130598130"
Received: from drozhkov-desk.fi.intel.com ([10.237.72.60])
	by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2017 23:47:04 -0700
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 09:46:46 +0300
Message-Id: <20170404064646.2636-1-dmitry.rozhkov@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH v2] libxml2: make dependencies on python conditional
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
X-List-Received-Date: Tue, 04 Apr 2017 06:47:04 -0000

The library libxml2 can provide its own bindings for python2 in addition
to the third party python-lxml and python3-lxml packages if this
functionality is enabled in PACKAGECONFIG.

But in case the functionality is disabled there's no need to depend
on python2.

Make the dependency on python2 enabled only if the python feature
is added to PACKAGECONFIG. Also add missing run-time dependency on make
to libxml2-ptest.

Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
---

Changes in v2:
- Set PACKAGECONFIG before it's used.
- PACKAGES is left unchanged because empty packages are not generated.

 meta/recipes-core/libxml/libxml2_2.9.4.bb | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
index 023fe99..0c3d683 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -32,22 +32,24 @@ SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c
 
 BINCONFIG = "${bindir}/xml2-config"
 
-inherit autotools pkgconfig binconfig-disabled pythonnative ptest
+PACKAGECONFIG ??= "python \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
+"
+PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+
+inherit autotools pkgconfig binconfig-disabled ptest
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'pythonnative', '', d)}
 
-RDEPENDS_${PN}-ptest += "python-core"
+RDEPENDS_${PN}-ptest += "make ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python-core', '', d)}"
 
-RDEPENDS_${PN}-python += "python-core"
+RDEPENDS_${PN}-python += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python-core', '', d)}"
 
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-gconv-ebcdic-us glibc-gconv-ibm1141"
 
 export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"
 
-PACKAGECONFIG ??= "python \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-"
-PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-
 # WARNING: zlib is require for RPM use
 EXTRA_OECONF = "--without-debug --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
 EXTRA_OECONF_class-native = "--without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
-- 
2.9.3


