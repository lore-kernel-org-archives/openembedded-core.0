Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D4BC61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 01:33:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12511.1787621617067319347
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 18:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fTAOJbbS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ONhIr23880365
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=XdMqEUZTMTUVZfQmnzmYhqouDJTd7RYT1b0MFw8peJg=; b=
	fTAOJbbSNq5RuE884kkmfHm/03/+jx7X8SfB1wPE1niolFFFy734gskKtg7jsml9
	m8Ac5psly3G8CDZ2uO06QQXIfrm73uaTV5dzyXnMyvnZhUHLmWIUOQZ52TM4uAVg
	gTpmEY8uCDPNDQkcfsTaX9rPYMb/y9IXAu61T5wCJwGfERnyGB/QCGTuq3E8PPoU
	ZNiabH8gTQbRVw0XHg9qAlQeTaOqnJpVnRN2nOGwNe2yM5E7Nz8XeUP0Iwu2YLNb
	qwmBgqisB6qEscNlPIwXr9GmUBrTyqc390djeorqHELx008l2Uxc9sBuI4NpbEHj
	lYbaX56aDlB50Q0cUP1NOg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022093.outbound.protection.outlook.com [52.101.43.93])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g72r6uqvw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 01:33:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6ZBvCjdhpMBaYhB7D/ohE8ayklKcFFnmKpQaWbUGDnVyDYFFGcVhMw3MS5yMDTu1EoE6ernLmD3HNAn7dNwRzugWqR+c4YATd2U6bQbrIVSpHsu+g/APfXI6unc/4auMqlRNgDF7x1ovF8lhc1JwJoWNQwxiqvVVi4NeSBEnkNZSGe372HoD8+tsKBW/DIqA/MHV1Sf40xLqm6dJu8+A/axzKodo7pLGNlYKMsQ1pStAed8FWpCfa4wJ9D1scYZdj+9oemm583N/wDZgrfwPxQcK4y6LMsNX2og/dL089nKHJcVjLVVZ0vA0HDLy5iiARBWgE/lfKEfw18o+ttEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdMqEUZTMTUVZfQmnzmYhqouDJTd7RYT1b0MFw8peJg=;
 b=UoTgI1swJMmzbmkTqVXzcflurtJlNAYeHYSWf+aNAqCAEk9aZjWcJOqgI4d48MsLycQPWdvFMB6vKdzCKliDbZrvkygbVja2bbEC0N6qZMR9yODAwlvnbfGu2u39QyC6GdFXmqS3CseK6GOX9oXPABEOeOqpUW8IkETXyOnBJPGhp4az4F8ssLP5Ov+Iuh3Zx8PUYjXO/FBLHBA/TnJ64c68y6tcGA6qJFWJm20Ozj96piCgTIb53mKpNOz9JOsAD3YLYwZSuvygnkVxgSPQ8K6oNCTPX9NANi/K+0u9AwfK3KuCM1w8UpWWRoM9ww/9rNIcTts+4TeXTzS7j6Ekeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 01:33:31 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 01:33:31 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v17 07/14] libarchive: Make it work with rpm 6.0.2
Date: Mon, 24 Aug 2026 18:33:05 -0700
Message-ID: <20260825013312.2695028-8-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
References: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|MN6PR11MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d3d3938-42bf-493c-a1a2-08df0248df1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|12006099003|22082099003|18002099003|11063799006|56012099006|13003099007|38350700014|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	2413AtWxeCBKVgmndvwB4h4sP46LGLt27Bl9LeZAPUyEWysktZI1ekdxThGWu95WvELcJMcLBu7ZhEOnA6Z9mqcf8l/u8ESQnDlyIACg44u+5qtVooY5uwFZELZzvCdFM2AzgvYvjxYxLHddTA3iqQD0Sqa8avGZ7OQCoAzUqcHRjMaShbrNa+Ox8ejF0yZhUR88YAeASpHwXjHH+FMdpAuHz4nXTydrNVO9oQXye8wZS6Kz2FH8yA7bUKa5Nr30yQy4UEYb1DvjulJs2drhI9+Mge/b0texEVWMT7SXxQGn7DwMyiY0nlPEp/A14Ia0iLfIWM2pu2Se0+IrPOqg3aLIPx02lrc0DpSemCfkWgyqpESziNPNnnM4Zs9JYA4OH02sZ7SKdZSiyQasNEolL4Kk7NDCgdggDGRAoDdRQUlyZ3DzUufxz3DWm9/DP08ZOVP6Gq2OU/+4rcmpCftiAiLP/ILpG5SkE6Nkd9McP4fuS51rZ2Z8wdLHQLTJjsiZhsi2imrxNxafBd4U/jXQ2vambFAB/bU718DKIF+2t1dQ3TFiXvY1xThYrlHeoZzHRqXlxW5Dtjly2xW5OhONsHX4JKCdqASv02ufCR7OrnsBbMC/sY5e3dtg6w7CUhaevx4ogTHN6xaf46lIS8ZfmKaGOGBF8xiwXFc9psQU2sE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(12006099003)(22082099003)(18002099003)(11063799006)(56012099006)(13003099007)(38350700014)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5++2MKgSyXuwyq5JlCO3PxHF+Ai1ybB4gY4J9MAnVqDtvtI6/Q86VNxzC89m?=
 =?us-ascii?Q?MkONVhoujDH/z9GMoqJQMg8Crs0hTp6TMCCxQmBHZPWnWS6dk13o4an97q6f?=
 =?us-ascii?Q?p9z9unHOeOi7I2FxK/296HTPYjna+RpCNc0SNCnGNI8TEPjfm7Od5DOexpiX?=
 =?us-ascii?Q?IpxIVLZ3fhSSxSNj4NIlGrjjIoYdBgRmAjIDE1mN4/wtUkyCFPJNnZw5Pj96?=
 =?us-ascii?Q?wI1DiTBPbQkcY4ccWu5Uq24sWN6q4TRpxZNDu+4TdCF/ByUSBstnZn+uahB5?=
 =?us-ascii?Q?iRoEtfIJXB2+0Z8PLFtWj6qYe2ci7i9JzwAbmCeMj/bAgx6pOrLNH4hIIXWz?=
 =?us-ascii?Q?NHclPmXZPrcHc6D/bgDs7QMRMd21bq9y/wjP6fCVioX/10ZPTTbHs5lF5Zvp?=
 =?us-ascii?Q?TDEd64+RowIMOJwcvndulsYv+PKVTCC5szagkOGBeSQ0hPiwc91Pazljfej5?=
 =?us-ascii?Q?TMnfLkCYWuqjFn4oNuS8eJqjL2Az89NbILb06AXzMpX4mENUcHcGoW2d+lxr?=
 =?us-ascii?Q?Z/QAdrRL/y3ighPXnlBNfz3U0C0a/rVEg/U/pRTIunCzdM33xL+0kmq+gJIP?=
 =?us-ascii?Q?Al1J3TCXW51+QIZorHqiT+0pA4yrVXdcaJWn7Os/26N7b/4h+0ADFJJoU/kQ?=
 =?us-ascii?Q?ZlJMcjaqQouNXTzElOrlhAUo09J0K/StiHlttl8aBhmM6eU6yYTc7iUauTWp?=
 =?us-ascii?Q?kWeZ2MzODrpT3hbsgLd8x8l9N1vUHwU/YQxS+QbfwZBsRj3rNjRThR1hwkTz?=
 =?us-ascii?Q?ek2ypsmz8SQiwlHV5pF+paWKYce5M/6gfr2VHX6ZWg3e4vks7cCZ/sPBOr3J?=
 =?us-ascii?Q?WgooordZ3bOcgp5iHAFDnAZ+CqZUlndsFz5JAOLBswA2NWKd4Z70TnrHPlsx?=
 =?us-ascii?Q?ENePvtSc9XWDLxcxi8fLCv9N81xdBJW1NKlFhKcoqvIIMxc27k3VzYjCzpDo?=
 =?us-ascii?Q?hIDHRshI361gwkoUQGDJGcJjioKswQJhPlFIIfTEAv353lF+Yv3b4U2C1fDV?=
 =?us-ascii?Q?daznsDYQoeaASLP+HKo2L+W05aHMDzfuswgTc65RJLzPAdHKb9X374f5oQBd?=
 =?us-ascii?Q?vfUJFEBZkwbWNZPyvFquexQWOk5neuHygfD2k8p2Rv12P1jR6QeWiYh/DZ64?=
 =?us-ascii?Q?PR27fCIk+b+Ifgu5slYMayH6qpK9R7zAN5mNi1Z2KCWNkaxpEwrhFv6ncHYu?=
 =?us-ascii?Q?UOmKwxH1frpDMl3n+GjtBPQ0qEHc0ixCvMtsdEfzMKPfz9RTRPf7ia4/Dm1D?=
 =?us-ascii?Q?IpvDl0fk/lKaMdQEEZgCFiSWPrUS9HNpHlUCj9SWRQdbq9xsP+q5hY9ri8iy?=
 =?us-ascii?Q?yLGZsRBRbi3KE6xPM94nwUqaOenT9daoOn7LydTNRb4aVR98ROcgK4CYgdjX?=
 =?us-ascii?Q?VTDnvs5OviFsB2yH40iGl8o3hurutzK5Bt6lfsJsbE45YYgArNrBEBdQmHXO?=
 =?us-ascii?Q?xnOlG3ujXGxmp0ODKuKeYhwRcyhQ39IMExfBBhbDnOzI1cay5NPk8ht1NAa/?=
 =?us-ascii?Q?/6maFBD3Schn8LQjcw3Zqu2pxusawRFtvnwhu5CKqiKbr+zfD/fGquYcyeT1?=
 =?us-ascii?Q?DN12BxRkZGRHZiWLWW2cdi4t86UhynpFMuDPf1tHAhy+YZUxCXZEO/os5bvz?=
 =?us-ascii?Q?6THI2FclCiTUv4Q+eidIDqVQiN1Yr1vjU5CWB/aaiHG2jrgf+JGKg0GyxFyP?=
 =?us-ascii?Q?q9t/jE3lnPY2CKlpip0T5FRsVFH+NOOOBaOXFEGf8xi0dFLGn3iJSWwASBlM?=
 =?us-ascii?Q?8Oc5eR0IdBpMsUZt0L9Kb1QW2w/mVyY=3D?=
X-Exchange-RoutingPolicyChecked: 
	sYyjAvjlWam+yRPUg4b0GKAkprf2ay76keO5cbn7sIj+rQ25rMS1gm7Ffpj9Hm6tzxE4ec2wit7Pj+9ZQwVsqihQej/QCTxMB1p6xWbRcrSxs/alwF5LYH0Iy5ujrFRRIkSF6HSgr0fA0OD3hwYxSADE/SQXmA84CGrjrB5iseeRZaPCTKUIaSforcEIX9d6tJpHQBWi0RoIEsNjQkFRa0cyAhhgdh8y3c5Tab8WsePM17C+V3Wjmbne9GZk7C5fI3vWQ1TKNxhDCKg+PvC8PnCM3QaJb0V5sjikhWZpS/PwByytmbEwXcrda8FmACMHlp8RqjecYCUYmnUuWM1Vcg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3d3938-42bf-493c-a1a2-08df0248df1d
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 01:33:31.5280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scXHTlDm5xi1crYa7U1A2QjkKiZfUjkp2+wcSAzMCa8GxmtMQsdwPaoL8PXiQwke9LSsSncu+EEmcxKLzU5l3MibDe0pZHFTS+U+r7Y2HZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX4o0I07r/C3w/
 sVvHUvrgaZU6zAXC+J5RCRf8QpNm9WmJ7ctSfX2Zfh5Rrb0aVs+nN0nG5yR7fIvglf9jdgFSDMZ
 tM3wbucPGo8uIOGYQiD/cI5ApzYxWBg7hXsPS7MXvAK4TSjJClVi
X-Proofpoint-ORIG-GUID: TrCg5awQHbKf_6xPkO8SyFgICbsJHg2H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX2CtiPiSw8H8w
 WdxYFPXmC0TijPtJ0nuMZk9g5tZGsrkltGP9RBYHJG0gKEc6D3HRD2AbrPYBX5SwvLbTaBcFm5Q
 JZB3kacoP6LT0zFaknLUY6SnMSlRz42kiF65eNTewiBB6aUPhq89JEJPJ70dYbiaFYd3TavtoH5
 3MyjxI1zghwBQ6Gg0Qm1SxcMB9VCSsE4mag+s87y1rndmwvh/4zGUCLMEJJv6y5LDhAEw//3FY9
 cEqxelWrwN1Xz9IyB2oyUkdrSv0VkmzGioJL91Uq5zO7LGM39ici/h+n/d1t51Ech/Ug2H7aTd5
 PmZWxSoE36TRQtCOz53TDWtMXL+o5hdId/7ypILG4fK8mcWEwU81AcX2idhQ+5Mqybx2gZCL+tz
 ZYh8qo57spsTjLWa3gGs6B2dYl8CAHoyEKZ+0/UMDLVQsmRRLJ1CiU42FkmVT9f10xzAkcY62pq
 ESPH1/0z4RzMws9HhYg==
X-Proofpoint-GUID: 35OtUHcOkQm8rI_n1mvUNTtG8Sxz0iD4
X-Authority-Analysis: v=2.4 cv=RLiD2Yi+ c=1 sm=1 tr=0 ts=6a8cf0ef cx=c_pps
 a=+CKpLqsC5QamL8vULJ+FWg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8 a=tyuvAb6jAAAA:8 a=yC51jOswJ7eKArgWbMgA:9
 a=fYNom5PXsM5enKJDCoVv:22 a=FdTzh2GWekK77mhwV6Dw:22 a=vMd6T1JfvD_20K6YSfI9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244179

The patch is from:
https://github.com/libarchive/libarchive/pull/3346/

Fixed:
$ oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native

cannot open archive from pipe
/path/to/tmp-debuginfod/work/x86-64-v3-poky-linux/xz/5.8.2/localpkgfeed/x86_64_v3/bash-locale-vi-5.3-r0.x86_64_v3.rpm
libarchive error: cannot open archive from pipe: Unrecognized archive format
exceptions encountered during archive scan

Note: 0001-append_filter-Use-last-bidder-for-filter.patch was already
present from upstream, so only the remaining two PR #3346 patches are
added here.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 ...-Verify-that-bidder-and-filter-match.patch | 103 +++++++
 .../libarchive/0003-Remove-bidder-name.patch  | 258 ++++++++++++++++++
 .../libarchive/libarchive_3.8.9.bb            |   2 +
 3 files changed, 363 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
new file mode 100644
index 0000000000..a91f518207
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
@@ -0,0 +1,103 @@
+From db4fb440792278cd01e0829c93f6b62f567b704b Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 2 Aug 2026 14:26:22 +0200
+Subject: [PATCH 1/3] append_filter: Verify that bidder and filter match
+
+Make sure that appending a filter always matches its supposed bidder.
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3346]
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ Makefile.am                                   |  1 +
+ libarchive/test/CMakeLists.txt                |  1 +
+ .../test/test_archive_read_append_filter.c    | 54 +++++++++++++++++++
+ 3 files changed, 56 insertions(+)
+ create mode 100644 libarchive/test/test_archive_read_append_filter.c
+
+diff --git a/Makefile.am b/Makefile.am
+index 2fb4fdf4..c96b3bc6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -404,6 +404,7 @@ libarchive_test_SOURCES= \
+ 	libarchive/test/test_archive_pathmatch_oob.c \
+ 	libarchive/test/test_archive_read.c \
+ 	libarchive/test/test_archive_read_add_passphrase.c \
++	libarchive/test/test_archive_read_append_filter.c \
+ 	libarchive/test/test_archive_read_close_twice.c \
+ 	libarchive/test/test_archive_read_multiple_data_objects.c \
+ 	libarchive/test/test_archive_read_next_header_empty.c \
+diff --git a/libarchive/test/CMakeLists.txt b/libarchive/test/CMakeLists.txt
+index 44f839f8..c4102c3d 100644
+--- a/libarchive/test/CMakeLists.txt
++++ b/libarchive/test/CMakeLists.txt
+@@ -33,6 +33,7 @@ IF(ENABLE_TEST)
+     test_archive_pathmatch_oob.c
+     test_archive_read.c
+     test_archive_read_add_passphrase.c
++    test_archive_read_append_filter.c
+     test_archive_read_close_twice.c
+     test_archive_read_multiple_data_objects.c
+     test_archive_read_next_header_empty.c
+diff --git a/libarchive/test/test_archive_read_append_filter.c b/libarchive/test/test_archive_read_append_filter.c
+new file mode 100644
+index 00000000..5c301d52
+--- /dev/null
++++ b/libarchive/test/test_archive_read_append_filter.c
+@@ -0,0 +1,54 @@
++/*-
++ * Copyright (c) 2026 Tobias Stoeckmann
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#include "archive.h"
++#include "test.h"
++
++DEFINE_TEST(test_archive_read_append_filter)
++{
++	struct archive *a;
++	int r;
++
++	a = archive_read_new();
++	assert(a != NULL);
++
++	/* Append a program bidder (without filter). */
++	assertEqualIntA(a, ARCHIVE_OK,
++	    archive_read_support_filter_program(a, "prog1"));
++
++	/* Append a filter program which comes with its own bidder. */
++	r = archive_read_append_filter_program(a, "prog2");
++
++	/* Verify that filter uses its own bidder. */
++	if (r == ARCHIVE_FATAL) {
++		assertEqualStringA(a, "Can't initialize filter; unable to run program \"prog2\"",
++			archive_error_string(a));
++	} else {
++		assertEqualIntA(a, ARCHIVE_OK, r);
++		assertEqualStringA(a, "Program: prog2", archive_filter_name(a, 0));
++	}
++
++	archive_read_free(a);
++}
+-- 
+2.49.0
diff --git a/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch b/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
new file mode 100644
index 0000000000..bbd2478577
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
@@ -0,0 +1,258 @@
+From 76c7142bd2595184826722063598fddf62031cca Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 2 Aug 2026 14:31:33 +0200
+Subject: [PATCH 3/3] Remove bidder name
+
+The name was only needed to find the appropriate bidder for a filter.
+Since this has been resolved by accessing the last bidder, since in these
+situations the bidder is added first, then the filter, the name is not
+needed anymore.
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3346]
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ libarchive/archive_read.c                         | 2 --
+ libarchive/archive_read_append_filter.c           | 1 -
+ libarchive/archive_read_private.h                 | 3 ---
+ libarchive/archive_read_support_filter_bzip2.c    | 2 +-
+ libarchive/archive_read_support_filter_compress.c | 2 +-
+ libarchive/archive_read_support_filter_grzip.c    | 2 +-
+ libarchive/archive_read_support_filter_gzip.c     | 2 +-
+ libarchive/archive_read_support_filter_lrzip.c    | 2 +-
+ libarchive/archive_read_support_filter_lz4.c      | 2 +-
+ libarchive/archive_read_support_filter_lzop.c     | 2 +-
+ libarchive/archive_read_support_filter_program.c  | 2 +-
+ libarchive/archive_read_support_filter_rpm.c      | 2 +-
+ libarchive/archive_read_support_filter_uu.c       | 2 +-
+ libarchive/archive_read_support_filter_xz.c       | 6 +++---
+ libarchive/archive_read_support_filter_zstd.c     | 2 +-
+ 15 files changed, 14 insertions(+), 20 deletions(-)
+
+diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
+index e844e42d..406d84de 100644
+--- a/libarchive/archive_read.c
++++ b/libarchive/archive_read.c
+@@ -1290,7 +1290,6 @@ __archive_read_register_format(struct archive_read *a,
+ int
+ __archive_read_register_bidder(struct archive_read *a,
+ 	void *bidder_data,
+-	const char *name,
+ 	const struct archive_read_filter_bidder_vtable *vtable)
+ {
+ 	struct archive_read_filter_bidder *bidder;
+@@ -1307,7 +1306,6 @@ __archive_read_register_bidder(struct archive_read *a,
+ 		memset(a->bidders + i, 0, sizeof(a->bidders[0]));
+ 		bidder = (a->bidders + i);
+ 		bidder->data = bidder_data;
+-		bidder->name = name;
+ 		bidder->vtable = vtable;
+ 		if (bidder->vtable->bid == NULL || bidder->vtable->init == NULL) {
+ 			archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
+diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_read_append_filter.c
+index 9dd9f536..5cc8ff55 100644
+--- a/libarchive/archive_read_append_filter.c
++++ b/libarchive/archive_read_append_filter.c
+@@ -174,7 +174,6 @@ archive_read_append_filter_program_signature(struct archive *_a,
+     __archive_read_free_filters(a);
+     return (ARCHIVE_FATAL);
+   }
+-  b->name = a->filter->name;
+ 
+   a->bypass_filter_bidding = 1;
+   return r;
+diff --git a/libarchive/archive_read_private.h b/libarchive/archive_read_private.h
+index 3bd8de2d..e30b6c2b 100644
+--- a/libarchive/archive_read_private.h
++++ b/libarchive/archive_read_private.h
+@@ -68,8 +68,6 @@ struct archive_read_filter_bidder_vtable {
+ struct archive_read_filter_bidder {
+ 	/* Configuration data for the bidder. */
+ 	void *data;
+-	/* Name of the filter */
+-	const char *name;
+ 	const struct archive_read_filter_bidder_vtable *vtable;
+ };
+ 
+@@ -250,7 +248,6 @@ int	__archive_read_register_format(struct archive_read *a,
+ 
+ int __archive_read_register_bidder(struct archive_read *a,
+ 		void *bidder_data,
+-		const char *name,
+ 		const struct archive_read_filter_bidder_vtable *vtable);
+ 
+ const void *__archive_read_ahead(struct archive_read *, size_t, ssize_t *);
+diff --git a/libarchive/archive_read_support_filter_bzip2.c b/libarchive/archive_read_support_filter_bzip2.c
+index 588953f2..1cfc55dc 100644
+--- a/libarchive/archive_read_support_filter_bzip2.c
++++ b/libarchive/archive_read_support_filter_bzip2.c
+@@ -91,7 +91,7 @@ archive_read_support_filter_bzip2(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "bzip2",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&bzip2_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_compress.c b/libarchive/archive_read_support_filter_compress.c
+index 4e1f1dc5..4763995e 100644
+--- a/libarchive/archive_read_support_filter_compress.c
++++ b/libarchive/archive_read_support_filter_compress.c
+@@ -160,7 +160,7 @@ archive_read_support_filter_compress(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	return __archive_read_register_bidder(a, NULL, "compress (.Z)",
++	return __archive_read_register_bidder(a, NULL,
+ 			&compress_bidder_vtable);
+ }
+ 
+diff --git a/libarchive/archive_read_support_filter_grzip.c b/libarchive/archive_read_support_filter_grzip.c
+index 9d9ad46e..8457ec7c 100644
+--- a/libarchive/archive_read_support_filter_grzip.c
++++ b/libarchive/archive_read_support_filter_grzip.c
+@@ -62,7 +62,7 @@ archive_read_support_filter_grzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "grzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&grzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_gzip.c b/libarchive/archive_read_support_filter_gzip.c
+index 89ae0f37..34b174b7 100644
+--- a/libarchive/archive_read_support_filter_gzip.c
++++ b/libarchive/archive_read_support_filter_gzip.c
+@@ -96,7 +96,7 @@ archive_read_support_filter_gzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "gzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&gzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_lrzip.c b/libarchive/archive_read_support_filter_lrzip.c
+index 33910fe1..a1d45d77 100644
+--- a/libarchive/archive_read_support_filter_lrzip.c
++++ b/libarchive/archive_read_support_filter_lrzip.c
+@@ -61,7 +61,7 @@ archive_read_support_filter_lrzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lrzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lrzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_lz4.c b/libarchive/archive_read_support_filter_lz4.c
+index 19086a1f..28189a07 100644
+--- a/libarchive/archive_read_support_filter_lz4.c
++++ b/libarchive/archive_read_support_filter_lz4.c
+@@ -118,7 +118,7 @@ archive_read_support_filter_lz4(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lz4",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lz4_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_lzop.c b/libarchive/archive_read_support_filter_lzop.c
+index ebfaf01e..5a552fce 100644
+--- a/libarchive/archive_read_support_filter_lzop.c
++++ b/libarchive/archive_read_support_filter_lzop.c
+@@ -109,7 +109,7 @@ archive_read_support_filter_lzop(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lzop",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lzop_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_program.c b/libarchive/archive_read_support_filter_program.c
+index cf7c3613..a9e02a32 100644
+--- a/libarchive/archive_read_support_filter_program.c
++++ b/libarchive/archive_read_support_filter_program.c
+@@ -156,7 +156,7 @@ archive_read_support_filter_program_signature(struct archive *_a,
+ 		memcpy(state->signature, signature, signature_len);
+ 	}
+ 
+-	if (__archive_read_register_bidder(a, state, NULL,
++	if (__archive_read_register_bidder(a, state,
+ 				&program_bidder_vtable) != ARCHIVE_OK) {
+ 		free_state(state);
+ 		return (ARCHIVE_FATAL);
+diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/archive_read_support_filter_rpm.c
+index 01bd1bf7..1cfddf75 100644
+--- a/libarchive/archive_read_support_filter_rpm.c
++++ b/libarchive/archive_read_support_filter_rpm.c
+@@ -71,7 +71,7 @@ archive_read_support_filter_rpm(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	return __archive_read_register_bidder(a, NULL, "rpm",
++	return __archive_read_register_bidder(a, NULL,
+ 			&rpm_bidder_vtable);
+ }
+ 
+diff --git a/libarchive/archive_read_support_filter_uu.c b/libarchive/archive_read_support_filter_uu.c
+index c0f6f48e..10d49648 100644
+--- a/libarchive/archive_read_support_filter_uu.c
++++ b/libarchive/archive_read_support_filter_uu.c
+@@ -92,7 +92,7 @@ archive_read_support_filter_uu(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	return __archive_read_register_bidder(a, NULL, "uu",
++	return __archive_read_register_bidder(a, NULL,
+ 			&uudecode_bidder_vtable);
+ }
+ 
+diff --git a/libarchive/archive_read_support_filter_xz.c b/libarchive/archive_read_support_filter_xz.c
+index 7c8e0cb5..b00ba543 100644
+--- a/libarchive/archive_read_support_filter_xz.c
++++ b/libarchive/archive_read_support_filter_xz.c
+@@ -115,7 +115,7 @@ archive_read_support_filter_xz(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "xz",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&xz_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+@@ -147,7 +147,7 @@ archive_read_support_filter_lzma(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lzma",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lzma_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+@@ -180,7 +180,7 @@ archive_read_support_filter_lzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_zstd.c b/libarchive/archive_read_support_filter_zstd.c
+index 12eac04c..163f54b5 100644
+--- a/libarchive/archive_read_support_filter_zstd.c
++++ b/libarchive/archive_read_support_filter_zstd.c
+@@ -87,7 +87,7 @@ archive_read_support_filter_zstd(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "zstd",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&zstd_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
index 868086e319..01a5249a88 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
@@ -33,6 +33,8 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://run-ptest \
            file://0001-append_filter-Use-last-bidder-for-filter.patch \
            file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch \
+           file://0001-append_filter-Verify-that-bidder-and-filter-match.patch \
+           file://0003-Remove-bidder-name.patch \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 

