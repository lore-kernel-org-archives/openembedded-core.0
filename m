Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C66CCEBF6C
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 02:05:51 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.17])
 by mx.groups.io with SMTP id smtpd.web11.60294.1727402748270673004
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 19:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=GWzzrXa8;
 spf=pass (domain: axis.com, ip: 52.101.65.17, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQ7XhzaGOq2U4Guz4K8iyWFNohoGdVr0YqRFDdW5rIOP9tfgCK9wI/FJAKpdm6qPvtPyyyhyPX0FV50oEFI5bZBbfgTyPsK7NAaN5B5YSC/nBmdgCTlGtPONz9VxVZz8GzdTVHjI5SoWN761p7qZGEuqk3Pg8SCQwO5225tnW19nCsPImgkmu+HnIG/0qLTfZeP0uA1k4/jXcA99ytaal6iNcRDvXyWG1eacdfUpvIAlBbE7DjJ+yqs2AneiRzEdNKd87IDCpz/+1sebELZoh9N0Pc40117xgquMNylJJeefFPnqP0vn6bVS0P+CzpRl2/SGDKE+0VeKoz9PCJBlzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0eUQKPe05I8yuaN2PORYvd3QgQV+BAbZmbO5tFHoPqo=;
 b=bjwy3I/slVp7pjyE5wKbcegtp2+kS6Q2v83AkGldnckIMYWxdpwifl/L5iecVfop1Vpa0/DYD6bkztfF34vPfSpadCauKx6iCYQ0S5x+JKiqcBur92pWpzZyz7hco8gnHObeN5177jslxXVcOvRKuhTNwvJACPR2TyoTuEfmyk0g8Fh6iZABbUGvNcHz2BFVl0WjRrc+GgASfASj/nJYKA4jg54rMusAyOGiL74zT95++yqaKHf2Kj39Lcau7min3W6dvI7pAD7vEdF/Nj6Ri0JI/LtB9+3nlYZnLBswcohu8VbQYdEd+Jw8wMBoYIYFTx7b7vXB6LaC4cRW116oKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0eUQKPe05I8yuaN2PORYvd3QgQV+BAbZmbO5tFHoPqo=;
 b=GWzzrXa8t1zs/IfwMeS0n9ZHQ2Rw/F0O+5L9ncbLD1cD2ZAz6pBWKWr2tN6v9csrSmDWo+dz+2TaI4iQugTxDDRDrj8zX/+svYsEBW45Y9Fuz08Gih0T3Rb17YoRjnnzO17yhhzFvP5V5uNtW/ewvmcsj7JtKdMqRtSuRKqhnSA=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB7367.eurprd02.prod.outlook.com (2603:10a6:20b:3f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Fri, 27 Sep
 2024 02:05:44 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8005.021; Fri, 27 Sep 2024
 02:05:44 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jon Mason <jdmason@kudzu.us>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v3] default-distrovars: Have KERNEL_CONSOLE
 reference SERIAL_CONSOLES
Thread-Topic: [OE-core] [PATCH v3] default-distrovars: Have KERNEL_CONSOLE
 reference SERIAL_CONSOLES
Thread-Index: AQHbC4y/AbW5j6IQykSPyh9BmCJOErJq6/SQ
Date: Fri, 27 Sep 2024 02:05:44 +0000
Message-ID: 
 <DB5PR02MB10213C3DCF067D87A136D3C28EF6B2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240920184135.789227-1-jdmason@kudzu.us>
In-Reply-To: <20240920184135.789227-1-jdmason@kudzu.us>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB7367:EE_
x-ms-office365-filtering-correlation-id: ccd9c2f2-8f2b-4c2f-063f-08dcde98e54f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?u6G2zzO7mbIZjm2tbvpdzUM0Sp6nkWzjllNWQBk9eVvQJC+SHvgUjSKK0ja0?=
 =?us-ascii?Q?SKtbal0oFo8WELkeqT8RTaDAqME2kj5gXkChq+3qXdLm/U5kMMGr1v4Nrit6?=
 =?us-ascii?Q?pnoTLIM2egfvzh1GVztKn7wp0dl+TQkyeE8z75UlhgU6p0UXELz0hJdUuqVU?=
 =?us-ascii?Q?+tglqKxSGOSSNT99G871g5cIJD7jofKPZwsjAEb3n0fb1TRmtjOC/NH5AwOR?=
 =?us-ascii?Q?ueJbGid0pYmwGn7Bxjjq9UHqXXVOlvmvSn3RFbemVRZRLERaCye+5Tuo7CZn?=
 =?us-ascii?Q?AMBYeuj4HJ8PYxs9Nxu9ORosDCzxcPj0bKQnkYCfUM8ys7BgW24pwNX2A1LZ?=
 =?us-ascii?Q?Bh07ArAZS1FTx6OVLzFaaEFuvPq35CREgqV158uTQtpQdMOn7W/EJIX7lYou?=
 =?us-ascii?Q?Mh9YMyaUKTR+QmhlEPKcPoVgRuYrkjz/AoEckWDhQFmwlf4ssz5s6Rhc6aEh?=
 =?us-ascii?Q?gQeHprG1ahBFYRJXiE1/ad8gwf3xHlyahauWgOSAw5ZwSqo9tKXHQyq1rCo8?=
 =?us-ascii?Q?exQMhMBFdp4O4cP2HQBSIcaZhU2d4j3FArF/jZe9ZLGY6zeSyCFc5ysReBLB?=
 =?us-ascii?Q?F7WZAamXaYzZ+o6EHrWlsasS55sv4R8G7xvSGAurX2HzYefdUWuP/66e/nps?=
 =?us-ascii?Q?v8IS0UIvsIis+QIaAgBLq2eTAPUufGj2PkvpAD9x9RxVsUWdguqj71vyrUW6?=
 =?us-ascii?Q?aNDCdstt8eRl0enGFW6T77nZPbMlgvAxEx2ZTEki9l5oSDlQ28qUnHIiA1SJ?=
 =?us-ascii?Q?/neqSTmPrJFL90tu27DtIqDICRe1u54reMLvfHvQNyP4Ef6SNQJ8flaaxRrN?=
 =?us-ascii?Q?h3Jayr420ZrHaU5V3lwy4ipaAZ81LxuWIsajr5af0PeE15qXXcNGpAwlvSvU?=
 =?us-ascii?Q?8WzUljB7hqtxmZMk4ykesp4Vy5WRGAMQa7tRYa/Yov0cvY1cn0AtYOiXmZFc?=
 =?us-ascii?Q?VCTDchM84hpcBs2xc92ex01hwO0bQrFH+zGUgi8GRWYLnehuuFcdQlIwmrp8?=
 =?us-ascii?Q?vIc6qYjhgIlR4s6Wji9MBHsFj2MiSaGpA9Rx5PYBVXmG3eUFt0qqlc1Qw2kS?=
 =?us-ascii?Q?S4lf3WCxEpHSFdv9yXaKd17wi152Dhfm6iV1AgT1J05HZ1BKXJnbdAjJUEQ4?=
 =?us-ascii?Q?Sr/Z7sV/pzndF8hJwhFxsIJDDGn7iT0uvvq2ICgGkksxVMdLnpcS7oRM8hx2?=
 =?us-ascii?Q?WFqTQfpk5UC8EsY/i8tW/sNb5IZU3TVYZrXWSsR4T8G6BKzfOt/xYOq/5ua+?=
 =?us-ascii?Q?Pm0brLuDjh+51z51/r7XvzI0o+s6V0MQJoY/1fwb3tCJdYOrG1yAE8f2QCZ7?=
 =?us-ascii?Q?sIH+6WLpaAMSHbHJ+diFpfp0nME7jz245463fchfVwbxNQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Q3IpYzewa+ApKCGopz3yxD5pTyAdX5EtWyBpHTeEzhHrgOcOaKZ6/SK3wGu1?=
 =?us-ascii?Q?Q6M70rvVdXsYDy6FRq+cDTbabwCvvhfrKHO6FkDVOZhY7RL2YW/Tvf8dDZR5?=
 =?us-ascii?Q?o+SUgxXfgPkMVOkG1SrEis36Jl3Ih0tSRYEyt44hVBMtlCnxZyuRv8At03CY?=
 =?us-ascii?Q?N8ZfCVr/bPGaYk+1rgSYqud2o7quDdj1miRHqIp/gzqUbNqN1JjK516iMDmY?=
 =?us-ascii?Q?Ozx2Y79ZB0eYEFs7+7aVVWGfweuW67fPECNjK4dA1i9qMfgecbthgDqUvy/F?=
 =?us-ascii?Q?VbNfbeE7drK9KUjG+XIGUVNzbCHORpMukQly4iKfYxlQShgeiGgPj4KnjRRJ?=
 =?us-ascii?Q?fY2yIbrRHe+e7isljMPGPgFzyeEEG3PjR+Ve7O4zUnOKOKYd2MlwkPMJj23O?=
 =?us-ascii?Q?maPbhcnzHuPULHw+uTgHC9YHjrmuZB4geEnpiCZuLRovDPSThhA3hs9RVMaq?=
 =?us-ascii?Q?KTX6rPn+cc7MYh+a2fzxoDcvja1ATegdhwYVkmrmKkLJa3BFYK7ugbif9Phl?=
 =?us-ascii?Q?kd6u9DGJRzdv/91Ylv6+34w4/9tOceJ3SFvHQL/37XtjHg0l/mPSdr1Je8yV?=
 =?us-ascii?Q?cvIaFYTZiA1WRPlLrnD7yRs0I8uDZaiz750+XpUoNaOrjwJMkPmf9/Vxyn+X?=
 =?us-ascii?Q?vjfUU1kGUokuv4A3kQGAkf4elIAprlvyiHPWmvKYrrynylZnyrxJHg6dlFc1?=
 =?us-ascii?Q?US9f8b0rtOG2D1SijudOeR7GdXHH9wKUT7CBRCvlSS9sHwIin+l7CkRcuPAJ?=
 =?us-ascii?Q?98xpc/s1St7TEdj967YH7wg+2S1rDSEFiVVkKdoEArxYo2F/h3ytmqyfk7L+?=
 =?us-ascii?Q?/U/cWsWym5Y+4OWDLb9Wuqrmyd5gBSWRLdlCC83UnYKPfyyRUVm6f29YKaD3?=
 =?us-ascii?Q?5g60cx+jHjFg01g40U720FvRjKUqVeqKD3lgtVonfasoVm2Lv3hX06Y5B0Ez?=
 =?us-ascii?Q?ers6vbPETh3VT/ti6EXWWxDTG1wvk9mCB+3JOQwFX3Cvm1lmiJCtpF7mEGMp?=
 =?us-ascii?Q?VyXP0D17TGDxnAWyhMo2SM1kTybhIIgTiwM3u3S+zYkir45jrm1+mWN4dfCS?=
 =?us-ascii?Q?CtJL0ODGJIwxOAUAORsVM5b0BwnZMzM0Jhkta9JoLY1xx1zi6yBzaRTDS7uo?=
 =?us-ascii?Q?HferB4QOde5ugfa6f/hk9JaYN8YFvF6ACsJ4v4XFcWYUgNK6taM53NjteHvI?=
 =?us-ascii?Q?lrn1rjfND3fy8/w4w3ix4mwlpsI6gDmV4iS8eHdCYpWyh1egf4P/MtpQLaqD?=
 =?us-ascii?Q?xPWgZXpsSyY/NlFbAsB+piRBXJVeAcyNAofy2T2672u70Tk36roNX/2KB8tp?=
 =?us-ascii?Q?/HiQ8s0ekK9lANqmX6cJkSEs9eTBMwIRuz9w/ZmfTp68Nok2kxAGCazV7KN9?=
 =?us-ascii?Q?iWn/IsFRA6lHzgi7QXnur+E7U1h3IUpK9HTOYmbUtc6shm/F3vX1l+aoRO9I?=
 =?us-ascii?Q?je7g+v0zn++d+Fyn/5iZYXPLnJNcHs8vZJi2BoN9RAlLGid/4IFgoZMz266/?=
 =?us-ascii?Q?cuKVXVFWGw7YDZeCmyRQAwtFlPMzGCOos83DDZQnFoHReZjY4MyLN5H7TNrd?=
 =?us-ascii?Q?4B+UgoVOQ2i8S8nA84k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd9c2f2-8f2b-4c2f-063f-08dcde98e54f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 02:05:44.3126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D6EeyD5+nk6IZU2nJoGI5V6UKd5iqKbqsKhC2yuOzNbCAyeG5+36WcAURGiRNNeL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7367
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 02:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205004

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Jon Mason
> Sent: den 20 september 2024 20:42
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v3] default-distrovars: Have KERNEL_CONSOLE ref=
erence SERIAL_CONSOLES
>=20
> Currently, KERNEL_CONSOLE has a default value of "ttyS0".  However, Arm
> machines and those using virtio serial prefer to use "ttyAMA0" or "hvc0"
> (or something else).  These are usually defined by the machine config
> file as SERIAL_CONSOLES, which has one or more entries.  Take the first
> one of those instead of ttyS0, but default back to ttyS0 if nothing is
> set.
>=20
> Also, use this variable in the efi wic file instead of "ttyS0".
>=20
> This includes revisions suggested by Quentin Schulz.
>=20
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta/classes-recipe/image_types_wic.bbclass     | 1 +
>  meta/conf/distro/include/default-distrovars.inc | 3 ++-
>  scripts/lib/wic/canned-wks/mkefidisk.wks        | 2 +-
>  3 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes- =
recipe/image_types_wic.bbclass
> index 86f40633ebcb..db598e874ad7 100644
> --- a/meta/classes-recipe/image_types_wic.bbclass
> +++ b/meta/classes-recipe/image_types_wic.bbclass
> @@ -26,6 +26,7 @@ WICVARS ?=3D "\
>  	INITRD \
>  	INITRD_LIVE \
>  	ISODIR \
> +        KERNEL_CONSOLE \

Inconsistent indentation (the other lines use a tab, while this uses spaces=
).

>  	KERNEL_IMAGETYPE \
>  	MACHINE \
>  	PSEUDO_IGNORE_PATHS \

//Peter

