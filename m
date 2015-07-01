Return-Path: <Jian.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F243E65C5F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 06:16:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t616Gv4f000063
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 23:16:57 -0700 (PDT)
Received: from localhost.localdomain (128.224.153.43) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 30 Jun 2015 23:16:58 -0700
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Jul 2015 14:16:56 +0800
Message-ID: <1435731416-31190-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.7.0.5
MIME-Version: 1.0
Subject: [PATCH] kernel-devsrc: missing tools for building modules
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
X-List-Received-Date: Wed, 01 Jul 2015 06:17:02 -0000
Content-Type: text/plain

Some tools under scripts are missed and this can cause error
during building modules on the target
Build these tools by "make script".

Also handle the .debug directories.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index dd65788..ff03d4e 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -57,6 +57,9 @@ do_install() {
         # architecture (since scripts and helpers are native format).
         KBUILD_OUTPUT="$kerneldir"
         oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean _mrproper_scripts
+        # Tools under scripts/ is necessary.
+        cross_tool_prefix=${@d.getVar('TARGET_RAW_PREFIX', True) or ""}
+        make -C $kerneldir CROSS_COMPILE=$cross_tool_prefix scripts
 
         # As of Linux kernel version 3.0.1, the clean target removes
         # arch/powerpc/lib/crtsavres.o which is present in
@@ -71,6 +74,7 @@ do_install() {
 # Ensure we don't race against "make scripts" during cpio
 do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 
-PACKAGES = "kernel-devsrc"
+PACKAGES = "kernel-devsrc-dbg kernel-devsrc"
+FILES_${PN}-dbg = "${KERNEL_SRC_PATH}/scripts/.debug ${KERNEL_SRC_PATH}/scripts/*/.debug"
 FILES_${PN} = "${KERNEL_SRC_PATH}"
 RDEPENDS_${PN} = "bc"
-- 
1.8.5.2.233.g932f7e4


