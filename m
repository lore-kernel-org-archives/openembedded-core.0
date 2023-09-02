Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8B6C83F2C
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 11:58:28 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.6679.1693655902520985000
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 04:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=G4eLXd0G;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=RADkDMsG;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1693655903;
  x=1725191903;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=2lVgSovSqm9U1OXANFzv4NRgVMdC7CQmIBQCu7gojdE=;
  b=G4eLXd0GoDbpg4Fdw4iOPQfbPC98xtc6YIU7KBkmuto0CXDyxU7oHFaM
   4mAhHoB+dZxoWfk9BKWhvPhHAo8PGhxTl5mzEQGg7YEFqd4LYRdOcgIBp
   OKi16OyC/Ma1mdWQAWwM/owE59XqmDIMlT1/fIIhqwK8MGIi0y8YufkfK
   vhiKpMmjtMQZsrrj6VMtaX0MwQBgAD2VYWleV3X9vzDeIQsiu+xbu1axu
   xtMy56Sl9Oq6LSEb4svia9ChBalLGODw2M27V/9H3zlHUTn5F8hxzj1FM
   8iLONZoTulGpo02PHM6YhnozHGiw6mX4jUNKYTHSDRCBBQ5WDkx38dNVC
   Q==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0uQrYaQajAIYpowfrUKYyYDVOSIX+WiDxkRK56g0BsaTmABzkk4Y0fi/U5ZfvyGIjo0wbSm2XK+K4scEvf/PqILCyydrMhhdOiZcbXqGHKeoRGoHknexH1SMh5e3UWwDAgsaEWOAWp1k1tXc3cex2Olcaux1cLtvYso79gqtG1LuCShUWyL5zY0h3eS0og+Cn8SmUAsTMDoeR8jgZKoa3EeI5UCdHq4DUKefcIgz4+DA+i7HslXh9O1KMWTyKu4KrUNIpIiF+hSLnG8Nfl/bwG2OtxtKk+3KChho1FmryBu8hxtizFK00kRqqm6hokTjoJdSsYS8z/Gidj0k5ukVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lVgSovSqm9U1OXANFzv4NRgVMdC7CQmIBQCu7gojdE=;
 b=PpNxtyFS+dMuiKgj38Lkqt9/gVPcRPhNDIkuGqxH8KrBpORUQsVyBWj+RGeMj0kznr5UqvSXTaCRSgs/W0zFYl9YHT1476+3KbKbyonAC+RJyeI1fwNuKoqQgfXmNPYbg8nsxIjMZmKgutawifNXP16p1p4F7nbwC1tkqycyMPsDZASRjhoz7bVPAe0+NtzZvGGldI5UGp/ZeOGq8Js0/TeQKRnFjfP8Gq06aMI1zQmTYkeWJfAfdok82+lA6vfYi2e2xxhGzmyrRriK/U6ItbfJzWCrUjBKUAtqMOZaDvGIcI3ATDvAZStbsIoOFAPlVFUjdmfAp6EH0ys14aD1ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lVgSovSqm9U1OXANFzv4NRgVMdC7CQmIBQCu7gojdE=;
 b=RADkDMsG9XgOMCfSnUsOQ0zykLspARG1awyZJMxspdAGaOrIPtst5TZD3yFqMLr1QZZH3HNGqc049vu6/u4ICdeeNsx6nEhxQ7DjrBPtuuWnI7ZC5RZVMTCB/S6l39/4t2c7/jgWJf+JXm6a2Z24VHi39sNBMZTxepOsq/2Ac7A=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] gcc-runtime: remove bashism
Thread-Topic: [OE-core][PATCH] gcc-runtime: remove bashism
Thread-Index: AQHZxEA/qEbJpViTwE+g/kVEm3AFpbAHfhewgAAghaA=
Date: Sat, 2 Sep 2023 11:58:16 +0000
Message-ID: <AS8PR02MB102015269F08632DCF14D44EEEFEBA@AS8PR02MB10201.eurprd02.prod.outlook.com>
References: <17772E0BB222155E.29484@lists.openembedded.org>
 <AS1PR10MB5697481EF7E00D09EA8B474FFDEBA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697481EF7E00D09EA8B474FFDEBA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=a8de37d9-acf7-4c25-b1e5-844d8ca6cc4e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-09-02T09:53:16Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10201:EE_|PR3PR02MB6028:EE_
x-ms-office365-filtering-correlation-id: 3d52feea-88ab-46d6-fbe8-08dbababe4bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Mxj6hrnIIwFrJbBbSyhe18j8/E9bps7L+dhMUVjPS8vwjiKzP0oq/CIXO3z2q0kP0jTy05QaPBTg/TXnYtEX5MD81ghsOkDsIMdmWgA9J5epGWkCb+H7mT2xlb4hv/gwqwRoQvbXjfeWyBCzlr18QPC5sQKKs6jG6WisJf9hmdL6Wk9APlsDvZoKl9/6zmXhr1XvXsP9B6BMkJXm8F8b70Z0m53li+8lT2yAPS2zo8/34RvkzbiNP4jGHm6Q/ubJI280fw5mUci9HLLfFrw/ZHyKD8I03Th/bOw6qL0aFRDmbYUJk351BWvb27epyyNcWkvXc31vO0eiS3HWNyKQlocEzWbZkdKmUMPQFhFzz5yse9QDxexmarTathHesJjVqDfFcTnU/y2MG0TZgOf5QsKF7ZI85o3BBuqKF/zW+qYq4ce8Tyb6FukTgnFITZ+1zPhCJu9wRvVKkTjXZl8CbsbBPkp3KLjPOb60FKUcN1VWNpymDhXP6Gi//q4CHtdn4J5mvNN+PVggx9g7to4N+5latUpPyy/ECEl7dDQPh5ZOS3ackfaZHdMZLKIaDbaa3c6H9IPcf1a/Gj5vChLyzj+3JseVEpWStaKi4o9v/BhhDqWRWcXOCspEUsa+VHd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB10201.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(136003)(376002)(346002)(186009)(1800799009)(451199024)(41300700001)(71200400001)(7696005)(6506007)(53546011)(478600001)(122000001)(38070700005)(38100700002)(83380400001)(26005)(9686003)(55016003)(76116006)(66946007)(110136005)(2906002)(66556008)(66476007)(66446008)(64756008)(316002)(33656002)(86362001)(5660300002)(52536014)(44832011)(8936002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z7SGVTp8JNZrhWQ0Ua50+0R1rtSjmSkwpGLX6nbBH90L2t+QwwsoQvqh7P/i?=
 =?us-ascii?Q?9cHT275liyd5c18JrdPcvB4jAbmBHPaxQZA2LBAW7rtD52u8WwdbKAsE4QRf?=
 =?us-ascii?Q?8n5hxWk0KFJgGFCk+1d3GWEHtbZbTGhEDehPe2QQwFML23yxNzPucIV+hwDj?=
 =?us-ascii?Q?CAHhMMorzp9YenddYPX4X1bVY6M7ntaaZpK5hEKtIlzFO4+XnphZcAI55I2l?=
 =?us-ascii?Q?u1XQSkeT1EK/AbrFh20ZcUpSHFvwDUJcfeP0BvV9ZnQsPe7Ep6TkJZ/4QKXb?=
 =?us-ascii?Q?T7arcCJbeuJWA3YPr9qw7RChGiQKZoKGqZhp/VZqJJ3UELPQuemYXRGjcJ0H?=
 =?us-ascii?Q?1+EWNXWxaiXZke1zPDy2j+xPPsF4KkGouZhmaPRtCyYBaoDWnIMoC2eBBoGM?=
 =?us-ascii?Q?assClsFllzVIfKnsJ37/6YPVB8XjVJfCCybqXsTFI7qPv9CCiEuYbaCKnE2e?=
 =?us-ascii?Q?ldLGp10yjy8PKn4RVwTMQNQ6PHkMJIArdFj2b5p9orAew7BpEGDXYiC5Yx3G?=
 =?us-ascii?Q?QseI9V1GDUPY6wc2Wcjv571LM3mBYD0awGkmkCiHxw0QZldRj/Y3ZEHaPQ/s?=
 =?us-ascii?Q?CvALn3F0COhg5zHI1v3Ad6SWQCdKmv7gQsembUzqkmbxfWP1StAgLa5p+cfg?=
 =?us-ascii?Q?r6ODzDmOzUgMRtk6EbM8yERelBMb3+rQCLpif2PBZVGmGsynv+5t7gPe0wiw?=
 =?us-ascii?Q?xtlxlyUQsqLDnax9Emy4pvRLabpl6+zX7aFlQI+K2e1/t5ZRRIBwc75ZtZGe?=
 =?us-ascii?Q?JXRMFcBn219bttYMk8I0wNq9NctNblpnwUJYqGZW3WqVdnBzXda2fHla68Ri?=
 =?us-ascii?Q?/K7CM4QV3hdhTqkJiGDv8hCq+lVLBqm+ruohcKyCBnQvzzdiJhOaFw9t5VdS?=
 =?us-ascii?Q?RAjvzQCfumeXhB+ITL+rIWlf7B6YAEqrj2Y5sevYPxVsOfagkQPiVR0xTW9U?=
 =?us-ascii?Q?ew7hj0IhGW5tU7wpnuGlUcbe0XNmLg9GJ/olJTbmGU6Gm1eYMptsXzKlTOQd?=
 =?us-ascii?Q?NXvNIG2JHn6KWGs87qkTZyUykK6eXR9rAUU9Q7zrH8Qw8SE+O2b4HhgqV6Yb?=
 =?us-ascii?Q?OHlTWRSKBtjVae2WXX66d2kVQfurqY2jGQuiKtvwiX5bqkRtr2Qth4k3sBaO?=
 =?us-ascii?Q?ZL2dZiZaZU8s9ZlT4HgfqrwgyLIZQYd6mP5gxz0ocMXMR7Uo/mHNKSDTnpNf?=
 =?us-ascii?Q?YlhmFyaC5zDxxElC/GbVL/bhmcMs/EfLS5cMGVDsAgLcsXPwtXul5YlxrQGY?=
 =?us-ascii?Q?OJ+0oAPPfuUvzSgyIlI2/fBDI3zfvF0nsia9SC9bj5//fKTkM59xH/jxohHl?=
 =?us-ascii?Q?0kO3oBedwb5C68hWUMlt4hNxXeCi2Jf7Hy1pcrYOUvJiT3gty3J8/LAoWs9H?=
 =?us-ascii?Q?dFqJ7//cz3kj/jY8i7lxDM5h3JxSPXJjqykhfwts6ulSKczjR4gYPB0k3mE3?=
 =?us-ascii?Q?y2FBWJoLSe1KytEcojuOcg+b0p8VCuiPAg2S3w+Zh/Ktwh0JCtcRcSUaOryt?=
 =?us-ascii?Q?9UE/GzIYqe59hR26GMDPm+PQ98ebrZfQXHBkD72PmTrHIut3RjIa7fg88O0q?=
 =?us-ascii?Q?uaEVv786JEVcIuT4KgQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10201.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d52feea-88ab-46d6-fbe8-08dbababe4bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2023 11:58:16.8292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WTzS8+/FRcahHciFxrSuL6RpcysOFPU4mQjwU6nebiamXrHO6uydatUNJS1xP9Qy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 11:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187148

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> Sent: den 2 september 2023 11:54
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH] gcc-runtime: remove bashism
>=20
> Gentle ping.
> Thanks.
>=20
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> Sent: Tuesday, August 1, 2023 8:19
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][PATCH] gcc-runtime: remove bashism
>=20
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Debian 12 no longer supports replacing dash with bash as default shell.
> > Therefore to achieve compatibility with Debian 12, all bashisms need to=
 be removed.
> >
> > Shell comparison via =3D=3D gives an error with dash and thus the condi=
tion is always false.
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-d=
evtools/gcc/gcc-runtime.inc
> > index bccc8a5b89..64b6168ba7 100644
> > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > @@ -132,7 +132,7 @@ do_install:append:class-target () {
> >  		ln -s ../${TARGET_SYS}/ext ${D}${includedir}/c++/${BINV}/${TARGET_AR=
CH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/ext
> >  	fi
> >
> > -	if [ "${TARGET_ARCH}" =3D=3D "x86_64" -a "${MULTILIB_VARIANTS}" !=3D =
"" ];then
> > +	if [ "${TARGET_ARCH}" =3D "x86_64" -a "${MULTILIB_VARIANTS}" !=3D ""
> > +];then

Change that to:

	if [ "${TARGET_ARCH}" =3D x86_64 ] && [ "${MULTILIB_VARIANTS}" ]; then

* Static strings without spaces and special characters do not need quotes.
* You want to avoid the -a and -o operators for test.
* Checking that a string has a value does not need the !=3D "".
* There is no reason to break the line.

> >  		ln -sf ../${X86ARCH32}${TARGET_VENDOR}-${TARGET_OS} ${D}${includedir=
}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/32
> >  	fi
> >
> > --
> > 2.30.2

//Peter


