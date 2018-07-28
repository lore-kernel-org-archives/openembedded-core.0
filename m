Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2FAC978CEE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 08:50:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Jul 2018 01:50:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,413,1526367600"; d="scan'208";a="76263272"
Received: from kaovince-mobl1.gar.corp.intel.com (HELO
	anmitta2-MOBL1.png.intel.com) ([10.255.166.184])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2018 01:49:54 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Jul 2018 16:49:50 +0800
Message-Id: <20180728084950.13242-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180728084950.13242-1-anuj.mittal@intel.com>
References: <20180728084950.13242-1-anuj.mittal@intel.com>
Subject: [rocko][PATCH 2/2] make-mod-scripts: add build requirements for external modules
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
X-List-Received-Date: Sat, 28 Jul 2018 08:50:12 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Newer kernels (4.14/v4.15+) have dependencies for the build of
modules (and hence external modules). Without these dependencies
explicitly in the build chain, you can end up with build failures like:

  work-shared/qemux86/kernel-source/scripts/extract-cert.c:21:25: fatal
  error: openssl/bio.h: No such file or directory
  |  #include <openssl/bio.h>
  |                          ^
  | compilation terminated.
  | make[2]: *** [scripts/extract-cert] Error 1
  | make[1]: *** [scripts] Error 2

To ensure that these headers are in place, and that the scripts use
our build environment flags, we add a dependency on openssl-native
and use oe_make to invoke the build.

Older kernels have no issues with the extra dependency, so there's no
need to make this conditional.

(From OE-Core rev: 916cb2029d3c97bf12ebf03832b9ba980451dbcf)

Fixes [YOCTO #12860]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Tweaked to have changes in module*.bbclass instead from where
make-mod-scripts was split in sumo]
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/module-base.bbclass | 5 ++++-
 meta/classes/module.bbclass      | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 64729770c7..9f3465eb9d 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -12,6 +12,9 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
 # we didn't pick the name.
 export KBUILD_OUTPUT = "${STAGING_KERNEL_BUILDDIR}"
 
+DEPENDS += "bc-native"
+EXTRA_OEMAKE += " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
+
 export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_BUILDDIR}/kernel-abiversion')}"
 KERNEL_OBJECT_SUFFIX = ".ko"
 
@@ -22,6 +25,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 # be called before do_compile. See module.bbclass for an example.
 do_make_scripts() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
-	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
 	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts prepare
 }
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 78d1b21dbd..282900dc6d 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -2,7 +2,7 @@ inherit module-base kernel-module-split pkgconfig
 
 addtask make_scripts after do_prepare_recipe_sysroot before do_configure
 do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
-do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
+do_make_scripts[depends] += "virtual/kernel:do_shared_workdir openssl-native:do_populate_sysroot"
 
 EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
-- 
2.17.1


