Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 252FD75C57
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 15:36:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Jul 2015 08:36:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,400,1432623600"; d="scan'208";a="755547260"
Received: from yctb04.ostc.intel.com (HELO yctb04.otcr.jf.intel.com)
	([10.23.219.53])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2015 08:36:40 -0700
From: jose.a.lamego@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jul 2015 07:34:50 +0000
Message-Id: <1435908890-27463-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] subversion_1.8.13.bb: Regex modified to allow '-D' in paths
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
X-List-Received-Date: Fri, 03 Jul 2015 15:36:42 -0000

From: Jose Lamego <jose.a.lamego@linux.intel.com>

Modified the regex sed in serf.m4 to allow the use of '-D' characters
in project folder names without having compilation error from
subversion-native.

[YOCTO #7874]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 ...erf.m4-Regex-modified-to-allow-D-in-paths.patch | 28 ++++++++++++++++++++++
 .../subversion/subversion_1.8.13.bb                |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/serf.m4-Regex-modified-to-allow-D-in-paths.patch

diff --git a/meta/recipes-devtools/subversion/subversion-1.8.13/serf.m4-Regex-modified-to-allow-D-in-paths.patch b/meta/recipes-devtools/subversion/subversion-1.8.13/serf.m4-Regex-modified-to-allow-D-in-paths.patch
new file mode 100644
index 0000000..713b5eb
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.8.13/serf.m4-Regex-modified-to-allow-D-in-paths.patch
@@ -0,0 +1,28 @@
+From f1b6e49f12a18eabe88eb732b578a16281d09499 Mon Sep 17 00:00:00 2001
+From: Jose Lamego <jose.a.lamego@linux.intel.com>
+Date: Thu, 2 Jul 2015 11:37:43 +0000
+Subject: [PATCH] serf.m4: Regex modified to allow '-D' in paths
+
+Upstream-Status: Pending
+
+Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
+---
+ build/ac-macros/serf.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/ac-macros/serf.m4 b/build/ac-macros/serf.m4
+index ae11e75..ff8cbae 100644
+--- a/build/ac-macros/serf.m4
++++ b/build/ac-macros/serf.m4
+@@ -143,7 +143,7 @@ AC_DEFUN(SVN_SERF_PKG_CONFIG,
+         if $PKG_CONFIG $serf_major --atleast-version=$serf_check_version; then
+           AC_MSG_RESULT([yes])
+           serf_found=yes
+-          SVN_SERF_INCLUDES=[`$PKG_CONFIG $serf_major --cflags | $SED -e 's/-D[^ ]*//g'`]
++          SVN_SERF_INCLUDES=[`$PKG_CONFIG $serf_major --cflags | $SED -e 's/[[:space:]]-D[^ ]*//g' -e 's/^-D[^ ]*//g'`]
+           SVN_SERF_LIBS=`$PKG_CONFIG $serf_major --libs` 
+           break
+         else
+-- 
+1.8.4.5
+
diff --git a/meta/recipes-devtools/subversion/subversion_1.8.13.bb b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
index a98be67..f843b95 100644
--- a/meta/recipes-devtools/subversion/subversion_1.8.13.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
@@ -12,6 +12,7 @@ inherit gettext pythonnative
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://disable_macos.patch \
+           file://serf.m4-Regex-modified-to-allow-D-in-paths.patch \
 "
 SRC_URI[md5sum] = "4413417b529d7bdf82f74e50df02e88b"
 SRC_URI[sha256sum] = "1099cc68840753b48aedb3a27ebd1e2afbcc84ddb871412e5d500e843d607579"
-- 
1.8.4.5


