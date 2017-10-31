Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 521B4719C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 19:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6729020A31;
	Tue, 31 Oct 2017 19:29:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id E6LLKPylx58T; Tue, 31 Oct 2017 19:29:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 446D820074;
	Tue, 31 Oct 2017 19:29:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C84DE16270B; Tue, 31 Oct 2017 15:29:39 -0400 (EDT)
Date: Tue, 31 Oct 2017 15:29:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Message-ID: <20171031192939.GF9221@denix.org>
References: <20171017173807.19161-1-fabien.lahoudere@collabora.co.uk>
	<20171017173807.19161-3-fabien.lahoudere@collabora.co.uk>
	<20171017190057.GH9221@denix.org>
	<1509370208.13007.13.camel@collabora.co.uk>
MIME-Version: 1.0
In-Reply-To: <1509370208.13007.13.camel@collabora.co.uk>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v6 3/3] weston: Bump version to 3.0.0
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
X-List-Received-Date: Tue, 31 Oct 2017 19:29:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Oct 30, 2017 at 02:30:08PM +0100, Fabien Lahoudere wrote:
> On Tue, 2017-10-17 at 15:00 -0400, Denys Dmytriyenko wrote:
> > I don't believe we reached an agreement on the pitch patch belonging here...
> > 
> 
> This patch fixes a display issue and also possible random crash because how
> the buffer is accessed is not consistent.

Hmm, if it could potentially result in a crash of weston, this changes things. 
We should include the patch, but may need to mention it in the changelog... 
Maybe you need to add this - "fix display issue with YUV420/I420 format, that 
could result in a crash"?


> If you think the patch is not useful, I can remove it in v7?
> 
> Thanks
> 
> Fabien
> 
> > 
> > On Tue, Oct 17, 2017 at 07:38:07PM +0200, Fabien Lahoudere wrote:
> > > Update weston release to 3.0.0.
> > > Two patches added:
> > > - fix-missing-header.patch:
> > >         fix a build issue when musl is used as libc.
> > > - weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch:
> > >         fix display issue with YUV420/I420 format.
> > > 
> > > Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> > > ---
> > >  .../wayland/weston/fix-missing-header.patch        | 30 ++++++++++++
> > >  ...t-pitch-correctly-for-subsampled-textures.patch | 55 ++++++++++++++++++++++
> > >  .../wayland/{weston_2.0.0.bb => weston_3.0.0.bb}   | 17 +++----
> > >  3 files changed, 94 insertions(+), 8 deletions(-)
> > >  create mode 100644 meta/recipes-graphics/wayland/weston/fix-missing-header.patch
> > >  create mode 100644 meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-
> > > for-subsampled-textures.patch
> > >  rename meta/recipes-graphics/wayland/{weston_2.0.0.bb => weston_3.0.0.bb} (89%)
> > > 
> > > diff --git a/meta/recipes-graphics/wayland/weston/fix-missing-header.patch b/meta/recipes-
> > > graphics/wayland/weston/fix-missing-header.patch
> > > new file mode 100644
> > > index 0000000000..55c0d4fd0f
> > > --- /dev/null
> > > +++ b/meta/recipes-graphics/wayland/weston/fix-missing-header.patch
> > > @@ -0,0 +1,30 @@
> > > +On the musl C library, tests/timespec-text.c does not build, with the
> > > +following error:
> > > +
> > > +    In file included from tests/timespec-test.c:36:0:
> > > +    ./shared/timespec-util.h:41:21: warning: ‘struct timespec’ declared
> > > +    inside parameter list will not be visible outside of this definition
> > > +    or declaration
> > > +     timespec_sub(struct timespec *r,
> > > +                         ^~~~~~~~
> > > +   [...]
> > > +
> > > +Indeed, struct timespec is defined in time.h, so we must include it.
> > > +
> > > +Upstream-Status: Backport [fa41bdfbc0b962fd73b89f01aab1a5370c9c28eb]
> > > +
> > > +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > > +Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> > > +
> > > +Index: weston-3.0.0/shared/timespec-util.h
> > > +===================================================================
> > > +--- weston-3.0.0.orig/shared/timespec-util.h
> > > ++++ weston-3.0.0/shared/timespec-util.h
> > > +@@ -28,6 +28,7 @@
> > > + 
> > > + #include <stdint.h>
> > > + #include <assert.h>
> > > ++#include <time.h>
> > > + 
> > > + #define NSEC_PER_SEC 1000000000
> > > + 
> > > diff --git a/meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-for-
> > > subsampled-textures.patch b/meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-
> > > correctly-for-subsampled-textures.patch
> > > new file mode 100644
> > > index 0000000000..69284a9616
> > > --- /dev/null
> > > +++ b/meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-for-
> > > subsampled-textures.patch
> > > @@ -0,0 +1,55 @@
> > > +Multi-plane sub-sampled textures have partial width/height, e.g.
> > > +YUV420/I420 has a full-size Y plane, followed by a half-width/height U
> > > +plane, and a half-width/height V plane.
> > > +
> > > +zwp_linux_dmabuf_v1 allows clients to pass an explicit pitch for each
> > > +plane, but for wl_shm this must be inferred. gl-renderer was correctly
> > > +accounting for the width and height when subsampling, but the pitch was
> > > +being taken as the pitch for the first plane.
> > > +
> > > +This does not match the requirements for GStreamer's waylandsink, in
> > > +particular, as well as other clients. Fix the SHM upload path to
> > > +correctly set the pitch for each plane, according to subsampling.
> > > +
> > > +Tested with:
> > > +  $ gst-launch-1.0 videotestsrc ! waylandsink
> > > +
> > > +Upstream-status: Backport [https://patchwork.freedesktop.org/patch/180767/]
> > > +
> > > +Signed-off-by: Daniel Stone <daniels@collabora.com>
> > > +Fixes: fdeefe42418 ("gl-renderer: add support of WL_SHM_FORMAT_YUV420")
> > > +Reported-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> > > +Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=103063
> > > +
> > > +---
> > > + libweston/gl-renderer.c | 4 ++--
> > > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > > +
> > > +diff --git a/libweston/gl-renderer.c b/libweston/gl-renderer.c
> > > +index 244ce309..40bf0bb6 100644
> > > +--- a/libweston/gl-renderer.c
> > > ++++ b/libweston/gl-renderer.c
> > > +@@ -1445,14 +1445,13 @@ gl_renderer_flush_damage(struct weston_surface *surface)
> > > + 		goto done;
> > > + 	}
> > > + 
> > > +-	glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT, gs->pitch);
> > > +-
> > > + 	if (gs->needs_full_upload) {
> > > + 		glPixelStorei(GL_UNPACK_SKIP_PIXELS_EXT, 0);
> > > + 		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, 0);
> > > + 		wl_shm_buffer_begin_access(buffer->shm_buffer);
> > > + 		for (j = 0; j < gs->num_textures; j++) {
> > > + 			glBindTexture(GL_TEXTURE_2D, gs->textures[j]);
> > > ++			glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT, gs->pitch / gs->hsub[j]);
> > > + 			glTexImage2D(GL_TEXTURE_2D, 0,
> > > + 				     gs->gl_format[j],
> > > + 				     gs->pitch / gs->hsub[j],
> > > +@@ -1477,6 +1476,7 @@ gl_renderer_flush_damage(struct weston_surface *surface)
> > > + 		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, r.y1);
> > > + 		for (j = 0; j < gs->num_textures; j++) {
> > > + 			glBindTexture(GL_TEXTURE_2D, gs->textures[j]);
> > > ++			glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT, gs->pitch / gs->hsub[j]);
> > > + 			glTexSubImage2D(GL_TEXTURE_2D, 0,
> > > + 					r.x1 / gs->hsub[j],
> > > + 					r.y1 / gs->vsub[j],
> > > diff --git a/meta/recipes-graphics/wayland/weston_2.0.0.bb b/meta/recipes-
> > > graphics/wayland/weston_3.0.0.bb
> > > similarity index 89%
> > > rename from meta/recipes-graphics/wayland/weston_2.0.0.bb
> > > rename to meta/recipes-graphics/wayland/weston_3.0.0.bb
> > > index 8160f5556d..ad0cdc2b0f 100644
> > > --- a/meta/recipes-graphics/wayland/weston_2.0.0.bb
> > > +++ b/meta/recipes-graphics/wayland/weston_3.0.0.bb
> > > @@ -9,12 +9,13 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
> > >             file://weston.png \
> > >             file://weston.desktop \
> > >             file://0001-make-error-portable.patch \
> > > -           file://0001-configure.ac-Fix-wayland-protocols-path.patch \
> > >             file://xwayland.weston-start \
> > >             file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
> > > +	   file://weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch \
> > > +	   file://fix-missing-header.patch \
> > >  "
> > > -SRC_URI[md5sum] = "15f38945942bf2a91fe2687145fb4c7d"
> > > -SRC_URI[sha256sum] = "b4e446ac27f118196f1609dab89bb3cb3e81652d981414ad860e733b355365d8"
> > > +SRC_URI[md5sum] = "9c42a4c51a1b9f35d040fa9d45ada36d"
> > > +SRC_URI[sha256sum] = "cde1d55e8dd70c3cbb3d1ec72f60e60000041579caa1d6a262bd9c35e93723a5"
> > >  
> > >  inherit autotools pkgconfig useradd distro_features_check
> > >  # depends on virtual/egl
> > > @@ -76,7 +77,7 @@ PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
> > >  
> > >  do_install_append() {
> > >  	# Weston doesn't need the .la files to load modules, so wipe them
> > > -	rm -f ${D}/${libdir}/libweston-2/*.la
> > > +	rm -f ${D}/${libdir}/libweston-3/*.la
> > >  
> > >  	# If X11, ship a desktop file to launch it
> > >  	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" ]; then
> > > @@ -93,16 +94,16 @@ do_install_append() {
> > >  }
> > >  
> > >  PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', '${PN}-xwayland', '', d)} \
> > > -             libweston-2 ${PN}-examples"
> > > +             libweston-3 ${PN}-examples"
> > >  
> > >  FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info
> > > ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so ${datadir}"
> > >  
> > > -FILES_libweston-2 = "${libdir}/lib*${SOLIBS} ${libdir}/libweston-2/*.so"
> > > -SUMMARY_libweston-2 = "Helper library for implementing 'wayland window managers'."
> > > +FILES_libweston-3 = "${libdir}/lib*${SOLIBS} ${libdir}/libweston-3/*.so"
> > > +SUMMARY_libweston-3 = "Helper library for implementing 'wayland window managers'."
> > >  
> > >  FILES_${PN}-examples = "${bindir}/*"
> > >  
> > > -FILES_${PN}-xwayland = "${libdir}/libweston-2/xwayland.so"
> > > +FILES_${PN}-xwayland = "${libdir}/libweston-3/xwayland.so"
> > >  RDEPENDS_${PN}-xwayland += "xserver-xorg-xwayland"
> > >  
> > >  RDEPENDS_${PN} += "xkeyboard-config"
> > > -- 
> > > 2.11.0
> > > 
> > > -- 
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> -- 
> Fabien
> 

