Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4CE5CCD1BF
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 13:24:25 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.9])
 by mx.groups.io with SMTP id smtpd.web10.5463.1761398662273163382
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Oct 2025 06:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=PUHDCkrf;
 spf=pass (domain: est.tech, ip: 52.101.66.9, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYfv3fbSaqJQUCZaaSYeIQtGzjg8odygNlxos8jrddo8rNGDmcqx8FFpgUuyMUgMX7dGdR66MVDtOfXNPlULrLg2wXQcECIplkq7tskUw4ua7NqBaTD5aqRYLTRDhUWpWpP8R2bO3FiOOKvbfdSXul3yAPxWKPeSCHM8HOVlxBrY5F7af2kT6Iy6e0slTCnBTpM2wMeMwITR96zwsdTtq7tVXymVoZA0l1IAcAXVKVySNLKS1uZzD6WK/VS96Ppho/JyICPElTg9tYyCbFrP4jL0SLwtWJekMjXvzy9SQF6GPdtRZOnQnV9Yx/HKtamQT+6X+sqXuzvy/tvwOoKucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4o+eK+UEMfcKg+xanN6jw1y1xV1iT90+AqAyXaY5C4=;
 b=q+qqalEBEGruNK9peFFAbAvJmc3K2ZuW/eh7GHu5x/5AJxSE9+5HTa3iRIZSKqg0W73VPjOq8NJ6OA6KV5RDxSVLTLzCEZkNx+QPlRWG8VCUVs0sin70w0hSxWbxJBioeo7nrZTYTHT1G/WkKJl1muiC3Ug1ide6HGAPE8O/b7O+PyXPjHjSXwoIiWSXmBVTyic8rjKbkUxSUZlILELLa2kBRmH+ZLf6hGy57CPLUJR+ZvTKu8UdnZP0dZhUGEzTxOMDT18WLG+YPGfNq9CLcZG7gRxzQeFoHM+YVAkvY5RgC39nm7MBRWSfzkOzepw+bLQkzBsbR49OnTRndOlCPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4o+eK+UEMfcKg+xanN6jw1y1xV1iT90+AqAyXaY5C4=;
 b=PUHDCkrf3bQ3VRw9mSIOIA6NFrDILak5eQ7MVBXtJgRd8fef76UhLuGjdhL3NPg6hZYnM24wvFMsI144JdU1qUIFZK4ciY40HPlGrGz9GZJnQ1QPnBmKiRcni0v7iVAI3SUv/BQ8VpseWuLqZrlat7poN5/rdiik2H3K5Yg/nhotmWbo9/1+3W2r3IH+WaoKENeASNWI1RikNgiCCqrH0ZETStfn6dYOoPwVHKvb+ZebKUDkTmqupcE7MJ6KLrxgjJTw8IZi3A9SptvS1AWU81yODxCwuR34LdqBfD2mYXrqiJADaDRdE3kLQI/tewwbu4f+xegTUg+K0GTBo+8sxA==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by GV1P189MB2084.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:57::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 13:24:17 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%6]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 13:24:16 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4] libxslt: add ptest support
Thread-Topic: [OE-core] [PATCH v4] libxslt: add ptest support
Thread-Index: AQHcRDKbTsq1BPO6TU2gmFluOzD2EbTSr6oAgAAsx88=
Date: Sat, 25 Oct 2025 13:24:16 +0000
Message-ID: 
 <GV2P189MB3005C4B5FDBBEBAACAE67302FEFEA@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20251022204136.8276-1-pratik.farkase@est.tech>
 <20251023153459.49699-1-pratik.farkase@est.tech>
 <DDRC9MRK2AIG.3678WEEWAGRAT@bootlin.com>
In-Reply-To: <DDRC9MRK2AIG.3678WEEWAGRAT@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|GV1P189MB2084:EE_
x-ms-office365-filtering-correlation-id: dfc078c0-906a-4b40-1f7e-08de13c9cc3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|13003099007|8096899003|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?/CC7Gcr28pIFBAv2IT4MHV6JjqRLtiBiYhuEFkeR3jg0Yrn1G17brLJ4khlW?=
 =?us-ascii?Q?q4cwRkBvM/QhzQG2yJv8Hisa5q1Tu8ucdsUNnjGE7zNzDlceDvHJwNj/dpsP?=
 =?us-ascii?Q?U4bxCbGlIUcTg9CSHXE2gWaoaQDtGBfHnsiTi4RdWzUzicIiG1TB5+Jf7czf?=
 =?us-ascii?Q?QBUJ6OlqlpgOZefGmsLUYdcGynz+Ma5b+nDzKkW4c1dXeQQqpiueeMyIdxZS?=
 =?us-ascii?Q?+KJSAiu8jyoaVGqymO+LIWZVyPeZcZh2vLRcHzRia652CsaS1GqVs887JP/T?=
 =?us-ascii?Q?p2ey1OUqazm2K+P9NdKcGN/JleIZKWQRB+rcLGSIy66+ciY2+REzVR+yDuvX?=
 =?us-ascii?Q?pkSucvn/UIFbyGBzmG9lwPp7EPI/bjKkMhGA2Q1JQHzWY8jom4SrsTZ8kBfv?=
 =?us-ascii?Q?obvoYJTOgwrbf4q2KiblTFMLTfrE54HbwGaZP7xLXS2RZFAfDZFRKjJjzOT0?=
 =?us-ascii?Q?075vEqoU/KczYLQkTvGWC1Ghm4ehEBl4mO8fs4oSIGZvxwn/nt9CoDoqQhYg?=
 =?us-ascii?Q?eO6DJPymDdO471PWpH8lm5JHnXjeXEU8UEIEiIGehxDpMMwMq4w9C+cPYdnO?=
 =?us-ascii?Q?rgZmd3Rx5Ye8T5+ylT+YZy3+fBh2R0ujuDwFGyspj/JXyEjs1bde5frKtYT2?=
 =?us-ascii?Q?IhPr7QPw2JzockcS7uY7oCV8F9OJCFEo1kuTihUrDpSiQTH26XMyrSvkA4qJ?=
 =?us-ascii?Q?snrQh48L12X2L49aRvcQtd3Xld0q/UUk4xrpUAgTp4xTtXZXyLitOjkby/J8?=
 =?us-ascii?Q?or4S0j36qNka65bteSLV94xdl/GL7chDC3ZhMyBSqerT6W8zGfuSofogVB3D?=
 =?us-ascii?Q?94xnpZqoaVRl0n1hCR79Myn18x7V0lLCfAwYQTlw3QPpmMdAa5+HApofu8gi?=
 =?us-ascii?Q?K5bs83ge6EV9FsrXK1ZSIS+00dGPfLX48k7jC3HnXmHJygdC+tU8ZJHy/tc/?=
 =?us-ascii?Q?zCay2a/H/3yATTAIZYeSPk4T7jW/RejT844y2GFiVNympBv3aBDVnpunRuWI?=
 =?us-ascii?Q?2cdp1T3HRIc8s/3X9tqM2istMrOX6IlIToiW5p8pv5fhx8aOqGteC4Lv6D2u?=
 =?us-ascii?Q?jLh4TCDEeo5LH/eoYrWSoOg+pe6abYM5PbhDyvqko8EO7cOCeX0t/vxcnYQo?=
 =?us-ascii?Q?203jbXHxXfJ9vfBr2PYinHQFtJtjal49FNKPLRkz1AHcQHv4YHsPl8kBzrp2?=
 =?us-ascii?Q?LUSXrhUF/CCro9mCWv9aur9Crj9wDDU+xZDHcjG9ynsLaiHHWdV1MYGOiOFl?=
 =?us-ascii?Q?4k0UAhrPLoHbKMqXyk20JLzNFZxDs/8Iq7IZ8vPvJ7zIx4fZPxAiDl5/cmjI?=
 =?us-ascii?Q?PG1+NSS3FZZEbK3XUZ/0t97lsp/SpS8Tp7eqN88vrjK3bN2K3u4bJxtL5elP?=
 =?us-ascii?Q?BKLnThYVXb0SkpBYw4MZ4S7W1I5ffSygkHfdG/3+25yAMFezpS6Z12R2JtSB?=
 =?us-ascii?Q?jNcRRr9XmpapNze2egb+2pHP1X8qnQst?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(13003099007)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6/QOzXDcLnukE4T+8S00stKJjWJc9g06L6+R++i7/im+l8d+PPL4PzX1Hclr?=
 =?us-ascii?Q?OQ1dDHNVGUfgeOr/fkcyN3aGuOZ3M9Fajee7ortupAMkyeBC+CsGalpaj6ve?=
 =?us-ascii?Q?tH3Z6Ql4Gy7XQfs2gBOMdDvagYMvpmDQ8IsxCj+iExv6TZaDBFBpYENPcfPr?=
 =?us-ascii?Q?jj9Oe5nHzdKB83NyhjtoBlhQrO/+obFfeikNJGDQAVl69OmK3Btr1fagcBG6?=
 =?us-ascii?Q?vodyMuOwFh2HG9BsWqVFfbhXW4yVF2nUVZ6hE4DVitoxjSDe+P3zo5rhOgTg?=
 =?us-ascii?Q?8MqJj2O9D9JNOGcBYQG2/Bd1zG/3jxs/AxsoYgCd5HFjqRnkchLhYKn9DsYq?=
 =?us-ascii?Q?GFxP2INxHDfJb5BCcl/RpVuwYpT74yochL/901ucQU5zPahQ+ImD9lQPzC9v?=
 =?us-ascii?Q?Sww/J3+JF3/Z4G6UOuV4ydOyrfcbhJyhPnV1wcLsvaZcsstuQnGPR8S4WwBf?=
 =?us-ascii?Q?BT6w3kzuVika1H29/eYwuWcy3l5tV9vVlQ0I21Jdm8xZa6Ewj1wOArY6zDvL?=
 =?us-ascii?Q?JhN/KEYk8/8HMLwLQecMcQhgVG7kndsaTekwbXyy+VPSUFmGd8M4lbiGksff?=
 =?us-ascii?Q?0Dsc08oQ5cMP2jU4cuYnJmJ30tT31TelXiiNOERwjOwqjHqH60gkXJoiAW41?=
 =?us-ascii?Q?eb+P+x8WTjXPmCuhND5my0dPWnT9DS3Dwod58/ThyBMRwvYWATUFqUGKj5By?=
 =?us-ascii?Q?w9I4bmFdytWNs0ybY83YOm9aQXU85HcGBsUXhfk4/NWM51jrcZ/N0vlyUZHM?=
 =?us-ascii?Q?vbtLifhdjFYsP6yG+iO+6fLyvz8i94EZCR+TWYH4uSfHeSlhbmxs3nROIHiH?=
 =?us-ascii?Q?qiwoYIxWYW1g8+4+JUFrP8iZvCApIOFBFp5I0Vy0lv55YZ52/f0T7qbVuZho?=
 =?us-ascii?Q?pUznxxJ9/fs5TAxm+nJyQW23GW/huKSQxfgactzkfApQVhDTGIIp6Pj1zt0s?=
 =?us-ascii?Q?/guPm+sbCGZMo/KrVTBRxgC3XSlUK7YUqCOp44CRPPwl7K1lU3FfrrQomn+a?=
 =?us-ascii?Q?tZDr5JtVoZpOn2Y8Fb06/NjZwzUhXVeGQC6sv0QFL84KgweasHeR2+qd90pn?=
 =?us-ascii?Q?wHn4ysmkaj3BGhFBPwFZTuQV0a3/uEb+UaE5jxCHPXDN/llrou4mp/d5D9Ro?=
 =?us-ascii?Q?bAGFV03AQmOXUqcxa6wfPE3Bq54iJOHpxGM9KOwQawyBCwT2jrziM+3y5xLP?=
 =?us-ascii?Q?FvzCGAT4CTTM9QvfZiPMYlu/7r1QUQnRxz70/uxXoAuzaF02W6AVqI5J+5m+?=
 =?us-ascii?Q?1QcVa9v+Zz1jEgGngdD4g7bxMXUNoT7n/4pGiag1fAsvirdFt/I9IY/CpfAF?=
 =?us-ascii?Q?C930a27RCnnkoAUAZ5UUP/s8IzjZtBGJ8UZHMnHkLkXhP6SdDCbSsX+Zx0LT?=
 =?us-ascii?Q?6/0BNZQi84ypcuJfXuILT1NZPlOd37W7HNoxLP0iJj7OHn1xXsMGeJaghAM3?=
 =?us-ascii?Q?aobgWgtcX/ZAkdmLjJZA55SoAXOzw0+jSSqo+7CJW8KcDABWM1fd29DJavwV?=
 =?us-ascii?Q?VMDMj8fG6/lsiGvnh/rdZYDSS0Gvom3mZvxplgLR5Z9U+S5v+8ExhFek0Wze?=
 =?us-ascii?Q?sfpJNXfU5Xc2iN5mYAhtfC1FQ9zeCrT79UHDtBw1?=
Content-Type: multipart/alternative;
	boundary="_000_GV2P189MB3005C4B5FDBBEBAACAE67302FEFEAGV2P189MB3005EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc078c0-906a-4b40-1f7e-08de13c9cc3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2025 13:24:16.9095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q8dJd4qDtrKo1nHV3f3PzM4jYm178wsyhWZJh3cEEKStJecCa0LfWpYvEYMM+kxgy4MBZ+KLffpzJ1xC+GGV5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Oct 2025 13:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225308

--_000_GV2P189MB3005C4B5FDBBEBAACAE67302FEFEAGV2P189MB3005EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

The v5 patch has propsed fix for ptest installation issue in libxslt that w=
as caught by
the autobuilder when running multilib configurations (e.g., x86-64-v3).
The problem was caused by the ptest installation step trying to access
`${WORKDIR}/run-ptest` when the file was not visible in some variants.

I have added the following changes in v5 patch :
 - Uses `FILESEXTRAPATHS` with `${BPN}` instead of `${PN}` so that
   both `libxslt` and `lib32-libxslt` can find the same `run-ptest`.
 - Guards the `install` call in `do_install_ptest()` to avoid fatal
   errors if `run-ptest` is missing.

Let me know if this works!

Best Regards,
Pratik
________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: 25 October 2025 12:42 PM
To: Pratik Farkase <pratik.farkase@est.tech>; openembedded-core@lists.opene=
mbedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4] libxslt: add ptest support

On Thu Oct 23, 2025 at 5:34 PM CEST, Pratik Farkase wrote:
> Add ptest support for libxslt 1.1.43 including:
> - do_compile_ptest and do_install_ptest
> - test data installation
> - cleanup of buildpath references
> - added run-ptest installation
>
> Enable --with-plugins only when ptest is enabled, per review feedback.
>
> v3:
> - Remove unconditional --with-plugins (leftover from v2)
>
> v4:
> - adapt run-ptest to emit PASS: or FAIL: lines for each test
> - run-ptest installation with proper permissions
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for the new version.

It looks like we got another issue now:

ERROR: libxslt-1.1.43-r0 do_install_ptest_base: Execution of '/srv/pokybuil=
d/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3-poky-linux/libx=
slt/1.1.43/temp/run.do_install_ptest_base.9881' failed with exit code 1
...
| install: cannot stat '/srv/pokybuild/yocto-worker/qemux86-world/build/bui=
ld/tmp/work/x86-64-v3-poky-linux/libxslt/1.1.43/run-ptest': No such file or=
 directory
| WARNING: /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x=
86-64-v3-poky-linux/libxslt/1.1.43/temp/run.do_install_ptest_base.9881:209 =
exit 1 from 'install -m 0755 /srv/pokybuild/yocto-worker/qemux86-world/buil=
d/build/tmp/work/x86-64-v3-poky-linux/libxslt/1.1.43/run-ptest /srv/pokybui=
ld/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3-poky-linux/lib=
xslt/1.1.43/image/usr/lib64/libxslt/ptest/'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2636

Can you have a look at this error?

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_GV2P189MB3005C4B5FDBBEBAACAE67302FEFEAGV2P189MB3005EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Mathieu,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
The v5 patch has propsed fix for ptest installation issue in libxslt that w=
as caught by</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
the autobuilder when running multilib configurations (e.g., x86-64-v3).</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
The problem was caused by the ptest installation step trying to access</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
`${WORKDIR}/run-ptest` when the file was not visible in some variants.</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I have added the following changes in v5 patch :&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;- Uses `FILESEXTRAPATHS` with `${BPN}` instead of `${PN}` so that</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;both `libxslt` and `lib32-libxslt` can find the same `run-ptes=
t`.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;- Guards the `install` call in `do_install_ptest()` to avoid fatal</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;errors if `run-ptest` is missing.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Let me know if this works!</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Best Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Pratik</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mathieu Dubois-Briand=
 &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Sent:</b> 25 October 2025 12:42 PM<br>
<b>To:</b> Pratik Farkase &lt;pratik.farkase@est.tech&gt;; openembedded-cor=
e@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<b=
r>
<b>Subject:</b> Re: [OE-core] [PATCH v4] libxslt: add ptest support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu Oct 23, 2025 at 5:34 PM CEST, Pratik Farkas=
e wrote:<br>
&gt; Add ptest support for libxslt 1.1.43 including:<br>
&gt; - do_compile_ptest and do_install_ptest<br>
&gt; - test data installation<br>
&gt; - cleanup of buildpath references<br>
&gt; - added run-ptest installation<br>
&gt;<br>
&gt; Enable --with-plugins only when ptest is enabled, per review feedback.=
<br>
&gt;<br>
&gt; v3:<br>
&gt; - Remove unconditional --with-plugins (leftover from v2)<br>
&gt;<br>
&gt; v4:<br>
&gt; - adapt run-ptest to emit PASS: or FAIL: lines for each test<br>
&gt; - run-ptest installation with proper permissions<br>
&gt;<br>
&gt; Signed-off-by: Pratik Farkase &lt;pratik.farkase@est.tech&gt;<br>
&gt; ---<br>
<br>
Hi Pratik,<br>
<br>
Thanks for the new version.<br>
<br>
It looks like we got another issue now:<br>
<br>
ERROR: libxslt-1.1.43-r0 do_install_ptest_base: Execution of '/srv/pokybuil=
d/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3-poky-linux/libx=
slt/1.1.43/temp/run.do_install_ptest_base.9881' failed with exit code 1<br>
...<br>
| install: cannot stat '/srv/pokybuild/yocto-worker/qemux86-world/build/bui=
ld/tmp/work/x86-64-v3-poky-linux/libxslt/1.1.43/run-ptest': No such file or=
 directory<br>
| WARNING: /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x=
86-64-v3-poky-linux/libxslt/1.1.43/temp/run.do_install_ptest_base.9881:209 =
exit 1 from 'install -m 0755 /srv/pokybuild/yocto-worker/qemux86-world/buil=
d/build/tmp/work/x86-64-v3-poky-linux/libxslt/1.1.43/run-ptest
 /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3-p=
oky-linux/libxslt/1.1.43/image/usr/lib64/libxslt/ptest/'<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/buil=
ds/2636">https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds=
/2636</a><br>
<br>
Can you have a look at this error?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_GV2P189MB3005C4B5FDBBEBAACAE67302FEFEAGV2P189MB3005EURP_--

