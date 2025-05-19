Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B5CC3ABD8
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 13:55:24 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.67])
 by mx.groups.io with SMTP id smtpd.web11.51480.1747662915930805716
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 06:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=qjKLnv6c;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.93.67, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZu0UUkw9PckhdWxXetHGnJ6Q8HFcT17e1J6wZZ+x723+7hjv7iTLW/53ACT2vtKo2wtAb1grPLrkB6ar56Cacd2lslOBWfnrxnnAzWkMPTz/TpvOAEq+gcy48Y7WhYNEXd5EPijPw3GL4K3TFYFq0PQDDvf9hcJi6mavgUpWvbC0MQBL3dpwyKaWkXnR4EyvXnvQoUK6rPGVqM4/LpIc4bcB8k2FHgAiBfE4US9+xropjpx+SQutZ2rdOjuohBrYayH1Zw3fOfcvGmyl2jQwlKefWEOoI3VzHNK9lO/SGSZH8bcP6FdbcGWxZ3fpWEAKXMXkqvcA8glC27E6h3Y3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHhTtBtAyw5yJQG6HtO2pco68evjw26oqcd5o4oV9kM=;
 b=C37IEpwKLvn6Fuoy0pMtkCsIbw57Mks7H2oue+UaL8Zk1WL9GmkRHBwzSkJa03Cm+rscCuh6g/hOJ8WoSPzpFfoDtiNd64tXgawl6pBLKN012OuNjQPRctAfJSAM5hM26LFbDaBe8xsHb8CxXqZ0FaZXlQKAx/jbV+NnPtSWZxpP5juIBaA9H5HUkP+APwj2+WegoB61hcWWQnc7N+etoc8fS8rOEhNNsgsq69CTKw8eRcEiLUpzYhCJEJVTRqRgXzrPiD+AvtFeO0F35y04p2kB4dfSbFmkD4M/AvIqcdbzN9DkW+MC8KF10vnMsbDPfr90xSaUoORm1vQlN7hDtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHhTtBtAyw5yJQG6HtO2pco68evjw26oqcd5o4oV9kM=;
 b=qjKLnv6cqE5SnhIoXAuvRUaahyynmyzfjbqJKYbXDyfwpbOX6ElGKeqoDrX4ZPfuVcZpHIqI9xttTO5Cd9awmsrZFnXH5ZHz6Atcf3N8XR+Kl3HPqVoc3VEQrq4vvE+wB3dXh4bk0+FHeE2ymE4wjXVoebuLbgpzJ3+1nn8GAUREv+Kokn1q0KaOJxNDa3TWfRjBt4ckW5c6ttjWRBOmW/7GAvO/lAw7QsBdsax3wZkNIogubooik3p7WU1rg+L/AOyWVZjvTkDr8Sr5o/tZgGLmBPbcvX0rO/0PdIW1XUTRhwrXi7pCYd8KoAkT9FlEkThje5fozsAspZpa2HHMTg==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 CH1PPFF9270C127.namprd12.prod.outlook.com (2603:10b6:61f:fc00::62b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 19 May
 2025 13:55:12 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 13:55:12 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "mike.looijmans@topic.nl" <mike.looijmans@topic.nl>, Max
	<max.oss.09@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] kernel-module dependency mystery
Thread-Topic: [OE-core] kernel-module dependency mystery
Thread-Index: AQHbtEwd7WGnxn9of0+TOqFHIIGjbbO0FR0AgABUZ4CAFttN0IAJvlGAgAUdDtA=
Date: Mon, 19 May 2025 13:55:12 +0000
Message-ID: 
 <DM8PR12MB5430886302205E62D897E7418B9CA@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <5a9b30f0-c189-4841-9821-6dc26de4de84@topic.nl>
 <bde7ccac49b5417cda5c964055f72e28a3bc84be.camel@gmail.com>
 <b88d7c9d-5f69-4104-864d-b66f2d20a1fa@topic.nl>
 <DM8PR12MB543067EC42BD9FAC5101B6DA8B95A@DM8PR12MB5430.namprd12.prod.outlook.com>
 <26448d04-7b7b-41b4-9998-b54094921975@topic.nl>
In-Reply-To: <26448d04-7b7b-41b4-9998-b54094921975@topic.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=5b4fd9dc-29ee-459f-8b9f-f57ad0f83f9d;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2025-05-19T13:46:16Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|CH1PPFF9270C127:EE_
x-ms-office365-filtering-correlation-id: 8fc9116b-32c5-4400-06ff-08dd96dcc682
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?D0l8vvIKRijmTNbSyr0OAd6wIP+CQPsHEfUFwlHcJ79PQIwkbSRLGeW/r9UX?=
 =?us-ascii?Q?CYvUVR2S+NR3QDWIt5cNIg5+oE6zCba+FbgQsrICBHIP0BijWJiBX5eK2lLD?=
 =?us-ascii?Q?AcafhY3JTt7abG1kQ3ZBDBctgYL+wB+5ddOKtbXpZgUOEdT0S97lIFJsjer/?=
 =?us-ascii?Q?bcsVbKPWNn5y+4HVPElpTgrHviwM56kYwf+L+PDQ2ZmnEqvT7DARGLe2Iy1v?=
 =?us-ascii?Q?K9/eYObrL25ekDuutmHoF3fZecYjPdA42mr1o2SbrDTjkA5n4v4oV1V5Fu/s?=
 =?us-ascii?Q?wLOJfnrqWJUKypza8qbXfGTdQJ1rHvhrVE4U1+Sd9YGza8dF6byuEtK9+Zye?=
 =?us-ascii?Q?frfe43bQuADntDiitBDIuZfSUAr3vDPWDQPU45BOO6C0IWigUcMrita4ux8x?=
 =?us-ascii?Q?vDyULFwmlWVrGGxoUG8+1bFLuMc09SPNwgt1nt9jJ+hluzFwrP8kYG71CIrD?=
 =?us-ascii?Q?N5+DeSJ11+A9ZddLarpU3Bp+98qzcZyihX1TuybmAexIXarnt/ZayZOPCiM+?=
 =?us-ascii?Q?I/re252VHHB48bLNBOtMyYXMpA+ZAaxjQXWGSXdD8aRbiQL+e+uZigQ6JGaW?=
 =?us-ascii?Q?6CPw64LlHZhQexEOVombJ5FQYulU8+EvLsOR/Odn0a2g+ZyrJoDIcG6Q2TUE?=
 =?us-ascii?Q?ZICbFWqap6K5IcK2kzDB+kd/N/sekOhdS48j2XSnAy5e4lpTCJpfB9gLuMtE?=
 =?us-ascii?Q?K454tY6SEnmX7mG3Tya1tWDEy7jYzBkb6qdERZyFS5P+DNBp8vjaFkt6haYs?=
 =?us-ascii?Q?99V1yz0o5JheuB44El/Aow15LIMmvknFbuiNyLeBLsjvyAriMHUPjwK4vj6w?=
 =?us-ascii?Q?Ws9Kgd9nvdxRiNAwoo71WUz09h7b54PXB22H07KBV0FfvxS8bWFsUsA77wP7?=
 =?us-ascii?Q?WwjTQ8Y+ncjBwJuvvBn3N0NlB61ekURiPVgv50nIVs4vUQllWlDMpmCU3YhX?=
 =?us-ascii?Q?+I8WbT3uTxUB2T0FMS7nR0hLQn3uyCsCEEi/oN9MQUBiS18rYnl6pdqTOunD?=
 =?us-ascii?Q?D5xst0CGerHpu+gzlBsMfsrIsf3vMDiMri6v9dypn2jblkpzq5rjbP/POg2B?=
 =?us-ascii?Q?S8NDar4APakbgOacOLwVcWYVkvF0d98gPt5Tlsle4sxJP0d8BP7gaBYzyIU6?=
 =?us-ascii?Q?7vVP/U39GUR+6hnuxbY7WNzgKgMdTL54EbnNOj2zz69Bzu/zH9FpQbkvXKx/?=
 =?us-ascii?Q?m5iUbUs6MotMMylz7phA144fYo5QbPbMTsYxieoe7J+xsAluOVR56V2+x7NF?=
 =?us-ascii?Q?NeXfk8j3NoIivS93NUl+7kvQjFEQ3ghlzHlJgvIOPRMU8nf6FujA4h9O5fpi?=
 =?us-ascii?Q?dlwbx9FvC6B7yzylaRPqJYYCOq1LFAC7bob1NUM/68xZLxDmugnHcDIMg8/k?=
 =?us-ascii?Q?EG0/xX+ia1STvznuDLmj1UVcPTLMHF7MvZ2/6BfLW9IFSdufVSG5IFNQtrbG?=
 =?us-ascii?Q?Dr+IICuiliQmmgWSuDvPY8Kd/QTlUOGxVUSr3IwEQGAJVZgmA7PtLQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?fS7wC5pXDokJHYMOXp4y0PsMF1ySVJ+5+WB7o2rQ1dr3E6nJnv5aAvTg4kaC?=
 =?us-ascii?Q?uQu+QnAl6rWcf3m6BVNOY3IWt7P83ZlqmL09frglVxfR3GGII8NI2k9FFT7a?=
 =?us-ascii?Q?jYsQ6qUZCw15/tWorGvU5jooXZnuMwhrLg+enAqgVGJ+6dPdJNYHKax9Tx03?=
 =?us-ascii?Q?ikqOEPXSdAPBifrKo+AWlIqNdXmGDPNinVhfFu9YHLsa/4f1BrCg7p7cNgHb?=
 =?us-ascii?Q?1CX85rQwX1i7q8Hi7ZsaB1PxQOdfyqu1uSNdq2m05kTDdKCuXsvYQe0jh3vk?=
 =?us-ascii?Q?i9c9vVjskA+fpxMULKMt8LY3CLzW2rM6QVAX5Of/xNuu7QFVortzzplAqjFH?=
 =?us-ascii?Q?7daoRXlkTs5F8ypFFNhQjZhR1ajDMx+xcSCfICrrwQpsHmMAQdrTCT0eQP2J?=
 =?us-ascii?Q?vqeLnjDVUS2tXWOmhivklANoHxJVvTBKLAEUw39CbQVX4s4bNq0RFzrpYh+E?=
 =?us-ascii?Q?DId9bllF+sdpKj2MlyWmFxu8d3ANpVoGj+g6iah2xFo20vE+qvJ6xCF7Pewe?=
 =?us-ascii?Q?HzrcFwTwTiVf1mEvoX5xg/I0PvIjGyDWQY98F+bBWZqz4v6ahyueBbcZn78W?=
 =?us-ascii?Q?vS9Ow5Z3iiH8Swrct0E/lc+jz7k6d0pCnczlS7J9SU9tlMVBJL71zylmKLQp?=
 =?us-ascii?Q?YDNEc4MfaFxc+bNunk9hxbf/u8EfOwZPrmNX7vW+1RmkB0+qN/sWC9J5foj5?=
 =?us-ascii?Q?fD3Sz5NKJ3p9SVYL0iGHAFNYdcSXyWN07ot7IP2jan4QPpdbMSH9dy3TCzrl?=
 =?us-ascii?Q?Yl242PHaqOes0Ki6ly4bvgFqeLa9VNf4RRxVEGMyE0HsuDEnuVvzPcNc24e1?=
 =?us-ascii?Q?cySt45mVS8jDibtU/8gLMygUQnxdr0EFb5zy2LQQryYLIpiiHAq0FMaiFLvm?=
 =?us-ascii?Q?eNFUM8gmRg1ynjxcGSAjd1N+tjUfY+rWDmh4jmAXFnDPILqu+fgr4v1NtJTn?=
 =?us-ascii?Q?yVeVFZVNpQ8WUeDdtRWccOe1HQHG62tUaEeNnIkm+r8LtbiPvzadAPOO76PS?=
 =?us-ascii?Q?OYpHaOK18f7kS2ZkSG1Yq9PnlIMeMroP6pBJsBtYqqamVQe064bGc1yluSgN?=
 =?us-ascii?Q?nJUavGpTSaAq1fMWR72zAGrDNJvb6dbBYJCZTIoawHqclG2YSgkuMLsBkhy7?=
 =?us-ascii?Q?JQFKZ1xpf+JDp/IhNdSMnYw2dGk/GNw5HlLVA9p3Hr0yVNP4Hfb/5XTMY4iE?=
 =?us-ascii?Q?IMfu+vFx2lUAa2QdihrxZFNIICiGncy7zxZA7wzuzpKGVEDNg3j1qKWXIRN6?=
 =?us-ascii?Q?JR7CTI1K/2RMzRLFYtxPtdu0tkfghvgGw5UoNfE+xc+GCusiR+01Zi5uxz9s?=
 =?us-ascii?Q?h4bCWfBnFQvVJMWD2DrriuVTpZLkn1nUtpox3AMfIAoyltt9KxCf/tcUS+bE?=
 =?us-ascii?Q?TpcyewN1ylheQJS8ZfB5Mo3mmTTHi94Os/ojSUzjQ+o8ZaTH0cGnA+MByFCj?=
 =?us-ascii?Q?HUr7f/1MiJouJsVgtNckvdOX8kAsjg4A2D4Wj9JLJSQfx2ec9bOtjGSyYcBI?=
 =?us-ascii?Q?u9Ay3ROHZrGQSCdcuuyiFIZI2FP4LzLsKoywsyNTs4QTETBB7Eh11vLF3XgE?=
 =?us-ascii?Q?ccK8JarKcl23nZVjqKC5Yv/dVKzJeaOMQwxKWB6Z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc9116b-32c5-4400-06ff-08dd96dcc682
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 13:55:12.3338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f4EoNEpFSI6OFNMG0vtdagty12/zhbh+LAthftuHMUes+NTw/d7lJ7B+ne7ilkwJewULVu7v1/lr7WEmvHzpHFGN51xFMXgjjBMlXsMzKbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFF9270C127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 13:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216858

Hi Mike,

> Does seem relevant indeed.
>=20
> I tried adding DEPENDS +=3D "virtual/kernel" in the kernel module recipe,=
 but still
> got the same error.
>=20
> Disabling LOCALVERSION_AUTO in the kernel config made the problem go away=
.
>=20
>=20
> After changing the kernel, the (external) modules should (also) be rebuil=
t, that
> makes sense to me. Even regardless of this dependency issue...

Glad the workaround helped.=20

I spent a good 8 hours over the course of a few days trying to isolate the =
issue and come up with a selftest, but I didn't make any progress. There is=
 special handling for kernel modules (and the special "do_shared_workdir" t=
ask) spread throughout Poky. Pertinent recipes/code:

+ meta/lib/oe/packagedata.py
+ meta/lib/oe/sstatesig.py=20
+ meta/classes-global/sstate.bbclass
+ meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb

Unfortunately, any time you try to add logging to these places, it invalida=
tes the sstate. Eventually I just gave up.

Thanks,
Chris=20

