Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EF0746FF24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 21:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7ELskbJ003526; Thu, 14 Aug 2014 22:54:46 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id I9PuG80AgypT; Thu, 14 Aug 2014 22:54:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7ELshsk003523
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 14 Aug 2014 22:54:45 +0100
Message-ID: <1408053283.21596.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 14 Aug 2014 22:54:43 +0100
In-Reply-To: <09ec669715e7b132194e78ffc7756c9cd03c25cb.1406620925.git.liezhi.yang@windriver.com>
References: <cover.1406620925.git.liezhi.yang@windriver.com>
	<09ec669715e7b132194e78ffc7756c9cd03c25cb.1406620925.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 14 Aug 2014 21:54:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-07-29 at 01:02 -0700, Robert Yang wrote:
> Fixed do_configure error:
> 
> ERROR: User requested feature sdl
>        configure was not able to find it.
>        Install SDL devel
> 
> The error message from log.do_configure, and if we check config.log, the
> error is:
> 
> sysroots/x86_64-linux/usr/lib/libXext.so.6: undefined reference to `_XEatDataWords'
> 
> The _XEatDataWords is provided by libX11.so, the dependencies are:
> 
> qemu-native -> sdl(from the host) -> libXext.so(maybe host or native) -> libX11.so (maybe host or native)
> 
> For example on Ubuntu 12.04 x86_64, the link route is:
> 
> qemu-native's do_configure sdl checking:
> /usr/lib/x86_64-linux-gnu/libSDL.so --> <sysroots>/x86_64-linux/usr/lib/libXext.so.6 --> /usr/lib/x86_64-linux-gnu/libX11.so
> 
> So it is:
> host sdl -> sysroot libXext.so.6 -> host X11.so
> 
> qemu-native doesn't depend on libxext-native, so the error would happen
> if the libx11-native is being rebuilding and the host's libX11.so
> doesn't have _XEatDataWords.
> 
> Manually reproduce it on Ubuntu 12.04 x86_64:
> 
> $ bitbake qemu-native libx11-native libxext-native
> $ bitbake qemu-native libx11-native -ccleansstate && bitbake qemu-native
> 
> Note, only qemu-native has this problem since libxext depends on libX11,
> and SDL would depend on libxext when x11 is enabled.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 3cb8536..1287e09 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -98,10 +98,13 @@ PACKAGECONFIG[uuid] = "--enable-uuid,--disable-uuid,util-linux,"
>  PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
>  PACKAGECONFIG[gtk+] = "--enable-gtk,--disable-gtk,gtk+ libvte,"
>  PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
> -PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl,"
>  PACKAGECONFIG[ssh2] = "--enable-libssh2,--disable-libssh2,libssh2,"
>  PACKAGECONFIG[libusb] = "--enable-libusb,--disable-libusb,libusb1"
>  

Can't we just make this:

PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl libxext,"

?

As far as I can tell that should also avoid the problem? We'd obviously
need a comment to explain it?

Cheers,

Richard

> +NATIVEDEPS = ""
> +NATIVEDEPS_class-native = "libxext-native"
> +PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl ${NATIVEDEPS},"
> +
>  # Qemu target will not build in world build for ARM or Mips
>  BROKEN_qemuarm = "1"
>  BROKEN_qemumips64 = "1"
> -- 
> 1.7.9.5
> 



