Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 23191605F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 01:11:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Sep 2013 18:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1006,1371106800"; d="scan'208";a="409025302"
Received: from unknown (HELO [10.255.15.164]) ([10.255.15.164])
	by fmsmga002.fm.intel.com with ESMTP; 29 Sep 2013 18:11:15 -0700
Message-ID: <1380503475.31937.154.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: David =?ISO-8859-1?Q?Nystr=F6m?= <david.c.nystrom@gmail.com>
Date: Sun, 29 Sep 2013 20:11:15 -0500
In-Reply-To: <5246C8E2.7060702@gmail.com>
References: <cover.1380234931.git.tom.zanussi@linux.intel.com>
	<8dbedc35cbce3319722c012af0dad737773446f6.1380234931.git.tom.zanussi@linux.intel.com>
	<CAP9ODKpYNSJs-T=GTpa725A6GK32GykgPbv7w5KeiwPhXVLfzw@mail.gmail.com>
	<1380291699.31937.46.camel@empanada> <5246C8E2.7060702@gmail.com>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] wic: Initial code for wic (OpenEmbedded Image Creator)
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
X-List-Received-Date: Mon, 30 Sep 2013 01:11:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2013-09-28 at 14:17 +0200, David Nyström wrote:
> On 09/27/2013 04:21 PM, Tom Zanussi wrote:
> > Hi Otavio,
> >
> > On Fri, 2013-09-27 at 11:01 -0300, Otavio Salvador wrote:
> >> Hello Tom,
> >>
> >> On Thu, Sep 26, 2013 at 11:17 PM, Tom Zanussi
> >> <tom.zanussi@linux.intel.com> wrote:
> >>> Initial implementation of the 'wic' command.
> >>>
> ><snip>
> >> Could you please elaborate why to make a new command instead of using
> >> the class system?
> >>
> >
> > This isn't an either/or thing - the initial requirements were that the
> > overall deployment effort end up being something that would be usable
> > both from an external tool as well as from within the class system.
> 
> What do you mean when you say "within the class system" here ?
> * A tool using only (kickstart for image cfg, partitioning et.c.) + 
> (tmp/deploy/ipk|rpm|deb) as input data for image creation ?
> 

For me, 'within the class system' just covers what I originally outlined
in the analysis (Bug 3847 - New partitioning description and tooling),
basically providing a more flexible alternative/eventual replacement for
things like boot-directdisk.class/image-vmdk.bbclass and mkefidisk.sh,
and the IMAGE_FSTYPEs mechanism used all over the place for creating
custom images.  At this point, that's the scope of it for me - I'm not
even sure yet where the kickstart interface will hook into things or
exactly how it will presented to users - that's for 1.6.  What I do know
is that the current wic functionality should be sufficient and that it's
pretty well modularized - the 'wic' command itself is just a thin
wrapper that gathers info from the user e.g. paths to the build
artifacts and a kickstart file and invokes the image creator through a
well-defined entry point.

For current work (and presumably also when integrated into the class
system), I'm directly using the target rootfs - my first versions
actually just used the rootfs image e.g. xx.ext3, but because I needed
access to the filesystem for e.g. generating the fstab, and can't do a
loop mount because it requires root, that's what the tool uses.

Using tmp/deploy/ipk|rpm|deb as input for image creation is a step
beyond what I had scoped out for this immediate task - things like image
configuration and package selection from package repositories/feeds are
things I believe other people are interested in; using kickstart/mic as
the underlying infrastructure for those additional capabilities at first
glance seems that it might also make sense in those cases, since those
things are already implemented in some form, but I haven't looked deeply
and that's probably something for those who have the need/interest to
determine...

> Just my five cents,
> 
> I would like to see reproducible image creation from both the bitbake/OE 
> build env and the nativesdk SDK build env.
> This would require a common interface for input distribution data, It 
> naturally feels like this interface should be the package repository.
> i.e. if X is not packaged as class-target, it can't be included on the 
> generated image.
> Also, if X is required to generate the image, it should be packaged as 
> class-nativesdk.
> 
> afaict, the standalone wic tool uses a hybrid approach, using 
> OpenEmbedded build artifacts + a package repository as input for rootfs 
> generation.

Yeah, that's what the tool currently uses, but as you say, some more
thought towards a common interface needs to be done.  I originally had
this for the --source param to the 'part commmand': 

parser.add_option("-s", "--source", action = "append",
                  default = True, help = "define additional wks sources
[sourcename=/path/to/source], referenced in .wks part commands as
--source sourcename")

For the current wic code, I punted on trying to come up with something
more general purpose like this (and as you can see it's not really
general purpose, in my case just allowing multiple filesystem sources
and not very well thought out at that), and simply defined 'rootfs' to
mean the entire /rootfs passed in using the -r option.

I think there needs to be a way to specify arbitrary (user-defined as
well) sources and those sources could really be anything, including
package repositories in whatever form you need them to be.  I don't have
the answer at the moment, just that there needs to be a generic
mechanism for providing and making use of arbitrary sources - any input
you could provide for the use cases it sounds like you've given more
thought to handling would help move that along...

Thanks,

Tom

> What is the long term plan for wic in regards to the above ?
> 
> Br,
> David
> 
> > This just happens to be the initial (easier) part of that, the external
> > tool, and I expect in 1.6 to be doing a lot of the harder part,
> > integration with the build system.
> 
> 
> > The most important part, I think, is that this provides a high-level
> > user-oriented 'language' (the kickstart files) that users can use to
> > define custom images, rather than having to muck around in class files
> > or variable settings, or write specialized scripts such as mkefidisk.sh
> > for example.
> >
> > Making that available from a standalone tool such as 'wic' is
> > straightforward, doing the same from within the build system will
> > require more thought and work, but that's what I'm hoping to do in
> > 1.6...
> 
> 
> 
> >
> > Tom
> >
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> 



