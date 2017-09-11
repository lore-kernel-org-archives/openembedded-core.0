Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3C87778152
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 13:42:35 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 11 Sep 2017 06:42:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,378,1500966000"; d="scan'208";a="310321417"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 11 Sep 2017 06:42:37 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 0920B5803A7;
	Mon, 11 Sep 2017 06:42:35 -0700 (PDT)
Date: Mon, 11 Sep 2017 16:41:50 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20170911134150.6jpsypaj4dgjv67t@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170908173303.29634-1-enrico.scholz@sigma-chemnitz.de>
	<20170908173303.29634-4-enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <20170908173303.29634-4-enrico.scholz@sigma-chemnitz.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: Enrico Scholz <enrico.scholz@ensc.de>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 11 Sep 2017 13:42:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 08, 2017 at 07:33:03PM +0200, Enrico Scholz wrote:
> From: Enrico Scholz <enrico.scholz@ensc.de>
> 
> The --extra-space and --overhead option did not had an effect to squashfs
> partitions.  Although squashfs is read-only, it can be useful to allocate
> more space for the on-disk partition to avoid repartitioning of the whole
> disk when a new (and larger) squashfs image is written on later updates.
> 

Is it possible to just use --size or --fixed-size in .wks to allocate
partition of certain size?

> Patch calls get_rootfs_size() *after* creating the image and truncates
> it then.
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@ensc.de>
> ---
>  scripts/lib/wic/partition.py | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index b623bb9..da651f8 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -195,6 +195,17 @@ class Partition():
>                             "larger (%d kB) than its allowed size %d kB" %
>                             (self.mountpoint, self.size, self.fixed_size))
>  
> +    def __extend_rootfs_image(self, rootfs):

Do we really need to mangle name of this method?
Please, consider reading this for further details:
http://python.net/~goodger/projects/pycon/2007/idiomatic/handout.html#naming

As this function is not going to be used anywhere I'd just use this code
in prepare_rootfs_squashfs. It would be less generic, but much more
readable and understandable.

> +        """Enlarges the rootfs so that it fulfills size/overhead-factor
> +        constraints"""
> +
> +        sz = (os.stat(rootfs).st_size + 1023) // 1024
> +        pad_sz = self.get_rootfs_size(sz)
> +
> +        if pad_sz > sz:
> +            with open(rootfs, 'a') as f:
> +                os.ftruncate(f.fileno(), pad_sz * 1024)
> +
>      def prepare_rootfs(self, cr_workdir, oe_builddir, rootfs_dir,
>                         native_sysroot):
>          """
> @@ -338,6 +349,8 @@ class Partition():
>                         (rootfs_dir, rootfs, extraopts)
>          exec_native_cmd(squashfs_cmd, native_sysroot, pseudo=pseudo)
>  
> +        self.__extend_rootfs_image(rootfs)
> +
>      def prepare_empty_partition_ext(self, rootfs, oe_builddir,
>                                      native_sysroot):
>          """

--
Regards,
Ed

