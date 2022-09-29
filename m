X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Date: Fri, 30 Sep 2022 00:15:42 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] mesa: only apply patch to fix ALWAYS_INLINE for native
Message-ID: <YzYZDkznxW1tCbmQ@mail.local>
References: <20220921080357.8493-1-kai.kang@windriver.com>
 <51cc35c11610c638c75efc6de20845f3e497c8dc.camel@linuxfoundation.org>
 <0d77f98c-1a7b-f1ad-be89-82776cb2ca92@windriver.com>
MIME-Version: 1.0
In-Reply-To: <0d77f98c-1a7b-f1ad-be89-82776cb2ca92@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: kai <kai.kang@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, raj.khem@gmail.com, martin.jansa@gmail.com, openembedded-core@lists.openembedded.org

Hello,

On 29/09/2022 17:20:52+0800, kai wrote:
> On 9/21/22 17:08, Richard Purdie wrote:
> > On Wed, 2022-09-21 at 16:03 +0800, kai wrote:
> > > From: Kai Kang <kai.kang@windriver.com>
> > > 
> > > 0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch is not
> > > required by target mesa any more. But it still fails to compile
> > > mesa-native with DEBUG_BUILD enabled on Ubuntu 18.04 with gcc 7.5.0
> > > without this patch:
> > > 
> > > > ../mesa-22.1.6/src/compiler/nir/nir_inline_helpers.h: In function ‘nir_opt_move_block’:
> > > > ../mesa-22.1.6/src/compiler/nir/nir_opt_move.c:55:1: error: inlining failed in call to
> > >      always_inline ‘src_is_ssa’: indirect function call with a yet undetermined callee
> > > >   src_is_ssa(nir_src *src, void *state)
> > > >   ^~~~~~~~~~
> > > So only apply it for mesa-native.
> > > 
> > > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > > ---
> > > v2:
> > > * add comment
> > > 
> > >   meta/recipes-graphics/mesa/mesa.inc | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> > > index ea7ed4fd27..913aec987d 100644
> > > --- a/meta/recipes-graphics/mesa/mesa.inc
> > > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > > @@ -22,9 +22,11 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> > >              file://0001-util-format-Check-for-NEON-before-using-it.patch \
> > >              file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch \
> > >              file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch \
> > > -           file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch \
> > >              "
> > > +# required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD enabled
> > > +SRC_URI:append:class-native = " file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
> > > +
> > >   SRC_URI[sha256sum] = "22ced061eb9adab8ea35368246c1995c09723f3f71653cd5050c5cec376e671a"
> > >   UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
> > This still generates warnings for musl builds, e.g.:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5882/steps/11/logs/warnings
> 
> Hi Richard,
> 
> The warnings are related with binutils but not mesa. Would you like to
> review it again, please?
> 

Sure, but it doesn't apply on master anymore, could you rebase please?

> Thanks,
> Kai
> 
> > 
> > Cheers,
> > 
> > Richard
> > 
> 
> -- 
> Kai Kang
> Wind River Linux
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
