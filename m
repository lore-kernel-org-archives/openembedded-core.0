Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Sfd3y-0004Fw-F9
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 22:24:10 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.wrs.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5FKDQAC020236;
	Fri, 15 Jun 2012 13:13:28 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 15 Jun 2012 16:23:02 -0400
Message-Id: <4c36f782924b4055896a740706ba10846d282231.1339791495.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1339791495.git.bruce.ashfield@windriver.com>
References: <cover.1339791495.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1339791495.git.bruce.ashfield@windriver.com>
References: <cover.1339791495.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, liang.li@windriver.com,
	saul.wold@intel.com
Subject: [PATCH 2/2] recipes-kernel: remove linux-tools.inc
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
X-List-Received-Date: Fri, 15 Jun 2012 20:24:10 -0000

perf has been moved to a standalone package, making linux-tools.inc
unecessary. It can now be removed and recipes that included it
updated.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-tools.inc       |   41 -----------------------
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 -
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    2 -
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    2 -
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 -
 meta/recipes-kernel/linux/linux-yocto_3.2.bb    |    2 -
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 -
 7 files changed, 0 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-tools.inc

diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-kernel/linux/linux-tools.inc
deleted file mode 100644
index 3b03c05..0000000
--- a/meta/recipes-kernel/linux/linux-tools.inc
+++ /dev/null
@@ -1,41 +0,0 @@
-# included by kernel recipes if they want to build/provide
-# perf functionality from their tree.
-
-BUILDPERF = "yes"
-BUILDPERF_libc-uclibc = "no"
-# perf requires binutils which is GPLv3 licensed, don't prevent the entire kernel
-# being built if GPLv3 is in INCOMPATIBLE_LICENSE
-python () {
-    if ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1):
-       # GPLv3, drop perf
-       d.setVar("BUILDPERF", "no")
-       d.setVar("PERFDEPENDS", "")
-}
-
-do_compile_perf () {
-    if [ "${BUILDPERF}" = "yes" ]; then
-	oe_runmake -C ${S}/tools/perf CC="${CC}" LD="${LD}" prefix=${prefix} NO_NEWT=1 NO_DWARF=1
-    fi
-}
-
-fakeroot do_install_perf () {
-    if [ "${BUILDPERF}" = "yes" ]; then
-	oe_runmake -C ${S}/tools/perf CC="${CC}" LD="${LD}" prefix=${prefix} DESTDIR=${D} install NO_NEWT=1 NO_DWARF=1
-    fi
-}
-
-
-# perf tasks
-addtask compile_perf after do_compile before do_install
-addtask install_perf after do_install before do_package
-
-do_compile_perf[umask] = "022"
-do_install_perf[umask] = "022"
-
-PERFDEPENDS = "virtual/${MLPREFIX}libc:do_populate_sysroot ${MLPREFIX}elfutils:do_populate_sysroot ${MLPREFIX}binutils:do_populate_sysroot"
-PERFDEPENDS_libc-uclibc = ""
-PERFRDEPENDS = "python perl elfutils"
-PERFRDEPENDS_libc-uclibc = ""
-
-do_compile_perf[depends] = "${PERFDEPENDS}"
-RDEPENDS_perf += "${PERFRDEPENDS}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index a39b966..971d1a8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -27,5 +27,3 @@ KERNEL_FEATURES = "features/netfilter"
 KERNEL_FEATURES_append = " features/taskstats"
 KERNEL_FEATURES_append_qemux86 = " cfg/sound"
 KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
-
-require recipes-kernel/linux/linux-tools.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index a07b27a..ada66b8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -28,5 +28,3 @@ KERNEL_FEATURES = "features/netfilter"
 KERNEL_FEATURES_append = " features/taskstats"
 KERNEL_FEATURES_append_qemux86 = " cfg/sound"
 KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
-
-require recipes-kernel/linux/linux-tools.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 81730ea..52f2dd1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -28,5 +28,3 @@ KERNEL_FEATURES = "features/netfilter"
 KERNEL_FEATURES_append = " features/taskstats"
 KERNEL_FEATURES_append_qemux86 = " cfg/sound"
 KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
-
-require recipes-kernel/linux/linux-tools.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 440821c..5cdff95 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -32,5 +32,3 @@ KERNEL_FEATURES = "features/netfilter"
 KERNEL_FEATURES_append = " features/taskstats"
 KERNEL_FEATURES_append_qemux86 = " cfg/sound"
 KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
-
-require linux-tools.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index e6cf9bb..3e4a9dd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -32,5 +32,3 @@ KERNEL_FEATURES="features/netfilter"
 KERNEL_FEATURES_append=" features/taskstats"
 KERNEL_FEATURES_append_qemux86=" cfg/sound"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
-
-require linux-tools.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index af6130d..eb5e888 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -34,5 +34,3 @@ KERNEL_REVISION_CHECKING=""
 KERNEL_FEATURES="features/netfilter"
 KERNEL_FEATURES_append_qemux86=" cfg/sound"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
-
-require recipes-kernel/linux/linux-tools.inc
-- 
1.7.7



