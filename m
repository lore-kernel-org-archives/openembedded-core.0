Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 32576719B0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 21:44:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Oct 2016 14:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,454,1473145200"; d="scan'208";a="1061481332"
Received: from jliao12-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.157.216])
	by orsmga002.jf.intel.com with ESMTP; 06 Oct 2016 14:44:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2016 10:43:04 +1300
Message-Id: <6ab82616efe0829ea84862c8b926d59c0668f19c.1475790060.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1475790060.git.paul.eggleton@linux.intel.com>
References: <cover.1475790060.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1475790060.git.paul.eggleton@linux.intel.com>
References: <cover.1475790060.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/populate_sdk_ext: add symlinks and unfsd to support Eclipse plugin
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
X-List-Received-Date: Thu, 06 Oct 2016 21:44:47 -0000

The Yocto Project Eclipse plugin requires that runqemu and unfsd are
accessible within the SDK, and indeed the standard SDK has these. This
turns out to be fairly easy to do - we just need to add unfsd and symlink
it, runqemu and a few other scripts into the SDK's bin directory.

Fixes [YOCTO #10214].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass           | 14 ++++++++++++--
 meta/recipes-core/meta/meta-extsdk-toolchain.bb |  2 +-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 5402988..ddf3962 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -492,8 +492,18 @@ def get_sdk_required_utilities(buildtools_fn, d):
 
 install_tools() {
 	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}
-	lnr ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath}/devtool ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/devtool
-	lnr ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath}/recipetool ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/recipetool
+	scripts="devtool recipetool oe-find-native-sysroot runqemu*"
+	for script in $scripts; do
+		for scriptfn in `find ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath} -maxdepth 1 -executable -name "$script"`; do
+			lnr ${scriptfn} ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/`basename $scriptfn`
+		done
+	done
+	# We can't use the same method as above because files in the sysroot won't exist at this point
+	# (they get populated from sstate on installation)
+	if [ "${SDK_INCLUDE_TOOLCHAIN}" == "1" ] ; then
+		binrelpath=${@os.path.relpath(d.getVar('STAGING_BINDIR_NATIVE',True), d.getVar('TOPDIR', True))}
+		lnr ${SDK_OUTPUT}/${SDKPATH}/$binrelpath/unfsd ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/unfsd
+	fi
 	touch ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
 
 	# find latest buildtools-tarball and install it
diff --git a/meta/recipes-core/meta/meta-extsdk-toolchain.bb b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
index 886ff07..2bd9a5b 100644
--- a/meta/recipes-core/meta/meta-extsdk-toolchain.bb
+++ b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native"
+DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native"
 
 do_populate_sysroot[deptask] = "do_populate_sysroot"
 
-- 
2.5.5


