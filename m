Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D39CC433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 19:07:57 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.54])
 by mx.groups.io with SMTP id smtpd.web10.103.1634584076289350473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 12:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=ZW1eR6E2;
 spf=pass (domain: outlook.com, ip: 40.92.75.54,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKomGO1ibWF6t6HxXJ6+VmTLzNlmTvwSYlyuRo+VDbVLnkCZb5DghtlJICFwdRVxZLjaBSf3fAp6hNRDslJx98DCgmcU6L33FeicQ4GkXbg5JSMepQosZhoigCexVqpH8iLtizIbmXcohdCccx6p5k3QQxQvu4WdMDJ82Ht+eoZBFVkMVyjKFHpm01nkiXzb8T3EH+4qVQaP2EHprEebqVGkm9sFLPAFmjlkUIQlKx6PfwlQs5yPM7PCZpgEgfz5Z08w6JIk9eO6mNF1V4B7TjnwHj+gjudVdM3RvU4alhBCEpN4w93G8IeUM1dQPM8QPFfiEv4h55f5AxQVbNsO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JTbJQMUbHSPjfmXhjTAKU4kOXQZZVbSv+CuD21uaN8=;
 b=SQ7zDh4OLNYoYqjXXNn8OLjZXppy4W1hsowlNYcjdz6faPbf6G4vCdPMHwXaIB9aqKfYOLNWOf5l6biXkJrGNpY8MzrGVJ9r/ETQZ3bYlicez3VtJzYo3PsW+pAeN8CGEhnd/vFbWW9lwbpqUCumJo7tPmhIfC+0HRZCEL5gI5yDLD9NjjHG7Bjrn4fU8YHE5ECki/37DYGOnIsxIfEFS8OVXUbdxxuUs4gW7lbsn0eQaUXSZ8lqkwweoln/KWM82TrQTFI5qi1g9siVNKjkwh7om0P+3dvcYZuZCQrTNrjKAdnhNeBEIXruuEenx5iYKdEj1wb06IVhCsfLOcigYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JTbJQMUbHSPjfmXhjTAKU4kOXQZZVbSv+CuD21uaN8=;
 b=ZW1eR6E2+q00iRQ5A4B4azK9Xe4MhlrNjSzkuHzIeFJ+tT25DNuJqrALGXIXNgqGqZ6eNGp3bOi+JxeCiV5L/W7AZ+VoL8geDWi/jdRNWSsSk2pIgn0MQDh6l6iERuxLNao7i2qPrq/PdD69JvMpJWnxEHL0V7/2OIMW7AmrqNCQQMyMGIZSpfidfv8EeVBQi7lghVKnwC6MHHNrLqe/VWphVp110cZldMydSvK7xDI1BgwO1XwXizMHmpHAkOYPguBnvwIrCo8DH4ExPPzDXj2apGRVfIEdW0ainShY/Ls23qICPX41VSBEpQI76oXRW21hDPfVhvhDKT23mn0Kjg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM4PR0902MB1892.eurprd09.prod.outlook.com (2603:10a6:200:97::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 19:07:54 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%3]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 19:07:54 +0000
Subject: Re: [OE-core] [RFC PATCH 14/14] layer.conf: Extend recipes not to
 install without explict dependencies
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
 <16A68880435BB472.28512@lists.openembedded.org>
 <e22062ab2915a57b1bff1217c911a97c3c647e30.camel@linuxfoundation.org>
 <0700251c-57a1-cc4c-dd94-a253032a02d1@gmail.com>
 <CAMKF1spNqjAHRh=0F2ohMCCoSdwDOTWAFRMz2RCVU9+rBiiO_g@mail.gmail.com>
 <CA+chaQfO61hdhNtHO-hTu_4QZbnwmHUTMAJ6XaHrDCdhww2EVg@mail.gmail.com>
 <CALbNGRR+VLOvuTFaZFFcp1eSR_gKw6z1EMeH1c28QjqV_YUP3w@mail.gmail.com>
 <CA+chaQctdc_sUpmvs-vN0RatkOx=JoMnVZCqY+WjxGfXOYX0fQ@mail.gmail.com>
 <CALbNGRTxs26=VO7DmHe41QOgy=acByprKzUSzenZpYSfdJ_z_A@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46425E114838BDB1CB772C89A8BC9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 18 Oct 2021 21:07:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: 
 <CALbNGRTxs26=VO7DmHe41QOgy=acByprKzUSzenZpYSfdJ_z_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-TMN: [DxxaS2pMU1JE/pd3bBb4+I68Gz5d/mNF5Rj2bI39MD35h8KQ050Q9GM+U+R2hhgt]
X-ClientProxiedBy: AM6P192CA0040.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::17) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <e016d183-3e92-8c9d-4cda-743275ddeaa3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM6P192CA0040.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::17) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Mon, 18 Oct 2021 19:07:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d8d6b20-d42b-45f7-2e80-08d9926a9662
X-MS-TrafficTypeDiagnostic: AM4PR0902MB1892:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m793UiyBXF644RPbxBdnw33+KTanWUHVs+1bkY+DG7vELvcqWt5ELt5OrSoIYcUVy3as0nMdfTiMODOIdfwKhgs/o008LkGWfyr3j3aIVIROZ57H0xug+EKPWWpYjELdF/+1Tou/bHi7fHpcE19kWg0E0JhcQAlIWGwYsrLrGABljt0Hi+f3lJomBYXPfA1ussjfWLrVDUzwkIWx4wf1HBuBQTs38sWI+GUMWA+X1j1tib9x0jCMAw+sYiK2rQTGMGvdjPJ6sC+jla34xd5Srln/gqFG8fDLDRw/DcCkDQLTkpfPry7h3i9JM0bJa01VvT731SHZyII7rW/gZoXx38OlrhEiOhns9sx3LKaG+O8ClH3WicMN++Kf/Vg3/f+YYV3+1N4oKs9D3BxL0x70eqHn0taO13VUzpKI8t9kYX44xdzN3qRDMpiAmSJssXoDGT3/FiktR4DIzgHTyNwSk862/qh8tTHw/YnxH1s2KPBYS4AAC65gnLBfcetSK082B/VSqaRiE6WX3j7A2GCf1n7yIGFxPjj07AoUYxLKDL6HTMVNGEIr04R9+gjBGLlJEP+b5p3Zy4qozqaSQfD3n7G9mrYhQDCNhEqhqZaR7Wz7Z6uvD/6+QzMSOIr8ZG6R
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Nc7TAOOnYrxI0mWsQkPXYV2Wg4/M0e0vtRrAmkw9cL8iAg4pOFKk8F6Y5wAxO10d1ggyeW4mSZb1ROLwn/aTuyiF3YYEjWNWhDIDVnyTEIrneBVaOAk0rsR8npuQRoRLr5CCpdEfccip3WrHV945QCbUJWxxFAdvE+aJq9NyfkYLt+am8a2GSxjjbyUzUc6VcaMbYjmZyy3NX3KL8tl7Qw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8d8d6b20-d42b-45f7-2e80-08d9926a9662
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 19:07:54.0873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0902MB1892
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 19:07:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157092

Just as an idea: can those knowingly breaking changes be announced=20
upfront somehow? maybe in the architecture list?!? (and then applied on=20
a flag day)

I know we all got a bit of a high workload, so it might be better to=20
have breaking changes not hit "uncontrolled" into master.

I agree that master is a development branch, but the number of breaking=20
changes that hit me by surprise this year is astonishingly high.

That doesn't mean, that I don't appreciate the actual change made, but=20
that way it has been applied (and the breaking changes before) makes me=20
rethink the way I do integrate my non-core layer in the future, while I=20
personally would like to remain on this bleeding-edge model that worked=20
well for a long time.

On 18.10.21 18:59, Andreas M=C3=BCller wrote:
> On Mon, Oct 18, 2021 at 4:12 PM Martin Jansa <martin.jansa@gmail.com> wro=
te:
>>
>> On Mon, Oct 18, 2021 at 1:50 AM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
>>>
>>> On Fri, Oct 1, 2021 at 4:17 PM Martin Jansa <Martin.Jansa@gmail.com> wr=
ote:
>>>>
>>>> FWIW: I've fixed some bigger layers where pkgconfig was causing quite =
a few build failures,
>>>>
>>> Had an off-oe time due to  heavy work load.
>>> Think this one is the reason for the pkgconfig patch flood. You are
>>> aware that there are packages not failing at build time for missing
>>> pkgconfig but build output is different and bugs will pop up at
>>> runtime.
>>>
>>> To avoid responsible maintainers have to go through EVERY recipe (and
>>> combination of PACKAGECONFIGs) and check if builds are still as
>>> expected - Can't believe it!
>>
>>
>> Not sure why this seems targeted to me.
> It was not targeted to you - just responded all in the last post - sorry
>=20
> Andreas
>>
>> Yes I've tried to fix whatever issues this change caused in my world bui=
lds and I'm partially responsible for pkgconfig patch flood, because I want=
ed layers like meta-ros/*, meta-qt5, meta-qt6, meta-webosose/* to stay comp=
atible with oe-core whenever this change from RP is merged to master.
>>
>> I've also tried to compare buildhistory and image content (for ros-image=
-world with ros1-melodic) to see if I can spot more cases of non-fatal buil=
d output changes as in collada-dom and unfortunately there is a lot of nois=
e in buildhistory (due to many recipes included in this image not really bu=
ild-reproducible), so I've used mostly installed-package-sizes.txt file to =
spot 2 more recipes where the size was different (but both don't seem to be=
 caused by pkgconfig-native in the end).
>>
>> I did both builds from scratch without sstate, so I would assume that it=
 will catch all possible cases, but surprisingly just yesterday I've caught=
 another missing pkgconfig-native in one of meta-ros1-melodic recipes (caug=
ht in kirkstone based build - while before I was testing on top of a bit ol=
der honister with this change cherry-picked just for test - to prepare reci=
pes to be future-proof for kirkstone).
>>
>> Regards,
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#157087): https://lists.openembedded.org/g/openembedd=
ed-core/message/157087
>> Mute This Topic: https://lists.openembedded.org/mt/85739636/3647476
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [k=
weihmann@outlook.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

