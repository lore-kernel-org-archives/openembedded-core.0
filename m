Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B0DDC5B56C
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 13:58:00 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30509.1786370273042023722
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 06:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=sYqCGKmL;
 spf=pass (domain: est.tech, ip: 52.101.69.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOzunzrRfx2zcJEzP1pm9XGTTHtBMQee9WbDij7WvTmrwIWliFnMWPpwjiU007NcAwRjT2emS2QctB+cgI1bNHFIJWyyLz2K5Hk5zd0KACArKYJjw/4aJvA2K/eqdnD7FGgba/zjWHEo4bWPFnSTDG2c3qhKn2ur7XEtDeU4BzyJx3B4sACrDMPsTWmeFJCOwN0SE+BoeZh2THKq/TkaUU+uim9T1Du9vnjdPhtW3ILaGJKZnLhlC6yFxXoliileAQjfEDw869q2JVFMfzEk2P9bZkZr5DXC3Zht2DPrlo3uWXVXvVkqXAGiS3kFrQotENpsh7VCg3ujhAGAh5QniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhRIZhiLeq9DDjD1ttoPWw1WhRqvgqkVamPr9iCKXTs=;
 b=ciWMmb6btAysMxiR260mYf+NeUhtfgllv+YwhMxwUglX7kIYrwM22e2lHjXxKoOSp0K1cwKB48/vBp0GC7Ec2qlCVB6ZUVQ8waQBX7NPa4gPC0Iu/qt+ddzlNWIyQAD5wKXLKc1zREGiYoO+u7/44yGmg8NGmka5xKGNWOwJXv4IeIIV969cVXHadL7zq9VtYc9O4z4fMVvbjWwkhKpF0sFkXIErim22takcu9wEHsPEpofsDLOZlktzh9sVW7jOjPPg7CuUryyzNV9A94LzE8g4a463PhYhJNf2Ep4nEbPRz6AfWUcpk21+wCjguGXaDAs7eD3y4gnciwE6d0LnGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhRIZhiLeq9DDjD1ttoPWw1WhRqvgqkVamPr9iCKXTs=;
 b=sYqCGKmLzeKNnxcfqX4UHOrqRhCkBKZMuDRx2eiy/mAdkuYABQnSkGvY+tfz0EtDS7SiRyBIq7SfB28mJhIkVFDfR/L1+khHwtzIAXoD61h+jkUWPkSqcBm2qF0l5CJl1a/U4ZaMMoSFFXgDj/M+8lKSatwlV9L2JgxGO9nZaWHd07qNjqHD852A1cR39BoVsPO4J5uZr3InfxmYRRdMIxhjSyUcbC9l/FDKvgcFAt9ZX8yIjFTf7scozROuRIZSmalU35xG/O4iFdxneM4yMmDjTLTX/OpRTJz8Qph22QHCNbQ1ORVXGoT+ePHVAJnnB5F9Xr/LYmv7TvsGGGyDzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS8P189MB2363.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5bb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Mon, 10 Aug
 2026 13:57:48 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Mon, 10 Aug 2026
 13:57:47 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 0/2] Python recipe upgrades (mako, numpy)
Date: Mon, 10 Aug 2026 15:57:37 +0200
Message-ID: <cover.1786370158.git.jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::12) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS8P189MB2363:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af5f5fa-726d-4226-77bd-08def6e75c03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	cC/pnZCC29RMQVP7cOvmCzgBmUZCajMuoXTzVM3jOiARUe/myswXkIpDKeGlpXOD4UeAKY2BhH8oGvIXwhmSZol+xDsmZHOiw6/JmqI4oX8l5g31b3ONECn928m6qahxutkaiz9McolIE0FmqVAualsTAhqIBclqOMwhf+IsBvjV9EoacuBxoiCyra3uUZhPrclMumupI0I72y+WxsQZsjthGb+ByOIcivgd2ijsIKkIuQCmyJNpVw8iCcj2JiZ19twslPuRKxkHqE1/INicVYFFyg/K6id1gwyyyoE+npOEDj4d604iWGCojUdZzIy41xpnbimhKy/poPKrzioSuPfMICC7woHUfBhSuwx6EnKd4S18fa8Rt+c/+XJNH3Y6nA4Mv2hVS5rrZf3lsbjR+aS0+mWXn5cJQ/63gq8tsABcHpLSBpkQNV6mfQLS2/btnUZT1Wt9L1NkfBNSKOqZlN7dDO6pqY35L26MHXat1c0gGmppm/qEcoGmlHXdVECvx9zOo2fJXbD50OqXZvOBpvBGSOZX80+qzf2ZFP/LMf2oN/gshNTGZvnDmstvgvxp4vJudx6PRO5GHuDp1gE0F2/pE/dUrZ952MAi9Qlt+8+Ae7exdqK4bK4EKZNhKBQ2zbYdyvUDRUuj5Xo+A9lRZfB7jhnAeF8wM2gfcrE+8RE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tcAE+zYnP/mFj/7cseT7rUV9PYO+cZprr9uvXwb4SWa2L4AL30EgtsIKTo/K?=
 =?us-ascii?Q?FZg5B/38EU/untc2rqFQ6EyWJk+jYM9rrvYph0bZ7isTVBCc+BbMFdqTM/pq?=
 =?us-ascii?Q?1tvqHcp7rMgd9SRmQCK6IjO438sdv1Wd4bKaSEPw5w1TmEQlIm2RopN9YqG3?=
 =?us-ascii?Q?+QRjRtrZYd/llB7QtDXGYf2VSonobzwRp+3NE/g+ccMNqv9OXmi6A45YCFH/?=
 =?us-ascii?Q?NzZvgWget4cuD90rpARjeglpq+zZxXWwsFH9/plw2NJMIdx6fBnuxfCX6gUi?=
 =?us-ascii?Q?I65NkoNrzqIlWQ3wf1h4P5KCzjIL8LeoaEfBnA5I9k0nOuBFBKO+gf54id3r?=
 =?us-ascii?Q?39YSQJ04CLVztOsuhws82s8AA5RSOl3JLoGZL/oUwN55YXxk+FRDHo9HJRTJ?=
 =?us-ascii?Q?6KHsl5YxcNgMbe0/ggFIYyZJ805bh1iG9Ao2UXhMAE8Z2+lFlZg+qxCAtajd?=
 =?us-ascii?Q?E3ecPfO349ypGKHh7p/8OfCOk5S7Xa3rMffdHqt00Y7KiACmEZ3U99j+wec5?=
 =?us-ascii?Q?twHRSD1fygR4p2itC1e0wutSkeYMohVes8UUwnsyVadbk0Kgwt/eStB2YIZO?=
 =?us-ascii?Q?vLNnyero+1eOnis4fpQ2AeLCCv01eCbJyQPHooOq85hSizH0FrmBJU9RZtsx?=
 =?us-ascii?Q?o9ImVsXBzAff3BshOXCRl4mVoGAaHDFnlsISWetbhixMZqLqWKnepvy3P2d9?=
 =?us-ascii?Q?uPaQK4fLqzTPH/bYJqw7HNetG6XFCBx8B6JdvS0sGbO8mtiMS2FxIzBsVr6K?=
 =?us-ascii?Q?u4Z8MfT2Qw5qZ6bXtXppysvO8tOcVUP1HdLSVDjki/T843marn4eHHgPzgxv?=
 =?us-ascii?Q?UcVeuQqiRYStyGU70kWgqLLApQQaHf0qq9ppQoGkjJOqwEN3ncinYftGUFvg?=
 =?us-ascii?Q?8NOGgNe2QLA0hq6oVt1TKnELh/OVu7a/V+K5CGq5p6iNnT8Bp+jUlmX0/xqC?=
 =?us-ascii?Q?MABT+izz+nqms+pVGFocR5++6xzqD2h3W3EbGhux1nPIG8VS8S/4BRfeTt+F?=
 =?us-ascii?Q?Bojs6CD+7/KXjxlkGoYlcPKiXsUNhXCMAeZdfP0JKVQhONnv2fe8aCEjGuJw?=
 =?us-ascii?Q?ot2JmLSk2f/iH5INeK+P75jerYl5cNDJSsFP39BtjPjpTSz50khUyR83hFR4?=
 =?us-ascii?Q?vYVgetHVn5la3j+xPpYOd3Yew1MDD8jP3L7CmycKsEfH1C9+8pBqOL+y6bal?=
 =?us-ascii?Q?gk1uWxM+OW69S7Qy6wLUDExkbp6w32h07FH0fIkkaZI5Jw+tUA+v47HGwcrb?=
 =?us-ascii?Q?deytCwhrRVvcZTbqGSVb0DRO7/R9PMmKpRPnND9KiDPTBRFlALK4E4qy06h5?=
 =?us-ascii?Q?KBM9zQh9LP8W44p+ZGyMuP5mkM4+ER6pKASdTHMvlRnLp5JA9SBQ6Jr3oLpe?=
 =?us-ascii?Q?7xiVPOtiGRWc4gi/eRqXPf5w9FPDlUGOlDzfZ/D7/cmOizCvT7lNZoV//Bgk?=
 =?us-ascii?Q?IM0nLy0yIi6tB3NiAahS3RRwBjl/rQOIqsMxLUdoVwxAsFZP+34mYYfMuXxV?=
 =?us-ascii?Q?iJEqvIlfV+QsoW81LsBz4TCmra1nNZ18c6ZHn/i656Rb5biLQSfgssO8dNoI?=
 =?us-ascii?Q?ZF1wFRCW07tO0/7q4cWcA1P+y654x4K6C2Raqxa25ivKnc2x40nw2k0pkf0W?=
 =?us-ascii?Q?U3ByV39W2oONtSgI0sApbPB6FL4WMoDKkhWdU24VbTh1GzP8dbleKZPxsT+N?=
 =?us-ascii?Q?tEWeOfxAe58EE3gj2/+FiumxqTAs/VoUXVUv2aZOMKm3RdV48a//gvtYtexZ?=
 =?us-ascii?Q?i/SzpDMiKR+nTKmBoav2xSg/fCYZm60=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af5f5fa-726d-4226-77bd-08def6e75c03
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 13:57:47.6759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PT/Dh4HEKt1oRVp8jB6eoAydOEgvCI3jVEzNUw99/mQQuJmqcyiT0XAEmbtAgmx5e66GINXcamGKzTwh3e+hunkXGkajZg5f0n3CZzcsPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2363
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 13:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243132

This series upgrades the following Python recipes:

- python3-mako: 1.3.12 -> 1.4.1
- python3-numpy: 2.5.1 -> 2.5.2

Jaipaul Cheernam (2):
  python3-mako: upgrade 1.3.12 -> 1.4.1
  python3-numpy: upgrade 2.5.1 -> 2.5.2

 .../python/{python3-mako_1.3.12.bb =3D> python3-mako_1.4.1.bb}  | 4 ++--
 .../python/{python3-numpy_2.5.1.bb =3D> python3-numpy_2.5.2.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.12.bb =3D> python3-m=
ako_1.4.1.bb} (78%)
 rename meta/recipes-devtools/python/{python3-numpy_2.5.1.bb =3D> python3-n=
umpy_2.5.2.bb} (97%)


