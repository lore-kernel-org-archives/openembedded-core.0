Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D654DC5AD5A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 10:55:03 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5121.1786532095724458653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 03:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=D7ANLFZ3;
 spf=pass (domain: est.tech, ip: 40.107.162.4, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LIacNSfEyJArHXud7kmRv4jFcHS8oJjlh8zMCx1dX2p+09L5o70eVYgXrx7iiZjxGc5ltOCgNJGKcq8kHufsBW5VsmL4KHXKajOkATR/Il2UdDBefAjBwclEZ6v2PkgqxkjaHVF5pKCVQpTREOTEKl6Z8jkSiigmNoMUsKPqOJRMHyY1COZ2OckLauUAnAAIRnB9kfvjnleRm0Urm6iuPsWjJDeoJ8sOPiEW84JefP5yAD88Ljs8UZvcaGWDEr1zA0mfgbj/esG0YnTedi9CtTDiK7Tw8ExUgn2XVYBynL3DgyduVO3DmdDMoEXh3Q7Tm5wPXgYl1V4oeeXgJCvoOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HymGnXmyRUKKzpKD3xaCwFQrCzfTRNVo4ku0G7R4xro=;
 b=lEaFZ4wUvq/Gy8nxOjO4+OjWZd1KO1e52OcWBw+w1pXJVMHfwFVqqYBvjgrlue6a6LW3RQyCkiBaV257pDn+JRuumA/yFZDpMS12MndqgacAOZXvZ0MUb6L7Do8ALmy7SZhK7fIuvag3Ke3nZFrvShxSe/2JqglA695TjG0beTyvrVy0xLMem9kHrQQizC9hsFKWK877e0ats7399BAO2RgOxyWEXONIPEtYtQLDUoiDBU0NLu5rx3y36ybvmPKt8ER+U9XhCfwIvSOb/ANNA1gyg6fkmb+lNlZQNRb4qH2JJo6NWUy7ZAuFQmW8X0K+OcECX5Klaj/dJID7z01sEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HymGnXmyRUKKzpKD3xaCwFQrCzfTRNVo4ku0G7R4xro=;
 b=D7ANLFZ3FF8Z/C7vtKmdM/NkhJ6MnwgImSEnY9pGqTUPI5v46gb7LP1kw6cKqdrRUG3sM6vc2XLsaAht8CWCGgAxilA3xGUxuwZK95fNIcfNApJXLRb6DAL2qmqXCHcDs3VAqfEQBwBBSCoE1SP1atWfDgqnoCVdNdR+dnUkqNSg+xBTsmVrzaZX/6E7QUcuLvGcNF1QqtzBLsUtGuH8GCj3yMreINzV4IaJMvi82/oE/2OAwA+lbKb6xrUr5tX7+3wXemPXfK7F2/DpklAgmBFrHOjYRhNtw3GoSvuHaLHDeM2um261jKSCbvkIEzF7vVCxgetwvjWAfC3foq2SxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV4P189MB3581.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 10:54:49 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 10:54:49 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH v2 0/4] binutils: fix CVE-2025-1147, CVE-2025-8224, CVE-2026-15003, CVE-2026-18220
Date: Wed, 12 Aug 2026 12:54:41 +0200
Message-ID: <20260812105445.24234-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260812072822.22227-1-jaipaul.cheernam@est.tech>
References: <20260812072822.22227-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0145.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::6) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV4P189MB3581:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6d918f-d660-424f-00f9-08def860213d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	gzqhLeufr2Ub0QWg90i2fLAGcsyzO73vE/YexnVqFiAW7j7DNx2n/lZNG4csiQVGKzYY4ZkrrgF/o1nmxhYZp2YTdz0g7EUUHsY97f09BafffAsdTkzo3ReI0DlWjhq3yWKZy4XMzBG7PEvD83ye8i8YUhLkkZcoMVFCttCD1KdqManj2UY8sfhuJ01lddcpeX+4wZYl8U7B2NlxKVsphkewjHnhFdoDropW9bGGPiZWj57Q2Ko3x7YZTPIAm+HMr/zos3862X6TcVIRA+pXvjEdsC1IzJPpQFfDlsGK+gt0KZq/yPP9yFvCWozc+hw/9C+xmFZhfFdL45X5hYCGOnKBc4yZ8+XyN6sbdSGH5kezbLfiZtNMjM8QPeMl7HL5oAltO1BoXa1H1dvvmhKMSIqMicov8xAW218HEEklo+ILZXb5a95fK1ufayeMQkZI/a4FO8harkG5EM/M9nuwS1szqrL2FkQr5KIVb3kZ72bgp0/7xBALzfVhDJiEYTLBTFLsVGVfLVt3k3NwVltMEEgd6o1WliPLOfsPcuaHCe1aUJifDfZBqsa3AmSry3Y1MNxyORgrGqETU9BB2GbK6cNXT1C3hZdV4q0BrvFSEdZm/aIyCJ578sPGWzW/vjPr45kuCJgdbwD+1d3DVnEzgGcK4Ehe0ffS/ak2wLxwBYk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zHdEISSzUlIL/a+5s3KV8EFag+mfrYsfoHe3VMYgYAY+4hd8H4h9F+KDka0Z?=
 =?us-ascii?Q?d4FeBrGAoKWrkPNsnNQm9zh0Yx0ySRaglzhp3QPwNcJ0WeftqIyInyu048xs?=
 =?us-ascii?Q?c8Duf9gHGtpTniX4bd0SEmVIZ85OSquhSeupDMgzqTJpSDIyTYqn3/8d4+co?=
 =?us-ascii?Q?FuLBYtJIYRO3CJXd6zm2An7OMxYaIyj9tG8EUeEbNtMHqNgNAFzOKulhnZJR?=
 =?us-ascii?Q?LuaopsDCfDCs+kmz3KNktkk3+2rSMhXjQISthyRVpF9sYh+icuxtS0Pw7A2z?=
 =?us-ascii?Q?87x5pUGsI1yZpO3aMs6QQXrl5IEfaSz5U9gsIsASzS5jl2L8LSBYcxWc8RTe?=
 =?us-ascii?Q?9d3gMDbAyZKHtgHLCds62NBX1tJ34GPmfT0YEBk4tO61HEddnbNjqIEpog0v?=
 =?us-ascii?Q?NA4LcxWpwFCWzy6OqjoaK+BJOCjD4DeG8jqosEXuDdAlAi2u/xom0QY/MRFM?=
 =?us-ascii?Q?20g2WodLVLcpWARBkqDzcDWNF/s6pD/TODPmnlKuLOtP454K7nm3trYAQsht?=
 =?us-ascii?Q?9hCiOwnIBwHqpDmPJksPvpCYjv2vKYQv5ddAl1tnTJXjui9094/xOGr4d5Ml?=
 =?us-ascii?Q?JAoo/OkLNYQzwQrO9UynpMkci2vdiHe4TQPspJh0OFpTsXy7Ri7JAYfDAis4?=
 =?us-ascii?Q?pwG+x7/o6QHituFl70+0xwc8Ohfz4GRBUtRZDW2AQLME+T+Jt6hs+xldXjw7?=
 =?us-ascii?Q?9PgMes2x+hzkHEHd6JeasU+QzFy9CeIw+NjwS4UWe5c758wREMsVMKiSktD7?=
 =?us-ascii?Q?PZ55dO48JA9g5sT0XMpG7Hn05ob8qnIlOT+2xXFUCuXJsTfYp3kWt6mYdwm6?=
 =?us-ascii?Q?0UomIGmqgkEpWorStz8/1oru3kqvXSS+/9u4YiM4IIgDdWZ1y0T96QnrVXD4?=
 =?us-ascii?Q?Pl2Yqb6eSl/SRhEHzPC0MqP3K2t0beHv6F4lOo8rR9AT/KuFHqpvnRnp58Yr?=
 =?us-ascii?Q?LGX+TdRxbaDhZTCpbxOWZgw62J2RbCXyMqeF0rOZwFi4o7uu6hfCZ2cNB4Wh?=
 =?us-ascii?Q?or3UlA0jAfe/xFHkBi4VuRUavFVT0ecSUnyjXYbbg8gBWCuYw9R3ZJK8Mjnd?=
 =?us-ascii?Q?YwOixSfwqeIWHK/RhKU0nA797JK9m39sU4tj17oVH4r8DJ9wor/ahftv0gLS?=
 =?us-ascii?Q?mubkeJd3TECxNfwYEf9623oLqlNvk4sjY0HCwfg4LQpCU6oUeI0RLgfcr5zz?=
 =?us-ascii?Q?E9xj2+XmYJHDCUwsBQsb5Sc6oQBGjSAAtyujz3Zw3ZTX+pUu4BZlYBE/6Vvm?=
 =?us-ascii?Q?uizoRMyb9MTKYqKnJ11BUQlu6WR52jIIdKhRgM6zC4fTagLGu/Y4R5Ucj3ni?=
 =?us-ascii?Q?ZQT7v9JLDBD3dPGbLtOB1su1D1HZVf8+eHdr2i36h/wsn4/BI4VS+xH9bvNN?=
 =?us-ascii?Q?/pn8ka4yr7tnkJRmGjBn6uhNE1jFKs5MIh/bRmZfFb74fhJrWE0RS2MhabhB?=
 =?us-ascii?Q?nuPnU1UlMJgYc9iABdiuxM8hhB9lqH9iQ7DvVS+ef3CpzkLl1eBErukDnepP?=
 =?us-ascii?Q?n1+bgE98k4SLsyN7WgTFtVzikAmv2YFIkvnwN9UjnelGqDvYPGZr7HaapBZv?=
 =?us-ascii?Q?S8K/LVExLoC3g5a9d2onXFT60X/kKH5+bHfcK9hruUeLCO1PKhb2I4AYdRtl?=
 =?us-ascii?Q?LmT8sixxsCLKBm4WllRkwC2Uc1BiHXv68NckdFXSbWe/eUARx/vCbgu6LqYw?=
 =?us-ascii?Q?eEVGANIMj/BYHU5ksXtRz8TJPS/njmbK27zRjIEkdebJybiP80BeOGXBQx2j?=
 =?us-ascii?Q?6ShktXzM1gnGPmtEDNW5p8jDvp3bMJw=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6d918f-d660-424f-00f9-08def860213d
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 10:54:49.2944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cKnr5wJWHZJ5zUtiJCnbJgfaLrpmDHeb1nv6bMMckhV/CirlBb4Z2WWTicIosE04uRN/Fyqj7UmyBXIkSmGIHwj476ZblccuRyCmn70n6KQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 10:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243271

Backport four upstream fixes for binutils 2.42:

- CVE-2025-1147: nm segfault with --ifunc-chars=3D-- (PR 32556)
- CVE-2025-8224: abort in _bfd_doprnt due to shstrtabsize overflow (PR 3210=
9)
- CVE-2026-15003: buffer overflow in xcoff_link_add_symbols (PR 34053)
- CVE-2026-18220: buffer overflow in elf32_dlx_relocate26

CVE-2025-8224 is adapted for 2.42 (uses _bfd_alloc_and_read instead of
_bfd_mmap_readonly_persistent). All other patches apply cleanly.

Changes v1 -> v2:
- Fixed Upstream-Status placement to be in commit message (before scissors =
line)

Test results:
  binutils-cross-testsuite 2.42 (x86_64-oe-linux):

  Before:
  binutils: 302 passed, 2 unexpected failures, 1 untested, 7 unsupported
  gas:      1871 passed, 4 unexpected failures, 2 unsupported
  ld:       1728 passed, 5 unexpected failures, 7 expected failures, 1 unre=
solved, 20 untested, 99 unsupported

  After:
  binutils: 304 passed, 2 unexpected failures, 1 untested, 7 unsupported
  gas:      1871 passed, 4 unexpected failures, 2 unsupported
  ld:       1728 passed, 5 unexpected failures, 7 expected failures, 1 unre=
solved, 20 untested, 99 unsupported

No regressions. +2 new passes from nm --ifunc-chars=3D-- tests (CVE-2025-11=
47).

Jaipaul Cheernam (4):
  binutils: fix CVE-2025-1147
  binutils: fix CVE-2025-8224
  binutils: fix CVE-2026-15003
  binutils: fix CVE-2026-18220

 .../binutils/binutils-2.42.inc                |   4 +
 .../binutils/binutils/CVE-2025-1147.patch     | 110 +++++
 .../binutils/binutils/CVE-2025-8224.patch     |  54 +++
 .../binutils/binutils/CVE-2026-15003.patch    | 400 ++++++++++++++++++
 .../binutils/binutils/CVE-2026-18220.patch    |  65 +++
 5 files changed, 633 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1147.p=
atch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-8224.p=
atch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-15003.=
patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-18220.=
patch


