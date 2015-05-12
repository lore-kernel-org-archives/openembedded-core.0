Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0ADAD7402E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 19:32:05 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3lmTm40tXXz3hhp1;
	Tue, 12 May 2015 21:32:03 +0200 (CEST)
X-Auth-Info: 3b934JnNuxMtWuZj2k/mlmUzqicZeLjAnVQOXEZk4iQ=
Received: from chi.localnet (host-82-135-33-74.customer.m-online.net
	[82.135.33.74])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3lmTm311BBzvdWV; 
	Tue, 12 May 2015 21:32:03 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Tue, 12 May 2015 21:27:30 +0200
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1430239116-7671-1-git-send-email-marex@denx.de>
	<55521E66.4090908@windriver.com>
	<2038782.k0jOjIWbIe@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <2038782.k0jOjIWbIe@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Message-Id: <201505122127.30772.marex@denx.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] kernel: Pull uImage generation into separate class
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
X-List-Received-Date: Tue, 12 May 2015 19:32:06 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, May 12, 2015 at 06:18:15 PM, Paul Eggleton wrote:
> On Tuesday 12 May 2015 11:38:14 Bruce Ashfield wrote:
> > On 2015-05-12 10:15 AM, Paul Eggleton wrote:
> > > On Monday 04 May 2015 23:41:47 Marek Vasut wrote:
> > >> On Tuesday, April 28, 2015 at 11:16:17 PM, Marek Vasut wrote:
> > >>> On Tuesday, April 28, 2015 at 08:44:54 PM, Bruce Ashfield wrote:
> > >>>> On 2015-04-28 12:38 PM, Marek Vasut wrote:
> > >>>>> Pull the uImage image format generation from kernel.bbclass into
> > >>>>> a separate kernel-uimage.bbclass. The recipes which now need to
> > >>>>> generate an uImage will have to inherit kernel-uimage instead of
> > >>>>> kernel class.
> > >>>>> 
> > >>>>> Signed-off-by: Marek Vasut <marex@denx.de>
> > >>>>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > >>>>> Cc: Koen Kooi <koen@dominion.thruhere.net>
> > >>>>> Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
> > >>>>> Cc: Ross Burton <ross.burton@intel.com>
> > >>>>> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> > >>>>> ---
> > >>>>> 
> > >>>>>    meta/classes/kernel-uimage.bbclass | 48
> > >>>>>    +++++++++++++++++++++++++++++++++ meta/classes/kernel.bbclass
> > >>>>>    
> > >>>>>    | 55 +++++++------------------------------- 2 files changed, 58
> > >>>>>    
> > >>>>>    insertions(+), 45 deletions(-)
> > >>>>>    create mode 100644 meta/classes/kernel-uimage.bbclass
> > >>>>> 
> > >>>>> NOTE: The "inherit kernel-uimage" in kernel.bbclass should be
> > >>>>> changed to
> > >>>>> 
> > >>>>>         something like "inherit
> > >>>>>         kernel-${@d.getVar("KERNEL_IMAGETYPE", True).lower()}" but
> > >>>>>         the problem is that I only want to perform the inheritance
> > >>>>>         for uimage and fitimage, the other image types don't need
> > >>>>>         to inherit any additional special stuff. Paul suggested I
> > >>>>>         can do "inherit <empty here>". This would at least let me
> > >>>>>         implement a python function which returns either
> > >>>>>         "kernel-uimage", "kernel-fitimage" or "" and based on
> > >>>>>         that, I could inherit the particular image type specifics
> > >>>>>         into kernel.bbclass.
> > >>>>>         What I don't know how to implement well is this function
> > >>>>>         which returns those three strings based on the
> > >>>>>         KERNEL_IMAGETYPE. What
> > >>>>>         I would like to avoid is encoding those strings explicitly
> > >>>>>         into
> > >>>>>         the function, since that would force each new kernel image
> > >>>>>         format to also edit this function in kernel.bbclass .
> > >>>>>         Apparently, checking whether class exists and inheriting it
> > >>>>>         only if it does is also not a simple task.
> > >>>> 
> > >>>> Agreed that this would be better. It would remove a lot of the
> > >>>> checks in the other tasks for the image type.
> > >>> 
> > >>> Hi!
> > >>> 
> > >>> Yes, that's indeed true. All the image type checks would disappear
> > >>> from kernel-uimage and kernel-fitimage bbclasses.
> > >>> 
> > >>>> I'm not aware of the exact details on how to make this work, but
> > >>>> hopefully others have the foo.
> > >> 
> > >> Any ideas please ?
> > > 
> > > To me this is about how we wish to structure these classes. That's not
> > > my call, but to enumerate the options - unless I'm missing something
> > > we have to choose between:
> > > 
> > > 1) Hardcode uimage/fitimage. Hard to extend.
> > > 
> > > 2) inherit kernel-<type> and just insist that a class for every image
> > > type exists. Ugly and kernel-*.bbclass already exists.
> > > 
> > > 3) Try to search for a kernel-<type> class and inherit it if one is
> > > found. AFAIK we don't do this kind of thing anywhere else so this
> > > doesn't seem right to me.
> > > 
> > > 4) Establish some other mechanism for registering kernel image type
> > > classes
> > > (KERNEL_CLASSES ?). Not sure if we want to do this but it is at least a
> > > common mechanism elsewhere in the system.
> > 
> > I wasn't familiar with an option like this, but if we can do something
> > for the kernel classes that follows the existing patterns .. it makes
> > a lot of sense. I really don't want to invent something new here either.
> > 
> > So something along the lines of the way that image.bbclass works with
> > the IMAGE_CLASSES ?
> 
> Indeed, that's what I was referring to.

Doesn't that mean it would be possible for kernel.bbclass to inherit multiple
classes -- for example kernel-uimage.bbclass and kernel-fitimage.bbclass -- at
the same time ? Won't that make it impossible to remove the kernel type checks
in kernel-uimage.bbclass ? But maybe having those checks in place is the right
thing to do since there might be a target building both fitImage and uImage at
the same time?

