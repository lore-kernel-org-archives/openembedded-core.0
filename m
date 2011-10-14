Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1REfmA-0004pk-U5 for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 13:18:07 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EBIxOk009429 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 12:18:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2AQWMQTy9TCc
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 12:18:59 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EBIsDb009419
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 12:18:56 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2011 12:12:11 +0100
In-Reply-To: <7278a507dcecff4a27ceeb81a2d2de5b9cb84c87.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
	<7278a507dcecff4a27ceeb81a2d2de5b9cb84c87.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318590739.23801.253.camel@ted>
Mime-Version: 1.0
Subject: Re: [oe-core 11/20] mesa: package gl/egl/osmesa to separate packages
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
X-List-Received-Date: Fri, 14 Oct 2011 11:18:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-13 at 13:30 +0200, Martin Jansa wrote:
> * also install internal GL headers to libgl-dev
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa-common.inc |   18 ++++++++++++++++--
>  1 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
> index 89ef0cf..62d9b24 100644
> --- a/meta/recipes-graphics/mesa/mesa-common.inc
> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> @@ -40,7 +40,21 @@ require glx-use-tls.inc
>  # Multiple virtual/gl providers being built breaks staging
>  EXCLUDE_FROM_WORLD = "1"
>  
> -PACKAGES =+ "libglu libglu-dev"
> -
> +PACKAGES =+ "libegl libegl-dev libegl-dbg libglu libglu-dev libosmesa libosmesa-dev libgl libgl-dev"
> +FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
> +FILES_libgl = "${libdir}/libGL.so.*"
>  FILES_libglu = "${libdir}/libGLU.so.*"
> +FILES_libosmesa = "${libdir}/libOSMesa.so.*"
> +
> +FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
> +FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL"
>  FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h"
> +FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
> +
> +FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
> +FILES_libegl-dbg += "${libdir}/egl/.debug/*"
> +
> +do_install_append () {
> +    install -d ${D}/${includedir}/GL
> +    cp -pPr ${S}/include/GL/internal* ${D}/${includedir}/GL
> +}

This last do_install_append is wrong. Things should only be using
installed header files, not internal uninstalled ones. If the need
anything else there is a bug. I know the intel video driver had issues
in this area but those were fixed in the driver.

What other issues are people seeing without this piece?

Cheers,

Richard




