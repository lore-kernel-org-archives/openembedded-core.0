Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87197C982DE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 10:45:36 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46213.1789987526771082079
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 03:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=IaivPxlo;
 spf=pass (domain: est.tech, ip: 52.101.66.38, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmNFD0QzQPtxIv4aFRP0z6sHK5ecnNdBr6QO2eGuejZpt8QC95gTkXYJIQnLqs5rfNheMzVPPsfTUuxZeiE4rBbAxwI/lQtVeIImyoZu1pDTy8oGwrubdIqtr1FjGjIsIP6xxHUiR29exDw9h8GUXzmuHqWI3eHl+XsQsVISidyklDWkAdD+FcLmi7L8CAVLWi5WBueKc6bqfeSh4Y2vxMwx059gRCkGT2tVDaKBf1Pjp5F5Q5uSvOOU6w5u2Z4TRbv1fVCIQVPb2dqlotqPb/8FlLk/LkAHfs2U+C4+iOqeXmaXmt3P6HQ/wH1De5azZjj8tRML/HaDgXlnrtt4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pz0C0EKsl5tSxUF1L+rcfFSQXgp5lye6RAZAvTaFBE=;
 b=Iwt4lO/9MltLAdj8ccu8TTuIdXk1uFBgCM4K685rGbkKB6BBLbrTJQeHyEZfNu+2hb9hg4ja7dgCZ43Rnp9LYJHzCRyiRzi2YlANoh551syW6zjNPNEnuQjV01fEtUmw3YGl6iOqPpXRKjWzAsVXB3vym0mEV0klhuYXdA3XAFapXD3lOfDEh6ilUTn08Xmr3ycb1NmvTfb51NTKpXBIo82mXtMb7hK5wZDwhOY8/y5la2i75474bEMHbsryBveDqY3ahVZNORscDHgDfUg2Df2rTFg6reg0TM3jhUILhONiYaTH/DnFhYpHBO3sx9QDfL6UapjmeAtcPmAgJ9BwEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pz0C0EKsl5tSxUF1L+rcfFSQXgp5lye6RAZAvTaFBE=;
 b=IaivPxloIT9+2m3Snbvu7JZhysVxm1dP31aCTND31zpOrXSshpPhOC1YDkkFbagQGJFsuBSwc3bk1VZMPZfFTDDadv3Q0Ev1q5t3+l0DoRHMfCKxbVs99Uk9b+/Tpb/KAgVr5pZpk/tP4WqTVQsK4BAjG4/VzrjsWofo4y3rmRt0W5NRmCwZ+LxlxskGZbJJL8krHRl5Aoa5HRf2298lUngpZ3bH8SxK0cj0Exib1c1JRvNHkUAHdlzm87UAjc8aV1kJm7e8n8Gk2/75Fo4WfRhQZnkY5UomD7m8jQs23nHCjJT6X5fmloAiqn9ARrLj0/Yvoxg74tDZ0WtEHjCcjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA1P189MB3532.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:506::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:45:22 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 10:45:22 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] nfs-utils: musl upgrade to 3.1.1 and prerequisite systemd fixes
Date: Mon, 21 Sep 2026 12:45:17 +0200
Message-ID: <20260921104520.47933-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0065.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2de::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA1P189MB3532:EE_
X-MS-Office365-Filtering-Correlation-Id: 6631013e-7e33-4bcb-89a7-08df17cd6fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|18002099003|11063799006|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	FFYibnLU4HoGYuFg66wTMgAFoyIuLim87nj9Cv1fasAYEhiScsFh/b6EihbXAGk3byRsC+5hWjtdypH56qEP/ud4rTiJs+uD8rP1ERAIEh0hifsPRHJFr6XYTXZBXNb2/dDWRAbvmypIuG6mexakGxCYGH1kFQIhjYgmW5FPi97pXPID2XC0+QFAbkfP+1cNlqigZPeOIx8SI1BWCxwQe0U9KkAW/dgrllpbFG0y5ftl7W3bPabS3kiYjuRhMe3BGbVZOjxPtqAaJozNtqwqo+cA+vSyiC6tYE0cZa3g9EB8UGsJ2NiONtEaeV+6A30XBZMixqzDHvZ2l6YHAtU988Z0RWELclrNHVLsqVWy5jJNnyQTuEAP97vyDDX4d6WTaWPCXR7at3BIiWAJpS+QFa3VapRXIx1K1bjsyb8oHPH5hsoM91SkARyHGBCt+TGS/+rI+L2Sa86bFgF7VxImNggkYm5cKVdRVej4GuhRztJHzrFTbxcKm9mWKZTD3VwAAkBPXVm7IUONCw0x5iCBNXbYowQEACBO+PYMzfuf8t+NrZKT1y+OXxTVP5T5VmmRibqWhj5eC6uozcLTnlq7ByATP+uH89Cvf3BiiqtkraEESiavUt5bzgbvQ71jWQ75luBssYAdfDsP4WffWrZh8340iLsuy8w6i8dXDJnnTV0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(11063799006)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eXTpav6KBizxfEU1nmU2Wsn4e+g3rqu6wZORXPBVo9TKi+yhaAr8NoikZ+am?=
 =?us-ascii?Q?mMPYcMNI0lJn2yZS1hWtitBxdvc4H6qJJ7WZgOssTu/TD988GK5NKsezLSTI?=
 =?us-ascii?Q?qnfSm7VSgH7DtNvulXgb9zyHOEyLOaCeZ5zrObxxerZsYyhT5oEKIJ3JyOoR?=
 =?us-ascii?Q?AgMv3pSeT11Rq+ecMeWbSu985W0K3gB3RoULY3mHTmN9NOVPH72GNJxNmrji?=
 =?us-ascii?Q?QGA8CtymItsf4TqQ5O4/8BYPpfiIAUzraKN0t2AMCN0DU+ahH9L6MEqHvlmP?=
 =?us-ascii?Q?ScN05+QScD6dpZCrccXKdqVp/oaDb9m14T7wVPxXXGW85MeRzzjHNdMJOHKe?=
 =?us-ascii?Q?IXAj0TajjNK3cKkdT2xX1vwOuycOZap26idzw481YiLJvp8xoik+DWUdgUWr?=
 =?us-ascii?Q?4se1rw/NfuHgp0O0lWF6XB/bNAMAkwrl3xbGed1jlyEphyah1aUp4hEQdGXS?=
 =?us-ascii?Q?JkoV0yYfWZLRUNXQVQ0PQpyzXbTpHSNVxqhOqV5jgudihwB36+hEtyLJPAdh?=
 =?us-ascii?Q?o6pozQ8LbDh8QzyR4LKyJ9H1ukUe5ZID5WjPmPq1VaOafw6FUK6Egv695EGf?=
 =?us-ascii?Q?UbhcpNnjkYOO+wXB3lRQVC4+Ys7qPTUSE+CmvnmJRJXYUMbfh3pz5aqPofWV?=
 =?us-ascii?Q?a+jTCiZvexZZrB33YVIbEUoO/JmAEY7Ptn5pJKmoQDJlzYZFpjbj/irmPAjk?=
 =?us-ascii?Q?4gTYV9vstmrSUpO/u0ubJOYORfMwk9WUIoPUPgy9SNRbPzX471qJ45Ue+tUO?=
 =?us-ascii?Q?DmYu5yshPdEycvNBSQWoxRQJb7pAjHqfsBjy9M2HJSCMP+j9Wh2dew2WU/3Z?=
 =?us-ascii?Q?wdF2m28llwVduPEuVs9+WTdQfSSgJZeHP6xJeJiQfYUAFPIKaimgFWgbDte6?=
 =?us-ascii?Q?KbyBuCUkA8Xrpy3Rhh72KLyh+1hWRdXO5jBvCfo+2QTRFs/ViSPu51kt9D2A?=
 =?us-ascii?Q?ojG9KTNIH57ppN7mZX3dTFhaE+dfR73XiGPtZP+5QPBdPEefdMd+sNH3L6Ef?=
 =?us-ascii?Q?m2b69LP1gWx1uLEswiNeL0OB6/OqYDDNuu2Y+0EMwTg8QFTpFpBQftZ6GdyK?=
 =?us-ascii?Q?FcoQofm70ly4m2UPf8mz6y49hRv0EAk3mNqmOxS2998xBHCnPB0H/WT0p5wA?=
 =?us-ascii?Q?LI05D6Jxooh73En7KTaLk+X572LgB/gbxZkQtrwWrkQ6E0bDFAaQ5AgTg3OQ?=
 =?us-ascii?Q?RHOcO6gVX1ytCGjEF+ACVDX6DM6Wb+DjLUbUCKzR23Vmvl055+RT618ZPxA0?=
 =?us-ascii?Q?LAGFeGR/he8lB9XF8IN6TPagR4g8qEx8Fu9CZdh4APCCSv9cPoKRIHHjJ945?=
 =?us-ascii?Q?Hf4LYYoddHmF1/ZAp50UcVnnkBbdIk4trAMs5LPZBZm8qStXxUE+4aSoJ+5U?=
 =?us-ascii?Q?qBfip79AGH6YuCxnR6uJ4D7Wav4W/GjRugHj3sWwq8n1ohJqjAWNIa3z8RZU?=
 =?us-ascii?Q?AUWmrX31WU54dF8w7K/RZF8EvXUbReakTPQoyqrXVxZI8B/AqlUfU/tf0lSf?=
 =?us-ascii?Q?Z0Si7H3xCi6LhNz4e5GnIBR7q1skdKe543hZAWs6u+UiGmFz3GY3vn6pJqa2?=
 =?us-ascii?Q?7DUuDcl+BoODhk2Dr7O7Yr4vVY+Vn5vgr4T6S9wSIEVDsDP6tOyNLlTGJ9CK?=
 =?us-ascii?Q?pJkiPSZazrKUo6dGjDIBMO78fwOaEpe5r2kzdgmIbgkCvoEXW70m50uvHk7I?=
 =?us-ascii?Q?VdWfTQ3WiYIVw7Dr/0rWucSC6fB1Jjl3jr4cmMsZfGShx54Zyaw/CfwTtOpW?=
 =?us-ascii?Q?trIx98sdRQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6631013e-7e33-4bcb-89a7-08df17cd6fc1
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:45:22.3309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwnP0ENWMHZkb8ArtHnBxbAd6yvqkc6XCnqUipPmC9gv7Tod83x4d+fOwj/X77gjHpUKk5i1sv601cJdkS4LNDMTwzXEW75TFzYtzSEJbv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3532
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 10:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246321

This series upgrades nfs-utils to 3.1.1 and fixes the two systemd musl
issues that block it.

On musl, nfs-utils cannot be built until systemd builds, because nfs-utils
depends on systemd (it installs systemd units). systemd 261.3 currently
fails on musl for two reasons, both addressed here first:

  1. systemd's src/include/musl/limits.h override does not expose musl's
     POSIX limits (PATH_MAX, NAME_MAX, SSIZE_MAX, ...), so do_compile fails=
.
     Fixed by defining them in the override (submitted upstream, see
     https://github.com/systemd/systemd/pull/43824).

  2. do_package emits spurious "cannot find any provider" warnings for
     optional (recommended/suggested) dlopen dependencies that legitimately
     have no provider on musl, e.g. libintl.so.8 (musl keeps the gettext
     symbols in libc). Downgraded to a note for non-required dependencies.

With those in place, nfs-utils is upgraded to 3.1.1: two local patches that
were merged upstream are dropped and the remaining ones refreshed.

The patches are ordered so the tree builds cleanly on musl at every step
(systemd fixes first, then the nfs-utils upgrade that relies on them).
glibc builds are unaffected; the systemd limits fix is libc-musl only.

Jaipaul Cheernam (3):
  systemd: fix musl build by providing missing POSIX limits
  systemd: dlopen-deps: only warn for missing required providers
  nfs-utils: upgrade 2.9.2 -> 3.1.1

 ...tport-fix-missing-stddef.h-inclusion.patch | 27 ------
 .../0004-Use-nogroup-for-nobody-group.patch   |  4 +-
 .../0005-find-OE-provided-Kerberos.patch      |  2 +-
 ...e-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch | 47 ----------
 ...{nfs-utils_2.9.2.bb =3D> nfs-utils_3.1.1.bb} |  4 +-
 meta/recipes-core/systemd/dlopen-deps.inc     | 12 ++-
 ...X-limits-missing-from-limits.h-overr.patch | 92 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_261.3.bb    |  6 ++
 8 files changed, 113 insertions(+), 81 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-getp=
ort-fix-missing-stddef.h-inclusion.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0006-conf=
igure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.9.2.bb =3D> nfs-ut=
ils_3.1.1.bb} (96%)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-musl-define-POSI=
X-limits-missing-from-limits.h-overr.patch


