Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD2C78266
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 08:53:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Sep 2017 01:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,382,1500966000"; d="scan'208";a="899409050"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Sep 2017 01:53:50 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 93E7C5803DF;
	Tue, 12 Sep 2017 01:53:49 -0700 (PDT)
Date: Tue, 12 Sep 2017 11:53:01 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20170912085301.rfsiwojqn2nr6md5@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170908173303.29634-1-enrico.scholz@sigma-chemnitz.de>
	<20170908173303.29634-4-enrico.scholz@sigma-chemnitz.de>
	<20170911134150.6jpsypaj4dgjv67t@linux.intel.com>
	<lyzia1fi13.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <lyzia1fi13.fsf@ensc-virt.intern.sigma-chemnitz.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] wic: apply --extra-space + --overhead to squashfs
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
X-List-Received-Date: Tue, 12 Sep 2017 08:53:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 11, 2017 at 04:04:40PM +0200, Enrico Scholz wrote:
> Ed Bartosh <ed.bartosh@linux.intel.com> writes:
> 
> >> The --extra-space and --overhead option did not had an effect to squashfs
> >> partitions.  Although squashfs is read-only, it can be useful to allocate
> >> more space for the on-disk partition to avoid repartitioning of the whole
> >> disk when a new (and larger) squashfs image is written on later updates.
> >
> > Is it possible to just use --size or --fixed-size in .wks to allocate
> > partition of certain size?
> 
> --fixed-size works with this patch (tested); --size should work.

Sorry for not being clear. Why do we need this if we can use --size to
explicity specify partition size?

--extra-space and --overhead have the same meaning as
IMAGE_ROOTFS_EXTRA_SPACE and IMAGE_OVERHEAD_SIZE variables. From my
point of view their purpose is to allocate additional space on the file
system. This doesn't make sense for squashfs. That's the reason those
options are not used for squashfs. Using them to implicitly make bigger
partition is a questionable and possible confusing approach.


> 
> >> +    def __extend_rootfs_image(self, rootfs):
> >
> > Do we really need to mangle name of this method?
> 
> ok; I will make it _extend_rootfs_image
> 
> 
> > As this function is not going to be used anywhere I'd just use this
> > code in prepare_rootfs_squashfs. It would be less generic, but much
> > more readable and understandable.
> 
> I would keep it as is.  It is a non trivial function which is reusable.
> Perhaps, somebody adds CRAMFS or another file system which does not
> support extending its size.
> 

I personally find this much more understandable and logical:
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -338,6 +338,14 @@ class Partition():
                        (rootfs_dir, rootfs, extraopts)
         exec_native_cmd(squashfs_cmd, native_sysroot, pseudo=pseudo)
 
+        # Enlarges the image to make bigger partition
+        sz = (os.stat(rootfs).st_size + 1023) // 1024
+        pad_sz = self.get_rootfs_size(sz)
+
+        if pad_sz > sz:
+            with open(rootfs, 'a') as fimage:
+                  fimage.truncate(pad_sz * 1024)
+
     def prepare_empty_partition_ext(self, rootfs, oe_builddir,
                                     native_sysroot):

Then introducing a method that will be called for all supported
filesystems except squashfs without any effect.

> partition.py is full of redundant code (look for all the "du" calls or
> generally at the beginning of the prepare_rootfs_*() methods) where
> probably somebody thought that it is not going to be used anywhere else
> ;)
Feel free to send a patch then.
I'd not consider it a good excuse for the above new method though :)

--
Regards,
Ed

