Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFDCC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 12:01:49 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.74])
 by mx.groups.io with SMTP id smtpd.web10.115972.1669636899005921423
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 04:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=QGgjb609;
 spf=pass (domain: arm.com, ip: 40.107.241.74, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFQIM5QNWIbHkwILIjE0Gh8h9ynD5c7VxhPplJnUZa2KzvfEv3YBIO3lpot6XqocAyCT3QA7xLyz4AOF3EALrZ5qbXsep6P85sZbJ+O6MNq9l8FE+iki/fTg24UErqFar6M5xfsK0H60u7C+3WWz0RL8dCF7c7OE/qcr/membSz+dfd0F3LBIRnLnnqeERFvp8WpIdgSfb3Vti/JtwS3JAwGwNHxAH5UL2OYX97OSWxC+3g7CTHjD3ZdLiAG94oTZVlXb049O1AGMEy6ajJTk462LtwMJ9ddAtCnjaOr8RaFHYxY+v1W+naVUfYJmGGrhu9UiZ4sbSlRvVGkCZOQ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zY40ctuEcw7FuavzlS+hfGSz695oCq35IIbqE9O/SWE=;
 b=IlKsEwQV5Vl7qFDwQvV739XRXhJw18ucwJGAgI+q1EciRuk44DDN7f1At+qx8Tnk9qT4kfUBYdQT+klu5GhCmeMgoQKp2LeyoRzY4q2fIexIDtVyAFswXRp6DpohCz/REyQDFad5wQxagnA9q8UeHOfWwRr2vOZg5SrxqZVgExW5unJsmO/jtWdxi/RUJXW1hOI95iTMQ3+M+qDPo1lO/OTDOLuqC4oOUfWnvvasbpd7AvE8WnkqBwBuUr8LCseP8tHT3fro6TY968zK7vIV1vJ9X+kyfKmAY1PFajGT6EbanpId5letmxjgd4DhIZvgEmy3Li6wzs6S4A6uo36GsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zY40ctuEcw7FuavzlS+hfGSz695oCq35IIbqE9O/SWE=;
 b=QGgjb609bXx/FnVftjxHk/KMd6Tc2kiTmYEqk0bQ53xm6hj9FVKiWiGsouBWEmPz5p1IvGmx4N0Yw8RgmQDuEcZgM18H4TheTHJzBq1DRVtMUcS07JNAJpCRpk3ZADeUVun4K2RHhuxEZ7BAAmqnLlinPzLlCaZcW1UtvxLFCDQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5412.eurprd08.prod.outlook.com (2603:10a6:208:186::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Mon, 28 Nov
 2022 12:01:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%9]) with mapi id 15.20.5880.008; Mon, 28 Nov 2022
 12:01:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>
CC: Jack Mitchell <ml@embed.me.uk>, Bruce Ashfield <bruce.ashfield@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] linux-yocto: enable strict kernel module
 signing by default
Thread-Topic: [OE-core] [PATCH] linux-yocto: enable strict kernel module
 signing by default
Thread-Index: AQHZAOY6NwSjufrjw0SOTnetANFEbK5Pz2cAgANQSAeAARMxAIAADZkA
Date: Mon, 28 Nov 2022 12:01:35 +0000
Message-ID: <996263E2-48E1-416A-8BEA-2115A2882069@arm.com>
References: <20221125155412.1119701-1-mikko.rapeli@linaro.org>
 <d2cd0198-ac04-159e-f4c3-42811cd677b5@embed.me.uk>
 <CADkTA4NGsBnujfmkHixs5DhiyRL0--YgnB5x-cY_wfuebVu38A@mail.gmail.com>
 <95775d91-4c85-2681-d902-d84e37aeef77@embed.me.uk> <Y4SXrHS+GGFLDAID@nuoska>
In-Reply-To: <Y4SXrHS+GGFLDAID@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|AM0PR08MB5412:EE_
x-ms-office365-filtering-correlation-id: 82f91750-2d48-449f-a86a-08dad1384c24
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EsSlWP0nLjk3Zq8Kp5KfUKDNXEO6NiPCkuZDpQ5PhlNc2pWsxrsvbx/Vlonlujto6s7tLubiNCzntBiF/TmQVbpGoTO1drCzckhgT2/hb64MKS/ljDFtc0uVPuUAz3fZeEcF4ewDS9u7RjHX2jfHOndC0TZT+3uBrQk7PxwiZUvm4w/qLrGJaLWcyWZolGJtlIefw0sYT8mAA9xBx3BOA5YExpokxRsPjbpI5k2zuvyDENN5bWxeSU+aKj3nlAvoDX7b98iExNeX9W+W8grk8iC5wOCznfy+2B3KFyviozqcDo5aACOBhFsd3JQNkmxrxYAngCt2KIMKE4f2WGV6DxY61zl4rSXkDE8RM89+NFlZ91rPtLuPZfJxGRIz1cQeqZzi9C010lZDBT6H7mSEoGVg7/4i7eAbtKGD64JlphmMGDm003YKu+HETzOKUd0ZQbv1n+Y7pvpOybe91eWv8Bl6a3xy8xv0Z00k5FePHusvdacwdIeHjP8vDcK8MLI8loEvqCxw79TXj+A5OIvdn665wYVnoD4vSVdtUQ3nsQHOuQhJVP8+w8Dlu0CDyU6vN3LhKrv2DRGLxeE6AYrXYQ0ubTNHAH4Be7oFVmvbM6QErbWEMlthhCYBS42/+q/ghCoXw3KGTk8d8DSEXAekfPGq8TXQBviZkPmjajJNTxGMJbO8FV7KpN1pe15mSJgLem84BYWNubfPDX2sFpPpxssWL/s3JzcqLJ4yMfMNIgw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199015)(71200400001)(53546011)(36756003)(26005)(64756008)(122000001)(6512007)(38100700002)(478600001)(6506007)(6486002)(41300700001)(91956017)(66446008)(8676002)(66946007)(76116006)(66556008)(66476007)(33656002)(86362001)(4326008)(38070700005)(4744005)(316002)(54906003)(6916009)(8936002)(5660300002)(186003)(2616005)(83380400001)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?BBhzRoyT6Bsd7obOz3LAAeDa7OPwJWU4aYELiQqt1gHE1zIoSnOYh5WL/J2g?=
 =?us-ascii?Q?GYHHYGKhxmKsRzy+qkTqQ9BKB4i8LbgQ5RMQJcSMlx4qZ7mOdtwXN1HT9Zy7?=
 =?us-ascii?Q?YI7PZxAes902xaQTkA+ttSXHq19f4jHGyVUHM8iFfXjtlnDGe1kd5b3N1Y8H?=
 =?us-ascii?Q?qkoRvkXSOrjnowRrk2sNecqlVZ9aF4oLouruTYYyVD4MA/RbX3KXy3jfgxKo?=
 =?us-ascii?Q?gg5AEXKYP92t8gwPIVsfyO4Y7gNVIbpjP1teo6vcSjbxkZPimaj50dvHH8Ia?=
 =?us-ascii?Q?TBEKVAkwSJTKQXmYa+drP6vaIvVlMr7ggPCxMaa7fIG8Y81GArzdXiAjJKht?=
 =?us-ascii?Q?Uu/crIvDkiN34fklHpvgwWwhGaRP1qboIGQ9nW5HOAzcUYpkq67eIyXxcObs?=
 =?us-ascii?Q?9++DKxfycGBVEpl1Hh2deET0OwKlR+YJDbLnBIRaw2hx3tVzdJLjvj5SRUOG?=
 =?us-ascii?Q?Ni06/78By8AryXvrjhMDZZ/S6CzKm5dpxeEP/OFOLUX4ByB6WV2YfORa7U0v?=
 =?us-ascii?Q?agNwrXF13nbzoLML4dVY2mQcAUyMPE/dlDAI32EwJihrx+fYStS3CJIfCJz4?=
 =?us-ascii?Q?F53KHzwfYOE9vSDXpUFFnWGHfSpGin0CKgTWWcWEsoG9q5SLWnnM5FzoUkuy?=
 =?us-ascii?Q?uK1YOYMLjjV8np8bQfNkUHqIPFslpoJXT3fY5K0ZfqXd+O/Bs5A7HEPorhRF?=
 =?us-ascii?Q?WJD9W8bBGAnuotO5BnH5Khvctjsnj/bz7Ulh9qV9Sb9Z963LpJTkyuLHlK9e?=
 =?us-ascii?Q?maPJHUAA4Fhem/BBjW7PANWTSzWV9nkta2sroh/IbRz9/iJsV0KQD3HhT+IL?=
 =?us-ascii?Q?mB3LouRU2USGjZLYn7pRdOx1ehT4aYpj47eg+5wpKohEILwN/0fEFMsiBJXq?=
 =?us-ascii?Q?rWxI6gWkdMpuzbHfVhx7OCUlzs/mny0oecVjzfu1ZL5w3KU9yeRl6/rrCryg?=
 =?us-ascii?Q?n11EXP3aBxk1+0fZLyCG90B43JbP5Hz/51adAPvi279oa5V6ybyLS5y/RUBQ?=
 =?us-ascii?Q?16+aBK1PF3mHk9oSXBMA0mchDBKSOfTcNtqs2iNYZe80FXZ6+yKG0/0VpMI4?=
 =?us-ascii?Q?C3tqqgthRPtJd6z0W0b5H+O+Cm4wy6ycIDebUtlX2XAHGS2tMjrnYJbjdayS?=
 =?us-ascii?Q?AVhuzIMAQlyUxzGJefI4EB3SCqB6p1s4mYooKEXP17/Vlzi6YPTM7DYeCkDc?=
 =?us-ascii?Q?LB0Ar1pkYtxi1riy9Hx9uENG4blGSCwb2GccXk1m8hwuyxGz+/5WymJ0UPSQ?=
 =?us-ascii?Q?KaV54X6lpeJarsA7D1+fOiPzzYSxI9r2jkfyo28XYqZROM3J/aoMjy7XNwrK?=
 =?us-ascii?Q?4BcGxIPrkwgd1IPm9qBIFgxUf+LZzQgiSGy++gVfZ/Z0lDEQFt6dsogQ8CVd?=
 =?us-ascii?Q?gzD5bWRmb1nJeSp/IKU25ThUR16kq8SU2qEqN7Zid/6TMTziCKl6fDP72K8+?=
 =?us-ascii?Q?cNh261qp0NQA1H6v33016UN6u0YrIXmo69KuQNuRoVt8RPP02KAH8cBVRXlE?=
 =?us-ascii?Q?3rBbnNDXBpG6+kH0lmJVEiBdLbaJ3LAYbG5LcoCkDsOI73Xorw9QZiT3cxX2?=
 =?us-ascii?Q?EGYTUO/dvCzV1HJpTng+szu4rPmVam1ixuBceKTc?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <58EBA65564E9D946B27C4B2AE4472F34@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f91750-2d48-449f-a86a-08dad1384c24
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2022 12:01:35.1409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j5KKZM3zvVXAsFRoUYw51a43yYL15ohoJMBKFlAoTqfeB70E6kpOzWBE0Dm8+6r2CrjztgRDgdCl3ZpvM8Nplw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5412
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 12:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173912

On 28 Nov 2022, at 11:12, Mikko Rapeli via lists.openembedded.org <mikko.ra=
peli=3Dlinaro.org@lists.openembedded.org> wrote:
>=20
> Thus I don't think signed kernel modules can ever be stripped by
> package.py or package.bbclass. It sounds like only option is to install
> modules without stripping and signing to debug packages and then install
> them stripped with and signed to real binary packages.

Which should be doable with a do_package function that runs after the strip=
ping.

Ross=

