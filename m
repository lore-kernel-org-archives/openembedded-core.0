Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3EFC25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 05:18:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1084.1717046297919021085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 May 2024 22:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6880901406=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44U5IHu2022978;
	Wed, 29 May 2024 22:18:17 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yeg2xg3qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 22:18:17 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 44U5IGul022969
	for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 22:18:16 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yeg2xg3qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 22:18:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cyu3+FeIgooEgmi6I7M7q+Vqyjw1kJSt6U88+E9D6IA5cvha9GLzkmmDcH/aiAqQRKoCmeQYucD9BqSsxrEFVXX/2JpdYbvrHWk/Sl3Ney9147KA3qzwjL7/FrY+MNFyhU897ecej0ckcmx2dVTPPYsSfTOHM7NY38InPzVTPOmO392at5ZE3MiJgqPYsNKDr0ngRwQRu81czsQFtKml6S7gaM6xqAqCarckPC9UzaWuAcneI2b2E8mPsOS/0n5McC0SBrMKwnPzQ8KC+x4IHdetcV6jSm9iCrUaZWdciSdAE3g6g2s9ZajWj7RKtk52S0yjwkMEUdSt6/dR+wfPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpFWCqV0Rsd4uhaUONt+uPjaEIvTxhJDaBiYSQ+ipNg=;
 b=XjLW2QBcf9619kwT83ukA+T9x6imAjN8jyRaGP1TenB4N2DcL2bqDyQ5Ji75lEmrRT1ufPqo5j4lVjHT6IVhydnXh0+KdVsi2DT+tooDoJUae2HJsv316s04rMip8gLTBjJACAB8yQIeg1mtsBElNe9mydtJC3xNKKM8j0w1+Y7k0hXr5xiGD8f9YFYMUIzi+9bxhJnwLay4yqmX35q+/8Mw1giql4Wt1x19utMl9RXIRZEQ8wUc6EmSzj/+LrzKx93ssVNMsyAUz/S6tNLgaumHUovgclPqpbfx84z894xCTCd4b7oinIG8/vpluQZTWRGfvu4/GDGy31ZI9v3Vxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by SJ2PR11MB7646.namprd11.prod.outlook.com (2603:10b6:a03:4c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Thu, 30 May
 2024 05:18:13 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::9a1f:5bdb:b4ab:171a]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::9a1f:5bdb:b4ab:171a%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 05:18:13 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Richard.Purdie@linuxfoundation.org,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH] glibc: stable 2.35 branch updates
Date: Wed, 29 May 2024 22:17:58 -0700
Message-ID: <20240530051758.2990123-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:40::33) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|SJ2PR11MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae2c9ab-7fe1-46d6-6e73-08dc8067e741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|1800799015|52116005|376005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rk2oa1lvcOjlS/pCm3dtIH18YbgfvZ59klswGvSkvepJCzHtxPM9kGu1Z1J/?=
 =?us-ascii?Q?F0u5d+xmiu+1AHlQwfdFSd5P14aYVpa7JruBAgMVRyxTIMS0clkxtDNpjt5N?=
 =?us-ascii?Q?ngw6OyrWOeiiIiOBpLazGkQsg87MSXVHNbIXZmdd/bktcvcTtyWp56RFvKTk?=
 =?us-ascii?Q?p95fUXrbjmWsFKz2o0FfWY1YLXHs7opMxK+pzCH4Gk8YjWSfQaqpl5V3qHOz?=
 =?us-ascii?Q?xVlB/XBfw0SmbqrUM2rRh59/IslpgrQ0wTpLYsJAR/rs2xEWvntltTuwLH8Q?=
 =?us-ascii?Q?t5SEfE936F9CHPRhRhEhgpYxdGBGhqy/tbkcXdsgp9qicEg8YyeIxhf7NJL3?=
 =?us-ascii?Q?w2SB2CgGO1w/zI7uhadSElmEzi3dt9YoRY7mVAnysmFZyOR0x/1xEJNA96p5?=
 =?us-ascii?Q?dyLBjXhebVhTatsuL5OVy8DFyClpxgfzyUoCCU/eI5B7f66lqw/tJO0Pqmys?=
 =?us-ascii?Q?NJYnk6diS0GaV7iUb+OjTtOtOcrpBiW2nV1ExLj98PDaMvcDh9/HiRrCMi4g?=
 =?us-ascii?Q?GM06G7Pmk4vpELUflhP5B3iV8/F2k7vMp/iNpAG7k5Xn8TmxxjXdaBZk73mo?=
 =?us-ascii?Q?wMIORgiJuI2wngxAm9jQjJ4KzqwkYRKEMry/JayGy7TtTI8TJ+t//56OO8Tz?=
 =?us-ascii?Q?bSfV4fCviHunWoZpqzSclmnX3G7KB5QHYboIedEQYm0A3zfL3mzda7SXp4PU?=
 =?us-ascii?Q?8f5Hi9bKi+8TybZJ9IW7k6QaV8eQAo2jKeLKWV9DHp69jEi1TmiIU16TOW3Y?=
 =?us-ascii?Q?n378HntPbAwqe8xKTmDiU11TruB3zWU/q9iDfHjabvwyoNGSyIVMrrMrnm1f?=
 =?us-ascii?Q?ffrjh5pxZncon8nYEHM3GwCBoPG6uPEOECgptXk/VSsn64S2w0hJhaaYpeEH?=
 =?us-ascii?Q?g4pBdce/e1ZP+T+rd3PbTIejwqhfROL/yqZuzen4UGpFJnqvNw9hsciOMSaG?=
 =?us-ascii?Q?jpAZXFbTnviq3XV8+bB9ivkujxUKPPyoYY2AznINgiDskxxKBuZSmyyK4lKm?=
 =?us-ascii?Q?8+tgLoMVzP/gG/30bSNBRHYMXwZSgkWNbORnm4ZdKoiCZxcK1u/TxsiXF39D?=
 =?us-ascii?Q?RPdvY/gl1y4LFzE5bnpwOufTCrBFiDDI83nX77wTB+u7JYz2TB5UzMtWI+ff?=
 =?us-ascii?Q?3SUBigvU3bhBgUpvQyKdJpp5FBADnV4fVhVqWEAuDveYB0p3aIzQUhZdWqV5?=
 =?us-ascii?Q?DLjsl1FeuMhkZ2ZYtDKI9h4lEZcUjoG0Fn87uLondDx6Rclrxf+WdSC/Xw2N?=
 =?us-ascii?Q?eU3NrbGWzhh9ZDjVbgb8E3gWXS6bN9Bq6WzjMtX639fv7Ikyj7VT94ve5mVw?=
 =?us-ascii?Q?ofVQuZ6UDRs5OEwPoruhZzFz1T3DPa7MHYZJenmgq8Daaw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(52116005)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y/ChvE05iNZi+hTXH/zccrpARNIvsitWlLHoqh/pvXN4LRi2mHl9BRg80Sv/?=
 =?us-ascii?Q?BiBI5Dm6P593w2qbwS6Py02o/eE1UYj90rk04QObq+/Z/zxvgSbmsVeSn0HH?=
 =?us-ascii?Q?pnJsdstt7FwCk5ItGBMHv9EroPE0+Ohz+SmTZA06MJ5XVMcuBOYOCIVHUSWb?=
 =?us-ascii?Q?sV3jrIz6Fr3Ij2SbQjiBHvzYe4gwYxnF3kjXEo7lzPb6KnrViMm4LfgA5O3F?=
 =?us-ascii?Q?3kzjTiuWnfrv/wt1KgOZJATPIFvMgn0e4sVicQVfg2DSVT6PNaepMLQJ1Wrz?=
 =?us-ascii?Q?td1RH9qEBEHfzbDTu2QsN8Fyw8+ioJd6L2sFvXdHFwBx4zX1b3TFRUuiaNEq?=
 =?us-ascii?Q?8Fqtd2iTAdC36HoOiFgNPKeA8HGVNpitK7yG/3ssP08oWVjskdDXBTHSGqeW?=
 =?us-ascii?Q?dkuBVPUSd6Q9rCkoum+cfuAu+BWp8weNuRxP1sN7SMFBHkjXv/QLzOMs6A3Z?=
 =?us-ascii?Q?8/nTuijFzzbbwyQSgs7ZidK2uf+2gJQFfeoNIbBoHxWfM2GVHriB8dO/sJEg?=
 =?us-ascii?Q?2EmPx7AXYI3D/6UUx5QlKG5O/x9lrSNu88A/+MKtARiBnrk+WbvR4BhFEM6r?=
 =?us-ascii?Q?wc8fnjSt7MhexqnTea2v5YC2LrWSDT7kASJWaSFw9+saX4CeJicfYnfWRDld?=
 =?us-ascii?Q?6z0VjCF0Nvb4Hn0EYcb5lTQS9hzFiGKXa0qstV5q/FOFzSLeVYU42ua6aCtl?=
 =?us-ascii?Q?Or7ijEO7k9cJoJQpL1rkQtSLGFtBTdgAac+EUbgvullDr5hR7hiCHHXozM7E?=
 =?us-ascii?Q?f2RmO0A+c3XguyU//1w38twi9vCGTPQqbGaI150znDp77ZEEKoaoBI2Zp/l/?=
 =?us-ascii?Q?hNPOcBWJOD8Q5cNldsZmgnjztZMmQ5jYa04u+kUyNtDcoDfBhNqzRrbS73jj?=
 =?us-ascii?Q?0mDfL2pmOw3swW65hW0jX0JCC9fMWcKuQMokUrQ4VXQTpyKLbQM9MjS7LcIK?=
 =?us-ascii?Q?kstQ31daQXz654+rPG7RlgzVPtd9y9TewVgaC9EQVBiBvtoSmLaUQylgtLXH?=
 =?us-ascii?Q?OFG8SNdVvm3cvu4MIZ9CQxjrPANGLWLuI06NXjiZS9pn0dXNhZy1PiHXx5pD?=
 =?us-ascii?Q?wsBPcSLF6aK86DpWmO3B0JW73OFiaOQo4ClHx5F/EBxXXM2q1Bt3/J7hmEkk?=
 =?us-ascii?Q?FS9LptmHBlRR06y4f6f+sGs4e1hoDGgBMRla+iAY3TMwkGifERSSKcfIPNfI?=
 =?us-ascii?Q?T+P/LyDjvf2GXqkkdjju9PJLXkv1qfU6ab6ZyUquk+iEe+5GO0CERAGFtAWQ?=
 =?us-ascii?Q?DSWbjH0dZehpYAhreSEsrdpsU/++LyNMP7gQFolul7021//yEZMo/Bombq0n?=
 =?us-ascii?Q?DrXlxPOsq+BcNJ7qTaUKbNcE34X4Kf0rhBYvD7GvawYEKDKU5fj/v5426cJ9?=
 =?us-ascii?Q?aZiU1KA0rJWUM0W2RiRnztBJJ5oQsdmYKCM3uDo7DW1cpc5gAYG1TzJYmaM4?=
 =?us-ascii?Q?kZUSBG8PJThBEClEEmwVPAxXavfOWiqsk7PGCrCIwt4TvtsNFWwXjBOzudpx?=
 =?us-ascii?Q?8O4MixcD3WDJ8i+Gzdb/QQCPeoeb/WykCgZBOa7FoLJywZJkMF8xGUTGwDw5?=
 =?us-ascii?Q?O+VOkr13m5Ts7vA4A46Axx1gHfSxGgvfVXApNCEL/BKj+pzNVJ6TLH7bPRYt?=
 =?us-ascii?Q?bA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae2c9ab-7fe1-46d6-6e73-08dc8067e741
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 05:18:13.1441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8kkF25flgVAdgAkhTGrx30SA1Z5/pi6nT7H11EyLRCUqoStNJIc/UDLsynJqm8rEKTcT7exYfiRelVStQ1Xn9X2AG80CfUlqguY1t0YqGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7646
X-Proofpoint-GUID: IxTVlmOC5pAplicKc7I9w77gfx35lTme
X-Proofpoint-ORIG-GUID: bEvG3anMa_g022IipoVVfblRd09pqIdt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_03,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxlogscore=709 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 05:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200013

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commit on glibc-2.35 stable branch is updated.
72abffe225 Force DT_RPATH for --enable-hardcoded-path-in-tests

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 1a8d51ef63..a5903bc5f4 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "54a666dc5c94897dab63856ba264ab2c53503303"
+SRCREV_glibc ?= "72abffe225485d10ea76adde963c13157bf3b310"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.43.0


