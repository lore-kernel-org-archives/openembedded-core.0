Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD3CC001DE
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 09:58:03 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.81])
 by mx.groups.io with SMTP id smtpd.web10.16758.1690279078360339080
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 02:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=PyA5R0xb;
 spf=pass (domain: welotec.com, ip: 40.107.7.81, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kut+aDIPjRCMirlq3BdNtX4AVEyaGHG9EsRgAOMj6SkzvgCeElnU9fPXGz8njuZeW5MquRFeIaoURNFz5wCZr3gObV2KXMs3ZqpX5Nvo+MkpIV9PhRuLa4P12J7zZjyyAgqblm3SKxubN+++KbUxjrohsOYGRP1rVnbM3Qk5xz1tYysGPapUSC3+0dxkmBj/BPgKBZipjFR59rehDnIdxhxcmrX4h2VDHQa0LnAKpB6YXLQfM85m/6sVpPhQbbU231ZQb6XbEPSixZpyVAaulg8QRivEhf0TgFXFfz41aUPjVtuvGSrZzXNq5ZC2PRMXJ4GZ1s/Dk/lR3xUueI6MOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DGup4bydzxtwuWm07r6IYYAKcQmY4M2GnlkMEsmN6c=;
 b=isWpg4TLIzanQOlbm1NwcY+39WOwEFkt1d9/7uPIdufH+Uw65xZSUqpBPk7NQL4ZL/QQ5Hd+tGsUf0jJaBZPhk6sc1b5BNAFPjgIKerQmHiG1fbgu/I0FFbsJLLeK2hjKO03yf9CLp9GqHEGYkWk+bfFEXC+ASljDxd0PHNtoh62SayVfroEdTdNh2BPZuZYffu7s0obRIK0GIM3x/QsMyzCZFuS3z+rSjpepqqq3LB2CnKmfcFmkFY38v77WX488C9MnrOj0T5lfU5zW1qMp5IBtaQlL1r/NcXkTAdZLAa1kUhPCjR5dUt2sXw12NWX64bZ9jG0E4BXnXgYHM3A7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DGup4bydzxtwuWm07r6IYYAKcQmY4M2GnlkMEsmN6c=;
 b=PyA5R0xb6RjHQyIeYWk3y7S8mLVUr4cBgZ+8n/dIu8CVVh7dBjnRTUXDE1gp+oCfZO06oJd8sKUqmVnRhqaK+3mE5YT8YfBZaLB1xcy1uUJ0nI/2Bx0lha+I2DBDOukpiLDYTBZRXFPOskSLtz6sena1WRxrTPjazJb4UBEAlYE=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8523.eurprd04.prod.outlook.com (2603:10a6:20b:432::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 09:57:53 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 09:57:53 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: ODP: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Topic: ODP: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Index: AQHZvm/8VSlpWTizu02GvmSsctoHdK/JY0qhgADUnYCAAACDdYAABaoA
Date: Tue, 25 Jul 2023 09:57:53 +0000
Message-ID: 
 <VI1PR04MB537367B15795A2E226290F849103A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230724204639.353571-1-p.lobacz@welotec.com>
 <VI1PR04MB537371C2BED481FEDB533DB89102A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <20230725092837d3f47a0f@mail.local>
 <177512EFFC81235D.7114@lists.openembedded.org>
In-Reply-To: <177512EFFC81235D.7114@lists.openembedded.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|AM9PR04MB8523:EE_
x-ms-office365-filtering-correlation-id: 5fbda227-51df-4666-0553-08db8cf59d61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WFomYxzTFMQ/e0hlen0Rdgq4nS4Cfltar4b7A2XhmzoA9r1GJJxN0Ix7lSQ4G0tIeIqtMmqO0dyb4EigfKsgVljOlDVwSENMEoZnvONJPOWh7EsXn2lOGYp1zvrOa7am1z4BCfKHC6/J8CqEoZnLX3Wv6TFH22yNQGoL6kPOPLIUZhdvl4jhMEkqHUqY/yTQHgCz4kqlh3LzVoHbdJxEJ7itDP/FKvlh3oNG7dqo7lzT95DIEIfMNhTLwkyE9Te1IsipnUn2G9T2X+6qiZY0hb49tEI+glPTYDiNz4apOE8vfCSRag1aqwKp//PjnHfOO118tTQxNSHX2+7RfVccntpUk/X9Pb/dvtj/5HeNZ7kJG+K8eXSUFh+btM+ThskkLrkKsSP0SChgRSO5CdBn7uF3u6UuCmkk/LgdIMOHvaHxwYSh/CtT62ayNqKPwZbb2/h3G9JlFaWyUduzxY0mfAnSV9OhGIGUBZM+IW9P4sm/oize5pcS5GeOAS5EoKZcjtpS8EF69ZytLRxf4XV8tWGbcvEIfZNdxHGz/k2B9mWpd5U79nKPY4GWi23XMsyBz6ai37rfsBZ7EgXKrMRBsAMmdYFo1/HLWiNdiWFkBU8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(376002)(396003)(346002)(136003)(366004)(451199021)(91956017)(9686003)(7696005)(71200400001)(966005)(45080400002)(478600001)(110136005)(186003)(6506007)(26005)(2906002)(316002)(76116006)(66556008)(64756008)(41300700001)(66476007)(52536014)(5660300002)(4326008)(8676002)(8936002)(66946007)(66446008)(166002)(38100700002)(122000001)(38070700005)(86362001)(66574015)(83380400001)(33656002)(55016003)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?p6zexsRgVEpQW5SyjCJFZIlcRg0ezv8ZKYCpwTesz84mYZN2LZCcNA76NT?=
 =?iso-8859-2?Q?0Cmi5AxK/YvqaTsrt2GG2bBV65fr3iUbp+9+Tb6R3PfbwApllZLy1I+Ym/?=
 =?iso-8859-2?Q?WlC7LqZWOFHn/6DEHA2k/r1uOMY87n/DGr3eWHpcPVwLbx7wxzOEeGd9Vs?=
 =?iso-8859-2?Q?97rRtYVN4vmZM0aFo8x2BvjACbX4doRLrLcIVoOWrID2pGUyoxFi0anTST?=
 =?iso-8859-2?Q?PvCDTGFpsZ3JXMobXJYdDAAqxf8ukKwvYkIJ9tU8bsmhYT0jvBgwxEKUsJ?=
 =?iso-8859-2?Q?DJxq7xYY2cSvjSk1Vfhs6rU8RsGyBU1jTVn53mmoBioftrqBdvPJDdKEyB?=
 =?iso-8859-2?Q?VEaK72U0Kq7NS2Ua13JJLJDOEqehYCQqFB74KsCimjjagJzsC0hZxl5B63?=
 =?iso-8859-2?Q?0pbXv5dcfxZwDCGGITJLEuq1Q8VRDx2ihKgh6EL7rAecREIMYhzik2wKNV?=
 =?iso-8859-2?Q?KMspzvTlW+Lj3r5dBLDc1xeCRw+g0RFklaU5SBwOqsueYZ/NQkX8c8DQW8?=
 =?iso-8859-2?Q?vg5Nfb2Qbtq7AHt0zF8P7ImrN28Ir2T/c1ZJtHISSWapI/hiIs3P67kAam?=
 =?iso-8859-2?Q?HW+JDBlG715+4/YyNuiCFkK6eRzyR236yEooTcmPx7aiXQ++ezOU4nk1Tw?=
 =?iso-8859-2?Q?xiWHajZmdK9aifOaSJiGsiNiSeTtmh7ZPeqWUlluco+v4rexagUWKHx/Is?=
 =?iso-8859-2?Q?AjZt/lNBidoTuf9aNBc+lT+smeKBenFUpEu8tu+4ANP6EdXuH7RA+6aQVu?=
 =?iso-8859-2?Q?hRXinBgxYWhOFlARi85xJ62/PhapApf9Frf9d6lQym3xbmneCakhTrxwiw?=
 =?iso-8859-2?Q?d27kIPriifGljJ6WSk4E6qwUolx3MJnK7JgoykrkRXAIFEI2MLOLox7zwN?=
 =?iso-8859-2?Q?uKBOLPK8zMsQm1Vp5tlmLPghyEQDHTQl3bSMp1zkmB0zAUwo2EUM/3IuFQ?=
 =?iso-8859-2?Q?in6xCzFDq5gjhj4zbvd0YKhej2K1XGEqFFBOGD7pYSjOINr1SMrUzcrA9s?=
 =?iso-8859-2?Q?KIFxkZp0HRc+cDcLE3+/+76/KRA4xM3CaFtPzeogdXWTRHXIEwpKWUrcmX?=
 =?iso-8859-2?Q?HuxXobgHIHDhqtuAofY8VbdrD3wrMlNgKbq8MnrbO91XyzJejuGq33YxFe?=
 =?iso-8859-2?Q?bEK5GkC0AuDiq68moGagmstCrPp7X2OMGn7QbHujqSL7NJF2sVXRJTaJqj?=
 =?iso-8859-2?Q?H4Z8GoRUiP7W1D1RPIDZkiGtB42RmQN10bSLcrPXtE+Xq/hbg71b6jMR6X?=
 =?iso-8859-2?Q?gFSkbh7gBFt9Y8VCnH5UFMnQW0fZqeht3cx+gg9H1cQPBDoRlj9KOKAeJf?=
 =?iso-8859-2?Q?8242SX2v8zP0/sA7oZ/pvqoRE0+aX8PQ0S13VnbfkXH9ingmCXqicdjZKc?=
 =?iso-8859-2?Q?XmVdxLn5t7ZCFqcEH9RLaLrpJXX/E3s21qpA5LupOabZVknpFrAVf5qda2?=
 =?iso-8859-2?Q?ANqDHNgEKNtT47/2AjxPTPFGytvq71keKWmu+BdalNleNyR9CSQtOw/VqA?=
 =?iso-8859-2?Q?n3pIoduS/Lmo1bgfDpTYag5lRSw52famVlNewvio8gzFIkjKBByNrZDk8g?=
 =?iso-8859-2?Q?LvOrUr+UtONdGpNBNIzQupZY34EC0AWaYP3LMN4CnYmo6nkM4NRX2kQAIk?=
 =?iso-8859-2?Q?xG8kTmzizGj4YK3wP1M65HVMxl2WV0GRwO?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB537367B15795A2E226290F849103AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fbda227-51df-4666-0553-08db8cf59d61
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 09:57:53.8258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iChp2hZ4QK1EbNS6Q9zPKNMWFA06xjU2AAbC8QCBz+qfYJl30xZohcM7kcK1zYugPU7SmtOHgkGzKnLleuuYRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8523
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 09:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184829

--_000_VI1PR04MB537367B15795A2E226290F849103AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Yeah, I have just checked it for acpid-src packages and diffoscope worked w=
ithout any errors.

Question, is this test being run with acl or/and xattr? Because from what I=
 remember it was not. Can you check?
If this will confirm, then something is still wrong with the gnu format, be=
cause right now all posix - meaning with acl/xattr support - packages are w=
orking for me.

BR
Piotr
________________________________
Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org> w imieniu u=BFytkownika Piotr =A3obacz via lists.openembedded.=
org <p.lobacz=3Dwelotec.com@lists.openembedded.org>
Wys=B3ane: wtorek, 25 lipca 2023 11:40
Do: Alexandre Belloni <alexandre.belloni@bootlin.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: ODP: ODP: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass:=
 add support for ACLs and xattr

Hmmm, this is odd because yesterday I have checked this and the additional =
parameters added to tar have fixed the issue for me.

But I have added them only for posix tar format, because for gnu format the=
re is no need.

BTW. only these packages are different?

AssertionError: The following ipk packages are different and not in exclusi=
on list:
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/acpid-src_2.0.34-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/avahi-src_0.8-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/bind-src_9.18.16-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/debugedit-src_5.0-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/flac-src_1.4.3-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/libjson-glib-1.0-dev_1.6.6-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/libjson-glib-1.0-ptest_1.6.6-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/libjson-glib-1.0-src_1.6.6-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/libmnl-src_1.0.5-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/libuuid-src_2.38.1-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/log4cplus-src_2.1.0-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/lttng-tools-src_2.13.9-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/python3-numpy-src_1.25.1-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/python3-pygobject-dev_3.44.1-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/python3-pygobject-src_3.44.1-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/python3-pygobject_3.44.1-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/util-linux-ptest_2.38.1-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/util-linux-src_2.38.1-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/webkitgtk-src_2.40.2-r0_core2-64.ipk


Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
Wys=B3ane: wtorek, 25 lipca 2023 11:28
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: ODP: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass: =
add support for ACLs and xattr

Hello Piotr,

On 24/07/2023 20:50:50+0000, Piotr =A3obacz wrote:
>
> Hello Alexandre,
> this is a final patchest which works for me, even with reproducible build=
s, but additionally, with posix format of tar archives.
>
> I hope that this time it will work for autobuild as well.

We are almost there, there are still reproducibility failures which I
guess where hidding in all the other other ones:

https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F117%2Fbuilds%2F3251%2Fst=
eps%2F12%2Flogs%2Fstdio&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C591c597fa=
0a04e4ecb3f08db8cf340eb%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638258=
748639032081%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DXVprHSXzRygzFvdXHDDhEK=
LrqC%2FSN%2FC3Q8%2FyqNF2jE0%3D&reserved=3D0<https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/117/builds/3251/steps/12/logs/stdio>

This time, diffoscope ran:
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yocto.io%2Fpub%2Frepro-fail%2Foe-reproducible-20230724-5av30jl8%2Fpack=
ages%2Fdiff-html%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C591c597fa0a04=
e4ecb3f08db8cf340eb%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C6382587486=
39032081%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D3ml4mQptghh889Urap%2BC5y%2=
BZKhzHXc7rV2anf7bQas4%3D&reserved=3D0<https://autobuilder.yocto.io/pub/repr=
o-fail/oe-reproducible-20230724-5av30jl8/packages/diff-html/>

>
> BR
> Piotr
>
> Od: Piotr =A3obacz <p.lobacz@welotec.com>
> Wys=B3ane: poniedzia=B3ek, 24 lipca 2023 22:46
> Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> DW: Piotr =A3obacz <p.lobacz@welotec.com>
> Temat: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass: add sup=
port for ACLs and xattr
>
> Extend OPKGBUILDCMD variable, with additional parameters, depending
> on target distro features, in order to support ACLs and xattr.
>
> With fix pushed to the opkg-devel:
> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroup=
s.google.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&data=3D05%7C01%7Cp.lobacz%4=
0welotec.com%7C591c597fa0a04e4ecb3f08db8cf340eb%7C25111a7f1d5a4c51a4ca7f8e4=
4011b39%7C0%7C0%7C638258748639032081%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=
=3DIWhy2Cj%2BWUcAlyUY9doZltLivjF9%2FMwHsfgNP%2BGtoLI%3D&reserved=3D0<https:=
//groups.google.com/g/opkg-devel/c/dYNHrLjDwg8>
> opkg-build is able to create tar archives with ACLs and xattr.
>
> Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> ---
>  meta/classes-global/package_ipk.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-globa=
l/package_ipk.bbclass
> index b4b7bc9ac2..a0f106e4ad 100644
> --- a/meta/classes-global/package_ipk.bbclass
> +++ b/meta/classes-global/package_ipk.bbclass
> @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.con=
f"
>  PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
>
>  # Program to be used to build opkg packages
> -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.con=
tains('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_=
FEATURES', 'xattr', '-X', '', d)}'
>
>  OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
>  OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMEN=
DATIONS") =3D=3D "1"]}"
> --
> 2.34.1

>
>
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C591c597fa0a04e4ecb3f08db8=
cf340eb%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638258748639032081%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DN0DPKQWxIBeTfnxUMZGJrpJjFD%2B4fMje%2FD=
vn37%2FJGpE%3D&reserved=3D0<https://bootlin.com/>

--_000_VI1PR04MB537367B15795A2E226290F849103AVI1PR04MB5373eurp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Yeah, I have just checked it for acpid-src packages and diffoscope worked w=
ithout any errors.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Question, is this test being run with acl or/and xattr? Because from what I=
 remember it was not. Can you check?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted1">If this will confirm, then something is still wr=
ong with the gnu format, because right now all posix - meaning with acl/xat=
tr support - packages are working for me.</span></span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted1"><br>
</span></span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted1">BR</span></span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted1">Piotr<br>
</span></span></span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> openembedded-core@lists=
.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; w imieni=
u u=BFytkownika Piotr =A3obacz via lists.openembedded.org
 &lt;p.lobacz=3Dwelotec.com@lists.openembedded.org&gt;<br>
<b>Wys=B3ane:</b> wtorek, 25 lipca 2023 11:40<br>
<b>Do:</b> Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> ODP: ODP: [OE-Core][PATCH v10][master-next 1/5] package_ipk.b=
bclass: add support for ACLs and xattr</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hmmm, this is odd because yesterday I have checked=
 this and the additional parameters added to tar have fixed the issue for m=
e.<br>
<br>
But I have added them only for posix tar format, because for gnu format the=
re is no need.<br>
<br>
BTW. only these packages are different?<br>
<br>
AssertionError: The following ipk packages are different and not in exclusi=
on list:<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/acpid-src_2.0.34-r0_core2-64.ipk<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/avahi-src_0.8-r0_core2-64.ipk<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/bind-src_9.18.16-r0_core2-64.ipk<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/debugedit-src_5.0-r0_core2-64.ipk<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/flac-src_1.4.3-r0_core2-64.ipk<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/libjson-glib-1.0-dev_1.6.6-r0_core2-64.ipk<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/libjson-glib-1.0-ptest_1.6.6-r0_core2-64.ipk<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/libjson-glib-1.0-src_1.6.6-r0_core2-64.ipk<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/libmnl-src_1.0.5-r0_core2-64.ipk<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/libuuid-src_2.38.1-r0_core2-64.ipk<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/log4cplus-src_2.1.0-r0_core2-64.ipk<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/lttng-tools-src_2.13.9-r0_core2-64.ipk<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/python3-numpy-src_1.25.1-r0_core2-64.ipk<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/python3-pygobject-dev_3.44.1-r0_core2-64.ipk<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/python3-pygobject-src_3.44.1-r0_core2-64.ipk<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/python3-pygobject_3.44.1-r0_core2-64.ipk<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/util-linux-ptest_2.38.1-r0_core2-64.ipk<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/util-linux-src_2.38.1-r0_core2-64.ipk<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/=
deploy/ipk/./core2-64/webkitgtk-src_2.40.2-r0_core2-64.ipk<br>
<br>
<br>
Od: Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt;<br>
Wys=B3ane: wtorek, 25 lipca 2023 11:28<br>
Do: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
DW: openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.op=
enembedded.org&gt;<br>
Temat: Re: ODP: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass: =
add support for ACLs and xattr<br>
<br>
Hello Piotr,<br>
<br>
On 24/07/2023 20:50:50+0000, Piotr =A3obacz wrote:<br>
&gt;<br>
&gt; Hello Alexandre,<br>
&gt; this is a final patchest which works for me, even with reproducible bu=
ilds, but additionally, with posix format of tar archives.<br>
&gt;<br>
&gt; I hope that this time it will work for autobuild as well.<br>
<br>
We are almost there, there are still reproducibility failures which I<br>
guess where hidding in all the other other ones:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/117/buil=
ds/3251/steps/12/logs/stdio">https://eur04.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilde=
rs%2F117%2Fbuilds%2F3251%2Fsteps%2F12%2Flogs%2Fstdio&amp;data=3D05%7C01%7Cp=
.lobacz%40welotec.com%7C591c597fa0a04e4ecb3f08db8cf340eb%7C25111a7f1d5a4c51=
a4ca7f8e44011b39%7C0%7C0%7C638258748639032081%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%=
7C&amp;sdata=3DXVprHSXzRygzFvdXHDDhEKLrqC%2FSN%2FC3Q8%2FyqNF2jE0%3D&amp;res=
erved=3D0</a><br>
<br>
This time, diffoscope ran:<br>
<a href=3D"https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-2023=
0724-5av30jl8/packages/diff-html/">https://eur04.safelinks.protection.outlo=
ok.com/?url=3Dhttps%3A%2F%2Fautobuilder.yocto.io%2Fpub%2Frepro-fail%2Foe-re=
producible-20230724-5av30jl8%2Fpackages%2Fdiff-html%2F&amp;data=3D05%7C01%7=
Cp.lobacz%40welotec.com%7C591c597fa0a04e4ecb3f08db8cf340eb%7C25111a7f1d5a4c=
51a4ca7f8e44011b39%7C0%7C0%7C638258748639032081%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7=
C%7C&amp;sdata=3D3ml4mQptghh889Urap%2BC5y%2BZKhzHXc7rV2anf7bQas4%3D&amp;res=
erved=3D0</a><br>
<br>
&gt;<br>
&gt; BR<br>
&gt; Piotr<br>
&gt;<br>
&gt; Od: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; Wys=B3ane: poniedzia=B3ek, 24 lipca 2023 22:46<br>
&gt; Do: openembedded-core@lists.openembedded.org &lt;openembedded-core@lis=
ts.openembedded.org&gt;<br>
&gt; DW: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; Temat: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass: add =
support for ACLs and xattr<br>
&gt;<br>
&gt; Extend OPKGBUILDCMD variable, with additional parameters, depending<br=
>
&gt; on target distro features, in order to support ACLs and xattr.<br>
&gt;<br>
&gt; With fix pushed to the opkg-devel:<br>
&gt; <a href=3D"https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8">https=
://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.googl=
e.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&amp;data=3D05%7C01%7Cp.lobacz%40we=
lotec.com%7C591c597fa0a04e4ecb3f08db8cf340eb%7C25111a7f1d5a4c51a4ca7f8e4401=
1b39%7C0%7C0%7C638258748639032081%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DIWhy2Cj%2BWUcAlyUY9doZltLivjF9%2FMwHsfgNP%2BGtoLI%3D&amp;reserved=3D0</a=
><br>
&gt; opkg-build is able to create tar archives with ACLs and xattr.<br>
&gt;<br>
&gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/classes-global/package_ipk.bbclass | 2 +-<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-gl=
obal/package_ipk.bbclass<br>
&gt; index b4b7bc9ac2..a0f106e4ad 100644<br>
&gt; --- a/meta/classes-global/package_ipk.bbclass<br>
&gt; +++ b/meta/classes-global/package_ipk.bbclass<br>
&gt; @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D &quot;${WORKDIR}/opkg-sdk-ta=
rget.conf&quot;<br>
&gt;&nbsp; PKGWRITEDIRIPK =3D &quot;${WORKDIR}/deploy-ipks&quot;<br>
&gt;<br>
&gt;&nbsp; # Program to be used to build opkg packages<br>
&gt; -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS}&quot;'<b=
r>
&gt; +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS}&quot; ${=
@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.cont=
ains('DISTRO_FEATURES', 'xattr', '-X', '', d)}'<br>
&gt;<br>
&gt;&nbsp; OPKG_ARGS +=3D &quot;--force_postinstall --prefer-arch-to-versio=
n&quot;<br>
&gt;&nbsp; OPKG_ARGS +=3D &quot;${@['', '--no-install-recommends'][d.getVar=
(&quot;NO_RECOMMENDATIONS&quot;) =3D=3D &quot;1&quot;]}&quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
--<br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com/">https://eur04.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C01%7Cp.lobacz%40we=
lotec.com%7C591c597fa0a04e4ecb3f08db8cf340eb%7C25111a7f1d5a4c51a4ca7f8e4401=
1b39%7C0%7C0%7C638258748639032081%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DN0DPKQWxIBeTfnxUMZGJrpJjFD%2B4fMje%2FDvn37%2FJGpE%3D&amp;reserved=3D0</a=
><br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB537367B15795A2E226290F849103AVI1PR04MB5373eurp_--

