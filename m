Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5923CEB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 07:39:35 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.41])
 by mx.groups.io with SMTP id smtpd.web11.3231.1689579574223361533
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 00:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "windows-1250";
 spf=pass (domain: welotec.com, ip: 40.107.104.41, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7agurIBLl2jsjh4llHHZbEqimwj9zr/7+HD7Y7JKPCl/H6dLxThsx17CK4iYquJbCKw4sYigplmcudMcgUx1m6tuEnxzRpvWX0I9WDHMsXWSEkWVuhilhIDPVAV7lF1/YM/aiWF6+udrop1F3PHdIux4y5BepGkHAnz/ml5/EzQnhU/vvLPL/NFpSd3cF42g44UWrbNUFjcftQlRpO133n8uNzJt2ncdEJiH4sLsrdLxufnXRHF1fFHCgtCGvp5ho1RU5d4BJWoJIx6K5G6XRFYVav+r6Bd4BcQktrMBi/cp4aCQoHsrbP6SyvDg/IG1ua+2bAS4bp5R07lLd8mTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHmPBxwAfo634/0Wr4zxNfX16dDvpKqGxkn7zBhzZYI=;
 b=Vnfg0HeU5XkO8o3FbS9wdq9M/lzc/imQ5OOhISQxpo1BRnycfx4a5mGf7a5r6g1aCHQUk4JlXH81YAT7IGi+w/iAQJi7DuUwQi+BVEVzX1Ieok7LHZpSJtslso3ARlZIl5MzjwWXwvc3F950+SCccPAw0yJHdoE9RC3Dp1fm9rH0StwNroxhNWx6rmXqmG0MoevWPJ972l3NqJYiLu0nEIi2V1bwZB3v33JQsIzq4f/urEWnR7q9NcDx2SiACyOWpRH8LguuNdiqiO3+hx3yVcsvaehlRHVTEmRKXu9KaBJ1kV9iOx8ojSZ3rwHdWxcvOZrSALk3Q6VJPgwRonV/Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHmPBxwAfo634/0Wr4zxNfX16dDvpKqGxkn7zBhzZYI=;
 b=abB34kaLT0y7A2rDegHPruTdO/UMSJNvWHQzE4rVTPoG0H1VmoFkwE+q+AJvhvlGSi4D0+vAKp5bEDBWWQc1lgLsYQF3FLVGgckuI62C+l7iDct40mGKVvXklS/dq9kbOxjukdq9k0gW1iR3goHMQ07O3gAnN0muiFOKBoRdPa4=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DBBPR04MB7563.eurprd04.prod.outlook.com (2603:10a6:10:206::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 07:39:29 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::59fb:77a5:f72e:d4fc]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::59fb:77a5:f72e:d4fc%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 07:39:28 +0000
From: =?windows-1250?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?windows-1250?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
CC: Alex Stewart <alex.stewart@ni.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZuGykNn9a7NUqXUq7tnxBdTqzWK+9kj6B
Date: Mon, 17 Jul 2023 07:39:28 +0000
Message-ID: 
 <VI1PR04MB5373976F878F2C77C2BFB4A4913BA@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230712190428.379909-1-p.lobacz@welotec.com>
 <0cce368f-36b7-672e-df83-94b4914a1344@ni.com>
 <VI1PR04MB5373A7CF0029527D7AA884689134A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <20230716213857fea03b3e@mail.local>
 <17728F63D7D8F798.22245@lists.openembedded.org>
In-Reply-To: <17728F63D7D8F798.22245@lists.openembedded.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|DBBPR04MB7563:EE_
x-ms-office365-filtering-correlation-id: 9a41adda-3bcc-447e-e741-08db8698f3dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yErTsLCcdti9bPloHX9lmNNr2w2L04ql3p5WmvV6bPXO6OeGWvBWUmPs7G0VtxK/Wu6dBM9XKjXZ0AEURgmS48hZVy4ijZd9N0rVdox0+x/THr9g93Pv5E5Bd1vjpUkq+obfOydVxnXSPjBqMA6hv7hZI6GZ3nAn1OqxjOyRv3OIiwqgu4S2GxZaVAJ/8cU/GCXfI3FiXpVi7DVyDLYifNXiZki2g3wuFcfGFW/s3jDq6W2ENSom7wygTcyt0igArwVdMdy9q/MuA1ZAesjA7HY81gxmLqa2vNxn4SjXt/4Id9DXT/ZyW8ENdbt+Lo1OYe4PTb7ucTKQlSA8nM2yZAMmS3qt2KCGKdbD/FQW5VrixJsVlwmEE5e9enNR91rHS8qab2fS48dxGYLBpFOXiWBIPm4Ky8udm3a+Ad62l87DD3rX6sipeysf/iNpIEIcdVy3zJlvGTT9+dDk52AQvYvnYrXhc8HGjF9P9YZEtK3BKAqPpe2DziipE42gPXEkOOypcpSy2Fi8peRUmNCTaM8I7974QY+HxXt6ZPLjL4T8a8PXDsaDaiIfs5usTWcmi+ZH3RBZ3PbpI1EP1IU0vKkmrARwcavjtfXjw2yVjb4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39830400003)(396003)(366004)(136003)(346002)(376002)(451199021)(478600001)(45080400002)(71200400001)(7696005)(91956017)(110136005)(54906003)(186003)(53546011)(6506007)(966005)(26005)(9686003)(316002)(76116006)(2906002)(30864003)(41300700001)(64756008)(52536014)(4326008)(66556008)(66946007)(66476007)(66446008)(5660300002)(8676002)(8936002)(38100700002)(122000001)(166002)(86362001)(38070700005)(66574015)(83380400001)(55016003)(33656002)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1250?Q?g7WQkIkRYQLjQXgkFeyB7zl3buSgN897ACYHDYhTzE6g8t2vzcoAqPOp?=
 =?windows-1250?Q?5f82b9mFqMORAudLGhoUGXI/VVKoPhnYuDxGz3rW+hJ5xUgh0mgNW5hg?=
 =?windows-1250?Q?2cRuDZg/02Ur+r0b0LTZGHvOJSLSyf9onwM+X0+vrtUtX8K6Sehxms4X?=
 =?windows-1250?Q?ePiPqbya6KOYpYauZaHW0AGovlBRB2lKkPbSOnk0tK67auEQyZF5xTCo?=
 =?windows-1250?Q?7+DrmqnogXmOrbhHUR+C+ftTfzNB0ks+HOvYmA5CVerCh1RCm66pBU7J?=
 =?windows-1250?Q?9AFep67Fcdluk9w88NuQVwmBioC2gn7nGrZuDy8Ll5XsB3/AMWpvqCdN?=
 =?windows-1250?Q?AbkZRJWUHwOtUHBGNZFd/JLhRf2MFjLOmG+CrfCWVZqM4bEmvSJ0A2D8?=
 =?windows-1250?Q?PHNXlo042QpDMqzoU2jEnYSsGjxUnSuSOk1zCwbhOdqLSryqU8cyLtC6?=
 =?windows-1250?Q?rmtL7OC0fOWrtZdQcXwYnT7VsCv9DW85Obpjz8w+TqoQ6cY7Jd0jgHWq?=
 =?windows-1250?Q?Xtc4nD7O1DILpVMFzsiZch1Ot7WUeDEToD9LVtXfglZLkvnb+BCgap8O?=
 =?windows-1250?Q?YvRvonY6Y1uxGBs60IDSKBzgBuEB3rYEuG3hjdrF4C73ward9c6bDNGe?=
 =?windows-1250?Q?Uh1+dgpIIisKHW08S67Xs+iCRkZw2daZgX1KuromIQNZHOxSsC0xGKEY?=
 =?windows-1250?Q?wNVIBo34eLH0KKZpe57ZMbpsAa6eFCq5niR+7kubWguAW/9qyVPL36b6?=
 =?windows-1250?Q?OUUO5Vr0y6z0Rl4R+Kftsnsjpwzbh17BrSTuXQRmS5J/FiZaWVR3Zv02?=
 =?windows-1250?Q?VmzCC/TjOkyQ3gnQCGbssZrZUAVC0ISX+F5sovfTCX4jpYTi/LgNM8E2?=
 =?windows-1250?Q?QJOpJVuATePQpnFMup/jaUCTz/i7naSnQgP4s7Fn31Mr0Dyr6ZzkS4TX?=
 =?windows-1250?Q?A+oj2h3madSfnnqMmvouTkVTq+6l8kVGhtvl7t47dzYGN9pSNMKv8bIx?=
 =?windows-1250?Q?/RcxQaafZ1EdXk5irwGYuR+J8G03KBN4gtPvwTxfonJAocv0p89DBNCd?=
 =?windows-1250?Q?TcmsNjfgD+E26d+fllALndmAdhVx2tnPuOyBvh+24dFD/4+6nwaUZ7Fi?=
 =?windows-1250?Q?PasOxlsLX12v+4MdC00EL6xPzNBIvWSx/T6vccqXiokak0HDw8CnpLMv?=
 =?windows-1250?Q?XjQG0gKJXJ05hGGhEP43+tbe1n0x9J4OxyRglFJBa0W6lMnANlvjM8f0?=
 =?windows-1250?Q?U383EMGhKSF1JaZ6VKJwC1oBwkpuo9/EelT0rz5MSQg8AcHkSkJX83rR?=
 =?windows-1250?Q?u/2Ht2SO/ZOIWeF6aVcUG1jnMLhq02o1eWZEfR22Sg4ND/QKuwlAo5VL?=
 =?windows-1250?Q?Pmx2enza2brTF+Ctz5q9XJP738jZIt0+eXbQxSUwppltiA78CLd5iHEP?=
 =?windows-1250?Q?qzfYTl0GJEMdkvl5YSL5RUoDZXBhV+HwfhepYGfvhcW5H9GT/QnGIy55?=
 =?windows-1250?Q?5KsYfFWmEcXKMem/KnMGCN6Tc0o1tm+OZWt4+EvR/gJMM9NbqETed77d?=
 =?windows-1250?Q?pYUA8G0A9Qu7gATicwH/wDY5QBXxhql6rcONi3alcsCevdETYcML1RYB?=
 =?windows-1250?Q?nN9qDHuek+4EdLD3C6s8jTKB0a/kXp00bkSfJOdI1/dDsouJa0/w2eCt?=
 =?windows-1250?Q?rRIu1CHDu3s=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373976F878F2C77C2BFB4A4913BAVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a41adda-3bcc-447e-e741-08db8698f3dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2023 07:39:28.7290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z88m785UQQP65iFgV+CnMab2xwUFAwDAp8L2BGb/YzQ5d8lYD6Z+3WrhvTry8g1izpEWUEkCHusrLylnvHKGjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7563
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 07:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184433

--_000_VI1PR04MB5373976F878F2C77C2BFB4A4913BAVI1PR04MB5373eurp_
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

Alex,
from what I'm seeing the issue touches opkg-build command:

opkg-build -Z xz -a "--memlimit=3D5% --threads=3D8" "" "" nativesdk-xcb-pro=
to-dbg /home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686=
-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/deploy-ipks/i686-nat=
ivesdk' returned non-zero exit status 1.

which causes you an error. This may happen with bad tar hosttools command. =
Can you please post me which version is on yocto autobuilder?

BR
Piotr
________________________________
Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org> w imieniu u=BFytkownika Piotr =A3obacz via lists.openembedded.=
org <p.lobacz=3Dwelotec.com@lists.openembedded.org>
Wys=B3ane: poniedzia=B3ek, 17 lipca 2023 07:07
Do: Alexandre Belloni <alexandre.belloni@bootlin.com>
DW: Alex Stewart <alex.stewart@ni.com>; openembedded-core@lists.openembedde=
d.org <openembedded-core@lists.openembedded.org>
Temat: Re: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro n=
ative features support

Ok, this is odd. Can you tell me how can I reproduce this, step by step on =
my local machine? Because I have to admit that it is not happening for me=
=85

BR
Piotr

Wysy=B3ane z aplikacji Outlook dla systemu iOS<https://aka.ms/o0ukef>
________________________________
Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
Wys=B3ane: Sunday, July 16, 2023 11:38:57 PM
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: Alex Stewart <alex.stewart@ni.com>; openembedded-core@lists.openembedde=
d.org <openembedded-core@lists.openembedded.org>
Temat: Re: ODP: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr dis=
tro native features support

Hello,

On 14/07/2023 10:14:50+0000, Piotr =A3obacz wrote:
> OK so, does any one have any thoughts regarding this patchset?

This still fails on the autobuilder, most of the builds failed:

https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F37%2Fbuilds%2F7477%2Fste=
ps%2F11%2Flogs%2Fstdio&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C10c1276b3f=
d543cc67b708db8645103e%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C6382514=
03412289373%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DzXRK85lPPyJLxmXEhO%2Bgn=
fIiGFrOgxG5caBoqkHILO8%3D&reserved=3D0<https://autobuilder.yoctoproject.org=
/typhoon/#/builders/37/builds/7477/steps/11/logs/stdio>

ERROR: nativesdk-xcb-proto-1.15.2-r0 do_package_write_ipk: Fatal errors occ=
urred in subprocesses:
Command 'PATH=3D"/home/pokybuild/yocto-worker/genericx86-64/build/scripts/n=
ativesdk-intercept:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/gen=
ericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-=
proto/1.15.2-r0/recipe-sysroot-native/usr/bin/python3-native:/home/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-li=
nux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/chrpath-nat=
ive:/home/pokybuild/yocto-worker/genericx86-64/build/scripts:/home/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-li=
nux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/i686-pokysd=
k-linux:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i68=
6-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot/usr/=
local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/usr/bin/crosss=
cripts:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686=
-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-nativ=
e/usr/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/=
i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-n=
ative/usr/bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wo=
rk/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroo=
t-native/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wo=
rk/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroo=
t-native/bin:/home/pokybuild/yocto-worker/genericx86-64/build/bitbake/bin:/=
home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/hosttools" opkg-b=
uild -Z xz -a "--memlimit=3D5% --threads=3D8" "" "" nativesdk-python-xcbgen=
 /home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativ=
esdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/deploy-ipks/i686-nativesdk=
' returned non-zero exit status 1.
Subprocess output:Usage: /home/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/re=
cipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] =
[-a compressor_args] [-O] [-o owner] [-g group] <pkg_directory> [<destinati=
on_directory>]
Command 'PATH=3D"/home/pokybuild/yocto-worker/genericx86-64/build/scripts/n=
ativesdk-intercept:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/gen=
ericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-=
proto/1.15.2-r0/recipe-sysroot-native/usr/bin/python3-native:/home/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-li=
nux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/chrpath-nat=
ive:/home/pokybuild/yocto-worker/genericx86-64/build/scripts:/home/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-li=
nux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/i686-pokysd=
k-linux:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i68=
6-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot/usr/=
local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/usr/bin/crosss=
cripts:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686=
-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-nativ=
e/usr/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/=
i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-n=
ative/usr/bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wo=
rk/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroo=
t-native/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wo=
rk/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroo=
t-native/bin:/home/pokybuild/yocto-worker/genericx86-64/build/bitbake/bin:/=
home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/hosttools" opkg-b=
uild -Z xz -a "--memlimit=3D5% --threads=3D8" "" "" nativesdk-xcb-proto-dev=
 /home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativ=
esdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/deploy-ipks/i686-nativesdk=
' returned non-zero exit status 1.
Subprocess output:Usage: /home/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/re=
cipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] =
[-a compressor_args] [-O] [-o owner] [-g group] <pkg_directory> [<destinati=
on_directory>]
Command 'PATH=3D"/home/pokybuild/yocto-worker/genericx86-64/build/scripts/n=
ativesdk-intercept:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/gen=
ericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-=
proto/1.15.2-r0/recipe-sysroot-native/usr/bin/python3-native:/home/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-li=
nux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/chrpath-nat=
ive:/home/pokybuild/yocto-worker/genericx86-64/build/scripts:/home/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-li=
nux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/i686-pokysd=
k-linux:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i68=
6-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot/usr/=
local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/usr/bin/crosss=
cripts:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686=
-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-nativ=
e/usr/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/=
i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-n=
ative/usr/bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wo=
rk/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroo=
t-native/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wo=
rk/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroo=
t-native/bin:/home/pokybuild/yocto-worker/genericx86-64/build/bitbake/bin:/=
home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/hosttools" opkg-b=
uild -Z xz -a "--memlimit=3D5% --threads=3D8" "" "" nativesdk-xcb-proto-dbg=
 /home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativ=
esdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/deploy-ipks/i686-nativesdk=
' returned non-zero exit status 1.
Subprocess output:Usage: /home/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/re=
cipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] =
[-a compressor_args] [-O] [-o owner] [-g group] <pkg_directory> [<destinati=
on_directory>]


> ________________________________
> Od: Alex Stewart <alex.stewart@ni.com>
> Wys=B3ane: czwartek, 13 lipca 2023 00:04
> Do: Piotr =A3obacz <p.lobacz@welotec.com>; openembedded-core@lists.openem=
bedded.org <openembedded-core@lists.openembedded.org>
> Temat: Re: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro=
 native features support
>
> ACK this patchset, assuming the other maintainers are happy with how
> we're handling the DISTO_FEATURES.
>
> I chose not to include Piotr's opkg and opkg-utils ACL/xattr changes
> into the 0.6.2 release, which I have just pushed. They've been merged
> afterward, and can still be applied atop 0.6.2, and they'll be merged
> into the December opkg release.
>
> I have a branch ready to upgrade the opkg and opkg-utils recipes, but
> I'd like to wait for this patchset to clear, because they will otherwise
> conflict.
>
> On 7/12/23 15:04, Piotr =A3obacz via lists.openembedded.org wrote:
> > Include support for ACLs and extended file attributes for native
> > builds, by default.
> >
> > Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> > ---
> >   meta/conf/bitbake.conf | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 9625a6fef4..8daaaad615 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
> >
> >   # Native distro features (will always be used for -native, even if th=
ey
> >   # are not enabled for target)
> > -DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
> > +DISTRO_FEATURES_NATIVE ?=3D "acl x11 ipv6 xattr"
> >   DISTRO_FEATURES_NATIVESDK ?=3D "x11"
> >
> >   # Normally target distro features will not be applied to native build=
s:
> >
> >
> >
>
> --
> Alex Stewart
> Software Engineer - NI Real-Time OS
> NI (National Instruments)
>
> alex.stewart@ni.com
>

>
>
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C10c1276b3fd543cc67b708db8=
645103e%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638251403412289373%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DhuIDJ67qcpI8vUTiPCmD1OkeGYNCfqnbjtJxHx=
eULg4%3D&reserved=3D0<https://bootlin.com/>

--_000_VI1PR04MB5373976F878F2C77C2BFB4A4913BAVI1PR04MB5373eurp_
Content-Type: text/html; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
250">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Alex,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
from what I'm seeing the issue touches opkg-build command:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<font size=3D"2"><span style=3D"font-size:11pt" class=3D"ContentPasted0">op=
kg-build -Z xz -a &quot;--memlimit=3D5% --threads=3D8&quot; &quot;&quot; &q=
uot;&quot; nativesdk-xcb-proto-dbg /home/pokybuild/yocto-worker/genericx86-=
64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.=
15.2-r0/deploy-ipks/i686-nativesdk'
 returned non-zero exit status 1.</span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<font size=3D"2"><span style=3D"font-size:11pt" class=3D"ContentPasted0"><b=
r>
</span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<font size=3D"2"><span style=3D"font-size:11pt" class=3D"ContentPasted0">wh=
ich causes you an error. This may happen with bad tar hosttools command. Ca=
n you please post me which version is on yocto autobuilder?</span></font></=
div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<font size=3D"2"><span style=3D"font-size:11pt" class=3D"ContentPasted0"><b=
r>
</span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<font size=3D"2"><span style=3D"font-size:11pt" class=3D"ContentPasted0">BR=
</span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<font size=3D"2"><span style=3D"font-size:11pt" class=3D"ContentPasted0">Pi=
otr<br>
</span></font></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> openembedded-core@lists=
.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; w imieni=
u u=BFytkownika Piotr =A3obacz via lists.openembedded.org
 &lt;p.lobacz=3Dwelotec.com@lists.openembedded.org&gt;<br>
<b>Wys=B3ane:</b> poniedzia=B3ek, 17 lipca 2023 07:07<br>
<b>Do:</b> Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt;<br>
<b>DW:</b> Alex Stewart &lt;alex.stewart@ni.com&gt;; openembedded-core@list=
s.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr d=
istro native features support</font>
<div>&nbsp;</div>
</div>
<div>
<div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">Ok, this is odd. Can you tell me how can I reproduce this,=
 step by step on my local machine? Because I have to admit that it is not h=
appening for me=85</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">BR</div>
<div dir=3D"ltr">Piotr</div>
</div>
</div>
<div id=3D"x_ms-outlook-mobile-signature">
<div><br>
</div>
Wysy=B3ane z aplikacji <a href=3D"https://aka.ms/o0ukef" originalsrc=3D"htt=
ps://aka.ms/o0ukef" shash=3D"s8xeSKxJmtVMcs4ifeEkw+sIC0ZG/Bs6qL4Y4jWufGtZZE=
LNlqdWcy4htW98+PpFTxGBNIDzZ5IhnuKjDsE5pjKoIlAd6XsuM1wLdsVLkeW3IQI789fO8j4zV=
15IFnLtljPgdk6KZ7+u/iGmGGhuPrs8/1Zd2xGWRHxNsfF9AJI=3D">
Outlook dla systemu iOS</a></div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>Od:</b> Alexandre Belloni &lt=
;alexandre.belloni@bootlin.com&gt;<br>
<b>Wys=B3ane:</b> Sunday, July 16, 2023 11:38:57 PM<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> Alex Stewart &lt;alex.stewart@ni.com&gt;; openembedded-core@list=
s.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Temat:</b> Re: ODP: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xa=
ttr distro native features support</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Hello,<br>
<br>
On 14/07/2023 10:14:50+0000, Piotr =A3obacz wrote:<br>
&gt; OK so, does any one have any thoughts regarding this patchset?<br>
<br>
This still fails on the autobuilder, most of the builds failed:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/37/build=
s/7477/steps/11/logs/stdio" originalsrc=3D"https://autobuilder.yoctoproject=
.org/typhoon/#/builders/37/builds/7477/steps/11/logs/stdio" shash=3D"N4LszY=
EJGcW7XGzQ0HolFjPY2487hSAGtWCI9+xLJ8MwwHcWopUx0hxVCmrHCg9sT94cJW2UB0DJXl3Po=
1en9PUVuRz0etP2xo2jqupBIN03MIUl+Nf7SeiLm3Pay843cBCFGtWDYnLUfHE53vKGf/flgPY6=
n24k+KesC5eSuk4=3D">https://eur04.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F37%2=
Fbuilds%2F7477%2Fsteps%2F11%2Flogs%2Fstdio&amp;data=3D05%7C01%7Cp.lobacz%40=
welotec.com%7C10c1276b3fd543cc67b708db8645103e%7C25111a7f1d5a4c51a4ca7f8e44=
011b39%7C0%7C0%7C638251403412289373%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sda=
ta=3DzXRK85lPPyJLxmXEhO%2BgnfIiGFrOgxG5caBoqkHILO8%3D&amp;reserved=3D0</a><=
br>
<br>
ERROR: nativesdk-xcb-proto-1.15.2-r0 do_package_write_ipk: Fatal errors occ=
urred in subprocesses:<br>
Command 'PATH=3D&quot;/home/pokybuild/yocto-worker/genericx86-64/build/scri=
pts/nativesdk-intercept:/home/pokybuild/yocto-worker/genericx86-64/build/bu=
ild/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worke=
r/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk=
-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/python3-native:/home/pok=
ybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokys=
dk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/chrpat=
h-native:/home/pokybuild/yocto-worker/genericx86-64/build/scripts:/home/pok=
ybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokys=
dk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/i686-p=
okysdk-linux:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wor=
k/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot=
/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/usr/bin/c=
rossscripts:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work=
/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-=
native/usr/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/=
work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysr=
oot-native/usr/bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-s=
ysroot-native/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-s=
ysroot-native/bin:/home/pokybuild/yocto-worker/genericx86-64/build/bitbake/=
bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/hosttools&qu=
ot;
 opkg-build -Z xz -a &quot;--memlimit=3D5% --threads=3D8&quot; &quot;&quot;=
 &quot;&quot; nativesdk-python-xcbgen /home/pokybuild/yocto-worker/genericx=
86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto=
/1.15.2-r0/deploy-ipks/i686-nativesdk' returned non-zero exit status
 1.<br>
Subprocess output:Usage: /home/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/re=
cipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] =
[-a compressor_args] [-O] [-o owner]
 [-g group] &lt;pkg_directory&gt; [&lt;destination_directory&gt;]<br>
Command 'PATH=3D&quot;/home/pokybuild/yocto-worker/genericx86-64/build/scri=
pts/nativesdk-intercept:/home/pokybuild/yocto-worker/genericx86-64/build/bu=
ild/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worke=
r/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk=
-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/python3-native:/home/pok=
ybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokys=
dk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/chrpat=
h-native:/home/pokybuild/yocto-worker/genericx86-64/build/scripts:/home/pok=
ybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokys=
dk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/i686-p=
okysdk-linux:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wor=
k/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot=
/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/usr/bin/c=
rossscripts:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work=
/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-=
native/usr/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/=
work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysr=
oot-native/usr/bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-s=
ysroot-native/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-s=
ysroot-native/bin:/home/pokybuild/yocto-worker/genericx86-64/build/bitbake/=
bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/hosttools&qu=
ot;
 opkg-build -Z xz -a &quot;--memlimit=3D5% --threads=3D8&quot; &quot;&quot;=
 &quot;&quot; nativesdk-xcb-proto-dev /home/pokybuild/yocto-worker/genericx=
86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto=
/1.15.2-r0/deploy-ipks/i686-nativesdk' returned non-zero exit status
 1.<br>
Subprocess output:Usage: /home/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/re=
cipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] =
[-a compressor_args] [-O] [-o owner]
 [-g group] &lt;pkg_directory&gt; [&lt;destination_directory&gt;]<br>
Command 'PATH=3D&quot;/home/pokybuild/yocto-worker/genericx86-64/build/scri=
pts/nativesdk-intercept:/home/pokybuild/yocto-worker/genericx86-64/build/bu=
ild/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worke=
r/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk=
-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/python3-native:/home/pok=
ybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokys=
dk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/chrpat=
h-native:/home/pokybuild/yocto-worker/genericx86-64/build/scripts:/home/pok=
ybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokys=
dk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/i686-p=
okysdk-linux:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wor=
k/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot=
/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/usr/bin/c=
rossscripts:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work=
/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-=
native/usr/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/=
work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysr=
oot-native/usr/bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-s=
ysroot-native/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-s=
ysroot-native/bin:/home/pokybuild/yocto-worker/genericx86-64/build/bitbake/=
bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/hosttools&qu=
ot;
 opkg-build -Z xz -a &quot;--memlimit=3D5% --threads=3D8&quot; &quot;&quot;=
 &quot;&quot; nativesdk-xcb-proto-dbg /home/pokybuild/yocto-worker/genericx=
86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto=
/1.15.2-r0/deploy-ipks/i686-nativesdk' returned non-zero exit status
 1.<br>
Subprocess output:Usage: /home/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/re=
cipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] =
[-a compressor_args] [-O] [-o owner]
 [-g group] &lt;pkg_directory&gt; [&lt;destination_directory&gt;]<br>
<br>
<br>
&gt; ________________________________<br>
&gt; Od: Alex Stewart &lt;alex.stewart@ni.com&gt;<br>
&gt; Wys=B3ane: czwartek, 13 lipca 2023 00:04<br>
&gt; Do: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;; openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
&gt; Temat: Re: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr dis=
tro native features support<br>
&gt; <br>
&gt; ACK this patchset, assuming the other maintainers are happy with how<b=
r>
&gt; we're handling the DISTO_FEATURES.<br>
&gt; <br>
&gt; I chose not to include Piotr's opkg and opkg-utils ACL/xattr changes<b=
r>
&gt; into the 0.6.2 release, which I have just pushed. They've been merged<=
br>
&gt; afterward, and can still be applied atop 0.6.2, and they'll be merged<=
br>
&gt; into the December opkg release.<br>
&gt; <br>
&gt; I have a branch ready to upgrade the opkg and opkg-utils recipes, but<=
br>
&gt; I'd like to wait for this patchset to clear, because they will otherwi=
se<br>
&gt; conflict.<br>
&gt; <br>
&gt; On 7/12/23 15:04, Piotr =A3obacz via lists.openembedded.org wrote:<br>
&gt; &gt; Include support for ACLs and extended file attributes for native<=
br>
&gt; &gt; builds, by default.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp;&nbsp; meta/conf/bitbake.conf | 2 +-<br>
&gt; &gt;&nbsp;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; &gt; index 9625a6fef4..8daaaad615 100644<br>
&gt; &gt; --- a/meta/conf/bitbake.conf<br>
&gt; &gt; +++ b/meta/conf/bitbake.conf<br>
&gt; &gt; @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D &quot;${EXTRA_IMAGE_FEATU=
RES}&quot;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp; # Native distro features (will always be used for -na=
tive, even if they<br>
&gt; &gt;&nbsp;&nbsp; # are not enabled for target)<br>
&gt; &gt; -DISTRO_FEATURES_NATIVE ?=3D &quot;x11 ipv6 xattr&quot;<br>
&gt; &gt; +DISTRO_FEATURES_NATIVE ?=3D &quot;acl x11 ipv6 xattr&quot;<br>
&gt; &gt;&nbsp;&nbsp; DISTRO_FEATURES_NATIVESDK ?=3D &quot;x11&quot;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp; # Normally target distro features will not be applied=
 to native builds:<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt; <br>
&gt; --<br>
&gt; Alex Stewart<br>
&gt; Software Engineer - NI Real-Time OS<br>
&gt; NI (National Instruments)<br>
&gt; <br>
&gt; alex.stewart@ni.com<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com/" originalsrc=3D"https://bootlin.com/" shash=
=3D"NvdvQLPbHUMhUz49U49VBbQ3pN73q/TG9zl7PVkYaBYvdTnqKuwA9iTTsSjwH65W35SOS9r=
SivRihbSDi+8j8+ylh+C3UmQO5ZPNou0uvMLjvTuuPlUqqg3ZfhI6mtMHVMKrG2rxJ/7subiMDI=
HzVJcupkBV/vkRdgeO/w4rhpk=3D">https://eur04.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C01%7Cp.lobacz%40welot=
ec.com%7C10c1276b3fd543cc67b708db8645103e%7C25111a7f1d5a4c51a4ca7f8e44011b3=
9%7C0%7C0%7C638251403412289373%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D=
huIDJ67qcpI8vUTiPCmD1OkeGYNCfqnbjtJxHxeULg4%3D&amp;reserved=3D0</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_VI1PR04MB5373976F878F2C77C2BFB4A4913BAVI1PR04MB5373eurp_--

