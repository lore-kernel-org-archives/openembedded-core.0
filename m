Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8AF4CF8875
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:27:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36755.1763652428533597696
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 07:27:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bVSWSrm4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=341909d004=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKBF2kS4183297
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 07:27:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=SzpJLlJs7HVTWmKmcPq65nq4JyUeWCDRN+XpPHfSm3M=; b=
	bVSWSrm415YgnXz35s9K8DuUDFQhegOKIIUmzeLc+kZQjerCl7t2BD/iAs4CxMZD
	48ZH+8E9dg2fg576xc63qAvGC4k17Nggz1PsnedJ2CPNLss+uHIDl67SRDSKXZ9x
	DPf2Ie+kmCa/losjoMsXtmb/E0axKsYWfOZ5gTvBmP1+tGl31KOAJZ5iZzuEdKyb
	s7jTZ5zt1fLjWimR7ATU+mzuYOwDl8Dx+bSjqn45wGdwSYbL8bKaNvisTu234cCK
	fY830UQqLMPqT/LZ4w1C/noZMdo4d+pKxz2v/B9xhthl1WACnhYMxPdl1bunFkFz
	p8RWAG/oyHBUg32mULHYtw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010060.outbound.protection.outlook.com [52.101.85.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswjecsw-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:27:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YlDH9eLbukET5mBJg4qU73UYNwuUAXQyzDHhd/2DHNzUxk5qr+oBFzoSgvkq4TyHSemsRkVyDY4ccZS7cAZnko8zBpZwJX27+SsrKgYFKf54EmXc3ilYYueaIqYgzdWYp18VY3btqgMpsWucpcCbtXnW9aujfVOGNUxYm0Nk0pNzTdbKmP9QBjfV7T0tv8fd9shsmyJ6hHDIAXf+XOsuNd9zQ21Y9+o/0xjgb/XIgY+B3Jxs2MtmJBctOLpRyIFasI9x9O1hJHqo8NU0keOGbihtc56WDpwAc7NclBzsAmBVwy/3YNv5lK3zAoyTPGt8VA1Ky8J8X0b3Hwq3U2wbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzpJLlJs7HVTWmKmcPq65nq4JyUeWCDRN+XpPHfSm3M=;
 b=ONSTslFm+6gFureGiN85PUMw+ozgHQnB2eRZurLkaIg162IVxSd3s1igQ2A4vb8N0xyJLuuIzt3KpOS50dq2J4k4CK9pFue2jmzFjqlH+QoiXjJneB+CDvt5uzPA7EWy8yEKKkWNXW20bIpSwXUsZ8QOHOFQWvVwhnq/iwVsBbttIHpyccQ2MCUQh2lAxvJuRrnw2rQeP3Y+eInhdouBYsQRUj89LJrUG7GgXyOokjZ72r8urb5w1veDjYRshGs5rWCzIubN+EAfpV1OzTsoiVIUQhMs2WcgiKUA8kX8VKz/PBS7bJjrMgE6KXxDzk1RJzpsYBcHDJpoVuN4GC3rZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 15:27:06 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 15:27:06 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v4 06/11] kernel-yocto: add rust support via "make rustavailable" in do_kernel_configme
Date: Thu, 20 Nov 2025 07:26:44 -0800
Message-ID: <20251120152649.1128685-7-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6d2452c3-0db3-4fe6-1164-08de2849432e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qD3SKX6pwa6uApAVvRm57NfpM5n2qPBf8vWlpGL9N3QddK8/JCW5H5YkRuql?=
 =?us-ascii?Q?Dci2EA8g65gx1nxK6cOc37DZbfgkLnjIFcz6UwKvfM2WtVicMb6MI09JSirY?=
 =?us-ascii?Q?BgaqhGwtpoD44AN2xrXYM30PQveGJuVwbV1UHBCvVG+DH4ExY9I52vi6D+hX?=
 =?us-ascii?Q?WwHIU3mIEFJLBDPUU/qbuiPtrIn1YaOAfj5oHmbZ2QhGhX5s9FhuokJvGIB/?=
 =?us-ascii?Q?PrUlMlzIEON+R+d87ulY/Mp/HS39O5y21QTxAx91JhJx6BqcWgxlrZbpQwDM?=
 =?us-ascii?Q?sG1MPwL0+N8ARcQ6/zKIO5O8xLxHqNafm3S30dRDVV6rM2IRtfu35KPgQmMe?=
 =?us-ascii?Q?cc2umJRvaxrNAjfR8kJXpomciG0cRNUS0ylTIM6Azl5kfiPgB6f+GA0kvaYS?=
 =?us-ascii?Q?wGeqVA4ffSycnOJGSBl1dbAgi2ORNegU9M6FfDxSIU9nh+lhZ77oEe0NAVsr?=
 =?us-ascii?Q?SUmMIClONN6IGia7Viw0JDSOkpzLIiJw2kGEZSLxMZNVT5j73H1DTV+9XmGF?=
 =?us-ascii?Q?QA/vR6yUYyubQz7THlYw3VpkhMH7FNw0G6NbFzJB4nhcG/ZhCAV+QBcqKKUb?=
 =?us-ascii?Q?H/EBTvhO+L1LK7Ch+XOL7tlegN38De3PH3grGitI3yovvV+7QdZobUTS81rt?=
 =?us-ascii?Q?Ux8iQpQj6M9dlHrhrMubO5FjsCs94Gxb8Qk7IQCy8PmMmayPT7Gcgx98UzKQ?=
 =?us-ascii?Q?HBGAoFa640bgw7EfZToxw+UKnmyO8j5tZIt/keMZro4Fjn579Vdg/raf425N?=
 =?us-ascii?Q?D6H38qdwtL3TpJqkraVT2Rk1qqYwQD3N6AYwVTdPjhX18QP7g+o+rPAAivef?=
 =?us-ascii?Q?883jiTn/K51z0eA48VcvEi3Q5HH3P+hZEljQxPpGoVFWbosOuVwUZj4Pqr8s?=
 =?us-ascii?Q?a9DqjKLKAWw/171FoCw8LmyiOY09KhymQoWROHs+/tcCaJx1EwcLv3JtREkw?=
 =?us-ascii?Q?wQ16/L4Qz49LZQFh+baGDbkBBwlb0AR7bEfN9wTOwAPcV+jy0ap+FJgOVkxD?=
 =?us-ascii?Q?baoEbTy2wsZusR6qKHU0Nmnlp2RPXPyJFTYGzmO/Gby+mKqTB1YFQMng4t7w?=
 =?us-ascii?Q?ZuTUq50zPmihK6K7sFgFpIT7aPbTosUEL+MGRIXs1ImUFjXYf6b1fmsLTeIj?=
 =?us-ascii?Q?bWDWJ3jNv+ns7zUy915L3YoKvIJfVGlTpkhevSet8agUHtieTzFewDx8tLiL?=
 =?us-ascii?Q?UpAW14hhKU0bqegQGjrizp4Vaw+uWi6TeT7cA0aML028QcOPZccXKj1r0EO7?=
 =?us-ascii?Q?sMZV7Ch+exurr53g/S3UCCWwdd9fanRVrwDOJShktQgIrfnmc+QCmMpd0lJG?=
 =?us-ascii?Q?SEe3VbXH2pW5aiY3/+CIVa3gDB2l9M0ge+bdRtBJ3cQLp0of82GcO5CZIB14?=
 =?us-ascii?Q?4oPsjyJGwayJ1IMTh/wbbLSmlDblXgclfV9VXPHnOxrW5eilbA/onpLW9dVK?=
 =?us-ascii?Q?utrknYcZ2GndCzWIQMKx9F5rj5OUndR3RoYYWWSv7jGBnSPZ9i+z72ylNkfY?=
 =?us-ascii?Q?aCcJCUHPjP9nVjnsnxLzN3BevlGGS1UpPiPE?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FqabqBuauV3AJ3tuSmkL7psNEtC1CYm0v7DQ0QAd4Zk6bug9scXUOC6HLVTz?=
 =?us-ascii?Q?EEFyvfO4KkSSxC2LNo34eaohi25O958UOhPNmmsN9Z5SyfSbyNES/4N7q+ho?=
 =?us-ascii?Q?CJwpKLj7fLra9LqE0F5kxfRVMvQBpRL/1Q7eZ20le2hYeFZKFNPM1hYtWTzY?=
 =?us-ascii?Q?1p9BPCRA7ifnnPD3Ghb7TniF3zXs11F2Owm8+aPbtrfo/hamnTZOsOlaQwy2?=
 =?us-ascii?Q?wuRh+CtgIhiuNqL8z9qKenph8qY7JTMO3ct/jPDOQxzvMorNBcCVqawJMxjM?=
 =?us-ascii?Q?Avg0/Y7Z6r6ekBAOajbebgO9Wd4agc3cvW3MJcyduiQzj59D67ARsahcCDk0?=
 =?us-ascii?Q?CPbHu7Di3UVVvQONeYMDKuyiIxjd7EqReCfdqDGEAbhBc4MenNDi7D2GwNrY?=
 =?us-ascii?Q?OZsn1yYQBjvgTBXzHOegbEibTrHtVpJU8716JO/AuZoURIrfnuarY3jFNioW?=
 =?us-ascii?Q?D+GKLf1UKuCZSOT4DlkwqIOixN5FJw3dt+ynYG/tApBQy9oLtFAIHFJFvl71?=
 =?us-ascii?Q?CDXP2venzBR6ULAlsxnzAy5ZiWnZmjHbJWKwaXjPHc7nRwNtrPpLiQEBbtzb?=
 =?us-ascii?Q?8k+tND+YOZv1M8meOL+y6awFRJekizlGu6HeZYLJduLiSngA2ilZ8bDWB3Qr?=
 =?us-ascii?Q?nYLRjfHdfmV82sJLkosWY9p45ag2EczthUnK6X1GgwNG/OLoYsh/C4N9R+VB?=
 =?us-ascii?Q?n0vsAdXS7Z0Iz35TwcklayvGF0ylIoeIQPAoUJoGgK+kNpz8swkedlqxVvng?=
 =?us-ascii?Q?kcY/IGqtFpxQvxbL5QB7p+kxbc49g+r7Ju+mnnEJwqQjM/oUL8NVLmLAUnZZ?=
 =?us-ascii?Q?gPVE8/rpR/+S51HNmYbzGhrLn7/6PzKp+dbpxOtiFfqUeSJOchAMjKBnwrfs?=
 =?us-ascii?Q?M0OVdUCwF8yp/PrzlEyB0XhjwqnEPGfvRWrpew2C7GNZzHpMrEhvLAJkZWRc?=
 =?us-ascii?Q?B6wZHnFRAd6ueEdiqxlbZKunZ8eKgQG4sd7/UKYYFR0a2sFBw1gXBzF9wW4k?=
 =?us-ascii?Q?WCdmJCEoHIb1pKh4HgBf7WV7iJ291JC24QrxOgeCUrpl3sDLHmvmQ89dC94j?=
 =?us-ascii?Q?dE3JnpIE2nVfGPE+koUNxmFMNXuvTaRTLhnpol5RqcscJBLC543f9BnlHW6U?=
 =?us-ascii?Q?dfobTFvTaNSTd2SumMzW5lmsDa/i56VbNQLs3wHXpPxnekV6NPKSctkAHQwb?=
 =?us-ascii?Q?w7bI+0IzEF00Iy4nTcerd1PJEwunz44N4Loou5Bg/P1BD1Gq8zVE57JHkK2I?=
 =?us-ascii?Q?mrqA5eEF6RvDVNJr0x9/eoIeETIIBnhKnuIpSfdcyu0MnhBIqdfye6E9Te+y?=
 =?us-ascii?Q?0+pYU0BxB0s7oa+d81t8hnh/dnkndLIaJ8wY7wHczz0vM1mD5nI/7KeK0rbQ?=
 =?us-ascii?Q?/9SxhszY0E9Bv6eInLTvhgYOE/4VQm8MKsORGbnH8gn4NFjaoAd820PnblgU?=
 =?us-ascii?Q?I79cHPGgX+qam4Vxq2gtZB1gZDDzz2v98Al8M4Hv1TpwoFXeZtGas2EoyY/M?=
 =?us-ascii?Q?qMRI9NTisY+BZ4y1xewYqTpPUOHEUiMwqUuqIxcp5qfW47I3lslgVNtAeXN8?=
 =?us-ascii?Q?aS09dbTavPApTzJVmkTh051KlHEqw6dsJSDYnDKqf9NAUh+Aep9nn+FPb2Zy?=
 =?us-ascii?Q?UhjjTAUfuv2Xb3AoJ2S+T4g=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2452c3-0db3-4fe6-1164-08de2849432e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:27:05.9235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AI4DzqCMltHBXmoF7nP8Dg1VAQyb94U+iL+oLH0iKQiGq9GiXxYzNX+ZyavnUxYEl2MWZwrpbJJI1f8ik/XahEf/oEVB/2EI7seU0pmBNzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691f334c cx=c_pps
 a=tP1g6Cq6k527JP85+VkTLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=jcMc0Nsmbg0OvNgs5mYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 9_mGqta9SXEyttmUVHEYWQ-tSVYF3oRN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMSBTYWx0ZWRfX/ZPdbtuPGuw5
 f5VfDAoGHHkQ0k0XltCgTcKHStj7WZzESBb6/RvYBp/fYRdueTCVe0egsisVlqgUkH0WD5R8blh
 BMA/AvOIVMI4c3mub71aN+uJnO9eDQ2AC2tDTZWbxmthZ+MJPjQujwcEYAqdsKu3jYmS1SJL+pD
 fS08VACLzUdZiStz0V7DidFw0yCZ/vqrq99laT9jcct77HimQOiLRhQOVUlrRrSIIFixnml3yq4
 qQlykl5XueX/YI/6uGrSNFova0QPUIiuIu9E69mnwEtAXeBh3B1I6wIcB5d1aCsUqjKO3ZuTv9F
 RcDZk+P9bjKng8RtYW9mw6WThzJgjjiyqVBpF6TWY47tTrP44fkvFZfCdtdG4TbGWegfZMI0VVH
 2HBiyakhIsUSE9OztnpqsqGJdyQFyg==
X-Proofpoint-ORIG-GUID: _XOfBxaKz_tOKAqxmRC4kTHdF4Iq-If2
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226629

From: Harish Sadineni <Harish.Sadineni@windriver.com>

To enable Rust integration in the Linux kernel build, this patch:

- Adds `rust-native`, `clang-native` and `bindgen-cli-native` to `do_kernel_configme[depends]`
  to ensure required tools are available for Rust support.
- Invokes `make rustavailable` inside `do_kernel_configme()` to prepare
  the kernel for building Rust-based modules or core components.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 2584cadf0d..dda235d4d0 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -463,6 +463,11 @@ do_kernel_configme[depends] += "virtual/cross-binutils:do_populate_sysroot"
 do_kernel_configme[depends] += "virtual/cross-cc:do_populate_sysroot"
 do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
 do_kernel_configme[depends] += "kern-tools-native:do_populate_sysroot"
+RUST_KERNEL_TASK_DEPENDS ?=  "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' \
+                                  rust-native:do_populate_sysroot \
+                                  clang-native:do_populate_sysroot \
+                                  bindgen-cli-native:do_populate_sysroot', '', d)}"
+do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
@@ -513,6 +518,10 @@ do_kernel_configme() {
 		echo "# Global settings from linux recipe" >> ${B}/.config
 		echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
 	fi
+        
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+		oe_runmake -C ${S} O=${B} rustavailable
+	fi
 }
 
 addtask kernel_configme before do_configure after do_patch
-- 
2.49.0


