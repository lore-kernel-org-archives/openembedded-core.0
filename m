Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B6BC43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 15:28:43 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.8658.1655911719483355260
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout05.t-online.de (Postfix) with SMTP id 9B97CA2ED
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 17:28:37 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.39.186]) by fwd82.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1o42HV-0JRWPR0; Wed, 22 Jun 2022 17:28:37 +0200
Message-ID: <4f80bb16-6601-f3b7-fe37-d8fa545e5dce@t-online.de>
Date: Wed, 22 Jun 2022 17:28:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] Easyish reproducibility issue for someone?
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: 
 <31700e81f90027d7359c688ac8b3d5bdf914a0f9.camel@linuxfoundation.org>
 <1df0fc03-e1f3-de99-bf81-f19c022e9fa7@weidmueller.com>
 <679be2d1-4311-41af-d2e5-4132c96b3421@t-online.de>
 <976357c9-f919-bf53-afe6-dbf71ee2c75f@weidmueller.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <976357c9-f919-bf53-afe6-dbf71ee2c75f@weidmueller.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1655911717-014275D8-A1B2F15A/0/0 CLEAN NORMAL
X-TOI-MSGID: c65b0177-e243-4142-bb3f-49c30efb06d1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 15:28:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167242

I had not tried it, but in the meantime I did and it works with

PACKAGECONFIG ?=3D ""
PACKAGECONFIG[optviewer] =3D "-DPY_PYGMENTS_FOUND=3DON=20
-DPY_PYGMENTS_LEXERS_C_CPP_FOUND=3DON=20
-DPY_YAML_FOUND=3DON,-DPY_PYGMENTS_FOUND=3DOFF,,python3-pygments python3-=
pyyaml"

Markus

Am 22.06.22 um 17:06 schrieb Stefan Herbrechtsmeier:
> Hi Markus,
>
> Am 22.06.2022 um 16:18 schrieb Markus Volk via lists.openembedded.org:
>> Hi,
>>
>> couldn't we just do it like this?
>>
>> PACKAGECONFIG ?=3D ""
>> PACKAGECONFIG[optviewer] =3D=20
>> "-DLLVM_HAVE_OPT_VIEWER_MODULES=3DON,-DLLVM_HAVE_OPT_VIEWER_MODULES=3D=
OFF,,python3-pygments=20
>> python3-pyyaml"
>>
>> Depending on wether the PACKAGECONFIG option is taken it looks like=20
>> this in CMakeCache.txt:
>>
>> //No help, variable specified on the command line.
>> LLVM_HAVE_OPT_VIEWER_MODULES:UNINITIALIZED=3DOFF
>>
>> //No help, variable specified on the command line.
>> LLVM_HAVE_OPT_VIEWER_MODULES:UNINITIALIZED=3DON
>
> Have you test it? The config-ix.cmake file sets the=20
> LLVM_HAVE_OPT_VIEWER_MODULES variable [1].
>
> Instead of LLVM_HAVE_OPT_VIEWER_MODULES I would set PY_PYGMENTS_FOUND,=20
> PY_PYGMENTS_LEXERS_C_CPP_FOUND and PY_YAML_FOUND.
>
> [1]=20
> https://github.com/llvm/llvm-project/blob/main/llvm/cmake/config-ix.cma=
ke#L693
>
> Regards
> =C2=A0 Stefan
>
>> Am 22.06.22 um 15:54 schrieb Stefan Herbrechtsmeier:
>>> Hi Richard,
>>>
>>> Am 22.06.2022 um 15:10 schrieb Richard Purdie via=20
>>> lists.openembedded.org:
>>>> There is a reproducibility issue which shouldn't be too hard to fix =
if
>>>> someone had a few minutes to help out:
>>>>
>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14845
>>>>
>>>> It is in llvm and is a cmake configuration issue. Rather than settin=
g
>>>> that option based on the presence of python modules (with python fro=
m
>>>> the host), we should add a configuration option to force it to be
>>>> disabled in our case. Should be upstreamable with the right patch.
>>>
>>> I'm not able to test it at the moment but it should be possible to=20
>>> set the variables (PY_PYGMENTS_FOUND, PY_PYGMENTS_LEXERS_C_CPP_FOUND=20
>>> and PY_YAML_FOUND) to OFF via EXTRA_OECMAKE:
>>>
>>> -DPY_PYGMENTS_FOUND=3DOFF
>>>
>>> The find_python_module function in config-ix.cmake returns early if=20
>>> the variable PY_${module_upper}_FOUND is defined.
>>>
>>> Regards
>>> =C2=A0 Stefan
>>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167241): https://lists.openembedded.org/g/openembed=
ded-core/message/167241
> Mute This Topic: https://lists.openembedded.org/mt/91921251/3618223
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
f_l_k@t-online.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

