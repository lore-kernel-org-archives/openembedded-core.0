Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UNmZH-0001rU-HL
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 17:59:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Apr 2013 08:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,409,1363158000"; d="scan'208";a="289393416"
Received: from unknown (HELO [10.255.14.17]) ([10.255.14.17])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2013 08:41:39 -0700
Message-ID: <515D9F33.9060909@linux.intel.com>
Date: Thu, 04 Apr 2013 08:41:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Carlos Rafael Giani <dv@pseudoterminal.org>
References: <1365017211-17183-1-git-send-email-dv@pseudoterminal.org>
In-Reply-To: <1365017211-17183-1-git-send-email-dv@pseudoterminal.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe][PATCH] eglinfo: Add recipes for x11 and fb backends
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
X-List-Received-Date: Thu, 04 Apr 2013 15:59:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


I am going to defer this to 1.5 when it opens up, I still need to review 
the recipe, but wanted to give you a heads up about the deferral.


Thanks
	Sau!


On 04/03/2013 12:26 PM, Carlos Rafael Giani wrote:
> eglinfo is a small utility for printing out information about EGL as well
> as about its client APIs, OpenGL / OpenGLES 1.x / OpenGLES 2.x / OpenVG.
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>   meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb  | 11 ++++++
>   meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb |  6 +++
>   meta/recipes-graphics/eglinfo/eglinfo.inc        | 49 ++++++++++++++++++++++++
>   3 files changed, 66 insertions(+)
>   create mode 100644 meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
>   create mode 100644 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
>   create mode 100644 meta/recipes-graphics/eglinfo/eglinfo.inc
>
> diff --git a/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
> new file mode 100644
> index 0000000..65b265f
> --- /dev/null
> +++ b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
> @@ -0,0 +1,11 @@
> +EGLINFO_PLATFORM ?= "fb"
> +EGLINFO_BINARY_NAME ?= "eglinfo-fb"
> +
> +# .bbappend files in BSP meta layers can add EGLINFO_DEVICE
> +# values if necessary. eglinfo.inc contains default values for
> +# the currently supported devices.
> +# Consult the eglinfo README.md for details
> +
> +include eglinfo.inc
> +
> +SUMMARY += "(Framebuffer version)"
> diff --git a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
> new file mode 100644
> index 0000000..8793a25
> --- /dev/null
> +++ b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
> @@ -0,0 +1,6 @@
> +EGLINFO_PLATFORM ?= "x11"
> +EGLINFO_BINARY_NAME ?= "eglinfo-x11"
> +
> +include eglinfo.inc
> +
> +SUMMARY += "(X11 version)"
> diff --git a/meta/recipes-graphics/eglinfo/eglinfo.inc b/meta/recipes-graphics/eglinfo/eglinfo.inc
> new file mode 100644
> index 0000000..116435d
> --- /dev/null
> +++ b/meta/recipes-graphics/eglinfo/eglinfo.inc
> @@ -0,0 +1,49 @@
> +SUMMARY = "Utility for printing information EGL and its client APIs (OpenGL, OpenGL ES, OpenVG)"
> +SECTION = "graphics"
> +LICENSE = "Zlib"
> +HOMEPAGE = "https://github.com/dv1/eglinfo"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8d4f33bc3add976f7dfae85dab66f03c"
> +
> +DEPENDS = "virtual/egl"
> +
> +SRC_URI = "git://github.com/dv1/eglinfo.git;branch=master"
> +SRCREV = "4a49ff59545d9b6a8222badab64115f89d3a6774"
> +
> +S = "${WORKDIR}/git"
> +
> +
> +# BSP layers should add .bbappend files for the -x11 and -fb .bb recipes,
> +# which append the respective EGL/OpenGLES/OpenVG libraries to DEPENDS
> +# not doing that here, since some platforms might not have OpenGL ES or OpenVG support
> +# (in that case, the eglinfo build scripts automatically disable the relevant code paths)
> +
> +EGLINFO_DEVICE ?= "generic"
> +EGLINFO_DEVICE_raspberrypi ?= "raspberrypi"
> +EGLINFO_DEVICE_beagleboard ?= "beagleboard"
> +EGLINFO_DEVICE_mx6 ?= "imx6"
> +
> +
> +do_clean() {
> +	if [ -x ${S}/waf ]; then
> +		${S}/waf distclean
> +	fi
> +}
> +
> +do_configure() {
> +	${S}/waf configure \
> +		--platform=${EGLINFO_PLATFORM} \
> +		--device=${EGLINFO_DEVICE} \
> +		--sysroot ${STAGING_DIR_TARGET} \
> +		--prefix=${prefix} \
> +		${EXTRA_OECONF}
> +}
> +
> +do_compile() {
> +	${S}/waf
> +}
> +
> +do_install() {
> +	mkdir -p "${D}/${bindir}"
> +	mv "${S}/build/release/eglinfo" "${D}/${bindir}/${EGLINFO_BINARY_NAME}"
> +}
> +
>


