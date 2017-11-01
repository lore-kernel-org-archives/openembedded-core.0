Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C51AA780BD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 13:49:37 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 01 Nov 2017 06:49:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,329,1505804400"; d="scan'208";a="144671323"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 01 Nov 2017 06:49:38 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 400725803F3;
	Wed,  1 Nov 2017 06:49:37 -0700 (PDT)
Date: Wed, 1 Nov 2017 14:48:08 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-ID: <20171101124808.2gc5nswcombvrcuf@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <123c3e3f-4ba4-43f6-957f-530a69e81712@madrzak.eu>
	<20171031133324.5hdzhtu7kop7um4b@linux.intel.com>
	<CAP71WjxBNTEfCAN18T86fDY9nu=B50Sta69vwEsh85Fi1OPMDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjxBNTEfCAN18T86fDY9nu=B50Sta69vwEsh85Fi1OPMDA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: add 'part-name' argument for naming GPT partitions
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
X-List-Received-Date: Wed, 01 Nov 2017 13:49:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Oct 31, 2017 at 04:08:58PM +0100, Nicolas Dechesne wrote:
> On Tue, Oct 31, 2017 at 2:33 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> >
> > On Mon, Oct 30, 2017 at 08:53:09PM +0100, Artur Mądrzak wrote:
> > > The WIC's 'part' can now give a name for GPT partition in WKS file.
> > > It's similar to '--label', but is naming partitions instead file systems.
> > > It's required by some bootloaders to partitions have specified names.
> > >
> >
> > Thank you for the patch!
> >
> > +1
> 
> Yes, +1 from me as well. The context of this patch is for the Qualcomm
> SoC based board that have *interesting* bootloaders requirements, one
> of them being to look for partition by their names.
> 
> Patchwork complained about the patch, so Artur, please address these
> comments and resend the patch.
> 
> Ed: do you think this can be backported to previous release branches?
> The lack of --part-name on previous releases make WIC unusable for us.
> The backport is not trivial since many changes have happened, but
> Artur has a equivalent patch for morty at least.
> 

Yes, I think it can be backported. It shouldn't be hard to do especially
if there is a patch for morty. Just go ahead and send it for review. It
would be a good first step in this direction.

> 
> >
> >
> > > Signed-off-by: Artur Mądrzak <artur@madrzak.eu>
> > > ---
> > >  scripts/lib/wic/help.py                  |  2 ++
> > >  scripts/lib/wic/ksparser.py              |  1 +
> > >  scripts/lib/wic/partition.py             |  1 +
> > >  scripts/lib/wic/plugins/imager/direct.py | 11 +++++++++++
> > >  4 files changed, 15 insertions(+)
> > >
> > > diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> > > index bd9c62e2e8..2ac45e052e 100644
> > > --- a/scripts/lib/wic/help.py
> > > +++ b/scripts/lib/wic/help.py
> > > @@ -970,6 +970,8 @@ DESCRIPTION
> > >                              This option cannot be used with --fixed-size
> > >                              option.
> > >
> > > +         --part-name: This option is specific to wic. It specifies name for
> > > GPT partitions.
> > > +
> > >           --part-type: This option is specific to wic. It specifies
> > > partition
> > >                        type GUID for GPT partitions.
> > >                        List of partition type GUIDS can be found here:
> > > diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> > > index 99b66eebc5..7850e81d2f 100644
> > > --- a/scripts/lib/wic/ksparser.py
> > > +++ b/scripts/lib/wic/ksparser.py
> > > @@ -144,6 +144,7 @@ class KickStart():
> > >          part.add_argument('--no-table', action='store_true')
> > >          part.add_argument('--ondisk', '--ondrive', dest='disk',
> > > default='sda')
> > >          part.add_argument("--overhead-factor", type=overheadtype)
> > > +        part.add_argument('--part-name')
> > >          part.add_argument('--part-type')
> > >          part.add_argument('--rootfs-dir')
> > >
> > > diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> > > index b623bb9e6d..66e61ba70c 100644
> > > --- a/scripts/lib/wic/partition.py
> > > +++ b/scripts/lib/wic/partition.py
> > > @@ -51,6 +51,7 @@ class Partition():
> > >          self.no_table = args.no_table
> > >          self.num = None
> > >          self.overhead_factor = args.overhead_factor
> > > +        self.part_name = args.part_name
> > >          self.part_type = args.part_type
> > >          self.rootfs_dir = args.rootfs_dir
> > >          self.size = args.size
> > > diff --git a/scripts/lib/wic/plugins/imager/direct.py
> > > b/scripts/lib/wic/plugins/imager/direct.py
> > > index 60317eed22..bdb8385620 100644
> > > --- a/scripts/lib/wic/plugins/imager/direct.py
> > > +++ b/scripts/lib/wic/plugins/imager/direct.py
> > > @@ -366,6 +366,10 @@ class PartitionedImage():
> > >          for num in range(len(self.partitions)):
> > >              part = self.partitions[num]
> > >
> > > +            if self.ptable_format == 'msdos' and part.part_name:
> > > +                raise WicError("setting custom partition name is not " \
> > > +                               "implemented for msdos partitions")
> > > +
> > >              if self.ptable_format == 'msdos' and part.part_type:
> > >                  # The --part-type can also be implemented for MBR
> > > partitions,
> > >                  # in which case it would map to the 1-byte "partition type"
> > > @@ -519,6 +523,13 @@ class PartitionedImage():
> > >              self._create_partition(self.path, part.type,
> > >                                     parted_fs_type, part.start,
> > > part.size_sec)
> > >
> > > +            if part.part_name:
> > > +                logger.debug("partition %d: set name to %s",
> > > +                             part.num, part.part_name)
> > > +                exec_native_cmd("sgdisk --change-name=%d:%s %s" % \
> > > +                                         (part.num, part.part_name,
> > > +                                          self.path), self.native_sysroot)
> > > +
> > >              if part.part_type:
> > >                  logger.debug("partition %d: set type UID to %s",
> > >                               part.num, part.part_type)
> > > --
> > > 2.13.6
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> > --
> > --
> > Regards,
> > Ed
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

--
Regards,
Ed

