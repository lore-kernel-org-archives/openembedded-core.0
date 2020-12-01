Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.77])
 by mx.groups.io with SMTP id smtpd.web08.4211.1606789219876187789
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 18:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fI7dMb+q;
 spf=pass (domain: windriver.com, ip: 40.107.243.77, mailfrom: li.wang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2pdSrfQo03Vn/AlOqpsjJFnA2Xe//z29NHPl+Ib+/gGnNf70qsyy2d7bqCOq03dnUV9cdTIRe95M6h9NMKmzGwLLxMUbP449smvG7D0zaOpywgsA47z384uZqHG78O154qGHVQ9C4zTgnYNKRINJj4w+Sh726WPikvSldmjBSyyumacoJd/r5i0h9iJMyuQg6TIbZ/MPy7mkse7qpbldpdF3Lvdw8tCS0NIrm/ky0aHpITN2s95HN+t61EyABGQlMN3FZE5NtlR5xlnYQrrmtG124JUvSfmEV/Lerf+FnXRu+Nn+EOFrMQvZMSEbxW33NnagJ/cuL+5CutGReV5xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDPkVmx60V/V3ivp1GU1eDNvXZ09q/xMHCPg9vLFRwM=;
 b=Sp5iLZXk5pRZbiS1ez/rqnKXn/jUtViHSAmdfVDb4hUUHILS3HAYytjR6MGSrJ4dnH1kZPHoDtHMR86BR6gwDN6lN7UaZD1XD0TV1muX6zMV3MClMULTvWZ31HskVr+PatLRf7RESjiTUo3Yta6YDJVaUaY5gvGJi4fPFCi6A+LGgyL0udNNrfQ9wER4Uju+hA3GinkX9qRMumYAwTU+I7df4FN0pdhgbFJbQjonv307bPxigNGYrsaMslhCLm+1i5j+yqlJL5NWeVI2xGuK78VhgYSIRykbdktpKq3Qz90avs6JrEVTMaQz3sNWKqicVXU2I9vgBFuZhD+I5FYmoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDPkVmx60V/V3ivp1GU1eDNvXZ09q/xMHCPg9vLFRwM=;
 b=fI7dMb+q1oH9jgwKzw8g5iFIKlfcdfwnDqfZelX7n73qM8zql0OWzVljsABEX2mUXpe5opI/AwmCWJL+4OO/dqxEbpZkHb6dLbx59oUOkgT2usYBZF6U9ccaRAEGBgVgpYY0PixvLfLHx5WoWVCSwMGa3QKQmsOIlD0HAm/5vGY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3595.namprd11.prod.outlook.com (2603:10b6:5:142::16)
 by DM6PR11MB3995.namprd11.prod.outlook.com (2603:10b6:5:6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.25; Tue, 1 Dec 2020 02:20:18 +0000
Received: from DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::54c6:c8e4:c594:eada]) by DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::54c6:c8e4:c594:eada%6]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 02:20:18 +0000
From: "Li Wang" <li.wang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH] qemu: CVE-2020-29129 CVE-2020-29130
Date: Tue,  1 Dec 2020 02:16:54 +0000
Message-ID: <20201201021654.327-1-li.wang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0068.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::32) To DM6PR11MB3595.namprd11.prod.outlook.com
 (2603:10b6:5:142::16)
Return-Path: li.wang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bfbf5eb70dd2.wrs.com (60.247.85.82) by HK0PR01CA0068.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Tue, 1 Dec 2020 02:20:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63fc7854-5719-422b-a1b3-08d8959fa55f
X-MS-TrafficTypeDiagnostic: DM6PR11MB3995:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3995B9737C1A8A5D960DFEA4EFF40@DM6PR11MB3995.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xFKaEihRVCSWgmyZuIZP6v8kAR84p38sW6ypT9OkCzVntPNkMS8ewO2ESEXbzfPVCkVS382Z+O8s9vnlHYVD5RzwsbBgFeU5Y769L+3Qnq71iwJ4iJC2ttRUllPcBMNc2vq9mXTd7kMiDoIYhAWLXqTyX1ReKgm9tHkTwd1zKaEDMGIQXO16xA73x0/SU2aSVNktyLLRjJPpRJKAqkBF3naVGQZKHoeLQz/11r/6u2X9I2r+CY23guBqbuUFcVBJjaGLCo/HQEJHhFo581pjSCoYoMyGpz7fHA8cz/UCnLRN+dexIIFyZem5My5locN/HUW5+Qnhs3M3ZqmZsIR3Vbg1jTU8a0pSbPmO5B9ilFO0vyfB4ZOOBv5ahu212yy/qufo/owAVu3iYIwscD/yXzz9j5kTYIaja9j+tP4vmm0FqTbz9KqQK1fg1Vxgmoo6ZwvOhKe7cLFlpNcTVK1LTg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3595.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(66476007)(45080400002)(186003)(16526019)(26005)(966005)(36756003)(86362001)(66946007)(478600001)(83080400002)(66556008)(5660300002)(6666004)(1076003)(316002)(2616005)(2906002)(83380400001)(956004)(6916009)(8936002)(8676002)(6512007)(6486002)(6506007)(52116002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?/dySko/2KMwz6axUTnLCvyT5ysVSUNnS1NJ5ASRVhsIPHRlZmmHaYycxRDYz?=
 =?us-ascii?Q?ahbMj4rlQh+HYAnNv8SgSQCTCA3NmaVj66ovSeAkXQY9DLB4NV1CgAajdgOZ?=
 =?us-ascii?Q?Vgz7g9eA3NP0UKG+vfgnbEAIhEoiGimkTMRSgmCeKmCQ34t1g08jq9qUiioe?=
 =?us-ascii?Q?ThouJ3HMc2i7csIYUo7TVNk6wX/uf0UqcWa6M1cFh0GMOYotW4VPHxKOLNre?=
 =?us-ascii?Q?XxwyM38a6GGcZNxV8XjwDbQpyGLpLY3kdbb6xWm/btnwO8721Lwu539vyXgI?=
 =?us-ascii?Q?B7nkY2muVza5RPIjAAi17I/512MDiB/MsXVSsUxPkOMCyHII5KhYSsS6VYAX?=
 =?us-ascii?Q?avFxP8C1Q4PEs9ehR6ZoLAx7chTA0dzyxA7evJeOFJhN8DjPMzFiEjipmZvJ?=
 =?us-ascii?Q?3n3ogRepC131KbSKeZSsQCsJ3Z7QZQlwu0Ik/8GZD92XWF7AsHZBWWDqWKSL?=
 =?us-ascii?Q?Y+SevUSkpebjsu3JEU/uYVtgu5A7WqPWkwSvNRXQlu2hsosUT7OMq38IK+A+?=
 =?us-ascii?Q?VJK1Wy0+qCNGUnv5t5VJj4/B/PTogWPjf9GVbddFhhxicGnpIC+G7kTX7a7p?=
 =?us-ascii?Q?ve5WX2KeedUiIeDz0oCH59OS5Kf61ilAT37Hih7S20z50ar57CoNsEL4aDN8?=
 =?us-ascii?Q?BHRrmMbkDfNWcqvZ7Rix9x/FG1+JNfkuzUzxedRHMQWBTcrqMS2mwh5Iefp5?=
 =?us-ascii?Q?VyW0H/A/BVaVqpm6bM6Gh5byJzBV+4EMjYH9p82acFTYwuW2dwIwNooi9JyK?=
 =?us-ascii?Q?Yrb7NucQEB/YrBpTQ+Rd9wH8pmshoMqYNVQmnIcBuPmnXOSr0BjHPvFtu8Pj?=
 =?us-ascii?Q?JvO50Rx0t5Tck4zNDjXG0xqrNXJMFdpuDayuDl8ockV9U/tXKX37gzjiamYP?=
 =?us-ascii?Q?PSDhueQskJk9x/xaeHZhi3L7DkmqtRON3rUEpnHUwdH4Mvh4ZE0VdnK/UAgr?=
 =?us-ascii?Q?cC6lD1siCBavoZ/aLx4Hxy8Ff8xm60OvyGJovzVqHWLI0R4PomvaGJO3fWFD?=
 =?us-ascii?Q?sjyD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63fc7854-5719-422b-a1b3-08d8959fa55f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3595.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 02:20:18.2690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Hexo/6imeFCj94DGtMMbwTvvPMkKxUbv3JG8pAxQOk+tqQAk2WQNkJ6ivC1kZBz5OFtTSUfpFEs0O7/M6YYdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3995
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-29129
https://nvd.nist.gov/vuln/detail/CVE-2020-29130

backport patch from:
https://git.qemu.org/?p=3Dlibslirp.git;a=3Dcommit;h=3D2e1dcbc0c2af64fcb1700=
9eaf2ceedd81be2b27f

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/CVE-2020-29129-CVE-2020-29130.patch  | 64 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-29129-CVE-2020=
-29130.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index 11be545cb5..bbe2a39755 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -33,6 +33,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.x=
z \
            file://usb-fix-setup_len-init.patch \
            file://0001-target-mips-Increase-number-of-TLB-entries-on-the-3=
4.patch \
            file://CVE-2020-24352.patch \
+           file://CVE-2020-29129-CVE-2020-29130.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-29129-CVE-2020-29130.=
patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-29129-CVE-2020-29130.patch
new file mode 100644
index 0000000000..e5829f6dad
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-29129-CVE-2020-29130.patch
@@ -0,0 +1,64 @@
+From 2e1dcbc0c2af64fcb17009eaf2ceedd81be2b27f Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 26 Nov 2020 19:27:06 +0530
+Subject: [PATCH] slirp: check pkt_len before reading protocol header
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+While processing ARP/NCSI packets in 'arp_input' or 'ncsi_input'
+routines, ensure that pkt_len is large enough to accommodate the
+respective protocol headers, lest it should do an OOB access.
+Add check to avoid it.
+
+CVE-2020-29129 CVE-2020-29130
+  QEMU: slirp: out-of-bounds access while processing ARP/NCSI packets
+ -> https://www.openwall.com/lists/oss-security/2020/11/27/1
+
+Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-Id: <20201126135706.273950-1-ppandit@redhat.com>
+Reviewed-by: Marc-Andr=C3=83 Lureau <marcandre.lureau@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-29129 CVE-2020-29130
+[https://git.qemu.org/?p=3Dlibslirp.git;a=3Dcommit;h=3D2e1dcbc0c2af64fcb17=
009eaf2ceedd81be2b27f]
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ slirp/src/ncsi.c  | 4 ++++
+ slirp/src/slirp.c | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/slirp/src/ncsi.c b/slirp/src/ncsi.c
+index 3c1dfef..75dcc08 100644
+--- a/slirp/src/ncsi.c
++++ b/slirp/src/ncsi.c
+@@ -148,6 +148,10 @@ void ncsi_input(Slirp *slirp, const uint8_t *pkt, int=
 pkt_len)
+     uint32_t checksum;
+     uint32_t *pchecksum;
+=20
++    if (pkt_len < ETH_HLEN + sizeof(struct ncsi_pkt_hdr)) {
++        return; /* packet too short */
++    }
++
+     memset(ncsi_reply, 0, sizeof(ncsi_reply));
+=20
+     memset(reh->h_dest, 0xff, ETH_ALEN);
+diff --git a/slirp/src/slirp.c b/slirp/src/slirp.c
+index dba7c98..9be58e2 100644
+--- a/slirp/src/slirp.c
++++ b/slirp/src/slirp.c
+@@ -756,6 +756,10 @@ static void arp_input(Slirp *slirp, const uint8_t *pk=
t, int pkt_len)
+         return;
+     }
+=20
++    if (pkt_len < ETH_HLEN + sizeof(struct slirp_arphdr)) {
++        return; /* packet too short */
++    }
++
+     ar_op =3D ntohs(ah->ar_op);
+     switch (ar_op) {
+     case ARPOP_REQUEST:
+--=20
+2.17.1
+
--=20
2.17.1

