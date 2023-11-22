Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F071C27C40
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 22:59:33 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.40])
 by mx.groups.io with SMTP id smtpd.web11.62923.1700693964335652241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 14:59:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=UHu3DPLj;
 spf=pass (domain: siemens.com, ip: 40.107.14.40, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=joIDW8W+dxy/SXsd6vdtpkXVriiiyLJkilKlb8oyGbuBQIYbaNVHKrlju8KjPqnHnxlI+CHL8PyF1sQn3uk+mjSAXuyes86/TZLkBBukMgqsaeuen3ph4/Fb1NsCkw6eNg2dfQk+BP0CaGqmssZ7cmiXNGM4ckHFqMx0L13n7RxV9FqG02yBaOsQUMnSi5x/j4C01xovENtfa8Zp80eChR7xtsbjs42AHO8G4rhR839JdUQMr5rooP+FT2RWe2KgbasQhZ/PTK3vqJYI8PArFmnOlx1KtXZ5+T1ED0Go8rtfr6uzxJ8yQ4ezmPZnf2Beul+4QFzIhr25SN0TaGd6SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ds5yS8MMZmGm/010U1Z7lDHoWUTWvGWDKPh3F9s38VQ=;
 b=EgkoL32Hw6pVXIWDOVm7nb5MpLM3YSGPq1heuKLmOqO6z+217PAx1qJTEQ6hDB+ftpzZZoiID3VrmSjAzlSZcG9UZJRXX4qfSBO7GOEKr2Bse+xAoDBRVKgV+1Z1eTNZDzQRnyVbSYiSYQr4NOOEnl4N5elIgtYULpvFpIXMLAprHM3CUCOIL2h9u8HnK/u5a5YfotGNQAjh8FL+4yoCZ30q/NoaBNgPDa9QIZrJnTfgMoXV0HzIRJ/D55+kSbG86AJl98/nzYjohTp9901c+RvBmztyDViwQYeD7qmL+VujKkedctsLIWyVUC6QXQZKsESEqxO4H1onK1mmDhvDfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ds5yS8MMZmGm/010U1Z7lDHoWUTWvGWDKPh3F9s38VQ=;
 b=UHu3DPLjEtUAbDnbAh6w7G6JxImF8W1dBXzkTVbe1hl7FD+DE7YwgFLcWTKdImIKkGt+FLMD5ghHk11DRO2zXPChjg17j/vTVa7NVFMV8mB5FGWtC7I2DEi06jh6lzp8j/7Auh1wj9nEh//fYkXrakZ9A+TGN0m9yDGUlvmiM64o5s/ymCqjlnoqiSoEai9sOz4UH6vIDXiQlSo0+rie7DQpGTsv86SnmXuHffLBZm4Y3/rTRupCFS2i08uwngQB3l/KGErYV3w6rhiQvpJKkpBG01vaniWnxUPoQEg6Hs3yt9oR5W5k+1MJ0RXFi4sSQsu6F92ik0JuUe6js953Lw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAWPR10MB7391.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2ee::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 22:59:20 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::238a:d0f9:cdcb:d066]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::238a:d0f9:cdcb:d066%3]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 22:59:19 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] init-manager-mdev-busybox: Keep sysvinit distro
 feature on
Thread-Topic: [OE-core] [PATCH] init-manager-mdev-busybox: Keep sysvinit
 distro feature on
Thread-Index: AQHaHY/6OZepEla42EmREfbv6/rDq7CG8mKg
Date: Wed, 22 Nov 2023 22:59:18 +0000
Message-ID: 
 <AS1PR10MB5697BBD21B74897C9B766D73FDBAA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20231122220508.3148727-1-raj.khem@gmail.com>
In-Reply-To: <20231122220508.3148727-1-raj.khem@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=650027ab-3b56-41cc-9c8b-9e20a9a5218a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-11-22T22:53:48Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAWPR10MB7391:EE_
x-ms-office365-filtering-correlation-id: 48cb7e5b-88a5-4b93-7a9a-08dbebaea8a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 s57wHNQp6TYvX1BnBvZ9EW7LeOAbull0bMsqgwCfUJm/UUzQB4qtjGMqLnCYWpXHfV0eQ8NjRQYH+Bug6K14onQZQm3BE1o0dWLFlpxzxLJJfQpQu0c7CKuVNLE5GHHDzc0rr8rWPs3dwG3RKH0TaV9UMwOZSHjPbdmJXMJWVNgaP9Pk6exr499KX6k7ejNQFpxUu1THwo4lqpF1CLcLY3OCyH4R9veMl05B7kzVNNMBj8Bk0Z+IkG74VUWnD04IVpweF/4KupY9eHa0BmHIu8K/v54NWJaYQUh0nBiqhTZ7dwBvAsAXwzsJ8BUL9bwAHLyWAhu7Qo1j4z96v34BftLlxatYZt/5LKFJiLjRjTPUzKbLioRIL1lyjeClwTJB0AQn2aR9BZX3xt3xHt8wl5v1Ka05p4lmOW+PpOeyn6+5V9jav5VRGhJzcFESYvbpofoD8TBx97kSDl61j6H+kb6FUT36cOeRk3WVcnqXuPsRBZU9UfD7HYM1yTbonlZ6oDa7kon5KYM7S2ET/832uUbGkZyj0ctIbnDQVkZdnQ+DLybfYivLbIxz4vcfNtmaxHSM/9uALVIhfzcaw04TgkjGMPjt8afJ6ZXhIT5CUFk6Hy1aeCVsKaa29yEUIxEd
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(136003)(346002)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38100700002)(26005)(122000001)(83380400001)(55016003)(82960400001)(6506007)(55236004)(7696005)(71200400001)(478600001)(9686003)(64756008)(66446008)(66476007)(316002)(110136005)(66946007)(66556008)(76116006)(52536014)(8936002)(8676002)(86362001)(5660300002)(33656002)(2906002)(41300700001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ZKgn5Vc84L+azJP6lHEwIXdynzt3bvfqCvb6cXPpc6nfOHVcEyBqXSWpF4wV?=
 =?us-ascii?Q?75t6wpo9snRSrFjn4WMWzNVelMTCmrzAktDdxTV1jyjK7vEV/C++yNEl8NGk?=
 =?us-ascii?Q?5otCgRS0gv4tde1Y87eeX/J99UtT08+nxnItDJ9zpXNKR3TiTJ6FwGS8slRX?=
 =?us-ascii?Q?6ne4MZKJYcl0uDbVu3S+SOnYKUayUruZ+jbgKxA+lVBhIQNza12uKszgzbk1?=
 =?us-ascii?Q?b/E0rtzxVViU0NGnMLoXTG7FmN/HZOamGHNFw5CiW6EPbvkEDpjsHoZubtEn?=
 =?us-ascii?Q?buryC2F4aNo4ZpjWF6slKNDe/udPgvhBc/RvhfHi3V+8DpeUSWnG7kvcLNvP?=
 =?us-ascii?Q?c+hweL2SSMBhJcsyHulp0I3zWHvvXfFAuwOxhr4Uj4Jg+WWGtjMKcgUTBrHa?=
 =?us-ascii?Q?8WbXxMTurJ6npmL9MPwTZ3t7otk/SJO25IZvUm8VYE3WUiE8vAaOTLcFXov3?=
 =?us-ascii?Q?DoI42k4bp0b29S1940JikSmkjea+fOKBsbsX5S9l0r787UrzLupMzVBJ9RhL?=
 =?us-ascii?Q?HIzgtO9XQ+igt/b7Y/866DwrUf3wu8LYodHCbd6mYLF2nTR+iUd1+Z2hWvFF?=
 =?us-ascii?Q?FJNB8E8QPjDuAKgL/QkbAFW7nxCc8zRrfYU7c/Nx5doHQoLM5K262a+Erah4?=
 =?us-ascii?Q?1zjRWqjwChuzr0KaRDDOWkPZpLkZK03uuuyX62Lz+Lc1nmw21oe0Tef8yohe?=
 =?us-ascii?Q?ZQ5TWwEtipMQJPGTLlQgs0sSRREh0s95KP20zWZ21UdYW3IxvHZsbGeThRFW?=
 =?us-ascii?Q?EYL77QmuQMk6MDYBRjufxmmg4y4c42NFMoHzaP0LOPuFnzPfPSwYvTPjrXAU?=
 =?us-ascii?Q?5tZXbPhi5uud33zW7nQiScmVrf5Yr75q14zB7CSE891zGeL33j16Oc1q4Glw?=
 =?us-ascii?Q?id4EG4OESSFDWLanHBLHWk5uhvr9sKA0jvQOdIc5IarSKL3N50a/I8JkIN32?=
 =?us-ascii?Q?lXgGNySy+mh/ihU0SbkvSV3qj9KB6QPKKbdHpB7owARqS6LKzFIJAn5AyieQ?=
 =?us-ascii?Q?JJttbGzhDU2JUmmG3FDC1OHem4fizaSYztOHaeDoZauwQUlRXUgYQykdm5hL?=
 =?us-ascii?Q?eZvV4Mu78041YJai2Ye7JNUqfYmFjZKaGc14lEaic+rPuLqvwKq5OEYizcQJ?=
 =?us-ascii?Q?j0g/aROrmkUktM5xjSG43JK5iopZc7plv/A8le+/4jMM3LJ7mdfwqwIp3jCR?=
 =?us-ascii?Q?yhgzz6W+OdZaVlhSeKEZ6EF+4ZuxRCR29cmedZwve/43GqY/VNOwpRK8YfMP?=
 =?us-ascii?Q?vMET1pzQPJJ5d8zEE7B+Qzej+V3JjhB3SZQrzuB2Ef7ERdHi4K16nlSPMBfi?=
 =?us-ascii?Q?e2JJa3fs/VBZYzJi+VflZsav3/R9YIeh7Zypr4B+a21bYsQlQKwU0yVi2rYl?=
 =?us-ascii?Q?9uSaKZBqOSY0/anr01VSRJJazdDRTDHoG0GBO23/Ye9pP6hXbvYKbQvDWf/D?=
 =?us-ascii?Q?fXCumkKo1D+hI9yrDSSjTplF/MwoIEUxYHFvDvIkkTZ6vY2KHPuZNIhjmve+?=
 =?us-ascii?Q?+r9oFaY9xeiI1GxdSaanKmHtSVUtSYn7vyGQSklDA/nIA8onIIMzwsbOq7oS?=
 =?us-ascii?Q?Ssr/w4Ac19hlcHx5syXdMoI7UdUQaI/KcvPFRzhY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 48cb7e5b-88a5-4b93-7a9a-08dbebaea8a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 22:59:18.8855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPhgrat7U4yBhcAna7kyEHea7+rIhGZPMmGPb2TWkxaB1cPcnyc92mDbtHSCCkHuveiWpfo1TD1DLOZarJ/+nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7391
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 22:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191126

From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Khem Raj via lists.openembedded.org

> The rcS script that busybox-init provides is able to run scripts that
> are available as part of sysvinit, therefore its fine to keep sysvinit
> distro feature enabled so that we can build complex systems with
> busybox as init system.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/init-manager-mdev-busybox.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/init-manager-mdev-busybox.inc b/met=
a/conf/distro/include/init-manager-mdev-busybox.inc
> index 12091cba68c..a5a61bbe4d2 100644
> --- a/meta/conf/distro/include/init-manager-mdev-busybox.inc
> +++ b/meta/conf/distro/include/init-manager-mdev-busybox.inc
> @@ -1,5 +1,6 @@
>  # enable mdev/busybox for init
> -DISTRO_FEATURES_BACKFILL_CONSIDERED:append =3D " systemd sysvinit"
> +DISTRO_FEATURES:append =3D " sysvinit"

I don't think that this append is a good idea.
I want a small, lean, controllable init system, not a complex one.
This probably belongs to distro or to a new INIT_MANAGER type.

> +DISTRO_FEATURES_BACKFILL_CONSIDERED:append =3D " systemd"
>  VIRTUAL-RUNTIME_dev_manager ??=3D "busybox-mdev"
>  VIRTUAL-RUNTIME_init_manager ??=3D "busybox"
>  VIRTUAL-RUNTIME_initscripts ??=3D "initscripts"
> --=20
> 2.43.0


