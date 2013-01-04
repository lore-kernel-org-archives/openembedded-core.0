Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TrBeJ-0006vt-8J
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 19:05:58 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Jan 2013 09:50:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,411,1355126400"; d="scan'208";a="240013255"
Received: from unknown (HELO [10.255.14.97]) ([10.255.14.97])
	by azsmga001.ch.intel.com with ESMTP; 04 Jan 2013 09:50:20 -0800
Message-ID: <50E71625.3060909@linux.intel.com>
Date: Fri, 04 Jan 2013 09:49:25 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
References: <bf4c63b763ceb045df5b4b27136ab6cf3f8f5ca5.1356342794.git.alexandru.damian@intel.com>
	<b81c825c2737a2042ed7a99796752d12b1576725.1356342794.git.alexandru.damian@intel.com>
In-Reply-To: <b81c825c2737a2042ed7a99796752d12b1576725.1356342794.git.alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] Initial commit for wayland/weston 1.0.3
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
X-List-Received-Date: Fri, 04 Jan 2013 18:05:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/24/2012 01:57 AM, Alex DAMIAN wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> This patch adds the Weston reference compositing
> manager from Wayland.
>
> We add version 1.0.3 which is the latest stable release
> in Dec 2012. See the upstream at:
>
> http://wayland.freedesktop.org/releases.html
>
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>   meta/recipes-graphics/wayland/weston.inc      |   23 +++++++++++++++++++++++
>   meta/recipes-graphics/wayland/weston_1.0.3.bb |    9 +++++++++
>   2 files changed, 32 insertions(+)
>   create mode 100644 meta/recipes-graphics/wayland/weston.inc
>   create mode 100644 meta/recipes-graphics/wayland/weston_1.0.3.bb
>
> diff --git a/meta/recipes-graphics/wayland/weston.inc b/meta/recipes-graphics/wayland/weston.inc
> new file mode 100644
> index 0000000..7d26f7f
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston.inc
> @@ -0,0 +1,23 @@
> +inherit autotools pkgconfig
> +
> +SUMMARY = "Weston, a Wayland compositor"
> +DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
> +HOMEPAGE = "http://wayland.freedesktop.org"
> +SECTION = "wayland/base"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466"
> +
> +DEPENDS = "wayland libxkbcommon gdk-pixbuf pixman cairo glib-2.0 mtdev jpeg"
> +DEPENDS += "virtual/egl"
> +

The Weston Build fails with the WORLD build target, not sure if we need 
to disable weston for world or if there is some other issue that needs 
to be addressed.
> | configure:16321: $PKG_CONFIG --exists --print-errors "wayland-client wayland-egl"
> | Package wayland-egl was not found in the pkg-config search path.
> | Perhaps you should add the directory containing `wayland-egl.pc'
> | to the PKG_CONFIG_PATH environment variable
> | No package 'wayland-egl' found
> | configure:16324: $? = 1
> | configure:16337: result: no
> | No package 'wayland-egl' found
> | configure:16353: error: Package requirements (wayland-client wayland-egl) were not met:
> |
> | No package 'wayland-egl' found
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> |
> | Alternatively, you may set the environment variables WAYLAND_COMPOSITOR_CFLAGS
> | and WAYLAND_COMPOSITOR_LIBS to avoid the need to call pkg-config.
> | See the pkg-config man page for more details.
> |

Notice that it's the wayland-egl is not being found.

Sau!


> +EXTRA_OECONF  = "--enable-wayland-compositor --disable-android-compositor"
> +EXTRA_OECONF += "--enable-setuid-install --enable-simple-clients"
> +EXTRA_OECONF += "--enable-clients --disable-xwayland"
> +
> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms', '', d)} \
> +                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> +                   ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)} \
> +                  "
> +PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm libgbm libglapi udev wayland-egl libpam"
> +PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
> +PACKAGECONFIG[gles] = "--with-cairo-glesv2,,virtual/libgles2"
> diff --git a/meta/recipes-graphics/wayland/weston_1.0.3.bb b/meta/recipes-graphics/wayland/weston_1.0.3.bb
> new file mode 100644
> index 0000000..625965b
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston_1.0.3.bb
> @@ -0,0 +1,9 @@
> +require weston.inc
> +
> +SRC_URI = "http://wayland.freedesktop.org/releases/weston-1.0.3.tar.xz \
> +	  "
> +SRC_URI[md5sum] = "f82ac2e013e6b6a6303ac4ba7b64c7f2"
> +SRC_URI[sha256sum] = "3136a7d2f654ea3e946d4217f7e25321248ad2921f1f4e2504dda58968e04853"
> +
> +PR = "r0"
> +
>


