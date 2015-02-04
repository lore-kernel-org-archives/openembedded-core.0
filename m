Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2970E65D00
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 18:32:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 04 Feb 2015 10:26:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,519,1418112000"; d="scan'208";a="647355343"
Received: from mtbauma1-mobl1.amr.corp.intel.com (HELO [10.252.136.235])
	([10.252.136.235])
	by orsmga001.jf.intel.com with ESMTP; 04 Feb 2015 10:32:58 -0800
Message-ID: <1423074778.18649.24.camel@picadillo>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Wed, 04 Feb 2015 12:32:58 -0600
In-Reply-To: <1423006826-10627-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1423006826-10627-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: use kB for the partitions size
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
X-List-Received-Date: Wed, 04 Feb 2015 18:33:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-02-04 at 00:40 +0100, Alexandre Belloni wrote:
> Use kB instead of MB for the partition size to get a better granularity.
> 
> This is needed on some SoC (i.mx, omap) where it is necessary to create
> partitions as small as 64kB.
> 
> Keep the backward compatibility by assuming MB when no unit is provided.
> 

Looks fine to me, and a quick test shows expected sizes, etc.

But please do update at least the in-tool help (/lib/image/help.py) with
the new --size options.

Thanks,

Tom

Acked-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Tested-by: Tom Zanussi <tom.zanussi@linux.intel.com>




$ ls -al build
total 65028
drwxr-xr-x. 3 trz trz     4096 Feb  4 11:02 .
drwxrwxr-x. 4 trz trz     4096 Feb  4 11:02 ..
-rw-r--r--. 1 trz trz 24199168 Feb  4 11:02 boot.img
-rw-rw-r--. 1 trz trz 51561472 Feb  4 11:02 directdisk-201502041102-sda.direct
drwxr-xr-x. 3 trz trz     4096 Feb  4 11:02 hdd
-rw-rw-r--. 1 trz trz 25346048 Feb  4 11:02 rootfs_platform.ext3
$ ls -al build.prev/
total 65040
drwxr-xr-x. 3 trz trz     4096 Feb  4 10:48 .
drwxrwxr-x. 4 trz trz     4096 Feb  4 11:02 ..
-rw-r--r--. 1 trz trz 24199168 Feb  4 10:48 boot.img
-rw-rw-r--. 1 trz trz 52429824 Feb  4 10:48 directdisk-201502041048-sda.direct
drwxr-xr-x. 3 trz trz     4096 Feb  4 10:48 hdd
-rw-rw-r--. 1 trz trz 25346048 Feb  4 10:48 rootfs_platform.ext3


> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  .../wic/3rdparty/pykickstart/commands/partition.py |  4 +--
>  scripts/lib/wic/3rdparty/pykickstart/options.py    | 21 ++++++++++++-
>  scripts/lib/wic/kickstart/__init__.py              |  2 +-
>  .../lib/wic/kickstart/custom_commands/partition.py | 36 +++++++++++-----------
>  scripts/lib/wic/plugins/source/bootimg-efi.py      |  2 +-
>  scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  2 +-
>  scripts/lib/wic/utils/partitionedfs.py             |  4 +--
>  7 files changed, 45 insertions(+), 26 deletions(-)
> 
> diff --git a/scripts/lib/wic/3rdparty/pykickstart/commands/partition.py b/scripts/lib/wic/3rdparty/pykickstart/commands/partition.py
> index 56b91aa9d9a4..b564b1a7abb9 100644
> --- a/scripts/lib/wic/3rdparty/pykickstart/commands/partition.py
> +++ b/scripts/lib/wic/3rdparty/pykickstart/commands/partition.py
> @@ -78,7 +78,7 @@ class FC3_PartData(BaseData):
>          if self.recommended:
>              retval += " --recommended"
>          if self.size and self.size != 0:
> -            retval += " --size=%s" % self.size
> +            retval += " --size=%sk" % self.size
>          if hasattr(self, "start") and self.start != 0:
>              retval += " --start=%s" % self.start
>  
> @@ -216,7 +216,7 @@ class FC3_Partition(KickstartCommand):
>                        callback=part_cb, nargs=1, type="string")
>          op.add_option("--recommended", dest="recommended", action="store_true",
>                        default=False)
> -        op.add_option("--size", dest="size", action="store", type="int",
> +        op.add_option("--size", dest="size", action="store", type="size",
>                        nargs=1)
>          op.add_option("--start", dest="start", action="store", type="int",
>                        nargs=1)
> diff --git a/scripts/lib/wic/3rdparty/pykickstart/options.py b/scripts/lib/wic/3rdparty/pykickstart/options.py
> index 341c5d7298b0..7bbe6a85a156 100644
> --- a/scripts/lib/wic/3rdparty/pykickstart/options.py
> +++ b/scripts/lib/wic/3rdparty/pykickstart/options.py
> @@ -143,6 +143,24 @@ def _check_string(option, opt, value):
>      else:
>          return value
>  
> +def _check_size(option, opt, value):
> +    # Former default was MB
> +    if (value.isdigit()):
> +        return int(value) * 1024L
> +
> +    mapping = {"opt": opt, "value": value}
> +    if (not value[0:len(value)-1].isdigit()):
> +        raise OptionValueError(_("Option %(opt)s: invalid size value: %(value)r") % mapping)
> +
> +    size = int(value[0:len(value)-1])
> +    if (value.endswith("k") or value.endswith("K")):
> +        return size
> +    if (value.endswith("M")):
> +        return size * 1024L
> +    if (value.endswith("G")):
> +        return size * 1024L * 1024L
> +    raise OptionValueError(_("Option %(opt)s: invalid size value: %(value)r") % mapping)
> +
>  # Creates a new Option class that supports several new attributes:
>  # - required:  any option with this attribute must be supplied or an exception
>  #              is thrown
> @@ -169,10 +187,11 @@ class KSOption (Option):
>      ACTIONS = Option.ACTIONS + ("map", "map_extend",)
>      STORE_ACTIONS = Option.STORE_ACTIONS + ("map", "map_extend",)
>  
> -    TYPES = Option.TYPES + ("ksboolean", "string")
> +    TYPES = Option.TYPES + ("ksboolean", "string", "size")
>      TYPE_CHECKER = copy(Option.TYPE_CHECKER)
>      TYPE_CHECKER["ksboolean"] = _check_ksboolean
>      TYPE_CHECKER["string"] = _check_string
> +    TYPE_CHECKER["size"] = _check_size
>  
>      def _check_required(self):
>          if self.required and not self.takes_value():
> diff --git a/scripts/lib/wic/kickstart/__init__.py b/scripts/lib/wic/kickstart/__init__.py
> index 600098293aef..1d094e9d5d8b 100644
> --- a/scripts/lib/wic/kickstart/__init__.py
> +++ b/scripts/lib/wic/kickstart/__init__.py
> @@ -77,7 +77,7 @@ def get_image_size(ks, default = None):
>          if p.mountpoint == "/" and p.size:
>              __size = p.size
>      if __size > 0:
> -        return int(__size) * 1024L * 1024L
> +        return int(__size) * 1024L
>      else:
>          return default
>  
> diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
> index 54a494e033b9..7a307065f289 100644
> --- a/scripts/lib/wic/kickstart/custom_commands/partition.py
> +++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
> @@ -99,7 +99,7 @@ class Wic_PartData(Mic_PartData):
>  
>      def get_extra_block_count(self, current_blocks):
>          """
> -        The --size param is reflected in self.size (in MB), and we already
> +        The --size param is reflected in self.size (in kB), and we already
>          have current_blocks (1k) blocks, calculate and return the
>          number of (1k) blocks we need to add to get to --size, 0 if
>          we're already there or beyond.
> @@ -110,7 +110,7 @@ class Wic_PartData(Mic_PartData):
>          if not self.size:
>              return 0
>  
> -        requested_blocks = self.size * 1024
> +        requested_blocks = self.size
>  
>          msger.debug("Requested blocks %d, current_blocks %d" % \
>                      (requested_blocks, current_blocks))
> @@ -171,7 +171,7 @@ class Wic_PartData(Mic_PartData):
>          Handle an already-created partition e.g. xxx.ext3
>          """
>          rootfs = oe_builddir
> -        du_cmd = "du -Lbms %s" % rootfs
> +        du_cmd = "du -Lbks %s" % rootfs
>          out = exec_cmd(du_cmd)
>          rootfs_size = out.split()[0]
>  
> @@ -247,8 +247,8 @@ class Wic_PartData(Mic_PartData):
>              print "rootfs_dir: %s" % rootfs_dir
>              msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details) when creating filesystem from rootfs directory: %s" % (self.fstype, rc, rootfs_dir))
>  
> -        # get the rootfs size in the right units for kickstart (Mb)
> -        du_cmd = "du -Lbms %s" % rootfs
> +        # get the rootfs size in the right units for kickstart (kB)
> +        du_cmd = "du -Lbks %s" % rootfs
>          out = exec_cmd(du_cmd)
>          rootfs_size = out.split()[0]
>  
> @@ -292,8 +292,8 @@ class Wic_PartData(Mic_PartData):
>          if rc:
>              msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details) when creating filesystem from rootfs directory: %s" % (self.fstype, rc, rootfs_dir))
>  
> -        # get the rootfs size in the right units for kickstart (Mb)
> -        du_cmd = "du -Lbms %s" % rootfs
> +        # get the rootfs size in the right units for kickstart (kB)
> +        du_cmd = "du -Lbks %s" % rootfs
>          out = exec_cmd(du_cmd)
>          rootfs_size = out.split()[0]
>  
> @@ -341,8 +341,8 @@ class Wic_PartData(Mic_PartData):
>          chmod_cmd = "chmod 644 %s" % rootfs
>          exec_cmd(chmod_cmd)
>  
> -        # get the rootfs size in the right units for kickstart (Mb)
> -        du_cmd = "du -Lbms %s" % rootfs
> +        # get the rootfs size in the right units for kickstart (kB)
> +        du_cmd = "du -Lbks %s" % rootfs
>          out = exec_cmd(du_cmd)
>          rootfs_size = out.split()[0]
>  
> @@ -361,8 +361,8 @@ class Wic_PartData(Mic_PartData):
>                         (image_rootfs, rootfs)
>          exec_native_cmd(pseudo + squashfs_cmd, native_sysroot)
>  
> -        # get the rootfs size in the right units for kickstart (Mb)
> -        du_cmd = "du -Lbms %s" % rootfs
> +        # get the rootfs size in the right units for kickstart (kB)
> +        du_cmd = "du -Lbks %s" % rootfs
>          out = exec_cmd(du_cmd)
>          rootfs_size = out.split()[0]
>  
> @@ -395,7 +395,7 @@ class Wic_PartData(Mic_PartData):
>          """
>          fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
>  
> -        dd_cmd = "dd if=/dev/zero of=%s bs=1M seek=%d count=0" % \
> +        dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
>              (fs, self.size)
>          exec_cmd(dd_cmd)
>  
> @@ -417,11 +417,11 @@ class Wic_PartData(Mic_PartData):
>          """
>          fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
>  
> -        dd_cmd = "dd if=/dev/zero of=%s bs=1M seek=%d count=0" % \
> +        dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
>              (fs, self.size)
>          exec_cmd(dd_cmd)
>  
> -        mkfs_cmd = "mkfs.%s -b %d %s" % (self.fstype, self.size * 1024, rootfs)
> +        mkfs_cmd = "mkfs.%s -b %d %s" % (self.fstype, self.size, rootfs)
>          (rc, out) = exec_native_cmd(mkfs_cmd, native_sysroot)
>          if rc:
>              msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details)" % (self.fstype, rc))
> @@ -442,7 +442,7 @@ class Wic_PartData(Mic_PartData):
>          """
>          fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
>  
> -        blocks = self.size * 1024
> +        blocks = self.size
>  
>          dosfs_cmd = "mkdosfs -n boot -S 512 -C %s %d" % (fs, blocks)
>          exec_native_cmd(dosfs_cmd, native_sysroot)
> @@ -474,8 +474,8 @@ class Wic_PartData(Mic_PartData):
>  
>          os.rmdir(tmpdir)
>  
> -        # get the rootfs size in the right units for kickstart (Mb)
> -        du_cmd = "du -Lbms %s" % fs
> +        # get the rootfs size in the right units for kickstart (kB)
> +        du_cmd = "du -Lbks %s" % fs
>          out = exec_cmd(du_cmd)
>          fs_size = out.split()[0]
>  
> @@ -490,7 +490,7 @@ class Wic_PartData(Mic_PartData):
>          """
>          fs = "%s/fs.%s" % (cr_workdir, self.fstype)
>  
> -        dd_cmd = "dd if=/dev/zero of=%s bs=1M seek=%d count=0" % \
> +        dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
>              (fs, self.size)
>          exec_cmd(dd_cmd)
>  
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index e4067b6dbf6b..ee57881e90f8 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -228,7 +228,7 @@ class BootimgEFIPlugin(SourcePlugin):
>          chmod_cmd = "chmod 644 %s" % bootimg
>          exec_cmd(chmod_cmd)
>  
> -        du_cmd = "du -Lbms %s" % bootimg
> +        du_cmd = "du -Lbks %s" % bootimg
>          out = exec_cmd(du_cmd)
>          bootimg_size = out.split()[0]
>  
> diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
> index 8a1aca1ad16a..c4786a6e0ea1 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
> @@ -190,7 +190,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
>          chmod_cmd = "chmod 644 %s" % bootimg
>          exec_cmd(chmod_cmd)
>  
> -        du_cmd = "du -Lbms %s" % bootimg
> +        du_cmd = "du -Lbks %s" % bootimg
>          out = exec_cmd(du_cmd)
>          bootimg_size = out.split()[0]
>  
> diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
> index fb95cc790e00..f109e2c227c5 100644
> --- a/scripts/lib/wic/utils/partitionedfs.py
> +++ b/scripts/lib/wic/utils/partitionedfs.py
> @@ -92,8 +92,8 @@ class Image:
>  
>          ks_pnum = len(self.partitions)
>  
> -        # Converting MB to sectors for parted
> -        size = size * 1024 * 1024 / self.sector_size
> +        # Converting kB to sectors for parted
> +        size = size * 1024 / self.sector_size
>  
>          # We still need partition for "/" or non-subvolume
>          if mountpoint == "/" or not fsopts:
> -- 
> 2.1.0
> 



