Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVGRu-0000R1-7D
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 06:41:46 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2011 21:34:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="80738868"
Received: from unknown (HELO [10.255.15.251]) ([10.255.15.251])
	by orsmga001.jf.intel.com with ESMTP; 28 Nov 2011 21:34:56 -0800
Message-ID: <4ED46F00.20700@linux.intel.com>
Date: Mon, 28 Nov 2011 21:34:56 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
	<d10d38e320b27bfbbf6d069e820a2b6c013bbbdc.1321028799.git.Martin.Jansa@gmail.com>
	<20111115234557.GD3600@jama.jama.net>
	<1321438335.26881.232.camel@ted>
	<20111125075121.GX3565@jama.jama.net>
In-Reply-To: <20111125075121.GX3565@jama.jama.net>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH][oe-core 14/22] libsdl: enable alsa/opengl based on PACKAGECONFIG and respect DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2011 05:41:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/2011 11:51 PM, Martin Jansa wrote:
> On Wed, Nov 16, 2011 at 10:12:15AM +0000, Richard Purdie wrote:
>> On Wed, 2011-11-16 at 00:45 +0100, Martin Jansa wrote:
>>> On Fri, Nov 11, 2011 at 05:28:50PM +0100, Martin Jansa wrote:
>>>> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>>>> ---
>>>>   meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |   10 +++++++---
>>>>   1 files changed, 7 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
>>>> index 17a3103..2f49f16 100644
>>>> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
>>>> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
>>>> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
>>>>
>>>>   PROVIDES = "virtual/libsdl"
>>>>
>>>> -DEPENDS = "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} virtual/libx11 libxext libxrandr libxrender alsa-lib tslib"
>>>> +DEPENDS = "virtual/libx11 libxext libxrandr libxrender tslib"
>>>>   DEPENDS_virtclass-nativesdk = "libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk"
>>>
>>> As Saul reported PACKAGECONFIG adds build time depends not only to
>>> DEPENDS but they also ends in DEPENDS_virtclass-nativesdk and nothing
>>> provides virtual/libgl-nativesdk. So I've resend this patch changing
>>> only alsa handling to PACKAGECONFIG and keeping opengl as it was.
>>>
>>> Cheers,
>>>
>>>>   PR = "r1"
>>>> @@ -29,17 +29,21 @@ SRC_URI[sha256sum] = "5d927e287034cb6bb0ebccfa382cb1d185cb113c8ab5115a0759798642
>>>>   inherit autotools binconfig pkgconfig
>>>>
>>>>   EXTRA_OECONF = "--disable-static --disable-debug --enable-cdrom --enable-threads --enable-timers --enable-endian \
>>>> -                --enable-file --disable-oss --enable-alsa --disable-esd --disable-arts \
>>>> +                --enable-file --disable-oss --disable-esd --disable-arts \
>>>>                   --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
>>>>                   --disable-mintaudio --disable-nasm --enable-video-x11 --disable-video-dga \
>>>>                   --disable-video-fbcon --disable-video-directfb --disable-video-ps2gs --disable-video-ps3 \
>>>>                   --disable-video-xbios --disable-video-gem --disable-video-dummy \
>>>>                   --enable-input-events --enable-input-tslib --enable-pthreads \
>>>> -		${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
>>>>   		--disable-video-svga \
>>>>                   --disable-video-picogui --disable-video-qtopia --enable-dlopen \
>>>>                   --disable-rpath"
>>>>
>>>> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'opengl', 'opengl', '', d)} \
>>>> +                   ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
>>>> +PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib,"
>>>> +PACKAGECONFIG[opengl] = "--enable-video-opengl,--disable-video-opengl,virtual/libgl,"
>>>> +
>>
>> What we could do is have a
>> PACKAGECONFIG_virtclass-nativesdk = "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
>> or something like that.
>
> We've discussed this on IRC and just to be sure, do you want me to add
> this first or can this patch go in now when builder is greener? The
> jansa/pull branch has the version using PACKAGECONFIG only for alsa and
> keeping opengl mangling as it was.
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/pull&id=aafe9d871bcbdf6995432e2c8404a6c49ba942b5
>
Martin,

Where are we with this one?  I was a way for a bit at LinuxCon Brazil, 
do you have a respun and tested patch set (tested against building the 
SDK and meta-toolchian...)?

Thanks
	Sau!

> Regards,
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


