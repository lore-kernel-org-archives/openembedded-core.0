Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 18DC778397
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 11:58:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id BF09C2608B7
Message-ID: <1506081500.3560.33.camel@collabora.co.uk>
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 22 Sep 2017 13:58:20 +0200
In-Reply-To: <CAP71WjwZ0BVhtRGGLRGaCzDZ2SfJvAzERtujG-dw_hmbDB1WaA@mail.gmail.com>
References: <20170922110243.10454-1-fabien.lahoudere@collabora.co.uk>
	<20170922110243.10454-4-fabien.lahoudere@collabora.co.uk>
	<CAP71WjwZ0BVhtRGGLRGaCzDZ2SfJvAzERtujG-dw_hmbDB1WaA@mail.gmail.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 4/4] mesa: Bump to version 17.2.0
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
X-List-Received-Date: Fri, 22 Sep 2017 11:58:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-09-22 at 13:51 +0200, Nicolas Dechesne wrote:
> On Fri, Sep 22, 2017 at 1:02 PM, Fabien Lahoudere
> <fabien.lahoudere@collabora.co.uk> wrote:
> > Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> > ---
> >  meta/recipes-graphics/mesa/mesa_17.2.0.bb | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 meta/recipes-graphics/mesa/mesa_17.2.0.bb
> 
> * the diff looks suspicious. you should have renamed the existing
> recipe, not just added a new one.
> * there is already a patch being discussed on the list for 17.2.1, please check.
> * we will not merge any x.y.0 release of mesa, the .0 release are not
> meant for production use, as mentioned in the release notes: "Mesa
> 17.2.0 is a new development release. People who are concerned with
> stability and reliability should stick with a previous release or wait
> for Mesa 17.2.1."
> 

Indeed you're right.
So please ignore this patch.

Thanks

> > 
> > diff --git a/meta/recipes-graphics/mesa/mesa_17.2.0.bb b/meta/recipes-
> > graphics/mesa/mesa_17.2.0.bb
> > new file mode 100644
> > index 0000000000..e522e0bbfe
> > --- /dev/null
> > +++ b/meta/recipes-graphics/mesa/mesa_17.2.0.bb
> > @@ -0,0 +1,24 @@
> > +require ${BPN}.inc
> > +
> > +SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> > +           file://replace_glibc_check_with_linux.patch \
> > +           file://disable-asm-on-non-gcc.patch \
> > +           file://0001-Use-wayland-scanner-in-the-path.patch \
> > +           file://0002-hardware-gloat.patch \
> > +           file://vulkan-mkdir.patch \
> > +           file://llvm-config-version.patch \
> > +           file://0001-winsys-svga-drm-Include-sys-types.h.patch \
> > +           file://0001-configure.ac-Always-check-for-expat.patch \
> > +           "
> > +SRC_URI[md5sum] = "1d8d7323d11146767a37c3cb6a6d411d"
> > +SRC_URI[sha256sum] = "3123448f770eae58bc73e15480e78909defb892f10ab777e9116c9b218094943"
> > +
> > +DEPENDS += " llvm-native wayland-protocols "
> > +
> > +#because we cannot rely on the fact that all apps will use pkgconfig,
> > +#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> > +do_install_append() {
> > +    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
> > +        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)$/#if
> > defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/'
> > ${D}${includedir}/EGL/eglplatform.h
> > +    fi
> > +}
> > --
> > 2.11.0
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

