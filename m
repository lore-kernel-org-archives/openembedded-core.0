Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E1510A1E7A
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:08:11 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44887.1774523287976362006
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=IYd8IXYj;
 spf=pass (domain: cherry.de, ip: 52.101.83.62, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZnorLd4M9OgIAkgKfLpBf8JB6B2FJnxRu7CrezMtBCDL38mtx7yxR+aru9ImqC5VBG3lG+MhoaQsJOHcoVnTonHIL7cldaV1bP+pN99DmcpKl+qxWmMW9TcjC1L6QBofguAucN39F1xa+EqBsfhVgVBqTBqclspGqRwgbzGNvoL5ylhheqJM1f5GuCCpUuDKIJO30Iaml8jlNKb/bhEkJB33Fsvy3RqQNFUkUVDqTAhmdF9P+hHEaMGQuFIiWTum8znO6cAhyJDa+bSZQCSwuQB8kfWoSrYUPuEXgZrbB/B+K9wsUWQZDBg5NSIIrlJLbo97iejuRN0LvhQ/sEywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDp/2GwkVO+qwvvWmh3qo8qfknhpboJU01llImTUi58=;
 b=nXmTzy/j3CW3Nfhofq6CUkTPoJoDawP3QJMhgQ5CUiRKmc1goy6lEHIhwygJZVpf+FLEr9v8kEjTxkeFImS2ixy9TbGs+NTx7IBd+SfHHhVKmyAkB1fytD62aQY09zaKB/YK6fRnWfGaPmaWTDUZRco9EuUK0KNg6At7RuXwiy8QRYBZnDIEdORInjc/gfZSAHiLLIQgPRseojUiHk0xdh9glvy7+FdkpMDaaEMm1FOAUfVvswq2YC6BfNEqP37uu79kjy1ONtYktsRo1bww1zz8AYNmKSTpcx1tVWs5J5hDVruA27gRikizO89o5VdpwrCT2LCE/JVLYN3i8jsX2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDp/2GwkVO+qwvvWmh3qo8qfknhpboJU01llImTUi58=;
 b=IYd8IXYjngNVMoF/wAn+7CHXDtPkU7kr/ukgxcYTgaXIfibFfYTpaEsusoudTr+oGrgd9vQWZNcn3lK+YzhOH4sTIB2la5ONif1lbTI5TErE2BDZEO4pXuITXCXiarTqGEpSxcLF5yLz5LpaWkPz2xAwTACiPMLENLGvnxw3iTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI2PR04MB10114.eurprd04.prod.outlook.com (2603:10a6:800:22d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Thu, 26 Mar
 2026 11:08:02 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 11:08:01 +0000
Message-ID: <fef710c9-9d1c-4782-9b21-82c69048fca7@cherry.de>
Date: Thu, 26 Mar 2026 12:08:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] mesa-tools-native: Add dependency on
 libdrm-native for panfront tools
To: Khem Raj <raj.khem@gmail.com>
CC: openembedded-core@lists.openembedded.org,
 Changqing Li <changqing.li@windriver.com>
References: <20260325163842.2672762-1-khem.raj@oss.qualcomm.com>
 <6864521c-ea84-48ba-ae36-c23ca6f68232@cherry.de>
 <CAMKF1spHxZZbS1ELTkU0gGRcDvYxe=KSVw0jK7z_6yA=e+Gr+g@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAMKF1spHxZZbS1ELTkU0gGRcDvYxe=KSVw0jK7z_6yA=e+Gr+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0396.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::10) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI2PR04MB10114:EE_
X-MS-Office365-Filtering-Correlation-Id: 07fb4816-bd23-4f16-82a3-08de8b27f240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	JmMvKoljYz0g8isXxd4BoNAtDc1XckYIHmbscw5Lm87gWw/kcJ4q+H+vun7Bh405seVUF8v4xdZXXCEvGyhrIyaOqrnbJ/2RU2QLGHcrd6ZvxIB/ELnoOgUWOrNE80g8zCre+YMtmQC4PBmrAvP9rTx4njfnzEP2cGTGTn3p1REsg2aD1s/gjPl59+sO6Wvx2aPZIOVeEDZyXD4M2MhiJA5efVCtPhCgUknNHqDMe4Z7+BJDrKMCsPJA0b6QBccTBywrPQpAx3nJv4l+3SbbJoWFQUC83rX5SPCwv4Rt+WHcmYbfGBvVlD4aMpNyHcvRSVP25Ljo0R3ApqOlRpGgJvYg8OdaCbkcTZaEgmjujP7t8W01L26a7aK3DfO0U+XB1ueYsLI86hNDUPG/rqfFhpTMCrRzhnq4EHeRya9MMExX/eFZl+yB7zAEP/K4WgeW64titpT0F6nHEH0+vz1+n6iJE6wEKandCxDXIRb/GEvXYR044E8gIQrJyXngj2FlAkhF8bX3gNaH02m5++e7I/mLYmNmdYrxMY9xOvXSUzHcEmdMURxKfAi49dN564NDTN+eqSrXyn0Ifeesp67AGFuL35P4qKuFCu0wiCRhmcQqoBtRpvEj3Qi0jIMhVOsre2yv8SC2GTxd5sDMcSpar9g/cU5NWfgKeq2qZP/A1S8sgjnZRRwT8dumsf7lOGZrtkPKT2Ajgwd6nloEVmRhg7zPQsPr4036T3zypNcrZYw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9DXhXHBuehS8fyZX0x5sAgd0/qbLVUGJUUWWM/SuabGpPD4ZQfpoZQbD9Fov?=
 =?us-ascii?Q?9mKUj/tXQSSdOAmdKiJqr3jy8KEWpCzBNkXyaBjLKFSBDixTdSQ2t4aOhDOw?=
 =?us-ascii?Q?1QJ0sxf33pbWnYjHVTexTGLrGaw7P+q+m7oc+iVe/epywSMtlbQzpq6UDc5B?=
 =?us-ascii?Q?E7RQuJEKpRY7ehMxwt9VNrG9ZId5l8EeQSTT6kWc1Qc+X/Fp2MLXrGZF/DOd?=
 =?us-ascii?Q?NsjKB2bIQBUbWaF/kI/SUms8YYr/bBOxW50cnjt1Z1kViHenr9sc2L0gQkEX?=
 =?us-ascii?Q?t3/EAP0ydkWJlcKNOtwfj+Xx0wMCWDP72INMpZDK5h2/4FKFj7fJpWJULrmX?=
 =?us-ascii?Q?CjWRsWyDCRBP/VLXfiVe0jEt8vT5Qx3fSlbVmHX4JWt7zmWdLhtqV5TJWsrR?=
 =?us-ascii?Q?OwHBto9GnBZPHP1NA+/HvY8/QWQ6ISZm0d6up3GZPIwQNsHGdbzwHooS+ylb?=
 =?us-ascii?Q?D2tO3Wjto+e/hueOZ3hp8d+hxhZxM1fPJg7uW9upxOoZ2YK1NhoidCrDlO1A?=
 =?us-ascii?Q?QXGpdHvbmJf1BnaGqgEVVxE+r9DpDAfz4Ci1L9Kj23VBJkQpxUK8Ge6y2Gfl?=
 =?us-ascii?Q?OpRe+KNNW/TyHpu7VjtccfH8eWNDeX37rJrkpCSTfYOnqwbXIwWjxrHVVfGa?=
 =?us-ascii?Q?8IyRdZKYS7O7/Bv8uIXKf1/k2TVypn7/F/dvvNlG2rDxGARBOMRe/apoBzN5?=
 =?us-ascii?Q?1bkSa7wRKNv/hvVSXpYIyysDED9J2OwFWKW8IGkjEZlUtrdbCHecUeqh78E+?=
 =?us-ascii?Q?P3b/rBAl/z4hTMs7iz8agKv0l03j/RJky6oxzJIkFi+Or64/6TJLF7+SlP0S?=
 =?us-ascii?Q?/EZZFNxB4VDxf43QTchnDpiDb7FrzuS3jNoH6GII45R3g3p5rQREVbucCOVw?=
 =?us-ascii?Q?WUWZeg3He4XX5LKEKp2iioWAyK4F0D9Z/O8/WDjEaANWSyh4b0j3vAXcP7BS?=
 =?us-ascii?Q?Ue+kYlUsYDG44AG+TOxciWQIMUFWFYajID8hpUqEXF5/UKnO2RAKM6zpiTiX?=
 =?us-ascii?Q?gMrMWmzxx1Mnt2AdG7gE6sDAl1R7YbzOZQcIxT8f4F7P4C0EkmqMws2+ATvp?=
 =?us-ascii?Q?hCOwL23MO/O8ThRK21uK6/eUGcSdgXLtJw4tz1qkeP9wavSS1IAIbnM6OMd+?=
 =?us-ascii?Q?prGrul8MbaDFS3RYpvmlTNAtMhkMlVW4Qo7P75/2MI5TWaFJIRPjLIb3fRUF?=
 =?us-ascii?Q?5/V5nPyLf5/vdXaTz8HsTWxtutbBnj1gwi74+UntLXtloh+nB0eiFZvkx9To?=
 =?us-ascii?Q?lcobVbpSJl5QywEeOTQZqKF8DEBzMuanleaA98conUW0Q7YR/jx2f351oZsQ?=
 =?us-ascii?Q?BahQPt8Xo6xT5t77c12COANFm78RHSIspI9co+RdsYgLTF+IC95hWatxjAME?=
 =?us-ascii?Q?Jtcdenihb+W3nPVDa/fEgQ51LiYaGtZLQQFGzTGbiv2UrXAqHWyfPsR/+leD?=
 =?us-ascii?Q?jrj0wyzSFrcAIe1568qC7VrLQFmGZxFy6+SX1lKl4hTZOPh5caQ8cQZ6GRal?=
 =?us-ascii?Q?YiR/zuc79hitRqtjmU9Xa7tM3P5l3VHi2WsYhlV0JBvrNX2VP3E9l392kfsy?=
 =?us-ascii?Q?3Oow2eNf7kgmo8DMd73voSZdq3V3QgGZTOJsgg39mZDip9vuZPLAEQ3+zWRz?=
 =?us-ascii?Q?jybfIZnP4uX1EQJKDjeJVEaKdlsdJDGpwyKQ42jC1i9Q2lFzeld+f+ySjRGU?=
 =?us-ascii?Q?q7igEg8RwJVVz/br5rWo8IRvuiyDxBujdkveZzK2E/YUMdeZX1PNQM5poV8b?=
 =?us-ascii?Q?0ZjUi3+Big=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fb4816-bd23-4f16-82a3-08de8b27f240
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 11:08:01.8631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07cWL1viFBIp/hPvcSuXnZYU8AYOT8L64kQh1pfOY1YtMFoQ+OI5LaUL2chPggJY3/W+XpAdxfa2dhgEBkkWZkFQE8viAt4YIZuWFnYP/qU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233976

Hi Khem,

On 3/26/26 1:36 AM, Khem Raj wrote:
> On Wed, Mar 25, 2026 at 10:00=E2=80=AFAM Quentin Schulz via lists.openemb=
edded.org
> <quentin.schulz=3Dcherry.de@lists.openembedded.org> wrote:
>=20
>> Hi Khem,
>>
>> On 3/25/26 5:38 PM, Khem Raj wrote:
>>> From: Changqing Li <changqing.li@windriver.com>
>>>
>>> Fix do_compile failure:
>>> ../sources/mesa-26.0.1/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal
>> error: xf86drm.h: No such file or directory
>>>
>>
>> Hold on a second. In v1 you patched mesa-tools-native and I based the
>> whole discussion on that but the error message is actually about target
>> mesa? You also said in v1 you're building mesa-gl so the error message
>> is also not related. The commit title also is wrong now as you're
>> changing mesa.inc.
>>
>> What's actually going on. How do I reproduce? Also mesa-26.0.1 may be
>> **before** mesa-tools-native was even introduced.
>>
>> The gallium PACKAGECONFIG should bring this dependency in. If vulkan is
>> selected, libdrm will be a required dependency and it should fail the
>> build if we don't find it and try to build Vulkan panfrost (panvk). I'm
>> suspecting we need to add libdrm to vulkan PACKAGECONFIG but maybe it's
>> not required for *all* drivers (though all vulkan drivers currently in
>> mesa do seem to require it for some shared/static libs so maybe that's
>> fine there).
>>
>> So we would only be missing this dependency for the panfrost (possibly
>> others) tools. Then, this needs to be put in TOOLS_DEPS like I suggested
>> in v1.
>>
>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> Cc: Quentin Schulz <quentin.schulz@cherry.de>
>>> ---
>>>    meta/recipes-graphics/mesa/mesa.inc | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-graphics/mesa/mesa.inc
>> b/meta/recipes-graphics/mesa/mesa.inc
>>> index a95adfc960..ecd3b3780e 100644
>>> --- a/meta/recipes-graphics/mesa/mesa.inc
>>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>>> @@ -111,7 +111,7 @@ PACKAGECONFIG[imagination] =3D
>> "-Dimagination-srv=3Dtrue,-Dimagination-srv=3Dfalse"
>>>    PACKAGECONFIG[intel] =3D ""
>>>    PACKAGECONFIG[lima] =3D ""
>>>    PACKAGECONFIG[nouveau] =3D ""
>>> -PACKAGECONFIG[panfrost] =3D ""
>>> +PACKAGECONFIG[panfrost] =3D ",,libdrm-native"
>>
>> Also, I'm pretty sure it should be libdrm and not libdrm-native, as
>> what's gonna happen when a user requests building the tools for a target
>> package? It needs to be the same architecture as the one you're building
>> for, hence not forced to native.
>>
>=20
> Well my build failure was in mesa-tools-native which is in chain of
> dependencies for mesa-gl/mesa which tries to build panfrost-tools
>=20
> ../sources/mesa-26.0.2/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal error=
:
> xf86drm.h: No such file or directory
>      7 | #include <xf86drm.h>
>        |          ^~~~~~~~~~~
>=20
> mesa is not built for opengl ( no-x11 no-wayland ) case with mali driver =
on
> mesa-gl is used and that builds ok.
>=20

I've been able to reproduce locally and sent a patch for it:

https://lore.kernel.org/openembedded-core/20260326-mesa-libdrm-imagination-=
v1-1-fe018f03be6a@cherry.de/

Thanks!
Cheers,
Quentin

