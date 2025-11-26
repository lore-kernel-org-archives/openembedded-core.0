Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40520D10390
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 08:27:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8891.1764145614882979857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 00:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jUEKKHsa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3425ca01fa=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ6ovLm3779362
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 08:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=J2LYPqwki
	rFrESRA8vndvlfITXjUK4x7h3o2cINaMnE=; b=jUEKKHsa/xYioA0OFUuKxPXBm
	1BTfKP3fgY62Us//mQZpei8999/VXGs2HtHTwmUbpaMHhutyyb0aOX4KRAzS+Kry
	tZinxksa+4BPXkpbA4EcEKrumfiQ+I6LHWnjrMmfG97uythS3yOKABHA0AdsQwkY
	vc+PXTYc6UBQaeZHFGqlMpTdRSrRj/LdkVB7LWZQk2iFYVoG60Bv1xF0voC99SIx
	B7TlIVAEg159g30Fce4QfaepcdOXHZm25shd6C+wfum2AAIQp5Q7GRBZMwyOr5Vx
	uMIASV9WUQSNE4ewxhPK8V10tF5s8ivqn7zR3jWZpE0lRQN8zOgIQilPFE2mA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010057.outbound.protection.outlook.com [52.101.85.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ak2d0vbxq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 08:26:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KM6eaNFpl+OD+uAAC3fIQEKbE32UKXwoZGuvaFAATOXN64mbhU7xT3AE3lnp09LCSErVgxV1G4AHYXnZzDdAAiClBO0toC30sAVl7mG60DfRqteQ0Cp5tLuHh2gNJyE4zJNWoAaevoJ8fmPRi/VXHIv0lY3xYcgsfPJDwpxKWLtc4ww9ANx4Qt7iHJ/iY6Sgw8/sbq8tF1vWi7cLQ/4hRZYAjg4uzoikxVZxHGW2QMHl3XE8mnIzj1F5liDwcSdDpexGWyc6uNTPqssZ83eItjY2w4Y0fziwjdVMu7YZqesttAlGzEF66kE3U8x8S98Rs3DfePvVD5Kgli1kT1YfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2LYPqwkirFrESRA8vndvlfITXjUK4x7h3o2cINaMnE=;
 b=E2BBj1uMZB/yTYA/AXHlTtIiKG0kNs1vMtpwCP7G2tnNJW5Ztzfcrw3UsOksDwgwGS+s0OChbweICoXKYOYscJrgPkVTDygTdImEXDvWmSyJFGlkt49SuHawGTlmWHR4bPYgwLIjvfgKOMuE8LKARqdZTGNf+thVT79uatr1kry0QWXssM7WlEDQnrhmgzEDNRem+dW786WetAEvW/Q8YwOVYEBf6wDHQaaV3ZoABuYMUH0BB2ypWF35Jsyl9TdToZRMMNPXDlXI99SWuNfAUjULlof++6PCHT4X8ABZPOZSh0ceY3AjmRMXOVSx++sLXf8IDtZL3lqTvWqWQFfgiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DM3PPF6C1A2BDF1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 08:26:48 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 08:26:47 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] maintainers.inc: Add myself as maintainer for cargo-c recipe
Date: Wed, 26 Nov 2025 00:26:30 -0800
Message-ID: <20251126082630.3011882-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0166.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::21) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DM3PPF6C1A2BDF1:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df95e58-9740-41b8-00d3-08de2cc58a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0/DA6VIEj+23efuE5WbO89DB/h3uu5/tTtrb/pOn5RIJ6GIwyZG3iM4KJCz/?=
 =?us-ascii?Q?qxJkkECu4ICVtjPOlO2h4yX8u+xDRtVCWGvomwpnHnqXbtsD7wH/0Z6rczMz?=
 =?us-ascii?Q?pR0NN+cEqYFB60/WBku33Y+zycULDYxXwncQ24yhUmDGsKAncJ5EiQTXnDH/?=
 =?us-ascii?Q?+OrZm1Xya88x77b2iSDA/rXni4A8RSUbsyrT+i4CEcfMAtLkcOM2Ac40Ta6o?=
 =?us-ascii?Q?p6hM7fCS8SBpkNTUZ6WymkPzB47olTg8hYPMs0R2x77BzzUZ1xWeAjXrvrCk?=
 =?us-ascii?Q?NaqDqKLXach5Obll8WIc+tzXHQUhFiL9jpOckBDrFIiCnMRqRumA/O4XVLmC?=
 =?us-ascii?Q?s0jjbVreZNOB4A8A+OrHzfzldqyBi9C71z0nso8JLEYaq/aygkUAYaknqmcg?=
 =?us-ascii?Q?feqzDbPFtYnoQgtG/XIfr7ceIBTh0x0wS7F+82heh1ijk4hPqwKWN7VObigH?=
 =?us-ascii?Q?QoxyU8KZjsjRxONO1YqzQgT1AZPUMDpAKuiNEGqB+IvSBN2DMAjq3hkbCeEO?=
 =?us-ascii?Q?8cnewUDG42TgB0Z0EDX2F93Th0LFhIJpCsbUUg/a9078fzzu5JM/4Tw2dGaL?=
 =?us-ascii?Q?X5t/TPz5iZF0sCEYE9lNbCg+kVG6JnvYu2rYP5yy1wMZDkWUPu/vIHKpXAkU?=
 =?us-ascii?Q?aOEvm1LvrQaG0LANZaMthTqCIyvBepGOIcG/EyF5XoPBYI5SQgSxORO4iKOI?=
 =?us-ascii?Q?4hVXBLQ5niYhXrqWU3ux1wPCWznr3PLe063ImzJBge4UmZvrxmpTmhCD/Npq?=
 =?us-ascii?Q?k7Lnzvz+3rqgR/9JDrYXcgR9as/bkwYL4AAyvsvd2t7psr3qb9B4tO8Y8/2r?=
 =?us-ascii?Q?RcfvID5VFZD6b0brNizcolsnYceCUSrJ53+hQVLIuU5AjDjM0gJi5OXpczDq?=
 =?us-ascii?Q?D4HfBWa/OfLFlOWUCnZOaRv2dXsTxhDM9B8Qi0yMCAm+nD8z/LunYXf0/bjs?=
 =?us-ascii?Q?4X5HLin6BaZoENxWcI11OQUFwryyqb6nVpfgYlNgW17MXCw2IAFted1I71Ly?=
 =?us-ascii?Q?GwsTvsQiNhMAJhIXS4cjENAdG/bBirwl7f2enemvnvZDnFnkipx0UXcBstav?=
 =?us-ascii?Q?X2xSHYjuX8Ke0YJJKDvMkzn8cbdrfOqXGXMJYT3Lj2t7LlAHuOquFQ+SYd2s?=
 =?us-ascii?Q?3a71fsoqFd6NBWEm1CbRnFGSiA58s1ub2whkld24a+fCoOn9qoL3GUZTIlJy?=
 =?us-ascii?Q?iR6lM2Y8EbWQq7LmveoD8Um0n8gP+79YqF03Z4/exc1/NGACiS5t1YeO42xc?=
 =?us-ascii?Q?Rcw1bhN0Ow6Vrjv27ycSeRTxJtltZyLcEOiGjLJ8M+kalKzUekuoQNFeLIcw?=
 =?us-ascii?Q?ZFsdsuP0jVx5o0okBpv5YsyS1b2MnF7XdcvABaTpQqjNXyqhNcwowUtiIJ18?=
 =?us-ascii?Q?89ZHkgfkE9eg/dk2lVSDzWUh11uG6lUIg7ZeC2BzPmvQiyHJ40zxG1mRZxoF?=
 =?us-ascii?Q?B4F8hPdBQrq+QucTBq+IdL92c5ooS+Lf2YB2Yy09qkRXkoAsq9qwz3jnV4r9?=
 =?us-ascii?Q?WKHT+/DL8bTMsWWjFibYHI4Hz7sAWn0e0XhL?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BEiiHAfe6xnaI6G3b3LmRlFKJZ23N6+mle0CpLlWmhNmppDr/4Jvu4udi409?=
 =?us-ascii?Q?kEB0Gx6y765Oy4ljn0if00OIJjC7d1UAQVQDFtYs88fEOb25X0LEzgecCvxA?=
 =?us-ascii?Q?Ze2uUZ+YTGm+lKTNlue2I6ohnHFxAVv8gbasT3vQH5Bevfj6spf4HlR07tV8?=
 =?us-ascii?Q?SpjOagObCNu9HXkR2BBjPGVcNigvydh1B0XabWi+ifS44BSzzqiiEMN44TUD?=
 =?us-ascii?Q?1VrrzSA3Zfi8Of6COjoCUwzSXcdtOITAYPbkUhN3WpNk4Z5YVAF/1AqmKGXA?=
 =?us-ascii?Q?icODJvCIpz1FgSFFDr9K3+3QPoGwBTPrPuvwdujw2pgsLVomCMSlizdvwWmw?=
 =?us-ascii?Q?JFgvUZSYFuRMIyI1Clo/DJK1YgkZty9Cqyt3tEffZJFqmaRJBILuN7I3rvW3?=
 =?us-ascii?Q?lO5rT0+4bLRoGcLWW+5F/NM2oZSJp7F3U4HjY4bNgXuNfZJWqItT3jY2dHDm?=
 =?us-ascii?Q?WbUS2QO8nIEXPqt6ZBxVK7Mj+9DLQjx/hFkb+mBPaY1pQYW56nLiCcbPU/dE?=
 =?us-ascii?Q?mcPhbCeoDqN8kcds5cTxICmGwvbzeY/VUFi9npibNLyqkf0D8YwlVYhwjPkV?=
 =?us-ascii?Q?7V/6+TRfJxsDEkIpqoz6B9KXO4/iefeZkq2wXgUjuxjEa6PrjL1mgS0XKyJy?=
 =?us-ascii?Q?LyGRHdw3YDvq613fsWgZ9XXr1MgAlmriAZN0RigPgg76CRUtDUOBMY24Atq/?=
 =?us-ascii?Q?4+rfjJNhg8eOt5jhaYGb9KJ+nd55b9ypKJMKXc5rqUAQ3UumjfifboRw5K4D?=
 =?us-ascii?Q?bCuX4G/nm4x9hkyvMFuuQXjrM/6+jYq6UFa8rd1OvFBkGRFBFbJYT8ko7BZG?=
 =?us-ascii?Q?HbP8wJqSfLMnsFk5JinLozJwItWxI5DKRM4cRPHYvbCPTrNe0uLvvQ2RH3AZ?=
 =?us-ascii?Q?fx8Z9iQlQq9TMDiz4nDfqNnezi/B+mPNV5IkP5b35oOdsJ4PWbEwljQ/rlI+?=
 =?us-ascii?Q?LH+t2PvJTDEU0dCehZhXWtx3ZQew7PHYVO6rFtZEpB4KQe1ZhO3D31JQYsij?=
 =?us-ascii?Q?d/3hc72s26ObW6y51cFMbY7c0DnT0HzocHvG55AnXZKJ6QXmNdJC7ZRsGJxN?=
 =?us-ascii?Q?AWJqKXxG9Uy//erCoCAohIwo5H8YYZYdg2x5ooxuPpNKcBg/Yi4R0Gqn1FDq?=
 =?us-ascii?Q?MJlxamJYV7jaoWB0c+79S6Zb+tVEI4EddaSWrg5KC8HlbJnbSk2W/w2ryFiF?=
 =?us-ascii?Q?j4UDu3OdzFsHCXlg2aLdjZ3wgTxIXor9ig0aY/bp+4c/ZUvLMqkCbXN5RvfO?=
 =?us-ascii?Q?Khv66Qf6mnshI4kb9Bd1At5pG9WaJZfGhT6buXp0RBOT3/LSBpOhTNGSQHdI?=
 =?us-ascii?Q?xG4FetpUt2virMV18kgVP2lPvr0awlbtYXGi4kH3GuNbEt8+HR2Rgls12hce?=
 =?us-ascii?Q?cNvYbCgs8EXKWQaGKhUD2QGcLSh9sgAQBeIrK3unPs0cvpvSfOuDVIK3ruVQ?=
 =?us-ascii?Q?UHVA4NNqSOt2UrxK5pd4Kf10Ljr7biny1ThnD9MHupohXdLjT0sYjOavPaia?=
 =?us-ascii?Q?1gNe8NILxLMD1tz/xaV5swZrnYbr2lK4rPt3vPpQQgcaXYPfzmQaLhSlTM/Z?=
 =?us-ascii?Q?EHHNszz+rFcNupDAjCH96d0Xv8HcKEbGYlXN+sTHL+wGap2qbg6BKNqIBlxF?=
 =?us-ascii?Q?TFHBfpH7sTAoWw/0vzYYQkk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df95e58-9740-41b8-00d3-08de2cc58a87
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 08:26:47.8566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHTf90BJe8mH546U2zkHXA/aXO6a4KcDFso2Jqr8UwEI/8TMYo+Kmyyd9KAarWrdFdjT4ClyAvK95Gsvnar5RdPnrahIbdo4odur9Myyy1si5FzDI5o+hnKSPQ2Mf+2V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF6C1A2BDF1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA2OCBTYWx0ZWRfXy8hg5Ew4NMZ2
 e89s43hBQ3SmMjj03Vtv1LPL5/nuVNyhcHUzPOh6NUed4oAyHZEjxqFsGtB8+tl6MqnmT5LbrPX
 BTzoS13UpMVSfS6NNfPDlB4kMAhwexKGrQ5AFoGd8inFVaP5zy4oR9mB7tSeQ9NlIDM9ikMgDWD
 zaGcguxgaslsb2M1798UjO+lUnO2rqlmzBHey582KzSU6aVOAGEdMkn/BsLSAgfaVmTIiywX5yl
 ZgFYFWOPlINKLs5xRyuwKX4LF605MkZNZ5jEGRs+r7/XV8ExqvHySdkt4rfML7s87Q65OaZOnpu
 nqEAX4FeRVrvOJKgFu418vxlXdv+xNrXruAR1jk7ySXUTMgUV6vyA4UiPcaK0gIN9GtbfQC8hPg
 63nBpf9MDocf43gEm5jv0Y3DEqTkZA==
X-Authority-Analysis: v=2.4 cv=JcCxbEKV c=1 sm=1 tr=0 ts=6926b9cd cx=c_pps
 a=PUtblwwgLuFy1ufMWAoo+A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=0gcC27t9AAAA:8 a=iGHA9ds3AAAA:8 a=vHdsgA2b2riPFMfoxToA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=f5sM90hAhNS9OGT-JDKn:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: 2gmf0k0YylAtEERT5tLBENN8_6I3cL3Z
X-Proofpoint-ORIG-GUID: 2gmf0k0YylAtEERT5tLBENN8_6I3cL3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 08:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226801

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6c3174cbb7..c8d03b4b8e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -91,7 +91,7 @@ RECIPE_MAINTAINER:pn-bzip2 = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-ca-certificates = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-cairo = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-cargo = "Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-cargo-c = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-cargo-c = "Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>"
 RECIPE_MAINTAINER:pn-cantarell-fonts = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
-- 
2.49.0


