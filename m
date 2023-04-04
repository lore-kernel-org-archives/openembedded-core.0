Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F43C76196
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 02:57:29 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.92227.1680577039582451983
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 19:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.41] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 3342uGET008610;
	Mon, 3 Apr 2023 21:56:17 -0500
Message-ID: <ddd3f85f-e77c-c48f-02ea-1f6a8144354c@kernel.crashing.org>
Date: Mon, 3 Apr 2023 21:56:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [OE-core] mesa-native fails on master
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <51ba3bfc-caa0-0a31-c295-e59c8416e672@kernel.crashing.org>
 <CO6PR11MB5602C3D93B44F41049BBDCECED939@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CAMKF1sqq+H5_1YQGikajgdpnwmDwrTrXYeBNv=_+4PhTiMx8pA@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CAMKF1sqq+H5_1YQGikajgdpnwmDwrTrXYeBNv=_+4PhTiMx8pA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 3342uGET008610
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 02:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179670

I'm fine with saying either Ubuntu 18.04 is no longer 'supported', or run=
ning=20
some kind of check that says gcc 7.5.0 is too old..  But I'm not sure wha=
t=20
minimum (host) compiler version would be needed to avoid this error.

I'm happy to work up a patch to adjust the minimum gcc version, if someon=
e can=20
give me a bit of a clue what the appropriate minimum should be.

The current check (in sanity.bbclass) looks for 7.5 or newer.

--Mark

On 4/3/23 9:48 PM, Khem Raj wrote:
> On Mon, Apr 3, 2023 at 7:39=E2=80=AFPM Chen Qi <Qi.Chen@windriver.com> =
wrote:
>>
>> I just met the same issue. My host is ubuntu18, gcc version is 7.5.0.
>>
>> Regards,
>> Qi
>>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@list=
s.openembedded.org> On Behalf Of Mark Hatle
>> Sent: Tuesday, April 4, 2023 10:25 AM
>> To: Patches and discussions about the oe-core layer <openembedded-core=
@lists.openembedded.org>
>> Subject: [OE-core] mesa-native fails on master
>>
>> It's been a few weeks since I last built master, but starting with tod=
ay's pull I'm getting errors building mesa-native -- which pretty much ki=
lls the whole build.
>>
>> I'm on an Ubuntu 18.04 host, and have the 'buildtools-tarball' from th=
e last
>> 4.1.3 loaded so I can get to the minimum version of python to run a bu=
ild.
>>
>> (I tried with buildtools-tarball-extended and that DOES appear to work=
.  If this is expected, you can ignore the rest of this.  But I expected =
the system to complain before trying to build everything if the compiler =
wasn't new enough.)
>>
>>
>> The error is:
>>
>> brw_simd_selection.cpp:205:7: sorry, unimplemented: non-trivial design=
ated initializers not supported
>>
>>
>> The host gcc is 7.5.0
>>
>> What is strange is I had 2 successful builds, and then it started fail=
ing.  All
>> fresh builds.  I've no idea why one was successful and the others fail=
ed.  I'm
>> wondering if maybe there is some sort of race in mesa, but lowered my =
parallel
>> build (-j) to 1 and I'm still getting it.
>=20
>=20
> You need a newer gcc compiler > 7.x
> I just abandoned using ubuntu 18.04
> see - https://lists.openembedded.org/g/openembedded-core/message/178783=
?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Cnon-trivial+designated+in=
itializers+not+supported%2C20%2C2%2C0%2C97647023
>>
>>
>> Reproducer:
>>
>> git clone https://git.yoctoproject.org/poky
>>
>> cd poky
>>
>> wget
>> http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.3/buildtool=
s/x86_64-buildtools-nativesdk-standalone-4.1.3.sh
>>
>> bash x86_64-buildtools-nativesdk-standalone-4.1.3.sh -d buildtools -y
>>
>> . ./buildtools/environment-...
>>
>> . ./oe-init-build-env
>>
>> bitbake mesa-native
>>
>>
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#179669): https://lists.openembedded.org/g/openembe=
dded-core/message/179669
>> Mute This Topic: https://lists.openembedded.org/mt/98052337/3616948
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[mark.hatle@kernel.crashing.org]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

