Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 205B17226D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 09:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4E9VLYN015277 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 10:31:21 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gHlwl0JPHg6F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 10:31:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4E9V5o5015266
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 10:31:16 +0100
Message-ID: <1431595865.30971.188.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 May 2015 10:31:05 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: module/module-base/lttng-modules: Improve kernel module dependencies
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
X-List-Received-Date: Thu, 14 May 2015 09:31:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If we have DEPENDS = "virtual/kernel" is means that the kernel module
depends on the kernel's do_populate_sysroot task. This is not entirely
desireable since that depends on do_install which depends on
do_compile_kernelmodules and so on. In a situation where rm_work in involved
this can cause some pretty length build cycles after the kernel workdir
has been cleaned up by rm_work.

As well as removing this, take the opportunity to clean up duplicated
dependency lines, tweak the dependency of make_scripts for the same
reason and generally try and make things more readable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 026d80a..e94cf3c 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -1,5 +1,8 @@
 inherit kernel-arch
 
+# This is instead of DEPENDS = "virtual/kernel"
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 
@@ -15,8 +18,6 @@ KERNEL_OBJECT_SUFFIX = ".ko"
 # kernel modules are generally machine specific
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-do_configure[depends] += "virtual/kernel:do_shared_workdir"
-
 EXTRA_KERNELSRC_TARGETS = ""
 
 # Function to ensure the kernel scripts are created. Expected to
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index a03cc74..0952c0c 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -1,10 +1,8 @@
-DEPENDS += "virtual/kernel"
-
 inherit module-base kernel-module-split
 
 addtask make_scripts after do_patch before do_compile
 do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
-do_make_scripts[deptask] = "do_populate_sysroot"
+do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
 
 EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.6.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.6.0.bb
index 4cf01ca..420b691 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.6.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.6.0.bb
@@ -6,9 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1412caf5a1aa90d6a48588a4794c0eac \
                     file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
                     file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
 
-DEPENDS = "virtual/kernel"
-do_configure[depends] += "virtual/kernel:do_shared_workdir"
-
 inherit module
 
 SRCREV = "1b2a5429de815c95643df2eadf91253909708728"



