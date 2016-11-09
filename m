Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D23DB6003C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 09:36:36 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP; 09 Nov 2016 01:36:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,465,1473145200"; d="scan'208";a="29187276"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 09 Nov 2016 01:36:37 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 839D56A4006;
	Wed,  9 Nov 2016 01:35:58 -0800 (PST)
Date: Wed, 9 Nov 2016 11:36:27 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej Borzecki <maciej.borzecki@rndity.com>
Message-ID: <20161109093627.GB10823@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1478619682.git.maciej.borzecki@rndity.com>
	<1135a635b723fcf1eb2ce8d2b9f8463a577f6acd.1478619682.git.maciej.borzecki@rndity.com>
MIME-Version: 1.0
In-Reply-To: <1135a635b723fcf1eb2ce8d2b9f8463a577f6acd.1478619682.git.maciej.borzecki@rndity.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] wic: add --fixed-size wks option
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
X-List-Received-Date: Wed, 09 Nov 2016 09:36:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 08, 2016 at 04:56:11PM +0100, Maciej Borzecki wrote:
> Added new option --fixed-size to wks. The option can be used to indicate
> the exact size of a partition. The option cannot be added together with
> --size, in which case an error will be raised. Other options that
> influence automatic partition size (--extra-space, --overhead-factor),
> if specifiec along with --fixed-size, will raise an error.
> 
> If it partition data is larger than the amount of space specified with
> --fixed-size option wic will raise an error.
> 
> Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
> ---
>  scripts/lib/wic/help.py                | 14 ++++--
>  scripts/lib/wic/imager/direct.py       |  2 +-
>  scripts/lib/wic/ksparser.py            | 41 +++++++++++++++--
>  scripts/lib/wic/partition.py           | 83 ++++++++++++++++++++--------------
>  scripts/lib/wic/utils/partitionedfs.py |  2 +-
>  5 files changed, 100 insertions(+), 42 deletions(-)
> 
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index e5347ec4b7c900c68fc64351a5293e75de0672b3..daa11bf489c135627ddfe4cef968e48f8e3ad1d8 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -646,6 +646,12 @@ DESCRIPTION
>                   not specified, the size is in MB.
>                   You do not need this option if you use --source.
>  
> +         --fixed-size: Exact partition size. Value format is the same
> +                       as for --size option. This option cannot be
> +                       specified along with --size. If partition data
> +                       is larger than --fixed-size and error will be
> +                       raised when assembling disk image.
> +
>           --source: This option is a wic-specific option that names the
>                     source of the data that will populate the
>                     partition.  The most common value for this option
> @@ -719,13 +725,15 @@ DESCRIPTION
>                          space after the space filled by the content
>                          of the partition. The final size can go
>                          beyond the size specified by --size.
> -                        By default, 10MB.
> +                        By default, 10MB. This option cannot be used
> +                        with --fixed-size option.
>  
>           --overhead-factor: This option is specific to wic. The
>                              size of the partition is multiplied by
>                              this factor. It has to be greater than or
> -                            equal to 1.
> -                            The default value is 1.3.
> +                            equal to 1. The default value is 1.3.
> +                            This option cannot be used with --fixed-size
> +                            option.
>  
>           --part-type: This option is specific to wic. It specifies partition
>                        type GUID for GPT partitions.
> diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
> index 2bedef08d6450096c786def6f75a9ee53fcd4b3b..c01a1ea538428e36a75ac5b31a822e01901bea6a 100644
> --- a/scripts/lib/wic/imager/direct.py
> +++ b/scripts/lib/wic/imager/direct.py
> @@ -290,7 +290,7 @@ class DirectImageCreator(BaseImageCreator):
>                           self.bootimg_dir, self.kernel_dir, self.native_sysroot)
>  
>  
> -            self.__image.add_partition(int(part.size),
> +            self.__image.add_partition(part.get_size(),
>                                         part.disk,
>                                         part.mountpoint,
>                                         part.source_file,
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 0894e2b199a299fbbed272f2e1c95e9d692e3ab1..62c490274aa92bf82aac304d9323250e3b728d0c 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -113,6 +113,9 @@ def systemidtype(arg):
>  class KickStart():
>      """"Kickstart parser implementation."""
>  
> +    DEFAULT_EXTRA_SPACE = 10*1024
> +    DEFAULT_OVERHEAD_FACTOR = 1.3
> +
>      def __init__(self, confpath):
>  
>          self.partitions = []
> @@ -127,16 +130,24 @@ class KickStart():
>          part.add_argument('mountpoint', nargs='?')
>          part.add_argument('--active', action='store_true')
>          part.add_argument('--align', type=int)
> -        part.add_argument("--extra-space", type=sizetype, default=10*1024)
> +        part.add_argument("--extra-space", type=sizetype)
>          part.add_argument('--fsoptions', dest='fsopts')
>          part.add_argument('--fstype')
>          part.add_argument('--label')
>          part.add_argument('--no-table', action='store_true')
>          part.add_argument('--ondisk', '--ondrive', dest='disk')
> -        part.add_argument("--overhead-factor", type=overheadtype, default=1.3)
> +        part.add_argument("--overhead-factor", type=overheadtype)
>          part.add_argument('--part-type')
>          part.add_argument('--rootfs-dir')
> -        part.add_argument('--size', type=sizetype, default=0)
> +
> +        # --size and --fixed-size cannot be specified together; options
> +        # ----extra-space and --overhead-factor should also raise a parser
> +        # --error, but since nesting mutually exclusive groups does not work,
> +        # ----extra-space/--overhead-factor are handled later
> +        sizeexcl = part.add_mutually_exclusive_group()
> +        sizeexcl.add_argument('--size', type=sizetype, default=0)
> +        sizeexcl.add_argument('--fixed-size', type=sizetype, default=0)
> +
>          part.add_argument('--source')
>          part.add_argument('--sourceparams')
>          part.add_argument('--system-id', type=systemidtype)
> @@ -170,11 +181,33 @@ class KickStart():
>                  lineno += 1
>                  if line and line[0] != '#':
>                      try:
> -                        parsed = parser.parse_args(shlex.split(line))
> +                        line_args = shlex.split(line)
> +                        parsed = parser.parse_args(line_args)
>                      except ArgumentError as err:
>                          raise KickStartError('%s:%d: %s' % \
>                                               (confpath, lineno, err))
>                      if line.startswith('part'):
> +                        # using ArgumentParser one cannot easily tell if option
> +                        # was passed as argument, if said option has a default
> +                        # value; --overhead-factor/--extra-space cannot be used
> +                        # with --fixed-size, so at least detect when these were
> +                        # passed with non-0 values ...
I'd suggest to handle this using argparse mutual exclusion:
https://docs.python.org/2/library/argparse.html#mutual-exclusion

> +                        if parsed.fixed_size:
> +                            if parsed.overhead_factor or parsed.extra_space:
> +                                err = "%s:%d: arguments --overhead-factor and --extra-space not "\
> +                                      "allowed with argument --fixed-size" \
> +                                      % (confpath, lineno)
> +                                raise KickStartError(err)
> +                        else:
> +                            # ... and provide defaults if not using
> +                            # --fixed-size iff given option was not used
> +                            # (again, one cannot tell if option was passed but
> +                            # with value equal to 0)
> +                            if '--overhead-factor' not in line_args:
> +                                parsed.overhead_factor = self.DEFAULT_OVERHEAD_FACTOR
> +                            if '--extra-space' not in line_args:
> +                                parsed.extra_space = self.DEFAULT_EXTRA_SPACE
> +
>                          self.partnum += 1
>                          self.partitions.append(Partition(parsed, self.partnum))
>                      elif line.startswith('include'):
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 24e657592738dc7c5cdff78e3740d7c373021e9d..354d4b44c50c77baa54331e95ce0876c32d09339 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -54,6 +54,7 @@ class Partition():
>          self.part_type = args.part_type
>          self.rootfs_dir = args.rootfs_dir
>          self.size = args.size
> +        self.fixed_size = args.fixed_size
>          self.source = args.source
>          self.sourceparams = args.sourceparams
>          self.system_id = args.system_id
> @@ -87,6 +88,39 @@ class Partition():
>          else:
>              return 0
>  
> +    def get_rootfs_size(self, actual_rootfs_size=0):
> +        """
> +        Calculate the required size of rootfs taking into consideration
> +        --size/--fixed-size flags as well as overhead and extra space, as
> +        specified in kickstart file. Raises an error if the
> +        `actual_rootfs_size` is larger than fixed-size rootfs.
> +
> +        """
> +        if self.fixed_size:
> +            rootfs_size = self.fixed_size
> +            if actual_rootfs_size > rootfs_size:
> +                msger.error("Actual rootfs size (%d kB) is larger than allowed size %d kB" \
> +                            %(actual_rootfs_size, rootfs_size))
> +        else:
> +            extra_blocks = self.get_extra_block_count(actual_rootfs_size)
> +            if extra_blocks < self.extra_space:
> +                extra_blocks = self.extra_space
> +
> +            rootfs_size = actual_rootfs_size + extra_blocks
> +            rootfs_size *= self.overhead_factor
> +
> +            msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
> +                        (extra_blocks, self.mountpoint, rootfs_size))
> +
> +        return rootfs_size
> +
> +    def get_size(self):
> +        """
> +        Obtain partition size taking into consideration --size/--fixed-size
> +        options.
> +        """
> +        return self.fixed_size if self.fixed_size else self.size
> +
>      def prepare(self, creator, cr_workdir, oe_builddir, rootfs_dir,
>                  bootimg_dir, kernel_dir, native_sysroot):
Can you make self.size and self.fixed_size getters as properties(use @property decorator)?
It should make code look more pythonic.

>          """
> @@ -97,9 +131,9 @@ class Partition():
>              self.sourceparams_dict = parse_sourceparams(self.sourceparams)
>  
>          if not self.source:
> -            if not self.size:
> -                msger.error("The %s partition has a size of zero.  Please "
> -                            "specify a non-zero --size for that partition." % \
> +            if not self.size and not self.fixed_size:
> +                msger.error("The %s partition has a size of zero. Please "
> +                            "specify a non-zero --size/--fixed-size for that partition." % \
>                              self.mountpoint)
>              if self.fstype and self.fstype == "swap":
>                  self.prepare_swap_partition(cr_workdir, oe_builddir,
> @@ -146,6 +180,10 @@ class Partition():
>                                                       oe_builddir,
>                                                       bootimg_dir, kernel_dir, rootfs_dir,
>                                                       native_sysroot)
> +        if self.fixed_size and self.size > self.fixed_size:
> +            msger.error("File system image of partition %s is larger (%d kB) than its"\
> +                        "allowed size %d kB" % (self.mountpoint,
> +                                                self.size, self.fixed_size))
>  
>      def prepare_rootfs_from_fs_image(self, cr_workdir, oe_builddir,
>                                       rootfs_dir):
> @@ -211,15 +249,7 @@ class Partition():
>          out = exec_cmd(du_cmd)
>          actual_rootfs_size = int(out.split()[0])
>  
> -        extra_blocks = self.get_extra_block_count(actual_rootfs_size)
> -        if extra_blocks < self.extra_space:
> -            extra_blocks = self.extra_space
> -
> -        rootfs_size = actual_rootfs_size + extra_blocks
> -        rootfs_size *= self.overhead_factor
> -
> -        msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
> -                    (extra_blocks, self.mountpoint, rootfs_size))
> +        rootfs_size = self.get_rootfs_size(actual_rootfs_size)
>  
>          with open(rootfs, 'w') as sparse:
>              os.ftruncate(sparse.fileno(), rootfs_size * 1024)
> @@ -245,15 +275,7 @@ class Partition():
>          out = exec_cmd(du_cmd)
>          actual_rootfs_size = int(out.split()[0])
>  
> -        extra_blocks = self.get_extra_block_count(actual_rootfs_size)
> -        if extra_blocks < self.extra_space:
> -            extra_blocks = self.extra_space
> -
> -        rootfs_size = actual_rootfs_size + extra_blocks
> -        rootfs_size *= self.overhead_factor
> -
> -        msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
> -                    (extra_blocks, self.mountpoint, rootfs_size))
> +        rootfs_size = self.get_rootfs_size(actual_rootfs_size)
>  
>          with open(rootfs, 'w') as sparse:
>              os.ftruncate(sparse.fileno(), rootfs_size * 1024)
> @@ -275,20 +297,13 @@ class Partition():
>          out = exec_cmd(du_cmd)
>          blocks = int(out.split()[0])
>  
> -        extra_blocks = self.get_extra_block_count(blocks)
> -        if extra_blocks < self.extra_space:
> -            extra_blocks = self.extra_space
> -
> -        blocks += extra_blocks
> -
> -        msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
> -                    (extra_blocks, self.mountpoint, blocks))
> +        rootfs_size = self.get_rootfs_size(blocks)
>  
>          label_str = "-n boot"
>          if self.label:
>              label_str = "-n %s" % self.label
>  
> -        dosfs_cmd = "mkdosfs %s -S 512 -C %s %d" % (label_str, rootfs, blocks)
> +        dosfs_cmd = "mkdosfs %s -S 512 -C %s %d" % (label_str, rootfs, rootfs_size)
>          exec_native_cmd(dosfs_cmd, native_sysroot)
>  
>          mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
> @@ -311,8 +326,9 @@ class Partition():
>          """
>          Prepare an empty ext2/3/4 partition.
>          """
> +        size = self.get_size()
>          with open(rootfs, 'w') as sparse:
> -            os.ftruncate(sparse.fileno(), self.size * 1024)
> +            os.ftruncate(sparse.fileno(), size * 1024)
>  
>          extra_imagecmd = "-i 8192"
>  
> @@ -329,8 +345,9 @@ class Partition():
>          """
>          Prepare an empty btrfs partition.
>          """
> +        size = self.get_size()
>          with open(rootfs, 'w') as sparse:
> -            os.ftruncate(sparse.fileno(), self.size * 1024)
> +            os.ftruncate(sparse.fileno(), size * 1024)
>  
>          label_str = ""
>          if self.label:
> @@ -345,7 +362,7 @@ class Partition():
>          """
>          Prepare an empty vfat partition.
>          """
> -        blocks = self.size
> +        blocks = self.get_size()
>  
>          label_str = "-n boot"
>          if self.label:
> diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
> index 9e76487844eebfffc7227d053a65dc9fdab3678b..cfa5f5ce09b764c1c2a9b7a3f7bf7d677a6811c4 100644
> --- a/scripts/lib/wic/utils/partitionedfs.py
> +++ b/scripts/lib/wic/utils/partitionedfs.py
> @@ -209,7 +209,7 @@ class Image():
>              msger.debug("Assigned %s to %s%d, sectors range %d-%d size %d "
>                          "sectors (%d bytes)." \
>                              % (part['mountpoint'], part['disk_name'], part['num'],
> -                               part['start'], part['start'] + part['size'] - 1,
> +                               part['start'], disk['offset'] - 1,
>                                 part['size'], part['size'] * self.sector_size))
>  
>          # Once all the partitions have been layed out, we can calculate the
> -- 
> 2.5.0
> 

-- 
--
Regards,
Ed

