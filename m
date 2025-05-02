Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0517AC3ABAA
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 22:08:27 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.86])
 by mx.groups.io with SMTP id smtpd.web10.659.1746223704741705842
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 15:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=eupCr9PD;
 spf=pass (domain: axis.com, ip: 40.107.104.86, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHy/5ckgJ9msP2xn9E0MDl/XYDGcnNxZQm2XsC3cWeSOqNiRmT33wGUsG6HTRPokZQYh+dQB3ZPfQSENdk+ObDyT6Kh5I5xl3L+lLlJjwTfEnnR5+WCCtnHjOO/2KervuswY/dNAYf40KV/vAWRH9DnaqkWHBV+5UPS+Jrka4oeZazIjUFj//nfflDBOrrEMC/1Exd053UN7/JukZL/XbZL/8PQsSTpZV3Dm3qCS3YSwNtnyqNDUG3VHdRL0uDYFFkjCtdRnueVxjQ6UfWX5b1tg5xAn8lK5pBxKzHhjhZUhWJGXjoEQbD/Z/6TQAvsmQCDesnyWvGN9tqMBTgDJ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=py+UYtIvcWImvDlUJEQeCTFHc1MkAc7+EV0ginaLq9o=;
 b=QU/X7Kj9OvwZMS0EluqN3MPPENhSYJNUy3OTP8FMJ/Grvl7UR8yVlydTKqC+nAeAdjHkeYA7/ZxTNom33X8Gwf4WDaP4A9rVzw9xAhNBDureT2C38mvw02fTUj2QKvbbdGgIOMJb231EhQGERWeNwC3iYSnmEU0/c3WLvr2ClA4RBsqhWrbNig94CEM9GxUZZP+GdFpCt41KGEEgUfAs/i+o2ExAf1RWL3LKVSDe2kiD7v7Ls4X1zfJvFQ0dUKYFtgsxYD97Ohn1jlXUWEmr2Y5lkCEsbPa4LvaZU/C/3KZ/CLLM8DXpRiT0/aGp6D23oDHXH5z2DxwQD1qf0ssHYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=py+UYtIvcWImvDlUJEQeCTFHc1MkAc7+EV0ginaLq9o=;
 b=eupCr9PDQvTDHBwPxVZixJmbbLbtvdCjPqG3CM8NXnmNPD84wBaSlw9ZG4zsUXxBxoswY/VW1qAFQQeC6GsrRpe0F0iuJkNGGiHhCf1Ooi7+LTYxtQVEq58eMcsidXHyhMeXwZW6FKfbgvEo4mT9/NhPXU6+wnJVCLBVWYvB1WI=
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com (2603:10a6:20b:63d::6)
 by PAVPR02MB9181.eurprd02.prod.outlook.com (2603:10a6:102:328::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 22:08:19 +0000
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb]) by AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb%5]) with mapi id 15.20.8722.011; Fri, 2 May 2025
 22:08:19 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "rs@ti.com" <rs@ti.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>, "ross.burton@arm.com"
	<ross.burton@arm.com>, "alex@linutronix.de" <alex@linutronix.de>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"kexin.hao@windriver.com" <kexin.hao@windriver.com>, "afd@ti.com"
	<afd@ti.com>, "detheridge@ti.com" <detheridge@ti.com>, "denis@denix.org"
	<denis@denix.org>, "reatmon@ti.com" <reatmon@ti.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "vijayp@ti.com" <vijayp@ti.com>
Subject: RE: [oe-core][PATCH 1/3] emptty: add version 0.14.0
Thread-Topic: [oe-core][PATCH 1/3] emptty: add version 0.14.0
Thread-Index: AQHbu6FXe455s1uMB0ym9f18UG0cd7O/5Q1Q
Date: Fri, 2 May 2025 22:08:19 +0000
Message-ID: 
 <AS8PR02MB1020120D72D6420EF2F774F4CEF8D2@AS8PR02MB10201.eurprd02.prod.outlook.com>
References: <20250502202840.3148565-2-rs@ti.com>
 <20250502202840.3148565-3-rs@ti.com>
In-Reply-To: <20250502202840.3148565-3-rs@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10201:EE_|PAVPR02MB9181:EE_
x-ms-office365-filtering-correlation-id: a1291710-ca18-43ab-ff2f-08dd89c5d8c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?X0nt9rKHFkjdLg3v2TH06OzxrTXyn8KoJkCmANoZ8QWScK5RHr1XE25fr24P?=
 =?us-ascii?Q?DulTpulQqQG2dlCGSzjGzwgU9BEaSbo9kgoy7aWMb6mBMKHE7G3SNIzUdRSr?=
 =?us-ascii?Q?lb+o26pbMfIKnMDNFDf81QZ2v0+teR0GqQIpQdxGlYWih0M0MiWCgkhFg1Uy?=
 =?us-ascii?Q?G2nlxb8KluxkykxX0kUfOhaREg8A1TncF4BnC3pqp8fcPV1Pmo/4oT/x7X0k?=
 =?us-ascii?Q?qRW3OJn918qVfBR1Genb62pFQyGySSG2tk4750OZ5xElHSHZFCIjuUbrrd7c?=
 =?us-ascii?Q?L2xzNU/En08VaZ4/+RfTJ6a6FL0MY+eI7vr/6zmEzH6vfViVueKNnG0qNJSn?=
 =?us-ascii?Q?1gO+XeUNZntweiWOtgyRRRTU0po1wAdmNt5rnxZxNvqAFCy4sDvMGGuFTdGK?=
 =?us-ascii?Q?5K8DS+gjas1bc1a5te41cN5hdfpBMIzRU4J2Ne9SyRz5or03LvEGBYpMoagh?=
 =?us-ascii?Q?sNyB41SBlRQhndb79+66WNb+h2OMCE4DNPaMnUOb/+h6jnHCZLp1Ba+wNfcJ?=
 =?us-ascii?Q?+cmxnrvZlYVfL+HH9B6pGXZVTiXM/YA41C1yfQi/Nh50/QX2x0vS0pxBfBpr?=
 =?us-ascii?Q?4Qts0Uqqv+QBJ7ijiWZmYDUVBXSgQ7S/nMorgPpoQiToYF967SZlsCVep+1c?=
 =?us-ascii?Q?6/wXzxIV8T91onQGvyr42CvDtitW2QsQYmhrAfhyML8UpSL7KjO17scad2sz?=
 =?us-ascii?Q?kiiQZOVn+ivuKc3psk109DEwPd8qoFo+nzAwZ4wmOEMt3o/r8RrZyBfORxp9?=
 =?us-ascii?Q?cl3IR6Xoza6sKSqAa89c1xUghh8CzdsvzIPqXAeTikKSGYI6LUcHY1NXUPPj?=
 =?us-ascii?Q?zWmLptGntyYJ4rhRlkesjfXxBOG5Vz5mJvAc3UgxBuaSfBl+N2sN7+ZMzMwz?=
 =?us-ascii?Q?nQ1CtuLZfb5uKnOo9saN5os39j/4LsfSt9ydyM/Shq6vkgg2EaGu0OqFeYXA?=
 =?us-ascii?Q?llLaDhI07aUp9WlM0vpm+bgFDLVXrEjJqg9Ayq/+YXri9ADoXIUc81zlFwTY?=
 =?us-ascii?Q?W0eOnbMUeXNtjv4rg5Ey7a4faj6HoR/+HT3be7VlgSUD/utzp60UpVUqP5TX?=
 =?us-ascii?Q?cYSaNXcWmcdIV+nndovShzw/9Dw88tgAKQeHN2PFQcrycYnFTwJAxnvJMvNl?=
 =?us-ascii?Q?ERp7z302vnsUosATkPMIzaDfzRqXuP8MzDBnYBXuiNa1vESJim8Vv5iDZvuu?=
 =?us-ascii?Q?AEgrY2mIPVTpL0NdVrhZOSlRIcHfAMrLgqT0U4tiFcKO2Nufic0YrZLO+nhu?=
 =?us-ascii?Q?FW5DKN77LeTR893xw1tqkq9O2S2RHC7ipOmb2mQDKDNb2eCT8U+kGql6S4cL?=
 =?us-ascii?Q?4xlqvyNgUAk/XIgrWEDiuKnXyluFc1DF1H2fuqXBWCFc88kvx8KRScvPFySv?=
 =?us-ascii?Q?KEpeJL39zEzhFnUkf/5OAFM0tlpxO9klSIWideKvjtyR6t935nwYfvjDSfN/?=
 =?us-ascii?Q?TuQsJCVs2Q/8r7OW0Gj9Ua93GradepyQ1AFVXJPRzjYes1kJ5BZiko3y6qkS?=
 =?us-ascii?Q?b5c/IV6qoWRrVc8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB10201.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?w3DVOJVDdF8cHnXVe1xZwf85pOxERrx8MCjTqQmkKzPzeweZAEbvbZqnTtvJ?=
 =?us-ascii?Q?KUvSqBM2zwQFvQH2pCPkfEQ/58KTgaQbHMQWOXyy1zL37rAvOvvIjzCW/awg?=
 =?us-ascii?Q?+dbCd5Nnsx7BeD+pZ0NrAffekqkD8SkXDwlU3pIYXcocUVdVmFWMiBjK2/Rx?=
 =?us-ascii?Q?NuXamz4Gm9hUtW37/TaJPNitgsuzjgjivrei6cedFLanmPK5dBiuJzhTDMSI?=
 =?us-ascii?Q?Z7an0ySPzpgNKcJlXtpgDCmEMYTOhAQuWZzy+7/WdLWgelh/24m4B9KVl11L?=
 =?us-ascii?Q?kMj4MFgQkwghD5Qjy5LhNQU0TZnouccL6AH2itzXos3mOtjn/iSGeX/XZmVr?=
 =?us-ascii?Q?C5EpmtdEEQtDt9U0OYlMX61f5z4rkB1vNm11fpWl9mTsEAA+0zPIIbS7mCEm?=
 =?us-ascii?Q?oKNkvHHeyzFJixQN24FimPgDWVcpwI4oUuAoVkScLAXLffPixmJqv4GRtXwz?=
 =?us-ascii?Q?KZxdZxTbDgzJUTsS3N32ly0kcKTf8dRCLcdee0ZsFJUFMx1qrBlWPLW+yZnC?=
 =?us-ascii?Q?Q1AUMVyAE6txRb4mAnqiEs8CE/qhbSXZlxQlWbuoBHimURt3B/lEuHFMDbIt?=
 =?us-ascii?Q?80hH/MFYLWzUCC9k11mz8qLJ3A8LwIm7SkgwjExoBdFDgyAuyT6EIRRM0s6H?=
 =?us-ascii?Q?nGFiBSdtf9FYgMkkq1pJvzn2ruHbitaVlTc5ET0d3+V4YulS9bFbokWu0Z1b?=
 =?us-ascii?Q?OFFyE2DIitJx84QrAl4JXiG4wN7GpzTKQDuZUC43Zs8dm6HNYLjWZygDq3EL?=
 =?us-ascii?Q?49OZsv7iv8qf4pJZUe4bOx+057wqIc+bFwOhbMpUMlgB001+oNB5qqLTomi7?=
 =?us-ascii?Q?yimY4h2eREHw2yTE2ouE52AUPf5yZMcx8Xu7WdrD+K0AP2nT8rRC78stAV4W?=
 =?us-ascii?Q?hFItbRA7Syp3bOoZ0hhqohSdDM+cn6i4iAsH06pabkv9MNQV89WUr9eYGkss?=
 =?us-ascii?Q?vWqTDaTjxNPJeXFk+pPLen7NdDsopxZMmqAipK06DIwKxzD+XZ4yf3ncv7Ww?=
 =?us-ascii?Q?hZwhHRcXZ9dGx0IHs4FtISzXPnAxcw4LQ/ICwZheWtPL4mS5Jb85VbEjawEp?=
 =?us-ascii?Q?O9NC7T1orgQcuYXzmKUdyFCKvzf13CK/7pxZqqtHv/L8wxta7LndMcwbm8xM?=
 =?us-ascii?Q?D7YhiCn6WL9D78Vc3Koz6qG2YrvOP3rrvhaoyhFrxAynniSaf8KUapyNgwh0?=
 =?us-ascii?Q?vt/qUnrVGdfZKCKBbJvkBOETmC2TW3rCfJp2bI25RVj+ASpCs5e2WlJCGSn8?=
 =?us-ascii?Q?0crwRjxdCldTQvzngzJpOJhRDtZQM/Y4OoAYAuegzq9C+Z8bXmS/GPtTdeIo?=
 =?us-ascii?Q?d7u8LqJNaIhjo6sJFwWw2Sn8BvmkD4oZPExFOSl8PTss4UZnoC7Dd1Yqzsm5?=
 =?us-ascii?Q?+YdXajEoL11GfGf4k8NuL3QYEAhUgCHb9zEet+LVulkJuBth+TlUBUIlmEHe?=
 =?us-ascii?Q?UyXAwDpGITvBgX3BV65yn5kBE/xcG7opPjvEAQAvcjwFHKtn9dn+QfLTU8Tb?=
 =?us-ascii?Q?Ffk9+g/GlWm0Hwt3iOENdhe0B82/TKMDRZmCphOG6AquFyMmwdA7RNA5k0Ns?=
 =?us-ascii?Q?3CRKaedKOKO3fQgMaWM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10201.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1291710-ca18-43ab-ff2f-08dd89c5d8c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2025 22:08:19.4796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sTLhxpoYt61MWSMEpboyXtzENUT3mtmqfCr5nJwj4/N090dgd86IJOrrzz57zxJp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9181
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 22:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215927

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Randolph Sapp via lists.openembedded.org
> Sent: den 2 maj 2025 22:29
> To: richard.purdie@linuxfoundation.org; ross.burton@arm.com; alex@linutro=
nix.de; otavio@ossystems.com.br; kexin.hao@windriver.com; afd@ti.com; dethe=
ridge@ti.com; denis@denix.org; reatmon@ti.com
> Cc: openembedded-core@lists.openembedded.org; vijayp@ti.com
> Subject: [oe-core][PATCH 1/3] emptty: add version 0.14.0
>=20
> From: Randolph Sapp <rs@ti.com>
>=20
> Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
> relatively lightweight display manager that supports x11 as well as
> wayland though both a CLI and automatic login mechanism.

"though" -> "through"
"automatic" -> "an automatic"

>=20
> This can effetely replace the custom init scripts for both x11

"effetely" -> "effectively"

> (xserver-nodm-init) and wayland (weston-init) with a single tool with
> more verbose logging capabilities.
>=20
> This is split into two recipes. The emptty package provides the binary
> and various agnostic configs while the emptty-conf package provides the
> default configuration for the application itself. This RPROVIDES
> virtual-emptty-conf, allowing other recipes to provide their own
> configurations to override the default behavior.
>=20
> Signed-off-by: Randolph Sapp <rs@ti.com>

//Peter

