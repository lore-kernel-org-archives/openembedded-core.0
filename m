Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B80C7618D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 02:39:38 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.92067.1680575970709666840
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 19:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=XwIa0oR1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id l14so20487821pfc.11
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 19:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680575976; x=1683167976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVp+/4f3OmihDqpPvS7L46aY43oDf1/uv4Tf/d9zV0I=;
        b=XwIa0oR1/3J49p+PNA/2Ldxa0xwj614RWrd1PXAS9mYKKvUhRkSTAQaXXdsFOWGHCc
         /W8x5tRs+njBcB4ukBdDbckbjsSi1csuubrccwlhsfDpcl+CKFGBu/w1hbSq7WynVUEf
         poOPkRg/lgnBLC356ki3Zgw2JOhgS1NGx7786A/jf+GVm+ASzBKN/FOdKE20N+Ak/tCZ
         GjoEU+fl11epizhXiYM9plgHdT5CRZOZG3Vwxhjb27/wvt7WsmAGyLl8Ia5t3Aj6UX+t
         z0iGIlrMtPdzyrwpD5ES4/aSbjf6u8ios8d+p8z3un+nxLb+zGl8vqOL8yqnITKukNS2
         /0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680575976; x=1683167976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVp+/4f3OmihDqpPvS7L46aY43oDf1/uv4Tf/d9zV0I=;
        b=uzho5pvgblFqJPfX1hQsprciEobR/I/rQvmvbR2LY7HQcwEzt4Z7CLj2sAllATqwJ+
         hegMqFQJ1UNn1BjuEHJbXVciECvj8QKVPHUVloKQeK7LU5aS1EQtxLx2H7Hn/t9QbVeK
         6bXmTUYjqmNNxajC8/bwUG/RUFp63VqfAHDL0wojQRGB6V5xsVsYwqjZLButXfwQBOAb
         TTi3PR2jh4oTTz1p6LyW9OXbvFP70t+HKmlgFIteu4UytRUF+NLBNnrE2fQynkZmco5S
         1f13DeyoapEfrJ6eT0ZI3ElA9W8cwdBH0wHrcDya+99PsNbWXWYtudykGwCndiCJdv7N
         olnA==
X-Gm-Message-State: AAQBX9fJvguzPm6IEN/5uj2c8bfTcLTcwIGTwvlEEjjJGu7Vx0fnMutd
	ojJ4cs44+NcybG2o2+0SEm3+BBXXB33sdwVoZE0=
X-Google-Smtp-Source: AKy350YAl8wWHrzUIOiNDViepG6L2Zv4H8so6+vEaj9cNAU1F08mmTuq2hGvhYSmKCfIER2+c9kNIA==
X-Received: by 2002:a62:6204:0:b0:625:cb74:9e01 with SMTP id w4-20020a626204000000b00625cb749e01mr564048pfb.25.1680575976420;
        Mon, 03 Apr 2023 19:39:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id a14-20020aa7864e000000b0062deace7c0csm6850569pfo.190.2023.04.03.19.39.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 19:39:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/7] qemu: fix compile error which imported by CVE-2022-4144
Date: Mon,  3 Apr 2023 16:39:13 -1000
Message-Id: <d17f4c741c66268ce54ff89be2be9b0402c98df2.1680575792.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680575792.git.steve@sakoman.com>
References: <cover.1680575792.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 02:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179663

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/qemu/qemu/commit/61c34fc && https://gitlab.com/qemu-project/qemu/-/commit/8efec0ef8bbc1e75a7ebf6e325a35806ece9b39f

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 ...ass-requested-buffer-size-to-qxl_phy.patch | 236 ++++++++++++++++++
 2 files changed, 237 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 600a2af022..5466303c94 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -134,6 +134,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3409-3.patch \
            file://CVE-2021-3409-4.patch \
            file://CVE-2021-3409-5.patch \
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
2.34.1


