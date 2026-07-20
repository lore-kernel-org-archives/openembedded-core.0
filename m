Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34867C4452A
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 14:01:00 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9743.1784556051126123723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 07:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=Zs7K+d3c;
 spf=pass (domain: est.tech, ip: 52.101.72.20, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArVGeM2B9eFdpq8NGR4TOHdWKuKYtIIXdIpcnyyqWA8CJbrJar3tww00izVVHMPcH5zu96uVt9uLVyGAHONzcbzMVg4MSBGFSFzzm8b4FkXT2qG/IZanBh5lO5zzdx0eZs7Zv5GHP+hUZMq5sadXIQlqKsi71ecdwXQHTUISJGlrGCf5KG4AQXjQEc3wu+5i9T++Q0ZUHLxg+qjNM0BtIexZ45xFduw8JKO2mW3IMT7vtaHrg8GBNHFQR+f7vozUNa0kDbnCWikzrHoBGNBze5qPXN/5v6+30lpLsPRsQiaEhJ94SoNY6NZn74lL0XA6xHMnvGq5+Xa4sgYp8TRfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXdK7+trP+GE6Yxf6eSE0V1NTio8kcNq8HP6R86mqos=;
 b=oUJjyxpSZZ7o38iawgvT1E8JcwWtZny4cMWh3V+g8l1gNgzqaSJuYmMAKc9x/ZiQZh6N+qZsFssNG8ghQPzZTztCVrcwlLRN/fSLxXk4+kN15ylQ5IXOtR99dsitKCOOibfh6MoCIpLYEu1UxCiP9I9aSwjKnRGmoVTuVUbXrC7eTofWjpylxAHfKdsrber2VlVvViJlJMp9LPzzWvZkohjAcdzZ2N1SXbRQtJZOSFDrIawL07QHkWvlwjzL0ZyTcq1tFWGcrLe8N2fPUDskXJAFDYNVRC+Xs67q7Ruzy1Wn1UpmpZB/v525xpm602n5iMqluwYcKHgQ3GMtDAMzHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXdK7+trP+GE6Yxf6eSE0V1NTio8kcNq8HP6R86mqos=;
 b=Zs7K+d3cHsXwPqQ7gaGZ+63FmFladC1ZelxHNb1NjawAR6GjKLgtSby+QLZQESQ4HW3VnT3XZj0aHW3GocezNk1kTxPv4XGf2lsgHzMO+c09VLYOfzyFnZoCbwE5c+puWkyR8zdDXxCg5juLlYs0RKcqPa6I+C9LeYyoFAaOKgiJNUItGi4yQ1ZtDaMnDOV0P/TIt/SKBGVZ5n5KvgesybxeglwaHQJSNlwHjRvv8OOhL6DO0sPRa/hgVkSvaggcHO5CxE9DVqE6JRzVxhNVRu9A5mgLydSwfKcdhwBpLP9bMt4EeiohR9Mtg2Xp/ZJXY0hgm/paMjZ+ZemqUahH2w==
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by GV1P189MB3129.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:292::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Mon, 20 Jul
 2026 14:00:44 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0245.009; Mon, 20 Jul 2026
 14:00:43 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Paul Barker <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pratik Farkase
	<pratik.farkase@est.tech>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] libarchive: ptest: run tests from tmpfs to
 avoid inode overflow failures
Thread-Topic: [OE-core][PATCH v1] libarchive: ptest: run tests from tmpfs to
 avoid inode overflow failures
Thread-Index: AQHdGEL7z2FrXojGN02Jn1RNXzdvKLZ2WRoAgAAFpxKAABDssA==
Date: Mon, 20 Jul 2026 14:00:43 +0000
Message-ID: 
 <PA3P189MB3239DA0B7C659806E17B0F4BFEC32@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
References: <20260720122619.34696-1-pratik.farkase@est.tech>
 <8903186c462b63958e33a07a4f042359955168d3.camel@pbarker.dev>
 <18C401467A678464.1234146@lists.openembedded.org>
In-Reply-To: <18C401467A678464.1234146@lists.openembedded.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P189MB3239:EE_|GV1P189MB3129:EE_
x-ms-office365-filtering-correlation-id: 8e3b9d7c-c34e-4669-6912-08dee6674a82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|4143699003|38070700021|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info: 
 fde4mMEzGt1GBHGPWOEze+PRX6pmqP0lkwvflDAf799BNiNk3hF1hGw3gD7b1GMpGm+BSJ4Xg2EcWYC+DyOo5/M0ImwHBnNYmXQ7RE9FM5BHP4NVPKeVt9KXodmNxaWE/XZwgj/dCShqWimW15xF27D3IWMvOTlwL9khvY0twVDfG3/LDRyfpi5j3uR8wHgVzAiIUImDqa0kuUn1zAx20V7cMK8Nd6KL2xdRSr+J/E+BndOUBVBYqDf8AjuwDhO/hca86ebsyVYyRxWWPDyM79a4a7XmZqdbZQJEsBth1Py/q7p3Kx3qRNv/t8W3ZyOJmyNffmbIe37swUJWBiy6eFSgN1rJTrjC2dsmY/qXTnu0nMs25ZeVOcfC+Je54fMhkwLmJfBv2t9cyQXtliF7oUJt6Doe/3rWt9VLTQApGQVO62YeZcolukGefG4qD6rJmLCDo4RRWxCkhMrhw8RjJY6PVCPEPQo/Lq36sDOAdCAaPfU3cyhKsHflxglb0ng7eQsPLbSMzjyN/rmOejERdLQhorm1GBsqezEvKNNmENnJmXQDo0piVKqZDoIwOlpFd72GDsHTJlIZb2nBgepciHlm+46iHoFHESjyLAjzuuwlbtnedavfyA+1O0YayLQOtJ90nNQCCnXMlyPy5DGYOMS8vB3jC/v6/+UzsNs/l40=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(38070700021)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?jFeEipY8b+SCicaLvn38kOySjUvS+1BzLEQYi/AD7csKqfrfB0H+H/5L?=
 =?Windows-1252?Q?mFfD2p3YwxxaaBME+YL+lIq9AmTeHsswBv8lglCnIcWtJ+VANjRq+vOc?=
 =?Windows-1252?Q?vL9WOPtojHYTrvVTUAaPPqNDRfRRHcFpHvevz4SDHRMxSttG481qmqdU?=
 =?Windows-1252?Q?whlV+D0xMzMMA6xz8VP1EdRUHSxKCryV4TSQG4KrS0Ff84CW4s4DZYaO?=
 =?Windows-1252?Q?JM7EfEX0dXHaB3Ma366MEMJS1868K6FQPuLJYpj9qD5F78fwH3xDzwvd?=
 =?Windows-1252?Q?xrB8cAKaa2wnpLF1gdSJfwWhf4DFEiG7SoVh/ocDxois3dcyIeXh5MkV?=
 =?Windows-1252?Q?uPKLmFE8GXIY5GhTL0+Xkx0qkFfivYYaiUYxpm2hFLE1vsJ0PJddMp3j?=
 =?Windows-1252?Q?/BTNaeB2L6iDMmgdePReQbvB0OxgR9RSo7D2HcTdOEeFucHuCJwXyoS4?=
 =?Windows-1252?Q?mZkjgiI9EGZODsmt94ulNlcJOEFgJF154S37wnVx6it7ZFn7oHgNDSUQ?=
 =?Windows-1252?Q?CtqSeVjIMZaR41qpSETxSwULbvsvkYOW+ARp2bAO/CK5N2FPfGaAVrT9?=
 =?Windows-1252?Q?zts4bcYPCZzA/ayFK1jDDyT2KuiiVDITytaU+/JUbNFoilKP8Ck5AsYJ?=
 =?Windows-1252?Q?+u4z5q+qK01TC3wedmdRQv3+GNPFRtJct7yBXesqvCJbIn7OI40bO6cn?=
 =?Windows-1252?Q?1RzjpwR6tq2mlA/phzIIlUuOHVyBM+ZrkBypNDbr9w2tk4iPUmKTpvUt?=
 =?Windows-1252?Q?2hBweJI6l28c6J5wy8YIWDqnLdqvDVJBhzZhH41JA6vv67xv2JeQCZcR?=
 =?Windows-1252?Q?BX5gGNfFN0xBVbNGslGqLK/HJYJlC1xzUmHdZoZ3fQG3Qbo1dK7K2Cv4?=
 =?Windows-1252?Q?P28BOknbEs6wd7OO2DrS11jXoh8EcGUNBwBVEXA9QdOhbvVXoxXBkKoC?=
 =?Windows-1252?Q?FK1XW+fHu64VtW5tGwEpyExFNBMu+oAujzTEVFSX2RdiBU5ZCTdo4yyj?=
 =?Windows-1252?Q?OAnyqQYEt4YYNgeTeD3hS/bMNTaOytlKVG2xaenykBRrb0fGdByxAzms?=
 =?Windows-1252?Q?tqsuGwufssxN/YLt1oVmzIGODW9wnQK2LN8U/ZXiP8fd/8nlYZzEsKZF?=
 =?Windows-1252?Q?wREByy+oO6GBOEDLq6N3bcCkqPJzUwIH4Qc2sMZVn06VQxtwSUv+SHyg?=
 =?Windows-1252?Q?rDXGkiw9ewS1JlwN3HaGfbtF/y0PWbV134+Pgw7enwH01y5x2soj0MBH?=
 =?Windows-1252?Q?+Qz6vtMwkN8aTzUNPtcGCfVfiMCwy7FgcxcD3pz/Huob8iM6EVkV0Db4?=
 =?Windows-1252?Q?fuOiS3pHVOQ4cNaGg6BAgggqLQLHxyb1P9cXCSla/8CPOqkRY00os5C3?=
 =?Windows-1252?Q?FNPcQ2IyK1SImtZnzFgh8Z+SLelcZSyzW7c4mCm0STcPd+nRupYgJB6X?=
 =?Windows-1252?Q?toGj8GKxrAq/A/XOyNxt7iA80UE+V+Fy+ef1F+/mS880HgTkX+3tTpdF?=
 =?Windows-1252?Q?G9/wRnbhbOq5uSyibiwFnrdAei+tmKmSIrZtHmxxi64tK3DV4mo4fp42?=
 =?Windows-1252?Q?R+iWyKpjAOB9hCF7Vgo3XVCU7vqnjgoNluZU3rKiSnXKbzYYOFF9TgxG?=
 =?Windows-1252?Q?PFSFoJYGZsmTP/IP3WJgwYaC5uVSKlVqwxETW6REeRE7YIkP9ngXkXp6?=
 =?Windows-1252?Q?m6hXXfcRIASwU6BDWahThDOGp9V6Aq5i58XfLlXiQkhciexRlLY5k2eu?=
 =?Windows-1252?Q?PFqp/XTDokCMhIGy2yWPidA975SabKYdCtJ+vz7y/UArDNcSmRMajGBs?=
 =?Windows-1252?Q?wqypLB2pxlzZfvVpAtqc7rfmAB3TApj1PHgZfXGJYKnoyyuM?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3b9d7c-c34e-4669-6912-08dee6674a82
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 14:00:43.9133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /6Mk3Q60cVS+kljpe4W8O04XLeRb1YZh8BuOqNUi2XV6qFw1XkbPznkLjFxVQGVwMUYV0zgJ0WSeIHEnBFenxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 14:01:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241400

Hi Paul,

Correction =97 I managed to file it upstream after all: https://github.com/=
libarchive/libarchive/issues/3314

Best Regards,
Pratik

________________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Pratik Farkase via lists.openembedded.org <prat=
ik.farkase=3Dest.tech@lists.openembedded.org>
Sent: Monday, July 20, 2026 3:05 PM
To: Paul Barker; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v1] libarchive: ptest: run tests from tmpfs to=
 avoid inode overflow failures

Hi Paul,

I tried to report this upstream but issue creation is restricted on the lib=
archive GitHub repository here:

https://github.com/libarchive/libarchive/issues

For the cd, since the script uses #!/bin/sh (pushd/popd aren't POSIX), Can =
i use
cd "$PTEST_DIR"? here. I have sent a v2 with this proposed fix.

Best Regards,
Pratik


________________________________________
From: Paul Barker
Sent: Monday, July 20, 2026 2:39 PM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v1] libarchive: ptest: run tests from tmpfs to=
 avoid inode overflow failures


On Mon, 2026-07-20 at 14:26 +0200, Pratik Farkase wrote:
> The bsdcpio_test odc/newc format tests verify archive headers byte-by-byt=
e
> including inode and device numbers. On ext4 root filesystems (particularl=
y
> qemuarm64 and qemuriscv64) inode numbers can exceed the odc 6-octal-digit
> or newc 8-hex-digit field widths, causing intermittent assertion failures
> in test_format_newc and test_option_c.
>
> Run all tests from a tmpfs working directory where inode numbers always
> start small, avoiding the overflow condition.
>
> [YOCTO #16231] : https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1623=
1

Hi,

Has this issue been reported upstream to libarchive? It would be good to
get the test cases fixed so they can handle whatever inode numbers are
allocated.

>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---
>=A0 .../libarchive/libarchive/run-ptest              | 16 +++++++++++++++-
>=A0 1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/libarchive/libarchive/run-ptest b/meta=
/recipes-extended/libarchive/libarchive/run-ptest
> index d6b4c3f934..7f61e1b173 100755
> --- a/meta/recipes-extended/libarchive/libarchive/run-ptest
> +++ b/meta/recipes-extended/libarchive/libarchive/run-ptest
> @@ -1,13 +1,24 @@
>=A0 #!/bin/sh
>=A0
> +PTEST_DIR=3D$(cd "$(dirname "$0")" && pwd)
> +
>=A0 # The fuzz tests run 1000 randomised iterations per archive format and=
 are
>=A0 # meant for dedicated fuzzing infrastructure, not routine ptest runs. =
They
>=A0 # regularly time out in the time/memory constrained autobuilder QEMU t=
argets
>=A0 # (e.g. test_fuzz_iso9660). Skip them via the upstream escape hatch.
>=A0 export SKIP_TEST_FUZZ=3D1
>=A0
> +# The bsdcpio odc/newc format tests verify archive headers byte-by-byte
> +# including inode and device numbers. On ext4 root filesystems inode num=
bers
> +# can exceed the odc 6-octal-digit (262143) or newc 8-hex-digit (4294967=
295)
> +# field widths, causing intermittent assertion failures. Run all tests f=
rom
> +# a tmpfs where inode numbers start fresh and small.
> +WORKDIR=3D$(mktemp -d)
> +mount -t tmpfs tmpfs "$WORKDIR"
> +cd "$WORKDIR"
> +
>=A0 for t in libarchive_test bsdtar_test bsdcpio_test bsdcat_test bsdunzip=
_test; do
> -    ./$t
> +    "$PTEST_DIR"/$t
>=A0=A0=A0=A0=A0 if [ $? -eq 0 ]; then
>=A0=A0=A0=A0=A0=A0=A0=A0=A0 echo "PASS: $t"
>=A0=A0=A0=A0=A0 else
> @@ -15,3 +26,6 @@ for t in libarchive_test bsdtar_test bsdcpio_test bsdca=
t_test bsdunzip_test; do
>=A0=A0=A0=A0=A0 fi
>=A0 done
>=A0
> +cd /

It's better to use pushd/popd instead of finishing with `cd /`.

Best regards,

--
Paul Barker




