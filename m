Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <a73d4944b4e5fe4b6528aa5390edcd3bdf58e5e7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libsdl2: Add libunwind-native to the libsdl2-native DEPENDS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Sat, 05 Mar 2022 00:05:12 +0000
In-Reply-To: <14bd2ef7889943f8b972fa612844e04c@axis.com>
References: <20220304075507.369779-1-crg7475@mailbox.org>
	 <14bd2ef7889943f8b972fa612844e04c@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "crg7475@mailbox.org" <crg7475@mailbox.org>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

On Fri, 2022-03-04 at 18:20 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of Carlos Rafael Giani
> > via lists.openembedded.org
> > Sent: den 4 mars 2022 08:55
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH] libsdl2: Add libunwind-native to the libsdl2-native
> > DEPENDS
> > 
> > This fixes this CMake configuration error:
> > 
> > > -- Checking for one of the modules 'libunwind'
> > > CMake Error at [...]/build/tmp/work/x86_64-linux/libsdl2-native/2.0.20-
> > > r0/recipe-sysroot-native/usr/share/cmake-
> > > 3.22/Modules/FindPkgConfig.cmake:890 (message):
> > >   None of the required 'libunwind' found
> > > Call Stack (most recent call first):
> > >   CMakeLists.txt:1367 (pkg_search_module)
> > 
> > This error happens even if libunwind is installed complete with its C
> > headers and development .so files (in Ubuntu, this means libunwind-dev
> > is installed).
> > 
> > Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> > ---
> >  meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recipes-
> > graphics/libsdl2/libsdl2_2.0.20.bb
> > index 90724ab8b7..802efba980 100644
> > --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> > +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> > @@ -27,6 +27,8 @@ SRC_URI[sha256sum] =
> > "c56aba1d7b5b0e7e999e4a7698c70b63a3394ff9704b5f6e1c57e0c16f
> > 
> >  inherit cmake lib_package binconfig-disabled pkgconfig
> > 
> > +DEPENDS:class-native += "libunwind-native"
> 
> The above should be:
> 
> DEPENDS:append:class-native = " libunwind-native"
> 
> However, why don't libsdl2 built for target and nativesdk 
> need to depend on libunwind? I.e., why isn't the above:
> 
> DEPENDS = "libunwind"
> 
> 

There is a second issue, libunwind-native doesn't build on all our systems:

https://autobuilder.yoctoproject.org/typhoon/#/builders/91/builds/5624/steps/12/logs/stdio

:(

I think I may have to revert this until we get to the bottom of things.

Cheers,

Richard

