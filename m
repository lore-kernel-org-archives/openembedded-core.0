Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QuHZi-0005jv-HP
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 07:24:58 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7J5KA7s005178;
	Thu, 18 Aug 2011 22:20:14 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 19 Aug 2011 01:20:05 -0400
Message-Id: <cc17e78e6c64336c8fc169a1868ff06190539d5e.1313730559.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1313730559.git.bruce.ashfield@windriver.com>
References: <cover.1313730559.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1313730559.git.bruce.ashfield@windriver.com>
References: <cover.1313730559.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 2/3] linux-yocto: move more default values into linux-yocto.inc
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
X-List-Received-Date: Fri, 19 Aug 2011 05:24:59 -0000

During the preparation of some linux-yocto extension documentation it
was clear that some variables are being defined in each recipe, when
they don't have to be. Moving the defaults into linux-yocto.in and
allowing them to be overidden in recipes simpifies the re-use of the
base infrastructure.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc    |    7 +++++++
 meta/recipes-kernel/linux/linux-yocto_3.0.bb |    5 -----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 595795b..11b77ce 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -12,6 +12,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 # Set this to 'preempt_rt' in the local.conf if you want a real time kernel
 LINUX_KERNEL_TYPE ?= standard
 
+KMETA ?= meta
+SRCREV_FORMAT ?= "meta_machine" 
+
+LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
+KERNEL_REVISION_CHECKING ?= "t"
+YOCTO_KERNEL_META_DATA ?= t
+
 do_patch[depends] = "kern-tools-native:do_populate_sysroot"
 
 addtask kernel_configme before do_configure after do_patch
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 5d9871f..3ebd830 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -9,10 +9,8 @@ KMACHINE_qemumips = "yocto/standard/mti-malta32-be"
 KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 
 KBRANCH = ${KMACHINE}
-KMETA = meta
 
 LINUX_VERSION ?= "3.0"
-LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
 SRCREV_machine_qemuarm = "36b4cdddcafc711f0ec9ad97882f23a6443c61b2"
 SRCREV_machine_qemumips = "2db2aacc589a518a74e8a8543e80403f09de8134"
@@ -31,14 +29,11 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;nocheckout=1;
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
 
 # Functionality flags
-KERNEL_REVISION_CHECKING ?= "t"
 KERNEL_FEATURES="features/netfilter"
 KERNEL_FEATURES_append=" features/taskstats"
 KERNEL_FEATURES_append_qemux86=" cfg/sound"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
 
-YOCTO_KERNEL_META_DATA=t
-
 # extra tasks
 addtask kernel_link_vmlinux after do_compile before do_install
 addtask validate_branches before do_patch after do_kernel_checkout
-- 
1.7.4.1



