Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64627CDD567
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 12:49:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18742.1726750167511347100
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 05:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9992e69025=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48J9PI5h018251
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 05:49:27 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41na0mn6bw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 05:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONnevKpPXUv/QyLKqUAl3IVopbndg/6dmWZVZVa2wPXF44S4XIrWrRtzkeKxWZTIcVbhBzubiYN9bCsM0CEvR87RIu4IKtJMS5Io7c+EWplN9IFGLd2oFexOucUsO5wsb3gFtUCG7izgMQMMu1Fppo8nTLVQeyLS/0Jt7qk9oXhPkPJwNwmi9GSid2kc/JF9sRbvAhw7mXcL6tWvFehB3ocXW+YkmwI4bk6I6JXWBdbTbjgJvjOvdGI98CmOEeYfhsYX1W0LOvby/iiQo5IUWvfjvbaeLc8zIvwYlCrOgs9m5SEdG9cKvTYqI+0AfmeRU5+sOI3SaUQIrGxKsQs3fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUAJ19lsTMUzVIOSSsAToA+kRnTGRFCfpyVMm2tMHWc=;
 b=hPVmurYXtlvsRue4CF25zLq7jNMzCR2zJUMqFzN/9MdTFaGSIjdWxmUClrYZScIRGU22L8VbMNs+ku8DwoV7D5uxqLWq89In2bC/PN9b8MimZBAtppOwU4kDEqrYt37VveYFZM/z+HaKn+6OPFVUNMyQqR2pzslpmvPQEe/7VO5KeSZBwaRAdC6ZNXrt4AajCuVSUneptrv3FrXy2pe1xVEOq6Anc1bfjbAMCS1MAwMvPbZJq4RoRU9Dm0VHZL81E1joIugUZbWhuZFFkccxPkM9v0SOrQ4dWsGWVdFmVzzNDvD3KEy4XwunG7iJJNIjtk0UHviGzKuoNwcRqiOCBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Thu, 19 Sep
 2024 12:49:03 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 12:49:03 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH v5 1/2] binutils: Fix packaging of bfd-plugins
Date: Thu, 19 Sep 2024 05:48:47 -0700
Message-ID: <20240919124848.653457-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0384.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::29) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH0PR11MB4792:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f080b12-fe15-41ab-f377-08dcd8a97094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GeXLfpBu0w3VusGDpxygaZXwZWfPtbeqsZeshAlNUHlwsFXiNbUL29SsYDIh?=
 =?us-ascii?Q?vg7GKGSRcTdzR006QCFbNZrtJuDhZnH2KADXwTehaCm26/wbNKlvjoOUCeKv?=
 =?us-ascii?Q?HZ5fPUKPxP1IYDquxloXkb+xceZFp97PxBv9SBQGnbuvD7LMxrpy7HO/A8N/?=
 =?us-ascii?Q?bRT1813RjGIqPXxSIawiFO/x3Mvks4eTRxYN2K8DUYByqsNXHJVZtD89KG2i?=
 =?us-ascii?Q?FjgfoA21hhwXs4Z5Hyd3SKgTH9x0kRgV/dkNP2b9WAyKiFt4SsRcwRx4tubp?=
 =?us-ascii?Q?vLiRgJc+7/SbiqavGXms5bXm09IWZicUC0UQ8RLPWnyhKDPvXp/XFjj6ttBF?=
 =?us-ascii?Q?9GmXk+bPc01CL/ZlL6gjqgFAsLChKn/xVGzDryH98MrGfP2U/KVHIZceD7Yz?=
 =?us-ascii?Q?VN1RRE5VZyZDB1sNx2qVV3JcLjjjQC0A+9LN+y/lUsswmatsny3VqN0EY/sF?=
 =?us-ascii?Q?KLMgK2D1AEYjI0sg7CQJcbsFyxpR1cxOKbTD32cDZa8ZegFD0NWc4pGjRAjA?=
 =?us-ascii?Q?PteXTxNFxQeTFiRCuHOCupUCqbQRu9s4O08Cy6tpjKLxkFfLz9+ItzqSfSF7?=
 =?us-ascii?Q?bw8uq6xjpRofgaWGvuA6mMTNOZdWwhr5Dsl3abMfpYLlfNiIAaspNquxR1gM?=
 =?us-ascii?Q?9g+GPMRvpw/DFn7R50Bq3AN+m5agftrp6hAfhP6d1z2CpB4gvzxY+yxvGrbf?=
 =?us-ascii?Q?qE6PCLpCyniHxrdSNyT3qSwrpqvFSFmp8h3BX2lB0SBCGxJdS96mJ/2kiAc7?=
 =?us-ascii?Q?zlr8r0GMXwilo6Q/EXFwABmSvu4O3U5kcQD9FXkfKhfqNuaTgHwurW/Y9QdO?=
 =?us-ascii?Q?E0myVYJIs4HtF8795Soj6wqS4tyG8hoKYNEKnIpNR0/Ehpm6SUlzWN9gxSkJ?=
 =?us-ascii?Q?DZAoYifpPtluhqiRxdpVuiR03vn4dz3T6p1VGG971HPPy1vCbTglF/tL+zvG?=
 =?us-ascii?Q?ZaYr60yPL8v5U4UorQ7BBYPg5X0EEfR04H58Hv8FL/vCeoyxbGYHkeoQmBN5?=
 =?us-ascii?Q?Dzp0Fl/YZaAI9oP0wSYV6AbVSq499ap0haTWl31gCXfiQlz78HDFx7jtbAx7?=
 =?us-ascii?Q?QvcLshJJbqBOOoEHMLlYeoXY0os+x/jVqLsnktD7P9Tr6dvWjmyVnRUP0T15?=
 =?us-ascii?Q?c5Pj+CdgGf3ixecFh1xl6ALqRqBzCx9ULIWCJ8Cmk/SIQQg0m1tgu0kQ4swa?=
 =?us-ascii?Q?PZuP0b4UMlMqgt0UJsLzzNx2eNS8LIhaC2ORRs88B/xStZ+00yrvSVi2rcYx?=
 =?us-ascii?Q?+HSu6DhW9ohP++wkqlfph4u+UaMT9ck75K6DaPzPO7d+TOSAoBL3OCOg2h5T?=
 =?us-ascii?Q?URYNNq0Qm4VOxiY6eTYyET5FSW+XiQdqJ2NPslWJwOeutDodvkV1wzVXE1Hc?=
 =?us-ascii?Q?OYngzvC5fPgAWdQ6c0nJaqcQenvy/+JN0D4/nW3dbH3IJc0cwg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X82sA/7qc7OPsFXq/eE07Dp2d77g9TW2aoBgUlQY+MW2cnWA1UytFruFRjsQ?=
 =?us-ascii?Q?pLO4x6DFbWa9xCNcen+FPu2QZJZx1TQjgUsGmFAugdR/bLWeRzbhdxOdGq0b?=
 =?us-ascii?Q?YNdk8ROGGQfTT8vlal4Jbh9cudvT5kDdcbS0ZlBY1SINUXwUVXm6MjLcl2an?=
 =?us-ascii?Q?qEcGwehF7nOsMQr7pg5wF84510hLYBodsgMLPOnTd0AyMb4DpAlXw84a2CXf?=
 =?us-ascii?Q?yTya4qAxGQSJ5DbnXVpWzZakqJbU7R4GLD2j7B6Hx1jU5j+uw3F4nPhC74qR?=
 =?us-ascii?Q?Jh/Wz6dl9xnkkwCNZ663Q6uu+jOnqu/96abiWqJtTB4s8z6b9aVYZjpxJHpk?=
 =?us-ascii?Q?gO3/A9TA4l5GhOQiMyUXO492WcS/+R+DfA91/9+wthMFcqYjsN6qgAsNQ+AL?=
 =?us-ascii?Q?SK3SrTU44S17D1P/9El6Lj5Wjwp3bHm7NTsPP1lsiKQaFlwwAkECrwbnlme+?=
 =?us-ascii?Q?9HxHELqsLIoTHoGwqAKUlUM7HyRg4aOhIJZbZmEz2NW0ALWjeQ1ckykcNetn?=
 =?us-ascii?Q?RRjEh2twKdidXmlxKLiRh2R1f8mVlQF3bzzoGtdk/3zlJKrr6vJYvyeL4buu?=
 =?us-ascii?Q?kc9rNG+rQzzmzNiJJhwU0LZkCbTNN1ywfo7bfEuNhWOwbgZnelP7v4qqfPkz?=
 =?us-ascii?Q?ToFSESHabv8qw4Mlw6X7I1eZxbbQL29fizNB3wLnMvpAZ/UDeeu7RcLCtart?=
 =?us-ascii?Q?21PAb0fGRE0DWos1vKu7zQFABAGd9I8hH1KrUH2TCBw600AmAxmdVcEUMCzg?=
 =?us-ascii?Q?nh6EG6IEBMXRl5ATB7NgplkuyhVO6rNdJ0hW9tkcDi3NagsdcMHRSAqsEZzy?=
 =?us-ascii?Q?U8kZeIEVNY/u5rpbIM52cRA2aw/5OWnwKdZaIW2KOG0ecTwrqKXxousUcNTS?=
 =?us-ascii?Q?7u5IOUAL32sZnxCULikPKlr5Lu02o7OQTae1jWPshy01fGUyjGhcbib3yTU+?=
 =?us-ascii?Q?4FLD4sk6BN+k1U7/H6UoYAswMKBhxxDg0opXg91CbvMEcO4ROOSaLbl6AufF?=
 =?us-ascii?Q?umeeInwQEKo/2WOj7tdPhABOm4IOaQbwfPvn2wuwWbvBjmJ1YL4lFez11F8a?=
 =?us-ascii?Q?ZNKbMnUzIV3hltMh/fUxGanKiPSf27CLaaWAyJHuQa+rCC0Rb0tuvPzwvVNe?=
 =?us-ascii?Q?kfNUrUb2aFMxDPjNRv+igmdM+EKxAu1qu1iQJ2uT+UlmR7cKlOZt8E3Azd74?=
 =?us-ascii?Q?4OjwubyjgCCIa6EYduJ5HM8+/3zn6xe3PZ5AVGRq1uFXFjqnbvxQ/t1GZwtD?=
 =?us-ascii?Q?0El260DGO2WrKr+RCVprQXJQEKDkqiyHPAUIPB09ZdCwA+59zYDv+cW7llgN?=
 =?us-ascii?Q?I9Xfov9MITwVfiIQLqDqR38kafoenRHM1CytzqX6h2Q2w4ZTNwI3RDVT3cYr?=
 =?us-ascii?Q?aVQGJFOl+SB2BEd+i/l/uP5M0laO49IAg3oIBxfJG5vjktqQCur28FrM4Znc?=
 =?us-ascii?Q?MtZnZr5fuyzlPqcIaqmUhNNV1W4dQSLmFFUpv6bxsV3NfGOt3I2yu5pswlON?=
 =?us-ascii?Q?fuDX9wOm9nJZ3ZqCeE9qn/r4E/hQp48LeUsFy6KVwqW4ySKGDRW/x5vJpuei?=
 =?us-ascii?Q?JOkl5jXglD8IUcD4h2LGmCKvaRDIXrEs35uP1JD0Tb75d9VvLzzNC2nrFy15?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f080b12-fe15-41ab-f377-08dcd8a97094
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 12:49:03.1144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4jZci92q8ETljk6XZnM4UIpArIL1jJ4f7dZf171IbfaQ6iT7EEMYbYuyTErvYhDyq24lstfdkUQghq9Q0cFOb2D3yAo6Un8+wr5gu6vfww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4792
X-Proofpoint-ORIG-GUID: aCMOHmQxOVCTxMiCTJi07nlmr_4CdPRo
X-Authority-Analysis: v=2.4 cv=d6+nygjE c=1 sm=1 tr=0 ts=66ec1dd7 cx=c_pps a=yfraj20uO1EtZH+TM7jpHA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=VzVOzZWKrabdcsoWxU8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: aCMOHmQxOVCTxMiCTJi07nlmr_4CdPRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_09,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=704 spamscore=0 mlxscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2408220000
 definitions=main-2409190084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 12:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204682

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes the follwing error while building nativesdk-binutils with i686-mingw32 as SDKMACHINE:
ERROR: nativesdk-binutils-2.43.1-r0 do_package: QA Issue: nativesdk-binutils: Files/directories
were installed but not shipped in any package:
   /usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-w64-mingw32/usr/lib/bfd-plugins
   /usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-w64-mingw32/usr/lib/bfd-plugins/libdep.dll

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/binutils/binutils_2.43.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.43.1.bb b/meta/recipes-devtools/binutils/binutils_2.43.1.bb
index 2cce40f1ef..eb7c16cbc4 100644
--- a/meta/recipes-devtools/binutils/binutils_2.43.1.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.43.1.bb
@@ -72,5 +72,6 @@ SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-al
 
 USE_ALTERNATIVES_FOR:class-nativesdk = ""
 FILES:${PN}:append:class-nativesdk = " ${bindir}"
+FILES:${PN}:append:class-nativesdk = " ${libdir}/bfd-plugins"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


