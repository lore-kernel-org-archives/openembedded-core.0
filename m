Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA65C43219
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1102.1650383144765344929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 08:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A27C7106F
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 08:45:43 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F3CF3F766
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 08:45:43 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] qemu: backport a patch to optionally disable i8042 (AT
 and PS/2) hardware
Date: Tue, 19 Apr 2022 16:45:40 +0100
Message-Id: <20220419154541.1219702-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 17:48:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164632

Backport a patch from upstream (will be in qemu 7.0) to add an option to
disable the legacy i8042 support (AT keyboard, PS/2 mouse).  These
devices are very historical and modern Linux environments use USB anyway.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/qemu/qemu.inc          |   1 +
 meta/recipes-devtools/qemu/qemu/no-ps2.patch | 123 +++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/no-ps2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 4e94c4b2bf4..09a2d470056 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -33,6 +33,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://0001-vhost-vsock-detach-the-virqueue-element-in-case-o=
f-e.patch \
            file://0002-virtio-net-fix-map-leaking-on-error-during-receiv=
e.patch \
            file://pvrdma.patch \
+           file://no-ps2.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/no-ps2.patch b/meta/recipes-=
devtools/qemu/qemu/no-ps2.patch
new file mode 100644
index 00000000000..8c167521d73
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/no-ps2.patch
@@ -0,0 +1,123 @@
+Upstream-Status: Backport [4ccd5fe22feb95137d325f422016a6473541fe9f]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From ec2d4aa7ca28127faa7ccdbf89d2bf5a4984b62f Mon Sep 17 00:00:00 2001
+From: Joelle van Dyne <j@getutm.app>
+Date: Sun, 27 Feb 2022 13:06:55 -0800
+Subject: [PATCH] pc: add option to disable PS/2 mouse/keyboard
+
+On some older software like Windows 7 installer, having both a PS/2
+mouse and USB mouse results in only one device working property (which
+might be a different device each boot). While the workaround to not use
+a USB mouse with such software is valid, it creates an inconsistent
+experience if the user wishes to always use a USB mouse.
+
+This introduces a new machine property to inhibit the creation of the
+i8042 PS/2 controller.
+
+Signed-off-by: Joelle van Dyne <j@getutm.app>
+Message-Id: <20220227210655.45592-1-j@getutm.app>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+---
+ hw/i386/pc.c         | 28 ++++++++++++++++++++++++++--
+ include/hw/i386/pc.h |  2 ++
+ 2 files changed, 28 insertions(+), 2 deletions(-)
+
+diff --git a/hw/i386/pc.c b/hw/i386/pc.c
+index a2ef40ecbc..8a6a089ee2 100644
+--- a/hw/i386/pc.c
++++ b/hw/i386/pc.c
+@@ -1008,7 +1008,8 @@ static const MemoryRegionOps ioportF0_io_ops =3D {
+     },
+ };
+=20
+-static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl, bool n=
o_vmport)
++static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
++                            bool create_i8042, bool no_vmport)
+ {
+     int i;
+     DriveInfo *fd[MAX_FD];
+@@ -1030,6 +1031,10 @@ static void pc_superio_init(ISABus *isa_bus, bool=
 create_fdctrl, bool no_vmport)
+         }
+     }
+=20
++    if (!create_i8042) {
++        return;
++    }
++
+     i8042 =3D isa_create_simple(isa_bus, "i8042");
+     if (!no_vmport) {
+         isa_create_simple(isa_bus, TYPE_VMPORT);
+@@ -1125,7 +1130,8 @@ void pc_basic_device_init(struct PCMachineState *p=
cms,
+     i8257_dma_init(isa_bus, 0);
+=20
+     /* Super I/O */
+-    pc_superio_init(isa_bus, create_fdctrl, pcms->vmport !=3D ON_OFF_AU=
TO_ON);
++    pc_superio_init(isa_bus, create_fdctrl, pcms->i8042_enabled,
++                    pcms->vmport !=3D ON_OFF_AUTO_ON);
+ }
+=20
+ void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus=
)
+@@ -1506,6 +1512,20 @@ static void pc_machine_set_hpet(Object *obj, bool=
 value, Error **errp)
+     pcms->hpet_enabled =3D value;
+ }
+=20
++static bool pc_machine_get_i8042(Object *obj, Error **errp)
++{
++    PCMachineState *pcms =3D PC_MACHINE(obj);
++
++    return pcms->i8042_enabled;
++}
++
++static void pc_machine_set_i8042(Object *obj, bool value, Error **errp)
++{
++    PCMachineState *pcms =3D PC_MACHINE(obj);
++
++    pcms->i8042_enabled =3D value;
++}
++
+ static bool pc_machine_get_default_bus_bypass_iommu(Object *obj, Error =
**errp)
+ {
+     PCMachineState *pcms =3D PC_MACHINE(obj);
+@@ -1616,6 +1636,7 @@ static void pc_machine_initfn(Object *obj)
+     pcms->smbus_enabled =3D true;
+     pcms->sata_enabled =3D true;
+     pcms->pit_enabled =3D true;
++    pcms->i8042_enabled =3D true;
+     pcms->max_fw_size =3D 8 * MiB;
+ #ifdef CONFIG_HPET
+     pcms->hpet_enabled =3D true;
+@@ -1744,6 +1765,9 @@ static void pc_machine_class_init(ObjectClass *oc,=
 void *data)
+     object_class_property_add_bool(oc, "hpet",
+         pc_machine_get_hpet, pc_machine_set_hpet);
+=20
++    object_class_property_add_bool(oc, PC_MACHINE_I8042,
++        pc_machine_get_i8042, pc_machine_set_i8042);
++
+     object_class_property_add_bool(oc, "default-bus-bypass-iommu",
+         pc_machine_get_default_bus_bypass_iommu,
+         pc_machine_set_default_bus_bypass_iommu);
+diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
+index 9ab39e428f..642c915aa3 100644
+--- a/include/hw/i386/pc.h
++++ b/include/hw/i386/pc.h
+@@ -46,6 +46,7 @@ typedef struct PCMachineState {
+     bool sata_enabled;
+     bool pit_enabled;
+     bool hpet_enabled;
++    bool i8042_enabled;
+     bool default_bus_bypass_iommu;
+     uint64_t max_fw_size;
+=20
+@@ -62,6 +63,7 @@ typedef struct PCMachineState {
+ #define PC_MACHINE_SMBUS            "smbus"
+ #define PC_MACHINE_SATA             "sata"
+ #define PC_MACHINE_PIT              "pit"
++#define PC_MACHINE_I8042            "i8042"
+ #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
+ /**
+  * PCMachineClass:
+--=20
+2.25.1
+
--=20
2.25.1


