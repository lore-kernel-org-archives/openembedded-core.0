Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RRUwq-0002qn-Gq
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 21:22:09 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Nov 2011 12:15:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,534,1315206000"; d="scan'208";a="86986788"
Received: from unknown (HELO [10.255.15.232]) ([10.255.15.232])
	by fmsmga001.fm.intel.com with ESMTP; 18 Nov 2011 12:15:41 -0800
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAMKF1sobZc0XAprRePk9jAswGVxzpO-i9Z+4HpOOrKbgfUZDmw@mail.gmail.com>
References: <cover.1321634793.git.tom.zanussi@intel.com>
	<8b14562502b9ccb4f72807a051e5b195ca31a25c.1321634793.git.tom.zanussi@intel.com>
	<CAMKF1sobZc0XAprRePk9jAswGVxzpO-i9Z+4HpOOrKbgfUZDmw@mail.gmail.com>
Date: Fri, 18 Nov 2011 14:19:15 -0600
Message-ID: <1321647555.9657.5.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: Re: [PATCH 1/1] ia32-base.inc: new include file
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
X-List-Received-Date: Fri, 18 Nov 2011 20:22:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-11-18 at 11:17 -0800, Khem Raj wrote:
> On Fri, Nov 18, 2011 at 8:59 AM,  <tom.zanussi@intel.com> wrote:
> > From: Tom Zanussi <tom.zanussi@intel.com>
> >
> > The meta-intel BSPs currently have a number of machine settings common
> > to all - factor these out into a common include file.
> >
> > Also add several new intel-specific XSERVER variables for building
> > XSERVER variables in BSPs.
> >
> 
> I think it belongs to bsp layer why do we need it in oe-core ?
> 

Awhile back I submitted a similar patchset that kept things in
meta-intel.  Richard suggested I use conf/machine/include/:

http://www.mail-archive.com/yocto@yoctoproject.org/msg01629.html

So was I right back then, or is there another place I should be putting
this?

Tom

> > Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> > ---
> >  meta/conf/machine/include/ia32-base.inc |   58 +++++++++++++++++++++++++++++++
> >  1 files changed, 58 insertions(+), 0 deletions(-)
> >  create mode 100644 meta/conf/machine/include/ia32-base.inc
> >
> > diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
> > new file mode 100644
> > index 0000000..5cf2f4f
> > --- /dev/null
> > +++ b/meta/conf/machine/include/ia32-base.inc
> > @@ -0,0 +1,58 @@
> > +#
> > +# base machine settings for ia32-architecture BSPs
> > +#
> > +
> > +#
> > +# common settings for Intel-based machines
> > +#
> > +MACHINE_FEATURES += "kernel26 screen keyboard pci usbhost ext2 ext3 x86 \
> > +                     acpi serial usbgadget"
> > +
> > +MACHINE_EXTRA_RRECOMMENDS += "kernel-modules eee-acpi-scripts"
> > +MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "grub"
> > +
> > +IMAGE_FSTYPES += "ext3 cpio.gz live"
> > +
> > +KERNEL_IMAGETYPE ?= "bzImage"
> > +
> > +SERIAL_CONSOLE ?= "115200 ttyS0"
> > +
> > +#
> > +# glibc-related variables
> > +#
> > +GLIBC_ADDONS ?= "nptl"
> > +GLIBC_EXTRA_OECONF += "--with-tls"
> > +
> > +#
> > +# kernel-related variables
> > +#
> > +PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
> > +PREFERRED_VERSION_linux-yocto ?= "3.0%"
> > +PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers-yocto"
> > +
> > +#
> > +# XSERVER subcomponents, used to build the XSERVER variable
> > +#
> > +XSERVER_IA32_BASE = "xserver-xorg \
> > +           xf86-input-mouse \
> > +           xf86-input-keyboard \
> > +           xf86-input-evdev \
> > +           xf86-input-synaptics \
> > +           mesa-dri \
> > +           "
> > +
> > +XSERVER_IA32_EXT = "xserver-xorg-extension-dri \
> > +           xserver-xorg-extension-dri2 \
> > +           xserver-xorg-extension-glx \
> > +           xserver-xorg-extension-extmod \
> > +           xserver-xorg-extension-dbe \
> > +           xserver-xorg-module-libint10 \
> > +           "
> > +
> > +XSERVER_IA32_I915 = "xf86-video-intel \
> > +           mesa-dri-driver-i965 \
> > +           "
> > +
> > +XSERVER_IA32_EMGD = "emgd-driver-bin"
> > +
> > +XSERVER_IA32_VESA = "xf86-video-vesa"
> > --
> > 1.7.0.4
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




