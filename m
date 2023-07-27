Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28194C04A6A
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 15:30:51 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.81])
 by mx.groups.io with SMTP id smtpd.web11.10520.1690471840825005051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 08:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=lOGAn2Aa;
 spf=pass (domain: welotec.com, ip: 40.107.20.81, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ke+b5cQ0xoFvq1HByduOdi7/WYxg7yx+7eWOZbhhZF68uk5kkaIwOcboxXss6J4QhhBBYHp8mmnS5ihX+7ywWTOchdToerarsK4e3Fqi7BQq72E7Rol/9/DLQKnyNBvUy9h0pfDD6NvUwJMINEfLL5wkX1a1ElkdS4tfQb/YaBfsburbFppcZdxbdlqNvvG1jCpYSVqOO1+hLr/X24P+xes9es7OVg6YDRuug8716Hw9e5tDGerGT0dC7PAQAXYIWCAeQ6kIBpPWZBuAskAR7Me4cfLeE77IFrFyebDgwqiBmN8WgY4d7dv3Cvfv7HBzEtTrgSmO94n3mwTy1mfQlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAC0nw4qZQx7auRHdXblQPUQgcGPwDAPsxF73uIdvVI=;
 b=NzdpDWLxJddNy3ju1nGccrfCW9W0ygnCekSQ9QT3fbspI0UnFOboNHI8ZZQstXHGtq3z3q1l9yUGicZ1McM7WGmd6Dv29Phfev5+IP/x1jgWII/+EwAOqVq/ccVCzAFDXlDC1dbowkbq6tzgGpNJS+Fs5FtI4FWfa1utkNAHGMMfE3O8deWfyY05Lzxve7F2EwhA+Sj0UH6YnHakDyxbSwG5mbIucmc0B6HCKpxhjW+G7Vr9fsZ++0GN2oImho4AYhLcKeSNuJa9ILuGf80jfHJ4v63Fi5vLp6TZs6rb2HyeJqeMh0xai9NYG4cOMRCzlPIm929AkPvLaaZlPGThIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAC0nw4qZQx7auRHdXblQPUQgcGPwDAPsxF73uIdvVI=;
 b=lOGAn2AaiCPBvsbrEhd/1babZVQ6gqdG0KCDFGI3U55pdnq9siOx3yM4iUD8wwcZl3jntkG7wYuS01UORLwgVbP1s6JXhp0i5AymBvGMUbGcaUTDbLMLIityTrqLMHWbzB7nemQa25QfwELzqFz5s8MHdheXaau33IClWIHXOzI=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 15:30:38 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 15:30:37 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alex Stewart
	<alex.stewart@ni.com>
Subject: ODP: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Topic: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Index: AQHZv6K3lu9AQllKHU6ArcdlQLIROa/Lxl5FgAHkvwCAABOggA==
Date: Thu, 27 Jul 2023 15:30:37 +0000
Message-ID: 
 <VI1PR04MB5373D430B10D288F4186A3BE9101A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230726092228.1005306-1-p.lobacz@welotec.com>
 <VI1PR04MB5373AD2BB745671859678D699100A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <20230727141809d2150cbd@mail.local>
In-Reply-To: <20230727141809d2150cbd@mail.local>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|DBBPR04MB7883:EE_
x-ms-office365-filtering-correlation-id: ad7bf7b6-ddaa-4705-75b9-08db8eb66daa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dQfMyKeShHQBJZPfLT1qT4xGqg0VKAmfDEbX4Oerlsx/tiVmCgIDC1J2UVuGvpN8RigUgGWFGzXsDnO265QJFdZju/I1WT05QwR2g/gHbeYhwqo1MudCO0+DvTBYg2+hAVMqjublAErTZzGALtRg0VXI4KEiIhz85Tt1SMtgN0JMSJBN4cSy1HUmoWH18ehyD1S/qDBIpreG2Wkqn8Rq8Iv4mKdjhhed+097u14N3iLjKzpB+Jpls5cmfOt2T1FUqructozCfdPGWrXyERF5BeVRXdfQs4J42F+9yMCUFLDDukKkfShpgQhg5a5yDBgqwugT1/i+gNFaWy04fVKFImID0+CMulDnClZPFv3apjeoODwjPJP3aLjOf/UscnOfp/Q6waG5bGSR57kCwKXKPaNZHw0GzrywMrETvshsfXFkVMTVqTgczj33cVzfRhy7OqZ7XwReRevpYYx4X0WI9u8SF+5Fr2ZhL05s4NJgH2Qf8HoLS1KiQcBgr/M3pBXfcH8QvkD1QtEYQDn2vfgZcRUwioVgcFX01Iki6iQ23WBCKyP3e4CtXZGtJBCfPtlVddLtY5U4sXg6Hn0lTnpWG27nHL+GW596CWBmcPIiDXY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39840400004)(376002)(396003)(136003)(451199021)(52536014)(5660300002)(66946007)(4326008)(66476007)(91956017)(76116006)(66556008)(66446008)(6916009)(55016003)(64756008)(316002)(2906002)(8676002)(8936002)(41300700001)(45080400002)(478600001)(54906003)(66899021)(71200400001)(7696005)(9686003)(966005)(6506007)(26005)(66574015)(186003)(122000001)(83380400001)(33656002)(38070700005)(86362001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?qnpDtZWiAOsqv+tK6bjM1H/P35sPYIqCQMjFbViCbJ3F4bRaTXWP7VBNa1?=
 =?iso-8859-2?Q?yf/gWWYPvqcPL7aggyHP2R4mZ1bubkIpwp5/mQ510wbCKc1sHadIGIUeaP?=
 =?iso-8859-2?Q?/R62j17fXTTp4hpHxh3+wAkAYqTjTKh3eEHO445/ZA1BRMv5cc0F6KE81k?=
 =?iso-8859-2?Q?hRZiznQyO+e7+3z9JnR9vYL2raenCueaGQwGkSo7c+Ke3sTBuYyVJQThUF?=
 =?iso-8859-2?Q?g39zTGPu49p7uoGdB86eMc72otgAIX4G7664CfJwH7V0PkvtLPECUUQIYI?=
 =?iso-8859-2?Q?egWezzholiDs39BEg2GcbCibZt77gB3ZwxX6h+i8qSK/HLnG8hXUtonyML?=
 =?iso-8859-2?Q?Th9N/8CZ0sQC+68l20EyboTJ1RS+rKOA93TtoyrH8ei+vjYygC4McREnTZ?=
 =?iso-8859-2?Q?T14Vk3z9akY15IceXnQuGunO/b8tjH1KWXMSzwxmSiBluX3wxug5rZ+NMi?=
 =?iso-8859-2?Q?Wu1gCdpVMMajE5TinEK+xW19X6TK3dgLkmlhHTUNaaUH9B0ccYz39sfI5l?=
 =?iso-8859-2?Q?D3VtpKpfJ1/oIXQ1OijLC+WRjvbnuev7TiX6AJMmc6jtmICGU7AhuSTNYa?=
 =?iso-8859-2?Q?iti7EfBsN3CgdXd7XjFUUDwgVCOC5tdZQYPPS3Q3X6Zu+7pTVfXMc5VWjm?=
 =?iso-8859-2?Q?O7iHu/11G7NbgH4ArGPOB3mGqGbkrh2MmtLWsli7vPceN1G9Hj2AitA85q?=
 =?iso-8859-2?Q?wuJNfn+wgteNau4omf0H3M9/EyXtZWDE2qLLCUhuZd37GJg3CwWJJ4aNWJ?=
 =?iso-8859-2?Q?x4fPylPepVsUosXZRwqw8ChbNeK6GUpV3r7VXnjOS0T4E0Zl6g5goQN09N?=
 =?iso-8859-2?Q?mdt2sC0k9IyrUaSqGB+3p6rTG2mWteeKDDeLGMeu+2oWJYOQyDXo+mG8gp?=
 =?iso-8859-2?Q?L3HtLtSI3aOIRadWtgZ4uOC7OIn5XUhKe1v4e+b16SJyqDlPFLHObI95cu?=
 =?iso-8859-2?Q?FNF8mr/OdA7L7UNpVKCFk4CTMpZD9pM4yiTf7QVLEGS4gvG3xL7UvwLVwX?=
 =?iso-8859-2?Q?gsN8OtlNWCvyKF/E/gqaYtbShpf/aGB/zLo0VrxDEj2xjJxY2FAu12J4MQ?=
 =?iso-8859-2?Q?Pi69E9pvgxsAJGiXOwmFcc8Zbbej8t3CqjOYLTMvaDpFGnoY0wTxC2RuT7?=
 =?iso-8859-2?Q?vImsRRSIh+Ind66dIZHLWBSeKhpHUUAqyJquPiLKXRpCu5s+UQ3d9RriKI?=
 =?iso-8859-2?Q?DBFxurK9/LftXxCZAlgE/Cp3uz2UgVKi8LSEFjeAWfAxAupE2L6vOnvJ5U?=
 =?iso-8859-2?Q?ybATU9gA3gNjlGBeIUpFtXxttXiqMbYHghbiTK8H+dbNbMLFB2GN17I/e5?=
 =?iso-8859-2?Q?L/rizbnUMDHLKDedWjXmNj3cWq+SN29skz//v0mV/bbEni/xJbKwyzLrQz?=
 =?iso-8859-2?Q?heQRwmEjIYEyiI3dVZNwYOiQH8AfFZE3NfLfjhlO/ETQfYnQe4s3+Zwy9J?=
 =?iso-8859-2?Q?KfibmW30Uyy8QcABFHFSpfjoiF4aUjSCaUB6tkKKgi7Pk2vIQKtQkNkPbW?=
 =?iso-8859-2?Q?/yfMOXXAd+0BMa9bJjVgaS23zEi5OvMD6fnsMYhLegAWfzoMRKMG54Ux4Q?=
 =?iso-8859-2?Q?WeE7DLGW7EZ8xsZG56TgQeZd550lFcithT1+Uog0dLRIntjH1wIIYdWn8D?=
 =?iso-8859-2?Q?O5hTQ1MBa0pIY=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7bf7b6-ddaa-4705-75b9-08db8eb66daa
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 15:30:37.7598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: clF6bvu4td4vHDxzk1eQngXO/cQPUvPnHkPalBoXFhvPgeRHdKIbA6Q/pG6T9NYjxP9wvciqPTtlDdH+nkIv7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7883
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 15:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184963

Hi Alexandre,

> Hello,
>
> I sent this to the autobuilders and I got the same reproducibility
> failure as earlier:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3263/s=
teps/13/logs/stdio>data=3D05%7C01%7Cp.lobacz%40welotec.com%7C8fb759c0e1ab49=
b0c69408db8eac5547%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C63826064303=
8719160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DC6mYlLwOmYosyl1ZIS8vKQf2ail=
FqMqBXeamF%2FnSE7E%3D&reserved=3D0
>
> I'm not sure why you wouldn't see those.

Nor do I. I'm running it once again on our remote CI server, maybe I missed=
 something. I'll answer you when I will know something more.

BR
Piotr

On 26/07/2023 09:27:53+0000, Piotr =A3obacz wrote:
>
> Hi Alexandre, Alex,
> Thx for supporting me, I have finally discovered the issue regarding this=
 packages differences.
> It occurred that I was badly comparing two strings for tarformat comparis=
on. Now it is fixed and should finally work.
>
> This has been additionally tested with oe-selftest -r reproducible.
>
> BR
> Piotr
>
> Od: Piotr =A3obacz <p.lobacz@welotec.com>
> Wys=B3ane: =B6roda, 26 lipca 2023 11:22
> Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> DW: Piotr =A3obacz <p.lobacz@welotec.com>
> Temat: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add sup=
port for ACLs and xattr
>
> Extend OPKGBUILDCMD variable, with additional parameters, depending
> on target distro features, in order to support ACLs and xattr.
>
> With fix pushed to the opkg-devel:
> https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
> opkg-build is able to create tar archives with ACLs and xattr.
>
> Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> ---
>  meta/classes-global/package_ipk.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-globa=
l/package_ipk.bbclass
> index b4b7bc9ac2..a0f106e4ad 100644
> --- a/meta/classes-global/package_ipk.bbclass
> +++ b/meta/classes-global/package_ipk.bbclass
> @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.con=
f"
>  PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
>
>  # Program to be used to build opkg packages
> -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.con=
tains('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_=
FEATURES', 'xattr', '-X', '', d)}'
>
>  OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
>  OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMEN=
DATIONS") =3D=3D "1"]}"
> --
> 2.34.1

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184875): https://lists.openembedded.org/g/openembedde=
d-core/message/184875
> Mute This Topic: https://lists.openembedded.org/mt/100367408/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com/

