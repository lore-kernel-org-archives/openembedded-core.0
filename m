Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A57C4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 12:46:50 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.57])
 by mx.groups.io with SMTP id smtpd.web10.6278.1666097199583999694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 05:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=ZcGBHGaI;
 spf=pass (domain: nxp.com, ip: 40.107.13.57, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4gBv4ZrhJ3zH4zvep8lGQU6cvDqRf/+SvfkBUieiTSHwRt0OGziJK0v0iPAC7dIfBCify04qVsOTkol7MkO2JbcXtglNwOEpq8fMYfzHoj4Pn6h/pTVn9yDch6akuonLiUGhANNOllaQJEG3SmIUL8XANDKPoSAJz+YWlnyURjU4tvUZoy6EPuIbRhyLJ43ev5vMIh5uEpJkerJK+trLXhDn/tzXYeOWJaESMpz245/QkfT4yqc9wPoEWg7fuf37Bp5e54nEhnji7cWSgRhdcPDogzJf57p1IhIfUAbvK5KphjhzDDoX3dSUIFBVb3tmtENy7GFd9YxO/WHuGQL9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3R3vHeFpMAdvvmPylQ0jWhHSxqOxJFTr5C3/IFbRoYQ=;
 b=CAtpMuCVkqUXkSavC6E6l7nR9W0n4uPJa6b5pt7gX14wZ7UtkK8Qj3cQxwRwRzGxuW5mapLLqfktIC8irRb9iJ1CnHOZjSVm+Ha1ziCnCE1720dupqEyZA2N8VPU8W4XMiNFDijnFuebI9N/xK7QutK9u8Y6k1rES/YdbEknYQBH5xPe2yeetp1dhTDrY7DhU384EswFNVr/rbpS5gogCLBeyXl9bh+Pz5WD70og9NSa9u8WfjV0r9JEmzyxlPDo0Yz/O1lv79Ok5+vQdgdF32O132pNa6XelnGdIvGLBFGBmsv+RvJ82/1vrSr4G8NEDfcDUP1m6AcEJYD5XUN9mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3R3vHeFpMAdvvmPylQ0jWhHSxqOxJFTr5C3/IFbRoYQ=;
 b=ZcGBHGaIdPtYLIbrIl2DCXH0h6aJX+ou35sK9pUyX9oIUPRVTEgY74VlS3SNe516RutNniJAZIRMvgOBtkTPLax0F3VRWHHLsXeIaJJewEv1XmGLj3skHIP8nu1Tw1no5WXHGxJKGKKg8M9ILNTbGPsEpEqO9osy7TgKYASLjEY=
Received: from PR3PR04MB7308.eurprd04.prod.outlook.com (2603:10a6:102:80::21)
 by PA4PR04MB7663.eurprd04.prod.outlook.com (2603:10a6:102:e9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Tue, 18 Oct
 2022 12:46:36 +0000
Received: from PR3PR04MB7308.eurprd04.prod.outlook.com
 ([fe80::2f0c:165b:8713:d1ef]) by PR3PR04MB7308.eurprd04.prod.outlook.com
 ([fe80::2f0c:165b:8713:d1ef%3]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 12:46:36 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] vulkan-loader: Move libvulkan.so to main
 package
Thread-Topic: [OE-core] [PATCH] vulkan-loader: Move libvulkan.so to main
 package
Thread-Index: AQHY4ahykLPxTkakr0iFyNvx7WeNM64Sf3KAgAAFVoCAAC9ygIABNu0AgAAwnSA=
Date: Tue, 18 Oct 2022 12:46:35 +0000
Message-ID: 
 <PR3PR04MB73087DFB0AA277528C2216D4E2289@PR3PR04MB7308.eurprd04.prod.outlook.com>
References: <20221016214357.596913-1-tom.hochstein@nxp.com>
 <8917BE00-005D-4ECE-BAB9-82EFC64F9544@arm.com>
 <CA+chaQewGSyDypShmVYKNBkcEZUHrNPQbmYpNfbn+Ph3g40bcg@mail.gmail.com>
 <PR3PR04MB730871C6334283026EF62346E2299@PR3PR04MB7308.eurprd04.prod.outlook.com>
 <B01C1FDC-2D0B-4D85-88B9-66DB5184A241@arm.com>
In-Reply-To: <B01C1FDC-2D0B-4D85-88B9-66DB5184A241@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR04MB7308:EE_|PA4PR04MB7663:EE_
x-ms-office365-filtering-correlation-id: 917937cf-32e6-4f4b-b588-08dab106cafc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dv5oiol223E/4Hbgw51mCYjUiWC6yJbyPIg0TJQqW7ek2kzCggi1pQ4CHKhkBePbDSI7Le3YbBeHtfm9hguwCOoquTlj6vnhU0WvyP04eWRxx5bVYbqzkHxWp6NvmG4/bs/ScCnaYI2DGolyDoOnLOBKuXNP6kp/hWsgj+j6dcx2Qtdep0+yiFOYyp2QyTnoiHEdtyReHjk+wECEn9JJNXbpgtYj9ByAlgyT1L5PR5pTmus72BzBDiwLtFGE9lfq8AEOzQoNWu0c4ZABX6KB4CAbb6H2HGRsmouvnRtoqNz+7VSuKjlP+JB8cmyB09e2T7HsxcqPYJXwFEO4bPq4BskoyU9/dH0pJh42OPrOaL8DdQM5N5lENDWSKnwhEqVzNvgDp3ykO2CLx7PoUV+WtuqxxFDGrV7XNXQXkHNsEq0n8NQg+H64YjsZIBhdEYz5ilQqxApo8ypNuEf6FKSCwBL4imsmwYjoQMJYIz98WIQM6ivQApMPZz9r+fLIam1Ie0X4pvjGDxiqv6m7J+gOiGYiVSgISDsS4Ka0m7Y+HY/i6ZqjhFRuDN4EC9Tn/VNMfVXlA1DMrrJ8jqCEQRMq3jcrRD7rCCLEVdf0bLTWreyp+CsMwBLR+SiZnNyIH7394SPBbZoxTPLH74Cmg6oRyXCAgyZS1e3bK8QEJsL5gYNQrzeDIOMc4ON4hPeEQqa71y82fQZ3K6pFgfzyo6T2RkefP/C2wM1z+cEsYkVAiycv/DGSQ+/vdBkx77uH0iyU+CaARJih42CjhG2twGndBdKNCRjwsBrDL6E+kYEunqlgZmjFn3mkrgd8q+sNzByS4v/VX/Vd5DWi2XfI19AEhw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7308.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199015)(478600001)(38100700002)(8936002)(52536014)(5660300002)(44832011)(122000001)(83380400001)(33656002)(86362001)(38070700005)(26005)(54906003)(6916009)(186003)(64756008)(966005)(71200400001)(45080400002)(55016003)(316002)(9686003)(66946007)(41300700001)(4326008)(8676002)(76116006)(66446008)(66556008)(53546011)(6506007)(55236004)(66476007)(7696005)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?JkSedNOz4j/xQy308DMQeXyMbgb/diLfSJvN75nREc3i2nt9WOYWxubLLevB?=
 =?us-ascii?Q?7bjdx4PmC7YG0Sa+Ng2r2Ro0akBVJh6Xl2UtI3X2oYKSHf+Awx7M3Bz4thwq?=
 =?us-ascii?Q?4um3y19SoCz6oxz3VaGebcGJd8NVsvAhWSt3CL9j1bydJpc+N+kgJsb9tNHt?=
 =?us-ascii?Q?/Wq58W0YGqpnxrHZE56xR9eE9eeLqNK1Po88/rCDjj9gC69DtwKu7NolL0h/?=
 =?us-ascii?Q?j+t+PBtSWJBJzFLaiwJGiAuB2So/81RIfnoply24b1bKelogXkkw+KMYFi+C?=
 =?us-ascii?Q?hXnDLOX2eb9nlqJeXcY+Xhs9HoWovv7ia6FJIyRVnT1jfxt2NAoXHh1AC3mj?=
 =?us-ascii?Q?kgWDFa43pAR/jiSmRXydIrHmT9w5zftR8VRgejUMp40xMWACWptGg0/KPlLs?=
 =?us-ascii?Q?ZquZymfpbZb3sUocH4A4eXUtpM4UlTocQ61q/H2Vq1kCqKlp/Iw+KMO+etFs?=
 =?us-ascii?Q?ycvCszKW9misuV6KsqjVWQNQu/pIsSNOBQldRPYwGNBDAYuFPAeOPew4jUZh?=
 =?us-ascii?Q?lU5z6d9X6Rt1BT6mllk5Mf3qxwBNsZIyxceC0IrgpqbyMFNmmfzjBpPgz4wA?=
 =?us-ascii?Q?eau27oYywWaLoF9edHVMfPLMMv18kPCX2lWDz2oO+Oy55UWH1/GwlVRBd6lb?=
 =?us-ascii?Q?GoemM3sfmpPuSJNkWojUK6hA+41P43/wPqERdSNp0BCFlqwa5jAfjXAyoJ2u?=
 =?us-ascii?Q?pRFRuqvnhfUb/Tvs3FdmhmP3fOYKywwca9ZfpBsT4/6W+a8g2k/z6MU2nxVD?=
 =?us-ascii?Q?rh9b3NvxdKAq1MCYB8/sTBnzSoYnCxUfRkGVnOMH7z7y1MDRPfs1RhmP926f?=
 =?us-ascii?Q?vgKJ5eBQzSaPndfTkBwywfnQ0zm7vmJT9G8V6sOoB3Hsfqp6bwe8IlSvW7RV?=
 =?us-ascii?Q?NTS/mUhBcce4L5/sfLuXO+Hl5MxZNULMklSVReP1DuW4MSN6k6JY+DWzHw24?=
 =?us-ascii?Q?SPHx4+8eIVhsSqTWhhHbc5LM+8CxGkAETe9iOI7OabihXLMTEqyCkUd8LP1n?=
 =?us-ascii?Q?6E5auFN7/2OhKNnh7hvH47L6ZD4oEGpUVGWY6a1XT0lGksf2+nQV/8sZ8GjJ?=
 =?us-ascii?Q?Qh8MLYSoWQ5zYD19s1YJ0qR8uo49FnaR+RTqqDBDoC6lOcrUWoZiXnzurQuB?=
 =?us-ascii?Q?bUC/QZ7eArOKAwPf81fgRyXEa1UqvtAaMqDVqBkMghZAqJ/qnlUArIJ1tk+Q?=
 =?us-ascii?Q?Zy4dCMR/lWzPW9BwPHSAbBIvThAVcrXl5WN+9A2OvqG0a/+aYtiWvIGWhZGq?=
 =?us-ascii?Q?H7BjBgl09eYEQEOpqRL6p56h1U0LFjiNSfGsGCZQSHVJeolqpCzKD0x+qIZH?=
 =?us-ascii?Q?Wqaevoxsd7W0v7zOg3ch2ze24hCqBrlDPNKWJKnCdECXb6ENM0szfNj40K3Y?=
 =?us-ascii?Q?RIucQvQ0VxDAFroUOWpL5oRDz/uwNfG9NknXea+0XnP4oCn1RR5N0kegT6qG?=
 =?us-ascii?Q?58EzjLcU3jNmCctqSIND+gpeROlsKC5ZnIGzXVpTy2PYHUYs3lR0uzdi8eZi?=
 =?us-ascii?Q?58H04mwoTgh4HTMuENgnUUqBYt4xPL5MwxN2UiksektoYM9qjzJWHg3zyIdx?=
 =?us-ascii?Q?Tt2qtZbK3pI6rUSPXg8fNiT830jlsuYKnAjLcg6k?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7308.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 917937cf-32e6-4f4b-b588-08dab106cafc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2022 12:46:35.9513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qSKmSEnJmePJWKh7SSFKaUgm21L+crwVTInUaevvDx0xRU9jQFjaym+c9OZpBuR2zGG6i/nXnObjjDL+MVppQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7663
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 12:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171939

Got it, thank you Ross!

-----Original Message-----
From: Ross Burton <Ross.Burton@arm.com>=20
Sent: Tuesday, October 18, 2022 4:52 AM
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Martin Jansa <martin.jansa@gmail.com>; openembedded-core@lists.openembe=
dded.org
Subject: Re: [OE-core] [PATCH] vulkan-loader: Move libvulkan.so to main pac=
kage

On 17 Oct 2022, at 17:12, Tom Hochstein <tom.hochstein@nxp.com> wrote:
>=20
> I found a few examples online for both ways. In SaschaWillems examples, .=
so is used:
> =20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FSaschaWillems%2FVulkan%2Fblob%2Fmaster%2Fbase%2FVulkanAndroid.cpp%2=
3L142&amp;data=3D05%7C01%7Ctom.hochstein%40nxp.com%7C9c135c0d4b16464e586208=
dab0ee669d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638016835220670988%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DD5UDy3Fd%2F%2Fq8Hby31cqj4vxn2g8=
anMNBTZJJMbBdVHo%3D&amp;reserved=3D0
> =20
> In Vulkan-Tools there's a mix. Here the implementation falls back to .so.=
1 if .so is not found:
> =20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FKhronosGroup%2FVulkan-Tools%2Fblob%2Fmaster%2Fvulkaninfo%2Fvulkanin=
fo.h%23L256-L257&amp;data=3D05%7C01%7Ctom.hochstein%40nxp.com%7C9c135c0d4b1=
6464e586208dab0ee669d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63801683=
5220670988%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB=
TiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DfNOFnmZUbDGZAXGgU5Cq=
5N4cKmRBgLA7Od7FXcGXpLY%3D&amp;reserved=3D0
> =20
> While here only .so is used:
> =20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FKhronosGroup%2FVulkan-Tools%2Fblob%2Fmaster%2Fcommon%2Fvulkan_wrapp=
er.cpp%23L25&amp;data=3D05%7C01%7Ctom.hochstein%40nxp.com%7C9c135c0d4b16464=
e586208dab0ee669d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638016835220=
827298%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DmlM7Mr%2FEt9LTalhmHo5Js1=
UliBABxqpkXHC4V8KfUUk%3D&amp;reserved=3D0
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FKhronosGroup%2FVulkan-Tools%2Fblob%2Fmaster%2Fscripts%2Fgenerate_vu=
lkan_wrapper.py%23L2043&amp;data=3D05%7C01%7Ctom.hochstein%40nxp.com%7C9c13=
5c0d4b16464e586208dab0ee669d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6=
38016835220827298%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DPqV8hitdAseUD=
E4BnKeqvwOT0B9iQ03h77LCzJbxLj8%3D&amp;reserved=3D0
> =20
> With no consistency or guidance I'm not sure what the right solution is. =
At first I thought perhaps it is better for the caller to be more specific =
so that a compatibility problem is detected with a dlopen failure. Complica=
ting that, though, is that vulkan-loader 1.2 is not compatible with 1.3. Pl=
us why does Vulkan-Tools use .so.1 second? Probably to get around the fact =
that the .so is in the dev package?

I did some research.

libvulkan.so* is the Vulkan Loader, which is responsible for finding the co=
rrect driver and bridging the application with the driver.

As per the documentation at https://eur01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fvulkan.lunarg.com%2Fdoc%2Fsdk%2F1.3.224.1%2Flinux%2FLo=
aderApplicationInterface.html&amp;data=3D05%7C01%7Ctom.hochstein%40nxp.com%=
7C9c135c0d4b16464e586208dab0ee669d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7=
C0%7C638016835220827298%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DmZURlOc=
efEkwdI0VUUUi8i3M8zdvZGXVNsg6I75VfyU%3D&amp;reserved=3D0, you can either di=
rectly dynamically link (-lvulkan to the compiler) to the loader , or indir=
ectly link (dlopen()) to the loader.  Quoting from the ABI Versioning secti=
on:

"""
On Linux, applications that have a hard dependency on Vulkan should request=
 linking to the unversioned name libvulkan.so in their build system. For ex=
ample by importing the CMake target Vulkan::Vulkan or by using the output o=
f pkg-config --cflags --libs vulkan as compiler flags. As usual for Linux l=
ibraries, the compiler and linker will resolve this to a dependency on the =
correct versioned SONAME, currently libvulkan.so.1. Linux applications that=
 load Vulkan-Loader dynamically at runtime do not benefit from this mechani=
sm, and should instead make sure to pass the versioned name such as libvulk=
an.so.1 to dlopen(), to ensure that they load a compatible version.
"""

Applications which dlopen("libvulkan.so") without a version are broken and =
should be fixed.  The vulkan tools doing exactly what the documentation say=
s not to do is just embarrassing to be honest...

So my position is that we don't mess around with the vulkan-loader recipe, =
but instead fix the callers.

Ross

