Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.4719.1594756319652794331
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 12:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06EJpMSx007822
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2020 12:51:48 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Tue, 14 Jul 2020
 12:51:29 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id 65B441FF3F;
 Tue, 14 Jul 2020 15:51:28 -0400 (EDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sakib Sajal <sakib.sajal@windriver.com>
Subject: [PATCH 3/4] qemu: fix CVE-2020-13800
Date: Tue, 14 Jul 2020 15:51:18 -0400
Message-ID: <20200714195119.20074-3-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714195119.20074-1-sakib.sajal@windriver.com>
References: <20200714195119.20074-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 06EJpMSx007822
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-13800.patch            | 63 +++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13800.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index a9ef3b78bf..618cc50180 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -34,6 +34,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
 	   file://CVE-2020-10761.patch \
 	   file://CVE-2020-13362.patch \
 	   file://CVE-2020-13659.patch \
+	   file://CVE-2020-13800.patch \
 	   "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13800.patch b/meta/=
recipes-devtools/qemu/qemu/CVE-2020-13800.patch
new file mode 100644
index 0000000000..52bfafbbae
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13800.patch
@@ -0,0 +1,63 @@
+From a98610c429d52db0937c1e48659428929835c455 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 4 Jun 2020 14:38:30 +0530
+Subject: [PATCH] ati-vga: check mm_index before recursive call
+ (CVE-2020-13800)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+While accessing VGA registers via ati_mm_read/write routines,
+a guest may set 's->regs.mm_index' such that it leads to infinite
+recursion. Check mm_index value to avoid such recursion. Log an
+error message for wrong values.
+
+Reported-by: Ren Ding <rding@gatech.edu>
+Reported-by: Hanqing Zhao <hanqing@gatech.edu>
+Reported-by: Yi Ren <c4tren@gmail.com>
+Message-id: 20200604090830.33885-1-ppandit@redhat.com
+Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
+Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport [a98610c429d52db0937c1e48659428929835c455]
+CVE: CVE-2020-13800
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/display/ati.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/hw/display/ati.c b/hw/display/ati.c
+index 065f197678..67604e68de 100644
+--- a/hw/display/ati.c
++++ b/hw/display/ati.c
+@@ -285,8 +285,11 @@ static uint64_t ati_mm_read(void *opaque, hwaddr ad=
dr, unsigned int size)
+             if (idx <=3D s->vga.vram_size - size) {
+                 val =3D ldn_le_p(s->vga.vram_ptr + idx, size);
+             }
+-        } else {
++        } else if (s->regs.mm_index > MM_DATA + 3) {
+             val =3D ati_mm_read(s, s->regs.mm_index + addr - MM_DATA, s=
ize);
++        } else {
++            qemu_log_mask(LOG_GUEST_ERROR,
++                "ati_mm_read: mm_index too small: %u\n", s->regs.mm_ind=
ex);
+         }
+         break;
+     case BIOS_0_SCRATCH ... BUS_CNTL - 1:
+@@ -520,8 +523,11 @@ static void ati_mm_write(void *opaque, hwaddr addr,
+             if (idx <=3D s->vga.vram_size - size) {
+                 stn_le_p(s->vga.vram_ptr + idx, size, data);
+             }
+-        } else {
++        } else if (s->regs.mm_index > MM_DATA + 3) {
+             ati_mm_write(s, s->regs.mm_index + addr - MM_DATA, data, si=
ze);
++        } else {
++            qemu_log_mask(LOG_GUEST_ERROR,
++                "ati_mm_write: mm_index too small: %u\n", s->regs.mm_in=
dex);
+         }
+         break;
+     case BIOS_0_SCRATCH ... BUS_CNTL - 1:
+--=20
+2.20.1
+
--=20
2.27.0

