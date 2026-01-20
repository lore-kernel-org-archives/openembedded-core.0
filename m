Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68D5D2628D
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13456.1768933904351787706
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mLaAleWm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KBl3fZ3609007
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=DQqyLIP6r5DuXj6u8HBgcjE0zoaPxXTO2xQ2SFmbB1w=; b=
	mLaAleWmcL0duF1F9TJeMHXXIZ3ydyn3dFst6C+pFabtFt4Hfv6e6Bdm/mJeBPVA
	/VwK9xTsUdQracSVQ3c1s/WBVZEMx/j6rw+liPoDugMGr2GU3l4mvdmCr6gW3Z/T
	EQ7FJSqAiyxg3BISjErUSHkadTsbE7nuqleXTjEDRkxjz/BSMOcksaTiFyDkkKk3
	lCV4+ciJKfc6g5IrMa0LWT1O0xMyROLb3snBFmPyyuu7V1UF1030haKou7qPqozw
	iaurmmrcoKupxK/kdqTtGJhss/XUapEcz5HMvErSO9nZmLYDQjFBppuisQjWhMIM
	UPIpLX5NaUOU7doJEvdA7g==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010035.outbound.protection.outlook.com [52.101.201.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymukh03-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 18:31:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnPWPL2CPOtDY1mcv4/wLKLEvfvS1yjYbmS6NzqxWX4Gvos/E0wQKrUYSn9xx91UI3vqY9DOOanUuONrLU5o/669ghgFwDowVzpxhCuKFSKc3nA79ZdoEjpZM8HsFV/3E2tiMQQ7K1okpVN2JeOfGCFFmi3RZYCqBa7Bj74UM/PWHnw7gJZKavlE7SHFIIPMPbMeQEpgivJOJl4+HuHxhLYZ7IaoAErEBbHi0ul5fffbtXwam1bSdzUa2IkceNe0ekJF/W2iUjO6cOgtmD6oeCFEEQVcf/0Goq5fXJMKx4akhGzGIpVjPcN71wMrtTVGpYHSGIAIjTWviJvyHhr9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQqyLIP6r5DuXj6u8HBgcjE0zoaPxXTO2xQ2SFmbB1w=;
 b=HCuf6zRgYyBPnX4esPvOZhuk4NgbOIC5+C8PE0ndT8uQpKbhnNq2ztUIHukK6q9yISxyXozNsg4Npqqy7x/CkRNtpB/XjbhH9P2qh+yRrxfdLD/Gz1PRnI7PTIyOg9Z03qSet+j3h3dXjhuvIy+cHoUgwdv9zR+3CoVCuDlOQM5Qi/DauT+p2BH0NWUy2m5oT3vHXKbu2KljLF/ksoQhNhHi53Q7WC98nberVtlla+m9SHdPKMigDJNDvnDOw+SsAqYMKgUH8pbyvAHMA0FzuhnSVkdfNjk51PV1685Bz0NuJikURzlvlsp25YYpwIu+Y41fqZhWqiz6J5LFkbxgYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 18:31:39 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 18:31:39 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v4 13/16] module.bbclass: Prepare out-of-tree rust module compilation
Date: Tue, 20 Jan 2026 10:29:44 -0800
Message-ID: <20260120182947.857242-14-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
References: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a9a9601-64f7-4b4c-4ea4-08de5852261f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?s0Ho0wX0TL0JuzIK3xxyIgo1ZyrfOAhnRuI7Vr2yQ93gLOgChn7IkAsAp/p6?=
 =?us-ascii?Q?VVB2/borscTb22aTeIbHTKOZ8wSyCt2ck983z5s72aOXuR6EFlxWw8AfTpeL?=
 =?us-ascii?Q?57Nh3uxBnqP8hCaBqzzgBP75TfrfWVHbxnFLv4IuS+MBRaHNHKLc112XpvsM?=
 =?us-ascii?Q?TcMaajWtRP7Ohui+ZM+KMT7YfCrPXgMTpIG2GxIkw/9ZETImlzcoCuMC6DmS?=
 =?us-ascii?Q?08bsCvceG9+OxypmkU3GgWmp21qeVpkHLGL0SmzQsjLseFE7oqv0ex104UNh?=
 =?us-ascii?Q?k4mHKdn8dYYIYLxeqARi09CLNUKHAdHAclTO4Y8tlLbShPCbB8tNTbICfvfG?=
 =?us-ascii?Q?mwC+o+Dc4tNjZrm5MZPNDfogknlcCZ4A3PkZ9oTHy4LuePXk8OyEsZiw50G0?=
 =?us-ascii?Q?2BAW2LaRXKhVQ5tiUWryRuPf/lPAOxgv0iHTW2tfv5Q3A6U3lq2yvvshupmy?=
 =?us-ascii?Q?YvxB6DoHT536/5GL176PT7Wsm34WAPiMdt3fpMXHCt9znx6txAWB8bNVaQTo?=
 =?us-ascii?Q?cKqhnxLR7dJw717ttWkO0F7N/7SACRy7nagV4piO2MziVTj2tC02ru9GidJA?=
 =?us-ascii?Q?+Q9wW+OG595z1M5tYDTZEegC9CjbMfYXiwEVIiaAiwXZBilUKNAtqhG0Oy+P?=
 =?us-ascii?Q?nj108dBlQHLozsKrgGCh8ruI7XwAg0vIvrJc3Xe4f3WSIEmBzfqQI6b3O2lJ?=
 =?us-ascii?Q?I3aLBCZTFlubOHWD6htGetv7jjX/5TaalsixLU4ksaM/+vkxaEd8+2R85YZQ?=
 =?us-ascii?Q?Cq3bfjIC2orFAeyU6bm+2yUjOLWGXMAWq+Z0ih/Ig+8a8wmUIpPcMKQK/yow?=
 =?us-ascii?Q?SrEh4/nXMbeppWbmLgpc/xRqYlMb9xoVa8GUnY9hb3+CSFFkSnptSTM18Umn?=
 =?us-ascii?Q?PJjlObNzIK5Y5URPyp41QcXJEk6oA/4OEozPN4u4LhcRpuNrwr75dvbF8gaI?=
 =?us-ascii?Q?4KiN8QN3nZsNfDbLO9LLSLhQT+V59fUiHwH0bU2Mw/mse4gWeW1UdaWob0O0?=
 =?us-ascii?Q?myGKCDg9yNOSsAiYt86DpnmVQZjtzhFna7dlVPr8tCXNTtHzf/khl8d3VIfi?=
 =?us-ascii?Q?GYg8IcOS9Le/YcIefFdEr0dswr2qocg4JtAGiMgYOKh+VXejCuNJoM9WZtiH?=
 =?us-ascii?Q?/Q49N4KD4uW6yh3Mq+w2miHo4a7ZX+SzjMsb2RFQPfBrTVpphxksOWrZQhv/?=
 =?us-ascii?Q?x48JZ7FazxafzxmGfpqXN6/HT8yn2lJfHq47re7uy7X6xnozOEq2uSw3QbYs?=
 =?us-ascii?Q?NG5M8UtMTR4b8ofhzUyEpApD96yOZ9hf89tdpOnXpAGCASLZ20dEH880WzWk?=
 =?us-ascii?Q?mccaSrpzfGN2lbAZ69yd6M6dNh77gNWe6f4QP6oQfRgJoq0vQBqUCoxGGZeC?=
 =?us-ascii?Q?fBK9vBmwyy/UmlrVdhI117MN3sNB+iuzQ0xzyOogwkXjksrwsAd2D7dB5Lpu?=
 =?us-ascii?Q?dMdTErk332Pu0HAGgOdi6wJAlZSPX7zst0Hf58iKXvkJABrKtyj2jd8CyOJ/?=
 =?us-ascii?Q?s/TBDIyJB9SRaPJY1uMNZX7y6N2gLEml5RgsEpcCQDMngRFJJU+EbWLUSg69?=
 =?us-ascii?Q?MDKFiVr575DWN1kBqNl67gkPTIrUfEahaavkUHn2BdIWbFmBT8+7T+LSWX7V?=
 =?us-ascii?Q?ifQJPTwu/p/gMt0jGMo+mYo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3gOeLJK3nh25I8ES75Pc2begFWJChGfiMGTGnBO+m2NEDzvdecTZ68hQJD8E?=
 =?us-ascii?Q?QuCcr9X2BkvrrLMz9z33K2x5z2mv62DCyYyqtny5rJbso66LDMTN7cubSucr?=
 =?us-ascii?Q?I136KHTEwIUzKvv9BftHSS2beXPPAFI3HC3lxKXzXUAmN8LLh+jQSTMcYPdD?=
 =?us-ascii?Q?8IN94nWxFxds/mGmCQX7Qc5gsTPTF4zvFgwUOA34srZSLBtKAqVcV1bdUs9a?=
 =?us-ascii?Q?2fFh158QYlw2jcFLmklFqVp9+uD8gtbC6WoCy7P9Oi/c/k03QU1Cyjfwr86w?=
 =?us-ascii?Q?0R/icKnKXoD/yTeRFNNVlWiQmnSeWYlpIRmz08bz5JVsYfTZ+kJDmWBJ0tZ/?=
 =?us-ascii?Q?PftAciEa5A8Gkk7kYrPwCrlF7N0qh+9ILU8n3grDiM8cv3D9vFAVp/LksiqN?=
 =?us-ascii?Q?7oBiisLJt+FQIXiLAItfJuZBWlYXQOouJddofZE8X2o7HeSFq5HjY+VGjs5E?=
 =?us-ascii?Q?ZwFo6+pMrv9jUCZQ+g0oHT5cVSgTZBIll21cG7rD7C8+I1HkAKTHBcpPrAve?=
 =?us-ascii?Q?IIsZKL6wdxybQIAqBX7XDFtOmztizg4ynhqYUJSP5bxHNpVS7hyZqmHnEaLv?=
 =?us-ascii?Q?pNU3Ma5WCBz/XAusgLC6V5DkcpiywVAvW3T8gdlmB765Kw1et6iL/ikscP/C?=
 =?us-ascii?Q?Q3FipZQ7HjFXvUzXpeaLBINKbTBgHBpUZjoQT9HiWrzcIw3bu5h6N5GhJqTa?=
 =?us-ascii?Q?9RY2CrTZUNurHyLCOfw0kRVOxFLeoMMGot2rO28qUF3V9+Yk17ecdaQ0fHRx?=
 =?us-ascii?Q?57eMaLf8DmcM6CARA2TjBXvAyPr20fEYsalaWxa2hn52PSzQ6ZrQwh2sseNQ?=
 =?us-ascii?Q?ra9gKItiScdQUA96C1cjFXFlssk8UN1nxUcmTDjUhd3AWe/7y0htOEdRWuZx?=
 =?us-ascii?Q?0xkZhT6m0O70092Y5w2a/eHAzomOEgRLFtnYOCdL6GDPwYWzc8bvmdZsWGQU?=
 =?us-ascii?Q?4kK8e9Dz+4oDLjC5RhKb8+4WfeUJjYOt8b306F4Knw/WwS95qgbsSdbQSzJi?=
 =?us-ascii?Q?/5R/JJOdbyAPabMiMe0vyBGk1oWZogPiX/NmyQ8w0dLCuBV28jOLnDOZsFuZ?=
 =?us-ascii?Q?3JOuuoAy8tZUgMA5821Rert958T2NarEK7Gak1mc6+3SQBz9H1+xSJpqy7U4?=
 =?us-ascii?Q?gMqIxbKuWSBpNz1SUY4aSoDg5mXHd484r/WTpLFgxICrkTh3Cph8PdShGpGl?=
 =?us-ascii?Q?2Wi6koT6H1UTSZtVh0/y/PW07l2ToULSU6wXLt3ETGv3e8AjnFuliIT0xg15?=
 =?us-ascii?Q?obv3GtsWcb3YdArHYUpuMkESX8rj0FGzM9YqM1tA0S/mwGM0YSCZJzHU4+AC?=
 =?us-ascii?Q?VWac1zSZ1MYvMKFzmi5MOh69a/usZChnIseVTzEfZC3wOdpTCUVukjeL0VX6?=
 =?us-ascii?Q?3Oerskoe/DAgHFK8sOQLCQxiyLB7gCSsCpVofe7A0+NFfnFxx1FcVOrd5rT5?=
 =?us-ascii?Q?ux2LATrlW9VUUujq24F5yjQdGqRP52SPq8xSdLsDkSgjtILpqqBTus0wGnrf?=
 =?us-ascii?Q?YwcFRb7mhMgen5eNKi/zhlrIcf6GtAXjDbwqHQyTXSb+szIUzUvbeqwGD9kP?=
 =?us-ascii?Q?lAq0EH1HYfRc+sXuUXymjrlvou3lEzmZJFxalq1TNwwnE7/1Kv3mdfcDQAHD?=
 =?us-ascii?Q?5qRrOUAr7nAAGcJX+MrmvhrH/4egGiIxEecmZcKDcCjL1zAUt8FItrUvIF8l?=
 =?us-ascii?Q?wlQFBY0fOLelXiaSf8L2rT3c+v8JvyV5L5Akk/lgsAXc2w4whLgymdGdKwBS?=
 =?us-ascii?Q?jKtDzkJcZ0IbIbIPtXwj/IhbfIId4S0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9a9601-64f7-4b4c-4ea4-08de5852261f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:31:38.4825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +EIS65A/L6nerDNgXGejQ5Jw7/bxf8r1zolSpMPxdpZQropQOQxQ6nlDF2SHTUXufzwUxqUmIZP7d9VMtV/e4/uAJANNQ0a1yhu52hjSNVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696fca0f cx=c_pps
 a=gTn3qzDU66SAkKtIq75K5w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=7FkU8PZzVy809Xrk7IwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: mPFVCejjQZqQzyUq7yP8TOPjI0AzHbSZ
X-Proofpoint-ORIG-GUID: mfKIrNgFWm-NvhQvaK6ZgasNd0f54wdD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE1NCBTYWx0ZWRfX3J08WwqQhAi7
 RhVGzNiXY/rTz7JCHWcS/dE+Hgm3stkx3ap4zCq2xHklJE/TGTunFhecgvuj18sjlUHCoSghU4f
 xLZQxsWhUgZIfSH69RfEQ64VwLX4D6eSLi1Et56uWPHoOa93ZQUGJajWIUmFDZaGKayjoIJ+x3i
 MJGxNyyYNclkO7CHlhj3qkO9YTvDhrRJKDpSGgLooeohzOfQ2YmN90qp13pZ4DsnXE3N+KEuuR3
 zvCndUPuBbjwLUSqQOZ9foN7k0IHGESIfCvJWeAi7p8QZtAPTUgGneoQsOypBjZBJnO2OM92iKj
 JX+7ZOcoc1MOI1JLyKSL2pTiBgzUzv3XrzoWCF9ko/b+Z5sdottLoIoBRUsKSenlOJpVhT2yu6d
 2Tzh/6M4xXx/noSYK8bPYrsz3f7/8S90ayYsRa8d0Kv463jDbJ8pXSjH/G4VzA9Ij0pliBAAtnu
 XR11IKO90M7nIGu42UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229780

From: Yoann Congal <yoann.congal@smile.fr>

Conditioned to the "rust-linux" DISTRO_FEATURES:
* Add dependency to rust-native
* Remap ${S} in compiled output to avoid buildpath errors

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/module.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
index 4948e995c5..7dbd4194d1 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -87,3 +87,11 @@ EXPORT_FUNCTIONS do_compile do_install
 KERNEL_MODULES_META_PACKAGE = "${PN}"
 FILES:${PN} = ""
 ALLOW_EMPTY:${PN} = "1"
+
+# Rust module support
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'rust-native', '', d)}"
+
+RUST_DEBUG_REMAP ?= "--remap-path-prefix=${S}=${TARGET_DBGSRC_DIR}"
+KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', \
+                                             ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
-- 
2.49.0


