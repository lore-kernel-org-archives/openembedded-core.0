Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 69F497390D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 18:21:40 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 20 Apr 2015 11:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,610,1422950400"; d="scan'208";a="558942836"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 20 Apr 2015 11:21:41 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id C05306A408D;
	Mon, 20 Apr 2015 11:21:15 -0700 (PDT)
Date: Mon, 20 Apr 2015 21:21:34 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Message-ID: <20150420182134.GA15567@linux.intel.com>
References: <1429541663-5695-1-git-send-email-adrian.freihofer@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1429541663-5695-1-git-send-email-adrian.freihofer@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: eduard.bartosh@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [master-next][PATCH] wic: Add plugin for single partition disk
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
X-List-Received-Date: Mon, 20 Apr 2015 18:21:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Adrian,

Thank you for the plugin! The implementation looks good to me.
See my comments below.

On Mon, Apr 20, 2015 at 04:54:23PM +0200, Adrian Freihofer wrote:
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
When do you think it would make sense to stop using far partition for /boot ?


> The plugin depends on syslinux-nomtools a user space installer for
> syslinux on ext filesystems.
> Thanks to Robert Yang who implemented syslinux-nomtools and supported
> the implementation of this plugin.
> 

It's not related to this patch may be, but still. Is syslinux-nomtools incompatible
with syslinux? Why not to have just one syslinux?

> Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
> ---
>  scripts/lib/wic/kickstart/__init__.py              |  10 ++
>  .../lib/wic/plugins/source/rootfs_pcbios_ext.py    | 198 +++++++++++++++++++++
>  2 files changed, 208 insertions(+)
>  create mode 100644 scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
> 
> diff --git a/scripts/lib/wic/kickstart/__init__.py b/scripts/lib/wic/kickstart/__init__.py
> index 111723b..eb9def9 100644
> --- a/scripts/lib/wic/kickstart/__init__.py
> +++ b/scripts/lib/wic/kickstart/__init__.py
> @@ -104,6 +104,16 @@ def get_kernel_args(ks, default="ro rd.live.image"):
>          return default
>      return "%s %s" %(default, ks.handler.bootloader.appendLine)
>  
> +def get_kernel_args_console_serial(kargs):
> +    consoles = []
> +    for param in kargs.split():
> +        param_match = re.match("console=(ttyS|ttyUSB)([0-9]+),?([0-9]*)([noe]?)([0-9]?)(r?)", param)
> +        if param_match:
> +            # console name without index, console index, baudrate, parity, number of bits, flow control
> +            consoles.append((param_match.group(1), param_match.group(2), param_match.group(3),
> +                             param_match.group(4), param_match.group(5), param_match.group(6)))
> +    return consoles
> +
>  def get_menu_args(ks, default=""):
>      if not hasattr(ks.handler.bootloader, "menus"):
>          return default
> diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
> new file mode 100644
> index 0000000..a05ddcf
> --- /dev/null
> +++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
> @@ -0,0 +1,198 @@
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
> +# DESCRIPTION
> +# This plugin creates a disk image containing a bootable root partition with
> +# syslinux installed. The filesystem is ext2/3/4, no extra boot partition is
> +# required.
> +#
> +# Example kickstart file:
> +# part / --source rootfs-pcbios-ext --ondisk sda --fstype=ext4 --label rootfs --align 1024
> +# bootloader --source rootfs-pcbios-ext --timeout=0 --append="rootwait rootfstype=ext4"
> +#
> +# The first line generates a root file system including a syslinux.cfg file
> +# The "--source rootfs-pcbios-ext" in the second line triggers the ldlinux.sys
> +# installation into the image.
> +#
> +# AUTHOR
> +# Adrian Freihofer <adrian.freihofer (at] neratec.com>
> +#
> +
> +import os
> +from wic.utils.errors import ImageError
> +from wic import kickstart
> +from wic import msger
> +from wic.utils import runner
> +from wic.pluginbase import SourcePlugin
> +from wic.utils.oe import misc
> +
> +
> +class RootfsPlugin(SourcePlugin):
> +    name = 'rootfs-pcbios-ext'
> +
> +    @staticmethod
> +    def __get_rootfs_dir(rootfs_dir):
> +        if os.path.isdir(rootfs_dir):
> +            return rootfs_dir
> +
> +        bitbake_env_lines = misc.find_bitbake_env_lines(rootfs_dir)
> +        if not bitbake_env_lines:
> +            msg = "Couldn't get bitbake environment, exiting."
> +            msger.error(msg)
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
> +    @classmethod
> +    def do_configure_partition(self, part, source_params, cr, cr_workdir,
> +                               oe_builddir, bootimg_dir, kernel_dir,
> +                               native_sysroot):
> +        """
> +        Called before do_prepare_partition(), creates syslinux config
> +        """
> +        (rootdev, root_part_uuid) = cr._get_boot_config()
> +        options = cr.ks.handler.bootloader.appendLine
> +
> +        syslinux_conf = ""
> +        syslinux_conf += "PROMPT 0\n"
> +
> +        timeout = kickstart.get_timeout(cr.ks)
> +        if not timeout:
> +            timeout = 0
> +        syslinux_conf += "TIMEOUT " + str(timeout) + "\n"
> +        syslinux_conf += "ALLOWOPTIONS 1\n"
> +
> +        # Derive bootloader serial console configuration from kernel parameters
> +        serial_args = kickstart.get_kernel_args_console_serial(options)
> +        try:
> +            if serial_args[0][1] == 'ttyS':
> +                syslinux_conf += "SERIAL " + serial_args[0][2]
> +                try:  # baudrate
> +                    syslinux_conf += serial_args[0][2]
> +                except IndexError:
> +                    pass
> +                try:  # parity
> +                    if serial_args[0][2] != 'n':
> +                        msger.warning("syslinux does not support parity for console")
> +                except IndexError:
> +                    pass
> +                try:  # number of bits
> +                    if serial_args[0][3] != '8':
> +                        msger.warning("syslinux supports 8 bit console configuration only")
> +                except IndexError:
> +                    pass
> +                try:  # flow control
> +                    if serial_args[0][4] != '':
> +                        msger.warning("syslinux console flowcontrol configuration is ignored")
> +                except IndexError:
> +                    pass
> +        except IndexError:
> +            pass

Validation of syslinux console parameters should not be done in plugin code I believe. Please move it to the wic code that other plugins could call it.

> +
> +        syslinux_conf += "\n"
> +        syslinux_conf += "DEFAULT linux\n"
> +        syslinux_conf += "LABEL linux\n"
> +        syslinux_conf += "  KERNEL /boot/bzImage\n"
> +
> +        if cr._ptable_format == 'msdos':
> +            rootstr = rootdev
> +        else:
> +            raise ImageError("Unsupported partition table format found")
> +
> +        syslinux_conf += "  APPEND label=boot root=%s %s\n" % (rootstr, options)
> +
> +        syslinux_cfg = os.path.join(cr.rootfs_dir['ROOTFS_DIR'], "boot", "syslinux.cfg")
> +        msger.debug("Writing syslinux config %s" % syslinux_cfg)
> +        cfg = open(syslinux_cfg, "w")
> +        cfg.write(syslinux_conf)
> +        cfg.close()
> +
> +    @classmethod
> +    def do_prepare_partition(self, part, source_params, cr, cr_workdir,
> +                             oe_builddir, bootimg_dir, kernel_dir,
> +                             krootfs_dir, native_sysroot):
> +        """
> +        Called to do the actual content population for a partition i.e. it
> +        'prepares' the partition to be incorporated into the image.
> +        """
> +        def is_exe(exepath):
> +            return os.path.isfile(exepath) and os.access(exepath, os.X_OK)
> +        
> +        # Make sure parted is available in native sysroot or fail
> +        native_parted = os.path.join(native_sysroot ,"usr/sbin/parted")
> +        if not is_exe(native_parted):
> +            msger.info("building parted-native...")
> +            misc.exec_cmd("bitbake parted-native")
> +        if not is_exe(native_parted):
> +            msger.error("Couldn't find parted (%s), exiting\n" % native_parted)

This is already checked in wic code as parted-native is in the list of requirements for wic: http://www.yoctoproject.org/docs/1.9/dev-manual/dev-manual.html#wic-requirements

> +        
> +        # Make sure syslinux-nomtools is available in native sysroot or fail
> +        native_syslinux_nomtools = os.path.join(native_sysroot ,"usr/bin/syslinux-nomtools")
> +        if not is_exe(native_syslinux_nomtools):
> +            msger.info("building syslinux-native...")
> +            misc.exec_cmd("bitbake syslinux-native")
> +        if not is_exe(native_syslinux_nomtools):
> +            msger.error("Couldn't find syslinux-nomtools (%s), exiting\n" % native_syslinux_nomtools)
> +
> +        if part.rootfs is None:
> +            if not 'ROOTFS_DIR' in krootfs_dir:
> +                msg = "Couldn't find --rootfs-dir, exiting"
> +                msger.error(msg)
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
> +        real_rootfs_dir = self.__get_rootfs_dir(rootfs_dir)
> +
> +        part.set_rootfs(real_rootfs_dir)
> +        part.prepare_rootfs(cr_workdir, oe_builddir, real_rootfs_dir, native_sysroot)
> +
> +        # install syslinux into rootfs partition
> +        syslinux_cmd = "syslinux-nomtools -d /boot -i %s" % part.source_file
> +        misc.exec_native_cmd(syslinux_cmd, native_sysroot)
> +
> +    @classmethod
> +    def do_install_disk(self, disk, disk_name, cr, workdir, oe_builddir,
> +                        bootimg_dir, kernel_dir, native_sysroot):
> +        """
> +        Called after all partitions have been prepared and assembled into a
> +        disk image. In this case, we install the MBR.
> +        """
> +        mbrfile = os.path.join(native_sysroot, "usr/share/syslinux/mbr.bin")
> +        if not os.path.exists(mbrfile):
> +            msger.error("Couldn't find %s. If using the -e option, do you have the right MACHINE set in local.conf? If not, is the bootimg_dir path correct?" % mbrfile)
> +
> +        full_path = disk['disk'].device
> +        msger.debug("Installing MBR on disk %s as %s with size %s bytes" \
> +                    % (disk_name, full_path, disk['min_size']))
> +
> +        rc = runner.show(['dd', 'if=%s' % mbrfile, 'of=%s' % full_path, 'conv=notrunc'])
> +        if rc != 0:
> +            raise ImageError("Unable to set MBR to %s" % full_path)
> +

You may want to fix at least some of pylint warnings:

C:139, 0: Trailing whitespace (trailing-whitespace)
C:141, 0: No space allowed before comma
        native_parted = os.path.join(native_sysroot ,"usr/sbin/parted")
                                                    ^ (bad-whitespace)
C:141, 0: Exactly one space required after comma
        native_parted = os.path.join(native_sysroot ,"usr/sbin/parted")
                                                    ^ (bad-whitespace)
C:147, 0: Trailing whitespace (trailing-whitespace)
C:149, 0: No space allowed before comma
        native_syslinux_nomtools = os.path.join(native_sysroot ,"usr/bin/syslinux-nomtools")
                                                               ^ (bad-whitespace)
C:149, 0: Exactly one space required after comma
        native_syslinux_nomtools = os.path.join(native_sysroot ,"usr/bin/syslinux-nomtools")
                                                               ^ (bad-whitespace)
C:154, 0: Line too long (101/100) (line-too-long)
C:189, 0: Line too long (168/100) (line-too-long)
C: 66, 4: Class method do_configure_partition should have 'cls' as first argument (bad-classmethod-argument)
R: 66, 4: Too many arguments (9/5) (too-many-arguments)
R: 66, 4: Too many local variables (18/15) (too-many-locals)
W: 72,36: Access to a protected member _get_boot_config of a client class (protected-access)
W:116,11: Access to a protected member _ptable_format of a client class (protected-access)
W: 72,18: Unused variable 'root_part_uuid' (unused-variable)
C:130, 4: Class method do_prepare_partition should have 'cls' as first argument (bad-classmethod-argument)
R:130, 4: Too many arguments (10/5) (too-many-arguments)
R:130, 4: Too many local variables (17/15) (too-many-locals)
C:181, 4: Class method do_install_disk should have 'cls' as first argument (bad-classmethod-argument)
R:181, 4: Too many arguments (9/5) (too-many-arguments)
C:195, 8: Invalid variable name "rc" (invalid-name)




--
Regards,
Ed

