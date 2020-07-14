Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.4850.1594756319650887209
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 12:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06EJpMT0007822
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2020 12:51:48 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Tue, 14 Jul 2020
 12:51:29 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id 68F6B20208;
 Tue, 14 Jul 2020 15:51:28 -0400 (EDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sakib Sajal <sakib.sajal@windriver.com>
Subject: [PATCH 4/4] qemu: fix CVE-2020-13791
Date: Tue, 14 Jul 2020 15:51:19 -0400
Message-ID: <20200714195119.20074-4-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714195119.20074-1-sakib.sajal@windriver.com>
References: <20200714195119.20074-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 06EJpMT0007822
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-13791.patch            | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 618cc50180..57619e8668 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -35,6 +35,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
 	   file://CVE-2020-13362.patch \
 	   file://CVE-2020-13659.patch \
 	   file://CVE-2020-13800.patch \
+	   file://CVE-2020-13791.patch \
 	   "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch b/meta/=
recipes-devtools/qemu/qemu/CVE-2020-13791.patch
new file mode 100644
index 0000000000..049dab914d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
@@ -0,0 +1,53 @@
+From f7d6a635fa3b7797f9d072e280f065bf3cfcd24d Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 4 Jun 2020 17:05:25 +0530
+Subject: [PATCH] pci: assert configuration access is within bounds
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+While accessing PCI configuration bytes, assert that
+'address + len' is within PCI configuration space.
+
+Generally it is within bounds. This is more of a defensive
+assert, in case a buggy device was to send 'address' which
+may go out of bounds.
+
+Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-Id: <20200604113525.58898-1-ppandit@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+
+Upstream-Status: Backport [f7d6a635fa3b7797f9d072e280f065bf3cfcd24d]
+CVE: CVE-2020-13791
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/pci/pci.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/hw/pci/pci.c b/hw/pci/pci.c
+index 70c66965f5..7bf2ae6d92 100644
+--- a/hw/pci/pci.c
++++ b/hw/pci/pci.c
+@@ -1381,6 +1381,8 @@ uint32_t pci_default_read_config(PCIDevice *d,
+ {
+     uint32_t val =3D 0;
+=20
++    assert(address + len <=3D pci_config_size(d));
++
+     if (pci_is_express_downstream_port(d) &&
+         ranges_overlap(address, len, d->exp.exp_cap + PCI_EXP_LNKSTA, 2=
)) {
+         pcie_sync_bridge_lnk(d);
+@@ -1394,6 +1396,8 @@ void pci_default_write_config(PCIDevice *d, uint32=
_t addr, uint32_t val_in, int
+     int i, was_irq_disabled =3D pci_irq_disabled(d);
+     uint32_t val =3D val_in;
+=20
++    assert(addr + l <=3D pci_config_size(d));
++
+     for (i =3D 0; i < l; val >>=3D 8, ++i) {
+         uint8_t wmask =3D d->wmask[addr + i];
+         uint8_t w1cmask =3D d->w1cmask[addr + i];
+--=20
+2.20.1
+
--=20
2.27.0

