Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1169CD98F6
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 15:58:04 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23044.1781798274316705747
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 08:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=NWRDWEFF;
 spf=pass (domain: est.tech, ip: 52.101.66.67, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEoSJhTiryAXl5qSd4iWYvPJyAPKprE/wzyvk5TGiIBK3UhsvO38VewO2ktW/iv2aUPz5jkV+t2JZhjeQS1n51hjbC5ECUA5uUVKbBvwN5gpSZfkfTYcFYxo2tO+6gD5uuviX0s4VuLHlYtcRCoCJRXhRvcvb673MXWezL0ON4XSzVCCO32apjnUu+ZgXuLSznmtvNjTCCWF/PEtjHSduV50kSDdfXqvSZJ2BMyCNcnjXEZqj5Z80I4kaM4gpXOQCJpGx9SZjQNViI7AZozgkCX/7L+zF3LsFcvSygWi6HnpJG1m8bVy9wtCCf+45j5ypdpZKklcmbgx8yPFgX7qsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nX1DV3S58V8oXbCsEaMOu/wL5CJGv2pGD7oDzsHxYiE=;
 b=J2sEAp1VKx99X6mlisyER4UsDsUUZgLiuFD6XnwJM5SZ1mGDhfKGgITcz9Vr/UQaO+1gCG2R3XKZ/xYiwNOxsVdzIkZ5HCwkj7PSPc/GDfiVfVtF5+E8m1x+fIpwd9aoqDfec2xGYGmtkxg8USl4h0GM+d9TNeDfgkPZJv9eNu3ISYifZwsuLoZcjvb5+zRhJCKtAsDXq+Zw4tSqZM/Ye6THnS7+nX0cA3Rglz/oAT5Pwq5L0W5cNvXE5rJS1yJxBq9NVgF6L25Wp7EfNRRVjDDlBlSHIzcZtwlmrIc3rBXAbwucLF4dFXg4OD8/U3tw3YFKUaQ5wGeNlD9ZtQRgTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nX1DV3S58V8oXbCsEaMOu/wL5CJGv2pGD7oDzsHxYiE=;
 b=NWRDWEFF/xgLlQ6/xZJ06uWx81SC1i+7InDFhcnCONdlBrd6Jf2A3GDsAmR8msMERXNYbJ3YC8sn6rItkus9b3KKPWyOeAgctmfw9RFYq4JX/DqUX03qLUOvzf+rLZC4gKb+j4VaJ7zu7BoDRloFm3PjEWEn6iyYTHvmkjDfvkNlh5v1hvr1hw19SFqT++1JUtq9DfcwB+tcn9ld9uVijTzFSQbiORO79A5fqBde2xwXmWA32aPAfOaetut4lRratlBKTALPXkFXZPNfURRIqQaqMbeeHp7pVNa7/bK54I3rhRNy+N2JoSxgfr5JHL5wpKdZxO+qYyF4sc1+lnz4Pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 AMBP189MB3277.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.11; Thu, 18 Jun 2026 15:57:50 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.011; Thu, 18 Jun 2026
 15:57:50 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH v3 0/2] package: replace copydebugsources shell pipelines
Date: Thu, 18 Jun 2026 17:57:45 +0200
Message-ID: <cover.1781796358.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0062.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::15) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|AMBP189MB3277:EE_
X-MS-Office365-Filtering-Correlation-Id: 095e51f1-2206-43c0-ad59-08decd52591e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	NM71HmnOMUKCDuaFFQeFn7XnmpWC08RDzx6ri9F42Vy0LMeqx/pEsJOTKlnG5iQbIyREpEtl5gVix20yo4Bv5bGQGpG3191HvEWzERyrhoif+rvrImBxJIafXmv9VCriC2fblgJCXve71Vh63F0hxAx+XDEo/BRngU2f+qw2rh9gTVED7T8BwR6+TnE1EYCa/w8HsfLSymQ49f4UO1qxQO2j4ujezEMQyBBzPNtcEsQxnghZ7RzAUi+h/Qw/30g9OmptFbIGQzIPxWIPrOy5V0dP6RHjs5Nhbwf1VEPKI2zcmiGdkaxE2iGlky1IVV99SI91adnhWWFBKG/M4Nj9H8F9lnSO51cPkACVj/iTmv5OFw7UikRYyfIFN04r226Y1o7mtjgEtGZ1EleTbxTpmTtycYYE3sUTQDR6qC1oOUzWUE28unVIbQS7ZgpwenCSU1KxUsrZf97byfWRQuieKQOnRsbtufGjDSTB7edjdm0w2Drvc9FmQo88/v5aDjZHbR3frsN9yGYz0hINeUlJ9LnKZFMxhGnMMFBxDp4Jm/BIFQNqiLSOGSNiJ5nk7t7PSZRkIYg4md0pYlWGxN7vOHdcM0Nrvvc+9rE/U3T8CV+QjXv1r8UIL6tacGFXUfRF7/404FFps4shNsIFS/5EEQBdd/Od2tabED3Rrqq1bOoPJTYGRdd9L6CO+waBQmIB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IEFasSDp7iOrms61mq2YyE9+XxTeg/AdX6CUoZPYS2VR8bdEnxyYGm7/+Hs2?=
 =?us-ascii?Q?yoMRososo2+NS3MmYhO/VaAEhTgPDDF+iJjJ0n3iJF3nk692RT0CR8hVeGAA?=
 =?us-ascii?Q?OIZp4STeB4VN1YVCfe3UyVLOBXe8PWO+325LyTa+UYiSYUW+nNmamJJsYwXg?=
 =?us-ascii?Q?cG/WDFRy3VL1uXMzZD1fwTbNSbumHih0LPBRXRXVld9OcNbTeWBuOsjI3jHT?=
 =?us-ascii?Q?NQ+F1CjVYbpZcv+YbAOTuv9aiE7732pgix02b6GLUClMKZw8RIrccHk09Cd2?=
 =?us-ascii?Q?TqoujpiTM1rDV6PdeURbqzUw1JWbRDcuCzowNRiIuDHFR0PhTuUZPI7XIrup?=
 =?us-ascii?Q?zVSLbtuiuE6VCdyLTNC67JS7kCGQpZ5CYvHv/XlIUAQHt0lPO5xraOwOYcP4?=
 =?us-ascii?Q?6wyhzqBLWTscRGztt+9IQ8GHpmeONBF9DQxGZ2Em4c9G/BiLmHrAuzM2Q/bz?=
 =?us-ascii?Q?F2eqpVw7wJ0qYQ79jnyIUKE+Xpsl4zwJbYVsv4LMrUcOVZ021+BbCEOKuT+r?=
 =?us-ascii?Q?Za1fMVZkFOx01oQ+C2yvCstQAwAoLQ+AsfJ6tZWQ+kXzfo+EF0V/i4Fa8B0m?=
 =?us-ascii?Q?YXqb54V996p0njEjn//tcYdejczZDkwbVWqdqxwWxMgFxf4mk74X2XqtESjD?=
 =?us-ascii?Q?5EgZpeQ2+7Zx6BLWyEiDn0eqQm3scTFK1dSKrwP9d2nqxv5jmeAdR/txkVxP?=
 =?us-ascii?Q?fF4+Jw6hLq3fR2x4IAplNLwwKL+WakzXxSf5zCWVyBp7nk5o9/ZByDWo5/+p?=
 =?us-ascii?Q?8kNywyS7CRduAUvsz9HUqG/R2ya+PKHrUuaz1D0H7RNnQ9E/bfJ3uk4slTwg?=
 =?us-ascii?Q?BI7+8AkrcH52OP3UWysdaSRoc9EPbpBIEn2DCKgdKyALUJSP6ggcF1wL3Ddw?=
 =?us-ascii?Q?XxgI/Y2WifJyazlhMm0ivcnhAisP+WP8R7Vhj6IRoo2HFbNGiO+qiCRnFaaf?=
 =?us-ascii?Q?C5udyV1eXWaRo3+eIYUqj8eqvqK+Cc7mnaz/rxN3iNK8JInoWwSOeqiGcSK3?=
 =?us-ascii?Q?LY/WdRnOBqv9sdUQe9XjjcaalZI+ZuXkJbn1oFnW+f8I0clftk1RKVAJIcF1?=
 =?us-ascii?Q?KHGjvxLEk6h3r4iSQIIW9pcQKhOzTbg+AdYPyacCo7XGwza2qlX+8dg1W4fG?=
 =?us-ascii?Q?J+AccJ42BKwWu4eQggfsxFywTl+UjeUmFVWn/oLfOEmfTkkDhzS4bq0UkRnl?=
 =?us-ascii?Q?P7xormuuTpoS9R1bKgJ45HkMSseQD0BD7NowuM2Hnruj38s8CUBHmawuqEb8?=
 =?us-ascii?Q?EBm7VJ4zkJdl4DL7T/Y1WUC6NLBSbEjk5FubG5MyJGDtocrrpXNmpbg153Z/?=
 =?us-ascii?Q?ri6YRMBC+8TEDJTUeupu61zomw5vbwe5FXR5lX8IKIfaULE803ZhXLILK3mb?=
 =?us-ascii?Q?rJa+ApH2jueHawL5q1b+/mHIzUYF3NpT8YIOkYHHhYZLFTyax8nRibBoOqrN?=
 =?us-ascii?Q?MC+73tT/e1CenCXtNx0pSBOlucxneY4tVHVj52UmK0J1xZHd8viNexIo/UfC?=
 =?us-ascii?Q?3oMWz5cVOKMCDYycWNAXwIGOjeQVLqvj9Tw2lmCgIEljD4ADffIc0OzNZ087?=
 =?us-ascii?Q?BItmzXZX6+cIycnhOr3TW3+rpusJ10ux9bMuGIYIUZcKM7HZ88WjUGGm4qDj?=
 =?us-ascii?Q?sLmt1cEr0Y9RavfFBGEFRGUp2yO6F6FgpOBd++ip5g0zDsOH6VaKpnQ39z6r?=
 =?us-ascii?Q?PMiqbbYI+oGivFzQZ7O4VX4fBobtrjNYQeHUXZmQaO7t8Y1uA3rSzpS0VFg8?=
 =?us-ascii?Q?qE3VIWEvmA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 095e51f1-2206-43c0-ad59-08decd52591e
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 15:57:50.0201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23FVBcN9QwDMmrdXLoiajcQJDiv3/VMRBNFiL3R+IJmHBlekc2PCzdPlv3crSvoO4gFy+Wlpjg/knL3yYNZXBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB3277
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 15:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239087

Replace the copydebugsources() sort/grep/sed shell pipeline with Python
filtering over the NUL-separated source list while keeping cpio for the
copy pass. Use an explicit prefix + "/" match before stripping the mapped
debug source prefix, replace the symlink fixup pipeline with os.walk()
plus cpio, use an argv-list mv for externalsrc relocation, and pass the
empty-directory find command as an argv list.

The externalsrc relocation keeps mv, but now with an argv list and
glob.glob(glob.escape(...)). This preserves the old shell "*" and mv
overwrite semantics.

The first cpio copy pass keeps the previous failure-tolerant behavior,
while the symlink fixup copy still reports cpio failures.

Benchmarks did not indicate regression.

Changes in v3:
  - Improve the source list filtering for readability based on review.

Anders Heimer (2):
  package: replace copydebugsources shell pipelines
  oeqa/selftest: add copydebugsources tests

 meta/lib/oe/package.py                        |  72 +++--
 meta/lib/oeqa/selftest/cases/oelib/package.py | 265 ++++++++++++++++++
 2 files changed, 315 insertions(+), 22 deletions(-)


