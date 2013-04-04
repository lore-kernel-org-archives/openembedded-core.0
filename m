Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UNn8c-00050r-QT for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 18:35:47 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r34GScH0028535; Thu, 4 Apr 2013 17:29:06 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ScuFRDQTrbLR; Thu,  4 Apr 2013 17:29:06 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r34GSv8f028560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 4 Apr 2013 17:29:00 +0100
Message-ID: <1365092291.6526.114.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Prica, Mihai" <mihai.prica@intel.com>
Date: Thu, 04 Apr 2013 17:18:11 +0100
In-Reply-To: <97BD068FB200C44AA73C2B641F162ECF97E89B@IRSMSX101.ger.corp.intel.com>
References: <1365077355-17673-1-git-send-email-mihai.prica@intel.com>
	<E88E88F5-90AE-4280-AE38-735E593E6DC6@gmail.com>
	<97BD068FB200C44AA73C2B641F162ECF97E89B@IRSMSX101.ger.corp.intel.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] qemu: Enabled SDL when compiling for target architecture
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
X-List-Received-Date: Thu, 04 Apr 2013 16:35:48 -0000
X-List-Received-Date: Thu, 04 Apr 2013 16:35:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-04-04 at 15:56 +0000, Prica, Mihai wrote:
> > On Apr 4, 2013, at 5:09 AM, Mihai Prica <mihai.prica@intel.com> wrote:
> > > Enables qemu to run images with video output without the need for vncviewer.
> > >
> > > Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> > > ---
> > > meta/recipes-devtools/qemu/qemu.inc |    4 ++--
> > > 1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-devtools/qemu/qemu.inc
> > > b/meta/recipes-devtools/qemu/qemu.inc
> > > index 1b5b569..06fa88b 100644
> > > --- a/meta/recipes-devtools/qemu/qemu.inc
> > > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > > @@ -1,7 +1,7 @@
> > > DESCRIPTION = "open source processor emulator"
> > > HOMEPAGE = "http://qemu.org"
> > > LICENSE = "GPLv2 & LGPLv2.1"
> > > -DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 pixman dtc"
> > > +DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 pixman dtc libsdl"
> > > DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-
> > native dtc-native"
> > > DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0
> > nativesdk-pixman nativesdk-dtc"
> > > RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
> > > @@ -13,7 +13,7 @@ BBCLASSEXTEND = "native nativesdk"
> > > # QEMU_TARGETS is overridable variable QEMU_TARGETS ?= "arm i386 mips
> > > mipsel mips64 mips64el ppc sh4 x86_64"
> > >
> > > -SDL ?= "--disable-sdl"
> > > +SDL ?= ""
> > 
> > I think this is not acceptable change. Since many systems are headless and its
> > useless for them secondly, converting this to PACKAGECONFIG and keeping the
> > behavior as it was would be fine.
> 
> I sent a patch to meta-virtualization that just enabled SDL using a bbappend and the
> maintainers said I should to integrate this into poky. I talked with Richard and he 
> said I should use a PACKAGECONFIG and enable sdl by default for the target. For 
> headless images the user can disable it. I sent a V2 with this solution. Saul replied 
> and told me there are some problems with this approach and I should stick with the
> SDL variable.

I'd ultimately like to see PACKAGECONFIG used here but we haven't
managed the right patchset yet so I took this one earlier today as a
short term fix :/.

Cheers,

Richard



