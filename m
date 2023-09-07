Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A1CEE14D6
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 08:50:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8556.1694076641175531632
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 01:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Gbs4AVry;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7614fa9128=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3876o2PM020087
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Sep 2023 08:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	PPS06212021; bh=HG/V8m3belmgeheRCRTtm5pa5LF6mYFkWrXx8eZkpG0=; b=
	Gbs4AVrygNvF9VqGjjWOLXw+cxJR6+6y/8buMMzh6tVJd9twUTnw4FXwrr2RnJdp
	weRNiEavUSivKQHOL0r7WgoPnqqJDA145kW2vUb94EKmwJMFB0Bq6Kfd5SFCNJDB
	na++ndv77FrxqsU/EE96MNNWol9MmDoUnTjpNYciMXeMcwphFMbLRqof1zvmRn0x
	96S4m3dgbZIhvR2P889xOMFwTMZ2yx9ry4251cmsbvIywxRi2U+IiDQmcR/5JqoB
	Dpuk9S4Po026cEzehERycOKOMKAxJnDl8xZBr8AiPWVUN/5Ug78IqgP/eDfdaUJU
	XXZN7Zhb/fAt6lDyKxjRNQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3suv15vd5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 08:50:39 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 7 Sep 2023 01:50:37 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [OE-core][kirkstone][PATCH 2/2] qemu: fix CVE-2021-3638
Date: Thu, 7 Sep 2023 08:50:16 +0000
Message-ID: <20230907085016.2818537-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230907085016.2818537-1-yogita.urade@windriver.com>
References: <20230907085016.2818537-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: Oowp5C3oTxXVmBVhfoyqVB-Kd7u3HR-v
X-Proofpoint-GUID: Oowp5C3oTxXVmBVhfoyqVB-Kd7u3HR-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_01,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309070076
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3876o2PM020087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 08:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187366

From: Yogita Urade <yogita.urade@windriver.com>

QEMU: ati-vga: inconsistent check in ati_2d_blt() may lead to
out-of-bounds write.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2021-3638
https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg01682.html

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3638.patch             | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3638.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 15c7465308..cadca6f687 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -101,6 +101,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
 	   file://CVE-2020-14394.patch \
 	   file://CVE-2023-3354.patch \
 	   file://CVE-2023-3180.patch \
+	   file://CVE-2021-3638.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3638.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3638.patch
new file mode 100644
index 0000000000..3cbb34c54c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3638.patch
@@ -0,0 +1,88 @@
+From 205ccfd7a5ec86bd9a5678b8bd157562fc9a1643 Mon Sep 17 00:00:00 2001
+From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Date: Thu, 10 Aug 2023 07:30:54 +0000
+Subject: [PATCH] hw/display/ati_2d: Fix buffer overflow in ati_2d_blt
+ (CVE-2021-3638) MIME-Version: 1.0 Content-Type: text/plain; charset=3DU=
TF-8
+ Content-Transfer-Encoding: 8bit
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+When building QEMU with DEBUG_ATI defined then running with
+'-device ati-vga,romfile=3D"" -d unimp,guest_errors -trace ati\*'
+we get:
+
+  ati_mm_write 4 0x16c0 DP_CNTL <- 0x1
+  ati_mm_write 4 0x146c DP_GUI_MASTER_CNTL <- 0x2
+  ati_mm_write 4 0x16c8 DP_MIX <- 0xff0000
+  ati_mm_write 4 0x16c4 DP_DATATYPE <- 0x2
+  ati_mm_write 4 0x224 CRTC_OFFSET <- 0x0
+  ati_mm_write 4 0x142c DST_PITCH_OFFSET <- 0xfe00000
+  ati_mm_write 4 0x1420 DST_Y <- 0x3fff
+  ati_mm_write 4 0x1410 DST_HEIGHT <- 0x3fff
+  ati_mm_write 4 0x1588 DST_WIDTH_X <- 0x3fff3fff
+  ati_2d_blt: vram:0x7fff5fa00000 addr:0 ds:0x7fff61273800 stride:2560 b=
pp:32 rop:0xff
+  ati_2d_blt: 0 0 0, 0 127 0, (0,0) -> (16383,16383) 16383x16383 > ^
+  ati_2d_blt: pixman_fill(dst:0x7fff5fa00000, stride:254, bpp:8, x:16383=
, y:16383, w:16383, h:16383, xor:0xff000000)
+  Thread 3 "qemu-system-i38" received signal SIGSEGV, Segmentation fault.
+  (gdb) bt
+  #0  0x00007ffff7f62ce0 in sse2_fill.lto_priv () at /lib64/libpixman-1.=
so.0
+  #1  0x00007ffff7f09278 in pixman_fill () at /lib64/libpixman-1.so.0
+  #2  0x0000555557b5a9af in ati_2d_blt (s=3D0x631000028800) at hw/displa=
y/ati_2d.c:196
+  #3  0x0000555557b4b5a2 in ati_mm_write (opaque=3D0x631000028800, addr=3D=
5512, data=3D1073692671, size=3D4) at hw/display/ati.c:843
+  #4  0x0000555558b90ec4 in memory_region_write_accessor (mr=3D0x6310000=
39cc0, addr=3D5512, ..., size=3D4, ...) at softmmu/memory.c:492
+
+Commit 584acf34cb0 ("ati-vga: Fix reverse bit blts") introduced
+the local dst_x and dst_y which adjust the (x, y) coordinates
+depending on the direction in the SRCCOPY ROP3 operation, but
+forgot to address the same issue for the PATCOPY, BLACKNESS and
+WHITENESS operations, which also call pixman_fill().
+
+Fix that now by using the adjusted coordinates in the pixman_fill
+call, and update the related debug printf().
+
+Reported-by: Qiang Liu <qiangliu@zju.edu.cn>
+Fixes: 584acf34cb0 ("ati-vga: Fix reverse bit blts")
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Tested-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Message-Id: <20210906153103.1661195-1-philmd@redhat.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+CVE: CVE-2021-3638
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/205ccfd7a=
5ec86bd9a5678b8bd157562fc9a1643]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ hw/display/ati_2d.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
+index 4dc10ea79..692bec91d 100644
+--- a/hw/display/ati_2d.c
++++ b/hw/display/ati_2d.c
+@@ -84,7 +84,7 @@ void ati_2d_blt(ATIVGAState *s)
+     DPRINTF("%d %d %d, %d %d %d, (%d,%d) -> (%d,%d) %dx%d %c %c\n",
+             s->regs.src_offset, s->regs.dst_offset, s->regs.default_off=
set,
+             s->regs.src_pitch, s->regs.dst_pitch, s->regs.default_pitch=
,
+-            s->regs.src_x, s->regs.src_y, s->regs.dst_x, s->regs.dst_y,
++            s->regs.src_x, s->regs.src_y, dst_x, dst_y,
+             s->regs.dst_width, s->regs.dst_height,
+             (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ? '>' : '<'),
+             (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ? 'v' : '^'));
+@@ -180,11 +180,11 @@ void ati_2d_blt(ATIVGAState *s)
+         dst_stride /=3D sizeof(uint32_t);
+         DPRINTF("pixman_fill(%p, %d, %d, %d, %d, %d, %d, %x)\n",
+                 dst_bits, dst_stride, bpp,
+-                s->regs.dst_x, s->regs.dst_y,
++                dst_x, dst_y,
+                 s->regs.dst_width, s->regs.dst_height,
+                 filler);
+         pixman_fill((uint32_t *)dst_bits, dst_stride, bpp,
+-                    s->regs.dst_x, s->regs.dst_y,
++                    dst_x, dst_y,
+                     s->regs.dst_width, s->regs.dst_height,
+                     filler);
+         if (dst_bits >=3D s->vga.vram_ptr + s->vga.vbe_start_addr &&
+--
+2.40.0
--=20
2.40.0


