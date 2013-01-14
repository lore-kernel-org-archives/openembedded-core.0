Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tuohb-0006He-9k
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 19:24:22 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jan 2013 10:08:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,468,1355126400"; d="scan'208";a="276737758"
Received: from unknown (HELO [10.255.14.213]) ([10.255.14.213])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2013 10:08:46 -0800
Message-ID: <50F449AE.3060101@linux.intel.com>
Date: Mon, 14 Jan 2013 10:08:46 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Noor, Ahsan" <noor_ahsan@mentor.com>
References: <a199c2dc372f0c5a524685e30d8417f05b3713f9.1357343832.git.raj.khem@gmail.com>
	<5c96537b0319af960a917a7b9decb317bbfd4daa.1357343832.git.raj.khem@gmail.com>
In-Reply-To: <5c96537b0319af960a917a7b9decb317bbfd4daa.1357343832.git.raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] cairo: Adds libxext in X11DEPENDS.
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
X-List-Received-Date: Mon, 14 Jan 2013 18:24:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2013 04:00 PM, Khem Raj wrote:
> From: Noor Ahsan <noor_ahsan@mentor.com>
>
> * cairo was giving redefinition error of struct _XLinearGradient,
> struct _XCircle and struct _XRadialGradient.
> * cario now depends on libxext. Adding that dependency resolved
> above errors.
> * Verified it on P2020RDB.
> * Bump PR.
>

This commit message does not fully state what's going on in the change 
below, as pointed out by Richard, you do not comment on the uclib change 
at all and what's the CAIRO_NO_MUTEX setting doing?

The DEPENDS part is good, we just need to know about the rest of it.

Thanks
	Sau!


> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-graphics/cairo/cairo.inc       |    8 ++++++--
>   meta/recipes-graphics/cairo/cairo_1.12.8.bb |    2 +-
>   2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
> index 3059fae..919ab2e 100644
> --- a/meta/recipes-graphics/cairo/cairo.inc
> +++ b/meta/recipes-graphics/cairo/cairo.inc
> @@ -10,7 +10,7 @@ HOMEPAGE = "http://cairographics.org"
>   BUGTRACKER = "http://bugs.freedesktop.org"
>   SECTION = "libs"
>   LICENSE = "MPL-1 & LGPLv2.1"
> -X11DEPENDS = "virtual/libx11 libsm libxrender"
> +X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
>   DEPENDS = "libpng fontconfig pixman glib-2.0"
>   PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>              ${@base_contains('DISTRO_FEATURES', 'gtk-directfb', 'gtk-directfb', '', d)}"
> @@ -21,11 +21,15 @@ BBCLASSEXTEND = "native"
>   #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
>   require cairo-fpu.inc
>   EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)} \
> -                 --enable-tee \
> +                 ${TEE} \
>                   "
>
> +TEE = "--enable-tee"
> +TEE_libc-uclibc = "--disable-tee"
>
>   inherit autotools pkgconfig
>
>   # We don't depend on binutils so we need to disable this
>   export ac_cv_lib_bfd_bfd_openr="no"
> +
> +CFLAGS += "-DCAIRO_NO_MUTEX=1"
> diff --git a/meta/recipes-graphics/cairo/cairo_1.12.8.bb b/meta/recipes-graphics/cairo/cairo_1.12.8.bb
> index 058854c..567a17f 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.12.8.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.12.8.bb
> @@ -2,7 +2,7 @@ require cairo.inc
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
>
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
>
>


