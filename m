Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B52C4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:25:12 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43265.1784708706170883478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=AZFhlIHi;
 spf=pass (domain: est.tech, ip: 40.107.159.0, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bu1P8HaAr3klfLXdY3nG0clKM2ptzpaNiw0kqzq3X+lNt4g0itK6KH++lawhnEsXmTVA58+di7QZNuSTk6+y9yTb3+8rAWrf/PjguQEdRxlv0bBUgqqyMRbVQ2/v5pXsulVa/aEDgRKEwtHSFzrgRS02YaUIJWEQ9kPqzZW4CvYOWNFu0xH+3otdY68MBsiYTnT5BNkohczD5Pe1NKbvIN8PE5QxNZapJtUznuY+Hn2UXDjkGVdqbaGBxlBj+BkuYSmXHBUtV9MN151wyhAxbkqco106B+EU/5qIcQOlDkarbLFxXsA14j88MukPYm0Wk4pdPXH5kQiE1z40plsDiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ap5IX+EQ/XT2gEq0S4uXnqRPiCPh5oQ7U4x/cIbW2v4=;
 b=b7s3c2Z2Li0mvoJ/1mISiFd49eZlTRETJbaRbbtOD/Wzmm+iirOehVMaSclge3sSpHL/Nh76sxH70O5mmxNgp1l/4poXFtFYXd7y/KOM+g4HM6u+Gud/NgXAmGTk39GLvwa/KKuLn0pK1pdDoGRK0i+Wr4ES9OGpVbC5L+8bg+Fjl8Mt8+fAlNKiA84/yU2gVKtNVoW3DodDjpvo1d0cPsM8DxJEhlviufezbEgDldE2qzWFOoBVlds8Fn9vsnuQSQSnnAQ1MOfXFG4KpP5EMNgcPf1eOkBUO2H7Df5kP9C/uF9ZzvG7UgfMbWFFaKWsL9HgXoD4I8EwSO3UYR88Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ap5IX+EQ/XT2gEq0S4uXnqRPiCPh5oQ7U4x/cIbW2v4=;
 b=AZFhlIHiJSVwz3qdI7iiwFCcNMvWSmhMN+7I4soLY/zS0sPhUxmWdsZluNOk+sSgM+7WU6RW8wCjspfzPAMOxoOVHahhmL1YDdjrX04J+6JihyDJ8bBaqeRUBcfrXp6fuRb87rVz0AkRTx5jgRwu/hH6Isl6y7roqghR4zH3yS0eCQGD5ullNWM38kmqWJWPjd1ycz4n9186liqansIv3TJajr7aRcBIq6jW0TN1/Z8O9OWshq2AxdwN8z7BiQFI89pjB5NkEGT/TJ0XQvRqPM0tO+lm6SHdDrufCVB7QA7Hd9gb4HQoVWvtCJkQw5nb6F7Uvhtvk1SyzMUZOFOpZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by AS8P189MB2420.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Wed, 22 Jul
 2026 08:25:03 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:25:03 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 4/5] wget: fix CVE-2026-58472
Date: Wed, 22 Jul 2026 10:24:47 +0200
Message-ID: <20260722082458.15574-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0030.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::9) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|AS8P189MB2420:EE_
X-MS-Office365-Filtering-Correlation-Id: fae58d5b-3237-4d9e-f375-08dee7caba64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|11063799006|13003099007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	7yjmIFvwNYv+19qtUOG0xaq3Gu5zw4vaOLBDuRXQF1TaHHUstRCiL9aXKaywi4C4qXzC328krVvzmCWJzhWe1gRqz1G+yddWI/195VDS0+7h+Py0t8x0I0fbUQDrQzY0S7DMzWDegV8QYiLd/6/p73Fv7r61WH4kQg6wL0kg6fuEcXDJeqomONruPrTe6v9gbxbd052eBnOZjdrHEEWSvxVtefbBgCmhTURpf1IhFE67mQboR5ybVXLuNlsHytziLw+HvfaCZQN7qP4RV8oiSHrEQqrpvqioHC/8r2Rd6GhUzHpZ3dUU1Jfc9hmWMERVQ8zapL1uNLnOktJBRfO8/XO5MJdQOU9vddfUpuqNhPoOS3Mj1HTev7Xl6ZTVkENwI+thqt13vTnRBSveoBZfXYezhWYr8Ykx5IqjQowmsbeMVXGb3o8UVDpx0PZana2ItN25qIJO9c45S0nZJLabAk4xdYrCeu5446UmhbRFXCOfuw/XoHfbb5Kw7Z4MCVR9uCExKJoBvG6wCmnxnYhlFdebSNtDP2KkeJv7ukFR4WFqSvTWXS8lUj9p7x6qvKCMnnMYy3XdFWTuyeyiWix19FJEDlHG+aVdhYK17A6kbAg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(11063799006)(13003099007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XNxJ64pYCNq1t4z3BfFVigT0Vxr8QYhM5UTMrlWON8RYGrQBKDdQB3eu6U5z?=
 =?us-ascii?Q?6KMmp2I+qO8f2QBOXX9gi52nlN9w/oc9wXUlr8x8T0RwIKB0rNseeNX3VXIT?=
 =?us-ascii?Q?5iO9mewNFF/HqrTeR8nb7BCQMJob6UZ2O8L1aRfFy5r6TD3o3i1ij40ERM26?=
 =?us-ascii?Q?uygsk13bZCuCmd/RbdERg4AtcMN9i+kcSH6d6KBrfPd40JT0n3QWOyc8IKnH?=
 =?us-ascii?Q?6fR9mGwu7tcFGsmbUXsJ3N0HJSJEXDDueO5/QDfzeRYHVvHqkuTqrWZBSLll?=
 =?us-ascii?Q?vQhUdZu38HxEBgiksnAI8AjtJq/E7cVXtm9lhriCPqawSZ2ykHibmffzn2rR?=
 =?us-ascii?Q?3hS/58jOwq/+ZGTbB5Dqj24LGqARPi3KPdUR1b3ee2kt1Ro4qK3qZ1PLlwVN?=
 =?us-ascii?Q?uR7Oib8JVdBNniJlgl29iwmaSfKP9wDAmaS4mTiUgBj300fV8I4z2TCYUwd7?=
 =?us-ascii?Q?hp9aDK7a3l4iQU/w61T0+jjMdJpFeS8g64jfoj5Hl7dgLi51bIhkXcpgV1Od?=
 =?us-ascii?Q?HAH2aS8+HwxBmwuLfnFP7Jai/Ytg8H2lCplfxmzqZpDiveIAisBzIUG+0S4k?=
 =?us-ascii?Q?BPff8YwiilUI2xKbqzLuykQ5HA3cx6HPT+2MZV+XsPTvB6+Sx88OjE+TJ4OC?=
 =?us-ascii?Q?nta6NwePLd6zBN10QKVIuIfTeKzqHFnBTWyCcolndbO+D3/dhsjns2mWJ85w?=
 =?us-ascii?Q?txC5HAsPqNhlursj5K1AhWM/8MCo7y05vR0YGwdz+az8C5PhKQOUTHIgAXrj?=
 =?us-ascii?Q?NDtsl62xklvYgprxhDrJSna5y2/4ZdxSwZLBS1JQuoKyELbyed8FWKwE5W2D?=
 =?us-ascii?Q?qHsgaIubvNPJ/KBoCoXgI+Bb0u+QpBiub0awkCYoJZ8r9hbCYeN5mtF71+MD?=
 =?us-ascii?Q?8eq+oH2tmfXNAfN8hXw76OhWstmTggEhmzD1TMG6lmoyGeiXpfwHTpNXjQ7x?=
 =?us-ascii?Q?IZErCLqSkAOZw/L+MskqgnVi70H+Sf+1Qph3IifWnLWPg2rnfie7mzc5aMz2?=
 =?us-ascii?Q?LSZMYoK75mvq+eLHudSvFm2Op6LVhLgG86fZ57ymZ/22UXKLDGKqC+35BDl7?=
 =?us-ascii?Q?FTGTxGWkszUOpWUyBAIUGovTr/MYFPeYhEoXO6a+wNuc3B4lCL4uLRuIcStx?=
 =?us-ascii?Q?JpVXFZgjhTajiHcfld2D3QLtYrtg2xfv6CnDm2K6+0D6tvRgV8qki2LYqm75?=
 =?us-ascii?Q?g1dkuy9L+Pq4tHddJxh4Y6aKfkMe6nldsY4sneoNhkRWcDk6gR/91E3nKChd?=
 =?us-ascii?Q?F3a8slSlo7DMnPevYYFoZH0WEgjQD7i5SXo1gSTGIU9jFdbgy/AbTrCu6Tj0?=
 =?us-ascii?Q?ee4HgQe+IsO+mex1hGDRIk2tdG9dL7b8pIY0A/7IaXT9e6qM8+2l+XatCx/U?=
 =?us-ascii?Q?KSBoj9zHkNqtc8KY47B9C07PNKt7J+9fa1z3wD6FqFD3y8OQysUixCt/zsDe?=
 =?us-ascii?Q?5kXMTiiStMbLAOscsk8tBo6cgKzh7ZUxHRYHfrtEisrFloIK0b1cAC21G9zI?=
 =?us-ascii?Q?YR9E1IyWbFDGI2/jpzEIgSOKXmNBqDmwtP5oKxFADFiDoKMqVPczahDq2iaZ?=
 =?us-ascii?Q?lZLztKWFuZn7uiUU3vSMPvitBSGVe0JyigYU/8OwyTKnWJprUqYdfmBMkHyg?=
 =?us-ascii?Q?zwBivR8GBABB9bouKl58KjL/2OiwnW6GtIr+bP9Y+SuwRRM1Y2X8KxLqmrQM?=
 =?us-ascii?Q?XUWrfK0jMCHYSzjLgWLuiGL9VL2dc2OpzHIaaxtQrjbD0XZsX83KL7kLeXOE?=
 =?us-ascii?Q?i25HWlrU7w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fae58d5b-3237-4d9e-f375-08dee7caba64
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:25:03.0491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftvGteesDr1fDF8Wm4OqglEg8aLcTCNtkeEvoq0ko6l3qWptWC8zzpRkWPUuwe/+csLj43mFqLlgAa7qXEvqPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2420
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241625

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
 meta/recipes-extended/wget/wget_1.21.4.bb     |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58472.patch b/meta/re=
cipes-extended/wget/wget/CVE-2026-58472.patch
new file mode 100644
index 0000000000..96d01e735e
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58472.patch
@@ -0,0 +1,73 @@
+From 132786a69d88d8afd376fa2d0193b47a54396533 Mon Sep 17 00:00:00 2001
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
+index b934d49b..51636340 100644
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
+@@ -1169,21 +1170,37 @@ html_quote_string (const char *s)
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
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-exten=
ded/wget/wget_1.21.4.bb
index 6f6d02bf84..24594b3093 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -5,6 +5,7 @@ SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469.patch \
            file://CVE-2026-58470.patch \
            file://CVE-2026-58471.patch \
+           file://CVE-2026-58472.patch \
           "
=20
 SRC_URI[sha256sum] =3D "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51=
df27525bcde04c"
--=20
2.34.1


