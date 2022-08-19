Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 04/26] qemu: fix CVE-2021-4158
Date: Thu, 18 Aug 2022 16:42:26 -1000
Message-Id: <a171d1fa795ea41ef073f1ed34894d0c43989e6a.1660876844.git.steve@sakoman.com>
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Sakib Sajal <sakib.sajal@windriver.com>

Backport patch to fix CVE-2021-4158.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-4158.patch             | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-4158.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 53bad5c453..1d04ad3c67 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,6 +39,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3507_1.patch \
            file://CVE-2021-3507_2.patch \
            file://CVE-2021-3929.patch \
+           file://CVE-2021-4158.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-4158.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-4158.patch
new file mode 100644
index 0000000000..f6de53244f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-4158.patch
@@ -0,0 +1,46 @@
+From a0b64c6d078acb9bcfae600e22bf99a9a7deca7c Mon Sep 17 00:00:00 2001
+From: "Michael S. Tsirkin" <mst@redhat.com>
+Date: Tue, 21 Dec 2021 09:45:44 -0500
+Subject: [PATCH] acpi: validate hotplug selector on access
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When bus is looked up on a pci write, we didn't
+validate that the lookup succeeded.
+Fuzzers thus can trigger QEMU crash by dereferencing the NULL
+bus pointer.
+
+Fixes: b32bd763a1 ("pci: introduce acpi-index property for PCI device")
+Fixes: CVE-2021-4158
+Cc: "Igor Mammedov" <imammedo@redhat.com>
+Fixes: https://gitlab.com/qemu-project/qemu/-/issues/770
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Reviewed-by: Ani Sinha <ani@anisinha.ca>
+
+Upstream-Status: Backport [9bd6565ccee68f72d5012e24646e12a1c662827e]
+CVE: CVE-2021-4158
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/acpi/pcihp.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
+index 30405b511..a5e182dd3 100644
+--- a/hw/acpi/pcihp.c
++++ b/hw/acpi/pcihp.c
+@@ -491,6 +491,9 @@ static void pci_write(void *opaque, hwaddr addr, uint64_t data,
+         }
+ 
+         bus = acpi_pcihp_find_hotplug_bus(s, s->hotplug_select);
++        if (!bus) {
++            break;
++        }
+         QTAILQ_FOREACH_SAFE(kid, &bus->qbus.children, sibling, next) {
+             Object *o = OBJECT(kid->child);
+             PCIDevice *dev = PCI_DEVICE(o);
+-- 
+2.33.0
+
-- 
2.25.1

