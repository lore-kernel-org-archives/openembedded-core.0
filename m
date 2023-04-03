Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01822C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 05:25:03 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.63168.1680499494799114214
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 22:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DsN7vOZb;
 spf=pass (domain: mvista.com, ip: 209.85.216.46, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f46.google.com with SMTP id j13so26090000pjd.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 22:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1680499494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IFle8/DHNvFI2I96R8mYpvhxfP5pluzusZtS0rDJNsQ=;
        b=DsN7vOZbni21RvZuDumEwyL9vre0y2RJodj+o1HYgeC/RxJK+WOVa0qAO/153KSB/2
         AL6gPM3GLy2tJCpB50jR2asbkS/LgpRMwsGn4irwThm061fF2L7u0mtfIIwT7iAjPQQV
         aJx4FKk+4/MWboisBf+tRf5tVj1v0F3RPV7+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680499494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFle8/DHNvFI2I96R8mYpvhxfP5pluzusZtS0rDJNsQ=;
        b=G4P7/YO0fgPD0dROuTrAn/nUqgW2KFUzkKgiyJ4aB2InV8YOrkRiLAVCGhv7FXgrcN
         ZieEmevnnx6u/kDtnVbvVOGMa3rdsrJlhmT+L2PzIQ/nJja5/378hEJnOK0X4h/d5C6n
         U8/ooNbFK1gaJ7RyeqIbvlKgDXGLEc66FNAn3DoLG/bpC6Vz+CRrOFtHTGrvewa9D8jG
         jsa7kl/MGwPf1Ic3if/xvE4DxM3CIMn73t/O29SYtV1xBgKy1KJzR1zTjjS1eoqrYBJ4
         bp0icHafAtb0jyfh4H+nli40PnbRL4juZDXjf5nvi2Pzf0bOxDTmlAC1PYLUg/ZkoCLI
         EISg==
X-Gm-Message-State: AAQBX9fSlMbdUYXh5XxY4nLCJ4SjdlATSifR6ZLSeTc4Yu+3IUgIlwUG
	X4O+AOhYch9v6f36usHm5sko7mv8zct8VPmVbM0=
X-Google-Smtp-Source: AKy350aOceCXuAB6UJl6JRPW7FgjnB17YNQp+Rje+TI7fL7n/yXhQVW5s1gnLS+e67DQml/RHdEwzg==
X-Received: by 2002:a17:902:e543:b0:19a:e762:a1af with SMTP id n3-20020a170902e54300b0019ae762a1afmr17679041plf.33.1680499493603;
        Sun, 02 Apr 2023 22:24:53 -0700 (PDT)
Received: from MVIN00024 ([49.34.122.33])
        by smtp.gmail.com with ESMTPSA id p2-20020a170902bd0200b001a2beda73e1sm1341918pls.166.2023.04.02.22.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 22:24:53 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 03 Apr 2023 10:52:35 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] qemu: fix compile error which imported by CVE-2022-4144
Date: Mon,  3 Apr 2023 10:52:34 +0530
Message-Id: <20230403052234.7348-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 05:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179603

Upstream-Status: Backport from https://github.com/qemu/qemu/commit/61c34fc && https://gitlab.com/qemu-project/qemu/-/commit/8efec0ef8bbc1e75a7ebf6e325a35806ece9b39f

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 ...ass-requested-buffer-size-to-qxl_phy.patch | 236 ++++++++++++++++++
 2 files changed, 237 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0649727338..088f164cb7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -117,6 +117,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3507.patch \
            file://CVE-2021-3929.patch \
            file://CVE-2022-4144.patch \
+           file://hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch b/meta/recipes-devtools/qemu/qemu/hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch
new file mode 100644
index 0000000000..f380be486c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch
@@ -0,0 +1,236 @@
+From 5a44a01c9eca6507be45d107c27377a3e8d0ee8c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
+Date: Mon, 28 Nov 2022 21:27:39 +0100
+Subject: [PATCH] hw/display/qxl: Pass requested buffer size to qxl_phys2virt()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Currently qxl_phys2virt() doesn't check for buffer overrun.
+In order to do so in the next commit, pass the buffer size
+as argument.
+
+For QXLCursor in qxl_render_cursor() -> qxl_cursor() we
+verify the size of the chunked data ahead, checking we can
+access 'sizeof(QXLCursor) + chunk->data_size' bytes.
+Since in the SPICE_CURSOR_TYPE_MONO case the cursor is
+assumed to fit in one chunk, no change are required.
+In SPICE_CURSOR_TYPE_ALPHA the ahead read is handled in
+qxl_unpack_chunks().
+
+Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
+Acked-by: Gerd Hoffmann <kraxel@redhat.com>
+Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
+Message-Id: <20221128202741.4945-4-philmd@linaro.org>
+
+Backport and rebase patch to fix compile error which imported by CVE-2022-4144.patch:
+
+/qxl.c: In function 'qxl_phys2virt':
+| /home/hitendra/work/yocto-work/cgx-data/dunfell-3.1/x86-generic-64-5.4-3.1-cgx/project/tmp/work/i586-montavistamllib32-linux/lib32-qemu/4.2.0-r0.8/qemu-4.2.0/hw/display/qxl.c:1508:67: error: 'size' undeclared (first use in this function); did you mean 'gsize'?
+|  1508 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size)) {
+|       |                                                                   ^~~~
+|       |                                                                   gsize
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/61c34fc && https://gitlab.com/qemu-project/qemu/-/commit/8efec0ef8bbc1e75a7ebf6e325a35806ece9b39f]
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ hw/display/qxl-logger.c | 22 +++++++++++++++++++---
+ hw/display/qxl-render.c | 20 ++++++++++++++++----
+ hw/display/qxl.c        | 17 +++++++++++------
+ hw/display/qxl.h        |  3 ++-
+ 4 files changed, 48 insertions(+), 14 deletions(-)
+
+diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
+index 2ec6d8fa..031ddfec 100644
+--- a/hw/display/qxl-logger.c
++++ b/hw/display/qxl-logger.c
+@@ -106,7 +106,7 @@ static int qxl_log_image(PCIQXLDevice *qxl, QXLPHYSICAL addr, int group_id)
+     QXLImage *image;
+     QXLImageDescriptor *desc;
+ 
+-    image = qxl_phys2virt(qxl, addr, group_id);
++    image = qxl_phys2virt(qxl, addr, group_id, sizeof(QXLImage));
+     if (!image) {
+         return 1;
+     }
+@@ -216,7 +216,8 @@ int qxl_log_cmd_cursor(PCIQXLDevice *qxl, QXLCursorCmd *cmd, int group_id)
+                 cmd->u.set.position.y,
+                 cmd->u.set.visible ? "yes" : "no",
+                 cmd->u.set.shape);
+-        cursor = qxl_phys2virt(qxl, cmd->u.set.shape, group_id);
++        cursor = qxl_phys2virt(qxl, cmd->u.set.shape, group_id,
++                               sizeof(QXLCursor));
+         if (!cursor) {
+             return 1;
+         }
+@@ -238,6 +239,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ring, QXLCommandExt *ext)
+ {
+     bool compat = ext->flags & QXL_COMMAND_FLAG_COMPAT;
+     void *data;
++    size_t datasz;
+     int ret;
+ 
+     if (!qxl->cmdlog) {
+@@ -249,7 +251,20 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ring, QXLCommandExt *ext)
+             qxl_name(qxl_type, ext->cmd.type),
+             compat ? "(compat)" : "");
+ 
+-    data = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
++    switch (ext->cmd.type) {
++    case QXL_CMD_DRAW:
++        datasz = compat ? sizeof(QXLCompatDrawable) : sizeof(QXLDrawable);
++        break;
++    case QXL_CMD_SURFACE:
++        datasz = sizeof(QXLSurfaceCmd);
++        break;
++    case QXL_CMD_CURSOR:
++        datasz = sizeof(QXLCursorCmd);
++        break;
++    default:
++        goto out;
++    }
++    data = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id, datasz);
+     if (!data) {
+         return 1;
+     }
+@@ -271,6 +286,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ring, QXLCommandExt *ext)
+         qxl_log_cmd_cursor(qxl, data, ext->group_id);
+         break;
+     }
++out:
+     fprintf(stderr, "\n");
+     return 0;
+ }
+diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
+index d532e157..a65a6d64 100644
+--- a/hw/display/qxl-render.c
++++ b/hw/display/qxl-render.c
+@@ -107,7 +107,9 @@ static void qxl_render_update_area_unlocked(PCIQXLDevice *qxl)
+         qxl->guest_primary.resized = 0;
+         qxl->guest_primary.data = qxl_phys2virt(qxl,
+                                                 qxl->guest_primary.surface.mem,
+-                                                MEMSLOT_GROUP_GUEST);
++                                                MEMSLOT_GROUP_GUEST,
++                                                qxl->guest_primary.abs_stride
++                                                * height);
+         if (!qxl->guest_primary.data) {
+             return;
+         }
+@@ -222,7 +224,8 @@ static void qxl_unpack_chunks(void *dest, size_t size, PCIQXLDevice *qxl,
+         if (offset == size) {
+             return;
+         }
+-        chunk = qxl_phys2virt(qxl, chunk->next_chunk, group_id);
++        chunk = qxl_phys2virt(qxl, chunk->next_chunk, group_id,
++                              sizeof(QXLDataChunk) + chunk->data_size);
+         if (!chunk) {
+             return;
+         }
+@@ -289,7 +292,8 @@ fail:
+ /* called from spice server thread context only */
+ int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)
+ {
+-    QXLCursorCmd *cmd = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
++    QXLCursorCmd *cmd = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id,
++                                      sizeof(QXLCursorCmd));
+     QXLCursor *cursor;
+     QEMUCursor *c;
+ 
+@@ -308,7 +312,15 @@ int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)
+     }
+     switch (cmd->type) {
+     case QXL_CURSOR_SET:
+-        cursor = qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id);
++        /* First read the QXLCursor to get QXLDataChunk::data_size ... */
++        cursor = qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id,
++                               sizeof(QXLCursor));
++        if (!cursor) {
++            return 1;
++        }
++        /* Then read including the chunked data following QXLCursor. */
++        cursor = qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id,
++                               sizeof(QXLCursor) + cursor->chunk.data_size);
+         if (!cursor) {
+             return 1;
+         }
+diff --git a/hw/display/qxl.c b/hw/display/qxl.c
+index 6bc8385b..858d3e93 100644
+--- a/hw/display/qxl.c
++++ b/hw/display/qxl.c
+@@ -275,7 +275,8 @@ static void qxl_spice_monitors_config_async(PCIQXLDevice *qxl, int replay)
+                                           QXL_IO_MONITORS_CONFIG_ASYNC));
+     }
+ 
+-    cfg = qxl_phys2virt(qxl, qxl->guest_monitors_config, MEMSLOT_GROUP_GUEST);
++    cfg = qxl_phys2virt(qxl, qxl->guest_monitors_config, MEMSLOT_GROUP_GUEST,
++                        sizeof(QXLMonitorsConfig));
+     if (cfg != NULL && cfg->count == 1) {
+         qxl->guest_primary.resized = 1;
+         qxl->guest_head0_width  = cfg->heads[0].width;
+@@ -460,7 +461,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, struct QXLCommandExt *ext)
+     switch (le32_to_cpu(ext->cmd.type)) {
+     case QXL_CMD_SURFACE:
+     {
+-        QXLSurfaceCmd *cmd = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
++        QXLSurfaceCmd *cmd = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id,
++                                           sizeof(QXLSurfaceCmd));
+ 
+         if (!cmd) {
+             return 1;
+@@ -494,7 +496,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, struct QXLCommandExt *ext)
+     }
+     case QXL_CMD_CURSOR:
+     {
+-        QXLCursorCmd *cmd = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
++        QXLCursorCmd *cmd = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id,
++                                          sizeof(QXLCursorCmd));
+ 
+         if (!cmd) {
+             return 1;
+@@ -674,7 +677,8 @@ static int interface_get_command(QXLInstance *sin, struct QXLCommandExt *ext)
+              *
+              * https://cgit.freedesktop.org/spice/win32/qxl-wddm-dod/commit/?id=f6e099db39e7d0787f294d5fd0dce328b5210faa
+              */
+-            void *msg = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
++            void *msg = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id,
++			    sizeof(QXLCommandRing));
+             if (msg != NULL && (
+                     msg < (void *)qxl->vga.vram_ptr ||
+                     msg > ((void *)qxl->vga.vram_ptr + qxl->vga.vram_size))) {
+@@ -1494,7 +1498,8 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
+ }
+ 
+ /* can be also called from spice server thread context */
+-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id)
++void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,
++                    size_t size)
+ {
+     uint64_t offset;
+     uint32_t slot;
+@@ -1994,7 +1999,7 @@ static void qxl_dirty_surfaces(PCIQXLDevice *qxl)
+         }
+ 
+         cmd = qxl_phys2virt(qxl, qxl->guest_surfaces.cmds[i],
+-                            MEMSLOT_GROUP_GUEST);
++                            MEMSLOT_GROUP_GUEST, sizeof(QXLSurfaceCmd));
+         assert(cmd);
+         assert(cmd->type == QXL_SURFACE_CMD_CREATE);
+         qxl_dirty_one_surface(qxl, cmd->u.surface_create.data,
+diff --git a/hw/display/qxl.h b/hw/display/qxl.h
+index 80eb0d26..fcfd133a 100644
+--- a/hw/display/qxl.h
++++ b/hw/display/qxl.h
+@@ -147,7 +147,8 @@ typedef struct PCIQXLDevice {
+ #define QXL_DEFAULT_REVISION QXL_REVISION_STABLE_V12
+ 
+ /* qxl.c */
+-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id);
++void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id,
++                    size_t size);
+ void qxl_set_guest_bug(PCIQXLDevice *qxl, const char *msg, ...)
+     GCC_FMT_ATTR(2, 3);
+ 
+-- 
+2.25.1
+
-- 
2.25.1


