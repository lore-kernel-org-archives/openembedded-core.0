Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D600FCCA481
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 14:18:22 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web08.7800.1655907501055544830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 07:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout09.t-online.de (Postfix) with SMTP id C4887E2DE
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 16:18:18 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.39.186]) by fwd87.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1o41BS-4fWIZl0; Wed, 22 Jun 2022 16:18:18 +0200
Message-ID: <679be2d1-4311-41af-d2e5-4132c96b3421@t-online.de>
Date: Wed, 22 Jun 2022 16:18:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] Easyish reproducibility issue for someone?
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: 
 <31700e81f90027d7359c688ac8b3d5bdf914a0f9.camel@linuxfoundation.org>
 <1df0fc03-e1f3-de99-bf81-f19c022e9fa7@weidmueller.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <1df0fc03-e1f3-de99-bf81-f19c022e9fa7@weidmueller.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1655907498-0142618F-F807A77E/0/0 CLEAN NORMAL
X-TOI-MSGID: bd4020f9-1dea-445c-9f73-258f9ad80fd6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 14:18:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167239

Hi,

couldn't we just do it like this?

PACKAGECONFIG ?=3D ""
PACKAGECONFIG[optviewer] =3D=20
"-DLLVM_HAVE_OPT_VIEWER_MODULES=3DON,-DLLVM_HAVE_OPT_VIEWER_MODULES=3DOFF=
,,python3-pygments=20
python3-pyyaml"

Depending on wether the PACKAGECONFIG option is taken it looks like this=20
in CMakeCache.txt:

//No help, variable specified on the command line.
LLVM_HAVE_OPT_VIEWER_MODULES:UNINITIALIZED=3DOFF

//No help, variable specified on the command line.
LLVM_HAVE_OPT_VIEWER_MODULES:UNINITIALIZED=3DON

Markus

Am 22.06.22 um 15:54 schrieb Stefan Herbrechtsmeier:
> Hi Richard,
>
> Am 22.06.2022 um 15:10 schrieb Richard Purdie via lists.openembedded.or=
g:
>> There is a reproducibility issue which shouldn't be too hard to fix if
>> someone had a few minutes to help out:
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14845
>>
>> It is in llvm and is a cmake configuration issue. Rather than setting
>> that option based on the presence of python modules (with python from
>> the host), we should add a configuration option to force it to be
>> disabled in our case. Should be upstreamable with the right patch.
>
> I'm not able to test it at the moment but it should be possible to set=20
> the variables (PY_PYGMENTS_FOUND, PY_PYGMENTS_LEXERS_C_CPP_FOUND and=20
> PY_YAML_FOUND) to OFF via EXTRA_OECMAKE:
>
> -DPY_PYGMENTS_FOUND=3DOFF
>
> The find_python_module function in config-ix.cmake returns early if=20
> the variable PY_${module_upper}_FOUND is defined.
>
> Regards
> =C2=A0 Stefan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167237): https://lists.openembedded.org/g/openembed=
ded-core/message/167237
> Mute This Topic: https://lists.openembedded.org/mt/91921251/3618223
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
f_l_k@t-online.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

