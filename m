Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74840EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 12:58:22 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.69])
 by mx.groups.io with SMTP id smtpd.web11.6627.1689166699690470477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 05:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "windows-1250";
 spf=pass (domain: welotec.com, ip: 40.107.20.69, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHoaEoixHLsZOqqg8yiAnt3DBRf4e5m7Q05Y0DdC1ZL5CPn9OkFO4f7wdYbB2xupgXA5+87odoPlgbNyGjdaxUHQrvKE74qZJ3CnOwvuQRve9uCihuY+RkHwuRf8cA4Dvtw0CEy75uChq9DfF7tvHtnQ9J2Bx/HssBfLfe+cvbEhC97U4/wYb58FMx9QgOyo+ONRJRVMBrB90+KVooKK2D5p4Rbzs03wkB/titgrCY2qZxR8HX07G271/1AMAklVLJwZejBNe1P39bqiP9CxFl42Wlv55W5gRNgtYMTPY+g2BDhDIj545Z/I+Ml9BsSxVCrgM6VS0pstvLAlSnKiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7bxcPVM4Lk5NZe0gmn2vO3HxHg6gkpmXcGBZJuiy7o=;
 b=SCMdeL7upqyIRFDavl5w1urxAI6jnNdiWNgdbjdNurpc6ywdiMwYUFKS/XAVj5GBmxG5UuHZ0/3L5mnFFCLjmr6r2SOCoX61r9WAFlO2yeyrzPY5h98CXeIn+XRE0xgCNka+HsVOxWsqQxrDLElHp8NMJluRrkl8tlARhyzCdBSOWB/CNEcC5QhvJtmcA9rIcWRwxw2lEnIZ8BE/kdoQaDnjkqCzkdsCSLbB9QeyB54oKQWZZ6zqXf7wXdpnDy2QMxbwYPxayXaOdRAtboKJsmL58Mq1XUIhaGyVKN5dzY2gAg49Nvky4CBscJ2LX46/Vk2zT/wbG0ZtnlFbygROsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7bxcPVM4Lk5NZe0gmn2vO3HxHg6gkpmXcGBZJuiy7o=;
 b=P3IHMTJbZ7vDgLDcLm3wHbRUeWcL+nhIjQnmDqnzcWJhE9Eio8cRit8W369wNnPcIFRLtPtv/UgJ3RYfpZKI8rMMTdppvQ9S6/VykCy72TjcXMYbPOfrC2vXByVh0pKin2EbuxZ2CU1byndjFgWR7RViIF6DI9BAUPvUDbP/6eQ=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB9PR04MB8284.eurprd04.prod.outlook.com (2603:10a6:10:25e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 12:58:16 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 12:58:16 +0000
From: =?windows-1250?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZtL+KsGEFjVswskCNF4Xt6GDe3K+2F2a8
Date: Wed, 12 Jul 2023 12:58:15 +0000
Message-ID: 
 <VI1PR04MB5373E7F90AE82AABD698F28E9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230710095800.2033309-1-p.lobacz@welotec.com>
 <956c0e383088df5f8568961f57741452a2cb1920.camel@linuxfoundation.org>
 <VI1PR04MB53739BCEE43D11E08D0202E79136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <25f435cb5536206f10a339ed0a20cd9c990a1a9e.camel@linuxfoundation.org>
 <VI1PR04MB5373801F47C0AB61E6DC0EFB9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <57f1d335c7b34bfae272ce2bdd0d141c7e7d72b6.camel@linuxfoundation.org>
 <VI1PR04MB5373A55313F357CB40C72B0A9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <E786EFAE-239B-424A-A0A7-67385E4A076F@arm.com>
In-Reply-To: <E786EFAE-239B-424A-A0A7-67385E4A076F@arm.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|DB9PR04MB8284:EE_
x-ms-office365-filtering-correlation-id: df5e83f2-0cff-4c01-ba82-08db82d7a883
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uqxGCIhMcs8B2a1jZG3UnubOWAmlTLrXPVoKVeZ6YkimRA+qPAuDt64Vee0uiwe2/DRWuWQX4Hk91I43p+6CRxc5H72vvYe9FwLty1JtuCrqN4ql/Qh2sDGEbUHm/C1ypOq+z837D+R7ceWSFRZ6cgbxpckUqtn68EblpfZQ9SgsvOFs7JF0gXIvcsQ5k1S18uM9XiAj/XgxKdzpnEEK4pnYZrgw/xFO1ODVLLT6iZOOxUJuM6p0CzXet7+PKj4asBQnsah9F2trNWCRw5GiLAcPGwnSZRgOVxLHxaRtIMFMwuWFX9agzlXuAO1qF0jOc4qZ7QLZnxpVtrGTWVCZAYVcfVKR6enArl6EiYat1W7+vFi+eeZxsaPZq7Z3GLP6kiiC5oLZWmbLNzkt+oobkva7M4dM0QAa6vaTmI7jjDq6hzTtXL0kVFAbG+pPESzoMWATUZQArVW47kM3MzAmHsSZ145566M6+W/w0h/iYiW2luw7bwhAERcIEt+Z2WGRhEtQV8aeqJFUviqCGI8YH4ByPg/OlRSK1Go/cot8VS6T5rMA8g6RQYUeQxDxlgGbPUyv2IKadTVPBzReHakdYHBxb4nEamJ59guQN34UDxo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(346002)(376002)(396003)(39840400004)(451199021)(54906003)(316002)(71200400001)(66446008)(91956017)(64756008)(66946007)(66476007)(66556008)(76116006)(186003)(45080400002)(41300700001)(6916009)(478600001)(7696005)(4326008)(8936002)(8676002)(53546011)(55016003)(86362001)(166002)(9686003)(52536014)(6506007)(5660300002)(26005)(33656002)(122000001)(38070700005)(2906002)(66574015)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1250?Q?fv51DPuF1ek8xuXi+JUB/2EyvQY4S6dQT62q2CBcN890blq+zgpEb7GL?=
 =?windows-1250?Q?k1OlPqak3kXUfOPGjdpuPso/N2yKODZdpjgI59oJCb1QJsQVg9oZbWdq?=
 =?windows-1250?Q?eJFqAjtWz1KzAM+YYgH1Hno4FsrPdohCSYiEeORS+itKvQ26mdR+dKsA?=
 =?windows-1250?Q?4s0yUSastqxK+L/fz+TKDIPSg9SmU4j9N1PLL8fSNTgMC7wEN6/h1aVf?=
 =?windows-1250?Q?HN+Df65tFlLCWjCQ6HGnp1ty7ubCKIvW/8lQX+iXLZQW22DyzbR5RSaB?=
 =?windows-1250?Q?y8PFv2MCHb/1KqCLh8M39Hut2qqxn+Sk4ofpisRU7NzYHKo7KylRQH9Y?=
 =?windows-1250?Q?rJbCM5qSUF40nfdJgq2cwCYxETXuTUC5JRahY/ETGqg0psiGddJlN1cv?=
 =?windows-1250?Q?xUVks2rlk+1TyIitnmu0zwW0Szj5YtnyR+OumO4NPgqFEzq8kroDlWnQ?=
 =?windows-1250?Q?G/zHcuoxfNs78S4FqWUX8oXa8d6cdyUzVc7Qn/HoDw/A3odvDKDmCbV2?=
 =?windows-1250?Q?LpB+Hfc/5NGxuru8UF6SWYf3th2IwCgZChl55PTsFgHQStjJbAumOpWR?=
 =?windows-1250?Q?uPNm1CZoIE8BLL6EFqfkISDfeSnpdVcSXDv1OJHPJkDitSOBvcN6ne/Z?=
 =?windows-1250?Q?H2KddWnHQkjAy7/TT1iafUGucx20TNUSKqyt0ftG2beUfM6SPnpEFU4b?=
 =?windows-1250?Q?v6su8HCaYl0O2jbkBhc3GJlSjDHqe35WeFmZszaZzXMyHU3Q0EwcfVUY?=
 =?windows-1250?Q?aoY65iLLZcO9vbwl91DPPHeDIpSiZ4bxsqGhMQ/u42ZHxg5DA8D95VfX?=
 =?windows-1250?Q?06133kTQH6u4LLXANn5CNDuKsWWbou+EiiNi6j16s0QrvVQicOo1zPbt?=
 =?windows-1250?Q?l6RFMgF2JAEEKBeU1+B1R4W7J6gAgu6DfoEblkazutmQ6QL2qdwetxx9?=
 =?windows-1250?Q?3dKmqeMuHG2FbMC9Q5MuT8Do8pbRwahB8bKcMYkjnF1Bm2j9qMtfzkRT?=
 =?windows-1250?Q?uXKRopRCchysGxlQGTEhxjWUscNhBTsi6YJbdwh7/gQX1wiboGtuhWPg?=
 =?windows-1250?Q?sFBR1DFb1Rh8i9IQ8cwf55rKuuJ6ivActYIqzvt2GClh9m3Rs7n1Xli0?=
 =?windows-1250?Q?5BrYVJIN3gd3+LYD6AiwejYIk6o2+ckioKuPKuDROOSGHTpE7ofFllJk?=
 =?windows-1250?Q?Hq+lIHj/o7YOczk/OpxHDzAFGD/DbSv29Y3PVNMkN7ox6tCR3ulBUiG0?=
 =?windows-1250?Q?UaOuxt5ZklUeAvcskDEEfinP1Oe7a+5zUiRGYYsUlPXE9FI6903Iwa3Q?=
 =?windows-1250?Q?ReyrdTTzfxuuPpYxNweoAJKKx5i5rr2jHoj/IuwOoUZlvVSyKPNjEkuj?=
 =?windows-1250?Q?0BGZrS7q1WPcb5Z6yT/T7WMtBfvDEdYLYpRnTa0EQGgUj9OfdnsQArxS?=
 =?windows-1250?Q?uV9oI1NXoSC8Mda7njQb29KChP8XzpHHGgSPzZMnUIqP6YYAISVYwzqH?=
 =?windows-1250?Q?gAsBcrKi4uPMrhS9rob2dUi4ALkAwKEYONxTlWZPKU19s6kjdAlth6r2?=
 =?windows-1250?Q?ASTFA8G1u3D+/y6ugf+tcoaBiFDENMwdlZboc65PyW009AWAVjtj989J?=
 =?windows-1250?Q?tQ4p5wlKReCssTa+QQ0Lq5Bhcd7Q6UmzmErKnRnS84gbR/uR+xCp3yTj?=
 =?windows-1250?Q?dLC2j/zJLWIyAbwwaSyTOJ3shF8Peci6amtuYDn0LP5uiVDsQpZqLw?=
 =?windows-1250?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373E7F90AE82AABD698F28E9136AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df5e83f2-0cff-4c01-ba82-08db82d7a883
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 12:58:15.9561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1FyfnrhYTs5mc0Rf0/rOoIj8bX68O/M+v2pvuntEbNKJ7txmdFeVl20KIoqdIbrauHA/z6pE7aAvUBqh+DCMIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8284
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 12:58:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184199

--_000_VI1PR04MB5373E7F90AE82AABD698F28E9136AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

Ok i=92ll change that than.

BR
Piotr

Wysy=B3ane z aplikacji Outlook dla systemu iOS<https://aka.ms/o0ukef>
________________________________
Od: Ross Burton <Ross.Burton@arm.com>
Wys=B3ane: Wednesday, July 12, 2023 2:50:54 PM
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: Richard Purdie <richard.purdie@linuxfoundation.org>; openembedded-core@=
lists.openembedded.org <openembedded-core@lists.openembedded.org>
Temat: Re: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro nati=
ve features support

On 12 Jul 2023, at 13:38, Piotr =A3obacz via lists.openembedded.org <p.loba=
cz=3Dwelotec.com@lists.openembedded.org> wrote:
>
> Guys, the decision is up to you. My first decision was to use it directly=
 in DISTRO_FEATURES_FILTER with this, but also conditionally.
>
> Probably this is why Alex has written to move it to DISTRO_FEATURES_FILTE=
R_NATIVE instead of using it with this bb.utils.contains

FWIW, I=92m with RP: just enable for native.  The build dependencies are tr=
ivial and it=92s one less way things can change and cause problems.

Ross

--_000_VI1PR04MB5373E7F90AE82AABD698F28E9136AVI1PR04MB5373eurp_
Content-Type: text/html; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
250">
</head>
<body>
<div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">Ok i=92ll change that than.</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">BR</div>
<div dir=3D"ltr">Piotr</div>
</div>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div><br>
</div>
Wysy=B3ane z aplikacji <a href=3D"https://aka.ms/o0ukef">Outlook dla system=
u iOS</a></div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Ross Burton &lt;Ross.Bu=
rton@arm.com&gt;<br>
<b>Wys=B3ane:</b> Wednesday, July 12, 2023 2:50:54 PM<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;; opene=
mbedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedde=
d.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr dist=
ro native features support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 12 Jul 2023, at 13:38, Piotr =A3obacz via lists=
.openembedded.org &lt;p.lobacz=3Dwelotec.com@lists.openembedded.org&gt; wro=
te:<br>
&gt; <br>
&gt; Guys, the decision is up to you. My first decision was to use it direc=
tly in DISTRO_FEATURES_FILTER with this, but also conditionally.<br>
&gt; <br>
&gt; Probably this is why Alex has written to move it to DISTRO_FEATURES_FI=
LTER_NATIVE instead of using it with this bb.utils.contains<br>
<br>
FWIW, I=92m with RP: just enable for native.&nbsp; The build dependencies a=
re trivial and it=92s one less way things can change and cause problems.<br=
>
<br>
Ross</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB5373E7F90AE82AABD698F28E9136AVI1PR04MB5373eurp_--

