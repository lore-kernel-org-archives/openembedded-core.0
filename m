Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3706.1610079500392423505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: IYFUVT8/iGGX4bmYz/d/ShBgsRnuRFXwoqXfLbEM23iuHZQ9rSJ5jz/EO00EndYAIgumTp2wAr
 u2tthxm8dybw==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613669"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613669"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:35 -0800
IronPort-SDR: /3SbglTh4pci3zKk6/ghHtYO6K9Pu358Sxfc9UWycS0B5mdMKf/Wn6sBGJD55gPItuYHXfS0Ay
 aoFC14QpufNg==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209432"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:33 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 12/30] qemu: CVE-2020-25723
Date: Fri,  8 Jan 2021 12:17:54 +0800
Message-Id: <cb41f6656631c15d0996791bce0ac4b7d25adcc9.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Wang <li.wang@windriver.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-25723
https://bugzilla.redhat.com/show_bug.cgi?id=1898579

backport patch from:
https://git.qemu.org/?p=qemu.git;a=commit;h=2fdb42d840400d58f2e706ecca82c142b97bcbd6

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3a52f12bd08bd6f0e386c78f9f87acacdb7714cb)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-25723.patch            | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 274c855d35..ecff54d61d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -35,6 +35,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-24352.patch \
            file://CVE-2020-29129-CVE-2020-29130.patch \
            file://CVE-2020-25624.patch \
+           file://CVE-2020-25723.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch
new file mode 100644
index 0000000000..90b3a2f41c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch
@@ -0,0 +1,51 @@
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
+Upstream-Status: Backport
+CVE: CVE-2020-25723
+[https://git.qemu.org/?p=qemu.git;a=commit;h=2fdb42d840400d58f2e706ecca82c142b97bcbd6]
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ hw/usb/hcd-ehci.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
+index 1495e8f..1fbb02a 100644
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
+@@ -1452,7 +1455,10 @@ static int ehci_process_itd(EHCIState *ehci,
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
+2.17.1
+
-- 
2.29.2

