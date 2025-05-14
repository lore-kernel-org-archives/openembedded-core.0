Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A74AC3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:20:31 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.68])
 by mx.groups.io with SMTP id smtpd.web10.104654.1747236020358029727
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 08:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.bosch.com header.s=selector2 header.b=DDsEkt4B;
 spf=pass (domain: de.bosch.com, ip: 52.101.66.68, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9DhAZAXtASsYb5FnRnaKTvIt6nDNHClA9mDdDcfpDfSxhvXzs7m6GjIRjifPjfglJpi5j0waBHbJtLJv3Zw5qEPU6FOjL2xkPychpyc1F1cTVkYjrqX7bDkuISM7Emh/snHv3hL/IqA67H7Y2NNMVVJAkLWp9iKKkQN36thwkcarcLPpZcYpXHEqqLWeB+vUXcU5DuCTr0JMZTF47GjbmqCkOqmvqQOSLpo2XXKSJqK6qJLphM+nnOHSR25cxnuqs+28VTyMrWNqDzcqeXTw7DpvS7pyB6/9PZy2htiaWjLXjtEqmQ844kgKxCB6lsgflfqPk9tzpjKy7OC0SvRZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgwYYxsYvu4jlX4E2UBM/AUCRXs1Ukg9xg81fdusFuw=;
 b=i35kZajSr7fGstp3tGOyTp3CA8llV4WQBXv05C1cPHMwGBk+/wh/ZW1aj0F5xtW9ytJb9XenceFGwvrqwIGlR6aQ33ihZfmRiEIq5kAp2UsuTbNhnphOYkZbZ8BBpswgw/Twa/R0nTOtdoj0AqT28jnXd03Zka1ANKkGC8t+gPlfcEZdOIdEUjzhsAaI3OFY/NOaJUMiWbTs5MKP95Fe+fj5txalcmeQQDJfs3chMNriacBPlk6lC6+2FZ3UqyUK/etKNj8NP2iS3paSnpTO8ZxeheCF4gTA7j3QtoQLNZQHwD/6xMJCD/4ROUDccuN1mpHYzq//4X+MnKxW+0udiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgwYYxsYvu4jlX4E2UBM/AUCRXs1Ukg9xg81fdusFuw=;
 b=DDsEkt4BkxVScFMRqt/zX0XLDowEMxjcifyYv2tpMC25Kgif0M8RFxBnV2Tvb8RV2PxKK1ncUi0T3ja67mOGiZxnrD9zwJuen/mg1PbhRDD+Dlc17PqzBBoBcdCB3qPI/WWbp6ZWpCwmvUoVijdhZm/oz5Wht77/+77zvA+X/6CWOdmAA3IZdojwj4QeZWwTayJFUbhsxOjvNDiUOtJjCupiOpDY+tEEW6qwKsQE4MkxpYkHqCS9A/zylaiRJHri686HbBPAMHymFsB64Qbefp6ICDydGEV9N+SQQEk2iyfUIFhi9n6a3enF5chMxhDn3v0ehrHpybVbU9hOq68ubg==
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:423::12)
 by DB5PR10MB7722.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 15:20:17 +0000
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::104a:4c1c:9bb3:3036]) by DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::104a:4c1c:9bb3:3036%4]) with mapi id 15.20.8722.024; Wed, 14 May 2025
 15:20:17 +0000
From: "Jonas Mark (BT-FS/ENG1-Mue)" <mark.jonas@de.bosch.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Joshua Watt
	<jpewhacker@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, "Simoes Ricardo (BT-FS/ENG1.1-2)"
	<Ricardo.Simoes@pt.bosch.com>
Subject: AW: [OE-core] [PATCH] udev-extraconf: Allow optionally skipping
 systemd-fsck
Thread-Topic: [OE-core] [PATCH] udev-extraconf: Allow optionally skipping
 systemd-fsck
Thread-Index: AQHbwMcK1P7LHOpPakmXu6OSbHJlDLPPOHqAgAAWCTCAAPbYAIAB+T8Q
Date: Wed, 14 May 2025 15:20:17 +0000
Message-ID: 
 <DU0PR10MB707667F8519C383B05E463FEAD91A@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
References: <20250509094421.20786-1-mark.jonas@de.bosch.com>
	 <CAJdd5GZ-LkBC-8iZXhAYvKsOhxCm2hYL5tCkTS9SOud-d5+ifg@mail.gmail.com>
	 <DU0PR10MB7076F9B59B85FEC850F9A8D9AD97A@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
 <8bbbcfe81a99f36e90718015150e135a4ef8202b.camel@linuxfoundation.org>
In-Reply-To: 
 <8bbbcfe81a99f36e90718015150e135a4ef8202b.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB7076:EE_|DB5PR10MB7722:EE_
x-ms-office365-filtering-correlation-id: 6278003f-dd47-49a5-3229-08dd92fad54b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?b7M1AbYuZFfSlprAUznvgfuJfK/2Tegfz2aUaIMe/7pWqM5TgI/pQbZTrCnm?=
 =?us-ascii?Q?oNXGFGYT1VNFlNNSA0hdpYPZNg2GZz/ZHAiBRDQFIXGuNrJZ6o+jm3jcOnsx?=
 =?us-ascii?Q?4jipILDmeCFrs30/xz4W2KFDtrLYjUqNB5tCLnnnlYn+SSa354Qi/+SNzvZp?=
 =?us-ascii?Q?ftRXBqLPbz49/RCUvcFseWibx1T/RKjlW5Yaj2mpwUbsXYTcQke11tByb62G?=
 =?us-ascii?Q?earpYnIY/iE5BLn/iAolMzh8C2WE3NNR4ToZkBTACqAvkYz7FZdKgFPeZeM+?=
 =?us-ascii?Q?y2CiMjgIEGMYejwnAtKGXmK6/GzHkXy/zGnmZ+/0GUstinrRZM3J8TyIMN+W?=
 =?us-ascii?Q?RWooZhHPagvLA2dkL70HHoYCbJ+5sRGQIi79hlu5gsU5sb9d24qGEW/QpI5p?=
 =?us-ascii?Q?w7tNXm3IfAWD2eLb9wbkQdpqje4P8+rzcvWZ5NPhP1JxdoKojBs2WjbRIXwj?=
 =?us-ascii?Q?0yUoy+8mA4ML4VTCNP2tXSaW9r9PT/B3e8eZnR/uOzuP9iidpErQ53uWP71X?=
 =?us-ascii?Q?v09RFeA7GiHtyt3/VJuK1zTfZriq0O9M4uwabMtKaEPD/k7K+NfLiqZEy9HL?=
 =?us-ascii?Q?LfWXc/YH5QHbJxCJ5YoymezWHZ7XSizSqpLEliirBqk9tOkz1Frb7oDfqRfG?=
 =?us-ascii?Q?VwQN3J2GBJl1eYNT3mS6AIObFjjGy6Eh9N5MWAOPJGDUdi3CZ7X6O4aorKZZ?=
 =?us-ascii?Q?K87uO9C3kU3AvVf+6QXfia6GyRtcOez/Alx2Ydz6df3iliPt/W5bdUSNXUFf?=
 =?us-ascii?Q?0jaej0JVVfNp4LKUiMM6wQ/2BZiDdzHsSqHG6SyHh5fP90TfwU9xAo1KKvHO?=
 =?us-ascii?Q?jjps56LRgEiosCs/IUDjXB8UELVFpzytDkWjdlr6D3+KMkWyrdPxH9Wgh0sK?=
 =?us-ascii?Q?mkfMTs+arrdPNCBOw7Sa4rldFSASKPKPAkS2I/GhcKGmQCEEmn1Lwei3Z1Q+?=
 =?us-ascii?Q?GQ2TOK6PCZ5rNYklsvwOlG7ETmJB2mZCmBGNymgYiPmKsZM0Mve3wm9n/PZX?=
 =?us-ascii?Q?Q81XLWUVbaajwazUu9MAZ0gyJSWZnxhCiMmGxrqkoJQg37xhMhc8ETyLUaf0?=
 =?us-ascii?Q?dVGluC3IEw2vDjp5zWXf7VqY2qQ2ywJZ8QNkLUrYKwpSsXrHRcza9gELfc25?=
 =?us-ascii?Q?jF2rc3A4deU5sgi0SL22SNfiImLOoZvZ6LwGMSCiouD6QIlVOHqdGXCy+9zt?=
 =?us-ascii?Q?Sx4rc0hMdOTDyC4PU+OD+Fh1lP1an5UIdXu2KL1lUpk3EUO9/QEeHstwfufz?=
 =?us-ascii?Q?3wo3+3+sMkWSWcQC1+cOY8EXKKMLRuo3za9GAf8TeHJJpFQpzMFf2CHyt8Pk?=
 =?us-ascii?Q?fqG1j50/m+JA8g9tb38ecpI8O62ZN+2WkAvEQ2eE/N5qzTL8W30gdE7kqMlr?=
 =?us-ascii?Q?jM62dO50xuas3Xx20lp1MTECUg4GM9bgS8S7M/I5iNVNQ2HaavFe8CZj1GrN?=
 =?us-ascii?Q?y/OKxjkx8vZoPcob6OEdPYJ7Mska+GYJ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?t/eDgeFH2g3wYf/lHO0Uom105YIK8zwQTMVwxbvsRcEpPIuO8fDiRwdbhOeB?=
 =?us-ascii?Q?+Kw0ARuaZNaN294m83dfz9fkcdqtfOJFC3tV/S6qfT8Cqen1m0lWjc3ifmYN?=
 =?us-ascii?Q?LlW1k1VIEr7zAATWvGG0gcmg5QwunUkeYYnn6T+xhlq1Ko3FDVPXv28pej0x?=
 =?us-ascii?Q?sDqvsnxXMlzU7uAhizYl8LWR63XpY90OUJ+6NJ0n0kzWMubQV2Fx8XtHW8wb?=
 =?us-ascii?Q?CzNFBjy4fdyoHwrn0wQ+KdyCIffhnWfeYoZQtCZr+L667g17CcNqDk2Q+1hG?=
 =?us-ascii?Q?heoOiLHqk2PPTgQ1m63dBtVpcINdHJNKqjyQDLCXJzsMW7Edwau0OeBC/oZG?=
 =?us-ascii?Q?Pyi4w4LIfBRGDkXpwMPITKVExHrzVEnvnwpRSH13EFem7/lSxSUUp39h8uV9?=
 =?us-ascii?Q?Kzk8rWDcV1s8fIrlJiM/BmX5RWZv9FmibGDZ9rajoTL1OiEnhD1TXQ3xH7c9?=
 =?us-ascii?Q?UCiZU5L4JxuIsNi7jJ3dzGAU566/dn6GBHwuIncINP5QGKfaMZGlXyAqU177?=
 =?us-ascii?Q?s++wspVPDSgd3G+TV3TDLvw/WFRuxiHT0Fwyxp+hvncWNMJti9ZBETUevf+Q?=
 =?us-ascii?Q?aNP18z8j5mVYDaR01k15ioveGXwjgug5gBDYiaK2+jU2RAdXFBaocKlzioOl?=
 =?us-ascii?Q?OFc7gOgBItF5ZbxbjhjXqe7DOg6CdU8AjiRg5VZgGAHT/1mqlAT9otxXeyHr?=
 =?us-ascii?Q?kD8y8Z5DJKHJPJnjo/jKaoo8m33rMqyIFnzP+o4aafOT6oAHeIRfvSQJ4mhq?=
 =?us-ascii?Q?86ejUNNaAUGilzL/hB3iF/Jahp6zbC686kYvLW9O0v1+0gRC5w1VgCKKawzY?=
 =?us-ascii?Q?QHdZUFUxX7tyfF1vakDYYvmU+ZHkIrhYn3G69L3Uc5GJtNJ/Tyv4btXG4ZBO?=
 =?us-ascii?Q?Q3K0byvDJOeBtG9A1r+mTq3JAvLR/9Huom3NxgPhmWv+uFbwVeFZJgX3iYEg?=
 =?us-ascii?Q?P2SHDZ6njZQqHfAzNdBzLSYE4fwj+tjXKO6vx51BIXUJmEuXFgaFfJj6BgRO?=
 =?us-ascii?Q?QeEzCZt3KckefiRC7bXwMLjrwBr8uENfrMvAmFydZFXONNV2/wiszdlW+ANY?=
 =?us-ascii?Q?YJSKBDw3PugUIlZYUMR9c1yLPeJEimDxYPwMSu2own6GTWqec7nkxnnmC0Rs?=
 =?us-ascii?Q?UcINtx9msAVzDxPfUOPgnwnYe8cul6YHnATh01j053WhWWg5uMFYw5kWcZNh?=
 =?us-ascii?Q?C8QyW5L1sPaDXrf9ec00sJ2fZy4TI0xuoiAVDCU6IThysWvRZnEhSs1+t7rV?=
 =?us-ascii?Q?pp7obcmyp1FrEW1PXlRilbxO2OYLrWloHAE/ddykiZfyzZEeHZHdxwgXXxxZ?=
 =?us-ascii?Q?6SQm/87qjzFdQ54ynDZ0JUbBPUD3jIPYcmntHE26i4VtG48F4pn7t5lPBQIz?=
 =?us-ascii?Q?qmEQn/bI+vNbonRRG/XFGrPnuDt5LwIhO8/9qv+pOj6v95GDQlFduQGGSNaJ?=
 =?us-ascii?Q?B5yGZx2kPxfbi3YwFhxBlcrNneGuToN3rY0cq8cZ5S/fguhuHsfeaXk/iHna?=
 =?us-ascii?Q?BtQ6RMfSHy4ut5X7gQDa6Eu9CVEXTlXA60m0/ZCda5ypsUMA6ExYcdSOo5DC?=
 =?us-ascii?Q?0aUBCEI9URwE8dc6uHw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6278003f-dd47-49a5-3229-08dd92fad54b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 15:20:17.4010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ck47Ng8n7+gO/+pwHdJRfviOoYbK3NU8zJ67Qh2Gxiu6+aDrtvGDq/9s5RMIdJAhIFmXhcV2ZT1GztMoSYQ1rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB7722
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:20:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216498

Hi Richard,

> > > > From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> > > >
> > > > When the fsck backend does not respect the exit codes predefined
> > > > by fsck, systemd-fsck might not work as expected.
> > > >
> > > > This is the case for fsck.fat from dosfstools [1]. When a FAT
> > > > formatted and write protected partition is checked with fsck.fat
> > > > it will terminate with exit code '6' [2]. What fsck.fat wants to
> > > > signal is that a write protected device cannot be checked.
> > > > However, that
> > > code
> > > > is interpreted by systemd-fsck as a bit mask:
> > > >
> > > > - 2: System should be rebooted
> > > > - 4: Filesystem errors left uncorrected
> > > >
> > > > As a practical example, a write-protected, FAT formatted SD-card
> > > will
> > > > not be mounted in this case.
> > > >
> > > > This patch introduces the environment variable
> > > SKIP_SYSTEMD_MOUNT_FSCK.
> > > > When SKIP_SYSTEMD_MOUNT_FSCK exists systemd-mount will be called
> > > with
> > > > the --fsck=3Dno option. Thus, the partition will be mounted
> without
> > > > running systemd-fsck.
> > > >
> > > > In general, this new feature is useful when the filesystem is
> > > > known
> > > to
> > > > be clean and the fsck backend does not respect the exit codes.
> > > >
> > > > Finally, one way to use this new feature would be to add
> > > > ENV{SKIP_SYSTEMD_MOUNT_FSCK}=3D"1" to the udev rule calling the
> > > > mount script.
> >
> >
> > > This is a pretty generic work around for a very specific problem
> in
> > > dosfstools. It would probably be better to patch dosfstools to
> have
> > > the expected error codes instead.
> >
> > You are right. We also thought at first that we should fix the
> problem
> > in dosfstools. But the project appears to be abandoned. The last
> > commit in the repository is from October 2023. And the last closed
> > issue is from August 2023. Lastly, there is an issue which sounds as
> > if the maintainer lost access to the repo
> >
> (https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit
> >
> hub.com%2Fdosfstools%2Fdosfstools%2Fissues%2F210&data=3D05%7C02%7Cmark.j
> >
> onas%40de.bosch.com%7C366c7afff6bf4fdb0e9e08dd91fa9948%7C0ae51e1907c84
> >
> e4bbb6d648ee58410f4%7C0%7C0%7C638827227685038915%7CUnknown%7CTWFpbGZsb
> >
> 3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjo
> >
> iTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DTjSjj9oZY%2FF6bshgCGRuacv
> > mS4B6Tatxhs28iLyT%2BWw%3D&reserved=3D0). But the
> > maintainer(s) did not even reply.
> >
> > Instead of fixing the problem upstream we could of course also add a
> > patch to the meta-layer. But the patch would be rather big because
> the
> > overall exit code generation is spread over the code. There is more
> to
> > fix than only this single situation to make dosfstools adhere to the
> > fsck standard return codes.
> >
> > We would definitely not be able to maintain a fork of dosfstools.
> >
> > How else could this be handled?
>=20
> I think we should probably carry a patch to dosfstools until the
> upstream situation gets resolved. I don't like doing that but
> ultimately it will lead to a better end result. It is likely other
> distros would be interested in such a patch too.
>=20
> Attaching that patch to the github dosfstools so there was a patch
> ready would also increase the chances of it merging too.

We looked into dosfstools. For a complete fix of fsck.fat many places with =
direct calls to exit() need changes. On top, some of that code is shared be=
tween fsck.fat and other tools. And we are under the impression it would no=
t desirable to change the exit codes of these tools, too. For example, the =
fixing the very problem which triggered us would also change the return cod=
e of the fatlabel tool. On top, just a simple change of the exit code would=
 be "half wrong" because the point where the exit is called does not exactl=
y represent fsck "fs left uncorrected" but is even hit when the fs is check=
ed but does not need fixing because it is just fine. But on a write-protect=
ed fs the error occurs before the checking.

see src/io.c line 63
https://github.com/dosfstools/dosfstools/blob/289a48b9cb5b3c589391d28aa2515=
c325c932c7a/src/io.c#L63

Taking into account the time we have at hand and the complexity of the unde=
rtaking we do not see ourselves in the position to supply a proper fix for =
fsck. That is, dosfstools issue #89 (https://github.com/dosfstools/dosfstoo=
ls/issues/89) cannot be tackled by us.

Cheers,
Mark

