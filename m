Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940A2C6379F
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:41:47 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.43552.1676990499308222312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=XZQ0AAIz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id n5so2801167pfv.11
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzOTgWpscrqwSvLTIKg5fluqrbi5fP2D6zkqJ15zwGg=;
        b=XZQ0AAIzZ9bZbI12g7hI0LBXxeDzebKPCP+6GQbRxvVWTfDWCX7hFaMezfMzLGmRVQ
         A8JPfoaBVXXZAwZWi+0G0CLDUj7075jU9PqBnR7wINI207Jgq0X3regH2e/tJPIWlZbJ
         iUsUTcPZ2SRHVhZE913+HAg+A9CJeY2PM85HoR6p7f0rtrGzNKGvZHZ232BZW1NxBE8f
         Jm37gSTE0y3UCdDDJzGG0ORcIvOcBwaZr5lzN2jilURigT2GV66ekfZDPNgjSFb0xa+/
         LmRgx/EY7D0BSwRfoM8edOB6RnBOezNq/leXjMtip3Napkd7Qzvq1WaFQrFNfdUAkmnP
         CH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzOTgWpscrqwSvLTIKg5fluqrbi5fP2D6zkqJ15zwGg=;
        b=ZgaoIurUKdxhnYkeF2qDl9DKWddM8EKGEO0lZ0aLMYptk6xpiYyOa/6Sa+0FIfRiCA
         8UwcJqhAkjixLfv7gjQBdSnAMeTY9EfSv51TJo4oBTLj4QidqyDzU7yoN4mlOTb5Rc6E
         ho9cGtkegrvwjinbofcY0SYESHq/7pN+qvS2CUqPn64W1OmUgaxxwxhIYVZypWdArc/C
         R0dENxgma3pTwK9XHqhgFUOMsT0kx4vUILJQSzjPHCB1e02vhJj5VFSHi5z1rNtyPv+U
         vJjeL5Cit2EdT7Hk4x01Dd2DZ9C+S3pmA4cWDkv3nmihOFw7Gox63JmHCZvcjEixkzAI
         7bMw==
X-Gm-Message-State: AO0yUKXBLtERZZXwkm9T6849+o4DwFUseZclETxNzO2nfh0hzuDLgXIp
	+RWC5ocHj20estrh/SsVvqbNwZ/CpU7oCT/GM8U=
X-Google-Smtp-Source: AK7set/l34zirt3mFeS1A+Cdl5xpL4JGl+33WK49vfGMuK9TYo0xzsQQFTuuw52YU8/4Al9/IHwZfg==
X-Received: by 2002:a62:7b07:0:b0:577:272f:fdb with SMTP id w7-20020a627b07000000b00577272f0fdbmr3279566pfc.29.1676990498138;
        Tue, 21 Feb 2023 06:41:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/23] qemu: fix compile error
Date: Tue, 21 Feb 2023 04:40:56 -1000
Message-Id: <b3f42317c1932253e7e6b2fd7a263bdbd6c2f69a.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177513

From: Kai Kang <kai.kang@windriver.com>

Backport 2 patches and rebase
0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch to fix
compile error:

../qemu-6.2.0/hw/display/qxl.c: In function 'qxl_phys2virt':
../qemu-6.2.0/hw/display/qxl.c:1477:67: error: 'size' undeclared (first use in this function); did you mean 'gsize'?
 1477 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size)) {
      |                                                                   ^~~~
      |                                                                   gsize
../qemu-6.2.0/hw/display/qxl.c:1477:67: note: each undeclared identifier is reported only once for each function it appears in

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 ...ave-qxl_log_command-Return-early-if-.patch |  57 +++++
 ...ass-requested-buffer-size-to-qxl_phy.patch | 217 ++++++++++++++++++
 3 files changed, 276 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_command-Return-early-if-.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b68be447f1..5430718f75 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -93,6 +93,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0021-target-ppc-implement-xs-n-maddqp-o-xs-n-msubqp-o.patch \
            file://CVE-2022-3165.patch \
            file://CVE-2022-4144.patch \
+           file://0001-hw-display-qxl-Have-qxl_log_command-Return-early-if-.patch \
+           file://0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_command-Return-early-if-.patch b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_command-Return-early-if-.patch
new file mode 100644
index 0000000000..cd846222c9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_command-Return-early-if-.patch
@@ -0,0 +1,57 @@
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/61c34fc]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 61c34fc194b776ecadc39fb26b061331107e5599 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
+Date: Mon, 28 Nov 2022 21:27:37 +0100
+Subject: [PATCH] hw/display/qxl: Have qxl_log_command Return early if no
+ log_cmd handler
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Only 3 command types are logged: no need to call qxl_phys2virt()
+for the other types. Using different cases will help to pass
+different structure sizes to qxl_phys2virt() in a pair of commits.
+
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
+Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
+Message-Id: <20221128202741.4945-2-philmd@linaro.org>
+---
+ hw/display/qxl-logger.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
+index 68bfa47568..1bcf803db6 100644
+--- a/hw/display/qxl-logger.c
++++ b/hw/display/qxl-logger.c
+@@ -247,6 +247,16 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ring, QXLCommandExt *ext)
+             qxl_name(qxl_type, ext->cmd.type),
+             compat ? "(compat)" : "");
+ 
++    switch (ext->cmd.type) {
++    case QXL_CMD_DRAW:
++        break;
++    case QXL_CMD_SURFACE:
++        break;
++    case QXL_CMD_CURSOR:
++        break;
++    default:
++        goto out;
++    }
+     data = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
+     if (!data) {
+         return 1;
+@@ -269,6 +279,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ring, QXLCommandExt *ext)
+         qxl_log_cmd_cursor(qxl, data, ext->group_id);
+         break;
+     }
++out:
+     fprintf(stderr, "\n");
+     return 0;
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch
new file mode 100644
index 0000000000..ac51cf567a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch
@@ -0,0 +1,217 @@
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/8efec0e]
+
+Backport and rebase patch to fix compile error which imported by CVE-2022-4144.patch:
+
+../qemu-6.2.0/hw/display/qxl.c: In function 'qxl_phys2virt':
+../qemu-6.2.0/hw/display/qxl.c:1477:67: error: 'size' undeclared (first use in this function); did you mean 'gsize'?
+	1477 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size)) {
+		|                                                                   ^~~~
+		|                                                                   gsize
+../qemu-6.2.0/hw/display/qxl.c:1477:67: note: each undeclared identifier is reported only once for each function it appears in
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 8efec0ef8bbc1e75a7ebf6e325a35806ece9b39f Mon Sep 17 00:00:00 2001
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
+---
+ hw/display/qxl-logger.c | 11 ++++++++---
+ hw/display/qxl-render.c | 20 ++++++++++++++++----
+ hw/display/qxl.c        | 14 +++++++++-----
+ hw/display/qxl.h        |  3 ++-
+ 4 files changed, 35 insertions(+), 13 deletions(-)
+
+diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
+index 1bcf803..35c38f6 100644
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
+@@ -214,7 +214,8 @@ int qxl_log_cmd_cursor(PCIQXLDevice *qxl, QXLCursorCmd *cmd, int group_id)
+                 cmd->u.set.position.y,
+                 cmd->u.set.visible ? "yes" : "no",
+                 cmd->u.set.shape);
+-        cursor = qxl_phys2virt(qxl, cmd->u.set.shape, group_id);
++        cursor = qxl_phys2virt(qxl, cmd->u.set.shape, group_id,
++                               sizeof(QXLCursor));
+         if (!cursor) {
+             return 1;
+         }
+@@ -236,6 +237,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ring, QXLCommandExt *ext)
+ {
+     bool compat = ext->flags & QXL_COMMAND_FLAG_COMPAT;
+     void *data;
++    size_t datasz;
+     int ret;
+ 
+     if (!qxl->cmdlog) {
+@@ -249,15 +251,18 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ring, QXLCommandExt *ext)
+ 
+     switch (ext->cmd.type) {
+     case QXL_CMD_DRAW:
++        datasz = compat ? sizeof(QXLCompatDrawable) : sizeof(QXLDrawable);
+         break;
+     case QXL_CMD_SURFACE:
++        datasz = sizeof(QXLSurfaceCmd);
+         break;
+     case QXL_CMD_CURSOR:
++        datasz = sizeof(QXLCursorCmd);
+         break;
+     default:
+         goto out;
+     }
+-    data = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
++    data = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id, datasz);
+     if (!data) {
+         return 1;
+     }
+diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
+index ca21700..fcfd40c 100644
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
+             goto end;
+         }
+@@ -228,7 +230,8 @@ static void qxl_unpack_chunks(void *dest, size_t size, PCIQXLDevice *qxl,
+         if (offset == size) {
+             return;
+         }
+-        chunk = qxl_phys2virt(qxl, chunk->next_chunk, group_id);
++        chunk = qxl_phys2virt(qxl, chunk->next_chunk, group_id,
++                              sizeof(QXLDataChunk) + chunk->data_size);
+         if (!chunk) {
+             return;
+         }
+@@ -295,7 +298,8 @@ fail:
+ /* called from spice server thread context only */
+ int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)
+ {
+-    QXLCursorCmd *cmd = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
++    QXLCursorCmd *cmd = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id,
++                                      sizeof(QXLCursorCmd));
+     QXLCursor *cursor;
+     QEMUCursor *c;
+ 
+@@ -314,7 +318,15 @@ int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)
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
+index ae8aa07..2a4b2d4 100644
+--- a/hw/display/qxl.c
++++ b/hw/display/qxl.c
+@@ -274,7 +274,8 @@ static void qxl_spice_monitors_config_async(PCIQXLDevice *qxl, int replay)
+                                           QXL_IO_MONITORS_CONFIG_ASYNC));
+     }
+ 
+-    cfg = qxl_phys2virt(qxl, qxl->guest_monitors_config, MEMSLOT_GROUP_GUEST);
++    cfg = qxl_phys2virt(qxl, qxl->guest_monitors_config, MEMSLOT_GROUP_GUEST,
++                        sizeof(QXLMonitorsConfig));
+     if (cfg != NULL && cfg->count == 1) {
+         qxl->guest_primary.resized = 1;
+         qxl->guest_head0_width  = cfg->heads[0].width;
+@@ -459,7 +460,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, struct QXLCommandExt *ext)
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
+@@ -1463,7 +1466,8 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
+ }
+ 
+ /* can be also called from spice server thread context */
+-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id)
++void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,
++                    size_t size)
+ {
+     uint64_t offset;
+     uint32_t slot;
+@@ -1971,7 +1975,7 @@ static void qxl_dirty_surfaces(PCIQXLDevice *qxl)
+         }
+ 
+         cmd = qxl_phys2virt(qxl, qxl->guest_surfaces.cmds[i],
+-                            MEMSLOT_GROUP_GUEST);
++                            MEMSLOT_GROUP_GUEST, sizeof(QXLSurfaceCmd));
+         assert(cmd);
+         assert(cmd->type == QXL_SURFACE_CMD_CREATE);
+         qxl_dirty_one_surface(qxl, cmd->u.surface_create.data,
+diff --git a/hw/display/qxl.h b/hw/display/qxl.h
+index 30d21f4..4551c23 100644
+--- a/hw/display/qxl.h
++++ b/hw/display/qxl.h
+@@ -147,7 +147,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
+ #define QXL_DEFAULT_REVISION (QXL_REVISION_STABLE_V12 + 1)
+ 
+ /* qxl.c */
+-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id);
++void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id,
++                    size_t size);
+ void qxl_set_guest_bug(PCIQXLDevice *qxl, const char *msg, ...)
+     GCC_FMT_ATTR(2, 3);
+ 
+-- 
+2.34.1
+
-- 
2.34.1


