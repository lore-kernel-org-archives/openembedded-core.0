Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 27AB771FCB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 15:39:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA6FdKB0004797
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Nov 2014 07:39:20 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 6 Nov 2014 07:39:20 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <fathi.boudra@linaro.org>, <joe.slater@windriver.com>,
	<mark.hatle@windriver.com>
Date: Thu, 6 Nov 2014 23:34:20 +0800
Message-ID: <eaa35a56a57f1046ffa5af02a4066ac828bdba3f.1415264549.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415264548.git.kai.kang@windriver.com>
References: <cover.1415264548.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: koen.kooi@linaro.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 17/25] qemu: update to version 2.1.2
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
X-List-Received-Date: Thu, 06 Nov 2014 15:39:21 -0000
Content-Type: text/plain

Update qemu from 2.1.0 to version 2.1.2.

* Remove backport patch 0001-Back-porting-security-fix-CVE-2014-5388.patch
* Remove task do_sanitize_sources that no directory .git in submodules any more

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...1-Back-porting-security-fix-CVE-2014-5388.patch | 30 ----------------------
 .../qemu/{qemu_2.1.0.bb => qemu_2.1.2.bb}          | 19 +++++---------
 2 files changed, 6 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/files/0001-Back-porting-security-fix-CVE-2014-5388.patch
 rename meta/recipes-devtools/qemu/{qemu_2.1.0.bb => qemu_2.1.2.bb} (55%)

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
similarity index 55%
rename from meta/recipes-devtools/qemu/qemu_2.1.0.bb
rename to meta/recipes-devtools/qemu/qemu_2.1.2.bb
index a82d052..b4e1cab 100644
--- a/meta/recipes-devtools/qemu/qemu_2.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.1.2.bb
@@ -1,26 +1,19 @@
 require qemu.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
-                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
+                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913 \
+                   "
 
 SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
-            file://0001-Back-porting-security-fix-CVE-2014-5388.patch \
-            "
+           "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "6726977292b448cbc7f89998fac6983b"
-SRC_URI[sha256sum] = "397e23184f4bf613589a8fe0c6542461dc2afdf17ed337e97e6fd2f31e8f8802"
+SRC_URI[md5sum] = "0ff197c4ed4b695620bc4734e77c888f"
+SRC_URI[sha256sum] = "fd10f5e45cf5a736fa5a3e1c279ae9821534e700beb7d1aab88a07648a394885"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
-
-do_sanitize_sources() {
-    # These .git files point to a nonexistent path "../.git/modules" and will confuse git
-    # if it tries to recurse into those directories.
-    rm -f ${S}/dtc/.git ${S}/pixman/.git
-}
-
-addtask sanitize_sources after do_unpack before do_patch
+COMPATIBLE_HOST_class-target_mips = "null"
 
 do_install_append() {
     # Prevent QA warnings about installed ${localstatedir}/run
-- 
1.9.1


