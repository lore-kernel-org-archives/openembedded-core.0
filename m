Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB3D76FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 20:03:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 03 Sep 2015 13:03:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,463,1437462000"; d="scan'208";a="782183028"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2015 13:03:22 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 15:03:30 -0500
Message-Id: <1441310610-965-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] qemu: Fix qemu_cpu_kick_thread on init
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
X-List-Received-Date: Thu, 03 Sep 2015 20:03:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When QEMU starts the RCU thread executes qemu_mutex_lock_thread
causing error "qemu:qemu_cpu_kick_thread: No such process" and exits.

For detail explanation see upstream patch.

[YOCTO #8143]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  1 +
 ..._mutex_lock_iothread-fix-race-condition-a.patch | 45 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index dc7b628..738bf2b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -21,6 +21,7 @@ SRC_URI = "\
     file://wacom.patch \
     file://add-ptest-in-makefile.patch \
     file://run-ptest \
+    file://cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch \
     "
 
 SRC_URI_append_class-native = "\
diff --git a/meta/recipes-devtools/qemu/qemu/cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch b/meta/recipes-devtools/qemu/qemu/cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch
new file mode 100644
index 0000000..45dffab
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch
@@ -0,0 +1,45 @@
+Upstream-Status: Submitted
+
+From f354b9333408d411854af058cc44cceda60b4473 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
+Date: Thu, 3 Sep 2015 14:07:34 -0500
+Subject: [PATCH] cpus.c: qemu_mutex_lock_iothread fix race condition at cpu
+ thread init
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When QEMU starts the RCU thread executes qemu_mutex_lock_thread
+causing error "qemu:qemu_cpu_kick_thread: No such process" and exits.
+
+This isn't occur frequently but in glibc the thread id can exist and
+this not guarantee that the thread is on active/running state. If is
+inserted a sleep(1) after newthread assignment [1] the issue appears.
+
+So not make assumption that thread exist if first_cpu->thread is set
+then change the validation of cpu to created that is set into cpu
+threads (kvm, tcg, dummy).
+
+[1] https://sourceware.org/git/?p=glibc.git;a=blob;f=nptl/pthread_create.c;h=d10f4ea8004e1d8f3a268b95cc0f8d93b8d89867;hb=HEAD#l621
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+---
+ cpus.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cpus.c b/cpus.c
+index 7e4786e..05e5400 100644
+--- a/cpus.c
++++ b/cpus.c
+@@ -1171,7 +1171,7 @@ void qemu_mutex_lock_iothread(void)
+      * TCG code execution.
+      */
+     if (!tcg_enabled() || qemu_in_vcpu_thread() ||
+-        !first_cpu || !first_cpu->thread) {
++        !first_cpu || !first_cpu->created) {
+         qemu_mutex_lock(&qemu_global_mutex);
+         atomic_dec(&iothread_requesting_mutex);
+     } else {
+-- 
+1.9.1
+
-- 
1.9.1


