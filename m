Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE63C282D9
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 10:49:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10618.1741171745440304032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 02:49:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=515944b0bf=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5257eCR0004522
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Mar 2025 02:49:05 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cs7rhw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 02:49:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqF+s0mbH8lhtyvM7W+CGFgHNh0OgboAnq+j8xX+n0KaNQDGOVbSXFjZArWe889LegADbfF6p/VFky2I8zbzPZYpRO8Y8b0R5x3a7pjhCND1s0tQT1vCYwwQLcGYbJdvoUN+sHTYUup2x/MQoNjv4jHY6qSY15O9zyL4ivy7zaRpgblIx0WuhKmIdRLzAocrSzGaoJTScu2swYgkk1amLkSa4qjs2wpA8q4STpZm8ib3+xsovtq/NH9dpkIW+dw96vQWLczbJ1SZpbs7mLKWRjFN6Wt11tXUda1/tgTAHef6tBjsW58bz6OeuEN1DjYaTcf3ZSyOa4BSY8xZFvR+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9c2ARglawglq/zOc+sQ5GwXlSavOt8XV+ZCHgF5BT20=;
 b=YbK92tViyHYRiMPagnStpoOpO2Zi+/5gSAGAUZ2ThEFe51sYmKFRDdyN13fE0lolLunIN66flNFW2x1E4GFwpZJKQyOsvQfDAwUbY56zcmR2zU1YV0BA8+H3w9QDbzuT724YnbDhM5mLGpTuNq58P28ea49jBZSYy1J6j7bW3aOXZEH44r7tmSBDfwBeHs969fVhOaAl3EkfDjYCETrt8VVxcYnZ1CDEzEMX2CUjURpz40TWlDralUg9mGY7WhLAzNx+AbrelFmLT6Jq8CybBnV9xp4RkVasiR16pESpCBaykVhBZU3utp2V4VgwoYaD/zB1WfORb/RodW75oNJwdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by SN7PR11MB7637.namprd11.prod.outlook.com (2603:10b6:806:340::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Wed, 5 Mar
 2025 10:49:01 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%2]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 10:49:01 +0000
From: bin.lan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] babeltrace2: upgrade 2.0.6 -> 2.1.0
Date: Wed,  5 Mar 2025 18:48:46 +0800
Message-Id: <20250305104846.318301-1-bin.lan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0246.apcprd06.prod.outlook.com
 (2603:1096:4:ac::30) To CH3PR11MB8701.namprd11.prod.outlook.com
 (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|SN7PR11MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: 173e2d9f-9b60-4c28-886f-08dd5bd356e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pS0Dh1t+4G0fweeidA7KEd+sEmP6ISvYZCA5JLpXNcHa0glkYXC4qlWIO6fN?=
 =?us-ascii?Q?tQxZcQW3xc5N/fKqw08tYWKRp+5o+P0S+uOjuBjK4O6FgrnqECZnmJGeqzWD?=
 =?us-ascii?Q?Ma3WnPOKQtSN70ORWwXBfQnxACDO6jknzE5ooY3N4p+lbf7SVJUMFGx7An9V?=
 =?us-ascii?Q?PThYMYspo1o/R1vDgsCfS6H1X8JbYaM+lc6KXb65vrgMlqgneK8/+BGbM9EH?=
 =?us-ascii?Q?d5McGFhgqRKWucZtXPcQs0XYtSUhrP6jQoD/2EJgG9z+4NWirnOyVP+3intb?=
 =?us-ascii?Q?B8vau4P+l3DwkHKzQZ7Ca5jDWTJF63G13V7h1Ndu5S5/KsxKaM+gOjQukzZ0?=
 =?us-ascii?Q?67GSqbahLh7FWyTNwLMScet90F3tPd2GQ/cXUcffD3KGkoCvhEeRk9EYS1tf?=
 =?us-ascii?Q?NpY2pVKEH6Xhf5PgOmDpbdkKNnt3hTzo4nNe1o0emuC74Ua/iXuJ4WOckauL?=
 =?us-ascii?Q?h6oDRi/u6Ad8KOmKxxLHSAAOiZoE0+3bxiQS5tr6AqEAOzJsr8nm1FbNnswf?=
 =?us-ascii?Q?nkFrEzwhiokG2bl+lU/aj/f8acooNCYcwx4nuYOL+VjidUcvk/in8swvyL5i?=
 =?us-ascii?Q?sNbBivodckzNv0ZtgLG2lERl1SfNqdonm9xLhtn2NH8fh+PPREZCch1gUi6a?=
 =?us-ascii?Q?Se6U737HsKUyikA/LNnouD2Opif8wHpzlvZ/R40lmcCZkOheEvJt4tUfe9KX?=
 =?us-ascii?Q?+1nijJixkxRKgCKRy781S9JGUPZIBVeYaM34qn5iabpQamuiv+FSrxSwhzy0?=
 =?us-ascii?Q?X9MZ/kgsjkk64/wf1RiOwdY3aYIHmnK1STLblaS9UPxut0QCU2zu5VJESfBr?=
 =?us-ascii?Q?+XxQpTrR527iQ5tWrI2ZHkBxiGMILBGitiuszI81e7v6sHgQy2JipUSYPbuI?=
 =?us-ascii?Q?0IOlBaGdsgmAt4FAYvJskAoBuOeODA0SCrxNkrGC+L15dddWJOmrniVISgkX?=
 =?us-ascii?Q?DQiukQykQ/t0Eys291yaij2nRtfVN2211p6cGZ8c3tfgT/VYa3BFzowk2ETq?=
 =?us-ascii?Q?C8zZWvxf4fPkNOuqjEEswGge+C91h/Dq5j1JG1Qclhe/4oh/Y3u7joS7QASA?=
 =?us-ascii?Q?8pTM3WlnOdC14v98NN9o/6g84Mfjmt5SFkhV8aO0tvg9J2RyCYBK6B608Bwq?=
 =?us-ascii?Q?rIs2kS3B47s9atnpraJfn+xlb/TVeYB1P11S44W5MeUE9jeP7PbMjxKa3u8o?=
 =?us-ascii?Q?GKoLZuJImoTglvtzt3NgnmzTUouEsWjAaSnaEnClzEU2yIr7g5lguI0xBIO9?=
 =?us-ascii?Q?od0tQDgml4XPUQZyf/X8qACqkgAEvYAtIMZNO+k654md9nmZdbPmmbiLpYVg?=
 =?us-ascii?Q?ythYcXlbHP+gtscPka6Xbh81s1mbmmf/7Kwuwg43/K3VEEvugI7+6j2u3vW7?=
 =?us-ascii?Q?DyxkjG/QeCo96bM4zGLpg1gtUgsaMyNHj66G2ain21/Mwgrisw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7Vs+GQ7Zp8D3Bu+TYcvMI7G9yZx5eQL/tp3aSK8q6fa8s7OMFtT782PV4pyx?=
 =?us-ascii?Q?UWaLdRPKG/DgnXsMAUnaF/hk8bm0IhevR8jxP/MOPcFLtMoetparluCk/gBn?=
 =?us-ascii?Q?DCuCFAWHh/78KP5Zp6E5aht0AbkHfA0FAmgiUEWk4EH7oJqIJA7eDh/FzxY3?=
 =?us-ascii?Q?/Fe9hbP2jDXMEto3QL5FTUgtC3YAYh2XAuARk5VjxvCDhQ4CqXb9DVLFScbK?=
 =?us-ascii?Q?AjF46e3esgeDDsHS4/gtVlLw3CVXEvPq9lu+8cXY97W+7fWyH1eA9EzQBSSr?=
 =?us-ascii?Q?pULYjon9PB0iNBoAkiWmisNpHceQItaITxJXjLIRqVKT1FMWN+zXo3IHW8RX?=
 =?us-ascii?Q?CSVN9Cy6AY/y4bA26IP+yznFDoydKI1XSTKZHXsoMFF6jjIwRSO41Gfp9VNG?=
 =?us-ascii?Q?i0aQBqCOqn2SKPGsVsdv6EohZwKRydKm0WAoR9qMOMq/gzMb0O/pGQcdo2xN?=
 =?us-ascii?Q?bRLgRuXs4zxBGQ7Gskxz+N/D6QsgeFY1+bc1pG78XiBbFaVGhXDLgpXSvtI3?=
 =?us-ascii?Q?SKKg/3afjmN0USnnSGkkrIZr5Nn+moLXb4KQIp4p8lK9WsmiMLzauNrJASfq?=
 =?us-ascii?Q?5osOq88NaMjQaw+RunJaRJ9LUK7VrNsKOfd2KsleMDqa5dMNhMeobBLYmqof?=
 =?us-ascii?Q?vKqMBlDPjTPWtlfhxsXO1gh24m8f85Iqd7yw54t9UBd+cEoFIsLTcnFAU687?=
 =?us-ascii?Q?C5RrcJyp6Zy0bn6cuPGXEaiPcEb4BvL1uM6jAT6MxKQGUKqSYnoBmV9zOXDe?=
 =?us-ascii?Q?FxjXCfMx7o48oeZzy56JYYeGcyqYW+vTO/rYAs6QTWXpjYpLnTG3rnhKu68z?=
 =?us-ascii?Q?6v7vAMqUJp8oBMsx1F1ZfphUF9MveeHZYn57QCccoxuzUYyc7apUITwETL09?=
 =?us-ascii?Q?XajQ3ysI6J0A3iUXxVn2u6mXcScIb+cU97vKeefOV+t+mVnTNjk+Y425QW8H?=
 =?us-ascii?Q?S1raPsLwh4OJLinGugA9LSHVcn3Go3JXMrhDq/XaWOGsRQfjRSKnMulxfC0M?=
 =?us-ascii?Q?71W1f38l941mZPmvJqay283NETymGzu+kQLjbLrMeAu5+jXo5gTwX/ctt6NV?=
 =?us-ascii?Q?KEF8D+WLtrYdQvT4G+9IizEw9JQ3xSoYvhX1gGLcCNuZZn6pFEPtyag8cjLE?=
 =?us-ascii?Q?CAifDzOUX04AonxqrlrhcMClhBzbORWMDCzAiYm3JP6UXE3b2S8RlJcKYmIy?=
 =?us-ascii?Q?21l2CoB310O5g93epYyM3vQ0Jx+e8uuAUjkV61+hFFi4CO/cHsCLWMwzeRbX?=
 =?us-ascii?Q?/APN3sVH8at8t9AG37yjoGGuVpojGdaJ0pikr9XOZPmV+gMDvRItwW/lsu6P?=
 =?us-ascii?Q?CkFvaOTolaEbjcnZaTLfrt25j3U2PeQYmKhUwZszy5frUZDxwKAvHh1eukUJ?=
 =?us-ascii?Q?IvDOrtECgNcaJ6IPUPobj+aJa6IqhZwvhpnlCqGBXxjvGRQgmGpbpfOD00n9?=
 =?us-ascii?Q?yvJRCc7/iSu+q4jrNij6gEzzw51f467KwYETdh1cGfXiEQeRYuAFgeJFHBXZ?=
 =?us-ascii?Q?qT4RtONNpNRIdSdEmmUKPwArES6O8IXUX2/9vZ0KTKYYCQ2XA6JQq46YYRHi?=
 =?us-ascii?Q?y0RSeNdQtB+nI3NzZlQmOJvM+QuWcyT5wxd1NaFPSDwcJBO1H+FNUQRZb6hf?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 173e2d9f-9b60-4c28-886f-08dd5bd356e4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:49:01.4245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNUlf2fgV3I1TzuW4An/NIQFgyqIiC5NebEhG0SzpKHFZN9jlTclEIr4E3jIQTYTEdTLr6XxULshXAzfAJK0IDImNsTgJkP4elYMpY23g5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7637
X-Authority-Analysis: v=2.4 cv=DfbtqutW c=1 sm=1 tr=0 ts=67c82c20 cx=c_pps a=19K1aDEwnJ0RahI1emVHDw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=U40Yx87jAAAA:8 a=a5LkSv8FAAAA:8 a=t7CeM3EgAAAA:8 a=fk1lIlRQAAAA:8 a=pGLkceISAAAA:8 a=7d_E57ReAAAA:8 a=VFVOwz_qZ-WAeXJ-Jr8A:9 a=_PE9Q_0Z8bzuyU0-:21 a=BBahhS0D0WQA:10 a=yv_D6YSC6K1Ih23S2Yuy:22 a=E2cWBXyb0kjxxB1PlMdk:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=U75ogvRika4pmaD_UPO0:22 a=jhqOcbufqs7Y1TYCrUUU:22
X-Proofpoint-GUID: nMEtwtSnBRvLOSp-lGNss_8_juP17n0d
X-Proofpoint-ORIG-GUID: nMEtwtSnBRvLOSp-lGNss_8_juP17n0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503050087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 10:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212304

From: Bin Lan <bin.lan.cn@windriver.com>

0001-tests-do-not-run-test-applications-from-.libs.patch is deleted
for tests/lib/test_plugin is removed.

License-Update: add new license BSD-4-Clause GPL-3.0-or-later CC-BY-SA-4.0 PSF-2.0

Changelog:
Babeltrace 2.1, MIP 1 is available and adds many functions
to support CTF 2 features.
The Python bindings wrap all the library changes in the same
systematic way as in Babeltrace 2.0. Add type hints to the
public API to assist with static analysis of your applications.

Details about the 2.1.0 release:
https://babeltrace.org/docs/release-notes/babeltrace-2.1.0-release-notes.html

Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
---
v2: add License-Update tag in the commit log.
---
 ...001-Make-manpages-multilib-identical.patch |  9 ++--
 ...not-run-cpp-common-test-applications.patch | 46 +++++++++++++++++++
 ...not-run-test-applications-from-.libs.patch | 28 -----------
 ...o-not-run-test-applications-in-.libs.patch | 27 +++++++++++
 .../lttng/babeltrace2/run-ptest               |  2 +-
 ...eltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} | 21 +++++++--
 6 files changed, 95 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-cpp-common-test-applications.patch
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-in-.libs.patch
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} (81%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
index 2401b176e6..76bef9c3b8 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
@@ -5,15 +5,17 @@ Subject: [PATCH] Make manpages multilib identical
 
 Upstream-Status: Pending
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
 ---
  doc/man/asciidoc-attrs.conf.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/doc/man/asciidoc-attrs.conf.in b/doc/man/asciidoc-attrs.conf.in
-index ad1183f1..e11c7031 100644
+index 88fb13ce2..27858b720 100644
 --- a/doc/man/asciidoc-attrs.conf.in
 +++ b/doc/man/asciidoc-attrs.conf.in
-@@ -1,7 +1,7 @@
+@@ -4,8 +4,8 @@
+
  [attributes]
  # default values
 -system_plugin_path="@LIBDIR@/babeltrace2/plugins"
@@ -24,5 +26,4 @@ index ad1183f1..e11c7031 100644
  enable_debug_info="@ENABLE_DEBUG_INFO_VAL@"
  defrdport=5344
 -- 
-2.24.1
-
+2.34.1
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-cpp-common-test-applications.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-cpp-common-test-applications.patch
new file mode 100644
index 0000000000..a133826792
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-cpp-common-test-applications.patch
@@ -0,0 +1,46 @@
+From a68641947aa5a8b11c81445a9f79d3018bc79893 Mon Sep 17 00:00:00 2001
+From: Bin Lan <bin.lan.cn@windriver.com>
+Date: Wed, 5 Mar 2025 10:41:42 +0800
+Subject: [PATCH] tests: do not run cpp common test applications
+
+These cpp common test applications are needed to re-build in the target.
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
+---
+ tests/Makefile.am | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 2a4022bc4..8a23bc8f7 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -128,10 +128,11 @@ cpp_common_test_unicode_conv_LDADD = \
+ 	$(top_builddir)/src/lib/libbabeltrace2.la \
+ 	$(COMMON_TEST_LDADD)
+ 
+-TESTS_CPP_COMMON = \
+-	cpp-common/test-c-string-view \
+-	cpp-common/test-uuid \
+-	cpp-common/test-unicode-conv
++TESTS_CPP_COMMON =
++#TESTS_CPP_COMMON = \
++#	cpp-common/test-c-string-view \
++#	cpp-common/test-uuid \
++#	cpp-common/test-unicode-conv
+ 
+ TESTS_LIB = \
+ 	lib/test-bt-uuid \
+@@ -272,7 +273,7 @@ endef
+ $(eval $(call check_target,bindings,$(TESTS_BINDINGS)))
+ $(eval $(call check_target,bitfield,$(TESTS_BITFIELD)))
+ $(eval $(call check_target,cli,$(TESTS_CLI)))
+-$(eval $(call check_target,cpp-common,$(TESTS_CPP_COMMON)))
++#$(eval $(call check_target,cpp-common,$(TESTS_CPP_COMMON)))
+ $(eval $(call check_target,ctf-writer,$(TESTS_CTF_WRITER)))
+ $(eval $(call check_target,lib,$(TESTS_LIB)))
+ $(eval $(call check_target,plugins,$(TESTS_PLUGINS)))
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
deleted file mode 100644
index 805dde8064..0000000000
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 582713cc9a013481eeef253195d644020f637ec4 Mon Sep 17 00:00:00 2001
-Message-Id: <582713cc9a013481eeef253195d644020f637ec4.1583403622.git.wallinux@gmail.com>
-From: Anders Wallin <wallinux@gmail.com>
-Date: Thu, 5 Mar 2020 11:20:04 +0100
-Subject: [PATCH] tests: do not run test applications from .libs
-
-Cross compile specific change
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Anders Wallin <wallinux@gmail.com>
----
- tests/lib/test_plugin | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/lib/test_plugin b/tests/lib/test_plugin
-index 652c90cc..1f817c50 100755
---- a/tests/lib/test_plugin
-+++ b/tests/lib/test_plugin
-@@ -26,4 +26,4 @@ fi
- # shellcheck source=../utils/utils.sh
- source "$UTILSSH"
- 
--"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins/.libs"
-+"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins"
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-in-.libs.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-in-.libs.patch
new file mode 100644
index 0000000000..36d7184e97
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-in-.libs.patch
@@ -0,0 +1,27 @@
+From 32494b1726a881883cb6d317ab76d1ec3f1fa740 Mon Sep 17 00:00:00 2001
+From: Bin Lan <bin.lan.cn@windriver.com>
+Date: Wed, 5 Mar 2025 10:51:11 +0800
+Subject: [PATCH] tests: do not run test applications in .libs
+
+.libs is not exist when cross build.
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
+---
+ tests/lib/test-plugins.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/lib/test-plugins.sh b/tests/lib/test-plugins.sh
+index f83e42baa..939236393 100755
+--- a/tests/lib/test-plugins.sh
++++ b/tests/lib/test-plugins.sh
+@@ -14,4 +14,4 @@ fi
+ # shellcheck source=../utils/utils.sh
+ source "$UTILSSH"
+ 
+-"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/test-plugins-plugins/.libs"
++"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/test-plugins-plugins"
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/babeltrace2/run-ptest b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
index 71a9c81bfb..f3796d4340 100755
--- a/meta/recipes-kernel/lttng/babeltrace2/run-ptest
+++ b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
@@ -16,4 +16,4 @@ if [ -e tests/test-suite.log ]; then
     cat tests/test-suite.log
 fi
 
-exit $exitcode
\ No newline at end of file
+exit $exitcode
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
similarity index 81%
rename from meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
index a50ba8fcdf..793301f46e 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
@@ -2,17 +2,18 @@ SUMMARY = "Babeltrace2 - Trace Format Babel Tower"
 DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
 HOMEPAGE = "http://babeltrace.org/"
 BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
-LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
+LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause & BSD-4-Clause & GPL-3.0-or-later & CC-BY-SA-4.0 & PSF-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f6b015e4f388d6e78adb1b1f9a887d06"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0;protocol=https \
+SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https \
            file://run-ptest \
-           file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \
+           file://0001-tests-do-not-run-cpp-common-test-applications.patch \
+           file://0001-tests-do-not-run-test-applications-in-.libs.patch \
            "
-SRCREV = "0a6632f77801f3218a288604c646f8a39cb0d2c4"
+SRCREV = "e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
@@ -33,6 +34,14 @@ LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', '-fuse-ld
 # coreutils since we need full mktemp
 RDEPENDS:${PN}-ptest += "bash gawk python3 make grep coreutils findutils"
 
+do_configure:append() {
+    # when doing cross compile, the path ${B}/src/plugins/ctf/common/src/metadata/tsdl
+    # is not created by the babeltrace2 build system. It is need when generating
+    # parser.cpp by executing /bin/bash ../../git/config/ylwrap.
+    # So make this directory after configuration.
+    mkdir -p ${B}/src/plugins/ctf/common/src/metadata/tsdl
+}
+
 do_compile_ptest () {
     make -C tests all
 }
@@ -93,3 +102,5 @@ do_install_ptest () {
     # Remove architechture specific testfiles
     rm -rf ${D}${PTEST_PATH}/tests/data/plugins/flt.lttng-utils.debug-info/*
 }
+
+INSANE_SKIP:${PN}-ptest += "buildpaths"
-- 
2.34.1


