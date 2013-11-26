Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6E2156D2A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 12:19:28 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAQCJEQi013589; Tue, 26 Nov 2013 12:19:14 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id R6QCxGcLAQNm; Tue, 26 Nov 2013 12:19:14 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAQCJ6WZ013577
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 26 Nov 2013 12:19:08 GMT
Message-ID: <1385468343.11246.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Tue, 26 Nov 2013 12:19:03 +0000
In-Reply-To: <6e13abdbda165f1e5d7c15b6db6ea11277cde521.1383374625.git.hongxu.jia@windriver.com>
References: <cover.1383374625.git.hongxu.jia@windriver.com>
	<6e13abdbda165f1e5d7c15b6db6ea11277cde521.1383374625.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] qemu: add PACKAGECONFIG for vnc, libcurl, nss, uuid, curses, gtk+, libcap-ng
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
X-List-Received-Date: Tue, 26 Nov 2013 12:19:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-11-02 at 14:52 +0800, Hongxu Jia wrote:
> Use PACKAGECONFIG to explicitly address vnc, libcurl, nss, uuid, curses, gtk+,
> libcap-ng dependencies rather than tested by configure.
> 
> It avoided potential errors while multiple builds shared a common state_cache.
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 1b861d7..be0495a 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -28,10 +28,9 @@ SRC_URI_append_class-native = "\
>      file://fix-libcap-header-issue-on-some-distro.patch \
>      "
>  
> -EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman --extra-cflags='${CFLAGS}'"
> +EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --audio-drv-list=oss,alsa --disable-bluez --with-system-pixman --extra-cflags='${CFLAGS}'"
>  
> -EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls \
> -				--disable-curl \
> +EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror \
>  				"
>  export LIBTOOL="${HOST_SYS}-libtool"
>  
> @@ -80,9 +79,23 @@ do_install_append() {
>  }
>  # END of qemu-mips workaround
>  
> +# Disable the following PACKAGECONFIG varflag by default. Such as graphics is
> +# disabled for qemu-native, if you need to enable some of them for qemu-native,
> +# set PACKAGECONFIG_pn-qemu-native += "varflag1 varflag2" in local.conf
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
>  PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
> +PACKAGECONFIG[vnc-tls] = "--enable-vnc --enable-vnc-tls,--disable-vnc-tls, gnutls,"
> +PACKAGECONFIG[vnc-ws] = "--enable-vnc --enable-vnc-ws,--disable-vnc-ws, gnutls,"
> +PACKAGECONFIG[vnc-sasl] = "--enable-vnc --enable-vnc-sasl,--disable-vnc-sasl,cyrus-sasl,"
> +PACKAGECONFIG[vnc-jpeg] = "--enable-vnc --enable-vnc-jpeg,--disable-vnc-jpeg,jpeg,"
> +PACKAGECONFIG[vnc-png] = "--enable-vnc --enable-vnc-png,--disable-vnc-png,libpng,"
> +PACKAGECONFIG[libcurl] = "--enable-curl,--disable-curl,libcurl,"
> +PACKAGECONFIG[nss] = "--enable-smartcard-nss,--disable-smartcard-nss,nss,"
> +PACKAGECONFIG[uuid] = "--enable-uuid,--disable-uuid,util-linux,"
> +PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
> +PACKAGECONFIG[gtk+] = "--enable-gtk,--disable-gtk,gtk+ libvte,"
> +PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
>  
>  # Qemu target will not build in world build for ARM or Mips
>  BROKEN_qemuarm = "1"

I merged this however I notice there are "yet more" floating
dependencies since sdl is floating (at least).

For sdl, can we add the PACKAGECONFIG option however also add an entry
to local.conf.sample which documents how to enable sdl for qemu-native?
I suspect that is the option most people are using to make runqemu
useful. We may also want to have the option of assuming libsdl-native is
provided since otherwise we end up in the tangled world of GL support
and we don't want to build our own libsdl-native in most cases.

Cheers,

Richard





