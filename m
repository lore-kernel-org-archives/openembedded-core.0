Return-Path: <Mario.Schuknecht@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3243C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 07:18:38 +0000 (UTC)
Received: from FR5P281CU006.outbound.protection.outlook.com (FR5P281CU006.outbound.protection.outlook.com [40.107.149.93])
 by mx.groups.io with SMTP id smtpd.web10.60500.1742887112018697699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 00:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=vamWxzwp;
 spf=pass (domain: iris-sensing.com, ip: 40.107.149.93, mailfrom: mario.schuknecht@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihlbr04RikSzwxioq3xMpwAItyjPYewtToAlAejhnpqiyi5i/oaLgzNMKGeLNe7yHm/bcEFdaIlqIxeQ0zlBtGAxeZfbP00w0UbcPyftFEM/Mm5GY7JoPHl2Cqz9s3ZDqf7KjMdrt7X9MsZXRD9a6KFss0R5fPuTNF2kxFq2kK4+bxvl4A+YksuY76/vus3RhTWI357iYeOC1kqh5UeYzBkfX5ePKrpwpTdjtswrzNSMoVEOwxaHFWzMmhi/rITmK+PgFW6eRP0u5H89JwJaGiMsL9wuKlXWaFS3N+EizHlk32TAvkuC23be0lChgPZGni2uKUi6xl4mSuM+r+/iyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAOtlvLvi2AlGx3b+uzpHmVOYwz81IAuUrWdKQmiTnk=;
 b=nKZJWwuhJGhujzFUIBF7I+qxJj1mBANS6Fy1B+DnsIncyvbGfyTlBAAiYhKzz5BqI87uY3R+AQwPLYRcLzDoBCK40XvmNEXu+ughEatPbZb+LiHzeroEgKstvzJ7Czgk9ocfsSLG3kz8OVRRzkm/95K1/xGrOop5mEwndb49bIt/ZmuUrfr3QX2ttQ5M6WxdOA48Rk+jUIvHMzEb3Ll5weaN5iuBOZZMud55uVSUFWHrJULtir0PNXtz+pnbnzj5jmqKlYhQldieitySWYRwdW45ipw/TOoeOxHaDLmvYzdJbrHhyfCJn/B2N1TEb+BqlSZd58U7PWIgpDPUdpS7ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAOtlvLvi2AlGx3b+uzpHmVOYwz81IAuUrWdKQmiTnk=;
 b=vamWxzwpbbnCLDRfdCEgq10XrAfFqp+lnxeHr9Rgx5cpYIN4D6EMpuOEdPZaMDCXZGiOdjQiFqWhowYfkpdYNBenNnqATUBK3EkAzrSUsYsfvAMFqqqJGpzBZ0CIXuSM/q52lTS5pzWm3RxNSn7dDtJ4vgqrm825J3I9tHOfPt93076+25ZW4xZ2SjBpcVfqjqSKgWeaVm3RWc0pmVFQ96VCupxJukBtxg1y2eZbvo5LsjPXLizNjGA3TjxyIunOWYKC1C7hhX+GWqDRpNgVV18hpK23mjlgbF416HzRDspdXzg3mqZYkqMf3367ctDsbEg6O+yMem4Q+VEfD1P07A==
Received: from FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:34::8) by
 FR5P281MB4175.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:104::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.42; Tue, 25 Mar 2025 07:18:28 +0000
Received: from FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
 ([fe80::6715:31c1:c53c:270b]) by FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
 ([fe80::6715:31c1:c53c:270b%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 07:18:28 +0000
From: Mario Schuknecht <Mario.Schuknecht@iris-sensing.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: AW: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit lib_package
Thread-Topic: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit
 lib_package
Thread-Index: AQHbmnPP0QBf95+sukinf7d01CDLErOBAZGAgAEZvy2AAANiAIAABl8AgAFPrpo=
Date: Tue, 25 Mar 2025 07:18:28 +0000
Message-ID: 
 <FR3P281MB1917204FF59FC089654B5FCFB6A72@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
References: <20250321151245.21227-1-mario.schuknecht@iris-sensing.com>
	 <D8NTZA6A6JBD.5NEFFO2SQS5Q@bootlin.com>
	 <FR3P281MB19170866636FFF96C26464B8B6A42@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
	 <CANNYZj8s=w0CY3VFOCRtzn9z=LeH7H+z_TXS2QcvcRJyeUbAXA@mail.gmail.com>
 <5cdce6f6145ff07615ebf8496b21cdca9c75641d.camel@linuxfoundation.org>
In-Reply-To: 
 <5cdce6f6145ff07615ebf8496b21cdca9c75641d.camel@linuxfoundation.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR3P281MB1917:EE_|FR5P281MB4175:EE_
x-ms-office365-filtering-correlation-id: 8c323ede-7d3c-4d46-1429-08dd6b6d3d75
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?nvkhBCxH/jEPQ6LGqdI7GKBAFQRQlU3ZAHRsRNa7qI34Cbe2YXrUpqrTs3?=
 =?iso-8859-1?Q?0Pj0MXqlkl0xPboRFKQeLzfnCgSwqh2JKdRXvWtrnurGTm9WfddEZ2d2E+?=
 =?iso-8859-1?Q?jmaNjdk8e6MHC+PaZMMaSoCH5RBQNuMfCI+VHA1raN/accExAp6+WgoAuI?=
 =?iso-8859-1?Q?TI9I3aaStc4Hb2NoJFBQS90eLNuYB0hI2f/lilbPaRB5NpROiYWX0glawX?=
 =?iso-8859-1?Q?/y6JRJu0BwShJYgzeUleChKpI2+V2qmtmThyhHC8E0o6MyenqO3uuUVQDm?=
 =?iso-8859-1?Q?QcSRcxcNioFenFjcgCEYTTBf0Hx0yjGaURkeEUfo72SA8oFFw5b46AZt59?=
 =?iso-8859-1?Q?P7pRfs3aKclXTWqGKo8heMZdeYmHV1/dq0eet4nyK1fTD9R33dop+wnC54?=
 =?iso-8859-1?Q?dr4rpCCrqw2LFJjIuRvM1Nn3XhDuDtvGManj9O8D9rm2c0jl4/dCbohJz7?=
 =?iso-8859-1?Q?g1u2A1bb+uwuq0bOh2X51p2CC3n7a5nggwMHKEqyqlkzHOeN0qAqFP0zUk?=
 =?iso-8859-1?Q?bxz49PFEOuhmuXXwLGbmRzVGiWMDN37JWgUsvVC9JeE/WsHBilPA6oOUwd?=
 =?iso-8859-1?Q?dRw367B/C8sf8T9e+DHYX54vVpipEKnqstZq8z1MSmZUTxsnOHZmE/FhkK?=
 =?iso-8859-1?Q?j1fnBs9hSW4unQ8+ePRHfBttuj4xZgdpHebTBz7Y+Hs7xEgYqE8qQCUvqK?=
 =?iso-8859-1?Q?sJHAHA7G/f4TKfnmn5MlLnnbp58hO1CgSp1D03NhCAELaRQopU5sFG0JsT?=
 =?iso-8859-1?Q?1V7UK+I1YPv59ncIVcthW2c/GVRfJ0IvhsFCvWjP4F0banErUz9ActNZKx?=
 =?iso-8859-1?Q?ksDIH6nv+D8JrfncoKJWyKP1C5iz/ROw+Q0bnzDSHxsE5zpt64FkPjnHnS?=
 =?iso-8859-1?Q?jQVs2usw36N1xrv4GREtUO9evi0tHM80jLh5h9744VBXFmnF7m8ccj8O1y?=
 =?iso-8859-1?Q?xecQXaZbHuKMEW4njr1qHiNvGDHJndH17KeADIsL9klN+prK73o/uSn71B?=
 =?iso-8859-1?Q?+lisjlgs0XJm1weFX+Vvoz9cRDdpjqRNfWWxXpQiJkmyGYmUNlo7DXNhPU?=
 =?iso-8859-1?Q?M9rM8prcpuUqL6UhHTyLKF+ixMYDg++qvitXBuaIcLfHrJWE7Y7vT7Bf0r?=
 =?iso-8859-1?Q?/S59yws27GfdSNDBRwv1IkVG8sPitsaOJR9K/qVejt1cIcziPgbFMKHQ9X?=
 =?iso-8859-1?Q?lRVuN2w48HvuFyXgHH5RtByg41rdeppb07QBlyCof+jOFUYzZxbAolU6Wa?=
 =?iso-8859-1?Q?vEvVGOW0fdVgsb2xiz8HF/PrEi/BD/3plSfX/mwqIaUGxtDC2aCLUQIV0A?=
 =?iso-8859-1?Q?1DgigALS9f7BPj71nbz9rkyqwElAU7gTP23L9r9pOwA57xnvWPOlqmJa/E?=
 =?iso-8859-1?Q?eXrCqUuOYyUfgduOGhxDzDjRzRlgt3nyAzqNkjihKrPzHXR9gMudeXA2U7?=
 =?iso-8859-1?Q?jeYFgravRzgy4pExZUXrnBqbHTz1tHFIxPHzW2cYlFHkFCizic00R7dya3?=
 =?iso-8859-1?Q?s=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?VJkBEvgzHMGLs+GvD/mdouVVdra0pB+4vR4ZYkFpWcndb7py48a0xHk+d2?=
 =?iso-8859-1?Q?O4SIaAg/WiJAiknykAkNYFibUHBateBgH9p+t2VHWzCidb/qqhf3nL2WHD?=
 =?iso-8859-1?Q?IUuSTIcgqhxp9LJqF1ikgJDiC9RsnAzZbrW4BJZC530FxORHOKZVOtS6qU?=
 =?iso-8859-1?Q?2O52F6c3Y7y95CSVgMbdm0Hb8cEe3SVHRev7jI3rjUR57SEQbvErb9veMX?=
 =?iso-8859-1?Q?ejgSYC5khpaILLDnGGC6BKkyFLQHniLXEvlDW7ffkuXt+qwgzScDA/PfhK?=
 =?iso-8859-1?Q?QSHlmTcjV5dzsBbwjue0brFA3zEV9FIf9/cUNt1IPab/m1pso9j6CFoD2u?=
 =?iso-8859-1?Q?w7bQQiXfBVaixFzC37QUHfRJnabRpAtnochI1RyYVux4lvF3ap5IrVuojb?=
 =?iso-8859-1?Q?ibPPcltWD9sF5P7YmW9pJPkbWNZH7TyQ8726YGlz5xclZHgjoaFEUnPcSc?=
 =?iso-8859-1?Q?xLJe9b4IXipij1iSusZdzZu6VqWeH/2X2vLY/b2ZFIbDM42f4UjdF9F7F8?=
 =?iso-8859-1?Q?8UabYCq0Bocxyn30mxei5BCEv1XMxs9PY/CLAq+CVLJv6ygqd6t5G/3C0c?=
 =?iso-8859-1?Q?W6X1kZnL/Fnw1xKKKfjp0rD8eu09JMF0RTcPKYdLs/3FindPG0cKKT+0wL?=
 =?iso-8859-1?Q?ycAcbmcR81eFYrnXNLYTOsT44HH9XK7Tm7DOM8lhSkC9sNzhFBDJPDVEck?=
 =?iso-8859-1?Q?Q+9c5NRBxSUJkR2x3BNnUaCIQSPdtwH20/hdg1sLqt3SvGLO5dOWQ2YGRp?=
 =?iso-8859-1?Q?LfhfhDa5D8n73Mb8Oxn3yRKNUo7xjNmjGAxN7OAtoezkbOkYCwDYUgAawB?=
 =?iso-8859-1?Q?WKW0wI0K9C+7ZHmBACZ5ijB1BWDB4HIH/sCtI++n3bDUz5sTTD1ZxuguJ1?=
 =?iso-8859-1?Q?fBOb9FwVg7ZTehy/MPiFAlAnkXX7RDA117i0w5vHZ7r75UbvSrPWoPZbVH?=
 =?iso-8859-1?Q?mAujb3I/1VBjGG0rpa1gmPcKUpTE/2G2qs91VKDkt5IG4ff81Npaah7zKY?=
 =?iso-8859-1?Q?NBQnZ7NRw5wPcty3V1C3bp0TaVE81tcQuO167efj2Xy5LPvR2Mbq8hb9m0?=
 =?iso-8859-1?Q?juLIKLXqiEqgy3b/nDDlBgUPX5KtQTfHgAJ6+TrFIt62fc6A9mehTliEM+?=
 =?iso-8859-1?Q?eLs6LMfu0qnRteaIrR+VRt1qOMecDpWVPOLeWbZ5E/h1hOnhAeopI+yQtr?=
 =?iso-8859-1?Q?9papv3rdaneHghsmOOX2Yo/kQpIgA2w7GP8AGPqzK/SR0jowg4xLCUbGpD?=
 =?iso-8859-1?Q?k89h8aQX5g0r/2eDmdMpYFvDZAi17mg05MEdBpTRVpCp7MoMwDvfO+ExiK?=
 =?iso-8859-1?Q?Gc3MrRvTs2zExX+NhLZSJAE1GkA2gSbEMhTQAiE7u7/zCZrtM7OE18wT6B?=
 =?iso-8859-1?Q?CDo/00KSQOwRWGYi9lVSoelja6fSOByli3+iKZN7LAW35Dx1jGjVYuAChf?=
 =?iso-8859-1?Q?XQFxDals6RqHRV2dclead8P4p3I71ERxgd5bIOBHOhrCFkSYoldZAcLXB0?=
 =?iso-8859-1?Q?/pnrc7a9nGlRG7NMFLjwUn+grPdHXMpGRIhKNSdOva54JHNE6qfuW729uL?=
 =?iso-8859-1?Q?Uozsk0vrNWOrxWxv47JjuZGEg9qqqzcQE8wuTjXI33yPlfvqXXrNK14oEo?=
 =?iso-8859-1?Q?Oi/B24oJAfj0+ZviLGr9NOFbHlJp06V43U8UJudZWsJ47joWma6scbIg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c323ede-7d3c-4d46-1429-08dd6b6d3d75
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 07:18:28.2547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QEFZyXl+MvAJ32O3l5QORc52rKtb4gPmM2w5lG9Zi622JTQp0qSctq8XwMtnnfw8r7bYVB/U8+8yZCozBX4vK0D0XKAXqHGY3l50gVO6kaeQWBTLmXKZ2nn3bh5GinSw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR5P281MB4175
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 07:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213590

On Mon, 2025-03-24 at 11:45 +0100, Alexander Kanavin via
lists.openembedded.org wrote:
> You can see in the error log that this selftest failed:
>
> 2025-03-23 17:20:09,617 - oe-selftest - INFO - RESULTS -
> runtime_test.TestImage.test_testimage_apt: FAILED (69.22s)
>
> You can find what it does here:
> https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/selftest/cases/runti=
me_test.py#n183

Probably worth adding that the command to run this is:

oe-selftest -r runtime_test.TestImage.test_testimage_apt



Hi,

unfortunately I cannot reproduce the bug that the do_rootfs task of core-im=
age-full-cmdline fails.

I used the git poky/master branch, sourced the environment, applied the pat=
ch and startet the test.
oe-selftest -r runtime_test.TestImage.test_testimage_apt

The do_rootfs task runs fine.
NOTE: recipe core-image-full-cmdline-1.0-r0: task do_rootfs: Started
NOTE: recipe core-image-full-cmdline-1.0-r0: task do_rootfs: Succeeded

I see the error in your log file, but I do not see the reason for the error=
.
I am not sure if the gnupg-pg package exists or why it is not installed.
Are there more detailed log files?

Regards,
Mario

