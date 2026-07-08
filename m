Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9FBC44503
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 18:56:03 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16005.1783536954216289942
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 11:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ju/Z1FLW;
 spf=pass (domain: est.tech, ip: 52.101.83.29, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9jZuN91PbynQm6RAY2Cxt13wfl21vXj8lH2/KC/8bU3QqAjWjwIO51OgmmH3O5HW0jElJA2OowbAzXNC31gPb5MKkyxeJ7RXaHX7V4kWqyZ1x2vkD54zyO5iHuDHtNio5X5BbLorgu44/YDrHabwZTy7l4BKMEzh2bcvJW1Yy719lCELypqrRdMM6RuFchEMc1VSyGo2zOFTedScRKDYVvjQg7RgcrB0SFlHKIkCirpSQO4IOP6yl7xHzrI0rOftoBt1EcplwdxdtR+VuTLwERtEB79rqncNoRezZm48G6trk4aVzv51OA3rpy1i2Y8FBX/5ArQILTAaGQkryL8LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UH5NPnV9DfWKwu3ewFC1O+qT9qr7H3Ru2iLy5o1omRA=;
 b=sRMSoF4qUbrx/psFog6s+AvLax1pIBa3o4DK91nXdgxZkb+bkP+OftCprAGZT3aiVAdP0S0gUfy/4p8kiErI+NSWoAWM/tf5+fg+NHtW8ilpn2ntBRB7NUcPxBmOo71FAjwsVopyJTjN22GFxhxMEIOGzTNfLOYh1pcYcmSVWhpuIuAq+e0nonpNCQuOtu3Sr3ew27sEX5Uo3+x+ql3AYY4KI77rAV598kci/u8pwaTHSTyS8O/DXt9SS/OVYFIdgEk6BQldKY3X+xf4vQbl7DEDBFEUxeUkUPmRAWzu9/aO4n1jEJUGox807FQnXHpN0sUs+IYsi2pfgRIlA9dKyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UH5NPnV9DfWKwu3ewFC1O+qT9qr7H3Ru2iLy5o1omRA=;
 b=ju/Z1FLWm8ZQEYYq+thF9CZdrKn1+yXMPRDiSnDvAAlKaTqAPbrHVB8nkC+eU7dmyRnjpjOOIfS/M0Ldvk+tHYQXhpY/LGNc3kygcbfMZ/YbrX2SA4zU2xSqk1PukElrY+eAy2mGZ9TptnI3eVjh4V6RzB8eJZDODbBL2PAK8Hwpx7VhRvzmNgbxToeDI/o/hnsAnlQ8ctyCm+5+YkCG2WE/cZhJ968pnMNje22kVkWUuVSO+GDFV8sdSWzKIuTRom7O1An7A2r3tJjVm1D2Gx0XmE+GlJbtE6yom+/jLdE1rbGOSPy7k8q3RucnaRq9THMM5qtgSBroHO+NaVvKgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:263::18)
 by PAWP189MB2548.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:35b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 18:55:50 +0000
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96]) by GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96%3]) with mapi id 15.21.0181.010; Wed, 8 Jul 2026
 18:55:50 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH v2] gzip: fix CVE-2026-41992
Date: Wed,  8 Jul 2026 20:55:44 +0200
Message-ID: <20260708185544.91735-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260707143421.34255-2-jaipaul.cheernam@est.tech>
References: <20260707143421.34255-2-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0244.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::15) To GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:263::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1P189MB2954:EE_|PAWP189MB2548:EE_
X-MS-Office365-Filtering-Correlation-Id: 05fd2c05-f511-4f8a-4d05-08dedd228763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|23010399003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	C+GyG1pkQ/Jtz02rbpaCvs5b6LybZXOhAjkM2zw2+w/NUPbv8najXpCs3Q83FX4JYRqT9Qdz3veBjq7ObGSBM1wl+SwEAPn1bdKlk7elBylQFwwC0JMMn7iT8Q3zwXmEW/UY6aT4BYxqqinE7lNF6ABUMwTGUt4pqxIPM6mVAgPWm5g8hyZNqwzFsr53TKtaES2jj5mkQk8CCPZmByaYv8SW301NPF9tRzq23pmt4WKH9X40NPiVpLj0RJ+SGB9CCu+5nMrb3trafD0M5qvycDTy+ejYhhQ0SSIfM/7Nvb3B7fz8e708DlEMIqAT4mKY5/6xiLXGkLQAY1xVTjijbzk8vdeRZLQQU/h85IWwoXZhFnDo+iq0r60X0dT1VE5ncaVYFeXe0/3NF3/tdl3NYuxkJMfh644JGID6IZX//Nw5bTlOJy744gTCdk9NDWzqtXE/lxdMAtlvrOlXazWb+tyBtejd0xaFo26sDA9MqZ/mKgg5FP02pJr1lC/WxQc0jycbxOOwH/ShEDTqmSJu9hBT+VwdWO3x55aaShqZ/UwxHw8cbh71HYrmHss7Ov77Uodlcyf5g08I6Xs9XOghiJ3szuNlN170MtY6zUy2JChaubvjyQoW/yRc65qfkbYFO1jkuP1gfDTK0wBKKxHgbG3MU4jb2xbsAqM3dnX2Xfw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1P189MB2954.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lFycH9yg3VF0sEde+7DFNgvSGlSPYj0Jaz/1VVa+w76gJ4dn6Hf2nBZ1hWvU?=
 =?us-ascii?Q?J0HuKbZlONO+psd8jj90YmRy58dBiRu7gs2XUcuXEHJpAUZAFMKQXBh4Yka5?=
 =?us-ascii?Q?NX9u0OBFFiEImznt8QzpSgVpKiEn0B9h8VEQSL17sR0OqNzmUEHZ6CwPtWLS?=
 =?us-ascii?Q?1T0AI4a8wszQE3qy8/M0vPiyBYIu+yawvUnqRfyOLNRCnnM3DDd6b5eKeQ+G?=
 =?us-ascii?Q?7v6Q73S8oX1Au7bNL7jdlyj1ncYIScVyonjZ5iQULjaRmlAtFSsbMohP/uLn?=
 =?us-ascii?Q?vRUwgnc7ucflxLGslKxwV4xBDL+1NZa9V5WkiI1/ZKBIG/L8C0gkPmlmz6pb?=
 =?us-ascii?Q?C0MBlmfDzYx0xvH3j9xIPL+Uf/C+IvgnfTCgebmcecnX7Q+61+FQDh1zeZD7?=
 =?us-ascii?Q?X+5yVNaucnuzFfcT4w4fTlryEnlf4M2cylD5LU0cwvoBWu7RbfbUhH326yAS?=
 =?us-ascii?Q?pitrxPtIUUri4QSxHK4jTv4GQ3EfNzvv4zBgYMiCaooxzhXs1lcU+KPJ59uK?=
 =?us-ascii?Q?nlmLY5hG+JPX6byjHf9uKqHJqkrM81S3DP8PgEXAUqGyy1A9jYMw7Vddf4al?=
 =?us-ascii?Q?dzjoAH9AJqQT4xVVwWa1Uiqw2UN8Lx5Idi4Eq2R76+yxjWO4r8uh4/oWzWSU?=
 =?us-ascii?Q?Lvui9IfnTJHNcpKnWx+tCK2nKXeJtV+mbgqaptuMMLTEDtrJggh1ZAqRSitN?=
 =?us-ascii?Q?qAvdrgWy5W/xAvNOxKXwH97SeFoFBoRVJ+cMX8bxKtfPKWodOaALQMzVr+5n?=
 =?us-ascii?Q?Py5yjm7LGe372dDt4MUo+QU14kSouQVI/f5DKrCSF2ewkghLUON/ewahIKw+?=
 =?us-ascii?Q?5McZb+fQIzx0L1qyn8lF0AYgDbIMxp0l4MlDgd1wsAXqfZM9F2QEccRqnDB7?=
 =?us-ascii?Q?AxbJM6C0SFc+/RDbkxbypsj22TOILEECqD1DAAgJ0D4q6gLrCkmWLQecj0FX?=
 =?us-ascii?Q?Ko6lBKZW3qv/IXcqDGksEJF/2IhSU7pUzykeIGdlvMAhCdsQpYsULdjvgNhk?=
 =?us-ascii?Q?ex98vRPp113D/jGP9QyGZOf37SOU9Ian6l1P55YoCQqzwlDgaBY598APuJYa?=
 =?us-ascii?Q?79Tb4vrSfglQoFQiuuGfkB/Lm7OQjz1GUL0V5iAusHpbXL5s9mGR6nQOy2ij?=
 =?us-ascii?Q?3zs/EDD9wwKxY12L3rGc646dtkyI2MDL/kGW0BWGprXziife44NQ27xG3b/Y?=
 =?us-ascii?Q?h/ZXv2O2GFLogL1RjnidhGz7AzgAb0Zux7sy5c5AVfWDsLbLWIGfubUsJcqi?=
 =?us-ascii?Q?1BkkfBar2kLd3ZKMgPxFNx4eEmUbHCmQWDj2vBK80eJlZY4T88rLgNKskEzD?=
 =?us-ascii?Q?iQWHeCxvOcJipHIny5a4yd84mmfBbkdmD1vX/ozbAI4dfu0BYNxsa4afl1dK?=
 =?us-ascii?Q?M0nmtQW2ciXDW36zXkiGFPGK3sDizMbXFfz3Jo/pZqtIVpnHZhMPqABGkVYp?=
 =?us-ascii?Q?tCmG9J7XWs39DY93qiUvxFh87PEwKsQ5gbUyGWgukUTjKULUZw4ew4XeBa/M?=
 =?us-ascii?Q?DMvwKlmuggY1fFUUgDAvXep5k3k46aiGhVrMPf5Fw6ehoUuVfe5eV1MiWrV3?=
 =?us-ascii?Q?XYQszNdLDD84Kuy4uf9hhgSW+lNq3eX+PYiyhFtHGeh5m5iq5F+l4C38QQmo?=
 =?us-ascii?Q?iIM3fNKXZGQSc0DW5BM7RtuH2EFiCOucbooL/6eYz2xBlP3X8EZSfKU2iMyX?=
 =?us-ascii?Q?Wf81z/xjPr16bm9JVuW4acMw28FFn+RH9wxzLnGd4hWFaZJUIEn5uw2wKSD0?=
 =?us-ascii?Q?E3b35st+XoRhxd612TSquYH6cn8Blj1/q2LuOBZQYilbpAw540caYV/aASwG?=
X-MS-Exchange-AntiSpam-MessageData-1: 3ZXpdYhuA6BDHRlNw9EW1wVtl2i9I9gX/Rw=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fd2c05-f511-4f8a-4d05-08dedd228763
X-MS-Exchange-CrossTenant-AuthSource: GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 18:55:50.4944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUdSpGInORSsy7a+lnPUc+Ml5pbDde29ICApeSLhDVKtWZXld9lj2845m3iWyLvN9HK39fkTTTOyI3WzMVvPznPkmqK1c5aJjZjUHZC1Fh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2548
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 18:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240509

Backport upstream fix for a global buffer overflow in the LZH
decompression logic (unlzh.c). The left[] and right[] global arrays
shared across LZW and LZH decompression routines are not reinitialized
between files processed in the same invocation, allowing an
out-of-bounds read in the LZH decoder.

Adapted for gzip 1.13:
- Refreshed NEWS and THANKS hunks to match 1.13 release context.

Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-41992
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---

Changes in v2:
- Include full upstream patch (NEWS, THANKS, unlzh.c) instead of only
  unlzh.c
- Preserve original UTF-8 encoding in Subject and commit message
- Refreshed NEWS and THANKS hunks for target gzip version
 .../gzip/gzip-1.13/CVE-2026-41992.patch       | 64 +++++++++++++++++++
 meta/recipes-extended/gzip/gzip_1.13.bb       |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41992.pat=
ch

diff --git a/meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41992.patch b/me=
ta/recipes-extended/gzip/gzip-1.13/CVE-2026-41992.patch
new file mode 100644
index 0000000000..4db9a1c1af
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41992.patch
@@ -0,0 +1,64 @@
+From 63dbf6b3b9e6e781df1a6a64e609b10e23969681 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Wed, 15 Apr 2026 12:00:17 -0700
+Subject: =3D?UTF-8?q?gzip:=3D20don=3DE2=3D80=3D99t=3D20mishandle=3D20.lzh=
=3D20after=3D20.Z?=3D
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Micha=C5=82 Majchrowicz.
+* unlzh.c (read_c_len): Clear left and right when n =3D=3D 0.
+
+CVE: CVE-2026-41992
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gzip.git=
/commit/?id=3D63dbf6b3b9e6e781df1a6a64e609b10e23969681]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ NEWS    | 4 ++++
+ THANKS  | 1 +
+ unlzh.c | 6 ++++++
+ 3 files changed, 11 insertions(+)
+
+diff --git a/NEWS b/NEWS
+index bdb7cc0..af2a08f 100644
+--- a/NEWS
++++ b/NEWS
+@@ -14,6 +14,10 @@ GNU gzip NEWS                                    -*- ou=
tline -*-
+=20
+ ** Bug fixes
+=20
++  A buffer overflow has been fixed when decompressing an .lzh file
++  after decompressing a .Z file.
++  [bug present since the beginning]
++
+   'gzip -d' no longer fails to report invalid compressed data
+   that uses a dictionary distance outside the input window.
+   [bug present since the beginning]
+diff --git a/THANKS b/THANKS
+index 4e545d9..a7d25e4 100644
+--- a/THANKS
++++ b/THANKS
+@@ -186,6 +186,7 @@ Jamie Lokier            u90jl@ecs.oxford.ac.uk
+ Richard Lloyd           R.K.Lloyd@csc.liv.ac.uk
+ David J. MacKenzie	djm@eng.umd.edu
+ John R MacMillan        john@chance.gts.org
++Micha=C5=82 Majchrowicz	mmajchrowicz@afine.com
+ Ron Male                male@eso.mc.xerox.com
+ Jakub Martisko		jamartis@redhat.com
+ Don R. Maszle           maze@bea.lbl.gov
+diff --git a/unlzh.c b/unlzh.c
+index 3320196..a6cf109 100644
+--- a/unlzh.c
++++ b/unlzh.c
+@@ -232,6 +232,12 @@ read_c_len ()
+         c =3D getbits(CBIT);
+         for (i =3D 0; i < NC; i++) c_len[i] =3D 0;
+         for (i =3D 0; i < 4096; i++) c_table[i] =3D c;
++
++        /* Needed in case LEFT and RIGHT are reused from a previous
++           LZW decompression.  It may be overkill to clear all of both
++           arrays, but nobody has had time to analyze this carefully.  */
++        memzero(left, (2 * NC - 1) * sizeof *left);
++        memzero(right, (2 * NC - 1) * sizeof *left);
+     } else {
+         i =3D 0;
+         while (i < n) {
diff --git a/meta/recipes-extended/gzip/gzip_1.13.bb b/meta/recipes-extende=
d/gzip/gzip_1.13.bb
index fd846b30a5..208220867a 100644
--- a/meta/recipes-extended/gzip/gzip_1.13.bb
+++ b/meta/recipes-extended/gzip/gzip_1.13.bb
@@ -6,6 +6,7 @@ LICENSE =3D "GPL-3.0-or-later"
=20
 SRC_URI =3D "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-41992.patch \
            "
 SRC_URI:append:class-target =3D " file://wrong-path-fix.patch"
=20
--=20
2.34.1


