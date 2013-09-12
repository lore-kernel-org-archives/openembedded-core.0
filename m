Return-Path: <dvhart@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 2600B6B260
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 20:09:48 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 Sep 2013 13:09:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,892,1371106800"; d="scan'208";a="359703081"
Received: from unknown (HELO [10.255.14.117]) ([10.255.14.117])
	by azsmga001.ch.intel.com with ESMTP; 12 Sep 2013 13:09:48 -0700
Message-ID: <1379016587.1285.38.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Thu, 12 Sep 2013 13:09:47 -0700
In-Reply-To: <52321B6A.4080100@windriver.com>
References: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
	<1379006387-20186-6-git-send-email-jason.wessel@windriver.com>
	<1379009772.1285.30.camel@dvhart-mobl4.amr.corp.intel.com>
	<52321B6A.4080100@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] grub-efi.bbclass: Add serial and graphics menu options
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
X-List-Received-Date: Thu, 12 Sep 2013 20:09:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-12 at 14:52 -0500, Jason Wessel wrote:
> On 09/12/2013 01:16 PM, Darren Hart wrote:
> > On Thu, 2013-09-12 at 12:19 -0500, Jason Wessel wrote:
> >> The syslinux.bbclass already has support for automatically generated
> >> serial and graphics menu choices.  This patch adds the same concept to
> >> the grub-efi menu.  That makes it possible to generate a single image
> >> which can boot on a PCBIOS or EFI firmware with consistent looking
> >> boot options.
> >>
> >> [YOCTO #4100]
> >>
> >> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> >> ---
> >>  meta/classes/grub-efi.bbclass     |   41 ++++++++++++++++++++++++-------------
> >>  meta/conf/machine/qemux86-64.conf |    2 +-
> >>  meta/conf/machine/qemux86.conf    |    2 ++
> >>  3 files changed, 30 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
> >> index c6f5d4e..c07e4a1 100644
> >> --- a/meta/classes/grub-efi.bbclass
> >> +++ b/meta/classes/grub-efi.bbclass
> >> @@ -9,6 +9,7 @@
> >>  # External variables
> >>  # ${INITRD} - indicates a filesystem image to use as an initrd (optional)
> >>  # ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
> >> +# ${GRUB_GFXSERIAL} - set this to 1 to have graphics and serial in the boot menu
> >>  # ${LABELS} - a list of targets for the automatic config
> >>  # ${APPEND} - an override list of append strings for each label
> >>  # ${GRUB_OPTS} - additional options to add to the config, ';' delimited # (optional)
> >> @@ -16,6 +17,7 @@
> >>  
> >>  do_bootimg[depends] += "grub-efi-${TRANSLATED_TARGET_ARCH}-native:do_deploy"
> >>  
> >> +GRUB_SERIAL ?= "console=ttyS0,115200"

...

> > I'm not very familiar with the cfgfile for menus and such, so I don't
> > have much to add. The one thing that catches me by surprise is the need
> > for the serial device. On EFI systems, grub here uses the EFI console
> > service, so if that uses the serial port you get it for free, no need
> > for GRUB to try and use it directly. In fact.... does the above not
> > cause some kind of conflict between the EFI console service and grub
> > serial?
> > 
> 
> In part that is why it is optional.   With respect to the serial bits,
> these are only the kernel boot arguments we are talking about.  It


Hrm.... this should be handled with APPEND parameter from the machine
configs, not a new GRUB_SERIAL statement....


>  doesn't seem that there is a "primary" display interface for the HCDP
> in the EFI firmware I have.   Additionally, the kernel throws the EFI
> serial console under the bus at ACPI probe time, while this certainly
> could also be a bug in the firmware I have on my test board, the only
> way to keep the serial port alive for a login and the kernel boot
> information was to specify console=ttyS0...

Hrm.... interesting. I guess we'll just need to test more broadly.
Indeed the kernel should be using it's own console= parameter, but
again, that should come from the APPEND_machine variable.


> I have yet another system I need to try this on which has a much newer
> UEFI and a serial port, but I thought it would be best to get
> something out there that covers the "buggy firmwares" as well which
> can be built optionally.

Agreed, so long as it doesn't break the common case.


> > Both of the following should be in a separate patch. In fact, they
> > should probably have a qemux86-common.inc which took care of most of
> > this (as was done recently for genericx86-common.inc).
> 
> 
> So I am not sure that we want to patch up the qemux86* conf files at
> all.  Do we want to enable EFI + PCBIOS all the time now that we have
> a way to generate images (noting these images will work with runqemu)?
> I figured I would just drop those modifications entirely.  I would
> expect something like a "all encompassing" white box BSP to select
> both, but for the qemux86*, I don't think it makes sense.
> 

At some point we want qemux86* to boot with OVMF, but we can add "efi"
to MACHINE_FEATURES when/if that becomes doable with oe-core. So yeah,
go ahead and just drop these entirely for now.

...

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



