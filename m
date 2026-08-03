Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A32CC55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:22:58 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38773.1785745374729649145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Sm8cy1Va;
 spf=pass (domain: est.tech, ip: 52.101.66.49, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMOU9pj6CXb8DoFIgzIKlOet5KEc7A52MLBiZ5XEb0KgJdrno+4BkP3PkOCC2ij9vgADNBhJWk0Tyj0XqDtprpx3ZpiWixRt5Ug9kabXOXrAdeCDOzbf1oArwWmVMU8qoQLtMuMLuT1mA1HN2n5HS94JJNw9hQ74q9xL1+ptL7eJCZlSzr3og/gJBeiqNdl7mhwZ7unbSOvgqcEwaCx+36YbmeE0pbWBFEXuYPLXkmVR0fphXONG8x7G5AEmvrHKkXHzSdEZBnYsWBtgRWYlzs8c9jmzo5c5pzoVcoGhs7xr9piBSK2pcJcq8IE9yJmYjhUXObwJU6wkVlpxEZxPSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksjZ6/XIhmoGd4cQrr44eoFvBwk7M/6nbXjcsL5cD1s=;
 b=OJ4pDAMQ+c+I+HhHVDyZCx9SYRpzjn+H+IQfv4HKbYJNiap69yT8uEAJzYsJU2jGsMcS1dH8NgMsdcx39k7JiRD/UmyhmxQGpuOrUAME7Ift1V0oEeRfxmKXz3y9hH+m79XLs4iQ1lg+PEQfnwvzhfK5OwTznWuNX1zzokmMf1sg+/neLLD8IyD0k8bPUjP308ZbeGQoUbg6qT5hDIuZV/5D0rfSQZatTaCQ/Ovjjl8MQsC4yW/muw5/2dw3+GlYWRvLvKN+p/JNtyXFh3WyISn525tBnIM3l+3pY4hz2duXpDyQZqoMIM3M+lmEujzGrJir6a+ZNpMr3CSG/Pcy/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksjZ6/XIhmoGd4cQrr44eoFvBwk7M/6nbXjcsL5cD1s=;
 b=Sm8cy1Vaw/te/I7hT4UoAGnFTaU3DAozWzFi6Q+qnyk1SDQBEX/nl4IZgwzbgcYsOyv9XTb3HmyKyvXmVrd6TVMwI8HFnesym86TRuGlnZIaCueX6L5fKaL+Eqq//TeUe0d3Ds2cUmwKo5FQop6NG6Tx6fovhEydIdSx+ldpj43txCHfP8zk0k+CoTc/d0OJnFij/FAqZgg+oHrTQ9JuB/0gfatJNIywrFPkQsi1kk99MejUKnZqj7YXdcSNsbeHbkzV6kVs5fs5ObtFbnXCBlHxtBsYT50uTGoU0o47JI75QxZ85N8oFNfBcr6QwZaLJSxy0NfRyt+3PcgCk+ceYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV1P189MB3098.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:25f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 08:22:51 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 08:22:51 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 0/3] libssh2: fix CVE-2026-66033, CVE-2026-66034, CVE-2026-66035
Date: Mon,  3 Aug 2026 10:22:39 +0200
Message-ID: <20260803082242.44009-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P195CA0005.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::24) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV1P189MB3098:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a170a7-3c00-49e7-b836-08def13868ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	R8JJdHldvMTbxB8GG/xBwtXDQXojVSwKhhT1DHor6tjgHfvdrNaFvJ205knTsd0kSlXYPKWlKQEGNhCfjbdp8+b+EGsGgNtWGJOwW/cu1wVNWTZgHNJJlN9uKABFR16YmzAk9rp0hoAXL0gKV3K5G/Bz/xfEXd4WZAYnCEQTYMHWywTRlJjZxe3raQxmmE2fTU+e7PWqoheZTJ3/G0FJ0uMJmoW5xz+VIgfR+riAnaypeqDKMFWrW5V9SSiajUrIX8giRa7Qkz621zn8P7OXN9TEgBKl/8VQxm9qaDEerJj1lhuXlcz0IU1w1Wfnos8g8U7J64ZAIBy/cZGSpTOnlZt0pCizYN/RQNvAS5uYfaTLBWRwGeCKGvb/J04dbD72L/MupIuLbEUMPC2VlM4yDECl57crPxIsLp9elXTyoX5rIenPtfgLD7Ev6HsZzFuFjvTMjq0QzrkUnSXChHlajv9e+3fIUCtTIbBHaCHi05q4jtxN3TlWXkEg2Ym7sLH8DVMVmBlxhJD5kAhO98ylk9eICDMPtZDVIz52WYzAE1UwnRoMTAAqk4sfM+2m7NAwNQV0PITLlnrR/2jaNNilUwF2qn/5hhpbSxbbIqZx7yZgMWxnwEiLmRfkIDesy2bvyQL4ymdc57U5DnGGeq8LrP5LV4sUqwGi8sSxH/gXycQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WR/KZu0rAkoaH5V/a78AOKQCIyZlh3rdQEljXVbxQK9NbQ7h7L5WpxEcLkdl?=
 =?us-ascii?Q?044y/BoPl4Lj/yDOmc9d9Uf8XKWkSff9qRSFNUz+fIY7dOO7ZhyU1DbR/cjm?=
 =?us-ascii?Q?KOkqBBzXFgQyibsDtHDSUQgtjmRgGrrOpxQZRmJb12LLyS+M2fttqwGA16Tl?=
 =?us-ascii?Q?B0u85s2G2wpPjDYrIoIc+STHTrO9X7dqq70QZj+2dlfWF9h8+MfPjMGhsfTW?=
 =?us-ascii?Q?fx5Yz+/vpxU2EckGNH7cROuPgif1jxwOTGLEtqbpgNnhInUGUwyjTpKuAX61?=
 =?us-ascii?Q?pmQY+KmBc0Y1ZooPJcBiRuKzocdLAPEY6ElbgHAgLJiLoRBATU9LbCpAjrHu?=
 =?us-ascii?Q?u0LXgnn/OiCFDy1NAkhc6CxxsF+iRgXnho7I5TBH4592OrVGeHSAybDXJxiE?=
 =?us-ascii?Q?kVDir/RrhdQ2xXw8SAWUm8GV+q4zRoasdbVdW18bpLMfhoMv1Ralc2Eu/GL0?=
 =?us-ascii?Q?CLc7wfFLwTxxpB75b7jlDsVoi656AgKXT+M6eoFq3HuwP6IIaJYSIZ+7kuyQ?=
 =?us-ascii?Q?Qo5A9MD5H8w37PRqb9jQyDIZMHih+uHlaYL9xa8NXzMSPrW+g/4IphU5AhoW?=
 =?us-ascii?Q?Rl3QxnPIXjN+/eYMKLbvnRiTKvKmkPWh5aPDL2mreIOHmP//4EE68rvWenSL?=
 =?us-ascii?Q?UwRytRRmgGmSNREoEewxn6KTWoTaQ7qagLlDv1o/rJR4MjZa2FnsdzN98l0r?=
 =?us-ascii?Q?GnM5r9dmD8G6RwhjAFoCPQpe6IttLvT99wGiWIRQcqX85vnK1BPxvmflC8KR?=
 =?us-ascii?Q?gTI5+w7CbeQA3zwBdHNexRRJem5AFWjGpqJaKa9YMo4ccbbBva9avHCzQQPc?=
 =?us-ascii?Q?K64yeEeFDSi/VG4mENNhSOg8WROhJ71nA4zfTdVek8uSFks56Xt9cq5UO+7p?=
 =?us-ascii?Q?/jPKZ3R9oopvQ7Mx+FVpz9xB8CEsjb45WSgt4TPR482AHyI1bSR37T0mBWwx?=
 =?us-ascii?Q?xH/aqa0aL/NQO/ImIz3M35LpTh1ik9k4tWh2msEmV9/6KMBrZ7F3Nukcv6rv?=
 =?us-ascii?Q?aGkAHNBbhNX6GP52hVHRTYa6V7/9zwuwnqnbFm3mtfMAwTRZ44QM92eBshk+?=
 =?us-ascii?Q?cm8/eMf/NT4v26yZBNGA1fDTSItvypoLmIKe7oXfA+7GkCXGgNfexkC1bwvw?=
 =?us-ascii?Q?srh3gtOCdPS6yIaFb2u8t/Nd8YADaU7QyV0BIG9WO31s/0/YAg3S3SMAFnzm?=
 =?us-ascii?Q?gSAMZ3/dWjJoBThswPILGSfyQ2dElZTsWXPTNUrftX8Qgs548pmZCul+Cqr6?=
 =?us-ascii?Q?iKUCLs+0P7KfmuPqbTIKzNVpg8AFcm0TkWFyMObtPjdAtHF9zv/r/mJM8jkf?=
 =?us-ascii?Q?wm98QEYpWHoEeO6y0W+iaxDu+sXM+nznjm25yZy2zMUwbUt2xHd0quqbIDRR?=
 =?us-ascii?Q?MRpVMKAS47OG28bCaOLYaJB//h9rJIVYMQ1bay/yZtk5pBDkt+U5UW2lYMF8?=
 =?us-ascii?Q?qDmf8jbFtqUS1NCyhioNprzcCeUvpirhCkuWj70f+vcUgM0yJ0ceLljQ2csq?=
 =?us-ascii?Q?NJ0fVUfqc7uCdd8bFkjH1P9+4KaNiVuZK5ie/96DQOB6XAbODjjHLuyy7jU4?=
 =?us-ascii?Q?b9t/FPoMTZtYIf5Q7pM3HOuRsGuCjjEs50A9izk1p+TVyEp9Ai/xZygxd/2T?=
 =?us-ascii?Q?FeHiqjWDlmw9m/dByXH7nByDakJG3sNj+LqgCtxNQ40X0YKK3FOlBzz7a7f+?=
 =?us-ascii?Q?Gnwsor5knFGYbS4wgtATCF6sBEfZK+Zn09DkMfBAUfrxvaZ4Iyjud+Jg2Oi3?=
 =?us-ascii?Q?vgTphwbGBg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a170a7-3c00-49e7-b836-08def13868ab
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 08:22:51.0774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZWKdqzBeUKliQhkKnBucK7TBvkYEHXb5d8IDUsGHjFuSs8X9qkfCK37sqp6f4ZOs5O5qCzQcfYzuL7KLcm8/Ey10pwOzP1Z0Jnjbm5IZDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242617

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


