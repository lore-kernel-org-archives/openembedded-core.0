Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 137A2714C1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 10:04:13 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Fri, 5 Sep 2014
	12:04:09 +0200
Received: by sestofb10.enea.se (Postfix, from userid 2671)	id DF7E8288E2C;
	Fri,  5 Sep 2014 12:04:09 +0200 (CEST)
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 Sep 2014 12:04:08 +0200
Message-ID: <1409911448-28036-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Cc: linux@list.enea.se
Subject: [PATCH] pcihp: fix possible array out of bounds, CVE-2014-5388
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
X-List-Received-Date: Fri, 05 Sep 2014 10:04:15 -0000
Content-Type: text/plain

Prevent out-of-bounds array access on acpi_pcihp_pci_status.

[From QEMU: fa365d7cd11185237471823a5a33d36765454e16]

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 ...1-Back-porting-security-fix-CVE-2014-5388.patch | 30 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.1.0.bb           |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/files/0001-Back-porting-security-fix-CVE-2014-5388.patch

diff --git a/meta/recipes-devtools/qemu/files/0001-Back-porting-security-fix-CVE-2014-5388.patch b/meta/recipes-devtools/qemu/files/0001-Back-porting-security-fix-CVE-2014-5388.patch
new file mode 100644
index 0000000..ec541fa
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/0001-Back-porting-security-fix-CVE-2014-5388.patch
@@ -0,0 +1,30 @@
+Prevent out-of-bounds array access on
+acpi_pcihp_pci_status.
+
+Upstream-Status: Backport
+
+Signed-off-by: Gonglei <arei.gonglei@huawei.com>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+v2:
+ - change commit message.
+ - add 'Reviewed-by'
+---
+ hw/acpi/pcihp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
+index fae663a..34dedf1 100644
+--- a/hw/acpi/pcihp.c
++++ b/hw/acpi/pcihp.c
+@@ -231,7 +231,7 @@ static uint64_t pci_read(void *opaque, hwaddr addr, unsigned int size)
+     uint32_t val = 0;
+     int bsel = s->hotplug_select;
+
+-    if (bsel < 0 || bsel > ACPI_PCIHP_MAX_HOTPLUG_BUS) {
++    if (bsel < 0 || bsel >= ACPI_PCIHP_MAX_HOTPLUG_BUS) {
+         return 0;
+     }
+
+--
+1.7.12.4
diff --git a/meta/recipes-devtools/qemu/qemu_2.1.0.bb b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
index 9b8337a..a82d052 100644
--- a/meta/recipes-devtools/qemu/qemu_2.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
+            file://0001-Back-porting-security-fix-CVE-2014-5388.patch \
             "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "6726977292b448cbc7f89998fac6983b"
-- 
1.9.1


