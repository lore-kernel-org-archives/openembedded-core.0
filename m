Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EA6C54EE9
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 12:40:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6566.1663850399224767430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 05:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1D2816F8;
	Thu, 22 Sep 2022 05:40:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0B453F73B;
	Thu, 22 Sep 2022 05:39:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] qemu: fix CVE-2022-2962
Date: Thu, 22 Sep 2022 13:39:54 +0100
Message-Id: <20220922123954.2466959-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922123954.2466959-1-ross.burton@arm.com>
References: <20220922123954.2466959-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 12:40:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170973

Backport the fix for CVE-2022-2962.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...ulip-Restrict-DMA-engine-to-memories.patch | 64 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-net-tulip-Restri=
ct-DMA-engine-to-memories.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 14e2a792353..659e70c0f4b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -27,6 +27,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://0008-tests-meson.build-use-relative-path-to-refer-to-f=
ile.patch \
            file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed=
-li.patch \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-gues=
t-d.patch \
+           file://0001-net-tulip-Restrict-DMA-engine-to-memories.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/0001-net-tulip-Restrict-DMA-=
engine-to-memories.patch b/meta/recipes-devtools/qemu/qemu/0001-net-tulip=
-Restrict-DMA-engine-to-memories.patch
new file mode 100644
index 00000000000..6c85a77ba70
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-net-tulip-Restrict-DMA-engine-=
to-memories.patch
@@ -0,0 +1,64 @@
+CVE: CVE-2022-2962
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 5c5c50b0a73d78ffe18336c9996fef5eae9bbbb0 Mon Sep 17 00:00:00 2001
+From: Zheyu Ma <zheyuma97@gmail.com>
+Date: Sun, 21 Aug 2022 20:43:43 +0800
+Subject: [PATCH] net: tulip: Restrict DMA engine to memories
+
+The DMA engine is started by I/O access and then itself accesses the
+I/O registers, triggering a reentrancy bug.
+
+The following log can reveal it:
+=3D=3D5637=3D=3DERROR: AddressSanitizer: stack-overflow
+    #0 0x5595435f6078 in tulip_xmit_list_update qemu/hw/net/tulip.c:673
+    #1 0x5595435f204a in tulip_write qemu/hw/net/tulip.c:805:13
+    #2 0x559544637f86 in memory_region_write_accessor qemu/softmmu/memor=
y.c:492:5
+    #3 0x5595446379fa in access_with_adjusted_size qemu/softmmu/memory.c=
:554:18
+    #4 0x5595446372fa in memory_region_dispatch_write qemu/softmmu/memor=
y.c
+    #5 0x55954468b74c in flatview_write_continue qemu/softmmu/physmem.c:=
2825:23
+    #6 0x559544683662 in flatview_write qemu/softmmu/physmem.c:2867:12
+    #7 0x5595446833f3 in address_space_write qemu/softmmu/physmem.c:2963=
:18
+    #8 0x5595435fb082 in dma_memory_rw_relaxed qemu/include/sysemu/dma.h=
:87:12
+    #9 0x5595435fb082 in dma_memory_rw qemu/include/sysemu/dma.h:130:12
+    #10 0x5595435fb082 in dma_memory_write qemu/include/sysemu/dma.h:171=
:12
+    #11 0x5595435fb082 in stl_le_dma qemu/include/sysemu/dma.h:272:1
+    #12 0x5595435fb082 in stl_le_pci_dma qemu/include/hw/pci/pci.h:910:1
+    #13 0x5595435fb082 in tulip_desc_write qemu/hw/net/tulip.c:101:9
+    #14 0x5595435f7e3d in tulip_xmit_list_update qemu/hw/net/tulip.c:706=
:9
+    #15 0x5595435f204a in tulip_write qemu/hw/net/tulip.c:805:13
+
+Fix this bug by restricting the DMA engine to memories regions.
+
+Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+---
+ hw/net/tulip.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hw/net/tulip.c b/hw/net/tulip.c
+index 097e905bec..b9e42c322a 100644
+--- a/hw/net/tulip.c
++++ b/hw/net/tulip.c
+@@ -70,7 +70,7 @@ static const VMStateDescription vmstate_pci_tulip =3D =
{
+ static void tulip_desc_read(TULIPState *s, hwaddr p,
+         struct tulip_descriptor *desc)
+ {
+-    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
++    const MemTxAttrs attrs =3D { .memory =3D true };
+=20
+     if (s->csr[0] & CSR0_DBO) {
+         ldl_be_pci_dma(&s->dev, p, &desc->status, attrs);
+@@ -88,7 +88,7 @@ static void tulip_desc_read(TULIPState *s, hwaddr p,
+ static void tulip_desc_write(TULIPState *s, hwaddr p,
+         struct tulip_descriptor *desc)
+ {
+-    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
++    const MemTxAttrs attrs =3D { .memory =3D true };
+=20
+     if (s->csr[0] & CSR0_DBO) {
+         stl_be_pci_dma(&s->dev, p, desc->status, attrs);
+--=20
+2.34.1
+
--=20
2.34.1


