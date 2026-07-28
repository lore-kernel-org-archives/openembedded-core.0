Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D06BBC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 10:44:17 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8613.1785235454301242327
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 03:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Wfb+wTZG;
 spf=pass (domain: est.tech, ip: 52.101.84.14, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIz5K1fFoMnlhNjF3p74XiALHi3Jw5IQMsQbxJpz6Lt5RA4VfA+ktpfENkKUBmWW9BXOAuS2mnjpp9kxal2ikysRcNYLn0aA4PuyNxZfuyH+mXKrxaAKsOd2nytBvpYI7WR3arRPLxJgucGttr4TXAJp/Z2/DQsiJAcbNOrpeAPuPaa+gQasS5W1/thFS7eT3qVfY8eSy/TI8h3pzxt8hULQbd2/Z+rfVWT+Ozk9enm56pbTJusGuUNHmk3DVtbbAVRJ97pOCl1CI+BLcFLA6cfZHItDLspu2RMCy3c/1mgiBaPSmpGDFy5XbvkvglRibqnjLg1L9E5MMfwaamZA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXfWJ07dvLEKpM455dx/pFovuGqsUHpIbra6+PmIVXI=;
 b=wL6n8VGpU59o9GUmNxsn7iKxTx3dR9e/j6jCYZ20yPVOSzEfeH23LisDmmVcLxljZwgCyUnpxcK/ev6mTzSOyE3CtPKnDqOK7NBHoi2FQFsmXm11f5rPxBmIdyduo3cnL9vOGoQsq5QEsD/fbpl8ChfXiRuOp5MI6HiAu4GUKpdhVIWBm67NOeAHFtpj/7vNyzejQGm4ZvO//Ifq7tx1xVNAsRK2xOr7DxB1GxyxjNBuSx47fnRvozqr+hylBLKc0vpQh9h1EuO+e1cbX6Ms4NrsIk5bgL6FoTPsCiFPSuDUU5RmvVx7AXUPeOoERhvBF8S7QnY1oR6dfpNmN6vlxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXfWJ07dvLEKpM455dx/pFovuGqsUHpIbra6+PmIVXI=;
 b=Wfb+wTZGDgfMREBgJaAbwyke1zD805cBrn7Oo/0JFFBldHhCxA710BaUhpj+w/fFRneAwCP74eCR1RqQEStI4oarbUabFr3gKVBmwzkHiHLbFniyy1ZDuiGT5fFrww95Le05R4DO6jTV4Cj8iAYWz6B/x7WWqge/Mq8YD71wPzSBik61uSgEsNlWyo9ki46xzzT4NhlpoG/tfPhqUxdNwoWz36gVsCdHARXCcPxOedufalX5vysG9boA9osTE4eMsH2sYbBLEBDZ/q3IFgGmPQd0h11YPj+wT29NzyH8UwDKf3I8FbIwn+kpbiowQtL0VU+g5AmjgDxhmX16uXTx6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by AS8P189MB2246.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:570::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 10:44:10 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%6]) with mapi id 15.21.0270.006; Tue, 28 Jul 2026
 10:44:10 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] wget: fix CVE-2026-58469
Date: Tue, 28 Jul 2026 12:43:52 +0200
Message-ID: <20260728104404.27508-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0121.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::11) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|AS8P189MB2246:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a4e67c-ba7c-4057-bb72-08deec952819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|10067099003|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	JkvDdzQ5ACsFAlorp1uBytZipfO+H1+1bJMUwCdA1jeAApmxA6uh7N4WHzPeXIKtWKKwNgPZsHEt3tMzoee+/kz/cX+/qwQAoY/JAIhVa9LS5xso5HSUqOdnuBwIVotjAKd2yxJIW17cI7Dd0xzBVcw1PRSDdmnHXbNMqrbuJBmMLS9VWeRCkEsnwy3zJpF2KHFaTLyjVqTAzfjZ4pGAL7ZHYv0HLuN5HbvodSiWvFnTv6AOHnBNX6UrwVyg+HAPG2G6zq8609YLbVIFlZppw0NMRpndltltW5Ev/4JWsT4WcW0q+W2L/iQOHw18HudOX3eqydnu7d3tF0qltJA/Kjv/QsGo36T0oveoWTTUozOOxmTsuo/LSv/uLY7OvnxtUTDvcrrQZdNcEB4uNYay2M+VJs887Ml3QxbRw4LfITgClbybF+GQTCn77C6u74tjXTM/cojZ+/E86pwcytvd6wlrjSgpRo/LekpfFpWA4ocbBmqToD24L9EAr0HcW0Cyc0cXdYROUVex2RDhB/IsddG80kmWxA2tSVyKkSWH/CjHP3w/K2tSjIynJta4esaFTKUBuKhbdajUt+5i6JHkBhP7H87fcHIbcwHxqxlsHuMx/H1fNFFXbHJn122Kgkun
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(10067099003)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w4TeiqeErbq2wt5ItQV5awisyVCM0/7TjidExwYYm+SvJ/AuS/Nk3ORN3O7z?=
 =?us-ascii?Q?kfaBGoFAU/rQFXNtnePBo3tO8PVNeI7jnuEm6kxBN7x+xPOFKT/jeEdzPb2x?=
 =?us-ascii?Q?YlF0den/0J4C+PjHQbic4r9/FeI41hJjnwMxXrG7NZRKaGb2fyRKoGGsAPED?=
 =?us-ascii?Q?vwjkP54Byub/3DPb1Xh5jXrO4nexGTYUWVdLgbJc/kieNNWPs2bBZOch2ZwC?=
 =?us-ascii?Q?11LzbLgUR7zy7PC3vAUVB+sPbE4fdtU2TD/BnSyMQa5hGrxcutcGSkP6ybhB?=
 =?us-ascii?Q?sxaoA3x9URnqK9e60uFfRuIXlpqUsIpExe9ARz2+segJKKCImQjDHeUFgTvd?=
 =?us-ascii?Q?kbT7BePNot6/87t+59P9xIlqhIj/DCOZHbBoZx3NKW+32MrJX2tf08XNyyq6?=
 =?us-ascii?Q?d+nfbdH5nilg9ztdPqUvH02Y5JtLvNikbekOZLtNFVsA1LLaga+xXX5d/G0H?=
 =?us-ascii?Q?ylcabeOeEvZTtVlx5nOdmsy7IfKhql+89KMyCTg68eHkeLKehpDFD4EeVrTq?=
 =?us-ascii?Q?+PGdZoaQhZzAIq5d/oCfQPd0hQ7pQa6N+MIsBjUXv0TBEok+77dgfviuKDm4?=
 =?us-ascii?Q?DjL13MmskPa2pmjQ2OHUiK/WDpDra5MKi0XPllCkJH2FEX8+fGRt4vYdq4rj?=
 =?us-ascii?Q?8dEGx7bFgLsSEKyZNizHYvdOKUv7ILxenQM7wqgUFupkhzVUf1S+xoWOpf5B?=
 =?us-ascii?Q?9P295WhIJqQWkX9xYY2PEr6WN1tpWmTkiKccww7sgbZww344FPFMvAuxrZkQ?=
 =?us-ascii?Q?VagFsMsufzU9D+yCkaNMgzrdEM1On+8eJ2gDP2yc83+bh6Tsjbv6PSeOWreD?=
 =?us-ascii?Q?Xyi686uhhUbeD1wiBZF7E1L4cYH+VvLquk2CP+QjvnoYGJeJaLo9i30yiAsn?=
 =?us-ascii?Q?VVIB+2u9tv9Z+/lg4wXvJDRHp03tuY4gTZnRNBYExrFvwzpeKPrhPk0KyNvs?=
 =?us-ascii?Q?VaqJT1t3hEj3XMBlUlGuiNcuopf4ZYYn5TxBE4t6FdZ1nhaMfkn8i6Ta23SS?=
 =?us-ascii?Q?n/EefrnHlB/B2vJ0jEhhbSIZLsEDzs7SSMGcBtgaYwPEGA4DIzQDwiDKRSkj?=
 =?us-ascii?Q?AjXz/8SJRlt74UpXs3Rljxi24aZp/hLb3RRgObpLoEOJPXTYpB86xnR3VxaP?=
 =?us-ascii?Q?q6AL9DqXNCPmw2krn4FCA+PIk1h8qY8id7qDTTvw4fdhspTEYoK3erFi1/Jk?=
 =?us-ascii?Q?Gf6+mHMZvQ5sdRLKLm+vdXpN3O9Yh2lq1nviDTxjNaFmnL3+D8mskw3OFN7Q?=
 =?us-ascii?Q?DjSJAfxvaMezUQrGWyBr735kO6qg7X8id8hYJ7acthPksZLOVEQ9cEGE44KT?=
 =?us-ascii?Q?GYuCepsxCJc90z2rFt5ctuHM+pT7ZGQq6h9NrOnjI5ri3dvO1votQlCh+Us0?=
 =?us-ascii?Q?0L9h59/I7GFknevXFWUCXWiGQ+6De1JWRsPw0UJK07h8e9/g89IfmBHbeDET?=
 =?us-ascii?Q?u8QpRzIu4wJx5dQqKbhD6UATGb0kwn+/yJrnOfsbnTGjLHaqMkoHNlJ08Bc0?=
 =?us-ascii?Q?Do/RldzI9dyZH9h7yx+Ts8UjAATBM5g7Mg5mBKnVLC2C1ajJHMwYjW4yKcIi?=
 =?us-ascii?Q?MguEozu3xn+UiJhBGfvMjeCIjXK3WMbZWHBRMLC1MyOUTWD/A9uxOYBK4dDk?=
 =?us-ascii?Q?Vf2QoCgiGcxHSZarIYPx83BBCgMSqZmI4ACFncLrBd47EoCffshaFkhPOOsH?=
 =?us-ascii?Q?17fgbXAE6dnezdGp9yEQWvJa6eqWhAyWV+Oq3S/yUePv3kbWonb6reRCjd9+?=
 =?us-ascii?Q?nqU0PUZamQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a4e67c-ba7c-4057-bb72-08deec952819
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 10:44:10.1352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFyFPOqqEBe0FRDWOO4l9Er36rBTx2VwBTK62eYWPkTLWdNi2JMdPHz6Hm6GRlYvv5VSbYVvffOb1XtkUH8bDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2246
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 10:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242181

From: Amaury Couderc <amaury.couderc@est.tech>

Backport patch to fix CVE-2026-58469.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58469
  https://www.cve.org/CVERecord?id=3DCVE-2026-58469
  https://security-tracker.debian.org/tracker/CVE-2026-58469
  https://ubuntu.com/security/CVE-2026-58469
  https://osv.dev/list?q=3DCVE-2026-58469

Upstream fix:
  https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7a4fb=
0b6f7826 [nvd]
  https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8a0038=
6c3f3bcf
  https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aac298c=
24fe00a1

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../wget/CVE-2026-58469-regression_p1.patch   | 41 +++++++++++++++
 .../wget/CVE-2026-58469-regression_p2.patch   | 28 ++++++++++
 .../wget/wget/CVE-2026-58469.patch            | 52 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  3 ++
 4 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469-regressi=
on_p1.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469-regressi=
on_p2.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.p=
atch b/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch
new file mode 100644
index 0000000000..637c92e221
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch
@@ -0,0 +1,41 @@
+From 7b1cdecc49bc77bde220fc575c8a00386c3f3bcf Mon Sep 17 00:00:00 2001
+From: ChenYanpan <chenyanpan@xfusion.com>
+Date: Wed, 8 Jul 2026 12:09:55 +0800
+Subject: [PATCH] * src/metalink.c (clean_metalink_string): Fix inverted
+ trailing-space check
+
+37a40fcb added an `end > beg' bound guard to prevent a buffer
+underflow, but accidentally flipped the condition from `isspace' to
+`!isspace'. The loop therefore walked back over non-space characters
+instead of trailing whitespace, collapsing any string without a
+trailing newline to "". Every Metalink/HTTP resource URL was wiped,
+so wget could not follow any mirror and
+testenv/Test-metalink-http.py failed ("Expected file test.meta not
+found"). Restore the `isspace' condition.
+
+Copyright-paperwork-exempt: Yes
+
+CVE: CVE-2026-58469
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/7b1cde=
cc49bc77bde220fc575c8a00386c3f3bcf]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ src/metalink.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/metalink.c b/src/metalink.c
+index 3acdc3a2..3794909f 100644
+--- a/src/metalink.c
++++ b/src/metalink.c
+@@ -1061,7 +1061,7 @@ clean_metalink_string (char **str)
+   /* If we are at the end of the string, search the first legit
+      character going backward.  */
+   if (*end =3D=3D '\0')
+-    while (end > beg && !isspace(*(end - 1)))
++    while (end > beg && isspace(*(end - 1)))
+       end--;
+=20
+   new =3D xmemdup0 (beg, end - beg);
+--=20
+GitLab
+
diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p2.p=
atch b/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p2.patch
new file mode 100644
index 0000000000..d082089a11
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p2.patch
@@ -0,0 +1,28 @@
+From 82d945ff5dc9942b78b2bf736aac298c24fe00a1 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Tim=3D20R=3DC3=3DBChsen?=3D <tim.ruehsen@gmx.de>
+Date: Thu, 9 Jul 2026 14:50:40 +0200
+Subject: [PATCH] * src/metalink.c: Include ctype.h
+
+CVE: CVE-2026-58469
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/82d945=
ff5dc9942b78b2bf736aac298c24fe00a1]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ src/metalink.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/metalink.c b/src/metalink.c
+index 3794909f..954546d2 100644
+--- a/src/metalink.c
++++ b/src/metalink.c
+@@ -46,6 +46,7 @@ as that of the covered work.  */
+ #include "c-strcase.h"
+ #include <errno.h>
+ #include <unistd.h> /* For unlink.  */
++#include <ctype.h>
+ #include <metalink/metalink_parser.h>
+ #ifdef HAVE_GPGME
+ #include <gpgme.h>
+--=20
+GitLab
+
diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58469.patch b/meta/re=
cipes-extended/wget/wget/CVE-2026-58469.patch
new file mode 100644
index 0000000000..c5d3df9090
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58469.patch
@@ -0,0 +1,52 @@
+From c7d858a9ca8b9840e5edc520c36fe4f33f2e9cea Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Tim=3D20R=3DC3=3DBChsen?=3D <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 18:32:02 +0200
+Subject: [PATCH] * src/metalink.c (clean_metalink_string): Fix buffer
+ underflow
+
+Reported-by: TristanInSec@gmail.com
+
+CVE: CVE-2026-58469
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/37a40f=
cb450153f69537c7cbc2a7a4fb0b6f7826]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ src/metalink.c | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/src/metalink.c b/src/metalink.c
+index de2439c9..2d6e5846 100644
+--- a/src/metalink.c
++++ b/src/metalink.c
+@@ -1041,7 +1041,6 @@ void
+ clean_metalink_string (char **str)
+ {
+   int c;
+-  size_t len;
+   char *new, *beg, *end;
+=20
+   if (!str || !*str)
+@@ -1049,7 +1048,7 @@ clean_metalink_string (char **str)
+=20
+   beg =3D *str;
+=20
+-  while ((c =3D *beg) && (c =3D=3D '\n' || c =3D=3D '\r' || c =3D=3D '\t'=
 || c =3D=3D ' '))
++  while (isspace(*beg))
+     beg++;
+=20
+   end =3D beg;
+@@ -1062,12 +1061,10 @@ clean_metalink_string (char **str)
+   /* If we are at the end of the string, search the first legit
+      character going backward.  */
+   if (*end =3D=3D '\0')
+-    while ((c =3D *(end - 1)) && (c =3D=3D '\n' || c =3D=3D '\r' || c =3D=
=3D '\t' || c =3D=3D ' '))
++    while (end > beg && !isspace(*(end - 1)))
+       end--;
+=20
+-  len =3D end - beg;
+-
+-  new =3D xmemdup0 (beg, len);
++  new =3D xmemdup0 (beg, end - beg);
+   xfree (*str);
+   *str =3D new;
+ }
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-exten=
ded/wget/wget_1.25.0.bb
index f0d3458462..fb77754965 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -15,6 +15,9 @@ DEPENDS +=3D "autoconf-archive-native pod2man-native"
=20
 SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
+           file://CVE-2026-58469.patch \
+           file://CVE-2026-58469-regression_p1.patch \
+           file://CVE-2026-58469-regression_p2.patch \
            "
=20
 SRC_URI[sha256sum] =3D "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb=
726ac9d0da3784"
--=20
2.34.1


