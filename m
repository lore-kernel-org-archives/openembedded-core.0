Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9614FC5DF7E
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 12:29:21 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7829.1787056153743357433
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 05:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=JPgH6EVF;
 spf=pass (domain: est.tech, ip: 40.107.130.25, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkPvu0Ljk7mweNUr2VPf/FgmHN1SyEGl63Y1nm2E8nofdiunN4VfWwwmIteZMAEWL0f+Cvec7RinQ2I6Eb5YdO+rw57mjRfcZMHcUnbXdYVgw2Rl4DGve25XjmdnnuBBTIv2UOTSb2KPyjAJixSNanLAHs9vBkQTF63D22wRS99765NtODwAXNSXwnZKeX+OtkQQcxFp4pddIshxqjMQlghQFp/5IY3T2XoUCcn86pp9QoIZ2DmN+BfkgTJAQAXZFKQswWwWmxwJxd0gBESq+ETK8Yf7xUbWIItQ9ReceXzqTQEaFBupPVG5+9IdLiN6C1J5fg7XGuOcg3zk0trHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhhSkaRVTp1DFwzkfTxlFcBukXK7WWyhJppEtfSYk28=;
 b=DRoQw0Uiqmwr2TPPxQn4QBKae03ZRk0ydZedwZmHJFLIC/rhYDIN1TPoJjRRZivkJ8XQWyHhU9mhZTMOZ5nx26W+UaYWR5SArpungl73ioqeMJz6SSUofqtdK1I8XdrWe7nvsBXJhz+Gj7AnDpxzcGMGF6gMBI9HrzT+Bc7HHlObivFFCcFH8UuCwbi/6S9rhDOrPTBsYZ2W1AmYGvKCyWHUNgESMbtM2UW+M+pQykNxTW3BmUIcTG3zhxVK/2rxHrjnZWMg/zDzm8QYPMZyRLREBAudYjfY+ot2Wi2rYh/dmPleHKraLn5Fyw1v4n8FZg7UQXL3kjfcWovokjAXIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhhSkaRVTp1DFwzkfTxlFcBukXK7WWyhJppEtfSYk28=;
 b=JPgH6EVFScB2Y1HSggaYXJZzFO+MxVfYUqAtuTyHte/7/O+ZT8VYKRlsIYo1D76QznU5APYgli7WwoFuW38d2Ra0snwDWADEKWtZqQW6II1XBXQ5avp4trCa/5su7GRpzBW4n6y9CTG2kAl/pvOcbRKhzLPTpK+89zG5fXX4fLeP76y45o094Ag9e54HO9bFKr+CK8WveH8Ih+dpIlzp1RdkUlfUbyzubW7xG/Bi8JK0bF73AT5n2ch7kA3Ch4NCFnj1Yhx0oTDXRM54gRMLCjhME0/AAvcc9yiCQ15CY9kXvINaHFfa1akBt1Xc28SFbPmi8neZcUsm4Kw0tmDPZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI0P189MB3369.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2ce::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 12:29:06 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 12:29:06 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 0/2] powertop: upgrade to 2.16
Date: Tue, 18 Aug 2026 14:28:55 +0200
Message-ID: <20260818122857.54302-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::19) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI0P189MB3369:EE_
X-MS-Office365-Filtering-Correlation-Id: b1241a8e-c6bb-4645-58cc-08defd244bd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|10067099003|6133799003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	FDQhNyOBS5c4KeWjbr3N7klOrPZ/i8EaUghJbTud1D1YN83lANw+PvZJkIlJ9SYZNHZ4hSGvQOxKQfzETVMD8WrMtlrrxMMTbXqenk5Ae9S/NejhcyS+ZKdEPgrfNZ4eoH34y0b91gooahaLe4XSRIKU/IbID3AXvAd6lS7qS2r5Ali6L2r7Mj3Uc/dBTit6uuVV94akifek/mESaKqc1RCAc9XLyPJzN/5avMeujY6i/Fa6SmCTbplSqKW1KGpcJd4cDqlZKl260GkRj6DMB/U514lUL0PQD1906zo73T8PbDz3Uiu23oLMhlihnxVHrJ9cWcodBMGKs9I4Z5qiLBE1cyjeoEn1Rv4viUr1NlIWy4ku7tQ7v9f5XFuS/P+ASbELkNJOk5tlXpZxFbDcZoHUJ73IYGD0G+e/R50iAJI6zCbhjGnn+qRV0yKoADDKJaK6gXJlDoB56vZwPeAEelx7+47f8lxXejkeo8kHaR4joc5ME+Ef2jaB5MFtwogh1h9wGpSUrvLs7Ma+Liw2/36ImFMWJ3KvyX0Awcb6iHBhh5aoyrib+IgIkCPsVNH6AvcKuUrrQ+MNjJKAruPX1bxA7tFjt4rpF3ZOQJs+MPgyzbTsEHcXW7zPb511bAwMwgiAw07jPAz9ab1dCaEgEf2E+dc0X3R5kLPuk64IgNI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xSqIRvMLbMmyeV+YIazmhtJJTbCslu33T8a5390OzN34jgykKxFpQj3xjKwn?=
 =?us-ascii?Q?UADlN9MkBmbOE3wAb8mKzqgzChDNfzDv73NV7IsE9tNqfqOqXgx4aod9RcT+?=
 =?us-ascii?Q?ipRyQUWgjMtQJfvsKJsT5CdPjXxKSjgujzdZNxas6qdVl0vKnOLnOvMbCFPQ?=
 =?us-ascii?Q?3LpxoxK66sxFS0sh21Ndva47rwO3kQqz8Em+0k59n3OZkoAsW8nuZ/Mv84Ti?=
 =?us-ascii?Q?lQ464oUOvIPRUmq3i64slcu2IzIqkQ/m/M7aYt5JGR6cfWiNMIqAOZKQdsN6?=
 =?us-ascii?Q?C5Lh8/w0A71y7aw2I30PSAA//lny8yNgLDv5ZgeM09yk1bq6Rx2N7TiveJIw?=
 =?us-ascii?Q?mFa5YxuGx0GLXlKQBXb+/CNQEpy/uGwLViISF4WK065fT93MyqR/jWQT33UA?=
 =?us-ascii?Q?SHW3ir/yzF8JlslBkwXQdyQkAxyw8RVNrkvo5ZVla9puVdgDaSBLZ08XlM7l?=
 =?us-ascii?Q?mzaXdT9cNYGfjszdpYmhBS4a/sx+3q/Lorkzd0Sk4oeLQWeNpt82bg4zCWEw?=
 =?us-ascii?Q?P8B5wnqcjPspuSzUBmGgb4/gP7XdWjAOq6vgHDeHvdDwSUXSzu2OsD5/l2O3?=
 =?us-ascii?Q?maFUujiXY+VryRqHjenbUbUTOSTQQeKIJSXN658RVAN1FBoiO3Ml4QQMlOOE?=
 =?us-ascii?Q?QwB6tsxaP+Eq+yha3pnSpPR0/31h0HPcEg0uenRbDZiraquuanEVRU1A2pVC?=
 =?us-ascii?Q?NADkny/Q0pb5Q5hGT4TqXNjZ8baVF9xNQryT6cMnNsYB7vEu98kmJKn1ngKL?=
 =?us-ascii?Q?tCcIgScKcvHp4iw5ZZxhcPs1cntcoz9JiK4tJOdbGAwCxZyRlOdhtK/XZkJL?=
 =?us-ascii?Q?cnSAF2v4qqjMe2Dbst6PXi991wlXkbxMmZYmV8Mp3Mb3pXwhNzOhgE+XGrye?=
 =?us-ascii?Q?HHOsf+uY32K1gsmrvtOP6DLFfkkeV9mZIl6KuamhJCwIHrlUHQog7ZhLplHK?=
 =?us-ascii?Q?/+ZDTYNpRBishMRio1KTjLlwrF1bnISmqAbtta8370jKosa1fSK5MjXnUYWe?=
 =?us-ascii?Q?qqWDZcxcKSjCioyJz0Pwov7lteJEcIJkQY7+Gn2n0Hmbv6T6eVnJIB0DywKm?=
 =?us-ascii?Q?uo807k5eDS5x6EtZ17ZgXAZ+XGvT71j+O63C4tMWiSgDl0cl69EFPEyOrZUx?=
 =?us-ascii?Q?O3mSzgyUfZSMGpuUqAtKMAQtSZXgnE9odp4ChEB/J+jwi518kk+NpfAbhupx?=
 =?us-ascii?Q?dVZKO9Cd3AWtJ+lTBX95tYA/+rmxp3EZbNT/y0cE83Bv61rhBb0zMt5t7z1u?=
 =?us-ascii?Q?QtlbqBmGDvXgoCAPqTItyCKmnYQf/EZJXrsIC1uuEEiPb+/8EoaoI1qpsQ7K?=
 =?us-ascii?Q?LSUftrA966q4y1v7uu8zdRLWJIqWAm8UxDKqCrrWJGn9Q/nbIIHlxHx/at+b?=
 =?us-ascii?Q?eKgVBmTLVc/31OebaEFp8hbO1JTo+rK2oROBa7kAhIyXwBOJheDkG57MZvBG?=
 =?us-ascii?Q?QoqP4Fuoa/QvlYBdKucrVEZrJlyB41tZd0GlspD1WOcYubq/nMhf5mzs9a+t?=
 =?us-ascii?Q?cVDjCcIyRvJEzTRbgBn0Ww97Ii0Yq41iq1yE168QCKKRqcaiftuBFwIj2Yiq?=
 =?us-ascii?Q?XgRKHgWS4JK89tdQLfB8uQGmUNEggH3mGEvjj8IOirhY+Xz5oUSfd/A9Dxel?=
 =?us-ascii?Q?8EMFlTeGRU5li52ohs1VAaMZujhlzfGxzrfhaWfCiXEZENdDI9A28l8oQ/sV?=
 =?us-ascii?Q?CfY5P87jecBKbrh79mEYf2zq5L7dN4YXkEWW2837XCO2fq/wyLGMP+jgeKak?=
 =?us-ascii?Q?Vw9yCn7gCbrGN19Qnn5T/531jla3OT4=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b1241a8e-c6bb-4645-58cc-08defd244bd2
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 12:29:06.7712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQiQZbxflyHB90552l478zt0/8DnZBwd4T7TxlUNPrRM8BLI8QvvN8U21b3Sv5GebZVI+wZCveGRGWefwVk6kNuCjGotWg+b5/611hKxewY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3369
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 12:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243678

Upgrade powertop from 2.15 to 2.16. This required importing libtracefs
from meta-oe since upstream removed its internal libtraceevent copy and
now links against the external libtracefs library.

The 2.16 release also switches to meson as the default build system [1].
The autotools build is broken (C++11 in configure.ac but the codebase
uses C++20 features throughout). See upstream issue #124 [2] which has
been open since 2025 with no fix.

A corresponding removal patch for meta-openembedded is needed once this
series lands (libtracefs moving from meta-oe to oe-core).

[1] https://github.com/fenrus75/powertop/releases/tag/v2.16
[2] https://github.com/fenrus75/powertop/issues/124

Jaipaul Cheernam (2):
  libtracefs: import recipe from meta-oe
  powertop: upgrade 2.15 -> 2.16

 meta/conf/distro/include/maintainers.inc      |  1 +
 ...not-preserve-ownership-in-cp-command.patch | 28 ++++++++++
 .../libtracefs/libtracefs_1.8.3.bb            | 25 +++++++++
 .../0001-wakeup_xxx.h-include-limits.h.patch  | 55 -------------------
 .../{powertop_2.15.bb =3D> powertop_2.16.bb}    | 14 ++---
 5 files changed, 61 insertions(+), 62 deletions(-)
 create mode 100644 meta/recipes-kernel/libtracefs/libtracefs/0001-makefile=
-Do-not-preserve-ownership-in-cp-command.patch
 create mode 100644 meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
 delete mode 100644 meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h=
-include-limits.h.patch
 rename meta/recipes-kernel/powertop/{powertop_2.15.bb =3D> powertop_2.16.b=
b} (67%)


