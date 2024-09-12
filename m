Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E73EE644E
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 05:47:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.40605.1726120021026271138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 22:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9985bb68a1=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C4Negg003370
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 22:47:00 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj44dfq5-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 22:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7JMr1uQZ1dfBI/HCZ/6ftnTVUp1rPK/Zc2/NddmrwNEPrmBqgiCfLQmK1PFZ0icFNUAYIYXKUBiS8YtS/xDQZZgyd1+y3+jwrzBsXTdBCwesq9TsaKfjGt0WDjwZWsCy6AgODAboWGeOqjDiHV3TaDTjxM0BDyy1eigMOulvUxPOHWPHJ04QJdv8l9+rpZ9OmxuVcIyR4U2LmF2DHKgnxCqEjDE5qf1V6Jy3hJNxW9zNFw49czSzGxqKi4mhCU5Q6pLp+fKCQnJC3GYbIt1kxRiSwWYNTTiGobCjcq8K8uuYKZLyKcb7Xm8GX8DowMdjIArbWWYY7WITtKKus7Cuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuYhiZm+0BO6AhtSqOhzPrQUGS1YW4pE/f/qQb+LiLg=;
 b=BaslnmI9PQ0zf3zuF9+SRwbNMiK1CnepmwHY1M/JdG4OUO5pMtq/2f8LNn1dy0M73m6LsRqDUB/gsdN5qhTTZhS5+UA2hZSALbEVfVyVxsrUL8ykfEpIHSo/fpuK7AcDKHOf8g2NpooRw59T+Lwi2dA2gYMXBi7jl/Q+v67hUDCu1LhchznvI1QZUx6/iUHUnBwqcEKMeGaRf3FLgD0zP1NaNXxyGDj2GoI6tsaBfRlgIcS/Ac4qd83D8ORfC3mV3I2czo4vJEQaPxBdzI6jIqjnB+qrpeoI0qgq3wbmfgnf5Khd0URfv/WCjheXoh9AtiyYReFEgVmES4oXu1nveA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 12 Sep
 2024 05:46:59 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 05:46:58 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH v3 3/3] nativesdk-packagegroup-sdk-host: Add missing perl modules to RDEPENDS
Date: Wed, 11 Sep 2024 22:46:28 -0700
Message-ID: <20240912054628.1539323-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912054628.1539323-1-Harish.Sadineni@windriver.com>
References: <20240912054628.1539323-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::22) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 791f9534-1c0f-43e0-d774-08dcd2ee5126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1PPkdZ9KLPHIABmIY2Itl8i4xcruvvN2gwbs83R8avZV+x329OCJ+F9WkQ0t?=
 =?us-ascii?Q?6+drHIW7WkRq2okTha7NA9BgIhbel1AHKkXkzTvd0b51D63kiilEL1+cAWYA?=
 =?us-ascii?Q?f1uWNgIRsR4rtMmUz67olV//D/1ckqJznF+jFOtk6vZgOCueJqr2dtABPRsH?=
 =?us-ascii?Q?f7aRoRMbOWAjgRabTwmOJXR/Pdr9dqwRKVKtnGhKKWQVU517sJRZb4VW26n1?=
 =?us-ascii?Q?P2+2WCeTBJvWkpF+3z//griPDDqyrWifg6k6lmfNAfs0RIIuZuicr0wPEuRx?=
 =?us-ascii?Q?DcHP9inyg8RRFwkSPdXx8icCDYYuuRAlz7xaohBjmm8QWT7GuwUxiAyDIpUX?=
 =?us-ascii?Q?2sRF0a3K2nwT7Vwp3GK+a0ejHFjQnAi2cBB0e838m+vcyq/jaYzlRLo1xhub?=
 =?us-ascii?Q?4B1YgFf2Ym6G+o3q2Alw/jVd48paQYCDmiTcY2o6PXmyUzgHmLhQ9pmwC+S6?=
 =?us-ascii?Q?oUEU4XuLNb+fbMiRImNfBIi98iPEhfiKFbjSZi3H4BdkWrG9PiOO/dYS+Ae4?=
 =?us-ascii?Q?mqLsFFgmnfnXQ+rJy5mIH6mSvcHij7gMkMACN0z+rZu75H9K2c3QwuRJGfzD?=
 =?us-ascii?Q?XNHXRbRg0asOtaKyepggH2I8oeKrzyyddQOXgx1oOwYMIAGjnpIPq57OJMfN?=
 =?us-ascii?Q?u1d0dX21QDjB1YcI8ZltzE8H+72NDnhomx6+KWK+aNNf+Za1plPODTPZps6n?=
 =?us-ascii?Q?DpBBLFU5KQj8YPvV2AH5YCZ9waaojHg5A3ORVQUS6diqNeJwrwVaDtzLV6D6?=
 =?us-ascii?Q?1wZkyjDxqIXtrS/Dw05k6UoMO1clw3P4C7H3vlgLtMoJ2IjBoB2DfpzeoCJZ?=
 =?us-ascii?Q?juMl4Qz43IgwmvA5BxDuRgsFk/NNjmc5ARxxwf5vAK/CYdstGqqNHlmF4eDD?=
 =?us-ascii?Q?KUgzApG3a9y10aa115yuIFJnps65HDnTmiak5JUuK4ttT8N0VPtXxyw8CZhi?=
 =?us-ascii?Q?lgdXgbdUOtYmlqUe6Zkxe0ntrPqXcFDfKKLCEzIV4TAyDulHWmH5wcLKzZ6P?=
 =?us-ascii?Q?M3iRqw+QV6Nd1ZFX9oiwzLZ82sHVQr2dIUFKucR1nacXZ7uBiQkhAk24NeEZ?=
 =?us-ascii?Q?MduQzjCVL9CKyJX8HcofgkW3JVgMwvfkLa7jCHGSYiL5Li4xwlTaoAwAV96U?=
 =?us-ascii?Q?zQrJnK02hLJqztE3rirIh7UdWSzuTkkZijwbL12vxLWKJBCWVHeenLBee73y?=
 =?us-ascii?Q?D7OIcm4XM4qORrj9uqrR96/wuNRw4IU8b06F5LS0F9MYi1ojvAhpIAHHZvde?=
 =?us-ascii?Q?Paouxoo7WouJ2VE81cfqInPTNgTTHr+G9Xe+KXkqyXMnj9g14EeehD6LSGIR?=
 =?us-ascii?Q?c8zMOPjGTOjsbdk4C4JJA2+FU1X/bA8ay2GGRAJJHGTxid27o9C2QMZfjXN4?=
 =?us-ascii?Q?ssuWIu7e++t3wvNWpKgJ67xUZFUyo1FY/8pDe5g+nbgrVkuqAA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Yr4NQ0Ze9UnS9QhCT+no0dnfkbZF0h3ni5sqGHo6IUn4YrhzGQIwrGM3tu+x?=
 =?us-ascii?Q?dqmJvwWw99zt8gt4x0XyA7+nqHGMRmuS2F++ojGX0SaR0Mw7V9e1OyEFyxXB?=
 =?us-ascii?Q?JfytShn6v88s9AdvTG4wz4iyWcYXmCUpmNVY3tHwCZ32J6vYj2naznVNgdUR?=
 =?us-ascii?Q?NcW5fCswi00E8ztvqXHmHnTvsV1aCmlhQCMZOJyqpdI2vgmS5zbmSoujYXHm?=
 =?us-ascii?Q?gF4DTeNkBieMZkR5ZkETQJKEY6c05k2frB419Qxj4rC67RbIU9cNV/Jtds8G?=
 =?us-ascii?Q?Cpr9V0MC+yoQ05aHJ2JAnp+JryqdUXIjuiIas8444Xk/oZydB3fDThKufiWI?=
 =?us-ascii?Q?fs3Jb+JySsrJFr4fASphot7+suEfdUT5SBHmR3TL5libIbolMpLD+Ue/PVpS?=
 =?us-ascii?Q?reesqprODJHO4IEtDnpGTE69gWhqheNK3ZzHVePV2+sC72Sf53/tWNtEhRrN?=
 =?us-ascii?Q?YWFDaO7SFkJJd4jshjym72Htgdy9pgWjQPkdmZnLaiX2n/v55Y82XqjNyYW6?=
 =?us-ascii?Q?6Ps/i+mG3wcDjhTotsvGPDBF4//5W8NnuCjSHmK/+ktv24X7TOv8lZYmYfGD?=
 =?us-ascii?Q?N/i/R2+qND4Q4zASs+ySrMzvenaBbEM/87tPQfpEGladG6DMkwJyHnc4Tmy3?=
 =?us-ascii?Q?k+31Yt8ccUH2RNAWCq+9VbwEX+a/KXzPrKVdMqIOeaO/WQVZx5eZyPSpETpj?=
 =?us-ascii?Q?GZzes23c/P6dG+BzuamaEvAtk3VWpK/DTIWyy/xWf/7Z5FIzkMSUtWSngyF/?=
 =?us-ascii?Q?PePO8W7yEssBWUfSE2IQiqpPoRX+DIzxfY0/vzrfosmBwOdz71D/IX7lcFAV?=
 =?us-ascii?Q?+CKvuAbsDfPC4AhhJ3EJSoCZ09mIG5YYKLD+wIgDUIXEW4gs11MVSWxGSQxU?=
 =?us-ascii?Q?pBi1JYrgIJGRrhCKARyvi1ffMdtfA9c6ITcEcqM0jUXb7Wz9LFfK3Iz3bnsH?=
 =?us-ascii?Q?FZzQX+4jSWYMiViuMEx52hjj6aWkRghh6kJ1pf9+coXDV69+NCliejTZ+XMt?=
 =?us-ascii?Q?5gppHsAoMAHxsBEs6M4bKu7NIGtPiB+BMB4YCdt/ZCq94yERBI+wtKqzVdQa?=
 =?us-ascii?Q?2DvcP4VD5oPDSPshr5BX1NcDdvjtjQcuP0biaGGsMvMVDTNUuC1cyATBUWBW?=
 =?us-ascii?Q?c6znuNRPUhMUwyc7+2RBFBlRWJy1O9Vi6dYX0kEHfVse4rkEULXgh7krYfT7?=
 =?us-ascii?Q?O/YTIhcy2/HZl0t8OV3O0e9jUAvbZbDxFz06rsjsIwYmPVkqrkzi2J39/Zle?=
 =?us-ascii?Q?XYc1nxlyPbDc+3+wHiUP1GAT96lN531qoP39v0A0/ofFPMJyJn49g/aRZm9e?=
 =?us-ascii?Q?lcSjhlMFyzlQid905lp7SLCig39UNgmoOMcc08k9RIZs0yKslssntGMGTomg?=
 =?us-ascii?Q?QeInB76J7RL/3K2PknCIh1c0u02NIEUhenJ1INRPL8nGyapGIjzmuMwe2n80?=
 =?us-ascii?Q?2991/i76FjNeohKppScQeMNacfFd/iehYSajpouus8etUklXWiic1gxKkSAx?=
 =?us-ascii?Q?E9yjeYtj8i0yaqnFmd3UWokMM+8KZ/ICGCr4C9fPROoa/cWI7odIbLA+RipS?=
 =?us-ascii?Q?Nw1zY7rQckWUBSjz61vNqxPiuxLkLMGKUOZQGnY+pD+oM4z/G9qTWS3rrNY8?=
 =?us-ascii?Q?zQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 791f9534-1c0f-43e0-d774-08dcd2ee5126
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 05:46:58.6596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QrPv6D0kZdCOhO5GxxC7mOTZN7V4RzEMMgcsjiE/UJRAvG270GFLIZd0HEywuApzu2KzD7Ko4SIWR09Rr8MPicxjUeGSaIIT+yUE0/iIXKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
X-Proofpoint-GUID: m4FOGB6hH2gTnA7DWLmSbqkzkpWIj6qE
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66e28054 cx=c_pps a=fpyyTn7Kx2iM0+fj1eipXw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=NTz4VRETjiqMflA338MA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: m4FOGB6hH2gTnA7DWLmSbqkzkpWIj6qE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-11_02,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409120041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 05:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204422

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In SDK, missing perl modules causes 'x86_64-wrlinuxsdk-linux-gp-display-html --help' to abort with below errors..
  - Can't locate bignum.pm in @INC (you may need to install the feature module).
  - Can't locate Math/BigInt.pm in @INC (you may need to install the Math::BigInt module)

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb           | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index c1d3c25060..70a7d3e494 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -30,6 +30,9 @@ RDEPENDS:${PN} = "\
     nativesdk-bison \
     nativesdk-flex \
     nativesdk-perl-module-integer \
+    nativesdk-perl-module-bignum  \
+    nativesdk-perl-module-bigint \
+    nativesdk-perl-module-math-bigint \
     "
 
 RDEPENDS:${PN}:darwin = "\
-- 
2.43.0


