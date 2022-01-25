Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162A2C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 14:57:50 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.7980.1643122668586284949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 06:57:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout07.t-online.de (Postfix) with SMTP id C1355FE98
	for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 15:57:46 +0100 (CET)
Received: from [192.168.178.83] ([84.163.43.159]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nCNGU-0ipFJ30; Tue, 25 Jan 2022 15:57:46 +0100
Message-ID: <d2450098-12aa-d0c4-2699-614dc72cc8da@t-online.de>
Date: Tue, 25 Jan 2022 15:57:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core][PATCHv2] libical: build gobject and vala introspection
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220121035639.230863-1-f_l_k@t-online.de>
 <52c9f0d2a60594c1d450955ae63b2557e07c02ba.camel@linuxfoundation.org>
 <16CD89B5CB08D4EF.25271@lists.openembedded.org>
 <16CD8A5888719680.6761@lists.openembedded.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <16CD8A5888719680.6761@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1643122666-0000C4DD-B7A069DD/0/0 CLEAN NORMAL
X-TOI-MSGID: 17efb3e5-37ce-402a-b907-fd6f99922426
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 14:57:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160938

but with this no gir files are created at all

Am 25.01.22 um 15:39 schrieb Markus Volk:
> it also compiles here like this:
>
> EXTRA_OECMAKE:class-target +=3D=20
> "-DGObjectIntrospection_COMPILER=3D${STAGING_BINDIR}/g-ir-compiler-wrap=
per"
> EXTRA_OECMAKE:class-target +=3D=20
> "-DGObjectIntrospection_SCANNER=3D${STAGING_BINDIR}/g-ir-scanner-wrappe=
r=20
> -DICAL_BUILD_DOCS=3Dfalse"
>
> no idea why i have to explicitly disable ICAL_BUILD_DOCS or it'll fail=20
> with linker error. But nevertheless. This may also help
>
>
> Am 25.01.22 um 15:27 schrieb Markus Volk:
>> it doesn't break on my machine but according to the log it fails at=20
>> trying to create gir for native.=C2=A0 Does this line help solving the=
 issue?
>>
>> EXTRA_OECMAKE:class-native +=3D "-DGOBJECT_INTROSPECTION=3DOFF=20
>> -DICAL_BUILD_DOCS=3Dfalse"
>>
>> Am 25.01.22 um 14:31 schrieb Richard Purdie:
>>> On Fri, 2022-01-21 at 04:56 +0100, Markus Volk wrote:
>>>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>>>> ---
>>>> =C2=A0 meta/recipes-support/libical/libical_3.0.12.bb | 7 ++++++-
>>>> =C2=A0 1 file changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-support/libical/libical_3.0.12.bb=20
>>>> b/meta/recipes-support/libical/libical_3.0.12.bb
>>>> index b2b2211b9b..614a76ba5b 100644
>>>> --- a/meta/recipes-support/libical/libical_3.0.12.bb
>>>> +++ b/meta/recipes-support/libical/libical_3.0.12.bb
>>>> @@ -16,7 +16,7 @@ SRC_URI =3D=20
>>>> "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar=
.g
>>>> =C2=A0 SRC_URI[sha256sum] =3D=20
>>>> "35095a4cc1a061a3de0f332c2dc728226cf127fa0baa818e9f8856cee6d35830"
>>>> =C2=A0 UPSTREAM_CHECK_URI =3D "https://github.com/libical/libical/re=
leases"
>>>> =C2=A0 -inherit cmake pkgconfig
>>>> +inherit cmake pkgconfig gobject-introspection vala
>>>> =C2=A0 =C2=A0 DEPENDS +=3D "libical-native"
>>>> =C2=A0 @@ -32,6 +32,11 @@ EXTRA_OECMAKE +=3D=20
>>>> "-DPERL_EXECUTABLE=3D${HOSTTOOLS_DIR}/perl"
>>>> =C2=A0 EXTRA_OECMAKE +=3D "-DLIBICAL_BUILD_TESTING=3Dfalse"
>>>> =C2=A0 # doc build fails with linker error (??) for libical-glib so=20
>>>> disable it
>>>> =C2=A0 EXTRA_OECMAKE +=3D "-DICAL_BUILD_DOCS=3Dfalse"
>>>> +# gobject-introspection
>>>> +EXTRA_OECMAKE +=3D=20
>>>> "-DGObjectIntrospection_COMPILER=3D${STAGING_BINDIR}/g-ir-compiler-w=
rapper"
>>>> +EXTRA_OECMAKE +=3D=20
>>>> "-DGObjectIntrospection_SCANNER=3D${STAGING_BINDIR}/g-ir-scanner-wra=
pper"=20
>>>>
>>>> +EXTRA_OECMAKE +=3D "-DVAPIGEN=3D${STAGING_BINDIR_NATIVE}/vapigen"
>>>> +EXTRA_OECMAKE +=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True',=
=20
>>>> '-DGOBJECT_INTROSPECTION=3DON -DICAL_GLIB_VAPI=3DON',=20
>>>> '-DGOBJECT_INTROSPECTION=3DOFF', d)}"
>>>> =C2=A0 =C2=A0 # Tell the cross-libical where the tool it needs to bu=
ild is
>>>> =C2=A0 EXTRA_OECMAKE:append:class-target =3D "=20
>>>> -DIMPORT_ICAL_GLIB_SRC_GENERATOR=3D${STAGING_LIBDIR_NATIVE}/cmake/Li=
bIcal/IcalGlibSrcGenerator.cmake"
>>>
>>> Looks like this breaks libical-native:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/461=
8
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/464=
5
>>>
>>> and many more in that build.
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>>
>>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160936): https://lists.openembedded.org/g/openembed=
ded-core/message/160936
> Mute This Topic: https://lists.openembedded.org/mt/88576745/3618223
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
f_l_k@t-online.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

