Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3086E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 21:48:05 +0000 (UTC)
Received: by wizk4 with SMTP id k4so155607198wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 14:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding;
	bh=6ZNjnhhHNgqdhFPnIsoT2ZfDZOQIaS23kzkyooHuRnA=;
	b=RPvyskw70iI/5CL1CWgIwR9m42eFDSE1ocuTTNHq4UFxqBzCRpeNr6zf32tkCPXyjl
	s2C4BR0bZJH0+Aiml/eqieDNjNCMRScXmBvEPh0WcfOzP8/ifT1xzT6uKsjrDf/Oi8K/
	MG0zEARm4kPMIm5i8hAPLvN86hfmRrfcJpvewpRGfp36h2THeBm09sI24OTkCMPWF92m
	lHbq4o0qKCTy9UFk6T1L9xK3SNvEhsMWKO7/YZwdF2ltZEBm3u7d/VJ4dbduBkeq3Olv
	1p1Mo82wpuXN+N5zxmzajZ3GrBkxMJdy4r43D6zfLwD0NE6rdyA2JMRrKJIIbFeVV5xo
	mHTQ==
X-Received: by 10.180.99.231 with SMTP id et7mr152558wib.23.1429652886481;
	Tue, 21 Apr 2015 14:48:06 -0700 (PDT)
Received: from wsadrian.lan.ffah.ch (c-82-192-249-249.customer.ggaweb.ch.
	[82.192.249.249])
	by mx.google.com with ESMTPSA id o6sm21446081wiz.24.2015.04.21.14.48.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Apr 2015 14:48:05 -0700 (PDT)
Message-ID: <1429652884.1942.42.camel@gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: ed.bartosh@linux.intel.com
Date: Tue, 21 Apr 2015 23:48:04 +0200
In-Reply-To: <20150421101048.GA26939@linux.intel.com>
References: <1429541663-5695-1-git-send-email-adrian.freihofer@gmail.com>
	<20150420182134.GA15567@linux.intel.com>
	<1429561646.14219.78.camel@gmail.com>
	<20150421101048.GA26939@linux.intel.com>
X-Mailer: Evolution 3.12.11 (3.12.11-1.fc21) 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [master-next][PATCHv2] wic: Add plugin for single partition disk
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
X-List-Received-Date: Tue, 21 Apr 2015 21:48:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Ed,

To support legacy use cases (with fat boot partition) we just do not
delete the existing plugin yet. May be there should be a warning printed
by the old plugin that the plugin will be deleted in a future poky
version.

Sorry for the confusion about the --fetch-only parameter. I use a
wrapper script for bitbake providing this parameter. The wrapper calls
bitbake with -c fetchall. This is really help full to create a local
download mirror using the PREMIRRORS feature of bitbake. But if bitbake
does not care about the bootloader and other host tools the PREMIRROR
will not be complete any more...

So far I did not recognize the MACHINE dependent behavior you mentioned
in your email. Thanks for the hint. May be wic has already a complexity
demanding for unit tests...

Thanks for your support! I hope the updated patch fulfills the
requirements.
Regards,
Adrian

On Tue, 2015-04-21 at 13:10 +0300, Ed Bartosh wrote:
> On Mon, Apr 20, 2015 at 10:27:26PM +0200, Adrian Freihofer wrote:
> > Hi Ed,
> > 
> > Thank you for the response. See my comments below.
> > 
> > On Mon, 2015-04-20 at 21:21 +0300, Ed Bartosh wrote:
> > > Hi Adrian,
> > > 
> > > Thank you for the plugin! The implementation looks good to me.
> > > See my comments below.
> > > 
> > > On Mon, Apr 20, 2015 at 04:54:23PM +0200, Adrian Freihofer wrote:
> > > > The wic plugin creates a disk image containig one ext2/3/4 partition.
> > > > No additional boot partition is required. Syslinux is installed into
> > > > the image. The target device is a legacy BIOS PC.
> > > > 
> > > > Purpose of this plugin:
> > > > Other avaliable plugins create a fat partition for /boot and an ext
> > > > partition for rootfs. Current linux-yocto kernel packages are not
> > > > compatible with this disk layout. The boot partition is not mounted
> > > > by default, hence the kernel is installed into rootfs and not into
> > > > boot partition. A kernel update ends up in a bricked device. The old
> > > > kernel which is still in boot likely does not even boot with updated
> > > > kernel modules from /. Even if the boot partition is mounted during
> > > > the kernel update the update will fail. The kernel package installs
> > > > a symbolic link which is not supported by the fat partition.
> > > > Creating just one ext partition for boot and rootfs solves all issues
> > > > related to package based kernel updates on the device.
> > > > 
> > > When do you think it would make sense to stop using far partition for /boot ?
> > Maybe I've missed something. But as far as I can understand the current
> > implementation of poky image classes and wic, there is now solution
> > available which just works. If the user creates an image and later runs
> > a package based kernel update (e.g. opkg update on the device) the
> > device is "bricked". The kernel packages do not care about a separate
> > fat partition for boot. Further on they install a symbolic link which is
> > not possible on a fat boot partition! If I'm right, my plugin should be
> > applied immediately. It just solves problems for users of PCs with BIOS.
> > >
> You're absolutely right here. Solution with syslinux-nomtools looks much better than what we currently have. That's why I asked when we can switch to new syslinux. As far as i understood getting rid of using fat /boot partition and switching to syslinux-nomtools would be beneficial for everyone as it would make partition scheme simpler and kernel upgrades would not breake it.
> 
> 
> > > 
> > > > The plugin depends on syslinux-nomtools a user space installer for
> > > > syslinux on ext filesystems.
> > > > Thanks to Robert Yang who implemented syslinux-nomtools and supported
> > > > the implementation of this plugin.
> > > > 
> > > 
> > > It's not related to this patch may be, but still. Is syslinux-nomtools incompatible
> > > with syslinux? Why not to have just one syslinux?
> > Regarding the bits installed on the device, there is just one syslinux
> > bootloader. The bootloader itself has been merged to support all kind of
> > file systems.
> > But there are different installers. The installers are just host tools.
> > The syslinux team distinguishes between installers depending on
> > different user space libraries and installers depending on kernel
> > features. Installers depending on the kernel need a mounted file system
> > (e.g. extlinux). They do not run without root permissions and are
> > therefore out of scope to be used in poky. The installers which do not
> > require root permissions depend on a user space implementation of the
> > corresponding file system. To keep the dependencies per installer
> > minimal the syslinux team decided to provide different installers for
> > different file systems. So far there is only a user space installer for
> > fat file systems available. This is may be the explanation for the dual
> > partition layout in current poky. There was simply no user space
> > solution available until now.
> > Robert Yang from Windriver provided a patch set for a user space
> > installer for ext file systems. It is called syslinux-nomtools (syslinux
> > installer which does not depend on msdos file system libraries). The
> > patches have been merged into poky a few days or weeks ago. One of the
> > patches is still on master-next which was the reason to commit my plugin
> > on this branch as well.
> > 
> I'm aware of Robert's great work. Just wondering why we can't switch to syslinux-nomtools installer and forget about fat /boot partition. I can't think about any other reasons than legacy ones. We should keep supporting curent solution for some time, right?
> 
> > There is one more thing I would like to mention. My plugin calls bitbake
> > if the required host tools are missing (syslinux, parted). This makes it
> > just work for the user in any case. Other plugins fail if a tool e.g.
> > syslinux is not available or even worse, they just take the one
> > installed on the host distro!
> wic is not using parted and other tools from host distro anymore. It should be fixed by these commits:
> http://cgit.openembedded.org/openembedded-core/commit/?id=fa263f238bbddb00c9953994fb69cc358170e2ec
> http://cgit.openembedded.org/openembedded-core/commit/?id=76adf38c0d8e0faf04a5ecb3fcfbe831c85bb81f
> 
> 
> > But one can think about a better solution. The installation of missing
> > host tools should be centralized in wic. Please have a look at the
> > response to your patch "wic: Implement --build-rootfs command line
> > option" I sent you today.
> Totally agree. I'll answer to your message.
> 
> > However, I would suggest to go with the available patch and improve this
> > later on.
> 
> You may have missed my comments and suggestions for plugin code. Please, have a look.
> 
> > > 
> > > > Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
> > > > ---
> > > >  scripts/lib/wic/kickstart/__init__.py              |  10 ++
> > > >  .../lib/wic/plugins/source/rootfs_pcbios_ext.py    | 198 +++++++++++++++++++++
> > > >  2 files changed, 208 insertions(+)
> > > >  create mode 100644 scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
> > > > 
> > > > diff --git a/scripts/lib/wic/kickstart/__init__.py b/scripts/lib/wic/kickstart/__init__.py
> > > > index 111723b..eb9def9 100644
> > > > --- a/scripts/lib/wic/kickstart/__init__.py
> > > > +++ b/scripts/lib/wic/kickstart/__init__.py
> > > > @@ -104,6 +104,16 @@ def get_kernel_args(ks, default="ro rd.live.image"):
> > > >          return default
> > > >      return "%s %s" %(default, ks.handler.bootloader.appendLine)
> > > >  
> > > > +def get_kernel_args_console_serial(kargs):
> > > > +    consoles = []
> > > > +    for param in kargs.split():
> > > > +        param_match = re.match("console=(ttyS|ttyUSB)([0-9]+),?([0-9]*)([noe]?)([0-9]?)(r?)", param)
> > > > +        if param_match:
> > > > +            # console name without index, console index, baudrate, parity, number of bits, flow control
> > > > +            consoles.append((param_match.group(1), param_match.group(2), param_match.group(3),
> > > > +                             param_match.group(4), param_match.group(5), param_match.group(6)))
> > > > +    return consoles
> > > > +
> > > >  def get_menu_args(ks, default=""):
> > > >      if not hasattr(ks.handler.bootloader, "menus"):
> > > >          return default
> > > > diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
> > > > new file mode 100644
> > > > index 0000000..a05ddcf
> > > > --- /dev/null
> > > > +++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
> > > > @@ -0,0 +1,198 @@
> > > > +# ex:ts=4:sw=4:sts=4:et
> > > > +# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
> > > > +#
> > > > +# This program is free software; you can distribute it and/or modify
> > > > +# it under the terms of the GNU General Public License version 2 as
> > > > +# published by the Free Software Foundation.
> > > > +#
> > > > +# This program is distributed in the hope that it will be useful,
> > > > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > > +# GNU General Public License for mo details.
> > > > +#
> > > > +# You should have received a copy of the GNU General Public License along
> > > > +# with this program; if not, write to the Free Software Foundation, Inc.,
> > > > +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> > > > +#
> > > > +# DESCRIPTION
> > > > +# This plugin creates a disk image containing a bootable root partition with
> > > > +# syslinux installed. The filesystem is ext2/3/4, no extra boot partition is
> > > > +# required.
> > > > +#
> > > > +# Example kickstart file:
> > > > +# part / --source rootfs-pcbios-ext --ondisk sda --fstype=ext4 --label rootfs --align 1024
> > > > +# bootloader --source rootfs-pcbios-ext --timeout=0 --append="rootwait rootfstype=ext4"
> > > > +#
> > > > +# The first line generates a root file system including a syslinux.cfg file
> > > > +# The "--source rootfs-pcbios-ext" in the second line triggers the ldlinux.sys
> > > > +# installation into the image.
> > > > +#
> > > > +# AUTHOR
> > > > +# Adrian Freihofer <adrian.freihofer (at] neratec.com>
> > > > +#
> > > > +
> > > > +import os
> > > > +from wic.utils.errors import ImageError
> > > > +from wic import kickstart
> > > > +from wic import msger
> > > > +from wic.utils import runner
> > > > +from wic.pluginbase import SourcePlugin
> > > > +from wic.utils.oe import misc
> > > > +
> > > > +
> > > > +class RootfsPlugin(SourcePlugin):
> > > > +    name = 'rootfs-pcbios-ext'
> > > > +
> > > > +    @staticmethod
> > > > +    def __get_rootfs_dir(rootfs_dir):
> > > > +        if os.path.isdir(rootfs_dir):
> > > > +            return rootfs_dir
> > > > +
> > > > +        bitbake_env_lines = misc.find_bitbake_env_lines(rootfs_dir)
> > > > +        if not bitbake_env_lines:
> > > > +            msg = "Couldn't get bitbake environment, exiting."
> > > > +            msger.error(msg)
> > > > +
> > > > +        image_rootfs_dir = misc.find_artifact(bitbake_env_lines, "IMAGE_ROOTFS")
> > > > +        if not os.path.isdir(image_rootfs_dir):
> > > > +            msg = "No valid artifact IMAGE_ROOTFS from image named"
> > > > +            msg += " %s has been found at %s, exiting.\n" % \
> > > > +                (rootfs_dir, image_rootfs_dir)
> > > > +            msger.error(msg)
> > > > +
> > > > +        return image_rootfs_dir
> > > > +
> > > > +    @classmethod
> > > > +    def do_configure_partition(self, part, source_params, cr, cr_workdir,
> > > > +                               oe_builddir, bootimg_dir, kernel_dir,
> > > > +                               native_sysroot):
> > > > +        """
> > > > +        Called before do_prepare_partition(), creates syslinux config
> > > > +        """
> > > > +        (rootdev, root_part_uuid) = cr._get_boot_config()
> > > > +        options = cr.ks.handler.bootloader.appendLine
> > > > +
> > > > +        syslinux_conf = ""
> > > > +        syslinux_conf += "PROMPT 0\n"
> > > > +
> > > > +        timeout = kickstart.get_timeout(cr.ks)
> > > > +        if not timeout:
> > > > +            timeout = 0
> > > > +        syslinux_conf += "TIMEOUT " + str(timeout) + "\n"
> > > > +        syslinux_conf += "ALLOWOPTIONS 1\n"
> > > > +
> > > > +        # Derive bootloader serial console configuration from kernel parameters
> > > > +        serial_args = kickstart.get_kernel_args_console_serial(options)
> > > > +        try:
> > > > +            if serial_args[0][1] == 'ttyS':
> > > > +                syslinux_conf += "SERIAL " + serial_args[0][2]
> > > > +                try:  # baudrate
> > > > +                    syslinux_conf += serial_args[0][2]
> > > > +                except IndexError:
> > > > +                    pass
> > > > +                try:  # parity
> > > > +                    if serial_args[0][2] != 'n':
> > > > +                        msger.warning("syslinux does not support parity for console")
> > > > +                except IndexError:
> > > > +                    pass
> > > > +                try:  # number of bits
> > > > +                    if serial_args[0][3] != '8':
> > > > +                        msger.warning("syslinux supports 8 bit console configuration only")
> > > > +                except IndexError:
> > > > +                    pass
> > > > +                try:  # flow control
> > > > +                    if serial_args[0][4] != '':
> > > > +                        msger.warning("syslinux console flowcontrol configuration is ignored")
> > > > +                except IndexError:
> > > > +                    pass
> > > > +        except IndexError:
> > > > +            pass
> > > 
> > > Validation of syslinux console parameters should not be done in plugin code I believe. Please move it to the wic code that other plugins could call it.
> > > 
> > > > +
> > > > +        syslinux_conf += "\n"
> > > > +        syslinux_conf += "DEFAULT linux\n"
> > > > +        syslinux_conf += "LABEL linux\n"
> > > > +        syslinux_conf += "  KERNEL /boot/bzImage\n"
> > > > +
> > > > +        if cr._ptable_format == 'msdos':
> > > > +            rootstr = rootdev
> > > > +        else:
> > > > +            raise ImageError("Unsupported partition table format found")
> > > > +
> > > > +        syslinux_conf += "  APPEND label=boot root=%s %s\n" % (rootstr, options)
> > > > +
> > > > +        syslinux_cfg = os.path.join(cr.rootfs_dir['ROOTFS_DIR'], "boot", "syslinux.cfg")
> > > > +        msger.debug("Writing syslinux config %s" % syslinux_cfg)
> > > > +        cfg = open(syslinux_cfg, "w")
> > > > +        cfg.write(syslinux_conf)
> > > > +        cfg.close()
> > > > +
> > > > +    @classmethod
> > > > +    def do_prepare_partition(self, part, source_params, cr, cr_workdir,
> > > > +                             oe_builddir, bootimg_dir, kernel_dir,
> > > > +                             krootfs_dir, native_sysroot):
> > > > +        """
> > > > +        Called to do the actual content population for a partition i.e. it
> > > > +        'prepares' the partition to be incorporated into the image.
> > > > +        """
> > > > +        def is_exe(exepath):
> > > > +            return os.path.isfile(exepath) and os.access(exepath, os.X_OK)
> > > > +        
> > > > +        # Make sure parted is available in native sysroot or fail
> > > > +        native_parted = os.path.join(native_sysroot ,"usr/sbin/parted")
> > > > +        if not is_exe(native_parted):
> > > > +            msger.info("building parted-native...")
> > > > +            misc.exec_cmd("bitbake parted-native")
> > > > +        if not is_exe(native_parted):
> > > > +            msger.error("Couldn't find parted (%s), exiting\n" % native_parted)
> > > 
> > > This is already checked in wic code as parted-native is in the list of requirements for wic: http://www.yoctoproject.org/docs/1.9/dev-manual/dev-manual.html#wic-requirements
> > > 
> > > > +        
> > > > +        # Make sure syslinux-nomtools is available in native sysroot or fail
> > > > +        native_syslinux_nomtools = os.path.join(native_sysroot ,"usr/bin/syslinux-nomtools")
> > > > +        if not is_exe(native_syslinux_nomtools):
> > > > +            msger.info("building syslinux-native...")
> > > > +            misc.exec_cmd("bitbake syslinux-native")
> > > > +        if not is_exe(native_syslinux_nomtools):
> > > > +            msger.error("Couldn't find syslinux-nomtools (%s), exiting\n" % native_syslinux_nomtools)
> > > > +
> > > > +        if part.rootfs is None:
> > > > +            if not 'ROOTFS_DIR' in krootfs_dir:
> > > > +                msg = "Couldn't find --rootfs-dir, exiting"
> > > > +                msger.error(msg)
> > > > +            rootfs_dir = krootfs_dir['ROOTFS_DIR']
> > > > +        else:
> > > > +            if part.rootfs in krootfs_dir:
> > > > +                rootfs_dir = krootfs_dir[part.rootfs]
> > > > +            elif part.rootfs:
> > > > +                rootfs_dir = part.rootfs
> > > > +            else:
> > > > +                msg = "Couldn't find --rootfs-dir=%s connection"
> > > > +                msg += " or it is not a valid path, exiting"
> > > > +                msger.error(msg % part.rootfs)
> > > > +
> > > > +        real_rootfs_dir = self.__get_rootfs_dir(rootfs_dir)
> > > > +
> > > > +        part.set_rootfs(real_rootfs_dir)
> > > > +        part.prepare_rootfs(cr_workdir, oe_builddir, real_rootfs_dir, native_sysroot)
> > > > +
> > > > +        # install syslinux into rootfs partition
> > > > +        syslinux_cmd = "syslinux-nomtools -d /boot -i %s" % part.source_file
> > > > +        misc.exec_native_cmd(syslinux_cmd, native_sysroot)
> > > > +
> > > > +    @classmethod
> > > > +    def do_install_disk(self, disk, disk_name, cr, workdir, oe_builddir,
> > > > +                        bootimg_dir, kernel_dir, native_sysroot):
> > > > +        """
> > > > +        Called after all partitions have been prepared and assembled into a
> > > > +        disk image. In this case, we install the MBR.
> > > > +        """
> > > > +        mbrfile = os.path.join(native_sysroot, "usr/share/syslinux/mbr.bin")
> > > > +        if not os.path.exists(mbrfile):
> > > > +            msger.error("Couldn't find %s. If using the -e option, do you have the right MACHINE set in local.conf? If not, is the bootimg_dir path correct?" % mbrfile)
> > > > +
> > > > +        full_path = disk['disk'].device
> > > > +        msger.debug("Installing MBR on disk %s as %s with size %s bytes" \
> > > > +                    % (disk_name, full_path, disk['min_size']))
> > > > +
> > > > +        rc = runner.show(['dd', 'if=%s' % mbrfile, 'of=%s' % full_path, 'conv=notrunc'])
> > > > +        if rc != 0:
> > > > +            raise ImageError("Unable to set MBR to %s" % full_path)
> > > > +
> > > 
> > > You may want to fix at least some of pylint warnings:
> > > 
> > > C:139, 0: Trailing whitespace (trailing-whitespace)
> > > C:141, 0: No space allowed before comma
> > >         native_parted = os.path.join(native_sysroot ,"usr/sbin/parted")
> > >                                                     ^ (bad-whitespace)
> > > C:141, 0: Exactly one space required after comma
> > >         native_parted = os.path.join(native_sysroot ,"usr/sbin/parted")
> > >                                                     ^ (bad-whitespace)
> > > C:147, 0: Trailing whitespace (trailing-whitespace)
> > > C:149, 0: No space allowed before comma
> > >         native_syslinux_nomtools = os.path.join(native_sysroot ,"usr/bin/syslinux-nomtools")
> > >                                                                ^ (bad-whitespace)
> > > C:149, 0: Exactly one space required after comma
> > >         native_syslinux_nomtools = os.path.join(native_sysroot ,"usr/bin/syslinux-nomtools")
> > >                                                                ^ (bad-whitespace)
> > > C:154, 0: Line too long (101/100) (line-too-long)
> > > C:189, 0: Line too long (168/100) (line-too-long)
> > > C: 66, 4: Class method do_configure_partition should have 'cls' as first argument (bad-classmethod-argument)
> > > R: 66, 4: Too many arguments (9/5) (too-many-arguments)
> > > R: 66, 4: Too many local variables (18/15) (too-many-locals)
> > > W: 72,36: Access to a protected member _get_boot_config of a client class (protected-access)
> > > W:116,11: Access to a protected member _ptable_format of a client class (protected-access)
> > > W: 72,18: Unused variable 'root_part_uuid' (unused-variable)
> > > C:130, 4: Class method do_prepare_partition should have 'cls' as first argument (bad-classmethod-argument)
> > > R:130, 4: Too many arguments (10/5) (too-many-arguments)
> > > R:130, 4: Too many local variables (17/15) (too-many-locals)
> > > C:181, 4: Class method do_install_disk should have 'cls' as first argument (bad-classmethod-argument)
> > > R:181, 4: Too many arguments (9/5) (too-many-arguments)
> > > C:195, 8: Invalid variable name "rc" (invalid-name)
> > > 
> > > 
> > > 
> > > 
> > > --
> > > Regards,
> > > Ed
> > 
> > 
> 



