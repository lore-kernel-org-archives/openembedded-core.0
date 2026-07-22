Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F1DC44533
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:22:12 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43231.1784708525694261694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=w/RYE+U/;
 spf=pass (domain: est.tech, ip: 52.101.65.62, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rn739IW0K8HMhcdGvpqaRrXt7hvslC76tfeSOhB7ij60mCqFV/iTVxj2DMP1BxEpyXNaGQLc6H/hwXu/IEFBBfaLKVtZJlcuXfriIrddRTxa4mgJ1kYfzOa7wijd1jaUG2K5v50HDYKc34PzXABiyBRl8/ed0zIRB6hzFoVdnWdDbfGgOAcGom9RSIItM1xnigP+2E5lM9hV80b+aAr1iYW2SjOzSoSqb+mlBURY2jCKcHVSiTZ++EOUWtaMpNFD+w0hjdzT//lfr/iS4/rUhwu2obNJuGknIbJa/JGfQ4LIyYZ1MhSTNSE5SvWODk2T55xNv6PkN0sOd50mG1KjuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Brll+F2/WPQXZ3VADSjAQm9V3ipbBWUMekgL9E8qrcQ=;
 b=us+zL5Jp3XtewTUs5Y3JFMyJuLLRDVnkIn1bX2r2wKNu8H2WMcU1kCPLwNnRwv5gtGU3RGqrjiOOScd8QIunDP4LxuXZQbfAT61r8ScNBizpQe5A22m2Pdcdxr5J8q2lXd6OvU5rwt+29+v0U9wjvs9gTCH31DWUVS17qM6GkDoii1I2h7EaFOASH/YxZbFV5a0g+oPwNV0+V+YZxl1U6ntpLHjU2Pzk2N9qDBjGZq09oYl9Opp+uofOSjB0FeeLR2ou4OSDmk7j1hi3CrM/fTfPEKRx/9DLoP3eS80IbN9HCWXT/5/k+8Sz5F7rNn4J+wL1CYcYBXfFl2KmgXvhZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Brll+F2/WPQXZ3VADSjAQm9V3ipbBWUMekgL9E8qrcQ=;
 b=w/RYE+U/6buClnx8Sslmq7CxlDnW0kqBNtZOOKjY8agGDqCLyTd8W4WAuLWtkKzoQ3a7U6qnyWBSai4S0mQxCE4rVnl0QJhfW5swJ/oiQqwxAT0Z1/eXuSTNqcjw2DBo8AqE0EUrNQWtxRWmcHQXbRPTUU9FzBPBgGtXrXvt+xQLnBhTJ/FTXtDDRtsOzc3r8eH+bJRDPH3fEpqpU19vfghoID9OzUdghZXIlR/Y6bZeydYDgXtGODQ+7PfwLWhVxtATVCsVmTywtSYn6KlLms15fdgFgpVIscxaCejnx0SiuG/0osNZOHviQuVY2lvIauymKHkXHBmXq894jJw1Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by GV4P189MB3630.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 08:22:03 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:22:03 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 4/5] wget: fix CVE-2026-58472
Date: Wed, 22 Jul 2026 10:21:47 +0200
Message-ID: <20260722082157.15257-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P191CA0023.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::14) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|GV4P189MB3630:EE_
X-MS-Office365-Filtering-Correlation-Id: 8692ed71-0f2b-4c2c-8c43-08dee7ca4f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|13003099007|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	oDSTAsvblZn1u42YPI6qjDoOY+AdMvUXo3ihr8JcbY+igj3xGOP2QLd33HNwYs8HtI4MdgGlgTgBzMoOObbMKwj/lI7nT/J3uixvfost0W9cAEW3y8ftNSl64kMQKTTH6SbXdhJFGVKJKMc7S5EDuRtJ6dEItvAqTgI5H8liirpLJIB4XMApD03kQbBPAFSNTEhnQD8CM7AuYewmulLtvRu3nSj2rrx/SKtNCpDQfpAssYAlkdKX3+sgczFiG4jpTCaau3emgl4H8fB+ae1j5dqFbqpJkI+nfJCOcTnsczXhjak4ekC5zZeWu48MqvBybqHLB3AlsO9d+t1czvoICvbritS3bJADDmxfbQdccvca89zr4lEYE7gAfwffUTrdN9z/m2vuwXkNX/wEZQoVpNtbQahF9Nx2V149jw9rSHQaIu09kDFTjN8L2ZqFCAyEuK3JTCVkYS2aI30Mk/xdzHWTGuO7eAiJG+yxs+66WhCZR2CmZGCkzMRJ28rT30qMH7r1inPVIVU4NYude2gY8G2Fj8/T2bijmkXERkb1NYt6bhWWFpIdhv2xyp7CXfkCxir4W/HEYhRLEL5qsl2zw1uF/oYmLilZ72cRMKWGZUo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(13003099007)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rEWRDfGEytlAUzZlS1rmB/nwnxHi5FTBLyBgMRtBUaXKc1O7Brx32VhwGoSx?=
 =?us-ascii?Q?n8NLZTVZs057YYOu3ad4/YjQCn64NEkq2IVwA3zzC9taoJk0D7FbT1e0Y3fA?=
 =?us-ascii?Q?gJoelftAj/pQENC3t/GXv6VEXrD13TrNVg1Ow1vDhrHKlewh8V2NpvNVDQQQ?=
 =?us-ascii?Q?MKlf1SNzWyiasQ7hN2ZK/N9Xs0imjlDJGvk207gYDfuEX0cVhPusTk/nJSFT?=
 =?us-ascii?Q?1PYe3YKIfLfjAbPrngR5YJnbpYO1E7nXUnwnsHv03fmtHoCV+tkc7FbxvFu0?=
 =?us-ascii?Q?zVtbtKKf6l3r3R5rgLdyLwXOUl/pF0MuVL/1nRjWZWBPheBUhLcP8zQzhudd?=
 =?us-ascii?Q?AnC0aznhcU527hsEO+pupR6BcQehEc8RDQvnDKEbRB5mdqunXQ6aRE0VB0Vf?=
 =?us-ascii?Q?zGJnoa1AUdozZ3rFEyj2z+m/qUOWi83jKB2SqqDe4htXTweMABojiy/xZH+P?=
 =?us-ascii?Q?A6GjMha0jCsYV4m2zAZ7WGyjFaXf/tkbUcmZIY6OmUWpC9ha63Q2vpwmmUwg?=
 =?us-ascii?Q?eEj0bACKyAKb3PHscPKvUGmXyd3uF4StTFRdIWuQ4NFMd+QQyLTICd9SQD5k?=
 =?us-ascii?Q?eEhiTGmW98XEFvK3HZB+5+zhQnvLFK0f/q4okOwUQszTiKfuezYaq855lLxh?=
 =?us-ascii?Q?iyNp1YHMiXxgRfsWArPTagZ+xSNFRSqJTk7A+gEo7Ms7y/yVJSga6qZlocC9?=
 =?us-ascii?Q?X+SWvrREa7xtg2pnlGlrct7saz/Nl/X1CyvVayZdTKy1xQOpOtNULYc+SYM3?=
 =?us-ascii?Q?/WKEI+3KGkxBYxVan8fqfc4AmXmxwl4pC6kjt6RIHpwraEzoOwbRGO6bY25C?=
 =?us-ascii?Q?2CzVohKOCIDnu5RpgTwTmLwdDXQ1V2Vr5O7hAsQmgWPQUCyvjqwvhobdvVd6?=
 =?us-ascii?Q?kUIBbs6XxQCDesMn89Xqw4LxUTq5JHnIuwD+s+4eJ1xCOSKWMcBqT6hISYW0?=
 =?us-ascii?Q?Euoc/4FTSBKhW+UFlHrgotly3P7dBiatc8cgQ71H1fEIhyNGq4decvGZQbKZ?=
 =?us-ascii?Q?as5WsrFPFMGTk77auyAdQhhHu7I14kkQOpJ+63CIqYsh1+H95Ptccwuysb1f?=
 =?us-ascii?Q?7h4heM6LWVMYAGqfcyWZnHM5DrpXlLhSFT/OTx34s5pUMgmwp7wmRWXyJe2A?=
 =?us-ascii?Q?WUp0XWQzeg6SAFXmuzhzbjS8GOsWu/KB7SA3Acd5KtKOw+8oya/822nPwrwy?=
 =?us-ascii?Q?qCPS1iXmH0RYSC3sdRqvJp8apakWeIy+jF1yGQMnAJSaW3iULc5qVCAllMMa?=
 =?us-ascii?Q?ZE/M6B25la2gd9qEdfCBCTyk+OSEpivSkkyA839XDUfeHEWZbBnfVtcEq/X2?=
 =?us-ascii?Q?+/ST6xVf/wzTudpGYDK+rZ9yq0qXSJ4X/s8Iz01ZjjpkZmGhD8VVtzznUMfw?=
 =?us-ascii?Q?QyIPFqU3LeJbVG4P+JxyGFlHXcKEVUWtRDIxH/XdG8DZd7Z8TDHsTy9/HXKy?=
 =?us-ascii?Q?ZibEdwTij7+aV79QkUz+VUyLg/PHtw4sG1B6yuGKd+/wsNLW+6WJoQzAflgY?=
 =?us-ascii?Q?Zdd71uzWGE1/z8ydhHt/dYqnZPmWKi1ColYJ/QG5zg5PYgT1m2Hvt2zFj4KZ?=
 =?us-ascii?Q?Tlxmdt6Vq9Q7UM9f68x/aSpq0Y0UriqwZvYCqxBcsJ34th9rGA6JxUYbnFCx?=
 =?us-ascii?Q?huDt7d+FCkoG33mumS8v9TBqOYKdN2KzZBFncIR9heuN2E5wn2UPveM5ljf+?=
 =?us-ascii?Q?ZEk10o/PhN/juOZiQGfXFvSnLvcX5l4Y83S4xv/CY8no7EeuxqzAnemp1XJp?=
 =?us-ascii?Q?0ECJe7gVaA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8692ed71-0f2b-4c2c-8c43-08dee7ca4f2a
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:22:03.1443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ycot9LBVCLg4sh510wBDHYJym3S0CZxNwousOdqG+IJ3LDh/IPn+n1lLysPF1bqcDBhuko8AR4ZN4hhVlZODGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3630
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241618

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


