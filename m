Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <7ec1a961dd5fba3b61c76a05b94655ab72a59062.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] webkitgtk: add gperf-native to DEPENDS to fix build
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Mon, 18 Oct 2021 15:07:14 +0100
In-Reply-To: <CA+chaQeYpbufBvZFgoiaQarwOs5wPVDAfd4DpyLNmDA93=kVgA@mail.gmail.com>
References: <20211017115703.3801301-1-schnitzeltony@gmail.com>
	 <e4e32689f8bddb5de2f34b156620cd9cef488cdf.camel@linuxfoundation.org>
	 <16AED214610C971D.13161@lists.openembedded.org>
	 <CA+chaQeYpbufBvZFgoiaQarwOs5wPVDAfd4DpyLNmDA93=kVgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>

On Mon, 2021-10-18 at 15:56 +0200, Martin Jansa wrote:
> On Sun, Oct 17, 2021 at 2:45 PM Martin Jansa via lists.openembedded.org
> <Martin.Jansa=gmail.com@lists.openembedded.org> wrote:
> > On Sun, Oct 17, 2021 at 2:03 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Sun, 2021-10-17 at 13:57 +0200, Andreas Müller wrote:
> > > > >   Could NOT find Gperf (missing: GPERF_EXECUTABLE) (Required is at
> > > > > least
> > > > >   version "3.0.1")
> > > > 
> > > > Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> > > > ---
> > > >  meta/recipes-sato/webkit/webkitgtk_2.34.0.bb | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> > > > b/meta/recipes-
> > > > sato/webkit/webkitgtk_2.34.0.bb
> > > > index 25e1d422cc..a8e067147c 100644
> > > > --- a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> > > > +++ b/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> > > > @@ -32,6 +32,7 @@ CVE_PRODUCT = "webkitgtk webkitgtk\+"
> > > >  
> > > >  DEPENDS = " \
> > > >            ruby-native \
> > > > +          gperf-native \
> > > >            cairo \
> > > >            harfbuzz \
> > > >            jpeg \
> > > 
> > > Out of interest, why are you seeing that and the automated testing isn't?
> > > 
> > 
> > 
> > FWIW: I'm also seeing webkitgtk failures since last upgrade, but for me it
> > isn't because of gperf, but:
> > 
> > | CMake Error at Source/cmake/OptionsGTK.cmake:353 (message):
> > |   Either GLX or EGL is needed.
> > | Call Stack (most recent call first):
> > |   Source/cmake/WebKitCommon.cmake:220 (include)
> > |   CMakeLists.txt:20 (include)
> > 
> > possibly because the default setup in oe-core doesn't have opengl in
> > DISTRO_FEATUES while all builds on autobuilder have opengl enabled with
> > poky?
> > 
> 
> 
> I've sent a fix for build for default oe-core setup (without opengl in
> DISTRO_FEATURES).
> 
> In my build gperf-native was found in older 2.32.3 from native sysroot:
> 
> CMakeCache.txt.2.32.3-
> r0:GPERF_EXECUTABLE:FILEPATH=/jenkins/mjansa/build/ros/ros2-foxy-
> kirkstone/tmp-glibc/work/core2-64-oe-linux/webkitgtk/VER/recipe-sysroot-
> native/usr/bin
> /gperf
> CMakeCache.txt.2.32.3-r0://Details about finding Gperf
> CMakeCache.txt.2.32.3-
> r0:FIND_PACKAGE_MESSAGE_DETAILS_Gperf:INTERNAL=[/jenkins/mjansa/build/ros/ros2
> -foxy-kirkstone/tmp-glibc/work/core2-64-oe-linux/webkitgtk/VER/recipe-sys
> root-native/usr/bin/gperf][v(3.0.1)]
> CMakeCache.txt.2.32.3-r0://ADVANCED property for variable: GPERF_EXECUTABLE
> CMakeCache.txt.2.32.3-r0:GPERF_EXECUTABLE-ADVANCED:INTERNAL=1
> 
> and it's found there through as transitive dependency from:
> 
> "fontconfig.do_prepare_recipe_sysroot" -> "gperf-native.do_populate_sysroot"
> "glibc.do_prepare_recipe_sysroot" -> "gperf-native.do_populate_sysroot"
> "libcap-native.do_prepare_recipe_sysroot" -> "gperf-
> native.do_populate_sysroot"
> "libcap.do_prepare_recipe_sysroot" -> "gperf-native.do_populate_sysroot"
> "systemd.do_prepare_recipe_sysroot" -> "gperf-native.do_populate_sysroot"
> 
> with some other combination of DISTRO_FEATURES it might be missing as in
> Andreas case and as it's direct dependency of webkitgtk I think removing it
> in:
> https://git.openembedded.org/openembedded-core/commit/?id=a5b6f978ef4aef6d484acc6e3c4558df7fec65d2
> wasn't correct, maybe other dependencies removed here have similar issue and
> successful pass on autobuilder tests only very limited set of combinations
> (understandably).

We could put gperf-native into the same class of dependencies as pkgconfig-
native which should expose all the missing dependencies at the risk of causing
work in needing to correctly mark up the recipes.

I'm at least happier now I understand why this was being masked.

Cheers,

Richard

