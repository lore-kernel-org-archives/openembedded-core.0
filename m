Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5D2C48BF6
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 14:40:57 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.14524.1708526454884862836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 06:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=DgaBoCJe;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41LEern8016416;
	Wed, 21 Feb 2024 08:40:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708526453;
	bh=Ks7jpkCt4/ARsgQA6UOeSVBe9qnbtga4ZtAVp+/hZ58=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DgaBoCJeIvLS72J3P0XQBe6Wp08liez84erQlA9C5xET4QL5sk1RlEDxHKMiC99SA
	 Zeg5SSajYtUfM01P4opdd2RnJSSNDp4tT9Y0cwq+8Z6PWIrx9jUPN5V/MhcHLyJpwc
	 qCTVZhMoHjJ09h92ME0l4e0gizj7oQBoMiG4e9XE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41LEercT041566
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Feb 2024 08:40:53 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Feb 2024 08:40:53 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Feb 2024 08:40:53 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41LEeruu085996;
	Wed, 21 Feb 2024 08:40:53 -0600
Message-ID: <f232c109-3b18-44a9-913a-3a8b10f69e04@ti.com>
Date: Wed, 21 Feb 2024 08:40:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][kirkstone 7/8] kernel: fix localversion in v6.3+
Content-Language: en-US
To: Andreas Helbech Kleist <andreaskleist@gmail.com>,
        Steve Sakoman
	<steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>
References: <cover.1707745886.git.steve@sakoman.com>
 <d9273edae80978c34f8426f34f991b9598828aa9.1707745886.git.steve@sakoman.com>
 <6fc21e62-f75e-4bd7-bf61-5d86efa05854@ti.com>
 <CAOSpxdb85tHCEWMQkJ5eMPQJ=Tb+KKVEBHqAFVFA+9TOc3-_tg@mail.gmail.com>
 <ca451d91-e029-4913-9404-98cd1c6fe415@ti.com>
 <0b450e8bcb3caf34fe2ef3e2737af6f4e62a63bc.camel@gmail.com>
 <bc5ae7215cb00d5f61e2c9870a5f4c9ec0b2854d.camel@gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <bc5ae7215cb00d5f61e2c9870a5f4c9ec0b2854d.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 41LEern8016416
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 14:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195977



On 2/16/2024 7:51 AM, Andreas Helbech Kleist wrote:
> On Fri, 2024-02-16 at 09:11 +0100, Andreas Helbech Kleist wrote:
>> On Thu, 2024-02-15 at 19:45 -0600, Ryan Eatmon via
>> lists.openembedded.org wrote:
>>>
>>> On 2/15/2024 7:43 PM, Steve Sakoman wrote:
>>>> On Thu, Feb 15, 2024 at 3:20=E2=80=AFPM Ryan Eatmon <reatmon@ti.com>=
 wrote:
>>>>>
>>>>>
>>>>> With this patch in place we are seeing a breakage on our kernel bui=
lds.
>>>>> This patch was cherry picked from master, but the next patch on thi=
s
>>>>> file in master removes the LOCALVERSION setting...
>>>>>
>>>>> https://git.openembedded.org/openembedded-core/commit/meta/classes-=
recipe/kernel-arch.bbclass?h=3Dmaster-next&id=3Db378eec156998eea55ba61e59=
103cb34fab0d07c
>>>>>
>>>>>
>>>>> There is a disconnect here.  Why did we change kirkstone, a stable =
LTS
>>>>> version with a partial patch series based on master?
>>>>
>>>> The original kirkstone backport request for this patch was sent to t=
he
>>>> list for review on February 9.
>>>>
>>>> There were no comments or objections, so I added it to the patch tes=
t
>>>> queue.  No issues were encountered on the autobuilder, so I sent thi=
s
>>>> patch (along with the rest of the patch queue) to the list for a
>>>> second review opportunity on February 12.  Once again there were no
>>>> comments or objections, so it was merged today February 15.
>>>>
>>>> I follow this process because I'm not smart enough, nor do I have ti=
me
>>>> enough to thoroughly research all implications of every patch.  I re=
ly
>>>> on autobuilder testing and community review to minimize breakage.
>>>>
>>>> This normally works quite well, but this time it didn't.  I'll rever=
t
>>>> this patch and if someone would like to resubmit a proper series to
>>>> deal with the issue it is trying to fix I will consider it and run i=
t
>>>> through the same process.
>>>
>>> I can appreciate that.  My comment was more for the person who sent t=
he
>>> patch in the first place.  You are doing a great job.  I will try and
>>> pay attention for a replacement patch coming in and review as well.
>>
>> I'm sorry about that. I need to use a 6.6 kernel on kirkstone, and thi=
s
>> patch fixed my usecase. It looked like a simple bugfix, and I was not
>> aware that there was a later fix for this change.
>>
>> Is there any way I can reproduce the error you saw Ryan?
>>
>> And would it make sense to add an automated test for this usecase?
>>
>> I'll test my usecase with both patches backported and re-submit.
>=20
> I've now looked into it and can make it work in my setup by backporting
> these three commits from master:
>=20
>    kernel.bbclass: introduce KERNEL_LOCALVERSION
>  =20
> https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&=
id=3D229435a52f36ddec5f85fb6d5ccd42044b688397
>=20
>    kernel: fix localversion in v6.3+
>  =20
> https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&=
id=3D765b13b7305c8d2f222cfc66d77c02e6a088c691
>=20
>    kernel: make LOCALVERSION consistent between recipes
>  =20
> https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&=
id=3Db378eec156998eea55ba61e59103cb34fab0d07c
>=20
> The cherry-pick's apply cleanly without any conflicts.
>=20
> Would they be appropriate for kirkstone? I'm wondering if there would
> be any issue with backporting the KERNEL_LOCALVERSION variable
> specifically.
>=20
> If I hear nothing before the middle of next week, I'll submit the patch
> series (CC'ing you Ryan).
>=20

Can you send me the patch series that you want to want to send in=20
against kirkstone?  I'll apply them locally and run some tests on our=20
setup to make sure they don't cause an issue.  I don't foresee them=20
being a problem, but I'm more than happy to verify.


> /Andreas
>>
>> PS: This is my first submission to oe-core, so I'm just starting to
>> learn. I have no idea what or how the autobuilder tests, but I'm
>> willing to learn.
>>
>>>
>>>
>>>> Steve
>>>>
>>>>
>>>>> On 2/12/2024 7:54 AM, Steve Sakoman wrote:
>>>>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>>>>
>>>>>> During testing of the v6.4 reference kernel, it was noticed that
>>>>>> on-target modules no longer matched the magic value of the running
>>>>>> kernel.
>>>>>>
>>>>>> This was due to a different localversion in the cross built kernel
>>>>>> and the scripts / resources created on target.
>>>>>>
>>>>>> This was due to changes in the setlocalversion script introduced
>>>>>> in the v6.3 series.
>>>>>>
>>>>>> The .scmversion file is no longer used (or packaged) to inhibit
>>>>>> the addition of a "+" (through querying of the git status of the
>>>>>> kernel) or the setting of a local version.
>>>>>>
>>>>>> We recently introduced the KERNEL_LOCALVERSION variable to allow
>>>>>> recipes to place a value in .scmversion, so we extend the use of
>>>>>> that variable to kernel-arch.bbclass and use it to set the
>>>>>> exported variable LOCALVERSION.
>>>>>>
>>>>>> We must do it at the kernel-arch level, as the variable must be
>>>>>> exported in any kernel build to ensure that setlocalversion always
>>>>>> correctly sets the localversion.
>>>>>>
>>>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>>>>
>>>>>> Cherry-picked from master 765b13b7305c8d2f222cfc66d77c02e6a088c691
>>>>>>
>>>>>> Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
>>>>>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>>>>>> ---
>>>>>>     meta/classes/kernel-arch.bbclass |  7 +++++++
>>>>>>     meta/classes/kernel.bbclass      | 10 ++++++++--
>>>>>>     2 files changed, 15 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kerne=
l-arch.bbclass
>>>>>> index 4cd08b96fb..0a79dea0af 100644
>>>>>> --- a/meta/classes/kernel-arch.bbclass
>>>>>> +++ b/meta/classes/kernel-arch.bbclass
>>>>>> @@ -66,3 +66,10 @@ KERNEL_LD =3D "${CCACHE}${HOST_PREFIX}ld.bfd ${=
HOST_LD_KERNEL_ARCH}"
>>>>>>     KERNEL_AR =3D "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH=
}"
>>>>>>     TOOLCHAIN ?=3D "gcc"
>>>>>>
>>>>>> +# 6.3+ requires the variable LOCALVERSION to be set to not get a =
"+" in
>>>>>> +# the local version. Having it empty means nothing will be added,=
 and any
>>>>>> +# value will be appended to the local kernel version. This replac=
es the
>>>>>> +# use of .scmversion file for setting a localversion without usin=
g
>>>>>> +# the CONFIG_LOCALVERSION option.
>>>>>> +KERNEL_LOCALVERSION ??=3D ""
>>>>>> +export LOCALVERSION ?=3D "${KERNEL_LOCALVERSION}"
>>>>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbc=
lass
>>>>>> index 5951347361..940f1a3cf4 100644
>>>>>> --- a/meta/classes/kernel.bbclass
>>>>>> +++ b/meta/classes/kernel.bbclass
>>>>>> @@ -418,7 +418,7 @@ do_compile_kernelmodules() {
>>>>>>         if (grep -q -i -e '^CONFIG_MODULES=3Dy$' ${B}/.config); th=
en
>>>>>>                 oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERN=
EL_EXTRA_ARGS}
>>>>>>
>>>>>> -             # Module.symvers gets updated during the
>>>>>> +             # Module.symvers gets updated during the
>>>>>>                 # building of the kernel modules. We need to
>>>>>>                 # update this in the shared workdir since some
>>>>>>                 # external kernel modules has a dependency on
>>>>>> @@ -635,7 +635,13 @@ kernel_do_configure() {
>>>>>>         # $ scripts/setlocalversion . =3D> +
>>>>>>         # $ make kernelversion =3D> 2.6.37
>>>>>>         # $ make kernelrelease =3D> 2.6.37+
>>>>>> -     touch ${B}/.scmversion ${S}/.scmversion
>>>>>> +     # See kernel-arch.bbclass for post v6.3 removal of the extra
>>>>>> +     # + in localversion. .scmversion is no longer used, and the
>>>>>> +     # variable LOCALVERSION must be used
>>>>>> +     if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
>>>>>> +             echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
>>>>>> +             echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
>>>>>> +     fi
>>>>>>
>>>>>>         if [ "${S}" !=3D "${B}" ] && [ -f "${S}/.config" ] && [ ! =
-f "${B}/.config" ]; then
>>>>>>                 mv "${S}/.config" "${B}/.config"
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>> --
>>>>> Ryan Eatmon                reatmon@ti.com
>>>>> -----------------------------------------
>>>>> Texas Instruments, Inc.  -  LCPD  -  MGTS
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#195736): https://lists.openembedded.org/g/openemb=
edded-core/message/195736
>>> Mute This Topic: https://lists.openembedded.org/mt/104311283/7501392
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [andreaskleist@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

