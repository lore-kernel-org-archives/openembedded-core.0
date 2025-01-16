Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF937C02180
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 07:27:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.43314.1737012423029800250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 23:27:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3111d49cac=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G7DvA4000838
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 23:27:02 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt7546p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 23:27:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fs5vyeHFwPR+LZlmtcVQvLfsRL+2fdtMYB/w00quE38VRriGIE8gSpyIwdd6+PRwkH166e3X9tWYoGmkANJ9xVyfM9WaBRYYUElBhiOL4yglPB2HMkq5tBGxqR1ESSt0uXENNYjlD3fZeLhBH4Hb4oIiGPBLuiV/TuuCCEpAhS9nbtEaUeMxXX9TW4hjLLvaAGtdMM/00L8RGA1tF3yGE91r4sCZaH4ckixxIPrQq1KlMyCj5KFJ2UK96snsZ/zrlbr5k9xOgfc7FBDays6R5vFJikKRHF/uBi7PsL6zeImwDP/6CZ/Y4+qtoriEHj1suHPqecYM3rPfvicBR2mlgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvpA39vcZHBqb+evBz2sATBLb2REg+rBvr66iE91SmI=;
 b=CnvEs1uujNUFhSmDaywDBr9KmRIHmEzNBMqN/Cc3dlL7j6GHefCgEEOlJSwYPHZvRCP+1bmFfPnSOKUSNWAqEK4dzF/InIyoTQueDWTMkS4a2t/3xjVkrKMUXs3I1aYildkNK+9f+2OOcBi195/dwkooejQqtahhoeUmsVwDFuRuVRNhsXjRx9bZMo8nitUSK+9OHnD7hR6nn6/JloywzbEqDNVqTYXCAYJbzzGAWI3d8vSTXTPpg71ukc9qpEeC1zU6z2PQfCweojOHV9UpGtZtj+2cVNFhSqLoQVC03El5hPgrLcAi7bjI7vEqetrUpsri36j4+Zba87Gayu1zqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW3PR11MB4523.namprd11.prod.outlook.com (2603:10b6:303:5b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 07:26:59 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 07:26:59 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH 2/2] vte: fix CVE-2024-37535
Date: Thu, 16 Jan 2025 15:26:48 +0800
Message-Id: <20250116072648.2645833-2-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116072648.2645833-1-peng.zhang1.cn@windriver.com>
References: <20250116072648.2645833-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0111.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::16) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW3PR11MB4523:EE_
X-MS-Office365-Filtering-Correlation-Id: ead3f72f-e876-41d7-b032-08dd35ff2a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Xqt0gy44p0sijUAqUPAZC9bhbZ1IKRvjx3OZfCOcgY4cHP7AMaXluYbcXiS0?=
 =?us-ascii?Q?JIS0dmwRoZVftOPRKzKsnXR/PVGV+k3FJaY4uzb9EX6ywOz3efxAgMhQRTXS?=
 =?us-ascii?Q?10+3j/K09xxozMNJduOE20a/zfmlxaRU+4Uy3zcTp+NeqNLg5w/RZTIEttdz?=
 =?us-ascii?Q?M5zWYB2BzhfFj3GjNw4LU3wfcny3wNTXJJ0UozOcvPG8fP+0OMUkQSmFS/2N?=
 =?us-ascii?Q?de7I/uqpGYXeU93kn+MeDcDDHhBvnZPUUs3RiCgqqq6pCqbF/q7G+0JsXOGu?=
 =?us-ascii?Q?T8zTCXzbwivQU969e4O+MTi1a/E+uRQxOM4Q3kPVBL3Gj8pJi6s4pHiTwjiw?=
 =?us-ascii?Q?l9HAabml5cPHUnTKl+GTQSrm/146x2v3PY9UYGM2Tnu12QfaRjAbVTPeqlSn?=
 =?us-ascii?Q?WuLwbxuhkqX3U4Lqr8DngKOaaNnjuheVV3Uu2diqk4wZupm2SGqjOjH98dXZ?=
 =?us-ascii?Q?zSQ/6qM4by9f+o5HYTgD1tm/lLc2lKYyZ+QwL0m+ZnVd8L2wxSCTIP14Ogpc?=
 =?us-ascii?Q?/jAGifkfyCuFaeDFoLXNokEs/wfJkqmZFLUrBH/ekzyRh8ILkwjVjFY9/qzq?=
 =?us-ascii?Q?Au5ojAe9jdFnAnj+7X+Mrb4z+xVjZLx6VeqNMm3nMJmBL5ux6LnPEyEB0ZyT?=
 =?us-ascii?Q?1X8JuMeM72qid5o35H7nBOzMEco8G2dMXdZUu8+YHxktfg1TVHakkK/BUYNb?=
 =?us-ascii?Q?pSqg6V0Om+aH7JUAF/VLPfd+Zv+nVcgLFa3CEEusKpGl4k3/oPNi1NvzXRmk?=
 =?us-ascii?Q?+xxhrlS5rYVGEWrYnF26tuJ1vXXq7l63FMs1Bken8yBsokVo/hn5g0ULR0aw?=
 =?us-ascii?Q?P2qeex7CG4/htyBaN4QqcxS6/o+WUg6cZTmzaQ0TA0QlbjVm1nzHEgqTW00J?=
 =?us-ascii?Q?E6IeEe+aVbm9ClYEwjrhi/tzGMyTrD9qoOuXUr53eBdZXK2WOyuwGFctQYrL?=
 =?us-ascii?Q?I05FaajK1srQd+Tg2nx8ePpXpMELzFSfLvOMEKX7Ekuv6ZFUxOgpaL+2cIxK?=
 =?us-ascii?Q?zBG4xbUdrPZk1Xoh5pA9DRu4CVyofbpFc45n2WIFyY6pZP3e0wwkMtugrb5K?=
 =?us-ascii?Q?9bEoHrSoKoDK0FQ76ktcselrbw2kXFkdYsT5SWg9T9hgF7LdrYKrIkfsp27S?=
 =?us-ascii?Q?ZCwmRi07/OAIoioFgSeTVmSVczWddK0kX/PzsEW0MFQGZ44TCvWccqsE97AT?=
 =?us-ascii?Q?iAb++KRbaRckgO3fQZyh6/UWPcz3VqIDwVgX9cZRejIztpPWSByooGw4sjNL?=
 =?us-ascii?Q?kXl5YJmLlTWpS7nAb4VKzb08Q3QRIvAQ3AnGbYzJ1eZsefvSK9J/lOcwMwCM?=
 =?us-ascii?Q?/fHQ7xf4dKKLlecgDVCCxPwNvvUm2gWWXYHEeht7BQyb6GUE0C7n6PhW7fNi?=
 =?us-ascii?Q?iKPR3oJdY/al7cvyPjpx5egK+OYsIJam05J0qtmwiCLNW7eEKA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dtnV7LRvBcL8umBPwCbo4g91bm1EbNjvccnsVAOtH/FPBjATDTcliGhKH+9t?=
 =?us-ascii?Q?MDYtcOt7BdnR/NdH43C/T93Ip8hOsOyBKMRJ/jTxdLEodu8fqsjxyI7E8azH?=
 =?us-ascii?Q?NLOOu9ot9DNRApkXz5Qf/PSYb6SEQyLIHbXf2PZEulRvjPacXSjMI2biIZM7?=
 =?us-ascii?Q?AArBKKoHTXlaScI3INJR5WVq/dFlTSuwKELsydr/GN+PrnV+T1LjUgOdxGj8?=
 =?us-ascii?Q?A/BXPZTZONMKRJ1RKfuqb9lzekh8lv1JgVZiKoNPNXJkLB8hCco31Vx4LhSt?=
 =?us-ascii?Q?zGzvAbOgTBMUQV5PCJQEnpdRGsEyopLY4BsUP48yXP+NdwwZhKuR7Eume2A6?=
 =?us-ascii?Q?B9TKZLFS4sNm8VXn2LsyNiWHSX3SbTMR8I/l7znrbenmxflMwIgLA6+FeUsj?=
 =?us-ascii?Q?6ojZXGTmdNSP77K/t66hseakzdeZS+8zLXjfS+NPeKOECnuxDhksSnfHHrxM?=
 =?us-ascii?Q?goQUjnefYnznQDu6AyvrTEnWWfotz97hdbm8Gazbpzd39YLuIvLYZWPxLTaV?=
 =?us-ascii?Q?mBhsx36fLtMPQx4m+wp7LOxl7qZjZ+jzcjZzgeNY0U1hYAKGcfPE5CJQeicy?=
 =?us-ascii?Q?wroLFRVWQp/ibOD2LqDpFOAtrbaMr6cQA0npA7LDl4F2VNk8cXb0nl3nr4TU?=
 =?us-ascii?Q?L5Z5McR78Z3LmjfoG4zotO92xpfs2SQezittjbahu0XCNgu0iIbXKLCMs8s/?=
 =?us-ascii?Q?EXgCe4a03EujFb97bWzRSKJEuYAAMkvXRF/HKSL4qMwJHHJdpcYsaKBgjI4f?=
 =?us-ascii?Q?5XPOAl95qcOtd4VH/6P7440IhDRlfli4N6+BJ/KfyL27MI2H7gbI/c5TAC0P?=
 =?us-ascii?Q?idYj1wWJKcQNPzL4lXemuGRJxZkM8lreldd/+sJ4tNzOD+dO7U6SQSzOn3zP?=
 =?us-ascii?Q?BOMlm+Beppj/E/jVqVb6jcpFk+5Mfz5mixTboRt8+jSDx6qr865VV5G8C3BK?=
 =?us-ascii?Q?dxrTSzQiUoqpKZt+m48NDryIjrXjJtTeaYwxSa+eDmGvugHXnznOz/ffrOJ1?=
 =?us-ascii?Q?lfOB2eR1Pp3xFVynbkcwcogCx4EZK2ziA1FSTCnZ2qWWq7QOse3Ig90jDfbN?=
 =?us-ascii?Q?HSAN5mj+8fODmEgghGdg6fhQX6anNjH+b0v2TyXnnJNRbFZwmURKDFtz2Y0j?=
 =?us-ascii?Q?V8vb4dJCvxNPQ3R5fjze1tui5UvpTETE5oQVvEWuFnCQVKTDZzy9xNY8BQeO?=
 =?us-ascii?Q?gE8xtHrjqLmmYA8KDYPrkMfQF9/eYfpDnuEaYsjVqQBmeg5Lxk7FQ81p5JuS?=
 =?us-ascii?Q?GkDi5eOPNxn2TUx3DQF2nV6R56G6f5x2J/X4ftQpqQOUzJZXnJLu9ihlhzkj?=
 =?us-ascii?Q?X/Uz255il1UN8GJHy5uZUrT7cOs6SUvIbF8vT1jRJ2iLFBxZrkXHL/4fHmi7?=
 =?us-ascii?Q?q38117MH11csOS4syBhQ8R4SoCputV5Mh7sQzyVm6S2cOC/WyrlOQ3I52yvW?=
 =?us-ascii?Q?4wb1EBBycP6xU7y2JAAz8d0/Wt3Cu5Djrr9pwLZcwzGFA9fZMhdD1rhWHTXB?=
 =?us-ascii?Q?s7ablILlfu2zIeuyDhDa6PQnou0klRbch4TP/Z3oR9TAHlxheBF+j6SKMEn2?=
 =?us-ascii?Q?mw1ztxrGNNxmJsifBuFDECDExxR6WWBHFSGm/jNtfBRQDHkQk/dz3K1dAbbs?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ead3f72f-e876-41d7-b032-08dd35ff2a15
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 07:26:59.7133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kL1kLGXcH6LDtqWVd8GZpYK4SN2z9eiqJV21DesG1u4fiDPSnT6zaj0c8un3mkCEL0uJWgbeIjFwp3epbC9G+7ja8RCsBRaQ02I9SIG6MjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4523
X-Proofpoint-ORIG-GUID: SJlO96Yq8fdTSmURZgr5-5Yvye63ne6p
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=6788b4c6 cx=c_pps a=AHWEOuZXH7ukEk4XErmcRg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=aiIX5UjjAAAA:8 a=aB6V93zSjU73ytCuqJ8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: SJlO96Yq8fdTSmURZgr5-5Yvye63ne6p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_03,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 mlxlogscore=999 mlxscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501160052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 07:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209937

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-37535:
GNOME VTE before 0.76.3 allows an attacker to cause a denial of service
 (memory consumption) via a window resize escape sequence, a related
issue to CVE-2000-0476.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-37535]

Upstream patches:
[https://gitlab.gnome.org/GNOME/vte/-/commit/036bc3ddcbb56f05c6ca76712a53b89dee1369e2]
[https://gitlab.gnome.org/GNOME/vte/-/commit/c313849c2e5133802e21b13fa0b141b360171d39]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../vte/vte/CVE-2024-37535-0001.patch         | 63 ++++++++++++++
 .../vte/vte/CVE-2024-37535-0002.patch         | 85 +++++++++++++++++++
 meta/recipes-support/vte/vte_0.66.2.bb        |  9 +-
 3 files changed, 155 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/vte/vte/CVE-2024-37535-0001.patch
 create mode 100644 meta/recipes-support/vte/vte/CVE-2024-37535-0002.patch

diff --git a/meta/recipes-support/vte/vte/CVE-2024-37535-0001.patch b/meta/recipes-support/vte/vte/CVE-2024-37535-0001.patch
new file mode 100644
index 0000000000..f7c84323fb
--- /dev/null
+++ b/meta/recipes-support/vte/vte/CVE-2024-37535-0001.patch
@@ -0,0 +1,63 @@
+From 036bc3ddcbb56f05c6ca76712a53b89dee1369e2 Mon Sep 17 00:00:00 2001
+From: Christian Persch <chpe@src.gnome.org>
+Date: Sun, 2 Jun 2024 19:19:35 +0200
+Subject: [PATCH] emulation: Restrict resize request to sane numbers
+
+Fixes: https://gitlab.gnome.org/GNOME/vte/-/issues/2786
+(cherry picked from commit fd5511f24b7269195a7083f409244e9787c705dc)
+
+CVE: CVE-2024-37535
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/vte/-/commit/036bc3ddcbb56f05c6ca76712a53b89dee1369e2]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/vteseq.cc | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/src/vteseq.cc b/src/vteseq.cc
+index 2c5b1e128..5b3f398e2 100644
+--- a/src/vteseq.cc
++++ b/src/vteseq.cc
+@@ -213,9 +213,18 @@ Terminal::emit_bell()
+ /* Emit a "resize-window" signal.  (Grid size.) */
+ void
+ Terminal::emit_resize_window(guint columns,
+-                                       guint rows)
+-{
+-        _vte_debug_print(VTE_DEBUG_SIGNALS, "Emitting `resize-window'.\n");
++                             guint rows)
++{
++        // Ignore resizes with excessive number of rows or columns,
++        // see https://gitlab.gnome.org/GNOME/vte/-/issues/2786
++        if (columns < VTE_MIN_GRID_WIDTH ||
++            columns > 511 ||
++            rows < VTE_MIN_GRID_HEIGHT ||
++            rows > 511)
++                return;
++
++        _vte_debug_print(VTE_DEBUG_SIGNALS, "Emitting `resize-window' %d columns %d rows.\n",
++                         columns, rows);
+         g_signal_emit(m_terminal, signals[SIGNAL_RESIZE_WINDOW], 0, columns, rows);
+ }
+ 
+@@ -4467,8 +4476,6 @@ Terminal::DECSLPP(vte::parser::Sequence const& seq)
+         else if (param < 24)
+                 return;
+ 
+-        _vte_debug_print(VTE_DEBUG_EMULATION, "Resizing to %d rows.\n", param);
+-
+         emit_resize_window(m_column_count, param);
+ }
+ 
+@@ -8990,9 +8997,6 @@ Terminal::XTERM_WM(vte::parser::Sequence const& seq)
+                 seq.collect(1, {&height, &width});
+ 
+                 if (width != -1 && height != -1) {
+-                        _vte_debug_print(VTE_DEBUG_EMULATION,
+-                                         "Resizing window to %d columns, %d rows.\n",
+-                                         width, height);
+                         emit_resize_window(width, height);
+                 }
+                 break;
+-- 
+GitLab
diff --git a/meta/recipes-support/vte/vte/CVE-2024-37535-0002.patch b/meta/recipes-support/vte/vte/CVE-2024-37535-0002.patch
new file mode 100644
index 0000000000..c396817060
--- /dev/null
+++ b/meta/recipes-support/vte/vte/CVE-2024-37535-0002.patch
@@ -0,0 +1,85 @@
+From c313849c2e5133802e21b13fa0b141b360171d39 Mon Sep 17 00:00:00 2001
+From: Christian Persch <chpe@src.gnome.org>
+Date: Sun, 2 Jun 2024 19:19:35 +0200
+Subject: [PATCH] widget: Add safety limit to widget size requests
+
+https://gitlab.gnome.org/GNOME/vte/-/issues/2786
+(cherry picked from commit 1803ba866053a3d7840892b9d31fe2944a183eda)
+
+CVE: CVE-2024-37535
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/vte/-/commit/c313849c2e5133802e21b13fa0b141b360171d39]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/vtegtk.cc | 35 +++++++++++++++++++++++++++++++++++
+ 1 file changed, 35 insertions(+)
+
+diff --git a/src/vtegtk.cc b/src/vtegtk.cc
+index 24bdd7184..48cae79c1 100644
+--- a/src/vtegtk.cc
++++ b/src/vtegtk.cc
+@@ -91,6 +91,38 @@
+ template<typename T>
+ constexpr bool check_enum_value(T value) noexcept;
+ 
++static inline void
++sanitise_widget_size_request(int* minimum,
++                             int* natural) noexcept
++{
++        // Overly large size requests will make gtk happily allocate
++        // a window size over the window system's limits (see
++        // e.g. https://gitlab.gnome.org/GNOME/vte/-/issues/2786),
++        // leading to aborting the whole process.
++        // The toolkit should be in a better position to know about
++        // these limits and not exceed them (which here is certainly
++        // possible since our minimum sizes are very small), let's
++        // limit the widget's size request to some large value
++        // that hopefully is within the absolute limits of
++        // the window system (assumed here to be int16 range,
++        // and leaving some space for the widgets that contain
++        // the terminal).
++        auto const limit = (1 << 15) - (1 << 12);
++
++        if (*minimum > limit || *natural > limit) {
++                static auto warned = false;
++
++                if (!warned) {
++                        g_warning("Widget size request (minimum %d, natural %d) exceeds limits\n",
++                                  *minimum, *natural);
++                        warned = true;
++                }
++        }
++
++        *minimum = std::min(*minimum, limit);
++        *natural = std::clamp(*natural, *minimum, limit);
++}
++
+ struct _VteTerminalClassPrivate {
+         GtkStyleProvider *style_provider;
+ };
+@@ -510,6 +542,7 @@ try
+ {
+ 	VteTerminal *terminal = VTE_TERMINAL(widget);
+         WIDGET(terminal)->get_preferred_width(minimum_width, natural_width);
++        sanitise_widget_size_request(minimum_width, natural_width);
+ }
+ catch (...)
+ {
+@@ -524,6 +557,7 @@ try
+ {
+ 	VteTerminal *terminal = VTE_TERMINAL(widget);
+         WIDGET(terminal)->get_preferred_height(minimum_height, natural_height);
++        sanitise_widget_size_request(minimum_height, natural_height);
+ }
+ catch (...)
+ {
+@@ -781,6 +815,7 @@ try
+         WIDGET(terminal)->measure(orientation, for_size,
+                                   minimum, natural,
+                                   minimum_baseline, natural_baseline);
++        sanitise_widget_size_request(minimum, natural);
+ }
+ catch (...)
+ {
+-- 
+GitLab
diff --git a/meta/recipes-support/vte/vte_0.66.2.bb b/meta/recipes-support/vte/vte_0.66.2.bb
index af1c47cf80..365e4361cb 100644
--- a/meta/recipes-support/vte/vte_0.66.2.bb
+++ b/meta/recipes-support/vte/vte_0.66.2.bb
@@ -19,8 +19,13 @@ GIR_MESON_OPTION = 'gir'
 inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-introspection
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
-SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
-            file://0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch"
+SRC_URI += " \
+            file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
+            file://0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch \
+            file://CVE-2024-37535-0001.patch \
+            file://CVE-2024-37535-0002.patch \
+            "
+
 SRC_URI[archive.sha256sum] = "e89974673a72a0a06edac6d17830b82bb124decf0cb3b52cebc92ec3ff04d976"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-- 
2.34.1


