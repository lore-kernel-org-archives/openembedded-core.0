Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AACC83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:05:41 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.6])
 by mx.groups.io with SMTP id smtpd.web10.5043.1751357131020115177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 01:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=CFXZh14b;
 spf=pass (domain: siemens.com, ip: 40.107.159.6, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qacBHGeum5yAgtGvR/+aP6If4Vu6ZTBp1jPqUQtfu8HuTyQ2yRsRohAJmxl7jfhPnmPuMxU9WrjEULGsFvv/NKVfXMNfwVf+XO+AJxYVT0yYUV1DoILF/VwShSMPYkdvykQTo7dq8LdOWbWTp1Z7CPiSG09As/q9zR2CtEdiD1BJaUMS7Y4O12EQowWm9ZQIGXw6CtSXaHQgZ3k3TcjC+ifGTj4LC9yy8n4qTBtRy2NoXhND5CZ4yLE7SMC8loNbpX35SmVqJlU4VQaltgIuImcz7hTCFz7dM5pIK/3OiwHWhAerjWZkXsUFOXeOBRv81mz6YJ6AX1uD2WN9bURn4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oj7dvGnAygyICFwkqvUq30kCmjPOgKKcLL9HjcR8TiQ=;
 b=MxfffGw4RvBb9swUho9RzPy1QDDja+oj/3ynbyZmdcaQu0bwqfwQskzG+vaHJ02kJVOPnU+sVGZYjB4YIoLz93y4E+GMr4wCNlCcZVbwYTm8PG+7QOuQuvdIIyeHVvSAiZrIrxXDOCYieL4Pf2bxOA1PhThJRUgC+S6zmGHfrMrKmWW45QJlKfPWL+Gw3UiQKH7ZI5jrXE8LWv/gfa8EIbIi1j61L79lF95uOo51DZRkrw7xMWptiGVScD3jAIRQveiN/jcGlQR8sV/odbF+D9QXRZxYbegAYQ6iOTUwmhHKOJSy2iMJTOUngsM5jE7fBqBBRIfeeQKSgk6w1dOjKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oj7dvGnAygyICFwkqvUq30kCmjPOgKKcLL9HjcR8TiQ=;
 b=CFXZh14bIW0FVVP4Ecg6yBQUhu0pFYgIecnnRLOVg3JF+Ddc4JDhSiZA8ZfGW5vyDHbqwbRWQkw3QGuI7Zg+sb1JmiXdlYnJdSS2Pm439LDQhVJr4n0Yw/xAd29S6BB94yk/SKe80wZM+CgefOYPqJL0kjJ/I3YFGFCpIYNnAN7ZqQMqsslaoVWXgNBAZPXGg0ReAnAk391nFtnALDCTjGeQ9x8HmknHUawy9hwgFZ367k4JrhWjldpUTrz6ZSiHG1sx6SExCANNq9grGVtiIqv2qz+LSUliz7HUMN1oq6bY89ksnSjM+cwW2d06NP34F+hNiv+XATkbhw0SdWSqaA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DBAPR10MB4090.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1c6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 08:05:27 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8880.015; Tue, 1 Jul 2025
 08:05:27 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Moritz.Haase@bmw.de" <Moritz.Haase@bmw.de>, Antonin Godard
	<antonin.godard@bootlin.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"quentin.schulz@cherry.de" <quentin.schulz@cherry.de>
Subject: RE: [OE-core] [PATCH v2 0/3] cmake: Major version bump to 4.0.3
Thread-Topic: [OE-core] [PATCH v2 0/3] cmake: Major version bump to 4.0.3
Thread-Index: AQHb6auWCaLungrcrkWh1U7TK1dusrQby0SAgAEPzQCAAA6pkA==
Date: Tue, 1 Jul 2025 08:05:27 +0000
Message-ID: 
 <AS1PR10MB569732A1DB58CB7DEDE56E5BFD41A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250630104104.4093207-1-Moritz.Haase@bmw.de>
 <DAZYFBTDZ6SU.9Z5XXGYAZXRN@bootlin.com>
 <DB3PR09MB6202B03623EBCB0CFDB4DBE0EA41A@DB3PR09MB6202.eurprd09.prod.outlook.com>
In-Reply-To: 
 <DB3PR09MB6202B03623EBCB0CFDB4DBE0EA41A@DB3PR09MB6202.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=2e50a891-302c-418c-9530-56575f20293d;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-07-01T08:02:48Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0,
 1;MSIP_Label_c2601314-b878-4900-a263-6d04f23371fa_ContentBits=0;MSIP_Label_c2601314-b878-4900-a263-6d04f23371fa_Enabled=true;MSIP_Label_c2601314-b878-4900-a263-6d04f23371fa_Method=Privileged;MSIP_Label_c2601314-b878-4900-a263-6d04f23371fa_Name=Nicht
 ?ffentlich;MSIP_Label_c2601314-b878-4900-a263-6d04f23371fa_SetDate=2025-07-01T07:10:20.421Z;MSIP_Label_c2601314-b878-4900-a263-6d04f23371fa_SiteId=ce849bab-cc1c-465b-b62e-18f07c9ac198;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DBAPR10MB4090:EE_
x-ms-office365-filtering-correlation-id: 13749e6c-0b4a-4667-727d-08ddb8760a1d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?s9ri0w05xjB/AmCoRQ1R/cZ9t/p/i7UBP3oMdmpluqBw2BprKV+DSb+wZzut?=
 =?us-ascii?Q?4IinnSHKbL2beADnq1FgBD1yRX3en5zYPrn90VDDAiDNXC2ddQfILp4JB6nT?=
 =?us-ascii?Q?+7SKQzGz+mEwbvVYJcrZ0Scr8Zz6gwdOBrGfDRCqi+LiVrmwEjvOMduuAqrL?=
 =?us-ascii?Q?s/ua0zGO7btwh4mwH5Gpto3JE3VhKlXBaN0g44CNiuZVL6KmQ7ohtDoLESnW?=
 =?us-ascii?Q?Rt8ReSwsY7ymF5MOSTu4PXdkbu00BGi/vxNRqIAV0yXn/VRq3FvzYaE/FgQP?=
 =?us-ascii?Q?JgFUjyzZLgSJ9Z3kTWoiPvb7Ogx9HkE6DU16C5jYolza8850ftXDrsRPvIXd?=
 =?us-ascii?Q?5rrZMAu/GuVTnWpcYCZIX60+EV5RqkvzYd6EiF/QbCIVjxEZ/Gkux/sZQUm0?=
 =?us-ascii?Q?jk56PJmmLmy3wwDKqn+s812iZyNTS3QNqaKVH5AKxEqPURTawkYogWKyjYI/?=
 =?us-ascii?Q?okW/fPIUupkKyjUBWEUiWR1LrfPpEezqbMsrV/hCvhDUashDcTpXW+Bp+eLO?=
 =?us-ascii?Q?2eYNkpz90BAVJ3VO0sm9hpSRQdQesW4o531PbE6usQG9reGrK3m6xB3kMSFq?=
 =?us-ascii?Q?cBLO6Gv/2P1xb3/TfJSOhG0ixxBMEPi3FPZL3scAXanvSWa2IdukYrrYXC7X?=
 =?us-ascii?Q?mtE+a0YTWvIoroWn7EiPSafoQN8L63KBAMMcTxuYHWtNsn+pJCreABYGEq9W?=
 =?us-ascii?Q?OYN5bpJQrvWmCsMn+BgRgu/qJvuwUmGEAT8E3kyXyghGnOEak4bxS+4A3zm5?=
 =?us-ascii?Q?cdbLmpOa/nMu0XTVC9deC4I2YHb9g9FQZHeqEO0wNtfMr3nY8SJMZUUQ1K5W?=
 =?us-ascii?Q?C8T8xfEDZjpw/4BLGs0kQU3OsZOVWR1zk5GKD48S8c9gc8OZXj6oe/FtUu4d?=
 =?us-ascii?Q?SbAms/L20qoWZwCAsCNJj+ZxdbRfYE/D+IWfXAJeE7oaUBvphNARcgxw724J?=
 =?us-ascii?Q?+klB+6lSM6GmOvDyUNE1teFhonSBSgBrEK0oBlxctzDpetoKVKziYrzZKMkK?=
 =?us-ascii?Q?FPpjegre0agAKeUW7Gjjg7aDe6NaLiNR+MTVak8sSj2Z1WFX8p3P+XdmuHmF?=
 =?us-ascii?Q?lGzcuAwX/X/udx/xvQpwDWoKcidvma5JpYaJ++miAjDLNI4sb1cPtinMjdOn?=
 =?us-ascii?Q?NXsKMekqsrmaxfJvi/A+fS3Sq03EYpNnRf1zh+vpQMVDJmnXgZkDo2KRmbWI?=
 =?us-ascii?Q?9LrUleKKtGU4bvG1lZsDo8f0F47RL0Mew1uNIwkLi51n+cUdFBhL2Gi9tXpY?=
 =?us-ascii?Q?7Yn3Q4iqle4fIRjCfGPdZYi7zQmwtHNqjIO28i+eJO3pf2R9E8VEFsVuhlav?=
 =?us-ascii?Q?5rpqJwYG7rWfyuygYWd/F61sYfLdo530MN9NhgfQKDrn0OZ8iO8PmJrx6IAW?=
 =?us-ascii?Q?mOWx7r+c+s/+lRmfa7bSPrg2IwzP9DOD5CwGlZy2skhinWNVqtuNJdeGO89f?=
 =?us-ascii?Q?36u41QE5CsA=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?eeBEBGBapeZd/KpAdaVkE66VVGwjl4K/HutYIMGM/ZMky/0nZJSi77rb2CSq?=
 =?us-ascii?Q?ErJ78adA9Hg+QAO3nsyHGfkHoNdJkdgHKUbRiBtc2NpXw3y6O43Bbp4HvQoX?=
 =?us-ascii?Q?zlT49GsN9ROXD2YqrQCEBvMCFmH1DZzCAoRuGGCTtar6VqzkyfSgPx1RpxTt?=
 =?us-ascii?Q?dKGgwJryRM1rPCYfiPUpBcDXY1BPBzOLNhdv2kaqvaZ4/fc/Qli1Hy8ni2N2?=
 =?us-ascii?Q?v5a8zdaBbjtZRXIR9nAyYckNa0viWFGEzKjIuTQFZXvFJYbZdUHMkDg9NR2Y?=
 =?us-ascii?Q?R31HZ/pY1zlEpmpLlMNGi9OUNfXvjf97hTE8KF0B1nfj4wtfsVn/4q7YW4Ff?=
 =?us-ascii?Q?Olq/Hg6AkNsu+HrzXw8rewqFHzIU9z+j2qa+fUEiREFbSu6XI1E/VN6VtWxH?=
 =?us-ascii?Q?Rjda1MiWeAeDYUXMsWRL2ra0hUyPfvE+LCsD/vdxaz10KliYtCeZNvrvrFE6?=
 =?us-ascii?Q?QGx8ot8/3tjECmzQrngWuocTwyJ0du5H5KlZRhQTrDX+UpcUCcymgAJ5m+lX?=
 =?us-ascii?Q?NZQq2NEOj7R2fhJIFeLDfxD3DJXfcAok3IYEOimOWYYpCS6AJAqznRIceGgY?=
 =?us-ascii?Q?d8TpWHA9WERin3RN4U+yvmNZcpWYUxWxTIQ2XoXmdyYjWlDsvlOREgw1VsEU?=
 =?us-ascii?Q?amfDsKV0iAq7xHjc23gYzSGV3pUeMeYSAGdpSR40i7Iq5AgREHEQ/ob+BQnw?=
 =?us-ascii?Q?ZjtA7rgrLWEIYvr5Zl5WloKNjdOzyABd1pXaX3Ua/dCGx00UINC4OwRBSrdV?=
 =?us-ascii?Q?igKNAI41mnY+QmvPEuTBP9UkAsXZ6Cfgio6K9piaCQX5X1UaDjstkDpArnhn?=
 =?us-ascii?Q?t0+sX+qHihN1OspEnsUitEplPiAmoWbqLGDhq/u1ygOIZ8+jy6LFRwvwMuok?=
 =?us-ascii?Q?QObt1u6sPiiCUD69Ev5masxfh6KMWGqw8GhE7bEZCb8r/ysfRlX39IyKrlke?=
 =?us-ascii?Q?73daZWfwLyjQNe3cmlnIfko60zvkP17fGcNnM1+UJCKOm4jAYAbhsyFanIq9?=
 =?us-ascii?Q?UqhFBvekZgshy8ro8MURLgSAD0tREng/GS0YZ5LuctXMJuyqo2M4LQym0D95?=
 =?us-ascii?Q?RVC0P5/Az7mVlhev1qmsiLJcPHhfrNH54R4MUCs3oXxbc27Cqy8gXCS9hafN?=
 =?us-ascii?Q?kUZO/DQWn5P9bqmsFw1M8tPBCZnPidkewqZGMhMTqC5xHBNJ0lOusk3zFcYX?=
 =?us-ascii?Q?pnDR10e+V5b9ITIcCrk+xVlt9zamHXQ2jZ6Lb6ZsWtIpU7JvAN6GyoLEfEZe?=
 =?us-ascii?Q?C7t6HthhDB5QalJ0LobZ2VY+O54kgcAqBcqqMbD4gLThPIk2kO8AxfenhNPp?=
 =?us-ascii?Q?IVO3Pq8jTbt68q0q0vATmsYZDe9ViKlyw72Fd1RoMiSuk9vB6QJ9DjvyBbr6?=
 =?us-ascii?Q?T1rxZIPvVo3Cn8EPCVRRWYQJOrDlLs+FwmFIeKpQP8rBwMFpBH+YZZFP2jti?=
 =?us-ascii?Q?jPL2nNUvHLPCNVyjTqxjkrRsl0uYpC/Ifl+q3Yl1iwuiAjPu/qmKT28eot3f?=
 =?us-ascii?Q?C79ynlRWthcFvjp8bZbrJoHbJBc+/B8eX6UG47UeOB5QLFqj88hHvKeknc6n?=
 =?us-ascii?Q?/HM5ZGC1BBvnbzh5pswBmNmeU7zunvBOejsPyzwG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 13749e6c-0b4a-4667-727d-08ddb8760a1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 08:05:27.1582
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ab8NGG+D+/F2B6GWax8d+bd9PwSQfBE7sa7zoV18cM3plBGuRJwjAGntQvRH3jUu19MzJ3E86jqOeikndLTu3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 08:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219556



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Moritz Haase via
> lists.openembedded.org
> Sent: Tuesday, July 1, 2025 9:10
> To: Antonin Godard <antonin.godard@bootlin.com>; openembedded-
> core@lists.openembedded.org
> Cc: alex.kanavin@gmail.com; quentin.schulz@cherry.de
> Subject: Re: [OE-core] [PATCH v2 0/3] cmake: Major version bump to 4.0.3
>=20
> Hi Antonin,
>=20
> > Some builds are failing on the Autobuilder after applying this patchset=
.
> > [...]
> > An overview of the errors can be found here:
> > [...]
>=20
> thanks! I've been able to reproduce most of those locally (via a 'bitbake
> world') and they are easily fixable / there are backportable patches by
> upstream. I'll add those to the series and post an updated version.
>=20
> The musl-locales failure I couldn't reproduce yet (I guess since my local=
 build
> isn't set up to use musl). Is there an easy way to replicate an autobuild=
er
> build config locally? I couldn't tell from the docs I found at [0].

Putting TCLIBC =3D "musl" to your local.conf will switch from glibc to musl=
.

Peter

>=20
> @Alex: Thanks for clarifying expectations re. the patch series in the oth=
er
> thread. If I can replicate build issues locally without much overhead, I'=
m happy
> to continue to support in adding required patches for affected components=
 to the
> build.
>=20
> Moritz
>=20
> [0]: https://docs.yoctoproject.org/test-manual/understand-autobuilder.htm=
l

