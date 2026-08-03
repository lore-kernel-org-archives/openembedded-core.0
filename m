Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55117C5518F
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:41:58 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38928.1785746513404863679
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=UeM0aJuT;
 spf=pass (domain: est.tech, ip: 52.101.66.12, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbRQojxNOcA8Q//hh8kE0CIhVslBidbAX49sk3u4p7xLjZn5bBr3FQUmZ5gG30/EMHTSW5HOpRQc6Yj8RVWrSfd2OozKmiDUVPzEDbjGhotkUghHK0lkwzw39RkwaS5MXhrM2gy9HARYGp39bDijNq+MUNd7CA6dglA+YtbuPDi9QIly0MJBBQdJ1wP+FwmI3A2ksS4Rg1uHfIGYGIWDkxyRX7ffb/o/Y+dwSbq1M40D+XtGhJeyCeBzTA3ONX/3WKW5b56kre4PvNkmlzHXInffq8NhPSyutWal9wjqG8ggV/XNegKkKb3JQl27hIqhlE/2Z+VTF3RlECeLMhz/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksjZ6/XIhmoGd4cQrr44eoFvBwk7M/6nbXjcsL5cD1s=;
 b=bpKb1ApIxIVQ712+B1jY7E7CAXXpcQYUakGT6grTx04oU+xvXNjHBTTe/tzFNVofx/KEDeLtLE1TAq+G0HZKXF96k5TlLrnpFTb8cYyMY+0F2+CqXlHPSNHWOymp1cYYwYABZb9Gn5BpdDVSsRhTou8dVL9zdaS8Pm0L4RetsXexNPxORhPjykatRO4OA6mRqvEM9eZ55ltbOgxsZVjR6k6poR1J75xymBrBLlcyGgXaei7whBvHf361sVzSVgBADX8lLX8aQ/rutcGu+xzN4sQvm7vKNQI5+21E04UJYMu0+7vDy9LYavYJlTpGIV5R740garEe6lnU5gb/GrzFdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksjZ6/XIhmoGd4cQrr44eoFvBwk7M/6nbXjcsL5cD1s=;
 b=UeM0aJuTOQVAiZlbUh0V1gQWFKHL634gvWvvdyEIC72GxgihY1oExA1ITpbj5v76zPC2sSPgC4IqLEF8tPLdrkUmfnbhc1cR9+VT3gGwsx39fomnrkhmGNVkmgR/bUx5z9AACOXfjxLR9yB0L1VOgOgE28a0ihsQOPjWs9y/fI18nrw+be7MP2Ya1kd4CAxQK3IXG/iry57gOrG9Lb0Vp//BiD5VtsYGHTR2aexx2brA3BhgJ0AvqOFOPcGyRp4lYJkgBAvKr/YqMGPhQfvoG03z9WC9I4IGlIZzkz6N0n9MXWDV8gcBRI1jXLcImfKG+XTcX1OJTnUSbNxKbH5SWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB4P189MB2215.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:380::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 08:41:49 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 08:41:47 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH 0/3] libssh2: fix CVE-2026-66033, CVE-2026-66034, CVE-2026-66035
Date: Mon,  3 Aug 2026 10:41:38 +0200
Message-ID: <20260803084141.46902-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR06CA0013.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::18) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB4P189MB2215:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de238a4-ff66-481b-de99-08def13b0e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Rq4VL3LIBBfLnn8Xk42M6JBsjCWoiO3H814lixU3jTLxWScpGQTlxG4/jFpHISqB30aHq7TIrYUk1Pp3SKUMasxOZf1T3apVkrUU+CZGuL5OvMcg/VZZvvLdyOE6z69aeA+DquV+SGCivhXjHgGXg8cLIGIOV0INbarzgUAvYDVWY4jJSeZs2/5OSiroM3HmmxBSLzKPXZjziWUUc+Nlmyt/5VS2RgR+3QLnSrM4xQIPcocdKFESno8JRzIySgLU/tFI9BmPLj/FY0QDbTVM4WXxnyhXzxOn1wUKeUId7X+klb5XXce4NAkQZfHa06ya+M1iWXdIbwvuU8RBgzeOfkepZkt8GZQ2h7cCYm/JhfK1lERAQRQNqFRqIqEWyt7CpHvMoleOodJWgqXBCjfM0iIwrQ2qX2SrjhhOlq1r2FOTmgg7beao+PkYbLCf7QsdC+AO5pcUIsqq6+XnRwcX3bz572/MrSVW70yInmn2qnMvsXn0sfmz8mpjQPj64zAOuDW7owoqKOaQk8d5bu55qhox0/vxaM1NxtpjoW5zBUwn2qD33CtNVI/1GASnm/iBbpENmlOmFIK9dPeEoJYRXroYmpmgbYO0LR4PF7sLNwngoZ3d4jPZhg9jfTXWARe42w/UrGH5NGGriW+aHxrdWBT0vatHWGs9+CVghiosv6o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YMjdRHiOwnOi8GUCDzsgdKVAGpt+Yljme7zV9adMew/xuWLlkZLBiyqsUwLd?=
 =?us-ascii?Q?accA/i1UJaZen8UwCMZFeSvf03Z2qj1C1wRGAU5iyuoENmgyBfC6pdh+a9hS?=
 =?us-ascii?Q?pZrjBwsyoBSet207hLHrasK4TcR7SnaDMW5sICEdW16ss10INdtrZXZVgPMy?=
 =?us-ascii?Q?u/iA4kE8N2vh0nRegeRNcMZFi9Odzk7Q1KQqHvIBWWeqc+39EhtrnPutdt5o?=
 =?us-ascii?Q?QrddP39v2+n+wSHSZxdgGDJVlT1TuOlU9epWPJrCkMEPud/WTYiWsNr/cGtJ?=
 =?us-ascii?Q?Vr7YKf9+nlcGUJLmUo4gDzbNlotCrtIFurReAf+bhUo2pJ6vutAGFMWwJm1J?=
 =?us-ascii?Q?Fg56QPd9aoM5OnHEVWNRwcTI0mb39J4SCQ1OFRf/hx/6Z4IHgOH28EbwRpqt?=
 =?us-ascii?Q?BFahRfYI8ynWlcIfnupP1DkvVInfgjVRuG5q5eHNX9i6TItJFlOANLDd9G4x?=
 =?us-ascii?Q?BwO/MxrYA+0AMNnr/vGqY3jN5KBr0uZxkFCoqtBNHweX94AHh6ivlhF5e9Gw?=
 =?us-ascii?Q?13SfgIVsqCpFBV1rqOrtDRHCnXlIWoRrJ12T7mLQ4wvRNSy5Fv80+2t4SBS9?=
 =?us-ascii?Q?TSPxm/kHdVqs9mHPI1hiuq6hkp2To8kFi3ljJmn4uueIpT+SH/PzATTku9p/?=
 =?us-ascii?Q?TBAdYuilAXolmAFBjP25ISDOXbW8spps+a5PyCR6pqk8xgIwp2zLln+Xf6JV?=
 =?us-ascii?Q?A+pISI2U8an/oJnRA1ityWAIM1a9TgJlUVLMeXXnTCPdRJ1RSz/8rabsZ/Nc?=
 =?us-ascii?Q?+ibHAjCm9KepwOmoT/YdUjR0G7MjRHHEVqnZ9w79EkwjRLVwfbj1sxb3z1aa?=
 =?us-ascii?Q?TCRWd+gkbCgGT0WzQMN2Dq6aF7iBgAAR5FKLJm6TRHSlYL1ZEhjwCdUQKdJ/?=
 =?us-ascii?Q?1pxZ2C24ESKFi2zjOf7fxbt/jrxs++5LdmD12iIP9YmQThVHfr9hZ0wVK21g?=
 =?us-ascii?Q?RTO8ffP5AtRDMYozHlcoOZ/1F0QIPfOslEwjeYdO/Re+63zxGxlBYxqk5hRL?=
 =?us-ascii?Q?fmiLK8mFVV1S9TckypIDBf7Qrqu18OQ8wYu3nMjmRdaVQQldkz6Wrb4KjGSr?=
 =?us-ascii?Q?WbLUG6tAIagU9ZDud4BntIYAAkcM5/tHYMSiNDGkF9HUUE0h45cGdRP4ZobN?=
 =?us-ascii?Q?wIUrsRDWF7c53W4GiU7gyvOr+jtnnOLzbktta3oQlA1fz9L5WgIq3fgTmtQy?=
 =?us-ascii?Q?nzdKH4KV9E6vx9QLd5Q6duNhGgHnAPfoAuuyJZU3nNmk4VIjqHOJAXJjxOvC?=
 =?us-ascii?Q?/vRyTol9J0w/RquAAeaY+U15vWSHE+uCgp9+uy9NoGzBf7mGK0xBTGloRQ0k?=
 =?us-ascii?Q?TQ5gU4w1qexTQBK+JYSAi7xRD99kRa6FOVGOE59E257lyNyJp46emTBUB7Wc?=
 =?us-ascii?Q?8/GgDTDCgcED2om0fbpJNS64AhBwl1gcmzEYrQ+HNY2J0APvtiERVK7bGW0i?=
 =?us-ascii?Q?JQyQ8R6NLK7kKnNundiXwcqZDXWVwp/jxCwaXaRpHWriJ5vY7yYljjAIFa9O?=
 =?us-ascii?Q?JLsUaR2XGj2TrFeCtxK9rHHxS8kHGRs6L1vXLTCqdGVRClX0v3UoOYM7g8x5?=
 =?us-ascii?Q?gtKC4W9Cu/zjrmj7ILsKlTDsVeAEZIwccAK5LnommTXbjXI2XkccRly9SlmS?=
 =?us-ascii?Q?3yMq68bUaiSeb5Aq2k0MJnxP8gAcZvaODgc2dTq6Y3yhCw546OYsqm50guxE?=
 =?us-ascii?Q?gK/2b3bQrTLPWY4jfzVVstRc+hFclkhHGU1xT+6wY9XJypdg0FPEzWFoVJ5X?=
 =?us-ascii?Q?l7vMv+NrMxlQOjAENHnMhggNYWE0FpQ=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de238a4-ff66-481b-de99-08def13b0e4d
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 08:41:47.9546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xwt3WcnFlDRfXR42xqr+iq9RZQlvrkrcItcgWmzDwjPjAHhGWS/cAj5/Vx6TOJzfA7acpxd/EhlgXkIPx/yaeSiXCOo4SZWtkSkAErDTbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2215
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242622

Fix three CVEs in libssh2 1.11.1 by backporting upstream fixes:

- CVE-2026-66033: potential OOB read/write with AES-GCM in ssh2_cipher_cryp=
t()
- CVE-2026-66034: potential OOB read in libssh2_publickey_list_fetch()
- CVE-2026-66035: potential heap overflow on ETM decrypt

Backport adaptations:
- CVE-2026-66034: upstream uses ssh2_err() which is not available in
  1.11.1, replaced with _libssh2_error().
- CVE-2026-66035: upstream uses SSH2_SAFEFREE() (not in 1.11.1),
  replaced with LIBSSH2_FREE() + NULL reset. Also upstream renames
  decrypt() to transport_decrypt(), retained original name.

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

Jaipaul Cheernam (3):
  libssh2: fix CVE-2026-66033
  libssh2: fix CVE-2026-66034
  libssh2: fix CVE-2026-66035

 .../libssh2/libssh2/CVE-2026-66033.patch      | 45 +++++++++++++++
 .../libssh2/libssh2/CVE-2026-66034.patch      | 40 +++++++++++++
 .../libssh2/libssh2/CVE-2026-66035.patch      | 56 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  3 +
 4 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66033.pat=
ch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66034.pat=
ch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66035.pat=
ch


