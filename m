Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.84])
 by mx.groups.io with SMTP id smtpd.web09.2843.1607395100467072348
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 18:38:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TzlfajZW;
 spf=pass (domain: windriver.com, ip: 40.107.69.84, mailfrom: li.wang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WArNlx5//DX8vX/7ZdRPpSdYpv7l42Z6IE8TqH42qrk1LxdQO/C6545wbKqc2lcfVXRSKDt7Xj2nqxMc+8veK6XAK9PSTbFtz/gVfuIEJSyNGnlHRZM9ChfK2OYGImN0nSYO6fAIn2Fg7LO8YmXyKTZIGTwZzmXy8N9xbxEN2jSkiDtQoXLkEl02UkZFBOVb0a8ehyX6MNrRx54+Z2uJqw8wp4K1cdV5LJz9XHFlsUinEOxR+WyRrLmB3PoX0lp01g32jYv2h+ASJUvaSoveYvQYPWUaGscJl5BcaKMJZXouliemZmcLGUhnbRiVdAJ4BuE3+7LQI+30YeFrS9DdQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8lk8U3lHTbL/eMeLA2chG7fmdneLPH9HGW+UrpL/xE=;
 b=kT0xb9X77uH4gthkIvncqlTLhnsyUa9ve30zxvfJNrpdoyzQdHTvE/cjpqTL7YneC/Bu1Aot+RCpIeVz6EL77IfnlpbSRgq51XbY+zQADRQNhZpHVr911KqdYlWylOG0N2TNhX31GNFUKZggMOjFUXFxkVOPZBUDW9I0UtUk1oEVut9bFWBn5dON1EetefOa+QXxC2nEKme8Bqz0WNwIfzKlLQDUGhsW9kxKdOeQaSKDC0vmhPK0ILKdboxZVgezh02EmsK3vpB3VCimdzEbC81a7HHOIbbJsASquy1VKBzYk2N+uxNqAFtjXBaT9og1gYypQIbFkzwlJ9puqR8I3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8lk8U3lHTbL/eMeLA2chG7fmdneLPH9HGW+UrpL/xE=;
 b=TzlfajZWJ9RfvBDofXgwfW4f8rQf1SCGsvnx6Wt3fQVs0JObWLMqfx+Arso3n1See/20wj02Cdz6HnqX27cnrQTWCaAvdsNljZudaFw1HTg61lJH1aQN/dgsf+nB3lWejt/amnQhg1B/H5gtxhR6cMMAsQ1fD6RP0euNnghaI5A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3595.namprd11.prod.outlook.com (2603:10b6:5:142::16)
 by DM5PR11MB1673.namprd11.prod.outlook.com (2603:10b6:4:c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17; Tue, 8 Dec 2020 02:38:18 +0000
Received: from DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::68cd:2042:cd8f:3dbf]) by DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::68cd:2042:cd8f:3dbf%4]) with mapi id 15.20.3632.021; Tue, 8 Dec 2020
 02:38:18 +0000
From: "Li Wang" <li.wang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH] qemu: CVE-2020-28916
Date: Tue,  8 Dec 2020 02:34:48 +0000
Message-Id: <20201208023448.6222-1-li.wang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0205.apcprd02.prod.outlook.com
 (2603:1096:201:20::17) To DM6PR11MB3595.namprd11.prod.outlook.com
 (2603:10b6:5:142::16)
Return-Path: li.wang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bfbf5eb70dd2.wrs.com (60.247.85.82) by HK2PR02CA0205.apcprd02.prod.outlook.com (2603:1096:201:20::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 02:38:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75e390b3-2455-4396-f4ab-08d89b225218
X-MS-TrafficTypeDiagnostic: DM5PR11MB1673:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB16732B4E044C5D28BC85F705EFCD0@DM5PR11MB1673.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NDt0uYh67Y6tsjHKSXly9pSwL+TGwU5bHUKYs4YoJgFr9MfdDQnohEn574YLbX2GTil62RHNSrCyrfnfHZZPD2JWpygF17idZ0ykyAlky+HydCUdNxDFmfuGnpCV6021gpz041d3uC9qb+3E6GiTVQrut4TCivmGeUyyTNaUolnoG1UDSwQQn0l4B69/++bEu7IbFSK98KRqc2pZwSSw4OYs/8gs48EqpJUBDb4kqeKdrveyL3DIstWvxvW4Qs03K1nMPbygZ0GmMD1lK2SbGoFNRZTtWpSXbLH0AQoPyU7p5MZyYu6usegzCXeMpDVoNZC3/Mdl+DhjyHtTxcSc9E5k9qQG7aHw2EYEfXAE+f/CR5+OW+cE1582RfaqoNvYn3snJQaBZ2sKZ8T2tWX1W8bQfa2GwQPUgLAuZLPP9dFGdWoL4pjPZQnVYJPaZ7+t8u4une1NalTaKPGseUICww==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3595.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(346002)(39850400004)(136003)(6916009)(83080400002)(478600001)(66476007)(5660300002)(6512007)(8676002)(6486002)(186003)(966005)(8936002)(16526019)(52116002)(1076003)(36756003)(26005)(44832011)(86362001)(2906002)(2616005)(66946007)(316002)(83380400001)(6506007)(956004)(66556008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?l92H9NCjYvXj7q/XF5IoJeTYz1uQMFAKvgpg+HSfA0h1gNeAG9vWd0oddERi?=
 =?us-ascii?Q?MC82yn7St3ZyFHAZfpaOLwEgObZ3Ry+0gsq0C+FR8VtWq3qFl0OqPsWYIj96?=
 =?us-ascii?Q?wOTgW2u6z/W99g+oeIC+ECDNZGwUqFGYmBeLqZdqRgoomruxYBShJd/EoeQ4?=
 =?us-ascii?Q?GT62/uNj6wOnB8qP6kN/8irT8gFv/P5uqgTvFKfQa1c8YkR/dbbfNweYfmMz?=
 =?us-ascii?Q?KlK2ZYjEOGmz1B2v7SLa8r+SB1eTAjvJxQNzj+dvxzlKtJ0kyH3S3/a1v6za?=
 =?us-ascii?Q?0qHRJGeRz5FI/zJaBtNA6Z/7YwYR8vpi64QjMWe0uVdgwLh/WLuo24/wKY4N?=
 =?us-ascii?Q?5d2+z/FjMn/c72FbEFQ6/kg5KT+dxftGfNhWiw5M7Fd46k8qrk5EiFCgMReh?=
 =?us-ascii?Q?zYuA9Y1JN3gc3jrm0e5u7/i/HLWyLQTKZJSAt+sR5ByjW1cIyH1jLRsj45Ll?=
 =?us-ascii?Q?pwK+4f7oDF+aBAU9Hk+B6h8fsnN8KvCK0xjCm7qYyDRu4/JjA3caAOlGvoMf?=
 =?us-ascii?Q?r7HkslK5re1Xrd5z6pQGD2QKXXaNyuaRWJ+5C0R+PXVhwixD1n7ST0NMGhsX?=
 =?us-ascii?Q?4V4eq34dd1t084DFqfMMECdUxORLwQyP7vQGWdydUNJb5ecu61ZIbg4szF4I?=
 =?us-ascii?Q?ZCiYecnr0ALi5SCchflyC8MYT12O3fPqd+wU7q/PjqKlY8Ij8BkJs/yqFz38?=
 =?us-ascii?Q?HumrZY9v9hRVOioF37S/mkTHJzhkut9CGO11xuETj0DkMTTVLJdpCww334Z+?=
 =?us-ascii?Q?o7zb8DjYLwV52UuaT77AHpNAW7G5oHDLA4Ybss0/vIQWMBMtjlzoaJw/80xX?=
 =?us-ascii?Q?EwTbdon0ezTXlswaWpByKfZuKFXXqCOvlW/4qbdesO/npTL2SFS2hcEin0vM?=
 =?us-ascii?Q?82Kwmww6wA5WEqohvnPpvYk6nNJdz0f8lgZ2SNsrBTCkdrKp8Gj8gIx5WqmR?=
 =?us-ascii?Q?mb2l24Yf59c0Erz+9cuAsYG6IwGLKe/r8Zjtc7nzOvo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3595.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 02:38:18.0526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e390b3-2455-4396-f4ab-08d89b225218
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GO/6RevH30DIRWrmd61j3JgNCg/YAHvVRjR07aYDvKqtbqv8AUg+jRaJYdI61aDD3f3pkX4X7YI0VLTt99CAMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1673
Content-Type: text/plain

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-28916

backport patch from:
https://git.qemu.org/?p=qemu.git;a=commit;h=c2cb511634012344e3d0fe49a037a33b12d8a98a

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-28916.patch            | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ecff54d61d..69b9a5f89e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-29129-CVE-2020-29130.patch \
            file://CVE-2020-25624.patch \
            file://CVE-2020-25723.patch \
+           file://CVE-2020-28916.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch
new file mode 100644
index 0000000000..5212196837
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch
@@ -0,0 +1,49 @@
+From c2cb511634012344e3d0fe49a037a33b12d8a98a Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Wed, 11 Nov 2020 18:36:36 +0530
+Subject: [PATCH] hw/net/e1000e: advance desc_offset in case of null
+descriptor
+
+While receiving packets via e1000e_write_packet_to_guest() routine,
+'desc_offset' is advanced only when RX descriptor is processed. And
+RX descriptor is not processed if it has NULL buffer address.
+This may lead to an infinite loop condition. Increament 'desc_offset'
+to process next descriptor in the ring to avoid infinite loop.
+
+Reported-by: Cheol-woo Myung <330cjfdn@gmail.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-28916
+[https://git.qemu.org/?p=qemu.git;a=commit;h=c2cb511634012344e3d0fe49a037a33b12d8a98a]
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ hw/net/e1000e_core.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
+index bcd186c..d3e3cdc 100644
+--- a/hw/net/e1000e_core.c
++++ b/hw/net/e1000e_core.c
+@@ -1596,13 +1596,13 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
+                           (const char *) &fcs_pad, e1000x_fcs_len(core->mac));
+                 }
+             }
+-            desc_offset += desc_size;
+-            if (desc_offset >= total_size) {
+-                is_last = true;
+-            }
+         } else { /* as per intel docs; skip descriptors with null buf addr */
+             trace_e1000e_rx_null_descriptor();
+         }
++        desc_offset += desc_size;
++        if (desc_offset >= total_size) {
++            is_last = true;
++        }
+ 
+         e1000e_write_rx_descr(core, desc, is_last ? core->rx_pkt : NULL,
+                            rss_info, do_ps ? ps_hdr_len : 0, &bastate.written);
+-- 
+2.17.1
+
-- 
2.17.1

