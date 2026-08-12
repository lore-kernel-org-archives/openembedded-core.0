Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDECC5B567
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 07:28:33 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2585.1786519710665362221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 00:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=AyORsCaJ;
 spf=pass (domain: est.tech, ip: 52.101.69.41, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OoLBrwu5zvSLWLWsWR/n0H6oOibz4JtZ7WbqhGm4kvbPzBd+cr9rUBYZwEAcqa6G3CT246XbRhF3u38GbZ4iNbSPniSOEOqXByt4+yO7TNmX7BZ07VmvH2RI7A/Mji42EGuSC6CEdwRun3FP6jNjrjJBNP1ROm8Y8jOkdKJT4HTLw3kt0FJ3nE3raLdUQMSvF0dnSUyyH7YSi0qH3kZuwiEjchgPeds51CqaybkZs6dx9Tn7/8Z3PnOb3meNw9CGE2YTlcaIm2qGF2zN854KwOaJBfbLWo606WwfoigUxHPqIltCEB0w46X+4OJwXzC8sGK9+NIxcD4LCYOsL5Q2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8e+EXfrBCZI6egPcDgCPn8SoQclxsO85YXE20x6B2lo=;
 b=vdElnJKFHH3WiihdHPzNWO+5YuYuPeLp4DfpQUAxSWyr9CBmW24sbsnb9heTzsix1c/3XCqPV3l+1V4GF0cH/5W8bQw6QbyyPDfGeOOJVHcQtuG5Tmps5HrWvmb+hQCxtXdsD5prAiJL3kkJc3ckMR9p47ME83HITosJ7Br/i6USBHwT+v1/3wu6NXKRTPcVb3+88e2q/umNN4b+HwA19AoSWGzg51Oh0qiZE9gZST8/jco3oMINGxH3yBbfgc7zs90Xr0N9IIt8BSH787emNV0Qa2Ekl4BHAMwBFEuwguT0hnal9c+vPcpTVSA8p+4+5bcv1eSITFdB9a0VLr7e6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8e+EXfrBCZI6egPcDgCPn8SoQclxsO85YXE20x6B2lo=;
 b=AyORsCaJT8NSpC/j4Emt0wwSKyzRxm2K/L69+eMScuceDQAGlIdR7doKYbkeblFBCCbEOipntoizoVMiF7/Be6lH4eXbsYy/SOVmtZR2XPDV1Gvo6dKcWv0iP2Wobn3jedioHwcC69FLUP6jnzl1Ofb1sKMBhpuJ0SP6SskBfjCsqBLQKGkPAJ7WHO/yG1U3RKhwvz0PDtXNdlZia+//TuiiCKUsK9M5XKa5oZIbHKY31Z7Nkr5mkf4bOp/y0rNZKrlQ3361rTsdwm8ygYgIL3wxp38gInP+h/lLOTJ9gphJ0jQpa8iEOdeWV06c1lJzusRfwF9kdx8SXxhhFXSMrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by BESP189MB3212.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Wed, 12 Aug
 2026 07:28:26 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:28:25 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH 0/4] binutils: fix CVE-2025-1147, CVE-2025-8224, CVE-2026-15003, CVE-2026-18220
Date: Wed, 12 Aug 2026 09:28:18 +0200
Message-ID: <20260812072822.22227-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0266.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::31) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|BESP189MB3212:EE_
X-MS-Office365-Filtering-Correlation-Id: 74836e88-d573-4cc9-aa5b-08def8434c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	+VirvDJJkmA56Y2Tb9GuC6nOYEl85YdMWJpd3n+7STnQXqtNY6fGcUi1XKHEn+YIjG5SWSAcmjsu5gLOQJsfehHyYAm4o/n1qZyL745uJufdgG/DTMB2TDBVgz77NAWcW5hs4+Mg7jQslV2OyXqzbM7rr8R414mAi7ZOpbu376AIi0fjTOuaL/liXzKHUEoXEy3tkYEI3mwSzik0sg5ap44JNRqSGs/onf3iR0Hk1dtn3pmBg8h1MTvj3KDyuyaLJPd5ChOUjcFYbHocMtBJzcsAEJ1QswAJKo8M2tbYPakGkdjOD2PDPRJZ5N42nTwDGIuCyIPmf9Yl7FMdGc0IainVTktZ0GzElx+L7qUwcGUOzHqiA3IIMYHkHqkO6qU9vBgVrNSp1cWgCqadYjANZiCCCmarvnFHcaiIZPOf/qT5uH3xsEnlGj+dyJQUeomqxRYyzE3/Ra23ufE7IT+LBehI3C1TmDqrisnVdbZjolMRN1Y4nTvV169ZStzQE7znxUVEzwOR5qTjfe4VlJBZeoIa20ZItHn036ixPRBfbbWStrT3iDcBsgv67O8ToaB36pqiRd4+tF9c4eoXE8lPMWLZV29HdxlnlBSL8JF1ZxK/5rBqTaKrcD3QJ5LM1JplrDRW9gsdCvKQcZhGG70IQ1vbixZkAaB0iQ/V22aaE1k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+0iU03z0Q93VZ5N8CZHoNOQsVv8TJodW4yDMTx3oUHxfikphHDiEgL64dNtF?=
 =?us-ascii?Q?tuviyTrsErD0EE/a4eqqtoiSY4+hUU4JTaU1+/n8h5FWxyEJRuV/StzlFIRQ?=
 =?us-ascii?Q?Yjho+l0y4jI+G0Arsmd8ZjpgGFOiLf1NzU5m0H3ndUt0rpGinQqKYE7Y+Tl0?=
 =?us-ascii?Q?K2ZM1vWsgNDpg6Ov9iq/Ola/t6UiNHrdazPldM8i5PY3Yk1lcJWNoqIsrPwd?=
 =?us-ascii?Q?Re3n+gvhZbRaK5NtMEjPd2U47li2lZ6EXR1Qzte26mgcf4X/xBHW4v6Gz2XT?=
 =?us-ascii?Q?xniVeKZHQyG9qpbJshrKD3s/W1jSiHD+vCZzsll/cPyw3Hm2Jx8CugL+FRQC?=
 =?us-ascii?Q?yXrAgHwA55YQaIFpvt8m4ASERsCUsbF68sX3+cXcMbDu6Cxdp15//JLPCWcu?=
 =?us-ascii?Q?e87kLNz6i+hemPzVVsxUIQBag/Rtt7664jhnyKicFCfsg2AdmvR4+cyTvpCy?=
 =?us-ascii?Q?4IVhqz05EjRnwVJ/UxW2QKE3qcf2dsFgkR8gynv2QszataO2bTbwrzbB3ldo?=
 =?us-ascii?Q?59veQJWZj9rKosB61vrXnN2VhcIpUcFSYtHInYUTQS05UQJ2kVJpZoD+KFUy?=
 =?us-ascii?Q?mBcb5dLG31+eytWTsCcKUNUNFkrb7GzFQVbfOkc2GijoHryStPttLB2MLkzq?=
 =?us-ascii?Q?2DIAIu6O141p5roZy/Wl+ZIrpLNrbmcO3AjFrBGPF3XIuaF/m7BCcYcFDLim?=
 =?us-ascii?Q?HHGwNff1WkhTKeyQEZC3HzuzZp+Ycn5++tdMP1LucEocLs8gvjCrymlYo1b4?=
 =?us-ascii?Q?bnc8rbHJ7i4FlGvTR8+Xw1NKMc+Edhjs3iRWMCDE3qgfaGb+yVnaxpeN46KK?=
 =?us-ascii?Q?Dg2GXSnnF2tJcjuj2Ll9V361JlIJOWTtv8L6kMcAxzy81HtVnKMqo0jXOIlK?=
 =?us-ascii?Q?YpGIEWpi6ABPfts+eMmF7jun7YMeyFtzt4DsgSujfFAPq0fCYlzGNNzdCWkb?=
 =?us-ascii?Q?JQC02sUbQaY5NnuuzjQrd6eYeBWCuibJNtZhREAli2YkWa91dTGwBqnh59tQ?=
 =?us-ascii?Q?hMtPaJYdw8boADYiGnyQ7jPzDhHIkDkgjsQj/nCgDP+/NKmV61ZmrpB2RhoC?=
 =?us-ascii?Q?Ld5Upu6YtZEk7H0C9HCH2zn6EXFUooHq4b8EM/jecOn4W4aQNCdINoF5dDkX?=
 =?us-ascii?Q?6+QZ+1fbcy1xfBhdPQ7ncPLXnPrGm0pBLBOY1K5gbLZ62oCb7xJ89dYwDy/5?=
 =?us-ascii?Q?o7Uu5WUBGXp5elIA0n6LDHsNwJAKZQdsK+YpqGaPX/xPuaqEojAxf+U7mlPI?=
 =?us-ascii?Q?F5pT8OakMV+hyMIe3zYFCSTIFzLXYJ9UzUShEb++ELYisKp+Cy+exvx41JMM?=
 =?us-ascii?Q?Ef2l3WD+/f/aNBuqUA3Z+ZG+4o/AsKfh7YjJ6GeD3D9rKXpH7FekyAdBIaVe?=
 =?us-ascii?Q?DBmXxMC9f3bFlu7adyOylGk8D/L8s+BZ9bC1sksT6CAixzxjOrlSq+UEuyGw?=
 =?us-ascii?Q?U7GGORYFqMQM0up7jKiBs35OsaLH1jsG1XMXRZM6yDB7j2lIPnoS10HR7uTz?=
 =?us-ascii?Q?3neB6RkWEGLa5cQ6krfAsmYkBojffLWoCV/EBIEG97k3h+JEVVoOALBfpzS6?=
 =?us-ascii?Q?ENBSu6dKj1I9WI/v9kdiQew3TRO8dIjzt/erHK6NTmOzbZ9FzsOTd5VG3D6w?=
 =?us-ascii?Q?VzrBGLUhGWTKkxEGitIZpr7TGOLbFuqLvRSkfvTOu5s6eOcz4jozMaMgT+VV?=
 =?us-ascii?Q?2wOJOpHRnz5ngoVgx6JrAydT433nJuUwmxgHXbpkKIbVmzdiyXAVjvKsLEJJ?=
 =?us-ascii?Q?EX0mw8v4yztiD5g7QdAwT25vKx4wLHs=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 74836e88-d573-4cc9-aa5b-08def8434c16
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:28:25.8137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMBFWt4BEbCB+4dcPNySZNkvtFEmb9W5O+h0DKitNzrf7nkRpFSSpxp1QgXP8KkXVnALibn0hYWH2Y5Dmk2SrxXi3lDHUMJknmUBvH8VKvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 07:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243247

Backport four upstream fixes for binutils 2.42:

- CVE-2025-1147: nm segfault with --ifunc-chars=3D-- (PR 32556)
- CVE-2025-8224: abort in _bfd_doprnt due to shstrtabsize overflow (PR 3210=
9)
- CVE-2026-15003: buffer overflow in xcoff_link_add_symbols (PR 34053)
- CVE-2026-18220: buffer overflow in elf32_dlx_relocate26

CVE-2025-8224 is adapted for 2.42 (uses _bfd_alloc_and_read instead of
_bfd_mmap_readonly_persistent). All other patches apply cleanly.

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


