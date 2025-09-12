Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0D6CA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 08:14:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10918.1757664855107094864
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 01:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GXVRGYGU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1350ab43ad=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C87qq41821082
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 01:14:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=btuJZvM/oeR06hC9DM6k
	g2LGI/eBU7/EvRnYZGwsZhQ=; b=GXVRGYGUjDOi8fQ0KMAUJGMjEwt0TuuAc/Kd
	Ld9oGTDmiYr845z2j0jZFH2EOrjXNu3LQdgAM25nOJrRvv+ZPPkUsCYzNd9v/HMJ
	iqAIphz5GwG8BwFcxgHvwf6g+8H8TPR6AZJ23uy8a+1xBCUhz5pgnAYVRyBpqziV
	xvyk5mcDqi7CmiIQUtY8zA7LrK2OfklKfZ6EgzqwDBMIZ1w4wH+z2apCajdkjZ1A
	YPxbro938MQK1MfZ8rSjsYeRhrSwkkAn4LeA4Qj3QISaz0a4tTJ3E7T7KHB130ap
	pbL79vw3wdgEIuhK4SVR83mevRbDGb8HMNtkwzTilUgIa6TInA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490g80f4s8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 01:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfE50+DvkHTYgK3CWxXkMJZCNYaTLodJOwnoTS66sjLsOMBtxf7NkJnOCmeUSf/gb/TWS5v4SY7DGGEbsk6UU1EVSF390VISvOozNSc+uAnxV19YQvg6q4m/HYhhXfdT447Cuh9O6RB4BsdXRHzxd3Mugt00Q32cFcxmRQQJNhrUHn+/4AQiRwSHETSNVXmWUbu9RQwEr1+p3liF23/zGrAf9No5QyEB92RYNqHS0FM1H9W0Hp3FrDW8GKBaiXjU6S6cSKvR5nUKdnKcJS9VLX8zUa6L6sTK7uh0YlLqtKB2l8dsU2E50uRL5Gsrt9ntXU2hqQyIVZV8A9vv7SanOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btuJZvM/oeR06hC9DM6kg2LGI/eBU7/EvRnYZGwsZhQ=;
 b=fZkGrCRosWJusruOfQOQsnrsRRmeIxOAFo5UbZ83EL4mbzjMUsm+sxnNuTcS0dUbAllua+HPHsxa1ChGnN7+Q/BUFHrZMWYvVATP57SygodeAK5SqQK9bUL3hYdm1hZ+gDeqH8zhRYE+LFaXxm3lHeSRknCnsvGGZmjw+VPZODrGKIPHw6vzAbGd89FZVmnUezmBodLVVOz80w1VxrTseFLkSPn9IEs4ExQ6pgTTC0D5yG+zcFM2W6nYUFlWE5LUxLamX9D1BBw8oSECdvnQ6h86ziMAPJXtsILisvLgy47dSXKZQ40nShZkbPCP2hVQPCYOxZKqZ3JqAS2cDglsMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by LV3PR11MB8696.namprd11.prod.outlook.com (2603:10b6:408:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 08:14:11 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 08:14:11 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] base.bbclass: remove unneeded bb.runqueue import
Date: Fri, 12 Sep 2025 16:13:54 +0800
Message-Id: <20250912081354.287380-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0122.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::11) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|LV3PR11MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: 28d03304-4c6a-48c5-31c7-08ddf1d45ad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NjHPuGfhG96ZHCnsaiQCCuUhKvR1fB++bGF2BTC/+4JlZ3I0yaOsvRuKwT1C?=
 =?us-ascii?Q?56SH9Zq9jPBGW7Ex1QrVCd30zLMiuYUs6OJpMN5VH9AfZqdCJAZRzrj7Kw9o?=
 =?us-ascii?Q?OnfsetO6nJHM0M8DE9D+gXMPehna/ibXcR1aFTLg9Fil85qIArZ5gZJbQNRz?=
 =?us-ascii?Q?27kFdESQq43BDAmZz/3D4EsGze4nJL04Pr/b2drLHMVdfGl2IEdM/qPOegL5?=
 =?us-ascii?Q?c+IuM7iaBB9SMgWG2hcIp7nBFj6yequYOXFaccSPnFexH5lbA8beeHn1RrGu?=
 =?us-ascii?Q?QjxbamVRpkiS23PHYEnOxwHEXiQ9zJLQTVE0hTrxYfYKziLbFFnQ5SR+Po/8?=
 =?us-ascii?Q?il9tYdc3nJgwYn6n5wP7zXcvx6sKwxIe5hrxCix5j/T6Aq0rHJCzagYANTks?=
 =?us-ascii?Q?ldMVyRJ/D00tWfZw06gwXkCZLS8vZ0axvZRGVBZrg0g1BHFgBeg6Sri8I0FL?=
 =?us-ascii?Q?hI2gI1nvkG++zpaaPpDdEHFJS8msqquSEMi6TNj6CLEu3Pu+hEocZqtlBUP1?=
 =?us-ascii?Q?DjGJ5m4YHwMsyAR03uCCGlsAZrJe3lOaw/RPtZgPlX4EGvPnR4a9+DzYd0am?=
 =?us-ascii?Q?KCxxaZvUNMpmCzIVbS//TbZ6E9td6Lx6MizATKDmHvpSXPFCSFlUkxGR6fQj?=
 =?us-ascii?Q?uBASrvsj7Rzzny/OKHwGvm0eqRF2mF3MOxdM2dcedx5YZoos4dugWdy3xDH2?=
 =?us-ascii?Q?XfVu0Wr+cw/YDBOfo9G4aRC66mnMbCyIyAvu04Sy/W2yJlcxuFFclw3H+470?=
 =?us-ascii?Q?IYPY7109zAXy8wBFLSuJ2jOsfua6co0i8X3d3Dbdo9g/IXSfWOHr12/KT4xn?=
 =?us-ascii?Q?izfa9nQXcHygqRUP35bHi26eOiOiGgGZ4eFOWdEyMH80AsCogvnAcnK53ms2?=
 =?us-ascii?Q?0WeABdhgQq/qP+5Pxw3Rcw6OiWfyG+OoJZuhKjodFtFUPgUycgzEJO1d5P9R?=
 =?us-ascii?Q?l6w2dbX3Aj8FeARVqqNtCtuv2ql4nyWaZK8ZCzhkR6CjN9bkWmspkwI6wj+c?=
 =?us-ascii?Q?Nss0CtsKG131jBmhMW3UNP4k5viWDr2OFFhNzIPjZ8lzS3ie590O8PFq++1W?=
 =?us-ascii?Q?1ciDnLbCsWg68QjFxP9LK+eDqRlxaz8BobW4U2G7t1T6hUMSPSX/6VLEcRSy?=
 =?us-ascii?Q?lk/V9ABl1dJNmkJaTPpuTxry60oLEi0xmhbXlOzD30VwtPlDCq6juQmRONPN?=
 =?us-ascii?Q?tCYrbAaX+msGN5CxqZVtfoq0liR720EeLkoXe+XBaUVyb6htK/ggHgRMgYhj?=
 =?us-ascii?Q?p1n0CpSDPGxl8gmZyo8wJzGmvYLsB5ZlqEOaaadtD26H6KhQBRcZgnFXoRAa?=
 =?us-ascii?Q?G2vvKGK1CoOqYiVefE3uB1m625vfZV4K7idpJhqu5UOVCjIcoRgCqhrn+CFc?=
 =?us-ascii?Q?pNyJsJ+gnV0DoF5XNkBm/EM8cue18cqZo6oUSGvma5se6gZeZX3nZJMZYa8Y?=
 =?us-ascii?Q?KjJX548x8bilKVQ/OOLFGoMG19ncgKVUwHEFpRDnA7bd9Kg0jpdRRElWfWpD?=
 =?us-ascii?Q?X9MPUuAKWbkohOc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bHVWCftRlELWqTtmgXG8pBSRlH4iTyFC6liobj49e2QA8lAf3dgeDX9HwCy/?=
 =?us-ascii?Q?NPXe7RzR0KFxePg/Jdpc6qefRBjZE83lWkt1y9lv9HIoBXMErTHB4dx3O7Np?=
 =?us-ascii?Q?zhwmP/EofhdZ80JjwCoyB5IXtnY2LJrXbSUWjjvIFE3yx2l98TTOSjJBnnio?=
 =?us-ascii?Q?NoKVeU5brV5zThPGnf6cNqgz5NRhmyu7mg7CgNGk3i7BC1USHXcR/oJvekO0?=
 =?us-ascii?Q?z3v5FD1sGhVZw9ocRKOd+Rq/3dwoqLofphpHocAzBBd2P8PchpNjaMID0r3d?=
 =?us-ascii?Q?k9QREWUqGPIAWRcKejNMmOKBmdKMEDN/XQIe35xs47GwWm+3UCRsscrx0IMf?=
 =?us-ascii?Q?xctb3pgzaLgGpDp1eT1zKeHF4Ha197y1xB/uku1ablA7cs32/ar2Y1x5cF4f?=
 =?us-ascii?Q?DtMCo934ymmJvgM90PoH+OM6QemxXh5NL/5/UJmMnG29XgbPyEY/MpzxHE45?=
 =?us-ascii?Q?Hal+4np9zITwILNKtAFi1xcvdymTHXMmQ+AzTS6a5H6kB+bUukajKR45tt0p?=
 =?us-ascii?Q?cY1gkoy2bLEIz/3mBxA2Pfoe/t6ZT3oVefUitoqT4UG2cROxhsGT9HP4Fq5p?=
 =?us-ascii?Q?iQum2+34Sm3xHyvP+813ULUpfSpFG/xjsQYeB5yizEVXQH6pf7wiLATnPOJF?=
 =?us-ascii?Q?lr9UPd5m9uC07OeA7Loow56PFNTgG8veW60jfPr52wEnq9OJ6QaDqkEh9V+3?=
 =?us-ascii?Q?i91WKRDTwvl/+pRCpnylz7v/n2HXslfjgjuWGRaD9jVV4wq+yUwr4uFUJYnN?=
 =?us-ascii?Q?Nvz0UvY9isZwsUZQ0i7KNL4FfYPWAk+OuOyttHex/GK0ndq1nxyRYFV4LNkY?=
 =?us-ascii?Q?SHWSq1SakgNxuSEqmvfAdNY3vbD1TZDtuXRdI0tUkwUmVetKKAU7dw3Fv4Zr?=
 =?us-ascii?Q?ZtQTCH6/4GPoCRr7kJ1jjfS4KdeksM42D+ALo0c1IChlcLjt+lnCwhBCyHvC?=
 =?us-ascii?Q?IU+WQSTjixE43aGDXHOFsPMMdOAoELOlaQF9WY737oh+Xy7ovkE8bCd7kJTR?=
 =?us-ascii?Q?vyUIcVQ6NSerFAtjIlL6N9x8v11jIzBwMARzIEVaiVSBCkLA1ZO3jqGfsD5B?=
 =?us-ascii?Q?Hcps0FbZ6k4u4ZR5mq+8/R9zBxcUpPhHaZr/K56USO9pphWiuxhsl3LJjVng?=
 =?us-ascii?Q?Y4u/m0nAaNmkhA0NFVPreTPFLRpn2Zfi11xgGOUpmVrd12zVB13CpxV7RbG4?=
 =?us-ascii?Q?wRm9nHGypOr2zebrqF7dLboaDjAynVzvOqo3uJJJAYrCNt1iCbqQoAVqaAEF?=
 =?us-ascii?Q?FO4mLZM7sxLTTn99jmrjkth7ajQMYkVzEPpjX1N8WA9K7aIHu4IELypQGOYs?=
 =?us-ascii?Q?/pCZPz2x9s2+hI4E/aIEa//59KAs1thSBoQa+V3EzgFhRv4BpDn2s79IA4Zo?=
 =?us-ascii?Q?xFJ7c3BTPdUVkyjxsv/3OBLPdWkWsChBdfHdZKWxEymSUXktoM5a3H/IdPlK?=
 =?us-ascii?Q?jE3tPB17/V7uv7twf03Joei1YfVVbo/rcXVOXovpva4+7eE5OV5DyYpSr9VZ?=
 =?us-ascii?Q?FZwt9TJM/GxJ9h7GhaYqigK3a1TuGzZ6EGnV+Bd/VG6uxmc684ZTvlTDKViw?=
 =?us-ascii?Q?Wqs7saFDjSBMCKf/1nqOxFvRnyPFsy2hyIcF2V8+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d03304-4c6a-48c5-31c7-08ddf1d45ad3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 08:14:11.8234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4jHyGIbmrCgr0iIiVnwLkoYoXzdsjAKMANU7QXHBDqbiX2SoZ18gvm6ZfRypHtDYkhP3cGlv1MFWoGSO6IzrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8696
X-Proofpoint-ORIG-GUID: kw5tpjcQi4jrBB7-9mNKqp2Z7CmtzG3K
X-Authority-Analysis: v=2.4 cv=RaOQC0tv c=1 sm=1 tr=0 ts=68c3d656 cx=c_pps
 a=7ZAoscB/WEXDM7TOYn+1yg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=CZwEzU7OpQJpkpGeFnoA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kw5tpjcQi4jrBB7-9mNKqp2Z7CmtzG3K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA3NiBTYWx0ZWRfXy7tNspNAtN6+
 40Pz6l4g/VLIYwXw/q4QH27RSCn0avcpzNNVY7xGU7iUmicN1N+ANXV4MCZu6eJ7OBBrYHSr9P3
 VjyB+93q7vPOfF6UMNJWpHOAhHtYJyMZ+u6/fI+PozG0dNwc67JqXnXcu+gloys7bvOxe/IwKLn
 eiaZ2DpSRLJBhDr+/a9TMWl9xn40Xfxx3/LDjzWWb5qsUBJ250KtoCJiyBrqaAjO3dt+E8Ff+nH
 hp/HsgpTiXLvpAYtoQCiXWXTZXpyFUZ3jFQge7RVYeLz9DTLizG7eULCGGuyA/tZ17FF8G6oyPS
 9KbZsghaNMka6f/Lv0XB+WFEXcgsCADyyMc+5buZ1pRhywbI1Yw5taEwanXlwU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 08:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223306

From: Chen Qi <Qi.Chen@windriver.com>

base.bbclass no longer uses bb.runqueue[1]. Remove the import.

[1] https://git.openembedded.org/openembedded-core/commit/?id=2af49716504f65be0cb01f609ea9bfa334926589

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-global/base.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 6be1f5c2df..6de17d1bb5 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -279,8 +279,6 @@ def buildcfg_neededvars(d):
 addhandler base_eventhandler
 base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.MultiConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise bb.event.RecipeParsed bb.event.RecipePreDeferredInherits"
 python base_eventhandler() {
-    import bb.runqueue
-
     if isinstance(e, bb.event.RecipePreDeferredInherits):
         # Use this to snoop on class extensions and set these up before the deferred inherits
         # are processed which allows overrides on conditional variables.
-- 
2.34.1


