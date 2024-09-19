Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC652CE8D64
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 09:43:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15692.1726738977849398295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 02:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9992e69025=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48J4uQ6p017660
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 09:42:57 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41myq1wbfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 09:42:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clBVvG35Tv3t+xWXrx9IbdH5lrnCOn8jof3XP31Lpohe6DmurZ2dkWSytQZaNCOJ6VbUvkve3lCK7KNJbHkoaU/ZBZrkQxYIgVjje+2/N3k7RcKWzwcV1yPhty1wJbueRIGDgLOgPrT43ZpLp/9EJzkyZVdhR5y+JLzDzkfPpIl53/ERAySb2V3vy7nOxaAzbkSZ8EsEwKzK6JRlJjibIV1D7NJdH5H0cTK8TQdu8rvv9zp0MtZkpV2noIH4zB/M0/n/dDJY6KyH9/7gdGPGYIuO8ebsxUFNQAxnSggrqpu5vzbBHSB53a2po33qY4Xw9ZND7jFLhz2HmXwAiTOTIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGd7XlnLxjMfY4VBC0GPPVE1J4epA/OnBerirEkisXA=;
 b=h4xyv/cZzmQ+4FU5XnUjKEJdGplymnXhwlkyCl8Z6mP6lflAvMQMBmBeR0GtRXwGGH5I6hjiyOW3BmR1Lkm9bJ7x9kn8EFyv1md8YTyg+w2Jk2iJFjFJjL6W9D+OOyOD8PwurDH5V7NkPmo6VFpJW2AGT0bh3eIEiRL7+Cahm6w/pMSC0m0t+Sdu+HcSLO3sVRysKe0bFE80hfQHK56yAqKc4qTpzVu5MV7RRfqVdnpqIDskmi81TEeuGb5dGVXC92zkYasI2mMIkFYltTO67I3BO+MJZD6ktre0JdX8TP7jQbqL+DveQyo6XSSoo1bYfy/aG4rCt3q/psjVgM3ftg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Thu, 19 Sep
 2024 09:42:55 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 09:42:54 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH v4 2/2] nativesdk-packagegroup-sdk-host: Add missing perl modules to RDEPENDS
Date: Thu, 19 Sep 2024 02:42:31 -0700
Message-ID: <20240919094231.3840077-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240919094231.3840077-1-Harish.Sadineni@windriver.com>
References: <20240919094231.3840077-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR19CA0083.namprd19.prod.outlook.com
 (2603:10b6:930:69::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM4PR11MB5293:EE_
X-MS-Office365-Filtering-Correlation-Id: abe65e57-fbe0-458c-774a-08dcd88f6fc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MHaKVc/asGGyMfUW8o43iLu1hF/nPMjM34CcpPGYUzmajHWBqJ5wMEWzb6Ls?=
 =?us-ascii?Q?kk0ZWsEAxMok/6mRt0L5PgXlqP2C5jqkEXucZYEMmOe7bhd9aCxMtpgrHm44?=
 =?us-ascii?Q?2serEsQ57AwDCMOaNfCX+2sQhAaKdRaXOQHf88qLi/m0dvBtw8AoSXrY2De4?=
 =?us-ascii?Q?55ZYolAcfcl7XYM/ARaiJnf1T/GTZs8b8wmFiw6UP3TDkgvE5tXLAdmQM7qa?=
 =?us-ascii?Q?xz/TRWtzvCJVsXOQaKAI2Efaf1DX3Joe7hHI1Div53//tFCjiaiVnUZSbAgb?=
 =?us-ascii?Q?CWVDNumBTGyGEGuMPWnN73cZm3d3ipcKTfyaPNHLJITfwI5ohiQBMttLaq/k?=
 =?us-ascii?Q?CKHU1i53fc5KMQvAtsB6uShy/pKhI8t6JUL7LELLH4PK2jzeDqDJyoYE5pzm?=
 =?us-ascii?Q?+3pHNXCB7tK2Yo39Jr9SVSAYi2EibqvVk42ORbXzd2bRnuTcRane2x3F6ikU?=
 =?us-ascii?Q?R1qWyrqAgKwLcbQbQXkewnPPRBAAEOXkBPGo8XwVpwD9+A3OQfzS8JMyKgTW?=
 =?us-ascii?Q?ysa04XqpQcL4maaMzOVy8NJnjQOTwSgm73O3Nw9vkuCuO2BZo2/k/KGGoFIO?=
 =?us-ascii?Q?Rrd2/fQoJjDHIaLI21Mnm5iuHdAjVaf/Zu7q+Fx/sb+ywTszr439w2mdLZ4P?=
 =?us-ascii?Q?MHhP7pcUPI3vpVZxVhu3T4j8xGCb/K/ClJIsN6BbIOK7adLKVbI2ng6D9Dl4?=
 =?us-ascii?Q?IjRqXMSfbG62n1MKYJi4CME3JR4hgy/D+zFLv+b479nXXW89XbtnLvWEw2wd?=
 =?us-ascii?Q?ADCXDqUZu24Bibsn1pbFvwBPuF8AgNE1GZ3YgD4Opc1fKjec4KTy/rvIvxgF?=
 =?us-ascii?Q?+kIBR0yOOhMbsCAPeHpt6CGxQ5ECbD9DyFhlzF6dwTuXcFCeriz3/WRwwD4S?=
 =?us-ascii?Q?x1sRLVtgV8QC4ZPH1AHLgKLXIVlh7DXQP2/Vb8lWFH1mhECFs9+hjeM/q838?=
 =?us-ascii?Q?quCezROueTjhypk+O+rXSPJFI+lfssBhyfPSwUB8tAW7bnCnKW5+hXqbB9WZ?=
 =?us-ascii?Q?u4DSzJJjK54aUQ2ohQhTB4ReGsEExusA+vnIRL10l166zzglkIE+Q4OGqEuq?=
 =?us-ascii?Q?6NjPhhmt+CCF3JLAgZoZLLRbeZVGqlNeVxt2vcoSRaOCk9HJ7uLlDJjnIHPV?=
 =?us-ascii?Q?1zgfuNcPKEk8GPYYRd0nbVrNZ2vagp22kUQK0FBhyyja+9IFcpHhjxpJyws6?=
 =?us-ascii?Q?LU0bfWlrMoesKypmgu9p7eabb0T5PSnB5cHej8p0GrKvKk15uqbKDYfgSwk8?=
 =?us-ascii?Q?XXNHpA8bEXUO/sn3foxZ/caYfoQjHPcWGe7TNz7VhXazfiEbFHOaDu9jCBx9?=
 =?us-ascii?Q?TetoEl01H0dFZiNULLoE4XVCMgdasW6rDsbEKgb5toOcJqQGndbmjEHwbRiX?=
 =?us-ascii?Q?jkp6XLBsYdAelcpvDGsWpeEvGYWodPhdvCMZbeBG0YzC1aBJOQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5xxdf5SDzn+1FUkxZ2cDkcDdXFZOxn9QfT0XVONChcPODH+H1blpJGG/2y4W?=
 =?us-ascii?Q?wd0nytvieC57e/7SI1HKfHe3fgKR7zuh80csHjOtdeOwGSH8yeAcex83ITWr?=
 =?us-ascii?Q?kjrvtdZdIQ3eD/2mGPwLPA4ecoC0YFHs/mKCl++h7XYnBwYdECsFoZWpkhBJ?=
 =?us-ascii?Q?pGqaPvQQolqE9tENLx6pwMQNufXaHp0/uUhpT2Co12T79xyUZd6KFPiMWSlA?=
 =?us-ascii?Q?QjWxTkqRC346x/T6D4y5OJvvmaRysZrLT5IXzbFp+qhgbaPhRxC3Y4kU/loh?=
 =?us-ascii?Q?DM6YHzDiEupqvHB1HX4pj9orqWX3QZ4o72ZZYER/6SY54oXSFt/S6Fs1jDmQ?=
 =?us-ascii?Q?wucSTpFopmEjDsJv+n2/2KMVNWaTSgc4q22tWQLsn9kLloxcCFvt6pCBVK1a?=
 =?us-ascii?Q?ir9Xy3/lsGdz9jbM8ArkYelyJafdO3XU0L7I8FCUC6HP3pD8UJd5Lmx2izI/?=
 =?us-ascii?Q?3edcjk78HFq+F5T5CNMb18r94RiNrvVjBZUSAvnZeB6IDetNqk0x13493lIY?=
 =?us-ascii?Q?48OT77/Et3kG5XpQ1amlETbrGSY9ocx9MLWoz9BvwJ3mQgWErP0TQoqdd1vS?=
 =?us-ascii?Q?pPDbGsbCK5YV59WPRZslvLGCALjN6d40aej2ytFI9kjwN9JKGDTZT5c0nFGA?=
 =?us-ascii?Q?oFKvmK3+TqFPmvCRKF3H0fAd6uNtNH/PNX9mMiWJVI1vKXeNsH6OOedFdLZz?=
 =?us-ascii?Q?G1yB+QNzNBSdWHugwlV+zBsWpel+YqGnDpLPjokVVJ3/OM6z0Ec7J92zmOSp?=
 =?us-ascii?Q?9KF8FA3d4BCglPAe0aZEygrQCXEZ51y5tV0Jn6w8uPdZyahN1mlWy/d6PWSd?=
 =?us-ascii?Q?eEsyB18I8IydhQZZOBjTs3zh9yNAjKb4d9OR8KNIreVFnHWPjBEfLsf44j06?=
 =?us-ascii?Q?G1J+yIh5KQAbpKs1uw46bz71iTdJS7ZjJE5migakkX8vMO8BRljYpDcSRSFd?=
 =?us-ascii?Q?7tnpfZkpdRmS9B/0jVFIAWdwY71PsVSmaUUuYdRsues8iUL1nZusRNFbjE1n?=
 =?us-ascii?Q?xtzDfeEal/Cbj0/4BrfM55Oxb4JXuB14uTE/OU0tfVujJZiQX7d7sYJm+cj2?=
 =?us-ascii?Q?vg/QFa423+JwE+X4WR7gSmJ/5F+o8QAPQYrQmrDbbZil1kXOGRinX9QLbhXi?=
 =?us-ascii?Q?rReyae6dLL5PlGG5FQU3vysODowzIJdqfEdLmiGEcb/w6jh5Yc7zSsUIP/UY?=
 =?us-ascii?Q?017O/FC8t5XLQfVt4Y78qsl4gHUT3uEVBsPOxvZpZS0kF+Cb3ine8gukkpDH?=
 =?us-ascii?Q?PbaM3TZyfMasZUo4taj/TyL2ACCngYA9imxTBE5acrYci54+YbB5JhTtuNFU?=
 =?us-ascii?Q?iVDbqcoKLBHTpw70bj2JGR0YvGJ0/xaxn/TUdEIbBuHgxpY9KBPg5LSa36IL?=
 =?us-ascii?Q?DLLeKeJ58KjEwIOEq/jmwJwjnEUu5NgrKAh+RYBNZvCZpB8CcCl/VqS79eO+?=
 =?us-ascii?Q?3GNv/nPghzOv6bSkwPmlp/8NIDcqkopcdsdBDsPBcb8qmuRnYB6NOxxa8LHH?=
 =?us-ascii?Q?RPDfHQifKZg+IxlHVhEvUd7sUITfeI7Xg8QWTOLs7gwN0qLPVFI1QAmBupMQ?=
 =?us-ascii?Q?MDjNtY65Y0kKk++ygyNe7IRPkTPXdGK0JApowUy72JS8ACbo1pODh9oRja7O?=
 =?us-ascii?Q?AQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe65e57-fbe0-458c-774a-08dcd88f6fc9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 09:42:54.8873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApcwBoPGg/pcDNkyHXFzot1WKqD5xvShnopYL2fcxU/Nxi3/sVJ93t50p6is+ztBoka06/cnA5vJeKign7VceJhnoYKi5zZ+1lIp7g8ZrkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
X-Authority-Analysis: v=2.4 cv=MYM+uI/f c=1 sm=1 tr=0 ts=66ebf221 cx=c_pps a=JZW2CxG2E6UWpsn1SfDs7A==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=NTz4VRETjiqMflA338MA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: eTPx-ma2lxHgR-Gcp0WvRK63K262HFaD
X-Proofpoint-ORIG-GUID: eTPx-ma2lxHgR-Gcp0WvRK63K262HFaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_07,2024-09-18_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409190062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 09:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204660

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In SDK, missing perl modules causes 'x86_64-pokysdk-linux-gp-display-html --help' to abort with below errors..
  - Can't locate bignum.pm in @INC (you may need to install the feature module).
  - Can't locate Math/BigInt.pm in @INC (you may need to install the Math::BigInt module)

By adding the following perl modules to RDEPENDS fixes the above errors:
  nativesdk-perl-module-bignum
  nativesdk-perl-module-bigint
  nativesdk-perl-module-math-bigint

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


