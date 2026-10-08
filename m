Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AA5CA600C
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 19:59:36 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3384.1791489566310501056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 12:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=U3grmUjb;
 spf=pass (domain: est.tech, ip: 40.107.159.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDbfnySWsGcMdYmx+6dUoKpFOv0EiEBeTE6EP2ImHHcp+ZgKgckaKMpMBd8PzRL41my+9iKWvYdZkCcKhDFRgcL6j8WpjTJ+L1GpvYjXdzBkGo/JjUDvsgpUzeHXN1TQA9agQh9827jBSn920heK2R/oOvmuXhW+yFQAvpjkckdhoyznm/5Wxjs/lIb0NIuXxGkzX5Nhr5boVNkCTyY9OAt7pnM95UROdVRggDIaU0MNiYCoC4TRDmu41fxF49GrLLaoao+GUNiAy3Y0ypWgKiRA5YRwUbmnHVH0gWW3QdpgitmOcPVwe3XCi+RBqhHkXTtsoFzJU4p690JMZW9CBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srDIoSImZ6eonqAG33jZA35bU1IcEeTjqXV4pxC4hL0=;
 b=D6Yf1DztfPlNnmOkSnaZl5p9i8FgqDjdmWg6NV7ZIDbD+x+a5G67mzFMunS0FQb9qvyPra4WvooKhorfk1RxTVBdersH2mN01t9pM/P2VsN1sFC/DQCFhiWEwuGOLdSQNIG0Z2ia80dXfhc/YPdLDUEGcHGtYPjn4dZH8i81bSl8jTREiQ0XNJonzC3g6LD4MdQ3bfI3lqc0ha8wVb7oyBcSYoyq8wl54P2NvU9ULuflxUFZdu94bPoHZDGHJDRAsVfP1cKLGTEqhi2LMwUjWOzDRrKNO3b/AD3Qw+i5RC8e0oYBiKT0gD5MbW1RcjlNVuSi3yXVPFdFa3pyA+V43A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srDIoSImZ6eonqAG33jZA35bU1IcEeTjqXV4pxC4hL0=;
 b=U3grmUjbwuBegqb6TOCMq1vYoUZ+7TXhJJw6bTceqv3fnkfDWMx+mPU7hm1vuC75nRSv8LTpTHnkcOp5SIZaA0Vy6+erYXXgkKbwM46RD5J2xpozhjYmWHDTPJdWT5y5VKaJ/zxgfUugc5JoTIvOQMJAVc7McQ5IL73npgtOF7SDtCbwaFuYZB9sOa3Q09BOdKOaYLRlPm/8PNnApy60e0ZGWw6PqZImHNYPmH7VP6A1WKlk52O31QHT+rbWhMq49gi8DKr8jyrM4cfbzID8xm8o6J5pZFPM0nUTr7FvKFblRD+DWBDS222lF0K88xXCg7q1sLLXAEoH9+VGB3jDng==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB4P189MB3118.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:59:19 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 19:59:19 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] libevdev: upgrade 1.13.7 -> 1.14.0
Date: Thu,  8 Oct 2026 21:59:12 +0200
Message-ID: <20261008195917.22382-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB4P189MB3118:EE_
X-MS-Office365-Filtering-Correlation-Id: 62d48963-ef93-42ec-9bcd-08df2576a3a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|10067099003|18002099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	s0F8q7pzaz8zqETDTwpWVxgN9dJccY2jPv7KZCFApd74ibqbBBZPRb/Y6OOZq3bbnsvyr9J0I7LLtVdorzSbsE5dXxeS/G+nUIhPnLZORVarTNwR8+nuNGJNvcy3UJSTUhpreQErKjSNCVF0T1vbR7VVEmtF0IBjvZDETE+KdR1al2fqXGGJIFNW56rYy7T//clQbtUwqayYqOdo53L/2b5JUqpDwWynf7EGOeFSLwlnNzAZEL9okVFd1UBKfQ5vCxiRk3hzqs0VjZ+OyPSl5qSTpWMlyfHJ2CH/pMuLXhpXemlhjCoITTaXDM5HHlOIWYfunF/JEGcM9rYG8NE1t2somAAWyAZkltQwuO5o1WWbI3PdcsKiLZGLpw1deWUZ67nNsauzmJkGXDZM9bhZps4TnPVOOmqNmdJVUM+2KoDO605LUA4sqnUBKgpPuNNmRahK/dCNoYUr/TyovI7S/LbL/tWKQoKW27/ILN79rnr/I6ugz1kAmCBUATqc8uFAvnpD1h3Sxnk2rmi8wWHMVCLi62ctVbBm6FadOm+aFVFDjxwtSQOz7HV6MtmQq3x1X3QwswotABhQwkiofbqN6SLiNY9qeHmrHs95ad8No74=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7zQJHvKLLgy3eDiyiSbhMdR2gUqGZcpvZNY8G7Um7kpeKppeyQUjRuuTBzvD?=
 =?us-ascii?Q?OGpjNIO/fxcMbgzfB1IzP4s6U2dgVIfoxLVN1Ic3vllcBjy5kNznya9oRcWV?=
 =?us-ascii?Q?I1Nde9iMGl5mU04RvzNJ+DEoMPBAJS8uCmijxzx7DFasAYKJe6xeM5t5jan4?=
 =?us-ascii?Q?oTW4pSFgdP0u27+6kNW93t6Sq6Pg8UYi83qN7FFTSZdxFG5XfyWKEtGaJFi5?=
 =?us-ascii?Q?Lw9lQT+15mkmk0wV5YMcnRAA99itCOdpvl/5DrZJk+1f5/Liy63eb3LNPq/e?=
 =?us-ascii?Q?uxUgL9OVbC0KZpFrL6+k7KLCn9FDbMrdbQJyBKZKY2Ke9JVG5V9I9amy6A2K?=
 =?us-ascii?Q?Lxh57PDTQnhTdK4siCL3ryOutmGyCkJnWQHhFnaMr7WH+HFLDmMDxhhZZFd2?=
 =?us-ascii?Q?QzVuGCia8HrMcSoRg7DDiewb1qajsQ6/GaVVqBaSvjSWBOXIhjv06VX1rqU5?=
 =?us-ascii?Q?TPdVlwPAxOAqs5xRNqMacmJjsSMAeD4cl5DDzprptJYFSixxYEYwprTxypHE?=
 =?us-ascii?Q?7FjA27xafNBpEyPyMslRwQcyCFZFBOnNS9NN61Ic3qY9gvQrrBF/ukrhPbwJ?=
 =?us-ascii?Q?PSWOC/iDUBg76fU7JMAUbgorT7HNyUNUBpeF6Bs+XnXgl5gSCsEFvPUaGIkh?=
 =?us-ascii?Q?+Pyhzkr99kVUaYjZJSeYqEZz8UYcqTG9K74Th9FQ4T6eaoZFzPm55W8nnFbr?=
 =?us-ascii?Q?kyN7jMRnQR0fZ0h/ZSkdfxsb6OnxiYIktM76vaTXGbX5FleQMJI3sFhHNaqW?=
 =?us-ascii?Q?NpsY21oampz79Dlt3EbDvYYUkQIaoJKCX/XKZqgTh8zWN06fH6Uf4dYLihRC?=
 =?us-ascii?Q?fhDTF3pEBSM8rP7NkQo1GX9gWVRTnotySaonH14xwBY0rsM5ODrQ47xPGfbW?=
 =?us-ascii?Q?AbDfVfwZSBrD0x0kEPTJz3YRFwwK//84tL0gHEzri5AbkV/2/U/w9DX7YrU3?=
 =?us-ascii?Q?NItuytEUcal8JZH8x47hJ6YOP9dT9lStkGZYHG0lcDxqD1NFYNadHvdNm/JD?=
 =?us-ascii?Q?oFBD8z81V356/N2y41F4FE/BqeS8XLc6MwIXRRLU8J5EInm9E2PU80PbR7to?=
 =?us-ascii?Q?UoQYqJhRyLUggDFX4AO7hGXXbeopmG0xgkWgXlur5fp1pGSpcbtBOurAMQI2?=
 =?us-ascii?Q?grq0MGQMIAzQSFr97wRcHp+sjpCStBS+XvWDVtREuLpc3VcGefpA871xIF8X?=
 =?us-ascii?Q?uE0h4LjhR9QKAaKPPOLR8C0XZgpUL+1NW4qzKpD8oS4qGdc+2fVMwSODNz3W?=
 =?us-ascii?Q?7QyAH4FXIul/mExWs3abdPMsqbD8BM96kZKHxv7Pf8Hde4f5SL8icvN5704Q?=
 =?us-ascii?Q?5EhbfyQO2Tyle5koMHrXF2vcphRYLpSRfP29Ttu1/X8ump5GYmT9/gVzMamt?=
 =?us-ascii?Q?6ZoPYanc73C0QTBLi9eo0Fu/jv83UTIsYfaLiWxaeintaA9r7oV83+bKJHn7?=
 =?us-ascii?Q?URO9K7Q99GU4SARmQRdtSqJv9ib6gsSBUp/Q0wHH8q6Lhk9lqD++tu7kxqbs?=
 =?us-ascii?Q?b7J9K36DIb+UYqgyQX8a633WZ3VJDpaOcvfkyvufJMUxU0n41TBhJE+5nruC?=
 =?us-ascii?Q?Fmxk/DhEs5GQY4xOCUuwqGauFq7xgPRO3TWB4lXT9Xo0pPk+UR2A7+H0oHPi?=
 =?us-ascii?Q?zRwhHNWTCqmqc+kCI7evollekEj3TIq2JdHvvaVrVTI1H+40mHbAZPjNysPo?=
 =?us-ascii?Q?QZTGT0tET4EGVepN47FBG1T9Hg+BkGLE5RwKvMTpNc5CuIPmh0hXyznK40b7?=
 =?us-ascii?Q?dT1tr8p1AWHQC/AF03dFxN+dfoLf+E8=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d48963-ef93-42ec-9bcd-08df2576a3a2
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:59:19.2569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJyy9lpLPXjTaTeSFG57xiyoUYSbwEtyfk3+yq3y8RnL68LW8SS2/AIm4aNZnxnp36lE20QDYG4OOIM8eN6cG+m7FvEbl5NoZBiUvK9+a/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB3118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 19:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247442

CompareLog: https://gitlab.freedesktop.org/libevdev/libevdev/-/compare/libe=
vdev-1.13.7...libevdev-1.14.0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libevdev/{libevdev_1.13.7.bb =3D> libevdev_1.14.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.13.7.bb =3D> libevdev_1.1=
4.0.bb} (87%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.13.7.bb b/meta/recipe=
s-support/libevdev/libevdev_1.14.0.bb
similarity index 87%
rename from meta/recipes-support/libevdev/libevdev_1.13.7.bb
rename to meta/recipes-support/libevdev/libevdev_1.14.0.bb
index 79e383c55b..dedc101db9 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.7.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.14.0.bb
@@ -9,7 +9,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D80c550b3197bcb8da7d7557ebcc3fc4=
6"
=20
 SRC_URI =3D "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[sha256sum] =3D "0caf824971108f15bb2ad356433bae198d7d3bf1e82d43f636=
26e069e060bfa6"
+SRC_URI[sha256sum] =3D "5a0966c7110648665983848bad696c7acba614a2160d2865d5=
35397101007332"
=20
 inherit meson pkgconfig
=20

