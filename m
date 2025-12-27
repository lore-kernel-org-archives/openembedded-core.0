Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCD9E8FDDD
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:33:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6437.1766835222810607290
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:33:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nzXlRPEZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44567337af=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRBHowH657952
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 03:33:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=r81X6PFkWrKw9X/rs/JUBHWbOrAwVgpL7aQMh8id9po=; b=
	nzXlRPEZdPJfpEyT/bhN2IgyDmUN4seUESfd+/ed9kmNp44YACM6qXB4J5Xbn/nS
	NpvFmEhXNJhimvECiaFH1G5hkJovESrBU/JA18fd8iUMurlvoz0X8Rn/QIB7u3s0
	qTglMkjO+CUM4QhagUUkUNsNl0HNoz4Pb9J/PJ21+oG01FcnHOfX7UXGqApCm5Eu
	QpfngYlx35uV+mmBHaPn1RZ7wTQPCNTANCqLcw4JxL69D5bYVQFawL9bTfmHpl1o
	Y2mXnKGiQAYDIymX8O9ojm6IuGoOprHRQmyvnUB6Lrr+eUL7eSwlws62AAs37Ka/
	WInKLk0cT/hIushWK6viDg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5v6he2p6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 03:33:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gq1xuS3mSR+ZyZNWSTNFuvQRK1HRrRxnTcvLI74Iep8Z2tswqjDoJEzK0tq742jit/OH1SOlAAHXT3ltBDilaxJqyxPcYyLHAcGzgc6H015VVuUtJp+/QHOc8Rz5PaTIK5KVGG/FO+k5wgC1Wuhkv4RyGEwiWXGlVOAJ/mk+8W5Z0ZQdN/awz1bPQBZIjf7I8Ao12ol2+r3v1RK4L7tVZodenhnePVHxx1qnh4cmDv5Ok4+Gp8M5bhYtHALirXdvZLf2YAN0aJDegyv+uhy3fnfkCN+5pmYpZLFfscFPLsLnQWmszVT+eCjYgL/bXZTIJ36RLaZD+pCx6P586gioXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r81X6PFkWrKw9X/rs/JUBHWbOrAwVgpL7aQMh8id9po=;
 b=oHWgsCbRHqtlYtGYExp0xJzlKw/fQXFNzyj6BNi/QwTgdSnsvfy/L7fFKSVSMc9UihHqx4EFBgq5ZH9VRVvqFmDkPMMPXgsWCm4nIhy3Q+K8WO+ZSEMU8uBcvKsTDU0L3oyi7qcKKD1xOVEjllX1MjrjmNIEEG86mJXF869T6eKDGnVNdh4pegW3MJeljbpoaQst21vhDO7go3SBrRgXNaDEGHYS2T/pwRq0FLTMYAFft6J396/rlwTThnfrBTIfbIzMTGGFLyeXUvuuYMMUNP8qN1jp1dPEviduAeh0tfd5mdJYwz/9wC5h5QNNipgc8ZQNswOg+/3UI7PgNmAtZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 11:33:40 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Sat, 27 Dec 2025
 11:33:40 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 05/16] kernel-yocto: stage rustlib sources for linux-yocto 'make rustavailable' support
Date: Sat, 27 Dec 2025 03:32:40 -0800
Message-ID: <20251227113251.773795-6-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
References: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e0b4596-c6d4-4870-863d-08de453bc8a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v4GQLpICMc8d1rqzNNinJRN+BfUnxrHORYAFh6M6codM4PmeuBT8e4fT7qDd?=
 =?us-ascii?Q?KzMizhyjeYZKNBtURFttqhFGB6cn13p0OVNQycVgceCewWROop9C4QG+B58v?=
 =?us-ascii?Q?agyxONBe+3t8r+K/uMgch2+6o084Os7fPR8PnhQ7+zWlant7tTwOHG8uJuCq?=
 =?us-ascii?Q?5flfc/x+VuMQTnE9UOXvs1nPJZ9v2zKTkG3rbDPlGCrb2WS5VHKVOZvHHhy8?=
 =?us-ascii?Q?CIY8bOMeYbzrjRBv8iDDLnjj7rSx2rejVpcr3w2yQ+MsAQxwpfonz2HG9PSC?=
 =?us-ascii?Q?R2Cqgu4c153TvoTuPoxiWNfDN9J6OH4yTpf7flEtPvTm9fp8qumtxCPYOHXO?=
 =?us-ascii?Q?Fubm3XNYGPT5pzSLAi+IPI7zV+edzzHXZvVLx4gIVWjslvP/wmpUf9dIoOII?=
 =?us-ascii?Q?F6xoAn3atZPuKsLRPbVu2TynxGYTzS8KLvNRp2jcLG29lY9sovEztviZoRRZ?=
 =?us-ascii?Q?ufdmGwGx/ImLJ0MqHi77tbSULxpdVWT/MNg2vxRJwfotDyaVDV5kjXZKfo8A?=
 =?us-ascii?Q?LtoH0HlLvY1ecWQMUCqw7GYnMXBuedF00+Le9DRiuZajZIPSHTX2jRAhHdVM?=
 =?us-ascii?Q?QZEHA+oh5ULI/EbzYPq7wIGirEWsNuWet+kRg3dFAExZojiWr/HW7E+g5Ci2?=
 =?us-ascii?Q?3PDNKdepWGL7BqlWHmwilFeK70vN3fO5r6GpsOaVx6cdw6xBq8ppkehwKvHT?=
 =?us-ascii?Q?riku+11npFjgDjAVW5EeWWXGeQsIXu0NHYK8M8oCqGtcpXnXhSc86euERXWm?=
 =?us-ascii?Q?NNe5SYvtu0JxmRibavHc0xslacEg/eHOt0WMHtUZzC2r+cXFPxvoegva0ERS?=
 =?us-ascii?Q?PHD0OyHR8WhJOwyjg5dBeFzVGYieydX8Z/4w6HMtbk2plTxKcbzGH6MgJhIG?=
 =?us-ascii?Q?ZL4V5tiSDVOpSMojWvEEMdHVzNUh54g+RVSZ4o9MOvLpCpZIT5p/tYUnuLdO?=
 =?us-ascii?Q?1lxFtbLogESDBTYHWgN+bve5ZesWj5dCasPsKDXgzjUUDHx49b8rUJEIhTNm?=
 =?us-ascii?Q?yeOaETM1JlB4VbwfBN1Z+WmjG3/O9zTeHtbws8NPWUmOYdSkwW95UbBpYBE0?=
 =?us-ascii?Q?o/3eKeACPX74itPUTqUUqi/i0LVUp2mNfjW5Gc1ih4v1WcAOcWu+L+CQCZep?=
 =?us-ascii?Q?LimMSBxXfQkoNfE8bmXmyHiZD92Qa0J7xbZsjj9AzGZKmRQdDX7Off4cRjxZ?=
 =?us-ascii?Q?dcW+VJb4SWVGpD9iLg7IwjvyayY41gB5Apj8fa8y0B/qj2uZQt+NX1Qzhkxz?=
 =?us-ascii?Q?wrhwE9Q73SE/b1h5wXWkC2cR01chJlvV9ztEfByG6l+ZOF6CTTsfcZyMdSWy?=
 =?us-ascii?Q?LIEaXGpK63YC8H74y0E6gg8X2hjvQbv/PLC4Eo8hUHjl7xkvBSb5/6HoiK8g?=
 =?us-ascii?Q?WhzYUMAyLSYfYsJMXbnMFNoTwPi7yQW9G1fxUUvKgNaEzkQ3uyBkxADpC7TH?=
 =?us-ascii?Q?+ErMQ3pZXrCMpRhKTgCZ/iKHEtPhZEsgY/jStc4SbAQTTZbfzfPz3uXQelrW?=
 =?us-ascii?Q?IyjhseF/YqC9NTmIpAB7QgPhbQ5iZJMbCVsQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TxYoU8yMnHd8I5+UorztyoNmxNPP/yankGh40p+Es6gfo50Wi7iWH8UBVUAT?=
 =?us-ascii?Q?L73vwZaYMKXC1hGJT7itSexahgJOIjEQ9HYmqP+dVPQvOAg0e8JqFyjsDVdh?=
 =?us-ascii?Q?XbeNTR3xwaaklIwolGTysZC5zc0CE0/aLKuzJzIPYCgw8zmYY9O9S+hVKgo2?=
 =?us-ascii?Q?3Df1pxZ5rnrSUdoG176TnZal/b4bBOeqwc9CiRzaMEl7IlJeeYb/zMFMrWzP?=
 =?us-ascii?Q?Bdd02uZrs+FEwvlNUUlwhUpI4oEuUeccy/pAQhvrRXndO4pUABZFBJvbNZD0?=
 =?us-ascii?Q?m4uke/R4Ot1EdFIWzvD+FfIK8LPkYa+kEQiNk5s9cWYZNNicUdQCzhKb1PnO?=
 =?us-ascii?Q?EX46ciXR9LJPaOKVzd1u7MNeo8Evet+WIr5T+IiAcKlZIvWtQFudhZSYthTU?=
 =?us-ascii?Q?vGhjw+puwTGfrQfVRcjZIpicL/So0rdCRMFNAZSK7wqLKn3c21JkxZEWCEYL?=
 =?us-ascii?Q?OY7zkOKp4q/BYEpbLQUqkVM+ZMk+FOYmsdyp7UUIpYnnJSKJjhJS+G7jjlUf?=
 =?us-ascii?Q?iLigURChd8+TrIKVkcIuiQtxtMPT4Xb4SENsEzGoGB7dpAiEFjDIWt3CIt+R?=
 =?us-ascii?Q?zY86Z8Q1XDBVEo/Zw32JI2PhESyJ+kM0qxGffWwfmBm4+enVV75lt2bA8pSj?=
 =?us-ascii?Q?XEAq/sXRm+4qYLs2QwZHjyfIpPxxcWcxFxeniTPZFBicHDi2LKL8lB2Kyzk+?=
 =?us-ascii?Q?9j/hLglxBIBeO0xv+9maUd0vwHP14Dso4UPep/TgOTrWYLNxRy/wULyWLMZm?=
 =?us-ascii?Q?wlavPOL0zNR3z1tMxJQgFxxbP/U8NqGi+WPzwaPZxam8uvkP4zpnYslG5CCn?=
 =?us-ascii?Q?i2jCMFwxLgQKNLtXa0czf0779vqSv4QPgPuj8ilatADNjMfUo+MlrPzMPWFI?=
 =?us-ascii?Q?6/lvmEmQyv50PzHzkp87x+hNrRKQGL6GlxqNLxY1SK0c9Ba4/xNx2ZcY+H6H?=
 =?us-ascii?Q?Du6xxoI44q7j1gmynxzw2pZYPBqCXRdgaf3AJaKriBrIzEsGzzVvdkA5Q1NK?=
 =?us-ascii?Q?8MkBXGMuGoSQIdWizMUuUcPJcslU2eLHkKOYG6JcUVk+zwfuSxCFmXRtem+Q?=
 =?us-ascii?Q?PjXmEipjqPf5H97q86haTBvzFlSeKbBeYglkl8iTUelPhDg78hbXk3mod+YW?=
 =?us-ascii?Q?EoxR/42WDUkkiSjOPZrS/mKfiBOvGFlD1xzeA0uX01eARP5L9/CBncHERp+/?=
 =?us-ascii?Q?IopqDpU8z+z3zPyw/MT9/ah/eCGgqneG8dHGLtOa6VW7VMffgA9JBkijCt26?=
 =?us-ascii?Q?ZF+wWmU0L/Oia4WYH0yo/p6r2+nsqqOrL6IC1kUMX9y0iqUr11HWIMS0pJlI?=
 =?us-ascii?Q?jWgmu2YdArGTXmuB3u9UJwDiCZ5dvSbdE7wFTWSgGQTlqs8ylRh5EA0QlziM?=
 =?us-ascii?Q?xpVKE+s6jPfi2sTXeYJrcS6Auc3OvAndfx9+dGd40eBOyhU+ifZaHXsHUsiQ?=
 =?us-ascii?Q?cq2OONP54ianFG0eu1rfdKvv/OcyvBOZZaYath383GluoffwYx9lMoVwMGxA?=
 =?us-ascii?Q?X8m8WvMtwyzG15zGJOrTJDaRsflp6q2xjuMGEUx1MgMzWWucsrGUOULYEAT0?=
 =?us-ascii?Q?xBcBXwzmFNcCgmtF664Zsveqo6/npEOlWQqcxAfPlMyyGx+UWBkbSmZLCnDB?=
 =?us-ascii?Q?LfkF74Xe4XWRkAwRighz67LmLf9BHsMGU3kWvBjQCCJ8qA7ktyBo34iM08Zy?=
 =?us-ascii?Q?yI3M54d3Avsk5tvNo0VjzZE5cNBVPiuMTlMybiIfv/ITzqGYWLqfBYRMAi8L?=
 =?us-ascii?Q?whpP2/OIMjfXIwP5VjEBpFgLBuuNpAk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0b4596-c6d4-4870-863d-08de453bc8a6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 11:33:40.6239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XG7PmC7t4LGGfehr7T2raD5HlcYsjtGpBcgaw0d8064aBdTNF81vhrDh8aOuZ/moMakyU8IDuf840XxS6/MJasHBSQwwOhJB+Dt7XNvC6to=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwNyBTYWx0ZWRfX6PluhH61rbfk
 SrIvE4X3+Mk/On1BlEy6FdYjvU84TowPXP2zfU7fH+CGbXaB9+v3Qqgdl0hyAFsP8aRV0M+2hbC
 2YFlQEInqAX44HoE+Q7mSR/rgOcPEJ9d7reiv/GA6jvXvI9KqAyh+zrI8l9zk+/SuFebQzkfave
 W3VQtQNd1a+JulTydEJBewUJu6Lfj4R1korD359ORwPBpmDuOhyn83cR8w7NumEfQM28pXnPcQK
 b5Q+jVzVPlh2goIZEOC338hkXHrjt0GLPwv6UsTputqqdPl2e9N5D8Ztc2gk/1zPJJojrZBo/ke
 0dxtdq/8mHVaBMpYSroFto/RaF2nxO+ktY6n+s8w4yzegcWa8nzTkBzBkLVXAC9r96/aha2L8dC
 p0ANmaqfZJhlUlfd8YIEDIPh8BDxcxWyzG++RF5Ib4ckX+jvIhnEb4a1BBmTzV1CpYlO7gKIE+y
 YlkZAo5H/KuNihstGRg==
X-Proofpoint-GUID: 0Hr49wCQx3U2w1nNCtZFBfDvV72cgcFm
X-Proofpoint-ORIG-GUID: iszZgleBvAFbchyrSHHlzVNVvk1w6N6-
X-Authority-Analysis: v=2.4 cv=KYffcAYD c=1 sm=1 tr=0 ts=694fc416 cx=c_pps
 a=FnNH6Hr+id3EzXqhVuY+iw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=mmvvy781doOwp5hnkB0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228559

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When building the Linux kernel with Rust support enabled (e.g., via `make rustavailable`),
the build system expects the Rust standard library sources to be available under:
${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e53bf15194..2584cadf0d 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -465,6 +465,13 @@ do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_po
 do_kernel_configme[depends] += "kern-tools-native:do_populate_sysroot"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+		if [ ! -d ${STAGING_LIBDIR_NATIVE}/rustlib/src/rust ]; then
+			mkdir -p ${STAGING_LIBDIR_NATIVE}/rustlib/src/
+			cp -r ${TMPDIR}/work-shared/rust ${STAGING_LIBDIR_NATIVE}/rustlib/src/.
+		fi
+	fi
+
 	do_kernel_metadata config
 
 	# translate the kconfig_mode into something that merge_config.sh
-- 
2.49.0


