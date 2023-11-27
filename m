Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59581C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 03:56:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.85680.1701057383637787217
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Nov 2023 19:56:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PG8YlXOQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96958d6384=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AR3IoZp013323
	for <openembedded-core@lists.openembedded.org>; Sun, 26 Nov 2023 19:56:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=56WUptBWqjLLH3tTGi
	pyih71Aa/bNR5noDjfhZA705A=; b=PG8YlXOQpBkzCEXu7Rbv7dxQoBmoMGTemT
	bVpJWWwkosyRMOETPi5E8mUpcDMIXz9XZQSEcc80aBEEzHTQvS7aY9IbA8MAiSJj
	PdPhKTy403rNBZfXixvAwnTWHe4ynsECdnwF6/33vvUhEofAa8P1KPlQeBne2ctc
	Ilhz/1FS5Z/qlORKNkqB7YlOvHAaKWmFMh0JQHlxnIDpVwdx1yq+DphbB0ho6pR4
	DK93WMhQS9R4tWP5FlktB2XyOju/c4/HQ5lFFpjfgcdsxJAiqGiMDvI8G5HIjrAk
	2DpDKCqUK5p0TC6aEEBmmJFU7U4XYxOo7iq1y68+mIoUQ0IYvlgA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ukd3513wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 26 Nov 2023 19:56:23 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3AR3uMlb019694
	for <openembedded-core@lists.openembedded.org>; Sun, 26 Nov 2023 19:56:22 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ukd3513wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 26 Nov 2023 19:56:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=US3/YGTBfk6JIMudZXJ4WShtprYT+WOTZmSMdJ8ZYnThJUyM+l2mV/o71Jjc2mdZZNVJmWt82oLXaFY0p+eqrHrQN86OUyt9SowCB0Bsw9mQFoFFLaYoInLd4pYNJV8gMJvOLJdoiJfAQ1ZaH3Rud+TarNVqLUh6K1LuWgB5bTitRvMcqh3TJwTWSiYQdND/ZL+2s/IKdF3vi1OVEAGX2TX+QNu2YWD9mCqk4JOCYLHrX8VT4qqwLBiJe9nMuR9FR5cx2xPLTknous7w0uyRVgU2k9zH4QkJNHQiMat+F6ywWXuk+rqjRD+hAUfsd/9vX2ghS3bwFoFhbMn1wHVkEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56WUptBWqjLLH3tTGipyih71Aa/bNR5noDjfhZA705A=;
 b=HZQsFL6zUvWH/YyixC1XSzq1hVtc1Fsrfsu0tfmG/xRZ7t6XmlOSHPe5XeGOaZPFDsiJ2ZX8iXbAosCKsYa5F3+96h+Xdp8se5nBWZxlq7j46+FnF9q7wmsoV1ctR118kUKTrbbq4NYL+OEY6JXXXP26Wf39d5AfmBPEfuulN2GI0j2XMSL7Y3kOABGt9u5hKtKSam0TSJj6/jrZwLygayZ5MvWIWSpVPb6rw8MKVb9UqfrOPxOdwCFoPXIUSRAV+FIKvXXnGfPzPU5MtzZt9l6aSTEZNEocM5Exv8+PZXxgtBj24xlKM79BB3XdbG5dFtJsLuh0iBKLJZDCwmmMeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4470.namprd11.prod.outlook.com (2603:10b6:610:4a::32)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 03:56:19 +0000
Received: from CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::e78c:8c06:e457:7b40]) by CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::e78c:8c06:e457:7b40%3]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 03:56:18 +0000
From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, umesh.kallapa@windriver.com,
        raj.khem@gmail.com
Subject: [PATCH] binutils: stable 2.41 branch updates
Date: Sun, 26 Nov 2023 19:55:39 -0800
Message-ID: <20231127035539.1024191-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::17) To CH2PR11MB4470.namprd11.prod.outlook.com
 (2603:10b6:610:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR11MB4470:EE_|MN0PR11MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: c5be3ec1-4612-4526-6a57-08dbeefccf7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9K5HofA5TPToHBG+PIuCuNtoifPiw8bPBNVL1PV/wbZxOxvxEIB4IXNEo14TGMmsnZ2w/q9gWR30s7rIHnCXQLBdIAAsTasKEvp3ztPhos61gGEYokVTm7jp6iQ4+EVPZzl3Sz8fFe8SRuKerW8ZFz/a9+rrApnIX2ZdJkkK6Znq3KjOoi9AzX5xKH1VefdnqbB8hxAliQAt0q46kmAIt+Ajkj85FAB56CjBUd/+2sXF//D37ecBPm7xWK1oCNXElOEh0Ocw34N8qg8HpzdgmJeEv+VtF6hQfDIXB1IC9R3Kh0QRfOvzLujOf49zImRrylMIya1Lf9YyduCN7ck1VwlCqp0z/lYOB0ICt9bKzvdlqxG9prvpXKDki4qBZEu2wZDDS42c5oDD02poRPj6cMbJJnyNEarwJjh9+zAFCFKwh3q8Y5TX2MjDJMtKuN/2f4N2ro8x9l3Q6bMxwQs69aOqX+GDm6V4AuUQuGzkPwNEvonDu11c/z+q/J9Uo+ax19I7mVPgUDA2XhYLLDaiCpWOHbP5w49Bz20HUXP53JxX5dI2rfXnLg/6OcDomC90aRiGXbttPgYJi5sPZjYxTiztLwExCJpJyCoiPQXJUTmB+Lu4DdAMjkgS1oD1Rp0R
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4470.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(376002)(136003)(366004)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(15650500001)(4326008)(2906002)(8676002)(8936002)(41300700001)(26005)(1076003)(66476007)(316002)(6916009)(66946007)(66556008)(6512007)(52116002)(5660300002)(2616005)(6506007)(6666004)(83380400001)(86362001)(38100700002)(38350700005)(6486002)(478600001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AEHWJI+PPRzCyqZxUc2PyNkzmS2vgvc8pij3rpj+KtJA1lEFrz/dI6mc4Wff?=
 =?us-ascii?Q?veZr5tP8QLaW4vDGgDB6XmhigZjNPeR4U5S3lRR6UArXTTDVYufOIVYGcRym?=
 =?us-ascii?Q?YVka/Z3xgT4+1nqHtLpqWqnxUm3jTZvHdOGRFS2Rgz08khmymAxyq91k7tNr?=
 =?us-ascii?Q?AeR9Eoa+42Ql6LDh2OgwX0K5KjWLo5oGnnJjCSNJ6fYzC72IX+A2aYhgIo5Z?=
 =?us-ascii?Q?idbs4JcqoC+BloAChNvDFLkCsQ/R9mqc6ERpsB0ApbojPjKgx/aaZlL9NX89?=
 =?us-ascii?Q?OZ40cRjLvz837jfCNWa+LkOPnHiEaMnrkcoe0ieKTyY1R2esUrcgjz4yHtdy?=
 =?us-ascii?Q?JD4ygxyEevM8AuvYgVz2bu7sKcQvGFkaGgpHbgVZOahpW7Y8TiXiBy6f2jdx?=
 =?us-ascii?Q?/bztymxNmrKaYCDYA63ubti+ZImlrlN1kD9UQW7YU9wng8PKoUX16sCtpo6w?=
 =?us-ascii?Q?I78YoaPl5T3U0lzBwZNXh3efriZcTHTPbtajcDwZvw3Hlpe85dg3kK6QcRbI?=
 =?us-ascii?Q?3gKiz5DG4RSxCGNkCf+TFdS3wqedoOFUw8LDP2E9Ue5+aik1dTSUT71wmw9s?=
 =?us-ascii?Q?iqa9BY2NhouXw2ZCIRqtOiI7TBq/ul+CqpNy2EEve+0YH0BSAbng6cFGsNNj?=
 =?us-ascii?Q?X8JyEOowBVXBX1CZ5uLF2xc0nm56hH4QbjFacEHhm7Xwsq84jNrTdwgBdTxk?=
 =?us-ascii?Q?kZLCO46mzbXgBtJgbmZPk3KcExNVH8h/cHmjxSZtzpjNW62ia46pNJ0vbSvl?=
 =?us-ascii?Q?KCogH09pCt59vK4GKFrU5HMUlzRzbUOliFgmouU0SmURbvugKiUZwEMZAqIV?=
 =?us-ascii?Q?a3WNqoFEUbMxPvYCfpJ2ZdBRk+fWspLlqTglGc6QCCP1b2p7F1VaqbUg2E5x?=
 =?us-ascii?Q?SXFb1E1IJ/bSc0pUwTZAUxkvYydRERffQ3BzzzqKn5l1bVzuxb/WBIsq6AUn?=
 =?us-ascii?Q?XTR105U8RdbgSvOVbgGbS0HG5BOfKaKGiiYHGQg4VJCD2MC2QLzleUPXyYjo?=
 =?us-ascii?Q?B9xMaaPKw7hm6OeZurgDc6mIQ1PNiJfz54CFGaoBGjJe6wyceZeGyHzI3Eaa?=
 =?us-ascii?Q?pGflT+77Y4oC8rfVW7py8AmQI9EOcIiqm72h3VybA8uUIwzWk/UvlpGjJJqz?=
 =?us-ascii?Q?6A0kbnSS46JQzA4RkpVW854fzf6F90BFZYv35zX8B6cysg90Z9hA6yLr6GbI?=
 =?us-ascii?Q?6sSKKkZ7KWMrCkI6lGYep7Dm/axSZmuwOzYq+y/cs5poYTXx1sr4X6CIb+BI?=
 =?us-ascii?Q?fqTzuzsNeifiJ000B/T+d31r7f7cs6INgJWaUzk0amUZKehTCKbE/VyEr8Xr?=
 =?us-ascii?Q?b4HBoFECNfa825TKqDlUW0ecMC6WF5Ur7w7NvL5I207Sb/80YZLRHMa6UKAD?=
 =?us-ascii?Q?6UZmGY5ihP4GPn+UfBaZsLTp5jaPUQ8MkOgWbZCn2GRrUvBxqV05bZshez98?=
 =?us-ascii?Q?ZylX259DvXXPg9qEqE5DGKkSB2fLh8JzucOpYQ4hyDmn/r/MqPFQNam2kcYR?=
 =?us-ascii?Q?TmPXrvyxfaRZ6N5qBXl8gnefRm9NyiEfzrXR1654740GXq23y2aMIVuehXZG?=
 =?us-ascii?Q?TsWzM/iFJBA8NLXRLWnsrvGaj/i7klZXQBD0F6rbkZWu7DtxqCYkNKBj7mHr?=
 =?us-ascii?Q?1HdhSPBbToGb8Xi4b2Jqld4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5be3ec1-4612-4526-6a57-08dbeefccf7a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4470.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 03:56:18.5755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIQ5jFWWGj3fz+5ypnAP/Q4QDA2ZJkUIwIYZwTkBK/ozl9K3pQ67Av+ZhZyYmCgCgSwKnY7+GqurDONiqxBHH8CSSlfpxd+RUfwZZ7GjB1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
X-Proofpoint-GUID: hNR6g5lfsea0jp0zWwIfx0XC-sLF3810
X-Proofpoint-ORIG-GUID: a3keVc3NN-ErQG413mJhaZ7snDYC3PK0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=643
 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311270028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 03:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191244

Below commits on binutils-2.41 stable branch are updated.
eb49941e7e1 Gold/MIPS: Add targ_extra_size=64 for mips32 triples
c27eff41737 Gold/MIPS: Use EM_MIPS instead of EM_MIPS_RS3_LE for little endian
7fe76f02413 x86-64: fix suffix-less PUSH of symbol address

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.41.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.41.inc b/meta/recipes-devtools/binutils/binutils-2.41.inc
index b4934c02a8..804f092965 100644
--- a/meta/recipes-devtools/binutils/binutils-2.41.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.41.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_41-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "cb4c3555ac4cf8aaf0935cb6e4b09e6882436d21"
+SRCREV ?= "c1321df4eb0a136304205085cd4913dd4eb01054"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.42.0


