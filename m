Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id D0B91780B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 20:45:39 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3wY4D36Y8Jz1qqkr;
	Wed, 24 May 2017 22:45:39 +0200 (CEST)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3wY4D363Wpz3hmm5;
	Wed, 24 May 2017 22:45:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id sjD5cLhNOFSm; Wed, 24 May 2017 22:45:38 +0200 (CEST)
X-Auth-Info: x1ivBUpzw2KmV1DkGHkMRUzquRA+nAKNaza+gh4B+3o=
Received: from chi.lan (unknown [195.140.253.167])
	by mail.mnet-online.de (Postfix) with ESMTPA;
	Wed, 24 May 2017 22:45:38 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 May 2017 22:45:31 +0200
Message-Id: <20170524204531.2684-1-marex@denx.de>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] qemu: Update to 2.9.0
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
X-List-Received-Date: Wed, 24 May 2017 20:45:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade QEMU to the latest version.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
---
 ...support-for-VM-suspend-resume-for-TPM-TIS.patch | 17 +++++---
 .../recipes-devtools/qemu/qemu/CVE-2016-9908.patch | 44 --------------------
 .../recipes-devtools/qemu/qemu/CVE-2016-9912.patch | 45 --------------------
 .../qemu/qemu/target-ppc-fix-user-mode.patch       | 48 ----------------------
 .../qemu/{qemu_2.8.0.bb => qemu_2.9.0.bb}          |  7 +---
 5 files changed, 13 insertions(+), 148 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-9908.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-9912.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/target-ppc-fix-user-mode.patch
 rename meta/recipes-devtools/qemu/{qemu_2.8.0.bb => qemu_2.9.0.bb} (87%)

diff --git a/meta/recipes-devtools/qemu/qemu/0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch b/meta/recipes-devtools/qemu/qemu/0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch
index b8a783d4e9..8567684e90 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch
@@ -142,13 +142,14 @@ index 44739ebad2..bc8072d0bc 100644
      qemu_mutex_lock(&tpm_pt->state_lock);
      tpm_pt->tpm_busy = true;
      qemu_mutex_unlock(&tpm_pt->state_lock);
-@@ -601,6 +640,25 @@ static int tpm_passthrough_open_sysfs_cancel(TPMBackend *tb)
+@@ -601,6 +640,30 @@ static int tpm_passthrough_open_sysfs_cancel(TPMBackend *tb)
      return fd;
  }
  
 +static void tpm_passthrough_block_migration(TPMPassthruState *tpm_pt)
 +{
 +    ptm_cap caps;
++    Error *local_err = NULL;
 +
 +    if (TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt)) {
 +        caps = PTM_CAP_GET_STATEBLOB | PTM_CAP_SET_STATEBLOB |
@@ -156,12 +157,16 @@ index 44739ebad2..bc8072d0bc 100644
 +        if (!TPM_CUSE_IMPLEMENTS_ALL(tpm_pt, caps)) {
 +            error_setg(&tpm_pt->migration_blocker,
 +                       "Migration disabled: CUSE TPM lacks necessary capabilities");
-+            migrate_add_blocker(tpm_pt->migration_blocker);
++            migrate_add_blocker(tpm_pt->migration_blocker, &local_err);
 +        }
 +    } else {
 +        error_setg(&tpm_pt->migration_blocker,
 +                   "Migration disabled: Passthrough TPM does not support migration");
-+        migrate_add_blocker(tpm_pt->migration_blocker);
++        migrate_add_blocker(tpm_pt->migration_blocker, &local_err);
++    }
++    if (local_err) {
++        error_report_err(local_err);
++        error_free(tpm_pt->migration_blocker);
 +    }
 +}
 +
@@ -239,19 +244,19 @@ index 44739ebad2..bc8072d0bc 100644
 +        VMSTATE_UINT32(tpm_blobs.permanent_flags, TPMPassthruState),
 +        VMSTATE_UINT32(tpm_blobs.permanent.size, TPMPassthruState),
 +        VMSTATE_VBUFFER_ALLOC_UINT32(tpm_blobs.permanent.buffer,
-+                                     TPMPassthruState, 1, NULL, 0,
++                                     TPMPassthruState, 1, NULL,
 +                                     tpm_blobs.permanent.size),
 +
 +        VMSTATE_UINT32(tpm_blobs.volatil_flags, TPMPassthruState),
 +        VMSTATE_UINT32(tpm_blobs.volatil.size, TPMPassthruState),
 +        VMSTATE_VBUFFER_ALLOC_UINT32(tpm_blobs.volatil.buffer,
-+                                     TPMPassthruState, 1, NULL, 0,
++                                     TPMPassthruState, 1, NULL,
 +                                     tpm_blobs.volatil.size),
 +
 +        VMSTATE_UINT32(tpm_blobs.savestate_flags, TPMPassthruState),
 +        VMSTATE_UINT32(tpm_blobs.savestate.size, TPMPassthruState),
 +        VMSTATE_VBUFFER_ALLOC_UINT32(tpm_blobs.savestate.buffer,
-+                                     TPMPassthruState, 1, NULL, 0,
++                                     TPMPassthruState, 1, NULL,
 +                                     tpm_blobs.savestate.size),
 +        VMSTATE_END_OF_LIST()
 +    }
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-9908.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-9908.patch
deleted file mode 100644
index e0f7a1a3fd..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2016-9908.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7139ccbc907441337b4b59cde2c5b5a54cb5b2cc Mon Sep 17 00:00:00 2001
-From: Sona Sarmadi <sona.sarmadi@enea.com>
-
-virtio-gpu: fix information leak in capset get dispatch
-
-In virgl_cmd_get_capset function, it uses g_malloc to allocate
-a response struct to the guest. As the 'resp'struct hasn't been full
-initialized it will lead the 'resp->padding' field to the guest.
-Use g_malloc0 to avoid this.
-
-Signed-off-by: Li Qiang <liqiang6-s@360.cn>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-id: 58188cae.4a6ec20a.3d2d1.aff2@mx.google.com
-
-[Sona: backported from master to v2.8.0 and resolved conflict]
-
-Reference to upstream patch:
-http://git.qemu-project.org/?p=qemu.git;a=commit;h=85d9d044471f93c48c5c396f7e217b4ef12f69f8
-
-CVE: CVE-2016-9908
-Upstream-Status: Backport
-
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
----
- hw/display/virtio-gpu-3d.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-gpu-3d.c
-index 23f39de..d98b140 100644
---- a/hw/display/virtio-gpu-3d.c
-+++ b/hw/display/virtio-gpu-3d.c
-@@ -371,7 +371,7 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
- 
-     virgl_renderer_get_cap_set(gc.capset_id, &max_ver,
-                                &max_size);
--    resp = g_malloc(sizeof(*resp) + max_size);
-+    resp = g_malloc0(sizeof(*resp) + max_size);
- 
-     resp->hdr.type = VIRTIO_GPU_RESP_OK_CAPSET;
-     virgl_renderer_fill_caps(gc.capset_id,
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-9912.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-9912.patch
deleted file mode 100644
index c009ffd96a..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2016-9912.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From b8e23926c568f2e963af39028b71c472e3023793 Mon Sep 17 00:00:00 2001
-From: Li Qiang <liq3ea@gmail.com>
-Date: Mon, 28 Nov 2016 21:29:25 -0500
-Subject: [PATCH] virtio-gpu: call cleanup mapping function in resource destroy
-
-If the guest destroy the resource before detach banking, the 'iov'
-and 'addrs' field in resource is not freed thus leading memory
-leak issue. This patch avoid this.
-
-CVE: CVE-2016-9912
-Upstream-Status: Backport
-
-Signed-off-by: Li Qiang <liq3ea@gmail.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-id: 1480386565-10077-1-git-send-email-liq3ea@gmail.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
----
- hw/display/virtio-gpu.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
-index ed2b6d3..6a26258 100644
---- a/hw/display/virtio-gpu.c
-+++ b/hw/display/virtio-gpu.c
-@@ -28,6 +28,8 @@
- static struct virtio_gpu_simple_resource*
- virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
- 
-+static void virtio_gpu_cleanup_mapping(struct virtio_gpu_simple_resource *res);
-+
- #ifdef CONFIG_VIRGL
- #include <virglrenderer.h>
- #define VIRGL(_g, _virgl, _simple, ...)                     \
-@@ -364,6 +366,7 @@ static void virtio_gpu_resource_destroy(VirtIOGPU *g,
-                                         struct virtio_gpu_simple_resource *res)
- {
-     pixman_image_unref(res->image);
-+    virtio_gpu_cleanup_mapping(res);
-     QTAILQ_REMOVE(&g->reslist, res, next);
-     g->hostmem -= res->hostmem;
-     g_free(res);
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/target-ppc-fix-user-mode.patch b/meta/recipes-devtools/qemu/qemu/target-ppc-fix-user-mode.patch
deleted file mode 100644
index ba21e71b0f..0000000000
--- a/meta/recipes-devtools/qemu/qemu/target-ppc-fix-user-mode.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-[Qemu-ppc] [PATCH 1/1] target-ppc, tcg: fix usermode segfault with pthread
-
-From: Sam Bobroff
-Subject: [Qemu-ppc] [PATCH 1/1] target-ppc, tcg: fix usermode segfault with pthread_create()
-Date: Mon, 30 Jan 2017 16:08:07 +1100
-Programs run under qemu-ppc64 on an x86_64 host currently segfault
-if they use pthread_create() due to the adjustment made to the NIP in
-commit bd6fefe71cec5a0c7d2be4ac96307f25db56abf9.
-
-This patch changes cpu_loop() to set the NIP back to the
-pre-incremented value before calling do_syscall(), which causes the
-correct address to be used for the new thread and corrects the fault.
-
-Signed-off-by: Sam Bobroff <address@hidden>
-
-Upstream-Status: Backport
-
----
-
-linux-user/main.c | 4 +++-
-1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/linux-user/main.c b/linux-user/main.c
-index 30049581ef..b5dee01541 100644
---- a/linux-user/main.c
-+++ b/linux-user/main.c
-@@ -1712,18 +1712,20 @@ void cpu_loop(CPUPPCState *env)
-              * in syscalls.
-              */
-             env->crf[0] &= ~0x1;
-+            env->nip += 4;
-             ret = do_syscall(env, env->gpr[0], env->gpr[3], env->gpr[4],
-                              env->gpr[5], env->gpr[6], env->gpr[7],
-                              env->gpr[8], 0, 0);
-             if (ret == -TARGET_ERESTARTSYS) {
-+                env->nip -= 4;
-                 break;
-             }
-             if (ret == (target_ulong)(-TARGET_QEMU_ESIGRETURN)) {
-+                env->nip -= 4;
-                 /* Returning from a successful sigreturn syscall.
-                    Avoid corrupting register state.  */
-                 break;
-             }
--            env->nip += 4;
-             if (ret > (target_ulong)(-515)) {
-                 env->crf[0] |= 0x1;
-                 ret = -ret;
diff --git a/meta/recipes-devtools/qemu/qemu_2.8.0.bb b/meta/recipes-devtools/qemu/qemu_2.9.0.bb
similarity index 87%
rename from meta/recipes-devtools/qemu/qemu_2.8.0.bb
rename to meta/recipes-devtools/qemu/qemu_2.9.0.bb
index 19d7e8f658..38bbf75757 100644
--- a/meta/recipes-devtools/qemu/qemu_2.8.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.9.0.bb
@@ -19,7 +19,6 @@ SRC_URI += " \
             file://no-valgrind.patch \
             file://pathlimit.patch \
             file://qemu-2.5.0-cflags.patch \
-            file://target-ppc-fix-user-mode.patch \
             file://glibc-2.25.patch \
 "
 
@@ -28,8 +27,6 @@ SRC_URI += " \
             file://0002-Introduce-condition-to-notify-waiters-of-completed-c.patch \
             file://0003-Introduce-condition-in-TPM-backend-for-notification.patch \
             file://0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch \
-            file://CVE-2016-9908.patch \
-            file://CVE-2016-9912.patch \
 "
 
 SRC_URI_append_class-native = " \
@@ -39,8 +36,8 @@ SRC_URI_append_class-native = " \
 
 SRC_URI =+ "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "17940dce063b6ce450a12e719a6c9c43"
-SRC_URI[sha256sum] = "dafd5d7f649907b6b617b822692f4c82e60cf29bc0fc58bc2036219b591e5e62"
+SRC_URI[md5sum] = "02781eb15b364aedef79da7a5113f5b7"
+SRC_URI[sha256sum] = "00bfb217b1bb03c7a6c3261b819cfccbfb5a58e3e2ceff546327d271773c6c14"
 
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
-- 
2.11.0


