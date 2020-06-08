Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3166.1591657873390989671
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 16:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A085A40C23;
	Mon,  8 Jun 2020 23:11:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tkiJD3zLpRPo; Mon,  8 Jun 2020 23:11:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AB7AD40B78;
	Mon,  8 Jun 2020 23:11:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C86D01731FF; Mon,  8 Jun 2020 19:11:07 -0400 (EDT)
Date: Mon, 8 Jun 2020 19:11:07 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v3] wic: Add --offset argument for partitions
Message-ID: <20200608231107.GT17660@denix.org>
References: <20200511194835.20890-1-JPEWhacker@gmail.com>
 <20200602134205.17838-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200602134205.17838-1-JPEWhacker@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Not sure if it's related to this change, but I've been seeing this error 
across the platforms in master past few days:

WARNING: bootloader config not specified, using defaults

Traceback (most recent call last):
  File "/OE/poky-master-build/sources/poky/scripts/wic", line 540, in <module>
    sys.exit(main(sys.argv[1:]))
  File "/OE/poky-master-build/sources/poky/scripts/wic", line 535, in main
    return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage, subcommands)
  File "/OE/poky-master-build/sources/poky/scripts/lib/wic/help.py", line 83, in invoke_subcommand
    subcmd[0](args, usage)
  File "/OE/poky-master-build/sources/poky/scripts/wic", line 219, in wic_create_subcommand
    engine.wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
  File "/OE/poky-master-build/sources/poky/scripts/lib/wic/engine.py", line 190, in wic_create
    plugin.do_create()
  File "/OE/poky-master-build/sources/poky/scripts/lib/wic/plugins/imager/direct.py", line 86, in do_create
    self.create()
  File "/OE/poky-master-build/sources/poky/scripts/lib/wic/plugins/imager/direct.py", line 179, in create
    self._image.prepare(self)
  File "/OE/poky-master-build/sources/poky/scripts/lib/wic/plugins/imager/direct.py", line 352, in prepare
    part.prepare(imager, imager.workdir, imager.oe_builddir,
  File "/OE/poky-master-build/sources/poky/scripts/lib/wic/partition.py", line 175, in prepare
    plugin.do_prepare_partition(self, srcparams_dict, creator,
  File "/OE/poky-master-build/sources/poky/scripts/lib/wic/plugins/source/bootimg-partition.py", line 193, in do_prepare_partition
    part.prepare_rootfs(cr_workdir, oe_builddir, hdddir,
  File "/OE/poky-master-build/sources/poky/scripts/lib/wic/partition.py", line 238, in prepare_rootfs
    method(rootfs, oe_builddir, rootfs_dir, native_sysroot, pseudo)
  File "/OE/poky-master-build/sources/poky/scripts/lib/wic/partition.py", line 305, in prepare_rootfs_msdos
    rootfs_size = self.get_rootfs_size(blocks)
  File "/OE/poky-master-build/sources/poky/scripts/lib/wic/partition.py", line 100, in get_rootfs_size
    if extra_blocks < self.extra_space:
TypeError: '<' not supported between instances of 'int' and 'function'
WARNING: /OE/poky-master-build/build-CORTEX_1/arago-tmp/work/am335x_evm-poky-linux-gnueabi/core-image-base/1.0-r0/temp/run.do_image_wic.3266:1 exit 1 from 'BUILDDIR="/OE/poky-master-build/build-CORTEX_1" PSEUDO_UNLOAD=1 wic create "$wks" --vars "/OE/poky-master-build/build-CORTEX_1/arago-tmp/sysroots/am335x-evm/imgdata/" -e "core-image-base" -o "$build_wic/"'
ERROR: Execution of '/OE/poky-master-build/build-CORTEX_1/arago-tmp/work/am335x_evm-poky-linux-gnueabi/core-image-base/1.0-r0/temp/run.do_image_wic.3266' failed with exit code 1:

Any clues? Has anyone seen anything like that?

-- 
Denys


On Tue, Jun 02, 2020 at 08:42:05AM -0500, Joshua Watt wrote:
> Add support for an --offset argument when defining a partition. Many
> SoCs require that boot partitions be located at specific offsets. Prior
> to this argument, most WKS files were using the --align attribute to
> specify the location of these fixed partitions but this is not ideal
> because in the event that the partition couldn't be placed in the
> specified location, wic would move it to the next sector with that
> alignment, often preventing the device from booting. Unlike the --align
> argument, wic will fail if a partition cannot be placed at the exact
> offset specified with --offset.
> 
> Changes in V2:
> * Fixed a small typo that prevented test_fixed_size_error from passing
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/wic.py      | 118 ++++++++++++++++++-----
>  scripts/lib/wic/ksparser.py              |  46 +++++----
>  scripts/lib/wic/partition.py             |   1 +
>  scripts/lib/wic/plugins/imager/direct.py |  15 +++
>  4 files changed, 135 insertions(+), 45 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> index c8765e5330..9e7be6168e 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -790,41 +790,50 @@ class Wic2(WicTestCase):
>              tempf.write("part " \
>                       "--source rootfs --ondisk hda --align 4 --fixed-size %d "
>                       "--fstype=ext4\n" % size)
> -        wksname = os.path.splitext(os.path.basename(wkspath))[0]
>  
> -        return wkspath, wksname
> +        return wkspath
>  
> -    def test_fixed_size(self):
> -        """
> -        Test creation of a simple image with partition size controlled through
> -        --fixed-size flag
> -        """
> -        wkspath, wksname = Wic2._make_fixed_size_wks(200)
> +    def _get_wic_partitions(self, wkspath, native_sysroot=None, ignore_status=False):
> +        p = runCmd("wic create %s -e core-image-minimal -o %s" % (wkspath, self.resultdir),
> +                   ignore_status=ignore_status)
> +
> +        if p.status:
> +            return (p, None)
> +
> +        wksname = os.path.splitext(os.path.basename(wkspath))[0]
>  
> -        runCmd("wic create %s -e core-image-minimal -o %s" \
> -                                   % (wkspath, self.resultdir))
> -        os.remove(wkspath)
>          wicout = glob(self.resultdir + "%s-*direct" % wksname)
> -        self.assertEqual(1, len(wicout))
> +
> +        if not wicout:
> +            return (p, None)
>  
>          wicimg = wicout[0]
>  
> -        native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
> +        if not native_sysroot:
> +            native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
>  
>          # verify partition size with wic
> -        res = runCmd("parted -m %s unit mib p 2>/dev/null" % wicimg,
> +        res = runCmd("parted -m %s unit kib p 2>/dev/null" % wicimg,
>                       native_sysroot=native_sysroot)
>  
>          # parse parted output which looks like this:
>          # BYT;\n
>          # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
>          # 1:0.00MiB:200MiB:200MiB:ext4::;\n
> -        partlns = res.output.splitlines()[2:]
> +        return (p, res.output.splitlines()[2:])
>  
> -        self.assertEqual(1, len(partlns),
> -                         msg="Partition list '%s'" % res.output)
> -        self.assertEqual("1:0.00MiB:200MiB:200MiB:ext4::;", partlns[0],
> -                         msg="Partition list '%s'" % res.output)
> +    def test_fixed_size(self):
> +        """
> +        Test creation of a simple image with partition size controlled through
> +        --fixed-size flag
> +        """
> +        wkspath = Wic2._make_fixed_size_wks(200)
> +        _, partlns = self._get_wic_partitions(wkspath)
> +        os.remove(wkspath)
> +
> +        self.assertEqual(partlns, [
> +                        "1:4.00kiB:204804kiB:204800kiB:ext4::;",
> +                        ])
>  
>      def test_fixed_size_error(self):
>          """
> @@ -832,13 +841,72 @@ class Wic2(WicTestCase):
>          --fixed-size flag. The size of partition is intentionally set to 1MiB
>          in order to trigger an error in wic.
>          """
> -        wkspath, wksname = Wic2._make_fixed_size_wks(1)
> -
> -        self.assertEqual(1, runCmd("wic create %s -e core-image-minimal -o %s" \
> -                                   % (wkspath, self.resultdir), ignore_status=True).status)
> +        wkspath = Wic2._make_fixed_size_wks(1)
> +        p, _ = self._get_wic_partitions(wkspath, ignore_status=True)
>          os.remove(wkspath)
> -        wicout = glob(self.resultdir + "%s-*direct" % wksname)
> -        self.assertEqual(0, len(wicout))
> +
> +        self.assertNotEqual(p.status, 0, "wic exited successfully when an error was expected:\n%s" % p.output)
> +
> +    def test_offset(self):
> +        native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
> +
> +        with NamedTemporaryFile("w", suffix=".wks") as tempf:
> +            # Test that partitions are placed at the correct offsets, default KB
> +            tempf.write("bootloader --ptable gpt\n" \
> +                        "part /    --source rootfs --ondisk hda --offset 32     --fixed-size 100M --fstype=ext4\n" \
> +                        "part /bar                 --ondisk hda --offset 102432 --fixed-size 100M --fstype=ext4\n")
> +            tempf.flush()
> +
> +            _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
> +            self.assertEqual(partlns, [
> +                "1:32.0kiB:102432kiB:102400kiB:ext4:primary:;",
> +                "2:102432kiB:204832kiB:102400kiB:ext4:primary:;",
> +                ])
> +
> +        with NamedTemporaryFile("w", suffix=".wks") as tempf:
> +            # Test that partitions are placed at the correct offsets, same with explicit KB
> +            tempf.write("bootloader --ptable gpt\n" \
> +                        "part /    --source rootfs --ondisk hda --offset 32K     --fixed-size 100M --fstype=ext4\n" \
> +                        "part /bar                 --ondisk hda --offset 102432K --fixed-size 100M --fstype=ext4\n")
> +            tempf.flush()
> +
> +            _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
> +            self.assertEqual(partlns, [
> +                "1:32.0kiB:102432kiB:102400kiB:ext4:primary:;",
> +                "2:102432kiB:204832kiB:102400kiB:ext4:primary:;",
> +                ])
> +
> +        with NamedTemporaryFile("w", suffix=".wks") as tempf:
> +            # Test that partitions are placed at the correct offsets using MB
> +            tempf.write("bootloader --ptable gpt\n" \
> +                        "part /    --source rootfs --ondisk hda --offset 32K  --fixed-size 100M --fstype=ext4\n" \
> +                        "part /bar                 --ondisk hda --offset 101M --fixed-size 100M --fstype=ext4\n")
> +            tempf.flush()
> +
> +            _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
> +            self.assertEqual(partlns, [
> +                "1:32.0kiB:102432kiB:102400kiB:ext4:primary:;",
> +                "2:103424kiB:205824kiB:102400kiB:ext4:primary:;",
> +                ])
> +
> +        with NamedTemporaryFile("w", suffix=".wks") as tempf:
> +            # Test that image creation fails if the partitions would overlap
> +            tempf.write("bootloader --ptable gpt\n" \
> +                        "part /    --source rootfs --ondisk hda --offset 32     --fixed-size 100M --fstype=ext4\n" \
> +                        "part /bar                 --ondisk hda --offset 102431 --fixed-size 100M --fstype=ext4\n")
> +            tempf.flush()
> +
> +            p, _ = self._get_wic_partitions(tempf.name, ignore_status=True)
> +            self.assertNotEqual(p.status, 0, "wic exited successfully when an error was expected:\n%s" % p.output)
> +
> +        with NamedTemporaryFile("w", suffix=".wks") as tempf:
> +            # Test that partitions are not allowed to overlap with the booloader
> +            tempf.write("bootloader --ptable gpt\n" \
> +                        "part /    --source rootfs --ondisk hda --offset 8 --fixed-size 100M --fstype=ext4\n")
> +            tempf.flush()
> +
> +            p, _ = self._get_wic_partitions(tempf.name, ignore_status=True)
> +            self.assertNotEqual(p.status, 0, "wic exited successfully when an error was expected:\n%s" % p.output)
>  
>      @only_for_arch(['i586', 'i686', 'x86_64'])
>      def test_rawcopy_plugin_qemu(self):
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index b8befe78e3..05ae292ef5 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -51,26 +51,31 @@ class KickStartParser(ArgumentParser):
>      def error(self, message):
>          raise ArgumentError(None, message)
>  
> -def sizetype(arg):
> -    """
> -    Custom type for ArgumentParser
> -    Converts size string in <num>[K|k|M|G] format into the integer value
> -    """
> -    if arg.isdigit():
> -        return int(arg) * 1024
> +def sizetype(default):
> +    def f(arg):
> +        """
> +        Custom type for ArgumentParser
> +        Converts size string in <num>[K|k|M|G] format into the integer value
> +        """
> +        try:
> +            suffix = default
> +            size = int(arg)
> +        except ValueError:
> +            try:
> +                suffix = arg[-1:]
> +                size = int(arg[:-1])
> +            except ValueError:
> +                raise ArgumentTypeError("Invalid size: %r" % arg)
> +
> +        if suffix == "k" or suffix == "K":
> +            return size
> +        if suffix == "M":
> +            return size * 1024
> +        if suffix == "G":
> +            return size * 1024 * 1024
>  
> -    if not arg[:-1].isdigit():
>          raise ArgumentTypeError("Invalid size: %r" % arg)
> -
> -    size = int(arg[:-1])
> -    if arg.endswith("k") or arg.endswith("K"):
> -        return size
> -    if arg.endswith("M"):
> -        return size * 1024
> -    if arg.endswith("G"):
> -        return size * 1024 * 1024
> -
> -    raise ArgumentTypeError("Invalid size: %r" % arg)
> +    return f
>  
>  def overheadtype(arg):
>      """
> @@ -136,6 +141,7 @@ class KickStart():
>          part.add_argument('mountpoint', nargs='?')
>          part.add_argument('--active', action='store_true')
>          part.add_argument('--align', type=int)
> +        part.add_argument('--offset', type=sizetype("K"))
>          part.add_argument('--exclude-path', nargs='+')
>          part.add_argument('--include-path', nargs='+', action='append')
>          part.add_argument('--change-directory')
> @@ -161,8 +167,8 @@ class KickStart():
>          # --error, but since nesting mutually exclusive groups does not work,
>          # ----extra-space/--overhead-factor are handled later
>          sizeexcl = part.add_mutually_exclusive_group()
> -        sizeexcl.add_argument('--size', type=sizetype, default=0)
> -        sizeexcl.add_argument('--fixed-size', type=sizetype, default=0)
> +        sizeexcl.add_argument('--size', type=sizetype("M"), default=0)
> +        sizeexcl.add_argument('--fixed-size', type=sizetype("M"), default=0)
>  
>          part.add_argument('--source')
>          part.add_argument('--sourceparams')
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 7d9dd616a6..85eb15c8b8 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -40,6 +40,7 @@ class Partition():
>          self.mountpoint = args.mountpoint
>          self.no_table = args.no_table
>          self.num = None
> +        self.offset = args.offset
>          self.overhead_factor = args.overhead_factor
>          self.part_name = args.part_name
>          self.part_type = args.part_type
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index 2d06c242b6..1f65a7afe5 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -428,6 +428,21 @@ class PartitionedImage():
>                      # increase the offset so we actually start the partition on right alignment
>                      self.offset += align_sectors
>  
> +            if part.offset is not None:
> +                offset = (part.offset * 1024) // self.sector_size
> +
> +                if offset * self.sector_size != part.offset * 1024:
> +                    raise WicError("Could not place %s%s at offset %dK with sector size %d" % (part.disk, self.numpart, part.offset, self.sector_size))
> +
> +                delta = offset - self.offset
> +                if delta < 0:
> +                    raise WicError("Could not place %s%s at offset %dK: next free sector is %d (delta: %d)" % (part.disk, self.numpart, part.offset, offset, delta))
> +
> +                logger.debug("Skipping %d sectors to place %s%s at offset %dK",
> +                             delta, part.disk, self.numpart, part.offset)
> +
> +                self.offset = offset
> +
>              part.start = self.offset
>              self.offset += part.size_sec
>  
> -- 
> 2.26.2
> 

> 

