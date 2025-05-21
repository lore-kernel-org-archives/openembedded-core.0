Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF0EC3ABC9
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 12:00:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9441.1747828834255447516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 05:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7236ba3e52=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L6voWr008810
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 05:00:33 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfs99uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 05:00:33 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54LC0DnM007827
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 05:00:13 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfs99uh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 05:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptG/eb9CEMyKoN9FbPFyp9/evjlIqBBJFx2xZqNFsa72X1H5WAvVNgQj2MKYmOSZq/rX6OE9qQv0ewUFUMGmEs/zZS4HIUu+nhxNG/EhfBQFAf8h9biDp2boa9mW7Mss6knjovvKN2P0bMF6vzcIV6wUUNwlqc9RPsknK1tuCZvL2OT3rDGOv9S9/reg1jAYclkwuilyQrSDDu5DeAYYylNFsLyvKN5SxS9hsM4R75Fajm96jc3aFfKXklKaqiu6YaXpyeP4yUtP7zG+BW3c50w0DS3DgNA8GzfSTWaTuGIrMTXJCoPEU2rdRcfqNyEoZkoSc6cbovOlW4ZjwQaqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulic7N1mDfLG6MtIs7t4mQAXRiLpIMZMUloLNyPM6uM=;
 b=iAnhB8l7EMlV7OKwt4X96vPCOY6Zg87CuJZ7DJXplkglPfUYMp0bgckTkKN6gFdFO4/EKCa92wouSMNZ29INfTUqXqU7n0ImsIH+9rQp/A9/62wIq14NomcxhArqsXGAGiy63Agva//8XcwWhOXS81Or671jYruopFkVmNuGLuiJb+Vo2EWgZ5VtrMAUcwpg07fIFZ+w3mSr9sszp4VCdIrqWHbQlWcEam+9WphVcBU/VC1f0U4xcf5KDhNkChidZnokLqnxlxzs32sVCQcLZVEgrzrFRa2Wx1eeC+P9CKaP4eCLPa6c/ZtmuieeGvlZrM3oFmOEbyCuUyIUiC4bgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by MW3PR11MB4747.namprd11.prod.outlook.com (2603:10b6:303:2f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 12:00:10 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 12:00:10 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, steve@sakoman.com
Subject: [kirkstone][PATCH v2] gcc: AArch64 - Fix strict-align cpymem/setmem
Date: Wed, 21 May 2025 04:59:45 -0700
Message-Id: <20250521115945.3629052-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:610:e6::13) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|MW3PR11MB4747:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f91e561-8973-44d5-ff2e-08dd985f093e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4Khu6QzUU3idWJLqjZwLx4wlJLoAacasci+88lhV3JXDvOHgTlPfP6NWIKfu?=
 =?us-ascii?Q?Pf1XVMAw8SiRMxT7IWyyBE3Gr9Ni6s2SLOWFgdAlf6NExI2HndHPZmZ8EAOe?=
 =?us-ascii?Q?nSKliWcPwuhahthYo+Fucli6OTpayb4wuRDInRzHk6Z+5mBabE/edHU0ADgw?=
 =?us-ascii?Q?bKLHoE9KCNlz5mQ4ntjmUKmegJ245meLiw6LcAvbu/RgfGSoiNfZ/2ejqCYF?=
 =?us-ascii?Q?YMb5/F/Gr9bs+VMGi4WY4yZC1zOypGBiqSbtaVONWx90vv55Ymx7myAXI9/R?=
 =?us-ascii?Q?dO1Ynla3qEaAcoZMka8nGrB9EfSMY9pN4V0mB2w5vQ9A1wNhBjTNtNCPbkvY?=
 =?us-ascii?Q?3RRvv9gzn1hAUDUW791A2RZUICvOFmLHDJRQBxumBQdthKpFsdl9GVyDnett?=
 =?us-ascii?Q?D0YRjycf+R6Vh041yv1gRs/yIBeV5m2lcGTx4ScQgptHnkYcGwodFtdbnBeQ?=
 =?us-ascii?Q?8VVnnk++E7YE5eRpHFDcs63DankWt46r4O1xyDDjsMt15+klnB2mPSKRZ7/u?=
 =?us-ascii?Q?cZcssU5QpLImkga81IlB9sD+KPPlIwPx/MmifUnOuqVRjWSFjGWkjFgzt+L/?=
 =?us-ascii?Q?TV2oPT3jFQRkZZ86+bqWAnZYuX1dZ/c5oox1pjmJLLHTz3NEVp8Y/2nG6KXW?=
 =?us-ascii?Q?9u8KWsN8V+sn3zatAjnq4RVI4Li9JjZb/hdo/BxRFwp1X/vax6uZKUG3CZZH?=
 =?us-ascii?Q?0XXH8pkwoZ7tY5Hb3qywpKoAAZijSNx02bvxjAKEpdjXeAS1S/A2Y6nxipKu?=
 =?us-ascii?Q?PRAsOH/Kxj5g47zNMfbe65JRAYLb7X3ACNQ/3A/vngRWWVqG45y/Vo+DqYla?=
 =?us-ascii?Q?erMpgxnkVpylzSi+XeubqjhOapTRtt1Lg5oAR+0Ki837I+OWGkV4fqgNc+qa?=
 =?us-ascii?Q?UjYf/UFtiKAtNa5WXjG4XCIDq8QmvnNt4HLtMNA4rIesjUsJ7UPVtahESAaf?=
 =?us-ascii?Q?JoAqHNKvkIsUqo2EZHYFG7wv6BvDvT5iNOLdaCRwYK9NOro83oW+NViSk0qD?=
 =?us-ascii?Q?AJ2n0H4V1Uyf66Gwex/ZJBIZB99Qf+hHM9eFV3T0kQRxffp8X0BsaF5rOXKR?=
 =?us-ascii?Q?kZfNdtNy9zP5BFolrhts3taZpifkzdBY/34SywOpPZnW2UW680INu7ZBr5NR?=
 =?us-ascii?Q?Ex7Zu5RTX6LIytVNn1gfm644KLpVRfPToMImA960iDjm/e/tQLk+uN7UUcvW?=
 =?us-ascii?Q?JYTrWpsS/h6I/rTGRzv47iucp98EKsC7Kct8255gsI9QfsKAJG+ALVfKmFNS?=
 =?us-ascii?Q?WK8CTyrvT9MmrkI22c1auYipVJND0oSoYgqletOPprmLQ9tnMVwUjNoaLz10?=
 =?us-ascii?Q?lFzGIqASz409pBf4VVrnPMzLXKKevBTVYvXm2jA4RK8R/xIby3TFZA/FB3PA?=
 =?us-ascii?Q?PTIgGZ0Mf77SciZ6JjinO/rEKvPkX5B82U5uz1cPLwWWlhunYLFlblSL/KSi?=
 =?us-ascii?Q?n044vwJoxqc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5A+KIryr5l456TDBesk9/ObusIaoikICCVMZuOCLpP6UuXl6oHQHBQhW0o63?=
 =?us-ascii?Q?7fanZ1moJpE55reVHEKJ0iSRv4q0+OqEFcOrKTBJKtHH8HeGQQFoNzUtms6D?=
 =?us-ascii?Q?jsPYyyYl+CGIrHwOW1SH+LoDp5UHpaRoFwlFQG1f7RTjKGiJq/SPmRCC64nX?=
 =?us-ascii?Q?Uq9NEmfi46ahT8+FfThYQTK5ZdbfZzsTaPl2seQXQYnolXo1AU3oQdKHGScA?=
 =?us-ascii?Q?khwgRCKHuMym6p4JOxgvStqrIDCzX2xTIvOdMqsJmTVfv7/VO9u5UyINM75Q?=
 =?us-ascii?Q?fW3YCwYeMMWWO04OAs1CLn/KARj4IFwtA3lJPTdyG8k/bNLuA4i8GxVeDuhw?=
 =?us-ascii?Q?1fNHE5SfonfOHpynZl973ScZRZFEMxAJ8koGKYMvVeogjFndrzNIonW88UJb?=
 =?us-ascii?Q?+y473PsZIvnvnb5+A5mZoNqkeCCZKm21nAj2Qg9t0tu6L/HArLxUchn+ncw2?=
 =?us-ascii?Q?uqFwKpodH0fKtmBAxtrarNVoLSkHupeU42TdUIgrXNhqIX9zsQWtFiCdKRW/?=
 =?us-ascii?Q?yobIdF1qKOjB1iAhbLd0OutwGsznUQsVqQgck2oX4E3I3MIvXs0CzQ4F+Oy+?=
 =?us-ascii?Q?1yT2YePz9D2C+vg3/VFxSWoacVQLX1JMjmSmOl31xcubekPsncA2MAqk7e4v?=
 =?us-ascii?Q?FS9aHMbZRbZwPYPLJSAF8JbcwIwxKakmF66khV+M1rW6o7gGpJM/mTTxRW25?=
 =?us-ascii?Q?Vep30KGf8MkZxulvXa3LIetdkS1bRkYEaxImfDTRn3nLLj8xr+xI4pABYgb+?=
 =?us-ascii?Q?fIiBSTGd4hIsuwqKqkA5C8BKc41dGT+9RRjSx5HFVPNUBJN/6iZhGbQ02djY?=
 =?us-ascii?Q?QiJ9lD7oMNnXX7Uf/W55iYeL9361tIn1GnIkXmP6BRP1dL35B7Ykz7EXQbO5?=
 =?us-ascii?Q?/solD1omJ6uZl+vBzZjieVWGO3FEpIWRS9K0w6N85H+txhcsuk6Lj3t77Hx1?=
 =?us-ascii?Q?AN/eEGiw/mXuBfqAOKmYU97E10NUeVoeiUv9hDjotEXyeKwB1l3dvU02oUfc?=
 =?us-ascii?Q?eVyXT7ABhVbWlIY+NHYXcvF7CWqNYU3sLg+S1nq0lCsP2DRgYLw0FDA6qD4u?=
 =?us-ascii?Q?6TxUHw+J7nStKRWcboq6X5aUWlp1SrOA1hAtZ4AH7XWb7IeY8u/e8BDEvv3t?=
 =?us-ascii?Q?9K5tlN4tW1sCq59yL7uFbLQEXIcSIM3PSI+Q+aiaM32Og0ftyC5QQWedjpp5?=
 =?us-ascii?Q?0LqGPRyW6BS2D3EEsAsrT2zXbaxtoJxpwsYaBEYTo0KAL5db38y/QOUP0fIK?=
 =?us-ascii?Q?QpKYP6qRcagDRDq4wj2jqrmL9dG6GTKXAbf5sOx1ZRiie0A9XFBSoxryeOib?=
 =?us-ascii?Q?/IlTBRTPQXSHOBiV+kk8F0r6An3RvGcHj1uUSQWzinH87X3xvj7rZmvZKFlw?=
 =?us-ascii?Q?D56/uUCmSAvRSZ4wA43si1wvYT49r4S86XAHa6N52t9n8SFLM/OoJcb6Gdpu?=
 =?us-ascii?Q?n/x75sb6LqeXO7jPhT8QhdoMWDnRoB4R9zlCEAtTs1BSvL+ZCGX4A3Y6HBhT?=
 =?us-ascii?Q?fBJNYxq1s9b51AD4T5VxggjaCArDqZTOAQUWGHzb96a9KrQic0a3aJ/3hyHo?=
 =?us-ascii?Q?W4J1oUJCI6HzbdqwmMAK/Hw2zEPOeeRiuDQPAPHBkemHZp6vi8PYX4K4mZX9?=
 =?us-ascii?Q?PQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f91e561-8973-44d5-ff2e-08dd985f093e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 12:00:10.3193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Guf/ABP0OqdeDmV9686ZMznN1UJSntbTXuhsKychHLk6snWPQazpudXJfh6K67aCrt702CMMLKbKrbY4EiX7eiWflD/rNLKTg7Em3XNSjLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4747
X-Proofpoint-GUID: -dz73uZYbk3B60TIM60Flxs4umPLQVDx
X-Proofpoint-ORIG-GUID: 5H3SsgBB-TWC8TBa4i2qv84l7LM62YZi
X-Authority-Analysis: v=2.4 cv=KJNaDEFo c=1 sm=1 tr=0 ts=682dc061 cx=c_pps a=smr7v+wKk2SgYJk0SwJNKg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=L9uzE61KTqSsj0ZRaLQA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDExOSBTYWx0ZWRfXyvLhvzja0GeE qCN+qkeTf2smGUXCwexoQxXsSCwaHl7C64vg+JHyWdZV//2VYf/6o/NNki3iWGhBQ2Q2dPZST4q z/OBkS4c+CQq3IidScWmVQrya63NZq8hJlT7s9r3ZZltxttDvqSuV0wvRn2zRMAZ1+1wydRzlB4
 CHwKbiPZLLWL1dnLXJ4/U8eNqd02YFpILexx3fpIoKmJcGzC1zeiFLCz2lPPRb+j4QKJFIax+sf 1VH/r3R3yAkAGY4Q2EjoQDvktJ786Hkfd9VFkBbt2Fn0fNoRRLrpbclwgoSYmdebfDowCUeaOGd PqiqS0Qhj0wf9rNI7w5ncJUbKGAq6jC+W7PqDmA9jhBCdKZ23DL+Ekt1Sn3amWyPQe9rjYmoBQi
 javRvUB6r61CpMUCq944tTPJGj9IEZlL4nRsD3QjgIwskwTRVzPFLtZu4E6ziHN7FfGZ7ovO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=959 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 12:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217022

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

The cpymemdi/setmemdi implementation doesn't fully support strict alignment.
Block the expansion if the alignment is less than 16 with STRICT_ALIGNMENT.
Clean up the condition when to use MOPS. (PR103100)

This patch includes only the alignment-related changes in the aarch64.c file.
Changes to aarch64.md were skipped due to non-essential impact and potential incompatibility.
All changes and outputs have been verified by the author.

Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=b9d16d8361a9e3a82a2f21e759e760d235d43322]

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-11.5.inc        |  1 +
 ...rch64-fix-strict-align-cpymem-setmem.patch | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.5.inc b/meta/recipes-devtools/gcc/gcc-11.5.inc
index f17ec9da5c..1e8371b2bd 100644
--- a/meta/recipes-devtools/gcc/gcc-11.5.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.5.inc
@@ -60,6 +60,7 @@ SRC_URI = "\
            file://0029-Fix-install-path-of-linux64.h.patch \
            file://0030-rust-recursion-limit.patch \
            file://0031-gcc-sanitizers-fix.patch \
+           file://0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch \
            file://0001-CVE-2021-42574.patch \
            file://0002-CVE-2021-42574.patch \
            file://0003-CVE-2021-42574.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch
new file mode 100644
index 0000000000..4c2d827799
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch
@@ -0,0 +1,45 @@
+gcc: AArch64 - Fix strict-align cpymem/setmem
+
+The cpymemdi/setmemdi implementation doesn't fully support strict alignment.
+Block the expansion if the alignment is less than 16 with STRICT_ALIGNMENT.
+Clean up the condition when to use MOPS.
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=b9d16d8361a9e3a82a2f21e759e760d235d43322]
+
+Signed-off-by: Wilco Dijkstra <wilco.dijkstra@arm.com>
+Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
+---
+--- a/gcc/config/aarch64/aarch64.c	2025-05-08 20:40:10.969865898 -0700
++++ b/gcc/config/aarch64/aarch64.c	2025-05-13 23:11:07.006796627 -0700
+@@ -23621,14 +23621,15 @@
+   int mode_bits;
+   rtx dst = operands[0];
+   rtx src = operands[1];
++  unsigned align = UINTVAL (operands[3]);
+   rtx base;
+   machine_mode cur_mode = BLKmode;
+ 
+   /* Only expand fixed-size copies.  */
+-  if (!CONST_INT_P (operands[2]))
++  if (!CONST_INT_P (operands[2]) || (STRICT_ALIGNMENT && align < 16))
+     return false;
+ 
+-  unsigned HOST_WIDE_INT size = INTVAL (operands[2]);
++  unsigned HOST_WIDE_INT size = UINTVAL (operands[2]);
+ 
+   /* Inline up to 256 bytes when optimizing for speed.  */
+   unsigned HOST_WIDE_INT max_copy_size = 256;
+@@ -23750,11 +23751,12 @@
+   unsigned HOST_WIDE_INT len;
+   rtx dst = operands[0];
+   rtx val = operands[2], src;
++  unsigned align = UINTVAL (operands[3]);
+   rtx base;
+   machine_mode cur_mode = BLKmode, next_mode;
+ 
+   /* We can't do anything smart if the amount to copy is not constant.  */
+-  if (!CONST_INT_P (operands[1]))
++  if (!CONST_INT_P (operands[1]) || (STRICT_ALIGNMENT && align < 16))
+     return false;
+ 
+   bool speed_p = !optimize_function_for_size_p (cfun);
-- 
2.35.5


