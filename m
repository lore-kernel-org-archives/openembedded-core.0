Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8B0E571F2D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 14:37:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 Oct 2014 07:37:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,295,1413270000"; d="scan'208";a="624180376"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 31 Oct 2014 07:36:12 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Oct 2014 16:36:07 +0200
Message-Id: <7a6dbf75749631db018a8a060240bd5c9c99a407.1414766096.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1414766096.git.cristian.iorga@intel.com>
References: <cover.1414766096.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1414766096.git.cristian.iorga@intel.com>
References: <cover.1414766096.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] qemu: upgrade to 2.1.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Oct 2014 14:37:01 -0000

Mainly a bug fix release.

- Patch 0001-Back-porting-security-fix-CVE-2014-5388.patch removed,
included upstream.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...1-Back-porting-security-fix-CVE-2014-5388.patch | 30 ----------------------
 .../qemu/{qemu_2.1.0.bb => qemu_2.1.2.bb}          |  5 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/files/0001-Back-porting-security-fix-CVE-2014-5388.patch
 rename meta/recipes-devtools/qemu/{qemu_2.1.0.bb => qemu_2.1.2.bb} (81%)

diff --git a/meta/recipes-devtools/qemu/files/0001-Back-porting-security-fix-CVE-2014-5388.patch b/meta/recipes-devtools/qemu/files/0001-Back-porting-security-fix-CVE-2014-5388.patch
deleted file mode 100644
index ec541fa..0000000
--- a/meta/recipes-devtools/qemu/files/0001-Back-porting-security-fix-CVE-2014-5388.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Prevent out-of-bounds array access on
-acpi_pcihp_pci_status.
-
-Upstream-Status: Backport
-
-Signed-off-by: Gonglei <arei.gonglei@huawei.com>
-Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
----
-v2:
- - change commit message.
- - add 'Reviewed-by'
----
- hw/acpi/pcihp.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
-index fae663a..34dedf1 100644
---- a/hw/acpi/pcihp.c
-+++ b/hw/acpi/pcihp.c
-@@ -231,7 +231,7 @@ static uint64_t pci_read(void *opaque, hwaddr addr, unsigned int size)
-     uint32_t val = 0;
-     int bsel = s->hotplug_select;
-
--    if (bsel < 0 || bsel > ACPI_PCIHP_MAX_HOTPLUG_BUS) {
-+    if (bsel < 0 || bsel >= ACPI_PCIHP_MAX_HOTPLUG_BUS) {
-         return 0;
-     }
-
---
-1.7.12.4
diff --git a/meta/recipes-devtools/qemu/qemu_2.1.0.bb b/meta/recipes-devtools/qemu/qemu_2.1.2.bb
similarity index 81%
rename from meta/recipes-devtools/qemu/qemu_2.1.0.bb
rename to meta/recipes-devtools/qemu/qemu_2.1.2.bb
index a82d052..0e20605 100644
--- a/meta/recipes-devtools/qemu/qemu_2.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.1.2.bb
@@ -6,11 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
-            file://0001-Back-porting-security-fix-CVE-2014-5388.patch \
             "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "6726977292b448cbc7f89998fac6983b"
-SRC_URI[sha256sum] = "397e23184f4bf613589a8fe0c6542461dc2afdf17ed337e97e6fd2f31e8f8802"
+SRC_URI[md5sum] = "0ff197c4ed4b695620bc4734e77c888f"
+SRC_URI[sha256sum] = "fd10f5e45cf5a736fa5a3e1c279ae9821534e700beb7d1aab88a07648a394885"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
 
-- 
2.1.0


