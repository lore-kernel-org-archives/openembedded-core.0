Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5CECE60684
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 07:57:04 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP; 18 Oct 2016 00:57:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,361,1473145200"; d="scan'208";a="21123806"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 18 Oct 2016 00:57:05 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 7A27C6A4006;
	Tue, 18 Oct 2016 00:56:32 -0700 (PDT)
Date: Tue, 18 Oct 2016 10:31:38 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej =?utf-8?B?Qm9yesSZY2tp?= <maciej.borzecki@rndity.com>
Message-ID: <20161018073138.GA17569@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <30a5ef699fb1b575baf95b986a755f509e9e747e.1476706733.git.maciej.borzecki@rndity.com>
	<20161017132234.GA14510@linux.intel.com>
	<CAD4b0_K2KcaZ_pwO0yfJPF8NNzgjm8cYFD-24E3k8_DdUaAO3A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD4b0_K2KcaZ_pwO0yfJPF8NNzgjm8cYFD-24E3k8_DdUaAO3A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: add --reserved-size wks option
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
X-List-Received-Date: Tue, 18 Oct 2016 07:57:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Oct 17, 2016 at 04:46:00PM +0200, Maciej Borzęcki wrote:
> On Mon, Oct 17, 2016 at 3:22 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > Hi Maciej,
> >
> > There is already --size and --extra-space options.
> > Can we get the same or similar result by just using them? Do we really
> > need new option for similar purpose?
> 
> --reserved-size serves a different purpose, it establishes an upper
> bound on the size of a partition during layout. Unlike
> --size/--extra-space does not depend on the size of the filesystem
> image.
> 
> For instance, assume I'm creating an image for SD card/eMMC with a
> fixed partition layout (something simple: boot partition, primary &
> secondary rootfs partitions, some data partition). Because future
> system updates are delivered as filesystem image, I want to make sure
> that there is exactly xxx MBs for my current and future rootfs images
> (regardless of current image size). Neither --size nor --extra-space
> can do that. I could use, say `--size 200 --overhead-factor 1`, but
> this will needlessly create a 200MB rootfs image and if I happen to
> cross the 200MB boundary I will not get an error.
> 
> I had a private patch that added --fixed-size to enforce --size, but
> that would still end up creating filesystem image to fill the whole
> space.
I didn't get the difference between enforcing partition size and below
implementation. Can you elaborate a bit?

> Another workaround we used until now was to create a filesystem image
> manually and use fsimage source plugin. To get a fixed layout with
> rootfs image that may grow/shrink between builds, you still need to
> fiddle with --align (for instance, set it to 215040 to have the
> partition start at 210MB offset).
> 

Thanks for the explanations. I'm almost convinced.

See my comments below.

> >
> >
> > On Mon, Oct 17, 2016 at 03:06:18PM +0200, Maciej Borzecki wrote:
> >> Added new option --reserved-size to wks. The option can be used to
> >> indicate how much space should be reserved for a partition. This is
> >> useful if the disk will be a subject to full filesystem image updates
> >> and puts an upper limit of the size of filesystem images.
> >>
> >> The actual filesystem image may be smaller than the reserved space, thus
> >> leaving some room for growth. If it is larger, an error will be raised.
> >>
> >> Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
> >> ---
> >>  scripts/lib/wic/help.py                | 11 ++++++++++
> >>  scripts/lib/wic/imager/direct.py       |  3 ++-
> >>  scripts/lib/wic/ksparser.py            |  1 +
> >>  scripts/lib/wic/partition.py           |  1 +
> >>  scripts/lib/wic/utils/partitionedfs.py | 37 +++++++++++++++++++++++++---------
> >>  5 files changed, 43 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> >> index e5347ec4b7c900c68fc64351a5293e75de0672b3..1a5c7020ba0cdc5ef2e477a2b14360e09098a896 100644
> >> --- a/scripts/lib/wic/help.py
> >> +++ b/scripts/lib/wic/help.py
> >> @@ -646,6 +646,17 @@ DESCRIPTION
> >>                   not specified, the size is in MB.
> >>                   You do not need this option if you use --source.
> >>
> >> +         --reserved-size: This option specifies that there should be
> >> +                          at least that many bytes reserved for
According to the code if partition size > reserved size wic will throw
an error. This somehow conflicts with 'at least that many bytes' part of the
description in my opinion.

As far as I uderstood your code this parameter specifies hard upper
limit for partition size, right?

> >> +                          the partition during layout. This is useful
> >> +                          when the target disk will be a subject
> >> +                          to full system image updates in the future.
> >> +                          Specifying --reserved-size ensures that
> >> +                          there is extra space in the partition allowing
> >> +                          for future growth of the file system stored
> >> +                          inside. Value format is the same as for
> >> +                          --size option.
> >> +
> >>           --source: This option is a wic-specific option that names the
> >>                     source of the data that will populate the
> >>                     partition.  The most common value for this option
> >> diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
> >> index edf5e5d2214f8e78b6c2a98d7f6cd45fcc0065c4..02e293b9d744b760fcdf17610505dafef3e164ad 100644
> >> --- a/scripts/lib/wic/imager/direct.py
> >> +++ b/scripts/lib/wic/imager/direct.py
> >> @@ -301,7 +301,8 @@ class DirectImageCreator(BaseImageCreator):
> >>                                         no_table=part.no_table,
> >>                                         part_type=part.part_type,
> >>                                         uuid=part.uuid,
> >> -                                       system_id=part.system_id)
> >> +                                       system_id=part.system_id,
> >> +                                       reserved_size=part.reserved_size)
> >>
> >>          if fstab_path:
> >>              shutil.move(fstab_path + ".orig", fstab_path)
> >> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> >> index 0894e2b199a299fbbed272f2e1c95e9d692e3ab1..4118bffdf4337f2d2d393d7e096632cd7aa37402 100644
> >> --- a/scripts/lib/wic/ksparser.py
> >> +++ b/scripts/lib/wic/ksparser.py
> >> @@ -137,6 +137,7 @@ class KickStart():
> >>          part.add_argument('--part-type')
> >>          part.add_argument('--rootfs-dir')
> >>          part.add_argument('--size', type=sizetype, default=0)
> >> +        part.add_argument('--reserved-size', type=sizetype, default=0)
> >>          part.add_argument('--source')
> >>          part.add_argument('--sourceparams')
> >>          part.add_argument('--system-id', type=systemidtype)
> >> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> >> index 90f65a1e3976a5460cd1b265b238168cce22781f..162a3a289de891ccf81437876c1f7a6f3c797b3b 100644
> >> --- a/scripts/lib/wic/partition.py
> >> +++ b/scripts/lib/wic/partition.py
> >> @@ -54,6 +54,7 @@ class Partition():
> >>          self.part_type = args.part_type
> >>          self.rootfs_dir = args.rootfs_dir
> >>          self.size = args.size
> >> +        self.reserved_size = args.reserved_size
> >>          self.source = args.source
> >>          self.sourceparams = args.sourceparams
> >>          self.system_id = args.system_id
> >> diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
> >> index cb03009fc7e3c97305079629ded7d2ff01eba4c4..5d3b1588231459dedf0142f807114736f0bb28ea 100644
> >> --- a/scripts/lib/wic/utils/partitionedfs.py
> >> +++ b/scripts/lib/wic/utils/partitionedfs.py
> >> @@ -91,7 +91,7 @@ class Image():
> >>
> >>      def add_partition(self, size, disk_name, mountpoint, source_file=None, fstype=None,
> >>                        label=None, fsopts=None, boot=False, align=None, no_table=False,
> >> -                      part_type=None, uuid=None, system_id=None):
> >> +                      part_type=None, uuid=None, system_id=None, reserved_size=0):
> >>          """ Add the next partition. Prtitions have to be added in the
> >>          first-to-last order. """
> >>
> >> @@ -99,9 +99,11 @@ class Image():
> >>
> >>          # Converting kB to sectors for parted
> >>          size = size * 1024 // self.sector_size
> >> +        reserved_size = reserved_size * 1024 // self.sector_size
> >>
> >>          part = {'ks_pnum': ks_pnum, # Partition number in the KS file
> >>                  'size': size, # In sectors
> >> +                'reserved_size': reserved_size, # space on disk reserved for partition
> >>                  'mountpoint': mountpoint, # Mount relative to chroot
> >>                  'source_file': source_file, # partition contents
> >>                  'fstype': fstype, # Filesystem type
> >> @@ -192,7 +194,19 @@ class Image():
> >>                      disk['offset'] += align_sectors
> >>
> >>              part['start'] = disk['offset']
> >> -            disk['offset'] += part['size']
> >> +
> >> +            if part['reserved_size']:
> >> +                if part['size'] > part['reserved_size']:
> >> +                    msger.error("Partition %d on disk %s is larger (%s bytes) than its"
> >> +                                " reserved space %s bytes" %
> >> +                                (disk['numpart'], part['disk_name'],
> >> +                                 part['size'] * self.sector_size,
> >> +                                 part['reserved_size'] * self.sector_size))
> >> +                # next partition starts after the space reserved for the
> >> +                # current one
> >> +                disk['offset'] += part['reserved_size']
> >> +            else:
> >> +                disk['offset'] += part['size']
> >>
> >>              part['type'] = 'primary'
> >>              if not part['no_table']:
> >> @@ -207,10 +221,11 @@ class Image():
> >>
> >>              disk['partitions'].append(num)
> >>              msger.debug("Assigned %s to %s%d, sectors range %d-%d size %d "
> >> -                        "sectors (%d bytes)." \
> >> +                        "sectors (%d bytes), reserved %d bytes." \
> >>                              % (part['mountpoint'], part['disk_name'], part['num'],
> >> -                               part['start'], part['start'] + part['size'] - 1,
> >> -                               part['size'], part['size'] * self.sector_size))
> >> +                               part['start'], disk['offset'] - 1,
> >> +                               part['size'], part['size'] * self.sector_size,
> >> +                               part['reserved_size'] * self.sector_size))
This will produce incorrect output about partition size as in reality partition size will
be set to part['reserved_size'].

"reserved 0 bytes" message will be produced if --reserved-size option
is not used. It's a bit confusing as 'reserved' is too generic word. Can
we use 'reserved size' instead?

> >>
> >>          # Once all the partitions have been layed out, we can calculate the
> >>          # minumim disk sizes.
> >> @@ -288,17 +303,21 @@ class Image():
> >>                  # Type for ext2/ext3/ext4/btrfs
> >>                  parted_fs_type = "ext2"
> >>
> >> +            psize = part['size']
> >> +            if part['reserved_size']:
> >> +                psize = part['reserved_size']
> >> +
Here I'm getting confused. How this new parameters differs from --size if it behaves
the same way, i.e. partition size is set to its value. The only
difference I see is that if rootfs size is greater than reserved size
wic will fail to create partition. Would it make sense to name it
--max-size in this case?

> >>              # Boot ROM of OMAP boards require vfat boot partition to have an
> >>              # even number of sectors.
> >>              if part['mountpoint'] == "/boot" and part['fstype'] in ["vfat", "msdos"] \
> >> -               and part['size'] % 2:
> >> -                msger.debug("Substracting one sector from '%s' partition to " \
> >> +               and psize % 2:
> >> +                msger.debug("Subtracting one sector from '%s' partition to " \
> >>                              "get even number of sectors for the partition" % \
> >>                              part['mountpoint'])
> >> -                part['size'] -= 1
> >> +                psize -= 1
> >>
> >>              self.__create_partition(disk['disk'].device, part['type'],
> >> -                                    parted_fs_type, part['start'], part['size'])
> >> +                                    parted_fs_type, part['start'], psize)
> >>
> >>              if part['part_type']:
> >>                  msger.debug("partition %d: set type UID to %s" % \

Can you cover this functionality(and may be other size-related
functionality too) with tests? You can add testcases to existing
oe-selftest wic module.

--
Regards,
Ed

