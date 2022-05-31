Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48439C433FE
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 22:08:31 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.77.1654034901260966945
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 15:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24VM8KAU012192
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 15:08:20 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 24VM8KeA011464
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 15:08:20 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 31 May 2022 15:08:20 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 31 May 2022 15:08:19 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 31 May 2022 15:08:19 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/4] qemu: fix CVE-2021-4206
Date: Tue, 31 May 2022 18:08:07 -0400
Message-ID: <20220531220807.8032-4-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220531220807.8032-1-sakib.sajal@windriver.com>
References: <20220531220807.8032-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id
 24VM8KAU012192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 22:08:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166343

Backport fix to resolve CVE-2021-4206:
   fa892e9abb ui/cursor: fix integer overflow in cursor_alloc (CVE-2021-4=
206)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-4206.patch             | 89 +++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-4206.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 898377d11b..b6595a7731 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -81,6 +81,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://CVE-2021-3750_2.patch \
            file://CVE-2021-3750_3.patch \
            file://CVE-2022-26353.patch \
+           file://CVE-2021-4206.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-4206.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-4206.patch
new file mode 100644
index 0000000000..bc76d3a206
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-4206.patch
@@ -0,0 +1,89 @@
+From 1ed7525cc9d9a98ef126e9803b09f50aa9f2e3bf Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Thu, 7 Apr 2022 10:17:12 +0200
+Subject: [PATCH] ui/cursor: fix integer overflow in cursor_alloc
+ (CVE-2021-4206)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Prevent potential integer overflow by limiting 'width' and 'height' to
+512x512. Also change 'datasize' type to size_t. Refer to security
+advisory https://starlabs.sg/advisories/22-4206/ for more information.
+
+Fixes: CVE-2021-4206
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20220407081712.345609-1-mcascell@redhat.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+CVE: CVE-2021-4206
+Upstream-Status: Backport [fa892e9abb728e76afcf27323ab29c57fb0fe7aa]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/display/qxl-render.c | 7 +++++++
+ hw/display/vmware_vga.c | 2 ++
+ ui/cursor.c             | 8 +++++++-
+ 3 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
+index 3ce2e57b8..c2ecef706 100644
+--- a/hw/display/qxl-render.c
++++ b/hw/display/qxl-render.c
+@@ -246,6 +246,13 @@ static QEMUCursor *qxl_cursor(PCIQXLDevice *qxl, QX=
LCursor *cursor,
+     size_t size;
+=20
+     c =3D cursor_alloc(cursor->header.width, cursor->header.height);
++
++    if (!c) {
++        qxl_set_guest_bug(qxl, "%s: cursor %ux%u alloc error", __func__=
,
++                cursor->header.width, cursor->header.height);
++        goto fail;
++    }
++
+     c->hot_x =3D cursor->header.hot_spot_x;
+     c->hot_y =3D cursor->header.hot_spot_y;
+     switch (cursor->header.type) {
+diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
+index bef0d7d69..e30dbdcb3 100644
+--- a/hw/display/vmware_vga.c
++++ b/hw/display/vmware_vga.c
+@@ -510,6 +510,8 @@ static inline void vmsvga_cursor_define(struct vmsvg=
a_state_s *s,
+     int i, pixels;
+=20
+     qc =3D cursor_alloc(c->width, c->height);
++    assert(qc !=3D NULL);
++
+     qc->hot_x =3D c->hot_x;
+     qc->hot_y =3D c->hot_y;
+     switch (c->bpp) {
+diff --git a/ui/cursor.c b/ui/cursor.c
+index 1d62ddd4d..835f0802f 100644
+--- a/ui/cursor.c
++++ b/ui/cursor.c
+@@ -46,6 +46,8 @@ static QEMUCursor *cursor_parse_xpm(const char *xpm[])
+=20
+     /* parse pixel data */
+     c =3D cursor_alloc(width, height);
++    assert(c !=3D NULL);
++
+     for (pixel =3D 0, y =3D 0; y < height; y++, line++) {
+         for (x =3D 0; x < height; x++, pixel++) {
+             idx =3D xpm[line][x];
+@@ -91,7 +93,11 @@ QEMUCursor *cursor_builtin_left_ptr(void)
+ QEMUCursor *cursor_alloc(int width, int height)
+ {
+     QEMUCursor *c;
+-    int datasize =3D width * height * sizeof(uint32_t);
++    size_t datasize =3D width * height * sizeof(uint32_t);
++
++    if (width > 512 || height > 512) {
++        return NULL;
++    }
+=20
+     c =3D g_malloc0(sizeof(QEMUCursor) + datasize);
+     c->width  =3D width;
+--=20
+2.33.0
+
--=20
2.33.0


