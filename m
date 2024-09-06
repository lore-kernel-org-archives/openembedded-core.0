Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1C8CE7AE8
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 08:19:03 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.92.48.63])
 by mx.groups.io with SMTP id smtpd.web10.30366.1725610741704955531
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 01:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=eD5v0ZEA;
 spf=pass (domain: outlook.com, ip: 40.92.48.63, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=toobaF4ldBlXJ46oXNJ1Ba8BqEi4fSDnIaMpAUC0ByhMwwVi2jit0NMDhEcr8ZyrdE9RuDOVVm2d+GFfkk8Y1++wLf5+pAdb5tTwHI41/ZvY0+QcP3VpdLploESbzeGd8PLnA/s0NL0ObpkrKL/GhUuF61OqupO60EqaVSEL9Z5CX4XAW7J6x31jO4iQYYtZhUzlEELsgtHv5MRGrC7MtenSRrxcxi////Tx75REkFcA3l9Zc8x8IVyy9dQ1Wkxtn5rB7hdjaICZs5jw6hC64qKXHmFV+gdDMfPAvQCuMM4ztl829iHQHhDn3TIyak7adnHlpUrqwF0T6w/xupSPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APo2McGhhnFkpttqz4sh0ldfYFhrrJ7aNbM96nWNMnI=;
 b=JmFarcjl1ZS3WlB7NGbhVaqpU9sNozwiGyays3EfftJXaElkjw+cjB6Z5J+Mf61D8wFCGEgElxMl7Tlql6M8x9LpX99/UCB5SldfnOTxQiiDOJE4bpWXgWibJCDpaWymerH5kK6CqydcCT0h+RUCmopYmcJpomER+kjfXXbod3uNGHq/IaFXDYj6Upf3Dwfr0VeHcdHVrcx6tibFoHeXgs2+hYdzJINh3E94VefoIy2BJwV3e0z5RGk2T3krx0pUetrTDWedCltg5R5qwm7N7IS1wq7YBaqQIOTK4XpPgxtaDrQE6k+kGaU/2eIXgDMf5yZUITuiraakgSmggCpU+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APo2McGhhnFkpttqz4sh0ldfYFhrrJ7aNbM96nWNMnI=;
 b=eD5v0ZEAOwvfZLi6hMQ2kYdY3BFX1BHETgtYjmCwyvpivMWrdZG8rVjkioBeRC4zv6axY7DMYD+oRvmbEAS71KNpk60zwvDBqpcLm5LX974fWaZQKF0MgzM9m+Mn0bhZhP9Rm4xXAZCuZGGgAC3nGHBAwRRmswv0JLjzPDGcE1Yvy1IgjqHp/oJiREjlMGSQ7kqtR4l4be4X1pqKZ1K9uXTUC1dWvDcIexlbdfbsFqS5/Jwq2bzT7C54leek3JaSyvD4STadaeX8KzrpAcSWOxFkv24oVCZuSDEHTiMaawAGVNZLeXoElq32Mz3pE3NuFrRaXjYdEzaZJ7AoG1Xc1Q==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by VI1PR07MB6334.eurprd07.prod.outlook.com (2603:10a6:800:13d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 08:18:58 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 08:18:58 +0000
Message-ID: <GV1PR07MB9120DE957E20379890ADDFADA89E2@GV1PR07MB9120.eurprd07.prod.outlook.com>
Date: Fri, 6 Sep 2024 10:18:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] runqemu: lock tap creation process
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <GV1PR07MB91203A774F08D3110C579514A89C2@GV1PR07MB9120.eurprd07.prod.outlook.com>
 <67ea9ebc458af8adc9b8c625fea9b27e3b452f76.camel@linuxfoundation.org>
Content-Language: en-US
From: Konrad Weihmann <kweihmann@outlook.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
In-Reply-To: <67ea9ebc458af8adc9b8c625fea9b27e3b452f76.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TMN: [Vx8el1lYsSmU4xyY9/IXVlSKSROAQJBd3XGdeZg8vafVX6/m3sCeyHBYia/MAGFB]
X-ClientProxiedBy: BE1P281CA0289.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::16) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: <9be0522d-7ec7-415b-9c00-ea2d06e80607@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|VI1PR07MB6334:EE_
X-MS-Office365-Filtering-Correlation-Id: eca569bc-98f1-42ac-046a-08dcce4c8dd8
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|6090799003|5072599009|461199028|15080799006|8060799006|19110799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: 
	t/10iopF/Ea1/M57NU4rqXR4G/sZsno4wSFCyguVkyH2o26VUFFZIBpnnqIhfkSqLOUImPaNVOVsl/dK/MYSdIrt5lDBJm7FicPKy1DkUKeXG80x/Fj4rjyCZyzZ7rjMJ/KqBpkNgujp3QWuwH8QfH3DGmQwWAwsQ6Fk+eya6d6lIJTkDceOiCGSF0P3z8dqZkA70pzrxRyekWI8S36zAcMIDvI4hFjCFNmu/7z9SEkL5B+3jnEATjlu1NNC+mJpegyXbrMDv/Wvsf4PQCO56DEGLg+P+A0Ikx5uTlIvhAyXdta+2Rtf9qmCIuBgaqJtLFbIrsmFFnxdZq5/2Jr9pQ+Z4s+9FPYg4P8Bx8uK1NSs8NFZ889i1z0XsovZ3eavoxGJ2WW8FD3W+UilpcgXMN0KmnKc95Fz6I954H2qzzEC06HjQM4goz9aGA61oSjSgt+SdoMAMkKNIR2kO8HhIIhfYJ9ZWjis8Eiae6dr+LdSIpb6NBjMnAHvWg7/wxnSYX040UgW0kL5XAAX0FhaLdVQheXsljJjtIJxCP07kArcsVH8HkUxuy4wGDaskPxalERIkatdNNG/IiJV8+ncLv6sZHcvKghhMRbMU1/nBo44NPz/hg5CfpiKOYf2Qr8mXqR+sMXLh6rrL58E0L0dczGrDe1qeI3QojKEWBsYw9G5aV2mLYm42nAuXHjBoHIrgy6LiHI38YUbumd6Xr4/CeQU9dyEjicGhZ+/lSTftT8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5PBPTqG4f8KrwrU4j1+qGPUv1tO/coDf273PL4JIEMNEjapEXRvnY/ZBWD7P?=
 =?us-ascii?Q?4viQfIeOIrFlIkLbkRy0dQHH8QWP4I+Uy/7aFTnf5oud4jsz5b5xzOee6Tq0?=
 =?us-ascii?Q?VaO5r1HrbhpHx4jJd1d5SBQdX9/ob0juWj7afF0uLwYvyN5g4gz0KMEcCQOz?=
 =?us-ascii?Q?zF/4WPIxQuaC7sPf2lwKwoGe8Oy8av1d1Zjk1fmYyeAzSIVScikiFO2LDNDd?=
 =?us-ascii?Q?D5NTMJ6qKKg2UBkgZ4HU6LR2y6Bw1MYXxMug7in2VGErfakGxVHG2HX2VwQa?=
 =?us-ascii?Q?WGcQrb2U7TsUd7TUr+zSewrR4e+JinS6Mp2xwX+HfiJQC6GB8scuzvE17BKx?=
 =?us-ascii?Q?T1FkZ97qy0apUG3ez+NWF1ZRiBpol1DgK3VbW0FsRO23FQ4SHELlaX0VurQc?=
 =?us-ascii?Q?aUTv2PmDUfAMp/3HC3n04VRiMWfrEv6QnaIUEK6A9aDzQ/OHTfctTA+3zBNS?=
 =?us-ascii?Q?si4/FtmZMW0uApbUggx5Rk6KAiqyBga6zJ46N/lI4zKwBRBYJaHpqa8d++X6?=
 =?us-ascii?Q?FV8O8qYUhFZq8uTHlAP+HazrlmOFxwRlTqlhVG+i5thPCqlf7OEW1KWxeHie?=
 =?us-ascii?Q?+4R71qsUZ6QHO0s2gMZ+jRYT8T8xJDcOZjKWafkH/bGa2tGCBe0pQY5X2Q/2?=
 =?us-ascii?Q?nM9nSnOg1QrtkgmubKxuXaCUaAk/ppnV1IS7Ncz7qsXo75DnQ6ZWRduPtcd+?=
 =?us-ascii?Q?EfjOs8p605dtl1NncJJlsb3KvbRhR4yH1GSSofCnykMNiEjsdfLGl+yFY0hP?=
 =?us-ascii?Q?JN7+m/uAoa9YwLtv8uxEWJNjPv9O+ZARImOIDyVOitG85JROu2ODQ1JIH18l?=
 =?us-ascii?Q?1x+0uvIyPgg3EbXxnNg6kpS0xPb1QBtmlI647DwbPr6i86MPy5KYNRFsiucp?=
 =?us-ascii?Q?r0wH9I0hVQ84gpsUGEociE05fdfjCCaHHFrtBCx+S4xVDFMY43ZKFkalquLF?=
 =?us-ascii?Q?k0RDDJVHjO0c5l3rTkhamAf1holvIxRz7meHSGYyKYbC8+hN6myU0KPczDCP?=
 =?us-ascii?Q?g7tg/edgyi+14AnfdvYW/b4bpqIuj+beNH0/WSc1mGP8qtG6iL6TNDbAVz6f?=
 =?us-ascii?Q?Sy3UlXHqNVdJTl62vE9AV5qz7uIAU2RNrKYegeXHbz0bX1ZTSPQgx31ebS+N?=
 =?us-ascii?Q?6m0McgQpJpwvruCoCZqgn9Yts4kF+sLNd4d1JMkLCGzBdit8Vj4i9s9hrbLv?=
 =?us-ascii?Q?NpNTepTrTpp2KELDgmVcxWhu0L7aN3+gBfRsrLHGn3JoDBjF0ED/4UWDo7aa?=
 =?us-ascii?Q?8f3UARDkxlqXGsXUqK5wImpvv2cnO83T1Ucd2ircfnDwzrp+3JZy3wLiv+UB?=
 =?us-ascii?Q?D/8=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eca569bc-98f1-42ac-046a-08dcce4c8dd8
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 08:18:57.7374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6334
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 08:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204251



On 05.09.24 11:56, Richard Purdie wrote:
> On Wed, 2024-09-04 at 12:21 +0000, Konrad Weihmann via lists.openembedded=
.org wrote:
>> in case of running two or more runqemu instances in parallel
>> with no previously setup tap devices, the following happens:
>>
>> instance A probes for tap devices, but doesn't find
>> any, proceeds to generating tap devices with the sudo call,
>> resulting in tap0.
>> instance B starts to probes, finds tap0.
>> Both will lock tap0.
>>
>> tap0 will be then forwarded to qemu.
>> Instance A reporting
>>
>> "Using preconfigured tap device tap0"
>>
>> but then failing with
>>
>> qemu-system... could not configure /dev/net/tun (tap0): Device or resour=
ce busy
>>
>> To fix that, lock the entire tap creation process with
>> an exclusive file (blocking) lock, so only a single instance can
>> perform the non-atomic changes.
>>
>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>> ---
>>  =C2=A0scripts/runqemu | 10 ++++++++++
>>  =C2=A01 file changed, 10 insertions(+)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index 2817acb19f..e5db06be37 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -1163,6 +1163,9 @@ to your build configuration.
>>  =20
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.make_lock_dir(loc=
kdir)
>>  =20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tap_setup_lock =3D open(os.p=
ath.join(lockdir, '_tap_creation_lock'), 'w')
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fcntl.flock(tap_setup_lock, =
fcntl.LOCK_EX)
>> +
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D (ip, 'link')
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logger.debug('Running =
%s...' % str(cmd))
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip_link =3D subprocess=
.check_output(cmd).decode('utf-8')
>> @@ -1187,6 +1190,8 @@ to your build configuration.
>>  =20
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not tap:
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if os.path.exists(nosudo_flag):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 fcntl.flock(tap_setup_lock, fcntl.LOCK_UN)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 tap_setup_lock.close()
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 logger.error("Error: There are no available tap=
 devices to use for networking,")
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 logger.error("and I see %s exists, so I am not =
going to try creating" % nosudo_flag)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise RunQemuError("a new one with sudo.")
>=20
> This doesn't make sense to me. Surely you should be taking this lock
> *within* the "if not tap" code block since that is where the ifup is
> called out to with sudo? You appear to be dropping the lock there
> instead?

Right before the raise of an exception the lock should be released,=20
shouldn't it?
Otherwise we would rely on the fact that none of the calling functions=20
does any exception handling and
the entire process fails to release the lock.

>=20
> It appears you're putting the locking around the search for pre-
> configured tap devices which is already atomic and working well from a
> race perspective?

That is the actual race condition here.
On the on hand you have the search function, which in itself is atomic=20
and save yes but then you have the setup function below

1198            try:
1199                tap =3D=20
subprocess.check_output(cmd).decode('utf-8').strip()
1200            except subprocess.CalledProcessError as e:
1201                logger.error('Setting up tap device failed:\n%s\nRun=20
runqemu-gen-tapdevs to manually create one.' % str(e))
1202                sys.exit(1)
1203            lockfile =3D os.path.join(lockdir, tap)
1204            self.taplock =3D lockfile + '.lock'
1205            self.acquire_taplock()

the section from line 1199 till 1205 is completely unguarded from a lock=20
perspective.
Meaning (and I think that is what is actually happening) that the new=20
tap device is created as the result of line 1199 by process A but locked=20
by process B, as the search function finds it and acquires the lock.
So in my opinion the entirely function needs to allow only a single=20
instance to work on it (at least that is the most straight forward=20
solution I can imagine).
The only thing I couldn't figure out in the hundreds of test runs is,=20
why the 1205 line lock isn't failing with an error, nevertheless this=20
should be fixed and a function wide exclusive lock fixed the issue for me.

>=20
>> @@ -1198,6 +1203,8 @@ to your build configuration.
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 try:
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 tap =3D subprocess.check_output(cmd).decode('ut=
f-8').strip()
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 except subprocess.CalledProcessError as e:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 fcntl.flock(tap_setup_lock, fcntl.LOCK_UN)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 tap_setup_lock.close()
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 logger.error('Setting up tap device failed:\n%s=
\nRun runqemu-gen-tapdevs to manually create one.' % str(e))
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 sys.exit(1)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 lockfile =3D os.path.join(lockdir, tap)
>> @@ -1206,6 +1213,9 @@ to your build configuration.
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 self.cleantap =3D True
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 logger.debug('Created tap: %s' % tap)
>>  =20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fcntl.flock(tap_setup_lock, =
fcntl.LOCK_UN)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tap_setup_lock.close()
>=20
> For locks like this, they should really be in a try/finally or with claus=
e...

So you want to wrap up everything into a with block, is that what you meant=
?

>=20
> Cheers,
>=20
> Richard

