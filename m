Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5D8C433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 16:26:11 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web08.11616.1654359965784521417
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 09:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout12.t-online.de (Postfix) with SMTP id 1EB862026D;
	Sat,  4 Jun 2022 18:26:00 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.41.60]) by fwd88.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nxWb7-1aXYcj0; Sat, 4 Jun 2022 18:25:57 +0200
Message-ID: <d5887223-b996-cd38-3fd2-b2e04d51ff90@t-online.de>
Date: Sat, 4 Jun 2022 18:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe-core][PATCHv2 4/6] libsdl2: dont mix opengl and gles backends
 for wayland
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220604053028.4682-1-f_l_k@t-online.de>
 <20220604053028.4682-4-f_l_k@t-online.de>
 <d82cc562394b4cd74a3fedc53e6b41f7bb053f81.camel@linuxfoundation.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <d82cc562394b4cd74a3fedc53e6b41f7bb053f81.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1654359957-01436587-3594B929/0/0 CLEAN NORMAL
X-TOI-MSGID: ad2b4015-ed52-438c-be87-3443ded84b69
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 16:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166571

Could it be that we need to add a wayland exception here as well, since 
xorgproto can now be built for wayland?

https://git.yoctoproject.org/meta-mingw/tree/recipes-graphics/libsdl2/libsdl2_%25.bbappend?h=master-next#n4

Am 04.06.22 um 15:27 schrieb Richard Purdie:
> On Sat, 2022-06-04 at 07:30 +0200, Markus Volk wrote:
>> This fixes "Could not initialize egl display" in libsdl2 apps for
>> wayland without DISTRO_FEATURE x11
>>
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>>   meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
>> index 8519e7f732..e057b5cbbc 100644
>> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
>> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
>> @@ -56,14 +56,16 @@ EXTRA_OECMAKE = "-DSDL_OSS=OFF -DSDL_ESD=OFF -DSDL_ARTS=OFF \
>>   
>>   # opengl packageconfig factored out to make it easy for distros
>>   # and BSP layers to pick either (desktop) opengl, gles2, or no GL
>> -PACKAGECONFIG_GL ?= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
>> +PACKAGECONFIG_GL ?= " \
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'gles2', '', d)} \
>> +"
>>   
>>   PACKAGECONFIG:class-native = "x11 ${PACKAGECONFIG_GL}"
>>   PACKAGECONFIG:class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} ${PACKAGECONFIG_GL}"
>>   PACKAGECONFIG ??= " \
>>       ${PACKAGECONFIG_GL} \
>> -    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11', d)} \
>> -    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2', '', d)} \
>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11 wayland', d)} \
>>       ${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \
>>   "
>>   PACKAGECONFIG[alsa]       = "-DSDL_ALSA=ON,-DSDL_ALSA=OFF,alsa-lib,"
> I think this is breaking mingw builds:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/5320
>
>
> Cheers,
>
> Richard

