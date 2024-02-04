Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28953C48286
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 14:17:39 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.39103.1707056255637862202
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 06:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UQscZfhx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CAF3C0005;
	Sun,  4 Feb 2024 14:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707056254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qu0hSbGQ/JtiHWWprBRrQTVhGwhPsrfFHYRe5+DqtVk=;
	b=UQscZfhxU8mA0D3LK/WXLsmj2h8w9gtVdXjdY7GqbU8Q4JLns8WyGVMki786cp1l6cMFLX
	ZSbSDWr55xBc+iz/sm24rsUmbLu99043wuu/6Jc22eGcI3wg3ytKtgEynJUW+dujFeOnp2
	dPLOqV/wKxbnKrANWU5DNabqZkWVroCMlU59TL0nTn3FR3VYF/sYbptxWYk5RKy92hmAGR
	OC/zx9vUEFO66DZvVUVQKNQEUO6UEe96C4CdrdZt7CCXr50RaSmmr7ECyYkyyAxO0glS3i
	n/UV3Uwo+eeZeVcXMyV7uo3ksXyK8c0A7+U2lxkorbJh3Gm0egosJXF7eUIoZw==
Date: Sun, 4 Feb 2024 15:17:33 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: davide.cardillo@seco.com
Cc: openembedded-core@lists.openembedded.org,
	Tobias Poganiuch <tobias.poganiuch@seco.com>,
	Andrea Da Col <andrea.dacol@seco.com>,
	Daniel Rinaldi <daniel.rinaldi@seco.com>
Subject: Re: [OE-core] wic: Configurable addressing of GPT main table
Message-ID: <202402041417331dd1118c@mail.local>
References: <20240119121414.43990-1-davide.cardillo@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240119121414.43990-1-davide.cardillo@seco.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 14:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194890

Hello Davide,

This doesn't apply on master, can you rebase?

On 19/01/2024 13:14:14+0100, Davide Cardillo via lists.openembedded.org wrote:
> Issue:
> the usage of a gpt table with i.MX processor is not compatible by default.
> This is due to a memory conflict: the main partition table is placed into
> the same memory space used to flash the header of the U-Boot. This last
> can not be moved since the ROM code of the i.MX6 starts to read to that
> fixed address (0x400).
> This problem can be solved using a feature of the GPT partition table for
> witch the main table can be moved to a desired memory area.
> The WIC library present in poky manages the GPT table through some
> standard Linux commands (gdisk and sgdisk) which ones have already the
> opportunity to perform this task.
> This patch introduces this feature with the addition of some wic's options,
> used also in wks file.
> 
> New partition placement behavior:
> Since now all partitions are placed after the gpt table presents into the
> first 1KB of memory (including both the gpt header at the first byte of
> memory and the main partition table staring at 0x400).
> Now the main gpt table can be placed in other address spaces and a partition
> can be placed also before the gpt table. Recap:
> - by default, all partitions are placed sequentially, one after the other.
> The first partition implicitly starts after the GPT partition table.
> - adding a flag to the item of a partition into the wks file, the partition
> can be placed, starting from a fixed memory offset (neglecting the memory
> space occupied by the GPT table).
> Combining the moving of the main partition table and the absolute (not yet
> relative) positioning of a partition, now it is possible to place one or more
> ���partitions before the GPT table.
> 
> New flags:
> - main-ptable-offset (size in KB): to add as property of the bootloader item.
> Specifies the main partition table location in KB.
> - fixed-align (boolean): to add as property of a partition. Specifies that the
> partition must to placed with absolute offset, used in conjunction with --align
> property
> 
> Example:
> setting used for a wic for an i.MX6 processor, where the main parttion table is
> placed with absolute offset of 4MB
> 
> bootloader --ptable gpt --main-ptable-offset 4096K
> part / --source rawcopy --sourceparams="file=u-boot.imx" --ondisk mmcblk --align 1 --size 1M --no-table --fixed-align
> 
> Test environment:
> This patch is a part of Edgehog OS (https://git.seco.com/edgehog) a
> custom Yocto distribution by SECO SpA (www.seco.com), used on multiple
> architectures (both ARM and x86).
> This solution is widely used by all SECO customers who use a hardware
> solution based on NXP i.MX6 processors.
> 
> Signed-off-by: Davide Cardillo <davide.cardillo@seco.com>
> Reviewed-by: Tobias Poganiuch <tobias.poganiuch@seco.com>
> Tested-by: Andrea Da Col <andrea.dacol@seco.com>
> Tested-by: Daniel Rinaldi <daniel.rinaldi@seco.com>
> ---
>  scripts/lib/wic/ksparser.py              |   2 +
>  scripts/lib/wic/partition.py             |   1 +
>  scripts/lib/wic/plugins/imager/direct.py | 102 +++++++++++++++++++++--
>  3 files changed, 97 insertions(+), 8 deletions(-)
> 
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 0df9eb0d05..45db2eaa5d 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -148,6 +148,7 @@ class KickStart():
>          part = subparsers.add_parser('part')
>          part.add_argument('mountpoint', nargs='?')
>          part.add_argument('--active', action='store_true')
> +        part.add_argument('--fixed-align', action='store_true')
>          part.add_argument('--align', type=int)
>          part.add_argument('--offset', type=sizetype("K", True))
>          part.add_argument('--exclude-path', nargs='+')
> @@ -194,6 +195,7 @@ class KickStart():
>                                  default='msdos')
>          bootloader.add_argument('--timeout', type=int)
>          bootloader.add_argument('--source')
> +        bootloader.add_argument('--main-ptable-offset', type=sizetype("K"), default=0)
>  
>          include = subparsers.add_parser('include')
>          include.add_argument('path', type=cannedpathtype)
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 5275da6ed3..1bd2b457cd 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -26,6 +26,7 @@ class Partition():
>          self.args = args
>          self.active = args.active
>          self.align = args.align
> +        self.fixed_align = args.fixed_align
>          self.disk = args.disk
>          self.device = None
>          self.extra_space = args.extra_space
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index 165fc2979f..38ceb0d504 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -16,6 +16,7 @@ import random
>  import shutil
>  import tempfile
>  import uuid
> +import operator
>  
>  from time import strftime
>  
> @@ -66,6 +67,7 @@ class DirectPlugin(ImagerPlugin):
>          self.workdir = self.setup_workdir(options.workdir)
>          self._image = None
>          self.ptable_format = self.ks.bootloader.ptable
> +        self.main_ptable_offset = self.ks.bootloader.main_ptable_offset
>          self.parts = self.ks.partitions
>  
>          # as a convenience, set source to the boot partition source
> @@ -77,6 +79,7 @@ class DirectPlugin(ImagerPlugin):
>  
>          image_path = self._full_path(self.workdir, self.parts[0].disk, "direct")
>          self._image = PartitionedImage(image_path, self.ptable_format,
> +                                       self.main_ptable_offset,
>                                         self.parts, self.native_sysroot,
>                                         options.extra_space)
>  
> @@ -294,15 +297,27 @@ GPT_OVERHEAD = 34
>  # Size of a sector in bytes
>  SECTOR_SIZE = 512
>  
> +class memoryRegion():
> +    def __init__(self):
> +        self.start_sector = 1
> +        self.end_sector = 1
> +        self.part_num = 0
> +
> +    def __init__(self, part_num, start_sec, end_sec):
> +        self.part_num = part_num
> +        self.start_sector = start_sec
> +        self.end_sector = end_sec
> +
>  class PartitionedImage():
>      """
>      Partitioned image in a file.
>      """
>  
> -    def __init__(self, path, ptable_format, partitions, native_sysroot=None, extra_space=0):
> +    def __init__(self, path, ptable_format, main_ptable_offset, partitions, native_sysroot=None, extra_space=0):
>          self.path = path  # Path to the image file
>          self.numpart = 0  # Number of allocated partitions
>          self.realpart = 0 # Number of partitions in the partition table
> +        self.fixedalign_part = 0 # Number of partitions with absolute alignment
>          self.primary_part_num = 0  # Number of primary partitions (msdos)
>          self.extendedpart = 0      # Create extended partition before this logical partition (msdos)
>          self.extended_size_sec = 0 # Size of exteded partition (msdos)
> @@ -311,11 +326,13 @@ class PartitionedImage():
>          self.min_size = 0 # Minimum required disk size to fit
>                            # all partitions (in bytes)
>          self.ptable_format = ptable_format  # Partition table format
> +        self.main_ptable_offset = main_ptable_offset # for GPT table, offset
>          # Disk system identifier
>          self.identifier = random.SystemRandom().randint(1, 0xffffffff)
>  
>          self.partitions = partitions
>          self.partimages = []
> +        self.used_memory_region = []
>          # Size of a sector used in calculations
>          self.sector_size = SECTOR_SIZE
>          self.native_sysroot = native_sysroot
> @@ -368,6 +385,30 @@ class PartitionedImage():
>              # Converting kB to sectors for parted
>              part.size_sec = part.disk_size * 1024 // self.sector_size
>  
> +    def _add_busy_region(self, part_num, start_sec, end_sec):
> +        self.used_memory_region.append(memoryRegion(part_num, start_sec, end_sec))
> +        self.used_memory_region = sorted(self.used_memory_region, key=operator.attrgetter('start_sector'))
> +
> +    def _print_busy_region_list(self):
> +        list = "Busy memory region (in sector)\n"
> +        list += "\tpart#\tstart\tEnd\n"
> +        for num in range(len(self.used_memory_region)):
> +            list +="\t%s\t%s\t%s\n" % (self.used_memory_region[num].part_num, \
> +                self.used_memory_region[num].start_sector, self.used_memory_region[num].end_sector)
> +        logger.debug(list)
> +
> +    def _check_memory_region(self, start_sec, end_sec ):
> +        """ Check if the specified region is already flagges as used. Returns
> +        zero if not used, 1 otherwise"""
> +        for num in range(len(self.used_memory_region)):
> +            region = self.used_memory_region[num]
> +            if ( ( region.start_sector < start_sec and start_sec < region.end_sector) or \
> +                    ( region.start_sector < end_sec and end_sec < region.end_sector) ):
> +                return 1
> +            if ( start_sec < region.start_sector and end_sec > region.end_sector ):
> +                return 1
> +        return 0
> +
>      def layout_partitions(self):
>          """ Layout the partitions, meaning calculate the position of every
>          partition on the disk. The 'ptable_format' parameter defines the
> @@ -379,6 +420,35 @@ class PartitionedImage():
>          # partitions not listed in the table are not included.
>          num_real_partitions = len([p for p in self.partitions if not p.no_table])
>  
> +        # The partitions flagged as fixed alignment partition are placed into image
> +        # before the others. Instead, relative-aligned partitions are placed in a
> +        # serialized fashion, with control of the intersection of memory areas.
> +        # The base address of the relative-aligned partitions is, as before,
> +        # the maximum address accupied by the partition table
> +
> +        # Flag as used the momoery required for partition table
> +        self._add_busy_region(-1, 0, MBR_OVERHEAD)
> +        if self.ptable_format == "gpt":
> +            offset = self.main_ptable_offset * 1024 // self.sector_size
> +            self._add_busy_region(-1, offset, offset + GPT_OVERHEAD)
> +
> +        # Search all partition with fixed position into the image
> +        for num in range(len(self.partitions)):
> +            part = self.partitions[num]
> +            if not part.fixed_align:
> +                continue
> +            if not part.no_table:
> +                raise WicError("A partition with fixed alignment must have no_table flag set")
> +
> +            start_sector = (part.align * 1024 // self.sector_size)
> +            end_sector = start_sector + part.size_sec - 1
> +            if self._check_memory_region(start_sector, end_sector) == 1:
> +                self._print_busy_region_list()
> +                raise WicError("A partition wants to use an already used memory region (sectors %d - %d)" \
> +                    % (start_sector, end_sector))
> +            self._add_busy_region(num, start_sector, end_sector)
> +            part.start = start_sector
> +
>          # Go through partitions in the order they are added in .ks file
>          for num in range(len(self.partitions)):
>              part = self.partitions[num]
> @@ -403,7 +473,7 @@ class PartitionedImage():
>                  if self.ptable_format == "msdos":
>                      overhead = MBR_OVERHEAD
>                  elif self.ptable_format == "gpt":
> -                    overhead = GPT_OVERHEAD
> +                    overhead = (self.main_ptable_offset * 1024 // self.sector_size) + GPT_OVERHEAD
>  
>                  # Skip one sector required for the partitioning scheme overhead
>                  self.offset += overhead
> @@ -418,7 +488,7 @@ class PartitionedImage():
>                      self.offset += 2
>  
>              align_sectors = 0
> -            if part.align:
> +            if not part.fixed_align and part.align:
>                  # If not first partition and we do have alignment set we need
>                  # to align the partition.
>                  # FIXME: This leaves a empty spaces to the disk. To fill the
> @@ -440,7 +510,7 @@ class PartitionedImage():
>                      # increase the offset so we actually start the partition on right alignment
>                      self.offset += align_sectors
>  
> -            if part.offset is not None:
> +            if not part.fixed_align and part.offset is not None:
>                  offset = part.offset // self.sector_size
>  
>                  if offset * self.sector_size != part.offset:
> @@ -455,14 +525,20 @@ class PartitionedImage():
>  
>                  self.offset = offset
>  
> -            part.start = self.offset
> -            self.offset += part.size_sec
> -
>              if not part.no_table:
>                  part.num = self.realpart
>              else:
>                  part.num = 0
>  
> +            if not part.fixed_align:
> +                part.start = self.offset
> +                self.offset += part.size_sec
> +                if self._check_memory_region(part.start, self.offset) == 1:
> +                    self._print_busy_region_list()
> +                    raise WicError("A partition wants to use an already used memory region (sectors %d - %d)" \
> +                        % (part.start, self.offset))
> +                self._add_busy_region(part.num, part.start, self.offset)
> +
>              if self.ptable_format == "msdos" and not part.no_table:
>                  if part.type == 'logical':
>                      self.logical_part_cnt += 1
> @@ -483,11 +559,13 @@ class PartitionedImage():
>                           part.num, part.start, self.offset - 1, part.size_sec,
>                           part.size_sec * self.sector_size)
>  
> +        self._print_busy_region_list()
> +
>          # Once all the partitions have been layed out, we can calculate the
>          # minumim disk size
>          self.min_size = self.offset
>          if self.ptable_format == "gpt":
> -            self.min_size += GPT_OVERHEAD
> +            self.min_size += (self.main_ptable_offset * 1024 // self.sector_size) + GPT_OVERHEAD
>  
>          self.min_size *= self.sector_size
>          self.min_size += self.extra_space
> @@ -607,6 +685,14 @@ class PartitionedImage():
>                                  (self.path, part.num, part.system_id),
>                                  self.native_sysroot)
>  
> +        if self.ptable_format == "gpt" and self.main_ptable_offset > 0:
> +            main_ptable_sectors = self.main_ptable_offset * 1024 // self.sector_size
> +            logger.debug("Move the main GPT partition table forward by %s sector(s)", main_ptable_sectors)
> +            cmd = "sgdisk -j %d %s" % (main_ptable_sectors, self.path)
> +            #cmd = "(echo -e 'x'; echo -e 'j' ; echo -e '%d'; echo -e 'w'; echo -e 'Y') | gdisk %s" % (main_ptable_sectors, self.path)
> +            exec_native_cmd(cmd, self.native_sysroot)
> +
> +
>      def cleanup(self):
>          pass
>  
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194038): https://lists.openembedded.org/g/openembedded-core/message/194038
> Mute This Topic: https://lists.openembedded.org/mt/103828314/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

