Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 35FBF6C99C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 16:51:40 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Sep 2013 09:51:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,971,1371106800"; d="scan'208";a="298813858"
Received: from unknown (HELO [10.255.15.44]) ([10.255.15.44])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Sep 2013 09:51:41 -0700
Message-ID: <5241C31B.6040406@linux.intel.com>
Date: Tue, 24 Sep 2013 09:51:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
References: <1380034914-3792-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
	<1380034914-3792-2-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
In-Reply-To: <1380034914-3792-2-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] weston : Add weston 1.2.0 bb file
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
X-List-Received-Date: Tue, 24 Sep 2013 16:51:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/24/2013 08:01 AM, Ewan LE BIDEAU-CANEVET wrote:
> Signed-off-by: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
> ---
>   meta/recipes-graphics/wayland/weston_1.2.0.bb | 79 +++++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
>   create mode 100644 meta/recipes-graphics/wayland/weston_1.2.0.bb
>

Normally we need update existing recipes instead of adding new files. 
Also please note this kind of change will be on hold until we branch the 
1.6 master as we don't take updates this late in the cycle.

Be sure to use git mv to preserve the git history of the recipes.

Thanks for the work

Sau!

> diff --git a/meta/recipes-graphics/wayland/weston_1.2.0.bb b/meta/recipes-graphics/wayland/weston_1.2.0.bb
> new file mode 100644
> index 0000000..d320f88
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston_1.2.0.bb
> @@ -0,0 +1,79 @@
> +SUMMARY = "Weston, a Wayland compositor"
> +DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
> +HOMEPAGE = "http://wayland.freedesktop.org"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
> +                    file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
> +
> +SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
> +           file://install-examples.patch \
> +           file://weston.png \
> +           file://weston.desktop"
> +SRC_URI[md5sum] = "86f8c9e865923e138ce44ee41d951500"
> +SRC_URI[sha256sum] = "122e12ae8e4ec4618780465c0cc31d70d67054900a2aac458f82ed6eb5d397b7"
> +
> +
> +inherit autotools pkgconfig useradd
> +
> +DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
> +DEPENDS += "wayland mesa virtual/egl pango"
> +BBCLASSEXTEND = "native"
> +EXTRA_OECONF = "--disable-android-compositor \
> +                --enable-setuid-install \
> +                --disable-tablet-shell \
> +                --disable-xwayland \
> +                --enable-simple-clients \
> +                --enable-clients \
> +                --disable-simple-egl-clients \
> +                --disable-libunwind \
> +                --disable-rpi-compositor \
> +                --disable-rdp-compositor"
> +
> +
> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland', '', d)} \
> +                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> +                   ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)} \
> +                  "
> +#
> +# Compositor choices
> +#
> +# Weston on KMS
> +PACKAGECONFIG[kms] = "--enable-drm-compositor --enable-weston-launch,--disable-drm-compositor --disable-weston-launch,drm udev mesa mtdev libpam"
> +# Weston on Wayland (nested Weston)
> +PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa"
> +# Weston on X11
> +PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
> +# Headless Weston
> +PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compositor"
> +# Weston on framebuffer
> +PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
> +
> +# Use cairo-gl or cairo-glesv2
> +PACKAGECONFIG[gles] = "--with-cairo-glesv2,,virtual/libgles2"
> +
> +do_install_append() {
> +	# Weston doesn't need the .la files to load modules, so wipe them
> +	rm -f ${D}/${libdir}/weston/*.la
> +
> +	for feature in ${DISTRO_FEATURES}; do
> +		# If X11, ship a desktop file to launch it
> +		if [ "$feature" = "x11" ]; then
> +			install -d ${D}${datadir}/applications
> +			install ${WORKDIR}/weston.desktop ${D}${datadir}/applications
> +
> +			install -d ${D}${datadir}/icons/hicolor/48x48/apps
> +			install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
> +                fi
> +	done
> +}
> +
> +PACKAGES += "${PN}-examples"
> +
> +FILES_${PN} = "${bindir}/weston* ${bindir}/wcap-decode ${libexecdir} ${datadir}"
> +FILES_${PN}-examples = "${bindir}/*"
> +
> +RDEPENDS_${PN} += "xkeyboard-config"
> +RRECOMMENDS_${PN} = "liberation-fonts"
> +
> +USERADD_PACKAGES = "${PN}"
> +GROUPADD_PARAM_${PN} = "--system weston-launch"
>

