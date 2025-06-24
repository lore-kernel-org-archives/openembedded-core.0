Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03B3C7EE33
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 10:42:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5514.1750761735058332504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 03:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=827047d704=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O3GYFC028307
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 03:42:14 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dv8mjp8p-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 03:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBx0xOg36/+eotuQRPbu2O387PE3n8lKhXT6ZYB9I3TGxNWkKrYi8qLiD36PX7ILlgJ4Ryx3E2n+HFUv0NIfZsPNEw6ATeJhV/m4tIiJ8OcXHKJFhTBKeVir8lTBsY64pJ/xkNYdNyqUMtC7ryziZs3eCEiqBccO/V8tDanNNL2wkrwa9GiRz7O72uGEu0gzQmxkw9DRLPwDog3cG3oB6PK0S1eMNc/aR76cAVCsP2yuyTDc44dZFGK4l2LcVIGpAS5LlgmibOLE7D0uYRBfAy4WBcnGVsxv47z7jXcqw1zMwQUoj5hOWWb0fbKAmDGJM6aOkqQBFDCNpQLg+W3UFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lW/1dHDbdvl5lsHj06YV2dwt8vkGg083ptB9FoUj0T8=;
 b=E1HjL9fMHdXAH7PTZMw45sh7DVtxEoEUgywbYOPoDto9Fl4L6BDI118BbWvBBUJA3WvzEXZfeDYbCA0Q9u30Z0YD9uuDE9zs54NSMl6HeP6CNtEMgbJrvRjyi01nOIydhypytGxxr5RBV6cbdbS8YR69ewDPedTp0t4fYkBgcrAPXMvtCqvwKnhr6Mpi+ZhR0r0xqQHWKnj4Ltz4SvwF2df/V4KDXv881RARW+5R21HNZPt0SH6KTTI0XuwCJ04CLWLyWdrS69xoQwUTYOmg+92AAQJ6+r30aPwc7piGow7hR3p8YrHaHDI70OQ3slFH/R4qZu55Yam3xJIZ8KKF/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8083.namprd11.prod.outlook.com (2603:10b6:8:15e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.30; Tue, 24 Jun 2025 10:42:13 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 10:42:13 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] pinentry: drop -unknown suffix from version number
Date: Tue, 24 Jun 2025 18:41:49 +0800
Message-Id: <20250624104155.559827-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624104155.559827-1-yi.zhao@windriver.com>
References: <20250624104155.559827-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:405:4::32) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a96a1b5-af44-456f-69f3-08ddb30bc764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GjLorogGb/F8y+yhH3Ot4J8LLhrZvLWTtainYwZF2/9GcOB1QQ4/UjrTslds?=
 =?us-ascii?Q?ILoyg07VGMFO6UdAfoRdZKJG2LDfSLeXQBcieLbG69mP6XiMd82GQrGByjwn?=
 =?us-ascii?Q?GFBkuArYsuzmFfGK0lhmo9XoadS5pG+chxYcd8jAecM04siukcO533in0boI?=
 =?us-ascii?Q?aiQnm19/n2N2JJ5VG6BzvL5Zl7B8ZtyOB983bffJdYB3Ai9Y/k4/simQkCQq?=
 =?us-ascii?Q?8Zuo/NEvO9VRodFy1B8hUY6zSvgrSGxDWHi0oY71HesEMyc9FgDiCXl0Coaz?=
 =?us-ascii?Q?p9A6U9qptEuinZkNIEYeQz8P0cGrhf9d2hsmB46WgIaF8Xb1y2Su8WUZygd+?=
 =?us-ascii?Q?8sUSHcEaRZ7Jr+SghSE83Si1XqvaqQrwytcqdiI5RiSPorPfNzry2jmWSwYp?=
 =?us-ascii?Q?JlR7uPpuhrBz5tM2n+x3tDEVY7Hjq+AnBiVf7Q8uLBjn6BR4hULIWJkovttS?=
 =?us-ascii?Q?/OPvw3pGCE1YZ00h0X5TPb51mBQ83zXPGVEyhm7MvccTSDbhncHr/jOQmwt9?=
 =?us-ascii?Q?vKYaFY/RSlUTUrKlw0eDfIqA4cK9jMAbqCa7Jg+iL+snoFax1mOHAgfwH4Z5?=
 =?us-ascii?Q?5CmyL143tP77cK9MM+Ay9Ub6w+8nV7xRd/VQx2oOQwMWR+QBcUkfVtlLCjzq?=
 =?us-ascii?Q?op/FphsXjLqh4qR4KRQ3+2SnH+H/AjB6jcwmKp6wxvJd+0TGaqtglkAsOJSZ?=
 =?us-ascii?Q?a0t+3RrrVHzKhjk9ihtHH8rhy8XhRWzKV9t5mgvRYEO+JFqNWTthQPWOqYa8?=
 =?us-ascii?Q?P5YF/59WhnA9WROOPzGuWPEOtdm6l041p/y4lfoHlFojLhD9KWUAlwkrZNTw?=
 =?us-ascii?Q?tbnfhuzvLLEmIpum5LJzU6DDMJeYBveP8PIltEdmrhuPu5mQ/AOLQ9lK4e7X?=
 =?us-ascii?Q?Z08PLGsS9hSrmquz5A0n8oYXM+zghxPFna5NJLCgpFCOEY0jBvBiMR1TqIqn?=
 =?us-ascii?Q?JPGfnDJt2TEhL+v2emBmMX90nK5793Ew+D77rdoZOhqujSdHuKLg2WWD8lkG?=
 =?us-ascii?Q?QJuXvLPybb6G6WF49OylOvt2SrJ1sq0WS6dPXtpp57GqnyJZZBLhd/Rfz8XC?=
 =?us-ascii?Q?bT6TO7Da1PPnpMyOOHsGudGwE9tlxaE1/sDfdi2tUeIwDxB3cI8Kw+n9DTRq?=
 =?us-ascii?Q?nq/NdE6g0bLWzO7DK9zdioWjdPv0BTzqzVw11QjTzOZnO4pgUXOzMexKispJ?=
 =?us-ascii?Q?4JioJ0TF9gNWycPQbnoIv2nITyQQxu/dFAZ2VCzAty0mnmnL625Cl9e67610?=
 =?us-ascii?Q?tGBviz6xFEcxTPCz86CsxT87Kn5m56e2A3K5o4tjSXf5Kfq81Og8XSfCYnOH?=
 =?us-ascii?Q?RsXqb/NXrOfWZ9vElc14BUYpu1eaWJPiIzUb0ejriKoybcV8LzGUSB8IMjR1?=
 =?us-ascii?Q?mP14kTN6YaGy7+ae4WQpBNoJsdSTfjxEveDHHgS+ALFxunTCbRBw12MBQGGw?=
 =?us-ascii?Q?feezDU5lUWQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8X00BkeTtW0HfLlootE/ZqObWIC5Er/jcqwTl9AXiKhPGOYU+/EpSCjPchhe?=
 =?us-ascii?Q?eAn4TTgmB9oXL8SEf6DoVvZfZs7n00jTkaXIu2r92r3yM9PNvOFachzLrkYB?=
 =?us-ascii?Q?ZNUvStILUYqyWimSynYEedrYJ/sExzW/RQNwod0R+xFNJdSbmISgO3Kwyjd6?=
 =?us-ascii?Q?DqfSJMjl5xfHyK9VkHjD0gIPBY0hYfOU1XulxEsBBxA6yFw+pdsNgWSVMZr5?=
 =?us-ascii?Q?UOJezZs1Mb0H0m04FTCJm53GlcYBrjQCREqW2RAaX6pMdBZrH/kSlQLmpj3v?=
 =?us-ascii?Q?MHi6NuhsKF3Z6jOTR1YCBiCIPZSj5O9Ak5/s0U6D6yfsvOmq7iH/vkCC4YKd?=
 =?us-ascii?Q?EmIx6yVW4h5aXMH7Wcz3iLRwjjYZFmA0sVXl8pRoLUxk0sD+9/uL8zz+07Ps?=
 =?us-ascii?Q?Q3KR8Ntt0aqDe+5b8Q7WZv/hlI/n6a2S4XDdXxUxTFCzEH5QHkEIoEcmt69Q?=
 =?us-ascii?Q?85vQhhLNem/B9TMzIXn/KLO3qn/M+rEk5JObrf7NqDHo1Y8H83d4puZL4RYn?=
 =?us-ascii?Q?s8FchrMynIWh0xr3/rPNPNIHe8l0Sra9abOexB1BSld7EnllCqrmLzsP2h7y?=
 =?us-ascii?Q?htA2YsLzLtvsvZnKzN28Kk/ef63+T+ElAbM94AGff2gdmblJ3fyBS/JMr9qG?=
 =?us-ascii?Q?XQqlK7ifU7cUyNoP3GFDY+poV2iyloujnG0iHcAfKd8EHGLp3YxhmFk8TP1+?=
 =?us-ascii?Q?RS00/6xNBYYoPqmA+/srDj6hHKuKYidGU5n5+BZdks82yllpeIjjY20h0mKA?=
 =?us-ascii?Q?7x9EX5LepfIxJI/35FvxQtrp3EQnJ+xvel1Wd3LhRtkZGH/bBo6wPRD2bWaO?=
 =?us-ascii?Q?iLTSwkpCJtnlmZRLyut0/ip4rfmx3HxZsFEyfB3jg/gPC3Bdim4NnFBCmioX?=
 =?us-ascii?Q?UA1T/4dEDnTggALtnMItNg6GVmWchFJGMEm4pVyBkE5/zyd2TJD1etDEv8N/?=
 =?us-ascii?Q?CR2eravHmlHsghMpGOcPm4auD/Np1pp9zn5qFqNmcjSkhDg5EbYhuPgpN6zq?=
 =?us-ascii?Q?K6bPI+fIrGDpc5ibfbOC8Be7o556/oYROtHL5tDmXg2uLJCPlhALFdaWWWFt?=
 =?us-ascii?Q?nQnxAdbbDZPf0qQoXyRsgRZz6SHc2dF7ziVeXpkgx2KgMECcRjLw0dY8cuzg?=
 =?us-ascii?Q?8zTUfbU5U+ZXBdz4LcaiAAl+3OLtEZGI6bZ2gh7/p4zmgSHgQKTTzgc100aT?=
 =?us-ascii?Q?yAAlvn1vu9XR1QqC+n5Lfyi4x9NkIWezNzHqEWuvF/Lrzmxo5bj8g4dUQ2pN?=
 =?us-ascii?Q?r0hFPG1SNOjiKJmv1DJy2QPHVgiMVfN+6eeCmOiN7xXpj4mp3NA74sttls11?=
 =?us-ascii?Q?pcrF283l68htIs09YWNvnhhU2uFafSGBrQBegqEc8DRcYhPMxyu9lkcuJKUV?=
 =?us-ascii?Q?RlqdHDIzkhEAahU+EXkFFCjanC7pvx7gUK8GePx7u/E74NY0QpyrcU4ZJII8?=
 =?us-ascii?Q?LZHsKvXXz0bX7OpLPCXVuTJwf6LBWic8G1wSxRYaklHt/aY/g/gv0zss++wi?=
 =?us-ascii?Q?yoQQTCwdZ5lvaK4i5Zpxj5RFMXHfRTzRYpIwMvRB6ydbPNZj5aq98j5SLqBF?=
 =?us-ascii?Q?UJoU8y7zSQ1lobL6Ktydqa8C7endy8C3/SA2lSpB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a96a1b5-af44-456f-69f3-08ddb30bc764
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 10:42:12.9718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQu2UeTmUmzZ8u3Gz7wQ0evjTaM7AqGfmmxI5jZjJn7ysIGP+dp5v6EfpzFi4edtRXkzQtwvIlzlDJ3n0VIVeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8083
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA5MCBTYWx0ZWRfX0lSQqFlwTFLv 5sUO1U3GzKtvIcK6K0WEYpogeWMgInd0roBWbu/t2vmiS0kHnSlPA+3dmgNS4Hgh2JcoH7TPbwJ adpuexDUhYQvhl6bCPNYUfP08t1itYWTFtnRHcXyINgg9aiDfliKnDxq2LOXB7N/eBHG3cjkZut
 ADQcqZVJNkGQCSGZHi6SSJ0N8StK+1VEu0RzPgyvRZ6HPsLV8yz+AsAhDyu/ULTUA9TQjfY5J+i 8WUVpyxZIWgMVv9TbEvTIqnoJSOLYbk4JwaS9us4uxGpjKJ6Gov+Yqj0Y5HjoYryJCCMzWiOWiE uoEARFuobR7PIqYrNDsZ3GutHa3lH0iuUx5805/w3AXEPW+YBPQNVVVbboRM4mK3BslX5GVYHgQ
 7X0lyrNHHa01bAIlj4Gp3fslz1+PO6wjxokSfH4xvZ3IMgccwVrVnYmQpUU8825EftB9I5DM
X-Authority-Analysis: v=2.4 cv=MeNsu4/f c=1 sm=1 tr=0 ts=685a8106 cx=c_pps a=EDI2sMUdhBp/6Fwy26P2Vw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8 a=XZe7PhnZs3Yj-w9OOncA:9 a=4f0m0rT7cLEA:10 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: jomsM4_V5YWe3aWPFI25XxIrGUoA3wkK
X-Proofpoint-ORIG-GUID: jomsM4_V5YWe3aWPFI25XxIrGUoA3wkK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 10:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219243

If autogen.sh is run outside of a git repo, the find-version function
always assumes that pinentry is a beta version and adds the suffix
'-unknown' to the version number.

Befor the fix:
$ pinentry --version
pinentry-curses (pinentry) 1.3.1-unknown

After the fix:
$ pinentry --version
pinentry-curses (pinentry) 1.3.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...p-unknown-suffix-from-version-number.patch | 35 +++++++++++++++++++
 .../pinentry/pinentry_1.3.1.bb                |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/pinentry/pinentry-1.3.1/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch

diff --git a/meta/recipes-support/pinentry/pinentry-1.3.1/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch b/meta/recipes-support/pinentry/pinentry-1.3.1/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
new file mode 100644
index 0000000000..29aed68e40
--- /dev/null
+++ b/meta/recipes-support/pinentry/pinentry-1.3.1/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
@@ -0,0 +1,35 @@
+From 211fd00a631da3e907e3a78890bfd1cf3bbe069e Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 15 Apr 2025 15:32:58 +0800
+Subject: [PATCH] autogen.sh: drop '-unknown' suffix from version number
+
+If autogen.sh is run outside of a git repo, the find-version function
+always assumes that pinentry is a beta version and adds the suffix
+'-unknown' to the version number. This should not work for users who use
+tarball and re-run autoconf in build directory.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ autogen.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index e6efe33..6acff4d 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -269,8 +269,8 @@ if [ "$myhost" = "find-version" ]; then
+       rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
+     else
+       ingit=no
+-      beta=yes
+-      tmp="-unknown"
++      beta=no
++      tmp=""
+       rev="0000000"
+       rvd="0"
+     fi
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/pinentry/pinentry_1.3.1.bb b/meta/recipes-support/pinentry/pinentry_1.3.1.bb
index 14b368177c..aa0592d569 100644
--- a/meta/recipes-support/pinentry/pinentry_1.3.1.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.3.1.bb
@@ -14,6 +14,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libassuan_pkgconf.patch \
            file://gpg-error_pkconf.patch \
+           file://0001-autogen.sh-drop-unknown-suffix-from-version-number.patch \
 "
 
 SRC_URI[sha256sum] = "bc72ee27c7239007ab1896c3c2fae53b076e2c9bd2483dc2769a16902bce8c04"
-- 
2.34.1


