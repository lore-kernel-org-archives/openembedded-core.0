Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 236AF74D6E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 16:01:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w49G0EdV028006
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 May 2018 09:00:15 -0700 (PDT)
Received: from yow-masselst-lx1.localnet (128.224.60.223) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 9 May 2018 09:00:10 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 May 2018 12:00:09 -0400
Message-ID: <3814374.oaZWZoq0et@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <20180508211844.GA2573@jama>
References: <1523387170-30191-1-git-send-email-denis@denix.org>
	<20180508211844.GA2573@jama>
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 1/2] wayland: upgrade to 1.15.0
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
X-List-Received-Date: Wed, 09 May 2018 16:01:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, May 8, 2018 5:18:44 PM EDT Martin Jansa wrote:
> On Tue, Apr 10, 2018 at 03:06:09PM -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Official announcement:
> > https://lists.freedesktop.org/archives/wayland-devel/2018-April/037767.htm
> > l
> > 
> > | libwayland-egl is now part of libwayland, and will presumably be removed
> > | from mesa in the not too distant future.
> > 
> > Update mesa recipe by removing corresponding libwayland-egl entries.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > 
> >  meta/recipes-graphics/mesa/mesa.inc                                | 7
> >  ++++--- .../wayland/{wayland_1.14.0.bb => wayland_1.15.0.bb}            
> >    | 4 ++-- 2 files changed, 6 insertions(+), 5 deletions(-)
> >  rename meta/recipes-graphics/wayland/{wayland_1.14.0.bb =>
> >  wayland_1.15.0.bb} (92%)> 
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc
> > b/meta/recipes-graphics/mesa/mesa.inc index b501b7e..c3a8e76 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -119,7 +119,6 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
> > 
> >               libgles1-mesa libgles1-mesa-dev \
> >               libgles2-mesa libgles2-mesa-dev \
> >               libgles3-mesa libgles3-mesa-dev \
> > 
> > -             libwayland-egl libwayland-egl-dev \
> > 
> >               libxatracker libxatracker-dev \
> >               mesa-megadriver mesa-vulkan-drivers \
> >              
> >              "
> > 
> > @@ -134,6 +133,10 @@ do_install_append () {
> > 
> >      # it was packaged in libdricore9.1.3-1 and preventing upgrades when
> >      debian.bbclass was used rm -f ${D}${sysconfdir}/drirc
> >      chrpath --delete ${D}${libdir}/dri/*_dri.so || true
> > 
> > +
> > +    # libwayland-egl has been moved to wayland 1.15+
> > +    rm -f ${D}${libdir}/libwayland-egl.so*
> > +    rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
> 
> Shouldn't /usr/lib/libwayland-egl.la be removed as well? Now I'm getting
> many do_prepare_recipe_sysroot failures because both mesa and wayland
> provide this file.

I am also seeing build failures due to this conflict:

ERROR: libglu-2_9.0.0-0 do_prepare_recipe_sysroot: The file /usr/lib64/
libwayland-egl.la is installed by both wayland and mesa, aborting
..
ERROR: mesa-2_18.0.2-r0 do_package: QA Issue: mesa: Files/directories were 
installed but not shipped in any package:
  /usr/lib64/libwayland-egl.la
Please set FILES such that these items are packaged. Alternatively if they are 
unneeded, avoid installing them or delete them within do_install.
mesa: 1 installed and not shipped files. [installed-vs-shipped]

is someone working on a fix or should I take some time to put something 
together?

Mark


> 
> >  }
> >  
> >  # For the packages that make up the OpenGL interfaces, inject variables
> >  so that> 
> > @@ -204,7 +207,6 @@ FILES_libgles2-mesa = "${libdir}/libGLESv2.so.*"
> > 
> >  FILES_libgl-mesa = "${libdir}/libGL.so.*"
> >  FILES_libglapi = "${libdir}/libglapi.so.*"
> >  FILES_libosmesa = "${libdir}/libOSMesa.so.*"
> > 
> > -FILES_libwayland-egl = "${libdir}/libwayland-egl.so.*"
> > 
> >  FILES_libxatracker = "${libdir}/libxatracker.so.*"
> >  
> >  FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan"
> > 
> > @@ -216,7 +218,6 @@ FILES_libgles1-mesa-dev = "${libdir}/libGLESv1*.*
> > ${includedir}/GLES ${libdir}/p> 
> >  FILES_libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2
> >  ${libdir}/pkgconfig/glesv2.pc" FILES_libgles3-mesa-dev =
> >  "${includedir}/GLES3"
> >  FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h
> >  ${libdir}/pkgconfig/osmesa.pc"> 
> > -FILES_libwayland-egl-dev = "${libdir}/pkgconfig/wayland-egl.pc
> > ${libdir}/libwayland-egl.*"> 
> >  FILES_libxatracker-dev = "${libdir}/libxatracker.so
> >  ${libdir}/libxatracker.la \>  
> >                            ${includedir}/xa_tracker.h
> >                            ${includedir}/xa_composite.h
> >                            ${includedir}/xa_context.h \
> >                            ${libdir}/pkgconfig/xatracker.pc"
> > 
> > diff --git a/meta/recipes-graphics/wayland/wayland_1.14.0.bb
> > b/meta/recipes-graphics/wayland/wayland_1.15.0.bb similarity index 92%
> > rename from meta/recipes-graphics/wayland/wayland_1.14.0.bb
> > rename to meta/recipes-graphics/wayland/wayland_1.15.0.bb
> > index 1a9ff98..788105b 100644
> > --- a/meta/recipes-graphics/wayland/wayland_1.14.0.bb
> > +++ b/meta/recipes-graphics/wayland/wayland_1.15.0.bb
> > @@ -15,8 +15,8 @@ DEPENDS = "expat libxml2 libffi wayland-native"
> > 
> >  SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
> >  
> >  	   file://fixpathinpcfiles.patch \
> >  	   
> >             "
> > 
> > -SRC_URI[md5sum] = "0235f6075c32c3be61cff94fa0b9f108"
> > -SRC_URI[sha256sum] =
> > "ed80cabc0961a759a42092e2c39aabfc1ec9a13c86c98bbe2b812f008da27ab8"
> > +SRC_URI[md5sum] = "b7393c17fdce9a8d383edab656c92fd2"
> > +SRC_URI[sha256sum] =
> > "eb3fbebb8559d56a80ad3753ec3db800f587329067962dbf65e14488b4b7aeb0"> 
> >  inherit autotools pkgconfig





