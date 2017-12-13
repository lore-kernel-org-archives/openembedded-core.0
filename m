Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A9177786BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 21:31:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2017 13:31:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,398,1508828400"; d="scan'208";a="12082175"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga003.jf.intel.com with ESMTP; 13 Dec 2017 13:31:42 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2017 13:31:14 -0800
Message-Id: <1513200676-59900-3-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513200676-59900-1-git-send-email-juro.bystricky@intel.com>
References: <1513200676-59900-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 2/4] kernel.bbclass: use class compiler-options
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
X-List-Received-Date: Wed, 13 Dec 2017 21:31:42 -0000

We use gcc option "-ffile-prefix-map" if available.
Remove the local code that detects the availability of this
compiler option (get_cc_option) and use a more generic code
imported from compiler-option.bbclass.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/kernel.bbclass | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7ef4f47..32730b1 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,4 +1,4 @@
-inherit linux-kernel-base kernel-module-split
+inherit linux-kernel-base kernel-module-split compiler-options
 
 PROVIDES += "virtual/kernel"
 DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native"
@@ -244,15 +244,6 @@ python do_devshell_prepend () {
 
 addtask bundle_initramfs after do_install before do_deploy
 
-get_cc_option () {
-		# Check if KERNEL_CC supports the option "file-prefix-map".
-		# This option allows us to build images with __FILE__ values that do not
-		# contain the host build path.
-		if ${KERNEL_CC} -Q --help=joined | grep -q "\-ffile-prefix-map=<old=new>"; then
-			echo "-ffile-prefix-map=${S}=/kernel-source/"
-		fi
-}
-
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
@@ -287,7 +278,7 @@ kernel_do_compile() {
 		copy_initramfs
 		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
 	fi
-	cc_extra=$(get_cc_option)
+	cc_extra=$(file_prefix_map_option_supported ${KERNEL_CC})
 	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
 		oe_runmake ${typeformake} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
 	done
@@ -301,7 +292,7 @@ kernel_do_compile() {
 do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
-		cc_extra=$(get_cc_option)
+		cc_extra=$(file_prefix_map_option_supported ${KERNEL_CC})
 		oe_runmake -C ${B} ${PARALLEL_MAKE} modules CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
 
 		# Module.symvers gets updated during the 
-- 
2.7.4


