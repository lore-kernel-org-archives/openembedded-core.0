Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED662C0015E
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 11:07:38 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.53])
 by mx.groups.io with SMTP id smtpd.web11.4972.1689073649021835974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 04:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "windows-1250";
 spf=pass (domain: welotec.com, ip: 40.107.20.53, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UW5yiv+KrpeVqDOLoBoEwftCTf3r42342j4n+cYthOxz6RdmVUE5FKX5xx3fomooYrXhfOibkGW8cO39GHZF1/jrTSc8tvAS8WywoFbYtLCN2I5e9ueoXbToBv5GiPFYs2Q31Wu/8KcaNFf7Aaf/6GYx/z582BOF+pGhU+RG6QAZ5JSTJKgNFPoS+tV+u+tQWYaHuDRKBpouGonnQpZ9ltTmXbfcCNERNi0Rw86aUtF5jP9q9W8Wbe39iAWFNz0o13GWP1cloyMwt4ISxaOZ905fIFVNaI48RJ3rsaCaGiRhNNm3iwQDfiuq1k7pL89xJ+X6Ivk37f1kifk5hWulNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIsDrpAx547DWfWfMbKTTMmlIfIuquawYXEEbxvqM3A=;
 b=ikwPS4wCv39gtpMyqOvQo7JEeHbyJxqoO+WsRY7k91QUFdh5ec/P/cOwIPMX+dxyYDb2w6ytV2popoJCtE3CndI5Puo9IQwXG0OBPLB2pkR5qhesNFMkQ1gdsgqa1tKVYEjNwBUB6AvR5+/FvSpRMtUu7h3Ufg5fxvYppHGPUVCOYpBDx1QHQ5ZhB3pofWgbdWLiPHZbCbX4sIHBPV3nov4+zoGGjmvYmRlmO5FPXtVRcYfYPkvWmz+eyB4tZOVoer4KZEjFuU0XjVLf8t6I72bZMTJbq+mgeK1QgJSom/C1TPljaeRwIdo9RtxCUPwtslmNFUK9xJ6Sk4bdpV9GsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIsDrpAx547DWfWfMbKTTMmlIfIuquawYXEEbxvqM3A=;
 b=d4BuRvadnuS8B58vC1ML/DcD76M/aN11dYtCx/wWFMD92K/2LUjLEQrvSTZSaNVUTtgBgqlk1Tqo24zaXrsvtwYiaMNB5TGj2JjPJ277Fwij1MZHmqswbYLsUCUteamAFnM+3GY6QL6i9JKsQvBqYVLdoqNZZssy6K5miNsjADI=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7533.eurprd04.prod.outlook.com (2603:10a6:102:f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 11:07:25 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 11:07:23 +0000
From: =?windows-1250?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZsxUxLTW0Sb4E3Uu/U3gcvSoAYK+y5quAgAGB4cY=
Date: Tue, 11 Jul 2023 11:07:23 +0000
Message-ID: 
 <VI1PR04MB53739E01C427B6EE1D35961A9131A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230710095800.2033309-1-p.lobacz@welotec.com>
 <7CE572D5-CA4B-4B29-B727-BB22D8E4D931@arm.com>
In-Reply-To: <7CE572D5-CA4B-4B29-B727-BB22D8E4D931@arm.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|PA4PR04MB7533:EE_
x-ms-office365-filtering-correlation-id: 425b907a-a0b6-46fc-fe59-08db81ff00f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IlKb/pk3e77ZB8fyooR+gvdh5TYfbsO2BL77VwYlEPVdCiDDPQ3vtZzwy3W74zdoyHkcpcXvDP6OssBvHZ6/gE+4AuKfFpkMHfN1up1VeK8SIjhnIZYF9llB6IaRYVirYZmWJzZbmMntY9mu8oC5YEiEGBWwMi03rS5xcLGbS162RTXs4I/TqGRvzQQ+uy6ToHSr5PWHOi6tRkHMlq1IVeG0g5rh+0fGSiLEizc9pDx/5FJxkblneC/zxCYYG4ayCZq8Ockw4r9D17pvJj+FeelAh26K0hMvmyOfA3iK/XoQiqi3ggt/lBw/0G8E8/mrpP7fYzuKSoxCI/rs2x8YW1LSK11oqiV40xNbfSu47drPKhTVFMDlLuSugBp2q53/Ccp5Dd22oD+HfTXdZm06tBD75kYj0T9njXroa/V4wV97rdOPfYJSWSx0+sKJ7a9sFlZ6pGrvH8BsFbf1J6req+H6a7dCZrjWFT4EKiBoSBRyEJFV9flXgo7HLnHB/CDPw8tLNzMDiZoZJ2dspcj2RI1kb0vyD1MXcd97Q+AIXrF2Xw9r2pg44Ump1IeOGsENzVthZ59t70Y49lbfhFBZD10vN4EpqZtNenfDOO1kxoc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39840400004)(346002)(136003)(366004)(376002)(451199021)(86362001)(38100700002)(38070700005)(66899021)(52536014)(33656002)(71200400001)(7696005)(76116006)(91956017)(166002)(122000001)(55016003)(9686003)(186003)(6506007)(966005)(53546011)(5660300002)(66556008)(2906002)(316002)(66946007)(8936002)(45080400002)(66476007)(8676002)(66574015)(64756008)(66446008)(83380400001)(4326008)(6916009)(478600001)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1250?Q?+RIW2L9tiUCpD47DHMM0WItOa8hszuAUDRRVe/CnKZrARhP6dyNgdHIn?=
 =?windows-1250?Q?vgtAtWKvNe9eTDXfwp7cuvwf6OOmdrrTB2pi5LrWP0Z7yo7I2D+sMnrJ?=
 =?windows-1250?Q?j7rwcT2SQxmNpsr4VB7Gfm6cVhIr0ziPxGbqyG/q9AK7WJ/aPlhJpzZy?=
 =?windows-1250?Q?PQA1WQNEHZBlqdbTks5uehhQRHD9ahE8LTyRxMEl65M93dA57HDnW0zb?=
 =?windows-1250?Q?3O63FlqXJY5ebfC5eTK0lZEz9sCWaVtArt87ikan4eRu2y7FUo4U8LDP?=
 =?windows-1250?Q?Dsgr45tjMpXSsMxPCn2Vax1y5HdyAR8ALU7vKXf427fnAIHA2R+OiHhm?=
 =?windows-1250?Q?t3SFVDfivSItGm5q8nmQ636600WJAwlB8NJXDhRp7TsasG/s2g5aHTtm?=
 =?windows-1250?Q?OpKX35EjNEdb43w5Hx9oAg2gzdBatbAB8f/7d+IPBAIPgcYFYdolultd?=
 =?windows-1250?Q?JIHEFPnviqYpH0WTedPPBBoG3ukLSUD2T93yZiO+JFC4D7m9t2It1EKV?=
 =?windows-1250?Q?lqdGNWk8rmakQLc7JVpsg/S9gjNcKJmaP8XiYlMRBZzoxPNDBl0pUQcd?=
 =?windows-1250?Q?AgkA5mZkN2YAiWPIupOH4bcve6fjCvwv7vKhbRcw8i/o+BdkP2bgmYw0?=
 =?windows-1250?Q?zLVBOIaNFg8NlHFib0O4Zes8lz5BM+re7piEXSJhlbsU7HWM8TxjoLGb?=
 =?windows-1250?Q?EzOi/HdmAjgci4KpBhf70ftgZwzLPJEqVo8nioYY5l6yYCEpTIZ1ZzGt?=
 =?windows-1250?Q?A1Z7LdAvYkU80gr1GsGMtCNNoCGjFDEvs1yEpzmM6zNrPsgRNEVubPjJ?=
 =?windows-1250?Q?H1ZlB0hY4RfFoZ0em72QiJ8pxYiW8tRvKaZdh+pC/pNqSVR8muJUGiVS?=
 =?windows-1250?Q?ZYGOaiWI33UYFNJj69azs1Iehh04DGVSOyXmJtYyies7t77nD1qFissf?=
 =?windows-1250?Q?la+CiQiGghsKKo1tMztcBk+n/vAslh96AkEtsplMTfczzVVNnbBLcrGb?=
 =?windows-1250?Q?pU/W9LalI0R1oOJ7Fyod2Mr5hsSvHcX4laxVamCS9OOFQ/aCXr/Oilfk?=
 =?windows-1250?Q?AhgK2obyYZOtwzsR0ELpHO9VLkYJcSC+7s0AciiNsYF63jqf8v2txmLq?=
 =?windows-1250?Q?ii0vLiNZyRE413Wz8GCBKoahY8esWjTqYIX+SUneZ5pytK0XRHKMiKst?=
 =?windows-1250?Q?DJGcyNnKDyCy+dpQTxrubEIDFtjYufolIO5/jSkuzQBLiyPvUoeGbG1E?=
 =?windows-1250?Q?g7mm/z+wKam3L/YRd7MhtQR/RRdwJqljrRbhH7BEjd9EJwisE7KSYDhy?=
 =?windows-1250?Q?dccjjxCqYEavjirlx60Li60XHatr6nEnamBIBCWljKtbjTowl9eGMbXZ?=
 =?windows-1250?Q?5W2M+7Kmp3DB3BSKbHf1xol6mObJnCeWGnqpLNrZgStolh3oFlGfqRFB?=
 =?windows-1250?Q?0k3wn15Bu/lgGdy1uVURq8kITGkRP5+E/bF+useX7M1sh7M9fFq4ftKM?=
 =?windows-1250?Q?9NdfQJRKPWsK1SFs36yj9aZOCDA8gDmK9aSC4cxSFqGBZlm4QxDgppNV?=
 =?windows-1250?Q?SLtv4Hw1rk83j8yjLthI7cpdINfoaZVDuuZnFHvUhIqTfZlIbh9QhlfB?=
 =?windows-1250?Q?naLttBuUpiSoKFvxF16eoFoUXuxFKJwAC0HdvvEHUF2cRJSHK9MsiFiZ?=
 =?windows-1250?Q?aeOt7pkOKzZkVohXtuwu7V5GIvw1cfcr9c4nNgwmZLWn7uAwYmiawd5s?=
 =?windows-1250?Q?Prjbf2srJAhnnU1Qie2oxYHS4JJmss9s2UIucqcJ5GtHYnhns6d228o6?=
 =?windows-1250?Q?MSKK1A=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB53739E01C427B6EE1D35961A9131AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425b907a-a0b6-46fc-fe59-08db81ff00f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2023 11:07:23.5775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1n1SCpXvlTGGlNHKMiyndO8JnJF+Nta1HapbPieIA9RPWu4Lb1j39iYAVm0tULLZDIiAv5HVLqNcmJ//R5vLxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7533
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 11:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184128

--_000_VI1PR04MB53739E01C427B6EE1D35961A9131AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

Hi Ross,
Alex has written that he will take care of it today, but ofcourse I can add=
itionally apply paches in oe-core layer as well today evening.

Regarding additional tests we need to apply them ASAP.

BR
Piotr
________________________________
Od: Ross Burton <Ross.Burton@arm.com>
Wys=B3ane: Monday, July 10, 2023 2:02:37 PM
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro nati=
ve features support

Hi Piotr,

This is a great patchset, thanks for chasing all the loose ends.

Until the patches for opkg have landed we can apply them to our recipes, so=
 feel free to send a patch to the opkg/opkg-utils recipes to do that.

Also some form of test would be essential.  Something along the lines of ad=
ding to an image a test recipe which has both ACLs and arbitrary xattrs set=
, and then boot the image and verify that the attrs actually exist.

Although I guess you could just build an ext4 of the image and then use deb=
ug2fs to probe it.  That would be a little more complex to write, but doesn=
=92t mean booting the image.

Ross

> On 10 Jul 2023, at 10:57, Piotr =A3obacz via lists.openembedded.org <p.lo=
bacz=3Dwelotec.com@lists.openembedded.org> wrote:
>
> Include support for ACLs and extended file attributes for native
> builds, depending on which distro target features has been turned
> on.
>
> Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> ---
> meta/conf/bitbake.conf | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9625a6fef4..da01e9b66f 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
>
> # Native distro features (will always be used for -native, even if they
> # are not enabled for target)
> -DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
> +DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 ${@bb.utils.filter('DISTRO_FEATURE=
S', 'acl xattr', d)}"
> DISTRO_FEATURES_NATIVESDK ?=3D "x11"
>
> # Normally target distro features will not be applied to native builds:
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184063): https://eur04.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fme=
ssage%2F184063&data=3D05%7C01%7Cp.lobacz%40welotec.com%7Cac1be1ea95524118ab=
5d08db813d9725%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638245873753484=
720%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DjtcQryE1wD6%2BpF4edaxZEP3YOr%2F=
LcaFuR4%2Bt9xvfMek%3D&reserved=3D0<https://lists.openembedded.org/g/openemb=
edded-core/message/184063>
> Mute This Topic: https://eur04.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.openembedded.org%2Fmt%2F100054733%2F6875888&data=3D05%7C0=
1%7Cp.lobacz%40welotec.com%7Cac1be1ea95524118ab5d08db813d9725%7C25111a7f1d5=
a4c51a4ca7f8e44011b39%7C0%7C0%7C638245873753484720%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7=
C%7C%7C&sdata=3DHS5OslF4It9P5Uj04GLdM%2FvdVGxqCT96Hv0%2F9Mic4BI%3D&reserved=
=3D0<https://lists.openembedded.org/mt/100054733/6875888>
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7Cac1be1ea95524118ab5d08db813d9725%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638245873753484720%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&sdata=3DsHpcO%2BPtu2dsAtPk9p0lQuU0PoIIG%2FW9bMbIMu9y%2Fw4%3D&reser=
ved=3D0<https://lists.openembedded.org/g/openembedded-core/unsub> [ross.bur=
ton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_VI1PR04MB53739E01C427B6EE1D35961A9131AVI1PR04MB5373eurp_
Content-Type: text/html; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
250">
</head>
<body>
<div dir=3D"ltr">
<div></div>
<div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">Hi Ross,</div>
<div dir=3D"ltr">Alex has written that he will take care of it today, but o=
fcourse I can additionally apply paches in oe-core layer as well today even=
ing.</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">Regarding additional tests we need to apply them ASAP.</di=
v>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">BR</div>
<div dir=3D"ltr">Piotr</div>
</div>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"ltr"></div>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Ross Burton &lt;Ross.Bu=
rton@arm.com&gt;<br>
<b>Wys=B3ane:</b> Monday, July 10, 2023 2:02:37 PM<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr dist=
ro native features support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Piotr,<br>
<br>
This is a great patchset, thanks for chasing all the loose ends.<br>
<br>
Until the patches for opkg have landed we can apply them to our recipes, so=
 feel free to send a patch to the opkg/opkg-utils recipes to do that.<br>
<br>
Also some form of test would be essential.&nbsp; Something along the lines =
of adding to an image a test recipe which has both ACLs and arbitrary xattr=
s set, and then boot the image and verify that the attrs actually exist.<br=
>
<br>
Although I guess you could just build an ext4 of the image and then use deb=
ug2fs to probe it.&nbsp; That would be a little more complex to write, but =
doesn=92t mean booting the image.<br>
<br>
Ross<br>
<br>
&gt; On 10 Jul 2023, at 10:57, Piotr =A3obacz via lists.openembedded.org &l=
t;p.lobacz=3Dwelotec.com@lists.openembedded.org&gt; wrote:<br>
&gt; <br>
&gt; Include support for ACLs and extended file attributes for native<br>
&gt; builds, depending on which distro target features has been turned<br>
&gt; on.<br>
&gt; <br>
&gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; ---<br>
&gt; meta/conf/bitbake.conf | 2 +-<br>
&gt; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 9625a6fef4..da01e9b66f 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D &quot;${EXTRA_IMAGE_FEATURES}&=
quot;<br>
&gt; <br>
&gt; # Native distro features (will always be used for -native, even if the=
y<br>
&gt; # are not enabled for target)<br>
&gt; -DISTRO_FEATURES_NATIVE ?=3D &quot;x11 ipv6 xattr&quot;<br>
&gt; +DISTRO_FEATURES_NATIVE ?=3D &quot;x11 ipv6 ${@bb.utils.filter('DISTRO=
_FEATURES', 'acl xattr', d)}&quot;<br>
&gt; DISTRO_FEATURES_NATIVESDK ?=3D &quot;x11&quot;<br>
&gt; <br>
&gt; # Normally target distro features will not be applied to native builds=
:<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#184063): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/184063">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F184063&amp;data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7Cac1be1ea95524118ab5d08db813d9725%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638245873753484720%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&amp;sdata=3DjtcQryE1wD6%2BpF4edaxZEP3YOr%2FLcaFuR4%2Bt9xvfMek%3D&a=
mp;reserved=3D0</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10005473=
3/6875888">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F100054733%2F6875888&amp;data=3D05%7C01%7Cp.lobacz%40=
welotec.com%7Cac1be1ea95524118ab5d08db813d9725%7C25111a7f1d5a4c51a4ca7f8e44=
011b39%7C0%7C0%7C638245873753484720%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sda=
ta=3DHS5OslF4It9P5Uj04GLdM%2FvdVGxqCT96Hv0%2F9Mic4BI%3D&amp;reserved=3D0</a=
><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=3D05%7C01%7Cp.loba=
cz%40welotec.com%7Cac1be1ea95524118ab5d08db813d9725%7C25111a7f1d5a4c51a4ca7=
f8e44011b39%7C0%7C0%7C638245873753484720%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&am=
p;sdata=3DsHpcO%2BPtu2dsAtPk9p0lQuU0PoIIG%2FW9bMbIMu9y%2Fw4%3D&amp;reserved=
=3D0</a>
 [ross.burton@arm.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB53739E01C427B6EE1D35961A9131AVI1PR04MB5373eurp_--

