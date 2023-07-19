Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC90EB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 15:12:57 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.83])
 by mx.groups.io with SMTP id smtpd.web11.16426.1689779575815491251
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 08:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: welotec.com, ip: 40.107.8.83, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1cL+whCUpINeCfqkIf6Exw00QQ/RUbFuJESyUl0wsxe7SWHe2FbuH5uFZkB0UfBt31jZKGLWojU6CmZcRmhSYK+QUBNG6ZbvGy9t0f+zKGsN2iEdr+2vOHZHIFBgadl2FoZtHEBdaXnpmONObm/fLkJplvPasGG/bMFa3wyBPAnUpTzNTAGPTIm3zEvSnDWX6umX72E0BeigD+myV8d89y+c9gcFZoA9WLqtM992ipRzEpmNYNykL6KPxIbiUamCH3X4VcFAMuWjDBHfcvBqw0c40XDDTBcBu0tXOJKzT7FfUfTYLF2iDwtxfUEW5xn8iQXSPCInovGlkC0LcqZ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UokNq3piYTLnV4Ki2ucDHFuVoVxx59oIL9bI2k8lf8M=;
 b=NyVmxjP8TaoWNZs5aXH5AOqKS45m3AfuFPRg4s+xxPZXMDEg4k8k3XDoA697QTPZHLX+sp04Yp66jE2YUZr3QCd1vNfb6FprhtcTACrpps1QYCFrKVy9dVJVjRxt5K1LsnuvNIAcQBmDloT+yE5vk5s48nk9Pxbp7FE1dT2rsouEUtBRJ+IxIUV4e5rOMrgAFhHNlLkHxASo7aTifCtZ01KjUC/0A/rlf6d3tF1QBBv54c1mA2SUNIi/gakRd3MYMADDiSX+G3r7o3VSLM/vSHG9duw9Qxjhhac6oZbMO41/ZArGnOlRdnz1DE8sWCw8uQ1jJUeuWQFI5pHYzS5lDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UokNq3piYTLnV4Ki2ucDHFuVoVxx59oIL9bI2k8lf8M=;
 b=LoKWZbNG1OMU3E/6zVZf1ym88apqgUIDvFO9rAuguavF6Lmd8OcOseAr32IvVx3biZeQxKheBiib3eB+p1WgpiO+3gZUYjZE42tZeoPWZk1Ihnxd9OatS3uJGWJcGX8dmQSluj9lPfn4kYvxoqDuHzcbwoWWQwQ0lpE56vWSnDw=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB8671.eurprd04.prod.outlook.com (2603:10a6:102:21e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 15:12:50 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 15:12:50 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: Alex Stewart <alex.stewart@ni.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZuhYbulVWq1EszUGWkGRpKDQme6/AxGYAgAAAV4qAAG10Wg==
Date: Wed, 19 Jul 2023 15:12:50 +0000
Message-ID: 
 <VI1PR04MB5373D06A6341C404CE10609F9139A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230712190428.379909-1-p.lobacz@welotec.com>
	 <0cce368f-36b7-672e-df83-94b4914a1344@ni.com>
	 <VI1PR04MB5373A7CF0029527D7AA884689134A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <20230716213857fea03b3e@mail.local>
	 <17728F63D7D8F798.22245@lists.openembedded.org>
	 <177297AC200D092D.22245@lists.openembedded.org>
	 <VI1PR04MB53737C43B2CDDBFB197010359138A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <202307182105150310803d@mail.local>
	 <VI1PR04MB53735A682AA5C026FC6EFC3B9138A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <354d702419dd053b96cee5cc64c2f923833fa749.camel@linuxfoundation.org>
 <177348532E0CFE35.28078@lists.openembedded.org>
In-Reply-To: <177348532E0CFE35.28078@lists.openembedded.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|PAXPR04MB8671:EE_
x-ms-office365-filtering-correlation-id: c4aeab1d-3ae8-4a00-ae8c-08db886a9e1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 75RohfRxz4YbMHyDkMQHVG9qg4FDlpid484RD3MmJr5Hc68tlWhURkzj7EMNW9AAWjcw2+Oqpe1W2DybqMIImNZMu6Py2pP9hR0LqeW9A9vWpgqEIT4BF9fb8y9w1PdP6gztAMFcTNPyokpVgX3gqh8/huORoJz8pKgHsJVJ2Ikc2Kwt52de1+g9TGsUdlMkyL+UmtRJptmPbWVlx3byWXID/6NKuCnvQgiLkS9+qXDYMxpcAzTKtQitSZ42uOYpv70vJdUC/v/HWfb4dAr9vZC8Owx3xuKB9bW22K+M6o/I1di8XMy64f1vHousBJ8lqODFRAAStAT7TA8XuZ/vbZCSmecrDIs1BQKQiGaZ8VbhXZ9tciqnkcwohPUMT7P+xe2gE/47hHdEpJfDGy3W3zG/w8CZvQsBoJVeJyXPKc7jp8qkkPj990wuHFoJA7YtkATYav3l8pychjbk7OOx5dSn3Vyedt5aOuLU4etAm5FyX0Wl5YEMsikMAapmO34jPWLyQ1TE8OSBwEM0y2R7RDUp5hPoOZFEpORy+Q3jbkUHrdRf4RECe2QOyfP3PCPW8sPXNE322ergAXNrFme+ggj2MuTUOMEnRPslh5gM8nA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39840400004)(136003)(396003)(376002)(366004)(451199021)(478600001)(45080400002)(83380400001)(66574015)(186003)(26005)(6506007)(9686003)(966005)(55016003)(8936002)(33656002)(41300700001)(8676002)(4326008)(86362001)(5660300002)(2906002)(30864003)(316002)(7696005)(71200400001)(166002)(122000001)(66556008)(91956017)(38100700002)(54906003)(110136005)(66946007)(52536014)(66446008)(66476007)(76116006)(38070700005)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?/VOans7EDf2NyTODdq/Sm/Ulvr6plmGBewKiwzPV+2N+flQPCxCorWx7bd?=
 =?iso-8859-2?Q?8rzjVZrsmEUAZrEDNZPPsauGe+RQMfICOI5I6wQraxK6zjIWLkuRfS+hd8?=
 =?iso-8859-2?Q?XPcz3MuAtsW9jeeMQrgIwZtQivZTKiK+9Zz+9LcANCORGv+JSvOtUL8K+h?=
 =?iso-8859-2?Q?TOKTM8VCGW5wDywevDtrJN3Zl1ucJHneprBCSOLJzNpPSGDSY2E7lY10/S?=
 =?iso-8859-2?Q?RIKvmpJ4bFk6a0n5HdqMf7SDU7BzjF0zLI39oUZR/guksFjoZjGb1lWGaf?=
 =?iso-8859-2?Q?kBPzDQUMFyaA0S+HtWqxqXIhOdgpEBEygnO5p0CvvWS0eR31oMGbGnBBN6?=
 =?iso-8859-2?Q?lgdLoalwMKIQsBH66EPZxHl9EIEvOECcITh1HLSxSukNDTOZDial3GeKCi?=
 =?iso-8859-2?Q?zH8/4/mHHIj39X2hGl8MIJQ4EvPuZBA+75YpqBLuDteCG0W08JTPgoe4ko?=
 =?iso-8859-2?Q?j1wurDsux2FhuMFccxSdBlwADUu3ViGjbDAs3ujaUIb2JHmS+HNhXgkb9T?=
 =?iso-8859-2?Q?k6aPvOqC+Jn2HfJ25IqnAlSRX5QPjj3ecP9w6s8LFol0nq1F9QPepH5+xV?=
 =?iso-8859-2?Q?VT+Kbu6jSz1/2vERiQoE3KEeoSPGyqe+TGULcwtLmC3+P9y2TIOEfdS3Pq?=
 =?iso-8859-2?Q?C3bjJYouM/xfMzJpRinKYEZiWCD50fMwfWkNdbtbas4Gg5yEA56B7nNbvK?=
 =?iso-8859-2?Q?5FxXxW9dK3HpvwE4zZjHqRg9XIdOtEFh1q4QdDYWxHW82nFcfrQkLdMnhE?=
 =?iso-8859-2?Q?WC1+HLNmK9wN9LQTxglP4sm1dHIyhqD6gFaVroGkkCREOHIQwHWJKW7qxR?=
 =?iso-8859-2?Q?HokRWD6u1K9EigEAhyq9inRJxkf+Z2VdUIHptXfqEDukYVt14lkkrFKjHM?=
 =?iso-8859-2?Q?LSeRhgfnIKjYwSZhb7JrJxIxmYz3K2i0H5vSxosUe29tALFlzHmxoSQ/XX?=
 =?iso-8859-2?Q?UKzlloINminIb9yrtWZ/Fpt4jEQ20SvoMWGlK/tBm3TNzOUqxqi15nhkil?=
 =?iso-8859-2?Q?XXgU8f+8dPrIGdVtvR52j0B0lD1B7+g6dBaNz+Ro6AA612YGlYZxKKSdLu?=
 =?iso-8859-2?Q?ZATTXdyqL12JKO76w6kRTtc7xw6dDQux5sTBeo+VBBOi7SZfQ8spBn7fNe?=
 =?iso-8859-2?Q?CbAWBX+ZJDZhzXwp8URYCOUa2p5Bj+mChT206pElPtzsNjnGeTPPzZ3Bbr?=
 =?iso-8859-2?Q?EldR3znPoXa5WxsRKv4kGYysVTdlcHo/sXQfKt2G+FR7LWX/Czo2IjZ+0O?=
 =?iso-8859-2?Q?6C2Vx+ICRB6MrB4y0zTIwr+LPyxD018+xhca5l7Ow3Dab9u8rVrTillKIP?=
 =?iso-8859-2?Q?3VUwxE1kmjESns5ReEcHYnPRP9TuRmU2c4NqgGv9O7DOVW47hGU1pssKtY?=
 =?iso-8859-2?Q?SFKr0/gjJIroxjLInbkxUICoeOvEL3KV9dxcSUGeCThqYaOozyXT64X/+R?=
 =?iso-8859-2?Q?d3nm+f681tRVMnj3VNXAkDDCkZZgLAYV/4D3EsafEGof5sHH3roByKRyFH?=
 =?iso-8859-2?Q?b4D3MNRKexmgsZcF9wjxe7ARYPCttRcU3L3h1Ky/Jf4nzIHWYRrV0Yykys?=
 =?iso-8859-2?Q?4mlbZp/wiMG6YD4cSIY+W2TU1nixp43RnjhydxLhdRWVh6BBQjFEL8WWFd?=
 =?iso-8859-2?Q?DyPQNM+5M3VVQ0i/7E5HhC03MFRkqvxnP2TU10F/WjKs1QFyWIT0G2BQ?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373D06A6341C404CE10609F9139AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4aeab1d-3ae8-4a00-ae8c-08db886a9e1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 15:12:50.3227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tDhmB1uke2nzqHSrBg3Q+pfB9vOYjOEdnUczSVLx26S+cmBv0UEU6Dw0zmhvDn2wtG6sXY9iTRxnhYBAbylJ1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8671
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 15:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184587

--_000_VI1PR04MB5373D06A6341C404CE10609F9139AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Ok I have found the root cause for this warning.

I will post it later on and this is another fix to opkg.

BR
Piotr
________________________________
Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org> w imieniu u=BFytkownika Piotr =A3obacz via lists.openembedded.=
org <p.lobacz=3Dwelotec.com@lists.openembedded.org>
Wys=B3ane: Wednesday, July 19, 2023 3:36:42 PM
Do: Richard Purdie <richard.purdie@linuxfoundation.org>; Alexandre Belloni =
<alexandre.belloni@bootlin.com>
DW: Alex Stewart <alex.stewart@ni.com>; openembedded-core@lists.openembedde=
d.org <openembedded-core@lists.openembedded.org>
Temat: ODP: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro =
native features support

HI all, Hi Richard thx for quick response.
Generally this patch for tar has been already applied to the upstream https=
://eur04.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fgit.savannah.=
gnu.org%2Fcgit%2Ftar.git%2Fcommit%2F%3Fid%3D5461025569c2d946fb31b79f16f60e9=
23bbd79f9&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C4ee44b94eb4d4bf9d55d08d=
b885d34ef%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638253706138546929%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DIxeRXlnaQ00oluPfxoZaRFlz4DIcZLKQElwY=
MCrsgus%3D&reserved=3D0<http://git.savannah.gnu.org/cgit/tar.git/commit/?id=
=3D5461025569c2d946fb31b79f16f60e923bbd79f9>
Additionally a new version 1.35 has been released which has this fix applie=
d as well.

> Are you saying we need to patch tar in order for these patches to work?

Unfortunately yes, but still this error, which occurs on autobuilder should=
 not happen, because the patch for ACLs and xattrs only
changes the writing algorithm to the tar file - meaning, when --numeric-own=
er parameter is being used all uid(s)/gid(s) are written
with numbers instead of names.

> WARNING: core-image-sato-1.0-r0 do_rootfs: [log_check] core-image-sato: f=
ound 4 warning messages in the logfile:
> [log_check] Warning when reading ar archive header: Pathname can't be con=
verted from UTF-8 to current locale. (errno=3D84)
> [log_check] Warning when reading ar archive header: Pathname can't be con=
verted from UTF-8 to current locale. (errno=3D84)
> [log_check] Warning when reading ar archive header: Pathname can't be con=
verted from UTF-8 to current locale. (errno=3D84)
> [log_check] Warning when reading ar archive header: Pathname can't be con=
verted from UTF-8 to current locale. (errno=3D84)

This one is also occurring on our side, but I thought that it is irrelevant=
 as it's just a warning and everything is working fine. Generally
I have investigated it and it occurs that this error occurs from opkg sourc=
e code https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
git.yoctoproject.org%2Fopkg%2Ftree%2Flibopkg%2Fopkg_archive.c%23n272&data=
=3D05%7C01%7Cp.lobacz%40welotec.com%7C4ee44b94eb4d4bf9d55d08db885d34ef%7C25=
111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638253706138546929%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000%7C%7C%7C&sdata=3DKqsMAR3VjZyI39KA4W22627MF6RH%2BCswvSAggm4Wi38%3D&r=
eserved=3D0<https://git.yoctoproject.org/opkg/tree/libopkg/opkg_archive.c#n=
272>
I added a debug code in here like that:

        opkg_msg(NOTICE, "Warning when reading ar archive header: %s (errno=
=3D%d) LC_CTYPE=3D%s LC_ALL=3D%s\n",
                 archive_error_string(ar), archive_errno(ar), setlocale(LC_=
CTYPE, NULL), setlocale(LC_ALL, NULL));

to actually see what are the LC values and it occurred that it is equal C. =
Afterwards my investigations were focused on whom is calling
the opkg command, maybe it is changing somehow locales and this is being ex=
ecuted in here https://eur04.safelinks.protection.outlook.com/?url=3Dhttp%3=
A%2F%2Fgit.openembedded.org%2Fopenembedded-core%2Ftree%2Fmeta%2Flib%2Foe%2F=
package_manager%2Fipk%2F__init__.py%23n368&data=3D05%7C01%7Cp.lobacz%40welo=
tec.com%7C4ee44b94eb4d4bf9d55d08db885d34ef%7C25111a7f1d5a4c51a4ca7f8e44011b=
39%7C0%7C0%7C638253706138546929%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DB%2=
BcC8DBiKxR4GJ5lEdEaK3ZSQ7mdip0S%2Fl6VjVT3gCo%3D&reserved=3D0<http://git.ope=
nembedded.org/openembedded-core/tree/meta/lib/oe/package_manager/ipk/__init=
__.py#n368>
but to my surprise LC_ALL which is being passed through os.environ is prope=
r and equals
LC_ALL: 'en_US.UTF-8'

My guess is that opkg runs fork process to actually install all depends, be=
cause in log.do_rootfs file from this https://eur04.safelinks.protection.ou=
tlook.com/?url=3Dhttp%3A%2F%2Fgit.openembedded.org%2Fopenembedded-core%2Ftr=
ee%2Fmeta%2Flib%2Foe%2Fpackage_manager%2Fipk%2F__init__.py%23n366&data=3D05=
%7C01%7Cp.lobacz%40welotec.com%7C4ee44b94eb4d4bf9d55d08db885d34ef%7C25111a7=
f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638253706138546929%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00%7C%7C%7C&sdata=3DffBgezGhTHvHaP9iPddoCYk20ZXKRLrN%2FRiTAwSLTcU%3D&reserv=
ed=3D0<http://git.openembedded.org/openembedded-core/tree/meta/lib/oe/packa=
ge_manager/ipk/__init__.py#n366>
line I don't see the whole list of all packages that are being installed.

A stupid fix for that was to set LC_ALL in opkg with:

setlocale(LC_ALL, "en_US.UTF-8");

to check if it fixes the issue and yes it fixes but this is no go.

Question is probably now to Alex does opkg can run fork instances for depen=
ds? Because I have found that it uses this vfork,
however I dunno if it uses parent's process env variables or it's own. I th=
ink that this needs further investigations...

BR
Piotr

Od: Richard Purdie <richard.purdie@linuxfoundation.org>
Wys=B3ane: =B6roda, 19 lipca 2023 10:37
Do: Piotr =A3obacz <p.lobacz@welotec.com>; Alexandre Belloni <alexandre.bel=
loni@bootlin.com>
DW: Alex Stewart <alex.stewart@ni.com>; openembedded-core@lists.openembedde=
d.org <openembedded-core@lists.openembedded.org>
Temat: Re: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro n=
ative features support

On Wed, 2023-07-19 at 07:53 +0000, Piotr =A3obacz wrote:
> I'm running this on docker with ubuntu 22.04 LTS and I have patched
> tar 1.34 with the patch I have given to you. I know that it contains
> these parameters, but they are faulty - meaning the ACLs do not
> preserve uid/gid in tar archive.

Are you saying we need to patch tar in order for these patches to work?

> Nevertheless this concerns me that opkg-build command should not
> fail. Additionally I have tested yesterday running my build without
> acl and xattr in DISTRO_FEATURES and it also worked for me - without
> applaying acls and xattrs to tar archive.
> Generally I need to reproduce your error and it seems to me that
> there is no other option as to re-create exactly the same environment
> on my machine locally, so I could investigate it.
>
> My question is how can we achive it in the simplest way? Does
> autobuilder use a docker for building?Because if so, I could take
> these docker scripts, run them and check what's happening.

The autobuilders are standard installs of various distros. We keep them
matching upstream and the list of installed software minimal.

There are more issues in this patch series. For example there is this
reproducibility issue:

https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F117%2Fbuilds%2F3219%2Fst=
eps%2F13%2Flogs%2Fstdio&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C4ee44b94e=
b4d4bf9d55d08db885d34ef%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638253=
706138546929%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D9jOjTjLagKdq%2B%2BQAHJ=
%2FM%2BEiYMUQ7nIuLILV9Zuoppwk%3D&reserved=3D0<https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/117/builds/3219/steps/13/logs/stdio>

which is saying there were two sets of different ipk packages produced.
These are available here:

https://eur04.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fautobuil=
der.yocto.io%2Fpub%2Frepro-fail%2Foe-reproducible-20230718-bn_npkdc%2Fpacka=
ges%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C4ee44b94eb4d4bf9d55d08db88=
5d34ef%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638253706138546929%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DZJfNYwp%2FbyGN30IVyPJNIBGA2C5SV%2F1p7QH=
hSsIxqK8%3D&reserved=3D0<http://autobuilder.yocto.io/pub/repro-fail/oe-repr=
oducible-20230718-bn_npkdc/packages/>

sadly the automatic diffoscope output wasn't generated.

Worryingly this report suggests the opkg-build change is not
deterministic.

FWIW this is just with the opkg-build change and the bitbake.conf
change, not the other patches.

These two changes alone also cause these warnings:

https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F76%2Fbuilds%2F7436%2Fste=
ps%2F12%2Flogs%2Fstdio&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C4ee44b94eb=
4d4bf9d55d08db885d34ef%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C6382537=
06138546929%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dk1qJppjBWBpF0brnmTWfrzT=
STTRCdaXTaTRaOagRfug%3D&reserved=3D0<https://autobuilder.yoctoproject.org/t=
yphoon/#/builders/76/builds/7436/steps/12/logs/stdio>
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F76%2Fbuilds%2F7436%2Fste=
ps%2F18%2Flogs%2Fstdio&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C4ee44b94eb=
4d4bf9d55d08db885d34ef%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C6382537=
06138546929%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DnY9kd6CQBMfM4olhd9TRpD%=
2BWpIYVWDDHjJhvNQGh8Mo%3D&reserved=3D0<https://autobuilder.yoctoproject.org=
/typhoon/#/builders/76/builds/7436/steps/18/logs/stdio>
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F44%2Fbuilds%2F7509%2Fste=
ps%2F21%2Flogs%2Fstdio&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C4ee44b94eb=
4d4bf9d55d08db885d34ef%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C6382537=
06138546929%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DJZjun2owGzx%2FsCQ1sXtTs=
nJRWnAeohwo2enxxT37sSE%3D&reserved=3D0<https://autobuilder.yoctoproject.org=
/typhoon/#/builders/44/builds/7509/steps/21/logs/stdio>

e.g. things like:

WARNING: core-image-sato-1.0-r0 do_rootfs: [log_check] core-image-sato: fou=
nd 4 warning messages in the logfile:
[log_check] Warning when reading ar archive header: Pathname can't be conve=
rted from UTF-8 to current locale. (errno=3D84)
[log_check] Warning when reading ar archive header: Pathname can't be conve=
rted from UTF-8 to current locale. (errno=3D84)
[log_check] Warning when reading ar archive header: Pathname can't be conve=
rted from UTF-8 to current locale. (errno=3D84)
[log_check] Warning when reading ar archive header: Pathname can't be conve=
rted from UTF-8 to current locale. (errno=3D84)

so there is a further issue to investigate there.

All in all, there are a lot of issues with this patch series :(.

Cheers,

Richard

--_000_VI1PR04MB5373D06A6341C404CE10609F9139AVI1PR04MB5373eurp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
</head>
<body>
<div dir=3D"ltr">
<div></div>
<div>
<div>
<div dir=3D"ltr">
<div>Ok I have found the root cause for this warning.</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">I will post it later on and this is another fix to opkg.<s=
pan id=3D"ms-outlook-ios-cursor"></span></div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> openembedded-core@lists=
.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; w imieni=
u u=BFytkownika Piotr =A3obacz via lists.openembedded.org
 &lt;p.lobacz=3Dwelotec.com@lists.openembedded.org&gt;<br>
<b>Wys=B3ane:</b> Wednesday, July 19, 2023 3:36:42 PM<br>
<b>Do:</b> Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;; Alexa=
ndre Belloni &lt;alexandre.belloni@bootlin.com&gt;<br>
<b>DW:</b> Alex Stewart &lt;alex.stewart@ni.com&gt;; openembedded-core@list=
s.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Temat:</b> ODP: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr =
distro native features support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">HI all, Hi Richard thx for quick response.<br>
Generally this patch for tar has been already applied to the upstream <a hr=
ef=3D"http://git.savannah.gnu.org/cgit/tar.git/commit/?id=3D5461025569c2d94=
6fb31b79f16f60e923bbd79f9">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fgit.sava=
nnah.gnu.org%2Fcgit%2Ftar.git%2Fcommit%2F%3Fid%3D5461025569c2d946fb31b79f16=
f60e923bbd79f9&amp;data=3D05%7C01%7Cp.lobacz%40welotec.com%7C4ee44b94eb4d4b=
f9d55d08db885d34ef%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C63825370613=
8546929%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DIxeRXlnaQ00oluPfxoZaRFl=
z4DIcZLKQElwYMCrsgus%3D&amp;reserved=3D0</a><br>
Additionally a new version 1.35 has been released which has this fix applie=
d as well.<br>
<br>
&gt; Are you saying we need to patch tar in order for these patches to work=
?<br>
<br>
Unfortunately yes, but still this error, which occurs on autobuilder should=
 not happen, because the patch for ACLs and xattrs only<br>
changes the writing algorithm to the tar file - meaning, when --numeric-own=
er parameter is being used all uid(s)/gid(s) are written<br>
with numbers instead of names.<br>
<br>
&gt; WARNING: core-image-sato-1.0-r0 do_rootfs: [log_check] core-image-sato=
: found 4 warning messages in the logfile:<br>
&gt; [log_check] Warning when reading ar archive header: Pathname can't be =
converted from UTF-8 to current locale. (errno=3D84)<br>
&gt; [log_check] Warning when reading ar archive header: Pathname can't be =
converted from UTF-8 to current locale. (errno=3D84)<br>
&gt; [log_check] Warning when reading ar archive header: Pathname can't be =
converted from UTF-8 to current locale. (errno=3D84)<br>
&gt; [log_check] Warning when reading ar archive header: Pathname can't be =
converted from UTF-8 to current locale. (errno=3D84)<br>
<br>
This one is also occurring on our side, but I thought that it is irrelevant=
 as it's just a warning and everything is working fine. Generally<br>
I have investigated it and it occurs that this error occurs from opkg sourc=
e code
<a href=3D"https://git.yoctoproject.org/opkg/tree/libopkg/opkg_archive.c#n2=
72">https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
.yoctoproject.org%2Fopkg%2Ftree%2Flibopkg%2Fopkg_archive.c%23n272&amp;data=
=3D05%7C01%7Cp.lobacz%40welotec.com%7C4ee44b94eb4d4bf9d55d08db885d34ef%7C25=
111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638253706138546929%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000%7C%7C%7C&amp;sdata=3DKqsMAR3VjZyI39KA4W22627MF6RH%2BCswvSAggm4Wi38%=
3D&amp;reserved=3D0</a><br>
I added a debug code in here like that:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; opkg_msg(NOTICE, &quot;Warning w=
hen reading ar archive header: %s (errno=3D%d) LC_CTYPE=3D%s LC_ALL=3D%s\n&=
quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; archive_error_string(ar), archive_errno(ar), setlocal=
e(LC_CTYPE, NULL), setlocale(LC_ALL, NULL));<br>
<br>
to actually see what are the LC values and it occurred that it is equal C. =
Afterwards my investigations were focused on whom is calling<br>
the opkg command, maybe it is changing somehow locales and this is being ex=
ecuted in here
<a href=3D"http://git.openembedded.org/openembedded-core/tree/meta/lib/oe/p=
ackage_manager/ipk/__init__.py#n368">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fgit.open=
embedded.org%2Fopenembedded-core%2Ftree%2Fmeta%2Flib%2Foe%2Fpackage_manager=
%2Fipk%2F__init__.py%23n368&amp;data=3D05%7C01%7Cp.lobacz%40welotec.com%7C4=
ee44b94eb4d4bf9d55d08db885d34ef%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%=
7C638253706138546929%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DB%2BcC8DBi=
KxR4GJ5lEdEaK3ZSQ7mdip0S%2Fl6VjVT3gCo%3D&amp;reserved=3D0</a><br>
but to my surprise LC_ALL which is being passed through os.environ is prope=
r and equals<br>
LC_ALL: 'en_US.UTF-8'<br>
<br>
My guess is that opkg runs fork process to actually install all depends, be=
cause in log.do_rootfs file from this
<a href=3D"http://git.openembedded.org/openembedded-core/tree/meta/lib/oe/p=
ackage_manager/ipk/__init__.py#n366">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fgit.open=
embedded.org%2Fopenembedded-core%2Ftree%2Fmeta%2Flib%2Foe%2Fpackage_manager=
%2Fipk%2F__init__.py%23n366&amp;data=3D05%7C01%7Cp.lobacz%40welotec.com%7C4=
ee44b94eb4d4bf9d55d08db885d34ef%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%=
7C638253706138546929%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DffBgezGhTH=
vHaP9iPddoCYk20ZXKRLrN%2FRiTAwSLTcU%3D&amp;reserved=3D0</a><br>
line I don't see the whole list of all packages that are being installed.<b=
r>
<br>
A stupid fix for that was to set LC_ALL in opkg with:<br>
<br>
setlocale(LC_ALL, &quot;en_US.UTF-8&quot;);<br>
<br>
to check if it fixes the issue and yes it fixes but this is no go.<br>
<br>
Question is probably now to Alex does opkg can run fork instances for depen=
ds? Because I have found that it uses this vfork,<br>
however I dunno if it uses parent's process env variables or it's own. I th=
ink that this needs further investigations...<br>
<br>
BR<br>
Piotr<br>
<br>
Od: Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br>
Wys=B3ane: =B6roda, 19 lipca 2023 10:37<br>
Do: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;; Alexandre Belloni &lt;alex=
andre.belloni@bootlin.com&gt;<br>
DW: Alex Stewart &lt;alex.stewart@ni.com&gt;; openembedded-core@lists.opene=
mbedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
Temat: Re: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro n=
ative features support<br>
<br>
On Wed, 2023-07-19 at 07:53 +0000, Piotr =A3obacz wrote:<br>
&gt; I'm running this on docker with ubuntu 22.04 LTS and I have patched<br=
>
&gt; tar 1.34 with the patch I have given to you. I know that it contains<b=
r>
&gt; these parameters, but they are faulty - meaning the ACLs do not<br>
&gt; preserve uid/gid in tar archive.<br>
<br>
Are you saying we need to patch tar in order for these patches to work?<br>
<br>
&gt; Nevertheless this concerns me that opkg-build command should not<br>
&gt; fail. Additionally I have tested yesterday running my build without<br=
>
&gt; acl and xattr in DISTRO_FEATURES and it also worked for me - without<b=
r>
&gt; applaying acls and xattrs to tar archive.<br>
&gt; Generally I need to reproduce your error and it seems to me that<br>
&gt; there is no other option as to re-create exactly the same environment<=
br>
&gt; on my machine locally, so I could investigate it.<br>
&gt;<br>
&gt; My question is how can we achive it in the simplest way? Does<br>
&gt; autobuilder use a docker for building?Because if so, I could take<br>
&gt; these docker scripts, run them and check what's happening.<br>
<br>
The autobuilders are standard installs of various distros. We keep them<br>
matching upstream and the list of installed software minimal.<br>
<br>
There are more issues in this patch series. For example there is this<br>
reproducibility issue:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/117/buil=
ds/3219/steps/13/logs/stdio">https://eur04.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilde=
rs%2F117%2Fbuilds%2F3219%2Fsteps%2F13%2Flogs%2Fstdio&amp;data=3D05%7C01%7Cp=
.lobacz%40welotec.com%7C4ee44b94eb4d4bf9d55d08db885d34ef%7C25111a7f1d5a4c51=
a4ca7f8e44011b39%7C0%7C0%7C638253706138546929%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%=
7C&amp;sdata=3D9jOjTjLagKdq%2B%2BQAHJ%2FM%2BEiYMUQ7nIuLILV9Zuoppwk%3D&amp;r=
eserved=3D0</a><br>
<br>
which is saying there were two sets of different ipk packages produced.<br>
These are available here:<br>
<br>
<a href=3D"http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230=
718-bn_npkdc/packages/">https://eur04.safelinks.protection.outlook.com/?url=
=3Dhttp%3A%2F%2Fautobuilder.yocto.io%2Fpub%2Frepro-fail%2Foe-reproducible-2=
0230718-bn_npkdc%2Fpackages%2F&amp;data=3D05%7C01%7Cp.lobacz%40welotec.com%=
7C4ee44b94eb4d4bf9d55d08db885d34ef%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7=
C0%7C638253706138546929%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DZJfNYwp=
%2FbyGN30IVyPJNIBGA2C5SV%2F1p7QHhSsIxqK8%3D&amp;reserved=3D0</a><br>
<br>
sadly the automatic diffoscope output wasn't generated.<br>
<br>
Worryingly this report suggests the opkg-build change is not<br>
deterministic.<br>
<br>
FWIW this is just with the opkg-build change and the bitbake.conf<br>
change, not the other patches.<br>
<br>
These two changes alone also cause these warnings:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/76/build=
s/7436/steps/12/logs/stdio">https://eur04.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilder=
s%2F76%2Fbuilds%2F7436%2Fsteps%2F12%2Flogs%2Fstdio&amp;data=3D05%7C01%7Cp.l=
obacz%40welotec.com%7C4ee44b94eb4d4bf9d55d08db885d34ef%7C25111a7f1d5a4c51a4=
ca7f8e44011b39%7C0%7C0%7C638253706138546929%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C=
&amp;sdata=3Dk1qJppjBWBpF0brnmTWfrzTSTTRCdaXTaTRaOagRfug%3D&amp;reserved=3D=
0</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/76/build=
s/7436/steps/18/logs/stdio">https://eur04.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilder=
s%2F76%2Fbuilds%2F7436%2Fsteps%2F18%2Flogs%2Fstdio&amp;data=3D05%7C01%7Cp.l=
obacz%40welotec.com%7C4ee44b94eb4d4bf9d55d08db885d34ef%7C25111a7f1d5a4c51a4=
ca7f8e44011b39%7C0%7C0%7C638253706138546929%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C=
&amp;sdata=3DnY9kd6CQBMfM4olhd9TRpD%2BWpIYVWDDHjJhvNQGh8Mo%3D&amp;reserved=
=3D0</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/44/build=
s/7509/steps/21/logs/stdio">https://eur04.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilder=
s%2F44%2Fbuilds%2F7509%2Fsteps%2F21%2Flogs%2Fstdio&amp;data=3D05%7C01%7Cp.l=
obacz%40welotec.com%7C4ee44b94eb4d4bf9d55d08db885d34ef%7C25111a7f1d5a4c51a4=
ca7f8e44011b39%7C0%7C0%7C638253706138546929%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C=
&amp;sdata=3DJZjun2owGzx%2FsCQ1sXtTsnJRWnAeohwo2enxxT37sSE%3D&amp;reserved=
=3D0</a><br>
<br>
e.g. things like:<br>
<br>
WARNING: core-image-sato-1.0-r0 do_rootfs: [log_check] core-image-sato: fou=
nd 4 warning messages in the logfile:<br>
[log_check] Warning when reading ar archive header: Pathname can't be conve=
rted from UTF-8 to current locale. (errno=3D84)<br>
[log_check] Warning when reading ar archive header: Pathname can't be conve=
rted from UTF-8 to current locale. (errno=3D84)<br>
[log_check] Warning when reading ar archive header: Pathname can't be conve=
rted from UTF-8 to current locale. (errno=3D84)<br>
[log_check] Warning when reading ar archive header: Pathname can't be conve=
rted from UTF-8 to current locale. (errno=3D84)<br>
<br>
so there is a further issue to investigate there.<br>
<br>
All in all, there are a lot of issues with this patch series :(.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB5373D06A6341C404CE10609F9139AVI1PR04MB5373eurp_--

