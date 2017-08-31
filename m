Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C51F978203
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 21:33:54 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Aug 2017 14:33:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,455,1498546800"; d="scan'208";a="124506671"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga004.jf.intel.com with ESMTP; 31 Aug 2017 14:33:55 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Thu, 31 Aug 2017 14:33:49 -0700
Message-Id: <1504215229-79715-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] qemu: upgrade to version 2.10.0
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
X-List-Received-Date: Thu, 31 Aug 2017 21:33:55 -0000

Remove recipes for older versions.
Remove patches no longer needed.
Modify the patch "add-ptest-in-makefile.patch" for version 2.10.0

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 ...0001-osdep-Add-runtime-OFD-lock-detection.patch | 141 ----
 ...e-posix-Do-runtime-check-for-ofd-lock-API.patch |  71 --
 ...support-for-VM-suspend-resume-for-TPM-TIS.patch | 719 ---------------------
 .../qemu/qemu/add-ptest-in-makefile-v10.patch      |  28 +
 .../qemu/qemu/add-ptest-in-makefile.patch          |  28 -
 meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb      |  59 --
 meta/recipes-devtools/qemu/qemu_2.10.0.bb          |  58 ++
 meta/recipes-devtools/qemu/qemu_2.8.1.1.bb         |  60 --
 8 files changed, 86 insertions(+), 1078 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-osdep-Add-runtime-OFD-lock-detection.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0002-file-posix-Do-runtime-check-for-ofd-lock-API.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile-v10.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb
 create mode 100644 meta/recipes-devtools/qemu/qemu_2.10.0.bb
 delete mode 100644 meta/recipes-devtools/qemu/qemu_2.8.1.1.bb

diff --git a/meta/recipes-devtools/qemu/qemu/0001-osdep-Add-runtime-OFD-lock-detection.patch b/meta/recipes-devtools/qemu/qemu/0001-osdep-Add-runtime-OFD-lock-detection.patch
deleted file mode 100644
index f83f0d2..0000000
--- a/meta/recipes-devtools/qemu/qemu/0001-osdep-Add-runtime-OFD-lock-detection.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-From ca749954b09b89e22cd69c4949fb7e689b057963 Mon Sep 17 00:00:00 2001
-From: Fam Zheng <famz@redhat.com>
-Date: Fri, 11 Aug 2017 19:44:46 +0800
-Subject: [PATCH 1/2] osdep: Add runtime OFD lock detection
-
-Build time check of OFD lock is not sufficient and can cause image open
-errors when the runtime environment doesn't support it.
-
-Add a helper function to probe it at runtime, additionally. Also provide
-a qemu_has_ofd_lock() for callers to check the status.
-
-Signed-off-by: Fam Zheng <famz@redhat.com>
-Signed-off-by: Kevin Wolf <kwolf@redhat.com>
-
-Upstream-Status: Backport
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- include/qemu/osdep.h |  1 +
- util/osdep.c         | 66 ++++++++++++++++++++++++++++++++++++++++++++--------
- 2 files changed, 57 insertions(+), 10 deletions(-)
-
-diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
-index 3b74f6fcb2..6855b94bbf 100644
---- a/include/qemu/osdep.h
-+++ b/include/qemu/osdep.h
-@@ -357,6 +357,7 @@ int qemu_dup(int fd);
- int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
- int qemu_unlock_fd(int fd, int64_t start, int64_t len);
- int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
-+bool qemu_has_ofd_lock(void);
- 
- #if defined(__HAIKU__) && defined(__i386__)
- #define FMT_pid "%ld"
-diff --git a/util/osdep.c b/util/osdep.c
-index a2863c8e53..a479fedc4a 100644
---- a/util/osdep.c
-+++ b/util/osdep.c
-@@ -38,14 +38,6 @@ extern int madvise(caddr_t, size_t, int);
- #include "qemu/error-report.h"
- #include "monitor/monitor.h"
- 
--#ifdef F_OFD_SETLK
--#define QEMU_SETLK F_OFD_SETLK
--#define QEMU_GETLK F_OFD_GETLK
--#else
--#define QEMU_SETLK F_SETLK
--#define QEMU_GETLK F_GETLK
--#endif
--
- static bool fips_enabled = false;
- 
- static const char *hw_version = QEMU_HW_VERSION;
-@@ -82,6 +74,10 @@ int qemu_madvise(void *addr, size_t len, int advice)
- }
- 
- #ifndef _WIN32
-+
-+static int fcntl_op_setlk = -1;
-+static int fcntl_op_getlk = -1;
-+
- /*
-  * Dups an fd and sets the flags
-  */
-@@ -149,6 +145,54 @@ static int qemu_parse_fdset(const char *param)
-     return qemu_parse_fd(param);
- }
- 
-+static void qemu_probe_lock_ops(void)
-+{
-+    if (fcntl_op_setlk == -1) {
-+#ifdef F_OFD_SETLK
-+        int fd;
-+        int ret;
-+        struct flock fl = {
-+            .l_whence = SEEK_SET,
-+            .l_start  = 0,
-+            .l_len    = 0,
-+            .l_type   = F_WRLCK,
-+        };
-+
-+        fd = open("/dev/null", O_RDWR);
-+        if (fd < 0) {
-+            fprintf(stderr,
-+                    "Failed to open /dev/null for OFD lock probing: %s\n",
-+                    strerror(errno));
-+            fcntl_op_setlk = F_SETLK;
-+            fcntl_op_getlk = F_GETLK;
-+            return;
-+        }
-+        ret = fcntl(fd, F_OFD_GETLK, &fl);
-+        close(fd);
-+        if (!ret) {
-+            fcntl_op_setlk = F_OFD_SETLK;
-+            fcntl_op_getlk = F_OFD_GETLK;
-+        } else {
-+            fcntl_op_setlk = F_SETLK;
-+            fcntl_op_getlk = F_GETLK;
-+        }
-+#else
-+        fcntl_op_setlk = F_SETLK;
-+        fcntl_op_getlk = F_GETLK;
-+#endif
-+    }
-+}
-+
-+bool qemu_has_ofd_lock(void)
-+{
-+    qemu_probe_lock_ops();
-+#ifdef F_OFD_SETLK
-+    return fcntl_op_setlk == F_OFD_SETLK;
-+#else
-+    return false;
-+#endif
-+}
-+
- static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, int fl_type)
- {
-     int ret;
-@@ -158,7 +202,8 @@ static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, int fl_type)
-         .l_len    = len,
-         .l_type   = fl_type,
-     };
--    ret = fcntl(fd, QEMU_SETLK, &fl);
-+    qemu_probe_lock_ops();
-+    ret = fcntl(fd, fcntl_op_setlk, &fl);
-     return ret == -1 ? -errno : 0;
- }
- 
-@@ -181,7 +226,8 @@ int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)
-         .l_len    = len,
-         .l_type   = exclusive ? F_WRLCK : F_RDLCK,
-     };
--    ret = fcntl(fd, QEMU_GETLK, &fl);
-+    qemu_probe_lock_ops();
-+    ret = fcntl(fd, fcntl_op_getlk, &fl);
-     if (ret == -1) {
-         return -errno;
-     } else {
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0002-file-posix-Do-runtime-check-for-ofd-lock-API.patch b/meta/recipes-devtools/qemu/qemu/0002-file-posix-Do-runtime-check-for-ofd-lock-API.patch
deleted file mode 100644
index 0dacde4..0000000
--- a/meta/recipes-devtools/qemu/qemu/0002-file-posix-Do-runtime-check-for-ofd-lock-API.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 2b218f5dbcca5fe728b1852d161d7a21fd02b2f5 Mon Sep 17 00:00:00 2001
-From: Fam Zheng <famz@redhat.com>
-Date: Fri, 11 Aug 2017 19:44:47 +0800
-Subject: [PATCH 2/2] file-posix: Do runtime check for ofd lock API
-
-It is reported that on Windows Subsystem for Linux, ofd operations fail
-with -EINVAL. In other words, QEMU binary built with system headers that
-exports F_OFD_SETLK doesn't necessarily run in an environment that
-actually supports it:
-
-$ qemu-system-aarch64 ... -drive file=test.vhdx,if=none,id=hd0 \
-    -device virtio-blk-pci,drive=hd0
-qemu-system-aarch64: -drive file=test.vhdx,if=none,id=hd0: Failed to unlock byte 100
-qemu-system-aarch64: -drive file=test.vhdx,if=none,id=hd0: Failed to unlock byte 100
-qemu-system-aarch64: -drive file=test.vhdx,if=none,id=hd0: Failed to lock byte 100
-
-As a matter of fact this is not WSL specific. It can happen when running
-a QEMU compiled against a newer glibc on an older kernel, such as in
-a containerized environment.
-
-Let's do a runtime check to cope with that.
-
-Reported-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
-Reviewed-by: Eric Blake <eblake@redhat.com>
-Signed-off-by: Fam Zheng <famz@redhat.com>
-Signed-off-by: Kevin Wolf <kwolf@redhat.com>
-
-Upstream-Status: Backport
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- block/file-posix.c | 19 ++++++++-----------
- 1 file changed, 8 insertions(+), 11 deletions(-)
-
-diff --git a/block/file-posix.c b/block/file-posix.c
-index f4de022ae0..cb3bfce147 100644
---- a/block/file-posix.c
-+++ b/block/file-posix.c
-@@ -457,22 +457,19 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
-     switch (locking) {
-     case ON_OFF_AUTO_ON:
-         s->use_lock = true;
--#ifndef F_OFD_SETLK
--        fprintf(stderr,
--                "File lock requested but OFD locking syscall is unavailable, "
--                "falling back to POSIX file locks.\n"
--                "Due to the implementation, locks can be lost unexpectedly.\n");
--#endif
-+        if (!qemu_has_ofd_lock()) {
-+            fprintf(stderr,
-+                    "File lock requested but OFD locking syscall is "
-+                    "unavailable, falling back to POSIX file locks.\n"
-+                    "Due to the implementation, locks can be lost "
-+                    "unexpectedly.\n");
-+        }
-         break;
-     case ON_OFF_AUTO_OFF:
-         s->use_lock = false;
-         break;
-     case ON_OFF_AUTO_AUTO:
--#ifdef F_OFD_SETLK
--        s->use_lock = true;
--#else
--        s->use_lock = false;
--#endif
-+        s->use_lock = qemu_has_ofd_lock();
-         break;
-     default:
-         abort();
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch b/meta/recipes-devtools/qemu/qemu/0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch
deleted file mode 100644
index b8a783d..0000000
--- a/meta/recipes-devtools/qemu/qemu/0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch
+++ /dev/null
@@ -1,719 +0,0 @@
-From 5e9dd9063f514447ea4f54046793f4f01c297ed4 Mon Sep 17 00:00:00 2001
-From: Stefan Berger <stefanb@linux.vnet.ibm.com>
-Date: Sat, 31 Dec 2016 11:23:32 -0500
-Subject: [PATCH 4/4] Add support for VM suspend/resume for TPM TIS
-
-Extend the TPM TIS code to support suspend/resume. In case a command
-is being processed by the external TPM when suspending, wait for the command
-to complete to catch the result. In case the bottom half did not run,
-run the one function the bottom half is supposed to run. This then
-makes the resume operation work.
-
-The passthrough backend does not support suspend/resume operation
-and is therefore blocked from suspend/resume and migration.
-
-The CUSE TPM's supported capabilities are tested and if sufficient
-capabilities are implemented, suspend/resume, snapshotting and
-migration are supported by the CUSE TPM.
-
-Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
-
-Upstream-Status: Pending [https://lists.nongnu.org/archive/html/qemu-devel/2016-06/msg00252.html]
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
----
- hw/tpm/tpm_passthrough.c     | 130 +++++++++++++++++++++++--
- hw/tpm/tpm_tis.c             | 137 +++++++++++++++++++++++++-
- hw/tpm/tpm_tis.h             |   2 +
- hw/tpm/tpm_util.c            | 223 +++++++++++++++++++++++++++++++++++++++++++
- hw/tpm/tpm_util.h            |   7 ++
- include/sysemu/tpm_backend.h |  12 +++
- 6 files changed, 503 insertions(+), 8 deletions(-)
-
-diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
-index 44739ebad2..bc8072d0bc 100644
---- a/hw/tpm/tpm_passthrough.c
-+++ b/hw/tpm/tpm_passthrough.c
-@@ -34,6 +34,8 @@
- #include "tpm_tis.h"
- #include "tpm_util.h"
- #include "tpm_ioctl.h"
-+#include "migration/migration.h"
-+#include "qapi/error.h"
- 
- #define DEBUG_TPM 0
- 
-@@ -49,6 +51,7 @@
- #define TYPE_TPM_CUSE "tpm-cuse"
- 
- static const TPMDriverOps tpm_passthrough_driver;
-+static const VMStateDescription vmstate_tpm_cuse;
- 
- /* data structures */
- typedef struct TPMPassthruThreadParams {
-@@ -79,6 +82,10 @@ struct TPMPassthruState {
-     QemuMutex state_lock;
-     QemuCond cmd_complete;  /* singnaled once tpm_busy is false */
-     bool tpm_busy;
-+
-+    Error *migration_blocker;
-+
-+    TPMBlobBuffers tpm_blobs;
- };
- 
- typedef struct TPMPassthruState TPMPassthruState;
-@@ -306,6 +313,10 @@ static void tpm_passthrough_shutdown(TPMPassthruState *tpm_pt)
-                          strerror(errno));
-         }
-     }
-+    if (tpm_pt->migration_blocker) {
-+        migrate_del_blocker(tpm_pt->migration_blocker);
-+        error_free(tpm_pt->migration_blocker);
-+    }
- }
- 
- /*
-@@ -360,12 +371,14 @@ static int tpm_passthrough_cuse_check_caps(TPMPassthruState *tpm_pt)
- /*
-  * Initialize the external CUSE TPM
-  */
--static int tpm_passthrough_cuse_init(TPMPassthruState *tpm_pt)
-+static int tpm_passthrough_cuse_init(TPMPassthruState *tpm_pt,
-+                                     bool is_resume)
- {
-     int rc = 0;
--    ptm_init init = {
--        .u.req.init_flags = PTM_INIT_FLAG_DELETE_VOLATILE,
--    };
-+    ptm_init init;
-+    if (is_resume) {
-+        init.u.req.init_flags = PTM_INIT_FLAG_DELETE_VOLATILE;
-+    }
- 
-     if (TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt)) {
-         if (ioctl(tpm_pt->tpm_fd, PTM_INIT, &init) < 0) {
-@@ -394,7 +407,7 @@ static int tpm_passthrough_startup_tpm(TPMBackend *tb)
-                               tpm_passthrough_worker_thread,
-                               &tpm_pt->tpm_thread_params);
- 
--    tpm_passthrough_cuse_init(tpm_pt);
-+    tpm_passthrough_cuse_init(tpm_pt, false);
- 
-     return 0;
- }
-@@ -466,6 +479,32 @@ static int tpm_passthrough_reset_tpm_established_flag(TPMBackend *tb,
-     return rc;
- }
- 
-+static int tpm_cuse_get_state_blobs(TPMBackend *tb,
-+                                    bool decrypted_blobs,
-+                                    TPMBlobBuffers *tpm_blobs)
-+{
-+    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
-+
-+    assert(TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt));
-+
-+    return tpm_util_cuse_get_state_blobs(tpm_pt->tpm_fd, decrypted_blobs,
-+                                         tpm_blobs);
-+}
-+
-+static int tpm_cuse_set_state_blobs(TPMBackend *tb,
-+                                    TPMBlobBuffers *tpm_blobs)
-+{
-+    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
-+
-+    assert(TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt));
-+
-+    if (tpm_util_cuse_set_state_blobs(tpm_pt->tpm_fd, tpm_blobs)) {
-+        return 1;
-+    }
-+
-+    return tpm_passthrough_cuse_init(tpm_pt, true);
-+}
-+
- static bool tpm_passthrough_get_startup_error(TPMBackend *tb)
- {
-     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
-@@ -488,7 +527,7 @@ static void tpm_passthrough_deliver_request(TPMBackend *tb)
- {
-     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
- 
--    /* TPM considered busy once TPM Request scheduled for processing */
-+    /* TPM considered busy once TPM request scheduled for processing */
-     qemu_mutex_lock(&tpm_pt->state_lock);
-     tpm_pt->tpm_busy = true;
-     qemu_mutex_unlock(&tpm_pt->state_lock);
-@@ -601,6 +640,25 @@ static int tpm_passthrough_open_sysfs_cancel(TPMBackend *tb)
-     return fd;
- }
- 
-+static void tpm_passthrough_block_migration(TPMPassthruState *tpm_pt)
-+{
-+    ptm_cap caps;
-+
-+    if (TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt)) {
-+        caps = PTM_CAP_GET_STATEBLOB | PTM_CAP_SET_STATEBLOB |
-+               PTM_CAP_STOP;
-+        if (!TPM_CUSE_IMPLEMENTS_ALL(tpm_pt, caps)) {
-+            error_setg(&tpm_pt->migration_blocker,
-+                       "Migration disabled: CUSE TPM lacks necessary capabilities");
-+            migrate_add_blocker(tpm_pt->migration_blocker);
-+        }
-+    } else {
-+        error_setg(&tpm_pt->migration_blocker,
-+                   "Migration disabled: Passthrough TPM does not support migration");
-+        migrate_add_blocker(tpm_pt->migration_blocker);
-+    }
-+}
-+
- static int tpm_passthrough_handle_device_opts(QemuOpts *opts, TPMBackend *tb)
- {
-     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
-@@ -642,7 +700,7 @@ static int tpm_passthrough_handle_device_opts(QemuOpts *opts, TPMBackend *tb)
-             goto err_close_tpmdev;
-         }
-         /* init TPM for probing */
--        if (tpm_passthrough_cuse_init(tpm_pt)) {
-+        if (tpm_passthrough_cuse_init(tpm_pt, false)) {
-             goto err_close_tpmdev;
-         }
-     }
-@@ -659,6 +717,7 @@ static int tpm_passthrough_handle_device_opts(QemuOpts *opts, TPMBackend *tb)
-         }
-     }
- 
-+    tpm_passthrough_block_migration(tpm_pt);
- 
-     return 0;
- 
-@@ -766,10 +825,13 @@ static void tpm_passthrough_inst_init(Object *obj)
- 
-     qemu_mutex_init(&tpm_pt->state_lock);
-     qemu_cond_init(&tpm_pt->cmd_complete);
-+
-+    vmstate_register(NULL, -1, &vmstate_tpm_cuse, obj);
- }
- 
- static void tpm_passthrough_inst_finalize(Object *obj)
- {
-+    vmstate_unregister(NULL, &vmstate_tpm_cuse, obj);
- }
- 
- static void tpm_passthrough_class_init(ObjectClass *klass, void *data)
-@@ -802,6 +864,60 @@ static const char *tpm_passthrough_cuse_create_desc(void)
-     return "CUSE TPM backend driver";
- }
- 
-+static void tpm_cuse_pre_save(void *opaque)
-+{
-+    TPMPassthruState *tpm_pt = opaque;
-+    TPMBackend *tb = &tpm_pt->parent;
-+
-+     qemu_mutex_lock(&tpm_pt->state_lock);
-+     /* wait for TPM to finish processing */
-+     if (tpm_pt->tpm_busy) {
-+        qemu_cond_wait(&tpm_pt->cmd_complete, &tpm_pt->state_lock);
-+     }
-+     qemu_mutex_unlock(&tpm_pt->state_lock);
-+
-+    /* get the decrypted state blobs from the TPM */
-+    tpm_cuse_get_state_blobs(tb, TRUE, &tpm_pt->tpm_blobs);
-+}
-+
-+static int tpm_cuse_post_load(void *opaque,
-+                              int version_id __attribute__((unused)))
-+{
-+    TPMPassthruState *tpm_pt = opaque;
-+    TPMBackend *tb = &tpm_pt->parent;
-+
-+    return tpm_cuse_set_state_blobs(tb, &tpm_pt->tpm_blobs);
-+}
-+
-+static const VMStateDescription vmstate_tpm_cuse = {
-+    .name = "cuse-tpm",
-+    .version_id = 1,
-+    .minimum_version_id = 0,
-+    .minimum_version_id_old = 0,
-+    .pre_save  = tpm_cuse_pre_save,
-+    .post_load = tpm_cuse_post_load,
-+    .fields = (VMStateField[]) {
-+        VMSTATE_UINT32(tpm_blobs.permanent_flags, TPMPassthruState),
-+        VMSTATE_UINT32(tpm_blobs.permanent.size, TPMPassthruState),
-+        VMSTATE_VBUFFER_ALLOC_UINT32(tpm_blobs.permanent.buffer,
-+                                     TPMPassthruState, 1, NULL, 0,
-+                                     tpm_blobs.permanent.size),
-+
-+        VMSTATE_UINT32(tpm_blobs.volatil_flags, TPMPassthruState),
-+        VMSTATE_UINT32(tpm_blobs.volatil.size, TPMPassthruState),
-+        VMSTATE_VBUFFER_ALLOC_UINT32(tpm_blobs.volatil.buffer,
-+                                     TPMPassthruState, 1, NULL, 0,
-+                                     tpm_blobs.volatil.size),
-+
-+        VMSTATE_UINT32(tpm_blobs.savestate_flags, TPMPassthruState),
-+        VMSTATE_UINT32(tpm_blobs.savestate.size, TPMPassthruState),
-+        VMSTATE_VBUFFER_ALLOC_UINT32(tpm_blobs.savestate.buffer,
-+                                     TPMPassthruState, 1, NULL, 0,
-+                                     tpm_blobs.savestate.size),
-+        VMSTATE_END_OF_LIST()
-+    }
-+};
-+
- static const TPMDriverOps tpm_cuse_driver = {
-     .type                     = TPM_TYPE_CUSE_TPM,
-     .opts                     = tpm_passthrough_cmdline_opts,
-diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
-index 14d9e83ea2..9b660cf737 100644
---- a/hw/tpm/tpm_tis.c
-+++ b/hw/tpm/tpm_tis.c
-@@ -368,6 +368,8 @@ static void tpm_tis_receive_bh(void *opaque)
-     TPMTISEmuState *tis = &s->s.tis;
-     uint8_t locty = s->locty_number;
- 
-+    tis->bh_scheduled = false;
-+
-     qemu_mutex_lock(&s->state_lock);
- 
-     tpm_tis_sts_set(&tis->loc[locty],
-@@ -415,6 +417,8 @@ static void tpm_tis_receive_cb(TPMState *s, uint8_t locty,
-     qemu_mutex_unlock(&s->state_lock);
- 
-     qemu_bh_schedule(tis->bh);
-+
-+    tis->bh_scheduled = true;
- }
- 
- /*
-@@ -1030,9 +1034,140 @@ static void tpm_tis_reset(DeviceState *dev)
-     tpm_tis_do_startup_tpm(s);
- }
- 
-+
-+/* persistent state handling */
-+
-+static void tpm_tis_pre_save(void *opaque)
-+{
-+    TPMState *s = opaque;
-+    TPMTISEmuState *tis = &s->s.tis;
-+    uint8_t locty = tis->active_locty;
-+
-+    DPRINTF("tpm_tis: suspend: locty = %d : r_offset = %d, w_offset = %d\n",
-+            locty, tis->loc[0].r_offset, tis->loc[0].w_offset);
-+#ifdef DEBUG_TIS
-+    tpm_tis_dump_state(opaque, 0);
-+#endif
-+
-+    qemu_mutex_lock(&s->state_lock);
-+
-+    /* wait for outstanding request to complete */
-+    if (TPM_TIS_IS_VALID_LOCTY(locty) &&
-+        tis->loc[locty].state == TPM_TIS_STATE_EXECUTION) {
-+        /*
-+         * If we get here when the bh is scheduled but did not run,
-+         * we won't get notified...
-+         */
-+        if (!tis->bh_scheduled) {
-+            /* backend thread to notify us */
-+            qemu_cond_wait(&s->cmd_complete, &s->state_lock);
-+        }
-+        if (tis->loc[locty].state == TPM_TIS_STATE_EXECUTION) {
-+            /* bottom half did not run - run its function */
-+            qemu_mutex_unlock(&s->state_lock);
-+            tpm_tis_receive_bh(opaque);
-+            qemu_mutex_lock(&s->state_lock);
-+        }
-+    }
-+
-+    qemu_mutex_unlock(&s->state_lock);
-+
-+    /* copy current active read or write buffer into the buffer
-+       written to disk */
-+    if (TPM_TIS_IS_VALID_LOCTY(locty)) {
-+        switch (tis->loc[locty].state) {
-+        case TPM_TIS_STATE_RECEPTION:
-+            memcpy(tis->buf,
-+                   tis->loc[locty].w_buffer.buffer,
-+                   MIN(sizeof(tis->buf),
-+                       tis->loc[locty].w_buffer.size));
-+            tis->offset = tis->loc[locty].w_offset;
-+        break;
-+        case TPM_TIS_STATE_COMPLETION:
-+            memcpy(tis->buf,
-+                   tis->loc[locty].r_buffer.buffer,
-+                   MIN(sizeof(tis->buf),
-+                       tis->loc[locty].r_buffer.size));
-+            tis->offset = tis->loc[locty].r_offset;
-+        break;
-+        default:
-+            /* leak nothing */
-+            memset(tis->buf, 0x0, sizeof(tis->buf));
-+        break;
-+        }
-+    }
-+}
-+
-+static int tpm_tis_post_load(void *opaque,
-+                             int version_id __attribute__((unused)))
-+{
-+    TPMState *s = opaque;
-+    TPMTISEmuState *tis = &s->s.tis;
-+
-+    uint8_t locty = tis->active_locty;
-+
-+    if (TPM_TIS_IS_VALID_LOCTY(locty)) {
-+        switch (tis->loc[locty].state) {
-+        case TPM_TIS_STATE_RECEPTION:
-+            memcpy(tis->loc[locty].w_buffer.buffer,
-+                   tis->buf,
-+                   MIN(sizeof(tis->buf),
-+                       tis->loc[locty].w_buffer.size));
-+            tis->loc[locty].w_offset = tis->offset;
-+        break;
-+        case TPM_TIS_STATE_COMPLETION:
-+            memcpy(tis->loc[locty].r_buffer.buffer,
-+                   tis->buf,
-+                   MIN(sizeof(tis->buf),
-+                       tis->loc[locty].r_buffer.size));
-+            tis->loc[locty].r_offset = tis->offset;
-+        break;
-+        default:
-+        break;
-+        }
-+    }
-+
-+    DPRINTF("tpm_tis: resume : locty = %d : r_offset = %d, w_offset = %d\n",
-+            locty, tis->loc[0].r_offset, tis->loc[0].w_offset);
-+
-+    return 0;
-+}
-+
-+static const VMStateDescription vmstate_locty = {
-+    .name = "loc",
-+    .version_id = 1,
-+    .minimum_version_id = 0,
-+    .minimum_version_id_old = 0,
-+    .fields      = (VMStateField[]) {
-+        VMSTATE_UINT32(state, TPMLocality),
-+        VMSTATE_UINT32(inte, TPMLocality),
-+        VMSTATE_UINT32(ints, TPMLocality),
-+        VMSTATE_UINT8(access, TPMLocality),
-+        VMSTATE_UINT32(sts, TPMLocality),
-+        VMSTATE_UINT32(iface_id, TPMLocality),
-+        VMSTATE_END_OF_LIST(),
-+    }
-+};
-+
- static const VMStateDescription vmstate_tpm_tis = {
-     .name = "tpm",
--    .unmigratable = 1,
-+    .version_id = 1,
-+    .minimum_version_id = 0,
-+    .minimum_version_id_old = 0,
-+    .pre_save  = tpm_tis_pre_save,
-+    .post_load = tpm_tis_post_load,
-+    .fields = (VMStateField[]) {
-+        VMSTATE_UINT32(s.tis.offset, TPMState),
-+        VMSTATE_BUFFER(s.tis.buf, TPMState),
-+        VMSTATE_UINT8(s.tis.active_locty, TPMState),
-+        VMSTATE_UINT8(s.tis.aborting_locty, TPMState),
-+        VMSTATE_UINT8(s.tis.next_locty, TPMState),
-+
-+        VMSTATE_STRUCT_ARRAY(s.tis.loc, TPMState, TPM_TIS_NUM_LOCALITIES, 1,
-+                             vmstate_locty, TPMLocality),
-+
-+        VMSTATE_END_OF_LIST()
-+    }
- };
- 
- static Property tpm_tis_properties[] = {
-diff --git a/hw/tpm/tpm_tis.h b/hw/tpm/tpm_tis.h
-index a1df41fa21..b7fc0ea1a9 100644
---- a/hw/tpm/tpm_tis.h
-+++ b/hw/tpm/tpm_tis.h
-@@ -54,6 +54,8 @@ typedef struct TPMLocality {
- 
- typedef struct TPMTISEmuState {
-     QEMUBH *bh;
-+    bool bh_scheduled; /* bh scheduled but did not run yet */
-+
-     uint32_t offset;
-     uint8_t buf[TPM_TIS_BUFFER_MAX];
- 
-diff --git a/hw/tpm/tpm_util.c b/hw/tpm/tpm_util.c
-index 7b35429725..b6ff74d946 100644
---- a/hw/tpm/tpm_util.c
-+++ b/hw/tpm/tpm_util.c
-@@ -22,6 +22,17 @@
- #include "qemu/osdep.h"
- #include "tpm_util.h"
- #include "tpm_int.h"
-+#include "tpm_ioctl.h"
-+#include "qemu/error-report.h"
-+
-+#define DEBUG_TPM 0
-+
-+#define DPRINTF(fmt, ...) do { \
-+    if (DEBUG_TPM) { \
-+        fprintf(stderr, fmt, ## __VA_ARGS__); \
-+    } \
-+} while (0)
-+
- 
- /*
-  * A basic test of a TPM device. We expect a well formatted response header
-@@ -125,3 +136,215 @@ int tpm_util_test_tpmdev(int tpm_fd, TPMVersion *tpm_version)
- 
-     return 1;
- }
-+
-+static void tpm_sized_buffer_reset(TPMSizedBuffer *tsb)
-+{
-+    g_free(tsb->buffer);
-+    tsb->buffer = NULL;
-+    tsb->size = 0;
-+}
-+
-+/*
-+ * Transfer a TPM state blob from the TPM into a provided buffer.
-+ *
-+ * @fd: file descriptor to talk to the CUSE TPM
-+ * @type: the type of blob to transfer
-+ * @decrypted_blob: whether we request to receive decrypted blobs
-+ * @tsb: the TPMSizeBuffer to fill with the blob
-+ * @flags: the flags to return to the caller
-+ */
-+static int tpm_util_cuse_get_state_blob(int fd,
-+                                        uint8_t type,
-+                                        bool decrypted_blob,
-+                                        TPMSizedBuffer *tsb,
-+                                        uint32_t *flags)
-+{
-+    ptm_getstate pgs;
-+    uint16_t offset = 0;
-+    ptm_res res;
-+    ssize_t n;
-+    size_t to_read;
-+
-+    tpm_sized_buffer_reset(tsb);
-+
-+    pgs.u.req.state_flags = (decrypted_blob) ? PTM_STATE_FLAG_DECRYPTED : 0;
-+    pgs.u.req.type = type;
-+    pgs.u.req.offset = offset;
-+
-+    if (ioctl(fd, PTM_GET_STATEBLOB, &pgs) < 0) {
-+        error_report("CUSE TPM PTM_GET_STATEBLOB ioctl failed: %s",
-+                     strerror(errno));
-+        goto err_exit;
-+    }
-+    res = pgs.u.resp.tpm_result;
-+    if (res != 0 && (res & 0x800) == 0) {
-+        error_report("Getting the stateblob (type %d) failed with a TPM "
-+                     "error 0x%x", type, res);
-+        goto err_exit;
-+    }
-+
-+    *flags = pgs.u.resp.state_flags;
-+
-+    tsb->buffer = g_malloc(pgs.u.resp.totlength);
-+    memcpy(tsb->buffer, pgs.u.resp.data, pgs.u.resp.length);
-+    tsb->size = pgs.u.resp.length;
-+
-+    /* if there are bytes left to get use read() interface */
-+    while (tsb->size < pgs.u.resp.totlength) {
-+        to_read = pgs.u.resp.totlength - tsb->size;
-+        if (unlikely(to_read > SSIZE_MAX)) {
-+            to_read = SSIZE_MAX;
-+        }
-+
-+        n = read(fd, &tsb->buffer[tsb->size], to_read);
-+        if (n != to_read) {
-+            error_report("Could not read stateblob (type %d) : %s",
-+                         type, strerror(errno));
-+            goto err_exit;
-+        }
-+        tsb->size += to_read;
-+    }
-+
-+    DPRINTF("tpm_util: got state blob type %d, %d bytes, flags 0x%08x, "
-+            "decrypted=%d\n", type, tsb->size, *flags, decrypted_blob);
-+
-+    return 0;
-+
-+err_exit:
-+    return 1;
-+}
-+
-+int tpm_util_cuse_get_state_blobs(int tpm_fd,
-+                                  bool decrypted_blobs,
-+                                  TPMBlobBuffers *tpm_blobs)
-+{
-+    if (tpm_util_cuse_get_state_blob(tpm_fd, PTM_BLOB_TYPE_PERMANENT,
-+                                     decrypted_blobs,
-+                                     &tpm_blobs->permanent,
-+                                     &tpm_blobs->permanent_flags) ||
-+       tpm_util_cuse_get_state_blob(tpm_fd, PTM_BLOB_TYPE_VOLATILE,
-+                                     decrypted_blobs,
-+                                     &tpm_blobs->volatil,
-+                                     &tpm_blobs->volatil_flags) ||
-+       tpm_util_cuse_get_state_blob(tpm_fd, PTM_BLOB_TYPE_SAVESTATE,
-+                                     decrypted_blobs,
-+                                     &tpm_blobs->savestate,
-+                                     &tpm_blobs->savestate_flags)) {
-+        goto err_exit;
-+    }
-+
-+    return 0;
-+
-+ err_exit:
-+    tpm_sized_buffer_reset(&tpm_blobs->volatil);
-+    tpm_sized_buffer_reset(&tpm_blobs->permanent);
-+    tpm_sized_buffer_reset(&tpm_blobs->savestate);
-+
-+    return 1;
-+}
-+
-+static int tpm_util_cuse_do_set_stateblob_ioctl(int fd,
-+                                                uint32_t flags,
-+                                                uint32_t type,
-+                                                uint32_t length)
-+{
-+    ptm_setstate pss;
-+
-+    pss.u.req.state_flags = flags;
-+    pss.u.req.type = type;
-+    pss.u.req.length = length;
-+
-+    if (ioctl(fd, PTM_SET_STATEBLOB, &pss) < 0) {
-+        error_report("CUSE TPM PTM_SET_STATEBLOB ioctl failed: %s",
-+                     strerror(errno));
-+        return 1;
-+    }
-+
-+    if (pss.u.resp.tpm_result != 0) {
-+        error_report("Setting the stateblob (type %d) failed with a TPM "
-+                     "error 0x%x", type, pss.u.resp.tpm_result);
-+        return 1;
-+    }
-+
-+    return 0;
-+}
-+
-+
-+/*
-+ * Transfer a TPM state blob to the CUSE TPM.
-+ *
-+ * @fd: file descriptor to talk to the CUSE TPM
-+ * @type: the type of TPM state blob to transfer
-+ * @tsb: TPMSizeBuffer containing the TPM state blob
-+ * @flags: Flags describing the (encryption) state of the TPM state blob
-+ */
-+static int tpm_util_cuse_set_state_blob(int fd,
-+                                        uint32_t type,
-+                                        TPMSizedBuffer *tsb,
-+                                        uint32_t flags)
-+{
-+    uint32_t offset = 0;
-+    ssize_t n;
-+    size_t to_write;
-+
-+    /* initiate the transfer to the CUSE TPM */
-+    if (tpm_util_cuse_do_set_stateblob_ioctl(fd, flags, type, 0)) {
-+        return 1;
-+    }
-+
-+    /* use the write() interface for transferring the state blob */
-+    while (offset < tsb->size) {
-+        to_write = tsb->size - offset;
-+        if (unlikely(to_write > SSIZE_MAX)) {
-+            to_write = SSIZE_MAX;
-+        }
-+
-+        n = write(fd, &tsb->buffer[offset], to_write);
-+        if (n != to_write) {
-+            error_report("Writing the stateblob (type %d) failed: %s",
-+                         type, strerror(errno));
-+            goto err_exit;
-+        }
-+        offset += to_write;
-+    }
-+
-+    /* inidicate that the transfer is finished */
-+    if (tpm_util_cuse_do_set_stateblob_ioctl(fd, flags, type, 0)) {
-+        goto err_exit;
-+    }
-+
-+    DPRINTF("tpm_util: set the state blob type %d, %d bytes, flags 0x%08x\n",
-+            type, tsb->size, flags);
-+
-+    return 0;
-+
-+err_exit:
-+    return 1;
-+}
-+
-+int tpm_util_cuse_set_state_blobs(int tpm_fd,
-+                                  TPMBlobBuffers *tpm_blobs)
-+{
-+    ptm_res res;
-+
-+    if (ioctl(tpm_fd, PTM_STOP, &res) < 0) {
-+        error_report("tpm_passthrough: Could not stop "
-+                     "the CUSE TPM: %s (%i)",
-+                     strerror(errno), errno);
-+        return 1;
-+    }
-+
-+    if (tpm_util_cuse_set_state_blob(tpm_fd, PTM_BLOB_TYPE_PERMANENT,
-+                                     &tpm_blobs->permanent,
-+                                     tpm_blobs->permanent_flags) ||
-+        tpm_util_cuse_set_state_blob(tpm_fd, PTM_BLOB_TYPE_VOLATILE,
-+                                     &tpm_blobs->volatil,
-+                                     tpm_blobs->volatil_flags) ||
-+        tpm_util_cuse_set_state_blob(tpm_fd, PTM_BLOB_TYPE_SAVESTATE,
-+                                     &tpm_blobs->savestate,
-+                                     tpm_blobs->savestate_flags)) {
-+        return 1;
-+    }
-+
-+    return 0;
-+}
-diff --git a/hw/tpm/tpm_util.h b/hw/tpm/tpm_util.h
-index df76245e6e..c24071d812 100644
---- a/hw/tpm/tpm_util.h
-+++ b/hw/tpm/tpm_util.h
-@@ -26,4 +26,11 @@
- 
- int tpm_util_test_tpmdev(int tpm_fd, TPMVersion *tpm_version);
- 
-+int tpm_util_cuse_get_state_blobs(int tpm_fd,
-+                                  bool decrypted_blobs,
-+                                  TPMBlobBuffers *tpm_blobs);
-+
-+int tpm_util_cuse_set_state_blobs(int tpm_fd,
-+                                  TPMBlobBuffers *tpm_blobs);
-+
- #endif /* TPM_TPM_UTIL_H */
-diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
-index b58f52d39f..3403821b9d 100644
---- a/include/sysemu/tpm_backend.h
-+++ b/include/sysemu/tpm_backend.h
-@@ -62,6 +62,18 @@ typedef struct TPMSizedBuffer {
-     uint8_t  *buffer;
- } TPMSizedBuffer;
- 
-+/* blobs from the TPM; part of VM state when migrating */
-+typedef struct TPMBlobBuffers {
-+    uint32_t permanent_flags;
-+    TPMSizedBuffer permanent;
-+
-+    uint32_t volatil_flags;
-+    TPMSizedBuffer volatil;
-+
-+    uint32_t savestate_flags;
-+    TPMSizedBuffer savestate;
-+} TPMBlobBuffers;
-+
- struct TPMDriverOps {
-     enum TpmType type;
-     const QemuOptDesc *opts;
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile-v10.patch b/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile-v10.patch
new file mode 100644
index 0000000..e963982
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile-v10.patch
@@ -0,0 +1,28 @@
+From 4201a5791fc4798a45a9b9f881602d7bacb74ed1 Mon Sep 17 00:00:00 2001
+From: Juro Bystricky <juro.bystricky@intel.com>
+Date: Thu, 31 Aug 2017 11:06:56 -0700
+Subject: Add subpackage -ptest which runs all unit test cases for qemu.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+diff --git a/tests/Makefile.include b/tests/Makefile.include
+index f08b741..3d1b3e9 100644
+--- a/tests/Makefile.include
++++ b/tests/Makefile.include
+@@ -924,4 +924,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
+ -include $(wildcard tests/*.d)
+ -include $(wildcard tests/libqos/*.d)
+ 
++buildtest-TESTS: $(check-unit-y)
++
++runtest-TESTS:
++	for f in $(check-unit-y); do \
++		nf=$$(echo $$f | sed 's/tests\//\.\//g'); \
++		$$nf; \
++	done
++
+ endif
diff --git a/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch b/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch
deleted file mode 100644
index 2ce3478..0000000
--- a/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Pending
-
-Add subpackage -ptest which runs all unit test cases for qemu.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- tests/Makefile.include | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/tests/Makefile.include b/tests/Makefile.include
-index 14be491..0fce37a 100644
---- a/tests/Makefile.include
-+++ b/tests/Makefile.include
-@@ -776,3 +776,11 @@ all: $(QEMU_IOTESTS_HELPERS-y)
- 
- -include $(wildcard tests/*.d)
- -include $(wildcard tests/libqos/*.d)
-+
-+buildtest-TESTS: $(check-unit-y)
-+
-+runtest-TESTS:
-+	for f in $(check-unit-y); do \
-+		nf=$$(echo $$f | sed 's/tests\//\.\//g'); \
-+		$$nf; \
-+	done
--- 
-2.9.0
-
diff --git a/meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb b/meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb
deleted file mode 100644
index 204e36f..0000000
--- a/meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb
+++ /dev/null
@@ -1,59 +0,0 @@
-require qemu.inc
-
-inherit ptest
-
-RDEPENDS_${PN}-ptest = "bash make"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
-                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
-
-SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
-           file://powerpc_rom.bin \
-           file://disable-grabs.patch \
-           file://exclude-some-arm-EABI-obsolete-syscalls.patch \
-           file://wacom.patch \
-           file://add-ptest-in-makefile.patch \
-           file://run-ptest \
-           file://qemu-enlarge-env-entry-size.patch \
-           file://no-valgrind.patch \
-           file://pathlimit.patch \
-           file://qemu-2.5.0-cflags.patch \
-           file://glibc-2.25.patch \
-           file://0001-Provide-support-for-the-CUSE-TPM.patch \
-           file://0002-Introduce-condition-to-notify-waiters-of-completed-c.patch \
-           file://0003-Introduce-condition-in-TPM-backend-for-notification.patch \
-           file://0004-Add-support-for-VM-suspend-resume-for-TPM-TIS-v2.9.patch \
-           file://apic-fixup-fallthrough-to-PIC.patch \
-           file://0001-osdep-Add-runtime-OFD-lock-detection.patch \
-           file://0002-file-posix-Do-runtime-check-for-ofd-lock-API.patch \
-           "
-UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
-
-
-SRC_URI_append_class-native = " \
-            file://fix-libcap-header-issue-on-some-distro.patch \
-            file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
-            "
-SRC_URI[md5sum] = "634c498476e4b5643cf7a89e7416d0ae"
-SRC_URI[sha256sum] = "9f8aaa2839634a2226a49d0f305ef922a7b0bc850d343aaee41948fd6f45700a"
-
-COMPATIBLE_HOST_mipsarchn32 = "null"
-COMPATIBLE_HOST_mipsarchn64 = "null"
-
-do_install_append() {
-    # Prevent QA warnings about installed ${localstatedir}/run
-    if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
-    install -Dm 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
-}
-
-do_compile_ptest() {
-	make buildtest-TESTS
-}
-
-do_install_ptest() {
-	cp -rL ${B}/tests ${D}${PTEST_PATH}
-	find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcod]" | xargs -i rm -rf {}
-
-	cp ${S}/tests/Makefile.include ${D}${PTEST_PATH}/tests
-}
-
diff --git a/meta/recipes-devtools/qemu/qemu_2.10.0.bb b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
new file mode 100644
index 0000000..835577a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
@@ -0,0 +1,58 @@
+require qemu.inc
+
+inherit ptest
+
+RDEPENDS_${PN}-ptest = "bash make"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
+                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
+
+SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
+           file://powerpc_rom.bin \
+           file://disable-grabs.patch \
+           file://exclude-some-arm-EABI-obsolete-syscalls.patch \
+           file://wacom.patch \
+           file://add-ptest-in-makefile-v10.patch \
+           file://run-ptest \
+           file://qemu-enlarge-env-entry-size.patch \
+           file://no-valgrind.patch \
+           file://pathlimit.patch \
+           file://qemu-2.5.0-cflags.patch \
+           file://glibc-2.25.patch \
+           file://0001-Provide-support-for-the-CUSE-TPM.patch \
+           file://0002-Introduce-condition-to-notify-waiters-of-completed-c.patch \
+           file://0003-Introduce-condition-in-TPM-backend-for-notification.patch \
+           file://0004-Add-support-for-VM-suspend-resume-for-TPM-TIS-v2.9.patch \
+           file://apic-fixup-fallthrough-to-PIC.patch \
+           "
+UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
+
+
+SRC_URI_append_class-native = " \
+            file://fix-libcap-header-issue-on-some-distro.patch \
+            file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
+            "
+
+SRC_URI[md5sum] = "ca73441de73a9b52c6c49c97190d2185"
+SRC_URI[sha256sum] = "7e9f39e1306e6dcc595494e91c1464d4b03f55ddd2053183e0e1b69f7f776d48"
+
+COMPATIBLE_HOST_mipsarchn32 = "null"
+COMPATIBLE_HOST_mipsarchn64 = "null"
+
+do_install_append() {
+    # Prevent QA warnings about installed ${localstatedir}/run
+    if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
+    install -Dm 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
+}
+
+do_compile_ptest() {
+	make buildtest-TESTS
+}
+
+do_install_ptest() {
+	cp -rL ${B}/tests ${D}${PTEST_PATH}
+	find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcod]" | xargs -i rm -rf {}
+
+	cp ${S}/tests/Makefile.include ${D}${PTEST_PATH}/tests
+}
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.8.1.1.bb b/meta/recipes-devtools/qemu/qemu_2.8.1.1.bb
deleted file mode 100644
index a4ddb7f..0000000
--- a/meta/recipes-devtools/qemu/qemu_2.8.1.1.bb
+++ /dev/null
@@ -1,60 +0,0 @@
-require qemu.inc
-
-inherit ptest
-
-RDEPENDS_${PN}-ptest = "bash make"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
-                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
-
-SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
-           file://powerpc_rom.bin \
-           file://disable-grabs.patch \
-           file://exclude-some-arm-EABI-obsolete-syscalls.patch \
-           file://wacom.patch \
-           file://add-ptest-in-makefile.patch \
-           file://run-ptest \
-           file://configure-fix-Darwin-target-detection.patch \
-           file://qemu-enlarge-env-entry-size.patch \
-           file://no-valgrind.patch \
-           file://pathlimit.patch \
-           file://qemu-2.5.0-cflags.patch \
-           file://glibc-2.25.patch \
-           file://0001-Provide-support-for-the-CUSE-TPM.patch \
-           file://0002-Introduce-condition-to-notify-waiters-of-completed-c.patch \
-           file://0003-Introduce-condition-in-TPM-backend-for-notification.patch \
-           file://0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch \
-           file://CVE-2016-9908.patch \
-           file://CVE-2016-9912.patch \
-           file://0001-replace-struct-ucontext-with-ucontext_t-type.patch \
-           file://apic-fixup-fallthrough-to-PIC.patch \
-           "
-
-SRC_URI_append_class-native = " \
-            file://fix-libcap-header-issue-on-some-distro.patch \
-            file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
-            "
-
-SRC_URI[md5sum] = "a6a23a0c59fd0f8ec564b0fb89a79954"
-SRC_URI[sha256sum] = "f62ab18a1fb9ff5b4c81ed44becc945b11581eff777618141bdb787da55d3638"
-
-COMPATIBLE_HOST_mipsarchn32 = "null"
-COMPATIBLE_HOST_mipsarchn64 = "null"
-
-do_install_append() {
-    # Prevent QA warnings about installed ${localstatedir}/run
-    if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
-    install -Dm 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
-}
-
-do_compile_ptest() {
-	make buildtest-TESTS
-}
-
-do_install_ptest() {
-	cp -rL ${B}/tests ${D}${PTEST_PATH}
-	find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcod]" | xargs -i rm -rf {}
-
-	cp ${S}/tests/Makefile.include ${D}${PTEST_PATH}/tests
-}
-
-- 
2.7.4


