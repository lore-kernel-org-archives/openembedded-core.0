Return-Path: <Ruiqiang.Hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98567E674AB
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 07:15:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.32011.1730445349078685800
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 00:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=103515410f=ruiqiang.hao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A16iVTv005513
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Nov 2024 00:15:48 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42mew20ms6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 00:15:48 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A17FmRM020570
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Nov 2024 00:15:48 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42mew20ms4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 00:15:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuIE7V0oyx7c8861b2ZcmG5uze8c9lIkxM5t6OjSV7mY4SR8fnZcigQ7+lklXn71dqhGiXTVml8up/3/HdJJe3+Oh/7r+FbfAwQCtXb3r+sAdtKwY34OlYasonYn8PL8oAy3hanRgPo8DWHv695rqqTfltvqCiEfPw2UFKypUowL8RqugZVE5OcEAZd4jvMHRTsH4NquZhPkycMVE2rh092N3iNBC/rV/9FAeC6saiuW2Ebm9e1M+vE5Tpp/o3vESr1ZgNLJLDoAlrhiPedaIHO+Yd/SLrhMG9V6aT9GzXfCF1tooLtcb3OVgpqydK+7f5jYxaN7nllgkPOXSu0cdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9neoRbrBMe4hJj3HyRH05EQmDpi6Y5qQWTpd8j4QbUc=;
 b=QzmQjWDKn6+VlwW1QIunquFD9Yf8XSFxX8/IJLrZLHm3Of24BdEi9nY4d+iKLSKPNt0NnLiXIYz25UXWI19R9xOeMvQNQKcjJ/rgwexL1UkS651J4632iMb/hRPCc9WNmrjRDIEIWScAPC6gjmF63gKoL0sjNuM/UQX4JhGJUHGyiF7C4mRAdkL02pCqU7pn//Z7y6N3IWlTk5djAOmqPOlVjwgCIxeWIQj6e+5bOfl7alhnuBtUzLkW9WjoODsdus9+OiuzTWmBwU+PPmOLpVqqQkl4w+xdZT+nIJ+Qxe/JYxyk8Ut+n87RcwtjeRq4xz6TAbXnAfAyGRghMI0naQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8025.namprd11.prod.outlook.com (2603:10b6:806:2dc::19)
 by PH7PR11MB6955.namprd11.prod.outlook.com (2603:10b6:510:206::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23; Fri, 1 Nov
 2024 07:15:43 +0000
Received: from SN7PR11MB8025.namprd11.prod.outlook.com
 ([fe80::a5fe:8f1a:b4b:d00a]) by SN7PR11MB8025.namprd11.prod.outlook.com
 ([fe80::a5fe:8f1a:b4b:d00a%2]) with mapi id 15.20.8093.027; Fri, 1 Nov 2024
 07:15:43 +0000
From: Ruiqiang Hao <ruiqiang.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [kirkstone][PATCH] gcc: restore a patch for Neoverse N2 core
Date: Fri,  1 Nov 2024 15:15:33 +0800
Message-ID: <20241101071533.2664148-1-ruiqiang.hao@windriver.com>
X-Mailer: git-send-email 2.46.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0192.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::36) To SN7PR11MB8025.namprd11.prod.outlook.com
 (2603:10b6:806:2dc::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8025:EE_|PH7PR11MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: 97ec6a1d-192e-4bba-35c0-08dcfa44ff8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9/5ittiPZPXmmBfaDOiImiXKpM+iTI/UrVmw2QunbfZFpLI6TS4ethzjZ6VX?=
 =?us-ascii?Q?YLCCnhTTjk3ug8QHVOcWlY7m8Rm5S48sBX77ktLODnx/5nx7qWFsdoHNH/fX?=
 =?us-ascii?Q?UShM1DIMg1erzOMKK0z7k/dO6yCaDWlG5rCYg2i0Ein5KM6+JPVVW79jXp5Q?=
 =?us-ascii?Q?3IlDEv6MzpQ1sw3uVZPnoGSlM8IG8IZzqpGndGGVF1nwbM+2fFZlgIwIHK2M?=
 =?us-ascii?Q?KCI2Q+g0NnGC7QY98mcyKmQo93cZGQdi4buQS3jkxFbgZLku59aum7CTnIf0?=
 =?us-ascii?Q?Ql5MKQj/76AImrcdxlEQ++h2kKzKaWy10XwuR6Khto19Kg2axsfvWABwPMkK?=
 =?us-ascii?Q?PtZ9Eqd7B+dbnxqkf4dDcjVNYPWyC95/S9ZY4iT9sHBzVoTBreEiPUZ/44MP?=
 =?us-ascii?Q?vEQ/4MjCkcK3dXAnjWW1COiQE86y/gbG3g1VE/61KYmOqEJGDWi/uUz15orM?=
 =?us-ascii?Q?4GhFRg5JPM3eP2oJFIHFoTO4RRUSbC4zYyNAblnYbzO9cp1eX/PEoXbNzuLi?=
 =?us-ascii?Q?9jNdodQRpjiPTtUHFkQaRxuWsiPAa4dMpTcnjf0qNaDIcQWjyVKwBJxM2jDl?=
 =?us-ascii?Q?8cCo13c9NTPwGoqafq+xdmj9P0wE8Re7Bm1jFxWnGv5a8/WDIs7cj1MWZRjM?=
 =?us-ascii?Q?oPeE1NmRclnpSuIwgQNhFjkmvQ0w5HGmHtdn5k4luUOqLGRGZpobasE3S4Pi?=
 =?us-ascii?Q?kvGzUGWDvO+9f1QaNTvZcSQPeQzYgDJB4CPeeK2WN47/L1HeuXVdisos/z8Y?=
 =?us-ascii?Q?3v3xNXIAbvPbmujtVEzRdIfgzwUum0xXs4Xu10vZ531EWqL3nS5wZvOkal3w?=
 =?us-ascii?Q?AUdyGr1m3xxGaCnGFR3dXm2D8omJjY2fHLcmUEH+V6YxhaFoGvmXD0mLLskQ?=
 =?us-ascii?Q?CUd6hpErWYyXOC4hjkp2WGl+53hAhSP2GmZ/I9JWc6/oYkpqzbFYW3dnDE3D?=
 =?us-ascii?Q?w1r0r7N0eFMxZRQL14rUKVy5vcD+rLQpdljV/LSF51kbNVfhnpxmc9EAphVa?=
 =?us-ascii?Q?L2iHfiKn2J+WljxejNvGHFgjaBsgUrqwNqAy/LzgnWjCX7F6AioZJKjRXfm6?=
 =?us-ascii?Q?pk/oqdcCCmwzo3sc6zfhK0qquMR1KIS5qGRxAvhhFkC65dP+qb/U9Wj94kua?=
 =?us-ascii?Q?BtbckR0lTkOO8UUQcth3ulXdUU0LR6OKneQLWap8sOCxgOAZQFI6X5cWQXX8?=
 =?us-ascii?Q?U9BmahRwEnkPIQI8yjUPqYo3ykFLqVRNKgwZteSGxvZfyBAKskrjVl5vOYNi?=
 =?us-ascii?Q?dw/4RtMd3deNVVkWvDVducHuNpjno+oWIaWbFrMJDth5w9TBmuGbWQtvPGe+?=
 =?us-ascii?Q?iqSACU17ea1LJ1yFhiFLqs0NDrNqwbu1NVAdz4nDKOrxnXQMakNXSNLnlZR/?=
 =?us-ascii?Q?vSl2hPs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8025.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sDr4gnNQsc1pKGTtdhlTWiy5PNrIJQa/K0q67aE3ReRCzdtTNf1uYIJTuK95?=
 =?us-ascii?Q?b1mclxLji8NTcwBBDYkBmYEMHFugPLlJCE8Sl6V5aYhYAUlFPvDgI77awA9A?=
 =?us-ascii?Q?2C4lHvh0K1yN6jiQ/96wG5PE2v40iI+x9QvsMkv0lMb+QXkBU/5x02zDAaT9?=
 =?us-ascii?Q?EnT8h+RhBSK/31ZFSp1xdrvVdAnFDZMwBHHS4MCgkEZmIC4k0CWo8o2W2tnP?=
 =?us-ascii?Q?mEG6DHV5Pr3txVPRYLIZdPI814UX530lTsIicnjuCnX1TbGHgw/W2dlkDGWA?=
 =?us-ascii?Q?2u3plbQYv0qi57dA3HjtcHVUJ+8SqOWeuVF2GnjrkVkbVshwB5fjr0PkgDne?=
 =?us-ascii?Q?mHAkh2nSCF3H1Z9Gv4Szs0XCxNN0uYH9fTxZjG6dWmOosmz4NV394Iw2leZI?=
 =?us-ascii?Q?S4GXcmuA2f5y2Z3/oS2Ae7x84/bXs+LNbDB62fxeMztz5pSTD1KqeNwyoa+4?=
 =?us-ascii?Q?31uOVN6UO3aRbfJEJNPNLoHjl9TrJhBWY7/W2Y8vpJpoliHbYCAzDd3l95o9?=
 =?us-ascii?Q?djCLwp7PSV/Cv7qlD4etPmJeTCXqvpWADgDpkSFLuxaBMHGoHtAEc9QBTVYC?=
 =?us-ascii?Q?oda3bIaQXKNbqb8hBbESaYTGi77NpgZ9Rmdu7lW75U4zGXa+AfyC4sCM/l6Z?=
 =?us-ascii?Q?w905HnOGRU4TUhKgOGt9yY0bqrJF+6VW47hHL+DHm74tGs2+vGp7Ja4d5xSg?=
 =?us-ascii?Q?IB6JCBzDeghRWe89L+gw2JNIOjQ3qR9yfrV2nfaCP7eE9BuP2VPMTt2kmSp4?=
 =?us-ascii?Q?cginnaunc24Ujra9SP5SmnqWtnQzm+2JpLHBtJ1MQCzEXShStF8MSnO0hle1?=
 =?us-ascii?Q?9522fMFdS6rRFBffskFs1HL3NlZdBbTkTnv0LFmJvXYCvV08C6xAjeLfWyx6?=
 =?us-ascii?Q?pO6ZJTMujIlSd80yFYye1/b6K+TJQuVitZfFEU9AcWvwdGsHYWG6nsCXEJcj?=
 =?us-ascii?Q?zBUb2BO0DAnDwTtWYQTv/G4m8ILOOf9QJ+Rw3tTMe2+DoSpiPrf81qOvPlgP?=
 =?us-ascii?Q?RPHNsTbC49uwlnapmw6xTA2xoTIdseRp03+cZbqwR/1wYonWi1unhKccmFBr?=
 =?us-ascii?Q?vEq9VckHXAJv6UPklZnS0ne8LeRttlqaA76A8gPo6IjotAtA0io/AM4rkv9U?=
 =?us-ascii?Q?1m77Azvcu3S0ifkp7tKMAZJy9R0rklwyzIIdRswstFt8H7qMotzrj+FvVnkb?=
 =?us-ascii?Q?pPdrM5r6eZr9hGHJm92UaaMGAYtK0AUKe5v5mrnNNtXLmUQvGrtq5irbugBP?=
 =?us-ascii?Q?I1A2+N3RiwdNuarZ2mz7IdBc6yhqszPA+HD72c/WD30mH9fecihTNy11dz7q?=
 =?us-ascii?Q?/JB2b5n5x7zaapT43aJf0nCTi2MzXpEq+eN4I2s07gns2VM5kC4ZgZDjUVZq?=
 =?us-ascii?Q?mOExHumNT35rgE0LgpLtB8jywlfoAL9P6AzRIraCmGYWMBvJO4JkJGBN7h79?=
 =?us-ascii?Q?Q/vyCaS3eLFw9XX6c6P0Q393jI4NBGvA5FplTG6TemF88oSOvh0xhF5KMpO4?=
 =?us-ascii?Q?NAVZZDA/Qgv/hfUwqDoA3OA/XWAg9AasVrIqo+02RRoyEfnjt8klzm073UvX?=
 =?us-ascii?Q?C3EbXHxOU62j/szNVojEsl3gfwmBHr7OewOkTFqm0JNmxwIGwS+CenESb5xM?=
 =?us-ascii?Q?tg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ec6a1d-192e-4bba-35c0-08dcfa44ff8e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8025.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 07:15:43.3896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PoAOm7Mn55J590bUl4SA+nUIPo4i9cAupCN2fSW5aPCkerLbJI6uij8VCcLIERa6D1NtK/Gim76N4iIUM8cDgtNawWXCV77RpQY4pF2dplU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6955
X-Proofpoint-GUID: tnSw3MU3NkVq0nJ5JEZD6rTLJgMYzGOH
X-Authority-Analysis: v=2.4 cv=dLb0m/Zb c=1 sm=1 tr=0 ts=67248024 cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=jN4iaJhYB4-MydK8JBoA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: PJoI5GIQuBI-mRj49DBV0yZ9z_mXIuDv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_03,2024-10-31_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 mlxscore=0 mlxlogscore=743 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411010050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 07:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206601

From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>

Commit 7806e21e7d47 ("gcc: upgrade to v11.5") removed one patch named
0001-aarch64-Update-Neoverse-N2-core-defini.patch by mistake, this will
cause the Neoverse N2 core to be identified as the armv8.5 architecture,
restore this patch to avoid related compilation issues.

Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-11.5.inc        |  1 +
 ...4-Update-Neoverse-N2-core-definition.patch | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-definition.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.5.inc b/meta/recipes-devtools/gcc/gcc-11.5.inc
index 5d29b8e61e..f17ec9da5c 100644
--- a/meta/recipes-devtools/gcc/gcc-11.5.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.5.inc
@@ -65,6 +65,7 @@ SRC_URI = "\
            file://0003-CVE-2021-42574.patch \
            file://0004-CVE-2021-42574.patch \
            file://0001-CVE-2021-46195.patch \
+           file://0001-aarch64-Update-Neoverse-N2-core-definition.patch \
 	   file://0002-aarch64-add-armv9-a-to-march.patch \
 	   file://0003-aarch64-Enable-FP16-feature-by-default-for-Armv9.patch \
 	   file://0004-arm-add-armv9-a-architecture-to-march.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-definition.patch b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-definition.patch
new file mode 100644
index 0000000000..4159042ebb
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-definition.patch
@@ -0,0 +1,40 @@
+From 30ade014c7b7d22a2a26697b5a2079a278ea560d Mon Sep 17 00:00:00 2001
+From: Andre Vieira <andre.simoesdiasvieira@arm.com>
+Date: Thu, 8 Sep 2022 06:02:18 +0000
+Subject: [PATCH] aarch64: Update Neoverse N2 core definition
+
+commit 9f37d31324f89d0b7b2abac988a976d121ae29c6 from upstream.
+
+gcc/ChangeLog:
+
+        * config/aarch64/aarch64-cores.def: Update Neoverse N2 core entry.
+
+Upstream-Status: Backport
+Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
+---
+ gcc/config/aarch64/aarch64-cores.def | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config/aarch64/aarch64-cores.def b/gcc/config/aarch64/aarch64-cores.def
+index 0243e3d4d..722f3e64e 100644
+--- a/gcc/config/aarch64/aarch64-cores.def
++++ b/gcc/config/aarch64/aarch64-cores.def
+@@ -147,7 +147,6 @@ AARCH64_CORE("neoverse-512tvb", neoverse512tvb, cortexa57, 8_4A,  AARCH64_FL_FOR
+ AARCH64_CORE("saphira",     saphira,    saphira,    8_4A,  AARCH64_FL_FOR_ARCH8_4 | AARCH64_FL_CRYPTO, saphira,   0x51, 0xC01, -1)
+ 
+ /* Armv8.5-A Architecture Processors.  */
+-AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 8_5A, AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG, neoversen2, 0x41, 0xd49, -1)
+ AARCH64_CORE("cobalt-100",   cobalt100, cortexa57, 8_5A, AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG, neoversen2, 0x6d, 0xd49, -1)
+ AARCH64_CORE("neoverse-v2", neoversev2, cortexa57, 8_5A, AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG, neoverse512tvb, 0x41, 0xd4f, -1)
+ AARCH64_CORE("grace", grace, cortexa57, 8_5A, AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_CRYPTO | AARCH64_FL_SHA3 | AARCH64_FL_SM4 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_SVE2_AES | AARCH64_FL_SVE2_SM4 | AARCH64_FL_SVE2_SHA3, neoverse512tvb, 0x41, 0xd4f, -1)
+@@ -167,4 +166,7 @@ AARCH64_CORE("cortex-a76.cortex-a55",  cortexa76cortexa55, cortexa53, 8_2A,  AAR
+ /* Armv8-R Architecture Processors.  */
+ AARCH64_CORE("cortex-r82", cortexr82, cortexa53, 8R, AARCH64_FL_FOR_ARCH8_R, cortexa53, 0x41, 0xd15, -1)
+ 
++/* Armv9-A Architecture Processors. */
++AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 9A, AARCH64_FL_FOR_ARCH9 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG | AARCH64_FL_PROFILE, neoversen2, 0x41, 0xd49, -1)
++
+ #undef AARCH64_CORE
+-- 
+2.46.2
+
-- 
2.46.2


