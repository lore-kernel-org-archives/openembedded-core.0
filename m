Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TCW0O-0005mN-Ea for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 15:32:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8EDJldl011635;
	Fri, 14 Sep 2012 14:19:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10777-08; Fri, 14 Sep 2012 14:19:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8EDJbQV011629
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 14 Sep 2012 14:19:38 +0100
Message-ID: <1347628780.13596.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ml@communistcode.co.uk
Date: Fri, 14 Sep 2012 14:19:40 +0100
In-Reply-To: <50532AA5.9060203@communistcode.co.uk>
References: <50531E8A.8000307@communistcode.co.uk>
	<1347624973.13596.7.camel@ted> <505323D2.7060304@communistcode.co.uk>
	<505324E3.9090701@communistcode.co.uk>
	<50532AA5.9060203@communistcode.co.uk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Nothing provides libxcb-*
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2012 13:32:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-14 at 14:01 +0100, Jack Mitchell wrote:
> On 14/09/12 13:36, Jack Mitchell wrote:
> > On 14/09/12 13:32, Jack Mitchell wrote:
> >> On 14/09/12 13:16, Richard Purdie wrote:
> >>> On Fri, 2012-09-14 at 13:09 +0100, Jack Mitchell wrote:
> >>>> I am trying to use the package libxcb-xfixes in a recipe however 
> >>>> when I
> >>>> add 'libxcb-xfixes' to DEPENDS I get the error that nothing provides
> >>>> libxcb-xfixes however the libxcb package clearly has it in the 
> >>>> PACKAGES
> >>>> variable
> >>>>
> >>>> recipes-graphics/xcb/libxcb.inc:PACKAGES =+ "libxcb-composite
> >>>> libxcb-damage libxcb-dpms libxcb-glx \
> >>>> recipes-graphics/xcb/libxcb.inc: libxcb-randr libxcb-record
> >>>> libxcb-render libxcb-res \
> >>>> recipes-graphics/xcb/libxcb.inc: libxcb-screensaver libxcb-shape
> >>>> libxcb-shm libxcb-sync \
> >>>> recipes-graphics/xcb/libxcb.inc: libxcb-xevie libxcb-xf86dri
> >>>> libxcb-xfixes libxcb-xlib \
> >>>> recipes-graphics/xcb/libxcb.inc: libxcb-xprint libxcb-xtest libxcb-xv
> >>>> libxcb-xvmc \
> >>>> recipes-graphics/xcb/libxcb.inc: libxcb-dri2"
> >>>>
> >>>> I have also tried using others in this package list to no avail, can
> >>>> anybody comment on how I should be using these packages?
> >>> You're mixing up the build time and runtime namespaces. You would add
> >>> DEPENDS = "libxcb" or RDEPENDS_${PN}-xxx = "libxcb-xfixes".
> >>>
> >>> DEPENDS is build time and you use PN
> >>>
> >>> RDEPENDS/RRECOMMENDS/R* is runtime and values from PACKAGES
> >>>
> >>> Cheers,
> >>>
> >>> Richard
> >>>
> >>
> >> Ok, thanks! I guess I have a bigger problem then, the error I am 
> >> recieving is:
> >>
> >> | DEBUG: Executing shell function autotools_preconfigure
> >> | DEBUG: Shell function autotools_preconfigure finished
> >> | DEBUG: Executing shell function do_configure
> >> | ERROR: Xfixes not found
> >> |
> >> | If you think configure made a mistake, make sure you are using the 
> >> latest
> >> | version from Git.  If the latest version fails, report the problem 
> >> to the
> >> | libav-user@libav.org mailing list or IRC #libav on irc.freenode.net.
> >> | Include the log file "config.log" produced by configure as this 
> >> will help
> >> | solving the problem.
> >>
> >>
> >> Now, I have libxcb in DEPENDS and I have the following configure 
> >> options:
> >>
> >> EXTRA_OECONF = " \
> >>         --cross-prefix=${TARGET_PREFIX} \
> >>         --enable-cross-compile \
> >>         --sysroot="${STAGING_DIR_TARGET}" \
> >> --sysinclude="${STAGING_DIR_TARGET}${includedir}" \
> >>         --target-os="linux" \
> >>         --extra-cflags="${TARGET_CFLAGS} 
> >> ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
> >>         --extra-ldflags="${TARGET_LDFLAGS}" \
> >>         --arch=${TARGET_ARCH} \
> >>         --enable-hardcoded-tables \
> >>         --enable-shared \
> >>         --enable-pthreads \
> >>         --enable-gpl \
> >>         --enable-avfilter \
> >>         --prefix=${prefix} \
> >>         --enable-x11grab \
> >>         --enable-libtheora  \
> >>         --enable-libvorbis \
> >>         ${EXTRA_FFCONF} \
> >> "
> >>
> >> Is there anything glaringly wrong?I am worried about these two:
> >>
> >>         --sysroot="${STAGING_DIR_TARGET}" \
> >> --sysinclude="${STAGING_DIR_TARGET}${includedir}" \
> >>
> >> Cheers,
> >>
> >
> > Possibly of use?
> >
> > check_lib X11/extensions/Xfixes.h XFixesGetCursorImage -lXfixes
> > check_header X11/extensions/Xfixes.h
> > check_cpp
> > BEGIN /tmp/ffconf.RboCj6pF.c
> >     1 #include <X11/extensions/Xfixes.h>
> >     2 int x;
> > END /tmp/ffconf.RboCj6pF.c
> > arm-poky-linux-gnueabi-gcc 
> > --sysroot=/home/jack/Projects/poky-rasp/raspberry/tmp/sysroots/raspberrypi 
> > -D_ISOC99_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE 
> > -D_POSIX_C_SOURCE=200112 -D_XOPEN_SOURCE=600 -O2 -pipe -g 
> > -feliminate-unused-debug-types -O2 -pipe -g 
> > -feliminate-unused-debug-types -march=armv6 -mthumb-interwork 
> > -mfloat-abi=softfp -mtune=arm1176jzf-s 
> > --sysroot=/home/jack/Projects/poky-rasp/raspberry/tmp/sysroots/raspberrypi 
> > -std=c99 -fomit-frame-pointer -marm -pthread -E -o 
> > /tmp/ffconf.IQTkUVuf.o /tmp/ffconf.RboCj6pF.c
> > /tmp/ffconf.RboCj6pF.c:1:35: fatal error: X11/extensions/Xfixes.h: No 
> > such file or directory
> > compilation terminated.
> > ERROR: Xfixes not found
> >
> >
> 
> I can confirm that there is indeed no X11/extensions/Xfixes.h:
> 
> [jack@archHP raspberrypi]$ find . -name X11
> ./usr/include/X11
> ./usr/lib/X11
> ./usr/share/X11
> [jack@archHP raspberrypi]$ find . -name Xfixes.h
> [jack@archHP raspberrypi]$
> 
> Even though I have:
> 
> RDEPENDS_${PN} = "libxcb-xfixes"
> 
> What do I have to do to get it in the sysroot so it can compile against it?

You didn't say you were doing that ;-).

You need -dev packages, try libxcb-dev?

Cheers,

Richard



