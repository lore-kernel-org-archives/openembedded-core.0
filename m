Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CEE63601A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 02:14:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7F2EBAO020436
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Aug 2014 19:14:11 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 14 Aug 2014 19:14:11 -0700
Message-ID: <53ED6CF1.3070600@windriver.com>
Date: Fri, 15 Aug 2014 10:14:09 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1406620925.git.liezhi.yang@windriver.com>	
	<09ec669715e7b132194e78ffc7756c9cd03c25cb.1406620925.git.liezhi.yang@windriver.com>
	<1408053283.21596.4.camel@ted>
In-Reply-To: <1408053283.21596.4.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] qemu-native: depends on libxext-native when enable sdl
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
X-List-Received-Date: Fri, 15 Aug 2014 02:14:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/15/2014 05:54 AM, Richard Purdie wrote:
> On Tue, 2014-07-29 at 01:02 -0700, Robert Yang wrote:
>> Fixed do_configure error:
>>
>> ERROR: User requested feature sdl
>>         configure was not able to find it.
>>         Install SDL devel
>>
>> The error message from log.do_configure, and if we check config.log, the
>> error is:
>>
>> sysroots/x86_64-linux/usr/lib/libXext.so.6: undefined reference to `_XEatDataWords'
>>
>> The _XEatDataWords is provided by libX11.so, the dependencies are:
>>
>> qemu-native -> sdl(from the host) -> libXext.so(maybe host or native) -> libX11.so (maybe host or native)
>>
>> For example on Ubuntu 12.04 x86_64, the link route is:
>>
>> qemu-native's do_configure sdl checking:
>> /usr/lib/x86_64-linux-gnu/libSDL.so --> <sysroots>/x86_64-linux/usr/lib/libXext.so.6 --> /usr/lib/x86_64-linux-gnu/libX11.so
>>
>> So it is:
>> host sdl -> sysroot libXext.so.6 -> host X11.so
>>
>> qemu-native doesn't depend on libxext-native, so the error would happen
>> if the libx11-native is being rebuilding and the host's libX11.so
>> doesn't have _XEatDataWords.
>>
>> Manually reproduce it on Ubuntu 12.04 x86_64:
>>
>> $ bitbake qemu-native libx11-native libxext-native
>> $ bitbake qemu-native libx11-native -ccleansstate && bitbake qemu-native
>>
>> Note, only qemu-native has this problem since libxext depends on libX11,
>> and SDL would depend on libxext when x11 is enabled.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-devtools/qemu/qemu.inc |    5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
>> index 3cb8536..1287e09 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -98,10 +98,13 @@ PACKAGECONFIG[uuid] = "--enable-uuid,--disable-uuid,util-linux,"
>>   PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
>>   PACKAGECONFIG[gtk+] = "--enable-gtk,--disable-gtk,gtk+ libvte,"
>>   PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
>> -PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl,"
>>   PACKAGECONFIG[ssh2] = "--enable-libssh2,--disable-libssh2,libssh2,"
>>   PACKAGECONFIG[libusb] = "--enable-libusb,--disable-libusb,libusb1"
>>
>
> Can't we just make this:
>
> PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl libxext,"

I'm afraid not, target sdl depends on libx11 (libxext) optionally, if we use
this, the libxext will always be built when sdl is enabled, but it doesn't
have to.

For native, libsdl-native is in ASSUME_PROVIDED, the link chain is:

host sdl -> host libXext.so.6 -> host X11.so

this is right since all of libs are on the host,  or if libxext-native
has been built, then:

host sdl -> sysroot libXext.so.6 -> sysroot X11.so

This is right, too, but qemu-native doesn't depend on libxext-native,
so libx11-native can be missed (for example, when rebuilding) when
we rebuild qemu-native, then we may meet errors, the link chain is:

host sdl -> sysroot libXext.so.6 -> host X11.so

For example:
$ bitbake qemu-native libx11-native libxext-native
# Everything is ready in the sysroot (the order doesn't matter)

$ bitbake qemu-native libx11-native -ccleansstate
# The libx11-native is removed from sysroot

$ bitbake qemu-native
# Build qemu-native again, only qemu-native will be built since it
# doesn't depend on libx11-native, then we may see the errors as the
# link chain shows.

I've updated a comment in the patch, and also updated in the git repo,
please feel free to let me know if there is anything questions:

git://git.openembedded.org/openembedded-core-contrib rbt/qemu

+# The libxext is optional for target sdl, so only add libxext-native in
+# qemu-native's DEPENDS when sdl is enabled to fix potential build
+# failures.
+NATIVEDEPS = ""
+NATIVEDEPS_class-native = "libxext-native"
+PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl ${NATIVEDEPS},"
+

// Robert

>
> ?
>
> As far as I can tell that should also avoid the problem? We'd obviously
> need a comment to explain it?
>
> Cheers,
>
> Richard
>
>> +NATIVEDEPS = ""
>> +NATIVEDEPS_class-native = "libxext-native"
>> +PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl ${NATIVEDEPS},"
>> +
>>   # Qemu target will not build in world build for ARM or Mips
>>   BROKEN_qemuarm = "1"
>>   BROKEN_qemumips64 = "1"
>> --
>> 1.7.9.5
>>
>
>
>
>

