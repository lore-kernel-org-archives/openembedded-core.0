Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AE4CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 09:20:45 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17764.1792142435365498198
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 02:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0cL54CaY;
 spf=pass (domain: est.tech, ip: 40.107.130.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpkFgIy9XKzSS8NgbeRdnX5UGz3i8FhnAHq8YIxnMYbj+7p+mjOYckyDDiJAHNv40TkRk8MXtGHLAjtRoUEc+fXrcGk/86lQ9bLePsj5JkFTpM1mZ60x8LdVkSG67sfTw7pipCutMgGobmps2c/tlmQjWpo81KqIvWXgJqBvxKSwjGYt2BREvNMusewzBj5v3zSaVQ5mPWsjdwCoYyvOyNo88m4l8E0kkGTZpQ77VMOXxTO3738cRrPFjd05FKeYmDupcPMNHdJHjzGupH2iX/fGX7y/Q9KGjfYIc/XJxnaMWpfT7sNy32rzucQp9oU8qE4mhRhe94ZBHWW9zZqW2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1ZR7UW2JxeNBr7ldZ5cWx+N4IqfpTVBE8aTXLD9Wrs=;
 b=ntJtBX+vANbX38fGn6IBhFkT8ZG0MoaKL+QedoUjdmRBO7r0m3MdyU//HzNpzeEUOL5FFiF0BwxoM427SN9V01Pf7RUGaALgJqaawmY5oHFmx1GbYEGpKiX8NSIvK5U1Kw0AbJde0eRWP00tFRLXcQV8d0SCx6aV4sn+uIgDqE1+G3EiyvxfXAo0ndbsATWobnhgsepPO6wXxt8djlJxlFUuOA4kpsSrlLtpEYo3mWRZ2tqYGd8gGdu3otoV5MeEg6NOKBzjW17bnDRBdd2G8LEqhwakLpqeldgUI/k6SPVs6pGSjedTOEuE4doerquJ7vdM7baOZg9b21pra6ry5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1ZR7UW2JxeNBr7ldZ5cWx+N4IqfpTVBE8aTXLD9Wrs=;
 b=0cL54CaYUBpMC3E/U8lHGsxoqASE34s7HokKkTN8FQE3RtcyfUIM+KwByN8qX7/kd0lhBOGOsDkIR1sO3kd1SMml9xh9OPATqixoafsW8v82sQ5uXnKrU6xo+qkM+HdSuFRQo7skP7+0cGACPLKS62c5MGUZL+GRuycuF3rpDaacXL/soVjhTFKbmRrGvNnuVDcvFyr2rOZgkOA4McidIAd0aydNSjQbSMitxGJ+bg/HG4ZAFqTW2Pu7NIAxkyI7z4i/v7j7pe2x/51b+Ey0PejqTr0jvK6fpd5U5NCMMEhc00+Olgu/x9ac2KwLEb1S4wpLxUb5B8kyBAtZHlBRZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from VI0P189MB3116.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2cd::21)
 by AS8P189MB2022.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:509::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 09:20:28 +0000
Received: from VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
 ([fe80::2d33:bb97:b0f8:8167]) by VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
 ([fe80::2d33:bb97:b0f8:8167%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 09:20:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libarchive: upgrade 3.8.9 -> 3.8.10
Date: Fri, 16 Oct 2026 11:20:24 +0200
Message-ID: <20261016092025.19560-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0298.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::15) To VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:800:2cd::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P189MB3116:EE_|AS8P189MB2022:EE_
X-MS-Office365-Filtering-Correlation-Id: c68bdb4a-151a-43da-5d0c-08df2b66b7da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|29003799003|18002099003|10067099003|12006099003|25016099003|13003099007|261009221227099003|261009220027099003|261009223027099003|261009221727099003|261009223327099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	xEX4aIrONkfpg+2KUs6RmpBbK+7VSYTC9IHRzFV5Njy3b6lbaAYsM7PLykU/ioQmrNqxMqm1ikrJICpg37+V9TvKwZREwQhVCcpmituN5g4FYOzeWWWuzUJAJPb7JB7aBTvX9jaou4jB0c2Qs5ZfED8deUTe0QIp8p6Xt7EcamqYyt+0Jiw8H833bo6aMf6nCJhedPCR9Y1dHgGoEcckP+TYJ3+MXRB82YNGG31/5wPiX5tELZWbDCRgSgyCrj33TL7Qil1+wOVXxQSlOZ3D9CFRgkaJocrt1trHSHJKCyfr4f2iL2kiX8SZZ8VYA/B68Yba9GGbf1myPSea8qAhGKzs9jvmocIM+QF2DVFFA7MWgEJzVXOeCuxPPVvy5QLsAJ5ySNSHUkIqAwpGg4VyvjLFU32McKQXDWsqgHjJPWFXgaTWgQTi9XXpXOQPZMc4bcMQELTKFdmApIX7vengoMdT81hmOqd7dr/mKGZyjckOAj3oYEKRh6fSMLdesn22ct2fjQ7sF6Ew+jM0P9ri1CIeXCEWsnl74wt6C//LcdFEeKlamsst8RSueZHD8Pm3R84IUNfzEt/S1UXSegPjM5KyaPI9ITtlxn4f7NsM7LY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P189MB3116.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(29003799003)(18002099003)(10067099003)(12006099003)(25016099003)(13003099007)(261009221227099003)(261009220027099003)(261009223027099003)(261009221727099003)(261009223327099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BqObpOhPOH7zasijcTkBmBqdHs9kS1rRVS+9hO57hobXYsjx/UdocU2gZnNq?=
 =?us-ascii?Q?64j3bjlHfVIoRLMPfBcV0aCLGgmpp9/7WZnT92EX1ncoB0BU3AZzbEJibRQX?=
 =?us-ascii?Q?qJ786vHZuXv2MBtCvSopsJ21iDQUUTeYs3qZeADUexM8CZfmV9z740WEl9Bf?=
 =?us-ascii?Q?QyMj+gQNVYmA7wo+5upODkZuh32cKSge5mM5lC6i2h/InSc3K31fCQz+OgbE?=
 =?us-ascii?Q?Y4pD06Su5d2asXz7tP3ZzGDX7oPVWehjUNSoiKkGBGWzgt1ErB7lTarwwdZL?=
 =?us-ascii?Q?VGBVxH3PElZJACzUd1I7I/wk26Zpb35egjdE23FmpG0vK6VldCPGeg68kDBM?=
 =?us-ascii?Q?xG+PM1vF/qk6D39qUc3bu7NXR41PfQWIXMtAmiw/kZBdSeQqS+lxCCm4jYEz?=
 =?us-ascii?Q?JcdNeJ09f4FkcIOFw8aWodmAhu61iSZei6+Jf1U/uSYIlfOsqdMXDq4E23sC?=
 =?us-ascii?Q?sSOk7XdWV/dCDx2sdFvd3NS1mK0wSq8toY/q9Guxw8Z8OoE/hjH/r2qm3wuM?=
 =?us-ascii?Q?TcdkKCsaZqkbWlnUOQJU9AruXzZqJSwMbxgFMdL7wPMAhkIqWpLWUKU7IR1b?=
 =?us-ascii?Q?DCp7vKz51avZYAFXum8/GjaY19g2MpvIk4IOlZVuZhB7V7i8oXmbZCXYfdRP?=
 =?us-ascii?Q?3FWZnI1wTwQJaI36o0NLUzMYpaQS5MIjt/C75r1kZ7Hxlal9qXnBx19Gcsid?=
 =?us-ascii?Q?25wt4rKGn9JTMrtAgZzCyN/NJ7gWBDJ498FI6SfVneXwqf5jKbDWQmmvXmg8?=
 =?us-ascii?Q?mCwkVupZAQ4+vrFL7GcR/smg5je75GeuliwQFoTbw5h88R4uAx0zeho87LSa?=
 =?us-ascii?Q?RvK0dHY7L1fPY2tAm2zJOCPeMFid2ZvKw/79dIDj/6I+p60GtW4XOdhWlEbi?=
 =?us-ascii?Q?60yctk64TQdufElPi76LwyuVWFMFavfY7zYSX/ANkyaCKbM3lfRZYXdwQ5lk?=
 =?us-ascii?Q?W6q1txfyWko9hVSEIriIHIkK9s03vloRGkax15X7cO82597SNUUkBqNL5KDr?=
 =?us-ascii?Q?9WwbmUZejtHLaTJMM82j1AriQGWgLqZdN63yiAbqBXiLJyCURyrU5GCt7wWk?=
 =?us-ascii?Q?3+xUlGdvsCjNTS5sts9+rxO+jPEqK2yHFlBLpVBV5iUb8jOyc9hrwRMumUSr?=
 =?us-ascii?Q?LCgl2XI7CAHfkoAuFQTuDMxiAcy54/gVLK0meIRCBSbVRx9lxstQBrn4cCXf?=
 =?us-ascii?Q?6scnwJTmTmaiRqC/bSoKNoQAOIB4NCByzBdo0CJN1deTxcgtBkOcfbFdCaMP?=
 =?us-ascii?Q?T01WuJa/eYp8lpWTE6dAOcvfHwDfDPZL2EtbHZCeBAj4h3weP02jUdIoTzCL?=
 =?us-ascii?Q?npNrIKRj99IaB8wNac6mGWkHwnqSO0GmknxNVz2AR+capyHEySXb2nGmcTwd?=
 =?us-ascii?Q?eAOrCuBk/CDV2OD6SOFvK7xoET5OSIihQWzx8V+lO8/tcAqnfDwXdMGT6m0T?=
 =?us-ascii?Q?sENdhPZ2UctCoCjMB4jc4/JkOhGEzMuPINYiMMmIjIoa3ZNF8/gfgUctWiMa?=
 =?us-ascii?Q?2bn5DEQDl0ibNo5BSbK9GG6YUMDVK1lmXaj17X15H4eyKlzraaZB2UX0RxBq?=
 =?us-ascii?Q?WD2Fj2lQKQ1TQNHJR9bjCNwYWp8GO22PBohYbfeXcgjRnqt5O8gdzIHHCS/N?=
 =?us-ascii?Q?ehJnG1T/1qf9NloB1TVdlC7OeOaDRPC8auNijG+FYX25u5aRplr0ohH4Qxl6?=
 =?us-ascii?Q?2Icoqv1PRDgnmPYpD5Hi18Lk+f+W0qvs3VhWg79qrFn2xO1m8jgf0Z4KumEM?=
 =?us-ascii?Q?9NfaRgkOYt0ETBbTpc+BNauaA3S9lB8=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c68bdb4a-151a-43da-5d0c-08df2b66b7da
X-MS-Exchange-CrossTenant-AuthSource: VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:20:28.3966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OpGtp5E4+/iHacT+zIagsldAssN9tg+8ZjcTAAAZVrcEAq+8PFoWTNBpMYwf8N+kbbqKlpH420VV9pdwFMmEW9Yf9gLcNmy1r2iXr6bNjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 09:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248006

Release: https://github.com/libarchive/libarchive/releases/tag/v3.8.10
ChangeLog: https://github.com/libarchive/libarchive/compare/v3.8.9...v3.8.1=
0

- Drop patches which are part of release now
  - 0001-append_filter-Use-last-bidder-for-filter.patch
  - 0001-append_filter-Verify-that-bidder-and-filter-match.patch
  - 0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch
  - 0003-Remove-bidder-name.patch
- Refresh existing patches

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...nd_filter-Use-last-bidder-for-filter.patch | 188 -------------
 ...-Verify-that-bidder-and-filter-match.patch | 103 -------
 ...aes256-streaming-test-when-no-crypto.patch |  46 ----
 .../libarchive/0003-Remove-bidder-name.patch  | 258 ------------------
 ...vert-RPM-reader-into-a-proper-format.patch |  32 +--
 ...0005-Disable-RPM-filter-auto-bidding.patch |   6 +-
 ...barchive_3.8.9.bb =3D> libarchive_3.8.10.bb} |   8 +-
 7 files changed, 20 insertions(+), 621 deletions(-)
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append=
_filter-Use-last-bidder-for-filter.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append=
_filter-Verify-that-bidder-and-filter-match.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-test-s=
kip-ppmd8-aes256-streaming-test-when-no-crypto.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Remove=
-bidder-name.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.8.9.bb =3D> libarchi=
ve_3.8.10.bb} (90%)

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter=
-Use-last-bidder-for-filter.patch b/meta/recipes-extended/libarchive/libarc=
hive/0001-append_filter-Use-last-bidder-for-filter.patch
deleted file mode 100644
index 8e1eb0e9388..00000000000
--- a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Use-la=
st-bidder-for-filter.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-From 50b585bb55484cdc70bd92852a477178dc43485c Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Sun, 2 Aug 2026 14:27:17 +0200
-Subject: [PATCH] append_filter: Use last bidder for filter
-
-Appending a filter implies appending a bidder. Always use the last added
-bidder, since it was just added. This avoids desync situations where
-previously added bidders could erroneously match.
-
-Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
-
-Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit=
/50b585bb]
----
- libarchive/archive_read_append_filter.c | 72 ++++++++-----------------
- 1 file changed, 22 insertions(+), 50 deletions(-)
-
-diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_=
read_append_filter.c
-index 8de1b2ea..9dd9f536 100644
---- a/libarchive/archive_read_append_filter.c
-+++ b/libarchive/archive_read_append_filter.c
-@@ -33,14 +33,25 @@
- #include "archive_private.h"
- #include "archive_read_private.h"
-=20
-+static struct archive_read_filter_bidder *
-+get_last_bidder(struct archive_read *a)
-+{
-+  size_t i;
-+
-+  for (i =3D 0; i < sizeof(a->bidders) / sizeof(a->bidders[0]); i++)
-+  {
-+    if (a->bidders[i].vtable =3D=3D NULL)
-+      break;
-+  }
-+
-+  return a->bidders + (i - 1);
-+}
-+
- int
- archive_read_append_filter(struct archive *_a, int code)
- {
--  int r1, r2, number_bidders, i;
--  const char *str;
--  struct archive_read_filter_bidder *b;
--  struct archive_read_filter *f;
-   struct archive_read *a =3D (struct archive_read *)_a;
-+  int r1, r2;
-=20
-   r2 =3D (ARCHIVE_OK);
-   switch (code)
-@@ -53,15 +64,12 @@ archive_read_append_filter(struct archive *_a, int cod=
e)
-       r1 =3D (ARCHIVE_OK);
-       break;
-     case ARCHIVE_FILTER_GZIP:
--      str =3D "gzip";
-       r1 =3D archive_read_support_filter_gzip(_a);
-       break;
-     case ARCHIVE_FILTER_BZIP2:
--      str =3D "bzip2";
-       r1 =3D archive_read_support_filter_bzip2(_a);
-       break;
-     case ARCHIVE_FILTER_COMPRESS:
--      str =3D "compress (.Z)";
-       r1 =3D archive_read_support_filter_compress(_a);
-       break;
-     case ARCHIVE_FILTER_PROGRAM:
-@@ -69,43 +77,33 @@ archive_read_append_filter(struct archive *_a, int cod=
e)
-           "Cannot append program filter using archive_read_append_filter"=
);
-       return (ARCHIVE_FATAL);
-     case ARCHIVE_FILTER_LZMA:
--      str =3D "lzma";
-       r1 =3D archive_read_support_filter_lzma(_a);
-       break;
-     case ARCHIVE_FILTER_XZ:
--      str =3D "xz";
-       r1 =3D archive_read_support_filter_xz(_a);
-       break;
-     case ARCHIVE_FILTER_UU:
--      str =3D "uu";
-       r1 =3D archive_read_support_filter_uu(_a);
-       break;
-     case ARCHIVE_FILTER_RPM:
--      str =3D "rpm";
-       r1 =3D archive_read_support_filter_rpm(_a);
-       break;
-     case ARCHIVE_FILTER_LZ4:
--      str =3D "lz4";
-       r1 =3D archive_read_support_filter_lz4(_a);
-       break;
-     case ARCHIVE_FILTER_ZSTD:
--      str =3D "zstd";
-       r1 =3D archive_read_support_filter_zstd(_a);
-       break;
-     case ARCHIVE_FILTER_LZIP:
--      str =3D "lzip";
-       r1 =3D archive_read_support_filter_lzip(_a);
-       break;
-     case ARCHIVE_FILTER_LZOP:
--      str =3D "lzop";
-       r1 =3D archive_read_support_filter_lzop(_a);
-       break;
-     case ARCHIVE_FILTER_LRZIP:
--      str =3D "lrzip";
-       r1 =3D archive_read_support_filter_lrzip(_a);
-       break;
-     case ARCHIVE_FILTER_GRZIP:
--      str =3D "grzip";
-       r1 =3D archive_read_support_filter_grzip(_a);
-       break;
-     default:
-@@ -114,22 +112,10 @@ archive_read_append_filter(struct archive *_a, int c=
ode)
-       return (ARCHIVE_FATAL);
-   }
-=20
--  if (code !=3D ARCHIVE_FILTER_NONE)
-+  if (r1 > ARCHIVE_FATAL && code !=3D ARCHIVE_FILTER_NONE)
-   {
--    number_bidders =3D sizeof(a->bidders) / sizeof(a->bidders[0]);
--
--    b =3D a->bidders;
--    for (i =3D 1; i < number_bidders; i++, b++)
--    {
--      if (!b->name || !strcmp(b->name, str))
--        break;
--    }
--    if (!b->name || strcmp(b->name, str))
--    {
--      archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
--          "Internal error: Unable to append filter");
--      return (ARCHIVE_FATAL);
--    }
-+    struct archive_read_filter_bidder *b;
-+    struct archive_read_filter *f;
-=20
-     f =3D calloc(1, sizeof(*f));
-     if (f =3D=3D NULL)
-@@ -137,6 +123,7 @@ archive_read_append_filter(struct archive *_a, int cod=
e)
-       archive_set_error(&a->archive, ENOMEM, "Out of memory");
-       return (ARCHIVE_FATAL);
-     }
-+    b =3D get_last_bidder(a);
-     f->bidder =3D b;
-     f->archive =3D a;
-     f->upstream =3D a->filter;
-@@ -162,37 +149,22 @@ int
- archive_read_append_filter_program_signature(struct archive *_a,
-   const char *cmd, const void *signature, size_t signature_len)
- {
--  int r, number_bidders, i;
-+  struct archive_read *a =3D (struct archive_read *)_a;
-   struct archive_read_filter_bidder *b;
-   struct archive_read_filter *f;
--  struct archive_read *a =3D (struct archive_read *)_a;
-+  int r;
-=20
-   if (archive_read_support_filter_program_signature(_a, cmd, signature,
-     signature_len) !=3D (ARCHIVE_OK))
-     return (ARCHIVE_FATAL);
-=20
--  number_bidders =3D sizeof(a->bidders) / sizeof(a->bidders[0]);
--
--  b =3D a->bidders;
--  for (i =3D 0; i < number_bidders; i++, b++)
--  {
--    /* Program bidder name set to filter name after initialization */
--    if (b->data && !b->name)
--      break;
--  }
--  if (!b->data)
--  {
--    archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
--        "Internal error: Unable to append program filter");
--    return (ARCHIVE_FATAL);
--  }
--
-   f =3D calloc(1, sizeof(*f));
-   if (f =3D=3D NULL)
-   {
-     archive_set_error(&a->archive, ENOMEM, "Out of memory");
-     return (ARCHIVE_FATAL);
-   }
-+  b =3D get_last_bidder(a);
-   f->bidder =3D b;
-   f->archive =3D a;
-   f->upstream =3D a->filter;
---=20
-2.54.0
-
diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter=
-Verify-that-bidder-and-filter-match.patch b/meta/recipes-extended/libarchi=
ve/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
deleted file mode 100644
index a91f5182071..00000000000
--- a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify=
-that-bidder-and-filter-match.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From db4fb440792278cd01e0829c93f6b62f567b704b Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Sun, 2 Aug 2026 14:26:22 +0200
-Subject: [PATCH 1/3] append_filter: Verify that bidder and filter match
-
-Make sure that appending a filter always matches its supposed bidder.
-
-Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/=
3346]
-Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
-Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
----
- Makefile.am                                   |  1 +
- libarchive/test/CMakeLists.txt                |  1 +
- .../test/test_archive_read_append_filter.c    | 54 +++++++++++++++++++
- 3 files changed, 56 insertions(+)
- create mode 100644 libarchive/test/test_archive_read_append_filter.c
-
-diff --git a/Makefile.am b/Makefile.am
-index 2fb4fdf4..c96b3bc6 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -404,6 +404,7 @@ libarchive_test_SOURCES=3D \
- 	libarchive/test/test_archive_pathmatch_oob.c \
- 	libarchive/test/test_archive_read.c \
- 	libarchive/test/test_archive_read_add_passphrase.c \
-+	libarchive/test/test_archive_read_append_filter.c \
- 	libarchive/test/test_archive_read_close_twice.c \
- 	libarchive/test/test_archive_read_multiple_data_objects.c \
- 	libarchive/test/test_archive_read_next_header_empty.c \
-diff --git a/libarchive/test/CMakeLists.txt b/libarchive/test/CMakeLists.t=
xt
-index 44f839f8..c4102c3d 100644
---- a/libarchive/test/CMakeLists.txt
-+++ b/libarchive/test/CMakeLists.txt
-@@ -33,6 +33,7 @@ IF(ENABLE_TEST)
-     test_archive_pathmatch_oob.c
-     test_archive_read.c
-     test_archive_read_add_passphrase.c
-+    test_archive_read_append_filter.c
-     test_archive_read_close_twice.c
-     test_archive_read_multiple_data_objects.c
-     test_archive_read_next_header_empty.c
-diff --git a/libarchive/test/test_archive_read_append_filter.c b/libarchiv=
e/test/test_archive_read_append_filter.c
-new file mode 100644
-index 00000000..5c301d52
---- /dev/null
-+++ b/libarchive/test/test_archive_read_append_filter.c
-@@ -0,0 +1,54 @@
-+/*-
-+ * Copyright (c) 2026 Tobias Stoeckmann
-+ * All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ * 1. Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ * 2. Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in the
-+ *    documentation and/or other materials provided with the distribution=
.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS O=
R
-+ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANT=
IES
-+ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED=
.
-+ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
-+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, B=
UT
-+ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF U=
SE,
-+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
-+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE =
OF
-+ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-+ */
-+
-+#include "archive.h"
-+#include "test.h"
-+
-+DEFINE_TEST(test_archive_read_append_filter)
-+{
-+	struct archive *a;
-+	int r;
-+
-+	a =3D archive_read_new();
-+	assert(a !=3D NULL);
-+
-+	/* Append a program bidder (without filter). */
-+	assertEqualIntA(a, ARCHIVE_OK,
-+	    archive_read_support_filter_program(a, "prog1"));
-+
-+	/* Append a filter program which comes with its own bidder. */
-+	r =3D archive_read_append_filter_program(a, "prog2");
-+
-+	/* Verify that filter uses its own bidder. */
-+	if (r =3D=3D ARCHIVE_FATAL) {
-+		assertEqualStringA(a, "Can't initialize filter; unable to run program \=
"prog2\"",
-+			archive_error_string(a));
-+	} else {
-+		assertEqualIntA(a, ARCHIVE_OK, r);
-+		assertEqualStringA(a, "Program: prog2", archive_filter_name(a, 0));
-+	}
-+
-+	archive_read_free(a);
-+}
---=20
-2.49.0
diff --git a/meta/recipes-extended/libarchive/libarchive/0001-test-skip-ppm=
d8-aes256-streaming-test-when-no-crypto.patch b/meta/recipes-extended/libar=
chive/libarchive/0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.=
patch
deleted file mode 100644
index fc962251415..00000000000
--- a/meta/recipes-extended/libarchive/libarchive/0001-test-skip-ppmd8-aes2=
56-streaming-test-when-no-crypto.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From c2b00a5fff659bbe8d70b5e00cb6abb831170aeb Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Wed, 29 Jul 2026 13:33:10 +0000
-Subject: [PATCH] test: skip ppmd8 aes256 streaming test when no crypto lib=
rary
- is present
-
-test_read_format_zip_ppmd8_aes256_streaming fails with 6 assertion
-failures on systems without a crypto library (openssl/nettle/mbedtls)
-because it tries to decrypt a pre-built encrypted zipx file without
-checking crypto availability first.
-
-Add the same guard used by the other encrypted zip tests in this file.
-
-Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/=
3335]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- .../test/test_read_format_zip_zipx_encrypted.c     | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/libarchive/test/test_read_format_zip_zipx_encrypted.c b/libar=
chive/test/test_read_format_zip_zipx_encrypted.c
-index f07e1e5c..a0a431fb 100644
---- a/libarchive/test/test_read_format_zip_zipx_encrypted.c
-+++ b/libarchive/test/test_read_format_zip_zipx_encrypted.c
-@@ -257,8 +257,22 @@ DEFINE_TEST(test_read_format_zip_zipx_zstd_encrypted_=
streaming)
- DEFINE_TEST(test_read_format_zip_ppmd8_aes256_streaming)
- {
- 	const char *refname =3D "test_read_format_zip_ppmd8_aes256_streaming.zip=
x";
-+	struct archive *a;
- 	size_t used;
- 	char buff[600];
-+
-+	/* Check if running system has cryptographic functionality. */
-+	assert((a =3D archive_write_new()) !=3D NULL);
-+	assertEqualIntA(a, ARCHIVE_OK, archive_write_set_format_zip(a));
-+	assertEqualIntA(a, ARCHIVE_OK, archive_write_add_filter_none(a));
-+	if (ARCHIVE_OK !=3D archive_write_set_options(a,
-+			"zip:encryption=3Daes256")) {
-+		skipping("This system does not have cryptographic library");
-+		archive_write_free(a);
-+		return;
-+	}
-+	archive_write_free(a);
-+
- 	extract_reference_file(refname);
- 	FILE *f =3D fopen(refname, "rb");
- 	used =3D fread(buff, 1, sizeof(buff), f);
diff --git a/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder=
-name.patch b/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidde=
r-name.patch
deleted file mode 100644
index bbd24785775..00000000000
--- a/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.p=
atch
+++ /dev/null
@@ -1,258 +0,0 @@
-From 76c7142bd2595184826722063598fddf62031cca Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Sun, 2 Aug 2026 14:31:33 +0200
-Subject: [PATCH 3/3] Remove bidder name
-
-The name was only needed to find the appropriate bidder for a filter.
-Since this has been resolved by accessing the last bidder, since in these
-situations the bidder is added first, then the filter, the name is not
-needed anymore.
-
-Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/=
3346]
-Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
-Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
----
- libarchive/archive_read.c                         | 2 --
- libarchive/archive_read_append_filter.c           | 1 -
- libarchive/archive_read_private.h                 | 3 ---
- libarchive/archive_read_support_filter_bzip2.c    | 2 +-
- libarchive/archive_read_support_filter_compress.c | 2 +-
- libarchive/archive_read_support_filter_grzip.c    | 2 +-
- libarchive/archive_read_support_filter_gzip.c     | 2 +-
- libarchive/archive_read_support_filter_lrzip.c    | 2 +-
- libarchive/archive_read_support_filter_lz4.c      | 2 +-
- libarchive/archive_read_support_filter_lzop.c     | 2 +-
- libarchive/archive_read_support_filter_program.c  | 2 +-
- libarchive/archive_read_support_filter_rpm.c      | 2 +-
- libarchive/archive_read_support_filter_uu.c       | 2 +-
- libarchive/archive_read_support_filter_xz.c       | 6 +++---
- libarchive/archive_read_support_filter_zstd.c     | 2 +-
- 15 files changed, 14 insertions(+), 20 deletions(-)
-
-diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
-index e844e42d..406d84de 100644
---- a/libarchive/archive_read.c
-+++ b/libarchive/archive_read.c
-@@ -1290,7 +1290,6 @@ __archive_read_register_format(struct archive_read *=
a,
- int
- __archive_read_register_bidder(struct archive_read *a,
- 	void *bidder_data,
--	const char *name,
- 	const struct archive_read_filter_bidder_vtable *vtable)
- {
- 	struct archive_read_filter_bidder *bidder;
-@@ -1307,7 +1306,6 @@ __archive_read_register_bidder(struct archive_read *=
a,
- 		memset(a->bidders + i, 0, sizeof(a->bidders[0]));
- 		bidder =3D (a->bidders + i);
- 		bidder->data =3D bidder_data;
--		bidder->name =3D name;
- 		bidder->vtable =3D vtable;
- 		if (bidder->vtable->bid =3D=3D NULL || bidder->vtable->init =3D=3D NULL=
) {
- 			archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
-diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_=
read_append_filter.c
-index 9dd9f536..5cc8ff55 100644
---- a/libarchive/archive_read_append_filter.c
-+++ b/libarchive/archive_read_append_filter.c
-@@ -174,7 +174,6 @@ archive_read_append_filter_program_signature(struct ar=
chive *_a,
-     __archive_read_free_filters(a);
-     return (ARCHIVE_FATAL);
-   }
--  b->name =3D a->filter->name;
-=20
-   a->bypass_filter_bidding =3D 1;
-   return r;
-diff --git a/libarchive/archive_read_private.h b/libarchive/archive_read_p=
rivate.h
-index 3bd8de2d..e30b6c2b 100644
---- a/libarchive/archive_read_private.h
-+++ b/libarchive/archive_read_private.h
-@@ -68,8 +68,6 @@ struct archive_read_filter_bidder_vtable {
- struct archive_read_filter_bidder {
- 	/* Configuration data for the bidder. */
- 	void *data;
--	/* Name of the filter */
--	const char *name;
- 	const struct archive_read_filter_bidder_vtable *vtable;
- };
-=20
-@@ -250,7 +248,6 @@ int	__archive_read_register_format(struct archive_read=
 *a,
-=20
- int __archive_read_register_bidder(struct archive_read *a,
- 		void *bidder_data,
--		const char *name,
- 		const struct archive_read_filter_bidder_vtable *vtable);
-=20
- const void *__archive_read_ahead(struct archive_read *, size_t, ssize_t *=
);
-diff --git a/libarchive/archive_read_support_filter_bzip2.c b/libarchive/a=
rchive_read_support_filter_bzip2.c
-index 588953f2..1cfc55dc 100644
---- a/libarchive/archive_read_support_filter_bzip2.c
-+++ b/libarchive/archive_read_support_filter_bzip2.c
-@@ -91,7 +91,7 @@ archive_read_support_filter_bzip2(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "bzip2",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&bzip2_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
-diff --git a/libarchive/archive_read_support_filter_compress.c b/libarchiv=
e/archive_read_support_filter_compress.c
-index 4e1f1dc5..4763995e 100644
---- a/libarchive/archive_read_support_filter_compress.c
-+++ b/libarchive/archive_read_support_filter_compress.c
-@@ -160,7 +160,7 @@ archive_read_support_filter_compress(struct archive *_=
a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	return __archive_read_register_bidder(a, NULL, "compress (.Z)",
-+	return __archive_read_register_bidder(a, NULL,
- 			&compress_bidder_vtable);
- }
-=20
-diff --git a/libarchive/archive_read_support_filter_grzip.c b/libarchive/a=
rchive_read_support_filter_grzip.c
-index 9d9ad46e..8457ec7c 100644
---- a/libarchive/archive_read_support_filter_grzip.c
-+++ b/libarchive/archive_read_support_filter_grzip.c
-@@ -62,7 +62,7 @@ archive_read_support_filter_grzip(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "grzip",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&grzip_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
-diff --git a/libarchive/archive_read_support_filter_gzip.c b/libarchive/ar=
chive_read_support_filter_gzip.c
-index 89ae0f37..34b174b7 100644
---- a/libarchive/archive_read_support_filter_gzip.c
-+++ b/libarchive/archive_read_support_filter_gzip.c
-@@ -96,7 +96,7 @@ archive_read_support_filter_gzip(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "gzip",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&gzip_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
-diff --git a/libarchive/archive_read_support_filter_lrzip.c b/libarchive/a=
rchive_read_support_filter_lrzip.c
-index 33910fe1..a1d45d77 100644
---- a/libarchive/archive_read_support_filter_lrzip.c
-+++ b/libarchive/archive_read_support_filter_lrzip.c
-@@ -61,7 +61,7 @@ archive_read_support_filter_lrzip(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "lrzip",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lrzip_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
-diff --git a/libarchive/archive_read_support_filter_lz4.c b/libarchive/arc=
hive_read_support_filter_lz4.c
-index 19086a1f..28189a07 100644
---- a/libarchive/archive_read_support_filter_lz4.c
-+++ b/libarchive/archive_read_support_filter_lz4.c
-@@ -118,7 +118,7 @@ archive_read_support_filter_lz4(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "lz4",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lz4_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
-diff --git a/libarchive/archive_read_support_filter_lzop.c b/libarchive/ar=
chive_read_support_filter_lzop.c
-index ebfaf01e..5a552fce 100644
---- a/libarchive/archive_read_support_filter_lzop.c
-+++ b/libarchive/archive_read_support_filter_lzop.c
-@@ -109,7 +109,7 @@ archive_read_support_filter_lzop(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "lzop",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lzop_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
-diff --git a/libarchive/archive_read_support_filter_program.c b/libarchive=
/archive_read_support_filter_program.c
-index cf7c3613..a9e02a32 100644
---- a/libarchive/archive_read_support_filter_program.c
-+++ b/libarchive/archive_read_support_filter_program.c
-@@ -156,7 +156,7 @@ archive_read_support_filter_program_signature(struct a=
rchive *_a,
- 		memcpy(state->signature, signature, signature_len);
- 	}
-=20
--	if (__archive_read_register_bidder(a, state, NULL,
-+	if (__archive_read_register_bidder(a, state,
- 				&program_bidder_vtable) !=3D ARCHIVE_OK) {
- 		free_state(state);
- 		return (ARCHIVE_FATAL);
-diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/arc=
hive_read_support_filter_rpm.c
-index 01bd1bf7..1cfddf75 100644
---- a/libarchive/archive_read_support_filter_rpm.c
-+++ b/libarchive/archive_read_support_filter_rpm.c
-@@ -71,7 +71,7 @@ archive_read_support_filter_rpm(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	return __archive_read_register_bidder(a, NULL, "rpm",
-+	return __archive_read_register_bidder(a, NULL,
- 			&rpm_bidder_vtable);
- }
-=20
-diff --git a/libarchive/archive_read_support_filter_uu.c b/libarchive/arch=
ive_read_support_filter_uu.c
-index c0f6f48e..10d49648 100644
---- a/libarchive/archive_read_support_filter_uu.c
-+++ b/libarchive/archive_read_support_filter_uu.c
-@@ -92,7 +92,7 @@ archive_read_support_filter_uu(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	return __archive_read_register_bidder(a, NULL, "uu",
-+	return __archive_read_register_bidder(a, NULL,
- 			&uudecode_bidder_vtable);
- }
-=20
-diff --git a/libarchive/archive_read_support_filter_xz.c b/libarchive/arch=
ive_read_support_filter_xz.c
-index 7c8e0cb5..b00ba543 100644
---- a/libarchive/archive_read_support_filter_xz.c
-+++ b/libarchive/archive_read_support_filter_xz.c
-@@ -115,7 +115,7 @@ archive_read_support_filter_xz(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "xz",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&xz_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
-@@ -147,7 +147,7 @@ archive_read_support_filter_lzma(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "lzma",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lzma_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
-@@ -180,7 +180,7 @@ archive_read_support_filter_lzip(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "lzip",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lzip_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
-diff --git a/libarchive/archive_read_support_filter_zstd.c b/libarchive/ar=
chive_read_support_filter_zstd.c
-index 12eac04c..163f54b5 100644
---- a/libarchive/archive_read_support_filter_zstd.c
-+++ b/libarchive/archive_read_support_filter_zstd.c
-@@ -87,7 +87,7 @@ archive_read_support_filter_zstd(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "zstd",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&zstd_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
diff --git a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-r=
eader-into-a-proper-format.patch b/meta/recipes-extended/libarchive/libarch=
ive/0004-Convert-RPM-reader-into-a-proper-format.patch
index 03a207f33f1..e309b3a8395 100644
--- a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-i=
nto-a-proper-format.patch
+++ b/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-i=
nto-a-proper-format.patch
@@ -1,4 +1,4 @@
-From 2606336bce3a7f66cc6c8af28687a82536c9086c Mon Sep 17 00:00:00 2001
+From a20f942aa883a48021b66dc6a00cbae342ee67b9 Mon Sep 17 00:00:00 2001
 From: Davide Beatrici <git@davidebeatrici.dev>
 Date: Sun, 9 Aug 2026 14:14:59 -0700
 Subject: [PATCH] libarchive: Convert RPM reader into a proper format
@@ -38,14 +38,14 @@ Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver=
.com>
  .../test_read_format_cpio_svr4_bzip2_rpm.c    |    4 +-
  .../test_read_format_cpio_svr4_gzip_rpm.c     |    4 +-
  libarchive/test/test_read_format_huge_rpm.c   |   13 +-
- 15 files changed, 1169 insertions(+), 20 deletions(-)
+ 15 files changed, 1162 insertions(+), 15 deletions(-)
  create mode 100644 libarchive/archive_read_support_format_rpm.c
=20
 diff --git a/Makefile.am b/Makefile.am
-index c96b3bc..725e20c 100644
+index 8bc70c5..487bef3 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -210,6 +210,7 @@ libarchive_la_SOURCES=3D \
+@@ -212,6 +212,7 @@ libarchive_la_SOURCES=3D \
  	libarchive/archive_read_support_format_rar.c \
  	libarchive/archive_read_support_format_rar5.c \
  	libarchive/archive_read_support_format_raw.c \
@@ -54,7 +54,7 @@ index c96b3bc..725e20c 100644
  	libarchive/archive_read_support_format_warc.c \
  	libarchive/archive_read_support_format_xar.c \
 diff --git a/contrib/android/Android.mk b/contrib/android/Android.mk
-index 9e1c72f..3d1f087 100644
+index f81dcb0..24af25e 100644
 --- a/contrib/android/Android.mk
 +++ b/contrib/android/Android.mk
 @@ -91,6 +91,7 @@ libarchive_src_files :=3D libarchive/archive_acl.c \
@@ -66,7 +66,7 @@ index 9e1c72f..3d1f087 100644
  						libarchive/archive_read_support_format_warc.c \
  						libarchive/archive_read_support_format_xar.c \
 diff --git a/libarchive/CMakeLists.txt b/libarchive/CMakeLists.txt
-index b296637..d132123 100644
+index ac039c1..34ba173 100644
 --- a/libarchive/CMakeLists.txt
 +++ b/libarchive/CMakeLists.txt
 @@ -110,6 +110,7 @@ SET(libarchive_SOURCES
@@ -78,10 +78,10 @@ index b296637..d132123 100644
    archive_read_support_format_warc.c
    archive_read_support_format_xar.c
 diff --git a/libarchive/archive.h b/libarchive/archive.h
-index a7de6f6..89c60b3 100644
+index 19b316a..f04a747 100644
 --- a/libarchive/archive.h
 +++ b/libarchive/archive.h
-@@ -314,7 +314,9 @@ typedef const char *archive_passphrase_callback(struct=
 archive *,
+@@ -316,7 +316,9 @@ typedef const char *archive_passphrase_callback(struct=
 archive *,
  #define	ARCHIVE_FILTER_LZMA	5
  #define	ARCHIVE_FILTER_XZ	6
  #define	ARCHIVE_FILTER_UU	7
@@ -91,7 +91,7 @@ index a7de6f6..89c60b3 100644
  #define	ARCHIVE_FILTER_LZIP	9
  #define	ARCHIVE_FILTER_LRZIP	10
  #define	ARCHIVE_FILTER_LZOP	11
-@@ -385,6 +387,7 @@ typedef const char *archive_passphrase_callback(struct=
 archive *,
+@@ -387,6 +389,7 @@ typedef const char *archive_passphrase_callback(struct=
 archive *,
  #define	ARCHIVE_FORMAT_7ZIP			0xE0000
  #define	ARCHIVE_FORMAT_WARC			0xF0000
  #define	ARCHIVE_FORMAT_RAR_V5			0x100000
@@ -99,7 +99,7 @@ index a7de6f6..89c60b3 100644
 =20
  /*
   * Codes returned by archive_read_format_capabilities().
-@@ -478,7 +481,9 @@ __LA_DECL int archive_read_support_filter_program(stru=
ct archive *,
+@@ -480,7 +483,9 @@ __LA_DECL int archive_read_support_filter_program(stru=
ct archive *,
  __LA_DECL int archive_read_support_filter_program_signature
  		(struct archive *, const char * /* cmd */,
  				    const void * /* match */, size_t);
@@ -109,7 +109,7 @@ index a7de6f6..89c60b3 100644
  __LA_DECL int archive_read_support_filter_uu(struct archive *);
  __LA_DECL int archive_read_support_filter_xz(struct archive *);
  __LA_DECL int archive_read_support_filter_zstd(struct archive *);
-@@ -499,6 +504,7 @@ __LA_DECL int archive_read_support_format_mtree(struct=
 archive *);
+@@ -501,6 +506,7 @@ __LA_DECL int archive_read_support_format_mtree(struct=
 archive *);
  __LA_DECL int archive_read_support_format_rar(struct archive *);
  __LA_DECL int archive_read_support_format_rar5(struct archive *);
  __LA_DECL int archive_read_support_format_raw(struct archive *);
@@ -118,10 +118,10 @@ index a7de6f6..89c60b3 100644
  __LA_DECL int archive_read_support_format_warc(struct archive *);
  __LA_DECL int archive_read_support_format_xar(struct archive *);
 diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
-index 406d84d..150bd31 100644
+index 2f006fb..5c51df5 100644
 --- a/libarchive/archive_read.c
 +++ b/libarchive/archive_read.c
-@@ -1296,13 +1296,18 @@ __archive_read_register_bidder(struct archive_read=
 *a,
+@@ -1297,13 +1297,18 @@ __archive_read_register_bidder(struct archive_read=
 *a,
  	int i, number_slots;
 =20
  	archive_check_magic(&a->archive, ARCHIVE_READ_MAGIC,
@@ -143,10 +143,10 @@ index 406d84d..150bd31 100644
  		bidder =3D (a->bidders + i);
  		bidder->data =3D bidder_data;
 diff --git a/libarchive/archive_read_private.h b/libarchive/archive_read_p=
rivate.h
-index e30b6c2..9ff3602 100644
+index 43b7f85..9b27655 100644
 --- a/libarchive/archive_read_private.h
 +++ b/libarchive/archive_read_private.h
-@@ -212,7 +212,7 @@ struct archive_read {
+@@ -208,7 +208,7 @@ struct archive_read {
  		int	(*cleanup)(struct archive_read *);
  		int	(*format_capabilties)(struct archive_read *);
  		int	(*has_encrypted_entries)(struct archive_read *);
@@ -1344,7 +1344,7 @@ index 0000000..fe0e500
 +	free(hash);
 +}
 diff --git a/libarchive/test/test_archive_read_support.c b/libarchive/test=
/test_archive_read_support.c
-index b0c9280..bc256a1 100644
+index ff03c0f..1bef2f7 100644
 --- a/libarchive/test/test_archive_read_support.c
 +++ b/libarchive/test/test_archive_read_support.c
 @@ -91,6 +91,7 @@ DEFINE_TEST(test_archive_read_support)
diff --git a/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-f=
ilter-auto-bidding.patch b/meta/recipes-extended/libarchive/libarchive/0005=
-Disable-RPM-filter-auto-bidding.patch
index 26a01599083..86eb48a8045 100644
--- a/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-a=
uto-bidding.patch
+++ b/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-a=
uto-bidding.patch
@@ -1,4 +1,4 @@
-From 882166d7fa113f0c2108864b8a579d01816e1fce Mon Sep 17 00:00:00 2001
+From b367b31b5b764e15c8d484a75c790b6ffa1e20d8 Mon Sep 17 00:00:00 2001
 From: Sumanth Gavini <sumanth.gavini@windriver.com>
 Date: Tue, 11 Aug 2026 12:02:31 -0700
 Subject: [PATCH] libarchive: Disable RPM filter auto-bidding
@@ -20,7 +20,7 @@ Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.c=
om>
  1 file changed, 6 insertions(+), 31 deletions(-)
=20
 diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/arc=
hive_read_support_filter_rpm.c
-index 01bd1bf..8e90da3 100644
+index 1cfddf7..a9b6ef8 100644
 --- a/libarchive/archive_read_support_filter_rpm.c
 +++ b/libarchive/archive_read_support_filter_rpm.c
 @@ -79,39 +79,14 @@ static int
@@ -69,5 +69,3 @@ index 01bd1bf..8e90da3 100644
  }
 =20
  static const struct archive_read_filter_vtable
---=20
-2.49.0
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.8.10.bb
similarity index 90%
rename from meta/recipes-extended/libarchive/libarchive_3.8.9.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.10.bb
index 2eefa285326..804dcd74516 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.10.bb
@@ -31,16 +31,12 @@ EXTRA_OECONF +=3D "--enable-largefile --without-iconv"
=20
 SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://run-ptest \
-           file://0001-append_filter-Use-last-bidder-for-filter.patch \
-           file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypt=
o.patch \
-           file://0001-append_filter-Verify-that-bidder-and-filter-match.p=
atch \
-           file://0003-Remove-bidder-name.patch \
            file://0004-Convert-RPM-reader-into-a-proper-format.patch \
            file://0005-Disable-RPM-filter-auto-bidding.patch \
-          "
+           "
 UPSTREAM_CHECK_URI =3D "https://www.libarchive.org/"
=20
-SRC_URI[sha256sum] =3D "f5a6539059cf5e597dbeda37bfa4874b1e8dea063c8d93bf85=
a2b44af90a5bd4"
+SRC_URI[sha256sum] =3D "a1bffbe5152cfe869751179e7b16648c87c461cb8c46eee750=
62efbe164cc57c"
=20
 inherit autotools update-alternatives pkgconfig ptest
=20

