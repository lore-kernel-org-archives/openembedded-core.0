Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.83])
 by mx.groups.io with SMTP id smtpd.web09.1259.1614108046437996150
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 11:20:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Q6pjYFdm;
 spf=pass (domain: windriver.com, ip: 40.107.237.83, mailfrom: stefan.ghinea@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJl1uOAQxjkI8v4Qat9M4iD8ZwTVE0qDrCRccJPVmAEh21rwC2KUWmBGRAww9HLK5FLz4yihhhJSVZyrE06GDMc75IbxvHHxNae9cXqXcyKWwgZofHnlZrvxQ/E6mPM3GeXwdCFE2NXT4EERXZa6CFgZ7vRnaGs+xgC30T0Nq4gdoedy3vI4IDNGVvQWm7gNL4kAoEVSqO1xcYoYqOK4Yv+FkmglPk1irtywGkVgE/YSSLv4rkQ+cAmk1w0D/ou3DsiEk58SJwZWHwht2tIHkes8u68xA2TadmVMbv+xUUiFVlUy4arfsCFU6k97uIV2LD82Ctr3Fcoe4huB2oY0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzXAVSmkPuePSOpl9rT7+31ixs6wRQmNKwyTR8J+9eE=;
 b=jyQCAMmrKkYwdGk0G3yS6ibXTcIhZIxkW9Ju5lr7nbgd8eFPPqiJwipPVBfCEVkHXpbS1iecCGorif1PMccraAtK3b+ocMIF+bDDUmwJD1GJFVMu7Rtz2k+3wbUO3//7EnIMhJVx+TM5IoZ0pRL2tZIM4QvREgWSxgQE28GrR8jKazhb2S1Ldw1tljF+Ar7YkQVKXoe85GOFoBrXGusnx5xD7U4nKsyqfz/haprKRZotPfhxkii2dQS5Z6JUIbsUZEUoBnH1TqHTigQ86wGuwEO7T2ivh0v1DVhvsKHhT/2kWVLjIpVICEjTAdIYVfJjqAPlP53NdOLKJC5gOQzEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzXAVSmkPuePSOpl9rT7+31ixs6wRQmNKwyTR8J+9eE=;
 b=Q6pjYFdm5Ls0BrGwChGUBPTpKaualJptxIXSP+P4v7I7mL9bif7i6J11YKT7voGICDxA/Fc67rsZW1mEyLrhooCnQt1DQORznEWXHsuV20cF1hdAdMDQgzBm+K6VtS7nK5ildo+Y03l4HOSczmQrMmkQ0JYS9M5n/B0MDpXiyHM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by BYAPR11MB3015.namprd11.prod.outlook.com (2603:10b6:a03:86::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Tue, 23 Feb
 2021 19:20:44 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0%6]) with mapi id 15.20.3868.033; Tue, 23 Feb 2021
 19:20:44 +0000
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] [OE-core] wpa-supplicant: fix CVE-2021-0326
Date: Tue, 23 Feb 2021 21:20:28 +0200
Message-Id: <20210223192028.3785-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.137.231.29]
X-ClientProxiedBy: VI1PR08CA0231.eurprd08.prod.outlook.com
 (2603:10a6:802:15::40) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
Return-Path: stefan.ghinea@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (89.137.231.29) by VI1PR08CA0231.eurprd08.prod.outlook.com (2603:10a6:802:15::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Tue, 23 Feb 2021 19:20:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 513250ef-18f8-413e-9a0c-08d8d8301d34
X-MS-TrafficTypeDiagnostic: BYAPR11MB3015:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3015B5A203C1B413227BBF76F2809@BYAPR11MB3015.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F2eaimlb7gaM9KtXWP6dV1lI4nh8aDCuJJHMYwh66RV68l/Wb0QW3fe2nHd/HMzBe1zAaS+SmAP1HFMW8KNXgHwwH6WwQ+ETx5gJbCvO/FHkwXkMyHsm+tuB+PD9rxRYe69wTLIEucFz01OaSJQC+B2NZBc3mSrwIKe0Mu88Uv4d4/Pk6XFLyQ4oLQwtSPWyxOB+d1HiWpO3dpWNWnSzUeIXWm3SNyFIIU9oLFHd62yYehuwi8dbwU2pZo4L9SzRgf3kx0JLacSp6H7j8SuaYaYHVkWhTaRwK5SyPsoJA4JlQbjdtOMvP3bo1SNyx3hMLur2Eemy8KHuWelzgt0XDJ5ei000qq70V/1b1aD2+Bi8opXAaua2ID+DmO9x5h4AvhegXEWtQESUFjzkdwZN1BbPSw5NGoH0sIKsw344wDBsllOTs4cCG5gGtlDiVN6KfC7oXhM4fi+UcGhA8zoTrdlFF3ywAWY0QYLXfuxTffyManoLvxOG9h9k9ue2doOFCqwrguLAxrwVfNjWpod5c+xdYwmWoPT+dup6YSp11DYGgRRKuB6MTkVWCgl99q0OsTgCwbSDoBPvhbJhZEbJlUML3rZAt1Olo9VPb7efk0amZI20ehUev5FGgNyvpruWh2LDCACY9xNBg3kWRwt/LNhyehfONFzYa9OztQFIB3+2d2BIHN2k3n7ZMatcFnoRWeeeU+7BvzyG9iOPNLGHfA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(346002)(366004)(136003)(6486002)(6506007)(966005)(956004)(83380400001)(316002)(44832011)(2906002)(186003)(36756003)(86362001)(52116002)(2616005)(5660300002)(6512007)(8936002)(66476007)(6916009)(26005)(8676002)(16526019)(83080400002)(1076003)(66946007)(6666004)(478600001)(66556008)(69590400012)(10090945008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?GLd1Y+AZx9HtfxCrf69XVDA/Jpcx8i98+vkwgH7TbqlfUPlA1w047iqyan0O?=
 =?us-ascii?Q?rmryILItUFVgZRY0LUw2LpqFOWC2RIKsefMLbW/3+j0uo/E3FTScd4rRn+4S?=
 =?us-ascii?Q?T9Q9IY8d4qY22d3w/+3b+BiVEusF3uVgzwFx7iT9soUKS/jRv8E6M3X1Rv9l?=
 =?us-ascii?Q?H9b9y5ZJzW4+ZM2Iy9is7cr6ZyuGegTZcgvQoCa0Hg4AnzpkqzFpKqBofhL9?=
 =?us-ascii?Q?jiQULAkfw/BlDQg3qLwEfaR3mya6hdJ276TDkhj+lW3FG2BT62C3XhO/i+p7?=
 =?us-ascii?Q?qjwnAxDSs3riWydfgVC67TYf2QIdeVkiztuQJyjDcXyZGxJFvBZe+n5be/wG?=
 =?us-ascii?Q?I+qUZz8MOxOJvfBoGIF4wXz4N3F9EG6iwtqS8zyxwuX1Re5HtPoEJK7hnk2z?=
 =?us-ascii?Q?zOLHJA7hJ0cMhrwVSmGOAJdxOp1GXO+3cymt2w4Nq4GAe2FGV5KRq+UELt2M?=
 =?us-ascii?Q?D+6QtP0yN1gTF9haEb9f9v3fYSd2a83BrnoHiOw54YwK/xuJmy++HM+D2wJ0?=
 =?us-ascii?Q?wuqI7poSxmb+BsPZBRKD7pkMdsRDARItwCKs5Idr7GzjKdbt3ZEzZh9Jcu13?=
 =?us-ascii?Q?YbNg7jVFPDUQR4ZZVIq6TtIwn+0O4pDGf51iIj9nc7lwvqiyk9HNFF696J0K?=
 =?us-ascii?Q?Kfhe12GSYqytDUlKt/3ol3mj2Z1W3g5XrN4M3YB96OnshZemt3rKVFYGhvjn?=
 =?us-ascii?Q?JszOaiT98CKtj+tiqtLk7YF5NMe6pNj8yeUB5N/MvzOojkZDcXo5Fol9GGBI?=
 =?us-ascii?Q?bQA0oQHIZ0MCx6NGE9EKHfvsXTltSPcetQ5Noaiv0VjmYR2nvBeOKlV2ZFVm?=
 =?us-ascii?Q?4QTwiF6QVEMMFf/oz/RNr+i1X/t/DFt6z75mqK8v/J6JGWXNZ50qCyQaCbb7?=
 =?us-ascii?Q?I37ZMDNkyH0EgDfgHGADc7+ZPPkHs/x9gpabZnw/RQ7iFtMCUgBUotwIT2XX?=
 =?us-ascii?Q?qRIpe2TCwRSqY1mM3G5jnWsbmBJJUtsapIb6jPYPfZEnsgl6ekU1GXLuOyzo?=
 =?us-ascii?Q?F+k5is/hSr8fMdiMTU2xQ1vFvTQmyo1StlY0IIxwsQXoNHXA6IA+aPxooyN6?=
 =?us-ascii?Q?1RkL/Agyd22w1cWauczR2elmAoeXn8Ry0d4iJXrc4vF+6PFOPe2bs+sFa/MY?=
 =?us-ascii?Q?SBwipq/ATywdHRqSMqyyAN7U7cLuH4OjWsTkJG/tEF+gg9VDrjmER5RF3kGJ?=
 =?us-ascii?Q?kwVCPrf1FuImcgIv8uZFKUElDlGRU3oofDBeYGkP24eqKRpad1EATrfi7ZpE?=
 =?us-ascii?Q?h4oHCGZeiWh7OXv1cK1vvwV3MasG7TRW7kFuV4lcYGlzQYspnjKEDCMX7L0u?=
 =?us-ascii?Q?/HxxQZTWjrPVadTAHIUTjfzx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513250ef-18f8-413e-9a0c-08d8d8301d34
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 19:20:43.9423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6ivTx11RAj9SIYHODipQq7evh08+1dxXXFtfdyyF71XeEJG9whICukpBtv7LhQRvtGzMqZmUZqrb5IoIgqzFL14sMaDgGvYU5XK6LNH90k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3015
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
 .../wpa-supplicant/CVE-2021-0326.patch        | 45 +++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-0326.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-0326.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-0326.patch
new file mode 100644
index 0000000000..8c90fa3421
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-0326.patch
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
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index 7cc03fef7d..85ac28d881 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch \
            file://0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch \
            file://0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch \
+           file://CVE-2021-0326.patch \
           "
 SRC_URI[md5sum] = "2d2958c782576dc9901092fbfecb4190"
 SRC_URI[sha256sum] = "fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17"
-- 
2.17.1

