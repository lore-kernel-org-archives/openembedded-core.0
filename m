Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5106CC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 08:43:06 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.96])
 by mx.groups.io with SMTP id smtpd.web12.17792.1646037783483189410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 00:43:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk
 header.s=selector1 header.b=EH4kqWa+;
 spf=pass (domain: prevas.dk, ip: 40.107.22.96,
 mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wv9J4FVdCa0KwEwmzY9ngq61BH5mTBLZkSCK9HE35kbVgeBuVGr4tQrwfxKXYiOSVnJODlO06KGX27B+Hys1+pfcV5mtT4OO6ICLI7fEgWf4uCessdmKHKwceJsN4u8A3Dq2/nC+qOOzLHylvfnUsxqcVpAAmX6mECwlj7BKwYU7kxYmbuy3k7+HphiElatjuMKoScORpT+9QulnC3sTZa/kVG2eaYNL4d3mtIZF0ychfBDCmPpv757eM3Vcvo3+XykptUvK1Sh9DNxP6rQFK1OvL5oQq0pcvHT19oaQgj7U4eOnDLAQ7DiQ1mDNfGjVULFAx/r32i6K2RPoF90STw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZIh9KIKKBTtioarzkbTz/oVNhaKHIT2swM5H9lBhoU=;
 b=n11R447slGq8B3oz4naXcJcjrzSjSqtemVB6qpxv54BKqYW6/RUNowt/iPQZrCSM+WsHfhqtg0+tGhWALtpT8ODwdiF3DH9U6TxsA+lz8N4DxXIksyhObUzBgn26h8XS+wUIoERC5Z3i5ugjBkiVW1R8AkXRhaddYhMhLTQLoqns5/s0WcNTsjnIVFl9j3hhNAbs/Z90UAdqgK6hqeTOfHJsFMJxx3JmEni23RvYorBGLy/copslJ89LTgAyquHRWi8tIbsvRlaf+AG3T1BwL7V3X7Xf4NiFNkqhTo6eTy4GQyHuPQ5eT1GiWjYvLvF9GxWJHpKuTWvRLg2IQpYcew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZIh9KIKKBTtioarzkbTz/oVNhaKHIT2swM5H9lBhoU=;
 b=EH4kqWa+ZGww83x5tEw9jvQJzDT9Ix2Sx+jCeowAzwN7HSlcHnFDfi4se8K8MgK/fpglm8Zq95CvpAU4WaUwA6ncZwULiULa1JJwFLN9XeQ5qux86pUeLh0Pvzh9Do4WYQnKGG5/DIsGFsQ7SaQAUJuDFI1ZSD8YvhV5XX0WvI0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by AM6PR10MB2024.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:37::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Mon, 28 Feb
 2022 08:42:59 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5c4a:cdf:c117:7d1a]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5c4a:cdf:c117:7d1a%7]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 08:42:59 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] bitbake.conf: add BB_NUMBER_THREADS to BB_HASHEXCLUDE_COMMON
Date: Mon, 28 Feb 2022 09:42:50 +0100
Message-ID: <20220228084250.3874136-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS8PR04CA0029.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::34) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c93ea01-5376-4e7b-a880-08d9fa965320
X-MS-TrafficTypeDiagnostic: AM6PR10MB2024:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR10MB20242B3EDB70D54D346803CF93019@AM6PR10MB2024.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vRxsekWDjeLTLj8wgFifJ7LuPjfohxKQwz3cJRgLoc7CaPr8ekSRtHp5rKaGRJhZp4pmu6Qixx705e/dNW+vPAR3V5DGqWN1d+lCgs1/9EecDWKDFn3cv5sUPZdfXdrjxxKgagSQcHYa8/HXgdzxzNkadIqijmrIKXBoJkMk9IUPcei4LctR1BxkpMc3mFa+L5nnDW5IMPDVw7XlpCX9OTHiU10bnUqA6WzIzBknvLRog/PvX3LOETRDC8ugnIlkPBZqSEg+/uAZu1XS6sxUSOPdWmXDLH/Jf5yJ0wXMBnwLfOZ0hJEwv9jhSmmxIpa23e3Hloy8gTJA1FZBski+Fxv3il+vCSoZFZ1Ute+/qSyMQv0zJS+ZV8akcEQnBE2gYYCAQ5SVi0hp7zhyznQzjy67SfBlCIJafEsaSqO9ZfnVy3zxF5hjovEWQkCvBDr72/RJP7FOabZp4+GjQE7SW66zv3QmwfI42C+3X30VyS1MO403gs2awCyOx9f6bpctwyP/RTyr7IDt7AStFyvGvelJrB4wnAW6dgZU/rgAnTMDUMmmHLhBlcr4hb8v9FBWbFa6HrjTmHWzZIuIW13+2heyHOGpyYjvE9AfBRAI/u8b4LaGMSs1Y1WjeWjULjH9AjJI152viPY9f3aayd3FQnLx0gDLgUgk56TLvXH7M7hAsBbP7V/FQX7goDCVpbvQchX63REVIjaBEEXDO9dGdAKwpgGG22dR94E61oNyIdVE3Jj0hmoQtCn+nu2fsXpcpZpfgs6ReHAAnIC+Bhi4nCP1qREE5m9/TLiBiGiDsbk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(966005)(52116002)(508600001)(6512007)(6916009)(6666004)(6506007)(54906003)(316002)(38350700002)(38100700002)(66556008)(66476007)(66946007)(86362001)(36756003)(83380400001)(2906002)(8676002)(4326008)(107886003)(26005)(186003)(1076003)(2616005)(44832011)(8936002)(8976002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zTCkE+MzpT8v2wOapx2Yo82EogzFAW6FBLejxzRs5uLX6auzZPShw+8n4tP8?=
 =?us-ascii?Q?lX7r4txzqylgmcvnEYfp3QYK3M5iJcjoml0W+tIuY4TP0nEVYc/wnplrBCVf?=
 =?us-ascii?Q?r4s6B4kfUWnnVTajh0Ml5/jPn0gS7a+33UIHG7zEAEUBTrb+Ba+urC92NHND?=
 =?us-ascii?Q?baRNS7UsY0k9avKA4EuXJNx+f38Xsu0xIQN6uVOE8od2at1aCR5hNBceCoZo?=
 =?us-ascii?Q?hy7xu/hx/6ITZkzYBWbQYuFToAt47HJXic+OZ5rsNLNYelvELaY9V7qfkn42?=
 =?us-ascii?Q?Qe/ne/OTs+4p97ADW+WMlHUKHNkjXNHXiJl9KDYQIz4gCvSAkvVOpdmRB/6M?=
 =?us-ascii?Q?FNTnGJcMyYBmdx0oSutLLzwO7t3ZI+JlQHwdNFyTswWd22/wzbUG4G/rL8n9?=
 =?us-ascii?Q?lm7FMv6mxM87SO+yVeefWmKF05adZBip13fAJ33hJboLJhtoi1LARlmRgfGc?=
 =?us-ascii?Q?AbFbRnsDkRvVJGeMDiM1IB2LKX9Kq6IB4vjkfH6+gWLEwPURIaUuU24PXj3A?=
 =?us-ascii?Q?y8+4puU/3iEPapAv1JiXIZQrHPSKMOsEwlvpU/KzlBUdgEYhK5RkoQlOaxHC?=
 =?us-ascii?Q?/IwXh46jDAbVEJ2kWPZQQIwrZHnmfQ6p8GoRdt7b43CjwUQltYO1X5I9ODIO?=
 =?us-ascii?Q?Zg3NhJXX208vwSyN3TARjZy1wFiuxBTJs36bTRgCBVSGRPVC28DmSiDeemFo?=
 =?us-ascii?Q?IRjfKGgIaGGgXPP7gw/gN7IRRv/tVdexKYum9c9il7V4OWgXqPal+VBBlsRD?=
 =?us-ascii?Q?k4Z1iXZ132TFL16r/7CtikZ2zvkieQzanClPW+vPeppdQxdENSiDQHpNLcJr?=
 =?us-ascii?Q?wvd09aHS+ssgAwGD/I5MpTpzSIbkam1ydJzxqKOAWpyHkqAdCgNHdirGpPO9?=
 =?us-ascii?Q?AsfJlAaYphGYPOvKyjXQcD7ZnDedjXcqwHkYdo6c4aqpwCw8fCelCRYP+JWD?=
 =?us-ascii?Q?jO2i0aOdFJqYk4SqOj0PlXeJJfRaDlsWTRca/XbCUMBcd3Ma72WIugJZC7Q9?=
 =?us-ascii?Q?OuyWFYGEmsnLST4L2gYWWT3Pk2WItCNJgLg/8oN75QMhDrSw6dJEmpZHbLfm?=
 =?us-ascii?Q?rA0WnJoknV0lR/86YN48XETSgyDcEASY+/Gj+DDH9Wxh8H/kRrX+x1558jd4?=
 =?us-ascii?Q?V0MEIzJlc6EPurzIk3/ieczvgiksG876PownBRTpHYRrB1KTWInugA05VoPs?=
 =?us-ascii?Q?Em0zdFO2c5tU3ApLxTl/Bzyp3hNIOwJsPBQcF2lKI7z+bOV5VHeKKFpgGOBR?=
 =?us-ascii?Q?uf5cRaXBAIEJ8vmjBajQKWjMgEtNOas2tOUF5xlOMAAelsWy4mRetdRL1FQq?=
 =?us-ascii?Q?QUexT+F59K2nf7M66k6O2IcZ7FVUBRpsj/SklgNSIHJ2Ni+teozf2HWyAsJF?=
 =?us-ascii?Q?kEoBwgfB8Ks/0VL/zbaI10OicRj+CfgdWI7MVJUbcdm0AwzGoEpkQHTkVatI?=
 =?us-ascii?Q?C7hrfwVk1OehZhK+7foziEkGzplGpJlGCPyzRWBoA50VQKq2GiDikqwJ50TJ?=
 =?us-ascii?Q?hWDqPeb3Eqyn0xPA1Qz4PSDesVLPfLwsfgQXWXWEQHYQky/pIOYoKMtlPmrx?=
 =?us-ascii?Q?MUfzG+DxyOlesPhIB7LBF4Z+YT4ILgyCWAinkMN8C2NWChTJdp//ZIZ3w7DZ?=
 =?us-ascii?Q?Im0I9wLBgzbB10U708KVdSD6aO7ojN+qJBTcr/5wW2REnl9mDmSPgH3abPTQ?=
 =?us-ascii?Q?2o8ErmWSY3gZ7bj19H+C/tc/A9U=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8c93ea01-5376-4e7b-a880-08d9fa965320
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 08:42:59.8041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 84DdUTDpKfX5dkxxCzUH37RStTcwZ3YUgN/OEAqHQ7eRDVTkUCy8RzKcoWzwr1UiSnuldleYIBBSvVIPfWDccZDc0CEjeimKHHEdwrAdPMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 08:43:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162452

The imx-gpu-sdk recipe in the meta-imx layer references
${BB_NUMBER_THREADS} in its do_compile function. Changing
BB_NUMBER_THREADS between bitbake invocations leads to the well-known

  When reparsing ...meta-imx/meta-sdk/recipes-graphics/imx-gpu-sdk/imx-gpu-=
sdk_5.8.0.bb:do_compile, the basehash value changed from 69be88cf220840ff22=
03e11cfe65681880b0bf9b88db67d50c1ba772b883bd18 to 5e6d5029fac8d7856ada4c2ec=
a359568298f82cdb64567d7dd4deda503d9f83a. The metadata is not deterministic =
and this needs to be fixed.

And I'm not the first to hit this problem with that recipe:
https://community.nxp.com/t5/i-MX-Processors/imx-gpu-sdk-compile-error-IMX8=
MP-IMX8MM-IMX8MQ/td-p/1217864

This happens because BB_NUMBER_THREADS is in BB_HASHCONFIG_IGNORE_VARS,
so changing it does not cause the recipe to be reparsed, but it is not
included in BB_HASHEXCLUDE_COMMON and thus
BB_BASEHASH_IGNORE_VARS. This is inconsistent with and in contrast to
both PARALLEL_MAKE and OMP_NUM_THREADS, the latter of which even has
${BB_NUMBER_THREADS} as default value.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6fb7bfeb23c..6bc18016056 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -942,7 +942,7 @@ BB_HASHEXCLUDE_COMMON ?=3D "TMPDIR FILE PATH PWD BB_TAS=
KHASH BBPATH BBSERVER DL_DI
     BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEPLO=
Y_DIR \
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTO=
RIES \
-    OMP_NUM_THREADS BB_CURRENTTASK"
+    OMP_NUM_THREADS BB_CURRENTTASK BB_NUMBER_THREADS"
 BB_BASEHASH_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS=
 BUILDHISTORY_DIR \
     SSTATE_DIR SOURCE_DATE_EPOCH"
 BB_HASHCONFIG_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGE=
NT_PID \
--=20
2.31.1


