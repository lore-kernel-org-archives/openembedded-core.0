Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49AEAC369BD
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 02:55:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.193.1744858550322349109
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 19:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6202e9a415=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H1eWYW029573
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 19:55:50 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ykf3njyj-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 19:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFojpuKS3v7dO7NyAohCumNIZeUi5a8/EHO/SYG9hgaeZDTIdyC9phFwapIpuHAF4+u9swTs9VuGaJRkIUhtb7sWkjfWEe7wCMOI+wc4W0FJxhCFnV0mo60MRI0cgxGQHHbGXF7mwRnEcecP6fd7ZX31jS6MsBIYKvYM/5T4VCCUKbb9TTQRkWCN2/YSqKKaNCUDImarXT6hDe2wuuj/tU613G3i1C1T6dDCRb1kNGiXiZqXqxusSe4HsT0lwwEAVpQeGXD8evar5v+eBlG1tSM9Ri+rsw02ALlBdFcILd7EgoQ1dODT3dF6twcGKGEkzo3z9/EZSPmDQzupsZReFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FkAlukFWKDlvL8zlKqVtqxMjcGqIzFmGCjOLHNeE0M=;
 b=RnRSqYqeToSfP3b107ku5yWqk/7ECI6TV0fX6GU00RU31NgsjcaaIgxB5ngWjL2XTCtABrLFEsCFM7EoS7ZqFJNgVABt/fAk0Pd2a8l2l7CC4uxB+FaV9FO3gK1+wuP0TJ+6hpCN1VuJAF2+s40qe6Q9Zk0aIf2ITEwD03dW5z5eXqVQYRma3QkoOX6XxPflLCv6PxJSkIH2Amok83fIGlImfPSC+PIdpANaVwFo6GGk8Z6m1ABghWhISAY5G82D79JoqbVzIj6xG4x0rtMM2nq1Kv16kvuV6DiVfKv8auXd/kky1A8Xd9Lg+6MpYS/QE+JaUpuldOv3CRbVcn7yyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA0PR11MB7935.namprd11.prod.outlook.com (2603:10b6:208:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 02:55:47 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 02:55:47 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] gnupg: drop -unknown suffix from version number
Date: Thu, 17 Apr 2025 10:55:30 +0800
Message-Id: <20250417025532.1363790-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417025532.1363790-1-yi.zhao@windriver.com>
References: <20250417025532.1363790-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0133.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA0PR11MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: d30c16c6-2bdd-4119-6373-08dd7d5b5a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Kwj5UmwEg4FNIkSyxrVy2Ocx/mb/+AfpdCWatdcFV2SKaAnBBz9ptmuDM8pD?=
 =?us-ascii?Q?OUHq3QSgreXIT7cL0CQMyI/46RS5USorI6U++0BqFrApc0+nqttwOqhQtMkv?=
 =?us-ascii?Q?xhwxIkUtR4/L96tkrY5H37MWg0sFFntPGddb+4NMuvaiUI9hWnt0ldNRlDUg?=
 =?us-ascii?Q?VlkmUhFmFoLYM9knE1U/5HYBjJ/m8vzuPdIEfqHEN0R/0x0onk/SDGPhYDqS?=
 =?us-ascii?Q?zzt3ot2J81pM60KJr8Ui5NM/o0lDrCjZPtBBI8WSIU/0KjGE/W1YMu/vwKGV?=
 =?us-ascii?Q?UYu+oGsfCztBN9XakDfyXxJcygOca3+fCaUvsfiTE3jO/mNkBSrDundIrSud?=
 =?us-ascii?Q?B8WV+9pKeDZe0+agjYubGxHFe5b6a4niw3H5Sc5K7IAwqXvY2C1qotDLNjlL?=
 =?us-ascii?Q?c7r5Hg0/95kKJrOZe6cv7KhyH650uPkKGlKvOgiJya90K3wg138wjwZkjWj2?=
 =?us-ascii?Q?lMlO98h0Wquu1mgTtza0xP5/EilOkEvJ2MOjR01YOwy4WM1kwvyPnOkBH1GX?=
 =?us-ascii?Q?5bnx4J7HUfTSXe+SFEtHoJ4zGCp/Ny/8TIIgEaU5AQCLhK56smKwsKeAikPX?=
 =?us-ascii?Q?p54ayQm7ZZ9ZOlbeBzA9GZVMoKRzzani5iOaSdTsw7JxtYlaWpuPVhARXf29?=
 =?us-ascii?Q?HKRV7f/b1NAyxpTkjJxoV+Nh3hRyrT5TV9z+BXxkoJkmMurcnXKqfEgnJMa/?=
 =?us-ascii?Q?p23kuMixKTUald3b6uJjDl5cwMX5EQem0szN6bFm6e/R07UyA0jwNf3ZgiN0?=
 =?us-ascii?Q?BWkgluEVDK+yVA02KBZd9Kw52DtqOQHcMAbDf2/ay43CJS61GJ6FQ9pR92Ku?=
 =?us-ascii?Q?RYLnhNdmsfGoxlsDXeRpNXC+xcw7PKnMBniwyN1T3xIjsnUJM4NwsaxTDPzj?=
 =?us-ascii?Q?/cHzBkXf2ld/4oD/kwm7Xpf90q+n4dUOgifEYTyop/NJQppv9YLy80EdApkf?=
 =?us-ascii?Q?XDWIIfu/zN3Ts6cXKoqF8RWfgdoZhZPLWhsqWwSYmi6EgrWp2B4AQjVVfwsY?=
 =?us-ascii?Q?WeDRo7g6dtprsCwGoxFsouHhCuRCDL2EZSMIT5p+qcQuTnRR3KGsTJWycl6K?=
 =?us-ascii?Q?Uqykjzj9g4Gaf6K7ty/+xemxdFUFgdl3fZwa/PmjWXVdD8B6nTBAI/VDDA9T?=
 =?us-ascii?Q?14RTNN2Bval4P4QydOg9AfTvgy5u/3kZWn7NSYw7huFSgpaz3aSst8fZGvWs?=
 =?us-ascii?Q?Hfw25s4LTdP4HF1IDnX63l9NtWnGnG9/Dv7thFx7aN8yb7wrwftjbwt7uuZs?=
 =?us-ascii?Q?IMNwzd0NoP4ModbyxLTg8aO+aA8gcWZqrS1VmYX7p+Yn7VDAnjBxSPgdjb37?=
 =?us-ascii?Q?rDDLR1vBkp9nKfqNrtoJL9Ol+JHZyY6xxLtsFovtYSyUJXzSXlBWkS4WHAVa?=
 =?us-ascii?Q?rEzsi3DHmSfl1Cw4PMftvzOtPhxfqvFQMDVkatXuTQKKG5NJlN/KSoCj6vGQ?=
 =?us-ascii?Q?LRCYAQL8pzQqwZb6ltVTHIVz7Pp7VPVRhItECAzBoeCeykLxEcUKDA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UDb6Nbq4OrrYW6F0/dWX/Ua6+7og1ND37uvvHFR+G98GuoBFW832vuTZr8+R?=
 =?us-ascii?Q?znCkdBBN+Qz8uZlYMY5DA03NjrSwzJXbRQ2NoFwE3qTWi6KmJE3KJiuvfx3V?=
 =?us-ascii?Q?eFjY+g0H//40pkl5BLNlL1knJ+AflPD0NdJec1na78tLlbbZASIb5NJ6EVaU?=
 =?us-ascii?Q?77rp3+hmi95hSwzx/q8U95PcWS29BdTG3ZDKCVfsxMbmvHpuqtEpdHtXgVAD?=
 =?us-ascii?Q?7NQasDNK2PulRBSEX5eoTEgyKnY6OuM3Y6oJgYS0dbaG/HdmHNOQDwcC8mda?=
 =?us-ascii?Q?DHEt95o1/VbVHoLhMrFBoRezW7VDP6RJQdCivzbDOSFFBOkMKSitCIV9/uoy?=
 =?us-ascii?Q?lMyF1LgiV+SE7nBOHpIPKsdeYANoO1x26p/noiryvA1PSfaeump7TuU5gECx?=
 =?us-ascii?Q?3vmvyTkq9NCO13qsDqK/jv5SB7sMJfDRGSwosYg6iRrLqH3ZNbo6Tap/UMEn?=
 =?us-ascii?Q?+S2TB0EWm3mbKK0wV7DTQK5kcefeOezfy6Ul3viosgSxAhgmu93yrVherNPP?=
 =?us-ascii?Q?KW7MESwbd9J60BWExL0sGww+wN4I4jfUi/Mq1RfT6so6GAiTc1sOFz/QBRZ5?=
 =?us-ascii?Q?Yqc+EqrcZcUlEsfbuenBhRwaDtwpCgWb2Gt6I6Yuzep/X+X/yJAWKg5B0ah5?=
 =?us-ascii?Q?Ffg7rO19DBxD6Vut6KfQ6LF7WgnABhwEJZ31YK5/VjeyQKsZUS3jeIeDbnne?=
 =?us-ascii?Q?PVSedEvHWkdd+s0yXalBzqXQkrGKC0KMB+a2pHUtyp8Hp52UEiddUUgTh6iz?=
 =?us-ascii?Q?igdGm9DtCkE9FETkKaDlSkfYo/j8rdagwbXgXFbaON8GAyV3rpCqk0eHPCzZ?=
 =?us-ascii?Q?HWiz0il2HfbVoJN7oVV7K7zWPKecG2z0DFc7HMvGvdafmJVI1bTr+iKDJRWx?=
 =?us-ascii?Q?2rtfMmO6KoBrg3IM4B4yDWj1ZO/Sdu5ch1kJ62km40M58o/6qYNKqFBjiwF4?=
 =?us-ascii?Q?bsg90FlLPpnoFfJT7VlUjpd29+RlmwEA1YYzrIALxHaJExspZH7y7OPOES3p?=
 =?us-ascii?Q?HmqPDnXMDGq/fUenBv5LI54Ttr7cRI9XGaQ0QroryJ3qiIHJcNS7n1NH3we3?=
 =?us-ascii?Q?CoFDKXZB+OKtZPiZqKS4AeA5WM2OJd6mm55vMeO8mtXp8GtBFLq4TpBgrOvX?=
 =?us-ascii?Q?Lwr/il7O7VwxtoFUL7VgTzjnP+dcD3/8JcOWznG4j+z8BB15tdluWdOwqRpJ?=
 =?us-ascii?Q?wUXPteYL2x43ZfDGv5RZC6WxLa6uA0IgCUSwyw6hN9UJHhuSoI97BQNSGy10?=
 =?us-ascii?Q?7Tp4oiQLQhDfwI5EdRLmv6OJN03oglkekG1O7rKaY+9tFxZzvnnA/x0fn+Q/?=
 =?us-ascii?Q?uImSqIJNk292nQHQp3ns9tctgbIDPorsB18VVsYibl2xZnVSW4gZn4xCi1S2?=
 =?us-ascii?Q?f9lvYRkl3DL6e3Hdha+viQl1zXvyymQTawRXoKwZMOryfMpz8F2HYXqgnkL1?=
 =?us-ascii?Q?EMJ3T1Lz+wRWYP3ExN9E/Vhec3J3TP3UHCKwVNaPKfcMzySs2DzLf/WmbXAM?=
 =?us-ascii?Q?ylmpTjIbYMBrWG0ZxseKuvNSW5kBDlYP7+U+3hmxYXVRsjnhMegwU5082j+v?=
 =?us-ascii?Q?9H3I3DWgVI/Zsy1Wn+I2k+DlpSmAFCKTPJgNuWlW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d30c16c6-2bdd-4119-6373-08dd7d5b5a8e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 02:55:47.3355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvTDaMNbzltSR4pEkqOrNYLNjTtPipGJH26q6e70DO3yu7l0osVRMmGMBzZuXpsqaG1afLvkiIC40HiRpJD2Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7935
X-Proofpoint-ORIG-GUID: K1yCoQaveGVDEQ3KaMed-RM6wiFQmQ9V
X-Authority-Analysis: v=2.4 cv=Wd0Ma1hX c=1 sm=1 tr=0 ts=68006db5 cx=c_pps a=Dwc0YCQp5x8Ajc78WMz93g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=ggHxpCNd9HcqE3gEoxkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: K1yCoQaveGVDEQ3KaMed-RM6wiFQmQ9V
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=795 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504170020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 02:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215029

If autogen.sh is run outside of a git repo, the find-version function
always assumes that gnupg is a beta version and adds the suffix
'-unknown' to the version number.

Befor the fix:
$ gpg --version
gpg (GnuPG) 2.5.5-unknown

After the fix:
$ gpg --version
gpg (GnuPG) 2.5.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...h-fix-find-version-for-beta-checking.patch | 22 +++++++++++++------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
index fc7d964ec4..5d5e2174c2 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,4 +1,4 @@
-From 4d8cc1982273d571b4e80fe981878d0fa5884236 Mon Sep 17 00:00:00 2001
+From 8152507a5ee312889366177c48fd99dc351d4c41 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 16 Aug 2017 11:23:22 +0800
 Subject: [PATCH] autogen.sh: fix find-version for beta checking
@@ -7,25 +7,33 @@ find-version always assumes that gnupg is beta if autogen.sh is run
 out of git-repo. This doesn't work for users whom just take release
 tarball and re-run autoconf in their local build dir.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 
 Rebase to 2.1.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Drop '-unknown' suffix from version number and set beta to no instead of
+removing it.
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- autogen.sh | 1 -
- 1 file changed, 1 deletion(-)
+ autogen.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index 9f91297..116fb7f 100755
+index 0b08e8b..0c5e425 100755
 --- a/autogen.sh
 +++ b/autogen.sh
-@@ -270,7 +270,6 @@ if [ "$myhost" = "find-version" ]; then
+@@ -284,8 +284,8 @@ if [ "$myhost" = "find-version" ]; then
        rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
      else
        ingit=no
 -      beta=yes
-       tmp="-unknown"
+-      tmp="-unknown"
++      beta=no
++      tmp=""
        cid="0000000"
        rev="0000000"
+       rvd="0"
-- 
2.34.1


