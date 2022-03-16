Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4822C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 08:17:56 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.22455.1647418675805865368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 01:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80,
 mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout01.t-online.de (Postfix) with SMTP id C45C5629D;
	Wed, 16 Mar 2022 09:17:53 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.155]) by fwd70.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nUOqv-0FdaRl0; Wed, 16 Mar 2022 09:17:53 +0100
Message-ID: <e22cff67-ee2d-77f2-6f6d-2871de9543ff@t-online.de>
Date: Wed, 16 Mar 2022 09:17:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: nativesdk-mesa fails to build since upgrade to version 22.0.0
Content-Language: en-US
To: Matthias Klein <matthias.klein@optimeas.de>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: 
 <AM0PR10MB3107FFA113179C9A717C03A199119@AM0PR10MB3107.EURPRD10.PROD.OUTLOOK.COM>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <AM0PR10MB3107FFA113179C9A717C03A199119@AM0PR10MB3107.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1647418673-00004E7B-65033B98/0/0 CLEAN NORMAL
X-TOI-MSGID: 6ff58237-bdb0-43ff-aedc-ca5ba727bd36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 08:17:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163324

Hi Matthias,

since you have disabled x11 for target ... does it help to also remove 
it from native and nativesdk ?

PACKAGECONFIG:remove:class-native = " x11"

PACKAGECONFIG:remove:class-nativesdk = " x11"

Regards,

Markus

Am 16.03.22 um 08:40 schrieb Matthias Klein:
> Hello,
>
> I am using mesa in conjunction with meta-qt6 without X11/wayland on an iMX6 with etnaviv.
>
> So in a bbappend I have: PACKAGECONFIG:append = " etnaviv".
>
> I use poky with the following DISTRO_FEATURES:
> DISTRO_FEATURES:remove = "x11 wayland vulkan 3g nfc nfs zeroconf"
> DISTRO_FEATURES:append = " directfb opengl"
>
> Unfortunately, nativesdk-mesa now no longer builds on build via "-c populate_sdk". However, the package for the target still builds.
>
> | ../mesa-22.0.0/meson.build:520: WARNING: cannot auto-detect -mtls-dialect when cross-compiling, using compiler default
> |
> | ../mesa-22.0.0/meson.build:614:2: ERROR: Problem encountered: kmsro requires dri3 for X11 support
>
> I compared the meson calls on the target and SDK builds:
> NOTE: Executing meson -Dshared-glapi=enabled -Dgallium-opencl=disabled -Dglx-read-only-text=true -Dplatforms= -Ddri3=disabled -Degl=enabled -Delf-tls=true -Dgallium-drivers=swrast,etnaviv, virgl -Dllvm=disabled -Dgbm=enabled -Dgles1=enabled -Dgles2=enabled -Dlmsensors=disabled -Dopengl=true -
> Dosmesa=false -Dlibunwind=disabled -Dgallium-va=disabled -Dgallium-vdpau=disabled -Dvulkan-drivers= -Dglx=disabled -Dgallium-xa=disabled -Dgallium-xvmc=disabled. ..
>
> NOTE: Executing meson -Dshared-glapi=enabled -Dgallium-opencl=disabled -Dglx-read-only-text=true -Dplatforms=x11 -Ddri3=disabled -Degl=enabled -Delf-tls=true -Dgallium-drivers=swrast, etnaviv -Dllvm=disabled -Dgbm=enabled -Dgles1=disabled -Dgles2=disabled -Dlmsensors=disabled -Dopengl=true -Dosmesa=false -Dlibunwind=disabled -Dgallium-va=disabled -Dgallium-vdpau=disabled -Dvulkan-drivers= -Dgallium-xa=disabled -Dgallium-xvmc=disabled. ..
>
> Does anyone have any idea what I could do to get the SDK built?
>
> Many greetings,
> Matthias
>

