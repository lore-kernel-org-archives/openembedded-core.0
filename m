Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 53C5A782F0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 12:33:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Nov 2017 04:32:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,364,1505804400"; d="scan'208";a="1241438566"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 08 Nov 2017 04:32:57 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id C95425804B9;
	Wed,  8 Nov 2017 04:32:41 -0800 (PST)
Date: Wed, 8 Nov 2017 13:20:15 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20171108112015.cmpqa4qyx7zze3ou@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
	<20171010210149.GE12015@bill-the-cat>
	<20171020131505.GG12015@bill-the-cat>
	<20171103125150.GA32663@bill-the-cat>
	<20171106100829.nqhna6hugyqe636k@linux.intel.com>
	<CAP9ODKr4+R_ggGvJiVR+wj4iPqQdndzY-vL6s9Y42ZJy=X857w@mail.gmail.com>
	<20171106124423.GG32663@bill-the-cat>
	<20171107081135.sqfjuwqw22tz46xw@linux.intel.com>
	<20171107145457.GJ32663@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20171107145457.GJ32663@bill-the-cat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wic: When using --use-uuid make sure that we update the fstab with PARTUUID
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
X-List-Received-Date: Wed, 08 Nov 2017 12:33:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 07, 2017 at 09:54:57AM -0500, Tom Rini wrote:
> On Tue, Nov 07, 2017 at 10:11:35AM +0200, Ed Bartosh wrote:
> > On Mon, Nov 06, 2017 at 07:44:23AM -0500, Tom Rini wrote:
> > > On Mon, Nov 06, 2017 at 09:36:20AM -0200, Otavio Salvador wrote:
> > > > On Mon, Nov 6, 2017 at 8:08 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > > > > On Fri, Nov 03, 2017 at 08:51:50AM -0400, Tom Rini wrote:
> > > > >> On Fri, Oct 20, 2017 at 09:15:05AM -0400, Tom Rini wrote:
> > > > >> > On Tue, Oct 10, 2017 at 05:01:49PM -0400, Tom Rini wrote:
> > > > >> > > On Thu, Sep 21, 2017 at 01:46:16PM -0400, Tom Rini wrote:
> > > > >> > > > When we have been told to use the UUID we should also update the fstab
> > > > >> > > > to make use of PARTUUID instead of hard-coding the device in question.
> > > > >> > > > This will make the resulting image much more portable.
> > > > >> > > >
> > > > >> > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > > >> > > > ---
> > > > >> > > >  scripts/lib/wic/plugins/imager/direct.py | 9 ++++++---
> > > > >> > > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > > > >> > >
> > > > >> > > Where we did we end up with this?  Ed pointed out that you can tell wic
> > > > >> > > to use a specific UUID, so reproducible images are not a problem.  And
> > > > >> > > making images that are readily portable is why other distros use
> > > > >> > > UUID/LABEL and not device names as much as possible.  I personally enjoy
> > > > >> > > being able to put an image on uSD for minnow and have it work :)
> > > > >> > > Thanks!
> > > > >> >
> > > > >> > ping?
> > > > >>
> > > > >> I was just reminded about the real problems this solves (swap isn't
> > > > >> /dev/sda3, boot is being excessively slow), so, ping?
> > > > >>
> > > > >
> > > > > I'm generally ok with the patchset. The only thing I'm thinking of is if busybox mount
> > > > > supports PARTUUID syntax in fstab. Can you check this, please?
> > > > 
> > > > It does.
> > > 
> > > It doesn't, you need util-linux for a mount that figures these out (or,
> > > it did when I wrote the patch set).
> 
> Let me correct myself here.  I think what threw me off for a moment
> (since I hadn't picked these patches up in a while) was that busybox
> mount might handle PARTUUID, but busybox swapon/off doesn't.  But that's
> not quite the point, either.
> 

Just checked it out with core-image-minimal:

root@qemux86-64:~# grep UUID /etc/fstab
PARTUUID=452e020d-01	/boot	vfat	defaults	0	0
PARTUUID=452e020d-03	/mnt	ext4	defaults	0	0
root@qemux86-64:~# mount |grep mnt
root@qemux86-64:~# mount /mnt
mount: mounting PARTUUID=452e020d-03 on /mnt failed: No such file or
directory


It could be that busybox can be configured to do this, but at least current
oe-core busybox doesn't understand PARTUUID syntax in fstab.

> > This practically means that this patch makes it impossible to use
> > --use-uuid for busybox-powered images. This is quite a big regression
> > from my point of view. We need to make this feature optional then.
> 
> How does it change anything at all for that case?  Today there's cases
> where you would want to in some cases use PARTUUID, via --use-uuid, but
> you can't.  --use-uuid is only valid for the root device as the kernel
> handles parsing PARTUUID and our fstab only ever has /dev/root listed,
> and all other entires in the table, even when we say --use-uuid, do not
> use the UUID but instead use the device name.  Today, we only pass
> --use-uuid in, in that case.
> 
> What 1/2 allows for is passing in --use-uuid for any partition and
> having it be enforced.  There's no canned wks file changes made at all.
> 
> What 2/2 does is update the systemd canned wks (where you will not be
> able to have busybox swapon/off, you're already forced into util-linux
> for utils) to make use of --use-uuid.  I would strongly encourage this
> to be applied as well as it makes systemd-based images much more useful
> and does not change anything about busybox-only images.  It also allows
> for external wks files to use UUIDs when they want to.
> 

This makes sense to me. The patchset doesn't introduce regressions to
the current functionality. It would be nice to at least try to make it
working with busybox-powered images though.

If we can't do that for one or another reason we should at least mention
it in the documentation and wic help. Please, include this into the
patch.

> > >  That's why 2/2 only updates the
> > > systemd canned wks as that _will_ have full mount.  But please note that
> > > you can already make a wks file that doesn't work with busybox mount by
> > > using the --use-uuid flag for non-root partitions :)
> >
> > What's the point of using --use-uuid for non-root partitions? I thought
> > it only makes sense for root as it triggers update of kernel command
> > line.
> 
> For the same reasons you want to use PARTUUID for the kernel.  You do
> not know that you're going to be "sda".  You might be "vda" or "mmcblk"
> or something else.  As a specific example, having "sda3" for swap in the
> systemd wks file, but your actual device being something else, means
> that you spend 90s during start-up for systemd trying very hard and
> being mad that sda3 cannot be swapon'd (it will have swapon'd mmcblk0p3
> already, automatically).
> 

My question was about the current functionaily, i.e. without your patch.
With your patch using --use-uuid for non-root partitions started to make
sense.

P.S. there is a bugzilla item for this:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=11525
please, don't hesitate to comment there.

--
Regards,
Ed

