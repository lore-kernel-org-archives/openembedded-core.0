Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5644360770
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 09:24:04 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 09 Nov 2016 01:24:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,465,1473145200"; d="scan'208";a="29104107"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 09 Nov 2016 01:24:05 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 3BB2A6A4006;
	Wed,  9 Nov 2016 01:23:27 -0800 (PST)
Date: Wed, 9 Nov 2016 11:23:31 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej Borzecki <maciej.borzecki@rndity.com>
Message-ID: <20161109092331.GA10823@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1478619682.git.maciej.borzecki@rndity.com>
	<927e5e94d6d20caf9b59e8e57895742f9ebebff8.1478619682.git.maciej.borzecki@rndity.com>
MIME-Version: 1.0
In-Reply-To: <927e5e94d6d20caf9b59e8e57895742f9ebebff8.1478619682.git.maciej.borzecki@rndity.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] wic: use partition size when creating empty partition files
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
X-List-Received-Date: Wed, 09 Nov 2016 09:24:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 08, 2016 at 04:56:08PM +0100, Maciej Borzecki wrote:
> It seems that prepare_empty_partition_ext() and
> prepare_empty_partition_btrfs() got broken in commit
> c8669749e37fe865c197c98d5671d9de176ff4dd, thus one could observe the
> following backtrace:
> 
> Backtrace:
>   File "<snip>/poky/scripts/lib/wic/plugins/imager/direct_plugin.py", line 93, in do_create
>     creator.create()
>   File "<snip>/poky/scripts/lib/wic/imager/baseimager.py", line 159, in create
>     self._create()
>   File "<snip>/poky/scripts/lib/wic/imager/direct.py", line 290, in _create
>     self.bootimg_dir, self.kernel_dir, self.native_sysroot)
>   File "<snip>/poky/scripts/lib/wic/partition.py", line 146, in prepare
>     method(rootfs, oe_builddir, native_sysroot)
>   File "<snip>/poky/scripts/lib/wic/partition.py", line 325, in prepare_empty_partition_ext
>     os.ftruncate(sparse.fileno(), rootfs_size * 1024)
> NameError: name 'rootfs_size' is not defined
> 
> Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
> ---
>  scripts/lib/wic/partition.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 4b8d769437120adadb5dba2f3919d4eb96141292..8adc698240c8e3bd9f4118663a5d7a167e0bb4a4 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -308,7 +308,7 @@ class Partition():
>          Prepare an empty ext2/3/4 partition.
>          """
>          with open(rootfs, 'w') as sparse:
> -            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
> +            os.ftruncate(sparse.fileno(), self.size * 1024)
>  
>          extra_imagecmd = "-i 8192"
>  
> @@ -326,7 +326,7 @@ class Partition():
>          Prepare an empty btrfs partition.
>          """
>          with open(rootfs, 'w') as sparse:
> -            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
> +            os.ftruncate(sparse.fileno(), self.size * 1024)
>  
>          label_str = ""
>          if self.label:

Thank you for the fix. Sorry for breaking this. I thought I
double-checked and all tests were passing :(


--
Regards,
Ed

