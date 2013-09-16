Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 48DC860648
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 17:49:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Sep 2013 10:46:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,917,1371106800"; d="scan'208";a="404165381"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.7.201.128]) ([10.7.201.128])
	by orsmga002.jf.intel.com with ESMTP; 16 Sep 2013 10:49:22 -0700
Message-ID: <1379353761.1285.163.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Mon, 16 Sep 2013 10:49:21 -0700
In-Reply-To: <52338A9D.7000307@windriver.com>
References: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
	<1379006387-20186-6-git-send-email-jason.wessel@windriver.com>
	<1379009772.1285.30.camel@dvhart-mobl4.amr.corp.intel.com>
	<52321B6A.4080100@windriver.com>
	<1379016587.1285.38.camel@dvhart-mobl4.amr.corp.intel.com>
	<52338A9D.7000307@windriver.com>
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
X-List-Received-Date: Mon, 16 Sep 2013 17:49:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-13 at 16:58 -0500, Jason Wessel wrote:
> On 09/12/2013 03:09 PM, Darren Hart wrote:
> > On Thu, 2013-09-12 at 14:52 -0500, Jason Wessel wrote:
> >> On 09/12/2013 01:16 PM, Darren Hart wrote:
> >>> On Thu, 2013-09-12 at 12:19 -0500, Jason Wessel wrote:
...

 
> >>>> +GRUB_SERIAL ?= "console=ttyS0,115200"
> > 
> > ...
> > 
> >>> I'm not very familiar with the cfgfile for menus and such, so I don't
> >>> have much to add. The one thing that catches me by surprise is the need
> >>> for the serial device. On EFI systems, grub here uses the EFI console
> >>> service, so if that uses the serial port you get it for free, no need
> >>> for GRUB to try and use it directly. In fact.... does the above not
> >>> cause some kind of conflict between the EFI console service and grub
> >>> serial?
> >>>
> >>
> >> In part that is why it is optional.   With respect to the serial bits,
> >> these are only the kernel boot arguments we are talking about.  It
> > 
> > 
> > Hrm.... this should be handled with APPEND parameter from the machine
> > configs, not a new GRUB_SERIAL statement....
> > 
> 
> 
> Well there is a problem with that.  You only have 1 APPEND, but I need
> 2 options.  The whole point is the ability to add SERIAL or Graphics


I don't follow. Do you mean you need both serial and VGA? That is still
handled by the single variable. Take the FRI2 for example:

APPEND += "console=ttyPCH1,115200 console=tty0"

With what you have here, it seems to me this will be ignored and GRUB
will instead pass console=ttyS0,115200 - which will not work on the
FRI2.

>  console access for early boot all the way through user space hand off
> and seamlessly picking things up later in user space with mingetty
> etc...
> 
> This option is mainly used for the installer media and to provide a
> consistent look and feel regardless if you come from EFI or a PCIBIOS
> + syslinux.

SYSLINUX also has some recipe-specific console options, but those are
due to the syntax differences and are used to specify how syslinux talks
to the device, while this appears to be Linux kernel syntax
("console=ttyS0") rather than grub syntax ("serial --unit=0
--speed=115200")... and yet I don't see the "console=ttyS0" being passed
to the kernel.... so I am confused. Where does the GRUB_SERIAL content
actually get used? I mean besides the creation of the btypes array....

--
Darren

> 
> 
> > 
> >>  doesn't seem that there is a "primary" display interface for the HCDP
> >> in the EFI firmware I have.   Additionally, the kernel throws the EFI
> >> serial console under the bus at ACPI probe time, while this certainly
> >> could also be a bug in the firmware I have on my test board, the only
> >> way to keep the serial port alive for a login and the kernel boot
> >> information was to specify console=ttyS0...
> > 
> > Hrm.... interesting. I guess we'll just need to test more broadly.
> > Indeed the kernel should be using it's own console= parameter, but
> > again, that should come from the APPEND_machine variable.
> > 
> > 
> >> I have yet another system I need to try this on which has a much newer
> >> UEFI and a serial port, but I thought it would be best to get
> >> something out there that covers the "buggy firmwares" as well which
> >> can be built optionally.
> > 
> > Agreed, so long as it doesn't break the common case.
> 
> 
> The common case is not broken.  This is something you have to turn on
> in the image or local.conf. 
> 
> The new patches will available soon for the whole series as soon as
> all the test hardware has booted in legacy and efi mode.
> 
> Cheers,
> Jason.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



