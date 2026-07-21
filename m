Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C964EC44532
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:23:52 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24039.1784643825443114054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=GCwjcIRG;
 spf=pass (domain: est.tech, ip: 52.101.84.21, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFXQYL9tT6M2kIZBv7QKl1S1eoc1FRd7ZnOUFmfXNHxqGYH8zdyyj+iSCNei5PEbONo7/MzWfdRtXVa3Op+Aw4WuESmLTksceh7VHXTjk3sPlQDDeaYoVr0sIc+LX92k4y6XuZjE1FLunp8gb3PkA0Cstg8jXJ4W/qgxOTrEQO36QT+4s4wrpaG/wWkHn3LiUcpgCXHG1tSHq94YEjFRJ84v1lm6blDx+WsM8Dg61j8qu3N7+xpN6S/Xo0zJE7ZCfmUM+QQVBAInNFxGqXe4gBUT/07DmHGnl2uMNcMaQp7Fj+LHwYlo4CZ2jzCoTtnGXrTDjAY9aG78vIuFczTPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkRa1T2ZU7Be5C+vDWO7bsEElC61OMX+3aCxyc2UtxU=;
 b=SdIU5qeILAyUuuQKcwXjeCvDYJKw/vbeVULhwm7VZcXGJVAfRoC5SrICwVDHNrmBoZ8WLGJMaKbGOBxTTOZ3JYk2PMPBqyt3DzfhpeMvfhS82Fo8UhPdKd2RSpj9Oaz20GdBunvSf9a85/RlDXapS/JZib4F0ctxe04b1O9HtKjuKplXxKrg0XuN1mkZqYbwTieIyeFJCfn84aAap+7MWKgDSmpYx7poyuN4GgGCt1NCIW0qD0qB18fDtFzRQJxQkBH5ewXeenBLbSPPcitkLlXuRIm0sg2J/b2ghMjZOPgIit35i5AMq2C+w7AavF3UzArCBa1M1kLOSHzLYjV7QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkRa1T2ZU7Be5C+vDWO7bsEElC61OMX+3aCxyc2UtxU=;
 b=GCwjcIRGxLpvP/7OhwF9gbaaXFUYcKBWbQHUi4SHzlJ9ul1p9j/wAqjLlu2WILi/1l5JzTYuNlTZbTT03b8SZ3tcLqbCJ0csYzxdYb3phWSjLzkDoMbpaXV4UVibnq9zPQFUAHJO8fyPbLjESYk1LIwILyzSs01fZNKH3Y5jEvvIL9VgxXnhuSH9p3l9XXKBbFbJcQlX9T8tHzM3PlmhPLCZQ1djEvg69KY/RGQfA+YKoSZZkXfEHv1TXOxEi6G5L2dyi7lb0fZTcdc3/vLnxxD8dKL4XkHtEpavYzAkJSyBZKrUoKEt+L0lC3hMrTN7Nom7tAcQJScvxxeCOHp5nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7P189MB0850.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:173::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 14:23:41 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 14:23:41 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH v2 0/3] perl: fix multiple CVEs
Date: Tue, 21 Jul 2026 16:23:33 +0200
Message-ID: <20260721142336.21513-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260721134616.16538-1-jaipaul.cheernam@est.tech>
References: <20260721134616.16538-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::24) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7P189MB0850:EE_
X-MS-Office365-Filtering-Correlation-Id: 91433976-6baf-4111-d019-08dee733a9db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	h4c1NypdnApgBCkaXrprxR8s9/qvFzsM0dyVyKPVXfdN4FSXzKSbq6R5FLNP3uwGA4a3aYuudjYACcpkfaqlt2Ra10NiCxjpTrs47OzzDaBVbLoNsp7LUvd58rxUUHYSFB1q9iGZTP3jIldLvz5oigLimA44EYCBen4MJT309+rtvWfLIXdxn4toLCgmSl8UEjUDCwsMDpAWmhYKbDkMqHTOQrRmh/qfa7YpB6fUrEAkmRTQvarbu+TWYm/aUZA8FQe0eo0Ro5nVRI9mK1D3oAHLhzpqYvfbX+to4lTvzLhYqwgBESFhszjHssbbbFig2SgczJGM8Za4+pQ77sNuavyO41X3EMUPTun26ILjnw6nBPTEhufmO3LkdnRuK/zFILqigZ+Gf5l/pzEGaSq2UyTpQdzesABLtgUpCdaxTIh/soMgdx1WdA5UwIF5BkhtnH7nRY2dRqMyxflWcBEd2E3OdvBPN3SBys8sr7Q/o3DSEiy1FQexgMzOVGFW/RpElrkpKi6nnH++hZ8j2QwnxO3OWTo1DYZ3DHm0YiREFwuKXDsxIhqvJ0Lo89+LheY29ATUMyahGjKRYg3/gBBYt5ykvSlSR507nRuEEKIdTiy4NZF7uM55L+OmBJ6rjDUr3FwA+yi7QnPGlw4ZnkZqD9Z1x6fQV6bRWVPKeXXVW+4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QZnb7wN9iJ/34xjeB5UHrXfCiNE+I0+4ZEg9P3M6ZNya+rAk5Nbtwi1LIFhF?=
 =?us-ascii?Q?TsoXrm4XhNTVqhPNKkPHnrcs09il/6VLo2ZzNnB8NOxRBZHANvJI6cwUaprx?=
 =?us-ascii?Q?gGnxUg5Tqic/T56WBZ2VeWTOjYbtwRh2P1ldQDoQ5HuJpxPvrgxyT0fWwclP?=
 =?us-ascii?Q?0cjzx3Zjeodtg31rrpeunbCf4ltSMujqsxFcM+ZzFYh0QfXf/i6BSxWZxUKN?=
 =?us-ascii?Q?BM0Z6yYuHhsiH4e1QGilmhcRo6cE3YIWL07N580QdA+3DA8B3iu+cGwxOJZo?=
 =?us-ascii?Q?sGMmfrNpFP5A1Cy37uzDfDpMje2y66WK4KfIWZjyurRYUiYrTU+DAjUnVwH6?=
 =?us-ascii?Q?9uOrxwb5QRirjogfIw1vhvDw28kTbFI0O0ehr7nXhR/DJ59MJzsa43HINYEk?=
 =?us-ascii?Q?urNoLsSzE3VapTRNRGO2B9qqB3N9ZoPUzcvdSyOLCm9DCCQAKYuzv3s+5dP7?=
 =?us-ascii?Q?ZJfkCOrn5nZL63S15SH225Kam3t9yWO+oxFSZKwPTc8J4WWPaZxzPJMg4awU?=
 =?us-ascii?Q?IylvqRdyEtWjFXrk6IzWm2PPjJgSgC6U7ooP9mSgwHMVy7OP7bNpSC5x2Xwo?=
 =?us-ascii?Q?3B49T50dPbyyUewzdgp6qjDMLe6ldA+vcCClQDwn5DvDmMkgbbiDquWAYwni?=
 =?us-ascii?Q?N6k1DRqpKW4rORUK3hpsvCY4oQ6X1eT+LIl+uMwddnpDotZ/g6wPgybxlDZ1?=
 =?us-ascii?Q?OO53hm5tJXMHQrzqvy6vLARcZRzUOVpllSNRd7HttNFkCzYzREJniuKBJC3d?=
 =?us-ascii?Q?PJfreAbk3tMPrDgVANNDMd3OERj3PeH6opTOYR19APv5mKhbsr3CD3TUv/HJ?=
 =?us-ascii?Q?xQy3SNIcr/DI3OkUxFI/opJOCi0fIj+VBhdtFQpb/O4+Hd3Q63eC0GNEI42X?=
 =?us-ascii?Q?jWZ5LfI2I3QN35sOJTn+VWcdrbVdBjK257A/5c/48EqanaBcKKo+DrzSXXqB?=
 =?us-ascii?Q?ASKLVFT/nfnc+rZL+p7st4AMFctPXDyx1uakQ31SeXV8Ok3H92zz5434iOlt?=
 =?us-ascii?Q?eAi9imFY74dsRwFxTFbgU4SK7BtbsvOIPDjG4WE2nmO+9R1Grn6KO+wKMxf8?=
 =?us-ascii?Q?KDUKCay22H+seYYrxLHaEzISUn4JEeSF0tVGbgFT7L+ANnpmwGgYOqZ8RFYQ?=
 =?us-ascii?Q?dgKNd0Lu7utfLJ7NUTZ1KGiL8aJgrRo1UMWw2JrK3giYoxskmM/1xbmkxagM?=
 =?us-ascii?Q?hVqIKA59S1tvQPrioR/AQk36PMBsa4vZTzC8k9mggrdCl1oRP4DUKgRZGK+z?=
 =?us-ascii?Q?4kuFilhBvGu2nhZqG7BaV5xrPVwAUwHLWSrQiW/cIoovl04MSINZhsp2EhaD?=
 =?us-ascii?Q?WY6JO1i9b6/AFzKqV1ebzd6O+rkQobgKCcOKZ7oRqXJbN4tB1WG5ZWIPGCVy?=
 =?us-ascii?Q?h75M3ItGhlrSjWhpDnA6VQ6GslEB4q61/xHoyWm+OIk6ZtKsOSiH26OHUgnU?=
 =?us-ascii?Q?ZTXQlU4RFAXa7MgQgVUGDKeXLZ/gP9XBVX4tMvKycfeHuV+EdCZYJCr48h0/?=
 =?us-ascii?Q?Y6TK3prulsMeO3wj7zjBCgax4m3247tJor/ewILOl6iivD3FPAq1ia9aaDgR?=
 =?us-ascii?Q?MYsvXg52GY670yIkBeoYmmKCtNuoLUIUHJRg3W+JZ3Fy0FR+v2nFw2FIxdWm?=
 =?us-ascii?Q?j7ouqfsyzZfyi+Y7Dnbv65GNE5IRaHhuhTDj/qZBjMzssAtSTUm9NEJAGXDA?=
 =?us-ascii?Q?c2wvuW1xKxzwhAwUmS/N8gboCSXy44eQOrvbuRDnndcIfI2LCi/n7jFaxE5U?=
 =?us-ascii?Q?AFJbBp2Ga/ODxUTohM8P92Th1e3Of5U=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 91433976-6baf-4111-d019-08dee733a9db
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:23:41.3694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: poV06TqGkBRi1GmBOD30uCS/VVEa82tBk63Y4eY3fmhn6CRXHIWEwlmduSYs6Qvk2sIA/1itA6eM+4FKa/t22AXZZ6E5u88+Ww9DOztGQ+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0850
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241535

Fix three security vulnerabilities in perl 5.38.4:

- CVE-2026-13221: regex trie overflow causing incorrect matches when
  alternation has more than 65535 fixed string branches (CVSS 9.1)
- CVE-2026-57432: integer overflow in pack/unpack leading to
  out-of-bounds heap read (CVSS 8.4)
- CVE-2025-40909: threads working directory race condition allowing
  file operations to target unintended paths

Changes since v1:
- Added CVE-2025-40909 fix with companion perlcross patch for
  d_fdopendir configuration detection

CVE-2025-40909 is fixed upstream in perl 5.42.0. CVE-2026-13221 and
CVE-2026-57432 are fixed upstream in perl 5.44.0.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---

Changes in v2:
- Added companion perlcross patch (CVE-2025-40909-dep) to add
  d_fdopendir configuration detection required by the CVE fix

Jaipaul Cheernam (3):
  perl: fix CVE-2026-13221
  perl: fix CVE-2026-57432
  perl: fix CVE-2025-40909

 .../perl-cross/files/CVE-2025-40909-dep.patch |  25 ++
 .../perl-cross/perlcross_1.6.2.bb             |   1 +
 .../perl/files/CVE-2025-40909.patch           | 412 ++++++++++++++++++
 .../perl/files/CVE-2026-13221.patch           |  75 ++++
 .../perl/files/CVE-2026-57432-01.patch        |  52 +++
 .../perl/files/CVE-2026-57432-02.patch        |  34 ++
 meta/recipes-devtools/perl/perl_5.38.4.bb     |   4 +
 7 files changed, 603 insertions(+)
 create mode 100644 meta/recipes-devtools/perl-cross/files/CVE-2025-40909-d=
ep.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2025-40909.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-13221.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-01.patc=
h
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-02.patc=
h


