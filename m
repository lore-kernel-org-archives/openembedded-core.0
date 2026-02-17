Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E958E909AC
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 14:23:07 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13130.1771338178008346571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 06:22:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=EdDSL4xb;
 spf=pass (domain: est.tech, ip: 40.107.159.50, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knVnwVCBt+K+8ntb4AHJ+/tMWOg+tSph66qUbn8UaY2sUIxOoP5MOPWHx8vjNGS4024+XfsjpkgJM6Phy2LEXCNwsQNI8DD6SpGROp/8GZwK5GSHkvhiB7rPHsGiO1CZI3cMyYnyjtpUP/TP8rsLPCIc/Lc0BhaoTKuc0luP16yd3eSVxGVm+F3XFfrXw+FsAGYng8eqqjuWZ1KD/cmti+NeXa9oFvj4yPJK17HBbDPKO1z10Yq/cwbk06Lr7tE5uug9eddEMrYzuud9C5El6Y97QwiKfejz26IsgXIQDcwGtAxDbEFgn9F6EtW0CwVBGwUwC1CxBy5tnStlh9qVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApoIGAYjU+MSs21RgmslKYpzXUj6XRR1ewJ2H9c5z0Y=;
 b=A8RIcfeL1kJMe6d4d/TNXGb9vp8RfWyvuyYSvhODd9HTdExJrpBGkCcRAwk2HasgQRKj7mjjkRuSuDSDdxXUIjhrf2W/3XDZF+0We4Bmf2m/39Rfug+h01jbL1C6w8u7LDhxDpwmQ/LDM5MwwwKhoC//hM7h/OCEV57tOlvlMRr0c49gwQJyqp1H6POusNY6jC+8hrqZLn10DHXBmrq9VRzoAG47TAKTyYSGkMePP39rvNj0/qiHSj0LxXSuXMAlRXjj+kvwoXyBTlA+/iX+rgm6uzW9X6AVI6A8VzuSSD+y+PobCPk35K2Fv2TFNNLon2Qk8sS66HacPw18kz7YUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApoIGAYjU+MSs21RgmslKYpzXUj6XRR1ewJ2H9c5z0Y=;
 b=EdDSL4xbjMxgczvgGWZD+kxlBYccyF12F9yolXnOvS5vgN1zNgdFNUuC11+SBZHDrvSz2gsaW0ldOAUaKeAEvJTxP81ojlK9QQGgDN/X6kNv9BdY6OrLKC9NHVyqWS4lgH4YvuItPCTxjq2Qv/Y++0Kn2w1vV7wHhst0jRaxAhV7lUksZ9ahYH40HqiIanQ8n4+9v+b+3/Lp7nFyOlqIGopeQF6u6sikboBudy5QMRRcJuLcav45svVZpRI0aPuxHprKI79uaPlfVHmQeSBCEm4AlnRWE7Z75UHQ7XZ8DdY3tGHqnwCPVQyChSErN9ahu39ZLscjPO/9OECTqZiduA==
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by AS8P189MB2069.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:50a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Tue, 17 Feb
 2026 14:22:53 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%3]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 14:22:53 +0000
From: Amaury Couderc <amaury.couderc@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] avahi: fixes CVE-2025-68468
Thread-Topic: [OE-core] [scarthgap][PATCH] avahi: fixes CVE-2025-68468
Thread-Index: AQHcjFRBG94s009+zkiaVFzeFtlDnrVycHGAgAgXm3aADI/HRg==
Date: Tue, 17 Feb 2026 14:22:53 +0000
Message-ID: 
 <AMBP189MB319653240811F4F1E57EC999F86DA@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
References: <20260123103715.32186-1-amaury.couderc@est.tech>
 <DG64E3A1Z773.2J4Y398TR4E3C@smile.fr>
 <AMBP189MB319623FF519A834A108CF3DDF865A@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AMBP189MB319623FF519A834A108CF3DDF865A@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
Accept-Language: en-SE, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBP189MB3196:EE_|AS8P189MB2069:EE_
x-ms-office365-filtering-correlation-id: 85a962d9-d7c7-4a61-d0d7-08de6e3009c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|13003099007|8096899003|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?z0K8AJXx4Gbj5w6dbV/9AoHqkkKR4mlvGM31rqd2Vtf1yciBgeAiHT0/JXoq?=
 =?us-ascii?Q?szdxSa7U7Iq5/3cCia+ezzQaa9sxPuWytkUQKTs2aVhiZAtWXoAqC6btmx3C?=
 =?us-ascii?Q?Q5XE6JEV+Z2bxubjlUoes435VigVicRwICYmWNLZV6fO3Cr/5LGBh9b3mQVo?=
 =?us-ascii?Q?FvuT7N5ZFC+gEG0BFxWeJ07AuM3UWHz3ZUykRJ2b2qRbE0mzXYldfoBefC9o?=
 =?us-ascii?Q?Duqzw9RzThm+BaXEojwIXQ/HDyruG9XZXsBcOHkyFLpqWz02Urwcf2A5H2M6?=
 =?us-ascii?Q?85fN+oGs6AcNA5t7wDD4QhhvgA8QGXHC4xU2vepWL6gzBmiYDdMhcSFFKi3U?=
 =?us-ascii?Q?oztH+EIbWZgaPWyEMDBO8SOnH9vwlHu17qiBZJJ4NJugHFz7l2wnQNqpd/7q?=
 =?us-ascii?Q?2QJi2vJsyOrFIJT9NbK3DBIu6xJItCm5SIGPe+/8QVDjQjtByWA+P543gc1B?=
 =?us-ascii?Q?pYi7eM8wxtIGoHZWyAybOfhrS40xTCQRiOAjDaZIpSBmh5msfNiT+JWeIejY?=
 =?us-ascii?Q?UIPf3eBgpOV9iNMfS/HvOIfGH+sTcB5FGBtf4F+Mj1A6vMVmi5OMydDwMLGc?=
 =?us-ascii?Q?Ht18P/TXJR0xUhZxhG0odZHfkeiWRqSBpg82NPpmgMVw4mrlTQaWJ1mu09Hw?=
 =?us-ascii?Q?9i6fOK4BwxnyLVWXyptFNAMrmbiNG3GUfTy0H+5tVm/jny3BOlWFqVZ62AxL?=
 =?us-ascii?Q?1rUxmJgyvj8pmku8gtqdKJVc58egCYQFpHjpGl1vQ0mmZaVu2bJPyZycIKzK?=
 =?us-ascii?Q?/QKlWAnyETmoe+RhLOyVy1b3ciDRU46robjGK1jF4RY3WIj/KgifOcPCJZR2?=
 =?us-ascii?Q?v9S7x1ekrvzj5mw8VPbQd5tREPkLBpB0/iCJpNzN6S4kGDA8fD0A2kjY0TDx?=
 =?us-ascii?Q?B96XbxxBF4l5ES8lKzDmbHBFZOnQjKAAHuOMxe3vwXBxuiKwV5tk6TAu6fo/?=
 =?us-ascii?Q?Oyg4pKfgxPWs5XrcBIsE6UA26NDXfWLnfEt1KpCL0x/+hUo58byD41H5Wj7F?=
 =?us-ascii?Q?XYsxrCwnsUBB/d66sRvTbDMmb+mScAF0KtvmtHbDGh2P1RkadKoIfndogzo3?=
 =?us-ascii?Q?ZHApoRYHsOcN/ft3C6RaS3wtkgG5lgwGafpXVehxiS5AmRKOXUBlWhVAfnro?=
 =?us-ascii?Q?y2Xo+2X9o4PlJU7K1ygvZRXUuo6jScGRk7FQ9DXOVUy9fBliCvB3tSZbuT59?=
 =?us-ascii?Q?aSgk86xO3bwsNMp691UCv+rfLwXanPTNOHG4A3HIVOH/J5v0a46YH1irSBLk?=
 =?us-ascii?Q?mKGhLt1nnHqpSaOtN2R0D6j7HlICqJs9xE2ZGt48oyxT8pFzbU3qrWUYvR3n?=
 =?us-ascii?Q?tUQVgeUbsd+Yq9StxLqSX35OzPZOc++N0SmdadLwUPDYef+LIE5JPddHPVxu?=
 =?us-ascii?Q?YsHqiKwyWFATkJluZ77zOzPqf5TMwO/YKG6B0SjFUES2OrJCf9tyzaS+E1AD?=
 =?us-ascii?Q?S10ubcukoqrmn+kFDmV+ElPKhQr5jpk6atQJbRwHZZZiPM8uPID0nyTEjImQ?=
 =?us-ascii?Q?EIpp258AfYi3A9S+bkCnnnSakhfO3KBcI4F1/pADuEhcP2xdK+hMlW6Dvp3p?=
 =?us-ascii?Q?eACSTzbHmd3wO1vlRlGf6sgni2R2pDDywYohjeP+?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(13003099007)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?reGX96tEbzrTasq5ZFEVhDuRBtIacDQOK08XRkXBydPu1PNacbh6D3vHlFCn?=
 =?us-ascii?Q?0oR3m4hl2krW3LkkqEagSkQlQ63twzknDgBbpEI2jPaz5jnE8getDLMCFlnx?=
 =?us-ascii?Q?/hr262kXoN6TEGx3YMgRrDj05P3dRnPYaePobs5nJCV0ctxiIgbvA0BCpoWx?=
 =?us-ascii?Q?BfRgyPDkrmft0pbSJ9OeBMQwsCEpQk/1iot5reGRPdU5nhfiVLPsVjYvFIw7?=
 =?us-ascii?Q?5rKoGXUov95zTf6Qx+ZkuSG6IUyRDHAgp5SDd/AtPd5yTyUJ5ulCRVwsz6XS?=
 =?us-ascii?Q?LwJgdkD+WOvB3NHn0TwUu42Q1E9JmOfcnSg5COr86F4EgFxZ93P5DbYH24be?=
 =?us-ascii?Q?X7Dsa83fKEgjeNOOKV8sexrjSHIbxJjNf03FcEyMUAXGYYgLGp2L/fn1R9lb?=
 =?us-ascii?Q?KQCjMk+mfapd4mUgxLAmv9+mfNHRphNHw30CR4K9TZm7zZiS86FxWDSMo3+f?=
 =?us-ascii?Q?+03h2tq0B3+KCUcz1mmgSHbrF753JmSmQ8Xr3aArCY4aWbe7njJSofGu7ZVd?=
 =?us-ascii?Q?NcLxCA7TqteA30vnZryrhlwXYbSO9cycuy/Beh4Siv6glTImp5RfDHHEs3We?=
 =?us-ascii?Q?yUKCCE9sTbAnejzKaY8dwmAANn/OBMBCEpaHBiSs+PMJ16BxloQdH/COA9nX?=
 =?us-ascii?Q?OaJ7tnpygs9s/4h6A8kgNJmXcsp2x3GbyP14SWqvz3T9mU/yJjkRgCefrxRR?=
 =?us-ascii?Q?q7LHYWwkujRtfaVj19ZNGi5YlZEfsbHXHEyABB1tRA30jUSiZVhYQ5PS0y61?=
 =?us-ascii?Q?AUu2BaFrOx05pksLs8OPN4Hvkm5AzUBjlZizqSb5qZgwxY3GDPj1qt4zvfKx?=
 =?us-ascii?Q?bcWnuv6Z+67Kh6n0kySf+3Egq3wQI6PIgt+n2A4OT7hmVC+zqxvtaPp8F5f4?=
 =?us-ascii?Q?I6Iu56dpNHXf0ix7ceLrVfSrGDpZcODAOAXZbOgxWZhRr8y0e8pVG2Raomi+?=
 =?us-ascii?Q?sIywJjXkCjP+pYUUfP3341aIxJ9VF4QkxArG+yXmik1IOEbqE7g2slTVu+Xb?=
 =?us-ascii?Q?B7OsXh7+sMy7DSfz86MUuATKJ9CsHBafFmCzgX6DBo23mAMMfoGvfivnhzAa?=
 =?us-ascii?Q?uWFmLFlUkAlYZrNIMUAXRc0Gl+LbIAteEKRqEzWEZDB3aRrYRII0KRDbBm6h?=
 =?us-ascii?Q?gWZYgq53CfjiH0DyJJ4bG5EcbhK8LRG03HE0mgo1w0k1jcnJmY816YuvWeYQ?=
 =?us-ascii?Q?QW//YgjnheT5LB8+tNcF5Zqk5Io3KE4KgfOln6hKM9UehgY6Zte9wwLJSIju?=
 =?us-ascii?Q?IT0tU9XrZ82wIYGYA6DJOhgKtBqP/ywptnY27s8gJ+0NNHxo0dI2wH+RJ1Ha?=
 =?us-ascii?Q?SRtPtx1L7PNETidNZozcRTMIbHaM6MyO2pHnx8ZjKry7xk4Ffc14SZXUFOZ8?=
 =?us-ascii?Q?p6nkcxMQ5iIV/sn6Gw8AOrIa9cBz7Oi9hMtXghUgsEr6UwdzxdVOpAhC02NR?=
 =?us-ascii?Q?PgEH4czShA0x1Z+48xuaCTdneoJOr0FwPkQRnNKDXdE6FNVPclyxbQ6Ur9Y4?=
 =?us-ascii?Q?HXWj8Z3UmApSRKfZfcA/szobJvjr7YWY6wdzYvXSrsPbdX3RW1oYZ8qhn+cx?=
 =?us-ascii?Q?i96cUjio8GabIDHWu/GlJk5FXurPsMqa8OogA/xl9b+YWp2y/NlDIdcifmQ9?=
 =?us-ascii?Q?qZxljBn03shQSb/wrIofitDMzo3qRChm8txsaCbKv3K+8yT23/+HUu/r7kDv?=
 =?us-ascii?Q?3Dy4iOCUtxTndla/9HCACj9io9RKaMLwjM730Z/m/NtyuCJa?=
Content-Type: multipart/alternative;
	boundary="_000_AMBP189MB319653240811F4F1E57EC999F86DAAMBP189MB3196EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a962d9-d7c7-4a61-d0d7-08de6e3009c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 14:22:53.4491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gKGJTcfXWhq96Jh9gBDqFy51VhxkZGazMa74P+WQLWqLYwscvkoiJjEcmoPNdzOHvyqgk7nMUnD9UZxnACUvNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 14:23:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231257

--_000_AMBP189MB319653240811F4F1E57EC999F86DAAMBP189MB3196EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Just a way-of-working question, I have sent the patches to the master and w=
hinlatter branches. Once these ones are accepted and implemented should I r=
esend the scarthgap patches?

Kind Regards,

Amaury
________________________________
From: Amaury Couderc <amaury.couderc@est.tech>
Sent: Monday, 9 February 2026 15:29
To: Yoann Congal <yoann.congal@smile.fr>; openembedded-core@lists.openembed=
ded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] avahi: fixes CVE-2025-68468

Hello,

Thanks for the heads-up, just sent the patches to master and whinlatter.

Kind Regards,

Amaury
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Wednesday, February 4, 2026 11:53 AM
To: Amaury Couderc <amaury.couderc@est.tech>; openembedded-core@lists.opene=
mbedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] avahi: fixes CVE-2025-68468

On Fri Jan 23, 2026 at 11:36 AM CET, Amaury Couderc via lists.openembedded.=
org wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> avahi: fix DoS bug by removing incorrect assertion
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ---
>  meta/recipes-connectivity/avahi/avahi_0.8.bb  |  2 +-
>  .../avahi/files/CVE-2025-68468.patch          | 32 +++++++++++++++++++
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68468.=
patch

Hello,

If I'm not mistaken, this patch does not have a master equivalent.
Please fix CVE-2025-68468 on master and whinlatter (by upgrade or patch)
and, then, request a backport scarthgap.

Regards,

>
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-=
connectivity/avahi/avahi_0.8.bb
> index ffda85c0e7..8f8f4a0d88 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
> @@ -37,6 +37,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-$=
{PV}.tar.gz \
>             file://CVE-2023-38473.patch \
>             file://CVE-2024-52616.patch \
>             file://CVE-2024-52615.patch \
> +           file://CVE-2025-68468.patch \
>             "
>
>  GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
> new file mode 100644
> index 0000000000..3635cc8d53
> --- /dev/null
> +++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
> @@ -0,0 +1,32 @@
> +From 483f83828cfda965fac914ff1b39c63c256372b2 Mon Sep 17 00:00:00 2001
> +From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
> +Date: Sun, 2 Mar 2025 18:06:24 +0100
> +Subject: [PATCH] core: fix DoS bug by removing incorrect assertion
> +
> +Closes https://github.com/avahi/avahi/issues/683
> +
> +CVE: CVE-2025-68468
> +
> +Upstream-Status: Backport
> +[https://github.com/avahi/avahi/commit/f66be13d7f31a3ef806d226bf8b672401=
79d309a]
> +
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +---
> + avahi-core/browse.c | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/avahi-core/browse.c b/avahi-core/browse.c
> +index 86e4432..79595fe 100644
> +--- a/avahi-core/browse.c
> ++++ b/avahi-core/browse.c
> +@@ -295,7 +295,6 @@ static void lookup_multicast_callback(
> +                 lookup_drop_cname(l, interface, protocol, 0, r);
> +             else {
> +                 /* It's a normal record, so let's call the user callbac=
k */
> +-                assert(avahi_key_equal(b->key, l->key));
> +
> +                 b->callback(b, interface, protocol, event, r, flags, b-=
>userdata);
> +             }
> +--
> +2.43.0
> +


--
Yoann Congal
Smile ECS


--_000_AMBP189MB319653240811F4F1E57EC999F86DAAMBP189MB3196EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hello,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Just a way-of-working question, I have sent the patches to the master and w=
hinlatter branches. Once these ones are accepted and implemented should I r=
esend the scarthgap patches?</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Kind Regards,</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Amaury</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Amaury Couderc &lt;am=
aury.couderc@est.tech&gt;<br>
<b>Sent:</b> Monday, 9 February 2026 15:29<br>
<b>To:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;; openembedded-core@li=
sts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap][PATCH] avahi: fixes CVE-2025-6846=
8</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Hello,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Thanks for the heads-up, just sent the patches to master and whinlatter.</d=
iv>
<div class=3D"x_elementToProof" id=3D"x_Signature">
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
Kind Regards,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
Amaury</div>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Yoann Congal &lt;yo=
ann.congal@smile.fr&gt;<br>
<b>Sent:</b> Wednesday, February 4, 2026 11:53 AM<br>
<b>To:</b> Amaury Couderc &lt;amaury.couderc@est.tech&gt;; openembedded-cor=
e@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<b=
r>
<b>Subject:</b> Re: [OE-core] [scarthgap][PATCH] avahi: fixes CVE-2025-6846=
8</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">On Fri Jan 23, 2026 at 11:36 AM CET, Amaury Coud=
erc via lists.openembedded.org wrote:<br>
&gt; From: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt;<br>
&gt; avahi: fix DoS bug by removing incorrect assertion<br>
&gt;<br>
&gt; Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-connectivity/avahi/avahi_0.8.bb&nbsp; |&nbsp; 2 +-<=
br>
&gt;&nbsp; .../avahi/files/CVE-2025-68468.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 32 +++++++++++++++++++<br>
&gt;&nbsp; 2 files changed, 33 insertions(+), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 meta/recipes-connectivity/avahi/files/CVE-202=
5-68468.patch<br>
<br>
Hello,<br>
<br>
If I'm not mistaken, this patch does not have a master equivalent.<br>
Please fix CVE-2025-68468 on master and whinlatter (by upgrade or patch)<br=
>
and, then, request a backport scarthgap.<br>
<br>
Regards,<br>
<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recip=
es-connectivity/avahi/avahi_0.8.bb<br>
&gt; index ffda85c0e7..8f8f4a0d88 100644<br>
&gt; --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb<br>
&gt; +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb<br>
&gt; @@ -37,6 +37,7 @@ SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/v${PV}=
/avahi-${PV}.tar.gz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2023-38473.patch">file://CVE-2023-38473.patch</a> \=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2024-52616.patch">file://CVE-2024-52616.patch</a> \=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2024-52615.patch">file://CVE-2024-52615.patch</a> \=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-68468.patch">file://CVE-2025-68468.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; GITHUB_BASE_URI =3D &quot;<a href=3D"https://github.com/avahi/av=
ahi/releases/">https://github.com/avahi/avahi/releases/</a>&quot;<br>
&gt; diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patc=
h b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..3635cc8d53<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch<br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +From 483f83828cfda965fac914ff1b39c63c256372b2 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Hugo Muis &lt;198191869+friendlyhugo@users.noreply.github.com&g=
t;<br>
&gt; +Date: Sun, 2 Mar 2025 18:06:24 +0100<br>
&gt; +Subject: [PATCH] core: fix DoS bug by removing incorrect assertion<br=
>
&gt; +<br>
&gt; +Closes <a href=3D"https://github.com/avahi/avahi/issues/683">https://=
github.com/avahi/avahi/issues/683</a><br>
&gt; +<br>
&gt; +CVE: CVE-2025-68468<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; +[<a href=3D"https://github.com/avahi/avahi/commit/f66be13d7f31a3ef806=
d226bf8b67240179d309a">https://github.com/avahi/avahi/commit/f66be13d7f31a3=
ef806d226bf8b67240179d309a</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt; +---<br>
&gt; + avahi-core/browse.c | 1 -<br>
&gt; + 1 file changed, 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/avahi-core/browse.c b/avahi-core/browse.c<br>
&gt; +index 86e4432..79595fe 100644<br>
&gt; +--- a/avahi-core/browse.c<br>
&gt; ++++ b/avahi-core/browse.c<br>
&gt; +@@ -295,7 +295,6 @@ static void lookup_multicast_callback(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; lookup_drop_cname(l, interface, protocol, 0, r)=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; /* It's a normal record, so let's call the user=
 callback */<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; assert(avahi_key_equal(b-&gt;key, l-&gt;key));<br>
&gt; + <br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; b-&gt;callback(b, interface, protocol, event, r=
, flags, b-&gt;userdata);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +-- <br>
&gt; +2.43.0<br>
&gt; +<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_AMBP189MB319653240811F4F1E57EC999F86DAAMBP189MB3196EURP_--

