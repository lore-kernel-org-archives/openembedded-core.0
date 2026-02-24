Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE76EF06E0
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:45:15 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24722.1771951512230464204
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 08:45:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=hjd2SxAO;
 spf=pass (domain: siemens.com, ip: 52.101.84.58, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLNVa09PNTEDAa4pMvSxJraMUehQUWwqeRfLMGEIYwtAbN/ydrApHDkkYAUJA2rzsbssHw/a1+N1PnzUrqoaTy+WEkeSAZo8bG54htkIdBYu2PJRvvzxEwWUj0RbLlvz4zbCAnamB8jojF/+m+QGtKIIY/B9OHBa7sAyb4SqkCWKbzRWpVraZVFi4VOpTb26lcsRdZZzSBCc9w+I5VQ93nVTi/gEBL4rgjm/+F7Zq6+fsbd307aIeTxp4hQSAe5t0td2nOgbG8NszyWWPkh0HWdr2sh/51mgggiaSkP+n0zuES+wXaHYx9dEC7/F5lH/PjYlbJKuYaJkB8z7rLlj8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WN5Np1iKOh2HhbV2Zmnev3bWQkMq4bxeujn6yDw7ooY=;
 b=vRX3MvmAOnJ+JfrOFByCFiFjrIwQOnWrgmGV28V2ZGHEB1ZEprb2wxDlBcVG/6Xz/AJNpGQhdKeLvsFXzOyZkY+9lM5Eb5mxEe+Ln2pASkMHDzb+13DW2kkGvZ+5BlCr/aPakJN5lvchWiB3k5xTLZBSh9Ekem3cotogaq7bVtNhOPtA/zJ/V4FJ9uJTiP0EVHxXVaa2vlw4qtodAtXUZRf0Ws+IHXaNlzf72j4R2NQclyEIsZ2pyt7049avgPUBj24VOaHSzEMiADbNk9YLtXlJWkfLc9by4KYmd7cufUwfzLskiqv6GP12GCS5jG72LGeMOM1hwc0cRaKSqIgQ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WN5Np1iKOh2HhbV2Zmnev3bWQkMq4bxeujn6yDw7ooY=;
 b=hjd2SxAOeyWTI2JDRsxeNSVPg//mwSQERnYqA1ocOwlK31CP+E/dcgqf6XutTNBdrSxiOgtBbomI62KWBfb/LQebYHyNTEGzgJyp3+Xfi3FgDh3IO0CnzlGP+m+vOLfm3bD8mn0bIxPMbL7jQu4C9Bz5EFgoRJ9erz7C9iJ/lEcbMTdrgA3Zpkr+LDX3fqIQL+D4DqSTeyZmWZjS24oF8AGMvoYYFl3YzR4twyfq0BHK2O5ag1KQtUECeaWsnXlQdmh50z1/EKebH3CvpIO/YdTf90/qXV9NYWAv5vsZ8r5Ry9NF8pIMjAiJPoGYMz4ch1zhwa/dZYy2Xhb4uTeDSQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB6627.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:563::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:45:08 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:45:08 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Yoann Congal
	<yoann.congal@smile.fr>
Subject: RE: [OE-core][PATCH] vim: upgrade 9.1.2144 -> 9.2.0
Thread-Topic: [OE-core][PATCH] vim: upgrade 9.1.2144 -> 9.2.0
Thread-Index: AQHcpap8iOaO6th6zE2X5YVZJtlBgrWSCk1A
Date: Tue, 24 Feb 2026 16:45:08 +0000
Message-ID: 
 <AS1PR10MB56978C6748852F61C4F7109BFD74A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <18973B8A1D1BE087.558139@lists.openembedded.org>
In-Reply-To: <18973B8A1D1BE087.558139@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ab2e2919-c9f4-487f-9758-7c8f94978dd2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-24T16:29:58Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB6627:EE_
x-ms-office365-filtering-correlation-id: 12cac89b-42aa-4c3e-54f5-08de73c41201
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?LIcC6GN1g8Id1w2606tsth99qyNlKdEwIngaMKErGlvAp595NA8Twep4oixF?=
 =?us-ascii?Q?Dp10o52NuAZ+YaqZxH3+SGtrQ53K4rzvH9LM+c0U4uoBgqIRO5BVoXvWgA8f?=
 =?us-ascii?Q?zAa1sl+fqhUi9OtiS/FJIKjDO0NiFfAHAV6fd1L+6NgPhTLSDLYfUuYsMcrZ?=
 =?us-ascii?Q?d8vNTdMBO4wkNLSfQ4xToakLwK06KsVKRScotQtecdyBo6FEo/h3vIrmZ7CF?=
 =?us-ascii?Q?0x8KfuW4M51KS45V8zVlDpqnbb4oNI2pWt2OUB1zzyr9P4j5dAqo2b8870hL?=
 =?us-ascii?Q?JUVfH8dP/g35ALz0y3xARLL+aUF4EnNCwSSQoqrhNlHRVLyAlew7+sxOn100?=
 =?us-ascii?Q?QSOSANv/TW0ZGAheTQu1lpkrvUqqe/6gUqqs1IPrYu9V78CDChse8hJip6Eb?=
 =?us-ascii?Q?j+8ENDJrjrnt4f8qaoJDSrE7HdNB7fTlaifRjrJe/LP4RPfxfWxmfuPKp6od?=
 =?us-ascii?Q?36qZiqT8VRcix6aqoJb/s7mg/hT/tnUK9EbG5iZ8GloriwWZmtOauul+p5pD?=
 =?us-ascii?Q?cdvaHR2UBOZpFhyPZWneSBIu+/yOetnlZeiCEc39oqJPRH6EwfPhx+EXq033?=
 =?us-ascii?Q?XzJFsDRbSzwrW6Mg1LMxKJmLRORdorP7tsvRTfYCAmYRdjKvFF7/qfKGY3OX?=
 =?us-ascii?Q?dv52vrKYsbP7+Pkd7cnoEerf4PwWkrvImCaGTdNhbaJZczuYmKqo9ChS3Qs3?=
 =?us-ascii?Q?YGF5/hHuXLFWzCdhB746/TWNHux6aWXMejvYgbr5Q6LFv5ctybJkRxRlpOnf?=
 =?us-ascii?Q?I2KpHZWljhXfX2zWmXt1ZugmbViImNJgCzd2DrIQtgY+TJkfc0gzSBhJPry0?=
 =?us-ascii?Q?WJMXu8XHxLo2yeN0nAikVSN2iJaSt5QbHD7iJMNTnjSU9tWaFRKhP6rJk70S?=
 =?us-ascii?Q?hO5Ep3JZ3VAys3B14bZTwOVuR1LiMND305gQHayNE/13gkPNXKGj6JZAy+8D?=
 =?us-ascii?Q?1Ns9zAiMNwPiJ49BZCG+4YQF2woFnzU0CqZsU+jG0wJY+v88xuLCemyb1Et0?=
 =?us-ascii?Q?itKPyd2SLEyE1B3GMV65MAgO+pceVhNXHzJwjFyLzTrwonPNffn32IDA79x7?=
 =?us-ascii?Q?YFk/jRKIR+VMYXFYAXZXn/cCcvwUljQPDd+bghobEy+z8rTR4q50iAdomu1x?=
 =?us-ascii?Q?vAxS4XxrgSPhw0/ajhkuE0jChXFnNnGXBFmuVTqM3Pkf1TmSZnHZEg6qJTOs?=
 =?us-ascii?Q?6A3OngTjY/yZZK81mUOVX6E7ZumZ7K8SEZs3ek2M7/n1erXOaMxQq5rwyAr/?=
 =?us-ascii?Q?HlILjGBcRGK4DVNJ4mrPBbOfWmV/VP4M0P9Zu8g1azqM4ce4gwH2rFMBpL9I?=
 =?us-ascii?Q?IxrPllbqeavRLhqXWpIwwY55uagZMqclfRTT96Ciu0y4Q2qZQjiPWG3q1JE5?=
 =?us-ascii?Q?JSG7Mk/GfCMPaOyIgSD2tNzX+JEyhJDgBtCmrJcfIKHZQWke8VAFnPdXnQYm?=
 =?us-ascii?Q?5qt9qyQHReiAy/cyjsDdOapHN73m33cQ/uSjvnoNELEnJdCfCQvdkb8ZET9Y?=
 =?us-ascii?Q?wAhfB3JkncTct5WqrWq83P1NJ+46rbxdCDVeYUdY6i43E1n2Lap9wyfgXYsC?=
 =?us-ascii?Q?yOwh/FCmmLekXFJ6+8jKcSS73KFmYYUqjfXNjoUv4jBrpzZXt2zNatMFaUAM?=
 =?us-ascii?Q?81pKsf/J/lZR/nPqtYFDQDh+v9olxIiGf0GVMYnwbsbt?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?mNGrRJCwi1EuWypKOOjxXACB9CEIDRfr5GXYi+sZk1OwVQRY52+WWC/98g3/?=
 =?us-ascii?Q?HSWHtumau4BeQewFIRFzsypOustzQSZWybKJKEjoLObJvTfVsU6bhoqn3yFX?=
 =?us-ascii?Q?rGmIjr3ADN863YXPqdms3+LzUA9DUIT7k2b5dBdyjQqfOsGsncxzngszAX70?=
 =?us-ascii?Q?ez5SzuKRzOMqT/epaZWNnqEiGYc9JehjfKZWdMLi+vUuotgbrO5QsMPIyCz0?=
 =?us-ascii?Q?kubrmyl75P9PBPgAtPwL2/VpTSGGtH/Uf8FzWbfqGM0dr+mx8C1N4xGw9dCH?=
 =?us-ascii?Q?n7NkMDj7h4oeLL/Z5sAg9qcW8qI+QJ+z4MSFXP+dcEtKjjZmnhyZ0LNd6afu?=
 =?us-ascii?Q?SZVh7GfUftmLNwGJqAldTLps+b/ZXmlBY6GCtadECr1iqtECLUDeqC3jKp2A?=
 =?us-ascii?Q?PwYA/XZmzDliraxvY0WaxxhdK7hKU26Ie1OgcBK0ADp6Oji9joFLeqFOFzGD?=
 =?us-ascii?Q?TYV0kUasit5YQWbHRiJFLDy6+U2U54tDkCgWUk2+Mp3aeUfDDLOX2MkYSx50?=
 =?us-ascii?Q?mynnN5DUXf7mFRZ2mqu8j2tykcHdYFeNQLTv8FT4ETQo6mWPnGVbe9Xr3qrd?=
 =?us-ascii?Q?6mAv1X9aaD7Gl3r4V+Qr6/4I/FUz2u3ntfQEu0JOkqK3CeegyqDog62NLlGq?=
 =?us-ascii?Q?D2NtCpwoawRtEtMnyJoUmi0Xc7V9+MllbHij6C+YGw3aX0MizjIqMm8RX4G0?=
 =?us-ascii?Q?ZafnJf/7eO5sKfkwF5wY/brD80tDUxAF0td2sPNKI10+K/59VtUyybeqdnRg?=
 =?us-ascii?Q?XAMQLet3g8V0A6KXz1LZ2eDWNjjPahHK0zlNGkKKJUhThKA9pYm8zQryhwlL?=
 =?us-ascii?Q?/gSTPeB+IbbjgJ2eSfLaGiv2C0b9TkBcx4NWPfDAjaiF8Vut6jooeHPmAlv7?=
 =?us-ascii?Q?Gqd1+A2aObKT6DZT6qvEPVsxL1vRDJpJGsnl2A4upsZYU3ndjOCQayVGit7h?=
 =?us-ascii?Q?IABv9XROMwOfuC7Rnc6JIqNw+L/d/rrcjWpPX72nB5W08P5lTUciMXldeodt?=
 =?us-ascii?Q?myfj3LNa3tpw7UacvI5DlHY2MX9DIt9lWRrv3A9dnFJ3jOCJmsbCAUXyKdBf?=
 =?us-ascii?Q?nHWAYOoRmKccMwyrr4N6PuqNApedWokaLd57uHZWPS6TSOmQIqf3c1qZI2Ty?=
 =?us-ascii?Q?BlsHxx3vsQAHp3akgJ5hVe4WW+8o/hr1uThjWeNWBHe4XEZhyU2nD3B25Oy4?=
 =?us-ascii?Q?u+DuOBM78cgSHj4qmds/EDG8LmtabJqtBLCX5earr9/vTIoSeyYZszI3Sx4Z?=
 =?us-ascii?Q?pn3JfczIFcCWWJs4vbJ7V3cOfMLuARKIN+/FLkIZ1K6G8hSp0N9X0uofylrJ?=
 =?us-ascii?Q?sky91xyYM5LFP2YQoSzjnNa8WdQx0UKImJ/bVqHXiQTYWX0pZPUyzYp8UWLu?=
 =?us-ascii?Q?a47GaJd/FrcBJwMpQMgkGKRMJ6YMzBUlUzoqxEN8Pa5DO3DhtvF5015o6Gh2?=
 =?us-ascii?Q?VzQd187YtUIE9Q6GQvjXSChOTMzIYGuEo225Q9ONGWTulb56z9v9k9KIuD0r?=
 =?us-ascii?Q?s18imNiP9o73Y/t10xe9mHUwQYiWgN6llRPpZARECUHrrYzktNJcJROHFvvI?=
 =?us-ascii?Q?IAmmX9aQxtwFuHRDIYeWsk4K3cjy3J6fLTVEn+fTqSCKLWD11ccru2oZ9fD5?=
 =?us-ascii?Q?+hlsaV/qQXVB/hm+GgQyUXEBaXMWPO6U/uWmqd9Xg9+3oRvK52Y/ogFPUVjT?=
 =?us-ascii?Q?jxjeNrImQghkLLtSMIyeabvRkcY/f673UEQQx+8XCinpUs1WHcte74wO88Of?=
 =?us-ascii?Q?vlrMM9HDsw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cac89b-42aa-4c3e-54f5-08de73c41201
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 16:45:08.5951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mAhI13pZTgiL4U8/6Gj6L3A73uPkFbd6Z7+cQzXIeAWGC3BWWpfzvzJhUWbqTFmdsEDquyTy7KPUkD20vxVaNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6627
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 16:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231892

I would have a question on future of vim upgrades, CVE patches and LTS back=
ports.

With new LTS branch maintenance, I assume that vim upgrades are no longer a=
ccepted as they introduce new features.
I think that's positive change in general but it also triggers discussions =
on items which were accepted in the past.
This is one of things needing the discussion.

When the upgrade is now allowed anymore, I think we should stop updating th=
e intermediate versions also on master and do CVE patches instead (like we =
switched also for ncurses some time ago).
That is also reason why I updated ot .0 instead of .0045.
They release approx. every two years and some dates from the past show that=
 it can happen that upgrade is done after out LTS release making us to use =
a random intermediate tag in future LTS releases.

Alternatively, we could also continue updating vim in LTS like we did in th=
e past.
For now, there are two active CVEs in LTS releases.
Please let me know if I need to backport patches now or if vim upgrade woul=
d be accepted.

Any thoughts from the maintainers?
  Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> Sent: Tuesday, February 24, 2026 17:27
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][PATCH] vim: upgrade 9.1.2144 -> 9.2.0
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Solves 9.1.2148 (in 9.1.2148), see [1].
> Drop patch merged upstream.
>=20
> Release notes for 9.2, see [2].
> Note that almost all changes were already present in our 9.1 updates.
>=20
> [1] https://github.com/vim/vim/security/advisories/GHSA-9w5c-hwr9-hc68
> [2] https://www.vim.org/vim-9.2-released.php
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  ...001-translation-sv-add-missing-mkdir.patch | 52 -------------------
>  .../vim/{vim-tiny_9.1.bb =3D> vim-tiny_9.2.bb}  |  0
>  meta/recipes-support/vim/vim.inc              |  5 +-
>  .../vim/{vim_9.1.bb =3D> vim_9.2.bb}            |  0
>  4 files changed, 2 insertions(+), 55 deletions(-)
>  delete mode 100644 meta/recipes-support/vim/files/0001-translation-sv-ad=
d-
> missing-mkdir.patch
>  rename meta/recipes-support/vim/{vim-tiny_9.1.bb =3D> vim-tiny_9.2.bb} (=
100%)
>  rename meta/recipes-support/vim/{vim_9.1.bb =3D> vim_9.2.bb} (100%)
>=20
> diff --git a/meta/recipes-support/vim/files/0001-translation-sv-add-missi=
ng-
> mkdir.patch b/meta/recipes-support/vim/files/0001-translation-sv-add-miss=
ing-
> mkdir.patch
> deleted file mode 100644
> index 37337c3d9d..0000000000
> --- a/meta/recipes-support/vim/files/0001-translation-sv-add-missing-mkdi=
r.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 2dd7e39942f4f7740c3a645148521d3b6b443c41 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@arm.com>
> -Date: Wed, 11 Feb 2026 14:39:06 +0000
> -Subject: [PATCH] translation(sv): add missing mkdir
> -
> -The installtutor target doesn't explicitly create the Swedish directory
> -that it is going to put files into:
> -
> -  make[1]: Entering directory 'vim-9.1.2128/src'
> -  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91
> -  chmod 755 DESTDIR/usr/share/vim/vim91
> -  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91/tutor/en
> -  chmod 755 DESTDIR/usr/share/vim/vim91/tutor/en
> -  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91/tutor/sr
> -  chmod 755 DESTDIR/usr/share/vim/vim91/tutor/sr
> -  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91/tutor/it
> -  chmod 755 DESTDIR/usr/share/vim/vim91/tutor/it
> -  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91/tutor/ru
> -  chmod 755 DESTDIR/usr/share/vim/vim91/tutor/ru
> -  cp ../runtime/tutor/README* ../runtime/tutor/tutor*
> DESTDIR/usr/share/vim/vim91/tutor
> -  cp ../runtime/tutor/en/* DESTDIR/usr/share/vim/vim91/tutor/en/
> -  cp ../runtime/tutor/it/* DESTDIR/usr/share/vim/vim91/tutor/it/
> -  cp ../runtime/tutor/ru/* DESTDIR/usr/share/vim/vim91/tutor/ru/
> -  cp ../runtime/tutor/sr/* DESTDIR/usr/share/vim/vim91/tutor/sr/
> -  cp ../runtime/tutor/sv/* DESTDIR/usr/share/vim/vim91/tutor/sv/
> -  cp: target 'DESTDIR/usr/share/vim/vim91/tutor/sv/': No such file or di=
rectory
> -
> -Add the missing dependency on $(DEST_TUTOR)/sv to ensure this directory
> -is created.
> -
> -Upstream-Status: Submitted [https://github.com/vim/vim/pull/19385]
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> ----
> - src/Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/Makefile b/src/Makefile
> -index 75d8ff6c1c..b4c31bed60 100644
> ---- a/src/Makefile
> -+++ b/src/Makefile
> -@@ -2487,7 +2487,7 @@ installgtutorbin: $(DEST_BIN)
> - 	$(INSTALL_DATA) gvimtutor $(DEST_BIN)/$(GVIMNAME)tutor
> - 	chmod $(SCRIPTMOD) $(DEST_BIN)/$(GVIMNAME)tutor
> -
> --installtutor: $(DEST_RT) $(DEST_TUTOR)/en $(DEST_TUTOR)/it
> $(DEST_TUTOR)/sr $(DEST_TUTOR)/ru
> -+installtutor: $(DEST_RT) $(DEST_TUTOR)/en $(DEST_TUTOR)/it
> $(DEST_TUTOR)/sr $(DEST_TUTOR)/sv $(DEST_TUTOR)/ru
> - 	-$(INSTALL_DATA) $(TUTORSOURCE)/README*
> $(TUTORSOURCE)/tutor* $(DEST_TUTOR)
> - 	-$(INSTALL_DATA) $(TUTORSOURCE)/en/* $(DEST_TUTOR)/en/
> - 	-$(INSTALL_DATA) $(TUTORSOURCE)/it/* $(DEST_TUTOR)/it/
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-support/vim/vim-tiny_9.1.bb b/meta/recipes-
> support/vim/vim-tiny_9.2.bb
> similarity index 100%
> rename from meta/recipes-support/vim/vim-tiny_9.1.bb
> rename to meta/recipes-support/vim/vim-tiny_9.2.bb
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index 7cc122fe4a..73991ef2a8 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -16,11 +16,10 @@ SRC_URI =3D
> "git://github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps;tag=3Dv${P=
V}
>             file://disable_acl_header_check.patch \
>             file://0001-src-Makefile-improve-reproducibility.patch \
>             file://no-path-adjust.patch \
> -           file://0001-translation-sv-add-missing-mkdir.patch \
>             "
>=20
> -PV .=3D ".2144"
> -SRCREV =3D "55c12373f073bacfc97d757e8f4da3daf472e4ac"
> +PV .=3D ".0"
> +SRCREV =3D "e7e21018fc0b60c153c8e668f696d95e574cc5a4"
>=20
>  # Do not consider .z in x.y.z, as that is updated with every commit
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+)\.0"
> diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-
> support/vim/vim_9.2.bb
> similarity index 100%
> rename from meta/recipes-support/vim/vim_9.1.bb
> rename to meta/recipes-support/vim/vim_9.2.bb

