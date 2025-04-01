Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F66AC36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 14:09:27 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.128])
 by mx.groups.io with SMTP id smtpd.web10.20092.1743516561395734912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 07:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=DWiYmSEo;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.66.128, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGovpM0ONRtCMCVF4epuO2wjc205Y53xl92ertu3aMU+KLNrk7U9XZsvzYHnMdSjiDoIVp4Uas05EFn6I50VkUusO/JAuqV/4nVYxgfZlYNPvmMPKgY9p6yNhuADiRq3Ik4gve4G7GnV3n1YetcqjNoRKHwyAtvh4YWMoRWk/BQJXxHWHnSRkZzTam0VyIr9BAvtGZrKCnae9aA/qVKIDk3u3CfA4RKerxFr8IxzKnPf4jcSwVLunhKsBaKoYeVTh84XDbhHqm5KtamcIr1FBSzk6BygOQ9JzSQseYi5sbjjYCuJUfG/O/wRNXW+FWOmDnHgd3j+vFnUcSK/qzCTng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqb48+mokLVm9bAA+ND9jWxhM0SZlPobu+lRmBjYGmM=;
 b=Bp2gdGhkVg1vtkD31WGjNg+YAe1RfrlM2kzQdpun8DfO7yZ8yhUHAioRgQD5gdwLQWTzKAW0aQgfWVlMtMdfxhoNqCRwDBOADHBwVgVvnZQscmhpcIjneUjQicr/4rwO728jEg9wneyTcBOZin+oq/gFB4/QuzN0X03KdJucqPRJ2zJ1SZu38HWVggbigsuIQxSiO0aq/YL0vPi2bSiSEeMleDeuMiTxzKSO5T+LZ/LhLc4u1PyZETcNtjzFLnNfWQomhAIPvFlp3g+qTmdxswe4OZO4nAmQy4vQszAcAClrds4q75dMFZwzaRMGztuxPxZZHDiMp3ocEHI4214prQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqb48+mokLVm9bAA+ND9jWxhM0SZlPobu+lRmBjYGmM=;
 b=DWiYmSEoTWT+OTK46FZIvANEB3Tgv81MpD5ct4oqcNSLmqKSnRQHA/sDy9cWJbtDiv/wTWSPc5ilpzoyFGu5uG5BuVIBgLPT2ULOEU8mQxrneV6dbWkcOReJ0bWyUKZcWSg78jTZUZMZexw53ApBWNJ4acpHOxEh8vCSH7QoINAIWwdp1G5d/mVlGO5NphdGXXJR/cBHFZnhwPLh6QqDIxSgKYkcxMwAXUTjFIrzR/xWp4dG6R8Q0VCWbQf747aBvMs4y8sCC6uj7V4Q1cTjJaCUlicQkSgRv+XGkjMxYUyhiwR3WSHdSjMUK2pFzN6bKT/ZidJm3dTc3mMNN9BmQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GV1PR06MB9764.eurprd06.prod.outlook.com (2603:10a6:150:1cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 14:09:15 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 14:09:15 +0000
Message-ID: <d5f4b8cb-6671-4ebf-b427-2a5d882c2ee7@vaisala.com>
Date: Tue, 1 Apr 2025 17:09:14 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 3/6] dbus-glib: Support using alternative
 runtime D-Bus
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com
References: <20250401113129.3531757-1-niko.mauno@vaisala.com>
 <20250401113129.3531757-3-niko.mauno@vaisala.com>
 <26c4befa690a5d824489710d5ed8c5e66ac4d2df.camel@linuxfoundation.org>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <26c4befa690a5d824489710d5ed8c5e66ac4d2df.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P192CA0047.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::19) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GV1PR06MB9764:EE_
X-MS-Office365-Filtering-Correlation-Id: cd14894c-ae26-4dc9-06df-08dd7126c8d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/+kjCMv5X945AsPLy6Zpe6b3NGIj4iPfmjRXLaNnopbWzAI/r1sVbCZiAYyY?=
 =?us-ascii?Q?oFN1tlYmwv5WIq1CilPOJgArzBaGCZgxprSSvABlq5m+SubJsRAVtGiLQy9W?=
 =?us-ascii?Q?UUuCHDDrOkbYYVku+3+Uv44PiNfAg4GsUU60v5EYDLRdQMAvWvSNC8uTc8MS?=
 =?us-ascii?Q?vIMxA0VE9bQ8I8Sm8Q0R7bfiJCBKqeGG4Bl5qVAeKXKqB9OcBaiZmegHQCoR?=
 =?us-ascii?Q?NCdxPnvV5eVR4qsxFkazhZ+jtdyIR9aurIhi4IsBqD/inGHN/JbMjOEMNQen?=
 =?us-ascii?Q?DRbZEJ5L3JRvXUdNTEB0+RCEDbG0gqa1CvnLr9kCMx+RuSQ4Nnpiw1u0V3/o?=
 =?us-ascii?Q?o+PGlgo0+hE6m2oAOYvQ6UYPBhyWiRba5XogZeDXu0gAy0TGXa1tcZQp+G1Q?=
 =?us-ascii?Q?Qeg8DkNTqIL0iY0dEHLz0BPdEbq9gXcXuSNoG+MV2WBe1zfWKu/ewcUIOFjg?=
 =?us-ascii?Q?UpXjQq4MIqe3QiDVFIsPFl2pUwfA9AzBDGVMzUvHwW87bNknRz7QcNOCa2Nh?=
 =?us-ascii?Q?Tizwq5XqsLP8xcTG0fF3mu/e4jLYIwqiRuntZm6zAzTaU5k7hTUGbVy5uWdN?=
 =?us-ascii?Q?51UomfaYoGH7o5BdFPHhJWcfua3kg9dQfrE3oFTiDQlTe1cejvUCClTZGhK3?=
 =?us-ascii?Q?voKJ5I8ubkJ6mxNlJMIKuj3qKp8yWvEeIgQ9z1/gto9/HBEgAZx1Q9vnVrpn?=
 =?us-ascii?Q?ep40T2siHhdAm730i1r+CwtIKTT4oLNRg8DAUPrL1KmXZYhaUmfi+BtNYb5E?=
 =?us-ascii?Q?yDqayIb13bnQwztMslWM2q6fUwDpTQwoSPBQb44iqUKsqUd2xcRzsgioYulF?=
 =?us-ascii?Q?hSOygaFhWRcWi7jKL/E3tD94mzJja6+BwPDAh8xMQ7oEwfPSM6/T3jsF0h1P?=
 =?us-ascii?Q?V1sFrg77kvxCHOlwMe0sbYH+7qZDi4HWqDTZiohaHe1kkA6h7Lxw1lPSqdj4?=
 =?us-ascii?Q?v5bCs2jFTlWj1mkZEeJ6PnF37lyQ783a4YG0cKhuow/UambDWTzBm650PVeN?=
 =?us-ascii?Q?imEuxmeqn5qsuMQbKo/GBppnjh9QdjEb8sOFl9YfWyMqn72QS6jY+v5lyJBf?=
 =?us-ascii?Q?ZEHopNJ5pEJlwHLMiIcP4LevsLBRrfZsmnBzkAKmkhf5TtU2KoK5U68CpeQY?=
 =?us-ascii?Q?kmBJe5heK5FHvVkmrI/mb8Yw8AcQ7J2RtBXq3SPo4Z/XTNR1164h8qRBRdCG?=
 =?us-ascii?Q?wkTcsQ9Wsem6Qe1A1u1i/jk7akoxuY+esQxetjEDfCU0YC6bQHZSCDgFs3oS?=
 =?us-ascii?Q?2F33QKyVgPCipqqXpPHKWirH0YDTNj/vBkvt25cCvZMmkFrPeHzuxp2Vs8Z7?=
 =?us-ascii?Q?OexvxdNA2AWSaPVxSqPYNWoN3mGMg/LPyu2wiVMmrO0BwHt4/0clHNKBoOAv?=
 =?us-ascii?Q?Jrp+I9wYh7HE51LYiadLkPs4GB15?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6wgUSu+RZ7SM6+eR4ILbf6uT4MYLjTNrJGccMMCYFviWjmj/i3da7cS78Eqs?=
 =?us-ascii?Q?OCesoXZlIEbGf9YWe4tX+fxSZy8VeqzL5LHPbUQcaZ4YYZBJTmhWhZ0h49NI?=
 =?us-ascii?Q?adqi8TAXmR7YpzTV0pfvCcQL3fzNY6vI3KpcjXihpDD+ORixHcLTppixlCcr?=
 =?us-ascii?Q?NiQO7Q5JikbQ+/jfZq+FnETmG1MGltCLv2Kd+2V5D2s5s9Um3fLGuwqqJFMu?=
 =?us-ascii?Q?RkB6/pWQYYRJJ1G04Pzb+FIOk4R7Ecg60yOMxlnkrp6r4Rw5Fw0MxnBXZYvQ?=
 =?us-ascii?Q?i6ziw9JVrkEzknMET1wzTr9IlcxdSYT63chA1aiLEqWVxAW3uMHQa5I61IvF?=
 =?us-ascii?Q?QGnAtz3nOsHBNYJLnHshAcXNhg6ZkXKFMRNxNNUouEbQWZ2MDhOQ6f/HfFoP?=
 =?us-ascii?Q?CIrLU4jH3j8R8nxrJnIz4I0wgpwEusj1r7Pb6OzJiLGAEbXEFr61srV1FLSs?=
 =?us-ascii?Q?3kS6wtmo0qAoREX+5G6Gs/+cdZJf482WGMBBZftu77zK9FYclCaunVsEHTNo?=
 =?us-ascii?Q?uUTuAFvjJaTYYMsORbu7SqZrp3ttg6tZKSF6Au9EckTjwOdap5efi1FIrTjL?=
 =?us-ascii?Q?Q7iSC0XR1IAqTIqRN/FCjprrysjndZ/JNRYrMrWEKFV3BA7Ml6jLgmxqPkFd?=
 =?us-ascii?Q?ad+92MVuztarg9Y+4Qh2e8H9AUbARDzorudXQZ7EoEiVEtBrP1Bb7UL3r9DP?=
 =?us-ascii?Q?lS4QKFI+NBupBUywcHhs1DcpZQpOCEw2Gp4akV90G3eLdAhNtWOfWVKv0Hr4?=
 =?us-ascii?Q?SVKMBVWv95aCJ5gN1KP4fcBQqU+EOu4fCsKGAPpGJPZoLpni08fc4pUXAA3n?=
 =?us-ascii?Q?Za08zaExXSMxioqSzWrlud9W7n0GONWLmw5YqcgEgk2sqTu8BtRi7PZKwsII?=
 =?us-ascii?Q?DZ1j0dYqRG3m0S8zcbZG6cRxfP0WY/UgPH5Qlpl7x23HAPKijA9aGpnD3DSW?=
 =?us-ascii?Q?cbsGj1ze8AwB3reNFqYoaqMAz6xugjKTmbW+2/fAG5iVjUf4nRNQHlQSpzZO?=
 =?us-ascii?Q?yYOrFt4dySA2faFj6svY3ZyqcFBrGaz5BUUt42LmWifZgmOCz2InSQQUprIP?=
 =?us-ascii?Q?T7uPENUkYEY3AqmwTXYL523MGoQ/k78C3PKbiXucwTCLcYRbF5+7NsC3Tg+z?=
 =?us-ascii?Q?BDRFIK//romyf1DJQO/nCnOIbCdaN/1cNKYI9iel4IK6Q4eIrxddVIJUYMvS?=
 =?us-ascii?Q?pzHfpnj12TF4CZEjrzLZ7HoN3mrO1hQPGv2nkquAjR4xTHH98/CevBzMQ0MU?=
 =?us-ascii?Q?HP+Aem/dPPL+S7C7NTSKqaIDIpQ+Nww/77550xUnZKWCi3k+3MtLUZuL5sBH?=
 =?us-ascii?Q?YkmdK7Il4BvbXbs8S4V53+zi9MXI31P8g1HvEVZTuG8C4UlJaB3HXdTlZbWz?=
 =?us-ascii?Q?29BAMfbnfjdFI75iEBPYioXz+qWCQVhzaXhJa75s3ICFBunHp0e5DPk1pBry?=
 =?us-ascii?Q?PyF8tM7DHe1zkeLKWOcRxnJ2Q3fcxTOSvYXNZUmhcJI+ZySWTAmABw3aoWVt?=
 =?us-ascii?Q?HPPRAnymdpFGDeTHVirCcjy+JuT5o/rLZgsjXNv+EYKdFoBaodUu4qSboMYL?=
 =?us-ascii?Q?0Nl/EdMIPcMhdYa9YmoBnJ+cMYSz1P3AG8F3MylZOF9Ag1+BSSW/KatqJvVW?=
 =?us-ascii?Q?Bg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd14894c-ae26-4dc9-06df-08dd7126c8d4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 14:09:14.9956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eW0hl4woNyCA4y30SUvBTuc/x2Qtb+XH4hy9yved7Vhoy9zZ8ZHKDFDUEWeJ1hwWGlnhS+iuZmh3U9a8jGAwCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB9764
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 14:09:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214135



On 1.4.2025 15.29, Richard Purdie wrote:
> On Tue, 2025-04-01 at 11:31 +0000, Niko Mauno via
> lists.openembedded.org wrote:
>> In order to facilitate oe-core users who wish to use e.g. dbus-broker
>> as their runtime D-Bus implementation, decouple the target specific
>> dbus-glib runtime recommendation to honor the new VIRTUAL-
>> RUNTIME_dbus
>> variable.
>>
>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>> ---
>>  =C2=A0meta/recipes-core/dbus/dbus-glib_0.114.bb | 4 +++-
>>  =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/dbus/dbus-glib_0.114.bb
>> b/meta/recipes-core/dbus/dbus-glib_0.114.bb
>> index ff7c2d6613..7908a02747 100644
>> --- a/meta/recipes-core/dbus/dbus-glib_0.114.bb
>> +++ b/meta/recipes-core/dbus/dbus-glib_0.114.bb
>> @@ -38,7 +38,9 @@ LICENSE:${PN}-bash-completion =3D "GPL-2.0-or-later"
>>  =C2=A0FILES:${PN}-dev +=3D "${libdir}/dbus-1.0/include ${bindir}/dbus-g=
lib-
>> tool"
>>  =C2=A0FILES:${PN}-dev +=3D "${bindir}/dbus-binding-tool"
>>  =20
>> -RDEPENDS:${PN}-tests +=3D "dbus"
>> +RDEPENDS:${PN}-tests:class-target +=3D "${VIRTUAL-RUNTIME_dbus}"
>> +RDEPENDS:${PN}-tests:class-native +=3D "dbus"
>> +RDEPENDS:${PN}-tests:class-nativesdk +=3D "dbus"
>>  =20
>=20
> This looks convoluted and probably incorrect and unnecessary.
>=20
> I'd suggest changing this to:
>=20
> RDEPENDS:${PN}-tests =3D "${PN}"
>=20
> and then relying on the main library having the right dependencies
> (which it has). The tests need the library to run anyway.
>=20
> Cheers,
>=20
> Richard
>=20

Thank you Richard, submitted v4 which includes the suggested change.
-Niko

