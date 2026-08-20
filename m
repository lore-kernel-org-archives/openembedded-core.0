Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C859BC5DF89
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 18:10:39 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.165.1787249429774855731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 11:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KYNym8ab;
 spf=pass (domain: est.tech, ip: 40.107.159.25, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HaSP19dgDidRaj7uo7gCr5TnWTD5xRDDQnYmNHFfhhpbjD7FNVsojkcmHROQfs2tLQhR/mZbhRSESbHsBLjK7S6en1Hp43wpWDr4HZ/yUbg9vaDRLUg81xvyEVgQRC6Z/rp71iJWSO19UgUrYGRHPn68l0jfo84Ut6GKKDhrlhEulak8ci03KYNkUToXwvi6bRG2r5wpIZLSowBPmtrsFGz9Z1YuZNfKcnQb5afZMDfx/S0kcv3fddFqCKCiiRUDUA+huJwTs/+hHatDiHG+CkaFzc8XfFB4P6DDwHWMOOnZqS2VRnUFVjp1pIgKPUQKXHsKwrliYTdlUmAu6aV6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKBctZfHbQfJKBp5GBt3boZbJQoGI/0KWnMUzvFnPnU=;
 b=clXoixmIDyC6vHd/9MVl50ubFvAO9kL+s/aFsu/BSkSto4YLUopqHIbE0l/NxHFdvEb/tC6bv7y/wxuoU+ied53xkDhph8o0jcS5v2HZZ5xeBvJWQ4UG7k2NDHCEUJAWuktjgUJ6nEje7tSY10+8V74p0qWY4lsDbi8qfsanaFVU3eGhDwm0CITjEvXGE0LXtvNXQsymevOaMOcn9lZBfhCVDMU4beYR6x/JGCm+T+P/UyUSIzVFnVsptmUbDr21CXejQV5AcCJ0k8UlzgUyjCo/GKu3c3dxsl+ibfJV5k819j4lua2xQAWD+a3UIU8FNvWfCpgs5nRv8PwkClMr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKBctZfHbQfJKBp5GBt3boZbJQoGI/0KWnMUzvFnPnU=;
 b=KYNym8ab4+MsZBty9rpPxY2D8wl+qyXbWCIBpjv1aw+9otmKdQC0vh55SbBf/RfxKtwjvD3oJosIzjpBLdFcIPdAFkWuuuRWwvzk6h6apCK9xZviZkfMZH1hxLujro62IRPtCCo4VPCsjPh3eWBH/3ppsFOif5rFZnvC+Yj4psmVsAm11iqT8VUCSB2YX7szQOifALhdvTzEDRuPi4yHIIl5ITcPnxL68WJQEduQ9g5wnEPLXil3Wyvxj/GHpVqyBk9Un2JFDv1T6uGc0VRKO/n2SzICsy0H6sfxTcIUxudW1aPUMh6LDsn9lTRjgA0Wc7m4koIXICeP/OvvTYuSwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:263::18)
 by PA1P189MB2702.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:452::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 18:10:25 +0000
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96]) by GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96%4]) with mapi id 15.21.0360.003; Thu, 20 Aug 2026
 18:10:24 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [RFC v2 0/6] openssl: upgrade to 4.0.1 and fix dependent recipes
Date: Thu, 20 Aug 2026 20:10:16 +0200
Message-ID: <20260820181022.44434-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0287.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::29) To GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:263::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1P189MB2954:EE_|PA1P189MB2702:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aa225b8-9abd-4ab1-3cc3-08defee64e75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|23010399003|1800799024|376014|10067099003|56012099006|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	fD8tWOswGmNiVS6E7GQNru5kXBVpAPsSR+VxhnmITzkksH8Hbi4U4sncXs2nTvo4/wWsWZK90H75oGpbHCv4CC9W2tBmP0DFi9vlkuKmzhD7TzjauyXLVlMzzYRwtWjktA151609OZD4LFp70SfF20yZKy8IxkcgdYGVzjNiju/poqFTAPmhuQRCcrPF3ZTt/8ooEW9zzqQxbIWhNGJWavaFdjNKPhWSeorEyRh4VvQsKYHpE8bzVjSq+4bQWX0LiBAJRX4+mx9nbJxcXRqh7TXl725BQ06Aaduy852DR5+4ELunNLrdQZNM9HLkw8viK0IiLR+xTo0i+6cHCgr5T6iVQknRot9ExIbVQTpVbgzB9P9k5iS7QIYVjgKEyDscuf92rZ2/1p+oM6mJQyp4hBxJY3nD9LG9fZyQs7FViu5mmf2wZrKiq9OktToTrlRhJqrK9Ir8wzqeFftTu6vHw96778k1MYP3F5HC8nDOX3Par/SUm2FlsSEdyCwon/VAuOaeIiB9RMblTCQKByHqskrQG0H2gdYdDYaBEUutKGcgBEam6CsU1pt2wTnQaZEW/nGvJioGaLsThWONyICM6RPc7tHm1l6xot2M5gRvPG164Au+UdS3qTxQV+cL/GUGO5QvfoLcymP7Ny02jlxdNhtmFOSrS91VfhSfjxm834Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1P189MB2954.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bvR4yV9EaQomjbS4HwLPXiE3KvRUtTxpwZaJQZjwlS4HVRNjrieaeuQYQ6pQ?=
 =?us-ascii?Q?3Rbui/WE8x7/wITGiSO0aNoBrofH2dHKgrQ8FyTopjK7MlPCbtEx1nemTd/h?=
 =?us-ascii?Q?vynMVl4ySj2n3l8+MUrvi93cPuHNSgzY3ixdr83eDW5AVuBIDyJiUJvCOlZ2?=
 =?us-ascii?Q?CEfT5uz9aHb5kjtB86vQiPjz0iXtC6ntva91CmrQLhW0htcWc02Yn03zR+n8?=
 =?us-ascii?Q?EFHzexcREViM3zdLKXiAa+6NKh6zBzw9v5CaV5oU70gawbYADGVTSuE023bT?=
 =?us-ascii?Q?GYizIQe/JTWliwnOrhg12P93rybnfcBGt383vON5m8TtjsY7uCZ2Ppka5Ky+?=
 =?us-ascii?Q?jrva8mxbvVrr5w4c8rai2wqPP9WwSMWRXg44Ho2KisyOr8Ce9IltnZvqPPyI?=
 =?us-ascii?Q?5+YOHmdo4DUziQaA4z256LO8u0Y/3wCFI5AMu3lonLTj7EFEH6k1Mtd9qfgb?=
 =?us-ascii?Q?F5K2gArkL0ozSn5Eo1JFWLksHDX8fwO4dCKyyLM+yqeom2TJCFRi2coU6ACY?=
 =?us-ascii?Q?MUdeOjdvsLhx4c3DoBQwYVud4i93F5TplAdnCkD70tZt6U31izMwmnYZPqUJ?=
 =?us-ascii?Q?uuXuWSxrxV9Dbpi0nqF1oZji9gHlFZHZKDLYt9AfVIPNOb1Rj8GBEy7NAfQ8?=
 =?us-ascii?Q?f+QctgcIGFBJ108CJFEo7U2IQkLZfZACAYiBwan/uyhy0uXfc75uk9Dyqz9T?=
 =?us-ascii?Q?cjzlqnSYuUyc8HAZiOeC4iBiostqo8Cpfmai/R2olnVitCa5qicFVHfd6nE8?=
 =?us-ascii?Q?2RuDIPzDgkmYZJnjLfNAgqo3wdpAeLP+nJe8Z8M8JlMlwPEFiugERXI/3Rgi?=
 =?us-ascii?Q?cIJQ+cWN4slk1UY8IygwNiSPORLYb/r5qaUg8vkM1e344uJE4MSNqcXF50O3?=
 =?us-ascii?Q?wM8YwlEcpJYJVI61f3qSzGQyxPxxsxjv32iAkikdwDaIyhHfbfqcVsuMwwRH?=
 =?us-ascii?Q?Y3MXLNOgxLveY1U2UR92bT9ZQUrsh0A/aXEsB+GL9QMTfbx/z9pIKpQTlyqL?=
 =?us-ascii?Q?C4CjZnkpmN4V3E+xZ5o3FqooV9aKf22cgQY9t7uqDoUDUldi/GTAeV33jV9B?=
 =?us-ascii?Q?RW/ieSOOySEouX3Nut0KZwdb1mLtUAbkHJOSLioXIZrwEXbMrak7UlyklLVf?=
 =?us-ascii?Q?eZ/zfaF9HfQOIAM48o16ouTpSD4562N/bypnVboZBJx3fwvS+blQ5UxkqX1v?=
 =?us-ascii?Q?k6Ghx7Lz1KFp4YDsTPKg2ihWQLn8uXirdzzwx/5NcOH8OXeOqacaO4lCLwI2?=
 =?us-ascii?Q?txcfYn3bnN4A3rFAQD7CUlIfVoUyRKvQF7UolkIoCbs63m/vOxX5Uv0iEMa3?=
 =?us-ascii?Q?cT7hyOzxDSSvI0b5IzN54mGnIKzpkvIvPoqi0dyB+Ugw+zp7bGkiceZ6mIaF?=
 =?us-ascii?Q?XG20657hJosRwHcAjU5kis8a+9RNW2NQzTV6uIqEPr0Lw0bdkDblSL4vmBpY?=
 =?us-ascii?Q?psl0uMnHaDr3B9/pMPZxOyBfBC3TmyM72zXGRE/3C1zBRBPKtxCRS8n+mVbA?=
 =?us-ascii?Q?iHlpl4WE820w7qKI/7Rcw3Vm8+VmRc7RP87QbzLeEQp43BbQwOvi+6rjbnXv?=
 =?us-ascii?Q?VMZaAleyZykyjHS5rKhXYwfOwsH0aVfrrGnBQCQRM6isHXx14dD3fxSo4VYt?=
 =?us-ascii?Q?eDo+ZjGAary8QEEpHmALvqsvzFVPX2m5j7mssNAWCJotqtwArUH/wpdYNT3g?=
 =?us-ascii?Q?21mJiNZO/R4MEKgjeDDFonKVYiJOoQ4GhxUhrlyPWgXR5Yn0x0CQ6nhc586K?=
 =?us-ascii?Q?iEBAso2QVq7N/H5tJj55zccC+wgDVgsdaGhzHfpEvh0faJilo+XjqDGE8xeR?=
X-MS-Exchange-AntiSpam-MessageData-1: xY/EHgEHGkFyDdnNfOJtpTkzvIM3NDiWxYY=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa225b8-9abd-4ab1-3cc3-08defee64e75
X-MS-Exchange-CrossTenant-AuthSource: GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 18:10:24.7015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVA5CyGGtX+ifFTjfJcKJTIv3UDAWsy88O1rCLqwAQaX9qdVSbs3aKJVXLFaqPQWua6rmmdKhQOZMKWa9NgUwPuD6kYsW172gK0FnJRp0UI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB2702
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 18:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243874

This series upgrades OpenSSL from 3.5.7 to 4.0.1 and fixes all
dependent recipes that break due to API changes in OpenSSL 4.0.

Changes since v1:
- u-boot: moved patch from u-boot-tools_2026.07.bb to u-boot-common.inc
  so it applies to both u-boot and u-boot-tools (fixes riscv64 build
  failure reported from autobuilder)
- u-boot, kea: corrected Upstream-Status from Backport to Submitted
  (neither has been merged upstream yet)
- Dropped rust 1.97.1 from this series (now merged in master)
- No external dependencies =E2=80=94 wpa-supplicant 2.12 and rust 1.97.1
  are both merged in master now

OpenSSL 4.0 is a major release with several breaking changes:
- ENGINE API fully removed
- SSLv3 support removed
- Per-version TLS method functions (SSLv3_method etc.) removed
- ASN1_STRING made opaque
- const qualifiers added to X509 getter functions

Patches:
  1/6 openssl: upgrade 3.5.7 -> 4.0.1
  2/6 python3: backport OpenSSL 4.0 support (CPython commit 3364e7e62fa2)
  3/6 socat: fix ASN1_STRING opaque struct access
  4/6 serf: fix ASN1_STRING opaque struct access
  5/6 u-boot: backport Provider API (replaces removed ENGINE API)
  6/6 kea: add const qualifiers to X509 pointers

Testing:
- bitbake world -k: passes on qemux86-64, qemuarm64, qemuarm, qemuriscv64
- openssl ptest on qemux86-64: 362 files, 4310 tests, all passed
  (338 passed, 24 skipped - fips/lms/rc5/tfo/compression - all expected)

Sharing this to get feedback and see if there are other recipes that
break with OpenSSL 4.0 that we may have missed.

Notes on upstream status:
- python3: fix on CPython main, backport PR #146403 closed without merge
- socat: submitted to socat@dest-unreach.org
- serf: fix in trunk (r1935023), no release yet
- u-boot: PR #918 open since March 2026, under review
- kea: tracked as issue #4673, milestone kea3.3.2

Jaipaul Cheernam (6):
  openssl: upgrade 3.5.7 -> 4.0.1
  python3: backport OpenSSL 4.0 support from upstream
  socat: fix build with OpenSSL 4.0
  serf: fix build with OpenSSL 4.0
  u-boot: fix build with OpenSSL 4.0
  kea: fix build with OpenSSL 4.0

 ...Add-support-for-OpenSSL-Provider-API.patch | 300 ++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   1 +
 ...-qualifiers-to-OpenSSL-X509-pointers.patch |  49 +++
 meta/recipes-connectivity/kea/kea_3.2.0.bb    |   1 +
 ...ke-history-reporting-when-test-fails.patch | 366 ------------------
 ...1-Configure-do-not-tweak-mips-cflags.patch |   6 +-
 ...sysroot-and-debug-prefix-map-from-co.patch |  11 +-
 .../0001-extend-check_cwm-test-timeout.patch  |   4 +-
 .../{openssl_3.5.7.bb =3D> openssl_4.0.1.bb}    |  23 +-
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch |  31 ++
 .../socat/socat_1.8.1.3.bb                    |   1 +
 ...146207-Add-support-for-OpenSSL-4.0.0.patch | 257 ++++++++++++
 .../recipes-devtools/python/python3_3.14.7.bb |   1 +
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch |  35 ++
 meta/recipes-support/serf/serf_1.3.10.bb      |   1 +
 15 files changed, 693 insertions(+), 394 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-Add-support-for-Open=
SSL-Provider-API.patch
 create mode 100644 meta/recipes-connectivity/kea/files/0001-Add-const-qual=
ifiers-to-OpenSSL-X509-pointers.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Added-ha=
ndshake-history-reporting-when-test-fails.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.5.7.bb =3D> openssl_4.=
0.1.bb} (88%)
 create mode 100644 meta/recipes-connectivity/socat/files/0001-Fix-build-wi=
th-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-146207-Add=
-support-for-OpenSSL-4.0.0.patch
 create mode 100644 meta/recipes-support/serf/serf/0001-Fix-build-with-Open=
SSL-4.0-use-ASN1_STRING-accessors.patch


