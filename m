Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39341C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 08:35:04 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web12.22346.1647419703058454255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 01:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout03.t-online.de (Postfix) with SMTP id CA84C32E2
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 09:35:00 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.155]) by fwd81.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nUP7U-1CLWpl0; Wed, 16 Mar 2022 09:35:00 +0100
Content-Type: multipart/alternative;
 boundary="------------4VCTFdHpn7juEEm0qTbmC5UE"
Message-ID: <33fa836d-4905-b46a-4a72-31ccef03693e@t-online.de>
Date: Wed, 16 Mar 2022 09:34:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] nativesdk-mesa fails to build since upgrade to version
 22.0.0
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: 
 <AM0PR10MB3107FFA113179C9A717C03A199119@AM0PR10MB3107.EURPRD10.PROD.OUTLOOK.COM>
 <16DCCE8EC93DCD97.17060@lists.openembedded.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <16DCCE8EC93DCD97.17060@lists.openembedded.org>
X-TOI-EXPURGATEID: 150726::1647419700-0000BD0E-5B35C822/0/0 CLEAN NORMAL
X-TOI-MSGID: 44225ed5-62ab-480e-a2db-9bd4e3ed45cb
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 08:35:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163325

This is a multi-part message in MIME format.
--------------4VCTFdHpn7juEEm0qTbmC5UE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

What does happen, if adding dri3 like this?

|

PACKAGECONFIG:append:class-native = " dri3" |

PACKAGECONFIG:append:class-nativesdk = "dri3"|


|

Am 16.03.22 um 09:17 schrieb Markus Volk:
> Hi Matthias,
>
> since you have disabled x11 for target ... does it help to also remove 
> it from native and nativesdk ?
>
> PACKAGECONFIG:remove:class-native = " x11"
>
> PACKAGECONFIG:remove:class-nativesdk = " x11"
>
> Regards,
>
> Markus
>
> Am 16.03.22 um 08:40 schrieb Matthias Klein:
>> Hello,
>>
>> I am using mesa in conjunction with meta-qt6 without X11/wayland on 
>> an iMX6 with etnaviv.
>>
>> So in a bbappend I have: PACKAGECONFIG:append = " etnaviv".
>>
>> I use poky with the following DISTRO_FEATURES:
>> DISTRO_FEATURES:remove = "x11 wayland vulkan 3g nfc nfs zeroconf"
>> DISTRO_FEATURES:append = " directfb opengl"
>>
>> Unfortunately, nativesdk-mesa now no longer builds on build via "-c 
>> populate_sdk". However, the package for the target still builds.
>>
>> | ../mesa-22.0.0/meson.build:520: WARNING: cannot auto-detect 
>> -mtls-dialect when cross-compiling, using compiler default
>> |
>> | ../mesa-22.0.0/meson.build:614:2: ERROR: Problem encountered: kmsro 
>> requires dri3 for X11 support
>>
>> I compared the meson calls on the target and SDK builds:
>> NOTE: Executing meson -Dshared-glapi=enabled 
>> -Dgallium-opencl=disabled -Dglx-read-only-text=true -Dplatforms= 
>> -Ddri3=disabled -Degl=enabled -Delf-tls=true 
>> -Dgallium-drivers=swrast,etnaviv, virgl -Dllvm=disabled -Dgbm=enabled 
>> -Dgles1=enabled -Dgles2=enabled -Dlmsensors=disabled -Dopengl=true -
>> Dosmesa=false -Dlibunwind=disabled -Dgallium-va=disabled 
>> -Dgallium-vdpau=disabled -Dvulkan-drivers= -Dglx=disabled 
>> -Dgallium-xa=disabled -Dgallium-xvmc=disabled. ..
>>
>> NOTE: Executing meson -Dshared-glapi=enabled 
>> -Dgallium-opencl=disabled -Dglx-read-only-text=true -Dplatforms=x11 
>> -Ddri3=disabled -Degl=enabled -Delf-tls=true 
>> -Dgallium-drivers=swrast, etnaviv -Dllvm=disabled -Dgbm=enabled 
>> -Dgles1=disabled -Dgles2=disabled -Dlmsensors=disabled -Dopengl=true 
>> -Dosmesa=false -Dlibunwind=disabled -Dgallium-va=disabled 
>> -Dgallium-vdpau=disabled -Dvulkan-drivers= -Dgallium-xa=disabled 
>> -Dgallium-xvmc=disabled. ..
>>
>> Does anyone have any idea what I could do to get the SDK built?
>>
>> Many greetings,
>> Matthias
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163324):https://lists.openembedded.org/g/openembedded-core/message/163324
> Mute This Topic:https://lists.openembedded.org/mt/89817006/3618223
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [f_l_k@t-online.de]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------4VCTFdHpn7juEEm0qTbmC5UE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>What does happen, if adding dri3 like this?</p>
    <pre><code><pre><span class="n">PACKAGECONFIG</span><span class="err">:</span><span class="n">append:class</span><span class="o">-</span><span class="n">native = " dri3"
</span><code><pre><span class="n">PACKAGECONFIG</span><span class="err">:append:</span><span class="n">class</span><span class="o">-</span><span class="n">nativesdk = "dri3"</span></pre></code>
<span class="n"></span></pre></code></pre>
    <pre class="moz-quote-pre" wrap="">
</pre>
    <div class="moz-cite-prefix">Am 16.03.22 um 09:17 schrieb Markus
      Volk:<br>
    </div>
    <blockquote type="cite"
      cite="mid:16DCCE8EC93DCD97.17060@lists.openembedded.org">Hi
      Matthias,
      <br>
      <br>
      since you have disabled x11 for target ... does it help to also
      remove it from native and nativesdk ?
      <br>
      <br>
      PACKAGECONFIG:remove:class-native = " x11"
      <br>
      <br>
      PACKAGECONFIG:remove:class-nativesdk = " x11"
      <br>
      <br>
      Regards,
      <br>
      <br>
      Markus
      <br>
      <br>
      Am 16.03.22 um 08:40 schrieb Matthias Klein:
      <br>
      <blockquote type="cite">Hello,
        <br>
        <br>
        I am using mesa in conjunction with meta-qt6 without X11/wayland
        on an iMX6 with etnaviv.
        <br>
        <br>
        So in a bbappend I have: PACKAGECONFIG:append = " etnaviv".
        <br>
        <br>
        I use poky with the following DISTRO_FEATURES:
        <br>
        DISTRO_FEATURES:remove = "x11 wayland vulkan 3g nfc nfs
        zeroconf"
        <br>
        DISTRO_FEATURES:append = " directfb opengl"
        <br>
        <br>
        Unfortunately, nativesdk-mesa now no longer builds on build via
        "-c populate_sdk". However, the package for the target still
        builds.
        <br>
        <br>
        | ../mesa-22.0.0/meson.build:520: WARNING: cannot auto-detect
        -mtls-dialect when cross-compiling, using compiler default
        <br>
        |
        <br>
        | ../mesa-22.0.0/meson.build:614:2: ERROR: Problem encountered:
        kmsro requires dri3 for X11 support
        <br>
        <br>
        I compared the meson calls on the target and SDK builds:
        <br>
        NOTE: Executing meson -Dshared-glapi=enabled
        -Dgallium-opencl=disabled -Dglx-read-only-text=true -Dplatforms=
        -Ddri3=disabled -Degl=enabled -Delf-tls=true
        -Dgallium-drivers=swrast,etnaviv, virgl -Dllvm=disabled
        -Dgbm=enabled -Dgles1=enabled -Dgles2=enabled
        -Dlmsensors=disabled -Dopengl=true -
        <br>
        Dosmesa=false -Dlibunwind=disabled -Dgallium-va=disabled
        -Dgallium-vdpau=disabled -Dvulkan-drivers= -Dglx=disabled
        -Dgallium-xa=disabled -Dgallium-xvmc=disabled. ..
        <br>
        <br>
        NOTE: Executing meson -Dshared-glapi=enabled
        -Dgallium-opencl=disabled -Dglx-read-only-text=true
        -Dplatforms=x11 -Ddri3=disabled -Degl=enabled -Delf-tls=true
        -Dgallium-drivers=swrast, etnaviv -Dllvm=disabled -Dgbm=enabled
        -Dgles1=disabled -Dgles2=disabled -Dlmsensors=disabled
        -Dopengl=true -Dosmesa=false -Dlibunwind=disabled
        -Dgallium-va=disabled -Dgallium-vdpau=disabled -Dvulkan-drivers=
        -Dgallium-xa=disabled -Dgallium-xvmc=disabled. ..
        <br>
        <br>
        Does anyone have any idea what I could do to get the SDK built?
        <br>
        <br>
        Many greetings,
        <br>
        Matthias
        <br>
        <br>
      </blockquote>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#163324): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/163324">https://lists.openembedded.org/g/openembedded-core/message/163324</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/89817006/3618223">https://lists.openembedded.org/mt/89817006/3618223</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------4VCTFdHpn7juEEm0qTbmC5UE--

