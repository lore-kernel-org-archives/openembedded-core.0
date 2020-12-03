Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.64])
 by mx.groups.io with SMTP id smtpd.web08.6202.1606974599441304267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Dec 2020 21:50:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=E2AX3LPF;
 spf=pass (domain: windriver.com, ip: 40.107.244.64, mailfrom: li.wang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+jv14NOO5BQw4HKcjbdqOW6u3PSelj4xknH8MdzgSEDyhdy8yCcXaWm4x63lq5dKvs/8ecAxWce7VmBZXsF92AxwA6LlhKkMFRt5d+EmhZtXjbAu5uPLxl3hrZLX7+2qkfs1QVJQASnRxkOzDPM4F2kg4wl5RGS3NYAOWUYTnPD6YKx99qxd2RZQElwShAYJJIveI5IbTuFJOBe/EpWI9Q0CojEvF4y6WPz0oRNVR+95iLZLF++a3SE1zz5KaN7i6SH0vwyj9tpWFpfHFSKBG0m1SttO3M+tLRbVUIUgJiPfwfumlLe3w2A9zhegrxaAV6KgJ3lfJCXdJRvp0IL4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLTeQhLX1eKl8Wo2SwWiPiUQQ87Q4kdpHbr1XUtB3mM=;
 b=enTA4AYhf/MMtEvoJGHNQe3UbG+gdb/dJyvd4n9Pya8R6Ax+P22joiBk9D29wjzD2pLW6PUYRZFBVzp1A0WlnFGDK9ieVzybvwKrs1KG0YcSJ0qt4hZH7o4tfnUowI+cPjVtMASsd5TJubKNy0y/xCKEeL6+zYV46JflTrnbAAdJlhkOqJLTNxXM+qF662dHe6El31ap+tn2qbrlBtq6MaDJbRkga2PDYDPb4DRF34bjW0KWdTNhVQIm6M8QMrIgHM4hl3uvCZAUXyCyVist1jo+fyqT0hbgSwdyRiAP0gSxLHpwicLsuKR3g0uyu50VtudqOKEvLniOs3qEWGuP5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLTeQhLX1eKl8Wo2SwWiPiUQQ87Q4kdpHbr1XUtB3mM=;
 b=E2AX3LPFcQo8tiJFVGs3YwIXJpaXOJXIcQsji9r8MlPFJrWbdsHGifARGXBdbw7Xh8nXrczVXaYn1vsUqP/K5H+fX3UpYMg+S0pSpgQNL/rpTuHLw5nOnlqobXhnaHEtCOi5uY7ifu8djcW/crSLHDDcQQ82cP2z92P6ybc/T7c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3595.namprd11.prod.outlook.com (2603:10b6:5:142::16)
 by DM5PR1101MB2268.namprd11.prod.outlook.com (2603:10b6:4:53::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Thu, 3 Dec
 2020 05:49:56 +0000
Received: from DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::54c6:c8e4:c594:eada]) by DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::54c6:c8e4:c594:eada%6]) with mapi id 15.20.3611.025; Thu, 3 Dec 2020
 05:49:56 +0000
From: "Li Wang" <li.wang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH] qemu: CVE-2020-25624
Date: Thu,  3 Dec 2020 05:46:30 +0000
Message-Id: <20201203054630.17811-1-li.wang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0048.apcprd04.prod.outlook.com
 (2603:1096:202:14::16) To DM6PR11MB3595.namprd11.prod.outlook.com
 (2603:10b6:5:142::16)
Return-Path: li.wang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bfbf5eb70dd2.wrs.com (60.247.85.82) by HK2PR04CA0048.apcprd04.prod.outlook.com (2603:1096:202:14::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 05:49:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67cdf177-172b-4973-c75d-08d8974f4352
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2268:
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB22685C2B8F1F2D95DCCC433AEFF20@DM5PR1101MB2268.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FvQ4EbTUhvyDXYys+XvLS4wzcksePCRkGUel1DA6cB4BW9lrW/zuZyFT0LsykgJHozOqCyevZTaXrRJ161WKwGIjYrMD+WZCM663D2VJHpUJqXK0nMXab/9Qqh1C+HmSgPaE68BvlibNs6sSVaUU33aBfkjUXV2gwBZvfoblHoKX3KzRvr2SZsBkembhjDvRIDTalYgw8zNjmcYjddabAQewkEGSmUK7VXt60iBBOYJfcxHEMs+LPkj72TlepG+dx22mtTXVoNDXHxNbEoPa0ZFuBD+LefU35NiJK9l9IdIMJIDFA0jsruY4DMYwc/SgTJz9bkz8lfoBWQaXj8VPKabfQWi3i+h3s9zkkLCx4VFTbyKOtSlvQTcIcskSOiszTGLYL7GDKSQYc0UHxEd+uG9qeCP42JUOAR55JAqBw3Odvg3h9JZgqeuUN9f5+d54frfM4ScUdCSTYLS83wmBEw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3595.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(16526019)(186003)(36756003)(66946007)(6486002)(6512007)(5660300002)(26005)(8676002)(66556008)(316002)(66476007)(6506007)(1076003)(86362001)(966005)(2616005)(83080400002)(52116002)(6916009)(2906002)(6666004)(478600001)(8936002)(83380400001)(44832011)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?LvVZ9JyTys0faWV8yGWTIpQYoQnPOz3Rg1uwTMjvDxmI9BpJCmzobuK94Zna?=
 =?us-ascii?Q?25Kt7JyTFDZ0RLDQvjr+K948ib9w30KlKJnAxVJ+CZTr/44/A2a452kS7rt2?=
 =?us-ascii?Q?E6knict8vL7ZaxLrgRhJkVTZQ/n9N/JwuPNpS1P38h/jGVKovp5aOb0MhFth?=
 =?us-ascii?Q?IXTb5JHZ+D+JRZ5+o3YxoOSGQdWYzCJb92wJqVXy9yDJJDDTtehdhqt7q0zc?=
 =?us-ascii?Q?EKZ1Kw9Ndz779YrZok+yKk09Kn41UMgUzjYdqtmDGLxKNBd2P3Fa+gBO2q4a?=
 =?us-ascii?Q?vHZRcrcktVHJSUqZyzTnMqot5s1QElw6dSk+jdRkZOJhfu9DMVodpjlm1Nr1?=
 =?us-ascii?Q?0niFZ6I70F8zkgf5wL7zZVlKAN3nHo7J1ddeKCnF8dPZz+AIx+bBHcSHcOUH?=
 =?us-ascii?Q?Z51ve1gldwkSKxUbavVI1/oGIelrf19c471lg+hqXrKCaE/T/FC+6WncV7i6?=
 =?us-ascii?Q?DLLpuJMTidkLn17H6bwdl5bU6JApS4WJE8z9Fng5JcPNo9Tw9OMxId1+s024?=
 =?us-ascii?Q?2VrijL5A4f0FhZ0Z9hDsGGqCNCOW0n5GF0q974nsaRE6UopiqjLpW6Ez7bkt?=
 =?us-ascii?Q?UvHlwBoonfZxk4QLp5XITQ/g8ofzwMMUU1O89zrzkyw+N5tdyUDt1YlxMycd?=
 =?us-ascii?Q?7sZIRHli46WH+nXtyYtllg5uy8nV/+PTLnbInqGtRT36gPB55RDJPeZ/QmZI?=
 =?us-ascii?Q?g1z2O0bAdiIww4iF0aKAxUfAQMKIzYASLozYagJMy0huL+3jngOZfpmY8gsM?=
 =?us-ascii?Q?T3gT1vP5hHO9lwLz+sVMtCugGPYuH2icWbmrCc2qw1SLlnh4cVF5cxDCthxS?=
 =?us-ascii?Q?evV9DoiNFKsHb7oV0X/kRBz65FBh35fmti+XlJU8HznuZFS2vE2EHRR2whmT?=
 =?us-ascii?Q?kWlM7aU/5CrzRuSgY7V9cdONWzRQ7gkoFoqijezUFPS3O6gi+bRdXde/uM7d?=
 =?us-ascii?Q?qiNs2OsRxxmClsUFZU21Mz+SrkUFuv/adRaaC40+3uv1/hL3/Dgw97TpugTX?=
 =?us-ascii?Q?mb6a?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cdf177-172b-4973-c75d-08d8974f4352
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3595.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 05:49:56.5451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /D3m1F6kWlzDf0zUUx/sv2FCanrSkwgtBnnhb09uA7T8Rb82e7gfHU2kmsPBQFRi+pPKAjRVRfa20xK1LCJcIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2268
Content-Type: text/plain

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-25624

backport patch from:
https://git.qemu.org/?p=qemu.git;a=commit;h=1328fe0c32d5474604105b8105310e944976b058

Signed-off-by: Li Wang <li.wang@windriver.com>
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
2.17.1

