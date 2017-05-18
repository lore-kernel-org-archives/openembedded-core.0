Return-Path: <juro.bystricky@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 9EAA277FF0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 21:05:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 18 May 2017 14:05:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,360,1491289200"; d="scan'208";a="88960385"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2017 14:05:11 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 May 2017 14:05:09 -0700
Message-Id: <1495141509-4582-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: jurobystricky@hotmail.com
Subject: [PATCH] kernel.bbclass: improve reproducibility
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
X-List-Received-Date: Thu, 18 May 2017 21:05:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Kernel and kernel modules contain hard coded paths referencing the host
build system. This is usually because the source code contains __FILE__
at some place. This prevents binary reproducibility. However, some compilers
allow remapping of the __FILE__ value. If we detect the compiler is capable
of doing this, we replace the source path $(S) part of __FILE__ by a string "/kernel-source".
For example:

​/​data/​master/​build-​repro/​tmp/​work-​shared/​qemux86/​kernel-​source/​drivers/​media/​v4l2-​core/​videobuf2-​core.​c

will be replaced by a reproducible value:

/kernel-source/drivers/media/v4l2-core/videobuf2-core.c.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/kernel.bbclass | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8954b28..0a2cd3d 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -249,6 +249,18 @@ python do_devshell_prepend () {
 
 addtask bundle_initramfs after do_install before do_deploy
 
+get_cc_option () {
+		# Check if KERNEL_CC supports the option "file-prefix-map".
+		# This option allows us to build images with __FILE__ values that do not
+		# contain the host build path.
+		cc_option_supported=`${KERNEL_CC} -Q --help=joined | grep ffile-prefix-map`
+		cc_extra=""
+		if [ $cc_option_supported = "-ffile-prefix-map=<old=new>" ]; then
+			cc_extra=-ffile-prefix-map=${S}=/kernel-source/
+		fi
+		echo $cc_extra
+}
+
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	# The $use_alternate_initrd is only set from
@@ -264,8 +276,9 @@ kernel_do_compile() {
 		copy_initramfs
 		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
 	fi
+	cc_extra=$(get_cc_option)
 	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
-		oe_runmake ${typeformake} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
+		oe_runmake ${typeformake} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
 		for type in ${KERNEL_IMAGETYPES} ; do
 			if test "${typeformake}.gz" = "${type}"; then
 				mkdir -p "${KERNEL_OUTPUT_DIR}"
@@ -279,7 +292,8 @@ kernel_do_compile() {
 do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
-		oe_runmake -C ${B} ${PARALLEL_MAKE} modules CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
+		cc_extra=$(get_cc_option)
+		oe_runmake -C ${B} ${PARALLEL_MAKE} modules CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
 
 		# Module.symvers gets updated during the 
 		# building of the kernel modules. We need to
-- 
2.7.4


