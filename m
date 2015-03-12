Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 276F173960
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 20:14:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 12 Mar 2015 13:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,390,1422950400"; d="scan'208";a="664484504"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 12 Mar 2015 13:14:24 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id DB376300001;
	Thu, 12 Mar 2015 13:14:05 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2015 22:14:03 +0200
Message-Id: <1426191243-12206-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] kernel.bbclass: Fix race condition
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
X-List-Received-Date: Thu, 12 Mar 2015 20:14:24 -0000

Race condition between do_compile_kernelmodules and do_shared_workdir
tasks occurs when do_compilemodules changes files in include/generated/*
while do_shared_workdir tries to copy them to shared working directory.

Functionality of do_shared_workdir has been moved to separate function
mk_shared_workdir and called from do_kernel_compile. do_shared_workdir
left in the code as it may be used in many recipes.

[YOCTO #7321]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/kernel.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 125ed88..aad430a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -231,6 +231,8 @@ kernel_do_install() {
 	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
 	install -d ${D}${sysconfdir}/modules-load.d
 	install -d ${D}${sysconfdir}/modprobe.d
+
+	mk_shared_workdir
 }
 do_install[prefuncs] += "package_get_auto_pr"
 
@@ -245,7 +247,7 @@ emit_depmod_pkgdata() {
 
 PACKAGEFUNCS += "emit_depmod_pkgdata"
 
-do_shared_workdir () {
+mk_shared_workdir () {
 	cd ${B}
 
 	kerneldir=${STAGING_KERNEL_BUILDDIR}
@@ -289,6 +291,14 @@ do_shared_workdir () {
 	fi
 }
 
+# NOTE!!! Functionality of do_shared_workdir has been moved to mk_shared_workdir
+# and called from kernel_do_compile.
+# It caused race condition with do_compile_kernelmodules when it runs
+# in parallel with do_compile_kernelmodules
+do_shared_workdir () {
+	:
+}
+
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
 sysroot_stage_all () {
 	:
-- 
2.1.4


