Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CA3C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:14:18 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.92.66.93])
 by mx.groups.io with SMTP id smtpd.web11.13410.1646327656603763729
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:14:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=R348ReJb;
 spf=pass (domain: outlook.com, ip: 40.92.66.93,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvqFHcLH48EilubwXtU63v2IhwQq1hNzFxgwqOgMnihuDb3to6QO47JVXXY13QMOTnwAiGE/HvFwHsabB7cbXe4UNYoey1H4sgPiZRSTXbCSYgE0+AJEP2dCzcLN787QZGamniI5Mjcjyv0oL+lN8MBhpv/ZQvAh3Q0+dE+0qNqqSTa6HTXFRoL+XNtXPIH7IizzJHskvbShE7QC6k1bD0ocKFo3YHJQHxzO8SdF3sPLr2C9isAQwlK6zM3XUGESJf0U70jpbbOjWIzT9emzq8+/8W5HHAFBKtZ/m82iLGdLWBA1g80AqNoEBsMw00ZwMrwgWIbVsno3nfRb4xlZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xV9nrN3WAJJlV+cB2QNxefxMI6whw5/GZqUzQ8irCk=;
 b=RgBfNXTwQvYiRBbvC8Mr0AXvH9tQ5Mlb9ds98rEDljUdoRJU898Dt2ZmKJEPXJEqwldkz4N3BtuKSfpI132SiE+MOOwIoaVsvyosqCmoAYfpvj9ixS/OPYO+kIRApiKNF4MhMfYPWPW4LdeqRuqWQ5ZqvSFDEmPSs4b4jY/biiIm3rTLgEb6G3hRXo1Wzhwunc+dPS1quYdcnfv8Ad2bHWhMMnbyAEtuZP2Z7lmpbVTexhn/Xu57Gg8EF3wWDkh/5GJUZOS/6wst3Hue4uIFCXhGJnLSrkqQMZCi+NQTlrok/weq2erR4/Oj2JFkx9DAq33C/HMWgptJI5DmaeAz8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xV9nrN3WAJJlV+cB2QNxefxMI6whw5/GZqUzQ8irCk=;
 b=R348ReJbfwfHP7F0K+rmmm3AMWz6E1kmtFF9E4mUNmHr2tQA0s6SDBQg/pchX1ZkfXnIxvKuTxPS4r+G2YpqNYVgJuZrtPC0uTxcWzSEOtnmjdTvOL2OW1A/r/Col+DrgIYhLn/0P6BKLLAgPIQkg7hxStEI8Ye+eJMI8KmwxETobvE5Soy/Djww+ptznAGn59EfmkCY3djLUVSBn10n8CUpCss/6wWDjOuUgFgrFofBCgAKdHgl0B53uEKo7FqetetOZRRmftwTbFWfNFpdNcPEx4GMosTMcZv7OLaRaZS0T+70JHKwUF5vlKm1FwQpuddibjMM9iZagpluuuS9dg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by DB8PR09MB4092.eurprd09.prod.outlook.com (2603:10a6:10:124::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 17:14:13 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.015; Thu, 3 Mar 2022
 17:14:13 +0000
Message-ID: 
 <AM9PR09MB464230F59E3F613203A327BFA8049@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 3 Mar 2022 18:14:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH 1/2] python3-native: Remove all pyc files
Content-Language: en-US
From: Konrad Weihmann <kweihmann@outlook.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220303163451.336518-1-richard.purdie@linuxfoundation.org>
 <16D8EE213DFCFBC2.18834@lists.openembedded.org>
In-Reply-To: <16D8EE213DFCFBC2.18834@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TMN: [bgBCHoBcuML6aUM0FSIjxccUiXmEkSJV0tcpRVN66bxzQR+FRQNTi7sZ/gMdy0h4]
X-ClientProxiedBy: AM7PR03CA0015.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::25) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <529c6ee2-f6f4-55e3-2e3e-4280ee1d015d@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33da970e-8170-4228-9a61-08d9fd393d52
X-MS-TrafficTypeDiagnostic: DB8PR09MB4092:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7G7+4sed7yeSXAlgzDGksku2JEHnSqZKVzH0ti9AREeypFsKvK0vxqsZbZ8qi2sf/dG0FNPOL8SheFHw6Pg3oTkx+tAOW03sKCimqa+pMGgKQr7MssMGywuE44aT10nSEqyO3vnGjgFZNDaDVmmd3eJz90rIWtptC+O5iQSM9HTNG5Myw9ihiqFJx5lXnM7YgqW9C46zNZfqVtEUrxrs2TVLPIttt0CbYq4hgIinazPpO+tbuJduYs1p2efsEs8vTk4KeebSmFWVtZghi6tD/GYmJrTIYLQ5ZwvvQHNoHHauCxwO5l6Pp9VO5jFp5Z3JmMu9HJgcUQLn02ZsIU1E1Gf+avr4Y/ZZxyRf6Ovm9flpll26wh98brSpE+lLwyDLmklkVnnVso9S6ynJdN2geiZdgqXhWNmYgXI6EDo2WD2yLn8hFKVviYIu1CSzJCaL1SSlTGvsjgwI2ZnchOnR8d+3rQK4aMBdCU1Q0yMovvMLtmBf0ws0WcmCHJtudYMyZJOAScKdS3earFGhGQbwWi49ebm61t0bQkIfw38YqZi0fsO1jQbCyx47r5ML28e6pm2KN+zz524ecqWrLDGCqOT0Nz53WWhViRj2QGJJFbGMaECNTVSHYe1UmrI4coi543YMXlU9LrcThhuMwZ/Rrqc/ZfE2Eqss5M6rUpO+pXs=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?knebMeLlItMXOoaRXxHjjGX5egk7LSfzo2wnhpjQLLrrMIIxTaS/tm2qsP/M?=
 =?us-ascii?Q?jxBkj3yKhCgbFtmT/8rFjpHy7F/9pNgYi4qqP9x3LJjdji5WRhdU+BgqXmgi?=
 =?us-ascii?Q?/MXFwQNQf8tsMPjKlYLQuJfFHiOR8+FPcROLrOdnGhFmdoFcSzwy3GTB6Cs0?=
 =?us-ascii?Q?HkLjL6p2daW3o5Tl7Wisz0KtWBBRmtCs2iibcLnZ6Vvr11TNNEU4JNZOKjFW?=
 =?us-ascii?Q?ofwg29BjUmf9IiX0fSW2CuG0tLoDcROhLh3+0JAp8VEf6njWS134JhJxRhIA?=
 =?us-ascii?Q?GokeKbGFKIvH2DbMJEhHHs+uMm8lK5ULdqBJbbgdCQ1E0pJO4l1DrAkveKM3?=
 =?us-ascii?Q?ThOvDs5j2l/OPz2yRYN2guuS0P78dKXtP31/1nu3icm5qv8lgO6L0Z5tG0OM?=
 =?us-ascii?Q?XhYoK8FOPxxq8Avgg7uGpJh3OrugBrNQ+njiEpXq8Zu41y5r0mFJA5JtJWKd?=
 =?us-ascii?Q?NihnajwyeqsGqYr15CGyGZLy641Bw4HziyP8azzlwHKAqSfmxfbu9jeOxzT6?=
 =?us-ascii?Q?+Pf00PQMow3MWuywpu881AUlmBUZFBqfPlgH5rF0/Jqv8sCHSq4rbXGQSPFc?=
 =?us-ascii?Q?dL1A6aM8v0VB2WisWFp+g4vxyw3aA2N091m3TrBb8+etYp1WIUuxjkZwxvQR?=
 =?us-ascii?Q?ab9hXCzXHpLYhdHhT4R1ti/R5e3cVYKe/yOpfGSUYFIM2ltwEBW3B8EUS3zq?=
 =?us-ascii?Q?iXIORn1ySn6syxYeXgjkWMq0QnBfS2sIjRgOugzM8pFfwjCu8aKHmzyCHzz8?=
 =?us-ascii?Q?n6R2FFWGERfwtIgkwy8TqPm1fUGaUlguxtT84B4TE7mSrUaDzms44FFvpuJL?=
 =?us-ascii?Q?eWu4NNAD8xrVQVWzGvslLSgFjMkbTQI2SSd0QYarlDLoXm07BGNAab5AEOCC?=
 =?us-ascii?Q?s2GAJEx3Vkcp1FaVbwnohoFZZDPRVfXKWZ4+H6FqVJNjXdIJaTVQcto0PV3h?=
 =?us-ascii?Q?i0qNx7OYfLj/XHqwRd2lY1zh3077U63JtOfVbfu4Za86CVCJCpu8h4x4LGDN?=
 =?us-ascii?Q?skc+BiDW8Tj3/HRlBO8ewA34lg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 33da970e-8170-4228-9a61-08d9fd393d52
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 17:14:13.5609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB4092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:14:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162667



On 03.03.22 18:11, Konrad Weihmann wrote:
>=20
>=20
> On 03.03.22 17:34, Richard Purdie wrote:
>> This removes a further 1600 files from sstate handling and lets python
>> create the ones it wants at runtime which is likely much better overall
>> for performance.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>> =C2=A0 meta/recipes-devtools/python/python3_3.10.2.bb | 7 ++++++-
>> =C2=A0 1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/python/python3_3.10.2.bb=20
>> b/meta/recipes-devtools/python/python3_3.10.2.bb
>> index b28aa6505a0..7ec443a531f 100644
>> --- a/meta/recipes-devtools/python/python3_3.10.2.bb
>> +++ b/meta/recipes-devtools/python/python3_3.10.2.bb
>> @@ -156,7 +156,12 @@ do_install:append:class-native() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Remove the opt-=
1.pyc and opt-2.pyc files. There are over=20
>> 3,000 of them
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # and the overhea=
d in each recipe-sysroot-native isn't worth=20
>> it, particularly
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # when they're on=
ly used for python called with -O or -OO.
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 find ${D} -name *opt-*.pyc -=
delete
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #find ${D} -name *opt-*.pyc =
-delete
>=20
> This here looks like a leftover - guess that could be removed.
>=20
> Thx for finally making that happen (I've done the same for quite a while=
=20
> in an extension in my setup) - I remember there was a bug about pyc=20
> leading to weird staging issues, I opened up like a year or two.
> Guess that one could be closed when this is merged

For reference: it's this bug here=20
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13868

>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Remove all pyc files. Ther=
e are a ton of them and it is=20
>> probably faster to let
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # python create the ones it =
wants at runtime rather than=20
>> manage in the sstate
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # tarballs and sysroot creat=
ion.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 find ${D} -name *.pyc -delet=
e
>> +
>> =C2=A0 }
>> =C2=A0 do_install:append() {
>>
>>
>>
>>
>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162666): https://lists.openembedded.org/g/openembedde=
d-core/message/162666
> Mute This Topic: https://lists.openembedded.org/mt/89528765/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kw=
eihmann@outlook.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

