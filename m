Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78247C001DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 23:33:33 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.76])
 by mx.groups.io with SMTP id smtpd.web10.20435.1689982406557853185
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 16:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=KUl/myE3;
 spf=pass (domain: welotec.com, ip: 40.107.20.76, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UyIetrEfFMMu1wChj7DFNaAg2PBU0+13W+e8jkn4FQ0cZUQd0mHO4TZxPuCWTF8VIqfupXN7rcEneWYMYTyav+mQ/e+pAFkzD6yQEb8M+gjz8VPWBtzYFewr8EnLU92u0C1g0rX2pmV4hCes4tCpwecUD6j9rMh7Nji/KHx/zwFfbXGX02r1YrmbrcQLj+QsYl/ZwwB7Wx1I/snXPYoi0v5/GdZpawG0PBrSJKTDe6KpScAwLcnj+F0Xoakgb2oe63uIpBGVEQuvoYsjR9/vM21oat0cRcG8LtsxJmDKcLLfYObdj/st0BrrWkTVNAsViDkeZUJ44x0YEX/afOubAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjsWrRnUJnQWhmAuJU/hYXAl0his3NKO2Li6feA26wk=;
 b=GtgCEeDjXLtPkY+dwi44r54e0Zmv+I+ASUChEXVM3GouxQ91MzCGC+zH93vB1JWmiofu/UmYezjHctPLotGVnR9owwcePTVSLaNbzkSSj34cg3DKtZ66ws3+dGcSG4Rd/xdv1msSBR6gd+5cAAHyFi4gphioSCneg/xx6PNgCeYA9px0Q67o956bywXGDlcVob6gyqmiAdkGPT/I1xlYBilspOuyniSgV3u29zMVejYNu4FF/zTiw9Hbv1EgEu368w4T+398YAgIcuBEQG+M3OkGotSxJ1bAu7MGQ0/abwpVJ2oWrTJBBMlzQynTZJXuD2ip7hd+P078kUcNaptrBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjsWrRnUJnQWhmAuJU/hYXAl0his3NKO2Li6feA26wk=;
 b=KUl/myE3YltaYFQP6kW/3ZzPVfdN/GhKmISuba1eKjQ58yj2buWu8hyTJfkQavDM72bIzKQ3+alzDnk0OGnscO8TldYGLCNaQOvxaxR+sa8wN0AfHNfwEaZqylbTbrmmmfLyENA87V+GjWY41OchynaEWv6gSc/ncYwTj9dZHTs=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by GVXPR04MB9927.eurprd04.prod.outlook.com (2603:10a6:150:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 23:33:20 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 23:33:02 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Thread-Topic: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Thread-Index: AQHZu8vv0VriTzoelE6+8icI0B6pl6/ExjEAgAAYcos=
Date: Fri, 21 Jul 2023 23:33:02 +0000
Message-ID: 
 <VI1PR04MB5373A2654B4B36C498CEC43B913FA@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230721120723.4006443-1-p.lobacz@welotec.com>
 <20230721220126165c5136@mail.local>
In-Reply-To: <20230721220126165c5136@mail.local>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|GVXPR04MB9927:EE_
x-ms-office365-filtering-correlation-id: 14c2532c-8cb2-43fa-4cb5-08db8a42d364
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GOBqY1Mdk91a5nrDykF9Z03T7+ggq1qHZISYNLyQcVuPVNhaADfx2zYTL34DpGyv1Xjsu9QCGbKHMKtaBPX/QoPSefUgj3P7U6gK+y4V4uCR/KFEe60mJPOT7/jVcoutQNxbBZzMiofs7kqlOCm7DZ1yfdclWaa01f3ekLwyNXIQCoz9Y0a7v+5/rz8h4wfL3npj1F3sjkJf/llP/78DI1p2Im8DvVVhHJary8fs+yoT16LIeWgLEQ8srDNYYs8PopYLX+DtlNBSG0J1iGKOhIG1HBJ7xqrD5UwPLYVnv26KktNGDfPkRpquDW+S9nrW3ANEfgRe3OokzQNbB01w1qOQSQjrdbSmuBrv2Q45G6H9IB1Ratv0ZeY3smsegejIeRiwhpklt6ddoSpHCh2r6t22CApmjpk7pmTb5Nm7JVh/5V6pzR8OPzIWiMXfCL0EVFZ/pfIJidjb7kJV5d6Gad/golNgQ/FwM4kelWwIOdNeqly5CbFdd1zSttyYFRTd/S+aZyC7oBeIVEbC4xKFHPOBWo8rdBTlj6Ffurt6NTiZVq7bkDMCurBL+64yN6uBN+iNIU5IM6MQh5IYPGJ82k6j+lHKUq7VPUW1SsAPpDU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(396003)(39840400004)(451199021)(5660300002)(8676002)(8936002)(19627405001)(41300700001)(52536014)(316002)(66899021)(2906002)(6916009)(64756008)(66556008)(66946007)(66476007)(66446008)(91956017)(76116006)(38070700005)(122000001)(6506007)(38100700002)(26005)(86362001)(166002)(55016003)(966005)(45080400002)(66574015)(83380400001)(4326008)(7696005)(33656002)(71200400001)(9686003)(478600001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?7R1stV4Qs6rq+ZqTFDlMazdeTTzY6mqvpGl3ofWhDP8KtGYClJZXISpuT6?=
 =?iso-8859-2?Q?wn7tAPKzHSYiWe+mszG9SPp6tlqwwlMTkKshqok4fNVhLL6IRFdsk8Jt6x?=
 =?iso-8859-2?Q?0mcMmAaEPahBO7UyQUWn9fquiqr9HA1n6OnBUWMZjdrVrCECpO6nJNEI0s?=
 =?iso-8859-2?Q?30JFwOZtZlOcMG4rxrw6vjCyCxy42Wj/o8jdRzRETTNaRmdfqmh9LBKYcR?=
 =?iso-8859-2?Q?Ym3Jig8XzLDqsPLkvq7r8EW44aJF0OzGSdjBHrrlQQapaBw0wNpkDlf/fG?=
 =?iso-8859-2?Q?22S8M9zszUCIbAcHBtMQqYbfXEKQkUsLV5RBHT+C1qMKbQ0ov7H+a6N9sD?=
 =?iso-8859-2?Q?wUfVvCytx6mnvkB/5bQGFAJwnmFyDKEgnNQeypfYaJHG/7WFsg7wMx6qS4?=
 =?iso-8859-2?Q?a15KVcJAzzjNmwyVSlJA19FhqTYYnWqee2EHfNgwxv0B/0W3qM1AogQ8Cf?=
 =?iso-8859-2?Q?Nj/+KNSfnSvD9Grim7+bSo+6AFFrLqd8Fh+c9gIvl5KTX+5W/bl24Gwn2g?=
 =?iso-8859-2?Q?UBI/2nMIBMWmG+tVBiuXW7eb7Srxes/SUnthYKOmh7lzbkX3kZ2omRISgS?=
 =?iso-8859-2?Q?IpiiMuNWj9m0SdAeoJ3OkkG+Bd1pprJxONOI0G9JswBC8dFcZT4O1ryGPm?=
 =?iso-8859-2?Q?JKJsgrrUwIKF+TCusGTeFh+WecLrUK4x9C2xTa0o4mqjM4L1QiGz82sM+C?=
 =?iso-8859-2?Q?MgC2ZL8N9kY+kpJ3Qr6O++9+9vYUaiXAzF6L2LuSKlov37Gct8fvuXm3o6?=
 =?iso-8859-2?Q?9oVYxUGwV7T8RhhEUitmwiOrjXNWBOBoX1xuPqE1sR8OkpkQaCNKSJWHO0?=
 =?iso-8859-2?Q?5NUFKOySNJL/7/OznWzaHS2+/pNXEzq5uEK2xbvfJ1dqSto2oHdBEIfJlP?=
 =?iso-8859-2?Q?oGDJALqZYmb5qH1YXDtmlOhfzh6eIO3CDg+Hnqn+CmdXl9KbsgDrFQCvCY?=
 =?iso-8859-2?Q?vwaTC5mw+ekjD5JT2n3DcfbpzAcPnDQWfTxMF/FMcsD843XvdJAIcRMvn4?=
 =?iso-8859-2?Q?mv+5RPONxJaezS1znu/loCnAj+amqy6WFfdrN9tIFIXJKVTrJrVwB8UyCJ?=
 =?iso-8859-2?Q?K7gfoqi6O4MUKtQSr98cSNgXCCgu6mtqD8oIvluaFGXTMYMRu3gcBhg9Sh?=
 =?iso-8859-2?Q?wNrrD+1moyjKJkpjO25/AYNCbeWkAnz7oBI1Z7bXSWEoJjCEpysq4DHEmp?=
 =?iso-8859-2?Q?kKoiinJXjbSqHF/D3H+G+mFZG3UKo/B5JIXccAgDslFA/MaLbh20d5Tc58?=
 =?iso-8859-2?Q?BOD427pb6hoIBAp/TxiDv4mdTp7B8KfBmcVob2YtS9s+c2r/zcuvlCUf5t?=
 =?iso-8859-2?Q?7wLzm05K9bYjPKPrG0r6F6dnA4x9oo8s7rrH9fMk+mqxlUCZML8a1c2pqZ?=
 =?iso-8859-2?Q?LjXEwZO0gsK7oZh/B88rM9uRGd9yESgaO9SQXNtqU6SCxdhWlTWv+lnrr3?=
 =?iso-8859-2?Q?Mm5yLXGpf9jrGoLTMCGdfzxwPuHadF7TqAwPVjPIxFRKt5/DpvshvNmP9p?=
 =?iso-8859-2?Q?H+VhjhKE3yRYBSbZVgYvVrki0znROIR2wI07RPaTY2rt7quTgb40+RcMaR?=
 =?iso-8859-2?Q?OFQ7+ILf9kIiKNbD4K3cNapnzBogjiVDXB0jDQhTLCKU05ljvsc533is86?=
 =?iso-8859-2?Q?QRKAmkOI58k70=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373A2654B4B36C498CEC43B913FAVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c2532c-8cb2-43fa-4cb5-08db8a42d364
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 23:33:02.1706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NHkaWSCrYVxOGr2Ui0iuMw0Z+hew+XO4x0Ef2Yl7yKMOzBV59xLqsp0FTntN7CiDLbvBBpOUct9Uw5CSPgtQdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9927
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 23:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184711

--_000_VI1PR04MB5373A2654B4B36C498CEC43B913FAVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Alexandre, Is it possible for you to create a docker file or some image etc=
. with all commands from autobuilder which will re-create the failure and p=
ass it to me?

Because can grope, find nothing and waste our time...

Cheers,
Piotr

________________________________
Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
Wys=B3ane: sobota, 22 lipca 2023 00:01
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass: add su=
pport for ACLs and xattr

I confirm this still fails on the autobuilders:

This is a-full:
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F83%2Fbuilds%2F5631&data=
=3D05%7C01%7Cp.lobacz%40welotec.com%7C308b241fa77c483b937808db8a360827%7C25=
111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255736894248112%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000%7C%7C%7C&sdata=3DYHOXoiEiIYhWMLP%2FvytWKdXpcSpTDfKzwf8MEyGzWQ0%3D&r=
eserved=3D0<https://autobuilder.yoctoproject.org/typhoon/#/builders/83/buil=
ds/5631>

On 21/07/2023 14:07:19+0200, Piotr =A3obacz wrote:
> Extend OPKGBUILDCMD variable, with additional parameters, depending
> on target distro features, in order to support ACLs and xattr.
>
> With fix pushed to the opkg-devel:
> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroup=
s.google.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&data=3D05%7C01%7Cp.lobacz%4=
0welotec.com%7C308b241fa77c483b937808db8a360827%7C25111a7f1d5a4c51a4ca7f8e4=
4011b39%7C0%7C0%7C638255736894248112%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=
=3DHhix8F4A6m9r0tFljzmTUXwQdBUPeV6X8g4c0Nm%2Favw%3D&reserved=3D0<https://gr=
oups.google.com/g/opkg-devel/c/dYNHrLjDwg8>
> opkg-build is able to create tar archives with ACLs and xattr.
>
> Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> ---
>  meta/classes-global/package_ipk.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-globa=
l/package_ipk.bbclass
> index b4b7bc9ac2..5e151be3cd 100644
> --- a/meta/classes-global/package_ipk.bbclass
> +++ b/meta/classes-global/package_ipk.bbclass
> @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.con=
f"
>  PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
>
>  # Program to be used to build opkg packages
> -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" "${@bb.utils.co=
ntains('DISTRO_FEATURES', 'acl', '-A', '', d)}" "${@bb.utils.contains('DIST=
RO_FEATURES', 'xattr', '-X', '', d)}"'
>
>  OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
>  OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMEN=
DATIONS") =3D=3D "1"]}"
> --
> 2.34.1
>

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184688): https://eur04.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fme=
ssage%2F184688&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C308b241fa77c483b93=
7808db8a360827%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255736894248=
112%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DZwVNo7xrr50em37GziHwBnWym4C%2Fi=
Pec1ds13X5vY1g%3D&reserved=3D0<https://lists.openembedded.org/g/openembedde=
d-core/message/184688>
> Mute This Topic: https://eur04.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.openembedded.org%2Fmt%2F100275318%2F3617179&data=3D05%7C0=
1%7Cp.lobacz%40welotec.com%7C308b241fa77c483b937808db8a360827%7C25111a7f1d5=
a4c51a4ca7f8e44011b39%7C0%7C0%7C638255736894248112%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7=
C%7C%7C&sdata=3D9xI%2FOyNZLgQHu3DxDlNrRlvGnw78R1r%2FMUDsMax2Ols%3D&reserved=
=3D0<https://lists.openembedded.org/mt/100275318/3617179>
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7C308b241fa77c483b937808db8a360827%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255736894248112%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&sdata=3DxsWva7UZC%2B%2BRVwZFqazqHnRFG2deHmovxTk%2BiamdwBs%3D&reser=
ved=3D0<https://lists.openembedded.org/g/openembedded-core/unsub> [alexandr=
e.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C308b241fa77c483b937808db8=
a360827%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255736894248112%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DqcJ5Tbo%2BeuKHZTpYlA5WJWQUekULrpnkHDmN=
nRAvEqo%3D&reserved=3D0<https://bootlin.com/>

--_000_VI1PR04MB5373A2654B4B36C498CEC43B913FAVI1PR04MB5373eurp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Alexandre, Is it possible for you to create a docker file or some image etc=
. with all commands from autobuilder which will re-create the failure and p=
ass it to me?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Because can grope, find nothing and waste our time...<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Cheers,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Piotr<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Alexandre Belloni &lt;a=
lexandre.belloni@bootlin.com&gt;<br>
<b>Wys=B3ane:</b> sobota, 22 lipca 2023 00:01<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass:=
 add support for ACLs and xattr</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">I confirm this still fails on the autobuilders:<br=
>
<br>
This is a-full:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/5631">https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F83%2Fbuilds%2F56=
31&amp;data=3D05%7C01%7Cp.lobacz%40welotec.com%7C308b241fa77c483b937808db8a=
360827%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255736894248112%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DYHOXoiEiIYhWMLP%2FvytWKdXpcSpTDfKzw=
f8MEyGzWQ0%3D&amp;reserved=3D0</a><br>
<br>
On 21/07/2023 14:07:19+0200, Piotr =A3obacz wrote:<br>
&gt; Extend OPKGBUILDCMD variable, with additional parameters, depending<br=
>
&gt; on target distro features, in order to support ACLs and xattr.<br>
&gt; <br>
&gt; With fix pushed to the opkg-devel:<br>
&gt; <a href=3D"https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8">https=
://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.googl=
e.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&amp;data=3D05%7C01%7Cp.lobacz%40we=
lotec.com%7C308b241fa77c483b937808db8a360827%7C25111a7f1d5a4c51a4ca7f8e4401=
1b39%7C0%7C0%7C638255736894248112%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DHhix8F4A6m9r0tFljzmTUXwQdBUPeV6X8g4c0Nm%2Favw%3D&amp;reserved=3D0</a><br=
>
&gt; opkg-build is able to create tar archives with ACLs and xattr.<br>
&gt; <br>
&gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/classes-global/package_ipk.bbclass | 2 +-<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-gl=
obal/package_ipk.bbclass<br>
&gt; index b4b7bc9ac2..5e151be3cd 100644<br>
&gt; --- a/meta/classes-global/package_ipk.bbclass<br>
&gt; +++ b/meta/classes-global/package_ipk.bbclass<br>
&gt; @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D &quot;${WORKDIR}/opkg-sdk-ta=
rget.conf&quot;<br>
&gt;&nbsp; PKGWRITEDIRIPK =3D &quot;${WORKDIR}/deploy-ipks&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; # Program to be used to build opkg packages<br>
&gt; -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS}&quot;'<b=
r>
&gt; +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS}&quot; &q=
uot;${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)}&quot; &quo=
t;${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}&quot;'<br>
&gt;&nbsp; <br>
&gt;&nbsp; OPKG_ARGS +=3D &quot;--force_postinstall --prefer-arch-to-versio=
n&quot;<br>
&gt;&nbsp; OPKG_ARGS +=3D &quot;${@['', '--no-install-recommends'][d.getVar=
(&quot;NO_RECOMMENDATIONS&quot;) =3D=3D &quot;1&quot;]}&quot;<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#184688): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/184688">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F184688&amp;data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7C308b241fa77c483b937808db8a360827%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255736894248112%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&amp;sdata=3DZwVNo7xrr50em37GziHwBnWym4C%2FiPec1ds13X5vY1g%3D&amp;r=
eserved=3D0</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10027531=
8/3617179">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F100275318%2F3617179&amp;data=3D05%7C01%7Cp.lobacz%40=
welotec.com%7C308b241fa77c483b937808db8a360827%7C25111a7f1d5a4c51a4ca7f8e44=
011b39%7C0%7C0%7C638255736894248112%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sda=
ta=3D9xI%2FOyNZLgQHu3DxDlNrRlvGnw78R1r%2FMUDsMax2Ols%3D&amp;reserved=3D0</a=
><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=3D05%7C01%7Cp.loba=
cz%40welotec.com%7C308b241fa77c483b937808db8a360827%7C25111a7f1d5a4c51a4ca7=
f8e44011b39%7C0%7C0%7C638255736894248112%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&am=
p;sdata=3DxsWva7UZC%2B%2BRVwZFqazqHnRFG2deHmovxTk%2BiamdwBs%3D&amp;reserved=
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
lotec.com%7C308b241fa77c483b937808db8a360827%7C25111a7f1d5a4c51a4ca7f8e4401=
1b39%7C0%7C0%7C638255736894248112%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DqcJ5Tbo%2BeuKHZTpYlA5WJWQUekULrpnkHDmNnRAvEqo%3D&amp;reserved=3D0</a><br=
>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB5373A2654B4B36C498CEC43B913FAVI1PR04MB5373eurp_--

