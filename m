Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD03DC433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 14:30:59 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.8309.1652970654194025095
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 07:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout04.t-online.de (Postfix) with SMTP id 2A0802ABF;
	Thu, 19 May 2022 16:30:52 +0200 (CEST)
Received: from [192.168.178.83] ([84.154.174.3]) by fwd76.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nrhAw-0awKLh0; Thu, 19 May 2022 16:30:51 +0200
Content-Type: multipart/alternative;
 boundary="------------66tgqGay15gCEyVChs1RKoEf"
Message-ID: <95b9ccd4-b136-7e29-17c1-3291fa5c5cc5@t-online.de>
Date: Thu, 19 May 2022 16:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [OE-core] [meta-oe][RFC PATCH 2/2] libsdl2: rework and cleanup
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220519064312.391164-1-f_l_k@t-online.de>
 <20220519064312.391164-2-f_l_k@t-online.de> <20220519161829.2d10631c@melee>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20220519161829.2d10631c@melee>
X-TOI-EXPURGATEID: 150726::1652970651-0001619A-FEF16738/0/0 CLEAN NORMAL
X-TOI-MSGID: 599d4496-3cef-401d-9c3d-748b91228313
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 14:30:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165892

This is a multi-part message in MIME format.
--------------66tgqGay15gCEyVChs1RKoEf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Luca,
thats probably an issue because libusb-compat is not in oe-core but meta-oe
What would be the preferred way to fix it ?
+DEPENDS = "libusb1" ?

Am 19.05.22 um 16:18 schrieb Luca Ceresoli:
> Hello Marius,
>
> Il giorno Thu, 19 May 2022 08:43:12 +0200
> "Markus Volk"<f_l_k@t-online.de>  ha scritto:
>
>> - add libusb dependency because libsdl2 is looking for it
>> - remove xvm and xinerama since support has been dropped in sdl code
>> - allow native build for libxkbcommon and xkeyboard-config to allow
>>    alignment of native/target build
>> - align native and target build
>> - add PACKAGECONFIG options for pipewire and libdecor
>>
>> Signed-off-by: Markus Volk<f_l_k@t-online.de>
>> ---
>>   meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb | 17
>> ++++++++--------- .../xorg-lib/libxkbcommon_1.4.0.bb              |
>> 2 ++ .../xorg-lib/xkeyboard-config_2.35.1.bb         |  2 ++
>>   3 files changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
>> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb index
>> 7678319770..a6550c3175 100644 ---
>> a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb +++
>> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb @@ -21,6 +21,8 @@
>> LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG',
>> 'arm-neon', 'f PROVIDES = "virtual/libsdl2"
>>   
>> +DEPENDS = "libusb"
> This patch is causing errors on the autobuilders due to this line:
>
> stdio: ERROR: Nothing PROVIDES 'libusb' (but
> /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> DEPENDS on or otherwise requires it). Close matches:
>
> Here are a few logs:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5269/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5269/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5269/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5590/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5243/steps/12/logs/stdio
>
--------------66tgqGay15gCEyVChs1RKoEf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="Rachana"><font face="Liberation Sans">Hello Luca,<br>
        thats probably an issue because libusb-compat is not in oe-core
        but meta-oe<br>
        What would be the preferred way to fix it ?<br>
        +DEPENDS = "libusb1" ?</font><br>
      <br>
    </font>
    <div class="moz-cite-prefix">Am 19.05.22 um 16:18 schrieb Luca
      Ceresoli:<br>
    </div>
    <blockquote type="cite" cite="mid:20220519161829.2d10631c@melee">
      <pre class="moz-quote-pre" wrap="">Hello Marius,

Il giorno Thu, 19 May 2022 08:43:12 +0200
"Markus Volk" <a class="moz-txt-link-rfc2396E" href="mailto:f_l_k@t-online.de">&lt;f_l_k@t-online.de&gt;</a> ha scritto:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">- add libusb dependency because libsdl2 is looking for it
- remove xvm and xinerama since support has been dropped in sdl code
- allow native build for libxkbcommon and xkeyboard-config to allow
  alignment of native/target build
- align native and target build
- add PACKAGECONFIG options for pipewire and libdecor

Signed-off-by: Markus Volk <a class="moz-txt-link-rfc2396E" href="mailto:f_l_k@t-online.de">&lt;f_l_k@t-online.de&gt;</a>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb | 17
++++++++--------- .../xorg-lib/libxkbcommon_1.4.0.bb              |
2 ++ .../xorg-lib/xkeyboard-config_2.35.1.bb         |  2 ++
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb index
7678319770..a6550c3175 100644 ---
a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb +++
b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb @@ -21,6 +21,8 @@
LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG',
'arm-neon', 'f PROVIDES = "virtual/libsdl2"
 
+DEPENDS = "libusb"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This patch is causing errors on the autobuilders due to this line:

stdio: ERROR: Nothing PROVIDES 'libusb' (but
/home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
DEPENDS on or otherwise requires it). Close matches:

Here are a few logs:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5269/steps/11/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5269/steps/11/logs/stdio</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5269/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5269/steps/12/logs/stdio</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5269/steps/14/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5269/steps/14/logs/stdio</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5590/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5590/steps/12/logs/stdio</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5243/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5243/steps/12/logs/stdio</a>

</pre>
    </blockquote>
  </body>
</html>

--------------66tgqGay15gCEyVChs1RKoEf--

