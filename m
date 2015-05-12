Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D100873F5C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 22:28:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 12 May 2015 15:27:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,418,1427785200"; d="scan'208";a="492787782"
Received: from ssandhu2-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.6.22])
	by FMSMGA003.fm.intel.com with ESMTP; 12 May 2015 15:27:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marek Vasut <marex@denx.de>
Date: Tue, 12 May 2015 23:27:50 +0100
Message-ID: <7657326.oj25gFTZjQ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <201505130018.07535.marex@denx.de>
References: <1430239116-7671-1-git-send-email-marex@denx.de>
	<2181196.19WW1XssCR@peggleto-mobl.ger.corp.intel.com>
	<201505130018.07535.marex@denx.de>
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 12 May 2015 22:28:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 13 May 2015 00:18:07 Marek Vasut wrote:
> On Tuesday, May 12, 2015 at 10:57:11 PM, Paul Eggleton wrote:
> [...]
> 
> > > > > > To me this is about how we wish to structure these classes. That's
> > > > > > not my call, but to enumerate the options - unless I'm missing
> > > > > > something we have to choose between:
> > > > > > 
> > > > > > 1) Hardcode uimage/fitimage. Hard to extend.
> > > > > > 
> > > > > > 2) inherit kernel-<type> and just insist that a class for every
> > > > > > image type exists. Ugly and kernel-*.bbclass already exists.
> > > > > > 
> > > > > > 3) Try to search for a kernel-<type> class and inherit it if one
> > > > > > is
> > > > > > found. AFAIK we don't do this kind of thing anywhere else so this
> > > > > > doesn't seem right to me.
> > > > > > 
> > > > > > 4) Establish some other mechanism for registering kernel image
> > > > > > type
> > > > > > classes
> > > > > > (KERNEL_CLASSES ?). Not sure if we want to do this but it is at
> > > > > > least a
> > > > > > common mechanism elsewhere in the system.
> > > > > 
> > > > > I wasn't familiar with an option like this, but if we can do
> > > > > something for the kernel classes that follows the existing patterns
> > > > > .. it makes a lot of sense. I really don't want to invent something
> > > > > new here either.
> > > > > 
> > > > > So something along the lines of the way that image.bbclass works
> > > > > with
> > > > > the IMAGE_CLASSES ?
> > > > 
> > > > Indeed, that's what I was referring to.
> > > 
> > > Doesn't that mean it would be possible for kernel.bbclass to inherit
> > > multiple classes -- for example kernel-uimage.bbclass and
> > > kernel-fitimage.bbclass -- at the same time ? Won't that make it
> > > impossible to remove the kernel type checks in kernel-uimage.bbclass ?
> > > But maybe having those checks in place is the right thing to do since
> > > there might be a target building both fitImage and uImage at the same
> > > time?
> > 
> > You will still need these checks, yes. To be honest I don't consider
> > having
> > those to be a bad thing though.
> 
> I am not very fond of such "blanket if", it certainly doesn't look very nice
> and it looks confusingly redundant especially if the image type
> implementation is in it's own dedicated class. But if you consider this OK,
> I will thus try and implement the KERNEL_IMAGE_CLASSES (that might be a
> better name) approach. OK ?

I think this is the best (or perhaps least worst) approach. KERNEL_CLASSES 
probably would be a better name - there's nothing inherently image type 
specific to this, we're just going to inherit its value.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

