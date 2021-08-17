Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.32453.1629158965028377194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 17:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17H09N7W019235
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 17:09:24 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17H09NbE023176
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 17:09:23 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 16 Aug 2021 17:09:22 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 16 Aug 2021 17:09:22 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] qemu: fix CVE-2021-3682
Date: Mon, 16 Aug 2021 20:09:13 -0400
Message-ID: <20210817000913.21646-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id 17H09N7W019235
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3682.patch             | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 0bbc4b1187..76e8da159c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,6 +39,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://0001-linux-user-Tag-vsx-with-ieee128-fpbits.patch \
            file://CVE-2021-3527-1.patch \
            file://CVE-2021-3527-2.patch \
+           file://CVE-2021-3682.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3682.patch
new file mode 100644
index 0000000000..50a49233d3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch
@@ -0,0 +1,41 @@
+From 5e796671e6b8d5de4b0b423dce1b3eba144a92c9 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 22 Jul 2021 09:27:56 +0200
+Subject: [PATCH] usbredir: fix free call
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+data might point into the middle of a larger buffer, there is a separate
+free_on_destroy pointer passed into bufp_alloc() to handle that.  It is
+only used in the normal workflow though, not when dropping packets due
+to the queue being full.  Fix that.
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/491
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20210722072756.647673-1-kraxel@redhat.com>
+
+CVE: CVE-2021-3682
+Upstream-Status: Backport [5e796671e6b8d5de4b0b423dce1b3eba144a92c9]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/usb/redirect.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
+index 4ec9326e05..1ec909a63a 100644
+--- a/hw/usb/redirect.c
++++ b/hw/usb/redirect.c
+@@ -476,7 +476,7 @@ static int bufp_alloc(USBRedirDevice *dev, uint8_t *=
data, uint16_t len,
+     if (dev->endpoint[EP2I(ep)].bufpq_dropping_packets) {
+         if (dev->endpoint[EP2I(ep)].bufpq_size >
+                 dev->endpoint[EP2I(ep)].bufpq_target_size) {
+-            free(data);
++            free(free_on_destroy);
+             return -1;
+         }
+         dev->endpoint[EP2I(ep)].bufpq_dropping_packets =3D 0;
+--=20
+2.25.1
+
--=20
2.32.0

