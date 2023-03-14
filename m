Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5227C6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 12:59:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8019.1678798760296780503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 05:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=fyoSJFER;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2437f95e4e=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32EB1MIB028573
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 12:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=PPS06212021;
 bh=OXtKQGi3EU3W5ftdEExL49qoM1U82SAQRVBfWEGi4DA=;
 b=fyoSJFERPCNNiN0aVEEpXxBZ+eTIcEuFSOT11k47CC/9U6DNLxv7nhWl9X1rv/aL4/xC
 zFhoO+Xuk/iat5neCSYnUlofljactZ/rvORKzMH6WFNA9CQ61rMmcOLaa4lehq4eM5w1
 a/jigLHdUdpQIgavLgPsKPP9KDL5zOzzIqeDIw3Kk3wg2rttWnH/dyQweBAF+EPv6Thx
 BYrvPrF1VTS9hnj4Md1qPCGiyI/B1mz9NuAtyvz0yizXaT5VnjLgPaTNF8JE8+tD8VOZ
 OWAE+SDAfoAqxJEzmMIr6iMXNysqoIk6qhBydFaWz5/khzZEfprhh7qdqw6uzKKd5S9v tA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p8gma2u6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 12:59:19 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32ECxJD5014778
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 12:59:19 GMT
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p8gma2u6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 14 Mar 2023 12:59:19 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Tue, 14 Mar 2023 05:59:17 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 14 Mar 2023 05:59:17 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>
Subject: [dunfell][PATCH 2/2] qemu: fix compile error
Date: Tue, 14 Mar 2023 20:59:12 +0800
Message-ID: <20230314125912.7014-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230314125912.7014-1-kai.kang@windriver.com>
References: <20230314125912.7014-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: gQ_QKk-5Jthxf1ac-7o7jAHH7aHSu5ks
X-Proofpoint-ORIG-GUID: BVeVJ75j-GeGor8Ti8pZbn6kOiMK99py
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_06,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303140111
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32EB1MIB028573
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 12:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178487

From: Kai Kang <kai.kang@windriver.com>

Backport 2 patches and rebase
0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch to fix
compile error:

../qemu-6.2.0/hw/display/qxl.c: In function 'qxl_phys2virt':
../qemu-6.2.0/hw/display/qxl.c:1477:67: error: 'size' undeclared (first u=
se in this function); did you mean 'gsize'?
 1477 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset,=
 size)) {
      |                                                                  =
 ^~~~
      |                                                                  =
 gsize
../qemu-6.2.0/hw/display/qxl.c:1477:67: note: each undeclared identifier =
is reported only once for each function it appears in

(From OE-Core rev: b3f42317c1932253e7e6b2fd7a263bdbd6c2f69a)

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 ...ave-qxl_log_command-Return-early-if-.patch |  57 +++++
 ...ass-requested-buffer-size-to-qxl_phy.patch | 217 ++++++++++++++++++
 3 files changed, 276 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-H=
ave-qxl_log_command-Return-early-if-.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-P=
ass-requested-buffer-size-to-qxl_phy.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 0649727338..b2b04c4536 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -117,6 +117,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
            file://CVE-2021-3507.patch \
            file://CVE-2021-3929.patch \
            file://CVE-2022-4144.patch \
+           file://0001-hw-display-qxl-Have-qxl_log_command-Return-early-=
if-.patch \
+           file://0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_=
phy.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl=
_log_command-Return-early-if-.patch b/meta/recipes-devtools/qemu/qemu/000=
1-hw-display-qxl-Have-qxl_log_command-Return-early-if-.patch
new file mode 100644
index 0000000000..cd846222c9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_co=
mmand-Return-early-if-.patch
@@ -0,0 +1,57 @@
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/61c34fc]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 61c34fc194b776ecadc39fb26b061331107e5599 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@linaro=
.org>
+Date: Mon, 28 Nov 2022 21:27:37 +0100
+Subject: [PATCH] hw/display/qxl: Have qxl_log_command Return early if no
+ log_cmd handler
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Only 3 command types are logged: no need to call qxl_phys2virt()
+for the other types. Using different cases will help to pass
+different structure sizes to qxl_phys2virt() in a pair of commits.
+
+Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
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
+@@ -247,6 +247,16 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *=
ring, QXLCommandExt *ext)
+             qxl_name(qxl_type, ext->cmd.type),
+             compat ? "(compat)" : "");
+=20
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
+     data =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
+     if (!data) {
+         return 1;
+@@ -269,6 +279,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *r=
ing, QXLCommandExt *ext)
+         qxl_log_cmd_cursor(qxl, data, ext->group_id);
+         break;
+     }
++out:
+     fprintf(stderr, "\n");
+     return 0;
+ }
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-req=
uested-buffer-size-to-qxl_phy.patch b/meta/recipes-devtools/qemu/qemu/000=
1-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch
new file mode 100644
index 0000000000..ac51cf567a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requested-=
buffer-size-to-qxl_phy.patch
@@ -0,0 +1,217 @@
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/8efec0e]
+
+Backport and rebase patch to fix compile error which imported by CVE-202=
2-4144.patch:
+
+../qemu-6.2.0/hw/display/qxl.c: In function 'qxl_phys2virt':
+../qemu-6.2.0/hw/display/qxl.c:1477:67: error: 'size' undeclared (first =
use in this function); did you mean 'gsize'?
+	1477 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset=
, size)) {
+		|                                                                   ^~=
~~
+		|                                                                   gs=
ize
+../qemu-6.2.0/hw/display/qxl.c:1477:67: note: each undeclared identifier=
 is reported only once for each function it appears in
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 8efec0ef8bbc1e75a7ebf6e325a35806ece9b39f Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@linaro=
.org>
+Date: Mon, 28 Nov 2022 21:27:39 +0100
+Subject: [PATCH] hw/display/qxl: Pass requested buffer size to qxl_phys2=
virt()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
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
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
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
+@@ -106,7 +106,7 @@ static int qxl_log_image(PCIQXLDevice *qxl, QXLPHYSI=
CAL addr, int group_id)
+     QXLImage *image;
+     QXLImageDescriptor *desc;
+=20
+-    image =3D qxl_phys2virt(qxl, addr, group_id);
++    image =3D qxl_phys2virt(qxl, addr, group_id, sizeof(QXLImage));
+     if (!image) {
+         return 1;
+     }
+@@ -214,7 +214,8 @@ int qxl_log_cmd_cursor(PCIQXLDevice *qxl, QXLCursorC=
md *cmd, int group_id)
+                 cmd->u.set.position.y,
+                 cmd->u.set.visible ? "yes" : "no",
+                 cmd->u.set.shape);
+-        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, group_id);
++        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, group_id,
++                               sizeof(QXLCursor));
+         if (!cursor) {
+             return 1;
+         }
+@@ -236,6 +237,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *r=
ing, QXLCommandExt *ext)
+ {
+     bool compat =3D ext->flags & QXL_COMMAND_FLAG_COMPAT;
+     void *data;
++    size_t datasz;
+     int ret;
+=20
+     if (!qxl->cmdlog) {
+@@ -249,15 +251,18 @@ int qxl_log_command(PCIQXLDevice *qxl, const char =
*ring, QXLCommandExt *ext)
+=20
+     switch (ext->cmd.type) {
+     case QXL_CMD_DRAW:
++        datasz =3D compat ? sizeof(QXLCompatDrawable) : sizeof(QXLDrawa=
ble);
+         break;
+     case QXL_CMD_SURFACE:
++        datasz =3D sizeof(QXLSurfaceCmd);
+         break;
+     case QXL_CMD_CURSOR:
++        datasz =3D sizeof(QXLCursorCmd);
+         break;
+     default:
+         goto out;
+     }
+-    data =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
++    data =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_id, datasz);
+     if (!data) {
+         return 1;
+     }
+diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
+index ca21700..fcfd40c 100644
+--- a/hw/display/qxl-render.c
++++ b/hw/display/qxl-render.c
+@@ -107,7 +107,9 @@ static void qxl_render_update_area_unlocked(PCIQXLDe=
vice *qxl)
+         qxl->guest_primary.resized =3D 0;
+         qxl->guest_primary.data =3D qxl_phys2virt(qxl,
+                                                 qxl->guest_primary.surf=
ace.mem,
+-                                                MEMSLOT_GROUP_GUEST);
++                                                MEMSLOT_GROUP_GUEST,
++                                                qxl->guest_primary.abs_=
stride
++                                                * height);
+         if (!qxl->guest_primary.data) {
+             goto end;
+         }
+@@ -228,7 +230,8 @@ static void qxl_unpack_chunks(void *dest, size_t siz=
e, PCIQXLDevice *qxl,
+         if (offset =3D=3D size) {
+             return;
+         }
+-        chunk =3D qxl_phys2virt(qxl, chunk->next_chunk, group_id);
++        chunk =3D qxl_phys2virt(qxl, chunk->next_chunk, group_id,
++                              sizeof(QXLDataChunk) + chunk->data_size);
+         if (!chunk) {
+             return;
+         }
+@@ -295,7 +298,8 @@ fail:
+ /* called from spice server thread context only */
+ int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)
+ {
+-    QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_=
id);
++    QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_=
id,
++                                      sizeof(QXLCursorCmd));
+     QXLCursor *cursor;
+     QEMUCursor *c;
+=20
+@@ -314,7 +318,15 @@ int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommand=
Ext *ext)
+     }
+     switch (cmd->type) {
+     case QXL_CURSOR_SET:
+-        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id);
++        /* First read the QXLCursor to get QXLDataChunk::data_size ... =
*/
++        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id,
++                               sizeof(QXLCursor));
++        if (!cursor) {
++            return 1;
++        }
++        /* Then read including the chunked data following QXLCursor. */
++        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id,
++                               sizeof(QXLCursor) + cursor->chunk.data_s=
ize);
+         if (!cursor) {
+             return 1;
+         }
+diff --git a/hw/display/qxl.c b/hw/display/qxl.c
+index ae8aa07..2a4b2d4 100644
+--- a/hw/display/qxl.c
++++ b/hw/display/qxl.c
+@@ -274,7 +274,8 @@ static void qxl_spice_monitors_config_async(PCIQXLDe=
vice *qxl, int replay)
+                                           QXL_IO_MONITORS_CONFIG_ASYNC)=
);
+     }
+=20
+-    cfg =3D qxl_phys2virt(qxl, qxl->guest_monitors_config, MEMSLOT_GROU=
P_GUEST);
++    cfg =3D qxl_phys2virt(qxl, qxl->guest_monitors_config, MEMSLOT_GROU=
P_GUEST,
++                        sizeof(QXLMonitorsConfig));
+     if (cfg !=3D NULL && cfg->count =3D=3D 1) {
+         qxl->guest_primary.resized =3D 1;
+         qxl->guest_head0_width  =3D cfg->heads[0].width;
+@@ -459,7 +460,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, stru=
ct QXLCommandExt *ext)
+     switch (le32_to_cpu(ext->cmd.type)) {
+     case QXL_CMD_SURFACE:
+     {
+-        QXLSurfaceCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->g=
roup_id);
++        QXLSurfaceCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->g=
roup_id,
++                                           sizeof(QXLSurfaceCmd));
+=20
+         if (!cmd) {
+             return 1;
+@@ -494,7 +496,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, stru=
ct QXLCommandExt *ext)
+     }
+     case QXL_CMD_CURSOR:
+     {
+-        QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->gr=
oup_id);
++        QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->gr=
oup_id,
++                                          sizeof(QXLCursorCmd));
+=20
+         if (!cmd) {
+             return 1;
+@@ -1463,7 +1466,8 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice=
 *qxl, QXLPHYSICAL pqxl,
+ }
+=20
+ /* can be also called from spice server thread context */
+-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id)
++void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,
++                    size_t size)
+ {
+     uint64_t offset;
+     uint32_t slot;
+@@ -1971,7 +1975,7 @@ static void qxl_dirty_surfaces(PCIQXLDevice *qxl)
+         }
+=20
+         cmd =3D qxl_phys2virt(qxl, qxl->guest_surfaces.cmds[i],
+-                            MEMSLOT_GROUP_GUEST);
++                            MEMSLOT_GROUP_GUEST, sizeof(QXLSurfaceCmd))=
;
+         assert(cmd);
+         assert(cmd->type =3D=3D QXL_SURFACE_CMD_CREATE);
+         qxl_dirty_one_surface(qxl, cmd->u.surface_create.data,
+diff --git a/hw/display/qxl.h b/hw/display/qxl.h
+index 30d21f4..4551c23 100644
+--- a/hw/display/qxl.h
++++ b/hw/display/qxl.h
+@@ -147,7 +147,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
+ #define QXL_DEFAULT_REVISION (QXL_REVISION_STABLE_V12 + 1)
+=20
+ /* qxl.c */
+-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id);
++void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id,
++                    size_t size);
+ void qxl_set_guest_bug(PCIQXLDevice *qxl, const char *msg, ...)
+     GCC_FMT_ATTR(2, 3);
+=20
+--=20
+2.34.1
+
--=20
2.17.1


