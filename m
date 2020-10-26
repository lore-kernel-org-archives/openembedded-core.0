Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.52])
 by mx.groups.io with SMTP id smtpd.web10.10043.1603700959347005774
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 01:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RsTLV8P4;
 spf=pass (domain: windriver.com, ip: 40.107.93.52, mailfrom: li.wang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/Hg+s9RWi3SW8FHnQ5Rwg0EIswOKcXKuiTsXYvOj+xdnzqiJOZVJgYvSlBXamj0Y92IR7nGeEB5bCqCMEq3mwYR8GmSuenyZ7q0i/SzbIL22vFfnome9zChLdB/VUzc8jQkR8N6SI+W/TXWssGDwN74R9cN+P6R0fDMO+X/YDZDsRsj9q8U7lBFKi5TjsttuNp+Qe7bZNwEAw1pbjr5+8rcncdhB0AI3KJHuVxXkfhIwXU2n4tJzR4TbZNgdyyPEOpkteDLEuBao6QEb/q1YStryXwryG+xuz3fHHUHAPjco+WzKXEygQ3HT/d2vloBQmrP3o/2syQgOi+z8oljgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeCUrNONoaptmYagCmse1KGjSkGyP0aFJfEVLskyTv0=;
 b=jRES2D7LG1tlxqkULMdQuDjr5L/8uqFBcVpg1r7Zb39CebpHnPTbh/82MuEw3zHknb7VOAX0r82UkBcmIw77dxEgJSZSNw1s1LXja9wXaDNEpVFVwygfv2SEQU6fnYjRAuhsL+/aJQnEgwI8iTvX0fuGauLhFB5NKNTM1j07tBH5rNCHWX5exGyH/Ya4objm0QCJFUPHzDCj66pXmAT2PouFz03Dn3ZIN6jnpwIYECqzi6nLqaS1Yk1H6ERCMdk8ezcbkn4X0LFOcxpXPh7Sjm2pDBECgdq/EoBkGOwOw7Zq0npYRpN+3Y/qbfJPuGMSCKgzpF3Tm24zmu8m83NzNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeCUrNONoaptmYagCmse1KGjSkGyP0aFJfEVLskyTv0=;
 b=RsTLV8P43n7faS8Q5Wq65FepxC7+6gzl4ZU01f1qpo9xSNlfG3ny0MVho1wpfuG9W7uKmztQXWNzvghMe70rpNe5zzL4uGm/P6qp6pNiDOvb6rvsUmU10SgdFTNrRtTn/PApgSLrdkHs3IfqtrCCjdrqqDYJBWrf6B50P6Hsn24=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3595.namprd11.prod.outlook.com (2603:10b6:5:142::16)
 by DM5PR1101MB2268.namprd11.prod.outlook.com (2603:10b6:4:53::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Mon, 26 Oct
 2020 08:29:18 +0000
Received: from DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::54c6:c8e4:c594:eada]) by DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::54c6:c8e4:c594:eada%6]) with mapi id 15.20.3499.018; Mon, 26 Oct 2020
 08:29:18 +0000
To: openembedded-core@lists.openembedded.org
From: "Li Wang" <li.wang@windriver.com>
Subject: [OE-core][zeus][PATCH] qemu: CVE-2020-25084 CVE-2020-25625
Message-ID: <8650922d-9db0-89a4-8b4f-ed409237e74b@windriver.com>
Date: Mon, 26 Oct 2020 16:29:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0103.apcprd03.prod.outlook.com
 (2603:1096:203:b0::19) To DM6PR11MB3595.namprd11.prod.outlook.com
 (2603:10b6:5:142::16)
Return-Path: li.wang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.152] (60.247.85.82) by HK0PR03CA0103.apcprd03.prod.outlook.com (2603:1096:203:b0::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Mon, 26 Oct 2020 08:29:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 688337d7-cf45-4c63-ebe8-08d879893ad4
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2268:
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB226887B110AAF0F369D4408CEF190@DM5PR1101MB2268.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:161;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UTm/mR6vB+M91i5prEtyxm6cq+oa8cmu2oRdLMnsiuKfrtsttDwM19FVeYxkeWQxVXea5rcFkAD1yymnDmSlNr3l385gZKmRlWkyFAealiE9Ob+qKOmx2AsyRH99mn6qb756nOr8QclP/+v1sTq0PxTY1rASGXXGMyFE6LtCk3cjwRSsjmkx9fZFjGd0RDGdDWkHTssgYv0xFihhOLZS+NxaIr+8D9blyLs/Po3WF7XMc7VD+/6DQjfGT6VbO/MmOLls0Uk4LdebdnEKv/qDJBPIRijgxTHaPst8ONzjlXA5oRqru30CffAeZnW5YXg3/I/hLaL5OHjaCPqEhdBEe5JKqvW9xBM7C2qL00rZpPV0BJvCTPlKqVpU919aYNQElv0IqOPR0Vt6b7jq4k/ahvOa5ZM0rxufyfi828z4IFAo2+12eHbnZhvDUKkSH6aF61YSRRoBU76R1Y+UmuUOr/INW5bmO1yfJlDIfrSLS5g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3595.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(366004)(39840400004)(16526019)(8936002)(6706004)(8676002)(16576012)(31686004)(52116002)(6666004)(316002)(966005)(83380400001)(6486002)(86362001)(186003)(6916009)(66946007)(31696002)(478600001)(26005)(956004)(2616005)(66476007)(2906002)(36756003)(66556008)(5660300002)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	uZhZ5pD1F8lI24i9g7139CVeQrq1Tq78XWdplik3g+CSamY79eVutaZoFJPLd3bOO97/Z28m7Fd7/GyfKZyz38r+66wImcIizFXDLmohhIUErZKqyVumCrKzV94pJSvlKMpOnMwreck6ID4zxaDqOJ9ZrsoCGiwmLIR+3w43OgEPvkbQftSXOSSZpFoOAbEXzGsg+n2qEjvM2/OD2NEj/CgE+3hz01Ca0FiGJ0glNw3icxDZqaY7Vt04t9+wUl8W6wWEmIUGgfNcQKUnMgnJTDCH2pF7+A+YUkZonnXTLTQjyRfEDx6qt5QUvGgIxk9AIPi5scavjyMU2PyZ3oi0+Jo55yYpSYVl2gABhuMTBYRnc6n+mKxxTlnXIKiDnY7nekYqDaCkUnvaOC9+tios2zpl1eIZzj5t0BrgDsgw1INUwtUIdGsoa9I+X7hvN9ShED4DJ+LQyqbnrrwJvuWwzF8bZ/Nz/9PUCyBeMA4LuUhSEFWm56Ob2Cpns5xkxX39oA4UfebQp+pc/7R/k2GvFjAGKrlAhHMkPCWbbQo4TgB5fg3pzRma/uuXlfVWnuaL4Q4yvDTNrXQLnoL02hhKhc1cgxP8QV7l5L1Ph/dLoHG5PqrYeOrtbG/XBiGXELrlspJ/UA8YI0MfxDffN/wsRQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 688337d7-cf45-4c63-ebe8-08d879893ad4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3595.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2020 08:29:17.9886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AdSjrTn+/0YEL+VkgoSSDKwpDBk8ZZr7k+NsLOI4XxPc3rspKEYgkAudNMynmsuRFmr01J4jRxNy0BWQnlL3zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2268
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit

backport patch from:
https://git.qemu.org/?p=qemu.git;a=commit;h=21bc31524e8ca487e976f713b878d7338ee00df2
https://git.qemu.org/?p=qemu.git;a=commit;h=2fdb42d840400d58f2e706ecca82c142b97bcbd6
https://git.qemu.org/?p=qemu.git;a=commit;h=1be90ebecc95b09a2ee5af3f60c412b45a766c4f

Signed-off-by: Li Wang <li.wang@windriver.com>
---
  meta/recipes-devtools/qemu/qemu.inc           |  3 +
  .../qemu/qemu/CVE-2020-25084-1.patch          | 79 +++++++++++++++++++
  .../qemu/qemu/CVE-2020-25084-2.patch          | 51 ++++++++++++
  .../qemu/qemu/CVE-2020-25625.patch            | 42 ++++++++++
  4 files changed, 175 insertions(+)
  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25084-1.patch
  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25084-2.patch
  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25625.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc 
b/meta/recipes-devtools/qemu/qemu.inc
index cbade92ac9..8f2d9e824b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -44,6 +44,9 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
             file://CVE-2020-15863.patch \
             file://CVE-2020-14364.patch \
             file://CVE-2020-12829.patch \
+           file://CVE-2020-25084-1.patch \
+           file://CVE-2020-25084-2.patch \
+           file://CVE-2020-25625.patch \
  	   "
  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-25084-1.patch 
b/meta/recipes-devtools/qemu/qemu/CVE-2020-25084-1.patch
new file mode 100644
index 0000000000..180f061d69
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-25084-1.patch
@@ -0,0 +1,79 @@
+From 21bc31524e8ca487e976f713b878d7338ee00df2 Mon Sep 17 00:00:00 2001
+From: Li Qiang <liq3ea@163.com>
+Date: Wed, 12 Aug 2020 08:31:39 -0700
+Subject: [PATCH] hw: xhci: check return value of 'usb_packet_map'
+
+Currently we don't check the return value of 'usb_packet_map',
+this will cause an UAF issue. This is LP#1891341.
+Following is the reproducer provided in:
+-->https://bugs.launchpad.net/qemu/+bug/1891341
+
+cat << EOF | ./i386-softmmu/qemu-system-i386 -device nec-usb-xhci \
+-trace usb\* -device usb-audio -device usb-storage,drive=mydrive \
+-drive id=mydrive,file=null-co://,size=2M,format=raw,if=none \
+-nodefaults -nographic -qtest stdio
+outl 0xcf8 0x80001016
+outl 0xcfc 0x3c009f0d
+outl 0xcf8 0x80001004
+outl 0xcfc 0xc77695e
+writel 0x9f0d000000000040 0xffff3655
+writeq 0x9f0d000000002000 0xff2f9e0000000000
+write 0x1d 0x1 0x27
+write 0x2d 0x1 0x2e
+write 0x17232 0x1 0x03
+write 0x17254 0x1 0x06
+write 0x17278 0x1 0x34
+write 0x3d 0x1 0x27
+write 0x40 0x1 0x2e
+write 0x41 0x1 0x72
+write 0x42 0x1 0x01
+write 0x4d 0x1 0x2e
+write 0x4f 0x1 0x01
+writeq 0x9f0d000000002000 0x5c051a0100000000
+write 0x34001d 0x1 0x13
+write 0x340026 0x1 0x30
+write 0x340028 0x1 0x08
+write 0x34002c 0x1 0xfe
+write 0x34002d 0x1 0x08
+write 0x340037 0x1 0x5e
+write 0x34003a 0x1 0x05
+write 0x34003d 0x1 0x05
+write 0x34004d 0x1 0x13
+writeq 0x9f0d000000002000 0xff00010100400009
+EOF
+
+This patch fixes this.
+
+Buglink: https://bugs.launchpad.net/qemu/+bug/1891341
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Li Qiang <liq3ea@163.com>
+Message-id: 20200812153139.15146-1-liq3ea@163.com
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-25084
+[https://git.qemu.org/?p=qemu.git;a=commit;h=21bc31524e8ca487e976f713b878d7338ee00df2]
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ hw/usb/hcd-xhci.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
+index 5894a18..6314141 100644
+--- a/hw/usb/hcd-xhci.c
++++ b/hw/usb/hcd-xhci.c
+@@ -1614,7 +1614,10 @@ static int xhci_setup_packet(XHCITransfer *xfer)
+     xhci_xfer_create_sgl(xfer, dir == USB_TOKEN_IN); /* Also sets 
int_req */
+     usb_packet_setup(&xfer->packet, dir, ep, xfer->streamid,
+                      xfer->trbs[0].addr, false, xfer->int_req);
+-    usb_packet_map(&xfer->packet, &xfer->sgl);
++    if (usb_packet_map(&xfer->packet, &xfer->sgl)) {
++        qemu_sglist_destroy(&xfer->sgl);
++        return -1;
++    }
+     DPRINTF("xhci: setup packet pid 0x%x addr %d ep %d\n",
+             xfer->packet.pid, ep->dev->addr, ep->nr);
+     return 0;
+--
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-25084-2.patch 
b/meta/recipes-devtools/qemu/qemu/CVE-2020-25084-2.patch
new file mode 100644
index 0000000000..64dc343237
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-25084-2.patch
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
+CVE: CVE-2020-25084
+[https://git.qemu.org/?p=qemu.git;a=commit;h=2fdb42d840400d58f2e706ecca82c142b97bcbd6]
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ hw/usb/hcd-ehci.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
+index 62dab05..418d102 100644
+--- a/hw/usb/hcd-ehci.c
++++ b/hw/usb/hcd-ehci.c
+@@ -1370,7 +1370,10 @@ static int ehci_execute(EHCIPacket *p, const 
char *action)
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
+@@ -1449,7 +1452,10 @@ static int ehci_process_itd(EHCIState *ehci,
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
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-25625.patch 
b/meta/recipes-devtools/qemu/qemu/CVE-2020-25625.patch
new file mode 100644
index 0000000000..884633867e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-25625.patch
@@ -0,0 +1,42 @@
+From 1be90ebecc95b09a2ee5af3f60c412b45a766c4f Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Tue, 15 Sep 2020 23:52:59 +0530
+Subject: [PATCH] hw: usb: hcd-ohci: check for processed TD before retire
+
+While servicing OHCI transfer descriptors(TD), ohci_service_iso_td
+retires a TD if it has passed its time frame. It does not check if
+the TD was already processed once and holds an error code in TD_CC.
+It may happen if the TD list has a loop. Add check to avoid an
+infinite loop condition.
+
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Message-id: 20200915182259.68522-3-ppandit@redhat.com
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-25625
+[https://git.qemu.org/?p=qemu.git;a=commit;h=1be90ebecc95b09a2ee5af3f60c412b45a766c4f]
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ hw/usb/hcd-ohci.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
+index 4f6fdbc..ffe52a0 100644
+--- a/hw/usb/hcd-ohci.c
++++ b/hw/usb/hcd-ohci.c
+@@ -689,6 +689,10 @@ static int ohci_service_iso_td(OHCIState *ohci, 
struct ohci_ed *ed,
+            the next ISO TD of the same ED */
+ 
trace_usb_ohci_iso_td_relative_frame_number_big(relative_frame_number,
+                                                         frame_count);
++        if (OHCI_CC_DATAOVERRUN == OHCI_BM(iso_td.flags, TD_CC)) {
++            /* avoid infinite loop */
++            return 1;
++        }
+         OHCI_SET_BM(iso_td.flags, TD_CC, OHCI_CC_DATAOVERRUN);
+         ed->head &= ~OHCI_DPTR_MASK;
+         ed->head |= (iso_td.next & OHCI_DPTR_MASK);
+--
+2.17.1
+
-- 
2.17.1

