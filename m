Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F143072491
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 18:25:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 28 Apr 2015 11:25:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,665,1422950400"; d="scan'208";a="717276904"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 28 Apr 2015 11:25:13 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 7D0CC6A408D;
	Tue, 28 Apr 2015 11:24:44 -0700 (PDT)
Date: Tue, 28 Apr 2015 21:25:05 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Message-ID: <20150428182505.GA28994@linux.intel.com>
References: <1430139623-25618-1-git-send-email-adrian.freihofer@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1430139623-25618-1-git-send-email-adrian.freihofer@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: eduard.bartosh@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [master-next][PATCHv3] wic: Add plugin for single partition disk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ed.bartosh@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Apr 2015 18:25:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2015 at 03:00:23PM +0200, Adrian Freihofer wrote:
> The wic plugin creates a disk image containig one ext2/3/4 partition.
> No additional boot partition is required. Syslinux is installed into
> the image. The target device is a legacy BIOS PC.
> 
> Purpose of this plugin:
> Other avaliable plugins create a fat partition for /boot and an ext
> partition for rootfs. Current linux-yocto kernel packages are not
> compatible with this disk layout. The boot partition is not mounted
> by default, hence the kernel is installed into rootfs and not into
> boot partition. A kernel update ends up in a bricked device. The old
> kernel which is still in boot likely does not even boot with updated
> kernel modules from /. Even if the boot partition is mounted during
> the kernel update the update will fail. The kernel package installs
> a symbolic link which is not supported by the fat partition.
> Creating just one ext partition for boot and rootfs solves all issues
> related to package based kernel updates on the device.
> 
> The plugin depends on syslinux-nomtools a user space installer for
> syslinux on ext filesystems.
> Thanks to Robert Yang who implemented syslinux-nomtools and supported
> the implementation of this plugin.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
> ---
>  .../lib/wic/plugins/source/rootfs_pcbios_ext.py    | 182 +++++++++++++++++++++
>  scripts/lib/wic/utils/syslinux.py                  |  58 +++++++
>  2 files changed, 240 insertions(+)
>  create mode 100644 scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
>  create mode 100644 scripts/lib/wic/utils/syslinux.py
> 
> diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
> new file mode 100644
> index 0000000..ebf95ae
> --- /dev/null
> +++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
> @@ -0,0 +1,182 @@
> +# ex:ts=4:sw=4:sts=4:et
> +# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
> +#
> +# This program is free software; you can distribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for mo details.
> +#
> +# You should have received a copy of the GNU General Public License along
> +# with this program; if not, write to the Free Software Foundation, Inc.,
> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +#
> +# AUTHOR
> +# Adrian Freihofer <adrian.freihofer (at] neratec.com>
> +#
> +
> +import os
> +from wic import kickstart
> +from wic import msger
> +from wic.utils import syslinux
> +from wic.utils import runner
> +from wic.utils.oe import misc
> +from wic.utils.errors import ImageError
> +from wic.pluginbase import SourcePlugin
> +
> +
> +# pylint: disable=no-init
> +class RootfsPlugin(SourcePlugin):
> +    """
> +    Create root partition and install syslinux bootloader
> +
> +    This plugin creates a disk image containing a bootable root partition with
> +    syslinux installed. The filesystem is ext2/3/4, no extra boot partition is
> +    required.
> +
> +    Example kickstart file:
> +    part / --source rootfs-pcbios-ext --ondisk sda --fstype=ext4 --label rootfs --align 1024
> +    bootloader --source rootfs-pcbios-ext --timeout=0 --append="rootwait rootfstype=ext4"
> +
> +    The first line generates a root file system including a syslinux.cfg file
> +    The "--source rootfs-pcbios-ext" in the second line triggers the installation
> +    of ldlinux.sys into the image.
> +    """
> +
> +    name = 'rootfs-pcbios-ext'
> +
> +    @staticmethod
> +    def _get_rootfs_dir(rootfs_dir):
> +        """
> +        Find rootfs pseudo dir
> +
> +        If rootfs_dir is a directory consider it as rootfs directory.
> +        Otherwise ask bitbake about the IMAGE_ROOTFS directory.
> +        """
> +        if os.path.isdir(rootfs_dir):
> +            return rootfs_dir
> +
> +        bitbake_env_lines = misc.find_bitbake_env_lines(rootfs_dir)
> +        if not bitbake_env_lines:
> +            msger.error("Couldn't get bitbake environment, exiting.")
> +
> +        image_rootfs_dir = misc.find_artifact(bitbake_env_lines, "IMAGE_ROOTFS")
> +        if not os.path.isdir(image_rootfs_dir):
> +            msg = "No valid artifact IMAGE_ROOTFS from image named"
> +            msg += " %s has been found at %s, exiting.\n" % \
> +                (rootfs_dir, image_rootfs_dir)
> +            msger.error(msg)
> +
> +        return image_rootfs_dir
> +
> +    # pylint: disable=unused-argument
> +    @classmethod
> +    def do_configure_partition(cls, part, source_params, image_creator,
> +                               image_creator_workdir, oe_builddir, bootimg_dir,
> +                               kernel_dir, native_sysroot):
> +        """
> +        Creates syslinux config in rootfs directory
> +
> +        Called before do_prepare_partition()
> +        """
> +        rootdev = image_creator._get_boot_config()[0]
> +        options = image_creator.ks.handler.bootloader.appendLine
> +
> +        syslinux_conf = ""
> +        syslinux_conf += "PROMPT 0\n"
> +
> +        timeout = kickstart.get_timeout(image_creator.ks)
> +        if not timeout:
> +            timeout = 0
> +        syslinux_conf += "TIMEOUT " + str(timeout) + "\n"
> +        syslinux_conf += "ALLOWOPTIONS 1\n"
> +
> +        # Derive SERIAL... line from from kernel boot parameters
> +        syslinux_conf += syslinux.serial_console_form_kargs(options) + "\n"
> +
> +        syslinux_conf += "DEFAULT linux\n"
> +        syslinux_conf += "LABEL linux\n"
> +        syslinux_conf += "  KERNEL /boot/bzImage\n"
> +
> +        if image_creator._ptable_format == 'msdos':
> +            rootstr = rootdev
> +        else:
> +            raise ImageError("Unsupported partition table format found")
> +
> +        syslinux_conf += "  APPEND label=boot root=%s %s\n" % (rootstr, options)
> +
> +        syslinux_cfg = os.path.join(image_creator.rootfs_dir['ROOTFS_DIR'], "boot", "syslinux.cfg")
> +        msger.debug("Writing syslinux config %s" % syslinux_cfg)
> +        with open(syslinux_cfg, "w") as cfg:
> +            cfg.write(syslinux_conf)
> +
> +    @classmethod
> +    def do_prepare_partition(cls, part, source_params, image_creator,
> +                             image_creator_workdir, oe_builddir, bootimg_dir,
> +                             kernel_dir, krootfs_dir, native_sysroot):
> +        """
> +        Creates partition out of rootfs directory
> +
> +        Prepare content for a rootfs partition i.e. create a partition
> +        and fill it from a /rootfs dir.
> +        Install syslinux bootloader into root partition image file
> +        """
> +        def is_exe(exepath):
> +            """Verify exepath is an executable file"""
> +            return os.path.isfile(exepath) and os.access(exepath, os.X_OK)
> +
> +        # Make sure syslinux-nomtools is available in native sysroot or fail
> +        native_syslinux_nomtools = os.path.join(native_sysroot, "usr/bin/syslinux-nomtools")
> +        if not is_exe(native_syslinux_nomtools):
> +            msger.info("building syslinux-native...")
> +            misc.exec_cmd("bitbake syslinux-native")
> +        if not is_exe(native_syslinux_nomtools):
> +            msger.error("Couldn't find syslinux-nomtools (%s), exiting\n" %
> +                        native_syslinux_nomtools)
> +
> +        if part.rootfs is None:
> +            if 'ROOTFS_DIR' not in krootfs_dir:
> +                msger.error("Couldn't find --rootfs-dir, exiting")
> +            rootfs_dir = krootfs_dir['ROOTFS_DIR']
> +        else:
> +            if part.rootfs in krootfs_dir:
> +                rootfs_dir = krootfs_dir[part.rootfs]
> +            elif part.rootfs:
> +                rootfs_dir = part.rootfs
> +            else:
> +                msg = "Couldn't find --rootfs-dir=%s connection"
> +                msg += " or it is not a valid path, exiting"
> +                msger.error(msg % part.rootfs)
> +
> +        real_rootfs_dir = cls._get_rootfs_dir(rootfs_dir)
> +
> +        part.set_rootfs(real_rootfs_dir)
> +        part.prepare_rootfs(image_creator_workdir, oe_builddir, real_rootfs_dir, native_sysroot)
> +
> +        # install syslinux into rootfs partition
> +        syslinux_cmd = "syslinux-nomtools -d /boot -i %s" % part.source_file
> +        misc.exec_native_cmd(syslinux_cmd, native_sysroot)
> +
> +    @classmethod
> +    def do_install_disk(cls, disk, disk_name, image_creator, workdir, oe_builddir,
> +                        bootimg_dir, kernel_dir, native_sysroot):
> +        """
> +        Assemble partitions to disk image
> +
> +        Called after all partitions have been prepared and assembled into a
> +        disk image. In this case, we install the MBR.
> +        """
> +        mbrfile = os.path.join(native_sysroot, "usr/share/syslinux/mbr.bin")
> +        if not os.path.exists(mbrfile):
> +            msger.error("Couldn't find %s. Has syslinux-native been baked?" % mbrfile)
> +
> +        full_path = disk['disk'].device
> +        msger.debug("Installing MBR on disk %s as %s with size %s bytes" \
> +                    % (disk_name, full_path, disk['min_size']))
> +
> +        ret_code = runner.show(['dd', 'if=%s' % mbrfile, 'of=%s' % full_path, 'conv=notrunc'])
> +        if ret_code != 0:
> +            raise ImageError("Unable to set MBR to %s" % full_path)
> diff --git a/scripts/lib/wic/utils/syslinux.py b/scripts/lib/wic/utils/syslinux.py
> new file mode 100644
> index 0000000..aace286
> --- /dev/null
> +++ b/scripts/lib/wic/utils/syslinux.py
> @@ -0,0 +1,58 @@
> +# ex:ts=4:sw=4:sts=4:et
> +# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
> +#
> +# This program is free software; you can redistribute it and/or modify it
> +# under the terms of the GNU General Public License as published by the Free
> +# Software Foundation; version 2 of the License
> +#
> +# This program is distributed in the hope that it will be useful, but
> +# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
> +# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> +# for more details.
> +#
> +# You should have received a copy of the GNU General Public License along
> +# with this program; if not, write to the Free Software Foundation, Inc., 59
> +# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
> +#
> +# AUTHOR
> +# Adrian Freihofer <adrian.freihofer (at] neratec.com>
> +
> +
> +import re
> +from wic import msger
> +
> +
> +def serial_console_form_kargs(kernel_args):
> +    """
> +    Create SERIAL... line from kernel parameters
> +
> +    syslinux needs a line SERIAL port [baudrate [flowcontrol]]
> +    in the syslinux.cfg file. The config line is generated based
> +    on kernel boot parameters. The the parameters of the first
> +    ttyS console are considered for syslinux config.
> +    @param kernel_args kernel command line
> +    @return line for syslinux config file e.g. "SERIAL 0 115200"
> +    """
> +    syslinux_conf = ""
> +    for param in kernel_args.split():
> +        param_match = re.match("console=ttyS([0-9]+),?([0-9]*)([noe]?)([0-9]?)(r?)", param)
> +        if param_match:
> +            syslinux_conf += "SERIAL " + param_match.group(1)
> +            # baudrate
> +            if param_match.group(2):
> +                syslinux_conf += " " + param_match.group(2)
> +            # parity
> +            if param_match.group(3) and param_match.group(3) != 'n':
> +                msger.warning("syslinux does not support parity for console. {} is ignored."
> +                              .format(param_match.group(3)))
> +            # number of bits
> +            if param_match.group(4) and param_match.group(4) != '8':
> +                msger.warning("syslinux supports 8 bit console configuration only. {} is ignored."
> +                              .format(param_match.group(4)))
> +            # flow control
> +            if param_match.group(5) and param_match.group(5) != '':
> +                msger.warning("syslinux console flowcontrol configuration. {} is ignored."
> +                              .format(param_match.group(5)))
> +            break
> +
> +    return syslinux_conf

Acked-by: Ed Bartosh <ed.bartosh@linux.intel.com>

--
Regards,
Ed

