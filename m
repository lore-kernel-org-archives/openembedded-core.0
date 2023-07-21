Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10806EB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 09:31:49 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.64])
 by mx.groups.io with SMTP id smtpd.web11.3666.1689931902936548340
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 02:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=OJAIQUAt;
 spf=pass (domain: welotec.com, ip: 40.107.21.64, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBPxHuupat9P8n1XJdjXfyalwNtI2bZHdI0flAvgfxj6IJ/PYgCGl/Fqkk5U+Y3PZL0S+HK0WvP+GBWOdpefiiuhrjWumk7pcWZENVLcTpukwDv8/IgK3Tg78b/FBoTpR+eGXjQ7gZhzENkTkbqBHut/86OyMwnGW8y3Rdo+35HNZ8K8PArb3Zl+GRpBF3F8ZSdDJ7MMLWAqFV2mGXFHpNHhbegdTCQx+CRhOYBAA4Q9MO8cLIG9Sr/hReER49ZWFxjrDEq7hVuyRgCZFqjPEgIx8Toz4TrfZItPthTBulzuQl37BhSDbIqv/IdrDvBuDQvGNLhpeq3nS7cDd/GD4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vf97cYfAwmrGuY+I7bPf8FAwclpABFIAK9A/l06YX2U=;
 b=cAG6dFDFOqHgFKdedygKVQlY9AC+jwoxUs60GhhntvYf88uICKCSNZ/dTjP6S4yYEwFQPdOG97DiCd3hTv3OVEgVECDLDmrklhWO7panq6j5rNNodPi+e7m5htX7guWQVjAMekFfw46jFIzFu06RN8OjfZtY7tGXG6pAnBs0nq0y+tzmzSsZtWBQ/ZMN60Cryl+M/X5suIvaSwoYJKbPGmuY8Sij1Es/KrTfQ1I7kklwFpgS0gGUVkGi0DhXmb22hl53aHeqak9lk8e+0pYTVRatt087Y/BZoR1SmWJz0wCYKd64+oI5bxHmwPRMyPWsyHo1S8neymn7nTVXoPSeCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vf97cYfAwmrGuY+I7bPf8FAwclpABFIAK9A/l06YX2U=;
 b=OJAIQUAtHc5fwa3Py162LD15GuG3d5dtG577P5eBmjlpDLLLFbT4qVt4Gxdky2ZdNNXL5Ufd9mlQ5nXeE4GZrbVBrw7L7e4Y2lzQ5xytO0K1WEP9DYolcj1TReb3lflXuuo7KnfKYdaStbuYK+LcLB1MlKgkufictMk4Fdp9Kng=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by VI1PR04MB6847.eurprd04.prod.outlook.com (2603:10a6:803:134::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 09:31:37 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 09:31:37 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZunoNTkOY0WCPRUi2xV/KPhZ5b6/D9yMAgAAAId4=
Date: Fri, 21 Jul 2023 09:31:37 +0000
Message-ID: 
 <VI1PR04MB537312AFE8C40C9A0D879D6E913FA@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230719194843.330741-1-p.lobacz@welotec.com>
 <202307210930548e9d76ad@mail.local>
In-Reply-To: <202307210930548e9d76ad@mail.local>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|VI1PR04MB6847:EE_
x-ms-office365-filtering-correlation-id: d6e5027c-0ba9-4085-229d-08db89cd4815
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5KkPTeZbS6FSY0CWNuckFONaKZi9s9DEARrmO3Bo8IgbdVXCDl2uv++gAkBf/TFMmbgwVcMRwXvDts8hZ1xJ8gZS4hbk6rHhlr4hKTbqOH3IyP8Wfu5CAf76J/7oVq6B1Z8+NsnLUEjq1y/oEjMGeVNT/tn5+hk9tnbzPwTDtLgmiP5ZWLLxwOaQMGk4ALUQgFJRL8mjisYZnBo5KEWaFaH6tHcwD/ZHjqqlJ3yEiEXstqCIMhp37MQiYoHX/zuoAwm1gZo/kKgvmjrIlJ+q+/efgmil/bkeN6bDglQTyI0F/l17C6JDG0bQCxYJPes+vmcJoXQbTHioqxNbSkKn2eP91SeXTu0yjsyHuZs2QSjJa7elc4sx/iSMRMhs3hf5eHF80si7g1qgi4q+whkqfyS29+MT8bisJbcG3U0zm1Mms1QVdHy/qWRn0QbFP3p/ab/ntob7ESgGxbv9d/68PpCEX7hRpHhY/IUPDHba7BFr67bN/rnRPbmDMgFiH75e4uJD6qrCqD/JGzLwa4UHRIebuRcXnmwo5ME1mHDmA718aGZTlILYyWRnJZbqeR+TF8S7zj2+SbGR+PahlT9N5mAQmMPwVM8eru82Rxfzicw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39830400003)(136003)(366004)(451199021)(2906002)(83380400001)(66899021)(66574015)(166002)(38070700005)(33656002)(86362001)(122000001)(38100700002)(55016003)(4326008)(6916009)(71200400001)(66476007)(66556008)(64756008)(66946007)(66446008)(76116006)(186003)(6506007)(41300700001)(316002)(45080400002)(478600001)(9686003)(7696005)(966005)(8936002)(8676002)(52536014)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?RESQwKTrnl92oaGth3ANHuHubqz/ZANZXmp9/pWpydJKPPmN12Io4pnV5u?=
 =?iso-8859-2?Q?MFbGoGtB/ooN4xtQDsu5XvuS0otiFNLrhg6ihXQ8pDG93ddE3sS+IPQ5kM?=
 =?iso-8859-2?Q?bOu7BVpI+nZ3L09oNmsRHubeKmU6KWQ/39faeGNvyHMXOgfGV5y+7kX1Cp?=
 =?iso-8859-2?Q?unvG4T7Rltaefx5nF1f/2CBQU1hPlt0gunj+LP90/h9r2L+lMWSowIeZT8?=
 =?iso-8859-2?Q?ojGgMDsQZvIR/hkDB6v44SUws5fvVoOvJTR8/9lhAuJECg0v4LaWELvwlI?=
 =?iso-8859-2?Q?hqxvvhlmuEPGSGpaaV9SP1jW4XTvTpHkxaBR9HVFcN2kEwSRCECSq8Po8i?=
 =?iso-8859-2?Q?Jz4iJrY4T9Gqa8rPTywliYrSb8EgeEut4HsTSUbKOp783BmXSJnbfnV04P?=
 =?iso-8859-2?Q?NGOSJy7wlh/sU0LkkQpELMBgEHad8DqFFfp+czNNT9Bwv+AEsq9/fJ2hgC?=
 =?iso-8859-2?Q?7XLd2JlXz+BNQww7+iA282/K3A7FVVJAHbpgDVM7Z4gf63L3+ESiRSepio?=
 =?iso-8859-2?Q?gyVuEcEylD30T+NWIWqIvhJDWMpPNT4Eqd01onG9RZohSKMoG3jIgPTHWs?=
 =?iso-8859-2?Q?42oEPcIwKcU3EexcjT+ZeAlwe6LUZQ3CcSPKBZMovGIYuBY9+z9A4lDyB/?=
 =?iso-8859-2?Q?wAIB93/cfm6uaJbfwKZiDQzH0t9UzmnjD/ek6smINcnNAOV0bidnAFA1UN?=
 =?iso-8859-2?Q?aKKFqZpM+chK8ZcqVh6WaD6LV4DC5ju0JCFXirlf+XDyAHYoUGRMl7Pe5j?=
 =?iso-8859-2?Q?mEMXiIlHfkVa0uJzMwYoE6vt7RI1aUyV5aoYweQ8GP53aPOGwpLuAuwNFG?=
 =?iso-8859-2?Q?d9e23DEvfBHU0BmhKnZ8PrQ65K+hPs4gfdYXAvQLazxiL6UxtbWno8v1nh?=
 =?iso-8859-2?Q?rGj2Zh5e0o4xQFEPcElLPzgh90MXW5JB+sDHiHkoc1m/JeU+XiRP2XPVfH?=
 =?iso-8859-2?Q?LrKo7x3NNfJMpdqoomePPbRpFP4cR7ivBZ3uBqQ006qKDoyyW5ZianDXfl?=
 =?iso-8859-2?Q?DMfYbqDLwXAC/0v5HtmgLsS/sys6XtEMIOY8lYXVxSfWrH+RpJpP1AYMHU?=
 =?iso-8859-2?Q?Ig5vvU9ItYPbU7otNMJnAkZ3meYt2UZdR660KXOTz1LjDDmR/cG8RjlaE2?=
 =?iso-8859-2?Q?njhYNtoScV3d6mp+m9xWX4Bq7xP5RKDd/tB2ru250svwAiF86TLIWMMtfD?=
 =?iso-8859-2?Q?RHi4vbqNCm1HxFaGYlCM6VIdHZBKG4uvv7rJ9GxFXNDMdOD5lpg6uf++Ie?=
 =?iso-8859-2?Q?ezvd87HrxCWsyv1zt0t7ZwlMNFCcbxzc4PXB6RdChN04TvI43HlhPWM/sP?=
 =?iso-8859-2?Q?N7awXnv0jY1WDOHAS4FO/R+K+WLY3p6eOgzEY8/uxEbAQnJadJGLuoo+7x?=
 =?iso-8859-2?Q?F456dLkGJQFGX2QyMtIrcJ/XUEONN6NNWBqlcA+MRybBlVqgZI7EwXjBT2?=
 =?iso-8859-2?Q?5E9by4W+QrrxXiNRG+vJfSVGOx8zsJhWHKZgn2oamMa7PATEPRmbn/Fijk?=
 =?iso-8859-2?Q?BH6rqSxCc4aWGSPT1KcKhIuYpH2SOYVCECBMiYfuCTthRC0HFjwjl6rafk?=
 =?iso-8859-2?Q?uQ1c8OrzifiqIz4hyBB72vSGkhTMKQdgeE4AlfgkA26gwTGIWvWwSbyZDA?=
 =?iso-8859-2?Q?aeCRLGO/8WuYBokxIuLCVhOnJgoRGehJrzjqpPtWfgRa+r9CVmuVxh2Oot?=
 =?iso-8859-2?Q?fSnDjsPdc0EpgQxR5mo1yXvvLKSvJ+mCosoS/Tu6bVTMTmUyRbxM4Pct3z?=
 =?iso-8859-2?Q?5JKw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB537312AFE8C40C9A0D879D6E913FAVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e5027c-0ba9-4085-229d-08db89cd4815
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 09:31:37.3684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T1vIqbF3w6PYeMip4+kRAr11lMMZBjJRy/4vdXVvQwQ1OtdM5cEDQSB8Fss0ksgbQhN448dIl+LjY8UHosYs6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6847
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 09:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184680

--_000_VI1PR04MB537312AFE8C40C9A0D879D6E913FAVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Yes but within an hour?

Wysy=B3ane z aplikacji Outlook dla systemu iOS<https://aka.ms/o0ukef>
________________________________
Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
Wys=B3ane: Friday, July 21, 2023 11:30:54 AM
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr distro n=
ative features support

Hello,

I want to give this a shot again, can you rebase on top of my
master-next branch ?

On 19/07/2023 21:48:38+0200, Piotr =A3obacz wrote:
> Include support for ACLs and extended file attributes for native
> builds, by default.
>
> Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9625a6fef4..8daaaad615 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
>
>  # Native distro features (will always be used for -native, even if they
>  # are not enabled for target)
> -DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
> +DISTRO_FEATURES_NATIVE ?=3D "acl x11 ipv6 xattr"
>  DISTRO_FEATURES_NATIVESDK ?=3D "x11"
>
>  # Normally target distro features will not be applied to native builds:
> --
> 2.34.1
>

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184594): https://eur04.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fme=
ssage%2F184594&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C2fcf33853c84429feb=
0708db89cd2f44%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255286582324=
080%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DkO5OdTvJioWknqyOXCNCl7XSWakUifU=
Dy4WaYY5bAvQ%3D&reserved=3D0<https://lists.openembedded.org/g/openembedded-=
core/message/184594>
> Mute This Topic: https://eur04.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.openembedded.org%2Fmt%2F100242732%2F3617179&data=3D05%7C0=
1%7Cp.lobacz%40welotec.com%7C2fcf33853c84429feb0708db89cd2f44%7C25111a7f1d5=
a4c51a4ca7f8e44011b39%7C0%7C0%7C638255286582480321%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7=
C%7C%7C&sdata=3DGvd2cpN5IQl4n9wmMbeiRimg2HvSO5y%2FIAFOAzhAUNA%3D&reserved=
=3D0<https://lists.openembedded.org/mt/100242732/3617179>
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7C2fcf33853c84429feb0708db89cd2f44%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255286582480321%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&sdata=3DtW2TIMGHV%2BUlX7%2BaVFeHaZvuyIBXhLXcbSTsk1kqLPU%3D&reserve=
d=3D0<https://lists.openembedded.org/g/openembedded-core/unsub> [alexandre.=
belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C2fcf33853c84429feb0708db8=
9cd2f44%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255286582480321%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DVzoZv0Pjtc0D2%2FwMEi32VYkRde7xvWr4b5hH=
MopFJN0%3D&reserved=3D0<https://bootlin.com/>

--_000_VI1PR04MB537312AFE8C40C9A0D879D6E913FAVI1PR04MB5373eurp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
</head>
<body>
<div>
<div>
<div dir=3D"ltr">Yes but within an hour?</div>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div><br>
</div>
Wysy=B3ane z aplikacji <a href=3D"https://aka.ms/o0ukef">Outlook dla system=
u iOS</a></div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Alexandre Belloni &lt;a=
lexandre.belloni@bootlin.com&gt;<br>
<b>Wys=B3ane:</b> Friday, July 21, 2023 11:30:54 AM<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr d=
istro native features support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hello,<br>
<br>
I want to give this a shot again, can you rebase on top of my<br>
master-next branch ?<br>
<br>
On 19/07/2023 21:48:38+0200, Piotr =A3obacz wrote:<br>
&gt; Include support for ACLs and extended file attributes for native<br>
&gt; builds, by default.<br>
&gt; <br>
&gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/conf/bitbake.conf | 2 +-<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 9625a6fef4..8daaaad615 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D &quot;${EXTRA_IMAGE_FEATURES}&=
quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; # Native distro features (will always be used for -native, even =
if they<br>
&gt;&nbsp; # are not enabled for target)<br>
&gt; -DISTRO_FEATURES_NATIVE ?=3D &quot;x11 ipv6 xattr&quot;<br>
&gt; +DISTRO_FEATURES_NATIVE ?=3D &quot;acl x11 ipv6 xattr&quot;<br>
&gt;&nbsp; DISTRO_FEATURES_NATIVESDK ?=3D &quot;x11&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; # Normally target distro features will not be applied to native =
builds:<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#184594): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/184594">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F184594&amp;data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7C2fcf33853c84429feb0708db89cd2f44%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255286582324080%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&amp;sdata=3DkO5OdTvJioWknqyOXCNCl7XSWakUifUDy4WaYY5bAvQ%3D&amp;res=
erved=3D0</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10024273=
2/3617179">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F100242732%2F3617179&amp;data=3D05%7C01%7Cp.lobacz%40=
welotec.com%7C2fcf33853c84429feb0708db89cd2f44%7C25111a7f1d5a4c51a4ca7f8e44=
011b39%7C0%7C0%7C638255286582480321%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sda=
ta=3DGvd2cpN5IQl4n9wmMbeiRimg2HvSO5y%2FIAFOAzhAUNA%3D&amp;reserved=3D0</a><=
br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=3D05%7C01%7Cp.loba=
cz%40welotec.com%7C2fcf33853c84429feb0708db89cd2f44%7C25111a7f1d5a4c51a4ca7=
f8e44011b39%7C0%7C0%7C638255286582480321%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&am=
p;sdata=3DtW2TIMGHV%2BUlX7%2BaVFeHaZvuyIBXhLXcbSTsk1kqLPU%3D&amp;reserved=
=3D0</a>
 [alexandre.belloni@bootlin.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com/">https://eur04.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C01%7Cp.lobacz%40we=
lotec.com%7C2fcf33853c84429feb0708db89cd2f44%7C25111a7f1d5a4c51a4ca7f8e4401=
1b39%7C0%7C0%7C638255286582480321%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DVzoZv0Pjtc0D2%2FwMEi32VYkRde7xvWr4b5hHMopFJN0%3D&amp;reserved=3D0</a><br=
>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB537312AFE8C40C9A0D879D6E913FAVI1PR04MB5373eurp_--

