Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D261EC4829E
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 01:45:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.9463.1708047949314504970
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 17:45:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=nbDTRHQ+;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41G1jmcu066461;
	Thu, 15 Feb 2024 19:45:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708047948;
	bh=WZWNeGR/3Jkgx+htPR/PnSJLNkGGhZ67Tfa51v9VczE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nbDTRHQ+3i56nBh5NBckbxYuZkriJoDJdS4VogtM7+dKPfVOa3HRLgCJL545j0EIe
	 E5IuAfTPu2lBZIIQSPsmzsP8Ugrqqydh0aZEY5UN3ru2y0L/h8T8xOOHHH9nmxNmgQ
	 gbqQcn7o7mMOofRX6XviOm6Wi5KeGTkfL8h9ftEU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41G1jmV3018011
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Feb 2024 19:45:48 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Feb 2024 19:45:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Feb 2024 19:45:48 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41G1jmUs129095;
	Thu, 15 Feb 2024 19:45:48 -0600
Message-ID: <ca451d91-e029-4913-9404-98cd1c6fe415@ti.com>
Date: Thu, 15 Feb 2024 19:45:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][kirkstone 7/8] kernel: fix localversion in v6.3+
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>
References: <cover.1707745886.git.steve@sakoman.com>
 <d9273edae80978c34f8426f34f991b9598828aa9.1707745886.git.steve@sakoman.com>
 <6fc21e62-f75e-4bd7-bf61-5d86efa05854@ti.com>
 <CAOSpxdb85tHCEWMQkJ5eMPQJ=Tb+KKVEBHqAFVFA+9TOc3-_tg@mail.gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CAOSpxdb85tHCEWMQkJ5eMPQJ=Tb+KKVEBHqAFVFA+9TOc3-_tg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 41G1jmcu066461
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 01:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195736



On 2/15/2024 7:43 PM, Steve Sakoman wrote:
> On Thu, Feb 15, 2024 at 3:20=E2=80=AFPM Ryan Eatmon <reatmon@ti.com> wr=
ote:
>>
>>
>> With this patch in place we are seeing a breakage on our kernel builds.
>> This patch was cherry picked from master, but the next patch on this
>> file in master removes the LOCALVERSION setting...
>>
>> https://git.openembedded.org/openembedded-core/commit/meta/classes-rec=
ipe/kernel-arch.bbclass?h=3Dmaster-next&id=3Db378eec156998eea55ba61e59103=
cb34fab0d07c
>>
>>
>> There is a disconnect here.  Why did we change kirkstone, a stable LTS
>> version with a partial patch series based on master?
>=20
> The original kirkstone backport request for this patch was sent to the
> list for review on February 9.
>=20
> There were no comments or objections, so I added it to the patch test
> queue.  No issues were encountered on the autobuilder, so I sent this
> patch (along with the rest of the patch queue) to the list for a
> second review opportunity on February 12.  Once again there were no
> comments or objections, so it was merged today February 15.
>=20
> I follow this process because I'm not smart enough, nor do I have time
> enough to thoroughly research all implications of every patch.  I rely
> on autobuilder testing and community review to minimize breakage.
>=20
> This normally works quite well, but this time it didn't.  I'll revert
> this patch and if someone would like to resubmit a proper series to
> deal with the issue it is trying to fix I will consider it and run it
> through the same process.

I can appreciate that.  My comment was more for the person who sent the=20
patch in the first place.  You are doing a great job.  I will try and=20
pay attention for a replacement patch coming in and review as well.


> Steve
>=20
>=20
>> On 2/12/2024 7:54 AM, Steve Sakoman wrote:
>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>
>>> During testing of the v6.4 reference kernel, it was noticed that
>>> on-target modules no longer matched the magic value of the running
>>> kernel.
>>>
>>> This was due to a different localversion in the cross built kernel
>>> and the scripts / resources created on target.
>>>
>>> This was due to changes in the setlocalversion script introduced
>>> in the v6.3 series.
>>>
>>> The .scmversion file is no longer used (or packaged) to inhibit
>>> the addition of a "+" (through querying of the git status of the
>>> kernel) or the setting of a local version.
>>>
>>> We recently introduced the KERNEL_LOCALVERSION variable to allow
>>> recipes to place a value in .scmversion, so we extend the use of
>>> that variable to kernel-arch.bbclass and use it to set the
>>> exported variable LOCALVERSION.
>>>
>>> We must do it at the kernel-arch level, as the variable must be
>>> exported in any kernel build to ensure that setlocalversion always
>>> correctly sets the localversion.
>>>
>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>
>>> Cherry-picked from master 765b13b7305c8d2f222cfc66d77c02e6a088c691
>>>
>>> Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
>>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>>> ---
>>>    meta/classes/kernel-arch.bbclass |  7 +++++++
>>>    meta/classes/kernel.bbclass      | 10 ++++++++--
>>>    2 files changed, 15 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-a=
rch.bbclass
>>> index 4cd08b96fb..0a79dea0af 100644
>>> --- a/meta/classes/kernel-arch.bbclass
>>> +++ b/meta/classes/kernel-arch.bbclass
>>> @@ -66,3 +66,10 @@ KERNEL_LD =3D "${CCACHE}${HOST_PREFIX}ld.bfd ${HOS=
T_LD_KERNEL_ARCH}"
>>>    KERNEL_AR =3D "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
>>>    TOOLCHAIN ?=3D "gcc"
>>>
>>> +# 6.3+ requires the variable LOCALVERSION to be set to not get a "+"=
 in
>>> +# the local version. Having it empty means nothing will be added, an=
d any
>>> +# value will be appended to the local kernel version. This replaces =
the
>>> +# use of .scmversion file for setting a localversion without using
>>> +# the CONFIG_LOCALVERSION option.
>>> +KERNEL_LOCALVERSION ??=3D ""
>>> +export LOCALVERSION ?=3D "${KERNEL_LOCALVERSION}"
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclas=
s
>>> index 5951347361..940f1a3cf4 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -418,7 +418,7 @@ do_compile_kernelmodules() {
>>>        if (grep -q -i -e '^CONFIG_MODULES=3Dy$' ${B}/.config); then
>>>                oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERNEL_E=
XTRA_ARGS}
>>>
>>> -             # Module.symvers gets updated during the
>>> +             # Module.symvers gets updated during the
>>>                # building of the kernel modules. We need to
>>>                # update this in the shared workdir since some
>>>                # external kernel modules has a dependency on
>>> @@ -635,7 +635,13 @@ kernel_do_configure() {
>>>        # $ scripts/setlocalversion . =3D> +
>>>        # $ make kernelversion =3D> 2.6.37
>>>        # $ make kernelrelease =3D> 2.6.37+
>>> -     touch ${B}/.scmversion ${S}/.scmversion
>>> +     # See kernel-arch.bbclass for post v6.3 removal of the extra
>>> +     # + in localversion. .scmversion is no longer used, and the
>>> +     # variable LOCALVERSION must be used
>>> +     if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
>>> +             echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
>>> +             echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
>>> +     fi
>>>
>>>        if [ "${S}" !=3D "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "=
${B}/.config" ]; then
>>>                mv "${S}/.config" "${B}/.config"
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#195328): https://lists.openembedded.org/g/openemb=
edded-core/message/195328
>>> Mute This Topic: https://lists.openembedded.org/mt/104311283/6551054
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [reatmon@ti.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>
>> --
>> Ryan Eatmon                reatmon@ti.com
>> -----------------------------------------
>> Texas Instruments, Inc.  -  LCPD  -  MGTS

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

