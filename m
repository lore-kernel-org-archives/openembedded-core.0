Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B151FC5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:34:00 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9812.1787153637327544511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=uT+0qXcx;
 spf=pass (domain: est.tech, ip: 52.101.66.11, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lh972Q2qZzQHgoQJO1tLEXO/JOaZYnPzHNet3I4lzzmmHDIS8m2lPg1siQc3wleVtm3/7pPCd54govnL7gfyIdXQaM0T4HPmmHpvzo9gBxmKYSttnm4805z0f6D1T5d1qiBs2h0IXGCAGwV7QTbUMPaiU3ESnfbSEIYtccpKO9Aw6tfjfsrJST6Ii5+IS28GqtS6vhR9yOHm+tnSsEAXa40Wd+H0TH5tGeqYBtgNLZh9vAO1mYLteTKnPjyd09EPZnd+P5G45d/q+PXPgQ1hjG6iNAlkI1a3lbp9uvrsSlzeFgkBAk2GC9aDNayzC+jCmXl9fvoaAKDwlSNUiKL3wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyhNvymFDT9kTV2XKRckpSLfWGeIpOhScWeqAXxOzO4=;
 b=nhheWFWCnBWrYuHjvOtYGi2KBhLbb0cE3Ct6jHMMzSlgpY40mJsRylwfVKzCPAPziFPgbi7EuLl2kkXehZ8bcYcdjo++UQhgpKgrzlbJqumyHgwpLPFegYlCoRODmTTfHSVdwZN/j1tRMevga6dzKeinOO7WBenKi46l6wpR4aVSZDdwuXZ0SjtXWvpTkH4CV0e9eK344x6VfLwSutaDmUMH3c+wAhQk+1x3y1BblndquuHpyF715isZj3gwTtwVaC/liyHFld4fwwfO1TtUXyYIhz1F6cwipppyoZ8f+hInUr4YsQXznzQwyHHTX2FZrOfXgJjQpyj9zmUyKiITWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyhNvymFDT9kTV2XKRckpSLfWGeIpOhScWeqAXxOzO4=;
 b=uT+0qXcxv8rVfz7cmHCrrpBRuaX5NMvOzGx8G8NdZBPFfFzoQjW7red0vC2MWWKZQEnAFDDosLqXguAjqJYcIkqcObbLNuoTtLlVTl6sRaCeS9BzOVgDGApVxjexwJMCBk1pN4H2P/6F7rXhsyzdB7wqTeyx4V8MNYMELDFtCZwOGminSYeEbazJZUSsAkkqbRIuTKVk/OUJoD7cNrXK33G1PcsUFVdXy5Y1mcT5mPSnj94J/N7eTUkG1awhNySjxUYLTZCxGYHCgI6PoFPt90W1NXiWinujDYf7iUBEkT/zfhNj73OoemOBt+zM/NJhjNARM6Puo7RKT1pCzdFqyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI0P189MB3358.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2b7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.2; Wed, 19 Aug
 2026 15:33:53 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.000; Wed, 19 Aug 2026
 15:33:52 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 0/2] strace: upgrade 7.1 -> 7.2
Date: Wed, 19 Aug 2026 17:33:44 +0200
Message-ID: <20260819153346.64078-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P251CA0001.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::14) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI0P189MB3358:EE_
X-MS-Office365-Filtering-Correlation-Id: fe346cfa-f474-470d-dac8-08defe07461b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|56012099006|6133799003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	CjZwjZsWseeQf3cdAeioeTq0v66FOQKXdzxRR1ocG7KdQ87PqqhbK9RcsM99voDAcLSE38NIKJ2O/rMynx39qesS0HoHB4pBi5ObSvRiw2D4xX+3dqaMVE6JYgKGDo3XcJ6osXBcStKxGzQomSyYAYfVQZDLWYXJLw0PortVFy452AGWb1XsCR7yahyNCJnLf+CR/t2+tS6OqapRshDE46sit5X6eUSyrnpWvBvF1vFQa3gnU1tpPDl2Iq2DB/hUtyZ5Ws39suiV507tb3tc53AOJyeHo4Kpaa1R6NxRzTevnCoekTmCDN94PsYbtRbOAcisiWhii5mMdqVCPt52+0K/EohBRosmKCQQxT0JFOVLLq7zl1lIo98R1ylyyNFybDJ0zcItI95Fr4HRVmARfG6Xv+dDc3mPtRTppP7zX03D5CE7NFdv/nj2Gx8gvLBgJ5LzH+N1/A19tbakVF64u97Vjc4Ubuogsd3HKOnuLng+yGkUMBttd1NpNiUhJdh6H7Bl2L0g+d3BNykZGpkrysYKyRcm3msqAq+8HD7FZamjygcVcd0NTHtYWCWND8TU+LsOZIoPpLub1bA1g22Ml//BpPmVSEzEa/9/9QhtFHlh4LOlgPIOcD6s0HhvkxVO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ijpJMrsad37pm/u77pQhLr2FZesujYphnKJwXMbQ5v4Yy8JpRXBii73HVw1s?=
 =?us-ascii?Q?mC5PmZGXgrHitGqVQcF12qRT1FTLqjfa6lJUl8GCCfDmSWLCFdjqZSWsIT3/?=
 =?us-ascii?Q?AHRB+2XLTcZm/+Fq44OlZm18ODJK56hW7OH/ztwQi4qv819L9+TSCTaWJx4Q?=
 =?us-ascii?Q?ADCrs5bkOpDjrZAH4M+hZGcBJrDRMts2pl5MBWskGljln+VzoUyyi7wN39Bt?=
 =?us-ascii?Q?3iV8wrEem6/DiEUoC7nSdvSHzezNzhAPoXzuO+DpkL7mToVhFwc+elTMAcKw?=
 =?us-ascii?Q?c9A7e4vDyyMzo+EH2JSioacKbCzGV2rdcdJ9J3UbR/1cm4ieWCNhNcvnWXsM?=
 =?us-ascii?Q?7i+q3GWZMitWHBnj3DIPeZV1itJxBlK4vs3R2fgq7TjR4Swvg+8gUS8Vyxab?=
 =?us-ascii?Q?/n5I76+d8y18zGoe27dWvdDvOdZFNb9m2GNoNZY53ZcQD2ahBpZxIr4Kx+HB?=
 =?us-ascii?Q?0tmfsoU8pgZqT9L3nA+cArLk49RELWVJbq/N+DRvK5aIKBc5XRPJHOEeM42d?=
 =?us-ascii?Q?hp8S2eTozSwICnQ/QyE1OmGIjd0hfumgs/6hearLL5ZSZ9J4CitUGAmXZ2KW?=
 =?us-ascii?Q?xlywMjxVDhCaXpWuUw3DY7RlIzVe8J9WLD1NUOIxnhdhpsWozod/typtbJ0c?=
 =?us-ascii?Q?5o/sRGhgs+klIRJrTGiAbv04MfMzTCVT781WcHCTN9yj94iDrf3MryHB3fBY?=
 =?us-ascii?Q?HHiPMeFA9JGoPFWlg963GFsGMLZXRGW8LjX6e4S+qXUUAqo0GD+2Z+vEuJfT?=
 =?us-ascii?Q?HWYMhXlJBJ+2xA+BK4gHsJ7T7EVwKTKu81DQva4VJ9tVOfMx7M3YRsE8NTW3?=
 =?us-ascii?Q?ffZMQ56efIA5wvlZca6q4x3VV4bF1RsLUa1eWBpY/b371alE4Iy9fCKaKvaY?=
 =?us-ascii?Q?RqiLcLqE1nCWCqdk/8qOPDE8pixtSSFoyz7gMDgBMjIGpsC3LHUliydrJ2q+?=
 =?us-ascii?Q?7Sktd1dJ92YM98YGfloAk1aZFHPdKx7VKFPLH7y++5eVOp9Y9yB6Xpt9Q7E1?=
 =?us-ascii?Q?/U0nOfCYeVh73ecdmh2r7P1CafrrptyqAk/Rwd9lJltEuubi2pG4xZ0g93zO?=
 =?us-ascii?Q?cHMgcjhcoRmdp7/RM5iLWRTm66fOtlgWUwlRgdZK7RwNf2NjdaOYKVdjR53C?=
 =?us-ascii?Q?NdKWE35yv3mscp+xQWXKxhy7ICiJ+H/ok4MnXQS90KClxKoyMRcQb/NxN/cB?=
 =?us-ascii?Q?9Y4G/mevNMZuMsGZsY7TWxUNaVqwaWwBXyEIuPekDGXnaYDQ8TcUdx5MG4WN?=
 =?us-ascii?Q?pdp3jWAM141P36J/MpH2rPrQN3567rbJr37vqKA36WhZ1JCG8qGpxjF11ACB?=
 =?us-ascii?Q?dxalXCIzBqzETgJlrZEDlCkKUOTyTg45ozV339ZuMlpqRMU86TWgPAHQF7GE?=
 =?us-ascii?Q?YQolaRQHCxb02017OTvJprj2+upw31lfeSQo3nEwfKLMWuqYg8nPoOqJ53ru?=
 =?us-ascii?Q?QAmBpq1Bsi3CTqiAYNOMM90vEQYHZzqzNPN2oq+lVWpPmwN5xOxjC/8brS53?=
 =?us-ascii?Q?unlu4zXMNVQYQf/fTzh5/Ld4wtwDNb0xfDpt2IMzNCojCCF47s2V0hCApuoD?=
 =?us-ascii?Q?ziJ76w7WyXTltC5+fvTqvRDIQZ6I+irwtVUYOLpnDLafasCVpVvqZwOHmyx5?=
 =?us-ascii?Q?5VWZMIK14hSbmJZWPfzhu4DPBxh6WCDuck/Yzsv7CrCKZDm2BsalY6lChVU5?=
 =?us-ascii?Q?lsL6RuT03hobTzXaEniFvi6N+padwrmGx5BAYxfk0lQijMnGgUPFHfGJ/O/m?=
 =?us-ascii?Q?U3Fu5vjKrRM36Wtv1B4vRAf8G+qZc/E=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fe346cfa-f474-470d-dac8-08defe07461b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 15:33:52.8714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsGVxsAxsWhg3nH4abSiBOKF2rLLtcNQvv/sTr0Ee7y4rCEKgiyXxh/lk6ExAZSCp5/oDn4FiYl224QMp583Ww1wfopXC/bZlhs0uafwkKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3358
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243733


Patch 1 performs the version upgrade, refreshes existing patches, and
adds a new patch to skip pwritev/pwrite64 tests on musl.

Patch 2 increases the per-test timeout from 600 to 900 seconds. The
filtering_syscall-syntax test runs ~12,000 strace invocations and was
already borderline at the 600s limit.=20
The test is sensitive to system load and can exceed the timeout on loaded s=
ystems.

Release Log: https://github.com/strace/strace/releases#release-v7.2
Compare Log: https://github.com/strace/strace/compare/v7.1...v7.2

Jaipaul Cheernam (2):
  strace: upgrade 7.1 -> 7.2
  strace: Increase ptest timeout from 600 to 900

 ...gnore-pwritev-pwrite64-tests-on-musl.patch | 62 +++++++++++++++++++
 ...toconf-macro-to-detect-largefile-sup.patch |  2 +-
 ...kport-ax_prog_cc_for_build.m4-macros.patch |  2 +-
 ...001-strace-fix-reproducibilty-issues.patch |  2 +-
 ...002-tests-Replace-off64_t-with-off_t.patch |  2 +-
 .../strace/strace/Makefile-ptest.patch        |  6 +-
 .../strace/strace/ptest-spacesave.patch       |  2 +-
 meta/recipes-devtools/strace/strace/run-ptest |  2 +-
 .../strace/strace/skip-load.patch             |  2 +-
 .../strace/strace/update-gawk-paths.patch     |  2 +-
 .../strace/{strace_7.1.bb =3D> strace_7.2.bb}   |  2 +-
 11 files changed, 74 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/files/0001-Ignore-pwritev-=
pwrite64-tests-on-musl.patch
 rename meta/recipes-devtools/strace/{strace_7.1.bb =3D> strace_7.2.bb} (96=
%)


