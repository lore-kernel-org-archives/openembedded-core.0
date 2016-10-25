Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD03719A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 08:33:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 25 Oct 2016 01:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,545,1473145200"; d="scan'208";a="1075324093"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 25 Oct 2016 01:33:30 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 776916A4080;
	Tue, 25 Oct 2016 01:32:55 -0700 (PDT)
Date: Tue, 25 Oct 2016 10:56:13 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Saul Wold <saul.wold@intel.com>
Message-ID: <20161025075613.GA22683@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1477317281-19518-1-git-send-email-ed.bartosh@linux.intel.com>
	<1477330480.6169.3.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1477330480.6169.3.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: benjamin.esquivel@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [wic][PATCH] systemd-bootdisk.wks: use PARTUUID
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
X-List-Received-Date: Tue, 25 Oct 2016 08:33:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Oct 24, 2016 at 10:34:40AM -0700, Saul Wold wrote:
> On Mon, 2016-10-24 at 16:54 +0300, Ed Bartosh wrote:
> > Root device name in systemd-bootdisk.wks is 'sda'. This can cause
> > images, produced using this wks to refuse booting if real device
> > name is not 'sda'. For example, when booting MinnowBoard MAX from
> > MicroSD card the boot process stucks with this message on the boot
> > console output: Waiting for root device /dev/sda2...
> > This happens because real device name of MicroSD card on this device
> > is mmcblk1.
> > 
> > Used --use-uuid option for root partition. This should make
> > wic to put partiion UUID instead of device name into kernel command
> > line.
> > 
> > [YOCTO #10485]
> > 
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > ---
> >  scripts/lib/wic/canned-wks/systemd-bootdisk.wks | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
> > b/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
> > index b900023..4bd9d6a 100644
> > --- a/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
> > +++ b/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
> > @@ -4,7 +4,7 @@
> >  
> >  part /boot --source bootimg-efi --sourceparams="loader=systemd-boot" 
> > --ondisk sda --label msdos --active --align 1024
> >  
> > -part / --source rootfs --ondisk sda --fstype=ext4 --label platform
> > --align 1024
> > +part / --source rootfs --ondisk sda --fstype=ext4 --label platform
> > --align 1024 --use-uuid
> >  
>  part swap --ondisk sda --size 44 --label swap1 --fstype=swap
> >  
> I understand the --use-uuid for the partition labeling, but how does it
> affect everything marked as ondisk sda?  Or is ondisk ignored with use-
> uuid?

--use-uuid uses PARTUUID to specify root device in kernel command line
instead of /dev/sdaX. In this sense yes, sda is ignored.

However, disk name(sda) is also used to group partitions to one disk image.
Theoretically wic can produce several images if more than one disk name
is used in .wks file.

For swap position sda is still used, which can make swap partitions not
functional on the devices with different disk names. This needs to be fixed
by using PARTUUID in fstab for swap partitions. For this to work in poky images
busybox swapon should support PARTUUID syntax, which I'm not entirely sure it does.

--
Regards,
Ed

