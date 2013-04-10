Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michel.thebeau@windriver.com>) id 1UPuXX-0006tq-Rk
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 14:54:18 +0200
Received: from yow-mthebeau-lx2.wrs.com (yow-mthebeau-lx2.wrs.com
	[128.224.146.159])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3ACanOG014628;
	Wed, 10 Apr 2013 05:36:50 -0700 (PDT)
From: michel.thebeau@windriver.com
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2013 08:36:47 -0400
Message-Id: <1365597407-16068-2-git-send-email-michel.thebeau@windriver.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1365597407-16068-1-git-send-email-michel.thebeau@windriver.com>
References: <1365597407-16068-1-git-send-email-michel.thebeau@windriver.com>
Subject: [PATCH] kernel.bbclass: do_strip: allow recipes to strip the kernel
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
X-List-Received-Date: Wed, 10 Apr 2013 12:54:19 -0000

From: Michel Thebeau <michel.thebeau@windriver.com>

Allow recipes to specify sections to be stripped from the kernel output
using KERNEL_IMAGE_STRIP_EXTRA_SECTIONS.  For example:

KERNEL_IMAGE_STRIP_EXTRA_SECTIONS = ".comment .unwanted"

The kernel output is stripped in place.

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
 meta/classes/kernel.bbclass |   33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index af58887..f3a5553 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -88,7 +88,7 @@ do_compile_kernelmodules() {
 		bbnote "no modules to compile"
 	fi
 }
-addtask compile_kernelmodules after do_compile before do_install
+addtask compile_kernelmodules after do_compile before do_strip
 
 kernel_do_install() {
 	#
@@ -289,6 +289,35 @@ python split_kernel_packages () {
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
+		headers=`"$CROSS_COMPILE"readelf -S ${KERNEL_OUTPUT} | \
+			  grep "^ \{1,\}\[[0-9 ]\{1,\}\] [^ ]" | \
+			  sed "s/^ \{1,\}\[[0-9 ]\{1,\}\] //" | \
+			  gawk '{print $1}'`
+
+		for str in ${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}; do {
+			if [[ "$headers" != *"$str"* ]]; then
+				bbwarn "Section not found: $str";
+			fi
+
+			"$CROSS_COMPILE"strip -s -R $str ${KERNEL_OUTPUT}
+		}; done
+
+		bbnote "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sections:" \
+			"${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}"
+	fi;
+}
+do_strip[dirs] = "${B}"
+
+addtask do_strip before do_sizecheck after do_kernel_link_vmlinux
+
 # Support checking the kernel size since some kernels need to reside in partitions
 # with a fixed length or there is a limit in transferring the kernel to memory
 do_sizecheck() {
@@ -302,7 +331,7 @@ do_sizecheck() {
 }
 do_sizecheck[dirs] = "${B}"
 
-addtask sizecheck before do_install after do_kernel_link_vmlinux
+addtask sizecheck before do_install after do_strip
 
 KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
 # Don't include the DATETIME variable in the sstate package signatures
-- 
1.7.9.7



