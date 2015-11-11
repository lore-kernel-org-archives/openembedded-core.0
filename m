Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DA03177146
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 15:50:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 11 Nov 2015 07:50:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,276,1444719600"; d="scan'208";a="598342173"
Received: from sentry.rb.intel.com ([10.237.105.108])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Nov 2015 07:50:03 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 17:51:08 +0200
Message-Id: <a17aa3975514886add53b9add383218567a496f3.1447256967.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1447256967.git.cristian.iorga@intel.com>
References: <cover.1447256967.git.cristian.iorga@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1447256967.git.cristian.iorga@intel.com>
References: <cover.1447256967.git.cristian.iorga@intel.com>
Subject: [PATCH 1/2] qemu: upgrade to 2.4.1
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
X-List-Received-Date: Wed, 11 Nov 2015 15:50:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch removed,
inluded upstream

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  1 -
 ..._mutex_lock_iothread-fix-race-condition-a.patch | 45 ----------------------
 .../qemu/{qemu_2.4.0.bb => qemu_2.4.1.bb}          |  4 +-
 3 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch
 rename meta/recipes-devtools/qemu/{qemu_2.4.0.bb => qemu_2.4.1.bb} (85%)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index abbace8..a2b08ae 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -21,7 +21,6 @@ SRC_URI = "\
     file://wacom.patch \
     file://add-ptest-in-makefile.patch \
     file://run-ptest \
-    file://cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch \
     "
 
 SRC_URI_append_class-native = "\
diff --git a/meta/recipes-devtools/qemu/qemu/cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch b/meta/recipes-devtools/qemu/qemu/cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch
deleted file mode 100644
index 45dffab..0000000
--- a/meta/recipes-devtools/qemu/qemu/cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Upstream-Status: Submitted
-
-From f354b9333408d411854af058cc44cceda60b4473 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
-Date: Thu, 3 Sep 2015 14:07:34 -0500
-Subject: [PATCH] cpus.c: qemu_mutex_lock_iothread fix race condition at cpu
- thread init
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When QEMU starts the RCU thread executes qemu_mutex_lock_thread
-causing error "qemu:qemu_cpu_kick_thread: No such process" and exits.
-
-This isn't occur frequently but in glibc the thread id can exist and
-this not guarantee that the thread is on active/running state. If is
-inserted a sleep(1) after newthread assignment [1] the issue appears.
-
-So not make assumption that thread exist if first_cpu->thread is set
-then change the validation of cpu to created that is set into cpu
-threads (kvm, tcg, dummy).
-
-[1] https://sourceware.org/git/?p=glibc.git;a=blob;f=nptl/pthread_create.c;h=d10f4ea8004e1d8f3a268b95cc0f8d93b8d89867;hb=HEAD#l621
-
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
----
- cpus.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cpus.c b/cpus.c
-index 7e4786e..05e5400 100644
---- a/cpus.c
-+++ b/cpus.c
-@@ -1171,7 +1171,7 @@ void qemu_mutex_lock_iothread(void)
-      * TCG code execution.
-      */
-     if (!tcg_enabled() || qemu_in_vcpu_thread() ||
--        !first_cpu || !first_cpu->thread) {
-+        !first_cpu || !first_cpu->created) {
-         qemu_mutex_lock(&qemu_global_mutex);
-         atomic_dec(&iothread_requesting_mutex);
-     } else {
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0.bb b/meta/recipes-devtools/qemu/qemu_2.4.1.bb
similarity index 85%
rename from meta/recipes-devtools/qemu/qemu_2.4.0.bb
rename to meta/recipes-devtools/qemu/qemu_2.4.1.bb
index 1505b80..1f39cb5 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.4.1.bb
@@ -12,8 +12,8 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://no-valgrind.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "186ee8194140a484a455f8e3c74589f4"
-SRC_URI[sha256sum] = "72b0b991bbcc540663a019e1e8c4f714053b691dda32c9b9ee80b25f367e6620"
+SRC_URI[md5sum] = "a895e93ec1dafc34bc64ed676f0d55a6"
+SRC_URI[sha256sum] = "e3d5cf4c8b1f9129c9c797329a515bfb6b3b1ded0ab8b394c8a316490fe3a177"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
 
-- 
2.5.0


