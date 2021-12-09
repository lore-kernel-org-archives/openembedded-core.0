Return-Path: <randy.li@synaptics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA73C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 02:55:18 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.59])
 by mx.groups.io with SMTP id smtpd.web11.6592.1639018517488763082
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 18:55:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@synaptics.onmicrosoft.com
 header.s=selector2-synaptics-onmicrosoft-com header.b=YvC46Kbi;
 spf=pass (domain: synaptics.com, ip: 40.107.101.59,
 mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVvT+Bf6dRwjK6VGMdgbw5v2pRigFX2vF1ZIk40+1ZwUvs74LF/JgHncGY72ApQGHeOSbVswEXDEXHe7n5DKoICu2fUsst1Xvun5idXxJtKY9cLdCX0fHXSxYsWgfqmdVzLsw/pktjEjJVx0vfMFLqC7ECDeJDSgfFmrNhomeO1gfz0sSu34V4xVaWRJAMwFClQNc7KXmN7CG1582O4bhHqaiU5HBfc/O3myUzKevp86ce2Ymv5T+eNoLkKv/OcEbok81JJnesUyj3aQKwnn2J//LisxgqQ5NfiCaV0cBQLIbuz106IXfrmdCKbq58+35v2Y8gbJ6n4kdRPMQ+UeYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBsmvVGxTYr9S82YHQAq4++TEbRkOYJLullpx7s+rto=;
 b=nDYhsJjlll9Hnj7fyz/hB+zzsRtBlYSs6NPj7xJRFu1EgktSXZFvV7B6O+HPZ4bqSMK4t0WkOFAT8blEZ1Zs+bOLHpbdjtpSzHAjtZMmtuFfVsM9EA5+14vLPr9Zx+CctwExphvSvQt/zuGqGhGh97Pf2vAQ9tI+f+k5t3cBjaPRrMUhwIKo4YSFkvPul61ig702QjtJQbvAO4QcSE1Ka58q2gJPGb+HIbhuz3AzmxpMbYC56G3iZPWMVP9l3YaVTiP6q3TqdAU59nKX5SqP9SPYrap+hLwAN/2a0rS9RP96NncGoeeVf5CpbKI3ugzNOhPrS3Y0tU+vDP1z0OBU/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBsmvVGxTYr9S82YHQAq4++TEbRkOYJLullpx7s+rto=;
 b=YvC46KbiggVgIJjGWUMREvk3fx6X7I3mZarV0urIK2qCrq3ovWkxyCxL4K7PLuOJ9NaG6cZTMcOBVDTBqHOju0n+zV8Svxqv0RaIdXe6FkceMWqN4eF07J2WnCQt1nm9xAu1qIP1kUgVSu/u1x5OHQZiXg0dYvSPMVz7tg+NqQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM5PR03MB3275.namprd03.prod.outlook.com (2603:10b6:4:3e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 02:55:14 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::18a8:ed88:de67:d955]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::18a8:ed88:de67:d955%7]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 02:55:14 +0000
Message-ID: <63926bcd-34fa-46f6-cbdf-13153f6b828a@synaptics.com>
Date: Thu, 9 Dec 2021 10:55:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [OE-core] [PATCH 03/26] meson: configure and use generic
 exe_wrapper
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-3-alex@linutronix.de>
 <094d6ad8-56a7-837c-b2f2-be82c79511b6@synaptics.com>
 <CANNYZj-K9YTk4yBcMZXsG2zNQBLkhLsn6JtmZVcrXYkASxHmhQ@mail.gmail.com>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: 
 <CANNYZj-K9YTk4yBcMZXsG2zNQBLkhLsn6JtmZVcrXYkASxHmhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::20) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
Received: from [10.70.52.41] (192.147.44.15) by
 SJ0PR03CA0255.namprd03.prod.outlook.com (2603:10b6:a03:3a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Thu, 9 Dec 2021 02:55:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d235445-99e5-4663-387e-08d9babf52c7
X-MS-TrafficTypeDiagnostic: DM5PR03MB3275:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR03MB32758A98749F774540698D3686709@DM5PR03MB3275.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	g+40gcGmlucaK4bwGU5PGRLwX1kbtdulJ9BFn/9iCn0T79JEOyW2ji4nNSwuhRQ2OJScnBCuFga/EIe73+JCwphVZp2pg/gV9vcv6/E1MIknXnsaf1jfKnEplMz8hf5Q2ePdRR2N7OzB42rbZVpMzKO4MGY1wdyqIxM4CurIl7RJwBuQt7mz/a/Dfg4//WBlg17tYMyqFQi3fMHyPN7gauzV/BeYXgLjVi8VmMojT39lFoqYtT9LKQTHs6YmCPBK2ANnut+e8UudmWnxOq1oIom4shBWxg8AU+zAVQldad2Ba0W5UBUz/HIIZI5xVyk46Tvv6oEEj9/o1Rah2PhyyQqPJILLmzL7BWIb4+Goxb5DE0fcJsvvwIG0jrc1zWVUNJ2O5Bidd/adjwQ5Vdhpk+ZBNDDb05vL6+E1r9KmL9NY4yJuzy3B6HdLufPFk3U+4t4uDSlfGxiWCr/UKGiYZfNh4FuGncR3xixheiuuCSUcqxUmsHqT2lUngpo+W7VZEhOaU61fPZ879fz2fOxFqDvEoptJP4x3M+O3FuDsv8HoH9++MYn+jP3ijnAdcH/S/omsl4XTKNUimMkVoB/zLkq8xRrvKUlP1g0TdXYn7Cx7krZAAsxNtl8atrMJy0wklaVE5xacs+jHKZoK6GXLaZJoWx5kF1gM+woiX3JSGQY31Do+yV/4QmIrROKmRXK+FjUM3MuPOLiUJhvSOKuKeZxjtSEFLBa90+/66GeMS6FoMcdSYkkJ+tGE5630SQ0Ihh+PpNBwEqpJHOz0twwZ+Y4uB8+rEn7qKRf8shPppSGkrnSCxvYGQQaOd+ackyK7wQDFxWjcT4V3qbtYB4Ra9VU2803epyR8XSrum+rC5eV6Wzbf3adkCCFmKjatHBCZqdHQwHcOuTQRj7kC8ECbUVpNlE+DxQ/W10HSL8yCjSw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(2906002)(186003)(26005)(8936002)(86362001)(8676002)(4326008)(66556008)(31686004)(53546011)(66946007)(38100700002)(6666004)(66476007)(956004)(38350700002)(52116002)(6486002)(2616005)(31696002)(30864003)(16576012)(5660300002)(316002)(508600001)(83380400001)(966005)(6916009)(54906003)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2wcbMEDdBpgwJW1DWixyYd5R2uqP5qX7yywMqtf0IRuSgn67tNOP+xKsZTqN?=
 =?us-ascii?Q?6mKkXFObPLX7epv3HuULtNA5h9uPMaw4VMFXbi878V+/mOaTvWJiTsXKVCYR?=
 =?us-ascii?Q?Uj8GM5zU6ikZ0ePD/l1aR5p750lUHZAO5xbmgorqzxx+fA/8D9UVV6ZOTk7X?=
 =?us-ascii?Q?RF1Q5bSqGi7VNPL2EG19ttPSTEPYfFbhcO1DIvsSjdlX5uprVWZwqb3k0KW3?=
 =?us-ascii?Q?S5vAUXTG+USU7cJUug4KLuXDw5t2TUtnP0aQkOw0fvJVTXhP1S7rb3akJG4S?=
 =?us-ascii?Q?68GvL5Gxj3GbVZO5rIZ5vm7Htq7l7Cqkq2xPy6926uZVB05bRMBDEWijD8nN?=
 =?us-ascii?Q?w8nS2oLrvhYdFstmm+mSb2SNW/jrqJ2EBGWJH4nXnm5B+csTALRBFw8QbJxn?=
 =?us-ascii?Q?qIrPOwC8Hovo6swd6Gia4jQoomn2kz4A1VdkBkdxYThvUdUWp+by+Av9dY4l?=
 =?us-ascii?Q?r7AVYDTk9uFiLq8WnNfyHII9wNwFT1RoLtLlR1/Yoy0HHKTC12hxlOlMkT0d?=
 =?us-ascii?Q?QUELtZLfyGvgFfjYi/BC5Iq/5M7YEVEVH0HqZgaMnkk/WNIkK/A3jz2et38E?=
 =?us-ascii?Q?MBQVOPlCBJA79BHpcItTsqKKqNBmr6KtQj0QOj1e7g8dRc+6M6K176U7scjE?=
 =?us-ascii?Q?kAkutNmgMU0RlqC3vahvXkl31gcFj2R9CHWyq+BBbHC2uYpL4iRBO93Aygii?=
 =?us-ascii?Q?5NsE4b44/PUp1gSciFiKv27kuLreRU2EZHncHHlO8e449E5/V8tG/bbGzSIx?=
 =?us-ascii?Q?dA87hMf+407TiBm2EczHV/BKEcthYtrs9Xk1zebKi8UGcBEp7X7WkR2eswmi?=
 =?us-ascii?Q?X2lGRDygmbZ8KDnZQTTPKBJ+coB7FHRjmbdaLdR+8hs2HF4TsXElv578vvHu?=
 =?us-ascii?Q?OHLdI26fw6Bdl+XGXVgU/dTAnQ4P/4xenKphhc+zDDq6rS9L0ea19YZbNUQ+?=
 =?us-ascii?Q?cUFbG0E5ikLRVl9lJ9YUmhwQU+Pre23BbefRv4tcPttsJ6jCNyDe2EbqtCal?=
 =?us-ascii?Q?WPZ/S0L+DduhNL2IlDmVWGvLujFyNty4gv5h9tmKWg+A9Zq43AnrcAw7ye9y?=
 =?us-ascii?Q?pn6BDo/7bb8NFbyD8DiLcjWqbbi5MSHNW1ekxu4L8FJd0v2X8znP0A/8SYXN?=
 =?us-ascii?Q?ckHDlkgyb1xB4EdahD6MMvpNfrRGtogjw9312lhRFhg6Wa73rTcukqQTZWa+?=
 =?us-ascii?Q?qN/xcIdD6LFwd4vP4SWKzifTB5D9Tq5QtW6KMysSYuPGq8j9/6bpyBE2jkgs?=
 =?us-ascii?Q?ZHuTO4xQOVBiOOOAGPGLCGB/OvXgdfUvbRnPfTF1m6Sq+I8JAvj4f+vdTmwg?=
 =?us-ascii?Q?sM73v8pd89jjNSyPUMviVa28Ak/aTYg6DKWLqdbqOK6Y2dzgQxMF2U97yygj?=
 =?us-ascii?Q?x39tiQUDJU6/lf6UTqxvuMzR9sL8kZ15EzqVFpmV8xZY9hJydYc+Eq/PBBZy?=
 =?us-ascii?Q?aXx0gqUSIB6KzG1XT8hGAZRDWBNKMIslx5pEYl3v3jQ9QZRgZXHeMtVvR2ee?=
 =?us-ascii?Q?EMYtdTSODUTaxwIOO1w1wUd04kmhsGJSGZF9Q9NWDQRbUFRMTHfAIFaeWEN9?=
 =?us-ascii?Q?FKQInd9LusbuqqxkDdpqT+IIOM4qw6KLe5g48MBxduk1D67xb1QZJFyE3oP4?=
 =?us-ascii?Q?DVri0BaCvf0+0Tvt1towGl8=3D?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7d235445-99e5-4663-387e-08d9babf52c7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 02:55:14.0730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 F33ZJCup6pZ7ITAqzCNe+fT3Oj7di5IWhgX2un6dhgIXVzD20PjHQe3mrWAW7K3h9Vm/hBJ5SK7yoUOb7N2+rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3275
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 02:55:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159437



On 12/8/21 17:32, Alexander Kanavin wrote:
> CAUTION: Email originated externally, do not click links or open=20
> attachments unless you recognize the sender and know the content is safe.
>=20
> It seems like the issue is not that qemu can't run the executable, it's=20
> that executable it wants to run is not there. I'm not sure why it wants=20
> to run something in a 'system' location through qemu, as I do not have=20
> access to your layer.
/system/bin/linker is the dynamic linker in Android system.
https://android.googlesource.com/platform/bionic/
Of course it won't be there, it even doesn't exist in the toolchains.

That layer for android ndk is hosted here
https://github.com/hizukiayaka/meta-android-ndk

>=20
> If qemu-usermode is not in MACHINE_FEATURES, then the wrapper is not=20
> configured at all, and so things should go back to what they were. Can=20
> you check that it's not?

Sorry, I don't understand what I could check.
The exe_wrapper option in meson cross file would disappear when that=20
feature is removed. And everything would be fine then.
>=20
> Alex
>=20
> On Wed, 8 Dec 2021 at 10:27, Hsia-Jun Li <Randy.Li@synaptics.com=20
> <mailto:Randy.Li@synaptics.com>> wrote:
>=20
>=20
>=20
>     On 12/4/21 15:13, Alexander Kanavin wrote:
>      > CAUTION: Email originated externally, do not click links or open
>     attachments unless you recognize the sender and know the content is
>     safe.
>      >
>      >
>      > This replaces the specific gtkdoc wrapper setting
>      > (which was rejected by upstream in
>     https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_mes=
onbuild_meson_pull_9627&d=3DDwIDAg&c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8=
EGyM0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=3DCAFnH4fxB5TbFzR=
ZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=3Dd8BltpV_tYTB24NoB22HJ=
JW4KZkMUZszeTnLXy4O-MA&e=3D
>     <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_me=
sonbuild_meson_pull_9627&d=3DDwIDAg&c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r=
8EGyM0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=3DCAFnH4fxB5TbFz=
RZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=3Dd8BltpV_tYTB24NoB22H=
JJW4KZkMUZszeTnLXy4O-MA&e=3D>
>     )
>      > with a generic, officially supported and documented exe_wrapper,
>      > which is enabled subject to qemu usermode support
>      > (just as is done for g-i and gtk-doc with autotools).
>      >
>      > gtk-doc support is adjusted so that this wrapper is passed to
>      > meson's gtk-doc module, which passes it to gtk-doc.
>      >
>      > The adjusted patch is re-submitted upstream.
>      >
>      > The side effect of this is that meson is now able to run
>      > target binaries in a generic way when it wants to, so this
>      > may affect cross-builds - hopefully in a positive way.
>=20
>     Unfortunately, the meta layer I made for android native would be the
>     victim of that.
>=20
>     | DEBUG: Executing shell function do_configure
>     | NOTE: Executing meson ...
>     | qemu-arm: Could not open '/system/bin/linker': No such file or
>     directory
>     | The Meson build system
>     | Version: 0.60.1
>=20
>     I am not sure how I should make qemu usermode be compatible with the
>     Android environment. I just add "qemu-usermode" into
>     MACHINE_FEATURES_BACKFILL_CONSIDERED in the machine configure of the
>     meta-android-ndk.
>=20
>     I should report this more early but I can't spend much time on this
>     android project.
>      >
>      > Signed-off-by: Alexander Kanavin <alex@linutronix.de
>     <mailto:alex@linutronix.de>>
>      > ---
>      >=C2=A0 =C2=A0meta/classes/meson.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 30
>     +++++++++++++++++--
>      >=C2=A0 =C2=A0...sues-that-arise-when-cross-compiling.patch | 27
>     +++++++++++------
>      >=C2=A0 =C2=A02 files changed, 46 insertions(+), 11 deletions(-)
>      >
>      > diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbcla=
ss
>      > index a7981e481f..ffec5f3269 100644
>      > --- a/meta/classes/meson.bbclass
>      > +++ b/meta/classes/meson.bbclass
>      > @@ -1,7 +1,12 @@
>      > -inherit python3native meson-routines
>      > +inherit python3native meson-routines qemu
>      >
>      >=C2=A0 =C2=A0DEPENDS:append =3D " meson-native ninja-native"
>      >
>      > +EXEWRAPPER_ENABLED:class-native =3D "False"
>      > +EXEWRAPPER_ENABLED:class-nativesdk =3D "False"
>      > +EXEWRAPPER_ENABLED ?=3D "${@bb.utils.contains('MACHINE_FEATURES',
>     'qemu-usermode', 'True', 'False', d)}"
>      > +DEPENDS:append =3D "${@' qemu-native' if
>     d.getVar('EXEWRAPPER_ENABLED') =3D=3D 'True' else ''}"
>      > +
>      >=C2=A0 =C2=A0# As Meson enforces out-of-tree builds we can just use=
 cleandirs
>      >=C2=A0 =C2=A0B =3D "${WORKDIR}/build"
>      >=C2=A0 =C2=A0do_configure[cleandirs] =3D "${B}"
>      > @@ -36,6 +41,9 @@ MESON_CROSS_FILE =3D ""
>      >=C2=A0 =C2=A0MESON_CROSS_FILE:class-target =3D "--cross-file
>     ${WORKDIR}/meson.cross"
>      >=C2=A0 =C2=A0MESON_CROSS_FILE:class-nativesdk =3D "--cross-file
>     ${WORKDIR}/meson.cross"
>      >
>      > +# Needed to set up qemu wrapper below
>      > +export STAGING_DIR_HOST
>      > +
>      >=C2=A0 =C2=A0def rust_tool(d, target_var):
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0rustc =3D d.getVar('RUSTC')
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0if not rustc:
>      > @@ -62,6 +70,7 @@ cups-config =3D 'cups-config'
>      >=C2=A0 =C2=A0g-ir-scanner =3D '${STAGING_BINDIR}/g-ir-scanner-wrapp=
er'
>      >=C2=A0 =C2=A0g-ir-compiler =3D '${STAGING_BINDIR}/g-ir-compiler-wra=
pper'
>      >=C2=A0 =C2=A0${@rust_tool(d, "HOST_SYS")}
>      > +${@"exe_wrapper =3D '${WORKDIR}/meson-qemuwrapper'" if
>     d.getVar('EXEWRAPPER_ENABLED') =3D=3D 'True' else ""}
>      >
>      >=C2=A0 =C2=A0[built-in options]
>      >=C2=A0 =C2=A0c_args =3D ${@meson_array('CFLAGS', d)}
>      > @@ -71,7 +80,6 @@ cpp_link_args =3D ${@meson_array('LDFLAGS', d)}
>      >
>      >=C2=A0 =C2=A0[properties]
>      >=C2=A0 =C2=A0needs_exe_wrapper =3D true
>      > -gtkdoc_exe_wrapper =3D '${B}/gtkdoc-qemuwrapper'
>      >
>      >=C2=A0 =C2=A0[host_machine]
>      >=C2=A0 =C2=A0system =3D '${@meson_operating_system('HOST_OS', d)}'
>      > @@ -106,6 +114,24 @@ cpp_link_args =3D
>     ${@meson_array('BUILD_LDFLAGS', d)}
>      >=C2=A0 =C2=A0EOF
>      >=C2=A0 =C2=A0}
>      >
>      > +do_write_config:append:class-target() {
>      > +=C2=A0 =C2=A0 # Write out a qemu wrapper that will be used as exe=
_wrapper
>     so that meson
>      > +=C2=A0 =C2=A0 # can run target helper binaries through that.
>      > +=C2=A0 =C2=A0 qemu_binary=3D"${@qemu_wrapper_cmdline(d, '$STAGING=
_DIR_HOST',
>     ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
>      > +=C2=A0 =C2=A0 cat > ${WORKDIR}/meson-qemuwrapper << EOF
>      > +#!/bin/sh
>      > +# Use a modules directory which doesn't exist so we don't load
>     random things
>      > +# which may then get deleted (or their dependencies) and
>     potentially segfault
>      > +export GIO_MODULE_DIR=3D${STAGING_LIBDIR}/gio/modules-dummy
>      > +
>      > +# meson sets this wrongly (only to libs in build-dir),
>     qemu-wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it proper=
ly
>      > +unset LD_LIBRARY_PATH
>      > +
>      > +$qemu_binary "\$@"
>      > +EOF
>      > +=C2=A0 =C2=A0 chmod +x ${WORKDIR}/meson-qemuwrapper
>      > +}
>      > +
>      >=C2=A0 =C2=A0# Tell externalsrc that changes to this file require a=
 reconfigure
>      >=C2=A0 =C2=A0CONFIGURE_FILES =3D "meson.build"
>      >
>      > diff --git
>     a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise=
-when-cross-compiling.patch
>     b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise=
-when-cross-compiling.patch
>      > index ab4d5969d9..b098c4a123 100644
>      > ---
>     a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise=
-when-cross-compiling.patch
>      > +++
>     b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise=
-when-cross-compiling.patch
>      > @@ -1,29 +1,38 @@
>      > -From 2f9c59e0489e569c5382404667c10f5c200a72ad Mon Sep 17
>     00:00:00 2001
>      > +From bbdd6679e49bcba5ec022b240ac234a87b451e41 Mon Sep 17
>     00:00:00 2001
>      >=C2=A0 =C2=A0From: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>      >=C2=A0 =C2=A0Date: Fri, 4 Aug 2017 16:16:41 +0300
>      > -Subject: [PATCH] gtkdoc: fix issues that arise when cross-compili=
ng
>      > +Subject: [PATCH] gtkdoc: add support for a binary wrapper
>      >
>      >=C2=A0 =C2=A0Make it possible to specify a wrapper for executing bi=
naries
>      > +in cross-compiling scenarios.
>      >=C2=A0 =C2=A0(usually, some kind of target hardware emulator, such =
as qemu)
>      >
>      >=C2=A0 =C2=A0Upstream-Status: Submitted
>     [https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_me=
sonbuild_meson_pull_9627&d=3DDwIDAg&c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r=
8EGyM0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=3DCAFnH4fxB5TbFz=
RZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=3Dd8BltpV_tYTB24NoB22H=
JJW4KZkMUZszeTnLXy4O-MA&e=3D
>     <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_me=
sonbuild_meson_pull_9627&d=3DDwIDAg&c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r=
8EGyM0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=3DCAFnH4fxB5TbFz=
RZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=3Dd8BltpV_tYTB24NoB22H=
JJW4KZkMUZszeTnLXy4O-MA&e=3D>
>     ]
>      >=C2=A0 =C2=A0Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.c=
om
>     <mailto:alex.kanavin@gmail.com>>
>      >
>      >=C2=A0 =C2=A0---
>      > - mesonbuild/modules/gnome.py | 4 ++++
>      > - 1 file changed, 4 insertions(+)
>      > + mesonbuild/modules/gnome.py | 5 ++++-
>      > + 1 file changed, 4 insertions(+), 1 deletion(-)
>      >
>      >=C2=A0 =C2=A0diff --git a/mesonbuild/modules/gnome.py
>     b/mesonbuild/modules/gnome.py
>      > -index dc2979e..c9ff9bd 100644
>      > +index 1c6952d..5a6ff94 100644
>      >=C2=A0 =C2=A0--- a/mesonbuild/modules/gnome.py
>      >=C2=A0 =C2=A0+++ b/mesonbuild/modules/gnome.py
>      > -@@ -1053,6 +1053,10 @@ class GnomeModule(ExtensionModule):
>      > +@@ -35,7 +35,7 @@ from ..mesonlib import (
>      > + from ..dependencies import Dependency, PkgConfigDependency,
>     InternalDependency
>      > + from ..interpreterbase import noPosargs, noKwargs,
>     permittedKwargs, FeatureNew, FeatureNewKwargs,
>     FeatureDeprecatedKwargs, FeatureDeprecated
>      > + from ..interpreterbase import typed_kwargs, KwargInfo,
>     ContainerTypeInfo
>      > +-from ..programs import ExternalProgram, OverrideProgram
>      > ++from ..programs import ExternalProgram, OverrideProgram,
>     EmptyExternalProgram
>      > + from ..build import CustomTarget, CustomTargetIndex, GeneratedLi=
st
>      > +
>      > + if T.TYPE_CHECKING:
>      > +@@ -1103,6 +1103,9 @@ class GnomeModule(ExtensionModule):
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.append=
(f'--{program_name}=3D{path}')
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if namespace:
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.append=
('--namespace=3D' + namespace)
>      > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtkdoc_exe_wrapper =3D
>     state.environment.properties.host.get('gtkdoc_exe_wrapper', None)
>      > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if gtkdoc_exe_wrapper is not None:
>      > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.append('--run=3D'=
 + gtkdoc_exe_wrapper)
>      > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if state.environment.need_exe_wrappe=
r() and not
>     isinstance(state.environment.get_exe_wrapper(), EmptyExternalProgram)=
:
>      > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.append('--run=3D'=
 + '
>     '.join(state.environment.get_exe_wrapper().get_command()))
>      >=C2=A0 =C2=A0+
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args +=3D self._unpack_ar=
gs('--htmlargs=3D', 'html_args',
>     kwargs)
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args +=3D self._unpack_ar=
gs('--scanargs=3D', 'scan_args',
>     kwargs)
>      > --
>      > 2.20.1
>      >
>      >
>      >
>      > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>      > Links: You receive all messages sent to this group.
>      > View/Reply Online (#159150):
>     https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembe=
dded.org_g_openembedded-2Dcore_message_159150&d=3DDwIFaQ&c=3D7dfBJ8cXbWjhc0=
BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTe=
ZE&m=3DCAFnH4fxB5TbFzRZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=
=3D45V6_TRrNONJsAD5I2vogAQnnZusJBFo0xgaXn91aC8&e=3D
>     <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openemb=
edded.org_g_openembedded-2Dcore_message_159150&d=3DDwIFaQ&c=3D7dfBJ8cXbWjhc=
0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLT=
eZE&m=3DCAFnH4fxB5TbFzRZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=
=3D45V6_TRrNONJsAD5I2vogAQnnZusJBFo0xgaXn91aC8&e=3D>
>      > Mute This Topic:
>     https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembe=
dded.org_mt_87494764_6350696&d=3DDwIFaQ&c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1=
s88r8EGyM0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=3DCAFnH4fxB5=
TbFzRZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=3Dr1-DZP8UnKe5blru=
wC2xC0yCg4vPMbgdQB7csVRG5FI&e=3D
>     <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openemb=
edded.org_mt_87494764_6350696&d=3DDwIFaQ&c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj=
1s88r8EGyM0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=3DCAFnH4fxB=
5TbFzRZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=3Dr1-DZP8UnKe5blr=
uwC2xC0yCg4vPMbgdQB7csVRG5FI&e=3D>
>      > Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>      > Unsubscribe:
>     https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembe=
dded.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3D7dfBJ8cXbWjhc0BhImu8wVI=
oUFmBzj1s88r8EGyM0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=3DCA=
FnH4fxB5TbFzRZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=3DaCJ012s9=
D9DQ3yG-GuuQFs_6APt34sTiwSp8typpm6Q&e=3D
>     <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openemb=
edded.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3D7dfBJ8cXbWjhc0BhImu8wV=
IoUFmBzj1s88r8EGyM0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=3DC=
AFnH4fxB5TbFzRZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=3DaCJ012s=
9D9DQ3yG-GuuQFs_6APt34sTiwSp8typpm6Q&e=3D>
>     [randy.li@synaptics.com <mailto:randy.li@synaptics.com>]
>      > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>      >
>=20
>     --=20
>     Hsia-Jun(Randy) Li
>=20

--=20
Hsia-Jun(Randy) Li

