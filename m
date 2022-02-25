Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05961C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 13:27:56 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.92.67.32])
 by mx.groups.io with SMTP id smtpd.web08.6222.1645795674980092722
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 05:27:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=TW132KnE;
 spf=pass (domain: outlook.com, ip: 40.92.67.32,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbVn6H/36rhp548bTeBA9ILO7CmOgdqbBVBUf1eLkhMbEbGgXg4ecIwkupzawQqij0LnrWJNeQGs3XfuSkMB3HHdeI2OVlIX3t1kzBRG0nFjfCTnIvT3ZrjpOkG/LTKsxeNaQZt/le5AQ49NGaTmsopN545gOBYYpMNHrjtzQwgBTCjpKG5wo8XtPvfw0y1m/slQ7jjliXNfsUksCChwRUIHo1iaqaokoC3Yw3d3opIBFZMshYFqvMn6oYqQuDE9c+KN0uqepCTYVpVZH7wcHDNUapcTn1Fo1x5Ts3keqx4zITWwkKQKnydUX0uBpI5o8NF0p3h+SiyKl9qMoCu/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGSEIeFcBtL2C0fGPPFdvfbTN9eG/vPjt1WJnaWwTBw=;
 b=Q1NCrK6qlKxB/v4qpFy/kh5uaA2fu57fqPKQTs2n+HOiIcPfkNGhR7YDTtoCrLOpelksGZL5dda4NGYhky3kpxJdT6VyTx5JoiwSARj0UClR0ovjFnmhVmOkXZeaCnE9qtcvLvhZDJxJMEbZSb5XJqKVwivKwF8lWzXRjbgvowKvUTQ9Uyz0hxrxOd+07AX3WCkKlyWOnLqAFckLNUfNDqoaEP+7KTpozuHMBTYX8+s2oHSmqgrx9Tde9lK29UGVspslCgCx1YLvWoz4rPUNbzo+Q812/MwgQWHWbx5oWlN6Q5qFpcqIEDkg3XPD5FjSzMrWyPRCBNmqIfN0Iau3vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGSEIeFcBtL2C0fGPPFdvfbTN9eG/vPjt1WJnaWwTBw=;
 b=TW132KnEruOdSZVxiInIvnKaUDSsh3pu05foAh4YLhHKjFFQ7QrXxXPe13iCsfg651QE5ZXPBVXSmVYBvbcTPHVig8BgbM+vKMUyCVO4gkc21w/uy/SzjWBjoSwL8QD7xYVKHNwhiRL7u8iQPrIHLjDldfFrg631Vt1mx2P0LhopHGkgI2ZCNlPFoYjNObLpvc4EJUQgnVV4AYe/q8jVk6dzkH7q4Psm5KbqitixdUV1Tn5Nm0dcx1owgYQDfDNFN1xk7trEHQQznqUU6jKGKQbsfKKXZGlDkM6/4AH08lppUzBYbRcbhjiwxDUKA9l5+RI3g4gVk60vBRQnZ5otJw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by VI1PR09MB3886.eurprd09.prod.outlook.com (2603:10a6:800:12d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Fri, 25 Feb
 2022 13:27:51 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%6]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 13:27:51 +0000
Message-ID: 
 <AM9PR09MB4642136C55DEE8C30DF913B9A83E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Fri, 25 Feb 2022 14:27:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH v3 00/32] Python PEP-517: build wheels and
 install with pip
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <cover.1645557032.git.tim.orling@konsulko.com>
 <AM9PR09MB46421D2885F301ED19EF4338A83D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <4ee7a6b0d8640e8df91ccde5ba9f74139b56ee18.camel@linuxfoundation.org>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <4ee7a6b0d8640e8df91ccde5ba9f74139b56ee18.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TMN: [9QBly2bXqOvYJQCK1eX1v468ggFvwQNUiNhu0yL0CPkf0+Oy5IDwVyIt1xwulIWc]
X-ClientProxiedBy: AS9PR06CA0152.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::21) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <0114a2c8-caef-84dd-ae45-5cbb8c791a62@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c8010dc-7aca-4ae8-df36-08d9f8629f76
X-MS-TrafficTypeDiagnostic: VI1PR09MB3886:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9OKogRjRsehUVX77CC4Rj4y9mexyVRGRtXIGL2F/Y6JZ63KaSkM/GfKponqm7BiahsSorQLMXg4Q6rm84rEBNNxrojc16lsSpyuOlcplP9T8z+HnL5um1AQb65dp7KKTmmVZ7AW3OTeUzjre/mBI68bc/yii0g8k8ihFmripZZDAGkk2sQFCapWnXTVQwbwGlZVOlHZFb3pcM+nGYOucSBNxrzrkhEh7WSs9dIpZih3fQV/6j6gKv53w02AwQ2kaQUuMiVJddaEhYBAJU47us4fFlwC29W0sCQqLZkxxfrVczXh/uEQxgbbX0xVOmklnJ9QG1CVDNjPi7Qn7iC7wYqWnJK/n0eAvTVP76fl2vDsJEWPwtMuYrPCYufLNEWN0OuOgCx0Fov5hCvB8RhrslX1Hb6rC8jVGqzM9NE9MD3xisivxYYAYlPVgiMGwSjq6QmRAhDqXalQWjDmOOd3QJB5g5see5xP2ZFVcZ0ThqUYNpQfS1DHyJO1mJxYNa6J9JoM48E6jTZlEVI729csEHBlodOs0HDk+yxj0w2yGXcor8d/Nzr7a+F/UQTWx/YsnIcmXiGhykaY5ETlgHmyd6Q==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2UgJtApk/r9/chDigkXpfA4fleNPh35MhnZW2PwyJ/qI/DNV5RycFQTtMY+2?=
 =?us-ascii?Q?qchh7e5YsX+DwRoPb/PoGfd2MJoXjFEbze2j2aY8mIZwYRJVi2HwCq99VC5U?=
 =?us-ascii?Q?5xA4pLZ+ZgZxYXORARM+qREjD2lYg9pDTpdrSRDSMU/WlUJEfoupaKIYP/YR?=
 =?us-ascii?Q?OjeDVYPM0K7b9i9RGFxdvlFO+o7RsPQB3Sje2ZZSs8URDfnUUx2jB6UZAxUk?=
 =?us-ascii?Q?qCszmsEIkBQuvcwXNsk3Q90bH274lZe1js0V7o69vaYqGmvzYiXJynnUkKCS?=
 =?us-ascii?Q?km3x6qOdEIKz+llwDLAMCdo5ncOHroIrz7nTkaFo3pvOOZjfH/bgMwrcPlf4?=
 =?us-ascii?Q?CtxC4i0xzMUhovuGAEIDGGbL0r4LGsbK6PFZwlLtrITNzv4NrC4S4bUv7A5F?=
 =?us-ascii?Q?CZUdJatla3CT6Lz7HsBuWnEEVG17WgbKuv/9QqjdrqF21mOE9GbMDvWpAN2b?=
 =?us-ascii?Q?8G3vT38MhWQ1HwdQMCm22rfPCi/XRuJfN+6DA/NXjXYD2vOcBrtrKu7Oznqy?=
 =?us-ascii?Q?L/j1NxLmPxeJNtdozbVJ9RPvJX3EkQq7MFDHJTjB/XXtl0W6rcs8tdRpQqBX?=
 =?us-ascii?Q?4zk1ZjdvsMLh+I4tYOLXa3iH7u6dH470ZkPNfgdu/ZvphmZ/O867bpqGl0w5?=
 =?us-ascii?Q?Rm5XFQoxemTA3LNXqor81sGxKD2LjV9AksstAYaxY7U5efdUHyhvfR8IhIgB?=
 =?us-ascii?Q?vhPvTlCVJ4ruSGdt8JrYobUN8x9qB98len7tqwv0EUk7i36GtTL4Cc+eY6oE?=
 =?us-ascii?Q?aGspU7O4gBOxMWUvFnim222s8jH6Sf2o+lrCEW8KJbf9Je5FrkgcEJy8AAkW?=
 =?us-ascii?Q?WYnim9HAiNfpG8cXLHiZSQ5CWIvYbzfWGN5BB/eZKDRsy3cKazt1KNyooDqB?=
 =?us-ascii?Q?lnVnPBa1TbvCv/sY32gpqB99QRO8bSkMr8q+pOmb/tLE5zN7ssETDUk0C31E?=
 =?us-ascii?Q?+xlfoqr2miL1wjswBFRdUGWNHuDVnNAhmN5xFzxNtwfcBrIo+9h9VXZ+Ikag?=
 =?us-ascii?Q?iTi4o0RGp40uLTMnkUuhKvHyGw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5c8010dc-7aca-4ae8-df36-08d9f8629f76
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 13:27:51.8142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR09MB3886
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 13:27:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162345



On 25.02.22 14:16, Richard Purdie wrote:
> On Thu, 2022-02-24 at 16:52 +0100, Konrad Weihmann wrote:
>> I got a kind of general question about this patch series and all the
>> followups: is this still considered to go into the next release?
>=20
> It is still being considered, yes.
>=20
>> I'm a bit worried about the fallout of this pretty invasive change -
>> even though I see that at some point it needs to be done.
>>
>> My understanding is that the "classic" way will stop with Python 3.12,
>> which doesn't apply to next LTS release - as this will likely remain on
>> 3.10.
>> Only downside will be that manual helper files for updates of packages
>> that are lacking a setup.py needs to be provided (there are already a
>> few examples how to do it) - not a big deal if you'd ask me.
>>
>> So what's the stand of the project regarding this issue - also keeping
>> in mind that I think it's already past feature freeze?
>=20
> This is a tough one to make a decision on and I am conflicted. The change=
 was
> flagged up a while ago and has been regularly talked about. It is also so=
mething
> we all agree will have to happen at some point.
>=20
> The change is late and has issues but there was a base patchset sent befo=
re the
> freeze deadline.
>=20
> This isn't the final release point, it is the point where we stop taking =
new
> invasive changes and stabilise and I think it important to keep that in m=
ind.
>=20
> Stepping back and thinking about the big picture (and e.g. the ability to=
 take
> security fixes into the LTS), I'm leaning towards trying to get it in.=C2=
=A0One other
> consideration is having large delta between the LTS and onging developmen=
t and
> I'd prefer to minimise this particular difference if it is practical to d=
o so.

Your argumentation does make sense, but I have to disagree on this=20
particular point.
The using pip as the default installer and therefore wheels is something=20
that will never (hopefully) get backported, so bringing this change in=20
automatically builds up a huge delta to any other branch - thus here you=20
would create a situation that (I agree) should be avoided.

Also moving around a few classes and recipe between core and=20
meta-python, will either bind users to including meta-python in every=20
setup or will create situation were people will try to work around these=20
changes.

I see that this feature has been promised - and it might be bad for the=20
project's reputation to drop it - still if one would ask me, I would=20
prefer to delay it to the next release.
One potential option would be to offer that one (once mature and tested=20
will a broad set of layers) as a mixin-layer, which then could be used=20
with kirkstone LTS

>=20
> I believe we have identified and fixed the majority of the issues that ha=
ve
> shown up in automated testing.
>=20
> I haven't made a final decision but I am keeping an open mind on it and w=
ould
> really prefer to get it merged. There are other issues being worked in pa=
rallel
> which also would block the M3 build which does give time to resolve this =
one.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20

