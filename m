Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QsyBY-0001nw-Vc for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 16:30:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FEQ0k9017662
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 15:26:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17567-01 for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 15:25:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FEPqpH017656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 15:25:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <edd51def7cc31eaa3d67f7cc73bf5fded2351f5f.1313411859.git.edwin.zhai@intel.com>
References: <cover.1313411858.git.edwin.zhai@intel.com>
	<edd51def7cc31eaa3d67f7cc73bf5fded2351f5f.1313411859.git.edwin.zhai@intel.com>
Date: Mon, 15 Aug 2011 15:25:49 +0100
Message-ID: <1313418349.14274.587.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] qemu: Make qemu buildable inside qemux86/qemuppc target
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
X-List-Received-Date: Mon, 15 Aug 2011 14:30:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-15 at 20:40 +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> It requires libx11 and libGL(if enabled GL) for building, which introduce extra
> dependence in qemuppc target. Futhermore, qemu's GL code is x86-oriented, thus
> some hacks needed for building in qemupcc. For simplicity, just make qemu GL's
> code for native only, so that qemu building is okay in world build.
> 
> [YOCTO #1011] got fixed.
> 
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc       |    5 ++---
>  meta/recipes-devtools/qemu/qemu_0.14.0.bb |   27 ++++++++++++++++++++++-----
>  2 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 85476d6..e5414ff 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "open source processor emulator"
>  HOMEPAGE = "http://qemu.org"
>  LICENSE = "GPLv2 & LGPLv2.1"
> -DEPENDS = "zlib alsa-lib qemugl"
> +DEPENDS = "zlib alsa-lib virtual/libx11"
>  
>  # QEMU_TARGETS is overridable variable
>  QEMU_TARGETS ?= "arm i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
> @@ -40,7 +40,7 @@ do_configure_prepend_virtclass-native() {
>  
>  do_configure() {
>      ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir} --disable-strip ${EXTRA_OECONF}
> -    chmod a+x ${S}/target-i386/beginend_funcs.sh
> +    test ! -e ${S}/target-i386/beginend_funcs.sh || chmod a+x ${S}/target-i386/beginend_funcs.sh
>  }
>  
>  do_install () {
> @@ -50,7 +50,6 @@ do_install () {
>  	install -m 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
>  }
>  
> -SRC_URI_append_virtclass-nativesdk = " file://glflags.patch"
>  DEPENDS_virtclass-native = "zlib-native alsa-lib-native"
>  DEPENDS_virtclass-nativesdk = "zlib-nativesdk libsdl-nativesdk qemugl-nativesdk"
>  RDEPENDS_virtclass-nativesdk = "libsdl-nativesdk"
> diff --git a/meta/recipes-devtools/qemu/qemu_0.14.0.bb b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
> index de12f62..dc9b695 100644
> --- a/meta/recipes-devtools/qemu/qemu_0.14.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
> @@ -11,22 +11,39 @@ FILESDIR = "${WORKDIR}"
>  SRC_URI = "\
>      http://download.savannah.gnu.org/releases/qemu/qemu-${PV}.tar.gz \
>      file://powerpc_rom.bin \
> -    file://qemu-git-qemugl-host.patch \
>      file://no-strip.patch \
> -    file://fix-nogl.patch \
> -    file://qemugl-allow-glxcontext-release.patch \
>      file://linker-flags.patch \
> -    file://init-info.patch \
>      file://qemu-vmware-vga-depth.patch \
> -    file://enable-i386-linux-user.patch \
>      file://fix-configure-checks.patch \
>      file://fallback-to-safe-mmap_min_addr.patch \
>      file://spice-qxl-locking-fix-for-qemu-kvm.patch \
>      file://Detect-and-use-GCC-atomic-builtins-for-locking.patch \
>      file://larger_default_ram_size.patch \
> +    "
> +
> +SRC_URI_append_virtclass-native = "\
> +    file://qemu-git-qemugl-host.patch \
> +    file://fix-nogl.patch \
> +    file://qemugl-allow-glxcontext-release.patch \
> +    file://init-info.patch \
> +    file://enable-i386-linux-user.patch \
>      file://qemugl-fix.patch \
>      file://opengl-sdl-fix.patch \
>      "
> +
> +SRC_URI_append_virtclass-nativesdk = "\
> +    file://qemu-git-qemugl-host.patch \
> +    file://fix-nogl.patch \
> +    file://qemugl-allow-glxcontext-release.patch \
> +    file://init-info.patch \
> +    file://enable-i386-linux-user.patch \
> +    file://qemugl-fix.patch \
> +    file://opengl-sdl-fix.patch \
> +    file://glflags.patch \
> +    "
> +
> +#SRC_URI_append_virtclass-nativesdk = " file://glflags.patch"
> +
>  SRC_URI[md5sum] = "f9d145d5c09de9f0984ffe9bd1229970"
>  SRC_URI[sha256sum] = "ba21e84d7853217830e167dae9999cdbff481189c6a0bb600ac7fb7201453108"

The patch is fine but could we change this to something like:

# Only use the GL passthrough patches for native/nativesdk versions
$QEMUGLPATCHES = "\
    file://qemu-git-qemugl-host.patch \
    file://fix-nogl.patch \
    file://qemugl-allow-glxcontext-release.patch \
    file://init-info.patch \
    file://enable-i386-linux-user.patch \
    file://qemugl-fix.patch \
    file://opengl-sdl-fix.patch \
    "

SRC_URI_append_virtclass-native = "\
    ${QEMUGLPATCHES} \
    "

SRC_URI_append_virtclass-nativesdk = "\
    ${QEMUGLPATCHES} \
    file://glflags.patch \
    "

which is just a little bit neater. Also, no need for the commented out
line.

Cheers,

Richard

 




