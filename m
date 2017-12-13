Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9362C78871
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 21:31:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2017 13:31:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,398,1508828400"; d="scan'208";a="12082176"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga003.jf.intel.com with ESMTP; 13 Dec 2017 13:31:42 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2017 13:31:15 -0800
Message-Id: <1513200676-59900-4-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513200676-59900-1-git-send-email-juro.bystricky@intel.com>
References: <1513200676-59900-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 3/4] module.bbclass: improve reproducibility
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
X-List-Received-Date: Wed, 13 Dec 2017 21:31:41 -0000

Use gcc option "-ffile-prefix-map" if available.
This will remap any hard-coded __FILE__ containing build host
path to a reproducible value, with the absolute build-host path
stripped.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/module.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 78d1b21..e0670bf 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -1,4 +1,4 @@
-inherit module-base kernel-module-split pkgconfig
+inherit module-base kernel-module-split pkgconfig compiler-options
 
 addtask make_scripts after do_prepare_recipe_sysroot before do_configure
 do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
@@ -40,9 +40,10 @@ python do_devshell_prepend () {
 
 module_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+	cc_extra=$(file_prefix_map_option_supported ${KERNEL_CC})
 	oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
 		   KERNEL_VERSION=${KERNEL_VERSION}    \
-		   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
+		   CC="${KERNEL_CC} $cc_extra" LD="${KERNEL_LD}" \
 		   AR="${KERNEL_AR}" \
 	           O=${STAGING_KERNEL_BUILDDIR} \
 		   KBUILD_EXTRA_SYMBOLS="${KBUILD_EXTRA_SYMBOLS}" \
-- 
2.7.4


