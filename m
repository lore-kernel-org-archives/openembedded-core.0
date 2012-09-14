Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TCVJQ-0004kJ-O1
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 14:48:00 +0200
Received: from localhost ([127.0.0.1]:34382 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TCV7F-0007K7-UT
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 12:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=fbMenCNEj5/NWNunYOkGqsl4sww=; b=pIsBOAHrxV9jrfyiVGokHcy0T3sz
	C31X+wzIVoGR/5QINYpGb+yKzvFtS7U2gD9ZjEafGrg1s9WufN9PXk5dJydcbccQ
	2+n/rU0xYfhm+j2w0h6d0Yub5sbrbEf97MhA/6/OvqzX5AhN/cY68WlG0zm4ziGv
	jzrmekKKFWQaTas=
Received: from [195.171.99.130] (port=40690 helo=[192.168.0.40])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TCV7F-0007K4-SB
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 12:35:25 +0000
Message-ID: <505324E3.9090701@communistcode.co.uk>
Date: Fri, 14 Sep 2012 13:36:51 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120910 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <50531E8A.8000307@communistcode.co.uk>
	<1347624973.13596.7.camel@ted>
	<505323D2.7060304@communistcode.co.uk>
In-Reply-To: <505323D2.7060304@communistcode.co.uk>
Subject: Re: Nothing provides libxcb-*
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2012 12:48:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/12 13:32, Jack Mitchell wrote:
> On 14/09/12 13:16, Richard Purdie wrote:
>> On Fri, 2012-09-14 at 13:09 +0100, Jack Mitchell wrote:
>>> I am trying to use the package libxcb-xfixes in a recipe however when I
>>> add 'libxcb-xfixes' to DEPENDS I get the error that nothing provides
>>> libxcb-xfixes however the libxcb package clearly has it in the PACKAGES
>>> variable
>>>
>>> recipes-graphics/xcb/libxcb.inc:PACKAGES =+ "libxcb-composite
>>> libxcb-damage libxcb-dpms libxcb-glx \
>>> recipes-graphics/xcb/libxcb.inc: libxcb-randr libxcb-record
>>> libxcb-render libxcb-res \
>>> recipes-graphics/xcb/libxcb.inc: libxcb-screensaver libxcb-shape
>>> libxcb-shm libxcb-sync \
>>> recipes-graphics/xcb/libxcb.inc: libxcb-xevie libxcb-xf86dri
>>> libxcb-xfixes libxcb-xlib \
>>> recipes-graphics/xcb/libxcb.inc: libxcb-xprint libxcb-xtest libxcb-xv
>>> libxcb-xvmc \
>>> recipes-graphics/xcb/libxcb.inc: libxcb-dri2"
>>>
>>> I have also tried using others in this package list to no avail, can
>>> anybody comment on how I should be using these packages?
>> You're mixing up the build time and runtime namespaces. You would add
>> DEPENDS = "libxcb" or RDEPENDS_${PN}-xxx = "libxcb-xfixes".
>>
>> DEPENDS is build time and you use PN
>>
>> RDEPENDS/RRECOMMENDS/R* is runtime and values from PACKAGES
>>
>> Cheers,
>>
>> Richard
>>
>
> Ok, thanks! I guess I have a bigger problem then, the error I am 
> recieving is:
>
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing shell function do_configure
> | ERROR: Xfixes not found
> |
> | If you think configure made a mistake, make sure you are using the 
> latest
> | version from Git.  If the latest version fails, report the problem 
> to the
> | libav-user@libav.org mailing list or IRC #libav on irc.freenode.net.
> | Include the log file "config.log" produced by configure as this will 
> help
> | solving the problem.
>
>
> Now, I have libxcb in DEPENDS and I have the following configure options:
>
> EXTRA_OECONF = " \
>         --cross-prefix=${TARGET_PREFIX} \
>         --enable-cross-compile \
>         --sysroot="${STAGING_DIR_TARGET}" \
>         --sysinclude="${STAGING_DIR_TARGET}${includedir}" \
>         --target-os="linux" \
>         --extra-cflags="${TARGET_CFLAGS} 
> ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
>         --extra-ldflags="${TARGET_LDFLAGS}" \
>         --arch=${TARGET_ARCH} \
>         --enable-hardcoded-tables \
>         --enable-shared \
>         --enable-pthreads \
>         --enable-gpl \
>         --enable-avfilter \
>         --prefix=${prefix} \
>         --enable-x11grab \
>         --enable-libtheora  \
>         --enable-libvorbis \
>         ${EXTRA_FFCONF} \
> "
>
> Is there anything glaringly wrong?I am worried about these two:
>
>         --sysroot="${STAGING_DIR_TARGET}" \
>         --sysinclude="${STAGING_DIR_TARGET}${includedir}" \
>
> Cheers,
>

Possibly of use?

check_lib X11/extensions/Xfixes.h XFixesGetCursorImage -lXfixes
check_header X11/extensions/Xfixes.h
check_cpp
BEGIN /tmp/ffconf.RboCj6pF.c
     1 #include <X11/extensions/Xfixes.h>
     2 int x;
END /tmp/ffconf.RboCj6pF.c
arm-poky-linux-gnueabi-gcc 
--sysroot=/home/jack/Projects/poky-rasp/raspberry/tmp/sysroots/raspberrypi 
-D_ISOC99_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE 
-D_POSIX_C_SOURCE=200112 -D_XOPEN_SOURCE=600 -O2 -pipe -g 
-feliminate-unused-debug-types -O2 -pipe -g 
-feliminate-unused-debug-types -march=armv6 -mthumb-interwork 
-mfloat-abi=softfp -mtune=arm1176jzf-s 
--sysroot=/home/jack/Projects/poky-rasp/raspberry/tmp/sysroots/raspberrypi 
-std=c99 -fomit-frame-pointer -marm -pthread -E -o 
/tmp/ffconf.IQTkUVuf.o /tmp/ffconf.RboCj6pF.c
/tmp/ffconf.RboCj6pF.c:1:35: fatal error: X11/extensions/Xfixes.h: No 
such file or directory
compilation terminated.
ERROR: Xfixes not found


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



