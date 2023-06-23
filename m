Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0140EB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 15:43:07 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.125])
 by mx.groups.io with SMTP id smtpd.web11.1861.1687534975790641652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 08:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com header.s=selector1-arrigroup-onmicrosoft-com header.b=S9GW5oAG;
 spf=pass (domain: arri.de, ip: 40.107.21.125, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmb60kOGqXHEaVfvjPEpUT5qLjQwsWIzOv7VuCCq3x0HzAoxFMCmF/bG+Dq6XoDrc6tuxITX392QV3m2FZOC0D43gTv+l2mPD0kIbvA2R6NJP1TIKDOjSlGlfVRt3WtuojkfpCZVquCykbI9PYd+rfDgY1aVcogRhuNFjdnkllbIrOjh6z1Gg+FIsO8enISm5VF7X0wJmcNyHvLznGOVxiQRGdBJcONFuH91eBhPR2Kv0QQ8YZBpSmuh08EJom0qI8x4/BFsMfuhDqOPLpaPSWOaqLVv857O1XgNguVEQ5fktG+utG3saVsxgTOKyblHwT2uVjU9EZ+Mkj5CpFp09A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRZXtMu6Gur00jI2e+FAEUv7x4zeW2GL3efkI01HyA0=;
 b=CasC+cDlVcc6R5CE8SqVhgM9QFzX4H9+0aR0RWkcbauJXE2I+9h5ZsrsmHhFEzcoCkE9bSMnHTQFx4MXacQcFFN9097F9y4m9Mvgzg+ofHcGW2SRRcZaVp4mEDlSuTOp32I660J+nMG/Y+gCxXrqKzrMJQOcTDRocycpewNre3H3ximuYDRjV6q5efCQzhGnOaEm4E9wdwxYklZboLLbtNPtudSRAVxO7fe5Rp7Y5Uvca0BD5NqcrZ2Ie/3QXJsVvdzuejOK2GCUeX+/h3Yi8iOwyZDS5/b/8Z0WsfCvU1jluSQorkzAP3/j+rlTwoxR/miDjF6khP2ZRDHCRRzZlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de; dmarc=none
 action=none header.from=arri.de; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRZXtMu6Gur00jI2e+FAEUv7x4zeW2GL3efkI01HyA0=;
 b=S9GW5oAGW/aH0vUQLKd/1Kp6cPrxtntgqPGpbKsXXDsLjDfNwLJp+4ROnwYlogyg5XOt9hVakzOohpF6snwozrwiIi0Yyy7nHfGrlLbpCv+AoJ92mHE/mrsqUSdDUYzk/TRMFG+vHKfofa72D2NRIQwyjDh0qcHIHmHXElSIDGg=
Received: from FR3P281CA0157.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a2::13)
 by PA4PR07MB7278.eurprd07.prod.outlook.com (2603:10a6:102:f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 23 Jun
 2023 15:42:51 +0000
Received: from VI1EUR02FT059.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:d10:a2:cafe::9b) by FR3P281CA0157.outlook.office365.com
 (2603:10a6:d10:a2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.10 via Frontend
 Transport; Fri, 23 Jun 2023 15:42:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VI1EUR02FT059.mail.protection.outlook.com (10.13.60.72) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.26 via Frontend Transport; Fri, 23 Jun 2023 15:42:50 +0000
Received: from n95hx1g2.localnet (192.168.54.161) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 23 Jun
 2023 17:42:50 +0200
From: Christian Eggers <ceggers@arri.de>
To: Maxime =?ISO-8859-1?Q?Roussin=2DB=E9langer?=
	<maxime.roussinbelanger@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] bitbake.conf: add debug symbol for sdk
Date: Fri, 23 Jun 2023 17:42:49 +0200
Message-ID: <4821006.GXAFRqVoOG@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <CAE=T-s5zCTKjZ6g6-J_dUYjJFrL5AK69Y-dRtmdA+=zeXcCUyw@mail.gmail.com>
References: <20230622161749.797820-1-maxime.roussinbelanger@gmail.com> <CANNYZj--pKA7ASdohuoOmrOwK+UZAJPS1WsFVcbqRXEvw+3K-Q@mail.gmail.com> <CAE=T-s5zCTKjZ6g6-J_dUYjJFrL5AK69Y-dRtmdA+=zeXcCUyw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [192.168.54.161]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1EUR02FT059:EE_|PA4PR07MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 41115608-627b-4f0e-65dd-08db740080a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OQS+ITzS5vCr8vFpzJWfIhhWv+u971dKa+QV5UntYIMZlu/CF2enWl/3DEi3B5WCIgFUhI//8IM4hIyoswkFalKh0HEo4R6sz2kQfEyOCB0YC7+d5DjI8d/tr8rkAPU/WOBHun13Rg8c7kdklbBv/Vheo2BQHq96+fGtNWnH2Pho45vyin78hxlY1zgLaDWrGqdc6bfF6JepbyQthvG1Js7nfVU+BparpyXZBMVxeO3C4m2PIxdZZCy3Xk7yw9hyI7x07MlybxJzzUDFlXtcghcSOFBr163VYCmHZZS32Km0G+I50vLvLFOPZjJZsspuTZzGLJJU3xjq0qFLFzyCKzFB0g/7lSTxaRLfoOgEyOrYyw4emsitkZ4mniA4fRIuG+7Q0ENvkg8ZMAsXEtyS/KbtgUvm+x9pIuR96j6L875/gdfFzctIuuA17Q3kxtijlVSiseJJdrRW3ho57Gq/SGEklg+TX7sVhpJmn9HjesgyXFraPFsRBH9LhSuLKr+3xOXPt1VlHZwc++4ycWZJbfVcpCKduY/33wDTy5/nKxUYHp+IPEejqlgGE4Ym5gBLsQQ6O1lSc2Dwmr5cjFRYJJVOJVVXbXzqBBxDgdOKf40GW366Dopck4F4CqLNrJlPHKUQnji/IpVgeEZewHd1IK93UOxGu+d2b8iHeMEZdr83VDv7E7NqH/BHBCm1cBCh9tPdkxJHSpA1HFV0AFSTt+295n+DKjomgczGTVi3ciBnLlBNzdKj64TiwaVcBsFb3E/cyUdwvbKUq6Lp8pVxA9m/ssPaUa4LxXXWKgLNMP0=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199021)(36840700001)(46966006)(9576002)(8676002)(16526019)(186003)(8936002)(41300700001)(26005)(53546011)(2906002)(9686003)(54906003)(70206006)(4326008)(86362001)(70586007)(316002)(6916009)(33716001)(36860700001)(36916002)(478600001)(356005)(82310400005)(82740400003)(81166007)(83380400001)(336012)(426003)(66574015)(40480700001)(47076005)(5660300002)(66899021)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 15:42:50.9799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41115608-627b-4f0e-65dd-08db740080a6
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR02FT059.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7278
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 15:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183334

Hi Max,

I use the following lines in my local.conf file (on kirkstone). Maybe that =
this is not
optimal as it may cause silent side effects in case the original values for=
=20
BUILDSDK_OPTIMIZATION/_CFLAGS/_CXXFALGS will change same day.

# Build -nativesdk packages with debug info (required for generating -dbg/-=
src packages)
# BUILDSDK_OPTIMIZATION is based on BUILD_OPTIMIZATION in bitbake.conf
BUILDSDK_OPTIMIZATION =3D "${@oe.utils.vartrue('DEBUG_BUILD', '-Og', '-O2',=
 d)} -g -feliminate-unused-debug-types -pipe"
BUILDSDK_CFLAGS =3D "${BUILDSDK_CPPFLAGS} ${BUILDSDK_OPTIMIZATION} ${DEBUG_=
PREFIX_MAP}"
BUILDSDK_CXXFLAGS =3D "${BUILDSDK_CFLAGS}"


Additionally I have to manually select all available nativesdk-*-dbg/-src p=
ackages in my
nativesdk-packagegroup-sdk-host.bbappend file. Unfortunately these packages=
 are not added
automatically to my SDK image (SDKIMAGE_FEATURES only applies for target pa=
ckages, not for
nativesdk packages). Maybe you'll find a better solution for that.

In my project I have added BBCLASSEXTEND=3D"nativesdk" to many bbappends in=
 order to have most
libraries I use on my target also for nativesdk (I can compile my embedded =
application also
for nativesdk then). As debugging performance using gdbserver is quite poor=
 on my system,
developing my application with nativesdk is a welcome alternative (that's  =
why I also have
enabled debug information nativesdk).

But from some previous comments on the OE list it seems that nativesdk is n=
ot really intended
for this purpose. But what is the alternative? Having two SDKs?

regards
Christian



On Friday, 23 June 2023, 16:58:56 CEST, Maxime Roussin-B=C3=A9langer wrote:
> On Fri, Jun 23, 2023 at 3:50=E2=80=AFAM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > But then you can set the parameters as you want them in your local
> > configuration. Setting -g globally in the absence of DEBUG_BUILD needs
> > a use case that applies to most users.
> >
> > Alex
>=20
> If user wants to install nativesdk dgb/src package you need to add that f=
lag,
> so instead of modifying the `BUILDSDK_CPPFLAGS`, it should probably be
> documented.
>=20
> Do you have any pointers where it could be documented?
>=20
> Max.
>=20
> >
> > On Thu, 22 Jun 2023 at 19:11, Maxime Roussin-B=C3=A9langer
> > <maxime.roussinbelanger@gmail.com> wrote:
> > >
> > > Hi Alex,
> > >
> > > I don't want a complete debug build. I want to keep optimization and
> > > have the debug symbols. I don't think I can achieve that with
> > > DEBUG_BUILD.
> > >
> > > Max
> > >
> > > On Thu, Jun 22, 2023 at 12:30=E2=80=AFPM Alexander Kanavin
> > > <alex.kanavin@gmail.com> wrote:
> > > >
> > > > This change is unnecessary, as there is already a mechanism. Just
> > > > slightly further down you can see that BUILDSDK_CFLAGS pulls in
> > > > BUILD_OPTIMIZATION, which sets -g if you enable DEBUG_BUILD in your
> > > > config.
> > > >
> > > > Alex
> > > >
> > > > On Thu, 22 Jun 2023 at 18:20, Maxime Roussin-B=C3=A9langer
> > > > <maxime.roussinbelanger@gmail.com> wrote:
> > > > >
> > > > > From: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
> > > > >
> > > > > Without adding debug flag nativesdk dbg package is not packaged s=
ince
> > > > > there is no debugging information
> > > > >
> > > > > Signed-off-by: Maxime Roussin-Belanger <maxime.roussinbelanger@gm=
ail.com>
> > > > > ---
> > > > > v2: New commit
> > > > >
> > > > >  meta/conf/bitbake.conf | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > > > index 9d9b268858..0635affbc1 100644
> > > > > --- a/meta/conf/bitbake.conf
> > > > > +++ b/meta/conf/bitbake.conf
> > > > > @@ -601,7 +601,7 @@ PATCHRESOLVE =3D "noop"
> > > > >  ################################################################=
##
> > > > >
> > > > >  export BUILD_CPPFLAGS =3D "-isystem${STAGING_INCDIR_NATIVE}"
> > > > > -BUILDSDK_CPPFLAGS =3D ""
> > > > > +BUILDSDK_CPPFLAGS ?=3D "-g"
> > > > >  export CPPFLAGS =3D "${TARGET_CPPFLAGS}"
> > > > >  TARGET_CPPFLAGS =3D ""
> > > > >
> > > > > --
> > > > > 2.36.0
> > > > >
> > > > >
> > > > >=20
> > > > >
>=20





