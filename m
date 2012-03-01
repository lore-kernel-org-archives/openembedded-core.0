Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S2vtM-0006Qw-Bc
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 03:37:16 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q212SgAq027205;
	Wed, 29 Feb 2012 18:28:43 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 29 Feb 2012 21:27:07 -0500
Message-Id: <af4eb4032c08f20a7a33b29f8ac296304353c101.1330568367.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1330568367.git.bruce.ashfield@windriver.com>
References: <cover.1330568367.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1330568367.git.bruce.ashfield@windriver.com>
References: <cover.1330568367.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/1] linux-libc-headers-yocto: bump to v3.2.8
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
X-List-Received-Date: Thu, 01 Mar 2012 02:37:16 -0000

Making two changes for BSPs that prefer linux-libc-headers-yocto:

  - bumping to v3.2.8 headers
  - stubbing out unecessary linux-yocto functions when headers
    are being built

[YOCTO #2032]

Acked-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../linux-libc-headers-yocto_git.bb                |   29 +++++++++++++-------
 1 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
index 734170f..7aa9322 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
@@ -8,12 +8,13 @@ DEPENDS += "unifdef-native"
 PROVIDES = "linux-libc-headers"
 RPROVIDES_${PN}-dev = "linux-libc-headers-dev"
 RPROVIDES_${PN}-dbg = "linux-libc-headers-dbg"
-SRCREV = "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
-PV = "2.6.37+git-${SRCPV}"
-PR = "r4"
+SRCREV = "21ab5dca134a6bf1316aa59f69f9ee9e091d5702"
+KBRANCH ?= "standard/base"
+KMETA ?= "meta"
+PV = "3.2+git-${SRCPV}"
+PR = "r5"
 
-SRCREV_FORMAT = "meta_machine"
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
 # force this to empty to prevent installation failures, we aren't
 # building a device tree as part of kern headers
@@ -35,6 +36,16 @@ do_configure() {
 	oe_runmake allnoconfig ARCH=$ARCH
 }
 
+do_install() {
+	set_arch
+	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
+
+        # The ..install.cmd conflicts between various configure runs
+        find ${D}${includedir} -name ..install.cmd | xargs rm -f
+}
+
+# The following tasks are not required when we just want
+# headers. So we override and stub them out.
 do_kernel_configme() {
 }
 
@@ -44,12 +55,10 @@ do_patch () {
 do_compile () {
 }
 
-do_install() {
-	set_arch
-	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
+do_validate_branches () {
+}
 
-        # The ..install.cmd conflicts between various configure runs
-        find ${D}${includedir} -name ..install.cmd | xargs rm -f
+do_kernel_configcheck () {
 }
 
 BBCLASSEXTEND = "nativesdk"
-- 
1.7.0.4



