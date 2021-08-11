Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.3001.1628651336658972329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 20:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17B38sKR024285
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 20:08:54 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 10 Aug 2021 20:08:54 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 10 Aug 2021 20:08:54 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 2/5] qemu: fix CVE-2021-3544, CVE-2021-3545, CVE-2021-3546
Date: Tue, 10 Aug 2021 23:08:45 -0400
Message-ID: <20210811030848.11076-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210811030848.11076-1-sakib.sajal@windriver.com>
References: <20210811030848.11076-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 17B38sKR024285
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  7 +++
 .../qemu/qemu/CVE-2021-3544_1.patch           | 43 ++++++++++++++
 .../qemu/qemu/CVE-2021-3544_2.patch           | 41 +++++++++++++
 .../qemu/qemu/CVE-2021-3544_3.patch           | 48 +++++++++++++++
 .../qemu/qemu/CVE-2021-3544_4.patch           | 50 ++++++++++++++++
 .../qemu/qemu/CVE-2021-3544_5.patch           | 58 +++++++++++++++++++
 .../qemu/qemu/CVE-2021-3544_6.patch           | 49 ++++++++++++++++
 .../qemu/qemu/CVE-2021-3544_7.patch           | 49 ++++++++++++++++
 8 files changed, 345 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3544_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3544_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3544_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3544_4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3544_5.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3544_6.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3544_7.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 8b77da7ebf..0a0893d6ae 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -59,6 +59,13 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.ta=
r.xz \
            file://CVE-2021-3392.patch \
            file://CVE-2021-3527_1.patch \
            file://CVE-2021-3527_2.patch \
+	   file://CVE-2021-3544_1.patch \
+           file://CVE-2021-3544_2.patch \
+           file://CVE-2021-3544_3.patch \
+           file://CVE-2021-3544_4.patch \
+           file://CVE-2021-3544_5.patch \
+           file://CVE-2021-3544_6.patch \
+           file://CVE-2021-3544_7.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_1.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3544_1.patch
new file mode 100644
index 0000000000..e0702a4aa9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_1.patch
@@ -0,0 +1,43 @@
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
+
+CVE: CVE-2021-3545
+Upstream-Status: Backport [121841b25d72d13f8cad554363138c360f1250ea]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
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
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_2.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3544_2.patch
new file mode 100644
index 0000000000..a4894441e1
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_2.patch
@@ -0,0 +1,41 @@
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
+
+CVE: CVE-2021-3544
+Upstream-Status: Backport [86dd8fac2acc366930a5dc08d3fb1b1e816f4e1e]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
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
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_3.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3544_3.patch
new file mode 100644
index 0000000000..6300a90e5d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_3.patch
@@ -0,0 +1,48 @@
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
+
+CVE: CVE-2021-3544
+Upstream-Status: Backport [b9f79858a614d95f5de875d0ca31096eaab72c3b]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
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
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_4.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3544_4.patch
new file mode 100644
index 0000000000..bbc56d73e8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_4.patch
@@ -0,0 +1,50 @@
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
+
+CVE: CVE-2021-3544
+Upstream-Status: Backport [b7afebcf9e6ecf3cf9b5a9b9b731ed04bca6aa3e]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
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
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_5.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3544_5.patch
new file mode 100644
index 0000000000..3adacc7a3d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_5.patch
@@ -0,0 +1,58 @@
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
+
+CVE: CVE-2021-3544
+Upstream-Status: Backport [f6091d86ba9ea05f4e111b9b42ee0005c37a6779]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
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
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_6.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3544_6.patch
new file mode 100644
index 0000000000..3410d15fb0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_6.patch
@@ -0,0 +1,49 @@
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
+
+CVE: CVE-2021-3544
+Upstream-Status: Backport [63736af5a6571d9def93769431e0d7e38c6677bf]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
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
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_7.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3544_7.patch
new file mode 100644
index 0000000000..fea0562f7b
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3544_7.patch
@@ -0,0 +1,49 @@
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
+
+CVE: CVE-2021-3546
+Upstream-Status: Backport [9f22893adcb02580aee5968f32baa2cd109b3ec2]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
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
2.32.0

