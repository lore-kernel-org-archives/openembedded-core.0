Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F40C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 14:29:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.61209.1749479347315284728
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 07:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82555bbc20=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5596QDai001107
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Jun 2025 07:29:07 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm1jnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 07:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7WxUXb+He3i4iTKa9HVZDo/Ocbjf0A4b7vzdFxqwZ2WI+CZbTNyLBxA5O7/ADAqKkFMqt8Uqguerqsumja0jtisyL3iOaifVs9DpO6byqNl2J25KlIk5PSMaQphJuJBJQiun1Pr7UaLEjCgLLFdCm5EA5Un3uHs50zTeE5eWLih/XPOYtH3QFDklxXSlYgrUVPEHwftlgly1nt54qvePEwinruygtIu0p0G6f3XyK+dgyB5UHmqn06mR4mOobNi245tbsq5sxU151hOoI14VqDrSYyBpD7WMbnFy9nBnWGJ+0eq6UrLU8n/1kEkeICdRC7yawPsxZCynMAoEQktYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXJbDjUbmAtKbHb41te+JeAUohpRR5N5iv/basJwzu0=;
 b=C2TReTIBNv7l9LIvxV1VKdmE7umty7/zj2zzW8dFJ85xUoChf5vgSALQUmmuyfazvqireAPWI5SFt0X07l8sVoNuzdY0JkeZBVrfpww7ZRrGyRiIvmqAXkAWFhUr76+N0JkPJpwNb2W/INxp2GjJtqGjor1xInbJP12rK5hSmi+jzOhR9bEED8juVo/4jfwm+qtrHivtMp2xbRMVCPMXw9RqUttQYEp04T0q8QDVzk/cTIpBiy6zABL5zA+khQ1IxkhiqrOmVB3ob4mm1/Y4jWDcEg3M9GJT0SotgHbnmHlB5aS8PkY59ffuENpzUZASg7qmB9lWCKLLU3V1CZIVDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW4PR11MB6665.namprd11.prod.outlook.com (2603:10b6:303:1ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Mon, 9 Jun
 2025 14:29:03 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 14:29:03 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kea: upgrade 2.6.1 -> 2.6.3
Date: Mon,  9 Jun 2025 22:28:47 +0800
Message-Id: <20250609142847.1978352-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0056.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW4PR11MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: b1cc6719-d1f6-48b0-41b7-08dda761fb75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?S5hnnBi5aQFazM7XogMId7xZmZ864SoqlGvPYVlL2U8NEmYGXa7pMCA/yuQ9?=
 =?us-ascii?Q?D35DH4gUqojLMR5wtiVDi6vHAurJmBEsmVI3eUH03LeG6ie3UaU/HhuQazu5?=
 =?us-ascii?Q?zPVYe5y6/7iKVZ9MNA9PaWopie7JCrjV3JheBHioEKk9MvZZvQcVDGsNq8JN?=
 =?us-ascii?Q?i9gZ7abN4Q8g40AsQUZtWSDoUMkZLx8zLhxf3luqI1Xvaqx6rpTd1C5sx1rD?=
 =?us-ascii?Q?RVI9rNhlwauw+Q2aZoMPW15wOaLUl9stKVl8mL0AhwiKfzJvRz6/nb7JDwtt?=
 =?us-ascii?Q?mgL0jVaU/EeyEkuc/FD1sKqSLoMKj5anDpDFFcxg+PXZg+rEM56GMU6JeyfS?=
 =?us-ascii?Q?57S5wtaEErNZgnur/pCVhncoVQ6WRVjOLxtxN77elj4wAeU5cQSaGIvVsBIt?=
 =?us-ascii?Q?T7xlnGTbxT31rvrxjTXSl0aADhorsAMUhF90vD5uL8mhtW3GtlV3jKXyuPhX?=
 =?us-ascii?Q?IzhE+lZQ5DK1xQkrnWEG+u0LrzDHMRxVO0zgtMtJMelnEPwbhPGVSeRVVJ+e?=
 =?us-ascii?Q?3deZhIztNo6i2dkRRWjq5b+b1uvPoZHn528k4fG84VF3/qinwvbhtLs0PqW4?=
 =?us-ascii?Q?JTrHte+rYB8gA2/55Q1USukVWdeBnxHMjrAu6nH9YOYojIIjV392/kbkI/Sw?=
 =?us-ascii?Q?32PhEcHDcokmRuRfNGnT647hA1bHJW0wxoXLrqnLFD6R3TCvLFyEZuPbuVtG?=
 =?us-ascii?Q?i3f7O3/6B1XGq+yp0T6+K6wa7pvV1TP936+C6dRXjyyihpx/nUFzDkgZIti6?=
 =?us-ascii?Q?hrQGFM9GqVyzcTz8kG5FwlB2YHTRJOWl+H0AV8q5VgM7XWZEhEp1qo7OKb5o?=
 =?us-ascii?Q?lbUX29Sq7/w9lCU1AHGzc+4OAlP9o7wPZPbBKgbJgyhgYuaxzlKie4nipyWd?=
 =?us-ascii?Q?l/tgEN6Y9kOBu50DyKMqJ94vYrvNc5pfRJozv8Y+CoQqgT9JNWrSBU1m8pQY?=
 =?us-ascii?Q?DXG8gmA0OKqW0EepWPsZ9AOT+35ve8s5SBJ91kBezC8ukuTyHRjy61p1zeN6?=
 =?us-ascii?Q?HajHUTWyh/ia0eAzNF2HRjE6INpGlPA5jctcOayiUo9o7faE/dt6kqr3KsXw?=
 =?us-ascii?Q?XMszrCCBb4DouhoE5mOleUhi2JfaaPPV69xQaIuBYpbT3UHVZUkwU6j6W3IP?=
 =?us-ascii?Q?flAj2u8FV5SUJOGj9PL7v8liDt3Epm5werFh6kLsChvuRyUoStkTYZNalyAh?=
 =?us-ascii?Q?7agmFipDJ52YqrXqXVZSka9NIs3sE6jAEAknD/usVugx1koFWZHO/jZjzdGd?=
 =?us-ascii?Q?qR01CppAggKcnGcYerG18yJLYzXkjFIGo8FfAlAo0hzLg4pUFafU/oGlBga1?=
 =?us-ascii?Q?FpWTt8bUjwTFynF+AMDZ3luGaC4Hk9o/exGcmz2YLiEy4w1GZj7D3TmcTxK7?=
 =?us-ascii?Q?KSuzhCrCZl4I70Br8m9II/R4as1gRneG+Vlf98DP/CF+gWSHaCjzi6Objjn0?=
 =?us-ascii?Q?7d2LkA8D41E=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vaHbc9ojDLlu4uLUT8tFZT6nDSqDmM8SWr31+1IEJlzTGL40sM4TtSj+2C4L?=
 =?us-ascii?Q?zp/x/lZsGZ6sdM8yPNhhIyca1MX5JtcAlj2OQyHdfsOCedrkV1pl5Jth/TOw?=
 =?us-ascii?Q?ekXaiHek+MqftdOY/p1aDg4tMYdkmbuze4ii4rgj7VTKV8EpqlweW0D4D6wb?=
 =?us-ascii?Q?Zkov5JGZAyRRYwtLp4IPL0lkXts7Ek5V1gcPQnWobIIFwCxapPYTU9pRZRFq?=
 =?us-ascii?Q?y+olkYwToZQKQiqJwcOCXbf94Vp4sEASKls/ZxoFmzt7q+XN1SDS7/D0pGXx?=
 =?us-ascii?Q?vC8TbrXZLZRrnAc2IshBuqqKoAwQHhYUYmq4zJB9tnztzjW7p+o/lD3WsvSo?=
 =?us-ascii?Q?dykDkbcNFa1pf8Wx4l8UaTU0kaPUj6A5mDYQ8HOLBrMcRecGW6u73RaHrzsS?=
 =?us-ascii?Q?49Hvi4ZP9k3ZyhMkG2V0rOQPDNOllKndMoxsNqs8GKhYcwpKMK6RmhlDdhdQ?=
 =?us-ascii?Q?q/6DFQnpRoQGqavszYnK2sf5aWWHYX/ZkF29bLliFOwHjrd5QvKWcdxMhxRe?=
 =?us-ascii?Q?rg7AjtHNKOxh7O9sBhk0O4JkrbqWZs2M0kzbKXtJgcPsHlb7LZEGJJVJ9utO?=
 =?us-ascii?Q?Mb360mmQU7MCXEJWaXr57aTwNqdPKUOyCLvvx11Dprw7LDUo3KWLGrMF+uhe?=
 =?us-ascii?Q?GokM+a3rYVf1lVdPvzsgP5FKF7LGlOHFE+CLKik/OPpa417Bc8NWYmFhKADb?=
 =?us-ascii?Q?a6LmgpSHsbhTh/GCQ6OO/Gil0yBQyTXNVHOz71M+NrfRK19VmTlYrBP895a4?=
 =?us-ascii?Q?NYAjEVoOb/szPxPfyLMXIIH+oGciFS+6WDskz2rgQy+DvUHoxYLnGVWyRsKx?=
 =?us-ascii?Q?Dq3MemFpW7WzKA0j82ilezPd8oKEDgja9AcGsSwVFnkyqpTJUca0ECafOmya?=
 =?us-ascii?Q?cytQI53BGq1/7wKVboViH4KooJnFMevMYPKDAWBkORk/WbOsICjT7GJpbam3?=
 =?us-ascii?Q?77ylgID3Q7hXN6Ua3mKPvFw6zsKkrbCz0+CyK3JXqD3uwQAPWfN7Lfoe0R8H?=
 =?us-ascii?Q?dNPT+4f/5h2E4SgUBHjPqlop9jahqlcASQf5dyp/89ThvkCOb9LW8KpELSI5?=
 =?us-ascii?Q?KawqXiiZtZoew643bE5fiCa4PDWu1OLL7u7+Kqb0pDUmtKCuhC2jcW1OKtSZ?=
 =?us-ascii?Q?1d7MYSyLO4Aj48Wf2kUIVB4hLEh7Fz/KjIqnMc0lhTuKi+BCpH27t2nEazGe?=
 =?us-ascii?Q?bWkfYj95v+r/ePyHulcyMsbt1XN9FnYg5hgq2EyLPmZqDl+/cQgfneUskUnU?=
 =?us-ascii?Q?+uKWy99u7r43t2EHyC353YUeQRV9TdIDMiTl/hdiSjRpC6MjKCyi+Ty3grRs?=
 =?us-ascii?Q?hyrCI7IpdVkMDR95xuKKKr5Oob4mlt8UlZfcKtpSlRQJH2aukLb6Kh1qGR/S?=
 =?us-ascii?Q?7RqsKb/KUN9V8O7BIT5O+MOFYRpDIiCsa++9iEfGVt53WJbHcw28yaTCJheE?=
 =?us-ascii?Q?Lyznc5SsQeIh18N55pfsqm+/5zGBQkGmFWEfJdO5t579CvhKIvSbTykQ8lSN?=
 =?us-ascii?Q?D0cI6+Z9naJyMYlT/ekc1p+TkVxUJrkFv+cUG/EA9N47Tz8vV4tcVIiV4T/t?=
 =?us-ascii?Q?t1eM0YNxQefQmlkG4Ax8i5lfGQWjZhAcQWHOJ9ZH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1cc6719-d1f6-48b0-41b7-08dda761fb75
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 14:29:03.2198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJEw5JqQLvBWKVY5brS0FmO8I1MC/xWpeLyAz1plMg+rQUezlMlIT7d5rte0F/7+Hk5SLB5hBDvHFYtYCvqHDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6665
X-Proofpoint-GUID: _OoO_3SJspG4ggvIMMG_yqxEZeyeyb0z
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=6846efb2 cx=c_pps a=b7h9l29Yh+wFs0LxBEmA1g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8 a=B_YlW_nkAAAA:8 a=pGLkceISAAAA:8 a=PL3nF1HTAAAA:8 a=6VTrYQmLAAAA:8 a=NkzC6hKGOULBiRvHlfQA:9 a=MRoE3BUjVndMUDj3:21 a=nwb-CePKZZm3gL-ai9HY:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=7KSPILAQ4G6cOt27aCKk:22 a=qBetxeCKR0rUg-zYz_rJ:22 a=vOL4U82AISsg7I9yZoEB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwNiBTYWx0ZWRfX4I/dqQHJ1JCZ VlpjARHVKb8Sgb9xB/tKVYoNTwLEbAJzi8VCosGa3MZ9mAaxQHk7C62tp3VfqQdWzhPhdOMDUQO Gd6F6UaI1QxXkz6WYnkzqpUcyr7r0SpHxxiP8QIo7QP0Y4nddA/ixfmCeAoCCWVq7oWQSTS5vVu
 KNsXNz8aZoDB4OcTMaItjo1Yj1ZLTaEYKfvyKkRZ9kNIJF9JY2x3H3J8Sop0gSPxvEZbOEIj61P F/pfLEYGELaZFlicsbv+WBlwyc6ULAgZASL2SMYVXNm4FcgPRkWo+EIp+3a4spGy5qGFzHuOgBX AgzeHSE03JdlevYc8VGiutP+i6v3njADLcOSzPAArlvCsilspX6T/pTvGJ0ONeZgt3Xz4x4YgOo
 Bs+60BisrVOtS15MvalJMqjklPo9mhPNf6szzQSphvkM5rmvtw/l4BHV7k8ydMhSqMNChmcF
X-Proofpoint-ORIG-GUID: _OoO_3SJspG4ggvIMMG_yqxEZeyeyb0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506090106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 14:29:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218291

ReleaseNotes:
https://downloads.isc.org/isc/kea/2.6.2/Kea-2.6.2-ReleaseNotes.txt
https://downloads.isc.org/isc/kea/2.6.3/Kea-2.6.3-ReleaseNotes.txt

Security fixes:
CVE-2025-32801
CVE-2025-32802
CVE-2025-32803

License-Update: Update copyright years

* Drop backport patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-Avoid-assert-on-empty-packet.patch   | 148 --------------
 ...me-NameString-with-vector-of-uint8_t.patch |  90 ---------
 .../0001-Update-asiolink-for-boost-1.87.patch | 190 ------------------
 ...po-in-Name-Name-append-to-ndata_-not.patch |  36 ----
 .../kea/{kea_2.6.1.bb => kea_2.6.3.bb}        |   8 +-
 5 files changed, 2 insertions(+), 470 deletions(-)
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-Avoid-assert-on-empty-packet.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-Replace-Name-NameString-with-vector-of-uint8_t.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-Update-asiolink-for-boost-1.87.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch
 rename meta/recipes-connectivity/kea/{kea_2.6.1.bb => kea_2.6.3.bb} (87%)

diff --git a/meta/recipes-connectivity/kea/files/0001-Avoid-assert-on-empty-packet.patch b/meta/recipes-connectivity/kea/files/0001-Avoid-assert-on-empty-packet.patch
deleted file mode 100644
index 14f3424570..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-Avoid-assert-on-empty-packet.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From 9cf3b6e8d705957927c2fbc9928318f4eda265c8 Mon Sep 17 00:00:00 2001
-From: Thomas Markwalder <tmark@isc.org>
-Date: Tue, 11 Feb 2025 18:52:41 +0000
-Subject: [PATCH 1/2] Avoid assert on empty packet
-
-/src/lib/dhcp/pkt_filter_lpf.cc
-    PktFilterLPF::receive() - throw if packet has no data
-
-/src/lib/util/buffer.h
-    InputBuffer::readVecotr() - avoid peek if read request length is 0
-
-/src/lib/util/tests/buffer_unittest.cc
-    Updated test
-
-Upstream-Status: Backport
-[https://gitlab.isc.org/isc-projects/kea/-/commit/0b98eae16d9b6ecdf57005624712b9b26fa05bc0]
-[https://gitlab.isc.org/isc-projects/kea/-/commit/16306026e37b32a2ce4b16fb5b78561ae153d570]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/lib/dhcp/pkt_filter_lpf.cc        | 10 +++++++---
- src/lib/util/buffer.h                 |  9 ++++++---
- src/lib/util/tests/buffer_unittest.cc |  8 +++++++-
- 3 files changed, 20 insertions(+), 7 deletions(-)
-
-diff --git a/src/lib/dhcp/pkt_filter_lpf.cc b/src/lib/dhcp/pkt_filter_lpf.cc
-index 69bdecc0e1..b0c8f108d3 100644
---- a/src/lib/dhcp/pkt_filter_lpf.cc
-+++ b/src/lib/dhcp/pkt_filter_lpf.cc
-@@ -318,9 +318,14 @@ PktFilterLPF::receive(Iface& iface, const SocketInfo& socket_info) {
-     decodeEthernetHeader(buf, dummy_pkt);
-     decodeIpUdpHeader(buf, dummy_pkt);
- 
-+    auto v4_len = buf.getLength() - buf.getPosition();
-+    if (v4_len <= 0) {
-+        isc_throw(SocketReadError, "Pkt4FilterLpf:: packet has no DHCPv4 data");
-+    }
-+
-     // Read the DHCP data.
-     std::vector<uint8_t> dhcp_buf;
--    buf.readVector(dhcp_buf, buf.getLength() - buf.getPosition());
-+    buf.readVector(dhcp_buf, v4_len);
- 
-     // Decode DHCP data into the Pkt4 object.
-     Pkt4Ptr pkt = Pkt4Ptr(new Pkt4(&dhcp_buf[0], dhcp_buf.size()));
-@@ -344,8 +349,7 @@ PktFilterLPF::receive(Iface& iface, const SocketInfo& socket_info) {
- 
-             struct timeval cmsg_time;
-             memcpy(&cmsg_time, CMSG_DATA(cmsg), sizeof(cmsg_time));
--            pkt->addPktEvent(PktEvent::SOCKET_RECEIVED, cmsg_time);
--            break;
-+            pkt->addPktEvent(PktEvent::SOCKET_RECEIVED, cmsg_time); break;
-         }
- 
-         cmsg = CMSG_NXTHDR(&m, cmsg);
-diff --git a/src/lib/util/buffer.h b/src/lib/util/buffer.h
-index 41ecdf3375..c426a14495 100644
---- a/src/lib/util/buffer.h
-+++ b/src/lib/util/buffer.h
-@@ -1,4 +1,4 @@
--// Copyright (C) 2009-2024 Internet Systems Consortium, Inc. ("ISC")
-+// Copyright (C) 2009-2025 Internet Systems Consortium, Inc. ("ISC")
- //
- // This Source Code Form is subject to the terms of the Mozilla Public
- // License, v. 2.0. If a copy of the MPL was not distributed with this
-@@ -233,7 +233,8 @@ public:
-     /// @details If specified buffer is too short, it will be expanded using
-     /// vector::resize() method. If the remaining length of the buffer
-     /// is smaller than the specified length, an exception of class
--    /// @c isc::OutOfRange will be thrown.
-+    /// @c isc::OutOfRange will be thrown.  Read length zero results
-+    /// in an empty vector.
-     ///
-     /// @param data Reference to a buffer (data will be stored there).
-     /// @param len Size specified number of bytes to read in a vector.
-@@ -244,7 +245,9 @@ public:
-         }
- 
-         data.resize(len);
--        peekData(&data[0], len);
-+        if (len) {
-+            peekData(&data[0], len);
-+        }
-     }
- 
-     /// @brief Read specified number of bytes as a vector.
-diff --git a/src/lib/util/tests/buffer_unittest.cc b/src/lib/util/tests/buffer_unittest.cc
-index 66c43e8f21..bae051dd16 100644
---- a/src/lib/util/tests/buffer_unittest.cc
-+++ b/src/lib/util/tests/buffer_unittest.cc
-@@ -1,4 +1,4 @@
--// Copyright (C) 2009-2024 Internet Systems Consortium, Inc. ("ISC")
-+// Copyright (C) 2009-2025 Internet Systems Consortium, Inc. ("ISC")
- //
- // This Source Code Form is subject to the terms of the Mozilla Public
- // License, v. 2.0. If a copy of the MPL was not distributed with this
-@@ -197,6 +197,12 @@ TEST_F(BufferTest, inputBufferRead) {
-     ASSERT_EQ(sizeof(vdata), datav.size());
-     ASSERT_EQ(0, memcmp(&vdata[0], testdata, sizeof(testdata)));
-     ASSERT_EQ(sizeof(vdata), ibuffer.getPosition());
-+
-+    // Verify that read len of zero results in an empty
-+    // vector without throwing.
-+    datav.resize(8);
-+    ASSERT_NO_THROW(ibuffer.readVector(datav, 0));
-+    ASSERT_EQ(datav.size(), 0);
- }
- 
- TEST_F(BufferTest, outputBufferReadAt) {
--- 
-2.25.1
-
-From 614a6c136fc20ee428b1c880889ef61253657499 Mon Sep 17 00:00:00 2001
-From: Thomas Markwalder <tmark@isc.org>
-Date: Tue, 18 Feb 2025 15:03:12 +0000
-Subject: [PATCH 2/2] Addressed review comments
-
-Couple of typos fixed.
----
- src/lib/dhcp/pkt_filter_lpf.cc | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/lib/dhcp/pkt_filter_lpf.cc b/src/lib/dhcp/pkt_filter_lpf.cc
-index b0c8f108d3..3642915cc1 100644
---- a/src/lib/dhcp/pkt_filter_lpf.cc
-+++ b/src/lib/dhcp/pkt_filter_lpf.cc
-@@ -320,7 +320,7 @@ PktFilterLPF::receive(Iface& iface, const SocketInfo& socket_info) {
- 
-     auto v4_len = buf.getLength() - buf.getPosition();
-     if (v4_len <= 0) {
--        isc_throw(SocketReadError, "Pkt4FilterLpf:: packet has no DHCPv4 data");
-+        isc_throw(SocketReadError, "Pkt4FilterLpf packet has no DHCPv4 data");
-     }
- 
-     // Read the DHCP data.
-@@ -349,7 +349,8 @@ PktFilterLPF::receive(Iface& iface, const SocketInfo& socket_info) {
- 
-             struct timeval cmsg_time;
-             memcpy(&cmsg_time, CMSG_DATA(cmsg), sizeof(cmsg_time));
--            pkt->addPktEvent(PktEvent::SOCKET_RECEIVED, cmsg_time); break;
-+            pkt->addPktEvent(PktEvent::SOCKET_RECEIVED, cmsg_time);
-+            break;
-         }
- 
-         cmsg = CMSG_NXTHDR(&m, cmsg);
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/kea/files/0001-Replace-Name-NameString-with-vector-of-uint8_t.patch b/meta/recipes-connectivity/kea/files/0001-Replace-Name-NameString-with-vector-of-uint8_t.patch
deleted file mode 100644
index a7deeca243..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-Replace-Name-NameString-with-vector-of-uint8_t.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 6b9fb56e3573aa65923df9a08201dd5321a1b1f1 Mon Sep 17 00:00:00 2001
-From: Dimitry Andric <dimitry@andric.com>
-Date: Sat, 3 Aug 2024 14:37:52 +0200
-Subject: [PATCH 1/2] Replace Name::NameString with vector of uint8_t
-
-As noted in the libc++ 19 release notes, it now only provides
-std::char_traits<> for types char, char8_t, char16_t, char32_t and
-wchar_t, and any instantiation for other types will fail.
-
-Name::NameString is defined as a std::basic_string<uint8_t>, so that
-will no longer work. Redefine it as a std::vector<uint8_t> instead.
-
-Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2410]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/dns/name.cc | 12 ++++++------
- src/lib/dns/name.h  |  2 +-
- 2 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/src/lib/dns/name.cc b/src/lib/dns/name.cc
-index ac48205..085229b 100644
---- a/src/lib/dns/name.cc
-+++ b/src/lib/dns/name.cc
-@@ -303,7 +303,7 @@ Name::Name(const std::string &namestring, bool downcase) {
-     // And get the output
-     labelcount_ = offsets.size();
-     isc_throw_assert(labelcount_ > 0 && labelcount_ <= Name::MAX_LABELS);
--    ndata_.assign(ndata.data(), ndata.size());
-+    ndata_.assign(ndata.data(), ndata.data() + ndata.size());
-     length_ = ndata_.size();
-     offsets_.assign(offsets.begin(), offsets.end());
- }
-@@ -336,7 +336,7 @@ Name::Name(const char* namedata, size_t data_len, const Name* origin,
-     // Get the output
-     labelcount_ = offsets.size();
-     isc_throw_assert(labelcount_ > 0 && labelcount_ <= Name::MAX_LABELS);
--    ndata_.assign(ndata.data(), ndata.size());
-+    ndata_.assign(ndata.data(), ndata.data() + ndata.size());
-     length_ = ndata_.size();
-     offsets_.assign(offsets.begin(), offsets.end());
- 
-@@ -347,7 +347,7 @@ Name::Name(const char* namedata, size_t data_len, const Name* origin,
-         // Drop the last character of the data (the \0) and append a copy of
-         // the origin's data
-         ndata_.erase(ndata_.end() - 1);
--        ndata_.append(origin->ndata_);
-+        ndata_.insert(ndata.end(), origin->ndata_.begin(), origin->ndata_.end());
- 
-         // Do a similar thing with offsets. However, we need to move them
-         // so they point after the prefix we parsed before.
-@@ -582,7 +582,7 @@ Name::concatenate(const Name& suffix) const {
- 
-     Name retname;
-     retname.ndata_.reserve(length);
--    retname.ndata_.assign(ndata_, 0, length_ - 1);
-+    retname.ndata_.assign(ndata_.data(), ndata_.data() + length_ - 1);
-     retname.ndata_.insert(retname.ndata_.end(),
-                           suffix.ndata_.begin(), suffix.ndata_.end());
-     isc_throw_assert(retname.ndata_.size() == length);
-@@ -622,7 +622,7 @@ Name::reverse() const {
-     NameString::const_iterator n0 = ndata_.begin();
-     retname.offsets_.push_back(0);
-     while (rit1 != offsets_.rend()) {
--        retname.ndata_.append(n0 + *rit1, n0 + *rit0);
-+        retname.ndata_.insert(retname.ndata_.end(), n0 + *rit1, n0 + *rit0);
-         retname.offsets_.push_back(retname.ndata_.size());
-         ++rit0;
-         ++rit1;
-@@ -662,7 +662,7 @@ Name::split(const unsigned int first, const unsigned int n) const {
-     // original name, and append the trailing dot explicitly.
-     //
-     retname.ndata_.reserve(retname.offsets_.back() + 1);
--    retname.ndata_.assign(ndata_, offsets_[first], retname.offsets_.back());
-+    retname.ndata_.assign(ndata_.data() + offsets_[first], ndata_.data() + retname.offsets_.back());
-     retname.ndata_.push_back(0);
- 
-     retname.length_ = retname.ndata_.size();
-diff --git a/src/lib/dns/name.h b/src/lib/dns/name.h
-index 37723e8..fac0036 100644
---- a/src/lib/dns/name.h
-+++ b/src/lib/dns/name.h
-@@ -228,7 +228,7 @@ class Name {
-     //@{
- private:
-     /// \brief Name data string
--    typedef std::basic_string<uint8_t> NameString;
-+    typedef std::vector<uint8_t> NameString;
-     /// \brief Name offsets type
-     typedef std::vector<uint8_t> NameOffsets;
- 
diff --git a/meta/recipes-connectivity/kea/files/0001-Update-asiolink-for-boost-1.87.patch b/meta/recipes-connectivity/kea/files/0001-Update-asiolink-for-boost-1.87.patch
deleted file mode 100644
index 794726f1f1..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-Update-asiolink-for-boost-1.87.patch
+++ /dev/null
@@ -1,190 +0,0 @@
-From dab0f3daafb760ace0d4091f74ff90edb225ca02 Mon Sep 17 00:00:00 2001
-From: q66 <q66@chimera-linux.org>
-Date: Sun, 15 Dec 2024 03:04:53 +0100
-Subject: [PATCH] Update asiolink for boost 1.87
-
-Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2523]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/lib/asiolink/io_address.cc         |  4 ++--
- src/lib/asiolink/io_service.cc         |  8 ++++----
- src/lib/asiolink/tcp_endpoint.h        |  2 +-
- src/lib/asiolink/udp_endpoint.h        |  2 +-
- src/lib/asiolink/unix_domain_socket.cc | 16 ++++++++--------
- src/lib/dhcp/iface_mgr.cc              |  2 +-
- 6 files changed, 17 insertions(+), 17 deletions(-)
-
-diff --git a/src/lib/asiolink/io_address.cc b/src/lib/asiolink/io_address.cc
-index 43459bf..06b7d3d 100644
---- a/src/lib/asiolink/io_address.cc
-+++ b/src/lib/asiolink/io_address.cc
-@@ -37,7 +37,7 @@ IOAddress::Hash::operator()(const IOAddress &io_address) const {
- // because we'd like to throw our own exception on failure.
- IOAddress::IOAddress(const std::string& address_str) {
-     boost::system::error_code err;
--    asio_address_ = ip::address::from_string(address_str, err);
-+    asio_address_ = ip::make_address(address_str, err);
-     if (err) {
-         isc_throw(IOError, "Failed to convert string to address '"
-                   << address_str << "': " << err.message());
-@@ -116,7 +116,7 @@ IOAddress::isV6Multicast() const {
- uint32_t
- IOAddress::toUint32() const {
-     if (asio_address_.is_v4()) {
--        return (asio_address_.to_v4().to_ulong());
-+        return (asio_address_.to_v4().to_uint());
-     } else {
-         isc_throw(BadValue, "Can't convert " << toText()
-                   << " address to IPv4.");
-diff --git a/src/lib/asiolink/io_service.cc b/src/lib/asiolink/io_service.cc
-index 411de64..cc28d24 100644
---- a/src/lib/asiolink/io_service.cc
-+++ b/src/lib/asiolink/io_service.cc
-@@ -30,7 +30,7 @@ public:
-     /// @brief The constructor.
-     IOServiceImpl() :
-         io_service_(),
--        work_(new boost::asio::io_service::work(io_service_)) {
-+        work_(boost::asio::make_work_guard(io_service_)) {
-     };
- 
-     /// @brief The destructor.
-@@ -92,7 +92,7 @@ public:
- 
-     /// @brief Restarts the IOService in preparation for a subsequent @ref run() invocation.
-     void restart() {
--        io_service_.reset();
-+        io_service_.restart();
-     }
- 
-     /// @brief Removes IO service work object to let it finish running
-@@ -115,12 +115,12 @@ public:
-     ///
-     /// @param callback The callback to be run on the IO service.
-     void post(const std::function<void ()>& callback) {
--        io_service_.post(callback);
-+        boost::asio::post(io_service_, callback);
-     }
- 
- private:
-     boost::asio::io_service io_service_;
--    boost::shared_ptr<boost::asio::io_service::work> work_;
-+    boost::asio::executor_work_guard<boost::asio::io_service::executor_type> work_;
- };
- 
- IOService::IOService() : io_impl_(new IOServiceImpl()) {
-diff --git a/src/lib/asiolink/tcp_endpoint.h b/src/lib/asiolink/tcp_endpoint.h
-index 8ebd575..7c8cb35 100644
---- a/src/lib/asiolink/tcp_endpoint.h
-+++ b/src/lib/asiolink/tcp_endpoint.h
-@@ -42,7 +42,7 @@ public:
-     /// \param port The TCP port number of the endpoint.
-     TCPEndpoint(const IOAddress& address, const unsigned short port) :
-         asio_endpoint_placeholder_(
--            new boost::asio::ip::tcp::endpoint(boost::asio::ip::address::from_string(address.toText()),
-+            new boost::asio::ip::tcp::endpoint(boost::asio::ip::make_address(address.toText()),
-                               port)),
-         asio_endpoint_(*asio_endpoint_placeholder_)
-     {}
-diff --git a/src/lib/asiolink/udp_endpoint.h b/src/lib/asiolink/udp_endpoint.h
-index f960bf3..2a3da9f 100644
---- a/src/lib/asiolink/udp_endpoint.h
-+++ b/src/lib/asiolink/udp_endpoint.h
-@@ -42,7 +42,7 @@ public:
-     /// \param port The UDP port number of the endpoint.
-     UDPEndpoint(const IOAddress& address, const unsigned short port) :
-         asio_endpoint_placeholder_(
--            new boost::asio::ip::udp::endpoint(boost::asio::ip::address::from_string(address.toText()),
-+            new boost::asio::ip::udp::endpoint(boost::asio::ip::make_address(address.toText()),
-                               port)),
-         asio_endpoint_(*asio_endpoint_placeholder_)
-     {}
-diff --git a/src/lib/asiolink/unix_domain_socket.cc b/src/lib/asiolink/unix_domain_socket.cc
-index f43e1c9..43ff3c8 100644
---- a/src/lib/asiolink/unix_domain_socket.cc
-+++ b/src/lib/asiolink/unix_domain_socket.cc
-@@ -83,7 +83,7 @@ public:
-     /// @param buffer Buffers holding the data to be sent.
-     /// @param handler User supplied callback to be invoked when data have
-     /// been sent or sending error is signalled.
--    void doSend(const boost::asio::const_buffers_1& buffer,
-+    void doSend(const boost::asio::const_buffer& buffer,
-                 const UnixDomainSocket::Handler& handler);
- 
- 
-@@ -103,7 +103,7 @@ public:
-     /// @param ec Error code returned as a result of sending the data.
-     /// @param length Length of the data sent.
-     void sendHandler(const UnixDomainSocket::Handler& remote_handler,
--                     const boost::asio::const_buffers_1& buffer,
-+                     const boost::asio::const_buffer& buffer,
-                      const boost::system::error_code& ec,
-                      size_t length);
- 
-@@ -127,7 +127,7 @@ public:
-     /// @param buffer A buffer into which the data should be received.
-     /// @param handler User supplied callback invoked when data have been
-     /// received on an error is signalled.
--    void doReceive(const boost::asio::mutable_buffers_1& buffer,
-+    void doReceive(const boost::asio::mutable_buffer& buffer,
-                    const UnixDomainSocket::Handler& handler);
- 
-     /// @brief Local handler invoked as a result of asynchronous receive.
-@@ -146,7 +146,7 @@ public:
-     /// @param ec Error code returned as a result of asynchronous receive.
-     /// @param length Size of the received data.
-     void receiveHandler(const UnixDomainSocket::Handler& remote_handler,
--                        const boost::asio::mutable_buffers_1& buffer,
-+                        const boost::asio::mutable_buffer& buffer,
-                         const boost::system::error_code& ec,
-                         size_t length);
- 
-@@ -197,7 +197,7 @@ UnixDomainSocketImpl::asyncSend(const void* data, const size_t length,
- }
- 
- void
--UnixDomainSocketImpl::doSend(const boost::asio::const_buffers_1& buffer,
-+UnixDomainSocketImpl::doSend(const boost::asio::const_buffer& buffer,
-                              const UnixDomainSocket::Handler& handler) {
-     auto local_handler = std::bind(&UnixDomainSocketImpl::sendHandler,
-                                    shared_from_this(),
-@@ -207,7 +207,7 @@ UnixDomainSocketImpl::doSend(const boost::asio::const_buffers_1& buffer,
- 
- void
- UnixDomainSocketImpl::sendHandler(const UnixDomainSocket::Handler& remote_handler,
--                                  const boost::asio::const_buffers_1& buffer,
-+                                  const boost::asio::const_buffer& buffer,
-                                   const boost::system::error_code& ec,
-                                   size_t length) {
-     // The asynchronous send may return EWOULDBLOCK or EAGAIN on some
-@@ -230,7 +230,7 @@ UnixDomainSocketImpl::asyncReceive(void* data, const size_t length,
- }
- 
- void
--UnixDomainSocketImpl::doReceive(const boost::asio::mutable_buffers_1& buffer,
-+UnixDomainSocketImpl::doReceive(const boost::asio::mutable_buffer& buffer,
-                                 const UnixDomainSocket::Handler& handler) {
-     auto local_handler = std::bind(&UnixDomainSocketImpl::receiveHandler,
-                                    shared_from_this(),
-@@ -240,7 +240,7 @@ UnixDomainSocketImpl::doReceive(const boost::asio::mutable_buffers_1& buffer,
- 
- void
- UnixDomainSocketImpl::receiveHandler(const UnixDomainSocket::Handler& remote_handler,
--                                     const boost::asio::mutable_buffers_1& buffer,
-+                                     const boost::asio::mutable_buffer& buffer,
-                                      const boost::system::error_code& ec,
-                                      size_t length) {
-     // The asynchronous receive may return EWOULDBLOCK or EAGAIN on some
-diff --git a/src/lib/dhcp/iface_mgr.cc b/src/lib/dhcp/iface_mgr.cc
-index 01a1d63..419268b 100644
---- a/src/lib/dhcp/iface_mgr.cc
-+++ b/src/lib/dhcp/iface_mgr.cc
-@@ -1034,7 +1034,7 @@ IfaceMgr::getLocalAddress(const IOAddress& remote_addr, const uint16_t port) {
-     }
- 
-     // Create socket that will be used to connect to remote endpoint.
--    boost::asio::io_service io_service;
-+    boost::asio::io_context io_service;
-     boost::asio::ip::udp::socket sock(io_service);
- 
-     boost::system::error_code err_code;
diff --git a/meta/recipes-connectivity/kea/files/0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch b/meta/recipes-connectivity/kea/files/0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch
deleted file mode 100644
index a24a25f1c9..0000000000
--- a/meta/recipes-connectivity/kea/files/0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From b5f6cc6b3a2b2c35c9b9bb856861c502771079cc Mon Sep 17 00:00:00 2001
-From: Dimitry Andric <dimitry@unified-streaming.com>
-Date: Wed, 28 Aug 2024 22:32:44 +0200
-Subject: [PATCH 2/2] Fix unittests: * Typo in `Name::Name`: append to
- `ndata_`, not `ndata` * In `Name::split`, use the correct iterators for
- assigning
-
-Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2410]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/dns/name.cc | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/lib/dns/name.cc b/src/lib/dns/name.cc
-index 085229b..47d9b8f 100644
---- a/src/lib/dns/name.cc
-+++ b/src/lib/dns/name.cc
-@@ -347,7 +347,7 @@ Name::Name(const char* namedata, size_t data_len, const Name* origin,
-         // Drop the last character of the data (the \0) and append a copy of
-         // the origin's data
-         ndata_.erase(ndata_.end() - 1);
--        ndata_.insert(ndata.end(), origin->ndata_.begin(), origin->ndata_.end());
-+        ndata_.insert(ndata_.end(), origin->ndata_.begin(), origin->ndata_.end());
- 
-         // Do a similar thing with offsets. However, we need to move them
-         // so they point after the prefix we parsed before.
-@@ -662,7 +662,8 @@ Name::split(const unsigned int first, const unsigned int n) const {
-     // original name, and append the trailing dot explicitly.
-     //
-     retname.ndata_.reserve(retname.offsets_.back() + 1);
--    retname.ndata_.assign(ndata_.data() + offsets_[first], ndata_.data() + retname.offsets_.back());
-+    auto it = ndata_.data() + offsets_[first];
-+    retname.ndata_.assign(it, it + retname.offsets_.back());
-     retname.ndata_.push_back(0);
- 
-     retname.length_ = retname.ndata_.size();
diff --git a/meta/recipes-connectivity/kea/kea_2.6.1.bb b/meta/recipes-connectivity/kea/kea_2.6.3.bb
similarity index 87%
rename from meta/recipes-connectivity/kea/kea_2.6.1.bb
rename to meta/recipes-connectivity/kea/kea_2.6.3.bb
index ff7fb51fe0..45e98e516f 100644
--- a/meta/recipes-connectivity/kea/kea_2.6.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.6.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=618093ea9de92c70a115268c1d53421f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ee16e7280a6cf2a1487717faf33190dc"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -17,13 +17,9 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix-multilib-conflict.patch \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
-           file://0001-Replace-Name-NameString-with-vector-of-uint8_t.patch \
-           file://0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch \
-           file://0001-Update-asiolink-for-boost-1.87.patch \
            file://0001-make-kea-environment-available-to-lfc.patch \
-           file://0001-Avoid-assert-on-empty-packet.patch \
            "
-SRC_URI[sha256sum] = "d2ce14a91c2e248ad2876e29152d647bcc5e433bc68dafad0ee96ec166fcfad1"
+SRC_URI[sha256sum] = "00241a5955ffd3d215a2c098c4527f9d7f4b203188b276f9a36250dd3d9dd612"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.34.1


