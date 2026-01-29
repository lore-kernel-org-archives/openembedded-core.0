Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECA9D358D6
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 16:40:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19162.1769704790924691629
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 08:39:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sIOrVx5s;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=64894db884=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T98kBe1700753
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 08:39:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=MhALN2IRhVF/5FALzKdEDWTecbkpXaxwt3emM/ZEF6o=; b=
	sIOrVx5sHqEc2SFsoXLWBUfeFysRci3zxNOZkcj9+1t6Ik49WL+7Rddr8uxCKuJ5
	R4oNuH5Zc6Bq4xc6oPEvRd21+90Wu8/vB7ZxhH2lk0UnTycY1hL3hoYXU1x/KpkS
	6e1IBx897ok+9iD2wFJdhoxUjVVjLkpEkyC4/Gh7iV7LsPhl6SqVxW7HJXGIq9fG
	VL1YSOYgPFhP882B30j2bv0SBG+O0SNhtQVBFloFqIA0ZOr1lCsw9vXlqSgE9WMZ
	1C2tJz+DN8RJTH/38LeTl3H5rRxZK0GGg0IFM7hCxV/ikt2cMlpSGo5u+ZDrb4kq
	R7ZEn7n4tfcUUs+WvpS3MQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013069.outbound.protection.outlook.com [40.93.201.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bywwrgssm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 08:39:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRPfW8kdbh9bKP7aFLy9ZAaJ7Gy28wYsK402urBcNkReRzxoulkaRwuoUO6b5POc2w4pjOa81AgWwBWvS1TLn4o1RQn4vzDG7RCm2UIabyO7fda+jxLT+/L7nwU1ISag4Xulu/wdl9pR/ygEZj6iIUMgbqDPLwDvtqq31TZ+hyrnW5euW3NpNii75s9zacqNMaIiKtVcPhg6dAsrdseAJ8NYvk0W3R5x1H+VgTJ6ji6ODqaCnSqQ4LZLNSdemuSrlq8d68hkxDbkoCSPDbocK7hDDCGyPycKYzzRpkWDqBggDa/VY31FHBKULILy6+oyiEULUoDwyb2hr8GUllEsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhALN2IRhVF/5FALzKdEDWTecbkpXaxwt3emM/ZEF6o=;
 b=fjFT0afPyRA7aIbMUp2LpTfyBjEHwLVDZxIeD6WylYf7FwKx6bd7ukHvoD1qu4YNXqNHsfcmks2j1OXSpRebjinnLN1C1dH+Qbr3j5699nXjH0MvHn6UXVvhcVLg6jBB9LqUvV585HrS3Nn6jYY5fKG2/3mO5igA+xrhl96we0nJSAFjP1LH5Zrfrl6XUIPIb97146RR0YUoK6d8ibKRuHfY/wb6sXF1SYd4NpvnxTWBjEcpgQa7Ar9ZrPy0/SghiJsoQ4kr3rqmurFLJ+CIT5ZU/IxaGOQ/rDTxNbuMJaQmsfzufxsTo5htkTmsALL0+iNx0PhO48UNHHUQ/Uvnzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 16:39:48 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 16:39:46 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v5 14/15] make-mod-scripts: fix for buildpath issues with rust-out-of-tree compilation
Date: Thu, 29 Jan 2026 08:39:09 -0800
Message-ID: <20260129163910.2612040-15-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA0PR11MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 316538d5-87f1-4a91-f1aa-08de5f55036c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?clAcZUAzk2AEa9rf1R8/ggGXV3zF8M9ahKL1GyJoRD4UyCZEORcyfpoXDc5u?=
 =?us-ascii?Q?LSAexIXeczQ8POkLqIJiKdVjFi9LPIA0qAqnl4A4jakQMZSdkFYNVTyejFLD?=
 =?us-ascii?Q?AuHaWYHlrla4qTCoHG6e7kws3r9yceBz/S6Zzk5Urv+7+BjlKIPoyjfSyYQm?=
 =?us-ascii?Q?daSISr8T8UqykgIvezNtD4EZ5VMrZFTWac52SszSYAVUkrTk8rAGIoXLO9xl?=
 =?us-ascii?Q?31O7bcEW2RyVi8l7jt6iuYkCLnv9QnDPAT6cm/ul8O5yRF0gc6hza62hcNWA?=
 =?us-ascii?Q?foXeuO+qo6XV5MYTRXsQd4HE3cjsaSADSjygAWEEbxPPuMtq5o9wd58L1Re9?=
 =?us-ascii?Q?lXgd6hlp4dWOz8ftcQGHCM3e7oDqRo9oi9a3EQWzvbUaV9oOeB2EovIXFYg8?=
 =?us-ascii?Q?icY2rmQMg3teAqdbUubvxV1MzKIDDpUr0UEHr20KxKSlki8cAg3AdoEmdcUZ?=
 =?us-ascii?Q?BTj+hgCJ1otc5StITHyssH9MlIdw5sOT3unLj2zzOwwiGSAXzHHo4lmwm9oc?=
 =?us-ascii?Q?kNxEQ9Uu7mxJCAMnwo76YNrzzsAZYP+7wO9mYW93xzW+DHqhK8hK3Twd8+Id?=
 =?us-ascii?Q?c7UwwRnFbEooYAkQ0zi0yqxngDR3qYsJqGXZYeYNIpDNV1hYCqBSto7XXea5?=
 =?us-ascii?Q?nsqsktHO/zT4i9JXcacLi4Qx60ccXoQEO1Gf0+iOfFMRnqEcNkPnKl2ht2cU?=
 =?us-ascii?Q?/xHmiQvAVO0CvSIJiwxyejZZ82ROvrLAQMicvP4R2YQWIrsq16ATvp3tctjB?=
 =?us-ascii?Q?fdjjtbDboA2SG+iCfdZdtvV/knD7pxWYqUQEctxyZH9GgmRIMTceGrgNkpMo?=
 =?us-ascii?Q?frf5Ft4pekYHWJ18ZhOoeA1UtK/AXjU0piQewBQW0YCIg2utk8EaiaK8rafy?=
 =?us-ascii?Q?OPKcn5iGiyBzUdK9DaAB4yv6QCB4y3WiYJK3raMb9wvQOA5S1tSTKt+s4iyO?=
 =?us-ascii?Q?1B1GwJyQNIlrhsEP/gGGlHh2uRu2f3zjkc9vW+fQ5JZP9UInjla8dhK6lR+X?=
 =?us-ascii?Q?WOaKvU5pcM3byiVdOwHt1rKRwGmELm5pwvaiDn8Qjp+a20AWjdo0w32DLO4F?=
 =?us-ascii?Q?KsKnbJT24b4I2m1gJaRBcDltSiiJbYtEGo7G5MT3BMdd83FoFq3GokZ0WeJm?=
 =?us-ascii?Q?gHB2Wg8ffAaFIUvSv+xB9ToMPiKKiT1SgFTgGsCfzPSRpGS43Nr3lc5xjgPU?=
 =?us-ascii?Q?e7OYwkmL9tO/a9qPNGQjmzy8xkf7sb6GzHmzfrjhe+BjO6ztmMZDI6j42XX0?=
 =?us-ascii?Q?8OMRnSHQWmjaIJHiXN5vtpU887CSGmZBr4HOEXhZ2nAY6pxRbux5RqTL7gRh?=
 =?us-ascii?Q?0AMXXCIK1vn6JZugZbwaIb6W9zpymMehkrH4G/YaBkWcDHgfQBWXJmmBlLzM?=
 =?us-ascii?Q?BmS5WREB78vHKEhYDmTP/AcHJxOf5wbpBL87RuBRS4qXkAfrvEux/VOBQjK7?=
 =?us-ascii?Q?L07abKr17LUU4KWvVS/ETXRiwYStspL5ryWZ8jmV06MxUq2VeADffaYsvTpC?=
 =?us-ascii?Q?Fmctv79W4Ctd20BasJlMRAoHT/mHMMKEKHUC0v1s/HPyF+4no305JqvMD8SW?=
 =?us-ascii?Q?7N/XLZ2A8uaq5qy8V69235193macODMR5+q+R1mK++/0AGkhZ2GxnGqSRqAl?=
 =?us-ascii?Q?YBHap9pKv8r8VyckXNt3IFY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HRSJ6AqKRL1HFb4zgmYnH4ZgjKvI9q/rVNrq+cFty5/R0OigZ1QRjpRYd87m?=
 =?us-ascii?Q?NvCYxi++BIbhN+2ZSHSdTnVbeFLVt0n/AjUp0oDaSGzdFUnXBsOLHa2RiRIy?=
 =?us-ascii?Q?Z+ETZG8k0kKldIA365QAzUJhPhvI7VqNpQWg118jNthFmJCUmNKRUUPjoVdO?=
 =?us-ascii?Q?/DPRqhaqAfcIV3JZlAJYYQ6V5hlf+0sFACCPmfvFpprAV+amrvN+55+im/oU?=
 =?us-ascii?Q?7Qn2mVipsdII4cTIAsPhQ31RYzBTAj9tF/XS+rxe2mn3k3UgeH1P/8KdXtze?=
 =?us-ascii?Q?MOXTkl6Jk3wdz7PZ5E3MHr54vSJE54GFi57vzOpIvViELHavJ2mCPGuiJENo?=
 =?us-ascii?Q?e04S8Z1W6zqBDCXsuBZwXobqKTus3g9riJfkX1PGisj7sMnwwhlGxfcRgAmG?=
 =?us-ascii?Q?/N5qew56avQmCrTud34Wk1ENZwJp5tOiQ5FxDbSUbRjDXcdAv+TFc9kEq2Nh?=
 =?us-ascii?Q?afVg1Yo3PChUKGC/MAV8a3/eJmLv9lBpW90Rjir0PqnFQLp313xI1GWbrPSj?=
 =?us-ascii?Q?FnL/ViBUavETtHLb4BtTo/d9aOa5udtw4yFXO1x/wpvy9xzvNl4QQryn3d6Z?=
 =?us-ascii?Q?68QR3RFjlo34jJvxTLveE136ruGVQCLiBd1+6+8rlA3+HY0ak2X5f/fG4LHf?=
 =?us-ascii?Q?XlwZsujWXTvCtZA2ag3YjkBQPvtwvwLaeTB7v1SxZ/z1RCSXKQj8FH0MUxgX?=
 =?us-ascii?Q?AG92tr3Ody16N/uOpOfuYf08QtVGfpHgMg7b1SAUwc2mysU5IkIhtLAgf/nl?=
 =?us-ascii?Q?19WI8U2huVZtREy+P2RyXmdi39OYQEIYrU8WwT8m71lm08kNty1FvzjBqjN8?=
 =?us-ascii?Q?1MTTUbvSr/SnjErecAjXKkLURdqrsSjIi/7VzW3eSHhS5jjtSs8gtjQCYgQn?=
 =?us-ascii?Q?XOPZxin0c0icJdWm3VKr4n0MGvmAOyrUZqi8Q46TGHRGajXdoGPNP4TCTeV0?=
 =?us-ascii?Q?U6Olj1kaW0AqpuQamz+818idHX12k4HmANeHijBSIktO9in2HzyGDMKbmAkm?=
 =?us-ascii?Q?/WlmLtVlR2ygwU/jOZB88XPGkJ6yZz6vAI+U+abNZyxfjjUqyvIVLqPUedfT?=
 =?us-ascii?Q?2buvBpz60lthTg/+bKaPnUmsXewK1mg4Gta/ZxlAwJhVG7vEgZNoNT8Q1t2P?=
 =?us-ascii?Q?15iLIkLO8lsqk+9Fi0awIuCqsSGAMUI9tCmjDTc6AMKvOVlGigiOIligHy98?=
 =?us-ascii?Q?S6kA5vRDmOUKxVttni3fhPgN7lQ/GZYLN5kUj6ZYfW4pt+EYMSCzyZILZrZN?=
 =?us-ascii?Q?8JaVVNjrIiscesyzr3fYcUHx+bsnTckGj8Hw+gLU1oVCSsq2e43n9ojIizcT?=
 =?us-ascii?Q?KtZaLrtmSNfpSn6mlZSr7nz5zPvEPvi3RwkSxU2TtyoecK/jd/Gf1jJwUiRQ?=
 =?us-ascii?Q?v2lYv+xinsF9Ivc4nYAwa6ChkgnlJp2Dr3pNXm5Bl0/yAkzB0VVEbSPDolh+?=
 =?us-ascii?Q?Ur3K8uGeGGa2OHlE+eL6fZ3SrqpN2Q8+0g9N78jbC1RkI4J/PAEW8zVb8CRK?=
 =?us-ascii?Q?VWXiCTwzviGmukoH5vaxnvREVc+P2YCQ44GbaB7lv/aWKCoS0hpDR+4LwCl3?=
 =?us-ascii?Q?24pA0dGrIeEEAxFgcDVanlwYuwLlwE+PRDV43uUsMr3tTIg41fvuC1n/X8Xl?=
 =?us-ascii?Q?fSfPlaawbAxtsiADTjeKim+rvpTCapKb0RcqOdJacQZGKWSedW8RhQHDv5jZ?=
 =?us-ascii?Q?LJOfwofVXopMxB/+KII3RO4K/EtE6oPRLz/PDe0X/M1551UiURdC3qUUpLvC?=
 =?us-ascii?Q?EmkZ00+5rMljexYBlrLeKjpsK1qwlvc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 316538d5-87f1-4a91-f1aa-08de5f55036c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:39:46.8865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnUAPueqiMS/PV48/vHuihEnphfguhCHIwUgiNc6qkgTobgnRgMYw5BdhREQy2/99/XroOkODusIPpwKxh++EtJv43LrDvl16PUz1snHbgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7910
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: gqXsvLv494i2gAesk2wpH5All2ZU_W1a
X-Authority-Analysis: v=2.4 cv=KMVXzVFo c=1 sm=1 tr=0 ts=697b8d56 cx=c_pps
 a=/NeaHkXls/iJsjBnUIdqww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=g_9fHU8KsmqnF3n0u6sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExNSBTYWx0ZWRfX+uKA6PeOOoJo
 6+e12sROCE0LYjLFg7VZc7UdBxhMiW53OowqS2Pvot93ZU90b1foWcV3uKzN5nFSYbNPTuMqf2S
 DLXoWcHPppAXFAx35cjJcBBJdhFuL7v1W7Y31x5/NmaCkSZwtcCxLjkR7FB6YJ+ob63QQSWwJhF
 AORvxdY1ZTFjWr8RD2ksUX8g5c0Gfuzq44H0fKQjO1hVA/HWkhe2sTd6MDA1fR67NJF6QO5T+Kz
 fbbr5JJjJrqA2lE6EWlqC5oW9v5rLCq8kgpOkTQ+SCUAkI/xp23VS/G5SyEodL3GMYHnnZlApkq
 juIQ6005LmcrqkfwDuaR1PDZiV/opyvprVxVJHkujqWpMzkT5gghtwAkqNPVlPiNyE0grHkcARm
 Cyt1rywpo3OHVDLNbStFFJj8Qot3tVuHD9ZMwkF3LFJEgLlRCnCnlcmtOzPxm4LA3rNlxfkCMDa
 DBhRYf5h1sx1DTGFcSA==
X-Proofpoint-GUID: IeYNiOcpLvcA8hFC6BCMvt3FBhSLcmwy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230155

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes buildpath issues when compiling rust-out-of-tree recipe.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../make-mod-scripts/make-mod-scripts_1.0.bb              | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 874e16e642..d6b2178767 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -36,3 +36,11 @@ do_configure() {
 		-C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
 	done
 }
+
+RUST_DEBUG_REMAP ?= "--remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR} \
+                     --remap-path-prefix=${TMPDIR}/work=${TARGET_DBGSRC_DIR} \
+"
+KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', \
+                                             ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
+
-- 
2.49.0


