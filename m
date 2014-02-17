Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7503C6E6F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 18:38:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2014 10:38:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,862,1384329600"; d="scan'208";a="484819397"
Received: from unknown (HELO [10.255.13.243]) ([10.255.13.243])
	by orsmga002.jf.intel.com with ESMTP; 17 Feb 2014 10:38:53 -0800
Message-ID: <5302573B.6060707@linux.intel.com>
Date: Mon, 17 Feb 2014 10:38:51 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Valentin Popa <valentin.popa@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1392226062-3797-1-git-send-email-valentin.popa@intel.com>
In-Reply-To: <1392226062-3797-1-git-send-email-valentin.popa@intel.com>
Subject: Re: [PATCH_V2] mesa: upgrade to 9.2.5
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
X-List-Received-Date: Mon, 17 Feb 2014 18:38:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/12/2014 09:27 AM, Valentin Popa wrote:
> tested on qemux86, genericx86 for core-image-sato
> and core-image-weston.
>
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> ---
>   .../mesa/{mesa-gl_9.2.2.bb => mesa-gl_9.2.5.bb}                |  0
>   meta/recipes-graphics/mesa/{mesa_9.2.2.bb => mesa_9.2.5.bb}    | 10 ++++++++--
>   meta/recipes-graphics/mesa/mesa_git.bb                         | 10 ++++++++--
>   3 files changed, 16 insertions(+), 4 deletions(-)
>   rename meta/recipes-graphics/mesa/{mesa-gl_9.2.2.bb => mesa-gl_9.2.5.bb} (100%)
>   rename meta/recipes-graphics/mesa/{mesa_9.2.2.bb => mesa_9.2.5.bb} (38%)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_9.2.2.bb b/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_9.2.2.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb
> diff --git a/meta/recipes-graphics/mesa/mesa_9.2.2.bb b/meta/recipes-graphics/mesa/mesa_9.2.5.bb
> similarity index 38%
> rename from meta/recipes-graphics/mesa/mesa_9.2.2.bb
> rename to meta/recipes-graphics/mesa/mesa_9.2.5.bb
> index 60eba01..f37586b 100644
> --- a/meta/recipes-graphics/mesa/mesa_9.2.2.bb
> +++ b/meta/recipes-graphics/mesa/mesa_9.2.5.bb
> @@ -5,7 +5,13 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
>              file://0006-fix-out-of-tree-egl.patch \
>              "
>
> -SRC_URI[md5sum] = "20887f8020db7d1736a01ae9cd5d8c38"
> -SRC_URI[sha256sum] = "c78a5035233672844cf2492fe82dc10877e12026be227d04469d6ca6ac656a3d"
> +SRC_URI[md5sum] = "9fb4de29ca1d9cfd03cbdefa123ba336"
> +SRC_URI[sha256sum] = "b46ab9efed176df0591993397594d712ada9da6a47fd31bbe75050fe28eb6bf0"
>
>   S = "${WORKDIR}/Mesa-${PV}"
> +
> +#because we cannot rely on the fact that all apps will use pkgconfig,
> +#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> +do_install_append() {
> +    sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> +}
> diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
> index 19d3e70..320b8d5 100644
> --- a/meta/recipes-graphics/mesa/mesa_git.bb
> +++ b/meta/recipes-graphics/mesa/mesa_git.bb
> @@ -5,8 +5,8 @@ DEFAULT_PREFERENCE = "-1"
>   LIC_FILES_CHKSUM = "file://docs/license.html;md5=f69a4626e9efc40fa0d3cc3b02c9eacf"
>
>   PR = "${INC_PR}.0"
> -SRCREV = "8f0742051e8501e737affb392996aef172034ca8"
> -PV = "9.2.2+git${SRCPV}"
> +SRCREV = "4636e87191fddd492ed8c61ba61faf4b2d89b2e4"
> +PV = "9.2.5+git${SRCPV}"
>
>   SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa \
>              file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
> @@ -14,3 +14,9 @@ SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa \
>              "
>
>   S = "${WORKDIR}/git"
> +
> +#because we cannot rely on the fact that all apps will use pkgconfig,
> +#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> +do_install_append() {
> +    sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> +}
>

Possible issue with this on one of Minnow BSP build:
> | make[2]: Nothing to be done for `install-exec-am'.
> | make[2]: Nothing to be done for `install-data-am'.
> | make[2]: Leaving directory `/home/pokybuild/yocto-autobuilder-dev/yocto-slave/minnow/build/build/tmp/work/core2-32-emgd-poky-linux/mesa-gl/2_9.2.5-r0/build'
> | make[1]: Leaving directory `/home/pokybuild/yocto-autobuilder-dev/yocto-slave/minnow/build/build/tmp/work/core2-32-emgd-poky-linux/mesa-gl/2_9.2.5-r0/build'
> | sed: can't read /home/pokybuild/yocto-autobuilder-dev/yocto-slave/minnow/build/build/tmp/work/core2-32-emgd-poky-linux/mesa-gl/2_9.2.5-r0/image/usr/include/EGL/eglplatform.h: No such file or directory
> | WARNING: /home/pokybuild/yocto-autobuilder-dev/yocto-slave/minnow/build/build/tmp/work/core2-32-emgd-poky-linux/mesa-gl/2_9.2.5-r0/temp/run.do_install.4673:1 exit 2 from
> |   sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if 0/' /home/pokybuild/yocto-autobuilder-dev/yocto-slave/minnow/build/build/tmp/work/core2-32-emgd-poky-linux/mesa-gl/2_9.2.5-r0/image/usr/include/EGL/eglplatform.h
> | ERROR: Function failed: do_install (log file is located at /home/pokybuild/yocto-autobuilder-dev/yocto-slave/minnow/build/build/tmp/work/core2-32-emgd-poky-linux/mesa-gl/2_9.2.5-r0/temp/log.do_install.4673)
> NOTE: recipe mesa-gl-2_9.2.5-r0: task do_install: Failed


Can you please look into this and comment.

Thanks
    Sau!



