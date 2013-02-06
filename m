Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U3Z4I-00071X-U7
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Feb 2013 22:31:43 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Feb 2013 09:39:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,616,1355126400"; d="scan'208";a="281795822"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by orsmga002.jf.intel.com with ESMTP; 06 Feb 2013 09:41:12 -0800
Message-ID: <511295B8.40109@linux.intel.com>
Date: Wed, 06 Feb 2013 09:41:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Mihai Prica <mihai.prica@intel.com>
References: <1360152734-15731-1-git-send-email-mihai.prica@intel.com>
In-Reply-To: <1360152734-15731-1-git-send-email-mihai.prica@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu: Enabled SDL when compiling for target architecture
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
X-List-Received-Date: Thu, 07 Feb 2013 21:31:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/2013 04:12 AM, Mihai Prica wrote:
> - enables qemu to run images with video output without the need for vncviewer.
> - SDLPACKAGECONFIG is used because there is no need for the native-libsdl
> package when building the qemu-native package.
>
> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc |   19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 2b60347..4633f47 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -3,8 +3,7 @@ HOMEPAGE = "http://qemu.org"
>   LICENSE = "GPLv2 & LGPLv2.1"
>   DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 pixman"
>   DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native"
> -DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0 nativesdk-pixman"
> -RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
> +DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-glib-2.0 nativesdk-pixman"
>
>   require qemu-targets.inc
>   inherit autotools
> @@ -13,10 +12,6 @@ BBCLASSEXTEND = "native nativesdk"
>   # QEMU_TARGETS is overridable variable
>   QEMU_TARGETS ?= "arm i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
>
> -SDL ?= "--disable-sdl"
> -SDL_class-native ?= ""
> -SDL_class-nativesdk ?= ""
> -
>   SRC_URI = "\
>       file://powerpc_rom.bin \
>       file://no-strip.patch \
> @@ -32,7 +27,7 @@ SRC_URI_append_class-nativesdk = "\
>       file://relocatable_sdk.patch \
>       "
>
> -EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman"
> +EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman"
>
>   EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls \
>   				--disable-curl \
> @@ -83,7 +78,15 @@ do_install_append() {
>   }
>   # END of qemu-mips workaround
>
> -PACKAGECONFIG ??= ""
Seems to be left over from a previous patch?

> +PACKAGECONFIG ??= "sdl"
> +PACKAGECONFIG_class-native ??= "sdl"
Is this right?  If you only want it for target, why set it for native.

> +PACKAGECONFIG_class-nativesdk ??= "sdl"
> +
> +PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,${SDLPACKAGECONFIG},${SDLPACKAGECONFIG}"
> +
If it's disabled, you should not need the SDLPACKAGECONFIG in the 
"false" case for DEPENDS.

> +SDLPACKAGECONFIG = "libsdl"
> +SDLPACKAGECONFIG_class-native = ""
> +SDLPACKAGECONFIG_class-nativesdk = "nativesdk-libsdl"
>
It might be clearer to have these lines above the PACKAGECONFIG[sdl] 
where they are used.



>   # Qemu target will not build in world build for ARM or Mips
>   BROKEN_qemuarm = "1"
>


