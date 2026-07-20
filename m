Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB44C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 13:05:59 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8575.1784552754140047526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 06:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=wdTTCD+S;
 spf=pass (domain: est.tech, ip: 52.101.66.45, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sW6APqz58z0qnNajbkWNRu2fHYAopN1BsjgJRpZvCZ+lC/16Z35LWavWjW6fzTEIq9JIrFIhQ7FhGIrv1chUim5ASQvEdzXokkxt58UPJgNtFxdfBt0EsDac7iW3C3bPpc2m0UKAiJnMxOFKPKEg1ERHmhty2Ra7+1aV64+Q/+WyBGazvHg1pI3fjbAitVQ1NG5c6iw7vWtwLO6YVvlKcSrP248pGHRR3uyet3jWJhT0loJEuX0gMbnYFUDjALT+Ply3a1VMilm7HWG7vWBaroZhLwkNyrR8Ksp4EljuFUQSjX50xfAulpHLPBfbs6FhzoNFZ0jzOJL6Na7YijogvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOYIZ59jYO1jSUabYfAIUjvMdKIgF/L3sLYYhI3fIvI=;
 b=c/Ml5HRz2plrh8si9fxzamhfISukaeOHA0V+JNOm5d9d+TdMB4VHiVUSlkW/lVTBaV7cWbrBcRk4WSw8JP7+vJ33aRfnsGZaU7X04CpLbW5MFZiyw/ISK8+SBc1vaFPILiKbj2ewJ8C5H/jCikk+VOynHumHnGftxivxONfTuP6yXS6upNgmxlh+BC9qCsp4fb306HugBzpR00CXUKUUfBxh5AnpPu8VIpAQxwcoiXDDGRL2mXLk8pwX2MyYwqNuRPnXLQqRMIYqW7jITCu0WYbcUl++SyuhtJE6Y6Z/zw7jSLKl2hEsOGi0kqEB7OExcd/eiQXlzWvMou2TtZrpUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOYIZ59jYO1jSUabYfAIUjvMdKIgF/L3sLYYhI3fIvI=;
 b=wdTTCD+SMJBBCD37+HjsIyLT+UvxQjP5JfpZnJEvkBU0oAcrxV/qOP+TKawfo7oScWepqCaHfe4vKsonK1zw3ir4sKC7cSglS9MFRrhgfvWaaf4y6wX95uWlJ9voQObE6VLOaHvCh8xvo0fG9ic0Zl9Y0jaFl/ZhlSUdZBk7b8isjLjYEKBhLA0jVXJNIHg+LeU46mIvLpXueiL+JxmYjE3yy97oN5cKl/DIgk47xMSznxlzd/KumiLU1RvMKikMpgudkO9M+qewIaGq2Oe9PQhEIObeIDx0F9lW19/cd0/yR+/xtu6RZFsI0tAutIs5evSMVqrupYNnFyD8x9pK3g==
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by GV2P189MB2863.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:268::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Mon, 20 Jul
 2026 13:05:47 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0245.009; Mon, 20 Jul 2026
 13:05:46 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Paul Barker <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] libarchive: ptest: run tests from tmpfs to
 avoid inode overflow failures
Thread-Topic: [OE-core][PATCH v1] libarchive: ptest: run tests from tmpfs to
 avoid inode overflow failures
Thread-Index: AQHdGEL7z2FrXojGN02Jn1RNXzdvKLZ2WRoAgAAFpxI=
Date: Mon, 20 Jul 2026 13:05:46 +0000
Message-ID: 
 <PA3P189MB3239D4EB2CB8D3E53C658109FEC32@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
References: <20260720122619.34696-1-pratik.farkase@est.tech>
 <8903186c462b63958e33a07a4f042359955168d3.camel@pbarker.dev>
In-Reply-To: <8903186c462b63958e33a07a4f042359955168d3.camel@pbarker.dev>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P189MB3239:EE_|GV2P189MB2863:EE_
x-ms-office365-filtering-correlation-id: 940fcdbd-ed8f-42fa-d180-08dee65f9d40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|4143699003|56012099006|18002099003|22082099003|11063799006|10067099003|38070700021;
x-microsoft-antispam-message-info: 
 rizqypQNF+gw7PyEq5nZaGg4U/110CQHWnQ6gJg5VJZ7eIfQVL/mRUnAepnSIF/sj6B5GkDBOTPqcOpSivRvnIr9qYkFTOUwDvTLikQy/OzUSACnnpuitnLPHinuGbWez2AE+T3/0gKkU2Ni3qE0tHFP5WscwFAmI+IAmDZeQcOgwsA8mAoXdalpZH7Uvw9PwyCE8YroDSqpPyiLBUdTPBuN35L1FsntYAXwVoneq1rWypC3FQF2zOA9MdzlPqiA5pAK+0gn4dPUFT1HuGWfn3K9cJH1QFudrtJdQ88uyGx0Jxli7OGVCMwoNdoDAjPLMgnR4z3EB8ewt+Q9nFxeTCk7rF5c4ReHl+aFhYB+K5pP5qftm0zOrj7LVoYg6LCqc4T9P6449LGy3htKSSp6Ap5o1uFmLfNmIHly2eGbKkkExs1ud77N3QK5pq/annaOYm95EmM8UGb4GXGzWo0ctBdzSV8HqYbsvrMAStLhppBeKJpE+0Q9MZIq9Iyv2jHZdtyaBAqWfy9fzAIaFlFepuTvem/R+mYBe/5OCMxaflCsXaEkuXlCOCFfDGEFSqRILLnlfwEZXAyZ+gcRjeJUhh6fH9YIysLHiH9sH75cHAiiZNctiMSJcsAi7rG5ETVxakEXtqEYaVKfNig9ciokO+4d8cZLBS65iDsabXI2Q24=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(56012099006)(18002099003)(22082099003)(11063799006)(10067099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Bc8neEUC1yLOjDMYD80KmFlnHbCdQ0AZHTH487CFn0xpCjgc6JV5onV8n8?=
 =?iso-8859-1?Q?StMnNA9K96NtLb9Yhs7wZ6zchfRdgoCsLb5eheFgDVuVQpLsbacJAo20e1?=
 =?iso-8859-1?Q?oo/FDrKDQEfHHhhnYYZ32CkLGJfcG1cV005TT4Own7Jz2TNM0a0wc8BPfA?=
 =?iso-8859-1?Q?ytObkoZ4jUMbCeRaYf9dDD9FA6frgeTi0gFRpq88zmNZipXxIv520DKKWo?=
 =?iso-8859-1?Q?E9m57XhebLT/+uOTGycngu0L5+VprGWrgUEskM7p2mw3v2b2EwKwbTgYTA?=
 =?iso-8859-1?Q?JPDwR0gmUePlBhw6NaOnlBJcPw+16bgKwig1gpZH0RvC71Yq8uvYqGoCh5?=
 =?iso-8859-1?Q?cN+vitStGssIH6b9ZuZ69OxbXwRdgvKHqloZAKB5vXiyHoF98HnyeV20Yn?=
 =?iso-8859-1?Q?N35SklP9stnRJmO9PHclxvw+opSEG1f/7Vy0pNpnwct0nlMAFSGSbjuKqG?=
 =?iso-8859-1?Q?ekBGQnN093qHMyCZSu/2uWhSn131duydtS1kKfdE/Z809Gzq1o1zSE/ckv?=
 =?iso-8859-1?Q?ujPIHo5cmm0+OSvZBo1+qCvcldRlbaq4cbtMt3moEuCCFmC+wEa86vhjSx?=
 =?iso-8859-1?Q?2eQknLTQlQhvpymvhK1lmPPdjrG2wQFvYLbwjfNa2MSCjD+OUH5kkf/Fld?=
 =?iso-8859-1?Q?RGdEXV+qrO042kE+MkJj0eYYtiPtmtGHiIiQA8iy0IvOvY1Xq+U4B8HUtj?=
 =?iso-8859-1?Q?E3Zy5eqqVPskOYSaSEBukkgSNPYrPS4+ZH69e56SgVO933aKmT0MefdtEg?=
 =?iso-8859-1?Q?fc4UbrG7kmKZ4Dt0rvFoBildgCYkYKtfwZqmQI5e7l7PHN1YYRtubhgJLD?=
 =?iso-8859-1?Q?fnWr5j57RlOYdkVa6KQ/9RvCxZN+YWB0sIftuIXWtm0CUyEmUtCcjqMvYr?=
 =?iso-8859-1?Q?krU96c9qZd/r9FXr8yIFI8lr/abQCi5Qex7iCcyrEeKv/yDOXTBIZcTDBX?=
 =?iso-8859-1?Q?LY/BLaLerpS4e9zD7LTTyVuB+hzLWQbrb677D6Obqxmaqfja+GULHK2GJ0?=
 =?iso-8859-1?Q?iDvk18mOFL2Kyv1BqfpAyVSbaOY4dj9wtMUU3b1T2L7mVDAVAE6BNMMgA2?=
 =?iso-8859-1?Q?ROwYwd8K7DIia+naifLM//Umb8jHnJSwbW9xbOK0ICUEsuNzaNCTCoujIx?=
 =?iso-8859-1?Q?VfFtUalfVcqLWtNajUzeexJw4WnQEycFV+6je3abSmxsxOUof2o1kud17j?=
 =?iso-8859-1?Q?qNhg3bIgl9rur9dwF11Skh53h1BnfIGUykxL9/DjnrzodWReEvvw7TpdTq?=
 =?iso-8859-1?Q?PGHgJb6L2ypeCl+22Ww9TTX16HmwduRJ9JtuaBcKCeTntarU9LPHO8GwUr?=
 =?iso-8859-1?Q?0ujII68YnvX/CTIrRIbgdLIjPDFmqKsde66TOSmdS+ty2RU5AODQ+326lo?=
 =?iso-8859-1?Q?Gd08LbY6qN6IBMuPLQOQDMbAnq0RpO6xedpMabRe9+wE8fsK70AA0w2yVH?=
 =?iso-8859-1?Q?R2TICrHa3PZrf7icZff+g7fuhUy6rfs7fxnWE4sf5lFHEb3zR+2vQ3SWNf?=
 =?iso-8859-1?Q?RXcUgwU+lW0rAzad+6lFTHyGczzM2da8lTCMUNgx9+wL38Qc0BzepPfzxZ?=
 =?iso-8859-1?Q?sMUlo+22ZqOzTuLsWoe31+8aAypYAxiDIepr8nyF0tYeXOtPqt7NRZjA9f?=
 =?iso-8859-1?Q?JQB5A8OPEKWzmahJEvYkFG3Tc3gFgSPOVT2ThhiZB+towafls+A8C0z9Dg?=
 =?iso-8859-1?Q?vU0DHMn4soqf1AtCmzstbrfs+l0eRSNFpwqavshu60hEjD/UqfLHnlaJeu?=
 =?iso-8859-1?Q?qek6P0EyWszgkGN/QZF8ZuX3UFs2dWk0j/S2Dm2BmCrIAj?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 940fcdbd-ed8f-42fa-d180-08dee65f9d40
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 13:05:46.7556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r9mRsCpLpbbEbmdP/mHqYXX8p1zKaJboel4QUfWeZxJzzZ/0/12NLuUJlAcTf1CI3SMWngGw/79sti7T9hK5dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2863
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 13:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241396

Hi Paul,=0A=
=0A=
I tried to report this upstream but issue creation is restricted on the lib=
archive GitHub repository here: =0A=
=0A=
https://github.com/libarchive/libarchive/issues=0A=
=0A=
For the cd, since the script uses #!/bin/sh (pushd/popd aren't POSIX), Can =
i use=0A=
cd "$PTEST_DIR"? here. I have sent a v2 with this proposed fix.=0A=
=0A=
Best Regards,=0A=
Pratik=0A=
=0A=
=0A=
________________________________________=0A=
From: Paul Barker=0A=
Sent: Monday, July 20, 2026 2:39 PM=0A=
To: Pratik Farkase; openembedded-core@lists.openembedded.org=0A=
Cc: pratik.farkase@ericsson.com=0A=
Subject: Re: [OE-core][PATCH v1] libarchive: ptest: run tests from tmpfs to=
 avoid inode overflow failures=0A=
=0A=
=0A=
On Mon, 2026-07-20 at 14:26 +0200, Pratik Farkase wrote:=0A=
> The bsdcpio_test odc/newc format tests verify archive headers byte-by-byt=
e=0A=
> including inode and device numbers. On ext4 root filesystems (particularl=
y=0A=
> qemuarm64 and qemuriscv64) inode numbers can exceed the odc 6-octal-digit=
=0A=
> or newc 8-hex-digit field widths, causing intermittent assertion failures=
=0A=
> in test_format_newc and test_option_c.=0A=
> =0A=
> Run all tests from a tmpfs working directory where inode numbers always=
=0A=
> start small, avoiding the overflow condition.=0A=
> =0A=
> [YOCTO #16231] : https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1623=
1=0A=
=0A=
Hi,=0A=
=0A=
Has this issue been reported upstream to libarchive? It would be good to=0A=
get the test cases fixed so they can handle whatever inode numbers are=0A=
allocated.=0A=
=0A=
> =0A=
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>=0A=
> ---=0A=
>=A0 .../libarchive/libarchive/run-ptest=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 | 16 +++++++++++++++-=0A=
>=A0 1 file changed, 15 insertions(+), 1 deletion(-)=0A=
> =0A=
> diff --git a/meta/recipes-extended/libarchive/libarchive/run-ptest b/meta=
/recipes-extended/libarchive/libarchive/run-ptest=0A=
> index d6b4c3f934..7f61e1b173 100755=0A=
> --- a/meta/recipes-extended/libarchive/libarchive/run-ptest=0A=
> +++ b/meta/recipes-extended/libarchive/libarchive/run-ptest=0A=
> @@ -1,13 +1,24 @@=0A=
>=A0 #!/bin/sh=0A=
>=A0 =0A=
> +PTEST_DIR=3D$(cd "$(dirname "$0")" && pwd)=0A=
> +=0A=
>=A0 # The fuzz tests run 1000 randomised iterations per archive format and=
 are=0A=
>=A0 # meant for dedicated fuzzing infrastructure, not routine ptest runs. =
They=0A=
>=A0 # regularly time out in the time/memory constrained autobuilder QEMU t=
argets=0A=
>=A0 # (e.g. test_fuzz_iso9660). Skip them via the upstream escape hatch.=
=0A=
>=A0 export SKIP_TEST_FUZZ=3D1=0A=
>=A0 =0A=
> +# The bsdcpio odc/newc format tests verify archive headers byte-by-byte=
=0A=
> +# including inode and device numbers. On ext4 root filesystems inode num=
bers=0A=
> +# can exceed the odc 6-octal-digit (262143) or newc 8-hex-digit (4294967=
295)=0A=
> +# field widths, causing intermittent assertion failures. Run all tests f=
rom=0A=
> +# a tmpfs where inode numbers start fresh and small.=0A=
> +WORKDIR=3D$(mktemp -d)=0A=
> +mount -t tmpfs tmpfs "$WORKDIR"=0A=
> +cd "$WORKDIR"=0A=
> +=0A=
>=A0 for t in libarchive_test bsdtar_test bsdcpio_test bsdcat_test bsdunzip=
_test; do=0A=
> -=A0=A0=A0 ./$t=0A=
> +=A0=A0=A0 "$PTEST_DIR"/$t=0A=
>=A0=A0=A0=A0=A0 if [ $? -eq 0 ]; then=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0 echo "PASS: $t"=0A=
>=A0=A0=A0=A0=A0 else=0A=
> @@ -15,3 +26,6 @@ for t in libarchive_test bsdtar_test bsdcpio_test bsdca=
t_test bsdunzip_test; do=0A=
>=A0=A0=A0=A0=A0 fi=0A=
>=A0 done=0A=
>=A0 =0A=
> +cd /=0A=
=0A=
It's better to use pushd/popd instead of finishing with `cd /`.=0A=
=0A=
Best regards,=0A=
=0A=
-- =0A=
Paul Barker=0A=
=0A=
=0A=
=0A=

