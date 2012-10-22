Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TQGxy-0008JC-5E for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 14:18:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9MC5Hac004801;
	Mon, 22 Oct 2012 13:05:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04420-06; Mon, 22 Oct 2012 13:05:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9MC582R004795
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 22 Oct 2012 13:05:09 +0100
Message-ID: <1350907509.2520.86.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, Daniel Stone <daniel@fooishbar.org>
Date: Mon, 22 Oct 2012 13:05:09 +0100
In-Reply-To: <1350898286-14049-1-git-send-email-ross.burton@intel.com>
References: <1350898286-14049-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: Build separate GLU library
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
X-List-Received-Date: Mon, 22 Oct 2012 12:18:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-22 at 10:31 +0100, Ross Burton wrote:
> From: Daniel Stone <daniel@fooishbar.org>
> 
> Mesa has removed GLU from the core tree upstream, so remove it from the
> Mesa build, add support for the new GLU tree, and introduce a new
> virtual/libglu package.
> 
> Signed-off-by: Daniel Stone <daniel@fooishbar.org>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/glew/glew_1.9.0.bb     |    4 ++--
>  meta/recipes-graphics/mesa/mesa-common.inc   |    7 ++----
>  meta/recipes-graphics/mesa/mesa-glu_9.0.0.bb |   31 ++++++++++++++++++++++++++
>  3 files changed, 35 insertions(+), 7 deletions(-)
>  create mode 100644 meta/recipes-graphics/mesa/mesa-glu_9.0.0.bb

Both the package names and provider names change here leading to errors
like:

http://autobuilder.yoctoproject.org:8010/builders/nightly-arm-lsb/builds/100/steps/shell_27/logs/stdio

so this is going to need some further tweaks.

Cheers,

Richard


> diff --git a/meta/recipes-graphics/glew/glew_1.9.0.bb b/meta/recipes-graphics/glew/glew_1.9.0.bb
> index 00fff11..3b466d3 100644
> --- a/meta/recipes-graphics/glew/glew_1.9.0.bb
> +++ b/meta/recipes-graphics/glew/glew_1.9.0.bb
> @@ -5,9 +5,9 @@ SECTION = "x11"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
>  
> -DEPENDS = "virtual/libx11 virtual/libgl libxext libxi libxmu"
> +DEPENDS = "virtual/libx11 virtual/libgl virtual/libglu libxext libxi libxmu"
>  
> -PR = "r0"
> +PR = "r1"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
>             file://autotools.patch \
> diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
> index faa8183..1ad8ff3 100644
> --- a/meta/recipes-graphics/mesa/mesa-common.inc
> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> @@ -12,7 +12,7 @@ SECTION = "x11"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
>  
> -INC_PR = "r3"
> +INC_PR = "r4"
>  PE = "2"
>  
>  DEPENDS = "libxml2-native makedepend-native flex-native bison-native"
> @@ -24,7 +24,7 @@ FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
>  
>  inherit autotools pkgconfig pythonnative
>  
> -EXTRA_OECONF = "--enable-glu \
> +EXTRA_OECONF = "--disable-glu \
>                  --disable-glw \
>                  --disable-glut \
>                  --enable-shared-glapi"
> @@ -42,7 +42,6 @@ EXCLUDE_FROM_WORLD = "1"
>  RDEPENDS_${PN}-dev = ""
>  
>  PACKAGES =+ "libegl libegl-dev \
> -             libglu libglu-dev \
>               libosmesa libosmesa-dev \
>               libgl libgl-dev \
>               libglapi libglapi-dev \
> @@ -57,7 +56,6 @@ FILES_libgles1 = "${libdir}/libGLESv1*.so.*"
>  FILES_libgles2 = "${libdir}/libGLESv2.so.*"
>  FILES_libgl = "${libdir}/libGL.so.*"
>  FILES_libglapi = "${libdir}/libglapi.so.*"
> -FILES_libglu = "${libdir}/libGLU.so.*"
>  FILES_libosmesa = "${libdir}/libOSMesa.so.*"
>  
>  FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
> @@ -66,7 +64,6 @@ FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
>  FILES_libglapi-dev = "${libdir}/libglapi.*"
>  FILES_libgles1-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
>  FILES_libgles2-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
> -FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h ${libdir}/pkgconfig/glu.pc"
>  FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
>  
>  FILES_${PN}-dbg += "${libdir}/dri/.debug/* ${libdir}/egl/.debug/*"
> diff --git a/meta/recipes-graphics/mesa/mesa-glu_9.0.0.bb b/meta/recipes-graphics/mesa/mesa-glu_9.0.0.bb
> new file mode 100644
> index 0000000..d3fffe7
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/mesa-glu_9.0.0.bb
> @@ -0,0 +1,31 @@
> +SUMMARY = "The OpenGL utility toolkit"
> +DESCRIPTION = "GLU is a utility toolkit used with OpenGL implementations"
> +
> +HOMEPAGE = "http://mesa3d.org"
> +BUGTRACKER = "https://bugs.freedesktop.org"
> +SECTION = "x11"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://include/GL/glu.h;endline=29;md5=6b79c570f644363b356456e7d44471d9 \
> +                    file://src/libtess/tess.c;endline=29;md5=6b79c570f644363b356456e7d44471d9"
> +
> +# Epoch as this used to be part of mesa-dri
> +PE = "2"
> +PR = "0"
> +
> +SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/glu/glu-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "be9249132ff49275461cf92039083030"
> +SRC_URI[sha256sum] = "1f7ad0d379a722fcbd303aa5650c6d7d5544fde83196b42a73d1193568a4df12"
> +
> +S = "${WORKDIR}/glu-${PV}"
> +
> +DEPENDS = "virtual/libgl"
> +
> +inherit autotools pkgconfig
> +
> +# ie mesa-glu could be empty and mesa-glu-dev RDEPENDS on it
> +ALLOW_EMPTY_${PN} = "1"
> +
> +PROVIDES = "virtual/libglu"
> +
> +FILES_mesa-glu-dev = "${libdir}/pkgconfig/glu.pc"




