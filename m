Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B140C25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 09:37:40 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.134])
 by mx.groups.io with SMTP id smtpd.web10.17380.1717493853456779163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 02:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=GRGOfE+L;
 spf=pass (domain: cherry.de, ip: 40.107.22.134, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnOUXNNmh1herXqjlrnOX50TmB4S4r2tp3Ryypv7Rw0HgQSxQCmZxcsibKC+dp6VY0EiOPci3aJXFOPBOPwUUl5IfyuEfakhE1ptTKDhcQchVjScjCDRQ02vCJyx81pvPDBEvgFRFrWGnC1wx0iPRtjbckFRvB5LW5aEKVPfGu3pwclCly9NWnXDfFc4oi8we/rySett5c3SoPkJzPAfPllISiczAK3crQdH7EroKkfF30kcQzOhr0vTdaTQvFvublKjPniEQgMCY3EvUlvewBPEayjgCqgK7b/Y0DtBUOLqLWZ4MqNemwHdIySAM7kBVZyKCQuFoorVN0d00djXsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDkKdHBFr37HvpJv8K7a2iyOb+VXQJVmn+TRFfFc9ws=;
 b=MylUlPwtQZ5HW+fopsBpeeHhYQfcOKCaWCYY/jbCipMScPkkich3eAZXPllw4vg2Vfk45mYQLolFrrLwU8EGaISHUfgZCVGqYuFsjjXQNVvClm012BgoaPVxUaq3A5X0XOy3cdj1jbDetMc89oKOF+J/0rulHmX7sMkB/+/NN1HOupNpfdklxTGckSNBA7a/zm5mgX/N1SeV7qwF9HynOelgjsnXtRCAgpcKwHx2+bYT1nI8a0deH5WGZqI/ET/jYGmbNHUUVCMuKnwUu7pPBJbgXNu1CnI8Jlm7w4E6CVipdg0Yqy6lx7l0lJkNcKLlP6Be+6SHal0aaR3Ku+s+NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDkKdHBFr37HvpJv8K7a2iyOb+VXQJVmn+TRFfFc9ws=;
 b=GRGOfE+LGmdvtW0w41920ov55dWfX1/nwsfnYq+iBLMqPr9HVUI7plHPIy3+wGL9hpZjBLQ38Tm68yIi+pPdpzli81NfWi16TrTF68mqcIS+3j0r7tdckuWGuBOr3sux+TNTQ4V1Q+/KaPFDlTZ7CHr2hBPQHU9Pa0a71G7DQZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9)
 by PA1PR04MB10295.eurprd04.prod.outlook.com (2603:10a6:102:447::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 09:37:26 +0000
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af]) by PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 09:37:26 +0000
Message-ID: <beedf05b-3b5e-4468-a6d1-46d7d6734246@cherry.de>
Date: Tue, 4 Jun 2024 11:37:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] mesa: build failure in CI, dependency not found
To: joaomarcos.costa@bootlin.com, openembedded-core@lists.openembedded.org
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <aa532133-c872-4bde-8479-dba12de225c7@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <aa532133-c872-4bde-8479-dba12de225c7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA2P291CA0045.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::19) To PA4PR04MB7982.eurprd04.prod.outlook.com
 (2603:10a6:102:c4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7982:EE_|PA1PR04MB10295:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a21d360-413d-409b-2ea5-08dc8479f203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1tWDY7htc5A3np1WgWGzkhiiVrdbCPhPWvwg/l3xaVofZO1t2XGgc0zivA7i?=
 =?us-ascii?Q?uHplMaqTi7pIlcoPmpUAJCua+Fn7KTWqCnD8CQPbNjD9xgATMQsHeKsfJEs+?=
 =?us-ascii?Q?GCd48KJuhXAewL3S1kEzmBWuNKsfb+SZy/aLL79QcxuukqtVWJQtzepTSecd?=
 =?us-ascii?Q?uMHhOGB/AdZa4tXrEEcmCARsUNhPGL2c9vQHkbRgph6z6vAsy880vjYyrwq9?=
 =?us-ascii?Q?AX2EjlsRm0HHvZXM5TRLxgSM9YzkF0mXs23rkfvorjLDnDdMtr23j48pzn35?=
 =?us-ascii?Q?zNFfHXCNMm2CikRoHsPWolFuBQwWkJs/yqPxV8YwFnCP0bP32D42xrTwqy+V?=
 =?us-ascii?Q?1WVM3WH0QLv90okMAF+VMMgqC07s0Ir/UQYoSjjVr58Da2k5ovoDHD2IGd9C?=
 =?us-ascii?Q?aeCmrGiuQRyZvsKZpnuKuS6g7vSWD0rs/51bY3HpeqhjvuMlEcVK4Hc1BEHz?=
 =?us-ascii?Q?7cbtCPevhP3SpXIghFPxZKvw/tS7UpuTtMXfamoWOUoNynsIOFVbsCQHggR/?=
 =?us-ascii?Q?xFkK4CW9dYFXh1Lt9lKpIAq2MmnyRigJo/pSnoB/ooykpiL0XcWx7F1bt5s0?=
 =?us-ascii?Q?SSYmAu3UY4JtcyxpXcCGKpXPJ6q//rgjGIaiRnDn5WaB2H3TDNp3P1zEn23B?=
 =?us-ascii?Q?rxFEhoidZ5wXKhXYciCiDid8ePvz3zjCJU5+Vtn7AA258rtibkfQWVv1FEO0?=
 =?us-ascii?Q?wrJPbtf1lKZ9Dj25GdVAEDFQPTBsyh6Qy02c+zTorlfYKn7YJOloJHbj5lam?=
 =?us-ascii?Q?GgczpXNp++R3Xr0f0o24QpQxfBJsf2MPuaDAODx23bQhwz0bCuwq9AF6D1EL?=
 =?us-ascii?Q?0B431U4mdAuTI6hXg7VRTjGpm51WXA+JWDXppHvVLRSaBZ/fFgk6YVeqm9+o?=
 =?us-ascii?Q?14BIUhqeRWVOWuZhjhAJ84zrh1ubE5ekVqQ35fJARFE0ofqy9QTc/0tMu2gT?=
 =?us-ascii?Q?fuHBCecg+7W4WcnxG06pmOecxxLV5TA0c9ClEHoNgZyhrcNiBPHq3Gb0QTi1?=
 =?us-ascii?Q?/dMgqeYDivrVEnmGrZcNByYDiSYlP08mvd++BuTknJBpl8CHbGZpFSZTRej5?=
 =?us-ascii?Q?e1e8Dc9fHwabql+ogJEJEdmXR60rKTU1R3xvORpk5PPiWNvh1XO/zfyoCuI0?=
 =?us-ascii?Q?kVVuFJJH2PTgUOvVE4GrQX8qNbGKw1bYia8u2K3Bzdwg5HFvuThEsFdJwm06?=
 =?us-ascii?Q?ZEeg5ofzlo6UV4V0gnEs+wm+95UsVNuSjk0EGrwRf+lprtKAoX8yf/dX6R8?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7982.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ds6CmduC3MMhFqIdAECYRmd8aN/GDZDXiZ2qFD06X04SNB7Cn+GGlARxsUZM?=
 =?us-ascii?Q?F84JFDFJi0MpleNm70HvFUJd1sW5r7F6Xs9d+0mLmJrpRyOFniDI/Sg91FGt?=
 =?us-ascii?Q?RSNGPPWmiwNqBMpjgo8NgWTHrGoBKchCIdYqMa0q6JT9WctgpzmhDehIFztV?=
 =?us-ascii?Q?KHFUXhze48mAObVPQ7DzKPbPcw1TR2ooHb72ik174VsuFipu1Nj9aR/ojfWB?=
 =?us-ascii?Q?lXaHqsg7J+6ZjwqQC7Pq0qqvOxNYByuZBfA88zjCuLVMVDJv9hjrpyBVptNl?=
 =?us-ascii?Q?WhJiqdFM547RtvGMTRmTj5z5IRCTU++1+R0NqYzkVOOI9Auei+Nyso7mGQGo?=
 =?us-ascii?Q?D1Ld3Dv7Wp+4fLBFR0O4r02jyd3wngQ+VTYCO85a8il1DE+SjtiTSaN2Q6AA?=
 =?us-ascii?Q?JQU/ENBS1BuyR/FPTpeXWCUrw3POC6+oj33Bu7oi9t1eLImee0OKBQYZZOrY?=
 =?us-ascii?Q?tHRQHSyCnSvDE7TZLrajPL1sTHtv3IzHW6wjzTE/Aa8nqx3NzRUIjYkX//MS?=
 =?us-ascii?Q?pVZ2d6+47ki0uBIq5ln4nFBL3zFrUQT+ArfKdjtdsnDEi/5rG8iVDk3qPhoc?=
 =?us-ascii?Q?RDURtzZQOqHU+BuR+TYY3NOXN6wtL5xkSP7D8o/0Rn4glTfRWF2Fly4/4ruy?=
 =?us-ascii?Q?K389bM01mAqlZuqeowEZrmW/F4ECjhJnN954oRR34Vc2hSaborEHwYscN7Sq?=
 =?us-ascii?Q?qsR85YIhKPTT6Cq8QyOlSMlrM2AsIvqb2E9yRiRLGC10hB0I0/fVKWekzf0f?=
 =?us-ascii?Q?EvDqIO57reqQSRQWcLKE09pHiYNlBhc9QwwDja9fsOQrZLoFva0470f6XnAj?=
 =?us-ascii?Q?5982KZeJ3lrc/sncFnPXJ4IRrQSQKZMAAjXZqG+M2VF1f8sV0SakRIReHKYo?=
 =?us-ascii?Q?jPiNwkLmiWRZXUUXpCVFmtzalXyhYPrmlPkgKKAvB/cMc5Ou2uuTesLFq7TG?=
 =?us-ascii?Q?D+p9b5VP6fuHflk9q0+IalJzWQG7UeEs7V2P4YbmtWlhz4q6uJAkeHkac/s1?=
 =?us-ascii?Q?vaiwiag1ro9xykPG3i1p1/O8L1TRdRO23VveLuVSRdWllEZj0m8q/vjePQJ9?=
 =?us-ascii?Q?Zzz8pH833yJQpYlDTAtHEVZgM6St8QOX7WDj2Lsunll1EMXpXM8yp51RPCJT?=
 =?us-ascii?Q?+bHBSbdGE9DEQM/Wcqi8Ws7CIOpT3QhHFQILl5rGWMh7+g5cDnyUfgKUG3Fr?=
 =?us-ascii?Q?rru1CH9W9q4W+ZzAl3TOSjsEzXVFhbKK9CB4EO9R03ATw00U+j6q3St74hB2?=
 =?us-ascii?Q?klraNbgh6lHWPXjYcC9Sna0UDZaUDQBt133AGt9m4b11DUYGD5fcxZGEPHNU?=
 =?us-ascii?Q?MIdAiiPA2zxK7fyWuYgvNz+lIc4IKX+jGicJ2pARHigXLNrw2oGJxm6ktEk9?=
 =?us-ascii?Q?z9ugO6eaSVdi4bo5zOvcbfaZFqtuqJEbUza+z225k6a3JukS3D1CG5+Wi6eH?=
 =?us-ascii?Q?D8k84RrZ5D6s2/gnR5ctUL/7S87AiMA0C3sz7lsWUz0kRzyTUtDopBuDLXm8?=
 =?us-ascii?Q?c93Wv6Sv8nSns5l04eKnHmx49zxmUVmg+OoIf879EyT0ioFifhjmVUMukD+n?=
 =?us-ascii?Q?AHctDGGeMNuDtCFcIEmW+PPK7w4Fq9Uzj+la0vy5ATVDhi5gbX5a6J3AUCsj?=
 =?us-ascii?Q?vQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a21d360-413d-409b-2ea5-08dc8479f203
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7982.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 09:37:26.8086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HaHlDwCLWusqvo+KakA039GR3lhUYasqDWUlwTrwVGkEV3+VHH7hcK2ZBaQ1ZCg+OWUAL+TlhC8I1mdzYQ8+JhUuPXrmyZJAiMAgQid8AZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 09:37:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200321

Hi Joao,

On 6/3/24 5:39 PM, Joao Marcos Costa via lists.openembedded.org wrote:
> Hello,
>=20
> The following error was raised in Swat's CI:
>=20
> | Run-time dependency libclc found: NO (tried pkgconfig)
> |
> | ../mesa-24.1.0/meson.build:852:12: ERROR: Dependency "libclc" not=20
> found, tried pkgconfig
> |
> | A full log can be found at=20
> /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-=
64-poky-linux/mesa/24.1.0/build/meson-logs/meson-log.txt
> | ERROR: meson failed
> | WARNING:=20
> /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-=
64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874:171 exit 1 from 'exit=
 1'
> | WARNING: Backtrace (BB generated script):
> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log,=20
> /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-=
64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874, line 171
> | =C2=A0=C2=A0=C2=A0 #2: meson_do_configure,=20
> /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-=
64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874, line 160
> | =C2=A0=C2=A0=C2=A0 #3: do_configure,=20
> /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-=
64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874, line 149
> | =C2=A0=C2=A0=C2=A0 #4: main,=20
> /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-=
64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874, line 184
> NOTE: recipe mesa-2_24.1.0-r0: task do_configure: Failed
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6680/st=
eps/12/logs/stdio
>=20
> Mesa was upgraded a few days ago. Could it be related to this error?
>=20

Likely yes, can you provide some info on how I can reproduce this=20
locally so I don't have to hunt this?

Maybe you also have access to the full log somewhere?

Cheers,
Quentin

