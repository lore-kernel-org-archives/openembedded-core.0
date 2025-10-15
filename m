Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA48CCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 09:59:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12233.1760522372344985701
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 02:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AHoLU34O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2383958093=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59F4no8h1082360
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 09:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=rvTGVpRzW
	ewJee4fdCp/+4zPcGaF5MujKYGihc0cog4=; b=AHoLU34OQ/X93watZEADfOjS3
	0yLWQAUsOYpeBAWTf5w02ZMZauZsV3m9stnsguMbGWKm9bKSgoKUUVr04lYSLdzg
	IyJ9J1It7yc9pISU7FgKjLJv2pJlBuEFURTNC/bFThrJVfzlhhxlIhvpButDaCT8
	2jqLeLcYzmgqzLroSjcOepuWy0lO9XPm9Rani5u/fbMoyBGhcCu2rRIf4cYmaE4C
	r3/VwcOjk6l13U3fR1D59skDbDTl0JwF5n6rc9+VUorlRr9huQDF+5CyQ7d0T21t
	h7BqRPjDb3idBiVT7ga8WhGmMNzDGa/r8nKcIdoX83Y3ZMDdKFj2usEsXIn6g==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010047.outbound.protection.outlook.com [52.101.46.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49sthh96kn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 09:59:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLjgTr3fL2LsawnqMyxpGV2nScV86MjALbOgu29aY2JNC4omWQJ4EIlss8BEKwePPpY9in88Zek6N5l8vqjdZbunHxcuqV9ceDgIvkt8r9ClIUybntADfE7SU3XUspEadkVE1vQxxlZQ85NdGQH1EvoN+1Thw18br2DTSRJXSz23bZIeXnP8sUlZdFcIll4yZiy/C6p3ewu+kOGZxNGk7d9VMqVfulFc+j8otYdozJdyeidenJdXYIstusgfj6ZCiUDv6JB/d9IxeFRH/Ur73XuudLMlNpo7c4FEFxd6ZRqbrAUK+2NnFXFWLDpWb6FQlzDq1xai37zmQihwwqM2qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvTGVpRzWewJee4fdCp/+4zPcGaF5MujKYGihc0cog4=;
 b=F53MkOXJgapwaYBZJBPffyaaX/GYF+5mTsAQtJzXPJI21TcLuudmt70O/V2RAh3FU0rpd0Qrr35ynUburTBJRF8h9/eaho50s5qgG7W+QWJ8JzarH3G4bN9PKhdks+WFbCRhg20kYH1qYHk8nhS7bwCrWPJriWig+l3Yp0Xq8dqw78LCcrJn3fjjAxpKzjr9nzwhydXybmSnH7QVLLOSb7QHmFNfeJo9olL/7XIbISEuJbylkZKSOCuNRsd/qJLlmOmY9e8JFx79tMJsTY8IZBO0DTgq0LNZ8+w8oSE+G96UoaXvJetXXsnz8OEvH6y+T7Os0lTTq02nECB+QQMf8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 09:59:29 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 09:59:28 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH V5 1/3] rust: Increase QEMU size to 1024 MB
Date: Wed, 15 Oct 2025 02:59:01 -0700
Message-ID: <20251015095914.2120664-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0046.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::21) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: 6183c311-b90d-46d9-81b3-08de0bd187c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZAwfk5FV0wQGYC6aFDFUqmo7on0S5i30bzzONrpWD/Mz7DzlG1pqVYoaehpU?=
 =?us-ascii?Q?htzhRAEos0lmAAvz372sslDKbYu1QcSkjXdjYN0zFrajun1jXzB7QrRRIeoK?=
 =?us-ascii?Q?qdQ0uF+pta1TyovMJPgwf/PA4HP3Ci+46Kk7LGCYtU4+MBjoAAHggixIvViP?=
 =?us-ascii?Q?hMZ2yrBkNyAr1r6k0nnfoWpFjT5h3EAszsPgl4BeWsAKx2HKWjS/FueGVRPT?=
 =?us-ascii?Q?B8/gYcs7gtv7Ckx6YQ8Gwlj0wqhNM3FKPMIXDwfOWqFbl3wYhbqxhIOP8Bu5?=
 =?us-ascii?Q?7Ya+viqaBqqa1Vk2M1gHcVcuF5FmIYmofgIR3LooykKSHgEpziYTKRIvHf5p?=
 =?us-ascii?Q?YbDFC0DWdhDFrd1aHck6QvJYKtXP8SLE4l/+kUKBJrowr7T5BIA0cc075pER?=
 =?us-ascii?Q?m1Cpg3HRf7FHaScbey7UBPKaB2Qu9UImifBP+xdrIuWjL/sLUQQcnEfFroAe?=
 =?us-ascii?Q?/NDdANrT9G2qG1B5WeEb9p5Sgx/VRo5nf3Ce0BjfKX0R7QOHmm049/3K8Opm?=
 =?us-ascii?Q?LOsoGgiMpkcAMLuYyHvaaM01qCQrTf64ocFcw36AOUJ1/Lcrs1qu/ecade5c?=
 =?us-ascii?Q?S0dM867R3ZVX0XpvMObB/89LaLE+PVE92GlED73xQoaHkCizkFW0zXEeGDUg?=
 =?us-ascii?Q?ZNK9zscdZy9vEmXTj2osHvKMKTMnOKovPASD3ADrZ/ciZVk/94Gigx66azCk?=
 =?us-ascii?Q?NT48j267s2kGfVApqCP7l1pT9rblUL6jofxipLTqimonvCvcobVG5HLXTA4N?=
 =?us-ascii?Q?jIGTn5F2Bg43O2nPI/edpnSFaXjD/VKZtQUGWd0ewkMxLflxO1D0qFh8fXx+?=
 =?us-ascii?Q?37XEu68VcsMoqLFfm46o5p6xMRRYc+Uy9EcL3hRmfKKaHyqd9XO0hK1+cb/A?=
 =?us-ascii?Q?ankEI+RfMTdAdRzppolxobYG3uKGKSiG7ULMi3zZDyZRsk+O9vpa1jlRDD62?=
 =?us-ascii?Q?Wrvw9KRQeTwbVfSksNvkO22DGbYZTReeLXolCIfR6VupUmy9VAGNMMSjjfel?=
 =?us-ascii?Q?gI6sdt87fYcA5bblAgM+Hlb5oyO/F7V57NV/XhKm43TBSLbDIuszfe/n7lLv?=
 =?us-ascii?Q?kkCM4ChUwW9w+KQwIlM5MRoIB1TpLcgZUdRxIJjoNpDTuDlO7bSkILwyQWuw?=
 =?us-ascii?Q?9L6ZJ1PFOkLTa0ihm/fz09yDlu3+K5mjgefVs3b1lnTm1FrSqLhOFDUW8KJO?=
 =?us-ascii?Q?6Q23gpBwuFJXRCulaSSzp0kgKbun/QKS8A4y6RDvzooDsG+qKrw7evz+USI5?=
 =?us-ascii?Q?4xQ1zHPh0h63sFfMwQlqG+/HQntctjZ9yfkpMOe+2mTbhQU6Ox4D/UpjGZjl?=
 =?us-ascii?Q?N+Ld9ADBYfrsNNLEdNDgplz6wgwtkxL7KZl0ONPVAszHsOGenA64imnq+Fze?=
 =?us-ascii?Q?PMvCAtR61apBEIR2HOkxc8OedK3YSY3rr/G/uyiFs0FjDm5yEOgMQz6dD483?=
 =?us-ascii?Q?ZlRVsSWeAX7KSrbja29AB0UzhaWNzdYk1YokZaG9tYTwHQl+QNHgYM/gHTX8?=
 =?us-ascii?Q?m6D+ow9Ltu1kVerhfAzOfSs6EM7GgGoZhM8S?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wuhRBq+nZEKZVdkPPyKJC6XgDveDhAa4xzSlnp6Ke0fN52CrXHXvBiGP0IBq?=
 =?us-ascii?Q?wftdiLo4ZhhLP1Gmwq6tlAAO1hKpY5PVDFnhcsLmfPOFvzW/Y9b1XKe8ueWJ?=
 =?us-ascii?Q?9b3C+dreLXoEVVQd0poNpKXL0gTUhGJ5rh0yKFhyQa0oOK7U+irMiKf0dTIg?=
 =?us-ascii?Q?cYQlOOA6nQhaQlaBDARNKzfCqvvjRbaFLBY9yvoOFEq09Wcj24BuNSL+YSWc?=
 =?us-ascii?Q?avSUL9pDpTSeIjbJAxbJYAmSQbqpteVX4em/z+Km9q52RImkn00529iOktLs?=
 =?us-ascii?Q?uyJW0vYUaV8ly2+R+eA7BbJt0h0DGGJXvlKC0Q9d1IYxAkEpbWOhn66aQInr?=
 =?us-ascii?Q?AGAFxtvXmjjaHd1qlg1R2kPCxRd1Dz6wZLPoFfKa+yFDiX9vXtk61kTxyC3g?=
 =?us-ascii?Q?0XTuT+SlnOG8d5aiMYu2NgMdPC9JfF1pVjSoncm2wQHdbyhwkoeDV9q0Gdgw?=
 =?us-ascii?Q?xfOsn9zQ3j9L8AqNiXufGh2LRbqvywMbHP2OKPD/PEZXQr2CZBX1O2K+0H69?=
 =?us-ascii?Q?gNPERfHYF7HwMHR4gUjeS3EbHZ/L6DV7aC7nUQHeI6O7WkZr9MBQZ/RqHiFJ?=
 =?us-ascii?Q?kWyBARAKpd0wDNlXIB8stmSDK8NnP8JEWWKTmyGo/Lk3sJSYC7NAARM+eMsE?=
 =?us-ascii?Q?RCYVkVjW1IqsYRdOsnyZ0MM7qqGRmt1UblNjGRfZyHqTZkOSXZpx9fSLjPN9?=
 =?us-ascii?Q?cf/Y3m6Y7LBgqzG8Gi0C339MvKqV6hWVXlhl6VbSuSK8DCCK58MSrDAoMYx3?=
 =?us-ascii?Q?WlKzUhTOnrWwahEpp4J7AolhwZIax90GRPHubiQxIGBQ0pvXASc9/JJu/QIH?=
 =?us-ascii?Q?5EzIoGv++yUpHVdg6BmnPPapIoIEnhOHqgRgJXXX/Ybr2Elb/7bdhy4hgLUG?=
 =?us-ascii?Q?vYzQIqQ8grgJO3p3D7n3FpYw/HC+sijLGG7aJ44OwgcJ96QKlc0bXtYznZuu?=
 =?us-ascii?Q?0EViusy3GnkyKOfhUeiMc91XGINkZjlGKo9eQfa3/mobf1m+aWnpK2Hxpknr?=
 =?us-ascii?Q?nvPBgLgJzzHr5QzTlmfKW2pq1UeVh4wCzcKKsIC4CjkQdbhDCtkr1Lputpjc?=
 =?us-ascii?Q?5vWQWd89szFh+bukGwxcWGZy9Z1QmsXDR13DBhkqZeHEUeud0oE2xn2vXLtR?=
 =?us-ascii?Q?LPvdjy/Cje10uCebSNqzJ+Y7cz0ZzgeaGmpH+WdF2BAur7leKOjY1MQmNGgZ?=
 =?us-ascii?Q?ScwNWzQ0YbLSw2K/PVLGISLmaqvj3IRJ3GZ8So9XzRIPpUh77ZDFVx5BjWfw?=
 =?us-ascii?Q?w9IFXLrQEWsLdDpIWWG7vek+OXVNb0XU+IfBDLGXhwSs/72j6hfEDRPQCudQ?=
 =?us-ascii?Q?XuL0kyq2orx52F8o5SzHwsDaAlgqxUJ1rTBSBQqkA3p4BpZCGogXhDwMtMI4?=
 =?us-ascii?Q?kofs5KAjEcZ9hJGuilvE99XTIsVhWdq1XX2sNolDvnXc8MDopzUhjeamwwuo?=
 =?us-ascii?Q?52T+XoTyxOPsaqgtZKKOkKQKhX8zXVWCl+WXGzpxuBwDrzNlb4BsxgfhfwD8?=
 =?us-ascii?Q?hLEI+pvol7mmfxDK8NSmWZonk4C/gjeQwYkWoXg0KyWon9orPTZQLHrGtBHI?=
 =?us-ascii?Q?Dfvl0tHP45pZ936N4a2chk1IWlliXKemuTUGbq8SCs3//izaDZkE8R7AaKzE?=
 =?us-ascii?Q?CfpcJAjq2gbrZsp/5Sqnk2M=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6183c311-b90d-46d9-81b3-08de0bd187c9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 09:59:28.8371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mq3B5i46PdaRM/cJDvJeR4t0TfvI5Sr+Vo56NT39VuBuSABjhXiQqLe91ukFv660JelwRhUGC5S+DCQdp390JwFzNb69Hzn5MMKuHG77xmmgQd8URMyQ23uXH+ceJwBh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7958
X-Proofpoint-GUID: BOEbAKb5l8FQst7osvRtbeNqYJUlUZFR
X-Proofpoint-ORIG-GUID: BOEbAKb5l8FQst7osvRtbeNqYJUlUZFR
X-Authority-Analysis: v=2.4 cv=QLBlhwLL c=1 sm=1 tr=0 ts=68ef7083 cx=c_pps
 a=jlQ7B5VXLElZiQQO4hIw4A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=xR68ycU9HHpG_n7C4HcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDA3NyBTYWx0ZWRfX6n6vJy/f/mmo
 EPhHibyXvoIeTqRs4HAdJG6k4L4DiSWxdPzJZ0oKGSJqwZKclpb51MyQq2aTvcWMJ5V46Jc9xur
 ZxAMQoKJZh+19CweR+Bk+xeVkWgdaMi7jKq0KXlNrIIG251IbE0ERHC0NrNsBFulUoDKpEOhgM2
 f/F+/VD3o9Z01udCyvzk0oDOhRh94byk2KysWM9qQaeS7FnuuGldX/6l7kNOPrI7oz6fc9hEk4K
 0R7RH9/Q0JfjR6CBM14tz3INCsljQaWjAxs3aCfjEZxVR0Sn/rK1IQiJo8mXSkDqI7NzssI5PgK
 Fvh+6WLi2tKawhTbnXl25D+ZQpa9zHDO677FFnkgJSA5cda9juBYkBFggAbFQbfViaNfOq/v6l8
 OXB00ED6PSdhXXRI+NM6G/1nsi/NrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510150077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 09:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224887

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Rightnow rust depends on llvm instead of rust-llvm

Setup in rust-llvm
CFLAGS:remove = "-g"
CXXFLAGS:remove = "-g"

Setup in llvm
DEBUG_LEVELFLAG = "-g1"

As a result, the stage1 compiler crate binaries include debug symbols,
increasing their size. These binaries are used to run tests inside QEMU.
To accommodate this, increase the QEMU RAM allocation to 1024 MB.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 95859a9eef..06acf53e9a 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -102,8 +102,9 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
         testargs =  exclude_fail_tests + " --no-doc --no-fail-fast --bless"
 
         # wrap the execution with a qemu instance.
-        # Tests are run with 512 tasks in parallel to execute all tests very quickly
-        with runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams = "-m 512") as qemu:
+        # Set QEMU RAM to 1024MB to support running unit tests for the compiler crate, including larger
+        # test cases and parallel execution in the test environment.
+        with runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams = "-m 1024") as qemu:
             # Copy remote-test-server to image through scp
             host_sys = get_bb_var("RUST_BUILD_SYS", "rust")
             ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user="root")
-- 
2.49.0


