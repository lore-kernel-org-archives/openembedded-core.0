Return-Path: <Suresh.HA@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C46FDCA5FE6
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 07:02:53 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19482.1791097365956083100
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 00:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmwtechworks.in header.s=selector1 header.b=UpK1obZo;
 spf=permerror, err=parse error for token &{10 18 secureserver.net}: SPF record not found (domain: bmwtechworks.in, ip: 40.107.51.49, mailfrom: suresh.ha@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifmzQKpN126TrjmgrQ3IhbcWajf9AGJBT9EJdAps1W5UhNbF5cM80aqzjQKN/yufucz3R4UsxgaF58Jl3lMuCcUFaT5MQi+jADxO0Vg+J+yekt1HHNIFuhcJAN3YReET68nKS60KzYo8fWfPHBKFytegKV8H8Zk91yKCo6fx1bXujDg53yO5jFZSOyWChsnylFmUdi6GP8F7CEH+ywAjne0aACcsMEHZtGXk/UYC/NI00jpF+qE7z1OnF1+g84v27YnizeYs+aCRUYCizxJq/l/IdiyWfn89sfhBcbl+ZVkRW6BOEtNV/qjHfnAerFIKqgDPssyBY6Ycx7yedFWwgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7e2hVAd1+BUrPQZ7FY6TQcdPzz+yvgTQqcGCEDDHZgc=;
 b=Rs7pRw9K++bmvFBL6m41d3VR3e+8PE2JmTEH10VIjNH3p3kYDaLtWrxeDUhjuXaQuge9XqjBGoHaqr+CTZoRwOos/LPouTcN0GaBMepz/UYNkAPQ1NGETKn6vm4OG8jTTXx8SMwzj+zBP8I3ajKTUN5G9ut6SMguS7yp6GTeaVTbVzGSeCCD2mFvMMHJtjM4yWnPj99AH72x/xfVuSe9f2/TWzDx0T9d+r+CcXYxQi0QbKRuuLuoVvUzarJxEsljIJhCZ8BjABw4YDVcZD82uzD2TviCTJ0Xe5it8JUludhGOf9HVRPedT0oHjC29pR5L7l0Z7uPJWb88g27x4XtuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7e2hVAd1+BUrPQZ7FY6TQcdPzz+yvgTQqcGCEDDHZgc=;
 b=UpK1obZo9P6zv7yjYnHgJUv+6NPiJj5iyNVo4/Vs5QvV0bXGQ290gU8sMlh8Q23ViPfhmgFEx+McATT04qQlz+5RdDXxuj+DOb2v9YPfDU6XlT0TOLW8RxICYnkcg+tpbacdEoF1XLjSiR1hg5lgGi7iGqi9V2sfqH+q/cHjMD8oo84YWK6uN/j+pxAAOiHThZeXtU9hhz1V6yGKCP6vEt/0gNlzuLVVmOuIH5JI1t1pcI4f3yAQTm2y/A150J4L0yg1a0XJKknYEItqzNKPH9910n9sCmyd+gLJ5qMuiZKfISNlUNb74QTFKnj3+1hDl4EfaGizmF5HOEU4sUHtXg==
Received: from MAXP287MB4240.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:15e::13)
 by PNWP287MB5863.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:31b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 07:02:38 +0000
Received: from MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
 ([fe80::a6de:34f0:e60c:2ebc]) by MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
 ([fe80::a6de:34f0:e60c:2ebc%3]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 07:02:38 +0000
From: Suresh H A <Suresh.HA@bmwtechworks.in>
To: Yoann Congal <yoann.congal@smile.fr>, Suresh H A - UpStream
	<UpStream_IP-SH@bmwtechworks.in>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [poky][scarthgap][PATCH] systemd: replace a bunch of
 assert() with friendlier checks
Thread-Topic: [OE-core] [poky][scarthgap][PATCH] systemd: replace a bunch of
 assert() with friendlier checks
Thread-Index: AQHdOrOISbL/ZA06ekac92vLZs9Ci7bqMJwAgAL1zQE=
Date: Sun, 4 Oct 2026 07:02:38 +0000
Message-ID: 
 <MAXP287MB42401A9E2E49E3CFB97D1D21EE972@MAXP287MB4240.INDP287.PROD.OUTLOOK.COM>
References: <20260902081733.3136152-1-UpStream_IP-SH@bmwtechworks.in>
 <DLU99U4S7591.5BVIYWG6DZTE@smile.fr>
In-Reply-To: <DLU99U4S7591.5BVIYWG6DZTE@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-Mentions: yoann.congal@smile.fr
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAXP287MB4240:EE_|PNWP287MB5863:EE_
x-ms-office365-filtering-correlation-id: 57c2a2ca-8a87-42cb-3d0b-08df21e579cb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|23010399003|31052699007|39142699007|1800799024|10067099003|56012099006|6133799003|4143699003|11063799006|8096899003|18002099003|55112099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 dd+0lWfYB1qr8r8FIMILD1gkN1mgLkiWaJ9+0vwVElzN6Q/WyQX9QnajLM9mvNEM9owGneEuiZMRr9O1tTAeFU7iSMDjO6YGGnHhYrTfpXOrI+DZp7SbjOC2H6w2IO2a3zH99qChoOdBjNx5XbxzsgfqYJR8pLfKdpZGBd/g+FH0FTciC07Q052FU7Mc42yGhGVFTX5Sh/o3QISdxP2xytdS4i9lCSLGEsjQpFMCJc7AnFBaYjf+LIXEDyro9OV+RggF0E50fkvRyYXf09lapBMCEbtKZk8g5DVc2MkTx6MUfBj2KwJ/mYlEstPXkoZOIVT8MyDrwi4vGkfOkGtEaZtWqARDvNMX5rUiluWwOS1dC5rhyNZZ7YUhGbSFDIrreue+9a1irZZn32tgpXud1O7jY96kt560JkmmW2x9h87T+riJDFCHz3rV5GaCS5UwLwS0x1ETc+XKfzH7znhl2ZIiQztlkJWZH5spMseX/9N+dFFsgG8l14dTeJY6E/sQ/wRZ0X92RWwG/m6rSOBZ6UNro/hbVtCI51Nin+Lu5f19aTQbOZHo4Wossgin6kar5MLCTAXsrpXiM/Hl009EYdj0gGa3Dg5Hi8o2d5h5hjqJggS+8kFtyW7Xc8FBWfe5pthHQiZz5zP6Kpr0qz2HKzHwGDWW9WyJgk7pAc4u+m9UeXrrNNg6UmmpH81fJ/lsvhymbY6lkTn3+WphUfBLq+TPBkvjuiDp/jqXljbYIVs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXP287MB4240.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(31052699007)(39142699007)(1800799024)(10067099003)(56012099006)(6133799003)(4143699003)(11063799006)(8096899003)(18002099003)(55112099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?SdAKhwdE+WGVtb/ih9/tbHINTFRy7+Z3LjCZq0wO4gtWAlISFZATzudfshMr?=
 =?us-ascii?Q?da88TYvL+6ic2QyabNVzDO2x4ng6LODPKAUQXKhVBjs9Swgh768nBY0MjqYE?=
 =?us-ascii?Q?844CwWSBnlbZXw/UUkO+91O7OA32f3uzMfn6jNoq7TFOd7yQwFFVk5LQJbMy?=
 =?us-ascii?Q?DNJTPAaXJEWlm5tbBh52hHQDC6wgahm40wkg4ZG6JVECnwWVsmLGqVPN/3vz?=
 =?us-ascii?Q?ucFxO102FYsQyJ58Hbei+A+D/JtFyF8ZNuInXVhcnrs1iY+CUpFO97ZPbam/?=
 =?us-ascii?Q?LEl8e+aPZu8X6t7L6/CRidzBKuE68vreOZX0M/PHEDNsobWVHAQzj1xv0J9X?=
 =?us-ascii?Q?I+Nh4/aJBwfmDBN+gc2qJe++PPhmM7Dw2yB6mSDE1SOmaDeiAPucLyK4j4Cr?=
 =?us-ascii?Q?BzcroUYj9Zt8DBalA0zn8Yn5xPmzwHf3mdKibkJ8kmwl4NrWbA4OCzbgAA6P?=
 =?us-ascii?Q?THBzw6Zg+YHLDtbZ583Y6zwPZGPgY+GuaEDqkAKN0x5dziGwU4pzvERAAthP?=
 =?us-ascii?Q?ffEvXG86iz6eYErmbvgnpnwaAVWJSt0yo+q6he59nAJr1RYu5JYzy4N3Ksxj?=
 =?us-ascii?Q?l5j6rc6F4vv2NoHtjPrZaMGVYguqsg0TQnqAHZiJmAXmvsfKmmUV1pNTev+k?=
 =?us-ascii?Q?PHapPUwiCvNVulp6YSnqthfQXB8a2/ot0xcoSOexCJdbuhKINUe46+aIL82C?=
 =?us-ascii?Q?4F36T8zJeO7rpoi7SV4w0ljjUP0wg/cw7hq0ZejvRcJf1awV2XObY9qIB4Wv?=
 =?us-ascii?Q?ySts1iHV/KO3BjXuSZe79IHpL55mgqZtgDkVN0wWFZcGIXi2klMhdkjgwqsV?=
 =?us-ascii?Q?nCXUJO4bESQdp6pk2aEA8ZmIxplIHcjdjT21mI1uMuJpz/nX40n6QwhxE1no?=
 =?us-ascii?Q?OEJNjCsQXgx04+EjkjrdUutlMR7INZ3j56ak09Xavy/G6NLj87WIasUwqL3p?=
 =?us-ascii?Q?OlKaVjTUq4bsiqPevjirYu/e9CiLcaZzaJhASwLvsMN0ZdywprC7XErzdV1r?=
 =?us-ascii?Q?pcaFs+KQmJXCvObf4bedmi1bzHMzAg3QWkzQWBAwl6js7Vi5HBDhJzc+J0WR?=
 =?us-ascii?Q?D0ClacnH3f0ckYeGFMeTO/8OqgDOX2kUk8pEzVv85Gl7yeuRdCTaB1F+xgAp?=
 =?us-ascii?Q?IyhFKSdvPwQjIJT6SQV/wAlwMUYL5m/KVDBc/XqpL7rc7nDvzxM7vEB1fc9i?=
 =?us-ascii?Q?/dnIxV5SZGa2ORbMXAR3WpRbEKqUKgd6df8lAsONZdw3FmxUIB7I2SXNtS98?=
 =?us-ascii?Q?orAT3LfHBy3DWvjVg8M9/5JHSxcjxvqhXCoKgg+TWbhA9m7QPvr6WqyfU7B0?=
 =?us-ascii?Q?H2/gB0nWa8Y2kEmL7gfpf9PWW7bx8myXqePRzf2Yz2qH0HdLhmr9S3a/yEUx?=
 =?us-ascii?Q?0ps0M/BRRbo8/Z7JSwfDY8ZZaqdiW+8ffJhJz3C2cMOTILAPo6v/NZrvwBd/?=
 =?us-ascii?Q?Sy2bbATWNSQHGtCPI12RdUGbOgbJY9A4Vr0wBEOVoyarEH/le+rrZKZY1ZXd?=
 =?us-ascii?Q?1o/f3Qld7oiVDgd0mKd7Ld2CulDQPV7BIKlZ69cj9F9kHmhYHw9R/sHOhAnL?=
 =?us-ascii?Q?0augmd3nH28g7IhTG6ahxZT89Ri37Eir7IEdlcvmH1aM25diQnhCrQpnS8oW?=
 =?us-ascii?Q?DuKNDL6CvrhKybCgBrG/xzirb6u9c0k1lWhucl5aIB19XExMpda19Zm38+Js?=
 =?us-ascii?Q?kw20DGkrm/W1jmiZej/p+5qCgqRCN1O3MmBwqYSgoj7fnZ27mV1x3uRYQKOs?=
 =?us-ascii?Q?LEOINUq98g=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MAXP287MB42401A9E2E49E3CFB97D1D21EE972MAXP287MB4240INDP_"
MIME-Version: 1.0
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c2a2ca-8a87-42cb-3d0b-08df21e579cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2026 07:02:38.3877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FNOyR/e8S8Sthr15M7m0qieHrWt9GCqEZl1RPHrdTowLPQGhdnK2XN2xOPZho3oIOetOFh+ry8id9IDFyi4VZb7MC2n0J+Ld1dWrHRhMJJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNWP287MB5863
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 07:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247193

--_000_MAXP287MB42401A9E2E49E3CFB97D1D21EE972MAXP287MB4240INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi @Yoann Congal<mailto:yoann.congal@smile.fr>,

Yes, we hit this on our scarthgap platform (systemd 255.21). dlt-system abo=
rted inside sd-journal:

dlt-system[1284]: Assertion 'd->object.type =3D=3D OBJECT_DATA' failed at
src/libsystemd/sd-journal/journal-file.c:3237, function generic_array_bisec=
t_for_data(). Aborting.

The crash is the assert in generic_array_bisect_for_data(). The function re=
ceived a data object 'd' whose object.type was not OBJECT_DATA, so the on-d=
isk journal contents were not what the reader expected. The assert aborted =
the whole process.

The patch replaces the assert with:

if (d->object.type !=3D OBJECT_DATA)
        return -EBADMSG;

A corrupted or changed object is then reported as an error to the caller, a=
nd dlt-system is not aborted. The other hunks make the same change in bump_=
entry_array() and the journal_file_move_to_entry_*_for_data() functions.

The fix is upstream commit 5ee8b3edb385 (v258-rc1) and applies cleanly to 2=
55.21. I'll send a v2 with this explanation added to the commit message.

Thanks,
Suresh H A
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: 02 October 2026 15:17
To: Suresh H A - UpStream <UpStream_IP-SH@bmwtechworks.in>; openembedded-co=
re@lists.openembedded.org <openembedded-core@lists.openembedded.org>; Sures=
h H A <Suresh.HA@bmwtechworks.in>
Cc: Suresh H A <Suresh.HA@bmwtechworks.in>
Subject: Re: [OE-core] [poky][scarthgap][PATCH] systemd: replace a bunch of=
 assert() with friendlier checks

Caution: "External email, be cautious especially with link(s), attachment(s=
) or QR code(s)".

On Wed Sep 2, 2026 at 10:17 AM CEST, Suresh H A via lists.openembedded.org =
wrote:
> From: Suresh H A <Suresh.HA@bmwtechworks.in>
>
> Backport a patch that replaces a bunch of assert() with friendlier checks
> Fix is already available since systemd v258-rc1.
>
> Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
> ---
>  ...a-bunch-of-assert-with-friendlier-ch.patch | 108 ++++++++++++++++++
>  meta/recipes-core/systemd/systemd_255.21.bb   |   1 +
>  2 files changed, 109 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-replac=
e-a-bunch-of-assert-with-friendlier-ch.patch

Hello,

What problem is this trying to fix? Did you triggered those assert() in
a project?

In itself, the patch looks fine but I have to make sure there is a real
reason for merging it. Can you send a v2 with a little more information
about that?

Thanks!
--
Yoann Congal
Smile ECS


--_000_MAXP287MB42401A9E2E49E3CFB97D1D21EE972MAXP287MB4240INDP_
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
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi <a href=3D"mailto:yoann.congal@smile.fr" id=3D"OWAAM960346" class=3D"tWK=
Ou mention ms-bgc-nlr ms-fcl-b">
@Yoann Congal</a>,</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Yes, we hit this on our scarthgap platform (systemd 255.21). dlt-system abo=
rted inside sd-journal:</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
dlt-system[1284]: Assertion 'd-&gt;object.type =3D=3D OBJECT_DATA' failed a=
t</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
src/libsystemd/sd-journal/journal-file.c:3237, function generic_array_bisec=
t_for_data(). Aborting.</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
The crash is the assert in generic_array_bisect_for_data(). The function re=
ceived a data object 'd' whose object.type was not OBJECT_DATA, so the on-d=
isk journal contents were not what the reader expected. The assert aborted =
the whole process.</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
The patch replaces the assert with:</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
if (d-&gt;object.type !=3D OBJECT_DATA)</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; return -EBADMSG;</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
A corrupted or changed object is then reported as an error to the caller, a=
nd dlt-system is not aborted. The other hunks make the same change in bump_=
entry_array() and the journal_file_move_to_entry_*_for_data() functions.</d=
iv>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
The fix is upstream commit 5ee8b3edb385 (v258-rc1) and applies cleanly to 2=
55.21. I'll send a v2 with this explanation added to the commit message.</d=
iv>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11pt; co=
lor: rgb(0, 0, 0);">
Suresh H A</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> 02 October 2026 15:17<br>
<b>To:</b> Suresh H A - UpStream &lt;UpStream_IP-SH@bmwtechworks.in&gt;; op=
enembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembe=
dded.org&gt;; Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
<b>Cc:</b> Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
<b>Subject:</b> Re: [OE-core] [poky][scarthgap][PATCH] systemd: replace a b=
unch of assert() with friendlier checks</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Caution: &quot;External email, be cautious especia=
lly with link(s), attachment(s) or QR code(s)&quot;.<br>
<br>
On Wed Sep 2, 2026 at 10:17 AM CEST, Suresh H A via lists.openembedded.org =
wrote:<br>
&gt; From: Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
&gt;<br>
&gt; Backport a patch that replaces a bunch of assert() with friendlier che=
cks<br>
&gt; Fix is already available since systemd v258-rc1.<br>
&gt;<br>
&gt; Signed-off-by: Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...a-bunch-of-assert-with-friendlier-ch.patch | 108 ++++++++++++=
++++++<br>
&gt;&nbsp; meta/recipes-core/systemd/systemd_255.21.bb&nbsp;&nbsp; |&nbsp;&=
nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 109 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-core/systemd/systemd/0023-journa=
l-replace-a-bunch-of-assert-with-friendlier-ch.patch<br>
<br>
Hello,<br>
<br>
What problem is this trying to fix? Did you triggered those assert() in<br>
a project?<br>
<br>
In itself, the patch looks fine but I have to make sure there is a real<br>
reason for merging it. Can you send a v2 with a little more information<br>
about that?<br>
<br>
Thanks!<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MAXP287MB42401A9E2E49E3CFB97D1D21EE972MAXP287MB4240INDP_--

