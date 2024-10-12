Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BE6D1A442
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 07:19:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6026.1728717544465785145
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Oct 2024 00:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=00153bb180=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C7HpMK014440
	for <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 07:19:03 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 427g38g576-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 07:19:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNGkXWPfbdi0Wy0U9uIMEWZYTCLIsDKKG6vsfkfL092IjaC5g1zygjT18ZCImWNjWqYeHxgzMrEwNLRLbV5GVh9zmsvlgv1snnyrqTxCtrtiIl6UqbaKGFP5BsIsvmwqyi/KMgiaiyieHZVkpeRjsAAnjAfnLpIvcDY9HFToTxMbSvsy1UCNzKs7OGH5LPxkeGSBdLVd2Q+KGm09bWkA0WWrJpXcADWQH3eRkBpJADtrp7jlEzmoLp3sTFYXKfWYGauboSk5qbvfQCLPFwBOBpyL1NiwEIdQZl2f8yYRJwj5/uETVp6Z5XEf6He3sVIjQ95N/biTvt1fQE5yV4R/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsbhEXlvqU5SUC84UVuUKP1nK8KV38BbfQrR87prdUQ=;
 b=SId0hezCT7yMaIJtQev3D/K7nE0YDJ6G9rpVqb8RDGq5huqXY5t4EBoQpxsx2YdIkaAxNGjdXJhyxQZDBfhUpa3+4/9RqmASDSYVO17ZcY+E8TeTW8rEi6crQSaMs9qg0XCGSahLSPmei4tUkO7NFjqfS4uDWoOSE/JCcExGLw6Zs8EVN3pmWntl+XRjcJDDKFJE8w3/zdYaGwbTPzbdBLpz7RA8zIyQqNjgH3oQEmgK4F+QNyoarXP/ZejjZ/zmlQMSqhBsaMvvHVL5PPJRamxZbzSvmb1VVkV1rM5NfChmTOPeKelfvGhm8blQamHQhnCQ53zvfW07m+BIkrPfuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SA2PR11MB5050.namprd11.prod.outlook.com (2603:10b6:806:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Sat, 12 Oct
 2024 07:18:59 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%3]) with mapi id 15.20.8048.017; Sat, 12 Oct 2024
 07:18:59 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Fix racing on building gcc-source-14.2.0 and lib32-gcc-source-14.2.0
Date: Sat, 12 Oct 2024 15:18:44 +0800
Message-Id: <20241012071844.2748585-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:3:17::15) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SA2PR11MB5050:EE_
X-MS-Office365-Filtering-Correlation-Id: ed7f5d75-8bf8-4a3f-750b-08dcea8e23f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/9WbKCIEl8RNjpflH7EwCLSnkYTcFhISyUGko89y4Ct98FIK7DqhkQD68Lwr?=
 =?us-ascii?Q?/FxEBbUf0g9U4F0Pyrlk4XIamuwpWRxPDo9zQHBZBA+rvXuWJjpa6GZNKZy4?=
 =?us-ascii?Q?CTADNDBuRQSySnJ0iOsqg7Uk1T2mw4kDbsr4zm2rmbmzTMZ8OKOWkHQQjqPL?=
 =?us-ascii?Q?8H2DZ7CFcj7X2uoHsmALOBST+RQ977gZpmoDqGBqPCr0jGGt9nmZajKvhXVi?=
 =?us-ascii?Q?XVXgeVvoYr2qu3yvubuZNAT8uAhK6/OZ3SxAS/lIp4Kt+DXBmrEDdqg9VscC?=
 =?us-ascii?Q?tny9xvWfwJenMd33FAF5tD+yHacUkohU3goH4ato/GRufnE+Wqi4YOJxPzdk?=
 =?us-ascii?Q?tyiLyJhvXv8UQTETuHtPdFE7GqywjCOHJEoss74LnBel9FjNHU1yotAbv/8r?=
 =?us-ascii?Q?opf9r8KOngaveS3DOK+KwKrzV0Q0cgCEePeMhGLhAI2YXUWNIBXlJp8o/miQ?=
 =?us-ascii?Q?KOyq1/7I6sZ9fjmZ8g/kukQIb7CYt4gyg1SgpQVKfe4eHySeqOSu+jsVydur?=
 =?us-ascii?Q?3Qt31woQFmYY/pFNsnXAJO6YVm/nvlhq3BoICzXBLsJ8Iohfy+epWe/JBwcI?=
 =?us-ascii?Q?vDWMuE6JR5utcM9m7myi3E+CyhytwIqpQYMHjCFWExcvgonhqQ3whb1TFNjd?=
 =?us-ascii?Q?TpL5L9WGONDS7wkbTk6syEcfkipInhdlFGk8nQs2zg6rrOwIcbL9w9rGxJyI?=
 =?us-ascii?Q?BM4wt2ZhWZAjEcad6WZNjLs4DhtVpStuu8WmtNWrj2urqS7jUtdSLbEb45kn?=
 =?us-ascii?Q?2KLxYKY+m8JVyiC4JmxBn3Z9O5Z0gaDqhCVpQkHZv3m9iP1bnEyyrPhijGhH?=
 =?us-ascii?Q?3rue+ZclxAgROWwiCLz+8RuMNeGExYOAFaXcNwH37Ezfd099qG3RgeoNPkLN?=
 =?us-ascii?Q?QY49TxkAZrdPaVfsPcRQDyjFGAFoPE114I3Mv0d7pfqouN8b4Rkr34UYKRbD?=
 =?us-ascii?Q?Fc/pqSvZ6UgDsqFpazCV/9cQzlI/nNi/pbYkOZPncz9vA2CKUo1F8eXfA7il?=
 =?us-ascii?Q?oGiByFtefUC3erawrEsCC1WjHGGOZv8n7hZ5dCOGgJ1klQMhMOOASrJy2Z+d?=
 =?us-ascii?Q?qEf8nptwIX5C7r20B0iWdzvfHLi9gNsAOgay/ZOfFCF/7KEP+OoECDqTK5Cx?=
 =?us-ascii?Q?Hb9FMfTTAP64jTc38GyMGxe6X9Yh6PhqKQaZZqKxVpWEDUP0/Tw5yNFTcWnC?=
 =?us-ascii?Q?/xKcjcuiPpdAyTiAuWDfLYtiuyyBJ8U9iFF7pJpUw7rvYAnPUlhNgOGqgGod?=
 =?us-ascii?Q?jCcvqNPdvy7l8OlpU9f36naLO/bCQmfJkeFeUfLu96Oql80daa6cqBxq6wPQ?=
 =?us-ascii?Q?Y4zbs1mflKQYZb4QuDHl0pGFla4eyhy4GbwbTuDL1dkqbA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3YTepNtKaTNb1ZIqowFlFtTidgdTNrd4vEXepHH2YTc4gWrh9RAu+IylbKSg?=
 =?us-ascii?Q?YQ/vn7t3wrvhnokRv9JSoGGkwREmWvTjYBiL8uMsByVtx/HUuQlUj7i+k+to?=
 =?us-ascii?Q?3ySfhomHIVM7ryPSX5PeVApXEu3nhpGk3LDS6c5M7fBwNeHcaWXSjfcbK0IC?=
 =?us-ascii?Q?OLd+N4UGLuU6GWTtWs2MjfWJouCiGN8xFzJ1cnoLR+OQBkwsx+TyYVcF6nIz?=
 =?us-ascii?Q?RK3q722xoJhtH2xl7Iwgn9gFBzVzs1eLxD9zdBpByoWIMxnXrMvg+74L8UJ2?=
 =?us-ascii?Q?tTlB+Rj4Ynpk78nYlBbIruW1r5aRGRbhelVPSLhAuUMTSjB+5Hesv1FcwtBn?=
 =?us-ascii?Q?ofV8+8bEpMmoRKPIisNXZzgcq9826tCKyp26y9ZEoPHYLbrnVlMbszMj2jC6?=
 =?us-ascii?Q?0KdrackRpX03tBC1SzU2ryztSkZHto+VJHnT8bqatn8olO+n13D3PhTj+egR?=
 =?us-ascii?Q?o3MTDci53h3kBOZF8u6ZlAbGufXW/irkrdWKIhqXV4yg8HIosznel+HsHNGk?=
 =?us-ascii?Q?EdxW8gT5smehdnR4hlcOlW2V8Uf6DAkRTeMG26MoPizBe6eGFNq5pURP8/26?=
 =?us-ascii?Q?Z1EUsV3bWlphH2UZ/rLUfZ54WRuYLwjREg5SYLeCpX1cB4OCalRbvRCvYCYq?=
 =?us-ascii?Q?cd4kkrh2t5vCBMTy5SovQY6BbNao8T8/Y7E5J9vn5AhYl7G1KJmYSY2Wg9AI?=
 =?us-ascii?Q?BB1kdgfBToi7s1qdXADC5QryoUJC5YbFA/wJnb70t0tYDjXmivwGMY4wGyHv?=
 =?us-ascii?Q?vvnzlGGvMzeCEh+7hrNBVqgGd4B/U54hF6C5cd82e/GFIo2klFrAHj+dYpEV?=
 =?us-ascii?Q?m0LbntjP/ulauxF+dyfQuIkt20uU5OACrTjc0TEEBFrtQV4Ptl1MnUTG7DCR?=
 =?us-ascii?Q?sMB2FH/kjjpYujYP6s3745rRfkwC9ZO7KJpO2HXs8nFVWzf0jEE/IzdRepsj?=
 =?us-ascii?Q?d7MjUph7itFWShU8hn66NEPF+xYkD/R4cJIPCrrKqOMRquJx9pA64rFHS4Y3?=
 =?us-ascii?Q?wr/hgLkOopfThwU40BfdxGq8Bx5AkF4d4slhc5JlIfyOSVyH0Ofbw2tMUtnb?=
 =?us-ascii?Q?acOs6Ni76wqkVIdTuWT5Uab2ITjR7i7Ns3cqfDBbgWSxFygy914kmkqMNvHK?=
 =?us-ascii?Q?c3KsPfQ5uA+igiCygpu7Msv//3O+ito2UWGZm6FaF6+CdAbXzvOnQ0pfxga4?=
 =?us-ascii?Q?lPgvLhvnNQ4NP7DBbFX+UF4FbBPXGMh4x1f/xMcSlnuVGMPoCfRm+n7Lr392?=
 =?us-ascii?Q?T8C7aXDdt5bXdKuJWdh/wHo2HijsZCs+A553M5NqYYkfXdRM8SRpnKuE6XJT?=
 =?us-ascii?Q?HKQNDu3ZAhUgqmQyBOWtmx/wUW1re9Wwp8jaBPX85TIMscrPTVHMznu9GAKs?=
 =?us-ascii?Q?urnoVXx8cCZD7hSI8ppZH8gKUm2klRxeFfBO5beK5PkxSYR0PKqJwXr+UcLB?=
 =?us-ascii?Q?NUxybJuLNFrEWvqb+dvd5od+sAZrghoUMZ5r7z+EMoVQxDdrroTWB6UtygX8?=
 =?us-ascii?Q?cm4+j0NakN0ziVlNbxx5gINiNxtiIfqo5GwQinRSizMLX1Lf8WY9uFz0UTuW?=
 =?us-ascii?Q?N1PU9XHWrrvFImbHq/EbWEEX0Ui0JpqgL9G/iQW7CvHFf4NODv1t14M1Gs/q?=
 =?us-ascii?Q?eQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed7f5d75-8bf8-4a3f-750b-08dcea8e23f5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 07:18:59.1101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eq6XcZNMtkvosdZRMZSLcbOFsBRTbOf/f84EckXtGgyd4LHhaiK8rEjSSj/jxQkAHvaao7NFnB+Q9beTnEYxoJ8VZM7N58qF8Lp0F86KGgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5050
X-Proofpoint-GUID: WTYXaagGGJ4z2c1DqwvJ2LV7yJhbBO7V
X-Proofpoint-ORIG-GUID: WTYXaagGGJ4z2c1DqwvJ2LV7yJhbBO7V
X-Authority-Analysis: v=2.4 cv=DukE+3/+ c=1 sm=1 tr=0 ts=670a22e7 cx=c_pps a=vIBLTX18KUGM0ea88UIWow==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=p7DctbMjjooT0zeWWwcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-12_03,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=453 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410120049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 07:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205702

While enabling multilib, build gcc-source-14.2.0 and lib32-gcc-source-14.2.0
at the same time:

    $ MACHINE = "qemux86-64"
    $ require conf/multilib.conf
    $ MULTILIBS = "multilib:lib32"
    $ DEFAULTTUNE:virtclass-multilib-lib32 = "x86"
    $ bitbake gcc-source-14.2.0 lib32-gcc-source-14.2.0
    ...
    $ cat tmp-glibc/work-shared/gcc-14.2.0-r0.vr2401/temp/log.task_order
    20241012-064533.415426 do_recipe_qa (2688052): log.do_recipe_qa.2688052
    20241012-064533.463783 do_recipe_qa (2688051): log.do_recipe_qa.2688051
    20241012-064533.805164 do_fetch (2688257): log.do_fetch.2688257
    20241012-064533.852955 do_fetch (2688256): log.do_fetch.2688256
    20241012-064617.823714 do_unpack (2698542): log.do_unpack.2698542
    20241012-064617.871730 do_unpack (2698541): log.do_unpack.2698541
    ...

There are two tasks for do_fetch, do_unpack and others, so there are race issues.

Both of them have the same hardcode 'gcc' prefix in ${WORKDIR} and
${S}, explicitly disable lib32-gcc-source-14.2.0 for multilib

Set gcc-source as BPN of gcc-source-14.2.0

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/multilib.conf                      | 2 +-
 meta/recipes-devtools/gcc/gcc-source_14.2.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 09546315b8..7bdfcd56aa 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -24,4 +24,4 @@ OPKG_ARGS:append = " --force-maintainer --force-overwrite"
 
 # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
 # ${MLPREFIX}${BPN}
-NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
+NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot gcc-source"
diff --git a/meta/recipes-devtools/gcc/gcc-source_14.2.bb b/meta/recipes-devtools/gcc/gcc-source_14.2.bb
index b890fa33ea..be11fa2fcc 100644
--- a/meta/recipes-devtools/gcc/gcc-source_14.2.bb
+++ b/meta/recipes-devtools/gcc/gcc-source_14.2.bb
@@ -1,4 +1,5 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require recipes-devtools/gcc/gcc-source.inc
 
+BPN = "gcc-source"
 EXCLUDE_FROM_WORLD = "1"
-- 
2.27.0


