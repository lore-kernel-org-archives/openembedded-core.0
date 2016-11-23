Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D732F6067D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 14:11:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Nov 2016 06:11:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,538,1473145200"; d="scan'208";a="1072554979"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 23 Nov 2016 06:11:34 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 35ABC6A4006;
	Wed, 23 Nov 2016 06:10:52 -0800 (PST)
Date: Wed, 23 Nov 2016 16:10:58 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej =?utf-8?B?Qm9yesSZY2tp?= <maciej.borzecki@rndity.com>
Message-ID: <20161123141058.GA21352@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
	<1479813004.3239.19.camel@intel.com>
	<6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
	<20161123120816.GC12545@linux.intel.com>
	<5064cacc-e724-c7b8-9631-3d961c5a29f6@mender.io>
	<20161123132229.GA13863@linux.intel.com>
	<CAD4b0_JPQ9_9bBd0NnTcGn+JyvtsLU7GA-kt4sfW1rzfuPovgw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD4b0_JPQ9_9bBd0NnTcGn+JyvtsLU7GA-kt4sfW1rzfuPovgw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Eduard Bartosh <eduard.bartosh@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Contents of non-rootfs partitions
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
X-List-Received-Date: Wed, 23 Nov 2016 14:11:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Nov 23, 2016 at 02:51:20PM +0100, Maciej Borzęcki wrote:
> On Wed, Nov 23, 2016 at 2:22 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > On Wed, Nov 23, 2016 at 02:08:28PM +0100, Kristian Amlie wrote:
> >> On 23/11/16 13:08, Ed Bartosh wrote:
> >> > On Tue, Nov 22, 2016 at 12:54:52PM +0100, Kristian Amlie wrote:
> >> >> On 22/11/16 12:10, Patrick Ohly wrote:
> >> >>>> ...
> >> >>>
> >> >>> All of these introduce some special mechanism. Let me propose something
> >> >>> that might integrate better with the existing tooling:
> >> >>>
> >> >>> The "rootfs" directory gets redefined as representing the entire virtual
> >> >>> file system. When creating a disk image, it gets split up into different
> >> >>> partitions based on the image configuration.
> >> >>>
> >> >>> For example, the /home or /data directories in the rootfs could hold the
> >> >>> content that in some image configurations goes into separate partitions.
> >> >>>
> >> >>> The advantage of this approach is that the tooling for staging content
> >> >>> for image creation does not need to be changed. The same staged content
> >> >>> then can be used to create different images, potentially even using
> >> >>> different partition layouts.
> >> >>
> >> >> That's a very good idea. I think it beats all of my suggestions!
> >> >>
> >> >>> To implement this approach with wic, wic needs to be taught how to
> >> >>> exclude directories from the main rootfs. Ideally, the mkfs.* tools
> >> >>> should also support that without having to make an intermediate copy of
> >> >>> the files for a certain partition, but initially wic could create
> >> >>> temporary directory trees.
> >> >>
> >> >> Yes, some work would be needed here, but ultimately it would be contained within wic and related tools, which is a good thing.
> >> >>
> >> >
> >> > I support the idea. Let's discuss the details of implementation and
> >> > create a bug in bugzilla to track the development
> >>
> >> Do you want me to create the ticket? (it'll be my first, so apologies in
> >> advance if I omit something important)
> >>
> >> > This can be done by extending existing rootfs plugin. It should be able
> >> > to do 2 things:
> >> >
> >> > - populate content of one rootfs directory to the partition. We can
> >> >   extend syntax of --rootfs-dir parameter to specify optional directory path to use
> >> >
> >> > - exclude rootfs directories when populating partitions. I'd propose to
> >> >   introduce --exclude-dirs wks parser option to handle this.
> >> >
> >> > Example of wks file with proposed new options:
> >> > part /     --source rootfs --rootfs-dir=core-image-minimal       --ondisk sda --fstype=ext4 --label root --align 1024 --exclude-dirs data --exclude-dirs home
> >> > part /data --source rootfs --rootfs-dir=core-image-minimal:/home --ondisk sda --fstype=ext4 --label data --align 1024
> >> > part /home --source rootfs --rootfs-dir=core-image-minimal:/data --ondisk sda --fstype=ext4 --label data --align 1024
> >> >
> >> > Does this make sense?
> >>
> >> Looks good. The only thing I would question is that, in the interest of
> >> reducing redundancy, maybe we should omit --exclude-dirs and have wic
> >> figure this out by combining all the entries, since "--exclude-dirs
> >> <dir>" and the corresponding "part <dir>" will almost always come in
> >> pairs. Possibly we could mark the "/" partition with one single
> >> --no-overlapping-dirs to force wic to make this consideration. Or do you
> >> think that's too magical?
> >>
> > Tt's quite implicit from my point of view. However, if people like it we
> > can implement it this way.
> >
> >> (I haven't checked how feasible this is in the code btw)
> >
> > I think it would be much easier to implement --exclude-dirs.
> >
> > BTW, it will also allow to exclude directories from any partition, not just from
> > root, e.g. to use --exclude dirs this way:
> > part /data --source rootfs --rootfs-dir=core-image-minimal:/home --ondisk sda --fstype=ext4 --label data --align 1024 --exclude-dirs cache --exclude-dirs tmp
> 
> Just to be sure, --exclude-dirs means that the contents of the
> directory are skipped, not the directory itself?
>
Thanks for pointing out to this. I didn't think about it, but after you
pointed out to it I think it makes sense to keep the directory and only skip the
content.

Another way to do it is to skip directory and content and create mount points
mentioned in wks file when generating /etc/fstab. However, in this case
directory permissions and ownership will be lost.

--
Regards,
Ed

