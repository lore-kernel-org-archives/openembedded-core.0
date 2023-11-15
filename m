Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C744C072A2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 21:49:49 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.84])
 by mx.groups.io with SMTP id smtpd.web11.26014.1700084980609834119
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 13:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@welotec.com header.s=selector1 header.b=qk0bgmJ4;
 spf=pass (domain: welotec.com, ip: 40.107.6.84, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQo6v45PqtVUBX+EOUbWHdw7PKSblvzT7Pdzg+ifpnC6nQm/ti358xVWoDzuecrCPLgO6B6i6M4MBBum//5LrAalb4TCJDfJJ3MgNA8D2nPXuJbo5C3S7zVIb5D93AnWaUm6PrMjHpRZlg+1F3IMSOLQWVKDb5SVWJp+KHy0521WYsjuV3BgQpwPn2ptQ9s0/pUTihXd1ETWtwaeO0jlgjZ89WprZawCFzkfTpgSP5dzFJ/jCZoTIg6aPk85M9POqx4XXLSPJWrDPUQr7qS2rlmd+LLJTsk8FpZMOLaNngqB+wwZfwk5bVD2PIBxLlzyLMYUPqa0TqN1Quh4Z44Meg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXdzpsWyxw2dRZU+zfKyTP5oXS4VSwTMBe8ev0pL8/4=;
 b=gJmTc2byUtv1MWVH5PU3UqWdQnLucJ5WFaZUdvAcUm6C1CqZo5gxu4urZOXy6NsqoC826RcKyrH67MfMt4MNFJTdcpiq9SV9R8kvD4Qx0mOWw8XAoqli82HFULllBjzRJNk/aqJN+iirnljXdOINvgWTCiKB3Ce/LHLcIZ62PBb/vkiPa2AvSwTZu4Wr7U6ytexS8sLGGDkcNQgypCrLs+Lof4JcsxUkEZ+msv8LLwl/LNi1UKo1wAJykxMwFn09sT7LX/mEzq2cqfvIHublwrvgScHtH6OOf92qXNECKfqx5KXoteZ9KE0sejwobD/JswtIcJJhRvlUMXUwtY/63w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXdzpsWyxw2dRZU+zfKyTP5oXS4VSwTMBe8ev0pL8/4=;
 b=qk0bgmJ4kUjTCUblT1I8IK8XkXM1s/jGd81ZW8CTTMVuk8F1LCD8abd9SWwT4xm6Ut9sw2f+7nALVwP4IA0dE6C3G0Dg82U43dfQEht+ydAtVf1enxkeDvKuTMu7OCGN2uwVDe0J9fqWNXg8LloJ6WIFL5GXGRiABQ6bqOg0PjFVTEESFd00mjM2aOOZqxYx5bYVzbRajNiYs2oqiZisEf3U8aJSBeG0VNGHSoASlyZW8t8LSLMY9W+M2GgrP0tjvmVs0GmMdfmeAziWInd8r2rSbWBzerVYslf/ke7jjrG9kGvcLy6teffpFxVZlqSVU5J/4LT/eWX3WMkOlnhQJA==
Received: from DB8PR04MB6475.eurprd04.prod.outlook.com (2603:10a6:10:103::16)
 by PA4PR04MB8015.eurprd04.prod.outlook.com (2603:10a6:102:c6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.8; Wed, 15 Nov
 2023 21:49:36 +0000
Received: from DB8PR04MB6475.eurprd04.prod.outlook.com
 ([fe80::c1fa:48a1:bd41:c906]) by DB8PR04MB6475.eurprd04.prod.outlook.com
 ([fe80::c1fa:48a1:bd41:c906%6]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 21:49:36 +0000
From: =?windows-1250?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: [OE-Core][PATCH] curl-native: add missing ca-certificates.crt
 file
Thread-Topic: [OE-Core][PATCH] curl-native: add missing ca-certificates.crt
 file
Thread-Index: AQHaFA1aEL34UFPxXEilBMSzHZ5gPrB4ieQAgANoxzY=
Date: Wed, 15 Nov 2023 21:49:36 +0000
Message-ID: 
 <DB8PR04MB6475B3F2EE86E9B7725261E991B1A@DB8PR04MB6475.eurprd04.prod.outlook.com>
References: <20231110193716.2198635-1-p.lobacz@welotec.com>
 <99EB7878-D43F-4CB2-AB49-E6626E08FA5A@arm.com>
In-Reply-To: <99EB7878-D43F-4CB2-AB49-E6626E08FA5A@arm.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR04MB6475:EE_|PA4PR04MB8015:EE_
x-ms-office365-filtering-correlation-id: f2485f5f-b10b-4a82-7829-08dbe624c2b4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8yZbK0Ur//OaIwKIa7UXLInSMg6STPuZocks9CWy97fRDDFKLI2kdDnaEEbyZulhWqfaLkIIUMIiFA9GxHfkEQayBcv/2k0NgaRdmjvSvFayNjK4VAfCzlqi8E0SpGHekqwK0SMmAXmhGd6ROyAv1H4qLVCcuUzoinba5ArRpJ0+d+Z6lQhTONiDS4aPaaZJ8yrTFX6XZlI375QY+C1ks/COLGzDGGMl7keORzu9UCuUNGC7NK/3uVKJOQdNb7W6HvdPi4W3iUG3OzqBiPyROKe/HZvmAy+3Vbbmt/XIpaKh6Q5cEXwTlf4ObFp8Ja48q9jJXEV4Q5pm58Iy4uvO4LYZp1jmVBnhXn3C7EjX30d/fWm2pKCevIIAZbILHqz2iM6kdrDFA4lGKcFFLDfkOIDjHSxAI46YAdcfytqRoS01UeKZ1tAwJZy1HSVbP2GOCwmqpHLrwY+aQPFVQ8Ahhq8B0fDLnAFtXDqMo20QkGRGtC5GC9/vcUKEa75QbTVYZBQPZ5d5j8KJh13RYYojUZkbj7G1XcDW/Rs58ZLD1d8pI0QSA4GmM0r/JB30tpPw5Lyl79OjKv784HQV3/mnDKRU5/vtbjmHqYofrwyy132FZKnQ+0VNNCzRzUPwBXPi
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6475.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(396003)(346002)(39840400004)(1800799009)(64100799003)(186009)(451199024)(2906002)(33656002)(41300700001)(8936002)(316002)(66556008)(64756008)(66446008)(66476007)(55016003)(6916009)(71200400001)(166002)(38070700009)(4326008)(52536014)(8676002)(91956017)(76116006)(66946007)(38100700002)(122000001)(478600001)(966005)(86362001)(19627405001)(5660300002)(7696005)(83380400001)(66574015)(26005)(6506007)(53546011)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1250?Q?3InGJ7TGZFKNeqp4Dk7Ln9ZwnZyuos1CkPYv2/JgW7Ev61kZKsqq5mcE?=
 =?windows-1250?Q?lhA2OFbXS72qMPYdTY/tIZMEqL5vO5sn9zY7L7BBIJMpICiyLo8PhLRv?=
 =?windows-1250?Q?USj7aI8SxNHQrTkxQyFLHCdU1I0ePkaAe9VFwtBK6T83DqfYAn1ApM8v?=
 =?windows-1250?Q?Eeq6O1GFwlgdjntRBswsQQuy4lWMayWsz+g5SWGKNxRJKWnSVxF1J5Aw?=
 =?windows-1250?Q?JbKnF5Qw15WvAQzi/+QtNf236Pwd+W/ku2iR6k2c3UOODxyIepd8NnqJ?=
 =?windows-1250?Q?BhyfrHBzoLvy0CBZgyZnkURWcwWdVj/q23UIykYDEPwvAAqT2BMXAPdk?=
 =?windows-1250?Q?cZPg9DSF0yTd5btmDWE98ChctXWTFD+IVR/5aoa4GnBYKxTNcCpfxdyB?=
 =?windows-1250?Q?guRIqwO7S9dQfH3JEvYUzvHYjxh/NlRObHSQzT+F0VTCaoWrbe9gUmsq?=
 =?windows-1250?Q?6hzWVbYxG2MWt++zUNwKVsiAPeyiQY8blqUUwI9gvWTjz8VDBkHrzd98?=
 =?windows-1250?Q?OksG/t0nL16huGxga4y++87MMz4sS954KcEdbecDkwLWRwEqpYugAme8?=
 =?windows-1250?Q?hyaPcZQw3PByO4G4G0mLgrqrELtSVFzGS6s6UhQUSYS4sUYbemMBuhnx?=
 =?windows-1250?Q?k8S/yMxmm8zFKzDLWY9nFsROZrVjxGMV7eltbzHdwU6LKR1aqzZar9hh?=
 =?windows-1250?Q?k/liDjH2UyQHX8cSx7kxaXb8yGNITZnHTbhi4nG8mVgUHoU/K5pP4Q5j?=
 =?windows-1250?Q?7QvAOKIUvEJARQ5MTDUURdzBVSfKV3MwcCDLZcLBXRmsLJvJ/Mpx8fJo?=
 =?windows-1250?Q?B6P+XJum9WqnlR6yZUentHeXc8hRKEkEsCESP59s6WNNVHf8Ai8YH6Yb?=
 =?windows-1250?Q?A4JRxEJVmGCg1F6agh4BuSi8QZ3HaRkKgajoObp4R3rmrEgK5yAEcOFP?=
 =?windows-1250?Q?8oULd3y9qzBx+mwK9fyMhxO4frIxDv2uH+0QLWOt1xBXghmVD9kUxA8C?=
 =?windows-1250?Q?JkRnwTS9KAB6ejODCL8OR/fqVErG73dPrjnnEQckE8FOkwec976/MqHv?=
 =?windows-1250?Q?5F/4Bu89MUr+Xmzu5hOcSyvFwWI6bDw8CF11yb2ciot+tavXbf66Zhjs?=
 =?windows-1250?Q?gn2YW39oEMWg2K/EmbsnUBDOqd1H5dhc5SeXI9AHj87B4Ld3/Z6e38w6?=
 =?windows-1250?Q?CM5eUGxo7bg6b/djCBwhEihxTnmihdiEC5FVZGRdv5R9XyulFOWffpG6?=
 =?windows-1250?Q?1UufYm3dkUq3ZZ2lLV08TVS9adiGQaTrct9yhXilJAYbBZBVU3mQ9vCL?=
 =?windows-1250?Q?sMi27lbvKzHF4XbPggxbNkdme9fX2BFluNjIZHKb0BuHI4xv0KTLh3hp?=
 =?windows-1250?Q?EpXGu8JGeQKWH4WvyeTHaoFyoRhHD717yMOZaYSomW9SE5NCMXPNyvzw?=
 =?windows-1250?Q?amO9XCJCU8XU1HWG539Sk/O531Cmyg1lFCEOqu934mcn71bU7m8rxglS?=
 =?windows-1250?Q?RB2GukKNOOqp2LYUfmBsT05nom4itQNw3wC0/aCRCHoJnKZPXC9iiB6g?=
 =?windows-1250?Q?TJEIOAaAgjJYfs9RLXVqrzvM7JVXH1gBE8nPxF7BGbEB1sF5EDgg2Nj8?=
 =?windows-1250?Q?EKI79dJAI4SxwRmeUROQaxw1lxHGR6wkdWc1pLlqBdeia53aI8vfQyB0?=
 =?windows-1250?Q?r1GZXU1BBe4=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB8PR04MB6475B3F2EE86E9B7725261E991B1ADB8PR04MB6475eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6475.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2485f5f-b10b-4a82-7829-08dbe624c2b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 21:49:36.2738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bsYnHNmjFeog6AXW2CaPCWqUMvI5vMLnEFmvQwq+0rx3DLtuhBuB1avNEgrq4UXEpTJ05kHE5P1OYD2ev4k/LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 21:49:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190742

--_000_DB8PR04MB6475B3F2EE86E9B7725261E991B1ADB8PR04MB6475eurp_
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

As Richard has noticed it was wrong, meaning part of the fix should be plac=
ed in ca-certificates and I even dunno why it was still working... Neverthe=
less I'm sending v2 patchest.

BR
Piotr
________________________________
Od: Ross Burton <Ross.Burton@arm.com>
Wys=B3ane: poniedzia=B3ek, 13 listopada 2023 18:44
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: [OE-Core][PATCH] curl-native: add missing ca-certificates.crt fi=
le

[ross.burton@arm.com przypomina osob=EA, kt=F3ra wcze=9Cniej wys=B3a=B3a ci=
 wiadomo=9C=E6 e-mail, ale mo=BFe nie by=E6 t=B9 osob=B9. Dowiedz si=EA, dl=
aczego mo=BFe to stanowi=E6 zagro=BFenie dla https://aka.ms/LearnAboutSende=
rIdentification ]

On 10 Nov 2023, at 19:37, Piotr =A3obacz via lists.openembedded.org <p.loba=
cz=3Dwelotec.com@lists.openembedded.org> wrote:
>
> By default curl is being configured with:
>
> --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt
>
> which causes an issue for native build, when calling
> curl-native command, as certificates file is missing.
>
> This commit fixes the issue.

I=92m not sure what issue this is actually solving, unless something has ch=
anged in how curl is built.

curl-native has a hard-coded ca-bundle path to $sysconfdir/ssl/certs/ca-cer=
tificates.crt.  We can know exactly what this path is when curl-native is b=
uilt:

$ bitbake-getvar -r curl-native sysconfdir
export sysconfdir=3D"/yocto/ross/build-poky/tmp/work/aarch64-linux/curl-nat=
ive/8.4.0/recipe-sysroot-native/etc=94

This is the *work directory* of curl-native.

If you then link to curl-native in another native recipe and run the binary=
, that libcurl will continue to look in the curl-native work directory whic=
h does not exist if rm_work is being used or curl-native was taken from sst=
ate.  This change does not solve that problem.

Ross

--_000_DB8PR04MB6475B3F2EE86E9B7725261E991B1ADB8PR04MB6475eurp_
Content-Type: text/html; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
250">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
As Richard has noticed it was wrong, meaning part of the fix should be plac=
ed in ca-certificates and I even dunno why it was still working... Neverthe=
less I'm sending v2 patchest.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
BR</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Piotr</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Ross Burton &lt;Ross.Bu=
rton@arm.com&gt;<br>
<b>Wys=B3ane:</b> poniedzia=B3ek, 13 listopada 2023 18:44<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH] curl-native: add missing ca-certificates=
.crt file</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[ross.burton@arm.com przypomina osob=EA, kt=F3ra w=
cze=9Cniej wys=B3a=B3a ci wiadomo=9C=E6 e-mail, ale mo=BFe nie by=E6 t=B9 o=
sob=B9. Dowiedz si=EA, dlaczego mo=BFe to stanowi=E6 zagro=BFenie dla
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
On 10 Nov 2023, at 19:37, Piotr =A3obacz via lists.openembedded.org &lt;p.l=
obacz=3Dwelotec.com@lists.openembedded.org&gt; wrote:<br>
&gt;<br>
&gt; By default curl is being configured with:<br>
&gt;<br>
&gt; --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt<br>
&gt;<br>
&gt; which causes an issue for native build, when calling<br>
&gt; curl-native command, as certificates file is missing.<br>
&gt;<br>
&gt; This commit fixes the issue.<br>
<br>
I=92m not sure what issue this is actually solving, unless something has ch=
anged in how curl is built.<br>
<br>
curl-native has a hard-coded ca-bundle path to $sysconfdir/ssl/certs/ca-cer=
tificates.crt.&nbsp; We can know exactly what this path is when curl-native=
 is built:<br>
<br>
$ bitbake-getvar -r curl-native sysconfdir<br>
export sysconfdir=3D&quot;/yocto/ross/build-poky/tmp/work/aarch64-linux/cur=
l-native/8.4.0/recipe-sysroot-native/etc=94<br>
<br>
This is the *work directory* of curl-native.<br>
<br>
If you then link to curl-native in another native recipe and run the binary=
, that libcurl will continue to look in the curl-native work directory whic=
h does not exist if rm_work is being used or curl-native was taken from sst=
ate.&nbsp; This change does not solve
 that problem.<br>
<br>
Ross<br>
</div>
</span></font></div>
</body>
</html>

--_000_DB8PR04MB6475B3F2EE86E9B7725261E991B1ADB8PR04MB6475eurp_--

