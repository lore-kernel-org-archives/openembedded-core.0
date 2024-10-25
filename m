Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6167CD149D9
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 17:36:32 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.77])
 by mx.groups.io with SMTP id smtpd.web10.1448.1729877782376723932
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 10:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=iinQt0pd;
 spf=pass (domain: axis.com, ip: 40.107.247.77, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPSx6H+MjfzAfpPg/e4mQutFhi9PdwtStoZQimuICvZ41sRmb7Er7m6PpbYdBRUT2Oe7vZiujOZN4EmfGeqNbcRq23zwD3XP0mErgtVBLVxIWn2CPA1ww6ot3sUhoMkUbV9ZLj7R/CjkRGNnSwZo1TA7NSmWtiHWxgfIPQZO4inj1SoW+6613CSZ8tXJfXfGeEJJjFPj5gJ6qM7N3kTvRdyWklYX1M8YOsZyJwbT4ETXZ5krIo5crB2i8oxotEROM9FOpMAbWAQ5ppc+hKg+MsTQLbat0QMk/Kx/GhnHlCqIzLMsviKA3WmTRL5MP7GgCbEOXVHtQiUt0ALrSmNqxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVd2p6a1XR6NNbhxM7N5rDM1lNpRB/KXin7h1ALmj/M=;
 b=DpRk4VFyby/a4SH1xZkkx/Mva5xeJlggFJQhRvdlGLTMVQOe59IxhjZph7xQP+IgMjW1d8c8m10MBaeM3OonFE6CVtZ+bAOtiZshkcVRCVLpmnrp+5iLg+I7QqI6O2dntF+/yzp/DRHLkys/uI6hiQ7DkO5MHN+5sW7SeskaCErKie7Tf2gf1FxpiO2+xOaiW22VRocWOBQd1SEJ3IyotQWMDg9J4y7fIgC8Nr0vXdoSRrTGULQ5Mb9dFJ2LKCmbM/SCAcigWzAvEpk4WLx4DOEN0pkRYRXxG8tanjVcS4PXWHILuCEixD3dhFzcvF6lz8wTXNSQ7k9nZhc8kMrguA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVd2p6a1XR6NNbhxM7N5rDM1lNpRB/KXin7h1ALmj/M=;
 b=iinQt0pdEv+Og7O4nLVtBJVwYuFMaOzca4hIbYd0sQ/qP6ZXAfcS2KjaIaFGT5jyKV62I32OB4jtkET0/2IyOTN9hu3vLMmOQaJfilRSni0LCIVzVI7KT4HEeQMOHx7F/qsNIKbDfZV+r9vEIkdHoxA1rUEotPaOT8fwwjQRuaE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI1PR02MB5901.eurprd02.prod.outlook.com (2603:10a6:803:134::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 17:36:18 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 17:36:18 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] do_package/sstate/sstatesig: Change timestamp
 clamping to hash output only
Thread-Topic: [OE-core] [PATCH] do_package/sstate/sstatesig: Change timestamp
 clamping to hash output only
Thread-Index: AQHbJuSFGgRyTW9MGUSLiPt0bfugR7KXur7g
Date: Fri, 25 Oct 2024 17:36:18 +0000
Message-ID: 
 <DB5PR02MB10213953F448E6CD0FF24A4AEEF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241025134740.4011110-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20241025134740.4011110-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI1PR02MB5901:EE_
x-ms-office365-filtering-correlation-id: e4b36c82-ac5f-4a40-0d6e-08dcf51b8883
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?hJxyGJVcR0/dpr4hIG12Sq+Bo9lN2J8dH6lKqlLr9IPfi25x0gwHa0oFjqFr?=
 =?us-ascii?Q?4TfFkWjvoNn9RPyYwJVTVmWTyRbgx+sNM+YwaSsILIFkk0Kym6Whes8rpQSL?=
 =?us-ascii?Q?Z6rQG3Mw+l1LRwvJzsgk/NLCiUTi4s1HbvQ0RTNl+BUrKRNjGFR6fWfZAg/X?=
 =?us-ascii?Q?xMBanc2o7cttIZaScJCn16uUSMbr6G/7rqKrWgGGoH95Ql4ORt/ydA7WLhQE?=
 =?us-ascii?Q?aptMUAgAceXXjgreUaozU+2slcoF635k/G/E4DSYAEAA6vJvH9+CV712sbUQ?=
 =?us-ascii?Q?wAMAQk2zSgcxcJIFm7gvZqKva41WcSkqkw7Y+eQpRiA2mEKNU7efuXnO+PL9?=
 =?us-ascii?Q?+Fz5ZFs/zwTphmwRBcp8GsxlJvrwjRDLNSXKwfPzhk38TVwKaZm3CkiEfKI8?=
 =?us-ascii?Q?VI9iph7fKQvOZxp2YNjmFhfp8t3RL5FdADQY458F7RhDklH2FR5UcWLwhQ5s?=
 =?us-ascii?Q?/0ovHEWhiq/MapUwNbJCGwHWuxUgMpS7w+Onk26lzWpHQA7rR0GvpthXMHKf?=
 =?us-ascii?Q?/JZDnhXtPi8DGtgGXGo5qskY3w6uMA5DZv7KjLO+OO0PZepxxSAYxR4oV9vN?=
 =?us-ascii?Q?3mZ3FsG2cnG0GHBC66XBQaeMq3T/dYfsi6jlBW0Rog/8lryibb3PRxRE/jJC?=
 =?us-ascii?Q?wik/FzI2grhzYVdxbi33sJdJdU/5iZkV8oyGyiSpsq66JHvl9LmUoW3jDmqE?=
 =?us-ascii?Q?+QITIbdTdsfMknskiPHrZnj98KAPreuTMWZW5YzVmSLzrwV+Lq8ifA4ZMp1t?=
 =?us-ascii?Q?XGqrDemz+uuKOBpqw4A7O4TQL9lyMI4DX5dNW2AeBcWGbtnou59tUXefvdWZ?=
 =?us-ascii?Q?ACNT6DhYKjZInKf4+X06Rx3CkTzAInaijN3X1MeJe7+kEaP+UwdZbodaJcTN?=
 =?us-ascii?Q?u6G5d6mMa0aeNVf7w5pWsgdmziQxDNzkCR9oUX6MDRHceoiOgMoAQsFE98n/?=
 =?us-ascii?Q?mA+W1PqmmSn20KRtDL5ecrILYubqkVg75NsYZB0oihkl21rWIxmYCTfsFvxR?=
 =?us-ascii?Q?jKB+DeVKaHAWrAl2SdNJcA6ytWxNUkSKMjqN+HaWj317a5qjev47IAT/xVKr?=
 =?us-ascii?Q?+E7gm96NNT55yNKLOYtnwv1WWT9/f0kf7S4SF/XpbnPDj0K4lfEy7OIB7pf6?=
 =?us-ascii?Q?FuFS/iyXhFdO4ocJPG+HuxU/he/MEZbocoNBZ47za+2XG6EIaV6dFj37QmQz?=
 =?us-ascii?Q?tUExt5K2kdMIEXvqw3mpWOuDESZgLBrLuTkM61O02aatalzFSLA5ZWTdDQf1?=
 =?us-ascii?Q?8m/zIv8u0SBWO6fXW3JPId4/veo9qkcWOQYOhyzzF1BqJzp9guCJuSl4P6Mh?=
 =?us-ascii?Q?6twCGAtMGa0hjckV588GT2gQCgVcIP+DZnAVPK2AtJqcrAjzdYe8lq3aLNNc?=
 =?us-ascii?Q?iaMGrXc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?8rNz4hmmHqkzDXrjYaPutN/+GIN/ed4VQVwWgV6iMKjFCxj+dxgK/vnmjkVM?=
 =?us-ascii?Q?r7BLNXPLcL855C1pdS9A/yMhjpaAaDXh2ItmBawzYpQYwTw1PVgmcNOFcSKo?=
 =?us-ascii?Q?uga0/eZ0scjH9nzZ159hofa/x9dHKz+2S6S6bdomO1Txn4XEYRl6qcdxdRLy?=
 =?us-ascii?Q?xrjVQ166K1u3/obJNQR/ZZLQAHzV34jIms8uV8cZsw4FpRya5ZWgMuR5TiOo?=
 =?us-ascii?Q?3fVvbQJ8UYlIUZVfzycnhRTje/x23j4O8zKEeQfibgniffoebXZ4ujZuMBhs?=
 =?us-ascii?Q?0g7LEbTSnUM5BSXuyF9RB+FRyOEuyNia9ScoBSUO3dt7Zy0s+o3jY+sMVyl2?=
 =?us-ascii?Q?AQqqsO1frzml1p+sIcNOO2GZiz85aEZJ32YuEc5lV+2crZ6KI0DRRKEFyYz8?=
 =?us-ascii?Q?AdTLnM+KP3Di1QhiYwjhppYEJAJIkiPcrbcea6bP3xucsjjAcinr6V9GPS0N?=
 =?us-ascii?Q?FGwjsoLLjdHwd5Yj58A6nX9EcZkN0etslVvCwJcUvorziVskzLNyiVY5mjhr?=
 =?us-ascii?Q?UJJRd9zVMQX5babYQdXPq5EvogucXVTu/36N8Xh0uJKHq52IQtka1ay1hj1P?=
 =?us-ascii?Q?fScUMPHyIurPNJIWTpdAVarUnR3zbRrC2FawU+mYNQn0hl/V7RwNMHuLGYUr?=
 =?us-ascii?Q?aq0SpVlBTstDeUEFFbiL2na6nreHQ47sZCk1YvWCMWHoraXkBAmkOktW2dbh?=
 =?us-ascii?Q?16DXs8fly2wxdKpg7rogBIDiZR1WdeP4ai58peAlo9CKIU5RTjpV5iNizeLF?=
 =?us-ascii?Q?MSaxK8skAhh6d9INPpjAeLMLQy9kQSTMBgR2LtjKe3j/4yjmyboWrhskfpJc?=
 =?us-ascii?Q?D48dQrkHOcHGBCEVeyns0IvMIABS9Wl140Y9VnF3Ss6ZZd7y0+rrPQa/U0gc?=
 =?us-ascii?Q?RdP0biHRtyW9UwshbZW6KV+E4a/hXoHTKi8v+vtlboy1qf/+sfSj+aggFpfV?=
 =?us-ascii?Q?cIal1XzV/Ber16SG4y7CBBTS4SaCEKOB4G7EOOLvOWHikVVhUCuiv+sgEMcJ?=
 =?us-ascii?Q?Wfo5ujHNMrllkeq/+TN2ugVRd9LbE9RY0x1Pun4yjjnj3WzSznvalYVLRu0N?=
 =?us-ascii?Q?nlzT1KCWCyAa3czvMqcdrJQSwc4U/WU306k/OmtjjaP41Yn1tG5CdaqetDBm?=
 =?us-ascii?Q?VcqMFg9XVSdvA4VIGo4ntvHiqZ32XxO+gOZWBha+MTTsbcllTf7E/E1Yquz5?=
 =?us-ascii?Q?ybkzDnQI/Ed2HAoNddyhjBLPuF4VmRhrxEz4Lw3lgFglZiM4riysd4/2vrPc?=
 =?us-ascii?Q?wtZTz0KWER5ftc+Ix+JKRG8iJcXvfliJcC2oGatDUhGOT90GfO8O9m5xKOEJ?=
 =?us-ascii?Q?zL07o+rY0TgYb5qiwEkYOoHLPeXLRyCvEesJ4v6GBbmNMl+aRuKKImtseHyy?=
 =?us-ascii?Q?YunPZepxoYugPVPXRbKLJEjVuXXo4xV4ZQIk/Ihb9Amm1ikuN+/5Tb8qZR67?=
 =?us-ascii?Q?2Y1U13u1GaE8DG33Jet3OHHcfTVQBT2Q/jMQp9cgLqnTMxJloEfz8tgYabVq?=
 =?us-ascii?Q?QdXVb8pTBpPtsxgHY1yePy7/LPA1G1fr4NWACf3m2ZVY5mDsKmI2v+abK5qJ?=
 =?us-ascii?Q?adCtf4UM5VgjSP7kKF8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b36c82-ac5f-4a40-0d6e-08dcf51b8883
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 17:36:18.2622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dF+Cap0RfWZvyxOsO7ZXmcW7TyGVXpOFtFvJqhuL+4hmzM0wAMhH2pKEm5pn98FF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5901
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 17:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206357

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 25 oktober 2024 15:48
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] do_package/sstate/sstatesig: Change timestamp =
clamping to hash output only
>=20
> The code was changing the timestamps of the files in the do_pcakage outpu=
t,

Typo: do_pcakage -> do_package

//Peter

