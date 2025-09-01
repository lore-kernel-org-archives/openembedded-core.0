Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF02FCA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 17:19:51 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.20])
 by mx.groups.io with SMTP id smtpd.web10.51558.1756733129448992363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 06:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=HAFKek8r;
 spf=pass (domain: axis.com, ip: 52.101.70.20, mailfrom: per.x.johansson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLTF2LMJwBf2PRwR3qMIXfDLtToVpkH7dWJAyKKolIcT9UxhWYRFNXjNHaSrUEE3uq1v3YqfWbnaFXW/I0rvWNszeC2bNT6vsJu3XQgcQVYv0DYjwILy4BIIvUmdBcuPGybIO0/3Q0ZrhzO4nqWkMbzsBF5hd0aGlmCqjNvm7vAld/mbBlYTDy7CpeATezf2m97fK/ZbALYdwn6z+maOjHBBuR/iuDV3KTK4/cRUKbp6NhetR11jud8xINR7kDgDFBj6u+CFBXG9oZ0IVVFru8KkVQKAHlCiTjSQnEesfkp/5ZhSjUq09lvX0182ZswwHHde9TGXOsLSVrpBeDghxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxlUNDPYP2Vg3dI221Buz0AIt+hkDL7mnjJR9+YfjfQ=;
 b=SyFCqAySRIq5O3PRrF4hrBuanS1UMnZ0HQFar6ziiIOqHOJRAtlKb2Y6ErPS3drr8XDxflP0yKrDVRmsAugEDvMSJfSyLzVdenK3QX578y8IPoSME6nZvuSgLAjQMwop0L2Sniba6f9hCA5zzMmm/kUJTQIoUDz35C+H+n+s2HfBhLwo/+Ps25ymRD44u85qwyKdEqBLU4grfHAtA8NbFiURAJs62BAYQx1UDcFlhUFdOeb5vLo1PenTpchovklQUsAvIrDxQNqvsKtvEZKCoUVVx4O24+81ddqmOcj8k1t8yqsM8oGcLgc4D3mwI8KHYE9PihuB67h2vGLPnqMe+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxlUNDPYP2Vg3dI221Buz0AIt+hkDL7mnjJR9+YfjfQ=;
 b=HAFKek8rZlpgfYHN0F77J2aw+fb1/wdZY1Mz/13Jtb5tsCl/upafyeQgfX7J2HTMG0U6RlahuksgZUqbJoN8I6YUVU/amONNY0rw/rvNbWAWflp0GdGp+tJNnFyCEOunDBkBR2ugJK/RKDVxD42ruUl7ldEY8GKijNgWVOgeek0=
Received: from DB9PR02MB8180.eurprd02.prod.outlook.com (2603:10a6:10:30b::15)
 by DU5PR02MB10780.eurprd02.prod.outlook.com (2603:10a6:10:526::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.26; Mon, 1 Sep
 2025 13:10:59 +0000
Received: from DB9PR02MB8180.eurprd02.prod.outlook.com
 ([fe80::f224:e18a:18a7:1112]) by DB9PR02MB8180.eurprd02.prod.outlook.com
 ([fe80::f224:e18a:18a7:1112%5]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 13:10:59 +0000
From: Per x Johansson <Per.X.Johansson@axis.com>
To: Quentin Schulz <quentin.schulz@cherry.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Steve Sakoman <steve@sakoman.com>
Subject: Re: [OE-core] [PATCH] rust-target-config: Add has-thread-local option
Thread-Topic: [OE-core] [PATCH] rust-target-config: Add has-thread-local
 option
Thread-Index: AQHcFcRoOdJrsweXZE+ykZj2AcCwWbR+ItGAgAAzfOc=
Date: Mon, 1 Sep 2025 13:10:58 +0000
Message-ID: 
 <DB9PR02MB8180675CE0224E97D8E0F58ACA07A@DB9PR02MB8180.eurprd02.prod.outlook.com>
References: <20250825133004.3154972-1-perxjoh@axis.com>
 <de3c765c-494f-44bc-8fc1-c2aac5168100@cherry.de>
In-Reply-To: <de3c765c-494f-44bc-8fc1-c2aac5168100@cherry.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB8180:EE_|DU5PR02MB10780:EE_
x-ms-office365-filtering-correlation-id: 60277f60-75b5-48c5-6f39-08dde958fe5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|38070700018|7053199007|8096899003|13003099007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?p8Ha7VDSBOrKYtKYW1QwrCDbUq4P1L3HKC0eo+dE91HokEkPQRZR8LK0pe7O?=
 =?us-ascii?Q?rKEWn2xSYZJ4IIXnbX7eeymzgvBZhc6E0Bh7ohlNLqaTpk/FhiUShm6aWR83?=
 =?us-ascii?Q?d6nzKOYL1mJPgUKd8+xzFZEzzONQ20wzi3tyAu0XphmVErtiXN6qBZzsSWkr?=
 =?us-ascii?Q?CqnY+Idzg3GH6n5rXiN+2meUnmxzztDFpq7PX2wVyesb0Q8AUcj9Vwkp8TCM?=
 =?us-ascii?Q?nMSjEuR7Un/RI/95nrLxpu6e9YEoX4oR39MuhvUy3JBqRIO7VLw7n+dTlZ82?=
 =?us-ascii?Q?92Z6hvTaYzDBOGvu/WAmd/XRGAf3dMJ/eYDfFTwpP2700+YyYKXzpjebPxz6?=
 =?us-ascii?Q?sMNTQEhkxn1F2sOEBVRYE48UjnWjRJ2WM7l8VIt5+zlGGvf+6wSemQCJ6tuN?=
 =?us-ascii?Q?ZhJMd7ET60eJUB8dFRhKyAnQk5n6RLtChiCd8X5GLQkA3Qk9NLYeAxb19pqH?=
 =?us-ascii?Q?AnT+bFlRTonSIWjbdYPT1Muh67hzjRCrOdt8spHWuZYZrcZnSqNGfFMZagpg?=
 =?us-ascii?Q?+GwnouXkUEFmH7CXjmC8pNa4Glzrh/SLKHrdsLUuIWJhEndXH1LW2iyr5w0y?=
 =?us-ascii?Q?NwjSPODqyBpLOHP7FHymEDBVHqaLZhQ6bdItRiEqONVZBPlHn/Sfl4bIyaV+?=
 =?us-ascii?Q?RD4ZXys/3mD0/lR/ppg5lnrPB42JVifze4FY5c2LCDFC1ozgjAZqThDruegd?=
 =?us-ascii?Q?9uqdGwJa/galo/Ccmx44MJ3RFesbmB17jfrv6zdMKI8ElVe4jKjFRjswDjBE?=
 =?us-ascii?Q?z7k36BLaR18XQ8+igwTbOH2Asj56JRjCueHjh3m7lHtoRKJIS9yIeEJvRWiT?=
 =?us-ascii?Q?pZLbx89B4F6ckgu0f/LtIBu540CLBCMFHqDjVhYEZ/zzpCvEL61vSaKhOXCN?=
 =?us-ascii?Q?NROxzACM4xtmc+fyW1hn+WUf6a80FBvrpy7ddHWl2MbMxn3bGgtSSXvNlt8K?=
 =?us-ascii?Q?8hj3adw07iznIvObigj+zNYM5YhSUhm5PGlGJ9h0/w1vgaGaKkq4zrh+6wKl?=
 =?us-ascii?Q?jadX3SH/fok7naBpEaVIYj15dXu5uWPdgqqR6LxiOEuPSgWOB3J3Yp+JTOe8?=
 =?us-ascii?Q?DmLsRPI82kjf3HucHQeQ4w3OTzhNnrapZv/+2f0Whf0jp1jOsDqv8GpiqqGE?=
 =?us-ascii?Q?dZfgbsZFrVkYqt4q6speMFePSIYU0eXbRTWcmNrcewiFM6OOdRLeyUc6Q0vT?=
 =?us-ascii?Q?LwKJ5IsmRIyryOWq3ohs4rlobEgqQJh5tlRYPBGaKFIchAs9Joea346cV7WZ?=
 =?us-ascii?Q?JhIAHCb1lgoKQPugQ6TYeUUBeXddTgGc7yE79r3yJHU+nvQZ5L6RL5UwY5CG?=
 =?us-ascii?Q?hWd4sfnnrJCPyFJruPIvWn0R2typHPQPUwV1aPxFLMGWSvUg/yJjzG4gKb8K?=
 =?us-ascii?Q?C/FKCHYnWtDcLrOXkzjYAyPlPOiPSAkXDXVLMa4RfILYiAV1daHNsJBDqsKx?=
 =?us-ascii?Q?o5Cq6OmRF24=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR02MB8180.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(38070700018)(7053199007)(8096899003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?yHQ9wogB8+bX60A77UMJTQ6glObgK/jxRToSA/69WjIGI1oekKoao9Gq4ow0?=
 =?us-ascii?Q?iSo1NRVwLJruUKIxcyMqIMWgMOoGvWvW6CUBI/EkeSTNWO1lfCmZ1DrOUXfN?=
 =?us-ascii?Q?tFsnBLlCTSR6LzFy9Xev1PREd1ovL2Q3gqF9EaV3NkwgHznpusBDKeqNdB20?=
 =?us-ascii?Q?ef1D0JlkvWW1JdgdjFKF2DxdpjPkPVYt1hvTwz/g6LEpGpVnGSfVEVyeTkki?=
 =?us-ascii?Q?1jnQzV/e+jqXXy196mvibZOSMMkS3lW4YDnxVqYN6IW+tuaY6AmDdmuA0sAt?=
 =?us-ascii?Q?3Vk01h1vjN7SrbwouYgCfXWb3/srCbR7vmgXmYBufQ8NWLlcycjeC6cbGonF?=
 =?us-ascii?Q?BYpyDCRtGJzvO5WJrznLJH88DPhKLt9Nzo7IEodIK0Zp26xL+7EQEmrGtDQo?=
 =?us-ascii?Q?mp2KeMwRfPdH2v7blmUC+sz9LAtXJJ7j/FolfW5Kv3P7IkCfamD7d4h85Sn3?=
 =?us-ascii?Q?008Yjcn2b5DupQ6aFWt94KPB34jb5/oQS6F04VsJ/IZPl5mdTN7Y4XfUfaMm?=
 =?us-ascii?Q?hYdXv3imJQWdpIrlM5vLLMZMDyRWBvKcqNcbc38rogSkTz/pO0afB3w4ixHH?=
 =?us-ascii?Q?0mhB6VXgWYipR/URc8DLBPs1812N0pnYsYazfqrnvycfBe/K/4DU16M8zR+K?=
 =?us-ascii?Q?vYp4fVsDIekFvsSP0gX0Bh2tkJJyoU72bi+bDSQUWoFAvfU9nall1ik1XH5g?=
 =?us-ascii?Q?pENZf78Bh4ysgGXymkNW/PvM69tGiT0Kco/4IaYbMNhLCqsWw6bPIO6SMrPm?=
 =?us-ascii?Q?WFoZTE6EYTWAD4AW2jOH+bNvVPASTr+syBP7hKQFw6EGIvK/Vtu23uzsIXAR?=
 =?us-ascii?Q?/7Kfgit+vuQEPJaJCxVyq+7fdabKwCtQuVgH22hNlX5cVZgoSseWMMHJ1pSC?=
 =?us-ascii?Q?mfqXQYr9WHpbg8RCDQK3b2YVkkfJAseAiUDeqzbEtJCrHL5dUkKi5aijZqsY?=
 =?us-ascii?Q?nQJaHOBxTVUvtCAB8txptqWx3KMz5Npj3rInxU0iVsZVwNMRwBoXNWvi0AGb?=
 =?us-ascii?Q?1Lxrjk1YvCfhHyGoYJxz4bA2ou6WETyQfzdMk3aiVAclXXNXnFsoGF8ne5mB?=
 =?us-ascii?Q?m1rN3eZ2IVtLYHklaXM98VMRI3/bybx4EST+mbHvrSJn6hotjkX7oPaM3Sn0?=
 =?us-ascii?Q?xYCJT6Dyd+nGJdo9qpyqNf3muNP1KC4CNSqe9yeouaDom62JyitKFUzqb/Vc?=
 =?us-ascii?Q?mH3eh3i4aFb+sPuAVIFMCzt7cHk44eJ7KJnCRra7+8sjL4OFp/xABB1c6g25?=
 =?us-ascii?Q?blH554JDCuKxhPiXojr79H2rT1odxPZvpEQUnh6vIh91vlnwRQkfZqs7hjW7?=
 =?us-ascii?Q?+t6vmVULwjcGNtMg72UfH2hay1TlGYb6rGcfsO8DbALWpdsgq2G3r/x18Jt4?=
 =?us-ascii?Q?mMcaWDMg0KHOVnl0CbjtEVS7uTTupQW4sDo3yOuY3e3UQ7KJ5DxsnL1GJmET?=
 =?us-ascii?Q?r/sMlj1BvAq+OFz1YAakoMMwDzkczg2GYwC8JwcxbHofiGhxD/W7Hz2onIAG?=
 =?us-ascii?Q?fLXIE8A03gjiNTOHEv8LQFciGoA6dXMmnxc1itiBsOppWhe6MoynqqR+l99c?=
 =?us-ascii?Q?wS4tqjQIHNQsbq1xZuQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB8180.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60277f60-75b5-48c5-6f39-08dde958fe5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 13:10:58.9987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V4EDh7L+pNxcnL99iFOo4OkNtlyfIATU9YKzKbS/UIRyLedtT0F5gi9eqoIqhoKfJ1KK2GMZdNvIEFsz5d+7sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10780
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB9PR02MB8180675CE0224E97D8E0F58ACA07ADB9PR02MB8180eurp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 17:19:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222675

--_000_DB9PR02MB8180675CE0224E97D8E0F58ACA07ADB9PR02MB8180eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This started to cause trouble for us after the upgrade to walnascar with Ru=
st 1.84.1 which included this commit https://github.com/rust-lang/rust/comm=
it/d868fdce6b9ddef6abcc8de86b3ba8459def36a2. So I think that it should atle=
st go into walnascar.

/Per
________________________________
From: Quentin Schulz <quentin.schulz@cherry.de>
Sent: Monday, September 1, 2025 11:59
To: Per x Johansson <Per.X.Johansson@axis.com>; openembedded-core@lists.ope=
nembedded.org <openembedded-core@lists.openembedded.org>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [OE-core] [PATCH] rust-target-config: Add has-thread-local opt=
ion

[You don't often get email from quentin.schulz@cherry.de. Learn why this is=
 important at https://aka.ms/LearnAboutSenderIdentification ]

Cc Steve for backport to stable releases?

The introducing commit goes back to langdale so backporting to scarthgap
and walnascar would make sense to me? @Per x Johansson/@Steve, what do
you think?

Cheers,
Quentin

On 8/25/25 3:30 PM, Per x Johansson via lists.openembedded.org wrote:
> [You don't often get email from perxjoh=3Daxis.com@lists.openembedded.org=
. Learn why this is important at https://aka.ms/LearnAboutSenderIdentificat=
ion ]
>
> The "has-elf-tls" option was removed by the commit
> 8e1614a906086fb46c5dd7b7f2dffab91194165c. However is should have been
> renamed to "has-thread-local", since it was renamed and not removed in
> rust by this commit.
> https://github.com/rust-lang/rust/commit/391332c5d9d5a5e97a0d36e011a87ad4=
3045cfd3
>
> Change-Id: Ia1fdf7698ebeef62a88052713645d5b499164353
> Signed-off-by: Per x Johansson <perxjoh@axis.com>
> ---
>   meta/classes-recipe/rust-target-config.bbclass | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classe=
s-recipe/rust-target-config.bbclass
> index cac6e90a9e..0df6f0904c 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -418,6 +418,7 @@ def rust_gen_target(d, thing, wd, arch):
>       tspec['linker-is-gnu'] =3D True
>       tspec['linker-flavor'] =3D "gcc"
>       tspec['has-rpath'] =3D True
> +    tspec['has-thread-local'] =3D True
>       tspec['position-independent-executables'] =3D True
>       tspec['panic-strategy'] =3D d.getVar("RUST_PANIC_STRATEGY")
>
> --
> 2.39.5
>
>
>
>=20
>


--_000_DB9PR02MB8180675CE0224E97D8E0F58ACA07ADB9PR02MB8180eurp_
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
This started to cause trouble for us after the upgrade to walnascar with Ru=
st 1.84.1 which included this commit
<a id=3D"LPlnk681897" href=3D"https://github.com/rust-lang/rust/commit/d868=
fdce6b9ddef6abcc8de86b3ba8459def36a2">
https://github.com/rust-lang/rust/commit/d868fdce6b9ddef6abcc8de86b3ba8459d=
ef36a2</a>. So I think that it should atlest go into walnascar.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
/Per</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Quentin Schulz &lt;qu=
entin.schulz@cherry.de&gt;<br>
<b>Sent:</b> Monday, September 1, 2025 11:59<br>
<b>To:</b> Per x Johansson &lt;Per.X.Johansson@axis.com&gt;; openembedded-c=
ore@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;=
<br>
<b>Cc:</b> Steve Sakoman &lt;steve@sakoman.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] rust-target-config: Add has-thread-lo=
cal option</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[You don't often get email from quentin.schulz@che=
rry.de. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
Cc Steve for backport to stable releases?<br>
<br>
The introducing commit goes back to langdale so backporting to scarthgap<br=
>
and walnascar would make sense to me? @Per x Johansson/@Steve, what do<br>
you think?<br>
<br>
Cheers,<br>
Quentin<br>
<br>
On 8/25/25 3:30 PM, Per x Johansson via lists.openembedded.org wrote:<br>
&gt; [You don't often get email from perxjoh=3Daxis.com@lists.openembedded.=
org. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
&gt;<br>
&gt; The &quot;has-elf-tls&quot; option was removed by the commit<br>
&gt; 8e1614a906086fb46c5dd7b7f2dffab91194165c. However is should have been<=
br>
&gt; renamed to &quot;has-thread-local&quot;, since it was renamed and not =
removed in<br>
&gt; rust by this commit.<br>
&gt; <a href=3D"https://github.com/rust-lang/rust/commit/391332c5d9d5a5e97a=
0d36e011a87ad43045cfd3">
https://github.com/rust-lang/rust/commit/391332c5d9d5a5e97a0d36e011a87ad430=
45cfd3</a><br>
&gt;<br>
&gt; Change-Id: Ia1fdf7698ebeef62a88052713645d5b499164353<br>
&gt; Signed-off-by: Per x Johansson &lt;perxjoh@axis.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; meta/classes-recipe/rust-target-config.bbclass | 1 +<br>
&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/cla=
sses-recipe/rust-target-config.bbclass<br>
&gt; index cac6e90a9e..0df6f0904c 100644<br>
&gt; --- a/meta/classes-recipe/rust-target-config.bbclass<br>
&gt; +++ b/meta/classes-recipe/rust-target-config.bbclass<br>
&gt; @@ -418,6 +418,7 @@ def rust_gen_target(d, thing, wd, arch):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tspec['linker-is-gnu'] =3D True<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tspec['linker-flavor'] =3D &quot;g=
cc&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tspec['has-rpath'] =3D True<br>
&gt; +&nbsp;&nbsp;&nbsp; tspec['has-thread-local'] =3D True<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tspec['position-independent-execut=
ables'] =3D True<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tspec['panic-strategy'] =3D d.getV=
ar(&quot;RUST_PANIC_STRATEGY&quot;)<br>
&gt;<br>
&gt; --<br>
&gt; 2.39.5<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DB9PR02MB8180675CE0224E97D8E0F58ACA07ADB9PR02MB8180eurp_--

