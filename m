Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24C3C44533
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:18:52 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43201.1784708329862118673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=hTH+DLao;
 spf=pass (domain: est.tech, ip: 52.101.66.3, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6jn2r0fa0m44xRX8Pnr2gLw8qbvmAbV4EyTQg7EKPSFiZtuelFHfFd/7loQlDFD7haByHr8BiFkQATtLAKG1pUvoeNpgoqiH1PKhpW5uwEuiSRoI4T1vGPu/9QYX8z+q//FFrzqz8jCXNW8d4FwMlY3Nr4jbdJXh5a4F/tyw7QQ4W+MIi9eC1uyU6PxKTyHNxhTIM2SB+xgTo9sw+o++8LQodRjihjwaA/WO81YfEPnOj2laiogGyV0AnosbwpuOPo4x4kM3U+JzK/Wk14dt0mSIrZRCjoQfDL7yj3oJysOJXwTvMRga+FboHnyuOll+PHt6pobWFH8rYbLP5/yLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Brll+F2/WPQXZ3VADSjAQm9V3ipbBWUMekgL9E8qrcQ=;
 b=Xj+aBo+3M2H6FtXLgAXkOwcsXhxqM+heUMNnbBXTS7h+9iAlNEMOGDj2KyiSwlOUl1gH7KehNJ7dgV4WDhbbMlaMD3J3F6qiT+hy1jQ1q+AvonmblnmNnDflu5uZKYAcKWmkPl7JlhmCQJKPDX2cDdJDdGcW07tKBWAB2icbRaT4N7vQPXSgNyfBFvvI6K2zaJcTkwiviitr7xyoao+RHe9Nx8ZJDposLSKrNpttglQRNXS4k+StoN+gOgKzLWUZppt7XXy3sOqMeGSqaLnTIE5szFii6+gExYMoBuqNhugBqHBqVUXLDnfzgLWz7TlLlQfOk5h2qsTsuVCJZW7uzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Brll+F2/WPQXZ3VADSjAQm9V3ipbBWUMekgL9E8qrcQ=;
 b=hTH+DLaoWujpCkwfZ4JWaPrDlX56Yo3yH+hDo5QZAgJnjiOTYrtQNK/E/R08E0/gZ3Cmad+QPsGoz7hPQAkmaJQnjqfBw50TxwLPwcddZe62Dq4ExK1OQ7kUIsZGOA4zGZTtRfrb3BlTWP0rIlMxJbeOfgokVnkBRq0dqFi/letTXnHeBtwq5eGH78qjMG+2TyGUnp+IDmOLBUczIE34iTwAF2roaSjsElZ1mJctOAUtvPcPx+VV2pCKzNJ8v9opoSl1IpSGKBVryL0Vp68RIf/vHtC59VHirTUkRWZTCIf2Jnt+165Za58yHhhAWRHI+WxchPogn5brP0iJpSmEXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by PA1P189MB3492.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Wed, 22 Jul
 2026 08:18:45 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:18:45 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] wget: fix CVE-2026-58472
Date: Wed, 22 Jul 2026 10:18:27 +0200
Message-ID: <20260722081840.14924-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0089.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::12) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|PA1P189MB3492:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e8da420-3fa4-4d72-97c4-08dee7c9d96a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|56012099006|10067099003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Yzi2wz6PxhpRva2CpfEB7uFQZ9oL2FaYF0oKD0eI5Ju8LYSXftepvL6z9hGuoHpmv6cnci1VMY3me84V/IS4g7tlKqxOyr38qgjLuG+1DaXxWlu/QoR5Mvp8AOs5MzfoL9Fv17uWqz4zsqrptIjoVlRd7E1t7Y+Vi5zaO0Ru3aqK4T3M9vSi9JeG+43R1xqUY0oDu9j6E/CpKdR2vluMXSoLHrsLLD70W4j8Forqx+lGYN0iILm9s4s8ctfOWcvwP/nnEYecSHGafF0f7AJ09kHrebkiYIeWei8yA7V0hK3Oszrb9dPuPlPmZjwC+2AxY566MUJIlvUXYDKkTU8QnGTXocjME/0U09hppeFidyUr952kk+QIEkVFy6oj+GUO2eu6kvSY9FHQfzamfL/MDfDBBY4dIaLnqOjgN4xfK3Bl/4NOBeCzYpZmYxnCi05jwvUWjjDF6bq0rYuXEhwSWXTgq/Q8pSTmVAuGAri2giPc0IGZN5CY89dECNgoAKNLpkNmvNWsLvSPHPDsRFK6+0c4pB6ZpY2qDuGBPTMIa5w0D/6RH1psus9iDcJYGOZLximBqR+fysqO1W067UW1cfpG3tbLSZP2/rwT73YO16I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h8bk/TFpuvU4XoZDqjk397NRYZZZ9r256Qio4p503+pI7QpM2M/Xd0OP/nub?=
 =?us-ascii?Q?BmAze6wR5NkJ58P4OLeNu1F0aGTki4zcSWqa/3yxAf/8OP5aHA7MV6IBGib/?=
 =?us-ascii?Q?SdKaFTku4evJqxTtjWt7GZYfy7TtoS9QGJaA3aNOwA3AvfywAc07GUBx4IVr?=
 =?us-ascii?Q?UJicEATQ09NW/PwpEtvgwubwbt6/eAbhBa0eYVREQUMYgE71i8J6oPQMjX5T?=
 =?us-ascii?Q?myBSXRATIrXwR/fb4J0igymFB3z6L6QoP9sq/MkVKgQeL4Yiz6+/OsNb0Xnn?=
 =?us-ascii?Q?Y+UxkH8eAdjBgoXJyjLigSmCxcZSnhzqFRQF2cHv9aJd1UCWugW3RicqHvCM?=
 =?us-ascii?Q?RaAkyosXKZg9LyjMVs9b3d55m9/qaW0isFIMl8uDe5AzmmXsftfX7xRQUhH8?=
 =?us-ascii?Q?HpV8FxZaBtw2FDY3q+XKOmvhMaV2u8/zjc6OAkZC9GmZ7vOmVoZ6OE6k4dV6?=
 =?us-ascii?Q?3jsT1LgvrGE4UtCSvoWP19alabmIFGb4C/xSamvsApynURNUan4dvDplw0dv?=
 =?us-ascii?Q?lVRQIEsLFkNaD9b9apLgKzHvajEY1bDgmr/yR0yeXQ+c6E3s8uWzUTxqzJkf?=
 =?us-ascii?Q?JJ5fONpgr7WDPjcCZjO/trEsuOIxxPRBIvRkuwHfxp+89GouFE4B02Hz1nC4?=
 =?us-ascii?Q?q/xgLtPDF8oKtIcD/X6BqJgOjIjamwpNL6UXi+vdT8KqWau+mjNCgTnpL79d?=
 =?us-ascii?Q?67Yeu1hcGoueWmkttsny1LeT+KeDEKU+SBMdUrWVZLu8APdBJdcPiwY1fMz7?=
 =?us-ascii?Q?sqeSsUFummVXhobVL+C6HnRmLPU+/jgq5qXYrTMnfyOgzhoWvijK82v08HtE?=
 =?us-ascii?Q?3xzbXX1hjA0riW00cuK/hzb61mAkZiqcshZDxDoOJhxRQ3ckbeHPtJ/S/gnf?=
 =?us-ascii?Q?AiUDrw7ZGiJRXHjhHQUbE+cWtH9UXQp5gJENJnWPyqa6kSokKLvuJinK4/hk?=
 =?us-ascii?Q?ckcA1A1hjgmhAe8AiONooMpgCK99Tjv+m+G4pHYSbNNh9JwiAOGN+qMJ6mTD?=
 =?us-ascii?Q?OA3kYSGvQYWM8gQppalsIpEmrlqaqZUxn3XSc+FflfiklKX8076kzJTBOXst?=
 =?us-ascii?Q?hDoP2JM5wjA+6rAjvJ5Jitz9yB+lEdiqEZ+FIYfLy6LzWzAh3aodybB/0qfR?=
 =?us-ascii?Q?z2p/Xr1FurWObt3bG3yWa0/xCAoicja1BhMehaJEkEgvlS6Gr4ukECvwrUpS?=
 =?us-ascii?Q?tVU3zy12AQstLePUCqxfQ23VHLhJI7Hk1KqYDddoK261krk1XrFaDaflolH7?=
 =?us-ascii?Q?58VdgW1UDJYDY44Zu1CZNyATbxB2f4N1q7qZObi2sRVEhmcSNrObxzwnmWIY?=
 =?us-ascii?Q?JlsmA8/oG6oMDBxBYVEHDs/om71BMv7SXZxpBQ8xkiDf+Zo7lDB3GdGAXmk1?=
 =?us-ascii?Q?R4H8pOgoqBe9SHeRffTk90o4etQoburBwbFJZNkbox9sCjthX9SJg4w1KJBG?=
 =?us-ascii?Q?/goIqZVwYnCcsbd6OOwq0PEcJXYQKt/EsRXbjEkgzmH2zJbE8vSYhp3IHd4/?=
 =?us-ascii?Q?zbJ+ZVnitnIqbrlknQUhjGlOK11Uas/dLVLajGY4GJsNglvhKz0Et8ev+8Dn?=
 =?us-ascii?Q?7MaI0i6hq1uAKwwfZdyB4PW4i2z++haHBBMdEDxPV0PxrkZaVFdLoOl3ii4U?=
 =?us-ascii?Q?ONbZgt8J/IIxAx1UzP4vcsWF0KxscH3o27BCphVt+OaeBdnz48h3pVu8edTt?=
 =?us-ascii?Q?sQNRd/OB3XSb/sjPACnMuq3pGsFbCuuT1WvqdY7rfPZk6aCdVCETsvJtw/im?=
 =?us-ascii?Q?wU32W3AUUg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8da420-3fa4-4d72-97c4-08dee7c9d96a
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:18:45.5916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Wmle37w1rd57G4rtge4AorHnPDP1ABkj/qXTf6vi6eGjEzPzFD7t3wecC3VL0WPKbRtN5Qr5Q3l0sr79CUIHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3492
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241612

From: Amaury Couderc <amaury.couderc@est.tech>

Backport patch to fix CVE-2026-58472.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58472
  https://www.cve.org/CVERecord?id=3DCVE-2026-58472
  https://security-tracker.debian.org/tracker/CVE-2026-58472
  https://ubuntu.com/security/CVE-2026-58472
  https://osv.dev/list?q=3DCVE-2026-58472

Upstream fix:
  https://gitlab.com/gnuwget/wget/-/commit/dd692d9cea5335b181d877ae917fe6e7=
5587a812 [nvd]

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../wget/wget/CVE-2026-58472.patch            | 73 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58472.patch b/meta/re=
cipes-extended/wget/wget/CVE-2026-58472.patch
new file mode 100644
index 0000000000..3499f298a9
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58472.patch
@@ -0,0 +1,73 @@
+From e4b70d86b2347f03bbe17ae258c68a77cdf6ee52 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Tim=3D20R=3DC3=3DBChsen?=3D <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 19:13:15 +0200
+Subject: [PATCH] * src/convert.c (html_quote_string): Fix integer+buffer
+ overflow
+
+Reported-by: TristanInSec@gmail.com
+
+CVE: CVE-2026-58472
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/dd692d=
9cea5335b181d877ae917fe6e75587a812]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ src/convert.c | 31 ++++++++++++++++++++++++-------
+ 1 file changed, 24 insertions(+), 7 deletions(-)
+
+diff --git a/src/convert.c b/src/convert.c
+index 2e5bc22b..d1cbab88 100644
+--- a/src/convert.c
++++ b/src/convert.c
+@@ -36,6 +36,7 @@ as that of the covered work.  */
+ #include <unistd.h>
+ #include <errno.h>
+ #include <assert.h>
++#include <intprops.h>
+ #include "convert.h"
+ #include "url.h"
+ #include "recur.h"
+@@ -1178,21 +1179,37 @@ html_quote_string (const char *s)
+ {
+   const char *b =3D s;
+   char *p, *res;
+-  int i;
++  size_t i;
++  int ok;
+=20
+   /* Pass through the string, and count the new size.  */
+-  for (i =3D 0; *s; s++, i++)
++  for (i =3D 0; *s; s++)
+     {
+       if (*s =3D=3D '&')
+-        i +=3D 4;                 /* `amp;' */
++        ok =3D INT_ADD_OK (i, 4, &i);     /* `amp;' */
+       else if (*s =3D=3D '<' || *s =3D=3D '>')
+-        i +=3D 3;                 /* `lt;' and `gt;' */
++        ok =3D INT_ADD_OK (i, 3, &i);     /* `lt;' and `gt;' */
+       else if (*s =3D=3D '\"')
+-        i +=3D 5;                 /* `quot;' */
++        ok =3D INT_ADD_OK (i, 5, &i);     /* `quot;' */
+       else if (*s =3D=3D ' ')
+-        i +=3D 4;                 /* #32; */
++        ok =3D INT_ADD_OK (i, 4, &i);     /* #32; */
++      else
++        ok =3D INT_ADD_OK (i, 1, &i);
++
++      if (!ok)
++        {
++          DEBUGP (("Overflow detected in html_quote_string().\n"));
++          abort();
++        }
+     }
+-  res =3D xmalloc (i + 1);
++
++  if (!INT_ADD_OK (i, 1, &i))
++    {
++      DEBUGP (("Overflow detected in html_quote_string().\n"));
++      abort();
++    }
++
++  res =3D xmalloc (i);
+   s =3D b;
+   for (p =3D res; *s; s++)
+     {
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-exten=
ded/wget/wget_1.25.0.bb
index 8d9b983de5..b773081753 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469.patch \
            file://CVE-2026-58470.patch \
            file://CVE-2026-58471.patch \
+           file://CVE-2026-58472.patch \
            "
=20
 SRC_URI[sha256sum] =3D "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb=
726ac9d0da3784"
--=20
2.34.1


