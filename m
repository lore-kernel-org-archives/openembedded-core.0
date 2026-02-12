Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD997EB48F8
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 10:49:43 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42885.1770893343395723023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 02:49:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=DDSp0ngN;
 spf=pass (domain: est.tech, ip: 52.101.70.66, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSWASGHfGMMU5oJiJegpXdorMAsX1u0NcEDfQs949UDGsSphyjb0cVehFcRHQD/zmkeT2FEm57sMXHkcwrX4T8jWDj/EkMYuUU5i6H43FGxoi9oqdHgYLZH8YeQzm4Ikb2rQt/4Tb2Y1x81Mon57BOM9uSPzeyMztDHCBQwHhvNKdCKipYsvMh9j6Ah47bnk5es0H8TsBWpzfmZu7pL/QzyQLzT8879YFwYJdSp2KYHRTI0vwXG2WegWKCtJF6iIm8x9OgdT5+0tcSeCxZTEObndKvCoaXt2DG+/THvEBKjJV3m4mKDRwjGQJfWiT5EiX/55vNmfXzrlkGno1YjJjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SB8+5mzgZM8SjoIzze81oN3/GWSlUiMf5wkBrkxsQI=;
 b=NMGoQ+xKsT091M+4hSjaNScuoEoF3NebV/0KVOD0SRDsp6ejqjdxxPo87P6tRLN2qmOO79L1kDlOWzGl73M6V9z+iENxfvPIAhSOw2V5GW+/NHo0JamZ49V16FchMJZzS9yRDqMNvheXiRRMCbATAub7bng7XpagPe/Jy+/srViVlLEbbtTwOLZLBHqIaOg4ytfgFLvsAfJOA5DVomodwJodZ+J2TUHQX7ADnqOhMFlFE/wNQtXvI6IjQK3BY+2wldGE4fE1v59RRXyHiFY9B+qfrB735EJKK/Zg+vd21Nd2ksD70f5ta/J6Ci1A0/qPGw05TcR8179eiPqW8QQo2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SB8+5mzgZM8SjoIzze81oN3/GWSlUiMf5wkBrkxsQI=;
 b=DDSp0ngN+outUEvYIhW6bghA1xFRnqAEaULoQ1Y6SuVSzTKfhqno+t6+ay1+BTnqpllpiVPjqzTYWrVlDqd3f3U1u9MNK+LiQVf7wIoyKaFkf+bndEsXJgKDooX65EqDkovv4D9WpI+RhvTixjnuPcA/3kba0GcvOmG/ZF/U9QN6sNNc6L4WX4NqtqKmEiEcM1scvlNVM29uJHP9uTyjzkbByjC6dLQVZC0lwbb8+852cCM/caF3L8YGMAv1NrUT2SRVrf4D4oKOB/rTnFnn+C+XOxxTaTEe7gq96jd+oW0Mxyh5HpoPmUOiBMvU4ENtmYz86Nv/jfm6FU/OF4zrTQ==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by PAWP189MB2545.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:35c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 10:48:58 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 10:48:58 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH v2] python3-pip: Backport fix CVE-2026-1703
Thread-Topic: [OE-core][master][PATCH v2] python3-pip: Backport fix
 CVE-2026-1703
Thread-Index: AQHcmqq9Gche4eOOl0GgILJt1IDzFrV9aAeAgAF8wX4=
Date: Thu, 12 Feb 2026 10:48:58 +0000
Message-ID: 
 <AS8P189MB1672D3B811422986B7AB173CB360A@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260210163138.91552-1-adarsh.jagadish.kamini@est.tech>
 <DGC4AJKQVSU7.1VZLAXQQ4326T@bootlin.com>
In-Reply-To: <DGC4AJKQVSU7.1VZLAXQQ4326T@bootlin.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|PAWP189MB2545:EE_
x-ms-office365-filtering-correlation-id: 7add5a36-8b50-4992-ad73-08de6a2453a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700021|13003099007|8096899003;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?eYS8dLI2TjZewNk+xoH9CZ47tMyLYWxwRsHewgPKHIHsa0sU3Ezzuivd6BKm?=
 =?us-ascii?Q?Wa5q6y1DWAcO+VZi+t/+KoQb2CSyhGje/Y/HaHG/vlSlQesY+9M0xvzEnMW5?=
 =?us-ascii?Q?18L7E4i7KdSxdELZiBr0rpPyLe9pb/fqKgQiUue/vcfzS8sqIIUvaW+8YFYx?=
 =?us-ascii?Q?z1MxLNR1yq4YE7ZgsPXJnvSBo2iytIdHAUhZgEg5on3UlHybeQzv0bob6PIP?=
 =?us-ascii?Q?fu9lje08iDvUgfGkDf3+vNk+1TIxQkuBjwVZgK8FaUOKqHkoE+xLvoDfiPY8?=
 =?us-ascii?Q?0DNtDQHivSc31Fxe9FlZB/bquHSW4Ffap8wjv+zXQtHhVKO9/EfS7lJv9mFX?=
 =?us-ascii?Q?n4ssuJLpsi6HYoIpvAsr82wWGt51luR3n+7XOByuEcKSAJcBXLoUess7kUo9?=
 =?us-ascii?Q?zvw0IhP8NwBiMXoTmk/fSPKIMcrlYnsEw5Ln9qFslHR/pfWfFm8cu4/JwpFQ?=
 =?us-ascii?Q?/iCVhsKFnFk3D2jZpjgT0F7Cqbsd9u1Ty1Q1aN3tWar2O+PmfrBOdyqNZRB+?=
 =?us-ascii?Q?S+f/k12Yyen/cO8gLfNg/ab/DU5vBzgHY6fDRFPKWvtJhIXkIoJ2BzkdpaYv?=
 =?us-ascii?Q?HGpVpvtcQQPtsPch3ed2PyXNZgPtjT3wt81DL70p/s5RJrg1cEma31zhPzD2?=
 =?us-ascii?Q?1byvr6XIgbEAkZRr2sw1T6POewogJT5LIIYq2nuBSxAWEgOD0nlA18XkCHyL?=
 =?us-ascii?Q?k8mO6kktFK+66WDsFxvvDp7VzoeAMie8JP/KZkUAITZP/6Ddoe6COjQg5CKi?=
 =?us-ascii?Q?yXD8GrSQvzuhOAUirVtGxyR3La/mRaQ0p7GGduB6NIAb/1ANX/oXvdfj1+6H?=
 =?us-ascii?Q?35x5xthbbqaXXNptexte3my3KGKtcEROTFKvM9KJnbvq564SL5tbOJtGP0Rm?=
 =?us-ascii?Q?vqg7KaMBqdfkuk8f9yV2wbTsuOLcncavL0IPs7niC2g6E5SbE0qbn07B7yCa?=
 =?us-ascii?Q?ql1lVD/eF/jtyHqLcYZdCv7Oj1uIAs3gP1/WESEgcm5Lk0cugBcZJvTK21W2?=
 =?us-ascii?Q?GJh7Be3iqjtSYJKicp2gfYLLandh20FeOkHdWY+wYnpf5VpsQi5H1Us9W33r?=
 =?us-ascii?Q?bkby7kN6dz54vcP2uflrVcAV0Bfd/WdJqVY89U8cMQpnLNlgr9Q+v7tlRkOZ?=
 =?us-ascii?Q?0828v9A3drCukRJBCip+Uk63KvM40Wyr26gaw2hqfiaD8r1q2jHo4Ifaam0u?=
 =?us-ascii?Q?LF4tCVMxNJe3STi942ss6ASmiYgHhRklNw5J6WMxF8nmh/zcN8lwQUmGXOpU?=
 =?us-ascii?Q?ogLqfTQ+c5Bw6nviXQOVRH4ZMjAlVzYrMfILTSsRERWtGaYSpuE8Ej/WZLmS?=
 =?us-ascii?Q?76hSYc//xXLWiWQwfFNSHuhVQRQ0DetsxUvDl3D1yA6XglScnA3YXs4Kag8q?=
 =?us-ascii?Q?P76rE7uqg7H5/r4G6/QD6oNptgiNr8cXiB1C0hOzVtXQhf9lq3rNuJbiwI+g?=
 =?us-ascii?Q?B7t+7FG9SxlISTqqp1p3sGdbJ7PX23PR4X6vAc2/j0TX3jQR2NmpRSKOgkhG?=
 =?us-ascii?Q?OnlvStzVgCOXbwJK7pP7H2hPYct8v/fBYm12iGWLkL4yCRgxkPKfLCNMloY/?=
 =?us-ascii?Q?WjaJt9oQ74zRPxlnJEE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7xOxuDfCG81mn/piZk/WGR5Bq9CFAJ6avQ5aYaiBYfTPzrDgKhIwX+6K2UHR?=
 =?us-ascii?Q?uwiezil7UWmCAnpdrRTNB07Wi+eR3meWFN64YxgzvMrVWAwxCbfKUK/db0bp?=
 =?us-ascii?Q?shD4M3VoDiQYTqd7+T0os85qB2FLeoQikU7bXmxqK3tdeQ1N8bj9CaGxluEY?=
 =?us-ascii?Q?OW+A+3QQ05UbRNMFK4QWoiX+OOLJW51B9sPnW3Bt6KlS4GRp9xULGZlR4v2f?=
 =?us-ascii?Q?eTSmxRzkh4O5w5c+crbFAw9XLxcvpBNcaixtcCOFWeuqB61qCMsBmIHJ3kac?=
 =?us-ascii?Q?bIjLcE4vQdn7onKOyhP+zAUvxzGBwaGOuzG7gMmbs4logvXbunhtFqNHnOk0?=
 =?us-ascii?Q?1KrKyMFeffbo4lUPmB8iIaRWdFF3b82ahezfWJf/9V2LnPm5MVJCg8lqvAO9?=
 =?us-ascii?Q?vFPGFxPfXzxRbwjkpHn3RHpgew4IC+hPaKAc0eQy0Pn0/MKEDTL6M05tEZiN?=
 =?us-ascii?Q?UWcje6CwaJL5CU959eLwNQf7RxFfpJ5/L4L2FfTBDWp5sKhMCj4rUugZo3gZ?=
 =?us-ascii?Q?AyimdftTW7X7nTEVzKMiB0ADtJXGRV+8JTu5d/q1fIDwy4wPZRAG7fChHaeL?=
 =?us-ascii?Q?Qs09xL8AaZETL6ICt9I8dRyDfG9TysDxX5g8HFDoo66dp8Jb8x+NhF7du6P1?=
 =?us-ascii?Q?+PY1Yn/fIuqRNKMPPbcFWqSwfiBZA1mpyuqJXt1D69pg37z8xpQ8pNDwYCZ/?=
 =?us-ascii?Q?PIUYmoC++x4Fdk4IbEpKcQdmkkKDjbEx0IoecZ2nEOry5SO/X16znhmlRBG2?=
 =?us-ascii?Q?HzIF5m0MSpHJ/Ekz/8WZPxhVe1GZ9oU1X9/pRJeNoumDkt6NXDnPZmvOStvV?=
 =?us-ascii?Q?smjxoaN16x7E4+VPV/PdY3hYhyEuK3cA34Cv5i6xEPNvKp4zb0aiudFdB6OH?=
 =?us-ascii?Q?QQ2EiaXpdlzzoj9E/PyTaoMjXVi8BgefEBmO288VPf1qeF1huSy4gnmmlib6?=
 =?us-ascii?Q?8UCb8EZv6UqmeoH6PBLlcOXmYo46BbW4wNMlfyYQUC08PRtC9X0JK/gaN783?=
 =?us-ascii?Q?dTYRzBqkUYhXz5OboUVr5tdGlxW9GjLd0gHnq7/GJkRplwxIe0ntYFlNmTOP?=
 =?us-ascii?Q?qwCj2HIPBQkVPWrGYh+eF0UIKxK0dPIlZrCLETIcu264EZE9CfffvUP6u+HG?=
 =?us-ascii?Q?cbRCF8ugMJfNgbfatLvSIxdcO7hF6PKwEXo3MSPwh9iQeAt/E0grZ8k9yLLH?=
 =?us-ascii?Q?M1zpQHNQZtml3ZfVPtu+Xs5dsSfM/IPtDBiPmFYnsisr8RzMYNZt4yErDXXC?=
 =?us-ascii?Q?+abRPbIu75u1/kIxskhCFVrUdgu72nb8Rfjz/8QuvILnvMJTlYMTEt5PFdSb?=
 =?us-ascii?Q?LMqIeoLVqVuSXPN7ZrlBG5zl3iWxrqr1QD3F3H1XEuWSQScbsxmikDOD8eLr?=
 =?us-ascii?Q?dI+Jxz+7T/RwTM/SrnisXPHEGF7fZCs1tz4JWSOq5GDUMJXKBs1IHnbjKYGc?=
 =?us-ascii?Q?VOUVDwLAMBCo4NgSbwKIbx1L+YaRVGX72kMN1VoxxmH7T4aBREvBDUvgilis?=
 =?us-ascii?Q?eVSUHf01Qq5cBRpiNfUr5DMJUfr6tPCYwHXatQ0xOkHZHKAfw+lC7cCbKoHI?=
 =?us-ascii?Q?jdu8orS6/ktweOtN4bDIL3iFD6RkoSEqQQNuzCCgbCykmhHplhUSRwOvzHZ2?=
 =?us-ascii?Q?v5EjtkNKQQFnytf2sh8qqQ0YzOGF/GW6wUkw5eqFwLlBO+Eb20njR3k+p2fn?=
 =?us-ascii?Q?KrF0iO6fHO/L/V3kPQi4cOOL1S9dX5cYbkxgda/PJSjEKZnNeuzy/Vlir4Rc?=
 =?us-ascii?Q?+iw/yRTEZA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7add5a36-8b50-4992-ad73-08de6a2453a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2026 10:48:58.7295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5HGqmq0D9MlVH9Pf6mtpV5MNdYwBeeObcdNaNVZCExfCujYoBwZgidOeVt++9LtDGU6np6MfVfeeRhVFnzbKzeVJu9836yPKidJJzplV2cA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2545
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8P189MB1672D3B811422986B7AB173CB360AAS8P189MB1672EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 10:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231021

--_000_AS8P189MB1672D3B811422986B7AB173CB360AAS8P189MB1672EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Sorry, I missed the second comment.

I will fix that.

Thanks!
________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Wednesday, February 11, 2026 1:05 PM
To: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>; openembedded-=
core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH v2] python3-pip: Backport fix CVE-2026=
-1703

On Tue Feb 10, 2026 at 5:31 PM CET, Adarsh Jagadish Kamini wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Include the patch linked in the NVD report: https://github.com/pypa/pip/c=
ommit/8e227a9be4faa9594e05d02ca05a413a2a4e7735
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---

Hi Adarsh,

Thanks for the new version. I can see you updated the SRC_URI, but did
you also update for the issue of the patch itself? "b4 diff" tells me it
it the same.

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_AS8P189MB1672D3B811422986B7AB173CB360AAS8P189MB1672EURP_
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
Hi,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Sorry, I missed the second comment.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I will fix that.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mathieu Dubois-Briand=
 &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Sent:</b> Wednesday, February 11, 2026 1:05 PM<br>
<b>To:</b> Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;; =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][master][PATCH v2] python3-pip: Backport fix C=
VE-2026-1703</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue Feb 10, 2026 at 5:31 PM CET, Adarsh Jagadis=
h Kamini wrote:<br>
&gt; From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<b=
r>
&gt;<br>
&gt; Include the patch linked in the NVD report: <a href=3D"https://github.=
com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735">
https://github.com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735=
</a><br>
&gt;<br>
&gt; Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.t=
ech&gt;<br>
&gt; ---<br>
<br>
Hi Adarsh,<br>
<br>
Thanks for the new version. I can see you updated the SRC_URI, but did<br>
you also update for the issue of the patch itself? &quot;b4 diff&quot; tell=
s me it<br>
it the same.<br>
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

--_000_AS8P189MB1672D3B811422986B7AB173CB360AAS8P189MB1672EURP_--

