Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB80BC4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:40:42 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12035.1784290641107125405
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 05:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=EHUxVwPV;
 spf=pass (domain: est.tech, ip: 40.107.159.27, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuDj7qKuSuSbvuC7/6tBvJsbzNpUXH4fYa8wTUl8SJSrJjJrbnf98aNF0cvNro64HU+Om9poFbDfdqkhylTKbAHF+NMn9jfBdzZV36jSt1jaSlet8G3m3gRVFyDRBGHRFnpxiFnWIcOieSZVuCsDkWPsb+eovbvOVvxAYjDA8BCR39PAJAi/4dpXeWjtqHB4vHhfP6W1LbG/esfkkW4TTZduSEz9r8F/gbvCDJwMmgdjZW6HJjWB37p/6pUwZg1X8fyCyrRNV1OLLnSdMqNlVhWjRaoboOfOCRjGAVxcbepNS7Yc8Xjp/RLvYz6egkzeAgQjBwCLl2JD9wMrTClqlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtAJCbnQ3azPW2vKX5IDzzx0hfv8UGWNaxXQ4rDG6bk=;
 b=hjJUCkqzdD3Qrx3G6qoMa3ac7uYz/+UQFpdGRbL3HVuADZy1YCsxN+a6gI+aKijM2SSqOf41FiX2vD2hNLNXrLFz24JfV3cEiCDLQhBy/TbRe1ulN6NX/XRxLWWBRKhXAlGECnw5XNUdAZQZ7rvJ/DRsjSoVIMGdpxBWmo8QHNnCg3obadSw67aZjvUbl6Dk1bzCdx53vJtdG75C1KbwqcZdX0whJHH4Lvx3PUf57zZICwAEPfY8mz4Q8trt+C1eKZx53DjYbgcVYZSRdYg0LFhP9QR5+zCdSf3p+l+5y7kCrjcZ0E9Te044geYLzMm9OgCtAmVtpl38tq941n+WTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtAJCbnQ3azPW2vKX5IDzzx0hfv8UGWNaxXQ4rDG6bk=;
 b=EHUxVwPVD5UjfMJptw2LVav0bBfsqim2PO+JJAd6vHCqjSjLxfiF71g/7P/tiNxBfQIvEOdYP8Klgpv1oZ6ZDROYkikAVqDF4x0AlEywP0vmmb+IDe33FZG95Ma8uJSyHvbHS731UJnuLU0xGYLMeWOF+PHrPCydgGYal/FrKlbtu/teY18avFi89asKoGmdg6vWfN99f4O2IJIhETOZjkkH1a2jqx3aY1pcEc63okU9085egNB+hIdB1bEJu72CAHJDQG1+HY4INqstk24nZhJDD7VG3METajEjVTWcgEawjl5lI5oNUTDStdtaQ7+TmYetLIx90lchYXOZlO62eg==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DU2P189MB2587.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:49d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.5; Fri, 17 Jul
 2026 12:17:16 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0245.003; Fri, 17 Jul 2026
 12:17:16 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] glib-2.0: fix CVE-2026-58010
Thread-Topic: [OE-core][wrynose][PATCH] glib-2.0: fix CVE-2026-58010
Thread-Index: AQHdFeV0AF6+esZi/EKnqLqBk4xNKbZxoF57
Date: Fri, 17 Jul 2026 12:17:15 +0000
Message-ID: 
 <AS8P189MB1672975DF61C72A588D2C685B3C62@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260717121151.837565-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260717121151.837565-1-adarsh.jagadish.kamini@est.tech>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|DU2P189MB2587:EE_
x-ms-office365-filtering-correlation-id: 00b78702-019e-43bc-eb09-08dee3fd5708
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|13003099007|22082099003|18002099003|38070700021|8096899003|56012099006|10067099003|11063799006;
x-microsoft-antispam-message-info: 
 Tcdq7nrMHkraYvNQFGgiV9VRtHU/m9Emq1Y+zZpA3bevEhs4ZAV/rNyBxkS9VDkImnCgYaqy3cQV3ionLD/kXS3ghh3nGkWtUslMxXSY/gFM0OZg9en+dTnhNUS9hkrWosHGGtCaTk5W/Lv2q7ySMF4KqTjLsCv0czQgh8nNwv2/3RyP/F0TeAJHdkB3+9lhlwiaSmwmx57ibiiWdn4YExn8GbUcmmb/X2bLil10RGoIZbFrNSmCgsNJUirzf+O/uAlNomjAJkcFTEWh4ldM/kpYXGS2kQKmDd6hqHB1YAo4pjpxOuKIqju3dlk23aqy3b5hnOryzXMMeEFH/qOxdj4Bxf6eRlU003IjzXzVTT0gl4AesG/JWIWSZkbOv9nx0U756YHkCh2GagIg/bop035MNUARIy3eqe4ncQbtKuOT7YMf97iYrgJWBajLNoKGmMk4XgNLPqnpP+QPzFSLu0QLwezyJ6ELwB744+cI2BKbGbv7XyWT3o5q1PNK/9zc5OHk/g5tsDdWL+PtRnVZjtqlK1/uqF6x3TSbGwlKQHi4h7uVO7JG7Up6grcmTLOY84viX5jHmCnRn+Nx1U3CZU4S03awJgmywggNiUowiC55AE3F+3z6bAmXl8eWNOtTf/c+O82UWef5qRPLkrYZxx7VRAF2SJhkTBk/VKAOpVQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(13003099007)(22082099003)(18002099003)(38070700021)(8096899003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?xAO5363r9Mc6i3WQk4g5zT8Md/oHj9t5VOL2cD6iQbdUhhJ6U5rX3UGT?=
 =?Windows-1252?Q?JPYcz8/CDHQZq9Uqxx2ETaqsYIv09aLMAh2aLYUh77+HvOUNrN/jZgM6?=
 =?Windows-1252?Q?tAVV8vdcKWikoRhL6lJV9fcsCBw+oX99C//+YfUfNwmnf7XiirzeN2vq?=
 =?Windows-1252?Q?bi93JWB64kIJSmKYMxJLVsqaUSsqmJqMOs65zqGhsQZ6eyjV63RfGaHV?=
 =?Windows-1252?Q?rA0QwUJCManvQPHIhyrTYTHJp2/1ok688TaH9ddjANuncOJIsCIVOWT2?=
 =?Windows-1252?Q?gnYSOfPJjV/Q+gFjWu57visu1bauf7T8QKuTtrS+cKRgUpXuGHJSSYIU?=
 =?Windows-1252?Q?zAWaSArDnk5fy3j38WM7aUQn2A98N0GwbXzJUHdunioM4LG+UYrsRlt/?=
 =?Windows-1252?Q?kxyTOPZ6w/61o8sGnbwm9nvuv1BkZk5646QySAi94ibJ128CsbZuzkbC?=
 =?Windows-1252?Q?c5PS+FAOAdGIr1b9Ak3vCX+h7JIdNlLyah86Cuo/erARn2Q2PA3nSBtw?=
 =?Windows-1252?Q?IhNEEvVdT8cEnnFXPbQ4QagTNsMYFA0qfmX64yfOk4R9Tmit8oQdw5n8?=
 =?Windows-1252?Q?4qi8f0Zs8qIckFtv94QAUhJIaLISfrgbv4AXFpM/XzZoQ0RA1q119Do9?=
 =?Windows-1252?Q?0Ro6P98blV8jusT007n1pNagkU4/QxYF58QrMkpO4LW4blazVYCjhQgd?=
 =?Windows-1252?Q?zjnTFVIR2dVx1Tibxq5C0G+DNXDYNkR2DnAq5U/gj68vUkopaL7qYDCq?=
 =?Windows-1252?Q?ezutsgXaruZQUxeCYHJqS+OXUXu9UY3PcG+vuyXikkq0yNw1VSgrKRL1?=
 =?Windows-1252?Q?FPI8YPBnedGsMqMwkcbzMRPHtEArNYkieQD+9LlAMYjmcTSl3Wnl69Ej?=
 =?Windows-1252?Q?uXaQDK/mRxFd2j2lNKQ7DpZrbLA/uw1XumtbbuPQhrQtD+WnaEgNAD30?=
 =?Windows-1252?Q?CrAxAgkGhCQUWZXK5DuGz1WEUzeEuiKuL6fUMatJzJuwqA87aLuLWs0s?=
 =?Windows-1252?Q?BDTie1xcYsFPEK+k4wo7Fw+ZsirrZrXrxHEt5pOU2xZiu7COm5tduPzc?=
 =?Windows-1252?Q?gIhxkbyQHfVwCKn1+Pc82hhCEjJZUG7zOyad7zO8ifCqcXhRi2eQCTdD?=
 =?Windows-1252?Q?dYwCh0nahlsTCI+3pu33mr65VXtIrtpAUQfe13BbDx7WfAcN2qyHml/e?=
 =?Windows-1252?Q?ER+6duO1vEj/h8vnqR393QBPNH4CtWTmOtuplAm7E+NHTLc+zW0aX1Bg?=
 =?Windows-1252?Q?XIz4Z4eSi23Hh7sClL+NGhGwqaycHvw522LkRu/xTE4GoRkYA2PyLLr0?=
 =?Windows-1252?Q?UeuWpMmrFkdhIFHqVFu+hjex+CxUOZPNgmp47xl03ddIoGMBIBksBg+B?=
 =?Windows-1252?Q?gdPYb2hxGYrCUPQjNBXRo3BjXMCKd+1y1am2PEPhoFaJEuaNbyR6ajYy?=
 =?Windows-1252?Q?Z7RqCZw34COaSJh3hGK/Td1WNrCQ29XHsyJz1/EL1OfozWvB1SRtBlqE?=
 =?Windows-1252?Q?0LPaOSwY/k224hQ2gQ6FLTSFfH76GKWsDTQ1rG0GDLgnte9Bgv8i+4Jp?=
 =?Windows-1252?Q?ivqoMHX2iV93bb4eBbKsfWDKyy8UzrcAQvscSt4Vj7P1QUXsqtsFyJTG?=
 =?Windows-1252?Q?JhsejlrkTlcIu27Y0nVe/P3m39RRpLm6g71PlA0wqwNeOTUBgRVmqi0V?=
 =?Windows-1252?Q?Fqlfjo9Ft5XC4sbZYTsDrbFrrw8tcCSGe9gLcYAWmp3tDd8GFmP1mdOz?=
 =?Windows-1252?Q?dMbfBVxAnnlrCMeXsjlq26ZQPmab99oWbe071sPP/1qKoS3embooJChi?=
 =?Windows-1252?Q?r76LMyVVpYtO3PEQOHQ00txzH5k0U4r4sXgQB43/4S9dBqUz7Yo5QVKw?=
 =?Windows-1252?Q?M/2PAL7ADv5DoaEIPDvFrMvNm+qZ86g4BgY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b78702-019e-43bc-eb09-08dee3fd5708
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 12:17:15.9333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i3B6pwa/TJD6LszS132yqngH81mhkIbEKWPle8D/vHIrlo7M5ZXDABteMtEzVJFFSnqPrgtqDJ/vhwOAhdnwOh5PYPa6aubdnzLtJAFIEZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P189MB2587
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8P189MB1672975DF61C72A588D2C685B3C62AS8P189MB1672EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241190

--_000_AS8P189MB1672975DF61C72A588D2C685B3C62AS8P189MB1672EURP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,
Ignore this patch, I see that this CVE patch has already been submitted.

Thanks!
________________________________
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Sent: Friday, July 17, 2026 14:11
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][wrynose][PATCH] glib-2.0: fix CVE-2026-58010

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
+(potentially untrusted) byte array backing a `GVariant` when it=92s
+being checked for normal form.
+
+I can=92t see how this could practically be exploited, but it=92s certainl=
y
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
+
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
+
++/* This is a regression test that looping over the padding bytes in a sho=
rt
++ * (non-normal) tuple doesn=92t overflow the input data.
++ *
++ * See https://gitlab.gnome.org/GNOME/glib/-/issues/3915 */
++static void
++test_normal_checking_tuple_offsets6 (void)
++{
++  /*
++   * Type: (ynqiuxthdsog) =97 12 members, first member 'y' (byte) has
++   * alignment 0, second 'n' (int16) has alignment 1.
++   * With 1 byte of data (0x28), after reading the first byte member,
++   * offset=3D1, alignment check for 'n' requires offset to be even,
++   * so the while loop checks value.data[1] =97 but size is only 1.
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
--
2.34.1


--_000_AS8P189MB1672975DF61C72A588D2C685B3C62AS8P189MB1672EURP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Ignore this patch, I see that this CVE patch has already been submitted.</d=
iv>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Adarsh Jagadish Kamin=
i &lt;adarsh.jagadish.kamini@est.tech&gt;<br>
<b>Sent:</b> Friday, July 17, 2026 14:11<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<b=
r>
<b>Subject:</b> [OE-core][wrynose][PATCH] glib-2.0: fix CVE-2026-58010</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.k=
amini@est.tech&gt;<br>
<br>
Backport patch to fix CVE-2026-58010.<br>
<br>
References:<br>
&nbsp; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-58010">https://=
nvd.nist.gov/vuln/detail/CVE-2026-58010</a><br>
&nbsp; <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-5801=
0">https://security-tracker.debian.org/tracker/CVE-2026-58010</a><br>
&nbsp; <a href=3D"https://osv.dev/list?q=3DCVE-2026-58010">https://osv.dev/=
list?q=3DCVE-2026-58010</a><br>
<br>
Upstream fix:<br>
&nbsp; <a href=3D"https://gitlab.gnome.org/GNOME/glib/-/commit/8338414f6560=
216efe67d3cbf549e32f8630252a">
https://gitlab.gnome.org/GNOME/glib/-/commit/8338414f6560216efe67d3cbf549e3=
2f8630252a</a> [debian]<br>
<br>
Tested with ptest:<br>
Before: PASSED: 306, FAILED: 1, SKIPPED: 1<br>
Failing cases:<br>
&nbsp; glib/gdbus-server-auth.test<br>
After: PASSED: 306, FAILED: 1, SKIPPED: 1<br>
Failing cases:<br>
&nbsp; glib/gdbus-server-auth.test<br>
<br>
Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&g=
t;<br>
---<br>
&nbsp;.../glib-2.0/files/CVE-2026-58010.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 111 ++++++++++++++++++<br>
&nbsp;1 file changed, 111 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-58010.pa=
tch<br>
<br>
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58010.patch b/meta/r=
ecipes-core/glib-2.0/files/CVE-2026-58010.patch<br>
new file mode 100644<br>
index 0000000000..4ad657f4c0<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58010.patch<br>
@@ -0,0 +1,111 @@<br>
+From bf8b806d562d0a338bebc9189c3f4b8db96871cf Mon Sep 17 00:00:00 2001<br>
+From: Philip Withnall &lt;pwithnall@gnome.org&gt;<br>
+Date: Sun, 29 Mar 2026 19:10:41 +0100<br>
+Subject: [PATCH] gvariant: Fix an off-by-one error in an offset comparison=
<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+This allows a single byte out-of-bounds read off the end of the<br>
+(potentially untrusted) byte array backing a `GVariant` when it=92s<br>
+being checked for normal form.<br>
+<br>
+I can=92t see how this could practically be exploited, but it=92s certainl=
y<br>
+a security bug as the `GVariant` normal form checking code is supposed<br>
+to be robust to malicious inputs.<br>
+<br>
+Spotted by linhlhq as #YWH-PGM9867-190, and fix and reproducer provided<br=
>
+by them too, thanks. Confirmed and turned into a unit test by me.<br>
+<br>
+Signed-off-by: Philip Withnall &lt;pwithnall@gnome.org&gt;<br>
+<br>
+Fixes: #3915<br>
+<br>
+CVE: CVE-2026-58010<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/glib/=
-/commit/8338414f6560216efe67d3cbf549e32f8630252a">https://gitlab.gnome.org=
/GNOME/glib/-/commit/8338414f6560216efe67d3cbf549e32f8630252a</a>]<br>
+<br>
+Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&=
gt;<br>
+---<br>
+ glib/gvariant-serialiser.c |&nbsp; 2 +-<br>
+ glib/tests/gvariant.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 48 ++++++++++++++++=
++++++++++++++++++++++<br>
+ 2 files changed, 49 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c<br>
+index 1a050c40b..73f78a072 100644<br>
+--- a/glib/gvariant-serialiser.c<br>
++++ b/glib/gvariant-serialiser.c<br>
+@@ -1250,7 +1250,7 @@ gvs_tuple_is_normal (GVariantSerialised value)<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (offset &amp; alignment)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (offset &gt; va=
lue.size || value.data[offset] !=3D '\0')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (offset &gt;=3D=
 value.size || value.data[offset] !=3D '\0')<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c<br>
+index c1d66e824..04925ae41 100644<br>
+--- a/glib/tests/gvariant.c<br>
++++ b/glib/tests/gvariant.c<br>
+@@ -5779,6 +5779,52 @@ test_normal_checking_tuple_offsets5 (void)<br>
+&nbsp;&nbsp; g_variant_unref (variant);<br>
+ }<br>
+ <br>
++/* This is a regression test that looping over the padding bytes in a sho=
rt<br>
++ * (non-normal) tuple doesn=92t overflow the input data.<br>
++ *<br>
++ * See <a href=3D"https://gitlab.gnome.org/GNOME/glib/-/issues/3915">http=
s://gitlab.gnome.org/GNOME/glib/-/issues/3915</a> */<br>
++static void<br>
++test_normal_checking_tuple_offsets6 (void)<br>
++{<br>
++&nbsp; /*<br>
++&nbsp;&nbsp; * Type: (ynqiuxthdsog) =97 12 members, first member 'y' (byt=
e) has<br>
++&nbsp;&nbsp; * alignment 0, second 'n' (int16) has alignment 1.<br>
++&nbsp;&nbsp; * With 1 byte of data (0x28), after reading the first byte m=
ember,<br>
++&nbsp;&nbsp; * offset=3D1, alignment check for 'n' requires offset to be =
even,<br>
++&nbsp;&nbsp; * so the while loop checks value.data[1] =97 but size is onl=
y 1.<br>
++&nbsp;&nbsp; *<br>
++&nbsp;&nbsp; * Use heap allocation via GBytes so ASan reports heap-buffer=
-overflow.<br>
++&nbsp;&nbsp; */<br>
++&nbsp; uint8_t *heap_data =3D NULL;<br>
++&nbsp; GBytes *bytes =3D NULL;<br>
++&nbsp; const GVariantType *data_type =3D G_VARIANT_TYPE (&quot;(ynqiuxthd=
sog)&quot;);<br>
++&nbsp; GVariant *variant =3D NULL;<br>
++&nbsp; GVariant *normal_variant =3D NULL;<br>
++&nbsp; GVariant *expected =3D NULL;<br>
++<br>
++&nbsp; g_test_bug (&quot;<a href=3D"https://gitlab.gnome.org/GNOME/glib/-=
/issues/3915">https://gitlab.gnome.org/GNOME/glib/-/issues/3915</a>&quot;);=
<br>
++<br>
++&nbsp; heap_data =3D g_malloc (1);<br>
++&nbsp; heap_data[0] =3D 0x28;<br>
++&nbsp; bytes =3D g_bytes_new_take (heap_data, 1);<br>
++<br>
++&nbsp; variant =3D g_variant_new_from_bytes (data_type, bytes, FALSE);<br=
>
++&nbsp; g_assert_nonnull (variant);<br>
++<br>
++&nbsp; g_assert_false (g_variant_is_normal_form (variant));<br>
++<br>
++&nbsp; normal_variant =3D g_variant_get_normal_form (variant);<br>
++&nbsp; g_assert_nonnull (normal_variant);<br>
++<br>
++&nbsp; expected =3D g_variant_new_parsed (&quot;(byte 0x28, int16 0, uint=
16 0, 0, uint32 0, int64 0, uint64 0, handle 0, 0.0, '', objectpath '/', si=
gnature '')&quot;);<br>
++&nbsp; g_assert_cmpvariant (expected, variant);<br>
++&nbsp; g_assert_cmpvariant (expected, normal_variant);<br>
++<br>
++&nbsp; g_variant_unref (expected);<br>
++&nbsp; g_variant_unref (normal_variant);<br>
++&nbsp; g_variant_unref (variant);<br>
++}<br>
++<br>
+ /* Test that an otherwise-valid serialised GVariant is considered non-nor=
mal if<br>
+&nbsp; * its offset table entries are too wide.<br>
+&nbsp; *<br>
+@@ -6057,6 +6103,8 @@ main (int argc, char **argv)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_normal_checking_tuple_offsets=
4);<br>
+&nbsp;&nbsp; g_test_add_func (&quot;/gvariant/normal-checking/tuple-offset=
s5&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_normal_checking_tuple_offsets=
5);<br>
++&nbsp; g_test_add_func (&quot;/gvariant/normal-checking/tuple-offsets6&qu=
ot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_normal_checking_tuple_offsets6);<b=
r>
+&nbsp;&nbsp; g_test_add_func (&quot;/gvariant/normal-checking/tuple-offset=
s/minimal-sized&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_normal_checking_tuple_offsets=
_minimal_sized);<br>
+&nbsp;&nbsp; g_test_add_func (&quot;/gvariant/normal-checking/empty-object=
-path&quot;,<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS8P189MB1672975DF61C72A588D2C685B3C62AS8P189MB1672EURP_--

