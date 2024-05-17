Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB26AC25B74
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 01:20:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.30156.1715908802831661866
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 18:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=58671a1b33=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44H0uuvZ004333
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 01:20:02 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yn55wm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 01:20:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZZPz6AAmQHgfuSCyX0LdupltrYG060lRoDKM89GlfDKPVBUhj+eF+36uCNHFdNbWpXIoSptHdRUv/yiVWlQBkkFg2tISl6iUur3QFE6M5w8vLRUGR4KXpCOZCW9lKfhTx1wT+gVDsMAST5SSYH2cykeZrD1ALnevsZsJ4jtTtGNpPk6e1zVmq7TJPINdGbzQJvbMNnkFukcH3XePJRmr2m8lf75Mgu/NRkAf1uWWgJjdHLPM/ibePNl7QT0nkcJJjFCcPSzYxwPut2VU6/C9Sv73l0TyhHa+E88k9MRpnAWv120U3MxJ6yVIQ9miyee4Ub+hVLeTqMJdjMzJBw5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YaX6o7sF/p/85WCOWYzEoBMrj5qigdS+U9rOFfmJIlk=;
 b=gNKQvMKsgmmP/eqbjkBMi/eymNb0hI8oEUXhlAB+zFV9Ri6QX90ogp47ycjLsYAe8iOr7nWAWpY+xonUUYmGnerRknrT9SBuBppN4478nFaBVVIUFJS9jav5YGJqGY2kJYOfUah+ruNO8A9xfZW47Mq2DcjL70z6hI3UFb0goWTjmTLyQUY0+HEMfHJtA34+3zGpffWDZcW/70stl4ap5Uxq5rwvfKMHXQGJYVy6d7FDobyMuvV6ALB7TWH4tMJMJ8ywhWkoGpR96dhJ+xf1iiz/NxXQ2HZST/4d9Lh/9xoVvaBN130G7xi5h9u44/g8jqphie8Cl9X13b8zKmbf2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 01:19:59 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::4e72:f734:5886:b658]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::4e72:f734:5886:b658%7]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 01:19:59 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] dropbear: upgrade 2024.84 -> 2024.85
Date: Fri, 17 May 2024 09:19:45 +0800
Message-Id: <20240517011947.3727744-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::16)
 To DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e886a4-c584-4a75-cdce-08dc760f7858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|52116005|366007|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pFiogNGrDw92JqUgmcLQdGJ0xJbNNlhVaQ9bs+GVGs0BkW3SzCndNjWwUzDd?=
 =?us-ascii?Q?QLmhlRMmK8spQmnAr3K5bylQLiYDJPP5oUQ+U8nCzroXlfZNJO+diyBVC1Rk?=
 =?us-ascii?Q?AGp143lXgDm9Lwh5EPJ1aZ8jD8BBcWk7ckMa8EFsFlPAVYiRmtYp0+AHz2HQ?=
 =?us-ascii?Q?9Pdl27zMANA/+4FByg/38DTHe51SANBbiqxCoHzdGsEBIjfJZbck+wGO+pOx?=
 =?us-ascii?Q?RCJI6f9hTlAN9hc87W02CpNzd2lam9nkYgeJdkB6a344gdBUhoHp+17WcpXs?=
 =?us-ascii?Q?ZvJT0cT7zoOyx6eF19TwOp+ycXjNQc/2WZmh635TW9TVUORRatUxDi2WUmWA?=
 =?us-ascii?Q?MQWRvEnJ88zH5692SXOlJQXA+Q9DNSCerlkUicwXwTxwug7naXjlxtjf4wB3?=
 =?us-ascii?Q?hWD8CGhHEeiZjaFYVTsw1AgTfulArrC6RJWM3+hGicQDwRcRrvkblAjKeXt8?=
 =?us-ascii?Q?3IAH88bIrllNCmokzuYzQyluXgRQZjEJnKcnoWystjvxC9L6vC/5xIGxL+Y0?=
 =?us-ascii?Q?Kmv9CSfiKzzM0EfMIeVqAFoThUXR5N4CiSkpI8F+6OznMzmr3t6nQ2A2EpV3?=
 =?us-ascii?Q?RIJDNnbNpMAaFqc4PPOipqKh/NG/Bm6PTZ3jcx4ssLjp51dlUVpTE0A+O4O1?=
 =?us-ascii?Q?dLshtmKoWAVxyeE2NXHaAVc6olI3LYTipIFbTwEja8bIxOjyQh4zrCLda3nU?=
 =?us-ascii?Q?a7pbUf+jPa4c8IeoQ3RFc8SvoXnqiRbVqEWqIAbP4dWfSequVDnO/dzWTHdR?=
 =?us-ascii?Q?46EDfVRrUeixGE4bDmEcl2nCVtYIoWzldFWiJgTFhFe//cv7VOm2lOpeMFm+?=
 =?us-ascii?Q?SonXcxtkSNUOGTZcyr3tCaB4cu2bG0eujfEyUbbLBD4q1uqULfGQPBOpOgha?=
 =?us-ascii?Q?ZYnU2j2M7ZUbpdc0eXDS6EWVPcMTdR7RoghGtnBCGTr48xVyGC+M3stbM2Zq?=
 =?us-ascii?Q?vINntsjCkqD66zZgE27ix4bF4enpiwn6DqE7feBYQlc8AHkYWL/215/pwi42?=
 =?us-ascii?Q?bcTRoD/rTcFUKrekLRVwTQ/P5P2bybK8NuYR6+2ScUTHrvdRrHsje2kM+162?=
 =?us-ascii?Q?EE+8nw7ATDyNHCVmGE24EPakUtLT7Yr3oQj0vqOMkAxznEfvnQ2bY1jWju+W?=
 =?us-ascii?Q?wsec32xipxIfZCFVZygxjtOt5Wmi9+J7t9YA6NyQlYkAD+CsHY3FFqmtT0XT?=
 =?us-ascii?Q?NEVBseF4wBuQ5yNj92WpuPq9QZiTV0navhAB/EWQ2mUZOAqpTF84BPkKRO1B?=
 =?us-ascii?Q?8TeFuPq5Mo1lKy/VRcw+HzUJSzKGadH73V8UkWB5PA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(366007)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WvPmcGoEAlbIVZ3w3bhzPrLm/JEnogrON9GNniSnJW4aBA6BPxN7oHtG8DSq?=
 =?us-ascii?Q?oLSeIO/PLQdQgEkbpRtpIcdnQxtdjcd/dZAITZWjhc6mdi7YGSsv0M3fOzX5?=
 =?us-ascii?Q?1BQ8Li+A06Ub8Er63dpPBwu8VeH2tUpCtTkley60ShejeFqgirDBBoHEjXQL?=
 =?us-ascii?Q?6Xex+2wDhrCSNCDbACbU/dsNypk1L+D4erT4dOU/to/8kYx5rVQGuLNIsVgP?=
 =?us-ascii?Q?EAuTv3bVNNa1Q+VyXX/EGN/w0EmU+Nb6nrodcqVLUl1iL7ZHZXcPTlm52bkd?=
 =?us-ascii?Q?9WsF7fNjFibbu/+iVcutCp8mZ7E/cCgeQpUugoUtiVaFdC2CaYE+PzO/6a2c?=
 =?us-ascii?Q?ZYfCAMAhqlkhmpkiTnt+kRUUnkPlfHgNhPDeM887LEiq3E7xg605XK4iKbnl?=
 =?us-ascii?Q?PuEVGMjH15dF3l+FmrRfATS8wGIOQsmgefr/z0MZ5rjCXXyAMS85dhVtA11M?=
 =?us-ascii?Q?o5qXeZA9fL2MH5RmAt7JR6KfKVysIrqKdGDzgzcJHDJuLBLE0beqZRmXwI4y?=
 =?us-ascii?Q?D/xZxJU9GYi8foHuesEbr0HTp5YqGUVIfB1hz/dAKITxmQ5fyJXOoTQ3hYhe?=
 =?us-ascii?Q?5wKIIlCQsqMxJ4SoCnNHnY5xdO1xMABPFsL5O5t9yN8EJJdXz5BtuzJ+WyzB?=
 =?us-ascii?Q?Zo5f0pBiUC0HNr77xWuwGohJAEvY4sdwDhg9ZvS/ltyWPr16RwguFGcMky5N?=
 =?us-ascii?Q?V2Ga4iu5fB9naTsvjXAEJWYhW9pD1dX63KcxsSO/7GvbMS28YB723j4Z3gbh?=
 =?us-ascii?Q?0hyDn+gWUKzR/vO854Tuowylj9O1mqQvRD1cTD4MJmCK3bK99h/zA0hDy2ic?=
 =?us-ascii?Q?V0skjlnliWseSX4tQk4SxyKhSZdfnc/rbQS4CDP5TKlT0S6boAtMF2cd8gCx?=
 =?us-ascii?Q?tTSNHZ6evsRc9ICULdJcRrZsG+ODOu0FIchJmKDyK/I5OVN77ylrSq1kyIAx?=
 =?us-ascii?Q?/MnjH3PP+brIF99lUaXazfLAQ95LMrSqFQkEiqbOGTyxs/qWqpR8eFvMdWHk?=
 =?us-ascii?Q?uKaOwJ7SDWE5Pdt+FuI1yIjLGO5baa+T+AC8BpUMlmN4eRLmC+NOiJei2EN5?=
 =?us-ascii?Q?lGfB1hOLWuyhhrKRPJsTBq6aWnMxy0/KOhHRyxYiInDAzxvzLxaa0Ep5xmMc?=
 =?us-ascii?Q?7wfj9j2uxGwa3AAQioKTsGiQ4RqXS/qAxFLtOMRalDmRpth3w5VchFR7Oam4?=
 =?us-ascii?Q?xPyNHMhW0AQ9CObl1GAwJyv9rHcXK/QYkZuWanipyM1LeRgJ8rI8VjbzpiBc?=
 =?us-ascii?Q?jiw1/7IDRN9OHBjTBiOVs4nLJkhYszrek+CNCEnG65ZV7Ys9mw5DQSTIJaT/?=
 =?us-ascii?Q?lzIwY5Pk6GpsbYXRyrAGRaqoq2/qI36tQyoe7oJKdM4BQGywU15JtbeUBaP+?=
 =?us-ascii?Q?N9Hqk8nW8mIsXfaWlkKeAkaSNacBS9YFSeL09YFPvwaVabL3PYGgjR1YvSCG?=
 =?us-ascii?Q?IPXtyyNsOTllf7a8X+F27Ba8Z4hM/BWM4nDVRqaHuESJZGUi4Kiw/yE59Qpa?=
 =?us-ascii?Q?Cc9OvQ2GlEmJxRVtV3FYyiDjyR6IU0lrQit4zNO+7yEVO/jyvCyqCAxCJ2EP?=
 =?us-ascii?Q?Jsv3TO+7x08O3jffxjoG36Z2JfV+HDDlIQp3PMqE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e886a4-c584-4a75-cdce-08dc760f7858
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 01:19:59.7332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKtkAAwlsaDD1kedSmrsqnTdCpwR/D30DarsAHHgfLuUsH282yhs84ypQLZwm9Bdg1hv1iObBsv8xaE4Rruqpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-Proofpoint-GUID: _-kTa8CuMaFopeiUuntuj4r6RM-chLn_
X-Proofpoint-ORIG-GUID: _-kTa8CuMaFopeiUuntuj4r6RM-chLn_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 01:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199500

Changelog:
https://matt.ucc.asn.au/dropbear/CHANGES

This release fixes build regressions in 2024.84:
 - Fix build failure when SHA1 is disabled
 - Fix build failure when DROPBEAR_CLI_PUBKEY_AUTH disabled
 - Update debian/ directory with changed paths

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-urandom-xauth-changes-to-options.h.patch   |  8 ++++----
 .../dropbear/0005-dropbear-enable-pam.patch         | 13 +++++--------
 .../dropbear/0006-dropbear-configuration-file.patch | 11 ++++-------
 .../dropbear/dropbear-disable-weak-ciphers.patch    |  9 +++------
 .../{dropbear_2024.84.bb => dropbear_2024.85.bb}    |  2 +-
 5 files changed, 17 insertions(+), 26 deletions(-)
 rename meta/recipes-core/dropbear/{dropbear_2024.84.bb => dropbear_2024.85.bb} (98%)

diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
index c74f09e484..9c1dd3f606 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -1,4 +1,7 @@
-Subject: [PATCH 1/6] urandom-xauth-changes-to-options.h
+From cdc6a4a57a86d8116a92a5d905993e65cf723556 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard@openedhand.com>
+Date: Wed, 31 Aug 2005 10:45:47 +0000
+Subject: [PATCH] urandom-xauth-changes-to-options.h
 
 Upstream-Status: Inappropriate [configuration]
 ---
@@ -18,6 +21,3 @@ index 6e970bb..ccc8b47 100644
  
  
  /* If you want to enable running an sftp server (such as the one included with
--- 
-2.34.1
-
diff --git a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
index fe667ddc25..6743f506e9 100644
--- a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
+++ b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
@@ -1,7 +1,7 @@
-From b8cece92ba19aa77ac013ea161bfe4c7147747c9 Mon Sep 17 00:00:00 2001
+From 253ca01f0fc50dbaeb2ff8bcece0c34256eba94f Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Wed, 2 Dec 2015 11:36:02 +0200
-Subject: Enable pam
+Subject: [PATCH] Enable pam
 
 We need modify file default_options.h besides enabling pam in
 configure if we want dropbear to support pam.
@@ -15,10 +15,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/default_options.h b/src/default_options.h
-index 0e3d027..349338c 100644
+index ccc8b47..12768d1 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
-@@ -210,7 +210,7 @@ group1 in Dropbear server too */
+@@ -228,7 +228,7 @@ group1 in Dropbear server too */
  
  /* Authentication Types - at least one required.
     RFC Draft requires pubkey auth, and recommends password */
@@ -27,7 +27,7 @@ index 0e3d027..349338c 100644
  
  /* Note: PAM auth is quite simple and only works for PAM modules which just do
   * a simple "Login: " "Password: " (you can edit the strings in svr-authpam.c).
-@@ -218,7 +218,7 @@ group1 in Dropbear server too */
+@@ -236,7 +236,7 @@ group1 in Dropbear server too */
   * but there's an interface via a PAM module. It won't work for more complex
   * PAM challenge/response.
   * You can't enable both PASSWORD and PAM. */
@@ -36,6 +36,3 @@ index 0e3d027..349338c 100644
  
  /* ~/.ssh/authorized_keys authentication.
   * You must define DROPBEAR_SVR_PUBKEY_AUTH in order to use plugins. */
--- 
-2.25.1
-
diff --git a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
index f54f634a4e..44861088cc 100644
--- a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
+++ b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
@@ -1,4 +1,4 @@
-From e3a5db1b6d3f6382a15b2266458c26c645a10f18 Mon Sep 17 00:00:00 2001
+From 16b147f97f0938cddb55ec1c90bc919c13f26fc0 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Thu, 6 Sep 2018 15:54:00 +0800
 Subject: [PATCH] dropbear configuration file
@@ -15,11 +15,11 @@ Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
  src/svr-authpam.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/srec/svr-authpam.c b/src/svr-authpam.c
-index d201bc9..165ec5c 100644
+diff --git a/src/svr-authpam.c b/src/svr-authpam.c
+index ec14632..026102f 100644
 --- a/src/svr-authpam.c
 +++ b/src/svr-authpam.c
-@@ -223,7 +223,7 @@ void svr_auth_pam(int valid_user) {
+@@ -224,7 +224,7 @@ void svr_auth_pam(int valid_user) {
  	}
  
  	/* Init pam */
@@ -28,6 +28,3 @@ index d201bc9..165ec5c 100644
  		dropbear_log(LOG_WARNING, "pam_start() failed, rc=%d, %s", 
  				rc, pam_strerror(pamHandlep, rc));
  		goto cleanup;
--- 
-2.7.4
-
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
index f998caa255..a20781d31d 100644
--- a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
+++ b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
@@ -1,4 +1,4 @@
-From c347ece05a7fdbf50d76cb136b9ed45caed333f6 Mon Sep 17 00:00:00 2001
+From c8a0c8e87b772576f3a431c3b4cacaf5aa001dcc Mon Sep 17 00:00:00 2001
 From: Joseph Reynolds <joseph.reynolds1@ibm.com>
 Date: Thu, 20 Jun 2019 16:29:15 -0500
 Subject: [PATCH] dropbear: new feature: disable-weak-ciphers
@@ -14,10 +14,10 @@ Signed-off-by: Joseph Reynolds <joseph.reynolds1@ibm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/default_options.h b/src/default_options.h
-index d417588..bc5200f 100644
+index 12768d1..2b07497 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
-@@ -180,7 +180,7 @@ IMPORTANT: Some options will require "make clean" after changes */
+@@ -197,7 +197,7 @@ IMPORTANT: Some options will require "make clean" after changes */
   * Small systems should generally include either curve25519 or ecdh for performance.
   * curve25519 is less widely supported but is faster
   */
@@ -26,6 +26,3 @@ index d417588..bc5200f 100644
  #define DROPBEAR_DH_GROUP14_SHA256 1
  #define DROPBEAR_DH_GROUP16 0
  #define DROPBEAR_CURVE25519 1
--- 
-2.25.1
-
diff --git a/meta/recipes-core/dropbear/dropbear_2024.84.bb b/meta/recipes-core/dropbear/dropbear_2024.85.bb
similarity index 98%
rename from meta/recipes-core/dropbear/dropbear_2024.84.bb
rename to meta/recipes-core/dropbear/dropbear_2024.85.bb
index 3ea64b13d0..54001414d0 100644
--- a/meta/recipes-core/dropbear/dropbear_2024.84.bb
+++ b/meta/recipes-core/dropbear/dropbear_2024.85.bb
@@ -23,7 +23,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
            "
 
-SRC_URI[sha256sum] = "16e22b66b333d6b7e504c43679d04ed6ca30f2838db40a21f935c850dfc01009"
+SRC_URI[sha256sum] = "86b036c433a69d89ce51ebae335d65c47738ccf90d13e5eb0fea832e556da502"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
-- 
2.25.1


