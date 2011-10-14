Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1REiN9-0005lK-DI for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 16:04:27 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EE5MWo017982 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 15:05:22 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aDldFDsqxFOq
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 15:05:22 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EE5IT0017975
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 15:05:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2011 14:58:34 +0100
In-Reply-To: <31C6262B-E2E3-4C58-AFD9-BC8D2366C566@dominion.thruhere.net>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
	<7278a507dcecff4a27ceeb81a2d2de5b9cb84c87.1318505196.git.Martin.Jansa@gmail.com>
	<1318590739.23801.253.camel@ted> <20111014111926.GF3542@jama.jama.net>
	<31C6262B-E2E3-4C58-AFD9-BC8D2366C566@dominion.thruhere.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318600723.2342.17.camel@ted>
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
X-List-Received-Date: Fri, 14 Oct 2011 14:04:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-14 at 15:32 +0200, Koen Kooi wrote:
> Op 14 okt. 2011, om 13:19 heeft Martin Jansa het volgende geschreven:
> 
> > On Fri, Oct 14, 2011 at 12:12:11PM +0100, Richard Purdie wrote:
> >> On Thu, 2011-10-13 at 13:30 +0200, Martin Jansa wrote:
> >>> * also install internal GL headers to libgl-dev
> >>> 
> >>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>> ---
> >>> meta/recipes-graphics/mesa/mesa-common.inc |   18 ++++++++++++++++--
> >>> 1 files changed, 16 insertions(+), 2 deletions(-)
> >>> 
> >>> diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
> >>> index 89ef0cf..62d9b24 100644
> >>> --- a/meta/recipes-graphics/mesa/mesa-common.inc
> >>> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> >>> @@ -40,7 +40,21 @@ require glx-use-tls.inc
> >>> # Multiple virtual/gl providers being built breaks staging
> >>> EXCLUDE_FROM_WORLD = "1"
> >>> 
> >>> -PACKAGES =+ "libglu libglu-dev"
> >>> -
> >>> +PACKAGES =+ "libegl libegl-dev libegl-dbg libglu libglu-dev libosmesa libosmesa-dev libgl libgl-dev"
> >>> +FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
> >>> +FILES_libgl = "${libdir}/libGL.so.*"
> >>> FILES_libglu = "${libdir}/libGLU.so.*"
> >>> +FILES_libosmesa = "${libdir}/libOSMesa.so.*"
> >>> +
> >>> +FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
> >>> +FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL"
> >>> FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h"
> >>> +FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
> >>> +
> >>> +FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
> >>> +FILES_libegl-dbg += "${libdir}/egl/.debug/*"
> >>> +
> >>> +do_install_append () {
> >>> +    install -d ${D}/${includedir}/GL
> >>> +    cp -pPr ${S}/include/GL/internal* ${D}/${includedir}/GL
> >>> +}
> >> 
> >> This last do_install_append is wrong. Things should only be using
> >> installed header files, not internal uninstalled ones. If the need
> >> anything else there is a bug. I know the intel video driver had issues
> >> in this area but those were fixed in the driver.
> > 
> > checking from where we got this in meta-oe I've found really old commit
> > http://git.openembedded.org/openembedded/commit/packages/mesa/mesa-common.inc?id=523eeb1062797a8562446fbefe9413a59540816b
> > so you're right, I'll try to rebuild without this and drop this part
> > from patchset.
> > 
> >> What other issues are people seeing without this piece?
> > 
> > Unless someone else knows about still broken driver :).
> 
> 
> | glxdriswrast.c:39:39: fatal error: GL/internal/dri_interface.h: No such file or directory
> | compilation terminated.
> | glxdricommon.c:36:39: fatal error: GL/internal/dri_interface.h: No such file or directory
> | compilation terminated.
> | make[1]: *** [glxdricommon.lo] Error 1
> | make[1]: *** Waiting for unfinished jobs....
> | make[1]: *** [glxdriswrast.lo] Error 1
> | make[1]: Leaving directory `/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/xserver-xorg-2_1.11.1-r1/xorg-server-1.11.1/glx'
> 
> Xorg requires 'mesa-dri', which doesn't build anymore due to the COMPATIBLE_HOST :(

This means the swrast dri backend should be installing that file...

Hmm, so does the xserver now require the dri backend and the xlib one is
now defunct?

Cheers,

Richard



