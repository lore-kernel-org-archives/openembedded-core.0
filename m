Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A5FC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 12:04:49 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.53])
 by mx.groups.io with SMTP id smtpd.web08.7191.1667909075499053561
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 04:04:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=xBuqq1ls;
 spf=pass (domain: vaisala.com, ip: 40.107.22.53, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9+STwJCygn9hXlzbKLsMXRxBCjWemzyYdtS3vrbeEzFSAan9euzohxNteOh+NpuemB4ZP6QIqtXEqqUGOdgGVMrClnwGhuKtffgHN1gef1x+d308+0jt9CLzSK4KlsepkZCofRsMXT9edD2NYH23a3Jh/jU1SroyIMcRi3sEoZFo7/0/ob8A/v+yQHISi/ydaku3gzK9cK/aG8UN/r7RpanzoMnq00kG3I2awNjI7eNJlIRFoaTKNj1xGG67ZC3Uxlj5Kwf/S7TOVzPiQH3MiE8VLgMoRQeDibjPiRq8k5TtBsOlJyXlle2Uf46KAptDCqJjIUEUM31OzsPvvYFpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWJ8ACkHibLAAVgSxNmXgas7HW3eMK+sFuau1HZ8Zhw=;
 b=jjpOUBbekwqQvGLgnvN2CtHKCm1kUWcGMfDRa+fPcA+p+WKLHQY7kdYxWBETfzMchUyJyqlkVJXtIt8E5nzJtq1HCw3LrM90KvKrD2++9/nnjONUEpGRMqxD5CkQpHCfFZzMPi6qnfCptzZEhIxs1Tj54pbIZPutjJcaXzMwrXz8iB7qsbNjKjzR83qgmcGslZVUUfU1r/kZGXCXXK97dz/f8Zn1rPEoLVcTZQ9DlAu1tekOvRrKp0Z9vqllNEBlNxNpVah8pRMuLtXVdU6XCgS7A8o/y6XfBkurqjkdtzhKi76K3bzjjnR/oH3RCMOeWYcpjE+dOhWMsLthcncjqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWJ8ACkHibLAAVgSxNmXgas7HW3eMK+sFuau1HZ8Zhw=;
 b=xBuqq1lsrH3GhW+dGmaRPyTGOhKrqJ61dg+LtyJHymfMpZFezREGE/rXjsBHZJ99/vL2vaM3XMmkjWPYvBJh33VR3vikas16NCFq/V5WTcjmsAOBLhwOQh1fS/xYHyYPUUXqjk7w34Hh/xU/S4DQ4qRFSp+WpN0svO7RPe4pDWZJ5x8j75Lx2YvRCRZ0ljGFIGkZo+MGicTMDwiDrh7EQE5s2DKk7p9uAvEmmpOCFcTHqG61KDe2rIzhqDBafRUPMU3FNER4ztAVC9Wz999ekx4pFj2JUzUlVjp2dTJG/LdVSHCQ6rwMkLQrNmfScDwt36FlBVXK7MNpvdVSRDebrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by PA4PR06MB8474.eurprd06.prod.outlook.com (2603:10a6:102:2a5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 12:04:32 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::a2ad:443:3e3e:7baa]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::a2ad:443:3e3e:7baa%5]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 12:04:32 +0000
Message-ID: <a0ba0394-c43e-b21a-1a2b-e5a7ea016404@vaisala.com>
Date: Tue, 8 Nov 2022 14:04:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [OE-core] [RFC PATCH 2/3] kbd: Disable 64 bit time with 32 bit
 glibc
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: openembedded-core@lists.openembedded.org
References: <20221108000828.42824-1-niko.mauno@vaisala.com>
 <20221108000828.42824-2-niko.mauno@vaisala.com>
 <CANNYZj9f2nfRbwU1MXn2a7ruKHhkw318F92Lqp9xYd8acvubwQ@mail.gmail.com>
 <5e84a23b-1111-470c-11fa-a8cc9d32dcf0@vaisala.com>
 <CANNYZj_EO7LRfzGb86D1s=YMB1Vz=1VYVropJo7VGPvsq5_FsA@mail.gmail.com>
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <CANNYZj_EO7LRfzGb86D1s=YMB1Vz=1VYVropJo7VGPvsq5_FsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3P280CA0041.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::19) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8579:EE_|PA4PR06MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: b0914a65-3637-40b6-5626-08dac18165a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OtMfGYgyvh40LSR6AvDrDb0jB5vMZqSxKk09s2pqnLIQdW6cFKW1Tj9mUu6oHyrgJMa1tZ8KWzPqjpstvL3+Hz2PhVboZUXetUMzy5b+e1RHTHYq8nWJCP9F1EzfC9feblmJoDC0C6/t1li6EINNXTrPGJZnj4XYOuq7ktdNrrFJ++IQfJMZhHqoAOi/5YkUB2sx45OdotR9VTt283iorIj5mAo7wbHh0j7aPEmG4BOKHqbDaDgTOvWLxDXencfU63f52EEVepOpasMubwQYZ1JbKB/uP0s/EDehMOUTIVPVSJUm2wOdZWuHF+74u+qj5eOwEf0mD6L5+1/3Mz4somA+hneiVZLgX5DR0tw3r5cjxM72XkB0G3anFUZUOKuv/iKc54FAsg7/+Lu75UzB0jNaud90Vr7mTQZfK794AHS1W7Cl/trfUvk5NL8nwulo8uNFzN+sFMiQqtZnh0bKg0eekXmMaLllKLJ00t+dDLWCcz0bwrB+6YyXW+4lcSFMj02j2TKAHRc5++rIMAdwnvqkxoybk1YDNFaVOcnIET+3tv4z3E576iqk068/S3EpYoKZT+z/TzjJE8wY1QCXhmShDtfoCMTXrXm2ENqwkoZd7Mk3PF1+EC31yXwWEttj2ZcWdyuNk4eXUpKxalrHLEzzkNnrvCWcfVgIxaGvUf7p8174NQ8YyG6ngCbG+/0bfnZBIAdjbogZekbF71rgkd3R9y++WOeqR/y/ULvJrCFVboDjY/Rw2E3pF9gQsDzxm7QEZ5Q3dzzDUIjiZrKACUjP4Rr7LVHsxaOa2NVrX3Q5l1nbwgq8DlFe9vEZjGq/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39850400004)(136003)(366004)(346002)(451199015)(86362001)(31696002)(6916009)(6666004)(83380400001)(36756003)(41300700001)(66556008)(186003)(44832011)(2906002)(8936002)(2616005)(6506007)(66476007)(66946007)(8676002)(316002)(38100700002)(26005)(6486002)(6512007)(4326008)(5660300002)(66899015)(966005)(31686004)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nRkbgEiN3gDC6LRclcoyC3R1R/pnO6PWc82juEV3BWLLjJfly5Glx9J3wAR1?=
 =?us-ascii?Q?Lsi5VYL/zr8px7tp7yPPCp1iXwubzfHIWptK9rc8LkmEyy5fFN1YRsaSR0aS?=
 =?us-ascii?Q?69ofQEUZj2j/M8SvKKLOxPQePCcSnUC+1ECcfONgjLeCKmfTAHTAW8mGYDzj?=
 =?us-ascii?Q?Y8g7Mh9hpRNISY8ZgKDpZJm7nQB0Za7WadbgV6OlENtP2EWevEDth6ivhYb2?=
 =?us-ascii?Q?s3Ws9zaw/ZujBwdrXWL9bZT62g5HG4eH56j8ixgQOCUpESFKaTCyw6z9ziDk?=
 =?us-ascii?Q?zGQow4hm5avx9/Vv8ysSH6tzu0Bagm4NJN3MpRDb7PbynzPVCZXgzuYUiIeC?=
 =?us-ascii?Q?HJFH5kei111hlPRQV35FCiP6xa6GvMnOn+V5ZLZfvySfdrWeqZmyaluvBaBH?=
 =?us-ascii?Q?Awu/LKkMnCDdeWdPEjtT9FAim3tM6WhYvYEyJX2q0FjrBlgKUeaC1Mv8d0zt?=
 =?us-ascii?Q?yR43iUZrg/evXvPa8hRKXF9pFnYkeZYWi4z84HVo9Leuf93JyGGJ4mhGhklF?=
 =?us-ascii?Q?dmflG8fZfFL+8eHXuk2Hi4P9OBPCqdP8JETbXqqMAinzzBSTnYq5YFqnzmeg?=
 =?us-ascii?Q?w6iP5XXvHniFZUOeBX+PMpPFhAMfnkm+gDeHjm8AmNTtpSivVP55tZ21mgRV?=
 =?us-ascii?Q?rkmk9DEt0VJQe0ED69Bn5hDTIbkfzItZj89q3oYi5ybJ18QMddlxBukdDiqn?=
 =?us-ascii?Q?FHQAi/NOwbWMGWhvXcUHFgJwhfQl3/ZutQ2c7GzSalbS0mHI5lZLpAILy8iu?=
 =?us-ascii?Q?NxREGFEuebp5IjkxJs5PFoYf6mNca2xnPJi82A2LLjfcxHVdJemfqTbhxK2G?=
 =?us-ascii?Q?SG5a8EfJ8eC/K+WsfwVveOlDNJyFY6DkA6Y2ZLEFwk07qTqlH5kkT/pN+QaF?=
 =?us-ascii?Q?lGjsvXQ5QAkTI3oeC43317Yam4mVZyqu8JVb4zKf/Gb63WMyWX5NxGraVmzk?=
 =?us-ascii?Q?qyyFoEBww2dXpHte6Yv5yVHwi+oeJHpNP6gBgbAqkwwL8HxkC7Dp0XvYb85d?=
 =?us-ascii?Q?hQSoPa8DN7H+zZQDeF3SAPKRE+rDibE8OiXBojwIg4B80p19BGDulQqgakzl?=
 =?us-ascii?Q?oXngV99M6egeZlEzPUGcGIooYbS+6ZbkaFRPjBpsuohFK0QsK+wp5FZS5Ntr?=
 =?us-ascii?Q?uocfSmN9rQ+5CGN3lr+8SnJdpcg4tRTiCpYxBmfp5WQQJkVngV+xZ7ywDavW?=
 =?us-ascii?Q?bwTmD2OpFo+BpOuW3/3ooVu0S8Q1uYy2/rEmkcWsHVV3v2KRpKgShq3iTZkL?=
 =?us-ascii?Q?TkBJeq2JouMqhzTMPiky4gIgjie6HoxpdKF7/oEsToQHGooc1Wy4AmMB8YKL?=
 =?us-ascii?Q?z+NsCW0h7fSRGDdIeyV+NXo1w+o8E4yr/SeDtsXZlHeLh9GrjNQwZwBNYQrM?=
 =?us-ascii?Q?B6M0fUWGcjfkO59qkoDUceDJ3ZanQvN7r5L2YLbDXMW2lDzmGlLYBxBU6UPV?=
 =?us-ascii?Q?zTs6z3aundh8musG3mUufz0DJapDAi83Dkmus4vsrSFkucRgRflJ/NJUrGae?=
 =?us-ascii?Q?cuzHsSFckHtM7HEqamkvE40QPOolkFAXiMKjxqnvYaOjTl9e6ylOnOV8uU4h?=
 =?us-ascii?Q?ZPjyDmhAhP0OFKMHr7HnSioWN0KiaxTXTZUkEMfOI98Ed7trsx7DhJffRY7C?=
 =?us-ascii?Q?3A=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0914a65-3637-40b6-5626-08dac18165a4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 12:04:32.7807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2anS5fZC8pXhP7TDWuZ0Cixxeh4W5EpyUBKAL5T7+ql1T5r5/E+ivsO0kCRNRut2J6ZCQNNytzsVHNPwkJ4qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB8474
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 12:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172963

My understanding wrt. Y2038 and 32-bit glibc hosts was such that it=20
makes sense to set said compiler flags globally to ensure user space=20
wide Y2038 compliance. So I encountered this compiler error while=20
building poky reference images with additional effective

   TARGET_CPPFLAGS +=3D "-D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64"

declaration in meta/conf/distro/include/tclibc-glibc.inc.

-Niko

On 8.11.2022 13.50, Alexander Kanavin wrote:
> So you need to set -D_TIME_BITS=3D64
> -D_FILE_OFFSET_BITS=3D64 to get some error? But why set that, shouldn=E2=
=80=99t=20
> the defaults work?
>=20
> Alex
>=20
> On Tue 8. Nov 2022 at 12.48, Niko Mauno <niko.mauno@vaisala.com=20
> <mailto:niko.mauno@vaisala.com>> wrote:
>=20
>     I have not studied the issue, but in order to reproduce this error I
>     add
>     'MACHINE =3D "qemuarm"' to local.conf then issue 'bitbake kbd' agains=
t
>     current master while TARGET_CPPFLAGS value is set to "-D_TIME_BITS=3D=
64
>     -D_FILE_OFFSET_BITS=3D64".
>=20
>     -Niko
>=20
>     On 8.11.2022 11.14, Alexander Kanavin wrote:
>      > We do build for 32 bit arm targets, so is this seen only in specif=
ic
>      > circumstances? What are they?
>      >
>      > Alex
>      >
>      > On Tue, 8 Nov 2022 at 01:09, Niko Mauno via
>     lists.openembedded.org
>     <http://lists.openembedded.org/
>      > <niko.mauno=3Dvaisala.com@lists.openembedded.org
>     <mailto:vaisala.com@lists.openembedded.org>> wrote:
>      >>
>      >> For now add exemption in order to avoid following failure during
>      >> do_compile()
>      >>
>      >>=C2=A0 =C2=A0 |
>     .../build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0=
/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-pok=
y-linux-gnueabi/gcc/arm-poky-linux-gnueabi/12.2.0/ld:.libs/libtswrap.ver:2:=
 syntax error in VERSION script
>      >>=C2=A0 =C2=A0 | collect2: error: ld returned 1 exit status
>      >>
>      >> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com
>     <mailto:niko.mauno@vaisala.com>>
>      >> ---
>      >>=C2=A0 =C2=A0meta/recipes-core/kbd/kbd_2.5.1.bb
>     <http://kbd_2.5.1.bb/
>      >>=C2=A0 =C2=A01 file changed, 3 insertions(+)
>      >>
>      >> diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb
>     <http://kbd_2.5.1.bb/
>      >> index aa3ab6e121..b623aecd36 100644
>      >> --- a/meta/recipes-core/kbd/kbd_2.5.1.bb
>     <http://kbd_2.5.1.bb/
>      >> +++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
>     <http://kbd_2.5.1.bb/
>      >> @@ -18,6 +18,9 @@ SRC_URI =3D
>     "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
>      >>
>      >>=C2=A0 =C2=A0SRC_URI[sha256sum] =3D
>     "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683"
>      >>
>      >> +# Compiling 64 bit time for 32 bit host is broken
>      >> +GLIBC_64BIT_TIME_CPPFLAGS =3D ""
>      >> +
>      >>=C2=A0 =C2=A0PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATUR=
ES', 'pam',
>     d)} \
>      >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0"
>      >>
>      >> --
>      >> 2.36.1
>      >>
>      >>
>      >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>      >> Links: You receive all messages sent to this group.
>      >> View/Reply Online (#172940):
>     https://lists.openembedded.org/g/openembedded-core/message/172940
>     <https://lists.openembedded.org/g/openembedded-core/message/172940
>      >> Mute This Topic:
>     https://lists.openembedded.org/mt/94880633/1686489
>     <https://lists.openembedded.org/mt/94880633/1686489
>      >> Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>      >> Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://lists.openembedded.org/g/openembedded-core/unsub
>      >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>      >>
>=20

