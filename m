Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 21282738FB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 09:01:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6291Mfk015439
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jul 2015 02:01:22 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 2 Jul 2015 02:01:21 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Jul 2015 17:01:36 +0800
Message-ID: <1435827696-10546-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] qemu: CVE-2014-3689
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
X-List-Received-Date: Thu, 02 Jul 2015 09:01:22 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

the patch comes from:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-3689
http://git.qemu.org/?p=qemu.git;a=commit;h=83afa38eb20ca27e30683edc7729880e091387fc

vmware-vga: CVE-2014-3689: turn off hw accel

Quick & easy stopgap for CVE-2014-3689:  We just compile out the
hardware acceleration functions which lack sanity checks.  Thankfully
we have capability bits for them (SVGA_CAP_RECT_COPY and
SVGA_CAP_RECT_FILL), so guests should deal just fine, in theory.

Subsequent patches will add the missing checks and re-enable the
hardware acceleration emulation.

Cc: qemu-stable@nongnu.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Don Koch <dkoch@verizon.com>
Signed-off-by: Li Wang <li.wang@windriver.com>
---
 .../qemu/qemu/qemu-CVE-2014-3689.patch             | 46 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.3.0.bb           |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-CVE-2014-3689.patch

diff --git a/meta/recipes-devtools/qemu/qemu/qemu-CVE-2014-3689.patch b/meta/recipes-devtools/qemu/qemu/qemu-CVE-2014-3689.patch
new file mode 100644
index 0000000..a0c3931
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/qemu-CVE-2014-3689.patch
@@ -0,0 +1,46 @@
+qemu: CVE-2014-3689
+
+the patch comes from:
+https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-3689
+http://git.qemu.org/?p=qemu.git;a=commit;h=83afa38eb20ca27e30683edc7729880e091387fc
+
+vmware-vga: CVE-2014-3689: turn off hw accel
+
+Quick & easy stopgap for CVE-2014-3689:  We just compile out the
+hardware acceleration functions which lack sanity checks.  Thankfully
+we have capability bits for them (SVGA_CAP_RECT_COPY and
+SVGA_CAP_RECT_FILL), so guests should deal just fine, in theory.
+
+Subsequent patches will add the missing checks and re-enable the
+hardware acceleration emulation.
+
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Don Koch <dkoch@verizon.com>
+
+Upstream-Status: Backport
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ hw/display/vmware_vga.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
+index 591b645..99a97fe 100644
+--- a/hw/display/vmware_vga.c
++++ b/hw/display/vmware_vga.c
+@@ -29,9 +29,11 @@
+ #include "hw/pci/pci.h"
+ 
+ #undef VERBOSE
++#if 0
+ #define HW_RECT_ACCEL
+ #define HW_FILL_ACCEL
+ #define HW_MOUSE_ACCEL
++#endif
+ 
+ #include "vga_int.h"
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.3.0.bb b/meta/recipes-devtools/qemu/qemu_2.3.0.bb
index ec1b101..917febe 100644
--- a/meta/recipes-devtools/qemu/qemu_2.3.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.3.0.bb
@@ -18,6 +18,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://09-xen-pt-mark-reserved-bits-in-PCI-config-space-fields-CVE-2015-4106.patch \
             file://10-xen-pt-add-a-few-PCI-config-space-field-descriptions-CVE-2015-4106.patch \
             file://11-xen-pt-unknown-PCI-config-space-fields-should-be-readonly-CVE-2015-4106.patch \
+            file://qemu-CVE-2014-3689.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "2fab3ea4460de9b57192e5b8b311f221"
-- 
1.9.1


