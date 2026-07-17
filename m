Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F6EC4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:40:32 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12023.1784290319030120879
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 05:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ptjI9M6G;
 spf=pass (domain: est.tech, ip: 52.101.65.69, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCUsVOv8utwz9l6H7tO4cufLuWzxjPGVB6o3vY4J6X1HgZXCwfp5+OJQWPMwxTh6Mgzwu2aEkofAm/qjdWfNTiwTBZvFVucK1joEM/x79r/zk4MXMTCPnvaYhVyofgCSGMiTVFbnbT/f42hmH4zRHEz/b+6L/VGEmMC3ni9IcjYO4i1+CLAc/kTQbE2+t0oXdSv5bsNcm9M80L+JrQ+4AqG1//ZvpHJRaeDiSTyo0kW5jcokqtLfzvMPVzar4zqr5FGaTohRs/3ibweMAV2pGN7AmzJX5yGoU5ik7VH6ppY1AUongjykA8rm4J39TUp7YvsQadkL4bd2l5Ouikzh0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zpsd1uW91wqE7RqaZu93uue/VB6z3d/AQp0MYQ8YhJE=;
 b=gJhgcOBc9BqgcoobHlDfa5w7QH2HWZzSvGSX6f5C6AfiXOdb6s1xOELQ2CDCsUqw1n87Bc5m+M3nUkdfNqTPr3l3AbgWBy1k/z5mmzKwHHTZsqa0S4MtWtJYnfBVD9TgISLfOxwMyMx/esj8kVnfcY1t+chlrrK0BXWuXVn0D70foRLXi9bCkTpHf7QlL9Bz2tPxvMM6KZm07KtJzV8IFrsBJBAoijRZTQWCMwaMUTSJpPEkmVjf+P+mRmImFKeHdb83x2ltIZlMYGqndMjfFiFZIC+ORK/waurP3bqCWXydIKCfi8K2R48VfTpt31Kx0zm899JRjZpHDpyF9zRJPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zpsd1uW91wqE7RqaZu93uue/VB6z3d/AQp0MYQ8YhJE=;
 b=ptjI9M6GojiDEEpf/Ga1PKXMpcvf3KjFO3n8q1+1sf0LmpEybv89nOqTXgYyGnFHSCxPlYXsVXGrNgTLRG5g299D6sFJdvN46QIuYF9mksmT1q/13dUM9PG9LcQf65bXQebjIEw31JcRw+QWkKcFXOt1PsQJp/ijHZ03lhRhmWQDvf1RdmFrJdlrwOZKCxW9TApKipBMw/xotPX8IDn5aqIr570Vx6tkkCnry+1pIk46Gh6LG4TnFkr0xoFFu/t4DrcGya4/fHgbZN4yDIgEEnQ8pFKeTcumCisE3vBWZv+DhoRe16oUslVYEqlF+apvPSt5qrJ8NhxareXkZO3XcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DU4P189MB3498.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.4; Fri, 17 Jul
 2026 12:11:54 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0245.003; Fri, 17 Jul 2026
 12:11:54 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][wrynose][PATCH] glib-2.0: fix CVE-2026-58010
Date: Fri, 17 Jul 2026 14:11:43 +0200
Message-ID: <20260717121151.837565-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P123CA0152.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::13) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DU4P189MB3498:EE_
X-MS-Office365-Filtering-Correlation-Id: 1564352c-8ff0-4957-eb1a-08dee3fc975a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|13003099007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	J36Fb3vCWhKzailmGW6kF3RYDipSlqeWZACwiAeIGT8S28ZFRo22ZUiij000a1uGXer0/xojgN9TccFRUF70EOvRqT6YEnv/2SKy+YiZU3Xw5VvMOX53iO4zFlLNe+SN3zNVei1ZPEAUH23POeOUAEHoswjNHOaNUyeYZeP/3tDp/uS2ulRaIc8yvWPGlgCk4UYKQwX8OX+YYgLsq8Oz9cns8gGtAURuwLaLt3utDQ4jcInz5PXQTrFxnCa32z3+PWtRPeBN/S6NYieutD2hLUujbvOUL8HLTIr4uT2jTz74X4lt2GS6ffj0+cIw+T5crghFiCo5bhEa5Qw8MYD9EHnVkNMVCY3Yp6N174Qkb9Ts/HwAKA1EjHBzQOJ9FM6E4qul/0jfXU8fuO9qjyrQR7Dirur/TX1q/5YcIAffc11gFoafrD4fqWkmg4zvrJ2MH3iUl4NW2OWgGNrKw0WmbsbYq+rj1FZloPqNG+W34waMdLunF8+4yOuxgCPmgwsYDPGytTEBd7OSTpkqDMb9U+2Rtef+W4Yo+TR9UzDOqsjxO6U/XVLnhToNlA+EvWa50Q94PANXoZFjxFGADZ1LQcxkLgnx0Nh29UK1Bpgzz6pj040ATU+SQvdYYaU3BJ9W
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(13003099007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8Q7K8LvE3w5tAn3hJJ8GOooiKnEZiob8WeHNtsAyjgXSQCC9bNmFY/NPcPlp?=
 =?us-ascii?Q?xHwhgURojZlXs1jfSP5fGoeHSMgKaSgjTLpxWfO7UGL5vYO5Asw/eNqq+bjt?=
 =?us-ascii?Q?drMDJ9OmhNIW3kYCqLDiXDz5khS9fprk6mt8M4gYdOtQFVGF+JM67jEpst8E?=
 =?us-ascii?Q?qSQ398go/jCvKdP6t9HJyBjPQCdMfEarDS2ao51up8lv7Utu7CTll+3QUUtE?=
 =?us-ascii?Q?k+tJiBgzwJapyKwRw6Q9gvvdy9erYUllyUcyUYdRKrveH5Q5jNi+Kb5FUFJL?=
 =?us-ascii?Q?LCT4g0Vo473NSMyoKA4wXvRGkq3sme2w3qHS0T3SVMR6KXVjEvLNZ3IZ/kfF?=
 =?us-ascii?Q?dUldsoAM3Iv7qjnB5g9sIR4SS4BYTTwvc88lhxaUMjU3Ds2GE5LDwlQrbtUI?=
 =?us-ascii?Q?dZKnNJ34u8TDHBg3rmDuPbpyragMyCsGPBTgLbdGWu0AwcaCDV/PHDQdHpmJ?=
 =?us-ascii?Q?BXPhCOXmb1JpIZzYs02j3O+WQSX6UjIx+w9w9deWFnPrJw5UmE+7g1d7rL7k?=
 =?us-ascii?Q?gm6SmBChez0qoOS8X8jrMtdrHUZSMRJwXxqqNWixw5SYqO3odVbITA5D/WHs?=
 =?us-ascii?Q?gUB3y3fpIaLUXmCiwehV6a4b+IFSW0PEHV5WCxI/VpJe3YfSbTG8Z5u9pN+U?=
 =?us-ascii?Q?uc6xRt/c9GzvWjUoDqW+rGDVpLXw4CgQs3jR+i/xho3Ov/CgShKo2soyq5sD?=
 =?us-ascii?Q?NHA27J6jipIi4XZ60ygvRPLPvM/FMuG55N/wB0Ui2tQFYreIUGMRF8O57Vu8?=
 =?us-ascii?Q?hlvtULkvy5uq0N7eMWQ65zpfuQbQ3HOUUvFKQ2GwhAmVRcfmvWfSJKSCoof/?=
 =?us-ascii?Q?DoDd/Yqk7s+LYzuvldLB48AehOTnPMEsEZebWfQI4uGMajFaMlHizABS/MH8?=
 =?us-ascii?Q?jBt4TPf1R33EEjMX7yvzOI5nXq+Ynp+cBZB21UnIuzl6DTDjOOwvFHt19p0t?=
 =?us-ascii?Q?hwoTIEQCxLmt6s10Cd9wR1glsh1kzWVYavI2Tl8l3CRZMqeSIbWo7UqQk9gl?=
 =?us-ascii?Q?ZK75/gzRqEO+zHSeZzzakkzWBPPj0X7noZGfY+7DbmFdEOzcyDfexqIwnWmv?=
 =?us-ascii?Q?/63pKjd8GDTNddV6mjHzqegQYmtgxCcyxPYg4LjgC02OCrEL4qoHx3BzYqmW?=
 =?us-ascii?Q?WdM8ZdGgaixIqEQwdKQ+4x4oCypIxYMyUgZ+7CZ6xsEo+iSuLtnAJYFoYeZm?=
 =?us-ascii?Q?Ul+tHW7mtkaQ3mcmrQmA9FlUVYW+rt5U2lDVkr7ddXr8qN97ofPuRJ3mTc40?=
 =?us-ascii?Q?w/DD8yHxw7fawIJDjQNpiy/x9MeNrVjcNb78qQs7llnqdijcQyVnT1sD5wN5?=
 =?us-ascii?Q?2bPi2fFoc3Jh8cA9krU9aMq0Syd0qZLaeWSWntp06xX6yImMU6okUfmlmw8n?=
 =?us-ascii?Q?qlsrq2E+TE4+6VNKjuTz97ztKpM7Cr5g0hi6QTPOokBmjK6pexQGtUFpUhyD?=
 =?us-ascii?Q?tcvO8yYrEw0cgLzsUtH3ZYYgGkznsvyjy46+ssiQWTWj9odUW6tgB+hZ/ADA?=
 =?us-ascii?Q?nvpeDairst5WaMDUCsihi/7qAEOxskp17vKv3U/nD2QICzsHlMWdRN2n00Pi?=
 =?us-ascii?Q?+N53K7EprJeO6PpH5l1g3Amuecm7YBvQOOHBlmOj5OdF+H5qvk/U9zoLT45s?=
 =?us-ascii?Q?3GGhZZj2Wc5ivaCxb2p061snU/uUIEhoml6Hkfs8CsdtSQKVeWzRqZU1uszX?=
 =?us-ascii?Q?PDURAn0XFFJOu9gekBzSi2APAozmTglRH01CIIwNoLu6S57iAgSFs4iFBvEg?=
 =?us-ascii?Q?+NkBrsmGuV1oPJy2r3oOJ+fW1VpCN+g=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1564352c-8ff0-4957-eb1a-08dee3fc975a
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:11:54.4659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KundrbjRau6xyiwJD6CaLuqRuzcw4ykSbKzlOy5gosB0EPEwbhSNqkQIhAxq0MFm79meeyyPtTHuJs+RuZCRYZyXbRwk9IqBXrIBu7zvybQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB3498
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241189

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-58010.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58010
  https://security-tracker.debian.org/tracker/CVE-2026-58010
  https://osv.dev/list?q=3DCVE-2026-58010

Upstream fix:
  https://gitlab.gnome.org/GNOME/glib/-/commit/8338414f6560216efe67d3cbf549=
e32f8630252a [debian]

Tested with ptest:
Before: PASSED: 306, FAILED: 1, SKIPPED: 1
Failing cases:
  glib/gdbus-server-auth.test
After: PASSED: 306, FAILED: 1, SKIPPED: 1
Failing cases:
  glib/gdbus-server-auth.test

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../glib-2.0/files/CVE-2026-58010.patch       | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-58010.patch

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58010.patch b/meta/r=
ecipes-core/glib-2.0/files/CVE-2026-58010.patch
new file mode 100644
index 0000000000..4ad657f4c0
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58010.patch
@@ -0,0 +1,111 @@
+From bf8b806d562d0a338bebc9189c3f4b8db96871cf Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Sun, 29 Mar 2026 19:10:41 +0100
+Subject: [PATCH] gvariant: Fix an off-by-one error in an offset comparison
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This allows a single byte out-of-bounds read off the end of the
+(potentially untrusted) byte array backing a `GVariant` when it=E2=80=99s
+being checked for normal form.
+
+I can=E2=80=99t see how this could practically be exploited, but it=E2=80=
=99s certainly
+a security bug as the `GVariant` normal form checking code is supposed
+to be robust to malicious inputs.
+
+Spotted by linhlhq as #YWH-PGM9867-190, and fix and reproducer provided
+by them too, thanks. Confirmed and turned into a unit test by me.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+Fixes: #3915
+
+CVE: CVE-2026-58010
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/83=
38414f6560216efe67d3cbf549e32f8630252a]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ glib/gvariant-serialiser.c |  2 +-
+ glib/tests/gvariant.c      | 48 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 49 insertions(+), 1 deletion(-)
+
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index 1a050c40b..73f78a072 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -1250,7 +1250,7 @@ gvs_tuple_is_normal (GVariantSerialised value)
+=20
+       while (offset & alignment)
+         {
+-          if (offset > value.size || value.data[offset] !=3D '\0')
++          if (offset >=3D value.size || value.data[offset] !=3D '\0')
+             return FALSE;
+           offset++;
+         }
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index c1d66e824..04925ae41 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -5779,6 +5779,52 @@ test_normal_checking_tuple_offsets5 (void)
+   g_variant_unref (variant);
+ }
+=20
++/* This is a regression test that looping over the padding bytes in a sho=
rt
++ * (non-normal) tuple doesn=E2=80=99t overflow the input data.
++ *
++ * See https://gitlab.gnome.org/GNOME/glib/-/issues/3915 */
++static void
++test_normal_checking_tuple_offsets6 (void)
++{
++  /*
++   * Type: (ynqiuxthdsog) =E2=80=94 12 members, first member 'y' (byte) h=
as
++   * alignment 0, second 'n' (int16) has alignment 1.
++   * With 1 byte of data (0x28), after reading the first byte member,
++   * offset=3D1, alignment check for 'n' requires offset to be even,
++   * so the while loop checks value.data[1] =E2=80=94 but size is only 1.
++   *
++   * Use heap allocation via GBytes so ASan reports heap-buffer-overflow.
++   */
++  uint8_t *heap_data =3D NULL;
++  GBytes *bytes =3D NULL;
++  const GVariantType *data_type =3D G_VARIANT_TYPE ("(ynqiuxthdsog)");
++  GVariant *variant =3D NULL;
++  GVariant *normal_variant =3D NULL;
++  GVariant *expected =3D NULL;
++
++  g_test_bug ("https://gitlab.gnome.org/GNOME/glib/-/issues/3915");
++
++  heap_data =3D g_malloc (1);
++  heap_data[0] =3D 0x28;
++  bytes =3D g_bytes_new_take (heap_data, 1);
++
++  variant =3D g_variant_new_from_bytes (data_type, bytes, FALSE);
++  g_assert_nonnull (variant);
++
++  g_assert_false (g_variant_is_normal_form (variant));
++
++  normal_variant =3D g_variant_get_normal_form (variant);
++  g_assert_nonnull (normal_variant);
++
++  expected =3D g_variant_new_parsed ("(byte 0x28, int16 0, uint16 0, 0, u=
int32 0, int64 0, uint64 0, handle 0, 0.0, '', objectpath '/', signature ''=
)");
++  g_assert_cmpvariant (expected, variant);
++  g_assert_cmpvariant (expected, normal_variant);
++
++  g_variant_unref (expected);
++  g_variant_unref (normal_variant);
++  g_variant_unref (variant);
++}
++
+ /* Test that an otherwise-valid serialised GVariant is considered non-nor=
mal if
+  * its offset table entries are too wide.
+  *
+@@ -6057,6 +6103,8 @@ main (int argc, char **argv)
+                    test_normal_checking_tuple_offsets4);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets5",
+                    test_normal_checking_tuple_offsets5);
++  g_test_add_func ("/gvariant/normal-checking/tuple-offsets6",
++                   test_normal_checking_tuple_offsets6);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets/minimal-sized=
",
+                    test_normal_checking_tuple_offsets_minimal_sized);
+   g_test_add_func ("/gvariant/normal-checking/empty-object-path",
--=20
2.34.1


