Return-Path: <Jian.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 02D9F731DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 05:26:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0K5Qhap016561
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:26:43 -0800 (PST)
Received: from pek-jliu7-d1.corp.ad.wrs.com (128.224.162.169) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 19 Jan 2016 21:26:42 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jan 2016 13:27:39 +0800
Message-ID: <1453267659-18756-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] kernel-devsrc: Fix backward compaibilty
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
X-List-Received-Date: Wed, 20 Jan 2016 05:26:43 -0000
Content-Type: text/plain

kernel-dev is replaced by kernel-devsrc, which breaks
backward compaibilty.
 -- add alias for kernel-devsrc
 -- kernel-devsrc provides the kernel-dev.
 -- remove kernel-dev from the sub-packages of linux-windriver

Signed-off-by: Jian Liu <jian.liu@windriver.com>

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index dee6f7d..84ab078 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -371,11 +371,10 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERISON}
-PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
+PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-modules"
 FILES_${PN} = ""
 FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
 FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
-FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
 FILES_kernel-vmlinux = "/boot/vmlinux*"
 FILES_kernel-modules = ""
 RDEPENDS_kernel = "kernel-base"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 7100ed7..07f8fbe 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -16,6 +16,8 @@ BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 # Set a variable to get to the top of the metadata location
 COREBASE = '${@os.path.normpath("${LAYERDIR}/../")}'
 
+PREFERRED_PROVIDER_virtual/kernel-dev = "kernel-devsrc"
+
 # opkg-utils is for update-alternatives :(
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   sysvinit-inittab \
diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 196c8c7..fa641f3 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -74,3 +74,9 @@ do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 PACKAGES = "kernel-devsrc"
 FILES_${PN} = "${KERNEL_SRC_PATH}"
 RDEPENDS_${PN} = "bc"
+
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "kernel-dev"
+RREPLACES_${PN} = "kernel-dev"
+RCONFLICTS_${PN} = "kernel-dev"
+PROVIDES += "kernel-dev"

