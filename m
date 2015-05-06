Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 561AC73EFD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 10:26:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 06 May 2015 03:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,379,1427785200"; d="scan'208";a="690713991"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 06 May 2015 03:26:11 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id E783E6A408D;
	Wed,  6 May 2015 03:25:42 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 May 2015 13:26:07 +0300
Message-Id: <1430907967-19805-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430856401.8074.13.camel@linuxfoundation.org>
References: <1430856401.8074.13.camel@linuxfoundation.org>
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
X-List-Received-Date: Wed, 06 May 2015 10:26:17 -0000

Race condition between do_compile_kernelmodules and do_shared_workdir
tasks occurs when do_compile_kernelmodules changes files in
include/generated/* while do_shared_workdir tries to copy them to
shared working directory.

Functionality of do_shared_workdir has been moved to separate function
mk_shared_workdir and called from do_compile_kernelmodules.
do_shared_workdir is left in the code as it may be used in many recipes.

[YOCTO #7321]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 125ed88..7878a73 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -201,6 +201,8 @@ do_compile_kernelmodules() {
 	else
 		bbnote "no modules to compile"
 	fi
+
+	mk_shared_workdir
 }
 addtask compile_kernelmodules after do_compile before do_strip
 
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


