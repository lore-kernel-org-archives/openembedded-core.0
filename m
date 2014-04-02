Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id A22856FA38
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 01:42:50 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id r10so10350129pdi.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 18:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ughXAm97ZmKUN0c9ISAJ4+fyuiJUy1zwHoetBA4AE0E=;
	b=spVG3D3E3eqJvq2LCUZBXLndGIYvypqO/kFHuLy+pBz47CC6dlqmCH6TNM0Tsdxd03
	+JD38aLhTsaKsjYGPAXidRxwCY9s0VGduqqsqBRgb4mMbO2DUuinEz3ysUTe2ZflBpX5
	30wL84PHBZE9jKsziya0TbCe0zqvslKQFs2oJ6tPrqLR/g/ygowpl1cmn8DmaJF8aA1j
	HevTMOy66Sijq/zr4RyqXTYHY3FZuXXl5dly8ClR41joO1ujCphmeslEbWiih96jqu/e
	HgDCUyCXdERWQVHquyUPxRZHhTii6h8dycw/xmuAqtt5MzHzTUJaLSoxGR5pfcX4UC3R
	hX3Q==
X-Received: by 10.66.193.161 with SMTP id hp1mr34643181pac.20.1396402970498;
	Tue, 01 Apr 2014 18:42:50 -0700 (PDT)
Received: from [172.17.10.56] ([12.199.200.26])
	by mx.google.com with ESMTPSA id xr9sm1883633pab.5.2014.04.01.18.42.49
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Apr 2014 18:42:49 -0700 (PDT)
Message-ID: <533B6B19.2080709@gmail.com>
Date: Tue, 01 Apr 2014 18:42:49 -0700
From: Andre McCurdy <armccurdy@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1396336240-9708-1-git-send-email-armccurdy@gmail.com>
	<1396349647.1432.7.camel@ted>
In-Reply-To: <1396349647.1432.7.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libsdl: PACKAGECONFIG conversion
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Apr 2014 01:42:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/2014 03:54 AM, Richard Purdie wrote:
> On Tue, 2014-04-01 at 00:10 -0700, Andre McCurdy wrote:
>> General cleanup + make it easier for distros / machines which
>> support OpenGL ES only to prevent attempts to build against libgl.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>   meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 30 ++++++++++++++++++---------
>>   1 file changed, 20 insertions(+), 10 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
>> index e19c388..f72f74f 100644
>> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
>> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
>> @@ -12,10 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
>>
>>   PROVIDES = "virtual/libsdl"
>>
>> -DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
>> -           ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl libglu', '', d)} \
>> -           ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
>> -           tslib"
>>   DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
>
> I have a nasty feeling this will break libsdl-native :(
>

Yes, it does :-(

Attempting a v2, but using PACKAGECONFIG to managed DEPENDS for x11
runs into problems. It seems that the nativesdk package renaming
mis-renames DEPENDS coming from PACKAGECONFIG which have a virtual/
prefix (the nativesdk- gets added twice):

ERROR: Nothing PROVIDES 'virtual/nativesdk-nativesdk-libx11' (but 
virtual:nativesdk:/home/andre/oe-master/openembedded-core/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb 
DEPENDS on or otherwise requires it). Close matches:
   virtual/nativesdk-libx11
   virtual/nativesdk-libc
   virtual/nativesdk-db


>
>>   PR = "r3"
>> @@ -38,17 +34,31 @@ EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers
>>                   --disable-mintaudio --disable-nasm --disable-video-dga \
>>                   --disable-video-fbcon --disable-video-ps2gs --disable-video-ps3 \
>>                   --disable-xbios --disable-gem --disable-video-dummy \
>> -                --enable-input-events --enable-input-tslib --enable-pthreads \
>> -                ${@base_contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
>> -                ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
>> -                ${@base_contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
>> -                --disable-video-svga \
>> +                --enable-input-events --enable-pthreads --disable-video-svga \
>>                   --disable-video-picogui --disable-video-qtopia --enable-sdl-dlopen \
>>                   --disable-rpath \
>>                   --disable-pulseaudio"
>>
>> -PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
>> +PACKAGECONFIG_ALSA ?= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
>> +PACKAGECONFIG_DIRECTFB ?= "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
>> +# Warning: "opengl" in DISTRO_FEATURES implies GL and/or GLES but libsdl supports GL only.
>> +PACKAGECONFIG_OPENGL ?= "${@base_contains('DISTRO_FEATURES', 'opengl', 'opengl', '', d)}"
>> +PACKAGECONFIG_TSLIB ?= "tslib"
>> +PACKAGECONFIG_X11 ?= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>> +
>> +PACKAGECONFIG ?= " \
>> +    ${PACKAGECONFIG_ALSA} \
>> +    ${PACKAGECONFIG_DIRECTFB} \
>> +    ${PACKAGECONFIG_OPENGL} \
>> +    ${PACKAGECONFIG_TSLIB} \
>> +    ${PACKAGECONFIG_X11} \
>> +    "
>> +
>>   PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
>> +PACKAGECONFIG[directfb] = "--enable-video-directfb,--disable-video-directfb,directfb"
>> +PACKAGECONFIG[opengl] = "--enable-video-opengl,--disable-video-opengl,virtual/libgl libglu"
>> +PACKAGECONFIG[tslib] = "--enable-input-tslib,--disable-input-tslib,tslib"
>> +PACKAGECONFIG[x11] = "--enable-video-x11,--disable-video-x11,virtual/libx11 libxext libxrandr libxrender"
>>
>>   PARALLEL_MAKE = ""
>>
>> --
>> 1.8.1.2
>>
>
>

