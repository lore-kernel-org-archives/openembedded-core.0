Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B246DC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 08:40:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.48])
 by mx.groups.io with SMTP id smtpd.web11.5231.1634719254818561326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 01:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=bHQVXlJU;
 spf=pass (domain: weidmueller.com, ip: 40.107.20.48,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1FwAgsKVYv2r4sNVsDvRRYkFOzOW6xa6nYlq/LglY39wU8XywJwX31O4CxtLm+EjJn6pM8AxVg8+IAfZ5TSsQK1EBo/EZRaSDIxo7d8nnSiWqf5NoFTS+zzWTQzoUTMP2MHxhNbqwsgYtpKp3z62FraxfdDgSB7jvFh+b3Drb9vGXMbeKDjmweVtIkO7Zeuygx9SeTm8zF232J1tTZ1XYFoOxZPexpbgsWZX3RjIWAX9IBZ6zHtSv0JYaE6PvKjvLp93FmwmanoCsj1/ivzv0pr9OTqSMJbQtyr5W210zYpzw6iFfEyNETlRCyjRjmacyzclh8OIma3xBfawkqheQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdyBB0B+hpLUpVVovZ/jxPV2NEKJITNrg/+LTM5xK/I=;
 b=m51X3rSWredigtq/zNeYSW6aK9p7OyP7kT0ecb59cDYhwi729AV820t6hBa0BWaFYPZJnBXo7p2fN2ffK+5zgwX3B0OjUnGRjZfLy4UhpZolIpBiGia0iV8V0edWYxTqsIJdw/D9EBtsuOK+dK0ctlyGkPm2nCZF2KtM4wEIu3AgtyXUJ++BrgMbOgzPxYvm8mYuibMCGrSZVi5TZjlvswt4cfOFXKkvONWrDteQ6G8PNnIEkwlADYz/GE6h8r5dvx3uQ4aRUVdu0SoExrFZR9jdMzVtUjYdApC88d/vg9LqsKqijRmxyfFwMD6xxOs24Ahy7hI9g2koLDLadYN4nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdyBB0B+hpLUpVVovZ/jxPV2NEKJITNrg/+LTM5xK/I=;
 b=bHQVXlJUaM+eNYwmIYdhfR7BOfDC2PjSZdnz2symdgcHBXOZL7vcblsn3nVU78Jc+TRNvgK7BsfvPW/g4zB/l+l76c4sw6A/kXZnclXD4e4qasdI10vWGjORIbItl18gN/UrmeaELwH82wD845fuQqhT5n82aFKBPWqn+QVW8Hw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB7003.eurprd08.prod.outlook.com (2603:10a6:102:202::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 08:40:51 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 08:40:51 +0000
Subject: Re: [OE-core] [PATCH 2/2] npm: Remove unnecessary configs argument
 from npm run command
To: openembedded-core@lists.openembedded.org
References: <20211020074015.860-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211020074015.860-2-stefan.herbrechtsmeier-oss@weidmueller.com>
 <AM9PR09MB464242B99A9E63DF51AB7701A8BE9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Message-ID: <7b10576a-a6cd-1b0d-ba4a-4db4c4fd5bb6@weidmueller.com>
Date: Wed, 20 Oct 2021 10:40:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <AM9PR09MB464242B99A9E63DF51AB7701A8BE9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0011.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::24) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [10.175.8.182] (87.129.248.106) by
 AM5PR1001CA0011.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Wed, 20 Oct 2021 08:40:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f20bbe4-ffc8-4f7a-446c-08d993a5526d
X-MS-TrafficTypeDiagnostic: PAXPR08MB7003:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB7003880C3259FF25BAE2B322D7BE9@PAXPR08MB7003.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:112;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RQS3aKHb/k/KMdmD1PmPlm+V8Sm8cxP+DhTkGph4rT1+h7K3Zll3FSq5DO057rupL/2qQaD8NrnVGyUgEMnIwuTSej/i5u9hM51q57FVqkfSoTyQP0TWHyq0Fa41625znBjFGgH7dB7UMW0w4aGHQndv5fwe/B4OwUTKss0uUW4N21uGjrMwM0V4O7PfQ9AEejlZpGLpQwnHnMxJnJarXfSTfp60bCvHFGhHo4zM8PJRMl76oTTW72/3HkKlWUX8gy208D5hqdtQok0+A7OemYPTJ2I2VEWrg+lCx4ckPFoQzdV57sxlO421E1F1gWhjW5M5rI0q9NLtFtrgmLPWpboQ5T793n5kbU0VPCur2pE38AAMKfEVIUsn2ssXO+iaExiMVGZbI7wsaKu52INM4ivNL7qb3wbgGqMahaktxEhtCS3fWhhI2DbRaPimwi40nmT8t0BXaltZp5EoOoohqGFkir0Ab/7MIgsnIqaU31TbOW9n7YOkjNIxiI+crXfqytA9sRld/SSjpXto1LQhIbfu0ELaHFFc5JJ+DGB1z7n4ZsoC6jc2f8v/NTs6IzCNK0gyXdHGEOuVwIWDvcT99YiRo2lfROLlP/3hzhNcsrx99dc/rFdNjf2Su4jUzauUvhr1MJ3paO9BGJlbWuseChZ5uaUQPF/qjeErCD2ieTqJshi/MljjIqFCuxWqQIBjRvxQicOzBwTYUnmj3WmOtpD7gMZa5qm8n96U+BHZIAJX7ZhkdbCHMD+Tm5jx/spupHGIUe8r5g5n8rmPkF0K4kCizY2lzNCvCYythLyx3XmnoHJdRvAyXItdIeCr4lzAH6sVcrWi8bAputULq6PP6I9+a75i52+TcEp2+ZCUNzo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(966005)(6666004)(26005)(66556008)(316002)(38350700002)(5660300002)(16576012)(36756003)(6486002)(52116002)(956004)(2906002)(2616005)(86362001)(6916009)(38100700002)(31696002)(8676002)(31686004)(186003)(8936002)(508600001)(53546011)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xBfhDBOqXggKwM3yT6WcXTYn5j/RoQ7XXhhKD8WNtdjSIZtCOTAvhCvXy8dZ?=
 =?us-ascii?Q?47v/IH8Xld0rez0+yC5RKaMF4Ld94WzkAiw1vao4NoVH2vYqODQp4dGP6y7y?=
 =?us-ascii?Q?4NUR8W8p0OIZ/mVMXILB6CcupG6nlM6E214QEypz/5BhZzgjMD2GvtyWLN5s?=
 =?us-ascii?Q?Z/0CXXjNtlnCMd/OcoxxAyDLw5qMsPyWOJAkXY4pSfGruF+wQOn/g130/Qk4?=
 =?us-ascii?Q?62KwTUZQd5KfU4Kq/LN6UG60CFrQHBFb7JloBrMr11A2CEfCXkW3CTgUZgVt?=
 =?us-ascii?Q?CMXYCO2Ytx1WTXobZauKjcHk7U/Vje9rjO8IynB4+w8rzAMMPxDVZWocpA0x?=
 =?us-ascii?Q?LxUErByOiMYrHOL0zfTYw37WX0ebZl+aEUEeAd0ynZAQP4XhuKFkcDbORMNx?=
 =?us-ascii?Q?mCzfYY/w8DTF14AAB/i8FR0QOaXLLwmVQxGjgjkLX/UbSzN8jzF/nOAmgCz3?=
 =?us-ascii?Q?xUhzW4knenX8BPH2P6eMeRvX6r3Ht6Ip4r3q+YsckXxaxMwD1qiBCDP7z/pt?=
 =?us-ascii?Q?b1U68hqfIofZ0lEeSQpWQHMJzdMnAuUSFE1V52EFAxWJgDEqMiXbJWVLwcAi?=
 =?us-ascii?Q?jdeGUvsrF+l0/OvayzMrBsNArTp3mFVwzdFByGPUCfTxUbqX0bAX6xTh91ux?=
 =?us-ascii?Q?mmO7cQbdM0wiYmuw3uRveCcq1nboWvbCMz+y8OK+0965uApVzy7hjdXTNOZ4?=
 =?us-ascii?Q?FzMIy2JOFNywVeNzjvJ0e/fgWQqwUc5qSY6C5ZJQByY/O1aKaWRRo0nzTmSd?=
 =?us-ascii?Q?prLdXovEU9JCAIE1PnwDWKzwM3bN1iFMgbaFfy5H4Cn7z+nsnxYZUTKBDb69?=
 =?us-ascii?Q?sYxgy4d3NIlzSqXLUt+lMtxX0nentXyl3buwXmmOd6IU2hAxNnwMpLyPJ9zh?=
 =?us-ascii?Q?qpPetr/7YrrWMvbe9r3o1PuKoObgdgBkD8okLIuNa5PS63zquGCFo2zteEBk?=
 =?us-ascii?Q?u9R2xvAgkDS0aCSy+VpLBv5eAdfMsub1n5qujijptQttxxah0QauGty+/pN4?=
 =?us-ascii?Q?586kw7NM1vAL9X0WLM5t+ArSQYNgN7hCgoZ2FIokeXvopS/cZmP22UiWutMA?=
 =?us-ascii?Q?viNAbh3XzhmIt5FKyCYJ+RC6ZeLF91r4intkFDGK/FD9BYd/I7/s3NbbXU8d?=
 =?us-ascii?Q?VGQ3DBs7MaW6Dh7hsJSccmWrksFqHDH7rfDWyXC11MPY4oPwiwTHvKkGHrA1?=
 =?us-ascii?Q?iWQG7RHHjkGjYEb4VSuKyn53DGhOa+NMpZMHV6KHjLNo7J3DCwVf4wqPzu4j?=
 =?us-ascii?Q?YXAxLFBCeVOgImoH6OpbMx9u6XA/TERcmMNhe8Lw+rAlH1mAaCxIlw5WTDtS?=
 =?us-ascii?Q?bOVZ7ISIyIyAclUh69waflAE?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4f20bbe4-ffc8-4f7a-446c-08d993a5526d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 08:40:51.3645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W991905@weidmueller.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Oct 2021 08:40:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157254

Am 20.10.2021 um 10:05 schrieb Konrad Weihmann via lists.openembedded.org:
> Jutst out of interest, why is this unnecessary?
> That might be worth an explanation as part of the commit message, esp as=
=20
> I think the assignments to 'configs' are still part of the class and now=
=20
> being unused

This is a fix-up of a previous commit [1]. The config is passed to the=20
NpmEnvironment object and unnecessary at the function call.

I deprecated the configs argument because you could pass configs via=20
args for a single run function call or via NpmEnvironment class for=20
multi run function calls.

[1]=20
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/classes/npm.bbc=
lass?id=3Dfe87ab0a6a6f0c3d3fef4dd24a526dca3f9bde23


>=20
> On 20.10.21 09:40, Stefan Herbrechtsmeier wrote:
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> Signed-off-by: Stefan Herbrechtsmeier=20
>> <stefan.herbrechtsmeier@weidmueller.com>
>> ---
>>
>> =C2=A0 meta/classes/npm.bbclass | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
>> index 547c531883..ba50fcac20 100644
>> --- a/meta/classes/npm.bbclass
>> +++ b/meta/classes/npm.bbclass
>> @@ -259,7 +259,7 @@ python npm_do_compile() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Pack and instal=
l the main package
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tarball =3D npm_p=
ack(env, d.getVar("NPM_PACKAGE"), tmpdir)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D "npm inst=
all %s %s" % (shlex.quote(tarball),=20
>> d.getVar("EXTRA_OENPM"))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env.run(cmd, args=3Dargs, co=
nfigs=3Dconfigs)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env.run(cmd, args=3Dargs)
>> =C2=A0 }
>> =C2=A0 npm_do_install() {
>>
>>
>>
>>
>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157253): https://lists.openembedded.org/g/openembedde=
d-core/message/157253
> Mute This Topic: https://lists.openembedded.org/mt/86459810/6374899
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
efan.herbrechtsmeier-oss@weidmueller.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

