Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD10C7115A
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 10:09:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15147.1750154988658608193
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 03:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8263d137de=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H6v8CF009026
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1jy6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:47 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55HA87ij003080
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:47 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2060.outbound.protection.outlook.com [40.107.102.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1jy6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 10:09:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2q1IWzBb0SEMQUTTT6BMtf0KUS5ci+hd05WJYaTh6/W8XWCJTQ/IuqfEdciQLRsfRG8qUghE7deoU+S8NRswrC6knTMQVSJBxlhqwNMB8YytAyBG9J1vuBpdHOGvFFeJErfoeyJrRF8uJCdOLe9nS/PbIT1gKTpIBJGhtQDvR7eDeMhwxmMYxAY3bmsSJ9fZBKki7m1y5rv4uxiW/r2c1oLV99ENeVxH47GGCo1l7YXN9gWKNYkxhwpzZf68ECFy9Qp63jtFZrmnffdOLs+olDQdN2RJ75UdvBfbT1d2O5IhrX6iX7MpO/y69uQMQQkAJhVyfFjvFVe65t+/4KIrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOM8zYDXVQrGsYCQPPzA7VWSwYyukA3d8CSsallujY4=;
 b=mW/NoGQclCSGF+zzC9NA9UeyAlVwJQ6Sqm+T0QTXNDFLsiCzIyUKsSVE0/CPHeeMlogpiA2IXACRqvJ7Np0NXgZygUMcIDHnOWcXyN7Qy+y2LUrbnnfZh859p5nOHCu6JoIbqEN5wBCplZqlVgOYqB2EOs+d8cYwK9XH1dyoyMP7Bx4JEU730M2UaBRVrSKrFkufVG8qVvDxHn9t9u5+0b12Tgt8DndfOr3WvTfW2GdLxEv07Na/mkGQ0WwS2f4IKlVcFEZKQjF6BU5VxKi6GPWJK4I6H6fm4mOSWACFsYbZDw7V2kDBqd8t4CD05LKbszOl7EYFSrN7KUdnutEHYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SJ5PPF12B0A4A9B.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::811) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 17 Jun
 2025 10:09:44 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 10:09:44 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        skandigraun@gmail.com, steve@sakoman.com
Subject: [kirkstone][PATCH V3 6/8] glibc: nptl Fix indentation
Date: Tue, 17 Jun 2025 03:08:53 -0700
Message-ID: <20250617100855.2696492-7-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617100855.2696492-1-sunilkumar.dora@windriver.com>
References: <20250617100855.2696492-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SJ5PPF12B0A4A9B:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3c75fe-f149-4a6c-739a-08ddad871554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6OBNsQpKhFPOq1dQoY16zVz0L+khUNgU3mlCiohDwf8vsjqaqjGtP81+KXWb?=
 =?us-ascii?Q?aaFCbQpHZAarxTrIc16WxdBdjZm/qOV3ANu+X7x4Dm1U/vSEzoy7PGTkW+Kw?=
 =?us-ascii?Q?I4ByEtFENNOQLexSaqX/JyfDZoPrlV0yp11FqBHdCuH+bpbPV+vFL/KIFrjm?=
 =?us-ascii?Q?ECYNUpypJ0BHbkCR4XuPIHIQlywoor31XKEvY1kAbPf6MdyrglXU1JgW5Fyc?=
 =?us-ascii?Q?sFqtVxerPSeKFIUJuG1dZWQfd9clkuCYHfI8iWFz0zO5J6UgDTMDB7qMMUZ/?=
 =?us-ascii?Q?fbdsvBuFLhsNN+aZNo4mc8N6PLSjO9mhxYRPSwefVC4cCi+D+W4lNrsGL7Wk?=
 =?us-ascii?Q?CPot6ECkKdv99gTFO74JSTeOonZHXIH6bc/FgeVHAPivTR4HstNYjqsCR0sY?=
 =?us-ascii?Q?UTWQorTazS8yq7x0lcH/3OKcEtb3lrOAOQ50V0smJH8mxhzJhDJs6Z2eA9wm?=
 =?us-ascii?Q?FStgxB4lj6jo77owh5l7cpEMaCRogzbSCr6Yk+A1/LqDJJ4Im/0LkuxZ23JR?=
 =?us-ascii?Q?RXKPRI9NWLq6FznfdX7DxebFksAga0JDgcTbmSm0gONOok8Z/wPIvQhb+yDZ?=
 =?us-ascii?Q?1qEnd0nWdcyL2hgve2hL2VF8w6P/v6ibfG7zVH3OWqvsmA+o8pue4AP+eKx2?=
 =?us-ascii?Q?fsKzAU3YDKIA0MBMEBiIkJ6Jo7j7c+vKMUJysvlvEPZ4YHOtMfGZjlhLJJ6X?=
 =?us-ascii?Q?ji4xo/RKvOX9DX3KBBJcnH9Tv42YfVSj/SNHznJUfioEObeoH6erRkZOA80C?=
 =?us-ascii?Q?Faam+EJUVofqGLiVvOq7w8TtRxGCJfEe+WHfwzr6C1e3h0q8bwy4SSX3/mnu?=
 =?us-ascii?Q?6rZvvDb+MJHUP5pyvWhWSFs5Q/Lj9OeQE1vmFb6kdP0kKbRQ/Jk3F2MO5A7A?=
 =?us-ascii?Q?okCj5/x/alRI5sW/0i2QWrboYN0c8p9qxrp5z6iQlsokbqU/VaQ5fzb47N0+?=
 =?us-ascii?Q?gDLDLWdwtfayMD48uir9fqP+TfVJEdQa0NMijA4pO2Ovze4Z4e2OBxQ5WH0k?=
 =?us-ascii?Q?RhJr922HdMfbQSwtjvsYJefBaxmzlsufAa++iiQmeAxAyfzs7Ce4CSRYvRNf?=
 =?us-ascii?Q?TElJFjwuSwVaEEsB8utlpA+wbdYeuwfcDm+g8HvGRAYIufHBJUf2J0V6EW2s?=
 =?us-ascii?Q?W7Xqfd/db+d6ySj28uXkeWlME1cic24JmyiktoixVtIKg3MDqYFxdIempY9I?=
 =?us-ascii?Q?BajCbRLg7OSrbVfoEn6vNF0a/3u1yop1+P++NP0i/uqC2EQZreL5JraM8WyD?=
 =?us-ascii?Q?GCt3GMUpZ317SqsDLEe2ttbCnvDC7sKZDfIx1gi9aE6M72OesKzMjXHcLNh4?=
 =?us-ascii?Q?4BuObkF2OouT3CXuPvIStgDhK/jG/MZDSrmiT9443JXP54OaV57KQrnOg7nf?=
 =?us-ascii?Q?2ftl8ovjIGGHDvX5s+esmL3ByDVvoTAcgv54bwj+6rCispMskeCa7p6ZHxpL?=
 =?us-ascii?Q?btzu6gX8aXA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oYYnyZ7UrnZ3tT8Dnb9GfErb6p13/WJzNYdg9Ji361SSojrCs4ODKIadfoxG?=
 =?us-ascii?Q?+DVTZECitmOIci5puZ1nfHkF2gvz06dqywB+7NUmq98QCUoUuVKfFChyPBJK?=
 =?us-ascii?Q?XnHXmTvoYGcKRsutsgaYaX30RlTqaob2t27rGJG+FFIaU7QBci/VdfrZ9/id?=
 =?us-ascii?Q?7QXOjIiGFOH3CpoUOS6NpD+1MY8CWYCox3gZR/h872y7jLPo303zL6TiR7fD?=
 =?us-ascii?Q?j2N6NnlXafwr+FKWP6SnjPnPENSv1Sz3yBJTja0YG4J/6QlTbocqwjX5nNip?=
 =?us-ascii?Q?W9ybc+10QptaQ3lCnxAzA5FnIqyOl3C3MkH3cAaGQ7aj3znm6owMyTK/1gco?=
 =?us-ascii?Q?+bXy2VmksUytoEnnfQElCOYaTMH7qNBvaSAZR2G3qA/4DrQp3ZkmInaD+Ada?=
 =?us-ascii?Q?oVkOZfqO/DnllG6H/kHbNornW+bQD8fjau7yfr7gm7hRnVqVCP9Xz3vJivHl?=
 =?us-ascii?Q?u2yzCRh7WdEVqARp9CINEAAvL3VKZu7SAmFIWTEJyemO08I9Leih3kqhktpz?=
 =?us-ascii?Q?qE3FWFuTYyGJmvTjN31bhXuQatsOolikyOe2XKHrqps2cJc+6cTt3LBcF4ZQ?=
 =?us-ascii?Q?6/9EvGn4IVwQJjbnsqDCrI30X2zGu6C47naaV8SfeUKRy+i1w+hcXK2lQ/f+?=
 =?us-ascii?Q?zsPTmVooh4u47SNrhq2iaA0c/sRVxKFxnrhtLNJWpac/VIQCAmBu4xOSjbMh?=
 =?us-ascii?Q?B6DYXphTvrkCmjSLuI0GHHlSxhvvMsFhykS0rTHjQ+jS+rdmwPhnoTnlhFb5?=
 =?us-ascii?Q?poH+EUpQn9bekh8qsgwTNyoecYIqgle0+LXWJY6oPB8DrgLZ1IxDi0oia2DC?=
 =?us-ascii?Q?WmQOwnvkNUkphs+kYKqxoLLmYyloDXGqI34otlbZPFabl2MNwiHh6UZnYCZM?=
 =?us-ascii?Q?TVLnrL3F08kXri38VDCF4o+8tF3lbesAAd8NPJ+IRoHiDxGQPtJCfdc1zNgj?=
 =?us-ascii?Q?h90yrSKOIk4yO82+YcDFrKYQ1l2jZRbnzmd/d3qO9Q7kgkk7sQLImHItxosf?=
 =?us-ascii?Q?1KExnPBOJri7jKtEaNw53sY0onUeKQuGgz2vU9Fwg1m0T4zq/+yMK/jsUTyl?=
 =?us-ascii?Q?PU8d17+zpRLAewX/cZrspBAAb8ddRmnD3I/zJPCpIU1bM9P4lMxbCuystWxd?=
 =?us-ascii?Q?rgVM+t0+ZF3+IflRg/crmZi/Re3kBeWMX69xjavzDYUYUJAer1O2mk/2b2Qd?=
 =?us-ascii?Q?uWbhe5rQTnCSfsWGbMVCoXvzsgSfZmKtHMfhv6osVXXP67DObssuV5xeIffa?=
 =?us-ascii?Q?v0nATthJtJ7j1C3zUhMWC/ufK7hvkE+3P3Fe5YezwfaVM4kctEbdhGPNrBGg?=
 =?us-ascii?Q?De1IM/ApEylzJcnVkCz9MNeONd7/N070r8b1ye3P8KmKbTfR9bcYtAv2gE2U?=
 =?us-ascii?Q?UguCP3T2EzYuHV1pUzxTjexrXI0yYBRvPwCxKMG0C9jSgmAXRNKoueQHR1T8?=
 =?us-ascii?Q?W53FOZirkgRXANdEiI80jMxJ6zkk9qO68pbgWnDaTeVjAzyk6vEhCcBa6Lbh?=
 =?us-ascii?Q?KzOi4jwU+x7nWub48sKPX2PivLv0p8FmMaG15qTRpEe2gwQJ50j808iKUzmS?=
 =?us-ascii?Q?hSrySqgp8ZyU2fMuFOPw4UhegN9DMZtAnwCd8+Dr9JC2VPY08GEEKekXraBM?=
 =?us-ascii?Q?gQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3c75fe-f149-4a6c-739a-08ddad871554
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:09:44.8178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Q3Eyxom85kcG/tDM098lrXQOnkiFTKD2rBJjnX7LaE/hod/lhoOxt4Kcw+h36204TCJT3AUuPcKpXkRoPVDUN9B61BaXJtO7NHczFLdxGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF12B0A4A9B
X-Authority-Analysis: v=2.4 cv=PuiTbxM3 c=1 sm=1 tr=0 ts=68513eeb cx=c_pps a=up6PulAVXqy3i+yUvDkarA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=7ZBXszWF_8vsTP3PHmcA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: zTCLGhtcXytGmtVkYJIpk_YWBViVFoSx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA4MiBTYWx0ZWRfX2a7J3q/Ie0Ct wG0wFCWMwhKnA0Lnr0jAtUXXD2+mMVa8BqnsLTue2SMyoOUJ6824k3ilnhfrmuL0mdEAxA1he2B ElTeuYyVhKe38ewUg/rHDp/2wQ8Tx3q/tIJeqoDDRtxWOrC6rIBvLeBvFNmeiNmz0UQgC8izTc+
 xfjpqc7BxlmQh9EIXemjCEANWbd6zLo4qJwuOTdcjylBNgADMIr+1nKXgKF33CIShlj3OMHA+VY dw0iYHP239hqMwugm2s+R7oSQq/GAUI/do0O/0IU6mFfd56sptlqtEf0AfhyJg7UhknK5a3Ja60 1J2OoNa6/HY9uyc/1czR61/TNt+QGtRV/JI8t4VbacSaKLVppvUOWLaAWAz5asZWvK7IYqdS+CF
 2tjTkSOmtGIrc7xsp436hVqzTcht/ay7T0uI1E6AjmNnwsENp5jsZODToLgH47aOAcUb7po8
X-Proofpoint-GUID: GOp777M-1ZNfvRkO7L-ts4jF0vcyd67B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506170082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218875

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport
[https://sourceware.org/git/?p=glibc.git;a=commit;h=ee6c14ed59d480720721aaacc5fb03213dc153da]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-6.patch          | 169 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 170 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-6.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
new file mode 100644
index 0000000000..cf87e21ddd
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
@@ -0,0 +1,169 @@
+From a2faee6d0dac6e5232255da9afda4d9ed6cfb6e5 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 17 Jun 2025 01:37:12 -0700
+Subject: [PATCH] nptl: Fix indentation
+
+In my previous change I turned a nested loop into a simple loop. I'm doing
+the resulting indentation changes in a separate commit to make the diff on
+the previous commit easier to review.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport
+[https://sourceware.org/git/?p=glibc.git;a=commit;h=ee6c14ed59d480720721aaacc5fb03213dc153da]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_wait.c | 132 ++++++++++++++++-----------------------
+ 1 file changed, 54 insertions(+), 78 deletions(-)
+
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 5c86880105..104ebd48ca 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -410,87 +410,63 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+       return err;
+     }
+ 
+-
+-      while (1)
+-	{
+-	  /* Now wait until a signal is available in our group or it is closed.
+-	     Acquire MO so that if we observe (signals == lowseq) after group
+-	     switching in __condvar_quiesce_and_switch_g1, we synchronize with that
+-	     store and will see the prior update of __g1_start done while switching
+-	     groups too.  */
+-	  unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+-	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+-
+-	  if (seq < (g1_start >> 1))
+-	    {
+-	      /* If the group is closed already,
+-	         then this waiter originally had enough extra signals to
+-	         consume, up until the time its group was closed.  */
+-	       break;
+-	    }
+-
+-	  /* If there is an available signal, don't block.
+-	     If __g1_start has advanced at all, then we must be in G1
+-	     by now, perhaps in the process of switching back to an older
+-	     G2, but in either case we're allowed to consume the available
+-	     signal and should not block anymore.  */
+-	  if ((int)(signals - lowseq) >= 2)
+-           {
+-             /* Try to grab a signal.  See above for MO.  (if we do another loop
+-                iteration we need to see the correct value of g1_start)  */
+-                     if (atomic_compare_exchange_weak_acquire (
+-                               cond->__data.__g_signals + g,
++  while (1)
++    {
++      /* Now wait until a signal is available in our group or it is closed.
++         Acquire MO so that if we observe (signals == lowseq) after group
++         switching in __condvar_quiesce_and_switch_g1, we synchronize with that
++         store and will see the prior update of __g1_start done while switching
++         groups too.  */
++      unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
++      uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
++      unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++
++      if (seq < (g1_start >> 1))
++        {
++          /* If the group is closed already,
++             then this waiter originally had enough extra signals to
++             consume, up until the time its group was closed.  */
++           break;
++        }
++
++      /* If there is an available signal, don't block.
++         If __g1_start has advanced at all, then we must be in G1
++         by now, perhaps in the process of switching back to an older
++         G2, but in either case we're allowed to consume the available
++         signal and should not block anymore.  */
++      if ((int)(signals - lowseq) >= 2)
++        {
++         /* Try to grab a signal.  See above for MO.  (if we do another loop
++            iteration we need to see the correct value of g1_start)  */
++           if (atomic_compare_exchange_weak_acquire (
++                       cond->__data.__g_signals + g,
+                        &signals, signals - 2))
+-                       break;
+-                     else
+-                       continue;
+-           }
+-	  /* No signals available after spinning, so prepare to block.
+-	     We first acquire a group reference and use acquire MO for that so
+-	     that we synchronize with the dummy read-modify-write in
+-	     __condvar_quiesce_and_switch_g1 if we read from that.  In turn,
+-	     in this case this will make us see the advancement of __g_signals
+-	     to the upcoming new g1_start that occurs with a concurrent
+-	     attempt to reuse the group's slot.
+-	     We use acquire MO for the __g_signals check to make the
+-	     __g1_start check work (see spinning above).
+-	     Note that the group reference acquisition will not mask the
+-	     release MO when decrementing the reference count because we use
+-	     an atomic read-modify-write operation and thus extend the release
+-	     sequence.  */
+-	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
+-
+-	  // Now block.
+-	  struct _pthread_cleanup_buffer buffer;
+-	  struct _condvar_cleanup_buffer cbuffer;
+-	  cbuffer.wseq = wseq;
+-	  cbuffer.cond = cond;
+-	  cbuffer.mutex = mutex;
+-	  cbuffer.private = private;
+-	  __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cbuffer);
+-
+-	  err = __futex_abstimed_wait_cancelable64 (
+-	    cond->__data.__g_signals + g, signals, clockid, abstime, private);
+-
+-	  __pthread_cleanup_pop (&buffer, 0);
+-
+-	  if (__glibc_unlikely (err == ETIMEDOUT || err == EOVERFLOW))
+-	    {
+-	      __condvar_dec_grefs (cond, g, private);
+-	      /* If we timed out, we effectively cancel waiting.  Note that
+-		 we have decremented __g_refs before cancellation, so that a
+-		 deadlock between waiting for quiescence of our group in
+-		 __condvar_quiesce_and_switch_g1 and us trying to acquire
+-		 the lock during cancellation is not possible.  */
+-	      __condvar_cancel_waiting (cond, seq, g, private);
+-	      result = err;
+ 	      break;
+-	    }
+-	  else
+-	    __condvar_dec_grefs (cond, g, private);
+-
++	   else
++	      continue;
+ 	}
++      // Now block.
++      struct _pthread_cleanup_buffer buffer;
++      struct _condvar_cleanup_buffer cbuffer;
++      cbuffer.wseq = wseq;
++      cbuffer.cond = cond;
++      cbuffer.mutex = mutex;
++      cbuffer.private = private;
++      __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cbuffer);
++
++      err = __futex_abstimed_wait_cancelable64 (
++        cond->__data.__g_signals + g, signals, clockid, abstime, private);
++
++      __pthread_cleanup_pop (&buffer, 0);
++
++      if (__glibc_unlikely (err == ETIMEDOUT || err == EOVERFLOW))
++        {
++          /* If we timed out, we effectively cancel waiting.  */
++          __condvar_cancel_waiting (cond, seq, g, private);
++          result = err;
++          break;
++        }
++    }
+ 
+   /* Confirm that we have been woken.  We do that before acquiring the mutex
+      to allow for execution of pthread_cond_destroy while having acquired the
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 05f408065f..45e6dedecb 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -66,6 +66,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-3.patch \
            file://0026-PR25847-4.patch \
            file://0026-PR25847-5.patch \
+           file://0026-PR25847-6.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


