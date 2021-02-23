Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.88])
 by mx.groups.io with SMTP id smtpd.web10.1268.1614108070351635746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 11:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QwxnCVWe;
 spf=pass (domain: windriver.com, ip: 40.107.243.88, mailfrom: stefan.ghinea@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFDlCZIJAbbYhxGQ90OPQ0mRGTQxah9kv/W43ZYuwop9+z2O4SltrQBF5dTJ3SkI2NkTnNP8Fg+gIaAaW0o1YIstYzv/jYmu2+v2/3bxX9BMxZKGBUrSMklDwTa7MYGg+GAZdNnjtyLizr+EJ0piQAkLjAJFEjqOiwqa1dcUIqduWNUWuG+F+Tb2AzmGSQoIBsV5jEVhf8RgA5vYHkOV90CLSt5wEADSkIOMXgfgNE5vTUt7gjXWNGF9aDiEEPqwL8cq9LZ3EUlnPeepudVKbJ+s07gWJVEkCEvneEW7HPmR2D6WQ8Yd4M7wEAS713X5VBwEhzxwLmMGRhJOFvoMCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d89hK23ZJb3l5iXP+jjRr0m4KJu74UUG/TI8vBx12FE=;
 b=htmb4RwILkAR2X6NKZerhvr26RLbAB25GJWIBnIyuUhm94YmOHSzb/Ew3nsF7Ixx8ADD8GxNN+R2w7CQwYsAHgKEKYTEgA+8nxBbCXunDlbmFqHqnvqoxJ/7atOqsFl0v1cFiXx/ZKMyCy2Z4GbduVYr6szZPyRvCW9w1F+7PUelctik34osqicoRNdz1KdquND5nLta48zqL87CRmDIHo+KN2sgZHBmhDr23uo083Ma8nzz87DpjiohyQ5tG0SBLYrXcSqSk0nww0Gp8hrhGonbJNFTdzxan1QMDAkppyDb2J7bAghWB2/yUQS0w/qERQtVjPyazKXG4KtKkPAfkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d89hK23ZJb3l5iXP+jjRr0m4KJu74UUG/TI8vBx12FE=;
 b=QwxnCVWep5tEkzoRXIw0GBrDGRb4Nyh1r078+oBdbZUOkOJhtvnvXPFxFouhkmVCwSCZrtoxWWqcOqfWcfivjBOvLnh+bSBEzo/mzx/bb6CLdhjkXtNUiSNWtXH0vWYHf/KJWWxQsLSEdhehlKlgHEsryzWYP3pDg7FY0zf9m6E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Tue, 23 Feb
 2021 19:21:08 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0%6]) with mapi id 15.20.3868.033; Tue, 23 Feb 2021
 19:21:08 +0000
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] [OE-core] [meta-openembedded] hostapd: fix CVE-2021-0326
Date: Tue, 23 Feb 2021 21:20:53 +0200
Message-Id: <20210223192053.3879-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.137.231.29]
X-ClientProxiedBy: VI1PR09CA0092.eurprd09.prod.outlook.com
 (2603:10a6:803:78::15) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
Return-Path: stefan.ghinea@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (89.137.231.29) by VI1PR09CA0092.eurprd09.prod.outlook.com (2603:10a6:803:78::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Tue, 23 Feb 2021 19:21:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f62199fd-a603-413c-b361-08d8d8302bfd
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4989:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4989F3E405B078F82D537F95F2809@SJ0PR11MB4989.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VCt/nuFa0B8XhXRn5Q9DKn6sXPtgfSFcRfgoIx7ndqxiEwKhRPtWjV55flN1qf9JW2BtyfUEMJ92Tygbjne33pQG5mQimwR692hGk+p7C5KpR6gum1T4JKfBUaECe48eCCWHtgjK7KybDSK+CMHvgj8edD4Zo50poCIMMBL7YM/TTgDKUwwSCLZtt7VHfnHu9gek4NjYZ3DKCszwbyLqEALyn/jYlN4gXydzqptUBEoR2OjQEBUfkUqU/BKgGNtBbJGkinLY945GV45cexmmxwhEyttYqDJ+BxauoaGGjMCj2zslDDFZRisIXORjpiGQy2QjUkscPXVvFWLY20jybH52f16kwOSQEVSkHTZpCyEnsLmt+xljzW5ridGUY+ui4yI5BStOMBdBqq75S9icVTik2LiamulJXqw1oVZa98Z0c4ZDhAbFqE++d7T1UeKT20PNa+HPWsKCwGeE+0e38pj5Ds2YUVUAto0g3G4SL5CwPpVuL1SDwf6Z3R4SYMYOXEOUvYDl5GdH+FTMGLqjPsBtqMza4yOCtI/1eR23wCw9VuHiQ0EPBWTtbu54/GX2JZ9v7+K+sl6EJ0pMZXj1AlQyOLcApFnZuwW/QI/U4njt4kOD9RIyaa3Ttw/kkD/xY4L5YwGinWwaUZwQum1VpJ6O9Vvq990haPqwZoRjciNhpn5yRMObNAhup/P02NyP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(39850400004)(136003)(2616005)(8936002)(956004)(16526019)(6506007)(86362001)(44832011)(8676002)(52116002)(6512007)(316002)(6916009)(186003)(2906002)(966005)(66946007)(66476007)(478600001)(1076003)(36756003)(6486002)(6666004)(5660300002)(83380400001)(69590400012)(26005)(66556008)(83080400002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?o8nyFEr7IGhIGGJiF1dstDd++1NOy8xhQ7fWDTxYpc2iItp+YkkyeUjG2g/I?=
 =?us-ascii?Q?HF2dkb8/p7jlksR7fjZ0wzBBtRBWLouW46UeLJKkW/AmeVVDfMBpj/cA6L1x?=
 =?us-ascii?Q?QBWhi2vLF+a3h6JxbSKgY3VrvQHjjVQDRhP48/Dw59ebU+vkJFTp9v0drDK1?=
 =?us-ascii?Q?GjS2cK1mp5U9vzlklXHB/10MWWaEUzWBQNM/V+Xe2+8Vt7C8E1MhU26Fz9Xo?=
 =?us-ascii?Q?YGAzrII9B5fDXC2Ov+R1nWMawWEgrBIanWLXJzLmxctnCYCdtFy3wtII1Ypq?=
 =?us-ascii?Q?AvdoLfC21fAfJ6KuRD/3V/rAjUjP6ElNS+lXyyccQrC14GxpxQXd7GA29l6b?=
 =?us-ascii?Q?PNPtA6YLD28zDhDiF7efEo2iuTwK0w2vXIXyCIAK25zKERrVQlkGs1EEOEWV?=
 =?us-ascii?Q?oIthllm30yHfH9Dg0GI+WWSPM4yCz35AQwPi9UA7W5M/Iz+/+saRgPDmbYPU?=
 =?us-ascii?Q?iGH29PCsb9QPA+elbZBc/pSfGsgOnNO/GZoCYG94aKf3IpPW5MGsRdXYVEoK?=
 =?us-ascii?Q?n7GttiwhR+AhT2x4OXpqScB9CjpSTb60IXShzidDuy7snqGSwjG2YPZ3o3Zp?=
 =?us-ascii?Q?3WYPwcY4qlVTLBSZaTW8VkH5MjRyabABBy36nZQjSO3dVT43WDhc1fUoL2aK?=
 =?us-ascii?Q?MiZ6e/WXQQWC9fPDah2tS0A+m0lZcgXWJlAADjSkmJw4KWprQNxKrpHPexoD?=
 =?us-ascii?Q?ALuRLctvCPNc7wJnEjY+3VMJy3lFZOeq+R95bm3ptCyzXww0Gmw+mtjh7EUw?=
 =?us-ascii?Q?njbqoXaQubcngg/c6AJ2jrhuro3WrAPOEInMi6zJdW5J+DvRYBdORNwzkO+D?=
 =?us-ascii?Q?/UAKdVEyHvr1wuWAQILa9H7A1v7wvGa0lU3j1xotSXriSJkFqQQl27Qz+iaG?=
 =?us-ascii?Q?GGHqKiGQZ0gKsL/RE+KHn6VpolfPOIl+WarD9Cot29xJDO/YxUqJs2KGY7F4?=
 =?us-ascii?Q?ToQ8D5OyLESS8hGJmTauNQpaa4Aoxy/bsRr1xK//4mZUuy4Hlfjdd23K9Qu0?=
 =?us-ascii?Q?YMWerLnLnKqO4jM3+S/OsF8OqzUx07XfAGiUQvDGMdWTtwPkAh3HPOZagzsI?=
 =?us-ascii?Q?scH+EgdNBrN0TxyKp7qlrMsaUdtUSVERdVOzdGmNDz8ou36eR9khFgDVRvMc?=
 =?us-ascii?Q?P4QI0bGncQKkB4WxK6X0RDGDxFtp/KOyNh0kPFG+SBkVncyX6/pfONANs7Em?=
 =?us-ascii?Q?oEO/CPxSgaPmzPaadrk/zD9U6JJ97cRmfQDJ9IpT6E+xythoh0azlFuWScBV?=
 =?us-ascii?Q?mcQbOlSJLKv4wZtOMRXkK1Mhc+3v5wRuTMY+Wpuo0JeHWTvMCHoYMpn5wb0v?=
 =?us-ascii?Q?vi+qClrfVJ1qA/edTKlPEfG6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f62199fd-a603-413c-b361-08d8d8302bfd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 19:21:08.2535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9STHbYFAW+kszzuYrUvf8Cc9WWMC6Nt2Aw5fmdRF5SWcbvzANjmhFudQe53g50QAiT1iJu4p38jL+knFEdT/CdrO86bDVp/TYxN4cIwDog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4989
Content-Type: text/plain

In p2p_copy_client_info of p2p.c, there is a possible out of bounds write
due to a missing bounds check. This could lead to remote code execution
if the target device is performing a Wi-Fi Direct search, with no
additional execution privileges needed. User interaction is not needed
for exploitation.Product: AndroidVersions: Android-10 Android-11
Android-8.1 Android-9 Android ID: A-172937525

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-0326

Upstream patches:
https://w1.fi/cgit/hostap/commit/?id=947272febe24a8f0ea828b5b2f35f13c3821901e<links_for_CVE_patches>

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 .../hostapd/hostapd/CVE-2021-0326.patch       | 45 +++++++++++++++++++
 .../hostapd/hostapd_2.9.bb                    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch
new file mode 100644
index 000000000..8c90fa342
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch
@@ -0,0 +1,45 @@
+From 947272febe24a8f0ea828b5b2f35f13c3821901e Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@codeaurora.org>
+Date: Mon, 9 Nov 2020 11:43:12 +0200
+Subject: [PATCH] P2P: Fix copying of secondary device types for P2P group
+ client
+
+Parsing and copying of WPS secondary device types list was verifying
+that the contents is not too long for the internal maximum in the case
+of WPS messages, but similar validation was missing from the case of P2P
+group information which encodes this information in a different
+attribute. This could result in writing beyond the memory area assigned
+for these entries and corrupting memory within an instance of struct
+p2p_device. This could result in invalid operations and unexpected
+behavior when trying to free pointers from that corrupted memory.
+
+Upstream-Status: Backport
+CVE: CVE-2021-0326
+
+Reference to upstream patch:
+[https://w1.fi/cgit/hostap/commit/?id=947272febe24a8f0ea828b5b2f35f13c3821901e]
+
+Credit to OSS-Fuzz: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=27269
+Fixes: e57ae6e19edf ("P2P: Keep track of secondary device types for peers")
+Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ src/p2p/p2p.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/p2p/p2p.c b/src/p2p/p2p.c
+index a08ba02..079270f 100644
+--- a/src/p2p/p2p.c
++++ b/src/p2p/p2p.c
+@@ -453,6 +453,8 @@ static void p2p_copy_client_info(struct p2p_device *dev,
+ 	dev->info.config_methods = cli->config_methods;
+ 	os_memcpy(dev->info.pri_dev_type, cli->pri_dev_type, 8);
+ 	dev->info.wps_sec_dev_type_list_len = 8 * cli->num_sec_dev_types;
++	if (dev->info.wps_sec_dev_type_list_len > WPS_SEC_DEV_TYPE_MAX_LEN)
++		dev->info.wps_sec_dev_type_list_len = WPS_SEC_DEV_TYPE_MAX_LEN;
+ 	os_memcpy(dev->info.wps_sec_dev_type_list, cli->sec_dev_types,
+ 		  dev->info.wps_sec_dev_type_list_len);
+ }
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
index 68dc12370..e518b0e22 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     file://init \
     file://hostapd.service \
     file://CVE-2019-16275.patch \
+    file://CVE-2021-0326.patch \
 "
 
 SRC_URI[md5sum] = "f188fc53a495fe7af3b6d77d3c31dee8"
-- 
2.17.1

