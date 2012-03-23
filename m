Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SB85B-0000Xi-FO
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 18:15:21 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2NH6IQm007657;
	Fri, 23 Mar 2012 10:06:21 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 23 Mar 2012 13:07:48 -0400
Message-Id: <47a6043c6b3b5dcf06c7d57eb5b21c93936be01e.1332522200.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1332522200.git.bruce.ashfield@windriver.com>
References: <cover.1332522200.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1332522200.git.bruce.ashfield@windriver.com>
References: <cover.1332522200.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 3/3] linux-libc-headers-yocto: remove from oe-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2012 17:15:21 -0000

The linux-libc-headers-yocto is not required in oe-core, it can be
moved to yocto specific layers. The linux-libc-headers_* recipes
provide sufficient headers fore core users.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../linux-libc-headers-yocto_git.bb                |   64 --------------------
 1 files changed, 0 insertions(+), 64 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
deleted file mode 100644
index 7aa9322..0000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
+++ /dev/null
@@ -1,64 +0,0 @@
-require linux-libc-headers.inc
-include recipes-kernel/linux/linux-yocto.inc
-
-B = "${S}"
-
-INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS += "unifdef-native"
-PROVIDES = "linux-libc-headers"
-RPROVIDES_${PN}-dev = "linux-libc-headers-dev"
-RPROVIDES_${PN}-dbg = "linux-libc-headers-dbg"
-SRCREV = "21ab5dca134a6bf1316aa59f69f9ee9e091d5702"
-KBRANCH ?= "standard/base"
-KMETA ?= "meta"
-PV = "3.2+git-${SRCPV}"
-PR = "r5"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
-
-# force this to empty to prevent installation failures, we aren't
-# building a device tree as part of kern headers
-KERNEL_DEVICETREE = ""
-
-set_arch() {
-	case ${TARGET_ARCH} in
-		arm*)     ARCH=arm ;;
-		i*86*)    ARCH=i386 ;;
-		ia64*)    ARCH=ia64 ;;
-		mips*)    ARCH=mips ;;
-		powerpc*) ARCH=powerpc ;;
-		x86_64*)  ARCH=x86_64 ;;
-	esac
-}
-
-do_configure() {
-	set_arch
-	oe_runmake allnoconfig ARCH=$ARCH
-}
-
-do_install() {
-	set_arch
-	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
-
-        # The ..install.cmd conflicts between various configure runs
-        find ${D}${includedir} -name ..install.cmd | xargs rm -f
-}
-
-# The following tasks are not required when we just want
-# headers. So we override and stub them out.
-do_kernel_configme() {
-}
-
-do_patch () {
-}
-
-do_compile () {
-}
-
-do_validate_branches () {
-}
-
-do_kernel_configcheck () {
-}
-
-BBCLASSEXTEND = "nativesdk"
-- 
1.7.0.4



