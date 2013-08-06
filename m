Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 87CDE6B55B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 20:55:28 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Aug 2013 13:55:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,827,1367996400"; d="scan'208";a="342607431"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.23])
	by azsmga001.ch.intel.com with ESMTP; 06 Aug 2013 13:55:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2013 13:55:28 -0700
Message-Id: <1375822528-2026-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH v2] subversion: Add patch to use neon 0.30
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
X-List-Received-Date: Tue, 06 Aug 2013 20:55:28 -0000

The neon update is not recognized but subversion, so we need to patch the configure.ac
to know about 0.30, otherwise we don't have http/https support in subversion.

v2: Add patch header (doh!)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../subversion-1.7.10/allow-updated-neon.patch       | 20 ++++++++++++++++++++
 .../recipes-devtools/subversion/subversion_1.7.10.bb |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/allow-updated-neon.patch

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.10/allow-updated-neon.patch b/meta/recipes-devtools/subversion/subversion-1.7.10/allow-updated-neon.patch
new file mode 100644
index 0000000..e8acb12
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.7.10/allow-updated-neon.patch
@@ -0,0 +1,20 @@
+
+Allow neon 0.30 to be usable also
+
+Upstream-Status: Pending
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: subversion-1.7.10/configure.ac
+===================================================================
+--- subversion-1.7.10.orig/configure.ac
++++ subversion-1.7.10/configure.ac
+@@ -118,7 +118,7 @@ AC_PATH_PROG(PKG_CONFIG, pkg-config)
+ 
+ # Either a space-separated list of allowable Neon versions, or "any" to
+ # mean allow anything.
+-NEON_ALLOWED_LIST="0\.25 0\.26 0\.27\.2 0\.28 0\.29"
++NEON_ALLOWED_LIST="0\.25 0\.26 0\.27\.2 0\.28 0\.29 0\.30"
+ NEON_RECOMMENDED_VER="0.29.6"
+ NEON_URL="http://www.webdav.org/neon/neon-${NEON_RECOMMENDED_VER}.tar.gz"
+ dnl You can skip the neon version check only if you know what you are doing 
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.10.bb b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
index a24edb5..f77656b 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.10.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
@@ -12,6 +12,7 @@ inherit gettext
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://fix-install-depends.patch \
+           file://allow-updated-neon.patch \
 "
 SRC_URI[md5sum] = "4088a77e14232876c9b4ff1541e6e200"
 SRC_URI[sha256sum] = "c1df222bec83d014d17785e2ceba6bc80962f64b280967de0285836d8d77a8e7"
-- 
1.8.1.4


