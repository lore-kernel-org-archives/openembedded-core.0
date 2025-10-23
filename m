Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3574BCCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 11:27:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17819.1761218819085624864
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 04:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=G3EGskxt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23915c5530=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59N6GESL1415691
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=/IgdHgZ8T
	NiyR4qrAGnCCk43xUHZJgwxaZXocCnKmiw=; b=G3EGskxtcqGtJdh5n4Uib1Gbp
	FPYLeT/FeldmwljTDeSO8H7unvq8m7kfc/99CZKWS6+fJ030j+ls/l5W/uDNbEyN
	5zrF0NIfp5yFAtXm408kXXX0fy1vajT0VAs5z9ENt9IrN3BCAeEaHdwMKZs+hvph
	BACVMJiNb3W60E742t+MqBzzhxgGFR3Zg3fP62Kcmaq6t+3b2O5p8aIcXNZ44Ddg
	sEJBjS7sGYlGyFERYWhLisXcxKRJts/Z7IdyFGraE0NbtSHevoUP1CLrxuPGftDO
	Gib7eRXbkr7v7qwC+NZ1l6wVA8KoCVG/xCU46zCKBX8FVjlu0smkiw/ZarVsA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012019.outbound.protection.outlook.com [52.101.48.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49wrpxbv0g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:26:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBzoWW98eHtD6yfpZhGhZeIhdxhN0anyal8XIEyDyQ3Fi3lP7VBmJEuH8MAg8Vm2vifkX2IGeirDfVwnDoGe2MarfO1KBPrLvM6xQ1kSYvVFA9brZ/6rOPInAcoq+nlUqiya7nywAmwwXoL2HBJ+c9Q39dD9xYu/UiNzZ56AKMTj++m6tlFycsOmUKJiX1GtSPmJ0yDiAsKfXcWQTRjTTXwljUKwZCLEnrmRrWdBweA0DWPW+IT3q+Nbdgg0Jk5voa/wkensbwk7qv8XbWq35zMFxwjh3RLh9ztG6JMMCmVyi1S1QMvABk4o+LMZ8z6iWEAQbqF9pg+M8EUkPJTcpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IgdHgZ8TNiyR4qrAGnCCk43xUHZJgwxaZXocCnKmiw=;
 b=qkb8JaQ17QsK4oB7USUk56bwxb82fxiKfiNU6U8CFxWtCM6QJzR9P4auEZHwR+ZWENYdcKPw7WbbnIlrTirvM3bfcHVvtRpBSYDdYE84JxY7/llXCetksHl6EY+br3Mo95QQJMWfhXgzYrzsg5DapsTJrdjMs9nSMV0zt/uZbyH4J5L5LaVUr0IT9hj8Hh41CTwSkVNVDuKoN97Zkma+saRagjIoSsE274+uEi9JoUUjxo+It4EMMhbLgdOf8fHFT3IvNtqnvM1JBJ+U/98oL89m5EKvWmILAUWees1STGxIOym4fJr8b/636aLkFLyCH5+PRJ234R78P+q3FlfeIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ5PPF8B3F23403.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::842) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 11:26:55 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 11:26:55 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [RFC PATCH 0/7] Enable rust support for linux kernel
Date: Thu, 23 Oct 2025 04:25:40 -0700
Message-ID: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:a03:333::6) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ5PPF8B3F23403:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe75465-91cb-4525-fc59-08de12271230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4Ewv+DGNA51CpDf1JwaJyCnmX+5NI9ahXwjbWCJu0Me/I3MTMUbHbBi8M8ep?=
 =?us-ascii?Q?0zqVYyt7Lg442E05trQ45nF6ytHoNzy50faOmnEGika+NRuNoXjEKYGE3X8U?=
 =?us-ascii?Q?c95G+oUKYFKEfpjhl+nUxu/jdaaPvl0oB3TIcuZvOUIaN6ynd+DdBbxVOZ2p?=
 =?us-ascii?Q?xcVYsQa1bNSM0sh/tiHynwnES7OD8SWSXHHxVJaZ7FZ9vp8zYY7zR9RuY1u2?=
 =?us-ascii?Q?BKsmBtNQ3dz3OX3ZqMpjp8UJIsJHUKQhQonDS+rqmAqWmZ4iNkLBtb1hCfUL?=
 =?us-ascii?Q?cjpTI+idvREv8xRyMUUJZ+eO8Kw4GqCojXXhousYi3H5SBNaDfa0g6HtbQEm?=
 =?us-ascii?Q?+nGzjtDtNn2V7wlpoPUigO9zLd7haoYJ7Lio9Y1t8BfXPn6ASD9zQm+bmi/a?=
 =?us-ascii?Q?n03WpQuj0B5eaev6ZuY1fbqtrXwp0eG8cbOhgtDcATGaECLESnl26HrTuW9d?=
 =?us-ascii?Q?fzvR/n4sFuNl+N3HpNAAhlagHSz/wam4ZQUY1+Bw0naa5UM91KEFcDAuszWN?=
 =?us-ascii?Q?zsDK5QY+MYxVRCNI0MeMBVwn83tbEgVrSx7TS9lb3rRTCPcVQIO9MM9jfBji?=
 =?us-ascii?Q?cyc6jTDjb6kfPkjhrPg9jyjl9Pl1SEdsUQsby4QLeKI94uITLxjX7SWAR9R1?=
 =?us-ascii?Q?5WjOHnRh/E94E9o0CRafOLfqly0aOuxhqq1/Yj3DQNA0+odKPmhqdVa98uJn?=
 =?us-ascii?Q?DyrdxQI9pBoLhc0d8vnbFa9exMVrjrnxkgNINFFPr5VQj6UIoQS8a1VDQ4kq?=
 =?us-ascii?Q?plx04oT96OR7GajAnVeW+CTJiKnu9EIDhAVpuBNBFVjIqA+L/YY/gw3ynxKM?=
 =?us-ascii?Q?gv1JbrsloymcSNVX/7j8I4voGaIZWHsNw/ee0iyZhKVDLm4MVq/ZGxhfQHA5?=
 =?us-ascii?Q?iok1JA8dXJ/WT4AR0QVAiWcEZGKNKc0rAYoXx+asBuk4mKNUgAKCaQSBGA6Y?=
 =?us-ascii?Q?C3bStke0ZhZsz6L12B89jVw8QTYP1kIBIMGEzYIo4wxb0ktdBupRM5phsbvm?=
 =?us-ascii?Q?/Vox8qFS2ko2ArEB3Es7qOmlDC4Nil2XgKIoFVhtlWMuzjdggNwhcHaBTs2Y?=
 =?us-ascii?Q?/Z4hgJeN0h0PYdnA/H3Rs3x99QT59uZENr2EfgkNpJZGNv6Xq1DSSpk6BzK4?=
 =?us-ascii?Q?NCL0qs6gyxv+IK7NJE+t+x862i7fPwsPbf/MQZCdkqQdZw/eNv8NLz5GKR/n?=
 =?us-ascii?Q?Fo7sx4VEIRL3M2/L7JcpRtkFj7Tt3Jq7SnWMsyf2o2wiLc6Qnx9av9iffgrM?=
 =?us-ascii?Q?cvIG/QuU1UCbwguyEwuYajyQ8tHpBrCp7vHfLfpHQ9cKSBUm4L+Bc4lFjn5n?=
 =?us-ascii?Q?mj4nQROyBLVZMTeVCbuVQOKWBxMfb8bF52FnKD1y6h+LqHCuzuBMdHVzpbHE?=
 =?us-ascii?Q?6bJk1G72akcG0aZ2NuBE6umribPjr2ztunUO/0uhxj4x5joQjarTU9IfdVaU?=
 =?us-ascii?Q?PXIQ3JJezT8gNmYxMVIiNSxbsoNESBSBCVUeLp2NkteJn4lsDBzrVW+vs68E?=
 =?us-ascii?Q?mmc5N1W25I1hw+ixrtmjwHl+KEWsGPYzK6fT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+pUtvrHGMPN1EHA7k0qNpd1SMuJpDaS8PI4t1pQInA8v5lK8YaOL7MqnjgfG?=
 =?us-ascii?Q?MNKjcOwcoMKMTKP5DjHUBBfXdDU4OhylhAlD+9nVYdVZ9SCAikyoNVcRKR2m?=
 =?us-ascii?Q?J+3RqfcvnQYkL7K4fgWrNXrE8pcfLzH15IYrNEXpOzi9IH6WnpscuLruwb2t?=
 =?us-ascii?Q?TAABVA9wxWEdgOQiqmt5xQxIqSxh+Fs3TfioZWw4MNIRX3h28dCEWxySA/uB?=
 =?us-ascii?Q?Im4dB+X+4FgvOIHn63I+jRfxS3YVgCRZ7uxgvanfrU6UEfERT60XQYwCInWf?=
 =?us-ascii?Q?qV12KljngQG/gg2yHbAShpr8b0R0XHqcGFnIYZic0NIGb3OlHdWCYKNNexMm?=
 =?us-ascii?Q?gSbL0ZCsCXMnr5GN09mob3jPQgYYg2KVjUa+X/vwVJktcOENtjXkut0hKJ/x?=
 =?us-ascii?Q?JTrtBa0EUJWuq+i4/FoTvStZscPpBmxDZloX/AhRQ1UyyjsOiFMT0x3qw+pc?=
 =?us-ascii?Q?8aOPKm7RJ5fBQuSFLbDvT2wnlNrO4px4cUVkEYOblQ7xHzRmB2KI+K71Cw6F?=
 =?us-ascii?Q?auiNJvIG/OIKsheMbnofSq59MyKIisZwfWD9zIMd/tXrXEDTMNePrWUSg5sk?=
 =?us-ascii?Q?p41hUbV4hx/3TI6zEdMZuvaKVEp9MYp7RW+VPDYk7X5MgfC3rMK3v3LXVkcb?=
 =?us-ascii?Q?ETsP+pUF1KQePClrQ9aGcL+EtF1BdkIUWWn483ngjZ3kFKS4huipsjEysmug?=
 =?us-ascii?Q?7uQYUUrT9MZ/JSaRQnK8D6Z7Y7kSAMca3J9DSjSGt4d5dIs4N6Amm0qgeyLI?=
 =?us-ascii?Q?puWsUARhn5Bfh36hufKFL8ivd/7+FK0FR9BYfu5Yu/5pSJxBS0a47tmAaj3s?=
 =?us-ascii?Q?640WLvAqNELEsUduhjOdiPvSw8xKT01e1sQvNlaWwqpA3ZvR/zYOZ0GMloWU?=
 =?us-ascii?Q?IkLujhbEbZofN+/1ITbw/hLr4rhnj3Zi28B1uxEOt/Cru/wp11LG+dQBYL+S?=
 =?us-ascii?Q?gcUXo3eDYChiu90+uj6ukjeqOMKjeR5l1QACnesPiSAxKrRlHbVOIIRAxYyz?=
 =?us-ascii?Q?qKdvUfaZ+TCr9slrlbRLzypfsPENIOBlWEHsvgQ0kCgANeIaw5sgvy8vI0vC?=
 =?us-ascii?Q?XdxLgiH6aEDj5TAWI7nMPhHyxvuNL4qPdTxKVU1iUaE/96cjPm7hvI2s0DsV?=
 =?us-ascii?Q?34GpwQPoDnQ/u1oB4ZCNdkiOAWfZUYJBHN3wLHoDUZOMyRQ99aQaq1ZjPAGw?=
 =?us-ascii?Q?affgVussTuyI1TH3WukoefKEmkzapn28dGGbvkSq7Nyo4n7LxAhvG+/Kjx1T?=
 =?us-ascii?Q?Kxg3iXoEQS18HhVJBJP8dy9akT5eeV7LyDKc10Aj96m2hQJP8zQiW6sDtCci?=
 =?us-ascii?Q?HEL6bVR2NFXaOBWvU2Lj10+uzIpqnLF4nWQbjYFl+ocA9apPtf4jxjwt9ont?=
 =?us-ascii?Q?ViA6ld3JyWQ00lXYgdZGPbAye7sYT1qz5sTqsXKjpN0YJNjnSPy07NlfZJd7?=
 =?us-ascii?Q?IKmOBA463V2TWyUOPSaQeeaPmqH1NDGBFgOVdSVDS+TKcvGbMWrPGy/4K4IR?=
 =?us-ascii?Q?n9fdH655PyuGuIJhrUvIzoQAiF6T2UCpqSkBuPP25Mqwi9pkVDwbpT9OTRCZ?=
 =?us-ascii?Q?cXCwz8KF2wNBjoqu/4wbdaPwG500r5boO+v1xrBs00drmCa0KMssoMQKhJJ4?=
 =?us-ascii?Q?EA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe75465-91cb-4525-fc59-08de12271230
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 11:26:55.2232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNkt3c2x37oeG6wB31TQDolFmeodW9Y6OA/gY6BODIiDqvyxCXiLjdzO2bG+6aZS83gPkoF8YVG3stVIXMPWIs/fn2FC7uYZR2zOt5YEuAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8B3F23403
X-Authority-Analysis: v=2.4 cv=b9O/I9Gx c=1 sm=1 tr=0 ts=68fa1102 cx=c_pps
 a=rwqFklNBBe0PgClOpsUSJg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=7yelKZ02YrXfPeHpaugA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: tVIJgvEGrkoE9if5qOvdwd8b3YUxRF5B
X-Proofpoint-ORIG-GUID: tVIJgvEGrkoE9if5qOvdwd8b3YUxRF5B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEwMyBTYWx0ZWRfX9kc6fCaZ3dCJ
 cbcBqCPL+jAm8PYjBl4zi+378qHovt9YhVKwWqqHTQUtrYWtkc0nG7NV8NFPFKD+gIWowoM59Z7
 U48aOx5oaCHjohsUYjpGVgUQdOARJgPGJteMwFT1g71qk5CWOc6ta1AExQ2/H4eKe44wS1hNM4t
 Ae5aBfHp93qGIzFCg+rn1fWoQvxQsW0dz29bvTbDiScqUJU3rKpglixfVKXQpkBcZuKdFh1lJcD
 WL+cKsBInZ//aTugDoXk0NNAUXnjDJCgoe4AHtQ4yhknqK4LP32QDHo+VrR35eqRhZlY8YIW7Ki
 IoH7GNs3V/2h05pDZwiP7fzkx4Y53utzXmEoqXnlA/cg263BWK1J57tT4rPyjesdhyFhMEasXiO
 6HmrpOO9lCejf/8lwPH1Wngvlo98jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510230103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225236

From: Harish Sadineni <Harish.Sadineni@windriver.com>

This patch series introduces Rust support into the linux-yocto kernel recipe
and related build infrastructure in the Yocto Project. The goal is to enable
building the Linux kernel with Rust components and provide support for
building kernel module which is written in rust inside sdk. 

Summary of changes:

- Patch 1: Extend 'bindgen-cli' to support 'nativesdk', allowing it to be available in the SDK environment.
- Patch 2: Add required dependencies ('clang-native', 'bindgen-cli-native') to the kernel to support Rust binding generation.
- Patch 3: Install the Rust standard library source ('library/') into `work-shared` and which will be later copied to 
           linux-yocto recipe-sysroot-native.
- Patch 4: Stage the Rust sources into `recipe-sysroot-native` for kernel build compatibility, making them visible during native builds.
- Patch 5: Update `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
- Patch 6: Add kernel configuration support for Rust (via 'rust.cfg' and 'rust.scc'), enabling the Rust build options in kernel config.
- patch 7: Copy Rust kernel sources into kernel-devsrc build directory which will be required while runnig 'make prepare' in sdk.

WIP - need inputs:
1. In patch-3, rust sources are copied from ${RUSTSRC} to ${TMPDIR}/work-shared, which is redundant and improving it in
 more optimized way by extracting rust directly into ${TMPDIR}/work-shared and then use it for both rust & linux-yocto recipes.
 
2. In patch-6, We've suppressed a few build path QA issues with INSANE_SKIP.
We have tried fixing those using DEBUG_PREFIX_MAP & --remap-path-prefix but unable to resolve it.
Are there any flags for kernel or any other inputs?
 
3. If rust.cfg & rust.scc changes are ok, we will send kernel configuration fragment to yocto-kernel-cache.

With above considerations, We did a successful build of Enabling rust in linux kernel and 
Tested a rust-out-of-tree kernel module in sdk for x86-64 & arm64 architectures.

Harish Sadineni (7):
  bindgen-cli: extend BBCLASSEXTEND to include nativesdk
  linux-yocto: add clang-native and bindgen-cli-native to DEPENDS
  rust: install Rust standard library sources for make rustavailable
    support
  rust: stage rustlib sources for linux-yocto make rustavailable support
  kernel-yocto: add rust support via make rustavailable in
    do_kernel_configme
  linux-yocto: enable Rust support in kernel configuration
  kernel-devsrc: copying rust-kernel soucre  to $kerneldir/build

 meta/classes-recipe/kernel-yocto.bbclass      |  4 ++++
 .../bindgen-cli/bindgen-cli_0.72.1.bb         |  2 +-
 meta/recipes-devtools/rust/rust_1.90.0.bb     | 13 +++++++++++-
 meta/recipes-kernel/linux/files/rust.cfg      | 20 +++++++++++++++++++
 meta/recipes-kernel/linux/files/rust.scc      |  1 +
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  1 +
 meta/recipes-kernel/linux/linux-yocto.inc     |  7 +++++++
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |  4 ++++
 8 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust.scc

-- 
2.49.0


