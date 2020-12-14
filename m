Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.32780.1607943178055624897
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 02:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: VZ45RhxWwH4T04yDEhJwQFyMlidgcyH6KYqgo9tuSXkvPkpj4bZicR5Ka9rU8bhjuTlZB+krTX
 zk1HAUPTW95g==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="171177869"
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; 
   d="scan'208";a="171177869"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 02:52:57 -0800
IronPort-SDR: ghWxmzhzINk7YbXLz2MLhbIujYcZxueMEzNVcGx/iiAG2N6NKFapnJFuPbvlHC1kHaW5mlm4Md
 XTm3ZjCN327g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; 
   d="scan'208";a="411138075"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga001.jf.intel.com with ESMTP; 14 Dec 2020 02:52:56 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 2/3] qemu: fix CVE-2020-25723
Date: Mon, 14 Dec 2020 18:52:53 +0800
Message-Id: <20201214105254.57230-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201214105254.57230-1-chee.yang.lee@intel.com>
References: <20201214105254.57230-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-25723.patch            | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 067179fdeb..7a963ad57c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -51,6 +51,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch \
 	   file://CVE-2019-20175.patch \
 	   file://CVE-2020-24352.patch \
+	   file://CVE-2020-25723.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch
new file mode 100644
index 0000000000..e6e0f5ec30
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch
@@ -0,0 +1,52 @@
+From 2fdb42d840400d58f2e706ecca82c142b97bcbd6 Mon Sep 17 00:00:00 2001
+From: Li Qiang <liq3ea@163.com>
+Date: Wed, 12 Aug 2020 09:17:27 -0700
+Subject: [PATCH] hw: ehci: check return value of 'usb_packet_map'
+
+If 'usb_packet_map' fails, we should stop to process the usb
+request.
+
+Signed-off-by: Li Qiang <liq3ea@163.com>
+Message-Id: <20200812161727.29412-1-liq3ea@163.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=2fdb42d840400d58f2e706ecca82c142b97bcbd6]
+CVE: CVE-2020-25723
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ hw/usb/hcd-ehci.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
+index 58cceac..4da446d 100644
+--- a/hw/usb/hcd-ehci.c
++++ b/hw/usb/hcd-ehci.c
+@@ -1373,7 +1373,10 @@ static int ehci_execute(EHCIPacket *p, const char *action)
+         spd = (p->pid == USB_TOKEN_IN && NLPTR_TBIT(p->qtd.altnext) == 0);
+         usb_packet_setup(&p->packet, p->pid, ep, 0, p->qtdaddr, spd,
+                          (p->qtd.token & QTD_TOKEN_IOC) != 0);
+-        usb_packet_map(&p->packet, &p->sgl);
++        if (usb_packet_map(&p->packet, &p->sgl)) {
++            qemu_sglist_destroy(&p->sgl);
++            return -1;
++        }
+         p->async = EHCI_ASYNC_INITIALIZED;
+     }
+ 
+@@ -1453,7 +1456,10 @@ static int ehci_process_itd(EHCIState *ehci,
+             if (ep && ep->type == USB_ENDPOINT_XFER_ISOC) {
+                 usb_packet_setup(&ehci->ipacket, pid, ep, 0, addr, false,
+                                  (itd->transact[i] & ITD_XACT_IOC) != 0);
+-                usb_packet_map(&ehci->ipacket, &ehci->isgl);
++                if (usb_packet_map(&ehci->ipacket, &ehci->isgl)) {
++                    qemu_sglist_destroy(&ehci->isgl);
++                    return -1;
++                }
+                 usb_handle_packet(dev, &ehci->ipacket);
+                 usb_packet_unmap(&ehci->ipacket, &ehci->isgl);
+             } else {
+-- 
+1.8.3.1
+
-- 
2.17.1

