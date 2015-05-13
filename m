Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 2F65673FFF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 07:28:34 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3lmnfp0BPFz3hhc0;
	Wed, 13 May 2015 09:28:33 +0200 (CEST)
X-Auth-Info: tM9xAGYdSV50hCoPV4fkaYjmYctPfzjpA8rpydYADIs=
Received: from chi.localnet (host-82-135-33-74.customer.m-online.net
	[82.135.33.74])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3lmnfm1dKbzvhTZ; 
	Wed, 13 May 2015 09:28:32 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 13 May 2015 09:17:11 +0200
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1430239116-7671-1-git-send-email-marex@denx.de>
	<201505130018.07535.marex@denx.de>
	<7657326.oj25gFTZjQ@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <7657326.oj25gFTZjQ@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Message-Id: <201505130917.11964.marex@denx.de>
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
X-List-Received-Date: Wed, 13 May 2015 07:28:35 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, May 13, 2015 at 12:27:50 AM, Paul Eggleton wrote:
> On Wednesday 13 May 2015 00:18:07 Marek Vasut wrote:
> > On Tuesday, May 12, 2015 at 10:57:11 PM, Paul Eggleton wrote:
> > [...]
> > 
> > > > > > > To me this is about how we wish to structure these classes.
> > > > > > > That's not my call, but to enumerate the options - unless I'm
> > > > > > > missing something we have to choose between:
> > > > > > > 
> > > > > > > 1) Hardcode uimage/fitimage. Hard to extend.
> > > > > > > 
> > > > > > > 2) inherit kernel-<type> and just insist that a class for every
> > > > > > > image type exists. Ugly and kernel-*.bbclass already exists.
> > > > > > > 
> > > > > > > 3) Try to search for a kernel-<type> class and inherit it if
> > > > > > > one is
> > > > > > > found. AFAIK we don't do this kind of thing anywhere else so
> > > > > > > this doesn't seem right to me.
> > > > > > > 
> > > > > > > 4) Establish some other mechanism for registering kernel image
> > > > > > > type
> > > > > > > classes
> > > > > > > (KERNEL_CLASSES ?). Not sure if we want to do this but it is at
> > > > > > > least a
> > > > > > > common mechanism elsewhere in the system.
> > > > > > 
> > > > > > I wasn't familiar with an option like this, but if we can do
> > > > > > something for the kernel classes that follows the existing
> > > > > > patterns .. it makes a lot of sense. I really don't want to
> > > > > > invent something new here either.
> > > > > > 
> > > > > > So something along the lines of the way that image.bbclass works
> > > > > > with
> > > > > > the IMAGE_CLASSES ?
> > > > > 
> > > > > Indeed, that's what I was referring to.
> > > > 
> > > > Doesn't that mean it would be possible for kernel.bbclass to inherit
> > > > multiple classes -- for example kernel-uimage.bbclass and
> > > > kernel-fitimage.bbclass -- at the same time ? Won't that make it
> > > > impossible to remove the kernel type checks in kernel-uimage.bbclass
> > > > ? But maybe having those checks in place is the right thing to do
> > > > since there might be a target building both fitImage and uImage at
> > > > the same time?
> > > 
> > > You will still need these checks, yes. To be honest I don't consider
> > > having
> > > those to be a bad thing though.
> > 
> > I am not very fond of such "blanket if", it certainly doesn't look very
> > nice and it looks confusingly redundant especially if the image type
> > implementation is in it's own dedicated class. But if you consider this
> > OK, I will thus try and implement the KERNEL_IMAGE_CLASSES (that might
> > be a better name) approach. OK ?
> 
> I think this is the best (or perhaps least worst) approach. KERNEL_CLASSES
> probably would be a better name - there's nothing inherently image type
> specific to this, we're just going to inherit its value.

OKi, I will implement this and repost the series.

Thanks!

Best regards,
Marek Vasut

