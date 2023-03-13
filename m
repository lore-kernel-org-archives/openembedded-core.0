Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12B2C6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 15:44:15 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.23110.1678722245918136628
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 08:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=uPTRU1Vp;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.51, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f51.google.com with SMTP id x3so50423800edb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 08:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678722244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLRFBvVSM/zXWosjkA+CeUfAZeF7h9lyZ0rNmY4/u2I=;
        b=uPTRU1VpcBoqZvv5Edwc/RIt8R4Tt1ZP60uA9pDqOBQqjRhzBrpyWPtrDfM5tlWFj3
         yrMp1QIQs5TCaMfdHma4vkfA3+rCVjPV56X5vWqW4ASxK1QBs3/aMqPOssQhYy37+09N
         59vhFCiqmm8rbcvcSmqpBsvsx2GHK8Agn1QynIH2MzcBq8mLd+1pLM/vWcMaGFoAvk8p
         C1tHq/j6TgrCS5UgGwNR/Bq3FZ/JauSCQpk3PMs2o9yTLW0fQXpY1+jJEyU7pFt3YrNg
         P73eaw2iXJJXknKH58NkQVZBiltCCnu2ruowqKLvWmiGv1XXD/HKsYoGZVKEgY3zVUg/
         e6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678722244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLRFBvVSM/zXWosjkA+CeUfAZeF7h9lyZ0rNmY4/u2I=;
        b=jVG77tj+yRty+oYrdcU5ckSHFqSjCJsY2dWy8xcnLN6B5kkI8yDfCbSKNBOp+hoM5i
         YGTY7N3eKFGL/D4j4S4pfCI2f08uyWuf4fd7TDaAuW989yhc+pHNcxjl6lcc8Q6xlAdY
         lnRtYG4ficEWzGOLvnpD8xEWZuQkEu0nvaIfJgzFSa/g0TsZIYnyTMZUNKzv1T31E1eX
         J43fH3NZZKkiNdK5hPKF15uPeeMimKekfW+M3dMYme/BV+MvBCw0h5+5cvzSWauOrmH7
         qWux6bsepPbhcCKks1RwA4eVCEYqsRfG/DGqNCV1TyXW50k6bJt/kmfgLWaDs9r/27Bs
         c6MA==
X-Gm-Message-State: AO0yUKWMbK9drmW/cML6IDmQ7JBXvbAs+VZCDi9ncDgiXaOPSY4IsA0j
	xcbsIkgSbWyJQgl8SoTPLN3wtuUBU3obv4RYRm5BC1+RNpFCmeZj
X-Google-Smtp-Source: AK7set8VX/AgtDCqUAFWObe5BenSYvzM4shLrXdmoC3E5ff6ZfgzwOt7+A+93etpNskJ8GTE7ARK6vZFhZwW/HI9LoI=
X-Received: by 2002:a17:907:9618:b0:91f:79d3:d3e2 with SMTP id
 gb24-20020a170907961800b0091f79d3d3e2mr3945855ejc.3.1678722244093; Mon, 13
 Mar 2023 08:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230214142235.38975-1-kai.kang@windriver.com>
 <CA+chaQe7v3SCti7VASE80CcsPaObRk+FXckC5NcVYsrSh5cfCQ@mail.gmail.com> <ab763cf8-1627-84c7-f533-738295f13914@windriver.com>
In-Reply-To: <ab763cf8-1627-84c7-f533-738295f13914@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 13 Mar 2023 05:43:53 -1000
Message-ID: <CAOSpxda_TCH5eCBB6p1VhjgpAr1Z0a6yf=gT0b1A2hNM+M2sJA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] qemu: fix compile error
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 15:44:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178454

On Tue, Feb 14, 2023 at 4:22=E2=80=AFPM Kai Kang <kai.kang@eng.windriver.co=
m> wrote:
>
> On 2/14/23 22:30, Martin Jansa wrote:
>
> Thanks Kai,
>
> this should fix what I've reported in:
> https://lists.openembedded.org/g/openembedded-core/message/176508
>
> once this is merged, can you please add both oe-core changes (3 qemu patc=
hes) to dunfell as well, so that similar patch is included in both branches=
? The broken version wasn't merged to dunfell after my report.
>
> You mean CVE-2022-4144.patch and this commit, right? OK, will do.

Hi Kai,

Do you still plan to submit the above referenced patches for dunfell?

Thanks,

Steve


> Regards,
>
> On Tue, Feb 14, 2023 at 3:22 PM Kai Kang <kai.kang@eng.windriver.com> wro=
te:
>>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Backport 2 patches and rebase
>> 0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch to fix
>> compile error:
>>
>> ../qemu-6.2.0/hw/display/qxl.c: In function 'qxl_phys2virt':
>> ../qemu-6.2.0/hw/display/qxl.c:1477:67: error: 'size' undeclared (first =
use in this function); did you mean 'gsize'?
>>  1477 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset=
, size)) {
>>       |                                                                 =
  ^~~~
>>       |                                                                 =
  gsize
>> ../qemu-6.2.0/hw/display/qxl.c:1477:67: note: each undeclared identifier=
 is reported only once for each function it appears in
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>  meta/recipes-devtools/qemu/qemu.inc           |   2 +
>>  ...ave-qxl_log_command-Return-early-if-.patch |  57 +++++
>>  ...ass-requested-buffer-size-to-qxl_phy.patch | 217 ++++++++++++++++++
>>  3 files changed, 276 insertions(+)
>>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-=
Have-qxl_log_command-Return-early-if-.patch
>>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-=
Pass-requested-buffer-size-to-qxl_phy.patch
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools=
/qemu/qemu.inc
>> index b68be447f1..5430718f75 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -93,6 +93,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.ta=
r.xz \
>>             file://0021-target-ppc-implement-xs-n-maddqp-o-xs-n-msubqp-o=
.patch \
>>             file://CVE-2022-3165.patch \
>>             file://CVE-2022-4144.patch \
>> +           file://0001-hw-display-qxl-Have-qxl_log_command-Return-early=
-if-.patch \
>> +           file://0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl=
_phy.patch \
>>             "
>>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qx=
l_log_command-Return-early-if-.patch b/meta/recipes-devtools/qemu/qemu/0001=
-hw-display-qxl-Have-qxl_log_command-Return-early-if-.patch
>> new file mode 100644
>> index 0000000000..cd846222c9
>> --- /dev/null
>> +++ b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_c=
ommand-Return-early-if-.patch
>> @@ -0,0 +1,57 @@
>> +Upstream-Status: Backport [https://github.com/qemu/qemu/commit/61c34fc]
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +
>> +From 61c34fc194b776ecadc39fb26b061331107e5599 Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@linar=
o.org>
>> +Date: Mon, 28 Nov 2022 21:27:37 +0100
>> +Subject: [PATCH] hw/display/qxl: Have qxl_log_command Return early if n=
o
>> + log_cmd handler
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Only 3 command types are logged: no need to call qxl_phys2virt()
>> +for the other types. Using different cases will help to pass
>> +different structure sizes to qxl_phys2virt() in a pair of commits.
>> +
>> +Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> +Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> +Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> +Message-Id: <20221128202741.4945-2-philmd@linaro.org>
>> +---
>> + hw/display/qxl-logger.c | 11 +++++++++++
>> + 1 file changed, 11 insertions(+)
>> +
>> +diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
>> +index 68bfa47568..1bcf803db6 100644
>> +--- a/hw/display/qxl-logger.c
>> ++++ b/hw/display/qxl-logger.c
>> +@@ -247,6 +247,16 @@ int qxl_log_command(PCIQXLDevice *qxl, const char =
*ring, QXLCommandExt *ext)
>> +             qxl_name(qxl_type, ext->cmd.type),
>> +             compat ? "(compat)" : "");
>> +
>> ++    switch (ext->cmd.type) {
>> ++    case QXL_CMD_DRAW:
>> ++        break;
>> ++    case QXL_CMD_SURFACE:
>> ++        break;
>> ++    case QXL_CMD_CURSOR:
>> ++        break;
>> ++    default:
>> ++        goto out;
>> ++    }
>> +     data =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
>> +     if (!data) {
>> +         return 1;
>> +@@ -269,6 +279,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *=
ring, QXLCommandExt *ext)
>> +         qxl_log_cmd_cursor(qxl, data, ext->group_id);
>> +         break;
>> +     }
>> ++out:
>> +     fprintf(stderr, "\n");
>> +     return 0;
>> + }
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-re=
quested-buffer-size-to-qxl_phy.patch b/meta/recipes-devtools/qemu/qemu/0001=
-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch
>> new file mode 100644
>> index 0000000000..ac51cf567a
>> --- /dev/null
>> +++ b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requested=
-buffer-size-to-qxl_phy.patch
>> @@ -0,0 +1,217 @@
>> +Upstream-Status: Backport [https://github.com/qemu/qemu/commit/8efec0e]
>> +
>> +Backport and rebase patch to fix compile error which imported by CVE-20=
22-4144.patch:
>> +
>> +../qemu-6.2.0/hw/display/qxl.c: In function 'qxl_phys2virt':
>> +../qemu-6.2.0/hw/display/qxl.c:1477:67: error: 'size' undeclared (first=
 use in this function); did you mean 'gsize'?
>> +       1477 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, =
&offset, size)) {
>> +               |                                                       =
            ^~~~
>> +               |                                                       =
            gsize
>> +../qemu-6.2.0/hw/display/qxl.c:1477:67: note: each undeclared identifie=
r is reported only once for each function it appears in
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +
>> +From 8efec0ef8bbc1e75a7ebf6e325a35806ece9b39f Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@linar=
o.org>
>> +Date: Mon, 28 Nov 2022 21:27:39 +0100
>> +Subject: [PATCH] hw/display/qxl: Pass requested buffer size to qxl_phys=
2virt()
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Currently qxl_phys2virt() doesn't check for buffer overrun.
>> +In order to do so in the next commit, pass the buffer size
>> +as argument.
>> +
>> +For QXLCursor in qxl_render_cursor() -> qxl_cursor() we
>> +verify the size of the chunked data ahead, checking we can
>> +access 'sizeof(QXLCursor) + chunk->data_size' bytes.
>> +Since in the SPICE_CURSOR_TYPE_MONO case the cursor is
>> +assumed to fit in one chunk, no change are required.
>> +In SPICE_CURSOR_TYPE_ALPHA the ahead read is handled in
>> +qxl_unpack_chunks().
>> +
>> +Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> +Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>> +Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> +Message-Id: <20221128202741.4945-4-philmd@linaro.org>
>> +---
>> + hw/display/qxl-logger.c | 11 ++++++++---
>> + hw/display/qxl-render.c | 20 ++++++++++++++++----
>> + hw/display/qxl.c        | 14 +++++++++-----
>> + hw/display/qxl.h        |  3 ++-
>> + 4 files changed, 35 insertions(+), 13 deletions(-)
>> +
>> +diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
>> +index 1bcf803..35c38f6 100644
>> +--- a/hw/display/qxl-logger.c
>> ++++ b/hw/display/qxl-logger.c
>> +@@ -106,7 +106,7 @@ static int qxl_log_image(PCIQXLDevice *qxl, QXLPHYS=
ICAL addr, int group_id)
>> +     QXLImage *image;
>> +     QXLImageDescriptor *desc;
>> +
>> +-    image =3D qxl_phys2virt(qxl, addr, group_id);
>> ++    image =3D qxl_phys2virt(qxl, addr, group_id, sizeof(QXLImage));
>> +     if (!image) {
>> +         return 1;
>> +     }
>> +@@ -214,7 +214,8 @@ int qxl_log_cmd_cursor(PCIQXLDevice *qxl, QXLCursor=
Cmd *cmd, int group_id)
>> +                 cmd->u.set.position.y,
>> +                 cmd->u.set.visible ? "yes" : "no",
>> +                 cmd->u.set.shape);
>> +-        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, group_id);
>> ++        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, group_id,
>> ++                               sizeof(QXLCursor));
>> +         if (!cursor) {
>> +             return 1;
>> +         }
>> +@@ -236,6 +237,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *=
ring, QXLCommandExt *ext)
>> + {
>> +     bool compat =3D ext->flags & QXL_COMMAND_FLAG_COMPAT;
>> +     void *data;
>> ++    size_t datasz;
>> +     int ret;
>> +
>> +     if (!qxl->cmdlog) {
>> +@@ -249,15 +251,18 @@ int qxl_log_command(PCIQXLDevice *qxl, const char=
 *ring, QXLCommandExt *ext)
>> +
>> +     switch (ext->cmd.type) {
>> +     case QXL_CMD_DRAW:
>> ++        datasz =3D compat ? sizeof(QXLCompatDrawable) : sizeof(QXLDraw=
able);
>> +         break;
>> +     case QXL_CMD_SURFACE:
>> ++        datasz =3D sizeof(QXLSurfaceCmd);
>> +         break;
>> +     case QXL_CMD_CURSOR:
>> ++        datasz =3D sizeof(QXLCursorCmd);
>> +         break;
>> +     default:
>> +         goto out;
>> +     }
>> +-    data =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
>> ++    data =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_id, datasz);
>> +     if (!data) {
>> +         return 1;
>> +     }
>> +diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
>> +index ca21700..fcfd40c 100644
>> +--- a/hw/display/qxl-render.c
>> ++++ b/hw/display/qxl-render.c
>> +@@ -107,7 +107,9 @@ static void qxl_render_update_area_unlocked(PCIQXLD=
evice *qxl)
>> +         qxl->guest_primary.resized =3D 0;
>> +         qxl->guest_primary.data =3D qxl_phys2virt(qxl,
>> +                                                 qxl->guest_primary.sur=
face.mem,
>> +-                                                MEMSLOT_GROUP_GUEST);
>> ++                                                MEMSLOT_GROUP_GUEST,
>> ++                                                qxl->guest_primary.abs=
_stride
>> ++                                                * height);
>> +         if (!qxl->guest_primary.data) {
>> +             goto end;
>> +         }
>> +@@ -228,7 +230,8 @@ static void qxl_unpack_chunks(void *dest, size_t si=
ze, PCIQXLDevice *qxl,
>> +         if (offset =3D=3D size) {
>> +             return;
>> +         }
>> +-        chunk =3D qxl_phys2virt(qxl, chunk->next_chunk, group_id);
>> ++        chunk =3D qxl_phys2virt(qxl, chunk->next_chunk, group_id,
>> ++                              sizeof(QXLDataChunk) + chunk->data_size)=
;
>> +         if (!chunk) {
>> +             return;
>> +         }
>> +@@ -295,7 +298,8 @@ fail:
>> + /* called from spice server thread context only */
>> + int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)
>> + {
>> +-    QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group=
_id);
>> ++    QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group=
_id,
>> ++                                      sizeof(QXLCursorCmd));
>> +     QXLCursor *cursor;
>> +     QEMUCursor *c;
>> +
>> +@@ -314,7 +318,15 @@ int qxl_render_cursor(PCIQXLDevice *qxl, QXLComman=
dExt *ext)
>> +     }
>> +     switch (cmd->type) {
>> +     case QXL_CURSOR_SET:
>> +-        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id)=
;
>> ++        /* First read the QXLCursor to get QXLDataChunk::data_size ...=
 */
>> ++        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id,
>> ++                               sizeof(QXLCursor));
>> ++        if (!cursor) {
>> ++            return 1;
>> ++        }
>> ++        /* Then read including the chunked data following QXLCursor. *=
/
>> ++        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id,
>> ++                               sizeof(QXLCursor) + cursor->chunk.data_=
size);
>> +         if (!cursor) {
>> +             return 1;
>> +         }
>> +diff --git a/hw/display/qxl.c b/hw/display/qxl.c
>> +index ae8aa07..2a4b2d4 100644
>> +--- a/hw/display/qxl.c
>> ++++ b/hw/display/qxl.c
>> +@@ -274,7 +274,8 @@ static void qxl_spice_monitors_config_async(PCIQXLD=
evice *qxl, int replay)
>> +                                           QXL_IO_MONITORS_CONFIG_ASYNC=
));
>> +     }
>> +
>> +-    cfg =3D qxl_phys2virt(qxl, qxl->guest_monitors_config, MEMSLOT_GRO=
UP_GUEST);
>> ++    cfg =3D qxl_phys2virt(qxl, qxl->guest_monitors_config, MEMSLOT_GRO=
UP_GUEST,
>> ++                        sizeof(QXLMonitorsConfig));
>> +     if (cfg !=3D NULL && cfg->count =3D=3D 1) {
>> +         qxl->guest_primary.resized =3D 1;
>> +         qxl->guest_head0_width  =3D cfg->heads[0].width;
>> +@@ -459,7 +460,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, str=
uct QXLCommandExt *ext)
>> +     switch (le32_to_cpu(ext->cmd.type)) {
>> +     case QXL_CMD_SURFACE:
>> +     {
>> +-        QXLSurfaceCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->=
group_id);
>> ++        QXLSurfaceCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->=
group_id,
>> ++                                           sizeof(QXLSurfaceCmd));
>> +
>> +         if (!cmd) {
>> +             return 1;
>> +@@ -494,7 +496,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, str=
uct QXLCommandExt *ext)
>> +     }
>> +     case QXL_CMD_CURSOR:
>> +     {
>> +-        QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->g=
roup_id);
>> ++        QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->g=
roup_id,
>> ++                                          sizeof(QXLCursorCmd));
>> +
>> +         if (!cmd) {
>> +             return 1;
>> +@@ -1463,7 +1466,8 @@ static bool qxl_get_check_slot_offset(PCIQXLDevic=
e *qxl, QXLPHYSICAL pqxl,
>> + }
>> +
>> + /* can be also called from spice server thread context */
>> +-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id)
>> ++void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,
>> ++                    size_t size)
>> + {
>> +     uint64_t offset;
>> +     uint32_t slot;
>> +@@ -1971,7 +1975,7 @@ static void qxl_dirty_surfaces(PCIQXLDevice *qxl)
>> +         }
>> +
>> +         cmd =3D qxl_phys2virt(qxl, qxl->guest_surfaces.cmds[i],
>> +-                            MEMSLOT_GROUP_GUEST);
>> ++                            MEMSLOT_GROUP_GUEST, sizeof(QXLSurfaceCmd)=
);
>> +         assert(cmd);
>> +         assert(cmd->type =3D=3D QXL_SURFACE_CMD_CREATE);
>> +         qxl_dirty_one_surface(qxl, cmd->u.surface_create.data,
>> +diff --git a/hw/display/qxl.h b/hw/display/qxl.h
>> +index 30d21f4..4551c23 100644
>> +--- a/hw/display/qxl.h
>> ++++ b/hw/display/qxl.h
>> +@@ -147,7 +147,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
>> + #define QXL_DEFAULT_REVISION (QXL_REVISION_STABLE_V12 + 1)
>> +
>> + /* qxl.c */
>> +-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id)=
;
>> ++void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id,
>> ++                    size_t size);
>> + void qxl_set_guest_bug(PCIQXLDevice *qxl, const char *msg, ...)
>> +     GCC_FMT_ATTR(2, 3);
>> +
>> +--
>> +2.34.1
>> +
>> --
>> 2.17.1
>>
>>
>>
>>
>
> --
> Kai Kang
> Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177179): https://lists.openembedded.org/g/openembedde=
d-core/message/177179
> Mute This Topic: https://lists.openembedded.org/mt/96960641/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

