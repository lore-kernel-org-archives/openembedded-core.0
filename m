Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590D9EE01FA
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:16:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64805.1767104195487608830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cGTBK2vC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUDcUaO3658275
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 06:16:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=4thEGpRVAoRh4gsgznZl3JSW67EqqWZ0kAoU8S/Vwy4=; b=
	cGTBK2vCJz7e8JnxxxSDAz3DPDmaF9OBJhDPPyYmeCctkAfnmjJ2w8GWy/zg/yui
	v8QTYCuM2LqJWrf3ppGwgmMzxefp1Anp1E2RodzNyJmlktNju1JNXs/TJqqlkxpo
	u/jyxJx1iRHdWqq/VV4quMQDwN6vRWmFnkvCntqwzgrzyZri0eEcqjbkCB4HEbgD
	I4fRo0Utno5yIYvVp3ywAzJeCVabNuItHc6XryfrBTklTq2rSuQzWNb3Upkf8Q1z
	3MXP1UtENdbcAilsZSJiKTYZmJSz4ZXMwXYOrQpvx3rbM6/D/jNGU23dp/pFPTwC
	cSsxbSqQJEbfzLWwOEi4Xg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010052.outbound.protection.outlook.com [52.101.193.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bafukamqj-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 06:16:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m250wr3IFQ3aE6rAs6ea7/0Aqpfl72w2ou55Dqugltk1Kw5zqD2mNlRfpV4/w1S2hir714cWkIAM1ZvvL4nwDuDif2/RFxzaEywlKWXK16Slf/SysvuCg0VPsA6gPns2kQudRtwTYX9GH4nL6BeXWQeFvDkAEF3Ubxng1Wev6joYHtbUDlIxyrho0mMNDXHvjDBAFFiL15x7AHfqIuzB5/LGlNFzEMzDwm7Y98lyEBoHINS0SZBq+VN8gk7mCwQQ0apruA92KuSOIwr+BVyfGNFLA0s3LVisezu/S7GaHqc0gitX2uZpggbzWQeddgpux1dDvjjLhGiBV6z1IYJPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4thEGpRVAoRh4gsgznZl3JSW67EqqWZ0kAoU8S/Vwy4=;
 b=iyURUAPtOtytUZpvrAPSjjg3oEEqW4nJvip4lROC5UpGwtY/JLrPs+WazTkCwcZibSbThL1VxT4rUyUYWmzaMh/OqPXIzwlcyT80AHcvGVAEdjTKuo8OYaYni4kX4yyG42mCQbUXGMV/5pB6ZUY+pEnKAyMZjCFZ3/Yqkb2/dM1/z9Xa8sx68//m6hOl+xPRINXQ9uNeOiAB2GDCP4Im5H7EysaSg/M3hehKciGr85lk5oqKFoRurYfqD3ByoQp3o1mi1RzGgqDq+epVG1zQsqZwux334k6YZS+Rs9y/v6EK9rCRZHy2+hRXBrVD1zgVWC6xld9+yAtdTxygag0ZCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by SA1PR11MB8859.namprd11.prod.outlook.com (2603:10b6:806:469::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 30 Dec
 2025 14:16:31 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:16:31 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v2 07/15] kernel-yocto: Fix for buildpaths errors when rust is enabled for kernel
Date: Tue, 30 Dec 2025 06:15:32 -0800
Message-ID: <20251230141540.1974380-8-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|SA1PR11MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3f5508-2dc0-4022-7b8b-08de47ae07f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+xZi5Lnb/V8XLEnzMHej26sDASloaQ+wWvdspLy2lv8xFOTZaN9QejZ+qbbj?=
 =?us-ascii?Q?nKf8LdjuSivCa5tSKrd6UR6PISKz0anLFcKGIifM/tFccr7o8/VzV+OGaxV0?=
 =?us-ascii?Q?rrmwXbJUrmjBSEFwqSvcG8SW+8IvPyeatWtzyQpP71sBbxJo5hbv9Agnob2t?=
 =?us-ascii?Q?l1bKTaB4arjmsDCo2ZIutA2dWfmZqH4fNe7X/pClfYkItsfYFJ0S0NAjSJwS?=
 =?us-ascii?Q?lsxKNbCAxV1brPPstvipt7RlUZDVOS0f8hLECXnkuAOojlWO8niI1W/vNcrP?=
 =?us-ascii?Q?fgncPR0FCF0maSyQnOyhSzvu+LxQ5Hu8MYVA9+dU4WCq7covsAwIlKL3C9pe?=
 =?us-ascii?Q?EFdmZ+3mn+ALcId7rjUnO1aGiGNW5wEmawt/oIJxVKBDtHxYOGSXG/AK0fNJ?=
 =?us-ascii?Q?XbCOMFbAAbQK9t0X++IL+eBcNw6T1hcMlwVq9r2MGabc7UDLGJfzkY2KjQdo?=
 =?us-ascii?Q?h4KNQA+jt0l2UGPY0ZIp27My2zqqaBe4RLxWWPTF5qiBZyBzy2vezvzBdTRj?=
 =?us-ascii?Q?QzcWMAWpV2ogxWATTusDReHREfhBFDb7eDUd14g3i1oB2CfhFZdlyO2Oygbn?=
 =?us-ascii?Q?uVe0vvMxxxigbcUV/aV6l9CTg866WpLI7HBDLKbiufPwO9vGKmbO84Jk4i3a?=
 =?us-ascii?Q?pOo3ybAYTyo4HeNL0eMIffagAB0PRh+fD5UPfICA2V3M7mdbdyFmIGRe+BTQ?=
 =?us-ascii?Q?TzeYFTv0Z0jWKW8hURs+3k5olLveq+dmmNGOOCyvWLSSMO6d31v1cUCviU3k?=
 =?us-ascii?Q?mLLk7ukcw0fEs97ntBdP7s2xsEVNLl4N5z3exWoiDW8fb0VFsKYbqBWfdels?=
 =?us-ascii?Q?qCYmUe04ZID5rni81U+zJ8sIoLVxxw1ok4ZBExlj+j3cwSdTr8d5fzMva4fg?=
 =?us-ascii?Q?CW9w+p4UvHFuXvu5MTO/k5aPCUfyE8iVc7isk4IBNNgz4T08yv9HjnsVHkCs?=
 =?us-ascii?Q?YPPiv8pJJ6Y4FPnMEKWGC+9Mq4HhBUvDcT9dmjlBBtpfm5vX1iUN3d7G30AF?=
 =?us-ascii?Q?ABEg7+lqO0RADYQEPOj5lUjrYvQBRMiDB3NGDiIjvLaCOIFvzjUVwSJDFyo7?=
 =?us-ascii?Q?xK+ZNHL+FZJV0XDhgiB5HspgU+Mx0SLjS5cC2LaM4woZZ2WEgCxgl8vHqF70?=
 =?us-ascii?Q?U6xA9zCRpgtpdiTMGrDt4P+51ukYdmD/UxWg90xJ4s5OIUcADlKhtjkXtt7c?=
 =?us-ascii?Q?qve9sCRPlZpb0B5H8L+nNeU4n1ysRSJqUTktpgfFMqP1Lna1DAssxcZ+ky3J?=
 =?us-ascii?Q?bFbvGRRWjc9wfBqEqOwf74YWrwm4ITVQFqUGwfhZ/ERPk5wK9apAARc24Jvd?=
 =?us-ascii?Q?VQ19S8Ymkbiy4WRZ0/LDbC2sMSKA/is5SuIO3pFnTYw15oU2Eek4djjH1VW+?=
 =?us-ascii?Q?rZeiq7G8uF2Mky7GW4r4ShIkumDO7Boh7ByxGPrfJfFSyJcXdHn7CmTYzTJ0?=
 =?us-ascii?Q?nyIzU1kglDlzipwAw1m2ij54cfC5GZEuvUiIL4PR3qX1UoJIBqPlBcpZEGj+?=
 =?us-ascii?Q?vcUC9sXSeSjwpkk52TOJvbbaNurrEfXnCUKO?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fwuYQmDqoX+TRFMqQYogfWcPeBMpxF3Ii3OC5cR79Xm45IwOfNnHdneJIHCM?=
 =?us-ascii?Q?RHA4V3wCm9RGSiGWJbq8XDuRYembmowrFBvuIxtMmQGrHzpTBATYdoy8Ejpg?=
 =?us-ascii?Q?H26tgizrh0pO77mCaOHDZopyA1F1YoWKqZSnAZspGYgQIjfxWQoNWkzyVIQY?=
 =?us-ascii?Q?npvdhGo7qt8QvnA+wgfONdKbR9lDw0YeSskpEBjToVb2lvhKaC1R1DKErZus?=
 =?us-ascii?Q?pD6agpyWOHnAF1rPnFusiwqu14Sjhy98RVGn77nIrvp8BHLjN9xg5oVlLYd2?=
 =?us-ascii?Q?+AA/AxEYe1Y11ex0Wf4Inpkg0LqBtFWSFlHPZ3jV35F0FS9YKo3zuJu8mdAS?=
 =?us-ascii?Q?zqfowiax2i2MHO8AGKP088I/CXBc/D69ZSstQ00Kmb3XrUnHlqdsGR0i+GmD?=
 =?us-ascii?Q?f3u7atKfpGt0+4L+m5yrtSuKACWJULf9ASTQjXzO3FleMVyG/X6bX2MPhtGw?=
 =?us-ascii?Q?fyWFcbx75XJLSV/YWGXwNwP6j/2797DtA0LOxirmzpaWrKwsDlY0v53lBcOe?=
 =?us-ascii?Q?N8kZTlLU6pk/xFYg3UkXkwZPHPdBFlh4cQQmZKyADUE+1yOojLYwjYnyoyW0?=
 =?us-ascii?Q?lIt15p6lqa+5cCpvSnr6b1HVhMecRhxw/Q9hUujC6zGyT53rew5Cevr5s3h9?=
 =?us-ascii?Q?+1s3al/Y189ya0ykWgxzqo8e1/zJKxP2nNVcBLZEIa2OfaMIfwBPBMN2k7Lk?=
 =?us-ascii?Q?qZC9ohD8ZyZ5cJhOGs/mF+qchFP2PJktFXGdWJHiz3DfLAbefkSUX/as4JPD?=
 =?us-ascii?Q?Rqqo8UUnfHFJ5AO9+QLPh/NR705JRrnAtQ03Q6s4/b9zH1urmgmFa6SLK+RH?=
 =?us-ascii?Q?uvZrAuoC/CRcWhyZAhHgjkbpuemLD2m3EyQuyuKkOlUjjm73cIkZcrdD4wcv?=
 =?us-ascii?Q?EhHn5HOL+yvObaVfegE3DRXWHhJlH+n6rwtivPXddbEh4bD5dTZ1Vwq29jug?=
 =?us-ascii?Q?ei5fFX9hKVTNknVeR92w03OTY7wzxXE712HitrLEKZNLUAwXGLEly5yq7TSX?=
 =?us-ascii?Q?Xo3vcCYK1inJxFwmTarzJPedXTvkBffV9LFn00pxDjeXO+zaX/rZRLplXQQ8?=
 =?us-ascii?Q?klVjvcxGxPzLu626lexrfpdIqqqZGVEaQocd5DwBMdu7cQxVu/doIu8S21Et?=
 =?us-ascii?Q?QPMd2kVfvYyZVMQpL+3fYu+Qs10ufdB8G2ZeIJ6hqvi1OlVTv44nkumQfwmJ?=
 =?us-ascii?Q?4RniH3P/FMKXHuw9CglKr11slCuiNbzk4Il/fUc438EsHgUuEEJY0t2JHOIb?=
 =?us-ascii?Q?jV1r6tUe8vaaHrKjvkjssCxWc9kBsnT6fURO69tdTzTiXTPojsp9/5gVKzmg?=
 =?us-ascii?Q?bGAX3nMSAJRFKTcsPOp4n83h9PVUkTNriMJdofg8Vaaw4POTbfNOZJ0uAKpk?=
 =?us-ascii?Q?hUEAONgjlUdqzFkjFSskCRCzi2YQtJ/1XnfOBUE9GCPMp2yDmkBjUbh9tzPj?=
 =?us-ascii?Q?M1hczlMvQnld2L7G9oHDvuJJ6SFPJmTbRSsS49+CHE/dG7VGIVcN7cbfzHSX?=
 =?us-ascii?Q?kenW3+Y9CwhixRcJyjC/C8Pfk12mZgJZTREBYufCN1P9VvAllEHfpBhHySaJ?=
 =?us-ascii?Q?M15YLhw++Hs2jNFdtmljsRJA9Gcd9Dw2cosOyp8nKdpp0PE6VW6OprM0Og+G?=
 =?us-ascii?Q?KjMrUbwMfDd7C11z3jUb+A2ilctpligVhgKHLy54JrQ/U4lzkyx0XgY1rcu9?=
 =?us-ascii?Q?JpNS11Tox6uHnIMrpHcRc2JxwwZ5UMtzp7WsKVgrMytuFbIQSApa+ckL9aTu?=
 =?us-ascii?Q?ME+mIzZ0GectrM8lSiM0z0xYgFoKdzA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3f5508-2dc0-4022-7b8b-08de47ae07f5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:16:31.7347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DA1iG/hJvHinZlpB+Nggt9kufv3wbqmMH+YUiuyNK/gwlOnyklCjgM7dH7/qphrC2ttBQsyTOLZpuXdGAoE0UZOU/ZHy7K0/ZKcK5ehVH5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8859
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ccjfb3DM c=1 sm=1 tr=0 ts=6953dec3 cx=c_pps
 a=N8fQrVaeAljVkTo8kKJ49A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=hOBxLMctpgrGYW2eJecA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: FUb1uJqcK2rZEfepW1QcwYbKNGkhkhzx
X-Proofpoint-ORIG-GUID: SVIobeLevmyQJ3BljzoEpIrKNBneZUA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX1msd7osgYDym
 s62uRBx6ab9NjecSAkb11FZ7DKopqWokQs31keskbLq/UQTLiEa9muC+tozm6XKiYZOOUNlMw3s
 oyaQ5rE7HRhjJ0fXlB2H6bRQQiqDlQxVnfAe3ovNg9NyKyUl6ogEHOY7DdCihud+14vY3cWBi+z
 UMdQDmMld1BrZntp/Op1VJN6vrIgGeV1H+xOEAaVpk8HwGy32rGGsb2i2zqicvOd8OXmbblT5EY
 kz3Zv388NyqgYIFoFapJbad7co4srNrCzfT/YHsjFfdd+jSTpDFTB1gKcrY6qmw7JTVRQK2me55
 RqIUgPdLdgwP7Kssx+GFZaDTyYsRjAVcR9EwAGcEXZUxj0BewRINTi80erZGcRkwvZm+jWQ113P
 U1UCvSgZXQvcibaFv74AZ9tURGZ+J/qqzWXJFRzBIAjRqbqjH7SC5Ue9ODtNkDF4Gldxt5cDICi
 ehyBzSf6hnE2FpDmwlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228673

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes for buildpaths errors after enabling rust for linux-kernel

Co-authored-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index dda235d4d0..c3e1137200 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
+INHERIT:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' rust-common', '', d)}"
+
 # remove tasks that modify the source tree in case externalsrc is inherited
 SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
 PATCH_GIT_USER_EMAIL ?= "kernel-yocto@oe"
@@ -27,6 +29,11 @@ KMETA_AUDIT ?= "yes"
 KMETA_AUDIT_WERROR ?= ""
 KMETA_CONFIG_FEATURES ?= ""
 
+RUST_DEBUG_REMAP = "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR} \
+                      --remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR}', '',d)}"
+KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
+
 # returns local (absolute) path names for all valid patches in the
 # src_uri
 def find_patches(d,subdir):
-- 
2.49.0


