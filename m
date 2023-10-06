Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8847CE9412F
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 21:43:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.44])
 by mx.groups.io with SMTP id smtpd.web10.6496.1696628629095490420
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 14:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=C/Bg5x9W;
 spf=pass (domain: axis.com, ip: 40.107.22.44, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9tzcZOkYv4kDy66Ei13PEDSLu7jwVyPj61jey/KxAUrcbKQYF2djGlyehkH7puTW64HWFhMWYKgnZDkA6Ftnoo9knqfCFkJhZOBwMwUkWXBnbBYxoQb9SVueIqoJ3si6f519BEZBuhReQ3zKYwMwChF3og0f1QoN5dYUxYWyJw0dwbUBBaMJK+mQH0skqnDIrycCAgeTjtG8r1Q1udlXjz8WiaZwxR1Wf0tR4N5atMOFkJO0s9cc/Pd9voff5WdnVa7CXe/QDIkYr+grLrumymYtxOl7OmLqiNyHHFrQSMjb2TS4+pmsCvMc9G3jid4+UvyEpJaZHYAbJE1lfpHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tjp4A3tFAS4L01py35+50yXDZHqWo3cN9xBuZP0glAk=;
 b=MKFrNM9CXZHIOFzb3pcynKmT9B87ulXZdSDww5N1RhKdpsrO7fkaJ+5Omj+T0ilSlMujRkuVPBEh2RkLnN0cl90u87cHDYV/dyddp2MCeL+aQD/Omml1n0vwXcHd6e0FF9R3uFHj7KR/iphPvOWPQMmV+bjGPU9fbmmRJ7dT2CWvanuTRAwwUfmGXHQdqmYaVDUaRhbayA5SGFcUr/uJE56RZElTOvnQr04qlIEqjqvPrBcqYupnIID57Oll7vgwiJARbrZzW0AY706f/qI7rgHyJxelUqbI06fBqK6c/hJphUyVd5OZvY8iNQwbZoxl07O2+njBDS5kZf081C/gUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tjp4A3tFAS4L01py35+50yXDZHqWo3cN9xBuZP0glAk=;
 b=C/Bg5x9W4pUvz6GR9EYJ59v85Ob5r8Me1B5QtHSRmZvmBCjxwlZD0aKGXyWjQ+Q7bjHv4Kip7j6DbCFYbVQ4xrcGhOV2c4+1E82YhEyduztkYWArdcqdyc4027hnZZdI/TgSBeLz0xZFA//2Ovw68QIdKEuxHcGxjffvRJjaAts=
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com (2603:10a6:20b:63d::6)
 by DB8PR02MB5929.eurprd02.prod.outlook.com (2603:10a6:10:111::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Fri, 6 Oct
 2023 21:43:45 +0000
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::16:341:f686:c7b7]) by AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::16:341:f686:c7b7%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 21:43:45 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Pavel Zhukov <pavel@zhukoff.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2 2/4] package_deb: Revert versioned providers
 workaround
Thread-Topic: [OE-core] [PATCH v2 2/4] package_deb: Revert versioned providers
 workaround
Thread-Index: AQHZ+IkkDIq8l0c1Bkqij8yXeaNSmbA9St0A
Date: Fri, 6 Oct 2023 21:43:45 +0000
Message-ID: 
 <AS8PR02MB10201AEB8262CA73F9AC023D1EFC9A@AS8PR02MB10201.eurprd02.prod.outlook.com>
References: <20231006191013.3770695-2-pavel@zhukoff.net>
 <20231006191013.3770695-3-pavel@zhukoff.net>
In-Reply-To: <20231006191013.3770695-3-pavel@zhukoff.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10201:EE_|DB8PR02MB5929:EE_
x-ms-office365-filtering-correlation-id: 75e53d3d-fa62-48cf-6805-08dbc6b550ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HjEuxTiXT6UNbflZwHU6Ma0xPhwpRqT4tPdglIZWHtfRGgErD1V1bwIDfNxJw8pMVyBaP8MFa2/5cfuiCOtbYGKsQvSyq+m0bHWNxe+6bp3FrWsMPiiXdzfnl7iQp1mMLlQHNw/cwPNVP/P7b4jdacrKm8XAyFrfVtcQw/pUdatWp9MVZ5qUFChpNAV/48E6TbVB6S/N+FlIcMHAU6nM3uSJOxShJyEkmj2+525dfOe9Mq2I9wavMqreTQVsAk42essEfZZhkZlZe2aVhXXgjhEAcm5Gsc/KBO+mcdcVYReWRiKB5ZY5Dmfxzdik29ywIQnCtcxZLz8WbiYlJlFLMIslLYCHw6X3DXq+T33e+NaMtxdIkAstyQg2O1ECfaqzyTyPbFhhLynsoC1HJAb84UD2w/2bUrdFtoMUHUKUptf48jxe2cuAOj7+qaSDI3kEC+agC/4cCzex2Ki29zuQfK0YQBu7aUH0NechmfsX8VOKsUIqAIonppUBnnUq72nCvfVEH5bbHMpGPrnzv6c085KQZchxht08+l7pYgtjtaKl0OdU9g/pSbPO862CuPMwTQ/s9cPGjhC4+qBiXlBsQVmyQ84BvAKZ9t4W/GWR8a6BKlVA+YQlz1AwCxT4WdWu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB10201.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(376002)(366004)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(33656002)(44832011)(53546011)(38100700002)(86362001)(8936002)(8676002)(38070700005)(7696005)(122000001)(71200400001)(41300700001)(52536014)(5660300002)(9686003)(6506007)(4744005)(478600001)(2906002)(83380400001)(64756008)(55016003)(26005)(76116006)(66946007)(110136005)(66556008)(66446008)(66476007)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?U4e6F16hqzyXgen9iBq0kcCspkjczvDaZlyCo9abeV45JDOm8EVtAG1oKmhG?=
 =?us-ascii?Q?mGknLoYZ6Ysq6frTEiRZvAgdM3jLKLZ2/b6fgwmwlK1WmLFLvNHHQjGC2Yo8?=
 =?us-ascii?Q?oTIwqzwAMtvbizQZ26GP77iUZ7/fbYTEOn4BuF6pWtgmVJhl7EZiGvd1OGZ2?=
 =?us-ascii?Q?tD9rKoQp3xUWx+reBXuaGW1mO4nRr0gY9IGVdpTep4HtK56vKlR88MgnSfBw?=
 =?us-ascii?Q?jD7aG5MXhlBYIGgMxaeo9HwD/6Ehx/pXe3C5Sc+97Erb4CQ4bTsVgGk2q5Uu?=
 =?us-ascii?Q?nrNtBMtxUToYqF/cwdtRhmtE8seCrKUTjR3Kee2i/tBuMupCGZWEOotQjMz6?=
 =?us-ascii?Q?9pttht6mU3Zhzmy+ioe1/9s18v8U9WpdhWveCk5b3r3/l51VsS4UPbCckW1B?=
 =?us-ascii?Q?mSVrRACP1t16EQ8mKhXQ8ZsNR6uy8KltsTDfehSs/SE43b0+0OrT5GcYxFvv?=
 =?us-ascii?Q?gmDotuHGx/zsbTuQwvi6vz3/A5qo5UhRWOHvzhRnCqatLk+1ddTZN6Jy5zL7?=
 =?us-ascii?Q?ulA9b5fOK9mNTK+QdheWZqmoOAQc8VVne8QnL17eAfN2n7Rxw0nd5JRSasi2?=
 =?us-ascii?Q?dFBl6duvp4EaRI59j0RQpM5Dm1uC7r2+I7jCQJ+M5U1xibFPxaFeH+V/sLMI?=
 =?us-ascii?Q?R1ggdPjvZsQkbuKFr31ISJyOoykIjQjUmML01xr2okYC7dVqJHrTlXkJmTfu?=
 =?us-ascii?Q?ks9HuqNWfl0gA3p/5JrupzjqZx3K0C6391QRA9hJG3fNfnx4F/75l0pFa0X7?=
 =?us-ascii?Q?pclbrsOHj73bWNarT/J+DHKiEI2vN6RwIL9DP2Mg40pQbtYgee1xgyFM+2Iy?=
 =?us-ascii?Q?ALtFYHxDxjKRKt1jVR0HPI0cBWpuuMGvA8utyzjTiqg+aFaOJ6IFZBqp9PER?=
 =?us-ascii?Q?T4ARA6JhNqIjkcsHmDD0NZ1U1R8NIH2YXiSgd8KCmiqxf1WnaEHLwar/u5Ms?=
 =?us-ascii?Q?Ml6cN2ivnav1SrwHotmW/QCuANS0sq+QyTNisKbTdXip5AUSh5V3RkG/70wQ?=
 =?us-ascii?Q?nl+j2oyBhcOMOos4Ot6Z3e/9oWILCd7UuL/ldwufHWJuuS8QYgEUNtyDVd+/?=
 =?us-ascii?Q?CODPfEj2t5JoUHyGUxrarnxPmtOjOKlBjvm39so4a2Un/Z/XXsazd4V684WI?=
 =?us-ascii?Q?n51NVahyxMBVL9gXiQ6a/xElA3++aYzp6197JRNJmHOnSugt1X8SKoBGSEw/?=
 =?us-ascii?Q?VynWOBdmt0XaqO+6WwG07EP+kzaWI0V4NOwsb62OtUg4vfqOCd2Mj0IUOtRw?=
 =?us-ascii?Q?HsWgZFzleKSk6BVrHnnoKMxK4ZMBydl9tR+brV52AtaNeCN/sQoIDESVFmJG?=
 =?us-ascii?Q?Qt9P/p4L7I2G9e5ZAKKEnbbAYcFYEa6pwmFQAyMApZcoWLuHTpznF8Ni3L8F?=
 =?us-ascii?Q?rXelWnl3CWzVSsfbM3AJJhDsCOvnUGzEQldy2gR5icCQ7EK5WXr8a++A+3hq?=
 =?us-ascii?Q?pMhs4up3a4IMrw6zu4PioMwFZ9C6H5uFItRdlbW0zy7j+GUtARsuK32nQHWb?=
 =?us-ascii?Q?vld3c7uAklQAmx19tjSCMjE+kWjlbLK9axLtUnfPYpwK8yh8hEngnVcvjomT?=
 =?us-ascii?Q?higMbOcAlSAUtWvMm/Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10201.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e53d3d-fa62-48cf-6805-08dbc6b550ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 21:43:45.1569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UDrB0FvdYb9N1wz6G2CUXIrFUKhSgKbZKHz9NLmY411O08z1I0Eu+7C2k9AKoV8k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5929
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 21:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188789

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Pavel Zhukov
> Sent: den 6 oktober 2023 21:10
> To: openembedded-core@lists.openembedded.org
> Cc: Pavel Zhukov <pavel@zhukoff.net>
> Subject: [OE-core] [PATCH v2 2/4] package_deb: Revert versioned providers=
 workaround
>=20
> dpkg and apt seem to handle versioned provides correctly now [1] so this
> workaround is not needed anymore.
> This fixes [Yocto #14995] for package_deb.
>=20
> [1]

Was there supposed to be a reference here?

> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
> ---
>  meta/classes-global/package_deb.bbclass | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>=20

//Peter

