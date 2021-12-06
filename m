Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527C9C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 16:41:52 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.61])
 by mx.groups.io with SMTP id smtpd.web12.54116.1638808911192623981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 08:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=pdQyVJni;
 spf=pass (domain: outlook.com, ip: 40.92.75.61,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnxPYPFGXKi86xTPsYp04rWJpi3+o2YTuyj/TvrlOaYqCToLDtPoe/5VAhW9QpBvfkKhF0e2nMBRaw0wUMAFq0Iee68gm6ZjaW3164NdMP1zHnij9xB3BYmIUqsMpZh3lQeQndsdZbOBvlv/5vU79klmZd31buaocWfQrHD+2zJMN/a2udHFVQ4o2vc+I0nEjr7IALnSjt15EcR8vJrtoPob6pBXukCtOOFAOilBDEFnP1ITp27TcxG46Qem6wJI44BVn4sJnZwWKuBXBUGMWdIEpfHAh6vTHr9Au3NRJI0tESCLsBtHa5yZg8U8SWQ0rh8A2oHbb9Xl+lDyQDlLGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YK/pqSU5wXJ66dlUoCSnt2H5alNDT2gQTYWBSgFcGs=;
 b=VKahAewxn0jYw6rkIW2aCRp5F6ttLdC4Z0qgfML8Jp6AkG/HqLpxpbE8ngZXJnbfbG9X+X7LfLV+ZY9S0+hrxrgoqMCz/1S0KpI7jyztg8yBpp2TSrUSFgRQpo+AEJbOaVrylaAGG2UJ+1EQH1b6PSUSArD2ILo4ZiS6xIcN1cwLyWY7nVjdK6B0P+0tSQkd/txDaeXYu2iDanHHr5J1EQKwQmkigZC+8o94fHYcG4mP6t8xyEOsM9BOv6sJOUTQuOr2kJvyENzjxGNNFgTRYf2O2fqvvRuMatpRmJOZBErMS9rcx4PFfG1xm1PlEL1mutIZhU29y5QSmn1XFwap4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YK/pqSU5wXJ66dlUoCSnt2H5alNDT2gQTYWBSgFcGs=;
 b=pdQyVJniXqA8+WfHUSrhCxXW37qgKHz7e5YPqFnRqnIAymkddg3yS8DzxzqIoO4UEjTkFDch8Y4WgySDw59sqByz19c/39iEF+Hyx6fWxRoeSTkU/+8ChoiXs/ueUvl/fXKZ5MR4VFycEXm99faWSOE+oVBKcA4zXxxR28pEqKQNJ7ysW+qiur9cpv5lOvptGMrN6tqwaYt9FIyAB0/S6gX9HZ+gPRInsNAGIOW6NiBMfwAMN6ARSqbUNBymQsCAjTG4sJ3cUWQ/yNMMO25ILOJWBNkHbCuywt7EVZAaggKqgLCvfp1+27GHQ7bg9nppWIAkm9NRwms/ge2GuHxjzA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2354.eurprd09.prod.outlook.com (2603:10a6:208:d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Mon, 6 Dec
 2021 16:41:47 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 16:41:48 +0000
Subject: Re: [OE-core] [PATCH] minicom: Upgrade 2.7.1 -> 2.8
From: Konrad Weihmann <kweihmann@outlook.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
CC: OE-core <openembedded-core@lists.openembedded.org>
References: <20211206130634.500693-1-richard.purdie@linuxfoundation.org>
 <CANNYZj8r-3BvcYnaiBbTGzBJ_iAPg6Sn83Dt4N4NLUh+vP-=yQ@mail.gmail.com>
 <f0d640e1911f8e9577ef7ee5ffef426b084861f4.camel@linuxfoundation.org>
 <CANNYZj82Y67WWDXi0FPHu1sEPCxkK4eUiA3_2km0t-sscr_Oig@mail.gmail.com>
 <16BE3764EC109E5A.28785@lists.openembedded.org>
Message-ID: 
 <AM9PR09MB46424FBD593826C43E06C47DA86D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 6 Dec 2021 17:41:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16BE3764EC109E5A.28785@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-TMN: [LoahPjQGEqjz0zt4uQ7TcyaFD9UadwP7]
X-ClientProxiedBy: FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::15) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <8bfc09ab-1e04-f3f7-3d34-f24897d7220c@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.20] (176.2.232.143) by
 FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 6 Dec 2021 16:41:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87879a7d-591a-4dd2-0994-08d9b8d74be4
X-MS-TrafficTypeDiagnostic: AM0PR09MB2354:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WcqvxAiaOQj4+RhBpitizBwqX2ELZFRjIRVgI0Dk1RX4ex4P4VkLKSJW7ESXaQzyoFy5GURSTMGaC3by/jTwAWMAscQBQoT6utLAYBGwzOKMRs5dR6jRIqJTepPTp5UMFA/dgFONy60NTXnKHdszqK4x3fkWAjFgLHMnhg25ULqbH+gAu4vBl5dsDnng8wGCGMiOO+Z9Xzq/shNIToQmO7vYfyAomu4ee8sUzCsEqkptkCnpcm3+Zn68TywCbizj4/aLKECSF2fjau6bCBnGMhNLQjV0v9d3CIXVH1ThJmEkDcatwwqRoC8n7nn2Fa7O0SZwmvsfYzBbzmkhmc1x3HSclwDBc1F4sor3BS7Po4SWrSWEaWCk7YBYv8cUTbeqT0LiYcEJefhIp5qe+qfKl0GHb+L5TBsgV11T8zG/qXETVIjw/WfB67xE60XQ3lmkGyjEyNonVJBwwykTChLKfQFKPY8T/Sg640IuC/kbu6J0Axr3DmHQJKH/Y43vNriGEGSGuqN8fcyATJmi1RNX4KgXc6LzZkISevPJeWnTRl1wPTnzSdosVKwjpnlf4fkwVZhx4Ng9Q8Fx/YMIvwbv6SYHRZcbB6GuQgQ+mww9wWZHgdQ65tILbPmrSnzzMXAWPJbpi2PxsrkzPSxcGDpurD5Y2bywTCTqK1QfeHhv/WY=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0zcXkX/PINbmD4AqdrnX4OOm1VywZzdfNwbkvfIrgt92sEZ33b8AKDPW5YBJFUjkRDmazJOT2t6FawQkmCo6gE7yj8oHY8hDI6KJ5TRwKAhGPzHKhHKj3dnBj/YYP/TM2/MOGjSxApN1Fk8GJLy4+feuDsMEbw27qRxd679Bcz+dy2kE37JOWk+2QKw3NuM0k1at0/mTgaIPjKLKmhP7nS8eBGGx8cIcynM75JPOfECJmQDccGMJpQ8Dn9TRZCGcRHsLazH7XGBibqEEo1wPjFAYaPVXTfWBAhod0jiFCaXhjoA7LiuadBpPt1qbEsIShJSRcqyBdyN7zFL/eHboT29ifxbnemPrCOgEwf9A0jI47daW/TqHMapaKpU4BZ5P50vziHqFHuTy2wQ70WoEzoHZpb5EDDCpCm2dMYZmKtJ8XsDth52ABn+H9HdHxfSz6xlau/sZwkBgaLSul71Fsjm1CDh0+5IKkozAVcVmQNw8bBqywDaf/rdjKVMkXOoL8jRZDCbKJ7+hLwQJc9FRh6QTHy0nFppeWJQVN9dSF3nK6/lzHz4F77ZuB2AClike3Vkp+780XPiVKO3G8HBH4+3s7pbI3HmwESrpJ175lu0yI60daohAtzax59819nYbNP7D1rts0zZn9inyX66falq2MURpOhSfuUFvpO+/+55oOPmwVXtQyopJalcalJhlja45UjcknlEut4XLuxw4GWmkLePcXev53O9swGy3zlV509pIG2hfRjpKCJ9dpeglupSqVoTbazDFqVwJcjrkQEZZIHm+PgNxSVavv1JDATUM8nSmYwO7mJ2KViSslrQ7PnJgm8RFIOIlPp5tPiLwOj8d3wc3bIrroPxGQDDW25HZmdBTkVGCR2mFcxRVl02UHyPkbPXQf8n7aFQtc8RjkcniVacBFb01APTU6pSAZwY1N3TUezHi0Pk+JyGjkVXlMoP5TYkR0UcQZc9GSV5KxQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 87879a7d-591a-4dd2-0994-08d9b8d74be4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 16:41:48.2225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2354
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 16:41:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159257

It's of course *not* the file extension, but the .orig. that is=20
confusing the default upstream regex check

This here worked for me

UPSTREAM_CHECK_REGEX =3D "${BPN}_(?P<pver>\d+(\.\d+)+)\.orig\..*"

but surely it can be fine tuned

On 06.12.21 17:30, Konrad Weihmann wrote:
> I think the answer is that latest release is a bz2, while the older one=20
> are gzipped
>=20
> http://ftp.debian.org/debian/pool/main/m/minicom/minicom_2.7.1.orig.tar.g=
z
>=20
> vs.
>=20
> http://ftp.debian.org/debian/pool/main/m/minicom/minicom_2.8.orig.tar.bz2
>=20
> On 06.12.21 16:57, Alexander Kanavin wrote:
>> This one is odd and it should be working. I'll cherry-pick your update=20
>> and get to the bottom of it. This may mean we are missing other=20
>> updates that are coming from debian tarballs.
>>
>> Alex
>>
>> On Mon, 6 Dec 2021 at 14:59, Richard Purdie=20
>> <richard.purdie@linuxfoundation.org=20
>> <mailto:richard.purdie@linuxfoundation.org>> wrote:
>>
>> =C2=A0=C2=A0=C2=A0 On Mon, 2021-12-06 at 14:43 +0100, Alexander Kanavin =
wrote:
>> =C2=A0=C2=A0=C2=A0=C2=A0 > Since AUH didn't pick this up, can you run 'd=
evtool
>> =C2=A0=C2=A0=C2=A0 latest-version minicom'
>> =C2=A0=C2=A0=C2=A0=C2=A0 > with this update, as it probably would report=
 something that
>> =C2=A0=C2=A0=C2=A0 needs fixing via
>> =C2=A0=C2=A0=C2=A0=C2=A0 > regexp?
>>
>> =C2=A0=C2=A0=C2=A0 That shows:
>>
>> =C2=A0=C2=A0=C2=A0 WARNING: latest_versionstring: package minicom_2.8.or=
ig.tar.bz2
>> =C2=A0=C2=A0=C2=A0 don't match pattern
>>
>> =C2=A0=C2=A0=C2=A0 Cheers,
>>
>> =C2=A0=C2=A0=C2=A0 Richard
>>
>>
>>
>>
>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159255): https://lists.openembedded.org/g/openembedde=
d-core/message/159255
> Mute This Topic: https://lists.openembedded.org/mt/87539156/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kw=
eihmann@outlook.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

