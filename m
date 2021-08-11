Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.2959.1628651336807447086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 20:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17B38uK8024288
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 20:08:56 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 10 Aug 2021 20:08:55 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 10 Aug 2021 20:08:55 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 5/5] qemu: fix CVE-2021-3608
Date: Tue, 10 Aug 2021 23:08:48 -0400
Message-ID: <20210811030848.11076-5-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210811030848.11076-1-sakib.sajal@windriver.com>
References: <20210811030848.11076-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 17B38uK8024288
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3608.patch             | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3608.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 69fba5dd79..b5f42ddfc3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -68,6 +68,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://CVE-2021-3544_7.patch \
            file://CVE-2021-3582.patch \
            file://CVE-2021-3607.patch \
+           file://CVE-2021-3608.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3608.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3608.patch
new file mode 100644
index 0000000000..22d68b025d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3608.patch
@@ -0,0 +1,43 @@
+From 66ae37d8cc313f89272e711174a846a229bcdbd3 Mon Sep 17 00:00:00 2001
+From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+Date: Wed, 30 Jun 2021 14:52:46 +0300
+Subject: [PATCH] pvrdma: Fix the ring init error flow (CVE-2021-3608)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Do not unmap uninitialized dma addresses.
+
+Fixes: CVE-2021-3608
+Reviewed-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
+Tested-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
+Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
+Message-Id: <20210630115246.2178219-1-marcel@redhat.com>
+Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+
+CVE: CVE-2021-3608
+Upstream-Status: Backport [66ae37d8cc313f89272e711174a846a229bcdbd3]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/rdma/vmw/pvrdma_dev_ring.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring=
.c
+index 074ac59b84..42130667a7 100644
+--- a/hw/rdma/vmw/pvrdma_dev_ring.c
++++ b/hw/rdma/vmw/pvrdma_dev_ring.c
+@@ -41,7 +41,7 @@ int pvrdma_ring_init(PvrdmaRing *ring, const char *nam=
e, PCIDevice *dev,
+     qatomic_set(&ring->ring_state->cons_head, 0);
+     */
+     ring->npages =3D npages;
+-    ring->pages =3D g_malloc(npages * sizeof(void *));
++    ring->pages =3D g_malloc0(npages * sizeof(void *));
+=20
+     for (i =3D 0; i < npages; i++) {
+         if (!tbl[i]) {
+--=20
+2.25.1
+
--=20
2.32.0

