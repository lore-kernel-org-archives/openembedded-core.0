Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B2BC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 10:42:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5515.1750761737571816843
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 03:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=827047d704=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O508Xq027766
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 03:42:17 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14ttyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 03:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eyzE3pbmmmyLBl9UhPGisxZkamR4bZOl5x4/klexUdEkv4KatM6vddcEqYrFryz7BlnrGIjhHByFXiz33haqXFPJ2N5k3BaBZRXVWAFLUFKf1NpzXqSCkoBUmVzg63Acxzi6iBUgI1v64I6FPyPMsPmS6QoNU3BJGVDQRVAKZNWqzU57KWxpnNYdWxavuewsDa74Pk7sogY+SnQkYQ0qCcR7QcrpHDVFMlPAHr0t+hGtUy/KLpNNe4WPqF7wLP42VnPZ3V4myQp+1VaB4HhiqeHfBRf/yAtjaeYM0gldgEisLvRfLLdhpEKw1yb098TntIqDDymnnM4Qo37wbQv80w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FkAlukFWKDlvL8zlKqVtqxMjcGqIzFmGCjOLHNeE0M=;
 b=qe3V5JZV6v6hYwmC0djD52IYXQ0BfHzTyB1Om5hWva5rPhddeACkkoYJDemP4WaMP69qIdEUPtAn/4+j8nmwZMjlcbJO6SH9SfzHkUahfKeXtUOWfiSxgHC18QZ2Wpnbpd2jv/845Ld4IUTKhJslrdgEixr+DR0KUNnkz8XhoQ/rjGV2lo8hu+P5cggs9BYJaVYUw3tl8M9IusrJdgxVZ5eDt5lgt9Oagl/SZ5Omm/TENFYF5xCVPy9UG7l0IUW5NdGiOzn1d1kTuz4oKekjJ7XEAEWnzAA4Hm81+0ZWT9wh9P+GlvAbTTSi66qFb2nQkTYbo4ZTZoypF5V9LtzpZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8083.namprd11.prod.outlook.com (2603:10b6:8:15e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.30; Tue, 24 Jun 2025 10:42:15 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 10:42:15 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] gnupg: drop -unknown suffix from version number
Date: Tue, 24 Jun 2025 18:41:51 +0800
Message-Id: <20250624104155.559827-5-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 45edd307-1149-4253-22f0-08ddb30bc8cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ounzDX2ehozBB6KQjY30O0T1TPHjcncTkQ0XLqnOGHJ05txkLkE44STC4Q7Y?=
 =?us-ascii?Q?y8D7jmP1iMcPAIxUzYMambrxPuD6N/YndPvlFp8U9bzee5Jju2ucNtzpdP27?=
 =?us-ascii?Q?pyGGEYzov8DkNJfifF60NjYmwAD+WO4qu/31Uo14cZ0GNZ8ikCcUrk6Ok1m5?=
 =?us-ascii?Q?kiBecuS02u/D/eupOjn1Z7GnSi0mT+OxaE8xgRsiG8YuvVPo40ECvpJFTgYD?=
 =?us-ascii?Q?tBMit1WNNU+X2wH4mW8UAEN+u+y/QHK5WFLE8JvPNX3jYBsr3RQtK+ajTep6?=
 =?us-ascii?Q?9e7QB5dZ4tr9oTGdtj7aFijGiI9BexNtHLKK/hZ/ZZW47auXdM6/YUYYyEL2?=
 =?us-ascii?Q?af+nNxcobs2az/OkH7pEjn8fn6NKjKAJl89/LhPhTqfqmDlWBUFTav5MiGje?=
 =?us-ascii?Q?Sj0/H/rIDr2wQnzkSBFo9FCB9soQz9pIpGRlZDYqGmEH5JM0TV1LSpK0Qo12?=
 =?us-ascii?Q?7+L40X7HiKI5ZeY0rHoTZlKJ3A1hGKtnE+zu+TTeHLKF6NYyQjxhZkLcm52K?=
 =?us-ascii?Q?JsOHvlLBYyQbUcm4P4jQarnwLW6Nm5EdLhwLNLvI+a8ZHPtWDvxcdFJmc1u+?=
 =?us-ascii?Q?FEOxdkvtBoiJXiCG0b77wjZKBDv7qmZObnGz71cFIPfLAixfuWSzYzkR6Aw3?=
 =?us-ascii?Q?A5TH6ZRkwr7+xDdSrvS+xAaSIXa3JG4nTBrk0jflixMBhXMUTnATmNfPPbys?=
 =?us-ascii?Q?DnILlTUC/A1H77DYOXnA+o+E+1gIFZvZ0pSkKlfyk1rCwuG6/MqkxcZFvpKf?=
 =?us-ascii?Q?zL2ZrUxYOjx3fHJpdM4DV/PPClLL8mLKvFOcA2LyShu7ZjoYDnTEB866mZSS?=
 =?us-ascii?Q?h8VxJ054uOF+0bdWvGw8gi8oIkgzgTNscHI1w8ppv7qDYFeRczNBpPlfXnPA?=
 =?us-ascii?Q?wVenJp5t16N/z9WxiOgKfP2I/w2DqUnn6iXfXhhmfZQNTktcdUHRfvn3amjh?=
 =?us-ascii?Q?Yf/h3E5BxQyCnZe1t614eXfL0GOxthMuvXONUPpW+UE9b9bQdeSHErsCockm?=
 =?us-ascii?Q?AOZQNSgWgJCbSPlw3zo9s2zQ+8hLTKtCZrqQzalqY9hAnfEeVjJ6oF8nteHr?=
 =?us-ascii?Q?G92y4Ytz+Fzv4QFyfkWAyn2mSR3PGz/BMDzQCWaff4/LtLyPHnOhlnl1wGaO?=
 =?us-ascii?Q?OkjbmSeY98BfFwrbPuhD/I+sX9PsDGhR3sPsajMzVyZlo+hfK/X7FH7PXEEH?=
 =?us-ascii?Q?QRzgNl5wva3b/UxH+kd24Mq2PGB+fI9EjhNbEvgoHoo/F3R7p2ESfAj5BMIF?=
 =?us-ascii?Q?ekMjnejQHDocBKwG/1gyRPTYC1hcpseJKgfzgKkjkOMzgBZQcoFE7Hmnn76a?=
 =?us-ascii?Q?rkEJRIKDp/T0ZSJRlNihksGwFZMmNsoomKyMKs6ZCFlS6fcrGmAX0SZ0Fp51?=
 =?us-ascii?Q?jCeLvxB3mOVNa3Bm5Os5j3nEPiBKfioAIXtbQRdzUCypCsIOY+NrQqPXtBf4?=
 =?us-ascii?Q?K+zGHZc5Q6l60coUgT+ZTiYqbSHUaX9K5FD7E9SrsjUzP8+NcBM1EQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IfxMrG5F0wx7adCKav2TC0yb3FLL3wl4fbzHHFTpJ9HtxDugMP9+axf98HM+?=
 =?us-ascii?Q?x8w82VGmcO8mQhdAtgVrs/kzkUi0/QcdThpp8DZSvuUaMWZvLp+TlpghNTDp?=
 =?us-ascii?Q?2pHlnzC21dNrkfej9jTn/OqEJM68IdNigm9OtxfZIqOJikFE6+L2dNOco3uI?=
 =?us-ascii?Q?m4v/xjleErT8Qzcd+SEzim7gP6GbP43OGtMyXWJN7sQnIipqSstNdWAKHzML?=
 =?us-ascii?Q?aH/Db5TkMftqaMVnca4A9/ruESI5SOAQGf3vtotZTBcTkUlv5PYHwWs+cysd?=
 =?us-ascii?Q?pAbS7eD/wIthXEpPW6dpCrjNiMivCPqWNg2VkvLOV3VjpDFRzmlCM8y4UQtW?=
 =?us-ascii?Q?Vd8u8rVbWK4oSIYZEdAJb1eAR3pjHzlQ8hnLG6fqDd47q2d4WqDzNS+xEaYD?=
 =?us-ascii?Q?2cEMKwzmDDl6EtWM+El8JeuBa5uXFV3ni4hPg6Li+Zib710DXqA7oO9cWeyz?=
 =?us-ascii?Q?PJLsf7VL8LBVk2tUIZlLX/ta3REJxyH79kY1i7JkIqJbrE8wnwcGjyKWGLNG?=
 =?us-ascii?Q?ZgTWdGzhO9b0kJEXavmGXPDtF2nyJeT22yz9vPGuVe4/C8yAaIcqsUxTeHVD?=
 =?us-ascii?Q?ncpmEJgxdqaaJXCenI9CUAO6/paMhmKmvPgY5JWQPGJQpdH2018D3Q2DoYwq?=
 =?us-ascii?Q?90adMZ4GljRN2XA4MyZqFfxhEBl8T6Bw9tA3YjsHklyfrknMRI8lYKMXjaqz?=
 =?us-ascii?Q?GnTLsaIs+P5ZGqcWTSnIc4CmWrKZHJnPrBQcRTo2x559LmHaID9Lvb0Xadzf?=
 =?us-ascii?Q?rjXOu6Zr+XOfJ/YenQpIuKzh9GKZ3zDEHTMI88xk5WcRJ4YXZ6we6KjYD/zT?=
 =?us-ascii?Q?toa7JoO+z/oicy4LjpxNuzAEBIS1ORNVRLYOWuacQDAkIjeMNZ8YYQHAPZZy?=
 =?us-ascii?Q?Ooymtv9WinrmP5spY6cINelD7lMSCGdP6CVNmZuxEBROXFx5toNAp7FJYp62?=
 =?us-ascii?Q?gImxLyK/EKgeMwaWCgOJvHO+s8rTcM2CxnXia1nLBId7xjv5/PykPxSfHSKP?=
 =?us-ascii?Q?N+S2LunMnLV9lP0gXh28RP7Xc69K9LRm/3+F8IpT9c3hqOOKfPiBnrHOGCFk?=
 =?us-ascii?Q?be0GW+64nbxYGqmZzdYnxe6GepEwqZ7M6toWKND1PAbeer/LUuLDBKrHoIPD?=
 =?us-ascii?Q?hgCOtuG2blhSpBQ3+QWAR/hT5GbATcARlg7RwIbrrcUam+p5rBtP/Vy3M3Zq?=
 =?us-ascii?Q?n+6PuKlsP0zFX1LJglbeSV0VNbv9n4gmu4QAgrpUBBb9tuKUXo80Z04GfURf?=
 =?us-ascii?Q?MYJIN7t+ZaDrjtZR2L+Fol2bIS+H0vQgxUHdyQ3WLyXa6SJBkp9DIYjZ7sou?=
 =?us-ascii?Q?qyk4F1dGgQil852mJnopmiZdRQUikFTNi1RRL94XVgNQkB/jjTKOUaAj/cno?=
 =?us-ascii?Q?igmYusequlXUHdGeZB4uszieC8vUq+zzu5jv/HPMXqA7TfN9ILH4zeLD/t7j?=
 =?us-ascii?Q?jkRZ8e1TCjpI2spGHaGWEIDRVFw/JZGXAT7z9uTjC7Pt2Z0K0MEjESRCuAp7?=
 =?us-ascii?Q?MrfLcq0shEAFVRe6M+j+PN79O4nxvBmzn/HWF8ahCkx6WS9mtQrBzATFKgOf?=
 =?us-ascii?Q?NhgQJykMLUkSn+PygyYYuZGkJJmDD5Yg1XEP/Qc0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45edd307-1149-4253-22f0-08ddb30bc8cc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 10:42:15.3010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOF5ClwmzMZiQe/C8nD2qNlmGao1MiqM+IFbi4jqcXm9bgcGAkS2vhO+RiBgCrRHXcSDV3DIz6ocpUYozB6jtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8083
X-Proofpoint-ORIG-GUID: PIni2dzZNpJvJKAfQSun_jvZC_5WrIW0
X-Proofpoint-GUID: PIni2dzZNpJvJKAfQSun_jvZC_5WrIW0
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=685a8109 cx=c_pps a=JVdHkOrRnBzWLs0TqoS/Hw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=ggHxpCNd9HcqE3gEoxkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA5MCBTYWx0ZWRfXx0cXcRVuPW5L FRWYl63qrrKgRR2Pv69mtW0y2C9lB6hnIO7eTcetUAbLhXixlxjcpM7kJfnmWTgUkL+NXJ2aBGv feG4V37qW7s5VKGBHt11FDHg1bCiT5Gi6gAEvkyvwHghWBBeDkgwZr51CNz06SYzuqeM3412elu
 +iyuhSU9Zz4fynEK0/5paD000G1LhCmVEPbuDpuuGzbl+Bl03xwljEwmrop02CW4/0zdk04yPDP SRwbRPEbyPNBgqVC/tffX3G6fYC2+/dFXS7VuL/+twIbV9VAc2db6xVNeI3RYIyKpX/5iBBDcOs HqVumzgPXg8ERW6yrzI1X9HRBEcEbBnexpGYsFYrEq8ytzRKS1MULBkpKBSYB7R31dpn5SKYSTu
 grgL+1XpRpcWePAUb9hSNNLLOBpcm+dXE067zS2I+J2JoRcjMQKuQnJkBYDnFhDzIGvr4hRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=817
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 10:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219245

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


