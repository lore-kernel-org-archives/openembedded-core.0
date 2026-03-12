Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24678106ACC5
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 16:11:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25672.1773331888279298709
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 09:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AsUn2wjV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75312e9bb6=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CCtti92473842
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 09:11:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=cGDl2tW6ON+17/9Z2wgxFWKl/narSizemxsUHJiQjao=; b=
	AsUn2wjViroMoPnwlNxEZGLRDgJ/qOZPlr/ewQmnVTHTCchmsRleMmGjqPO0efui
	77tZOJXxare3nGC+6EjvMqdX5HzKuJewzSdrQSLlvfOxuWIC2nZCzpUke+RpfLHH
	586YfaUYuZ3c0e6zMHMGsAuv8v79DNMw6IpB9FQjhE3Yu1qROQllvCyUWz+ulmrE
	Au/xDukI3H7q4LUN3Ho2Li+e4zIIXP+Lk6oAl/xqmyTl663MAj3VCBunhN025HrJ
	hyUfXNwTZzGrv412XbevosLpLJgokMlc3M4Gz8ChQid3l/5IeeZN+0yZ6O8HVy9z
	60sPJ4NR01qk2j0HoFk9Eg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011056.outbound.protection.outlook.com [52.101.57.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6prxjg-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 09:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVhH4Hdgi9WeUdacrqCQ3k3XAKo7HE38v2G1zo+hKPaMEVi0BuG81IetBoBwb+LqJefXsSuDgBloncd+1eGVQun4K6cSOGZYNbHAsvYLeZm72iQZbyUQYZVZh5t1H4pFQOAoWKNWDnXaeRC8iSM6inXSd96yI0XgowI22xPgjOBBnwnrD3wt4isQoRgUkVAn4XCtKPm91kvDmCoDfzxkB/tnpZglDxkhEg15WkTGEyZXwAWf5vRbKbxHJtXsuPjizCnRZS5QsbJNf3VIoWYTBkTch3VPZ1I7C5aHkA9J4eh+siKSzH3JXGgwdugmtUAvUvkheF7YDeFgUEOlTFfUGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGDl2tW6ON+17/9Z2wgxFWKl/narSizemxsUHJiQjao=;
 b=FzclbzRw2hdSOgCI9nm5a7V7ZS7HH/k1JMzLvGaz3FWaMl0j4y+iB8wXZgHdejJ4cf8TkxjwNBmEICAg5+hqjrcqksRSHllmDyTNLrMIMGQ6qqF36FDAySgZvuHdH0si4zVaNYQWFchoPQsKVha7/4pkHFRGt8ez0IPPyDhJpUzug5oKk7QEiAmkpz36p0fVc/+NGpvYdqKwQPgg6wGVYnjHXmtbGtZh01cD2gmWWb9Ir3V0HjzYUMguDlCEQLNiUK3X9gqNM7b3LOXaS3WlOnoK6divNisXPc4ro0vsphlotTFD714XE4mxNS4mnkb4NbUvj+1T9wkWffaPPYBksQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 CY5PR11MB6113.namprd11.prod.outlook.com (2603:10b6:930:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Thu, 12 Mar 2026 16:11:23 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 16:11:23 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v4 3/8] gcc-runtime: avoid discarded-qualifiers build failure with glibc 2.43
Date: Thu, 12 Mar 2026 09:10:18 -0700
Message-ID: <20260312161038.2578649-3-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260312161038.2578649-1-Hemanth.KumarMD@windriver.com>
References: <20260312161038.2578649-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0303.namprd03.prod.outlook.com
 (2603:10b6:8:2b::19) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|CY5PR11MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 6abb97cb-3c03-4d0b-8cc8-08de80520123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	voeQLpnzT7091Q7UtdQ3/+TzlGU5+luarGuKEp2MwjrzTau3ArLAtndfq6LnIov7Wu5f1InkzufUkd8ODszOhLHw6+RXLmz8efanJ6+Bsjgu5k1pud5SbOt1Vg24cvhJ4EmI9PJq8Yi3SSnPSHt3OSBvrIe9AvB3Mc9tAbk3VP2+tgCNJ7peoGWMqNwZVec97AMSbct620gMiQONMdqwhfqi96EuSQrS47n4gGhAo5ACUO3xxORiXXLRoyp6o37BNwz3RGQEd1XEitK5rAyURqhwh3d+Xlz1BlA9xpoh5b7wOm57n4NtpL6w0ONNJtWX70dikJQM3zZMUNL9Szf5FqUW3Q38aaSwJwiC51Ni52z2WIdgrlkAaY4vB3cEY/00yyjjzqA6z30YwEkq4zUmsSnbbpchBuKQx89tu3COAXc9fTILZE6pIMa1T/4YOH4sh5Yv0EiQCu1UY1xbYOWuJVCcOfaBo0tyxVvyopYYprhlv4VhBnXtMbixUaS8ODu2e1OlRq2AeFo75/JT/rKcTT6NMFIUBeodxauWb213wsNgRN1mlcrDXbwvycyl02/zhRByEBBzClDEFJSNUwmGOSsNjw9K+HQILu5IjLySUWSMNGnpaAh9qriHWcYBHG5OTQBcnXR/aSNYFphe0YpPgErbAmbsJFO8lsMItjMIqIxtbOncnJEM2+BSqAltz6nwfHE6+DHeqd/exOGAWnmJyud8SCYOpnxuVsORFs1T7n5zv4pK8aGy4qAzTP+ovVKcOawettdbP1CrBMctJ5ADv8wMB6E5pipYwnf6ORBt56A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ErjSlnD+C5bF05JJPSuf5dUHDz0NvcWUwX22hhmpgfxsSqZkRcR4u7cc96dP?=
 =?us-ascii?Q?EQrp+c0wFTfRIGY3QXZDqmLC9r/S5HZKzZcyxCbNiigQFwOMXy12+yBeMQFX?=
 =?us-ascii?Q?ZmV2lOTYZ69fSZ8mk6yY27oeUdmNBtu1bdlhpzcp8ZY8/nWvZX56+ITJQcOi?=
 =?us-ascii?Q?LDAaqPq2OPPhoBJE0254jZmnpG8vqtGNukfCeVOJSd8+wRRiNNG0Htf9kN6c?=
 =?us-ascii?Q?apf+KuoGVoF5XoU4tpvMa2Si3Uv8kdbRkJwqPTMvaYcZgUf8vNrwGW1mruYE?=
 =?us-ascii?Q?y4HuClF1MP+voQfhCYnKECa7r34zZ9aGxDIoCXHSZe+OR0Mk+fwuOnHiMc+T?=
 =?us-ascii?Q?BXuvb3ciHdrIoH9PbMrFB5CGCIAazksy8NvG3aE4271tG5zB8jhGMH0V4k/p?=
 =?us-ascii?Q?2CzBZlGYNWlU+JqEp2gYn7v6gjJDxfmbT3Bo666+Kn+YnDzQhD+Cj4lrt9Dw?=
 =?us-ascii?Q?Kv6rpD1oQm8hD79jk9b+r/Pn831evJPN5grs4elew6q/GwvFYGkc1SDtfXQy?=
 =?us-ascii?Q?7jnMroP1cS74l1gUDaR+eS3sMStOf4qmZ/UjBvwnz/hTQdd24Ayh+DrmQ32D?=
 =?us-ascii?Q?oSeLeeYBY5K5IJkKSVngdi/O0bPgZUmVIQqsd/Z2A2qQUuCofIV42m1nT0nD?=
 =?us-ascii?Q?MSmddXZFRDnFkf1bvkG5DBKUh1NKAhp9TLpj1xyU7QZM8hZLWu53+OeUpnRi?=
 =?us-ascii?Q?tRkpU/c/NHew9Z1M/txkuZ6mLB517IhwHulv2apkhAem9YfjnvqkTozZb8S/?=
 =?us-ascii?Q?pwXI+guoOC53N6CaFRwM3/M//ZtpLf8EOITO3lKcCN+qi2ygsF86Bbz1oNdx?=
 =?us-ascii?Q?swdU0KM4pj4JNmtWwEznsuFn75i7frVJ8sDjPXNs6VFVdPP2vryny2mV0TSS?=
 =?us-ascii?Q?d/FuhU4D80y5l1DFR1Qqtc903wmhVrzy13W/iw8UMnYpX9+GVJMA34VWQWNP?=
 =?us-ascii?Q?64DdvyJK/UL0FwAONKV/dD+VtSBXbNFelBnpOk/r+F2L7k1m1MOFCNKfozjG?=
 =?us-ascii?Q?9QfulUOBLQSwbE/tz72JpAVaa6AFiqq8ZMEC9P5vVXsmusOnqGWg/pPVUauV?=
 =?us-ascii?Q?M8aj96m/8x8eHUSwj+iATBu3asxhWl7o+o9eUPOpYu1n7akv9m8QyAolnpAz?=
 =?us-ascii?Q?ZFhlxCV9/F4bE7qZw9yEncRy2x8Mc9GwAc67Tj7E70qGqcLIa6syb2Dx2z5C?=
 =?us-ascii?Q?QJLzZlIMOfl2UCwUBpnS3M5DEGLbCbOcNzDY3u89d9Xx/lZ7labJzzgCj3w3?=
 =?us-ascii?Q?UYNsCNRMsu3h4TlvAy5NzJzpdei9MmHpgWLyIgCj3aihnUPIBfP3MlvLQIpx?=
 =?us-ascii?Q?Wc9TBQeOf1ggdCk/jhXYTVtaBcRfeyJlFUKA+aEFZeUrRuJBXph8j/R0YSNv?=
 =?us-ascii?Q?XlVLhglkQkk5h735pw6y8/ANH25fG8Tvs2P8A4EvcaUin6XX5rRBcaMNoYeO?=
 =?us-ascii?Q?Lhpv49zfq4jL5IT0OyIqx3hopTLVEtaQBqtg76/LVVCXupEyGHEFY2Dp1mSR?=
 =?us-ascii?Q?TTHVmbvrZpn7mvQ0RrAnwS3sGiEwiZ/NycbW90a1hJIlkLrkQtyWh+LR4Ojg?=
 =?us-ascii?Q?3A8RGVeIO7bcxp0oTdOkoWs0f8IdAnZYX3mS9M1GGR54AEOpsrd5oEqBnswc?=
 =?us-ascii?Q?Tt8Yrayjn0dgHKoh1215izL5QMZkB7JUeKVs2HRB+A1Fw60ovs1JxWWFDoGQ?=
 =?us-ascii?Q?gBrYYDjZdfjpDBl6DdaqCzw4H7FxLAWyfe5N5NYvGUmEqkejyzzCmm5p3/0p?=
 =?us-ascii?Q?zn2d6Jl8xbPLRYMN32ahwa1kakDjZpo=3D?=
X-Exchange-RoutingPolicyChecked: 
	g4/I71XYkcvB5fT4mFzavz9VNI03GjFCMgOBVIu7jS3/l7645wsWa/B8bzg8ezFk+xRNbKhUqKyuQcYfh3O7F0Wi+otSLWmUxUVcFFZw3z7xaXuPiZgUmSl0Mvo86ZEUcAWUAzajPXjfUjXZw+M0qpbl25IjVI8Tr2jomPBJgwLIvUITQOm2H4KOOhHTdnLCrUPKZPmXI/v5zWazuWCSJXbzQoKz3CvE4cnXuybyXh/amEewekifHh5AabXoIHk33FHYzpsuVEcAQ2zZSf/baKO+5UifcHBn5VmuOgJxGstCt1/LLMO+w5msrMHL1cZ7bDbtbIZQxx4CmnFlL4ED/A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6abb97cb-3c03-4d0b-8cc8-08de80520123
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 16:11:23.0504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlhyLZOALbh3SfDZXs1PDiE4Gfmd0R+u7Zo/r2qjqT2A/s24awrr2ehEnOw/555nJTduMYvRYo7cOjkNlt46s6hlQiaoJY6tfiYhBBusKlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6113
X-Authority-Analysis: v=2.4 cv=ePAeTXp1 c=1 sm=1 tr=0 ts=69b2e5af cx=c_pps
 a=P8hJoqhRnqo/cwUvmyxmUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=4E9vqyv0ZoUom73ud8kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: iW-iG_64gCLqziQIpRxZNpPuC_l3_3Uh
X-Proofpoint-GUID: iW-iG_64gCLqziQIpRxZNpPuC_l3_3Uh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzMCBTYWx0ZWRfX8Db+UY8S2wEI
 dWRDcvfMhIzvu+l5Cn9JyOAtcGQmUHjkZPOXsYMPhzMMcaJF9T1HY/QC+w7Gx+hDCuWgw763A3c
 IC/McYVLIxAjb2YEXBdmbnxIoM5Xu+dybCT9rwWjndSAnd30v25dsjfg5oTRzVXXABJYiytqbL+
 v5JMg/KiuLfrybBkJ7hvcHccbnSq9BbxjB4XwPIzTpPb1sJzExHuN6LbdBXq8h/Os62SPgGUewF
 6GeCDPMLjnQBtmSvwb9FEkPXmwORDQ8AiiuVeAE7IupPdBT95PYneUsONUeLHi9nFu0XBPsVkf2
 YQCFk1gN3RMGRF35YCvE5PP6BQoE7dNKtVh3fEJVBDdi+9W3iH6YB7XplmR65n2fFZbraVplmQ+
 orbC4vteS4QRxcW2HMAKPxooYPs2q6iCcWg+qIo2CZF9EkCdBpnYHmS1OnUPfU51EZKn7R3imBE
 nsFc8xZ3iO/2fvLH/ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232988

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

With the glibc 2.43 upgrade, building gcc-runtime triggers a
-Wdiscarded-qualifiers warning in libgomp/affinity-fmt.c which
becomes a build failure due to -Werror.

Add -Wno-error=discarded-qualifiers to CFLAGS as a workaround until
the upstream const-correctness issue in libgomp is resolved.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index c4e1c5b9a5..ef38cff58a 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -7,7 +7,8 @@ SUMMARY = "Runtime libraries from GCC"
 LICENSE = "GPL-3.0-with-GCC-exception"
 
 CXXFLAGS:remove = "-fvisibility-inlines-hidden"
-
+CFLAGS:append = " -Wno-error=discarded-qualifiers"
+ 
 EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=${includedir}/c++/${BINV} \
     --with-sysroot=/not/exist \
-- 
2.49.0


