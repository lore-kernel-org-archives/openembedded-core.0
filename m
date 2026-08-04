Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C0DC55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 13:10:05 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16049.1785849001865357749
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 06:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tSW9y5MS;
 spf=pass (domain: est.tech, ip: 40.107.162.40, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1G0njr+gzbPJUL4v3w+t/EHoD76vbzm57Ka/PlFx1WnVRTf0/kXqlUujyLogoXI8ku7E6mHDAOLTnL3RwA5SxwQ8fw5OWfV0acfEuBgekXm2ViRLJrBey3NSF2tAqu+FPsL4TpH4n7biBC/fgBQrYIspXi1Y7LS0Ver2KN8cbX0GYgyprAP4ySvXsldDZvOayrTBa0o6Y/M8RRdZBx8bvbrwiQt8dpZZZQjz8zSaFMeTTwIqrcUIgMVFnK/z8oe4YL3yLtGWLbImd2+U2wy77Ry36zS42NOeyiC1997oy5In7qzcAKyoQD8KW39CMiw0a9FkuFPkEo/rImiVAJfGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ac5zgwtb2hGx1OTRDifTruVmzjRTjB+4Ya2zqV6LVAM=;
 b=YIyXwu/ahny1P54edq9BEgErB+4tYQmGicChqfeQi9qSkbxLLQgSUXTrLqnuq1jl6Wbbf2SkJu7bSm+GQru1PNF1aMV3fM40ommowtnCzOwvzlCkkw39FU5PsjC28jiMV3HkxTIgBMaQE70gX99cW91fYIDDn2a3nPSyJwGyICDkqydwS2PUDFQ7hIJNvYMgpwWgzmWQqxoG1gOTJpCUMlVdPUC7Y3Fu20gkbDV4gWuxiOLY3yHobUvtCPao4QphvGlsX++2NbvvRymE65lP382BAYNOc4YA4d9enJ20MZf19JwZONSR6Y8XA/1xVAVbrg4gTO+9OuJc+exzmBk9IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ac5zgwtb2hGx1OTRDifTruVmzjRTjB+4Ya2zqV6LVAM=;
 b=tSW9y5MSHfC/+zT3+pqsSnoSFLjZig/hu/7JpCD/N5OC7XVrATVJK5AtrVASvP8mJ6i1RfcW9DPnZpCVErhdaP4UIKhd9d4U/A4uck0+zrLcBVyHaa0Wl23aViKw0T38zyjGlp3IsUtakJcRvoAHp5yOZwWoK60gjQ8krYr0QwyEDzCFmpLXRZ18fG3LMtw/i4xQlVs+tUiUQzIPBSvC27PIbrciNk3+P0oRZWxB4CxlhtA65h3WZEs2Z6/AG4Ns5X0IyyAvQjXHpnfB3dzqjG/xEJt3lvcVU9+Z3kYFM7rCtemZv3QxmXxThuCPV6gdNstHpUM1JuUqu1l0SS5qeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7PPFB2DB17625.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::6a3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 13:09:56 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 13:09:56 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH v2 0/4] libssh2: fix CVE-2026-66032, CVE-2026-66033, CVE-2026-66034, CVE-2026-66035
Date: Tue,  4 Aug 2026 15:09:42 +0200
Message-ID: <20260804130946.3539-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260804122255.3053-1-jaipaul.cheernam@est.tech>
References: <20260804122255.3053-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0382.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::9) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7PPFB2DB17625:EE_
X-MS-Office365-Filtering-Correlation-Id: 9371d427-a0ed-4cee-fb29-08def229ae33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	McVw2VNCANuqcq1blcuHzpoTgDWWe1NG/uj2qlkuZLIAXdvCdsubOaXh5QzTFNojJoYxSgxpJZvydo0Spsb+h7J38KtEwzLtkO7HKZEGH4pMZF5UsyMdypMMib7zra3/7AraE0ZwaYbz9OcKQ3b3yemV0Q8ZSQTNrz7+PwoilpcRPAD3fV+lwxaxraaIWJaG8JmnbmSQDi2QqTkr9JKV9F7UOX1lZiokBbjCsk3RoegaKR42ZTURHZ4ZAG0wsHqszsAsT2uvZABLSmMrM7BX5Z/73rdB+OkrD+080YEVC28qtuMIIp6ixm2/o33JpekgM99M7aWPhRYkJp7A9Wun+VewkVwFviyyT6YcIs7wwS+MdKpSUyXrF5b/U2yY5XAHWKs+Gq8Wg9kCYsVbm53yFYJiL97WsWNHcu7+fQjq1UGd/M/kINyzV9+MDK8wacQUi+NxUcxJUTR8YCiekfiR/Swlo7XPrr4a1NY8qwWdeR1QuthOw9nPGNt0eQnpoIKywd6d+zv0qLypK7f1DMDBiqvK693dLRRlZTWUvYUBOqMKQZEndhSXY3VPZRHTHDbAFv/YKl/S2xo7pljuvsCOxU4IUdsWIFXbKht7AbVP/Q+Mc1JY71cPKCFj5NppPDadSKLu1K+O9SppBYfxxTQX88XnBDfSMF7UKhlBeKL9Xj4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jGJopqKSgvoFfqP815dIQWDgZi0q1V6BXnckkpP7lKy5i0NeKaVoMAWC8f+A?=
 =?us-ascii?Q?ATm1M756FwtPd67c1mPoxzSmL0sXjKDcIxj0n+cjHGLbb+QeyJESIjn9G2bQ?=
 =?us-ascii?Q?KqPU/5d0vQYXH1bTe2/ypVwohUsUeI323vxDQxt7eNeDAKi0GITn47Si1pVf?=
 =?us-ascii?Q?OMU8VVpAODo1i7RHRmJxaywwRD0U8RIBeYH7axs3i7nSorbV0DQufoOBgttX?=
 =?us-ascii?Q?39tQMlX4GaIMoUTTZiOL3pkY3puxwT3M/t58zd6a/uMkMiiX9dZRYs+SVv+v?=
 =?us-ascii?Q?GPPTBRXb8taqCFaO05UF/bpzQI20f/08I9KKq4JH/itofEHBgKlfyAvbbXNx?=
 =?us-ascii?Q?ew+hjHfCqDtxNDU4N9qEvwDMjslCBj70atdGuX6DodKLJRW44JT7GfPE61tI?=
 =?us-ascii?Q?HbjnQx3/h+JtVI3bbo01Y7l04I8R4zVKX9ssM2YpKWq0UtkDMbTJrogS0a/N?=
 =?us-ascii?Q?VCq9QQGKF6i7dJVzPagG93kdMfVKNsx7yiQx3HCpqRLaIcaNOR7xnFwAW9F0?=
 =?us-ascii?Q?aD5/nd27hUqdf3J4Ox2o2Qbe7dJXGicUY+eptowTKgJavOz/OA44gyz4oqko?=
 =?us-ascii?Q?jQ+fgVEjilIWazpFjmAT8tSHB/d2x8/RrtzUhp4N3SryNtCAKQky0nbX5ZBM?=
 =?us-ascii?Q?QpVQvMx1d6LCrtXLgJHs3Qjsb8bbgMsL8G+kGwh3V3x9RSWvA8xwdEfNp09p?=
 =?us-ascii?Q?etXzRhezvfONZNd5jQyxqSx4tmE/GjITtU21z1LGKfAuFsFqHAQsZ3dnhCJV?=
 =?us-ascii?Q?FxCEmChMMlYogeouez5o33YIOFzWWfIwaMK1WPfPpiAPjXNyKzLGBgK6tW6r?=
 =?us-ascii?Q?iaZzex1LnPONfNezMcHuUlhpLOcc5wHjVeZvumuaJbr3f+gIIaThYdC92TSz?=
 =?us-ascii?Q?5dtKc7rwuiGRSEPkgYg9ykLySNK7W68/Qtzz/FxOzqKy2aiu5YCLs76yQ60Q?=
 =?us-ascii?Q?OhdDwCOcL5/tPxmOTlKmS3ouMaXInrbzT4cSFEGzcLnbp2BIFiw01FUJeSLh?=
 =?us-ascii?Q?6uZXRv4H/4N5zWp6cDhtIizTcMXvUo9G5hr869ngfXwqd5Heavb53DHkfnYj?=
 =?us-ascii?Q?jv5w77D22ZeerqjIlnx/pTjJ0Ban6SoCQ5h2y3xBuz2iUqd9FlIrqTfBqnNH?=
 =?us-ascii?Q?lzAxybbecO9lSACMaAsPhjhbVwNgD1iHh/R/sIKlK72EGADOXk8oHOcreMXB?=
 =?us-ascii?Q?R4KFnXcCus8TFr0iJzwl5PHvJ/oWsE8AUm1vU8EU2QbbG7GtZF9SBTu8B5Jt?=
 =?us-ascii?Q?2JqWdMVUj0NOkRLPAPEqtWUifCTDzAsxgRN7bmcIq88aa8YBA0AfjU4p+6Ux?=
 =?us-ascii?Q?zcF/RdLk5MrCDPT0bz9i17r0RIu+M1jv+BHp5Juib3GWi9buIFZiqrncHTfW?=
 =?us-ascii?Q?f1TvRRQ29gJB982+6ahgrz9gKs2adXAwQAV5DFlkqXYjzbPiMVEb0fGfgVRX?=
 =?us-ascii?Q?xs/XGUw3WUZyB7UKm7vipvLRxndU/Y8hgY7UCdzt0SjiJ713LBjgLPe7xPAo?=
 =?us-ascii?Q?BRbPgnOPT0kuN/mB8mqY8nhDYqcWwd/d/9g/Hgf4zPJWY6fq9/lvk5fjvcUB?=
 =?us-ascii?Q?tZfkAiIoM04lnOVcQ962tPf+smOmGIt6CyWndcx2C6gIqScKzpI9hSl30kO7?=
 =?us-ascii?Q?fGXQY4lFkE65PO3dirQOIA/aoNn6VwS1YBDVwvM1WERHGQ46t8ikAfWIHJNr?=
 =?us-ascii?Q?5lPfohKlvdbJ7D8Q6nDOiWzc9+kSFB8KPyK8aH+FIkd5ZB1dfQFO/wIqE0P1?=
 =?us-ascii?Q?m/g7/5VtRblHbj4TvJu+n8+KYtqpavE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9371d427-a0ed-4cee-fb29-08def229ae33
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 13:09:56.4934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdXl35BsxgN4MrOBRZqM21mS5+g2n6e2UNy6R7iV9KpeFkn4spsbdAqBntZxFMFdnckpmxfV/selxAd1BVMbwxig6kji9tqPGTASGTqhm/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFB2DB17625
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 13:10:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242753

Fix four CVEs in libssh2 1.11.1 by backporting upstream fixes:

- CVE-2026-66032: dangling pointer in sftp_open after free
- CVE-2026-66033: potential OOB read/write with AES-GCM in ssh2_cipher_cryp=
t()
- CVE-2026-66034: potential OOB read in libssh2_publickey_list_fetch()
- CVE-2026-66035: potential heap overflow on ETM decrypt

Backport adaptations:
- CVE-2026-66032: upstream uses SSH2_FREE() renamed from LIBSSH2_FREE()
  in newer libssh2. Context adjusted for 1.11.1.
- CVE-2026-66034: upstream uses ssh2_err() which is not available in
  1.11.1, replaced with _libssh2_error().
- CVE-2026-66035: upstream uses SSH2_SAFEFREE() (not in 1.11.1),
  replaced with LIBSSH2_FREE() + NULL reset. Also upstream renames
  decrypt() to transport_decrypt(), retained original name.

Changes since v1:
- Added CVE-2026-66032 fix

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

Jaipaul Cheernam (4):
  libssh2: fix CVE-2026-66032
  libssh2: fix CVE-2026-66033
  libssh2: fix CVE-2026-66034
  libssh2: fix CVE-2026-66035

 .../libssh2/libssh2/CVE-2026-66032.patch      | 36 ++++++++++++
 .../libssh2/libssh2/CVE-2026-66033.patch      | 45 +++++++++++++++
 .../libssh2/libssh2/CVE-2026-66034.patch      | 40 +++++++++++++
 .../libssh2/libssh2/CVE-2026-66035.patch      | 56 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  4 ++
 5 files changed, 181 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66032.pat=
ch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66033.pat=
ch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66034.pat=
ch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66035.pat=
ch


