Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web09.559.1617055700099324184
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 15:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 12TM87rL018139
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Mon, 29 Mar 2021 17:08:18 -0500
Subject: Re: [OE-core] master eSDK hash problem with METADATA_REVISION and base-files:do_install
To: Chen Qi <Qi.Chen@windriver.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <e9b61d5e-0479-b5cb-2299-749b53d4df38@kernel.crashing.org>
 <db1fb6d5-e2e8-113a-f1a8-5f05b6e86e8d@windriver.com>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <9af9f1f6-d14f-cd38-3dc7-8d1674a728ea@kernel.crashing.org>
Date: Mon, 29 Mar 2021 17:08:07 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <db1fb6d5-e2e8-113a-f1a8-5f05b6e86e8d@windriver.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by kernel.crashing.org id 12TM87rL018139
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

I was using master-next (version was right before I sent the email), and it
still failed.

Looking at things, there doesn't appear to be any METADATA_REVISION set in=
 the
normal build, but there is one set inside of the eSDK.  So it looks like s=
ome
corner case may have been missing.

If you notice it says <unknown>.  Diffsigs I had, I don't know how the 'de=
fault'
version should be generated or not -- but it was definitely different insi=
de and
outside the eSDK.

--Mark

On 3/28/21 9:11 PM, Chen Qi wrote:
> Hi Mark,
>=20
> I think this has been fixed by the following commit.
>=20
> """
> commit ff2ad51b801fd62e2abbc573ba2c9ee8fdc7e012
> Author: Chen Qi <Qi.Chen@windriver.com>
> Date:=C2=A0=C2=A0 Fri Mar 5 18:10:40 2021 +0800
>=20
> =C2=A0=C2=A0=C2=A0 populate_sdk_ext: record METADATA_REVISION
> =C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0=C2=A0 As we delete the .git/ directory, it's impossible to =
get METADATA_REVISION
> =C2=A0=C2=A0=C2=A0 inside eSDK. Because of this, we meet the following w=
arning when installing
> eSDK.
> =C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARNING: The base-files:do_install sig is=
 computed to be
> 16b9d96148d45de183cc94667aae016ec7d102d48255456381e718cd4bbd0aa0, \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 but the sig is locked to
> 6eb0dcaed504282becee94662481d79264db920dee1f7deda18230133fff8f36 in
> SIGGEN_LOCKEDSIGS_t-qemux86-64
> =C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0=C2=A0 So we record METADATA_REVISION in eSDK generation tim=
e to fix this problem.
> =C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0=C2=A0 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> =C2=A0=C2=A0=C2=A0 Signed-off-by: Richard Purdie <richard.purdie@linuxfo=
undation.org>
> """
>=20
> Best Regards,
> Chen Qi
>=20
> On 03/26/2021 07:51 AM, Mark Hatle wrote:
>> Building an eSDK (all stock config):
>>
>> MACHINE=3Dqemuarm bitbake core-image-minimal -c populate_sdk_ext
>>
>>
>> I then install it, and get:
>>
>> Checking sstate mirror object availability: 100%
>> |######################################################################=
###############################################|
>> Time: 0:00:00
>> WARNING: The base-files:do_install sig is computed to be
>> 587ccfa9299e26094ae342f1ce3d782bfaf776c639013428a511770c3828d49a, but t=
he sig is
>> locked to 0c35f266f1e79b1f34260df1b8d677f7eb74a7f7241155601ed73a014c8e2=
86c in
>> SIGGEN_LOCKEDSIGS_t-qemuarm
>> Loading cache: 100%
>> |######################################################################=
###########################################################################=
#|
>> Time: 0:00:00
>> Initialising tasks: 100%
>> |######################################################################=
#######################################################################|
>> Time: 0:00:00
>>
>>
>> Running a bitbake diffsigs on this file, I get:
>>
>> basehash changed from
>> cffec52acb67f62fe3812d0d42d52b1081f9150386f43f0426f5469b4a1a6a25 to
>> 332259212c5e9a4ed2a7fe25b8ea77cb54fb6b82f7deed90179e145f1d0cf1b6
>> Variable METADATA_REVISION value changed from
>> '3210cabe56d6cf6d51638e6f31f93110e40ab2cd' to '<unknown>'
>>
>>
>> So it appears that some of the recent work on METADATA_REVISION has bro=
ken hash
>> computations in the base-files package due to the value being 'unknown'=
 in one,
>> and set in the other.
>>
>> --Mark
>>
>>
>=20
>=20
>=20
>=20
>=20
