Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90793C3ABA5
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 00:40:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6065.1745973601707223619
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 17:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7215e35ba1=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U0Vem0025048
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 00:40:00 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46b6uj05dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 00:40:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvYkxXBAfQ82SA1Ygjm+RVqCx7RwKLus2pKqgOfgjr2jpHm2HJjovXTQarxLbUcXPjf6aus5GudoSSw3VD1ByMHodyjGDBnwW/lshgPBOkASPH6OU0oFr1nXGt4PSoLSLvqkudfEjJvOCzq+YkHtWBqd/PzzhNRxJnY6cYTXUpZgKjAPRU2NuvaJjQJEr+G9UZCa2tMf5f06K7IbGRFZR7ykwkPTMG3d7oyJ57RDAFaJ8Ng51bZK97k2WdZ6PBNN5KQVZv5adHxtZAfTqQn0fO1kX8YQEvgjBu5BoAP37dQClEQ3yIer60ahCCVz6mghD32HTRamGevNSf65lC/xPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWx4aQFLXvJL3r1cMsFVxtYBeSqy6LrYj4mN0iNap4k=;
 b=BPg50JRa0rB41DDAE2i0HSsF6+lbcis5pz8pCwScpTjEEULQd6E5D6eumX4i3pZwn/OJfjHG+iwCViBuXkyCIz3d/FlHQt7DW4c8RULOOy5RZJkIVRThL6zsccageM/lSf/kgbhSfJ+Y3CCsG10hvJ9iq13BUjzNOQ+g2sGI00mzFou+vnkgmIa7bbcvWOgMBUyIzqDt1Ie0Aa5P2BdBtOS5k7dOh2I/3sP+IbGTPUUdo+2LpJ5HCe+ybGE5SEVV3gHOGQZgT3Mvmx1nUl6b32EGeqqC97BGmKaSBqIdYUyUejSQJV/4688I5SUFQf0iHTXR0l1kviwduF6H6uchnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB7681.namprd11.prod.outlook.com (2603:10b6:8:f0::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.31; Wed, 30 Apr 2025 00:39:58 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 00:39:58 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libmatchbox: fix version mismatch
Date: Wed, 30 Apr 2025 08:39:41 +0800
Message-Id: <20250430003941.561146-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::10) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d5c58ae-ce9b-49c0-18cd-08dd877f889f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8XfdlazcFMA1RiwMBh5rxkO85opUrONeJnsjePrwGj+exsnZeOi8RZDKZmuw?=
 =?us-ascii?Q?jIuQciBxf2DLlWwjZC84Yal5Ccqg03DF/fRgmwJRg5z5Zsc68Z4ZMps96Mav?=
 =?us-ascii?Q?p+9AkA6+r3ZZ09k/8HY64A4sDxW1dcteUstO1mAjkohXGOoiXtbRRjrb3Zns?=
 =?us-ascii?Q?+3hDcuMl4xX1bt9pR1k/WSyInTeF964IL5VwdxjulPk06si63/ahQeqH7zvx?=
 =?us-ascii?Q?L0LmepOyGtckFfpB8j8P7q/KAu4PN3ApKnCKnZsTs0XRNwpzN7h/uBjN7aNl?=
 =?us-ascii?Q?Yl129lIR9dHzdjI0ZZPJBbiislgB2NgO+BN/7Rj+IpBV5kJy9u1yHJaZmwRF?=
 =?us-ascii?Q?PdtDXy15vbZl4DqX/WILIUHe67VWw5XQQDQ+MqgXFBDzAkI2/0gR1Oao7xAK?=
 =?us-ascii?Q?vDSc4iLoeG0qp3yc97KfWtZcIBmJ6O1YPxHimf4REqgD+eLOxACIQxQ4YrIN?=
 =?us-ascii?Q?u700dgUHRrgzth9drBsivFqUTcQRBpvwkXojI7Z1Trk2Wf6aA2yaV51p1WlE?=
 =?us-ascii?Q?IYcd0XYK+wQKlx7i77TV1pAiOMdkat1n/K831c5UprU7mBp10cPJGZ1uKjxT?=
 =?us-ascii?Q?TYZK4nTxeLB14Ovzy3LBARBVRQkoZ2BsjOI+5s/k3Fhbm2UWBJSPlFDVu1qn?=
 =?us-ascii?Q?oSaKnMRYaVN5j3U8AciDIfmEuqZ877pj9GKUyZ2WS7+3OiC87kyMoMsN8Xp/?=
 =?us-ascii?Q?hI4YeXQeLlVxz/e+dOYDX95qomzBPaKmqLWcjAgsA17AzJmUXVxwbEOEchWt?=
 =?us-ascii?Q?DFmLJ2jMwJyMYP113/lRk3pSC0U4KW8FqyB6WsGNpxkhqaoIDaF+gVqRSiuN?=
 =?us-ascii?Q?uKZQvxSqvcxT2HfKhvatePkKlUbxLhvh0nh9YhLont8J1VnXYgaeb1P5knlB?=
 =?us-ascii?Q?4zLpkFTkzqxpRSCP9RRDenJfY3gfmDf5JOEt1MgS48OhoY8CIFWFARFvzsUC?=
 =?us-ascii?Q?p5w14fXs4MiUEYf1N3mJhBs/ktNsWWcdjNe2lRCtRNlj7THIK8S/IH8ELnOR?=
 =?us-ascii?Q?aCuF2apCDEKNzvNSWdWdlzIR2EFxz5Gs+ofYffMC/XHII2PHy5P8K4nzI3FK?=
 =?us-ascii?Q?IO4pChuEfptLHKl/WNc7T/1fIjqE0ioOq813h6iOf6KoF0ydsaxfrAwep9on?=
 =?us-ascii?Q?4OQlqhejDYwC6MaYx+ISlJDlMyjDk3wgLvRL/df82JpDy6VKduSU+dNEwgEB?=
 =?us-ascii?Q?rJKPx9Am6lUikJ7O2NYy2LT5OBj1BkzMHIoKi1V792RbM/sU7/K3K+JNadyv?=
 =?us-ascii?Q?m+V5bCfmFpMTaKtL7QX3TmAIxovJgXF86OVAXM2kv3z0z4fhwFYEATAmxvAS?=
 =?us-ascii?Q?EA+HJTh0/UaaLwdSwc5lsENPei7sIchXSp4dYeWkAdHKtzWVXFchq/p9imsC?=
 =?us-ascii?Q?8G8/QTNT2Jt91c1moVH5OMgX4J0cYlMlzfFERZo1YiIp/e1jbNq8qDzyI8ek?=
 =?us-ascii?Q?Jym4yy3i9c4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+4NbfBV30DVuemGdF7JV7ufYDk9BN/PGg6e8V0N+aIwS2sY7LrGXQ3rcIhHo?=
 =?us-ascii?Q?dNtH6VYHTcg8Kgz2o9O/Ylfg+5l97M7/cUR/KODYhCrq2BD1qpN1DCE/+XTG?=
 =?us-ascii?Q?HonAdRw1wO7g1HcIlogJMt0DOzfbET6/N8pp9cp0EX2MJ/uZMiENRZi4Os/r?=
 =?us-ascii?Q?V9VbOf1zZ6u4DQRDk4OQd8QEEW6hVyJ0MNjQBNy2r3lGZovMmFFj0Cqyy5cb?=
 =?us-ascii?Q?nzPQJmFFkyF6Z+cCvozhOWqfjpG7CNnRA2y0ezIUYXuPH3LSf7jM0DDTVKvi?=
 =?us-ascii?Q?ZYZ1gEOk7AyU4VLbIbNHt8Ix9YS0XF1I3D/WuEPfv5cHjdhhmkiEW1mCc2XX?=
 =?us-ascii?Q?AXbWbNqIt1qsruFYbG0cDoVIwRyv9zKCBcOGDk+4AzMufjOc2zJhZt6uiqf7?=
 =?us-ascii?Q?S+fgG4z4aohJ89YisrxREIwpj85/jq0LugyK3IYmxDYjM0uL2r7OVp5oiI64?=
 =?us-ascii?Q?kZUGcN3nxjQ+tPP1Zw3x17EITVaAalOlDvCYmRPsnHaL0G3p4zX87PdjPoal?=
 =?us-ascii?Q?w5a9CoHH3bVzFMd8TXA2HElbN1oONYHwW6GZvYtNsVSrsxpipoycVPHYfReo?=
 =?us-ascii?Q?jbg31sbymVfQbNTmzr259/jGjrY0weYEzTLK0x6Eg+rUJ4GaQQ7eTeUAE2JU?=
 =?us-ascii?Q?kxTHe3bddNBQWiLOm6Ynkhq03bqKLtwgZLqXf/JShPuhPqAoOcROQmiSe57o?=
 =?us-ascii?Q?c0MmKvkCJRjed7WRJsBRA6qf8D9iTqVYz0LHoSmNwaFLMeIK4F3SJudH7Rww?=
 =?us-ascii?Q?C6qizLUsBAb5nFszvSUFhXsbpEFz6LQjZ38kL2+PcHpEvIuYeWYJB72R2Tnf?=
 =?us-ascii?Q?muToMbyBi01r8lloW8DIswLWTMbsLUowFqOQQvaXaDoUNe+W2tYyFCzcNF4T?=
 =?us-ascii?Q?Z46vlzsQTUj2fcZsbxrMoLCW4sDlYNBZY31zKPFHqmulwakQz/LvB4vy4oGE?=
 =?us-ascii?Q?XLEhHeHrPPNqWR9TfGFnDK+InYsUU48G5D8GUM3EVQHyBjSokOrzkiTmHb0/?=
 =?us-ascii?Q?ib1xlGssCAo/1IV8yyBRlhl0B1R+S0d2HOQdzw2ky0z6V18OkRXx8CaHPit3?=
 =?us-ascii?Q?A5Ksc5xvFJfy1fqodUfXe3CPZcVb3eX1SZ7e4hzFFba8Q10NeXCUYI+kaqmD?=
 =?us-ascii?Q?qnhtAuoC9sb6PXJhqxkBc1cZARGEL331wfHRnqtItqz/eRtqgaVWmSI5gfX4?=
 =?us-ascii?Q?P3ugGaB9dpgquS7/wUQ9Acrx1J/VtQ2OTcvJ6OdV/qD8lqYnRR30vlS1WV1D?=
 =?us-ascii?Q?a6Gc5Iv6BWd4hHL1zI1dhT/I8T9nNm8b5pFxZTKw10xJoCAHVshNWM8orxer?=
 =?us-ascii?Q?W0QuoSesVXfYexzQJ9s+8Se5W3lnIMrORdFYKXGxjf1kRILRlda+bNaB65EM?=
 =?us-ascii?Q?iswDK2/do3/uCBeBjazhWq8Nv6XwSpGVGchW23veikd4kaKNReqik0rSl03G?=
 =?us-ascii?Q?1D7dDW5z99HowAb0QsbaSSQNJ9nrzisGJTAqvctlUoXjlP5UBa2bF9rfpI9Q?=
 =?us-ascii?Q?2FuIGEUs+JAOzfBifCVSsh4e6VIOih22q5uF/m9tEhbbkIs5FECCrWHz1f4j?=
 =?us-ascii?Q?bIWM4IovRDNTSb3JcjRJJ4VFVGMsNx/Rdqxqx8b3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5c58ae-ce9b-49c0-18cd-08dd877f889f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 00:39:58.1208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JougDseYxC+MuPlazRAjshLjKT/zgDQVYw2pgbsogtKMzDURgEArkC51WI2nLXBytFr2U0OFuFnq8G32k8s/Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7681
X-Authority-Analysis: v=2.4 cv=DZUXqutW c=1 sm=1 tr=0 ts=68117160 cx=c_pps a=oQ/SuO94mqEoePT5f2hFBg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=K6_vtReiS8PRVZByTIEA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: GjkUCFzTSgeMBLb7uoM5LG4V_0PkNnbS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDAwMiBTYWx0ZWRfX1l56TW4TuTQq RmE9LfoG2vB4VD/x2Mdrz/g9qQiu/mrzQt3jKOaskHuyNTY1w46gnxhWWL+BbDrHBFyy4kmd19z CJAfgiaMfZiNYGN19z1BiGkMWfG8E5ZXZAnzoc9wyqNNOBsicFi7upuD8phtZV4P5AMygr4DWVQ
 1L9mEj8f0rUVfU+Rb0rmbmQHoZ9di9fEQT3lNzLdlR72rdfzFQv9rICvndgJrdJrb7gf/8SdXLx xauzWNmv2urrY5sKR0NXt+iFy+3uprMyVtbnl3MubmBfmQsnOYPqBtoFT9EGlLQfcN4/ABRFwP4 w+rvL6r5p9Yo+MeEpKAggPoaA1LXgSrmgKPSDge6o6ONJkiE/W39o1c8bXsJjQ4q6BMcmfB4g5g
 bc6y6QNHDQhoh6qzxWxjqQnp61tvjQU4SgOehy1FVQolgNrNsjLGxsVyFufE+witNJIjatk5
X-Proofpoint-GUID: GjkUCFzTSgeMBLb7uoM5LG4V_0PkNnbS
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504300002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 00:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215690

Backport a patch to update version to 1.13 to match current version.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ate-version-to-match-the-tag-version.patch | 30 +++++++++++++++++++
 .../libmatchbox/libmatchbox_1.13.bb           |  3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/libmatchbox/files/0001-configure.ac-update-version-to-match-the-tag-version.patch

diff --git a/meta/recipes-graphics/libmatchbox/files/0001-configure.ac-update-version-to-match-the-tag-version.patch b/meta/recipes-graphics/libmatchbox/files/0001-configure.ac-update-version-to-match-the-tag-version.patch
new file mode 100644
index 0000000000..093adc89ae
--- /dev/null
+++ b/meta/recipes-graphics/libmatchbox/files/0001-configure.ac-update-version-to-match-the-tag-version.patch
@@ -0,0 +1,30 @@
+From 18a5c0969cdf2e6e2e20ad29e7b23c6fb58dcd6c Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@eng.windriver.com>
+Date: Tue, 29 Apr 2025 10:25:29 +0800
+Subject: [PATCH] configure.ac: update version to match the tag version
+
+Update version to 1.13 to match the current tag.
+
+Upstream-Status: Backport
+[https://git.yoctoproject.org/libmatchbox/commit/?id=18a5c0969cdf2e6e2e20ad29e7b23c6fb58dcd6c]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index ab9f60f..0ef4977 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,5 +1,5 @@
+ AC_PREREQ(2.53)
+-AC_INIT([libmatchbox], 1.12, [yocto@yoctoproject.org])
++AC_INIT([libmatchbox], 1.13, [yocto@yoctoproject.org])
+ AC_CONFIG_SRCDIR([libmb/mbtray.c])
+ 
+ AC_CONFIG_AUX_DIR(.)
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
index f212eb5e96..af3aa23110 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
@@ -14,7 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=87712c91ca9a2c2d475a0604c00f8f54 \
 DEPENDS = "virtual/libx11 libxext"
 
 SRCREV = "35cd78efa3120efc46497f55c04382be960d1864"
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https;tag=${PV}"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https;tag=${PV} \
+           file://0001-configure.ac-update-version-to-match-the-tag-version.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


