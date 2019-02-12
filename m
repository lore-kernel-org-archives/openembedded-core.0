Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 09B707C439
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 02:56:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Feb 2019 18:47:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,361,1544515200"; d="scan'208";a="132849578"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.102])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Feb 2019 18:47:13 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2019 10:47:08 +0800
Message-Id: <20190212024709.18046-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190212024709.18046-1-anuj.mittal@intel.com>
References: <20190212024709.18046-1-anuj.mittal@intel.com>
Subject: [PATCH 2/3] libva-utils: upgrade 2.3.0 -> 2.4.0
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
X-List-Received-Date: Tue, 12 Feb 2019 02:56:35 -0000

For changes, see:

https://github.com/intel/libva-utils/releases

Switch back to using tarball now that it is available.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ple-only-when-X11-backend-is-enabled.patch | 35 +++++++++++++++++++
 ...va-utils_2.3.0.bb => libva-utils_2.4.0.bb} |  8 +++--
 2 files changed, 40 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/libva/libva-utils/0001-Build-sfcsample-only-when-X11-backend-is-enabled.patch
 rename meta/recipes-graphics/libva/{libva-utils_2.3.0.bb => libva-utils_2.4.0.bb} (78%)

diff --git a/meta/recipes-graphics/libva/libva-utils/0001-Build-sfcsample-only-when-X11-backend-is-enabled.patch b/meta/recipes-graphics/libva/libva-utils/0001-Build-sfcsample-only-when-X11-backend-is-enabled.patch
new file mode 100644
index 0000000000..01fb71913b
--- /dev/null
+++ b/meta/recipes-graphics/libva/libva-utils/0001-Build-sfcsample-only-when-X11-backend-is-enabled.patch
@@ -0,0 +1,35 @@
+From 8fc14e4bc81885b80c3072e549c2e6f59533d7ef Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Fri, 8 Feb 2019 11:45:55 +0800
+Subject: [PATCH] Build sfcsample only when X11 backend is enabled
+
+See: https://github.com/intel/libva-utils/pull/149, and
+https://github.com/intel/libva-utils/issues/150
+
+Upstream-Status: Submitted
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d28175a..e294e25 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -24,10 +24,11 @@ ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
+ 
+ AUTOMAKE_OPTIONS = foreign
+ 
+-SUBDIRS = common decode encode vainfo videoprocess vendor/intel vendor/intel/sfcsample
++SUBDIRS = common decode encode vainfo videoprocess vendor/intel
+ 
+ if USE_X11
+ SUBDIRS += putsurface
++SUBDIRS += vendor/intel/sfcsample
+ else
+ if USE_WAYLAND
+ SUBDIRS += putsurface
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/libva/libva-utils_2.3.0.bb b/meta/recipes-graphics/libva/libva-utils_2.4.0.bb
similarity index 78%
rename from meta/recipes-graphics/libva/libva-utils_2.3.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.4.0.bb
index a1b7596e86..7b764314bf 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.3.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.4.0.bb
@@ -14,10 +14,12 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;protocol=https;branch=v2.3-branch"
-SRCREV = "b5a56ad33ef7d72fc522f26d2de874461be4b41e"
+SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2 \
+           file://0001-Build-sfcsample-only-when-X11-backend-is-enabled.patch \
+           "
 
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "f5374c4c32ce136e50aea0267887aed5"
+SRC_URI[sha256sum] = "5b7d1954b40fcb2c0544be20125c71a0852049715ab85a3e8aba60434a40c6b3"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva-utils/releases"
 
-- 
2.17.1


