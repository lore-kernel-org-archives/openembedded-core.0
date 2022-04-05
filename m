Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E135BC4708A
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.78])
 by mx.groups.io with SMTP id smtpd.web09.7364.1649170843512648390
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 08:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@seco.com
 header.s=selector1 header.b=Jbeq0JYQ;
 spf=pass (domain: seco.com, ip: 40.107.15.78,
 mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeI4mvUR+XglojqT9YjVmFqHibCcQXFhpH5irDYBBiwIdphrq0/tKFnLcPKmwAVDDzpuXIUI2/MTCB/ke6183j/wcJNvomAAqpe0MM67W0zFhKN5gZ0y0EW4bW66Cxlfg+hqnih7YP/NAbFnc2pS8D878uN3NToF8OFYbntpCu2DhVczJIAkWiftZ+7PgkGB0VP5MhjEu+x/9wXUAGrS6netS5hQTkghzwBKhvSqeiPfpO0iXiEJzTFalG52qd3vZ1YLq4qVvR2Hfs/ljQsEmir/LYq75749yldbdO2R9KWB4XyanwnjbYX0WlK435HJ1l3MTqr8xnyL0q+qyb5k1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQ0MM/OJfYfUCykVrVaiKGq4Cc5BFVCiQWZj4G6hCsQ=;
 b=c1SRqpf24uCq0y0RGOTrycexX0TNk3QSZUHo56Y39ZeTkLU4+KPmeSxDHAdtVEMElng35YmkzCvNcxrxKJtTPLbwxkHTpQetOQj6oz+vflp/G7iSRd6AHBv3tTWglWtUztGKaaii9vw/0tJKewYDuKNxQedeLH5f7ptbXOXR4fJ0oiXjpCXOySOoKbASmM4qWs6f1anYH1XnCCACMBc52KW45jKMhvwlgTYlgwvWSpg2Br05wfie5Zb8EVxyhYw+wKhq5C0HpYqjAOumq2P2/76I44C1gbDs4OEMwqkhCYLQmo7hykFbwCq4XdgPujyre9oOR7m1MvYiTKeZIM2jag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQ0MM/OJfYfUCykVrVaiKGq4Cc5BFVCiQWZj4G6hCsQ=;
 b=Jbeq0JYQe6xrn4AOTN4jkiRBLLXKqqDwP2Vp+X9a5Vh17V0Fgpa6rpLSoBV3QmlfQRHfvaYYbTDZWCKdMqhI/fQvvqYU4/cbbTU4n/tGAEP6B12nNyx5W/46CLY8UFTteXrjoqtPpAgHnQMsAJv4ON7NI7kTa2J3197cs6D4y11lTkGZaDGS/DFF0LvCGnyyxmcQsTTwCf3AstjieSfewr+cCBEjzRWo89UwF2UI86zskNQAm7+yppEbmucCFk83871zv5UoF3aoWd86PGcIsxkaFoyjuJoHpKZZeCxauuTXE5urW1l6inRsl0rAQVOPh4fJg+k4YbpbTcWD2sHdwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com (2603:10a6:803:c5::12)
 by PAXPR03MB8225.eurprd03.prod.outlook.com (2603:10a6:102:24c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Tue, 5 Apr
 2022 15:00:39 +0000
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::2ca2:213d:e44b:cf71]) by VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::2ca2:213d:e44b:cf71%7]) with mapi id 15.20.5123.030; Tue, 5 Apr 2022
 15:00:39 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: openembedded-core@lists.openembedded.org
CC: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH] u-boot: Fix condition for install_spl_helper
Date: Tue,  5 Apr 2022 11:00:13 -0400
Message-ID: <20220405150013.2640178-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0003.namprd08.prod.outlook.com
 (2603:10b6:208:239::8) To VI1PR03MB4973.eurprd03.prod.outlook.com
 (2603:10a6:803:c5::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 505e3100-295e-4641-af81-08da17150bdc
X-MS-TrafficTypeDiagnostic: PAXPR03MB8225:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR03MB8225212159F35AA75E30509F96E49@PAXPR03MB8225.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RxPxyACCrgvl5P9tTFO63xog8hhYb5+H+kN5JbjLql+ljlMviw1Yiv7ysYe48+zrbAhRBKthVXe5LQYHdYSbEDnOIk0Rw8OwUYPSoU7mdlBO81TZKiw3pma4nfTICjNeZcuWi3Ru87WB29mEAvHzet8kD61U3MOISOcIqe1tvWYuVyG3XRxhUKzivX1St+ALRJ5jtvWLFviujCnDTBKF0pHK4loOoFCxwOWU85Zc7t7fOX+ZKRwkNadoflZo1cLtFDqTubsQBsy7mgGZJimkgXnWfirJnCOFYhPVMhXuZI4SXZtO0nNEr5m7dnZhbTf5ICUUzHWYjoKq1PEexIhy7IWj4ApI4m2cyUfgWfsGQoSVrrL7HuX7ZCD0CndPULvrj9u4OJTej3HY4o3M67GTMT2gYFg64w+wAGBTbOkV5g6JWfTvvbWksKDCoyX3f2N/3iJ5WavKwxAVG4MFsYkGfcqHxGnE3sR8RA6f81BSBjY1StJmbCAmDGFuGXdlZ/ZJxu3EQWq4xRKUZhUT6c4k74MwxzsPSwdAn1FVmiHH3EsowrOL/Y3s+cB7fF69ojM8990kpAPNrty2MOjXxMGkR9kY1g94LDh2+umiRSg3cmh0f88UEAFZpnSzxNnbCq2tUxRC33H9rBbr6sYCuCl1+qgCzW6Lx7ENmUvElRvJ6ltxxUlbvzBC8ZQkKyPbN4vzZmlfOHKuRMSued+ZvLdEXg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4973.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(52116002)(66476007)(508600001)(186003)(66946007)(44832011)(66556008)(6916009)(8936002)(2906002)(6486002)(83380400001)(86362001)(4744005)(4326008)(6666004)(6506007)(26005)(316002)(107886003)(38350700002)(5660300002)(6512007)(36756003)(2616005)(54906003)(8676002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a3DXGbI4ml4aWvtdmelTp07hxgt5amwXxDCJ8+L5AFAnkOt6YkjyeUqmewYK?=
 =?us-ascii?Q?qznXbvuo5twdeGCdpJ6A2tWBb1xJMQUxMNHsb2kMTFJ4BHzyX13x2niH4xL1?=
 =?us-ascii?Q?Tb5PgZJMDrdwZg9LzYfa8sNemfRbumiuifhk7K+busSyaHsmqSnFwBu/EBLE?=
 =?us-ascii?Q?2ZMRns0T8tCNnq1NR1CHMPotnvC/NW7G78F8BKxB5pW25lHnJgbqFEqrt3tK?=
 =?us-ascii?Q?dN0Qi7vXjtnWurNBcRcFCZoP+OUfUMtU58EHwkN/D4C81KFFLhlWr3CylkaH?=
 =?us-ascii?Q?FNIhTdu2iL3ukJKpf2cnTQ1N9ohaZE5J8iVvOLGmmKJDRrI7nqm+TRY5URn6?=
 =?us-ascii?Q?+C0AIhGrs8Wh4rj8nihrL8hA29FO5/0LorhAXKZzHLkNRNtyw1rHKvQi2sDq?=
 =?us-ascii?Q?LTsVLIMA+aY6q5AK47dehJxUUt4RaPv2TMaBc7NPI+LNsEeDU+1RKWRC/eei?=
 =?us-ascii?Q?Yr8vwOMxZHkcT+hIOl4nIOoMA2tqWIt2upAB1eCuQo8wl9HkPypirTSqFPkq?=
 =?us-ascii?Q?A7qo4REOgQOlV39D8dNQ8kOyD4wiYqYK4fIBb5dw9DssQKJavu6pGX8hyTDR?=
 =?us-ascii?Q?SicPPoXamk9bxa9978aLCj0g46fimiGq0yovrTPwXGGfG8JZE9g5B4Jk0CQd?=
 =?us-ascii?Q?DrdciW5THmsAK9WoG6CqxsJWEakhbu0KkPZGxujXatxa9q9DUnaIqZRygIg4?=
 =?us-ascii?Q?joirAZMj45mRJlNFPp+HkFvwnshrS41xgFGuSREQTN+QYH0riepnzFssmr9g?=
 =?us-ascii?Q?QeN4Uh7q87QT0XGlKV1VZLq2TN+9cS02vBc0+7mIGA+LGgaRp74v3XMAc76a?=
 =?us-ascii?Q?mXO2hVZOOUi9etovp8IJ5/kCOynmthP91/YEBW8MGH7VhSxqvE17bE531E52?=
 =?us-ascii?Q?/CE+l8OrUs35myzmt4HUkxUbdn2DZvuG98+hdz1XeNaI4IsNhC+6D6FD8Es5?=
 =?us-ascii?Q?QpRfSrig9pSGh7VFCZFv/pre0GiWeLpoUCMv6bl60XTNIJG5ZntgT88F9dYu?=
 =?us-ascii?Q?FaGo2pBWo34/ernpPS8uEryPjse9sMTdURvtkI0vAwPsDYTdgv/HH2Av/bfv?=
 =?us-ascii?Q?Uay1Bw4DvbLHgeYCs8hxYRf4G5slL4oM79REMLIF8Dgc04pTrtWPNseXFuik?=
 =?us-ascii?Q?NKEgjQkj0B8I+5vPqhGgofHYXz34ne/yX5sO+nvPUjmY9//5RKM8/74YX6dc?=
 =?us-ascii?Q?PdtKgzpSDI0ZT+xRstyYFefLuX7F1EhwPkE1OcNImjTGOQaxCZfKcg11dRIi?=
 =?us-ascii?Q?8EzqhFSDS2Mgrqd1W/xSQnkJGbrP891eD0LNwYSNKxTR1SeC7aKgYxGHRRBv?=
 =?us-ascii?Q?V+J0fzUJRx+fwjbRS4K9Mby1q55xzrgJoCuqncX42Y2qH1a1OPwr6Ao9oj/J?=
 =?us-ascii?Q?+oHhxtmO7PBdFBSY0UpW5WSwahuz6ltYmB+Jlt3n2BNWa34WcCafN+veBKfA?=
 =?us-ascii?Q?Go9SfJkV/s0eKD2m5hjLQlrLswEu0/LncWFGArfFW8ILfMNLc780Rb30ELZX?=
 =?us-ascii?Q?sS4t0yJZgDr/VQun1nfhypQQizUGCKRhdhD1N2W+Gat51yRIeOeKJcn2KXvf?=
 =?us-ascii?Q?kWcNNSL4iJC5T3Op8Sb2acF15B03sTl0UXuRiDoIZLB92xD7ximVYT5xJNJb?=
 =?us-ascii?Q?O3RFCuR49u/DrP86fb7KV8dW8kz1oOIJOZjFdIWjhNqYhYiZ09HkjkQRftrV?=
 =?us-ascii?Q?osBEkhuNgjwb8TefO6ZAQwmLFyJ5lFbh6EDhbY3Hkj5LHx1V9PgrKiI8DpMj?=
 =?us-ascii?Q?rmC2x9nPi89hcjtQcKn1a3+OAM0SynI=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 505e3100-295e-4641-af81-08da17150bdc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4973.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 15:00:38.9923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kmaUqy9kJ0Of6we27fUYeNe/dguA9hjP2gIqyVPzEJ5psw1Jkkvw83i2dqWEZ06IvfTTXNZj36/zPeu7VzI/OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8225
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164042

The condition for calling install_spl_helper when compiling multiple
configs does not match the condition for a single config. This causes
compilation failures when ${UBOOT_FITIMAGE_ENABLE} is 1 but
${SPL_SIGN_ENABLE} is not.

Fixes: 5af4dfe83c2 ("u-boot: Add infrastructure to SPL verified boot")
Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 meta/classes/uboot-sign.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbcl=
ass
index 8d136e9405..4ca8118eb2 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -250,7 +250,7 @@ do_install:append() {
 					[ -n "${UBOOT_DTB_BINARY}" ]; then
 					install_helper
 				fi
-				if [ "${SPL_SIGN_ENABLE}" =3D "1" -a -n "${SPL_DTB_BINARY}" ]; then
+				if [ "${UBOOT_FITIMAGE_ENABLE}" =3D "1" -a -n "${SPL_DTB_BINARY}" ]; t=
hen
 					install_spl_helper
 				fi
 			done
--=20
2.35.1.1320.gc452695387.dirty


