Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R2Iwz-0006Z8-9F for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 10:30:09 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8A8UvQ9011309; Sat, 10 Sep 2011 09:30:57 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iTD6NZer3Q5H; Sat, 10 Sep 2011 09:30:57 +0100 (BST)
Received: from [192.168.1.43] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8A8UqUZ011304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sat, 10 Sep 2011 09:30:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E6A82F8.5020508@linux.intel.com>
References: <1314804932.19905.169.camel@phil-desktop>
	<4E6A82F8.5020508@linux.intel.com>
Date: Sat, 10 Sep 2011 09:24:45 +0100
Message-ID: <1315643085.1986.24.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] pango: use qemu to generate pango.modules during rootfs construction
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
X-List-Received-Date: Sat, 10 Sep 2011 08:30:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-09 at 14:19 -0700, Saul Wold wrote:
> On 08/31/2011 08:35 AM, Phil Blundell wrote:
> > This allows pango to be installed in an image with read-only-rootfs.
> >
> > Signed-off-by: Phil Blundell<philb@gnu.org>
> > ---
> >   meta/recipes-graphics/pango/pango.inc       |   11 +++++++----
> >   meta/recipes-graphics/pango/pango_1.28.4.bb |    2 +-
> >   2 files changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
> > index a8e99e2..ff3f5dd 100644
> > --- a/meta/recipes-graphics/pango/pango.inc
> > +++ b/meta/recipes-graphics/pango/pango.inc
> > @@ -10,13 +10,13 @@ SECTION = "libs"
> >   LICENSE = "LGPL"
> >
> >   X11DEPENDS = "virtual/libx11 libxft"
> > -DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv gtk-doc-native cairo ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
> > +DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv gtk-doc-native cairo qemu-native ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
> >
> >   PACKAGES_DYNAMIC = "pango-module-*"
> >
> >   RRECOMMENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'x11', 'pango-module-basic-x', '', d)} pango-module-basic-fc"
> >
> > -inherit gnome
> > +inherit gnome qemu
> >
> >   EXTRA_AUTORECONF = ""
> >
> > @@ -33,9 +33,12 @@ LIBV = "1.6.0"
> >
> >   postinst_prologue() {
> >   if [ "x$D" != "x" ]; then
> > -  exit 1
> > +	if [ ! -f "$D${sysconfdir}/pango/pango.modules" ]; then
> > +		mkdir -p $D${sysconfdir}/pango
> > +		PSEUDO_RELOADED=YES ${@qemu_target_binary(d)} -L $D $D${bindir}/pango-querymodules>  "$D${sysconfdir}/pango/pango.modules"
> > +	fi
> > +	exit 0
> >   fi
> > -
> >   }
> >
> The usage here of qemu, and some further testing has shown that this may 
> not be the best time to put this patch in, There are failures in both 
> x86-64 and arm builds and the newer version of qemu does not appear to 
> resolve this.
> 
> Phil, given we are trying to generate a release at this point, I feel 
> that we need to revert this patch. You are welcome to resubmit an 
> updated version with sufficient test results, but it will be to master 
> and not 1.1.
> 
> Thanks for the efforts to create a read-only rootfs, this one just can't 
> make it this time.

For what its worth, even on plain qemux86 I'm seeing:

qemu: Unsupported syscall: 240
inb: port=0x0000
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
/media/data1/build1/poky/build/tmp/work/qemux86-poky-linux/core-image-sato-1.0-r0/rootfs/etc/rpm-postinsts/pango-module-basic-fc.sh: line 8: 11084 Segmentation fault      PSEUDO_RELOADED=YES qemu-i386 -L $D $D/usr/bin/pango-querymodules > "$D/etc/pango/pango.modules"

in the rootfs logs. Which reading things online suggests that qemu
doesn't support multithreading under qemu user emulation on i386.

I therefore think we're going to have to rethink this patch...

Cheers,

Richard



