Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.13227.1599707024435650241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 20:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08A33djt010145
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Sep 2020 20:03:40 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 9 Sep 2020 20:03:34 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] qemu: always define unknown_lock_type
Date: Thu, 10 Sep 2020 10:57:28 +0800
Message-ID: <20200910025728.3868717-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

When use gcc 10.1.0 and debug build is enabled, there comes
below build failure:
| /usr/lib/gcc/x86_64-wrs-linux/10.1.0/../../../../x86_64-wrs-linux/bin/ld.bfd: /mnt/build/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/fsdev/qemu-fsdev-throttle.c:25: undefined reference to `unknown_lock_type'
 | /usr/lib/gcc/x86_64-wrs-linux/10.1.0/../../../../x86_64-wrs-linux/bin/ld.bfd: ../fsdev/qemu-fsdev-throttle.o: in function `fsdev_co_throttle_request':
 | /mnt/build/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/fsdev/qemu-fsdev-throttle.c:103: undefined reference to `unknown_lock_type'
 | /usr/lib/gcc/x86_64-wrs-linux/10.1.0/../../../../x86_64-wrs-linux/bin/ld.bfd: ../fsdev/qemu-fsdev-throttle.o:/mnt/build/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/fsdev/qemu-fsdev-throttle.c:103: more undefined references to `unknown_lock_type' follow
 | collect2: error: ld returned 1 exit status

So always define unknown_lock_type to fix the above error.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...le.h-always-define-unknown_lock_type.patch | 48 +++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_5.1.0.bb      |  5 --
 3 files changed, 49 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-lockable.h-always-define-unknown_lock_type.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5599382a92..d0d4cb7add 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -30,6 +30,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-Add-enable-disable-udev.patch \
 	   file://0001-qemu-Do-not-include-file-if-not-exists.patch \
 	   file://find_datadir.patch \
+	   file://0001-lockable.h-always-define-unknown_lock_type.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-lockable.h-always-define-unknown_lock_type.patch b/meta/recipes-devtools/qemu/qemu/0001-lockable.h-always-define-unknown_lock_type.patch
new file mode 100644
index 0000000000..053ddd4fcc
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-lockable.h-always-define-unknown_lock_type.patch
@@ -0,0 +1,48 @@
+From 8c234bb39eb293a44ca58e15303a359bb782931f Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 9 Sep 2020 08:41:27 +0000
+Subject: [PATCH] lockable.h: always define unknown_lock_type
+
+There comes below build failure when use gcc 10.1.0 and
+"-Og" passed to compiler.
+ | /usr/lib/gcc/x86_64-wrs-linux/10.1.0/../../../../x86_64-wrs-linux/bin/ld.bfd: /mnt/build/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/fsdev/qemu-fsdev-throttle.c:25: undefined reference to `unknown_lock_type'
+ | /usr/lib/gcc/x86_64-wrs-linux/10.1.0/../../../../x86_64-wrs-linux/bin/ld.bfd: ../fsdev/qemu-fsdev-throttle.o: in function `fsdev_co_throttle_request':
+ | /mnt/build/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/fsdev/qemu-fsdev-throttle.c:103: undefined reference to `unknown_lock_type'
+ | /usr/lib/gcc/x86_64-wrs-linux/10.1.0/../../../../x86_64-wrs-linux/bin/ld.bfd: ../fsdev/qemu-fsdev-throttle.o:/mnt/build/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/fsdev/qemu-fsdev-throttle.c:103: more undefined references to `unknown_lock_type' follow
+ | collect2: error: ld returned 1 exit status
+
+So always define unknown_lock_type to fix the above error.
+
+Upstream-Status: Submitted [qemu-devel mailing list]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ include/qemu/lockable.h | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/include/qemu/lockable.h b/include/qemu/lockable.h
+index b620023141..e792ed9a69 100644
+--- a/include/qemu/lockable.h
++++ b/include/qemu/lockable.h
+@@ -25,17 +25,12 @@ struct QemuLockable {
+ };
+ 
+ /* This function gives an error if an invalid, non-NULL pointer type is passed
+- * to QEMU_MAKE_LOCKABLE.  For optimized builds, we can rely on dead-code elimination
+- * from the compiler, and give the errors already at link time.
++ * to QEMU_MAKE_LOCKABLE.
+  */
+-#if defined(__OPTIMIZE__) && !defined(__SANITIZE_ADDRESS__)
+-void unknown_lock_type(void *);
+-#else
+ static inline void unknown_lock_type(void *unused)
+ {
+     abort();
+ }
+-#endif
+ 
+ static inline __attribute__((__always_inline__)) QemuLockable *
+ qemu_make_lockable(void *x, QemuLockable *lockable)
+-- 
+2.26.2
+
diff --git a/meta/recipes-devtools/qemu/qemu_5.1.0.bb b/meta/recipes-devtools/qemu/qemu_5.1.0.bb
index 9b09490269..a4018cc448 100644
--- a/meta/recipes-devtools/qemu/qemu_5.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_5.1.0.bb
@@ -10,11 +10,6 @@ DEPENDS = "glib-2.0 zlib pixman bison-native"
 
 RDEPENDS_${PN}_class-target += "bash"
 
-# Does not compile for -Og because that level does not clean up dead-code.
-# See lockable.h.
-#
-DEBUG_BUILD = "0"
-
 EXTRA_OECONF_append_class-target = " --target-list=${@get_qemu_target_list(d)}"
 EXTRA_OECONF_append_class-target_mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
 EXTRA_OECONF_append_class-nativesdk = " --target-list=${@get_qemu_target_list(d)}"
-- 
2.26.2

