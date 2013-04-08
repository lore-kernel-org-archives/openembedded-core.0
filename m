Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michel.thebeau@windriver.com>) id 1UPIki-0004xU-6E
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 22:33:21 +0200
Received: from yow-mthebeau-lx2.wrs.com (yow-mthebeau-lx2.wrs.com
	[128.224.146.159])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r38KFvrk011251;
	Mon, 8 Apr 2013 13:15:58 -0700 (PDT)
From: michel.thebeau@windriver.com
To: richard.purdie@linuxfoundation.org
Date: Mon,  8 Apr 2013 16:15:52 -0400
Message-Id: <1365452153-21650-3-git-send-email-michel.thebeau@windriver.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1365452153-21650-1-git-send-email-michel.thebeau@windriver.com>
References: <1365452153-21650-1-git-send-email-michel.thebeau@windriver.com>
Cc: Bruce.Ashfield@windriver.com, Michel.Thebeau@windriver.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] kernel.bbclass: do_strip: allow recipes to strip the kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Apr 2013 20:33:23 -0000

From: Michel Thebeau <michel.thebeau@windriver.com>

Allow recipes to specify sections to be stripped from the kernel output
using KERNEL_IMAGE_STRIP_EXTRA_SECTIONS.  For example:

KERNEL_IMAGE_STRIP_EXTRA_SECTIONS = ".comment .unwanted"

The file to be stripped is a copy of ${KERNEL_OUTPUT} and will be given
the same name with an additional ".stripped" suffix.  The suffix can be
overridden using KERNEL_STRIP_SUFFIX.

Since the toolchain does not give indication when the specified sections
are absent, we read the sections first and make this report by issuing a
warning to the developer.

The toolchain by default strips the image with the -s option (even
when -s is not specified):
-s --strip-all       Remove all symbol and relocation information

For example, these sections are always removed:
.debug_aranges
.debug_info
.debug_abbrev
.debug_line
.debug_frame
.debug_str
.debug_loc
.debug_ranges
.symtab
.strtab

In addition to these, the sections listed in
KERNEL_IMAGE_STRIP_EXTRA_SECTIONS will also be removed.

Only stripping of vmlinux (elf) is supported at this time.  A warning
will be given if the image type is not vmlinux.

Stripping the image could also be done in the kernel, but that would
only work for linux-yocto based kernels, so it's not the route we
decided to go.

[YOCTO 3515]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
---
 meta/classes/kernel.bbclass |   65 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index af58887..60da4e2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -41,6 +41,10 @@ KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
 KERNEL_IMAGEDEST = "boot"
 
+# When we strip the output, it is here
+KERNEL_STRIPPED_SUFFIX ?= ".stripped"
+KERNEL_OUTPUT_STRIPPED ?= "${KERNEL_OUTPUT}${KERNEL_STRIPPED_SUFFIX}"
+
 #
 # configuration
 #
@@ -109,6 +113,12 @@ kernel_do_install() {
 	install -d ${D}/${KERNEL_IMAGEDEST}
 	install -d ${D}/boot
 	install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
+
+	if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
+		install -m 0644 ${KERNEL_OUTPUT_STRIPPED} \
+			${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}${KERNEL_STRIPPED_SUFFIX}
+	fi;
+
 	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
@@ -153,6 +163,12 @@ kernel_do_install() {
 		cd "$pwd"
 	fi
 	install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
+
+	if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
+		install -m 0644 ${KERNEL_OUTPUT_STRIPPED} \
+			$kerneldir/${KERNEL_IMAGETYPE}${KERNEL_STRIPPED_SUFFIX}
+	fi
+
 	install -m 0644 System.map $kerneldir/System.map-${KERNEL_VERSION}
 
 	#
@@ -289,12 +305,46 @@ python split_kernel_packages () {
     do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 }
 
+do_strip() {
+	if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
+		if [[ "${KERNEL_IMAGETYPE}" != "vmlinux" ]]; then
+			bbwarn "image type will not be stripped (not supported): ${KERNEL_IMAGETYPE}"
+			return
+		fi
+
+		cd ${B}
+		cp ${KERNEL_OUTPUT} ${KERNEL_OUTPUT_STRIPPED}
+
+		headers=`"$CROSS_COMPILE"readelf -S ${KERNEL_OUTPUT_STRIPPED} | \
+			  grep "^ \{1,\}\[[0-9 ]\{1,\}\] [^ ]" | \
+			  sed "s/^ \{1,\}\[[0-9 ]\{1,\}\] //" | \
+			  gawk '{print $1}'`
+
+		for str in ${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}; do {
+			if [[ "$headers" != *"$str"* ]]; then
+				bbwarn "Section not found: $str";
+			fi
+
+			"$CROSS_COMPILE"strip -s -R $str ${KERNEL_OUTPUT_STRIPPED}
+		}; done
+	fi;
+}
+do_strip[dirs] = "${B}"
+
+addtask do_strip before do_sizecheck after do_kernel_link_vmlinux
+
 # Support checking the kernel size since some kernels need to reside in partitions
 # with a fixed length or there is a limit in transferring the kernel to memory
 do_sizecheck() {
+	if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
+		koutf=${KERNEL_OUTPUT_STRIPPED}
+	else
+		koutf=${KERNEL_OUTPUT}
+	fi
+
 	if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" ]; then
 		cd ${B}
-		size=`ls -lL ${KERNEL_OUTPUT} | awk '{ print $5}'`
+		size=`ls -lL $koutf | awk '{ print $5}'`
 		if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
 			die "This kernel (size=$size > ${KERNEL_IMAGE_MAXSIZE}) is too big for your device. Please reduce the size of the kernel by making more of it modular."
 		fi
@@ -302,7 +352,7 @@ do_sizecheck() {
 }
 do_sizecheck[dirs] = "${B}"
 
-addtask sizecheck before do_install after do_kernel_link_vmlinux
+addtask sizecheck before do_install after do_strip
 
 KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
 # Don't include the DATETIME variable in the sstate package signatures
@@ -342,6 +392,10 @@ addtask uboot_mkimage before do_install after do_compile
 
 kernel_do_deploy() {
 	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
+	if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
+		install -m 0644 ${KERNEL_OUTPUT_STRIPPED} \
+			${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}${KERNEL_STRIPPED_SUFFIX}.bin
+	fi
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
 		ln -sf ${MODULE_TARBALL_BASE_NAME}.bin ${MODULE_TARBALL_SYMLINK_NAME}
@@ -352,6 +406,13 @@ kernel_do_deploy() {
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
 
+	if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
+		ln -sf ${KERNEL_IMAGE_BASE_NAME}${KERNEL_STRIPPED_SUFFIX}.bin \
+			${KERNEL_IMAGE_SYMLINK_NAME}${KERNEL_STRIPPED_SUFFIX}.bin
+		ln -sf ${KERNEL_IMAGE_BASE_NAME}${KERNEL_STRIPPED_SUFFIX}.bin \
+			${KERNEL_IMAGETYPE}${KERNEL_STRIPPED_SUFFIX}
+	fi
+
 	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
 	cd -
 }
-- 
1.7.9.7



