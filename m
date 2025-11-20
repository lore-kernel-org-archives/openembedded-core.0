Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF12ECF9C49
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:27:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36754.1763652428322708190
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 07:27:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NWG0SfNX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=341909d004=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKAS9UY4105198
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 07:27:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=r81X6PFkWrKw9X/rs/JUBHWbOrAwVgpL7aQMh8id9po=; b=
	NWG0SfNXD8BUtpowJJt3p3JR1su3b3fzqMsBn97xy0Q0tiLrTRuFfpylXKvi0igG
	MNmjhd9oCJwzKBLIYKjadKRz91QmrbRGi+sKr+nVhkDUREwu/WX081RwAVmUOhx4
	MB1Jj3kN2LKZlT7bJuyoZP1n20dlii8/jnl2BH8k35QI0nM99uFbz5FvkJmmzwH7
	kNGkNNcQlsnuabQt+QNJGFz41zxjV0WKLdtfutPx1PZcK+N6Q9hGs/G75TEb697Z
	i0OxaKiaB0wBmBOr3fm6tAMI4kttltA0inEM2NsA9u4JFo1RJFAzUw8Q/v8KR7sO
	a3Ulk+fzIGpoVblAJY4qlg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010060.outbound.protection.outlook.com [52.101.85.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswjecsw-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:27:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hproMdJoaa3tdUq5Beyy7YZgmkDbZPXGBZSaGLwrz04s6SJ+iDZonBDEwn5fbpeek9PB21iL0A9L/n31n3f7TQri4i+FD/XIHLt7S81RfqeeimhfeVO7x7cZpgQLfUJZeztaIi6uhtvSZmRAkvjqeO/37SwOG1KTTWUKVrXm6FozW4AD+E0S9+FnyV/4b9g4P1Ch9EyQST3t4n1F3eGddeV8qmsF/PsrwKxwVmdekFouuQUDQXEoyjoallGJjlwUOK2GgpMoaYu1kXxC7PxjSzYQseYazlWFLihXG/f6RhoV9XdQ0N/YXg98AZj0LDQ0JJm7C3gT+8/TLgpJNYTkgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r81X6PFkWrKw9X/rs/JUBHWbOrAwVgpL7aQMh8id9po=;
 b=lPKBU2bURwWrjDXr6rxR8p37ZQ9R5sKrJ5/e+emEmswwPtqXxl90wGEYVej+uY2qqS3b2p8gY3cEyjXVa47grSA9RX5DxjnnwYoCk3psMV60hLXeVVmdHEfT34ea9yzC9kHTGNZsoeq9XiJhcTzsSwLAT+ov+rHLokISRt7+EtuBNgYuFoJJzJa336fFmisEJ8Mbfpwij5Hp1NQ3t/gWke924pnbieA+/HxWrjDLkLrKIECn/VdX8CKDonXWtmlOc1NLIltnMjEbudeCVZPNUP3UVBSWh+MpjG8rS9NAIV5Rr2kfx3zyXFDiMgN/EgP9V50XzCmXFE+6lCAC6n/Ehw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 15:27:05 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 15:27:05 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v4 05/11] kernel-yocto: stage rustlib sources for linux-yocto 'make rustavailable' support
Date: Thu, 20 Nov 2025 07:26:43 -0800
Message-ID: <20251120152649.1128685-6-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
References: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: c30365c9-c0ab-4235-5860-08de284942eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LT/jp6dH7OlcsWxVu1ldgBpe1akMswGmJb+fLNTI7VBZv18q9ivml5yes27M?=
 =?us-ascii?Q?hhJnWeGQCt/MAHJ5D1fY6TfnXzMetdc7n/pKrl4MgU9qzMNIAK8Ny486NRQ2?=
 =?us-ascii?Q?Zn5MLhipe7yqPAVgP0OsLevqm+//qn+CcgQkbg1zseGI4jayWjrA/eYnikW+?=
 =?us-ascii?Q?PQoWYtffgmnvR/Pq2N2wp4xTPDiJT4Liex6pSPfEn73coG+/q/wi9tlkGMv1?=
 =?us-ascii?Q?dXdiTLcTh6WfmzasI52pCjhv2Xu4VTaugbXI9rs6uaMM37eUXxkOangzLWWe?=
 =?us-ascii?Q?TcTgpfgSpWoRBsvr0DqSRBIoSMo0qUk0IfnTyxB7dsTfvXyQEEaiVYhYodrT?=
 =?us-ascii?Q?co8P1IUqu8rNEAz2mDa+Vm5wwbDFdZaVEkHSv6w5SajL9ygcpcACc1mnkuvf?=
 =?us-ascii?Q?/rzLENestihG/3XQkr2Lbg7Kgn0HeEgaf7itYYsY+eZMeIRBBt6dV4b3e5Ny?=
 =?us-ascii?Q?4F8l6XppTrL/QdDLpgkjFeiQ80scqX15N7wA3Y7sRAgAabdSbPcRgoEBsOo9?=
 =?us-ascii?Q?dLyrqkpPTIV2VFyAm9AbKCGrbgQfU3LrCX4HarCNs6D6iP/DfEvU33EHWVzw?=
 =?us-ascii?Q?hnRu1LxeP7osp+Dat0U4WgE631fpX7FAZJ+mmr3uKOYyTc4B1c3lDcd7EZT8?=
 =?us-ascii?Q?7w3VZwiGOJROJ4YRMKhfw+ldA61H1puYkXumUwClcXwCF9qZTXyMt+oS0Fdm?=
 =?us-ascii?Q?3m7RBlhWpqh36IUZwCmY+yR9QMFe9YRxgIM207JJYcBCEGm2qy9VW+NiBmS6?=
 =?us-ascii?Q?X6YE03bml8LR9fmRk3MDUOL61xdyZHX10CKf+mm2ZAUN9NraApnGef88Wda1?=
 =?us-ascii?Q?scsF4zNT4pntWdXlZi1iXALztDww5rHjOrz9SbVjl+u5bQ595HCbFi3U3qX3?=
 =?us-ascii?Q?DZIl33w6bYZdjvndvY9+3AX3fu6EwHDuOawE8fyNE7kHYzibufikU4Skkdk3?=
 =?us-ascii?Q?M5J3UYznejXuXTpFgimFEsbiv7WY5trvVsWjYw3kewy/JehfmpXQyOQBFwPq?=
 =?us-ascii?Q?KpSvKPSxkVyxw9/7UNLdLLZNvUvDPTqpdjrjwNvGRmHbvYVZ6D3ai2MXyKp7?=
 =?us-ascii?Q?GTy0CglP12Irw5WQcHGgs9/wIHWHQ+u0nJIV1gq71F+gDQeoRQhmirpLsZpV?=
 =?us-ascii?Q?WBKZ63sxvyeDXPMBQAGNdWUv0g1hf9QigjW/rQYT+YWV3+myhXW5IxjgchyK?=
 =?us-ascii?Q?eNkAjP85Xo0A6LMO0StfraiU0QzNBaAs0gr8buioRnz7UnKkeXXsSDBPT3ZO?=
 =?us-ascii?Q?PckQU+VXPFtI74bFsBM5yQw8l4AdWhzqz4YVKuWcLs0gwm4mOdxeiHjYiFj8?=
 =?us-ascii?Q?iWqQD+wOP7GsN+a+eCkrnhqPomoNJPa/aRC4tuUmOdUBuz8sgUdn77zf4T0u?=
 =?us-ascii?Q?s3nqWVhCkdUKmoHNkrWW+e/FkzZI8OKv09pHwXLHn335KyeMMO5aNCXjgRgl?=
 =?us-ascii?Q?DTzPYFptzo0KJ+xWoFAyISwZeNTeJwqNO8OZz4VA+PSifT6+epgvHIBIsQbI?=
 =?us-ascii?Q?xw7XQmzXT2Vqhtp3pk90+cnw0ihtEwT3DIzx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qqeMLO4QqUk4y8yiZc7S5asgf+a45MQCk3Z+ZHXOnGzy5SczdXKir1fUGkjR?=
 =?us-ascii?Q?BPHGXg2wYge5sfDhZcDFB8WefdXSjY07SS6tEJ9AUR7hmUWsMCuJHi5fvJ0G?=
 =?us-ascii?Q?/LZVCsX2myUKdh1+yfRc8HNbq5ivBxel/F02z72S+u2vnwtba4APwy6s2L0V?=
 =?us-ascii?Q?0lpeibhauwJJji0bfv2pSp0xFfeLOsUGC5ht4MUwF1RWxdIoJ9y2XdznyNfm?=
 =?us-ascii?Q?smZV2X5usN3XE8s//yYEnqboFYgyzCNDcR4znJ+GrQQEBal9NZWsWVgfXJD0?=
 =?us-ascii?Q?7f/5qB16yI0LXMmMl7yboB9/OavhHTsIqshkrKLVmD5y3zwUtBsRdL04M2hk?=
 =?us-ascii?Q?bXHgvy8fyrlkAa/7mWOs+glFc9/amkxbltRp/uM07NZPsSyUj2grNJNiUGRw?=
 =?us-ascii?Q?K4XIcWGJ2ZXleuPM1WK3uZuoDrL99IUdWFuAui5bfKb0niun+Mm9mrRuowlF?=
 =?us-ascii?Q?HNHi4u7za9ywDsm7W1J6qn2Ejv+04xvkht+INqcfzLfh/hWpwaiy3/qqhUbT?=
 =?us-ascii?Q?1gh5a6hHB8keniYbtynW0YGx79BjdattOL/pq5OQ7syOK+yXK7HnckEg3Pin?=
 =?us-ascii?Q?HnF4utWdqbMA08M5oLw/4jiUwtA/En+ujl9hB1W79a2wrSfeB9bIBvPH60SG?=
 =?us-ascii?Q?1Py/Hhdj3b+dXmLFSagBZOhniIk6KyRrfAnOi945TpvBE+Ih5ghAysGEYoWI?=
 =?us-ascii?Q?4yEC8Nx7hYWVkDzs1X8HpryNVO062laHGPnwm1gDl87T121oadojmSKXihnU?=
 =?us-ascii?Q?i7rmRwKjmP26mCuU0toGlbqFejRGP5jqCUZ1Ex/6e3GxIC/1TtbciTY+84SY?=
 =?us-ascii?Q?b5CMtnoZ/z7JfiqVt1slUnfd+EHRfU80kfUAfK+vtugL1ENs70jiX0IYRzsH?=
 =?us-ascii?Q?c9ywoyjMEDrEqVATp9xeQP6MneAxURGObV2zYEiq3ixqmIztDdLg5UmyFW2a?=
 =?us-ascii?Q?J3CD9WJXIh+8VFv5l0eG/CERxtUftuzt7nxL3EJ0L1FjGNDgz8w6ZtF1SdYA?=
 =?us-ascii?Q?T6YV2t5YWWbZRYKoFMtTQSwUiOwReDNzLg0nh2KlIRLvrcSxMzrrwtswNr82?=
 =?us-ascii?Q?L0lZBtl5qLO7gbAwzwfDe5QbS6+Uea36XP29GuFidFCjKT+D+d/1ivCtQlru?=
 =?us-ascii?Q?OQscXebPBDjw6MwLDxlB46EArZay+BnFn50ypcy+CY6ff9wmKbrs7RCpTGnY?=
 =?us-ascii?Q?j9ZOKH+8dZv75v9WqZPBlpMNumrE6EHZNZpIuGMmpD+c7yyGuwvKHuwp9Jk/?=
 =?us-ascii?Q?MC5QBhulEgTK9eCHX7jbP1YfCOKzO9yKkHrGOJGd3CqkSFaYP32YGSwo3G3u?=
 =?us-ascii?Q?cGjajBYgmw7fMOwDTzQpG0yLvP7ctRWKcEV/zdgZKL5CMNShi6MDmO7+Vmvw?=
 =?us-ascii?Q?c6k0pMskttl/09LrbwW0p+7oey0SS+MtqWu9TYRWvMuiEHcXc6ZOjCxD86S9?=
 =?us-ascii?Q?blplrgQz63DXF3jttJtlCz+lWNQe33ak1JfOuFIiMysbu85h85a7b3YaB0oS?=
 =?us-ascii?Q?ztqxkje9yKmukQvUuzvjQEb4TBbfdJhXkdhYywbb9Run0DCI+4+i5Lk9ZErR?=
 =?us-ascii?Q?XPzZQ6qWXRSM87IuvwQnk1vZoaP4ENIH+QkeZt9JUHgY3y8UkPxrGA2/G220?=
 =?us-ascii?Q?mrzxq5bg/u1ykAsZ3f1pMSI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c30365c9-c0ab-4235-5860-08de284942eb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:27:05.5116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfpBGZUBVTgsdXUpO+W8t3rWFYLJI9sLNB4mZ5jg+hBvIwBUcQAgHOBnQbKIJ1BnYs5fi1LHRPbPYvtZDc5NDuK1IvKXR5tshFgR023KggM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691f334b cx=c_pps
 a=tP1g6Cq6k527JP85+VkTLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=mmvvy781doOwp5hnkB0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: BeXznG02DoKTOZc9SaRlv_2oaFzIEjbV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMSBTYWx0ZWRfX5ji5NRk4ASvy
 S3DwSidCoxF6grzmdBgWqb6NpKnG9Paf3PevR04BmJ17UupwFrsLXoiB7p116/IevR7iDVSwD8m
 bRFluTAJn2nsoYojqzejjGiQdB8yGJgnf9wAVw/rkTzpiG2ram2iK/bQNDI0jToE2svGeyltuhy
 x/kowG8Rz6ehlu81KUTIVxVQtF5J212mYosCSCuMBbbcVm1zq412/BqrnQD8jzy7mo+p6ZFw83q
 Zp25HH2kIN5gUsMTztQTrtZ8VllWXKUl1c3qBigRXa/yBpbutTBGvJxjR7mwLHhADPDAaapdRoV
 MF9Ju3YuehMP8LHs/zZB8JOUcUFpKV82ydOdASQfeNwrguvfN6SVlHRzh8weZWfSwKNIAMZKZRu
 TxJpaCZW1GyzyuxUdYn+VfDb+qICcw==
X-Proofpoint-ORIG-GUID: qvDxT-P58tTDIy9__5D6-cuDTB5kK3Xt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 15:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226628

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


