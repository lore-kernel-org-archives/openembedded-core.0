Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A192478353
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 10:14:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7IAEXZR014865
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 03:14:33 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 18 Aug 2017 03:14:32 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Aug 2017 18:19:13 +0800
Message-ID: <c17c2cb0b7604c7ebc21eccd2887abd19c07416c.1503049300.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1503049300.git.Qi.Chen@windriver.com>
References: <cover.1503049300.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] qemu: backport patches to fix boot failure
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
X-List-Received-Date: Fri, 18 Aug 2017 10:14:32 -0000
Content-Type: text/plain

Backport two patches to fix the following error when booting qemu.

  Failed to unlock byte 100

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...0001-osdep-Add-runtime-OFD-lock-detection.patch | 141 +++++++++++++++++++++
 ...e-posix-Do-runtime-check-for-ofd-lock-API.patch |  71 +++++++++++
 meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb      |   2 +
 3 files changed, 214 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-osdep-Add-runtime-OFD-lock-detection.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-file-posix-Do-runtime-check-for-ofd-lock-API.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-osdep-Add-runtime-OFD-lock-detection.patch b/meta/recipes-devtools/qemu/qemu/0001-osdep-Add-runtime-OFD-lock-detection.patch
new file mode 100644
index 0000000..f83f0d2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-osdep-Add-runtime-OFD-lock-detection.patch
@@ -0,0 +1,141 @@
+From ca749954b09b89e22cd69c4949fb7e689b057963 Mon Sep 17 00:00:00 2001
+From: Fam Zheng <famz@redhat.com>
+Date: Fri, 11 Aug 2017 19:44:46 +0800
+Subject: [PATCH 1/2] osdep: Add runtime OFD lock detection
+
+Build time check of OFD lock is not sufficient and can cause image open
+errors when the runtime environment doesn't support it.
+
+Add a helper function to probe it at runtime, additionally. Also provide
+a qemu_has_ofd_lock() for callers to check the status.
+
+Signed-off-by: Fam Zheng <famz@redhat.com>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+
+Upstream-Status: Backport
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ include/qemu/osdep.h |  1 +
+ util/osdep.c         | 66 ++++++++++++++++++++++++++++++++++++++++++++--------
+ 2 files changed, 57 insertions(+), 10 deletions(-)
+
+diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
+index 3b74f6fcb2..6855b94bbf 100644
+--- a/include/qemu/osdep.h
++++ b/include/qemu/osdep.h
+@@ -357,6 +357,7 @@ int qemu_dup(int fd);
+ int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
+ int qemu_unlock_fd(int fd, int64_t start, int64_t len);
+ int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
++bool qemu_has_ofd_lock(void);
+ 
+ #if defined(__HAIKU__) && defined(__i386__)
+ #define FMT_pid "%ld"
+diff --git a/util/osdep.c b/util/osdep.c
+index a2863c8e53..a479fedc4a 100644
+--- a/util/osdep.c
++++ b/util/osdep.c
+@@ -38,14 +38,6 @@ extern int madvise(caddr_t, size_t, int);
+ #include "qemu/error-report.h"
+ #include "monitor/monitor.h"
+ 
+-#ifdef F_OFD_SETLK
+-#define QEMU_SETLK F_OFD_SETLK
+-#define QEMU_GETLK F_OFD_GETLK
+-#else
+-#define QEMU_SETLK F_SETLK
+-#define QEMU_GETLK F_GETLK
+-#endif
+-
+ static bool fips_enabled = false;
+ 
+ static const char *hw_version = QEMU_HW_VERSION;
+@@ -82,6 +74,10 @@ int qemu_madvise(void *addr, size_t len, int advice)
+ }
+ 
+ #ifndef _WIN32
++
++static int fcntl_op_setlk = -1;
++static int fcntl_op_getlk = -1;
++
+ /*
+  * Dups an fd and sets the flags
+  */
+@@ -149,6 +145,54 @@ static int qemu_parse_fdset(const char *param)
+     return qemu_parse_fd(param);
+ }
+ 
++static void qemu_probe_lock_ops(void)
++{
++    if (fcntl_op_setlk == -1) {
++#ifdef F_OFD_SETLK
++        int fd;
++        int ret;
++        struct flock fl = {
++            .l_whence = SEEK_SET,
++            .l_start  = 0,
++            .l_len    = 0,
++            .l_type   = F_WRLCK,
++        };
++
++        fd = open("/dev/null", O_RDWR);
++        if (fd < 0) {
++            fprintf(stderr,
++                    "Failed to open /dev/null for OFD lock probing: %s\n",
++                    strerror(errno));
++            fcntl_op_setlk = F_SETLK;
++            fcntl_op_getlk = F_GETLK;
++            return;
++        }
++        ret = fcntl(fd, F_OFD_GETLK, &fl);
++        close(fd);
++        if (!ret) {
++            fcntl_op_setlk = F_OFD_SETLK;
++            fcntl_op_getlk = F_OFD_GETLK;
++        } else {
++            fcntl_op_setlk = F_SETLK;
++            fcntl_op_getlk = F_GETLK;
++        }
++#else
++        fcntl_op_setlk = F_SETLK;
++        fcntl_op_getlk = F_GETLK;
++#endif
++    }
++}
++
++bool qemu_has_ofd_lock(void)
++{
++    qemu_probe_lock_ops();
++#ifdef F_OFD_SETLK
++    return fcntl_op_setlk == F_OFD_SETLK;
++#else
++    return false;
++#endif
++}
++
+ static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, int fl_type)
+ {
+     int ret;
+@@ -158,7 +202,8 @@ static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, int fl_type)
+         .l_len    = len,
+         .l_type   = fl_type,
+     };
+-    ret = fcntl(fd, QEMU_SETLK, &fl);
++    qemu_probe_lock_ops();
++    ret = fcntl(fd, fcntl_op_setlk, &fl);
+     return ret == -1 ? -errno : 0;
+ }
+ 
+@@ -181,7 +226,8 @@ int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)
+         .l_len    = len,
+         .l_type   = exclusive ? F_WRLCK : F_RDLCK,
+     };
+-    ret = fcntl(fd, QEMU_GETLK, &fl);
++    qemu_probe_lock_ops();
++    ret = fcntl(fd, fcntl_op_getlk, &fl);
+     if (ret == -1) {
+         return -errno;
+     } else {
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0002-file-posix-Do-runtime-check-for-ofd-lock-API.patch b/meta/recipes-devtools/qemu/qemu/0002-file-posix-Do-runtime-check-for-ofd-lock-API.patch
new file mode 100644
index 0000000..0dacde4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0002-file-posix-Do-runtime-check-for-ofd-lock-API.patch
@@ -0,0 +1,71 @@
+From 2b218f5dbcca5fe728b1852d161d7a21fd02b2f5 Mon Sep 17 00:00:00 2001
+From: Fam Zheng <famz@redhat.com>
+Date: Fri, 11 Aug 2017 19:44:47 +0800
+Subject: [PATCH 2/2] file-posix: Do runtime check for ofd lock API
+
+It is reported that on Windows Subsystem for Linux, ofd operations fail
+with -EINVAL. In other words, QEMU binary built with system headers that
+exports F_OFD_SETLK doesn't necessarily run in an environment that
+actually supports it:
+
+$ qemu-system-aarch64 ... -drive file=test.vhdx,if=none,id=hd0 \
+    -device virtio-blk-pci,drive=hd0
+qemu-system-aarch64: -drive file=test.vhdx,if=none,id=hd0: Failed to unlock byte 100
+qemu-system-aarch64: -drive file=test.vhdx,if=none,id=hd0: Failed to unlock byte 100
+qemu-system-aarch64: -drive file=test.vhdx,if=none,id=hd0: Failed to lock byte 100
+
+As a matter of fact this is not WSL specific. It can happen when running
+a QEMU compiled against a newer glibc on an older kernel, such as in
+a containerized environment.
+
+Let's do a runtime check to cope with that.
+
+Reported-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
+Reviewed-by: Eric Blake <eblake@redhat.com>
+Signed-off-by: Fam Zheng <famz@redhat.com>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+
+Upstream-Status: Backport
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ block/file-posix.c | 19 ++++++++-----------
+ 1 file changed, 8 insertions(+), 11 deletions(-)
+
+diff --git a/block/file-posix.c b/block/file-posix.c
+index f4de022ae0..cb3bfce147 100644
+--- a/block/file-posix.c
++++ b/block/file-posix.c
+@@ -457,22 +457,19 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
+     switch (locking) {
+     case ON_OFF_AUTO_ON:
+         s->use_lock = true;
+-#ifndef F_OFD_SETLK
+-        fprintf(stderr,
+-                "File lock requested but OFD locking syscall is unavailable, "
+-                "falling back to POSIX file locks.\n"
+-                "Due to the implementation, locks can be lost unexpectedly.\n");
+-#endif
++        if (!qemu_has_ofd_lock()) {
++            fprintf(stderr,
++                    "File lock requested but OFD locking syscall is "
++                    "unavailable, falling back to POSIX file locks.\n"
++                    "Due to the implementation, locks can be lost "
++                    "unexpectedly.\n");
++        }
+         break;
+     case ON_OFF_AUTO_OFF:
+         s->use_lock = false;
+         break;
+     case ON_OFF_AUTO_AUTO:
+-#ifdef F_OFD_SETLK
+-        s->use_lock = true;
+-#else
+-        s->use_lock = false;
+-#endif
++        s->use_lock = qemu_has_ofd_lock();
+         break;
+     default:
+         abort();
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb b/meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb
index 04d656b..08eaf19 100644
--- a/meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb
@@ -24,6 +24,8 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://0003-Introduce-condition-in-TPM-backend-for-notification.patch \
            file://0004-Add-support-for-VM-suspend-resume-for-TPM-TIS-v2.9.patch \
            file://apic-fixup-fallthrough-to-PIC.patch \
+           file://0001-osdep-Add-runtime-OFD-lock-detection.patch \
+           file://0002-file-posix-Do-runtime-check-for-ofd-lock-API.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
1.9.1


