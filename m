Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AA90371BA0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 17:49:03 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Aug 2017 10:49:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,348,1498546800"; d="scan'208";a="117337516"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 09 Aug 2017 10:48:35 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 10:48:32 -0700
Message-Id: <1502300913-40295-11-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
MIME-Version: 1.0
Cc: jurobystricky@hotmail.com
Subject: [PATCH v3 10/11] kernel.bbclass: improve reproducibility
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
X-List-Received-Date: Wed, 09 Aug 2017 17:49:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Several tweaks to improve reproducibility:

1. If BUILD_REPRODUCIBLE_BINARIES == 1, set KBUILD_BUILD_TIMESTAMP
to a reproducible value. This is either a non-zero SOURCE_DATE_EPOCH, or the
value obtained from top entry of GIT repo, or (if there is no GIT repo)
fallback to REPRODUCIBLE_TIMESTAMP_ROOTFS as the last resort.
Also export KCONFIG_NOTIMESTAMP=1.

2. When compressing vmlinux.gz, use gzip "-n" option

3. Kernel and kernel modules contain hard coded paths referencing the host
build system. This is usually because the source code contains __FILE__
at some place. This prevents binary reproducibility. However, some compilers
allow remapping of the __FILE__ value. If we detect the compiler is capable
of doing this, we replace the source path $(S) part of __FILE__ by a string "/kernel-source".
For example:

​/data/master/build/tmp/work-shared/qemux86/kernel-source/drivers/media/v4l2-core/videobuf2-core.​c

will be replaced by a reproducible value:

/kernel-source/drivers/media/v4l2-core/videobuf2-core.c.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/kernel.bbclass | 39 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ce2cab6..2a76554 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -255,8 +255,39 @@ python do_devshell_prepend () {
 
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
+	if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
+		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
+		# be set....
+		if [ "$SOURCE_DATE_EPOCH" = "0" ]; then
+			olddir=`pwd`
+			cd ${S}
+			SOURCE_DATE_EPOCH=`git log  -1 --pretty=%ct`
+			# git repo not guaranteed, so fall back to REPRODUCIBLE_TIMESTAMP_ROOTFS
+			if [ $? -ne 0 ]; then
+				SOURCE_DATE_EPOCH=${REPRODUCIBLE_TIMESTAMP_ROOTFS}
+			fi
+			cd $olddir
+		fi
+
+		ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
+		export KBUILD_BUILD_TIMESTAMP="$ts"
+		export KCONFIG_NOTIMESTAMP=1
+		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+	fi
 	# The $use_alternate_initrd is only set from
 	# do_bundle_initramfs() This variable is specifically for the
 	# case where we are making a second pass at the kernel
@@ -270,20 +301,22 @@ kernel_do_compile() {
 		copy_initramfs
 		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
 	fi
+	cc_extra=$(get_cc_option)
 	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
-		oe_runmake ${typeformake} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
+		oe_runmake ${typeformake} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
 	done
 	# vmlinux.gz is not built by kernel
 	if (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux\.gz"); then
 		mkdir -p "${KERNEL_OUTPUT_DIR}"
-		gzip -9c < ${B}/vmlinux > "${KERNEL_OUTPUT_DIR}/vmlinux.gz"
+		gzip -9cn < ${B}/vmlinux > "${KERNEL_OUTPUT_DIR}/vmlinux.gz"
 	fi
 }
 
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


