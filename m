Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id BDB72605F1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 17:39:26 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 619CE3D9; Thu,  5 Feb 2015 18:39:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 1BA17300;
	Thu,  5 Feb 2015 18:39:26 +0100 (CET)
Date: Thu, 5 Feb 2015 18:39:24 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Message-ID: <20150205173924.GF4443@piout.net>
References: <1423090996-14918-1-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
In-Reply-To: <1423090996-14918-1-git-send-email-alexandre.belloni@free-electrons.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: allow creation of partitions not in table
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
X-List-Received-Date: Thu, 05 Feb 2015 17:39:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I found one remaining bug in that patch, I'll send v2 soon.

On 05/02/2015 at 00:03:16 +0100, Alexandre Belloni wrote :
> For some architectures it is necessary to reserve space on disk without
> it being present in the partition table.
> 
> For example, u-boot on i.mx is placed at an offset of 1kB on the sdcard.
> While it would be possible to create a partition at that offset and
> place u-boot there, it would then be necessary to update the default
> u-boot environment to use partition 2 on the mmc instead of partition 1.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  scripts/lib/image/help.py                            |  6 ++++++
>  scripts/lib/wic/imager/direct.py                     |  1 +
>  .../lib/wic/kickstart/custom_commands/partition.py   |  6 ++++++
>  scripts/lib/wic/utils/partitionedfs.py               | 20 +++++++++++++++-----
>  4 files changed, 28 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
> index 0d8a6adfaa71..aab0b609afd5 100644
> --- a/scripts/lib/image/help.py
> +++ b/scripts/lib/image/help.py
> @@ -737,6 +737,12 @@ DESCRIPTION
>                                to start a partition on an x KBytes
>                                boundary.
>  
> +         --no-table: This option is specific to wic. Space will be
> +                     reserved for the partition and it will be
> +                     populated but it will not be added to the
> +                     partition table. It may be useful for
> +                     bootloaders.
> +
>      * bootloader
>  
>        This command allows the user to specify various bootloader
> diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
> index b1dc3e96f456..c39405feb74a 100644
> --- a/scripts/lib/wic/imager/direct.py
> +++ b/scripts/lib/wic/imager/direct.py
> @@ -262,6 +262,7 @@ class DirectImageCreator(BaseImageCreator):
>                                         fsopts = p.fsopts,
>                                         boot = p.active,
>                                         align = p.align,
> +                                       no_table = p.no_table,
>                                         part_type = p.part_type)
>  
>          self.__image.layout_partitions(self._ptable_format)
> diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
> index 7a307065f289..9be6b0457b48 100644
> --- a/scripts/lib/wic/kickstart/custom_commands/partition.py
> +++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
> @@ -49,6 +49,7 @@ class Wic_PartData(Mic_PartData):
>          self.source = kwargs.get("source", None)
>          self.sourceparams = kwargs.get("sourceparams", None)
>          self.rootfs = kwargs.get("rootfs-dir", None)
> +        self.no_table = kwargs.get("no-table", False)
>          self.source_file = ""
>          self.size = 0
>  
> @@ -61,6 +62,8 @@ class Wic_PartData(Mic_PartData):
>                  retval += " --sourceparams=%s" % self.sourceparams
>              if self.rootfs:
>                  retval += " --rootfs-dir=%s" % self.rootfs
> +        if self.no_table:
> +            retval += " --no-table"
>  
>          return retval
>  
> @@ -521,4 +524,7 @@ class Wic_Partition(Mic_Partition):
>          # use specified rootfs path to fill the partition
>          op.add_option("--rootfs-dir", type="string", action="store",
>                        dest="rootfs", default=None)
> +        # wether to add the partition in the partition table
> +        op.add_option("--no-table", dest="no_table", action="store_true",
> +                      default=False)
>          return op
> diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
> index f109e2c227c5..745558b090cb 100644
> --- a/scripts/lib/wic/utils/partitionedfs.py
> +++ b/scripts/lib/wic/utils/partitionedfs.py
> @@ -61,6 +61,7 @@ class Image:
>          self.disks[disk_name] = \
>                  { 'disk': None,     # Disk object
>                    'numpart': 0,     # Number of allocate partitions
> +                  'realpart': 0,    # Number of partitions in the partition table
>                    'partitions': [], # Indexes to self.partitions
>                    'offset': 0,      # Offset of next partition (in sectors)
>                    # Minimum required disk size to fit all partitions (in bytes)
> @@ -85,7 +86,7 @@ class Image:
>          self.__add_disk(part['disk_name'])
>  
>      def add_partition(self, size, disk_name, mountpoint, source_file = None, fstype = None,
> -                      label=None, fsopts = None, boot = False, align = None,
> +                      label=None, fsopts = None, boot = False, align = None, no_table=False,
>                        part_type = None):
>          """ Add the next partition. Prtitions have to be added in the
>          first-to-last order. """
> @@ -109,6 +110,7 @@ class Image:
>                       'num': None, # Partition number
>                       'boot': boot, # Bootable flag
>                       'align': align, # Partition alignment
> +                     'no_table' : no_table, # Partition does not appear in partition table
>                       'part_type' : part_type } # Partition type
>  
>              self.__add_partition(part)
> @@ -147,6 +149,8 @@ class Image:
>              # Get the disk where the partition is located
>              d = self.disks[p['disk_name']]
>              d['numpart'] += 1
> +            if not p['no_table']:
> +                d['realpart'] += 1
>              d['ptable_format'] = ptable_format
>  
>              if d['numpart'] == 1:
> @@ -182,10 +186,13 @@ class Image:
>              d['offset'] += p['size']
>  
>              p['type'] = 'primary'
> -            p['num'] = d['numpart']
> +            if not p['no_table']:
> +                p['num'] = d['realpart']
> +            else:
> +                p['num'] = 0
>  
>              if d['ptable_format'] == "msdos":
> -                if d['numpart'] > 2:
> +                if d['realpart'] > 2:
>                      # Every logical partition requires an additional sector for
>                      # the EBR, so steal the last sector from the end of each
>                      # partition starting from the 3rd one for the EBR. This
> @@ -193,9 +200,9 @@ class Image:
>                      # correctly.
>                      p['size'] -= 1
>  
> -                if d['numpart'] > 3:
> +                if d['realpart'] > 3:
>                      p['type'] = 'logical'
> -                    p['num'] = d['numpart'] + 1
> +                    p['num'] = d['realpart'] + 1
>  
>              d['partitions'].append(n)
>              msger.debug("Assigned %s to %s%d, sectors range %d-%d size %d "
> @@ -257,6 +264,9 @@ class Image:
>          msger.debug("Creating partitions")
>  
>          for p in self.partitions:
> +            if p['num'] == 0:
> +                continue
> +
>              d = self.disks[p['disk_name']]
>              if d['ptable_format'] == "msdos" and p['num'] == 5:
>                  # The last sector of the 3rd partition was reserved for the EBR
> -- 
> 2.1.0
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

