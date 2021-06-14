Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.28310.1623668082936046278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 03:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 946C6113E
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 03:54:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 247F63F694
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 03:54:42 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemu: fix virtio vhost-user-gpu CVEs
Date: Mon, 14 Jun 2021 11:54:37 +0100
Message-Id: <20210614105437.3035507-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614105437.3035507-1-ross.burton@arm.com>
References: <20210614105437.3035507-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Fix a slew of CVEs (CVE-2021-3544, CVE-2021-3545, CVE-2021-3546) by
backporting the relevant patches from qemu's git.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  7 +++
 ...ix-memory-disclosure-in-virgl_cmd_ge.patch | 43 ++++++++++++++
 ...ix-resource-leak-in-vg_resource_crea.patch | 41 +++++++++++++
 ...ix-memory-leak-in-vg_resource_attach.patch | 48 +++++++++++++++
 ...ix-memory-leak-while-calling-vg_reso.patch | 50 ++++++++++++++++
 ...ix-memory-leak-in-virgl_cmd_resource.patch | 58 +++++++++++++++++++
 ...ix-memory-leak-in-virgl_resource_att.patch | 49 ++++++++++++++++
 ...ix-OOB-write-in-virgl_cmd_get_capset.patch | 49 ++++++++++++++++
 8 files changed, 345 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-vhost-user-gpu-f=
ix-memory-disclosure-in-virgl_cmd_ge.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-vhost-user-gpu-f=
ix-resource-leak-in-vg_resource_crea.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003-vhost-user-gpu-f=
ix-memory-leak-in-vg_resource_attach.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0004-vhost-user-gpu-f=
ix-memory-leak-while-calling-vg_reso.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0005-vhost-user-gpu-f=
ix-memory-leak-in-virgl_cmd_resource.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0006-vhost-user-gpu-f=
ix-memory-leak-in-virgl_resource_att.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0007-vhost-user-gpu-f=
ix-OOB-write-in-virgl_cmd_get_capset.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 0cbd66301e..aa7cf74dd3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -29,6 +29,13 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.ta=
r.xz \
            file://determinism.patch \
            file://0001-tests-meson.build-use-relative-path-to-refer-to-f=
ile.patch \
            file://0001-configure-fix-detection-of-gdbus-codegen.patch \
+           file://0001-vhost-user-gpu-fix-memory-disclosure-in-virgl_cmd=
_ge.patch \
+           file://0002-vhost-user-gpu-fix-resource-leak-in-vg_resource_c=
rea.patch \
+           file://0003-vhost-user-gpu-fix-memory-leak-in-vg_resource_att=
ach.patch \
+           file://0004-vhost-user-gpu-fix-memory-leak-while-calling-vg_r=
eso.patch \
+           file://0005-vhost-user-gpu-fix-memory-leak-in-virgl_cmd_resou=
rce.patch \
+           file://0006-vhost-user-gpu-fix-memory-leak-in-virgl_resource_=
att.patch \
+           file://0007-vhost-user-gpu-fix-OOB-write-in-virgl_cmd_get_cap=
set.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/0001-vhost-user-gpu-fix-memo=
ry-disclosure-in-virgl_cmd_ge.patch b/meta/recipes-devtools/qemu/qemu/000=
1-vhost-user-gpu-fix-memory-disclosure-in-virgl_cmd_ge.patch
new file mode 100644
index 0000000000..981c237292
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-vhost-user-gpu-fix-memory-disc=
losure-in-virgl_cmd_ge.patch
@@ -0,0 +1,43 @@
+CVE: CVE-2021-3545
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 121841b25d72d13f8cad554363138c360f1250ea Mon Sep 17 00:00:00 2001
+From: Li Qiang <liq3ea@163.com>
+Date: Sat, 15 May 2021 20:03:56 -0700
+Subject: [PATCH 1/7] vhost-user-gpu: fix memory disclosure in
+ virgl_cmd_get_capset_info (CVE-2021-3545)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Otherwise some of the 'resp' will be leaked to guest.
+
+Fixes: CVE-2021-3545
+Reported-by: Li Qiang <liq3ea@163.com>
+virtio-gpu fix: 42a8dadc74 ("virtio-gpu: fix information leak
+in getting capset info dispatch")
+
+Signed-off-by: Li Qiang <liq3ea@163.com>
+Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20210516030403.107723-2-liq3ea@163.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+---
+ contrib/vhost-user-gpu/virgl.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/vir=
gl.c
+index 9e6660c7ab..6a332d601f 100644
+--- a/contrib/vhost-user-gpu/virgl.c
++++ b/contrib/vhost-user-gpu/virgl.c
+@@ -128,6 +128,7 @@ virgl_cmd_get_capset_info(VuGpu *g,
+=20
+     VUGPU_FILL_CMD(info);
+=20
++    memset(&resp, 0, sizeof(resp));
+     if (info.capset_index =3D=3D 0) {
+         resp.capset_id =3D VIRTIO_GPU_CAPSET_VIRGL;
+         virgl_renderer_get_cap_set(resp.capset_id,
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0002-vhost-user-gpu-fix-reso=
urce-leak-in-vg_resource_crea.patch b/meta/recipes-devtools/qemu/qemu/000=
2-vhost-user-gpu-fix-resource-leak-in-vg_resource_crea.patch
new file mode 100644
index 0000000000..a9aee47e39
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0002-vhost-user-gpu-fix-resource-le=
ak-in-vg_resource_crea.patch
@@ -0,0 +1,41 @@
+CVE: CVE-2021-3544
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 86dd8fac2acc366930a5dc08d3fb1b1e816f4e1e Mon Sep 17 00:00:00 2001
+From: Li Qiang <liq3ea@163.com>
+Date: Sat, 15 May 2021 20:03:57 -0700
+Subject: [PATCH 2/7] vhost-user-gpu: fix resource leak in
+ 'vg_resource_create_2d' (CVE-2021-3544)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Call 'vugbm_buffer_destroy' in error path to avoid resource leak.
+
+Fixes: CVE-2021-3544
+Reported-by: Li Qiang <liq3ea@163.com>
+Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Li Qiang <liq3ea@163.com>
+Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20210516030403.107723-3-liq3ea@163.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+---
+ contrib/vhost-user-gpu/vhost-user-gpu.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-use=
r-gpu/vhost-user-gpu.c
+index f73f292c9f..b5e153d0d6 100644
+--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
++++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
+@@ -349,6 +349,7 @@ vg_resource_create_2d(VuGpu *g,
+         g_critical("%s: resource creation failed %d %d %d",
+                    __func__, c2d.resource_id, c2d.width, c2d.height);
+         g_free(res);
++        vugbm_buffer_destroy(&res->buffer);
+         cmd->error =3D VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
+         return;
+     }
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0003-vhost-user-gpu-fix-memo=
ry-leak-in-vg_resource_attach.patch b/meta/recipes-devtools/qemu/qemu/000=
3-vhost-user-gpu-fix-memory-leak-in-vg_resource_attach.patch
new file mode 100644
index 0000000000..1718486405
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0003-vhost-user-gpu-fix-memory-leak=
-in-vg_resource_attach.patch
@@ -0,0 +1,48 @@
+CVE: CVE-2021-3544
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From b9f79858a614d95f5de875d0ca31096eaab72c3b Mon Sep 17 00:00:00 2001
+From: Li Qiang <liq3ea@163.com>
+Date: Sat, 15 May 2021 20:03:58 -0700
+Subject: [PATCH 3/7] vhost-user-gpu: fix memory leak in
+ vg_resource_attach_backing (CVE-2021-3544)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Check whether the 'res' has already been attach_backing to avoid
+memory leak.
+
+Fixes: CVE-2021-3544
+Reported-by: Li Qiang <liq3ea@163.com>
+virtio-gpu fix: 204f01b309 ("virtio-gpu: fix memory leak
+in resource attach backing")
+
+Signed-off-by: Li Qiang <liq3ea@163.com>
+Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20210516030403.107723-4-liq3ea@163.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+---
+ contrib/vhost-user-gpu/vhost-user-gpu.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-use=
r-gpu/vhost-user-gpu.c
+index b5e153d0d6..0437e52b64 100644
+--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
++++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
+@@ -489,6 +489,11 @@ vg_resource_attach_backing(VuGpu *g,
+         return;
+     }
+=20
++    if (res->iov) {
++        cmd->error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;
++        return;
++    }
++
+     ret =3D vg_create_mapping_iov(g, &ab, cmd, &res->iov);
+     if (ret !=3D 0) {
+         cmd->error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0004-vhost-user-gpu-fix-memo=
ry-leak-while-calling-vg_reso.patch b/meta/recipes-devtools/qemu/qemu/000=
4-vhost-user-gpu-fix-memory-leak-while-calling-vg_reso.patch
new file mode 100644
index 0000000000..9fc2fafe1d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0004-vhost-user-gpu-fix-memory-leak=
-while-calling-vg_reso.patch
@@ -0,0 +1,50 @@
+CVE: CVE-2021-3544
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From b7afebcf9e6ecf3cf9b5a9b9b731ed04bca6aa3e Mon Sep 17 00:00:00 2001
+From: Li Qiang <liq3ea@163.com>
+Date: Sat, 15 May 2021 20:03:59 -0700
+Subject: [PATCH 4/7] vhost-user-gpu: fix memory leak while calling
+ 'vg_resource_unref' (CVE-2021-3544)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+If the guest trigger following sequences, the attach_backing will be lea=
ked:
+
+	vg_resource_create_2d
+	vg_resource_attach_backing
+	vg_resource_unref
+
+This patch fix this by freeing 'res->iov' in vg_resource_destroy.
+
+Fixes: CVE-2021-3544
+Reported-by: Li Qiang <liq3ea@163.com>
+virtio-gpu fix: 5e8e3c4c75 ("virtio-gpu: fix resource leak
+in virgl_cmd_resource_unref")
+
+Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Li Qiang <liq3ea@163.com>
+Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20210516030403.107723-5-liq3ea@163.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+---
+ contrib/vhost-user-gpu/vhost-user-gpu.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-use=
r-gpu/vhost-user-gpu.c
+index 0437e52b64..770dfad529 100644
+--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
++++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
+@@ -400,6 +400,7 @@ vg_resource_destroy(VuGpu *g,
+     }
+=20
+     vugbm_buffer_destroy(&res->buffer);
++    g_free(res->iov);
+     pixman_image_unref(res->image);
+     QTAILQ_REMOVE(&g->reslist, res, next);
+     g_free(res);
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0005-vhost-user-gpu-fix-memo=
ry-leak-in-virgl_cmd_resource.patch b/meta/recipes-devtools/qemu/qemu/000=
5-vhost-user-gpu-fix-memory-leak-in-virgl_cmd_resource.patch
new file mode 100644
index 0000000000..e70f3c02c2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0005-vhost-user-gpu-fix-memory-leak=
-in-virgl_cmd_resource.patch
@@ -0,0 +1,58 @@
+CVE: CVE-2021-3544
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From f6091d86ba9ea05f4e111b9b42ee0005c37a6779 Mon Sep 17 00:00:00 2001
+From: Li Qiang <liq3ea@163.com>
+Date: Sat, 15 May 2021 20:04:00 -0700
+Subject: [PATCH 5/7] vhost-user-gpu: fix memory leak in
+ 'virgl_cmd_resource_unref' (CVE-2021-3544)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The 'res->iov' will be leaked if the guest trigger following sequences:
+
+	virgl_cmd_create_resource_2d
+	virgl_resource_attach_backing
+	virgl_cmd_resource_unref
+
+This patch fixes this.
+
+Fixes: CVE-2021-3544
+Reported-by: Li Qiang <liq3ea@163.com>
+virtio-gpu fix: 5e8e3c4c75 ("virtio-gpu: fix resource leak
+in virgl_cmd_resource_unref"
+
+Signed-off-by: Li Qiang <liq3ea@163.com>
+Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20210516030403.107723-6-liq3ea@163.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+---
+ contrib/vhost-user-gpu/virgl.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/vir=
gl.c
+index 6a332d601f..c669d73a1d 100644
+--- a/contrib/vhost-user-gpu/virgl.c
++++ b/contrib/vhost-user-gpu/virgl.c
+@@ -108,9 +108,16 @@ virgl_cmd_resource_unref(VuGpu *g,
+                          struct virtio_gpu_ctrl_command *cmd)
+ {
+     struct virtio_gpu_resource_unref unref;
++    struct iovec *res_iovs =3D NULL;
++    int num_iovs =3D 0;
+=20
+     VUGPU_FILL_CMD(unref);
+=20
++    virgl_renderer_resource_detach_iov(unref.resource_id,
++                                       &res_iovs,
++                                       &num_iovs);
++    g_free(res_iovs);
++
+     virgl_renderer_resource_unref(unref.resource_id);
+ }
+=20
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0006-vhost-user-gpu-fix-memo=
ry-leak-in-virgl_resource_att.patch b/meta/recipes-devtools/qemu/qemu/000=
6-vhost-user-gpu-fix-memory-leak-in-virgl_resource_att.patch
new file mode 100644
index 0000000000..5efb87ca33
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0006-vhost-user-gpu-fix-memory-leak=
-in-virgl_resource_att.patch
@@ -0,0 +1,49 @@
+CVE: CVE-2021-3544
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 63736af5a6571d9def93769431e0d7e38c6677bf Mon Sep 17 00:00:00 2001
+From: Li Qiang <liq3ea@163.com>
+Date: Sat, 15 May 2021 20:04:01 -0700
+Subject: [PATCH 6/7] vhost-user-gpu: fix memory leak in
+ 'virgl_resource_attach_backing' (CVE-2021-3544)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+If 'virgl_renderer_resource_attach_iov' failed, the 'res_iovs' will
+be leaked.
+
+Fixes: CVE-2021-3544
+Reported-by: Li Qiang <liq3ea@163.com>
+virtio-gpu fix: 33243031da ("virtio-gpu-3d: fix memory leak
+in resource attach backing")
+
+Signed-off-by: Li Qiang <liq3ea@163.com>
+Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20210516030403.107723-7-liq3ea@163.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+---
+ contrib/vhost-user-gpu/virgl.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/vir=
gl.c
+index c669d73a1d..a16a311d80 100644
+--- a/contrib/vhost-user-gpu/virgl.c
++++ b/contrib/vhost-user-gpu/virgl.c
+@@ -287,8 +287,11 @@ virgl_resource_attach_backing(VuGpu *g,
+         return;
+     }
+=20
+-    virgl_renderer_resource_attach_iov(att_rb.resource_id,
++    ret =3D virgl_renderer_resource_attach_iov(att_rb.resource_id,
+                                        res_iovs, att_rb.nr_entries);
++    if (ret !=3D 0) {
++        g_free(res_iovs);
++    }
+ }
+=20
+ static void
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0007-vhost-user-gpu-fix-OOB-=
write-in-virgl_cmd_get_capset.patch b/meta/recipes-devtools/qemu/qemu/000=
7-vhost-user-gpu-fix-OOB-write-in-virgl_cmd_get_capset.patch
new file mode 100644
index 0000000000..33e6a66193
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0007-vhost-user-gpu-fix-OOB-write-i=
n-virgl_cmd_get_capset.patch
@@ -0,0 +1,49 @@
+CVE: CVE-2021-3546
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 9f22893adcb02580aee5968f32baa2cd109b3ec2 Mon Sep 17 00:00:00 2001
+From: Li Qiang <liq3ea@163.com>
+Date: Sat, 15 May 2021 20:04:02 -0700
+Subject: [PATCH 7/7] vhost-user-gpu: fix OOB write in 'virgl_cmd_get_cap=
set'
+ (CVE-2021-3546)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+If 'virgl_cmd_get_capset' set 'max_size' to 0,
+the 'virgl_renderer_fill_caps' will write the data after the 'resp'.
+This patch avoid this by checking the returned 'max_size'.
+
+virtio-gpu fix: abd7f08b23 ("display: virtio-gpu-3d: check
+virgl capabilities max_size")
+
+Fixes: CVE-2021-3546
+Reported-by: Li Qiang <liq3ea@163.com>
+Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Li Qiang <liq3ea@163.com>
+Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20210516030403.107723-8-liq3ea@163.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+---
+ contrib/vhost-user-gpu/virgl.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/vir=
gl.c
+index a16a311d80..7172104b19 100644
+--- a/contrib/vhost-user-gpu/virgl.c
++++ b/contrib/vhost-user-gpu/virgl.c
+@@ -177,6 +177,10 @@ virgl_cmd_get_capset(VuGpu *g,
+=20
+     virgl_renderer_get_cap_set(gc.capset_id, &max_ver,
+                                &max_size);
++    if (!max_size) {
++        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
++        return;
++    }
+     resp =3D g_malloc0(sizeof(*resp) + max_size);
+=20
+     resp->hdr.type =3D VIRTIO_GPU_RESP_OK_CAPSET;
+--=20
+2.25.1
+
--=20
2.25.1

