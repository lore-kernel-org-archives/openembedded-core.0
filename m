Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <ee515e6643335998b78b7cfbb6d7f8308c4422e9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/6] libxkbcommon: allow building of API documentation
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Sun, 05 Dec 2021 09:18:17 +0000
In-Reply-To: <44ecb2fe1e3d42988f77a4074baa8075@axis.com>
References: <20211203164340.2963235-1-ross.burton@arm.com>
	 <20211203164340.2963235-3-ross.burton@arm.com>
	 <505b640190d97b7dbcfc306de4c5a357008978a1.camel@linuxfoundation.org>
	 <44ecb2fe1e3d42988f77a4074baa8075@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Ross Burton <ross@burtonini.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

On Sun, 2021-12-05 at 01:24 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 5 december 2021 00:20
> > To: Ross Burton <ross@burtonini.com>; openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 3/6] libxkbcommon: allow building of API
> > documentation
> > 
> > On Fri, 2021-12-03 at 16:43 +0000, Ross Burton wrote:
> > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > ---
> > >  meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
> > > b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
> > > index 95accfc184..725fcf009e 100644
> > > --- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
> > > +++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
> > > @@ -15,11 +15,14 @@ UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
> > > 
> > >  inherit meson pkgconfig
> > > 
> > > -EXTRA_OEMESON = "-Denable-docs=false -Denable-xkbregistry=false"
> > > +EXTRA_OEMESON = "-Denable-xkbregistry=false"
> > > 
> > >  PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)}"
> > > -PACKAGECONFIG[x11] = "-Denable-x11=true,-Denable-x11=false,libxcb
> > > xkeyboard-config,"
> > > +PACKAGECONFIG:append:class-target = "
> > > ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'docs', '',
> > > d)}"
> > > +
> > > +PACKAGECONFIG[docs] = "-Denable-docs=true,-Denable-docs=false,doxygen-
> > > native"
> > >  PACKAGECONFIG[wayland] = "-Denable-wayland=true,-Denable-
> > > wayland=false,wayland-native wayland wayland-protocols,"
> > > +PACKAGECONFIG[x11] = "-Denable-x11=true,-Denable-x11=false,libxcb
> > > xkeyboard-config,"
> > > 
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/2396/steps/11/logs/errors
> > 
> > stdio: ERROR: Nothing PROVIDES 'doxygen-native' (but /home/pokybuild/yocto-
> > worker/qemux86-world-alt/build/meta/recipes-graphics/xorg-
> > lib/libxkbcommon_1.3.1.bb,
> > virtual:multilib:lib32:/home/pokybuild/yocto-worker/qemux86-world-
> > alt/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb DEPENDS on
> > or otherwise requires it). Close matches:
> > 
> > Not quite sure what is going on there yet, seems a little strange.
> 
> Not very strange when you consider that the doxygen recipe is in meta-oe....

Yes, but I was wondering why the other world builds succeed when the lib32
multilib did not?

The answer is that the above world build is the only one with docs enabled so
that is why we're only seeing this there and not in other places.

I did drop most of the xkbcommon changes from master-next however the build
still saw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/563/steps/13/logs/stdio

which is also puzzling/worrying me a bit. Weston does depend on libxkbcommon and
it is as if some of the previous artefacts have been retained from sstate and
not invalidated correctly by the rebuild.

Cheers,

Richard



