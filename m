Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34FBC4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:21:12 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43347.1784708467126866624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=OLb/WRfQ;
 spf=pass (domain: est.tech, ip: 52.101.70.2, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1HOLC8iYKFxk+mx/CitXnlNTzFRUZEjosqS53PCOqlZFX8ffNkmY6nlHhxKBFjEG42QUP+L/gex2vTPoPw1wJ3LVO50AUtIq24J6u8FDW9erVKaD78aRL6jyEEJ4Xn63bwg7Zzjki9u/XnmBTC08ZANkBjOcCScFJxZ1w9LrZOC/+OvB3MXjr6QwPzy7aN/WPs0AJ+myXDJI+vSN+fS4DB1a5oE+4wKCg3CJrCCvIPT0bR/e94+OwAEQgXvmFCLME2y7L+OLLV3X53VHUHzJkRYXIyXlUbsTyQVZGdQGo3ds4ef5kakZY948lHoYCsoPptRB9jVTUe1zzAqDXDwrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFwRahHwYJl90c1mnkov1YjG+reQkX3qf/oMotq3nKw=;
 b=Y/bs0jK9DSIhf/IaLPrN+yXNjsysL8n+60th7rUGymoNRu8a4r3vPWmHI0gIMBfABWwMSuOi1o6MEk6JYVEmrYkdbm6biyor5WFShU1awWFANY3QBfmQof3qHD2zSw8hnVV/V5wx24p+oXaAIvhTq1lln1KTSIN1cV9AoFG6SvMJmhxTnxfcv2zz0khKP0IKPYG/eMN5QrGSsVEjIy5zpxZrfTaL95bnck9wbJh37de6TVu2aZfc2IOg3sHL4PVWTYx3A/yBlhlrYsNbw7Ugp/XWUNTC8PwoR+iNMdSakJaw8osoUQRxlZdJ3eOx5fFw1Kg3pACOLVozv208ebjHYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFwRahHwYJl90c1mnkov1YjG+reQkX3qf/oMotq3nKw=;
 b=OLb/WRfQKgJaTHkxtLyz8/aPtMIzdfhOdBnqIh7Elk0TJzs7ihI82t/uMWCRN5j8Uw3vtCKR/PY7RkWRdQeBzGZjpX0OMtGQdC9qrmvSqqadNKnvSC/V1gSBVyxTTlpsMDlprZV3/9FMKtoSVSsdmNeODU0Iflk3EiVhr6zQQXAE+JgP552IMiyjwYsoQm32L/IcranigNAue9KrO5Wc1BsUw0/ZutZVzdJyJgVODBCCYWjHVU/nS8wOpgjB/NAs/3fSTVW9suq20juOJC4LS19c1Sa7NtmxrNawpqgMdGhz4A+WHC0rgKyhayesXSL38I1pHhp6WDEcQUaUND8P4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by PA1P189MB3492.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Wed, 22 Jul
 2026 08:21:01 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:21:01 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 2/5] wget: fix CVE-2026-58470
Date: Wed, 22 Jul 2026 10:20:46 +0200
Message-ID: <20260722082056.15176-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0180.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::35) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|PA1P189MB3492:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c27c33d-d7f2-4cbe-a4ad-08dee7ca2aa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|56012099006|10067099003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	TAEauUm1d3TrLC7dRr1VX7b5JmExPOI6fjBSKTDHlWwpu2I+fFcEo8KpIMC5acyi0dyHEyC8rn4nQVredZxYfmWvahwP4vzVYKsop0qXsmB13D4I7fSuDCN3yz6vMchDSkDteW7hivjUCQ5ndex69trMv/k74d5jBZJh89gcGcFc7QejQP6dq6W/KCl7xpOZ7sX7kjm1psHXuYlio/aV02xQfxLlTsYja/KjkCOkKGsAeJbdAxIj9T9+NIgn0nfrl39XUxiFNNd6UTPsJz5RoqqVmbjrWeDi90CHHXbetHmJzWiKDYXYcbAfEr07Ea6SChb4uhXo2Cxz3jVQU0xMk8tYHfBFwOYchby8NS4Q90jstF5kGhS4Fz3p1tGCrliiOqF1fjKnE9M+NqjYpUPS+hWhtgcaC7DicWprG4TDCdnBZRar4mq4d08ZAd1HwnuW3Ox6hlICI65RvJzaWUlgjy3wL+CLm3tDJmJfQM6VTyykyML1pSWge40yH6vCLw95ndMD5hmU5ToPxGotbgIB1Tkxb+wxGKJwb9KhqjkKJY0E9QdHp+7O+dejXj5g+pmZqiJnlM4rlgiK3yLBF+hXBM92toDXqSjJwBXyc0hroE0Uf7Y8OrkIsD3v/sq7BuUh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zi0nb6NuWQIl7kGln0jilBuIO48ckL7x/vrkrAJvju2e5+8GoPvbUkxpSKFE?=
 =?us-ascii?Q?WtOw0ggO5/mTeYEp0sZQt+X4I9dhWHGR123ZtfN+Ca/8SsM5c2/hvz/5aS2F?=
 =?us-ascii?Q?FTg9TVLAdY6fbg+ANRRIu55Zx3aOKtxdcBxv2nCYyzbtmL/63TfYmwKlFXY5?=
 =?us-ascii?Q?Lr826iEB7d2e5HVqvJs4I6l+fzp4SxBEaUyrRiBx2Y5Ld15QoPJl95eJciE9?=
 =?us-ascii?Q?jebRvds+Sq/FNVkkVGc3iXLHDuZhecPtab03Zazq3eO/qgwytCeTaqSoUCg8?=
 =?us-ascii?Q?J3GC+3cErnp2dXCNWPlSe4z6CnAntMrjmeCfhHZXEiHizva/FNWwNSoXOv0t?=
 =?us-ascii?Q?mS8MI6+tcak21fmZIwdQ6ppTDEgifHUEmlCp3TtSExEQoiiO5/H9g+gfZ6DI?=
 =?us-ascii?Q?38iu3ofjlSxFop9BsPRfIuy5wqmAzxe083t/0Aef/o6HkMYCrVl3Zx9tDDUk?=
 =?us-ascii?Q?NuC78wzMlPi7NJjIXWHudhykFUDZssHfZKkbKCvTi8ybmSj94OvfqQXWn84Y?=
 =?us-ascii?Q?YbtI79VrGQXjuZiqR6kS4iVTCSCYOEz4wXKag33HTykS/opo6ZDTJGgkPGhG?=
 =?us-ascii?Q?5qT3NNQt70yoFwUs2OTKaUJRhBOHxEUk4FV/ZO74lssdRplg91LNKobTxYjc?=
 =?us-ascii?Q?MYLx0a6MZOxiO198bnsjFVKnke98l1ZoYFiLkGEX6Kf3R0xDZET8jZGwYnBw?=
 =?us-ascii?Q?BOfrC1YAed+y3hGaKQ6FeFbg9GMJn9PzUhx7vjd169D9o9RGTCVc7ye2eQSq?=
 =?us-ascii?Q?1EZiRjfZT1qTY9kQN0YxuNziM9sypoLRANZDsqHWpcTyZWouVAzx9aS81V0b?=
 =?us-ascii?Q?MNme9kVAGPNt2NkXjwdN1WA7jIBNols7NNWEztmuvx7wRD+4suPch5ynO9Wz?=
 =?us-ascii?Q?1riWl3YX9AyQhU5jYA5TWekx4ysI1GKXaBqfVpev4ZykvNHi9WVwTkgG+OZ6?=
 =?us-ascii?Q?mrat/r9B2X//wkwxs5HHoRfgfJZujQvyx0fvK46PZhV3KTvkAQS500WEloNf?=
 =?us-ascii?Q?hXrAmwawvj4PS3+u7ZxJRzbHQniaTyuSTV8sfe+45JOzat4u8QCEOn6FmI78?=
 =?us-ascii?Q?1SQXMVDrSYltRzHm9eVqs6RxioBzG3z8eyiqyv+U8HBMXwlhzHoynYQ3sO7Y?=
 =?us-ascii?Q?7QNCxO5NnJcgYGZGSPJl35wp2J5mTGIoGZEJ3BXCRmfm82qQlV0A9L9JgS0O?=
 =?us-ascii?Q?TZuUPXxsa0PbOElfemSXRfZEPjpirYoXJ1LWm4rNF3n7jbOBEM5QPQfoQAB1?=
 =?us-ascii?Q?1PDUIfyuveef7EwZPWNv9ZRxizp4B3ENJdcs5ajLlqtXAztxlV8GXRiRkc0s?=
 =?us-ascii?Q?BSOxaq/o1lJvSz9ydV1Fu+ZMKI8fPfpFzJKRQxDyfLcbU2T6xIq1M6MU2oK9?=
 =?us-ascii?Q?fwXxLqFaZ/8EKWNH+kHFLreqY29HWIDyb1qaUt8G5af+6cEl1yrpkDLCq132?=
 =?us-ascii?Q?DO+wCFTPZ5kI4UhRp16wFnevfJ/MADmfyIuRb4hasUd2MpgrI2TRw97qHsP9?=
 =?us-ascii?Q?0nFFyr66ZpdbQxqjWv/CwDOmPM6vYdCzAwR3s54X/QXeaPTAlS8teEJi9VXI?=
 =?us-ascii?Q?mQcpGxKC2QVp7B+N5yhb3GqYVRIrYeEti92jKcvbBh343qjVaMJsAXQdWbHi?=
 =?us-ascii?Q?b5vBUPtLhUa5+/SIM4KA02VCx5XSnIWA4miiIu3FDl+xAejKQyJdcoY8ikYT?=
 =?us-ascii?Q?YB2xa7f331t7nmi6JMpqR9HrcA3nyYen1mqxGUtBxi8mhSFtPboctVhA2m71?=
 =?us-ascii?Q?+x7ajYxIug=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c27c33d-d7f2-4cbe-a4ad-08dee7ca2aa4
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:21:01.8469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/GDtK1i6VcPk4BUz6QXjmVgg8Uqsx3ZPXRXY8C9UMcBpl0TWltorzKKStSFYyXFhJcu/LynKGNNo4OIgHnGMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3492
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241616

From: Amaury Couderc <amaury.couderc@est.tech>

Backport patch to fix CVE-2026-58470.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58470
  https://www.cve.org/CVERecord?id=3DCVE-2026-58470
  https://security-tracker.debian.org/tracker/CVE-2026-58470
  https://ubuntu.com/security/CVE-2026-58470
  https://osv.dev/list?q=3DCVE-2026-58470

Upstream fix:
  https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6ffd3=
0c34ffcf [nvd]

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../wget/wget/CVE-2026-58470.patch            | 78 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58470.patch b/meta/re=
cipes-extended/wget/wget/CVE-2026-58470.patch
new file mode 100644
index 0000000000..463292651b
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58470.patch
@@ -0,0 +1,78 @@
+From fd316db417a4d368f6f76aecbac047dce7e40699 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Tim=3D20R=3DC3=3DBChsen?=3D <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 18:57:54 +0200
+Subject: [PATCH] * src/http.c (parse_content_range): Fix integer overflow
+
+Reported-by: TristanInSec@gmail.com
+
+CVE: CVE-2026-58470
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/43d3ba=
9336bc94937e6fae2365c6ffd30c34ffcf]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ src/http.c | 35 ++++++++++++++++++++++++-----------
+ 1 file changed, 24 insertions(+), 11 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index 07af1867..ea2e591b 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -914,6 +914,7 @@ parse_content_range (const char *hdr, wgint *first_byt=
e_ptr,
+                      wgint *last_byte_ptr, wgint *entity_length_ptr)
+ {
+   wgint num;
++  char *end;
+=20
+   /* Ancient versions of Netscape proxy server, presumably predating
+      rfc2068, sent out `Content-Range' without the "bytes"
+@@ -932,27 +933,39 @@ parse_content_range (const char *hdr, wgint *first_b=
yte_ptr,
+     }
+   if (!c_isdigit (*hdr))
+     return false;
+-  for (num =3D 0; c_isdigit (*hdr); hdr++)
+-    num =3D 10 * num + (*hdr - '0');
+-  if (*hdr !=3D '-' || !c_isdigit (*(hdr + 1)))
++
++  errno =3D 0;
++  num =3D strtol(hdr, &end, 10);
++  if (errno =3D=3D ERANGE)
++    return false;
++  hdr =3D end;
++
++  if (*hdr++ !=3D '-' || !c_isdigit (*hdr))
+     return false;
+   *first_byte_ptr =3D num;
+-  ++hdr;
+-  for (num =3D 0; c_isdigit (*hdr); hdr++)
+-    num =3D 10 * num + (*hdr - '0');
+-  if (*hdr !=3D '/')
++
++  errno =3D 0;
++  num =3D strtol(hdr, &end, 10);
++  if (errno =3D=3D ERANGE)
++    return false;
++  hdr =3D end;
++
++  if (*hdr++ !=3D '/')
+     return false;
+   *last_byte_ptr =3D num;
+-  if (!(c_isdigit (*(hdr + 1)) || *(hdr + 1) =3D=3D '*'))
++  if (!(c_isdigit (*hdr) || *hdr =3D=3D '*'))
+     return false;
+   if (*last_byte_ptr < *first_byte_ptr)
+     return false;
+-  ++hdr;
+   if (*hdr =3D=3D '*')
+     num =3D -1;
+   else
+-    for (num =3D 0; c_isdigit (*hdr); hdr++)
+-      num =3D 10 * num + (*hdr - '0');
++    {
++      errno =3D 0;
++      num =3D strtol(hdr, NULL, 10);
++      if (errno =3D=3D ERANGE)
++        return false;
++    }
+   *entity_length_ptr =3D num;
+   if ((*entity_length_ptr <=3D *last_byte_ptr) && *entity_length_ptr !=3D=
 -1)
+     return false;
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-exten=
ded/wget/wget_1.25.0.bb
index a1f34dfb5c..5268ed968f 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -16,6 +16,7 @@ DEPENDS +=3D "autoconf-archive-native pod2man-native"
 SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
            file://CVE-2026-58469.patch \
+           file://CVE-2026-58470.patch \
            "
=20
 SRC_URI[sha256sum] =3D "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb=
726ac9d0da3784"
--=20
2.34.1


