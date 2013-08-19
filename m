Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 325D661EE1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 02:06:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7J26miB015612
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 18 Aug 2013 19:06:48 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Sun, 18 Aug 2013 19:06:46 -0700
Message-ID: <52117DB6.8010505@windriver.com>
Date: Mon, 19 Aug 2013 10:06:46 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
References: <cover.1376647416.git.kai.kang@windriver.com>
	<b861e570e04aa288f05c344b161815b0dec8e788.1376647416.git.kai.kang@windriver.com>
	<1376650065.22952.118.camel@ted>
	<81551E10643BEC4899D6BA2541201B62018E4EF9@IRSMSX105.ger.corp.intel.com>
In-Reply-To: <81551E10643BEC4899D6BA2541201B62018E4EF9@IRSMSX105.ger.corp.intel.com>
X-Originating-IP: [128.224.162.231]
Cc: "Zhangle.Yang@windriver.com" <Zhangle.Yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qemu: update dependency of native package
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
X-List-Received-Date: Mon, 19 Aug 2013 02:06:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2013年08月16日 23:55, Stanacar, StefanX wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On
>> Behalf Of Richard Purdie
>> Sent: Friday, August 16, 2013 1:48 PM
>> To: Kai Kang
>> Cc: openembedded-core@lists.openembedded.org;
>> Zhangle.Yang@windriver.com
>> Subject: Re: [OE-core] [PATCH 1/1] qemu: update dependency of native
>> package
>>
>> On Fri, 2013-08-16 at 18:05 +0800, Kai Kang wrote:
>>> [YOCTO #4973]
>>>
>>> It fails to start qemu with core-image-sato on Fedora 19. The error
>>> message shows:
>>>
>>> Could not initialize SDL(No available video device) - exiting
>>>
>>> Add dependecy libxext-native to qemu-native to fix this error.
>>>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>>   meta/recipes-devtools/qemu/qemu.inc | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-
>> devtools/qemu/qemu.inc
>>> index 97e9b7b..a96e00c 100644
>>> --- a/meta/recipes-devtools/qemu/qemu.inc
>>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>>> @@ -2,7 +2,7 @@ DESCRIPTION = "open source processor emulator"
>>>   HOMEPAGE = "http://qemu.org"
>>>   LICENSE = "GPLv2 & LGPLv2.1"
>>>   DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 pixman dtc libsdl"
>>> -DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native
>> pixman-native dtc-native"
>>> +DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native
>> pixman-native dtc-native libxext-native"
>>>   DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-
>> glib-2.0 nativesdk-pixman nativesdk-dtc"
>>>   RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
>> This is one of the ugly dependencies we've tried to ignore.
>>
>> We basically assume if your build machine has graphics, you have the
>> devel headers/libs there and qemu will autodetect and include graphics
>> support. Equally, if your build machine doesn't, it just won't build
>> graphics support. In general most people seem happy with this even if
>> its imperfect.
>>
> But, but... I do have libxext and libxext-devel installed... (and minimal works just fine as the bug says)
> libXext-1.3.2-1.fc19.x86_64
> libXext-devel-1.3.2-1.fc19.x86_64
>
> Also strace shows:
> open("/lib64/libXext.so.6", O_RDONLY|O_CLOEXEC) = 11
> read(11, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`7`U1\0\0\0"..., 832) = 832
> fstat(11, {st_mode=S_IFREG|0755, st_size=77376, ...}) = 0
> mmap(NULL, 2169112, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 11, 0) = 0x7f0a493ee000
> mprotect(0x7f0a493ff000, 2093056, PROT_NONE) = 0
> mmap(0x7f0a495fe000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 11, 0x10000) = 0x7f0a495fe000
> close(11)                               = 0
It is a little weird, and it seems we need more work. :)

Regards,
Kai

>
> The F18 system which doesn't have a problem with sato has:
>
> libXext-1.3.1-3.20130524gitdfe6e1f3b.fc18.x86_64
> libXext-devel-1.3.1-3.20130524gitdfe6e1f3b.fc18.x86_64
>
>
> Cheers,
> Stefan
>
>> Adding libxext-native upsets this balance a little...
>>
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Regards,
Neil | Kai Kang


