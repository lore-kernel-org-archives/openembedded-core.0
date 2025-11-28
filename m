Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F6AD116F1
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 12:59:20 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15500.1764334753567692224
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 04:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=kDmCD9s8;
 spf=pass (domain: siemens.com, ip: 52.101.70.38, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4/xBZRiDhwg/5zAFUV0d8WK0JOhdVmoTsv22HtKWtwjv/a3PIAPme087wwTOiIizF3mS5z4Ve2rbD4nTREoUWNQn5BZhcf4byOd+Tm+HhFyzObjH3jB6FBW2mnVB8Rph1bPI04RvrC+WXMB7Jx3zbfQU3mWWfq3kt4TQT+y3Bgmn3QbPVzBKhO0izcAcKxz+Zncw5EMbG0QoiRyDDEU0vTw0xUQ0ehg4h3TSRk1xJeRvxdadL7osE9JXIKrUKuA6smWEEVJWPniJS8LmTig6cU8qW+WGb+PHlmxJFkEzRr1EaTnYu/BsTAJKgNoPDsiBmkz0jgppsOIKn91PcSCaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH4BYsOj/OA2YhjO7hg4R0YejEWV3vrisQDkhgDIcMQ=;
 b=sqq18ciD3B2Ftg/tlYwZcxWOSxdjh1SRbPacxTAFYTeXe3tdT3QoNq19oqPAzbKD9LyUqG3WlXuj4hOEgDR5yLUwMKgDp5hvNejEp/b+itz89yVN3l2HWEHO+t/RfvT+qU71HiiGtdFhvxkjhqOOqdB5b9wKE7P296CZXcd3q7kDCOiMzOdSe0qtwXDPVGa3vUqPtpIlygDfrTyQjZWxj1l65o1KKNHJw/lYU/qkfwp0kX/a5WHO5GSq8wHB2y1dKVh5mNc7lGfDUZjxtO3+o/8qEIKN6yznk0bvB2JjrI+dePNQmb/Vz2lM7AKNN+5yHKiMmiT7khaYq8CdkHzBfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FH4BYsOj/OA2YhjO7hg4R0YejEWV3vrisQDkhgDIcMQ=;
 b=kDmCD9s8FrChmQD1xur70zEh3E2anDITT7ucX1c0i9Vffbbfupdt/h942WkzFCBA729fa3SBAInLz/4u22iRACnKA2jlZOGAzjW3y4HzNHKjkZHBtCJYd4Es4C4CgOF+1HeFdgNpVPklQOoT+xE6fttJ/G9E6S64GP2ldFpfg5xAi7XeuvFoeebuUWmtR2Uv6dzLOMr7otkwAueW0wcMIEbB+xZIJcnnMf+lbObVNOBoO8b05ZvuwucX2AEtTOXYx3SsCmlD+stmOxxqQVUKMJKHWuTuh8TlfWUzQJs8jSY9UhyAGfsBSiIfNJvphHQ2HzaavAVI3jI+U8WVN/IKJA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB5903.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:52d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Fri, 28 Nov
 2025 12:59:09 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9343.016; Fri, 28 Nov 2025
 12:59:09 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Moritz.Haase@bmw.de" <Moritz.Haase@bmw.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Changqing Li <changqing.li@windriver.com>, "steve@sakoman.com"
	<steve@sakoman.com>
Subject: RE: [scarthgap] Backport request for "curl: Ensure 'CURL_CA_BUNDLE'
 from host env is indeed respected"
Thread-Topic: [scarthgap] Backport request for "curl: Ensure 'CURL_CA_BUNDLE'
 from host env is indeed respected"
Thread-Index: AQHcYGHM0duMgcwYj0uzZfgwcY1lZLUIDEMQ
Date: Fri, 28 Nov 2025 12:59:09 +0000
Message-ID: 
 <AS1PR10MB5697A7971D4E3EA334089BA1FDDCA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <PAWPR09MB8030506BF8C97C6737EC5FFFEADCA@PAWPR09MB8030.eurprd09.prod.outlook.com>
In-Reply-To: 
 <PAWPR09MB8030506BF8C97C6737EC5FFFEADCA@PAWPR09MB8030.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=193ec4c9-02d9-4300-b3c4-8ef3be9dcbf9;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-28T12:57:12Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB5903:EE_
x-ms-office365-filtering-correlation-id: 025e054f-e33c-41ae-4d66-08de2e7debce
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?zpviXFSi+5Vn0N4chEYrlXncVg66sK8F7NRthzm0nqoeMSxKGBEkahkb1X3e?=
 =?us-ascii?Q?60R0AQCIRcu4+8DTBhkil8L2lGjAIb5feD6EYBEVyGnH0NLHFiBYXkKaiKI7?=
 =?us-ascii?Q?qBGET5XNj1efxoZGOWYmi1k5Kyy7V/X//ldp0x0gPksAvdgDVK/zGtTQ1Faw?=
 =?us-ascii?Q?MhdEZXzl71eVQ6YkkpJaIm6k1cIjwrjnY2rtpc5NNZnBS6GC/3Dz3YBkFn7W?=
 =?us-ascii?Q?NEv9xlgnhEs5GQoAQIulDycBA2Zg3M2g6tNmJTWAmQVBxC1PF0CDKhpd2uMq?=
 =?us-ascii?Q?Z6u1H1yqcpy6ltMFGfZZn7yPIkNhdovs8xsyBjHJ1rmC8zCYdkOaiGUkIGkB?=
 =?us-ascii?Q?ETg5Qt1nimtKzmyu/ib09o1AzrkMuhWhsc+wjg1yz58KRsJ6S+1LwfLzmn80?=
 =?us-ascii?Q?ZKsdGRBLOWq0RrQcsd23VBPTelqTuWjmiCdmQY5Il2DQwXTZcMEF9jpYBXn7?=
 =?us-ascii?Q?dFEdqa/XHZeitYyKBSJtBF30RvbaTod3hMYgI8RnypMExqclUMbEok3vhQ2R?=
 =?us-ascii?Q?qD4ECCHYtCPP/tPqKaFwRAS9KXGOj8Z8YFwvoRX11D26HoF8eidVDGu3BWnZ?=
 =?us-ascii?Q?sHG3y9ZGeZ3neRaJUEBsoFgzuFr9T3dFBCXFmciN557/E86x1YPPUwRPsux2?=
 =?us-ascii?Q?kZx89rG8ywr/rDnzH9DEnEZZa+AkNajtVtlzYJ2sg8E82CPmUD4a3ofmy+uL?=
 =?us-ascii?Q?kWLgSr28jMZa6xidwympOyiedS8J1ruTWk6q1GMyf5bsbLkaXZkfCtDe3LTZ?=
 =?us-ascii?Q?0bCcbNBsmxTHm9mZkejUiCL8kW6xirAq8JpIYQ8lJI/3F6JJYCOysxkoMyYI?=
 =?us-ascii?Q?EuJL+hJtarehsgbPx2WKVviwmBA3ySocl20KvS98fDuUCj8j6+K1TLl9/NOw?=
 =?us-ascii?Q?N7SiwsmwKJbHZfK+UFg21fwUHySagsks06/3vyQ4TEkQwatU0kZ8kCP6cqiG?=
 =?us-ascii?Q?oskCWS6FZrn+Sf1n6+45LCOAfo9s/R7J2AZIxwTRL5HfGZg4Koa0S44oGAjW?=
 =?us-ascii?Q?P6QSBvI5QGrNJMrPbGIoBV40YLAhhpBILBZSQTYgEZF5ZmO2iaLp+5kGWU/9?=
 =?us-ascii?Q?hhnQkqaJ9ulaoLlZvmJfFvbYjy1GXC5PtnwLrqceVmKXm6Qxo4xlVXs+uYCm?=
 =?us-ascii?Q?inZ9XibtChgsYipyqZVk8uIP/OdtLuA9mSKWq/zfe4WqPn04qENtIqhVqr/M?=
 =?us-ascii?Q?VZ9ElFsQn4OtWrG813m7Kc7BlrSIDjPS1a8CdCSBtMCE8rzMPORCkyxHEuea?=
 =?us-ascii?Q?MC0ImlPbZRSUqAeYSKg8JL8iJf99BEkGVB8PhbyNuSnpPzlG3x2G7hSseREi?=
 =?us-ascii?Q?bChgtTkue/0YjE7XpD8I6mhp3AXLEhqmO7GsFrg3in+SUXJagvlxnBPkwdIn?=
 =?us-ascii?Q?DULEEwzzwS6h+32gi3LJ7Rlj2NCMrP6sfeyjK4uY6cWmxOX+6zIdXS+lTnva?=
 =?us-ascii?Q?9/YJPLmxCh0HH/L+TzC0Cz3hlsd2QBq1MMicS33Da9buUB85WIRI8rq+mX2Z?=
 =?us-ascii?Q?H6u3zzWBAE70GcQFprVMrRNpHqxGtteergTn?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?SUanBpxYS6Yu8963O0hgCiFZiDgLx9ZAzGbNIctb+uLMS1pLqbZqwSARZ2x0?=
 =?us-ascii?Q?a5N/3IRQXlFZBlEgWv0LQl6zwtqfQdV9WiVMZlaeX1e29m6+nDT95Umplkv2?=
 =?us-ascii?Q?o9F+lp0WAkohfS7EdNAA3eBGnyO/+yIuqQ8wXCvmXn1c9hG4KQNOjiQGdf11?=
 =?us-ascii?Q?LT+BC5oglyiZXAX8ksZJx5SZd9sCmvPr5f9pmm6GWAIijNo/ETLDGe6sDt5i?=
 =?us-ascii?Q?FixpUxnKisOyXjRReQ8O3I6Cl9vapFRWSKMu4PyKvZp+wZHU4XsUveZ8KuLV?=
 =?us-ascii?Q?LaB9fuNDKTl+HDmtYHfMzA21MUX2/PVPLLLV4FsxexUc2zGy8+ShY5FL46JD?=
 =?us-ascii?Q?C+RbMo89pzhXOkLaGG2MjxG0G0eMj7e9JY7tHmnynN/yj7tgX1fzhLmphtvF?=
 =?us-ascii?Q?ec0Ltfj53+7EnCQClPYm8lbnikfjhuebhWH0vAAMgAXrEPQiWFnG0BvDxt82?=
 =?us-ascii?Q?d3MfN5XlISDngRHcUcFBA5L5A+43dDNPUamlwengnprpwLkoIfAjS+dtUZr8?=
 =?us-ascii?Q?9SgEWBs/6Lbb8oVAMx8jtTmTwjNQntphBFRtH6bt0r5Ebfecx73rR7DG272i?=
 =?us-ascii?Q?tw4hSPxr5AZ692WngamKF2xKBhAyBUHFJeZr/Ir6eKAvHTwEs/gApMYoC4zT?=
 =?us-ascii?Q?XQgnILKdnsn6fTw57o1KkErvLVWbaYGQqgt/ijtI0Pa7Padc2ZXJZGq2H/D9?=
 =?us-ascii?Q?YineW76Z5I36adY3pLrr44i4d4w9ASvjWNxgMgiEknks2plB3DhRsUbdQhwU?=
 =?us-ascii?Q?Wbjo9jaAQtwSsgtyUiJQELtl59lX5Kn+qJaPW3+zeUQgwBKW5USJvBx24whA?=
 =?us-ascii?Q?/SGpPDk85L4tBYr+/HaypxC+Vra1hknMkQKzlEipkL/VUGzOvSS91SJRHu1N?=
 =?us-ascii?Q?BOanfBD+1brQAJgzV0TOBmB+sdgVDAot87D7p6+6+MvIwW9QL4SInLd9RoEd?=
 =?us-ascii?Q?9dajniD4tMedkZyrkH0YYjpfspKMtwZjz30wU2Rg2/DUxrjliQR64stAPmQQ?=
 =?us-ascii?Q?hkRnioOZi1z+jFuzbQJoz07G3OP810lRXO4bimGzOXvXRmiRpHRTe+1jEnRJ?=
 =?us-ascii?Q?O+Rk2Oxz4YQ2A1y5KXAvW1R2RmP1Lnu0mu+uc5x5DAtgEeW+faNnkEbbxP5h?=
 =?us-ascii?Q?EFbCTCS+tvJqVzQolh4NwbBCWZBOlSw6C6/UyNdNbnVESpDSkayQK4MvDxvd?=
 =?us-ascii?Q?XBLFDyYjYLHPc8A9QJNnbgPhMLwHosBbRf2o/BX2HYwelFJaW53Zdt20i1Zj?=
 =?us-ascii?Q?u68CRTRDPTdyQ2Dmc/bQHxDxiAwEhBu5OX8Rr13jF7T+RiM+/qsbkh2LvYVJ?=
 =?us-ascii?Q?UzbeOHJRkTY9zOxVQfwzppIQ8SceBsyY/iAboqlXTYoxEBBJQ+0iPgAtoLLs?=
 =?us-ascii?Q?+RDL7dAJ5n+QcS0a7efOSk4GmwefOxptL1CgR5HgqRCftvPiOG/+7S0FoLKy?=
 =?us-ascii?Q?Xz7pQ1PEEX6IcWmyTiO1NJxb8k36Q0g6IyitP3fUVyeWcH4s+57mVd4eBrLg?=
 =?us-ascii?Q?Fm53ZztH5Y3kwN8HgRnBqCkcxUZWMlnyjT5+BDp/rJWJHU32XtlIXNHcsGNK?=
 =?us-ascii?Q?uZxKPJJ09C8e9yMzxOQm4oIZ9XOILWODUJgEp55b?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 025e054f-e33c-41ae-4d66-08de2e7debce
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2025 12:59:09.4936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gz3h41kJXDAnrU2Srt0/s+5kGLONDSGuVknRSmvbK1MPaMRUVueMA7QzRhzstRgx1u0N6LmvIYkhmAquOhHZFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5903
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 12:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226904

Please send the cherry-picked patch (resolving conflicts etc) with
--subject-prefix=3D"OE-core][scarthgap][PATCH"

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Moritz Haase via
> lists.openembedded.org
> Sent: Friday, November 28, 2025 13:30
> To: openembedded-core@lists.openembedded.org
> Cc: Changqing Li <changqing.li@windriver.com>; steve@sakoman.com
> Subject: [OE-core] [scarthgap] Backport request for "curl: Ensure
> 'CURL_CA_BUNDLE' from host env is indeed respected"
>=20
> Hi,
>=20
> I'd like to request a backport of 545e43a7a45be02fda8fc3af69faa20e889f58c=
4 [0]
> to Scarthgap, as asked for by the original author of the commits that int=
roduced
> this feature (CC'ed) in [1]. It's a small typo fix to ensure curl in the =
SDK indeed
> respects CA bundle overrides from the host.
>=20
> Thanks,
>=20
> Moritz
>=20
> [0]: https://git.openembedded.org/openembedded-
> core/commit/?h=3Dmaster&id=3D545e43a7a45be02fda8fc3af69faa20e889f58c4
> [1]: https://lists.openembedded.org/g/openembedded-core/message/226750

