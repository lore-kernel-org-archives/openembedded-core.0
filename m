Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.29837.1607916928036729184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: HEiMVi9t6NLRaUdeFULLg7Wjyi2JHRU/VOEu8uVtJOXpoMCkB1Bmaw42brK0jrrmCt3QAKGSLN
 XitULBwiAe9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752383"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752383"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:33 -0800
IronPort-SDR: ZG2bnN0nW/xpK+V8z4CQVkzRAV3Sk7ae5oTDPQFK7p5gn0OwhxHT8vcprFewBkWKOVF9r3rpvm
 HQCX35xhhaHQ==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670770"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:32 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 10/19] qemu: CVE-2020-25624
Date: Mon, 14 Dec 2020 11:35:07 +0800
Message-Id: <af9e9945ac81885421a6bb8432184a2bd1a3efff.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607916826.git.anuj.mittal@intel.com>
References: <cover.1607916826.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Wang <li.wang@windriver.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-25624

backport patch from:
https://git.qemu.org/?p=qemu.git;a=commit;h=1328fe0c32d5474604105b8105310e944976b058

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 88d05be28da522fb390ee24f2871a113adf4366e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2020-25624.patch            | 101 ++++++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25624.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index bbe2a39755..274c855d35 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -34,6 +34,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch \
            file://CVE-2020-24352.patch \
            file://CVE-2020-29129-CVE-2020-29130.patch \
+           file://CVE-2020-25624.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-25624.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-25624.patch
new file mode 100644
index 0000000000..7631bab39f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-25624.patch
@@ -0,0 +1,101 @@
+From 1328fe0c32d5474604105b8105310e944976b058 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Tue, 15 Sep 2020 23:52:58 +0530
+Subject: [PATCH] hw: usb: hcd-ohci: check len and frame_number variables
+
+While servicing the OHCI transfer descriptors(TD), OHCI host
+controller derives variables 'start_addr', 'end_addr', 'len'
+etc. from values supplied by the host controller driver.
+Host controller driver may supply values such that using
+above variables leads to out-of-bounds access issues.
+Add checks to avoid them.
+
+AddressSanitizer: stack-buffer-overflow on address 0x7ffd53af76a0
+  READ of size 2 at 0x7ffd53af76a0 thread T0
+  #0 ohci_service_iso_td ../hw/usb/hcd-ohci.c:734
+  #1 ohci_service_ed_list ../hw/usb/hcd-ohci.c:1180
+  #2 ohci_process_lists ../hw/usb/hcd-ohci.c:1214
+  #3 ohci_frame_boundary ../hw/usb/hcd-ohci.c:1257
+  #4 timerlist_run_timers ../util/qemu-timer.c:572
+  #5 qemu_clock_run_timers ../util/qemu-timer.c:586
+  #6 qemu_clock_run_all_timers ../util/qemu-timer.c:672
+  #7 main_loop_wait ../util/main-loop.c:527
+  #8 qemu_main_loop ../softmmu/vl.c:1676
+  #9 main ../softmmu/main.c:50
+
+Reported-by: Gaoning Pan <pgn@zju.edu.cn>
+Reported-by: Yongkang Jia <j_kangel@163.com>
+Reported-by: Yi Ren <yunye.ry@alibaba-inc.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-id: 20200915182259.68522-2-ppandit@redhat.com
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-25624
+[https://git.qemu.org/?p=qemu.git;a=commit;h=1328fe0c32d5474604105b8105310e944976b058]
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ hw/usb/hcd-ohci.c | 24 ++++++++++++++++++++++--
+ 1 file changed, 22 insertions(+), 2 deletions(-)
+
+diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
+index 1e6e85e..9dc5910 100644
+--- a/hw/usb/hcd-ohci.c
++++ b/hw/usb/hcd-ohci.c
+@@ -731,7 +731,11 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
+     }
+ 
+     start_offset = iso_td.offset[relative_frame_number];
+-    next_offset = iso_td.offset[relative_frame_number + 1];
++    if (relative_frame_number < frame_count) {
++        next_offset = iso_td.offset[relative_frame_number + 1];
++    } else {
++        next_offset = iso_td.be;
++    }
+ 
+     if (!(OHCI_BM(start_offset, TD_PSW_CC) & 0xe) || 
+         ((relative_frame_number < frame_count) && 
+@@ -764,7 +768,12 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
+         }
+     } else {
+         /* Last packet in the ISO TD */
+-        end_addr = iso_td.be;
++        end_addr = next_offset;
++    }
++
++    if (start_addr > end_addr) {
++        trace_usb_ohci_iso_td_bad_cc_overrun(start_addr, end_addr);
++        return 1;
+     }
+ 
+     if ((start_addr & OHCI_PAGE_MASK) != (end_addr & OHCI_PAGE_MASK)) {
+@@ -773,6 +782,9 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
+     } else {
+         len = end_addr - start_addr + 1;
+     }
++    if (len > sizeof(ohci->usb_buf)) {
++        len = sizeof(ohci->usb_buf);
++    }
+ 
+     if (len && dir != OHCI_TD_DIR_IN) {
+         if (ohci_copy_iso_td(ohci, start_addr, end_addr, ohci->usb_buf, len,
+@@ -975,8 +987,16 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
+         if ((td.cbp & 0xfffff000) != (td.be & 0xfffff000)) {
+             len = (td.be & 0xfff) + 0x1001 - (td.cbp & 0xfff);
+         } else {
++            if (td.cbp > td.be) {
++                trace_usb_ohci_iso_td_bad_cc_overrun(td.cbp, td.be);
++                ohci_die(ohci);
++                return 1;
++            }
+             len = (td.be - td.cbp) + 1;
+         }
++        if (len > sizeof(ohci->usb_buf)) {
++            len = sizeof(ohci->usb_buf);
++        }
+ 
+         pktlen = len;
+         if (len && dir != OHCI_TD_DIR_IN) {
+-- 
+2.17.1
+
-- 
2.29.2

