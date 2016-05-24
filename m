Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3BED960797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 20:16:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 24 May 2016 13:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,360,1459839600"; d="scan'208";a="973745081"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2016 13:16:06 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 3F0976A4007;
	Tue, 24 May 2016 14:03:35 -0700 (PDT)
Date: Tue, 24 May 2016 23:16:00 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Christopher Larson <clarson@kergoth.com>
Message-ID: <20160524201600.GB21158@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <154c86e7fa2.11a4a3b0e305159.2603931524640206304@geekcentral.pub>
	<20160523103623.GA18324@linux.intel.com>
	<154dd88c4a6.d1f78c40166145.7475080368514196708@geekcentral.pub>
	<20160524195145.GA21158@linux.intel.com>
	<CABcZANnTRsoFWBdshg1mvV1AWvxjs_XqYb0horJwFSpqrswT6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANnTRsoFWBdshg1mvV1AWvxjs_XqYb0horJwFSpqrswT6Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Wic and "live" images
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
X-List-Received-Date: Tue, 24 May 2016 20:16:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 24, 2016 at 12:56:39PM -0700, Christopher Larson wrote:
> On Tue, May 24, 2016 at 12:51 PM, Ed Bartosh <ed.bartosh@linux.intel.com>
> wrote:
> 
> > On Mon, May 23, 2016 at 08:13:28AM -0400, Ian Geiser wrote:
> > >  > On Thu, May 19, 2016 at 05:52:45AM -0400, Ian Geiser wrote:
> > >  > > Greetings, I am trying to learn "wic" and have been confused as how
> > to create a "live" style image.  I am following "
> > http://www.yoctoproject.org/docs/1.5.2/dev-manual/dev-manual.html#creating-partitioned-images"
> > but am getting confused on the target to use to create the a file system
> > that has a single squashfs file containing my root file system.
> > >  > >
> > >  > > My desired partition layout is as follows:
> > >  > >       40MiB                 40MiB               300MiB
> > >  > >
> > +--------------------+-----------------+-----------------------------+
> > >  > > |      BOOT (esp)    |    DATA (fat)   |          ROOT (live)
> >   |
> > >  > >
> > +--------------------+-----------------+-----------------------------+
> > >  > >
> > >  > > BOOT - efi boot partition with kernel and initramfs
> > >  > > DATA - generic fat filesystem to hold configuration files
> > >  > > ROOT - an ext4 filesystem that contains a single os.img, which is a
> > squashfs file.
> > >  > >
> > >  > > I have ROOT and DATA figured out but I am at a loss as how to
> > generate the os.img file and copy it into ROOT.  If I generate the os.img
> > file with bitbake and then use the "-r" option to manually supply a
> > directory structure it works, but I would rather have it done from a wks
> > file for automation reasons.
> > >  > >
> > >  > > Any hints?
> > >  > I'd suggest to use wic image type and generate your image by bitbake.
> > >  > You can find example wic-image-minimal.bb and wic-image-minimal.wks
> > in ../meta-selftest/recipes-test/images/
> > >  >
> > > This is where I started.  I was able to make it work but not with my
> > configuration above.  It looks like I can use a type of "fsimage" for my
> > "ROOT" partition, but I have not been able to figure out the syntax there
> > yet.  For "BOOT" I am at a complete loss.  In theory "bootimg-efi" but
> > there doesn't seem to be a way to provide an initramfs.
> >
> > How about creating recipe to prepare content or your boot partition and
> > then using --source rootfs --rootfs-dir=<your recipe> ?
> > This is much more generic way of creating partitioned images from my
> > point of view. Image recipes should take care of content and wic takes
> > care of
> > putting that content into partitions according to the partitioning
> > scheme described in .wks
> >
> > Does it make sense for you?
> >
> > >
> > >  > You can probably do the same by using wic plugins, but I'd not suggest
> > >  > to go this way. Using wic image type is simpler, more consistent,
> > easier to do and provides higher level of automation.
> > >
> > > Is using the wic image type and a plugin mutually exclusive?
> > No, not at all. However, I personally found the way I described above
> > more consistent, flexible and easy to implement and maintain.
> >
> 
> The thing is, it's likely the machine/bsp setting the WKS_FILE, yet in
> OE/yocto we prefer machine/distro/image to be orthogonal. If you're
> injecting machine specific logic into an image, that image isn't going to
> be generally useful for all machines, and so violates our philosophy.

I'm not sure I understand why it has to be machine-dependent setting in
the .wks Can you give some example?

--
Regards,
Ed

