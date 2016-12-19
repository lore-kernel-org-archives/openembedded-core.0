Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id ABE5C77200
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:59:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2016 03:59:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,373,1477983600"; d="scan'208";a="799975432"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Dec 2016 03:59:23 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 337D46A4080;
	Mon, 19 Dec 2016 03:58:34 -0800 (PST)
Date: Mon, 19 Dec 2016 13:59:09 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Christopher Larson <kergoth@gmail.com>
Message-ID: <20161219115909.GB11680@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1481830959-24831-1-git-send-email-kergoth@gmail.com>
	<20161216144728.GC6398@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20161216144728.GC6398@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: obey the rootfs size from the metadata
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
X-List-Received-Date: Mon, 19 Dec 2016 11:59:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 16, 2016 at 04:47:28PM +0200, Ed Bartosh wrote:
> Hi Christopher,
> 
> Thank you for the patch!
> 
> +1
> 

Would you be willing to add test case(s) for this functionality to wic
selftest module?

> On Thu, Dec 15, 2016 at 12:42:39PM -0700, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> > 
> > When no --size is specified for the rootfs in the .wks, we want to obey the
> > rootfs size from the metadata, otherwise the defined IMAGE_ROOTFS_EXTRA_SPACE
> > and IMAGE_OVERHEAD_FACTOR will not be obeyed. In some cases, this can result
> > in image construction failure, if the size determined by du was insufficient
> > to hold the files without the aforementioned extra space.
> > 
> > This fallback from --size to ROOTFS_SIZE was already implemented when
> > --rootfs-dir is specified in the .wks, but it did not occur otherwise, neither
> > when --rootfs-dir= was passed to `wic create` nor when IMAGE_ROOTFS was used.
> > This made a certain amount of sense, as this fallback logic happened at such
> > a level that it wasn't able to identify which partitions were rootfs
> > partitions otherwise. Rather than doing it at that level, we can do it in
> > prepare_rootfs(), which is run by the rootfs source plugins.
> > 
> > Note that IMAGE_OVERHEAD_FACTOR and a --overhead-factor in the .wks will now
> > both be applied when --size isn't specified in the .wks. A warning is added
> > about this, though a user won't see it unless wic fails or they examine the
> > do_image_wic log.
> > 
> > Fixes [YOCTO #10815]
> > 
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> >  scripts/lib/wic/partition.py | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> > index ac4c836..b191cde 100644
> > --- a/scripts/lib/wic/partition.py
> > +++ b/scripts/lib/wic/partition.py
> > @@ -28,7 +28,7 @@ import os
> >  import tempfile
> >  
> >  from wic.utils.oe.misc import msger, parse_sourceparams
> > -from wic.utils.oe.misc import exec_cmd, exec_native_cmd
> > +from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var
> >  from wic.plugin import pluginmgr
> >  
> >  partition_methods = {
> > @@ -194,6 +194,17 @@ class Partition():
> >              msger.error("File system for partition %s not specified in kickstart, " \
> >                          "use --fstype option" % (self.mountpoint))
> >  
> > +        # Get rootfs size from bitbake variable if it's not set in .ks file
> > +        if not self.size:
> > +            # Bitbake variable ROOTFS_SIZE is calculated in
> > +            # Image._get_rootfs_size method from meta/lib/oe/image.py
> > +            # using IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_ALIGNMENT,
> > +            # IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
> > +            rsize_bb = get_bitbake_var('ROOTFS_SIZE')
> > +            if rsize_bb:
> > +                msger.warning('overhead-factor was specified, but size was not, so bitbake variables will be used for the size. In this case both IMAGE_OVERHEAD_FACTOR and --overhead-factor will be applied')
> > +                self.size = int(round(float(rsize_bb)))
> > +
> >          for prefix in ("ext", "btrfs", "vfat", "squashfs"):
> >              if self.fstype.startswith(prefix):
> >                  method = getattr(self, "prepare_rootfs_" + prefix)
> > -- 
> > 2.8.0
> > 
> 
> -- 
> --
> Regards,
> Ed
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
--
Regards,
Ed

