Return-Path: <martin.beeger@online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C724C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 14:52:58 +0000 (UTC)
Received: from mail.indurad.com (mail.indurad.com [194.8.217.179])
 by mx.groups.io with SMTP id smtpd.web11.11785.1645195976691494479
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 06:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: online.de, ip: 194.8.217.179, mailfrom: martin.beeger@online.de)
X-Virus-Scanned: Debian amavisd-new at mail.indurad.com
Received: from [10.144.1.55] (perlenbacher.bvd.indurad.x [10.144.1.55])
	by mail-rc1.bvd.indurad.x (Postfix) with ESMTPSA id BA7D7178D;
	Fri, 18 Feb 2022 15:52:52 +0100 (CET)
Message-ID: <f11a959e-826a-7cac-c433-47fd0395a49a@online.de>
Date: Fri, 18 Feb 2022 15:52:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [OE-core] [PATCHv2] cmake: remove CMAKE_ASM_FLAGS variable in
 toolchain file
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20220217155729.20280-1-martin.beeger@online.de>
 <db1cfd4d-6a62-26c8-27e7-4ea707aacb61@gmail.com>
From: Martin Beeger <martin.beeger@online.de>
In-Reply-To: <db1cfd4d-6a62-26c8-27e7-4ea707aacb61@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 14:52:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161945

If you provide ASFLAGS CMake will already load them into CMAKE_AS_FLAGS=20
anyway, they will just not be force-overriden.

Martin

Am 17.02.22 um 20:46 schrieb Khem Raj:
>
>
> On 2/17/22 7:57 AM, Martin Beeger wrote:
>> As discussied in [YOCTO #14717] cmake contains a OEToolchainConfig.cma=
ke
>> file to configure the toolchain correctly in cross-compile build for=20
>> recipes
>> using cmake. The CMAKE_ASM_FLAGS are the configuration are meant for=C2=
=A0=20
>> assembly,
>> but the spelling is incorrect and the Flag is ASFLAGS for gcc and=20
>> other compilers.
>> So this variable might neever have worked and it is better for
>> recipes to specify their own.
>>
>> Signed-off-by: Martin Beeger <martin.beeger@online.de>
>> ---
>> =C2=A0 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 1 -
>> =C2=A0 1 file changed, 1 deletion(-)
>>
>> diff --git=20
>> a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake=20
>> b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
>> index 86446c3ace..3ddef12c83 100644
>> --- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
>> +++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
>> @@ -1,7 +1,6 @@
>> =C2=A0 set( CMAKE_SYSTEM_NAME Linux )
>> =C2=A0 set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
>> =C2=A0 set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}=C2=A0 CACHE STRING "" FORCE=
 )
>> -set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
>
> We do have global ASFLAGS so why not use that.
>
>> =C2=A0 set( CMAKE_SYSROOT $ENV{OECORE_TARGET_SYSROOT} )
>> =C2=A0 =C2=A0 set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} )
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#161817):=20
>> https://lists.openembedded.org/g/openembedded-core/message/161817
>> Mute This Topic: https://lists.openembedded.org/mt/89212148/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


