Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D341CC44533
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:21:32 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43350.1784708491399541406
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=XOgDMFpW;
 spf=pass (domain: est.tech, ip: 52.101.65.58, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gk30NGuh07Fan9pOL3pybmKnWJEjAnuJv/pFy3+lhCZpIIEQyO4w5leKbaDA3DzQV6WhhcTlmcZqC0FtS/B0HM0A8IPXTB0E+HxOuoppb06EsYnqgJowkvFp/aHd3HgHOquDGgbpXPORPUGOfsXD+LmF65qzsCHw1CwTPVzZkplPZVFqXXojOcxofXGMA8Q2ycycEOYz7BMPf8JijdEVL1sg/+EPArCFT9HstSEcecJom3YYznpJFAsodtReB2uffffIwnXWlL7kg1w0Eay3Btiz7I9AZnoXkC7cjLErgItCM6WI/Cva70U3wfU+OpWse3aTjo+O4mtoCVojwBWPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlKzYR2ynq6vryFi0XcXA1JaHYU/FGcyfj5jjW414eE=;
 b=jxYKkBc6+FXD2BE5YhKJoTNtuMwoW4wy6UbyDIHwaVzvk7xOc2UW4PL8tiWMvRRx0JQmuXD+J9ozpaoLX0XiAtq8+60juGnVG0yoKFBI/DBxA+z4cD3Qce1GwPO3VxSpbbAoP8Bxu6tQMGZn4BPG38pNrrwAmFC6U/CMEWMKaQU0LFqawU37OFs5f7jaxldHgfcNZDqQREe7uVHO0HwrXGXlj2vBA3XgsdBQyoNvGuawZX1ISyN0MrLlWH2kifacJ9TRwv5KO1KBe5kwkD+n6MsKLjRDLE2o2JOGsL9ONpeRW8zkP6mUO2NBJcUjkYRMJCuQAU14bHXmDbgVyap0Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlKzYR2ynq6vryFi0XcXA1JaHYU/FGcyfj5jjW414eE=;
 b=XOgDMFpW8i/qy4HbRkG2rUNkv3aeS5OXISD6xGkTWiR8BS3EZXVpH59g14ib4y9hCeWA079wp/fvNTPhsYKYKrT7qmlBKhso2q/H9MIZyecSF3Bq70yKipZ4iZoYj5LzjS/vK3fd3q7PmF1C3fAFIJxdks/ooISqg9ljMcJor/W/DWp+foiyfndlXMFEtK/CqcGH/TmQlBS1i+MXVkqzAwM7Lr8YjeCPzvHqDob91sHyURsBAiOpWtc399j/Y71DtOnR87t2cOojSX3ICLyIUKILQlFPgpGubYYZxEcP89CYJ5CBRUPdThhEhmbfk/rk55y4DGJEn2MlKYW8ekoW3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by GV4P189MB3630.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 08:21:28 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:21:28 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 3/5] wget: fix CVE-2026-58471
Date: Wed, 22 Jul 2026 10:21:12 +0200
Message-ID: <20260722082123.15217-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0083.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::19) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|GV4P189MB3630:EE_
X-MS-Office365-Filtering-Correlation-Id: 8993323e-e003-495b-6829-08dee7ca3a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|13003099007|11063799006|10067099003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	F1J4lhWOpk1ZTDrCt3fcF7yLmgYngX4sfAhzD8Q3fLpVPPyVfBWdIh1LITIJ/g1iTnfJ5UcZsyRa+VXoSxZhNpuruDhs1Mgf8Mv/BOyMyRYVl/PB2r3mKh1UlV6Jy+N+nObqFk4EEIttAvH+5TXp7oZjatJy0Y0xKPb6riZLsxSnexXmiuov2C28lpz7burIasOkOElMk7ygatkdhC36hIX8Mj1ZEFa80qyglfNib/mBda+YztCaX6+zdOCbQH5cdcs/LRXx+SWNoL4RkS9Dt+hH2L3FxVrIezxzI1Bc54MgK+4F1zuPDGQZyAqHWkIEnDGmPSwwx6wr5ZwwdTQBRlaUBMS5ts/ItAOdwkbcb3UfdNP8pXK5XS16WUluGtlTZOIRYHJFtFV5KV1ru6Z/siWOGolOBPnysCWoig9SrDQW5AZ6ikacqJ/JhZ8q4hfslzU/FjP9iOCxxL98ynQj08OisuysjV8+3M9gu0ZV9bRQVZuSDliTk23NGdSGxyKYvh8X/rXUnBWPfkUSc5fW1HUWcPezCw/+TYbwQ7LKxu2tq9gUDQ7U1tLC109aJc720lo632kTTPujaL5H1k19b3nVZQ1EqgVKOqOhjL8w0t8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(13003099007)(11063799006)(10067099003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KAGOspx9CqWGdscvrFqQu7heh/mfsR/Jh276uIlexkj0AvLTu93/tg98wArW?=
 =?us-ascii?Q?YNv3drtMn7StB0hlX8MDQOxBRVUNdPnvbu8lf3UW6H2VbaBIzXRSu4l5m1XQ?=
 =?us-ascii?Q?1PmMqPjRJfhGOIgGMUkNPBXDeJG/QWsQGKMUBtzvdbfrQRJPtcLk0tWhj6Vn?=
 =?us-ascii?Q?y/lUcEcNjk6DqMZksj+9oyUXb3T8U/cSkJ/pNBK5hsyvrHvtYQ52Rqu3e0cT?=
 =?us-ascii?Q?qfebdlEIffSMGmtd96rJCLSbgrStMe6q2XeEbPfbaXwacAfKB05Y3d7Shjrw?=
 =?us-ascii?Q?c5m9Rik0Gx5LWxBvFBXqbvIrB47c2EAgFGNHeym30+7K83UHoVMmsWPA5TZ9?=
 =?us-ascii?Q?7u5YZEtY5FqvbqmdUkY7j7/4D3G9oO89amE8t49FdOwflX6DiH7G/PhUqriM?=
 =?us-ascii?Q?F4KHyDPEmet/m5CWn2EEDQUh5aBJz5Mcx3eTDNBpydWHE4vedgOQa+4GhgfS?=
 =?us-ascii?Q?zfhSGWdl14+iufd+t9LrugoWCbHwbes3YG0wXEe6oFSU1ZVQC4PSvbohSsXV?=
 =?us-ascii?Q?4NxdkXQHiEnVLIxRmizmJY3wEgxx3khv0SMciNHWeCunKV25O0e8/uUITB5a?=
 =?us-ascii?Q?2ttprFeo45mMyXfWFd8r3wqospnygxn2cZ2ExsCe41Z7z76cEoGPVWVEcLU+?=
 =?us-ascii?Q?Elq0YqtgXepKyb0x2406xLbUh2awvyBzw+aZPaY/PVz/w6tf1/UN+d4owb94?=
 =?us-ascii?Q?X8bwaSwBz0pI888Eop3wjYRdhNCxVk5egxIiUws09jwlIfLYnp9rDWSIyoXh?=
 =?us-ascii?Q?PlwTdykriDBDFV7AwtfV9dbKFINh5QvLTtzgRth8xLx7qM6M3cOY408uMV1l?=
 =?us-ascii?Q?yscMepvVOgFnQqez9+gRNS/2kQ8uPyNW+gq21lLnCT3ex9YC4a6Z/GAOVWlK?=
 =?us-ascii?Q?yuZzXcbrTIf5HqlxxfSwHnEcdDxWuFtDr1pon+NAs1MpUeX6DzSTSrNp2KQA?=
 =?us-ascii?Q?yyuQ2AJCBnpHtcfai0pgzv4swuHupqVXZnq8YSXxn/jNFN1lMt6h4iT64B2p?=
 =?us-ascii?Q?eoawwmDg2D+0bqzE8ZRlA1ZOkogQz/zgFbpWeoctMXAIm7zTp8H8PgM1dP7M?=
 =?us-ascii?Q?jHbaJ8SXIP54rKLyo6g5CymA6Xl7yRC/+sA6aHbZOERJW1XZuCAudp69JMTI?=
 =?us-ascii?Q?Yc4osRGAA5rEc02inf+WelgVUhWiTqftdZOg01E7hPiIe9pTAezpREI0IqrP?=
 =?us-ascii?Q?aHKcrfCaQzPRjky03igzLNJC1fV/DTRo5fk0USrxP0OkUdPb7xaAXskA7sZv?=
 =?us-ascii?Q?nigqjbamWkAkw3maiMDdMyHJUT1wn1ErBsCSbDaYSK22+cLKsePEdFD7bd9j?=
 =?us-ascii?Q?4aPaGYhLks1x9Cahr37XGtxIl/oVlAL0cSrpRe7i9mZYGYIdquAM6Ev/3ysk?=
 =?us-ascii?Q?aA+JuexXZbqMy+hTsSOuwj9vqJGOBNHNr7xSCjs2g11qgW8Zf25vS9qyKodx?=
 =?us-ascii?Q?I8lxswKdN87yxpEIop9ONhbDYnWelPStT8ZEyhXHZrqTH8kP7l3vtp0HkYRg?=
 =?us-ascii?Q?nNtY21I0V0ULTDF4Q9F0Z12KmTiS/tfpDSRfM2vc5rPB4QLPhxMD/qX3/q5H?=
 =?us-ascii?Q?wW0uI0xouFB+OGyTyyhlOkNWPUFU2I2pXRFxYZBdr8NHYL0GunuHfenh6XDd?=
 =?us-ascii?Q?UON3zYan4msMenNmWJxfuV8zob0dY2bIogsn0guE4WnT1tPmBYbAngHxxRqA?=
 =?us-ascii?Q?xeLVgmH9Kqolp0QJtxVQdJiF2/QtapArp9WrSxaiW/qXh7fqLc2+atgrhUj2?=
 =?us-ascii?Q?NJWWgDhL8g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8993323e-e003-495b-6829-08dee7ca3a76
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:21:28.4159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eskfO4x42J+j4Ce/Bo/RoKTxuT2bXpj2VphqK0nf1f7w5HhTIRpoHt0RgVUDBh80AYhR+THzdujdyG/1QXnQGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3630
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241617

From: Amaury Couderc <amaury.couderc@est.tech>

Backport patch to fix CVE-2026-58471.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58471
  https://www.cve.org/CVERecord?id=3DCVE-2026-58471
  https://security-tracker.debian.org/tracker/CVE-2026-58471
  https://osv.dev/list?q=3DCVE-2026-58471

Upstream fix:
  https://gitlab.com/gnuwget/wget/-/commit/c2640fe5171c59f87c58dc9fcb195b2d=
18b010ee [nvd]

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../wget/wget/CVE-2026-58471.patch            | 70 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58471.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58471.patch b/meta/re=
cipes-extended/wget/wget/CVE-2026-58471.patch
new file mode 100644
index 0000000000..a69dd5ca81
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58471.patch
@@ -0,0 +1,70 @@
+From 532945675f0d67677cefb04ac4293005ede61379 Mon Sep 17 00:00:00 2001
+From: Arkadi Vainbrand <arkadva8@gmail.com>
+Date: Tue, 13 Jan 2026 12:22:04 +0200
+Subject: [PATCH] Fix buffer size handling in filename conversion
+
+* src/url.c (convert_fname): Fix buffer overflow.
+
+Copyright-paperwork-exempt: Yes
+Signed-off-by: Arkadi Vainbrand <arkadva8@gmail.com>
+
+CVE: CVE-2026-58471
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/c2640f=
e5171c59f87c58dc9fcb195b2d18b010ee]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ src/url.c | 20 +++++++++++++-------
+ 1 file changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/src/url.c b/src/url.c
+index 2f27c48a..7e7a3cea 100644
+--- a/src/url.c
++++ b/src/url.c
+@@ -1603,7 +1603,7 @@ convert_fname (char *fname)
+   const char *from_encoding =3D opt.encoding_remote;
+   const char *to_encoding =3D opt.locale;
+   iconv_t cd;
+-  size_t len, done, inlen, outlen;
++  size_t len, inlen, outlen;
+   char *s;
+   const char *orig_fname;
+=20
+@@ -1625,7 +1625,6 @@ convert_fname (char *fname)
+   inlen =3D strlen (fname);
+   len =3D outlen =3D inlen * 2;
+   converted_fname =3D s =3D xmalloc (outlen + 1);
+-  done =3D 0;
+=20
+   for (;;)
+     {
+@@ -1633,7 +1632,7 @@ convert_fname (char *fname)
+       if (iconv (cd, (ICONV_CONST char **) &fname, &inlen, &s, &outlen) =
=3D=3D 0
+           && iconv (cd, NULL, NULL, &s, &outlen) =3D=3D 0)
+         {
+-          *(converted_fname + len - outlen - done) =3D '\0';
++          *s =3D '\0';
+           iconv_close (cd);
+           DEBUGP (("Converted file name '%s' (%s) -> '%s' (%s)\n",
+                    orig_fname, from_encoding, converted_fname, to_encodin=
g));
+@@ -1656,10 +1655,17 @@ convert_fname (char *fname)
+         }
+       else if (errno =3D=3D E2BIG) /* Output buffer full */
+         {
+-          done =3D len;
+-          len =3D outlen =3D done + inlen * 2;
+-          converted_fname =3D xrealloc (converted_fname, outlen + 1);
+-          s =3D converted_fname + done;
++          size_t used =3D s - converted_fname;
++          size_t newlen =3D used + inlen * 2 + 1;
++
++          /* Ensure we actually grow the buffer */
++          if (newlen <=3D len)
++            newlen =3D len * 2;
++
++          converted_fname =3D xrealloc (converted_fname, newlen + 1);
++          len =3D newlen;
++          s =3D converted_fname + used;
++          outlen =3D len - used;
+         }
+       else /* Weird, we got an unspecified error */
+         {
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-exten=
ded/wget/wget_1.25.0.bb
index 5268ed968f..8d9b983de5 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
            file://CVE-2026-58469.patch \
            file://CVE-2026-58470.patch \
+           file://CVE-2026-58471.patch \
            "
=20
 SRC_URI[sha256sum] =3D "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb=
726ac9d0da3784"
--=20
2.34.1


