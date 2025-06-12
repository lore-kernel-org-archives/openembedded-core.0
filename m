Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB054C71143
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 09:57:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9127.1749722243054110359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 02:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8258e96b79=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C3Yba8027382
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd95bnx-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yagfpTr/4gnTJcV7aP+yTYOO/jplJqkDpYGOUFIw2oETwj/nkWS098ejpuRlOhuLJbzhOEqV2/ZR55yytjGs2h1PI6+GUDk1nBv7UUtu2KigYjSzBJe3EispAv9w7CjMF/U80ZPXInCZPwWDFfGL2GkmPHL46Ws4DmQy3ZUf+kNjbDNOlZP7Y98UDfgQa5AFHUKYhX9K8EOCF1b4xHVlAkKPvS2Vx/mxH56hXZyxAPgQIzPx6KyrTS5EeiDzr58Yzb5eMjFRUPchkj11mW7iNbXheKs5DMpfIq0rbbNEP6OyRbSvBcJHyfiDNvR2k3Xk+9z6ng9ut8oWx1bbnwFMKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HK5qCswRsv/UjzLXYVWUacDw8dmSGwIVKuC4cuFycU=;
 b=ya6/HI0OcbagI/N9rsGhhzB7WOlvpKmBnRV9t+/gEvqtvtrp5Pdfzu9nG/d5kT4OmixIDyU3snHcSksxVskhiUA2hizGqFjX7Eqr312pXMbNscfGtV8yBpDhKSSukCp8m/t6Gr3MrZ6hP8TAee/6LJi9/E0HGQSBSzZq+hY12NCsG9m4Xu/VBZoT+sDo4GdWO1XTAthhMWHxEsY26Ngfd+a1nIvmnfzCEYoDT1zf6AyhP22+f2voOvl/LY5lxzYuo+tQsEp+ReUXwD4Uae6+cFMyYxB+xBJZdcyVc7OfFVYM4pr9/gJ1X853+uXr090OpT/H0sP0b7am8a7d1cnqjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH3PPF2B89F77E0.namprd11.prod.outlook.com (2603:10b6:518:1::d11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 12 Jun
 2025 09:57:20 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 09:57:20 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        =SunilKumar.Dora@windriver.com
Subject: [kirkstone][PATCH V2 4/8] nptl: Remove unnecessary quadruple check in pthread_cond_wait
Date: Thu, 12 Jun 2025 02:56:35 -0700
Message-ID: <20250612095639.3630518-5-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
References: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::11) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH3PPF2B89F77E0:EE_
X-MS-Office365-Filtering-Correlation-Id: 6808f9e0-7837-4295-024b-08dda9978577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hrOzNBqj1wzauzQhUv5ubMNsWkzVFbieQA2T9P802qIKQRmj6xY0NGRJ0e/E?=
 =?us-ascii?Q?428fucdpRzoeJKJetA9L/Z03DHDFAflYlc6NyxcdPpkeDaKYQunFoVY7/JhT?=
 =?us-ascii?Q?cN8tawkhD5AB0vrWMghhjKRHHFGvWRtoCDMZH+U7LQL/2MqmjfcNHyqwmHvS?=
 =?us-ascii?Q?/Ivz5I2gzCewuSWTEUYyxj/RppvHLLiz6T7t+9QImcF5douj/PnD8K+GcUnI?=
 =?us-ascii?Q?WuuQtuyZ1Uizmo6IgnQMaVLfygDKv7oDGAg5ZoHyNsrpP1JfL/NpZKMzALvt?=
 =?us-ascii?Q?cVNWglb3NPB2UJ3uGH9c40Xontofqm68kCJOy1mYaJBgLMcEkuh5C3onT1XJ?=
 =?us-ascii?Q?zoFHgXsdYMK8lQzODWc6rwkTl4ZMl3LjqIMKQRlWkhcbMWnxu/kmDkbJUaXR?=
 =?us-ascii?Q?h3t+wQ27SwYgmBZU/mpiKDQVmrZ0aa7ToFJsKAAsYt3xHFw7BGjKNeNNHklf?=
 =?us-ascii?Q?updGhTdeBmYBCQ09fJc6lWs3j1bRDQ2rWVpz1T81d3+dsyMyWSo6ivLcGVs2?=
 =?us-ascii?Q?iomponZhP6xA9hEY//cssFUMlozVCNMorNJam5i/U+qmEnPmqz6p1WgebF1j?=
 =?us-ascii?Q?pu0UdLg6YGx0b0ZNJGp2zaDA4tAZK9b0V06+B57kwETwofxzaYS1oK+d3AuP?=
 =?us-ascii?Q?GXfUcrPUlcjS8HYRlZ7ASUtPpzncCoRoOVZgbVHuzX8CnwoSY1pm2CASD0Sv?=
 =?us-ascii?Q?xJg8jnqT3GRsknfmFfvXstz86MfNLwCaoEDX6rwMNznAqaw2/XJR0qtnRUD1?=
 =?us-ascii?Q?+/o5MvT9kpScehCS9JqYEJOTK3HsITTLGMTNXMl3qIAbOeGosYs53OxVYbpA?=
 =?us-ascii?Q?EWojGZeXki9xOEO0U44s27b0UlYqkQ/jdzdaZq034+3mTVQLT29h5NTgZR8s?=
 =?us-ascii?Q?uEkvOi2IxT2tOoDRCOEm9m07eKu3+vy8zTd2+c1h4W2zArSSbIj01iOSscSg?=
 =?us-ascii?Q?Vsz3u8nmeUfo87AObb05aw76liYoU4hyCN0+xrjJg+jPGVLic8ggoBPvcG/x?=
 =?us-ascii?Q?SKiKxxQNXtn9dD0ghP/o7fDTAO5wY52cPrnyNUI/zgaQ5LOYVgnrz17kQ28p?=
 =?us-ascii?Q?Ti9Kmtctyi4AwGx2E9VECeENqsiYG3bKFVeB9Spov6RN1OhJ3boRPbVIWFCV?=
 =?us-ascii?Q?NsTN2G/CJK7+7X4/09L8leT9tjFspsHLg8EHfuYlxZhn8V1zwr70KDt3t5Rk?=
 =?us-ascii?Q?N15ZThcQsSWJFoP0/L6XtCYeMU5Dj3F7Vr3lKnoaC+BXYxk8qFitK8OmSRdk?=
 =?us-ascii?Q?ayxrtmmjC4KRU8Qbp+UslXkkKB+/6/NNdDiJMvQJ7JqTuCvhz8WnUZhbP19y?=
 =?us-ascii?Q?tKVVupMEjFsZhnbH8CvFyJIwwRNpTD60PzS7sVx5Sx0KRdl1l1nR4tOABRIH?=
 =?us-ascii?Q?1kI/f/tnMMcQKrvHR2GRgI3q32ERejo0FQN0El4XmI0a+nIsgjfNaUPmCNdl?=
 =?us-ascii?Q?W/VRQqTuLzzdvWjVa6KWK8QEcRopIxq251fpCgT2hoI4U5OznV+e6UPPPbEB?=
 =?us-ascii?Q?ySLSZXLg3c/fYvg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EJ3mLKzku2YV3nSLP0gZQhZdS29q+bA+bjRPOP/IEBz0hR6GkrZ54a3iWJVW?=
 =?us-ascii?Q?XEOtyaQ4PN2VHB9k5QnyDv5whst7w8fZJLyfvI0QupcopFzC83L7Hfwh1nj6?=
 =?us-ascii?Q?cC4o3wAISVHdBjWzehZyiSYtHRbcEwcDDU5i7QSDwkTJFsAAqu7SnGQylQ5L?=
 =?us-ascii?Q?KItcY7aQ2jf9Az/GPllsluE0h7IMpisEdHSPvbcoQTYj4OQSGejJbgxa5Cie?=
 =?us-ascii?Q?7K9l+Y4Nm764kTxr88M+gG1FFGVeJ2R2/Z30wFpl3DK22XG/aLjx7ObKxRAV?=
 =?us-ascii?Q?5cB/Xpxy/5AdfORaHYb3kcOlWUmLVTfsMyCXWKgxfjnGkrqs9LT11QveVPOT?=
 =?us-ascii?Q?WzF05J3ZKMPCBKZ++DHY5DAf3kWaBoOP749QN6dWlORj0T6QmHO6nWL1Leca?=
 =?us-ascii?Q?R66XvlpFlgXn17FY353mwpKUVao49+8+u3yOxrxTArP4nfdRlssFkXTjePlo?=
 =?us-ascii?Q?iN03LPF0TpApf/p97PMk+aSksw9zkgY9Io497yfizifZ0qo0Jz/VOFFHE9BC?=
 =?us-ascii?Q?eNehtfqKWUYglu30WhCDV6UG9iCvhHDntkzA2RCzHjqnswb6EOMefyHBJqup?=
 =?us-ascii?Q?YSG4EqBxig7Or8GH36eX3srncb7iH619QH6ZT+ezKT2uJHAkxqGf461hwh54?=
 =?us-ascii?Q?8aoVwkPZFEhKjmbfxCEK8lQkfcUJIH9Q4BpomRfo8IrXxjL4aIRadE4UfPEf?=
 =?us-ascii?Q?4R0ETAZnQdja3RknLudlNjywUttuBJauhAo+VYPZvlEAb621xa0ZFrQuJGjx?=
 =?us-ascii?Q?qi2/37ru8RjCaus5ojRWneuwsaDSjy5n+ZtDWCcFM7f/u8Pz+9Rc07pJEbX0?=
 =?us-ascii?Q?2F2naQ5dd2TDKlcxW0w9K+KNKa8GDL9wrBMTFb6i+mRcMOPK4Zo9L7CeaebM?=
 =?us-ascii?Q?2myV3jnmVs/w6ivXbhi9XqquIRZrEsnocdIgfjAo3+Way6RLCG8KsQNKrvxU?=
 =?us-ascii?Q?uE6dvdUdgvTIVe5tVqrnJ52LR9MOX3SfmFhOol31wP3f4dK8RLKIRrbLj1Dh?=
 =?us-ascii?Q?kzMU/NPp9DhPODBApms2AjnI64n9Mf58yEJ1cWbd9aTt2uqPq0LqGE9F8uD/?=
 =?us-ascii?Q?5cSqtbRVe2r+D9T66qaqSu7UWnuC1Z90sjQ5JoWAjMsA+x/E4l5Gk2kQ3yZe?=
 =?us-ascii?Q?QX13OKaaLQcsFgp0PQUQF19vb/R7hvpx/7wHubKkBj+K+ZdE5qgLimdxucUa?=
 =?us-ascii?Q?ZfnFg6hqGBXeK2hc4xC8dfUSucIrca36tiRPCswlCfGkDlo3qugkzeEIqKkC?=
 =?us-ascii?Q?ctyOQFC8ws1Cn9ktiS5njQBPvP8V7epgUgFKrDXkB3MGyAc+i8U2sdDnuQU/?=
 =?us-ascii?Q?22A1mJm/yh79dpf4ix9y5CibMigBHGH52IOHkv+gmceUr4QJan6z+/X3a1n4?=
 =?us-ascii?Q?gLNC5yN/AIriCZXC/ggXPqkuffF6HEKxRgf5dRr10+1xWW7P935l8vVeTQo2?=
 =?us-ascii?Q?iD0djgBNZ6/Y48x5KujvcU6g7cpT00KG6Xp0qeDaWsxEAVndz595zY4l1xN9?=
 =?us-ascii?Q?o4kwG/XprKwBMbQ5uRAUZ01Icdk76USIifbql4JvVyaqKtz8N1tzAu+a7WIL?=
 =?us-ascii?Q?GAvR5BE1otKi3vDeVhAYl3H5dcLUkDIfaIoMQ3hH7OwDi6KCsZCHaMfTuDn/?=
 =?us-ascii?Q?fuzrolBArkji/PT7e4ME4H0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6808f9e0-7837-4295-024b-08dda9978577
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:57:20.4053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSnceAJToxGADOrIvuzq2H8uqHbsXd1QmwT8fMjSl8wFHuoyHphapCRl0z+bHGqjz0s1rsOvSZf/KHFhYVEfartRRJe5zxrboswOjome3nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2B89F77E0
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=684aa482 cx=c_pps a=oHfdRNjjH91Dx1UII95wnA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=NpP8qUlCxzQSevXvkUwA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3NiBTYWx0ZWRfX1KY81bbtuoea tOAvhhLniWCoAg45gIjo5dvsOj53Bk03A16iEuXMPO/5QLKEYJZesoP3KDL55eezTm5wouTDFC5 czhlnR6GDyIRwxv4JLwJ0bd8KSZIJ903yrxJYMemQ7JtKqJsbIeXCRfuNix1dHfBRbCveAzlYBu
 3lJ7b4K5ANb9EMsuvp+2rOrfcZSH3yMMfwKW4TKjnbtRQQtdM1G+YED/moyhX0aNHTWWCjQA/S+ QdtnRtPdunX4GCVE0Kes9zNYYLFbcVFNmQbkkyvcPldd8GMRso73ffGZjZifHLX2Rrm6ecwoT0C OSlgm6VC3dRyyXsmr1c1S3SV3c32+/wi+IZ5V66y+a76Jn0fzkqcbMjhsgmnDDrAsEyGCqFPBUV
 a+z+sA2FXmRp3iaiIyMLDFkC4+lRYt0OzQQmVOvVYwOdU6RaXhqrDtFgWXRSZ0QjmiWq3Xuo
X-Proofpoint-ORIG-GUID: kLoVqFBxaRKzwmpkNP4oxVIJSTzjqI2_
X-Proofpoint-GUID: kLoVqFBxaRKzwmpkNP4oxVIJSTzjqI2_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506120076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218496

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from the Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport [4f7b051f8ee3feff1b53b27a906f245afaa9cee1]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-4.patch          | 116 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-4.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
new file mode 100644
index 0000000000..11b2f6af2c
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
@@ -0,0 +1,116 @@
+From ba2090ae4902f910024309f8203a228a756fb289 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Mon, 9 Jun 2025 03:40:26 -0700
+Subject: [PATCH] nptl: Remove unnecessary quadruple check in pthread_cond_wait
+
+pthread_cond_wait was checking whether it was in a closed group no less than
+four times. Checking once is enough. Here are the four checks:
+
+1. While spin-waiting. This was dead code: maxspin is set to 0 and has been
+   for years.
+2. Before deciding to go to sleep, and before incrementing grefs: I kept this
+3. After incrementing grefs. There is no reason to think that the group would
+   close while we do an atomic increment. Obviously it could close at any
+   point, but that doesn't mean we have to recheck after every step. This
+   check was equally good as check 2, except it has to do more work.
+4. When we find ourselves in a group that has a signal. We only get here after
+   we check that we're not in a closed group. There is no need to check again.
+   The check would only have helped in cases where the compare_exchange in the
+   next line would also have failed. Relying on the compare_exchange is fine.
+
+Removing the duplicate checks clarifies the code.
+
+The following commits have been cherry-picked from the master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport [4f7b051f8ee3feff1b53b27a906f245afaa9cee1]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_wait.c | 49 ----------------------------------------
+ 1 file changed, 49 deletions(-)
+
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index cee19687..47e834ca 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -366,7 +366,6 @@ static __always_inline int
+ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     clockid_t clockid, const struct __timespec64 *abstime)
+ {
+-  const int maxspin = 0;
+   int err;
+   int result = 0;
+ 
+@@ -425,33 +424,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+ 	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+-	  /* Spin-wait first.
+-	     Note that spinning first without checking whether a timeout
+-	     passed might lead to what looks like a spurious wake-up even
+-	     though we should return ETIMEDOUT (e.g., if the caller provides
+-	     an absolute timeout that is clearly in the past).  However,
+-	     (1) spurious wake-ups are allowed, (2) it seems unlikely that a
+-	     user will (ab)use pthread_cond_wait as a check for whether a
+-	     point in time is in the past, and (3) spinning first without
+-	     having to compare against the current time seems to be the right
+-	     choice from a performance perspective for most use cases.  */
+-	  unsigned int spin = maxspin;
+-	  while (spin > 0 && ((int)(signals - lowseq) < 2))
+-	    {
+-	      /* Check that we are not spinning on a group that's already
+-		 closed.  */
+-	      if (seq < (g1_start >> 1))
+-		break;
+-
+-	      /* TODO Back off.  */
+-
+-	      /* Reload signals.  See above for MO.  */
+-	      signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-	      g1_start = __condvar_load_g1_start_relaxed (cond);
+-	      lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+-	      spin--;
+-	    }
+-
+ 	  if (seq < (g1_start >> 1))
+ 	    {
+ 	      /* If the group is closed already,
+@@ -482,24 +454,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     an atomic read-modify-write operation and thus extend the release
+ 	     sequence.  */
+ 	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
+-	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-	  g1_start = __condvar_load_g1_start_relaxed (cond);
+-	  lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+-
+-	  if (seq < (g1_start >> 1))
+-	    {
+-	      /* group is closed already, so don't block */
+-	      __condvar_dec_grefs (cond, g, private);
+-	      goto done;
+-	    }
+-
+-	  if ((int)(signals - lowseq) >= 2)
+-	    {
+-	      /* a signal showed up or G1/G2 switched after we grabbed the
+-	         refcount */
+-	      __condvar_dec_grefs (cond, g, private);
+-	      break;
+-	    }
+ 
+ 	  // Now block.
+ 	  struct _pthread_cleanup_buffer buffer;
+@@ -533,9 +487,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	  /* Reload signals.  See above for MO.  */
+ 	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 	}
+-
+-       if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
+-	 goto done;
+     }
+   /* Try to grab a signal.  See above for MO.  (if we do another loop
+      iteration we need to see the correct value of g1_start)  */
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index d9073b6d64..9aab1466f6 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -64,6 +64,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-1.patch \
            file://0026-PR25847-2.patch \
            file://0026-PR25847-3.patch \
+           file://0026-PR25847-4.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


