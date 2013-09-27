Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 533AF6CA6B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 02:17:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Sep 2013 19:17:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,989,1371106800"; d="scan'208";a="407869055"
Received: from unknown (HELO localhost) ([10.255.15.160])
	by fmsmga002.fm.intel.com with ESMTP; 26 Sep 2013 19:17:52 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2013 21:17:50 -0500
Message-Id: <cover.1380234931.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/3] 'wic'- OpenEmbedded Image Creator
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
X-List-Received-Date: Fri, 27 Sep 2013 02:17:53 -0000

This patchset implements a new command named 'wic' (for OpenEmbedded
Image Creator).  Please see [YOCTO #3847] for extensive background on
what's implemented here.

This is a completely independent standalone utility that initially
provides easier-to-use and more flexible replacements for a couple
bits of existing functionality in oe-core: directdisk.bbclass and
mkefidisk.sh.  The more interesting aspect of the current patchset
though is that the replaced (this patchset doesn't actually replace
those scripts, however) scripts are implemented by a general-purpose
partitioning 'language' based on Redhat kickstart syntax (with the
underlying code borrowed from Tizen mic, which in turn was borrowed
from Meego mic, in turn borrowed from Fedora livecd, etc.).

Though this patchset only uses the kickstart syntax related to
partitioning and bootloaders and only for creating images, because the
code is based on the mic/pykickstart code, future deployment efforts
such as those partially described by [YOCTO #4106], but also others
including package selection (from e.g. binary feeds) and deployment
configuration of users/network/services, etc, could be implemented
under this framework, considering that all of those are implemented
in some form by the base system.

The current patchset has successfully been used to generate and boot
images from core-image-minimal build artifacts using the 'mkefidisk'
kickstart file (in scripts/lib/image/canned-wks) on minnow and the
'directdisk' kickstart file using both core-image-minimal and
core-image-sato artifacts for crownbay.

The 'wic' command generates partitioned images from existing
OpenEmbedded build artifacts.  Image generation is driven by
partitioning commands contained in an 'Openembedded kickstart' (.wks)
file specified either directly on the command-line or as one of a
selection of canned .wks files (see 'wic list images').  When applied
to a given set of build artifacts, the result is an image or set of
images that can be directly written onto media and used on a
particular system.

It can be used in 'raw' mode, where artifacts are explicitly specified
via command-line arguments (see example below), or it can be used in a
more easily usable 'cooked' mode which uses the current MACHINE
setting and a specified image name to automatically locate the
artifacts used to create the image.

OE kickstart files (.wks) can of course be specified directly on the
command-line, but the user can also choose from a set of 'canned' .wks
files available via the 'wic list images' command (example below).

In any case, the prerequisite for generating any image is to have the
build artifacts already available.  The below examples assume the user
has already build a 'core-image-minimal' for a specific machine
(future versions won't require this redundant step, but for now that's
typically how build artifacts get generated).

The other prerequisite is to source the build environment:

$ source oe-init-build-env

To start out with, we'll generate an image from one of the canned .wks
files.  The following generates a list of availailable images:

$ wic list images
  mkefidisk             Create an EFI disk image
  directdisk            Create a 'pcbios' direct disk image

You can get more information about any of the available images by typing
'wic list xxx help', where 'xxx' is one of the image names:

$ wic list mkefidisk help

Creates a partitioned EFI disk image that the user
can directly dd to boot media.

At any time, you can get help on the 'wic' command or any subcommand
(currently 'list' and 'create').  For instance, to get the description
of 'wic create' command and its parameters:

$ wic create

Usage: 

 Create a new OpenEmbedded image

 usage: wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAME>]
            [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
            [-e | --image-name] [-r, --rootfs-dir] [-b, --bootimg-dir]
            [-k, --kernel-dir] [-n, --native-sysroot] [-s, --skip-build-check]

 This command creates an OpenEmbedded image based on the 'OE kickstart
 commands' found in the <wks file>.

 The -o option can be used to place the image in a directory with a
 different name and location.

 See 'wic help create' for more detailed instructions.

...

As mentioned in the command, you can get even more detailed information
by adding 'help' to the above:

$ wic help create

NAME
    wic create - Create a new OpenEmbedded image

SYNOPSIS
    wic create <wks file or image name> [-o <DIRNAME> | --outdir
<DIRNAME>]
        [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
        [-e | --image-name] [-r, --rootfs-dir] [-b, --bootimg-dir]
        [-k, --kernel-dir] [-n, --native-sysroot] [-s,
--skip-build-check]

DESCRIPTION
    This command creates an OpenEmbedded image based on the 'OE
    kickstart commands' found in the <wks file>.

    In order to do this, wic needs to know the locations of the
    various build artifacts required to build the image.

    Users can explicitly specify the build artifact locations using
    the -r, -b, -k, and -n options.  See below for details on where
    the corresponding artifacts are typically found in a normal
    OpenEmbedded build.

    Alternatively, users can use the -e option to have 'mic' determine
    those locations for a given image.  If the -e option is used, the
    user needs to have set the appropriate MACHINE variable in
    local.conf, and have sourced the build environment.

    The -e option is used to specify the name of the image to use the
    artifacts from e.g. core-image-sato.

    The -r option is used to specify the path to the /rootfs dir to
    use as the .wks rootfs source.

    The -b option is used to specify the path to the dir containing
    the boot artifacts (e.g. /EFI or /syslinux dirs) to use as the
    .wks bootimg source.

    The -k option is used to specify the path to the dir containing
    the kernel to use in the .wks bootimg.

    The -n option is used to specify the path to the native sysroot
    containing the tools to use to build the image.

    The -s option is used to skip the build check.  The build check is
    a simple sanity check used to determine whether the user has
    sourced the build environment so that the -e option can operate
    correctly.  If the user has specified the build artifact locations
    explicitly, 'wic' assumes the user knows what he or she is doing
    and skips the build check.

    When 'wic -e' is used, the locations for the build artifacts
    values are determined by 'wic -e' from the output of the 'bitbake
    -e' command given an image name e.g. 'core-image-minimal' and a
    given machine set in local.conf.  In that case, the image is
    created as if the following 'bitbake -e' variables were used:

    -r:        IMAGE_ROOTFS
    -k:        STAGING_KERNEL_DIR
    -n:        STAGING_DIR_NATIVE
    -b:        HDDDIR and STAGING_DATA_DIR (handlers decide which to
use)

    If 'wic -e' is not used, the user needs to select the appropriate
    value for -b (as well as -r, -k, and -n).

    The -o option can be used to place the image in a directory with a
    different name and location.

    As an alternative to the wks file, the image-specific properties
    that define the values that will be used to generate a particular
    image can be specified on the command-line using the -i option and
    supplying a JSON object consisting of the set of name:value pairs
    needed by image creation.

    The set of properties available for a given image type can be
    listed using the 'wic list' command.

So, the easiest way to create an image is to use the -e option with a
canned .wks file.  To use the -e option, you need to specify the image
used to generate the artifacts and you actually need to have the MACHINE
used to build them specified in your local.conf (these requirements
aren't necessary if you aren't using the -e options.  Below, we generate
a directdisk image, pointing the process at the core-image-minimal
artifacts for the current MACHINE:

$ wic create directdisk -e core-image-minimal

Checking basic build environment...
Done.

Creating image(s)...

Info: The new image(s) can be found here:
  /var/tmp/wic/build/directdisk-201309252350-sda.direct

The following build artifacts were used to create the image(s):

ROOTFS_DIR:      /home/trz/yocto/yocto-image/build/tmp/work/crownbay_noemgd-poky-linux/core-image-minimal/1.0-r0/rootfs
BOOTIMG_DIR:     /home/trz/yocto/yocto-image/build/tmp/sysroots/crownbay-noemgd/usr/share
KERNEL_DIR:      /home/trz/yocto/yocto-image/build/tmp/sysroots/crownbay-noemgd/usr/src/kernel
NATIVE_SYSROOT:  /home/trz/yocto/yocto-image/build/tmp/sysroots/crownbay-noemgd/usr/src/kernel

The image(s) were created using OE kickstart file:
  /home/trz/yocto/yocto-image/scripts/lib/image/canned-wks/directdisk.wks

The output shows the name and location of the image created, and so that
you know exactly what was used to generate the image, each of the
artifacts and the kickstart file used.

Similarly, I can create a 'mkefidisk' image in the same way (notice that
I'm using a different machine - because I'm using the -e option, I
needed to change the MACHINE in my local.conf):

$ wic create mkefidisk -e core-image-minimal
Checking basic build environment...
Done.

Creating image(s)...

Info: The new image(s) can be found here:
  /var/tmp/wic/build/mkefidisk-201309260027-sda.direct

The following build artifacts were used to create the image(s):

ROOTFS_DIR:      /home/trz/yocto/yocto-image/build/tmp/work/minnow-poky-linux/core-image-minimal/1.0-r0/rootfs
BOOTIMG_DIR:     /home/trz/yocto/yocto-image/build/tmp/work/minnow-poky-linux/core-image-minimal/1.0-r0/core-image-minimal-1.0/hddimg
KERNEL_DIR:      /home/trz/yocto/yocto-image/build/tmp/sysroots/minnow/usr/src/kernel
NATIVE_SYSROOT:  /home/trz/yocto/yocto-image/build/tmp/sysroots/minnow/usr/src/kernel

The image(s) were created using OE kickstart file:
  /home/trz/yocto/yocto-image/scripts/lib/image/canned-wks/mkefidisk.wks

Here's an example that doesn't take the easy way out and manually
specifies each build artifact, along with a non-canned .wks file, and
also uses the -o option to have wic create the output somewhere other
than the default /var/tmp/wic:

$ wic create ~/test.wks -o /home/trz/testwic
--rootfs-dir /home/trz/yocto/yocto-image/build/tmp/work/crownbay_noemgd-poky-linux/core-image-minimal/1.0-r0/rootfs --bootimg-dir /home/trz/yocto/yocto-image/build/tmp/sysroots/crownbay-noemgd/usr/share --kernel-dir /home/trz/yocto/yocto-image/build/tmp/sysroots/crownbay-noemgd/usr/src/kernel --native-sysroot /home/trz/yocto/yocto-image/build/tmp/sysroots/x86_64-linux

Creating image(s)...

Info: The new image(s) can be found here:
  /home/trz/testwic/build/test-201309260032-sda.direct

The following build artifacts were used to create the image(s):

ROOTFS_DIR:      /home/trz/yocto/yocto-image/build/tmp/work/crownbay_noemgd-poky-linux/core-image-minimal/1.0-r0/rootfs
BOOTIMG_DIR:     /home/trz/yocto/yocto-image/build/tmp/sysroots/crownbay-noemgd/usr/share
KERNEL_DIR:      /home/trz/yocto/yocto-image/build/tmp/sysroots/crownbay-noemgd/usr/src/kernel
NATIVE_SYSROOT:  /home/trz/yocto/yocto-image/build/tmp/sysroots/crownbay-noemgd/usr/src/kernel

The image(s) were created using OE kickstart file:
  /home/trz/test.wks

Finally, here's an example of the actual partition language commands
used to generate the mkefidisk image i.e. these are the contents of the
mkefidisk.wks OE kickstart file:

# short-description: Create an EFI disk image
# long-description: Creates a partitioned EFI disk image that the user
# can directly dd to boot media.

part /boot --source bootimg --ondisk sda --fstype=efi --label msdos --active --align 1024

part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024

part swap --ondisk sda --size 44 --label swap1 --fstype=swap

bootloader  --timeout=10  --append="rootwait rootfstype=ext3 console=ttyPCH0,115200 console=tty0 vmalloc=256MB snd-hda-intel.enable_msi=0"

The initial 'wic' implementation here supports only the basic
kickstart partitioning commands: 'partition' (or 'part' for short) and
'bootloader'.

Currently, only the options used in the 'canned' scripts (in
scripts/lib/image/canned-wks) are supported.

They're listed below and mostly follow the syntax and meaning of the
standard kickstart options for those commands:

http://fedoraproject.org/wiki/Anaconda/Kickstart#part_or_partition
http://fedoraproject.org/wiki/Anaconda/Kickstart#bootloader

For the 'partition' ('part') command, here are the supported options:

--source
	bootimg
	rootfs
--ondisk sda
--size size (in mB)
--fstype
	msdos
	efi
	ext4
	ext3
	ext2
	btrfs
	swap
--label label
--active
---align (in kB)

The --source option is a wic-specific option that can currently have
one of two values, 'bootimg' or 'rootfs'.

If '--source rootfs' is used, it tells the wic command to create a
partition as large as needed to fill with the contents of /rootfs
(specified by the -r 'wic' option) and to fill it with the contents of
/rootfs.

If '--source bootimg' is used, it tells the wic command to create a
partition as large as needed to fill with the contents of the boot
partition (specified by the -b 'wic' option).  Exactly what those
contents are depend on the value of the --fstype option for that
partition.  If '--fstype=efi' is specified, the boot artifacts
contained in HDDDIR are used, and if '--fstype=msdos' is specified,
the boot artifacts found in STAGING_DATADIR are used.

The '--align' option is a mic-specific option that says to start a
partition on an x kB boundary.

For the 'bootloader' command, these are the supported options:

--timeout
--append

Future updates will implement more options - using anything not
explicitly supported can result in unpredicable results.


The following changes since commit b049d532f6e0ab9e458e486f81b00be47ee69acf:

  testimage: Exclude BB_ORIGENV variable (2013-09-26 17:27:02 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-v1
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-v1

Tom Zanussi (3):
  wic: Initial code for wic (OpenEmbedded Image Creator)
  wic: Add mic w/pykickstart
  wic: Add OpenEmbedded-specific implementation

 scripts/lib/image/__init__.py                      |   22 +
 scripts/lib/image/canned-wks/directdisk.wks        |   10 +
 scripts/lib/image/canned-wks/mkefidisk.wks         |   11 +
 scripts/lib/image/config/wic.conf                  |    7 +
 scripts/lib/image/engine.py                        |  280 ++++
 scripts/lib/image/help.py                          |  311 ++++
 scripts/lib/mic/3rdparty/pykickstart/base.py       |  466 ++++++
 .../mic/3rdparty/pykickstart/commands/__init__.py  |   26 +
 .../3rdparty/pykickstart/commands/authconfig.py    |   40 +
 .../mic/3rdparty/pykickstart/commands/autopart.py  |  119 ++
 .../mic/3rdparty/pykickstart/commands/autostep.py  |   55 +
 .../3rdparty/pykickstart/commands/bootloader.py    |  265 ++++
 .../mic/3rdparty/pykickstart/commands/clearpart.py |   86 ++
 .../mic/3rdparty/pykickstart/commands/device.py    |  125 ++
 .../3rdparty/pykickstart/commands/deviceprobe.py   |   40 +
 .../3rdparty/pykickstart/commands/displaymode.py   |   68 +
 .../mic/3rdparty/pykickstart/commands/dmraid.py    |   91 ++
 .../3rdparty/pykickstart/commands/driverdisk.py    |  184 +++
 .../lib/mic/3rdparty/pykickstart/commands/fcoe.py  |  114 ++
 .../mic/3rdparty/pykickstart/commands/firewall.py  |  193 +++
 .../mic/3rdparty/pykickstart/commands/firstboot.py |   62 +
 .../lib/mic/3rdparty/pykickstart/commands/group.py |   88 ++
 .../3rdparty/pykickstart/commands/ignoredisk.py    |  139 ++
 .../3rdparty/pykickstart/commands/interactive.py   |   58 +
 .../lib/mic/3rdparty/pykickstart/commands/iscsi.py |  133 ++
 .../mic/3rdparty/pykickstart/commands/iscsiname.py |   54 +
 .../lib/mic/3rdparty/pykickstart/commands/key.py   |   64 +
 .../mic/3rdparty/pykickstart/commands/keyboard.py  |   55 +
 .../lib/mic/3rdparty/pykickstart/commands/lang.py  |   60 +
 .../3rdparty/pykickstart/commands/langsupport.py   |   58 +
 .../mic/3rdparty/pykickstart/commands/lilocheck.py |   54 +
 .../mic/3rdparty/pykickstart/commands/logging.py   |   66 +
 .../mic/3rdparty/pykickstart/commands/logvol.py    |  304 ++++
 .../3rdparty/pykickstart/commands/mediacheck.py    |   53 +
 .../mic/3rdparty/pykickstart/commands/method.py    |  186 +++
 .../mic/3rdparty/pykickstart/commands/monitor.py   |  106 ++
 .../lib/mic/3rdparty/pykickstart/commands/mouse.py |   70 +
 .../mic/3rdparty/pykickstart/commands/multipath.py |  111 ++
 .../mic/3rdparty/pykickstart/commands/network.py   |  363 +++++
 .../mic/3rdparty/pykickstart/commands/partition.py |  353 +++++
 .../lib/mic/3rdparty/pykickstart/commands/raid.py  |  365 +++++
 .../mic/3rdparty/pykickstart/commands/reboot.py    |   79 +
 .../lib/mic/3rdparty/pykickstart/commands/repo.py  |  249 +++
 .../mic/3rdparty/pykickstart/commands/rescue.py    |   68 +
 .../mic/3rdparty/pykickstart/commands/rootpw.py    |   93 ++
 .../mic/3rdparty/pykickstart/commands/selinux.py   |   64 +
 .../mic/3rdparty/pykickstart/commands/services.py  |   71 +
 .../lib/mic/3rdparty/pykickstart/commands/skipx.py |   54 +
 .../lib/mic/3rdparty/pykickstart/commands/sshpw.py |  105 ++
 .../mic/3rdparty/pykickstart/commands/timezone.py  |   86 ++
 .../mic/3rdparty/pykickstart/commands/updates.py   |   60 +
 .../mic/3rdparty/pykickstart/commands/upgrade.py   |  106 ++
 .../lib/mic/3rdparty/pykickstart/commands/user.py  |  173 +++
 .../lib/mic/3rdparty/pykickstart/commands/vnc.py   |  114 ++
 .../mic/3rdparty/pykickstart/commands/volgroup.py  |  102 ++
 .../mic/3rdparty/pykickstart/commands/xconfig.py   |  184 +++
 .../mic/3rdparty/pykickstart/commands/zerombr.py   |   69 +
 .../lib/mic/3rdparty/pykickstart/commands/zfcp.py  |  134 ++
 scripts/lib/mic/3rdparty/pykickstart/constants.py  |   57 +
 scripts/lib/mic/3rdparty/pykickstart/errors.py     |  103 ++
 .../mic/3rdparty/pykickstart/handlers/control.py   | 1307 ++++++++++++++++
 .../lib/mic/3rdparty/pykickstart/handlers/f10.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/f11.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/f12.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/f13.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/f14.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/f15.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/f16.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/f7.py    |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/f8.py    |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/f9.py    |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/fc3.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/fc4.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/fc5.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/fc6.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/rhel3.py |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/rhel4.py |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/rhel5.py |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/rhel6.py |   24 +
 scripts/lib/mic/3rdparty/pykickstart/ko.py         |   37 +
 scripts/lib/mic/3rdparty/pykickstart/options.py    |  204 +++
 scripts/lib/mic/3rdparty/pykickstart/parser.py     |  702 +++++++++
 scripts/lib/mic/3rdparty/pykickstart/sections.py   |  244 +++
 .../3rdparty/pykickstart/urlgrabber/__init__.py    |   53 +
 .../3rdparty/pykickstart/urlgrabber/byterange.py   |  463 ++++++
 .../mic/3rdparty/pykickstart/urlgrabber/grabber.py | 1477 ++++++++++++++++++
 .../3rdparty/pykickstart/urlgrabber/keepalive.py   |  617 ++++++++
 .../mic/3rdparty/pykickstart/urlgrabber/mirror.py  |  458 ++++++
 .../3rdparty/pykickstart/urlgrabber/progress.py    |  530 +++++++
 .../3rdparty/pykickstart/urlgrabber/sslfactory.py  |   90 ++
 scripts/lib/mic/3rdparty/pykickstart/version.py    |  197 +++
 scripts/lib/mic/__init__.py                        |    4 +
 scripts/lib/mic/__version__.py                     |    1 +
 scripts/lib/mic/bootstrap.py                       |  279 ++++
 scripts/lib/mic/chroot.py                          |  343 +++++
 scripts/lib/mic/conf.py                            |  201 +++
 scripts/lib/mic/creator.py                         |  351 +++++
 scripts/lib/mic/imager/baseimager.py               | 1265 ++++++++++++++++
 scripts/lib/mic/imager/direct.py                   |  472 ++++++
 scripts/lib/mic/imager/fs.py                       |   99 ++
 scripts/lib/mic/imager/livecd.py                   |  750 +++++++++
 scripts/lib/mic/imager/liveusb.py                  |  308 ++++
 scripts/lib/mic/imager/loop.py                     |  418 ++++++
 scripts/lib/mic/imager/raw.py                      |  501 +++++++
 scripts/lib/mic/kickstart/__init__.py              |  892 +++++++++++
 .../lib/mic/kickstart/custom_commands/__init__.py  |   17 +
 .../lib/mic/kickstart/custom_commands/desktop.py   |   95 ++
 .../mic/kickstart/custom_commands/installerfw.py   |   63 +
 .../lib/mic/kickstart/custom_commands/micboot.py   |   49 +
 .../mic/kickstart/custom_commands/micpartition.py  |   57 +
 .../lib/mic/kickstart/custom_commands/micrepo.py   |  127 ++
 .../lib/mic/kickstart/custom_commands/partition.py |  370 +++++
 scripts/lib/mic/msger.py                           |  309 ++++
 scripts/lib/mic/plugin.py                          |  102 ++
 scripts/lib/mic/pluginbase.py                      |  101 ++
 scripts/lib/mic/plugins/backend/yumpkgmgr.py       |  490 ++++++
 scripts/lib/mic/plugins/backend/zypppkgmgr.py      |  973 ++++++++++++
 scripts/lib/mic/plugins/hook/empty_hook.py         |    3 +
 scripts/lib/mic/plugins/imager/direct_plugin.py    |   92 ++
 scripts/lib/mic/plugins/imager/fs_plugin.py        |  143 ++
 scripts/lib/mic/plugins/imager/livecd_plugin.py    |  255 ++++
 scripts/lib/mic/plugins/imager/liveusb_plugin.py   |  260 ++++
 scripts/lib/mic/plugins/imager/loop_plugin.py      |  255 ++++
 scripts/lib/mic/plugins/imager/raw_plugin.py       |  275 ++++
 scripts/lib/mic/rt_util.py                         |  223 +++
 scripts/lib/mic/test                               |    1 +
 scripts/lib/mic/utils/BmapCreate.py                |  298 ++++
 scripts/lib/mic/utils/Fiemap.py                    |  252 ++++
 scripts/lib/mic/utils/cmdln.py                     | 1586 ++++++++++++++++++++
 scripts/lib/mic/utils/errors.py                    |   71 +
 scripts/lib/mic/utils/fs_related.py                | 1057 +++++++++++++
 scripts/lib/mic/utils/gpt_parser.py                |  331 ++++
 scripts/lib/mic/utils/grabber.py                   |   97 ++
 scripts/lib/mic/utils/misc.py                      | 1067 +++++++++++++
 scripts/lib/mic/utils/oe/__init__.py               |   22 +
 scripts/lib/mic/utils/oe/misc.py                   |  108 ++
 scripts/lib/mic/utils/partitionedfs.py             |  776 ++++++++++
 scripts/lib/mic/utils/proxy.py                     |  183 +++
 scripts/lib/mic/utils/rpmmisc.py                   |  600 ++++++++
 scripts/lib/mic/utils/runner.py                    |  109 ++
 scripts/wic                                        |  185 +++
 141 files changed, 30983 insertions(+)
 create mode 100644 scripts/lib/image/__init__.py
 create mode 100644 scripts/lib/image/canned-wks/directdisk.wks
 create mode 100644 scripts/lib/image/canned-wks/mkefidisk.wks
 create mode 100644 scripts/lib/image/config/wic.conf
 create mode 100644 scripts/lib/image/engine.py
 create mode 100644 scripts/lib/image/help.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/__init__.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/base.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/__init__.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/authconfig.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/autopart.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/autostep.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/bootloader.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/clearpart.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/device.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/deviceprobe.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/displaymode.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/dmraid.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/driverdisk.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/fcoe.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/firewall.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/firstboot.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/group.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/ignoredisk.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/interactive.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/iscsi.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/iscsiname.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/key.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/keyboard.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/lang.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/langsupport.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/lilocheck.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/logging.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/logvol.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/mediacheck.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/method.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/monitor.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/mouse.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/multipath.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/network.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/partition.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/raid.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/reboot.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/repo.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/rescue.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/rootpw.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/selinux.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/services.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/skipx.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/sshpw.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/timezone.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/updates.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/upgrade.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/user.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/vnc.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/volgroup.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/xconfig.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/zerombr.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/zfcp.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/constants.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/errors.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/__init__.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/control.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f10.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f11.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f12.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f13.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f14.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f15.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f16.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f7.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f8.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f9.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc3.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc4.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc5.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc6.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel3.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel4.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel5.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel6.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/ko.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/options.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/parser.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/sections.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/__init__.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/byterange.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/grabber.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/keepalive.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/mirror.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/progress.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/sslfactory.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/version.py
 create mode 100644 scripts/lib/mic/__init__.py
 create mode 100644 scripts/lib/mic/__version__.py
 create mode 100644 scripts/lib/mic/bootstrap.py
 create mode 100644 scripts/lib/mic/chroot.py
 create mode 100644 scripts/lib/mic/conf.py
 create mode 100644 scripts/lib/mic/creator.py
 create mode 100644 scripts/lib/mic/imager/__init__.py
 create mode 100644 scripts/lib/mic/imager/baseimager.py
 create mode 100644 scripts/lib/mic/imager/direct.py
 create mode 100644 scripts/lib/mic/imager/fs.py
 create mode 100644 scripts/lib/mic/imager/livecd.py
 create mode 100644 scripts/lib/mic/imager/liveusb.py
 create mode 100644 scripts/lib/mic/imager/loop.py
 create mode 100644 scripts/lib/mic/imager/raw.py
 create mode 100644 scripts/lib/mic/kickstart/__init__.py
 create mode 100644 scripts/lib/mic/kickstart/custom_commands/__init__.py
 create mode 100644 scripts/lib/mic/kickstart/custom_commands/desktop.py
 create mode 100644 scripts/lib/mic/kickstart/custom_commands/installerfw.py
 create mode 100644 scripts/lib/mic/kickstart/custom_commands/micboot.py
 create mode 100644 scripts/lib/mic/kickstart/custom_commands/micpartition.py
 create mode 100644 scripts/lib/mic/kickstart/custom_commands/micrepo.py
 create mode 100644 scripts/lib/mic/kickstart/custom_commands/partition.py
 create mode 100644 scripts/lib/mic/msger.py
 create mode 100644 scripts/lib/mic/plugin.py
 create mode 100644 scripts/lib/mic/pluginbase.py
 create mode 100644 scripts/lib/mic/plugins/backend/yumpkgmgr.py
 create mode 100755 scripts/lib/mic/plugins/backend/zypppkgmgr.py
 create mode 100644 scripts/lib/mic/plugins/hook/.py
 create mode 100644 scripts/lib/mic/plugins/hook/empty_hook.py
 create mode 100644 scripts/lib/mic/plugins/imager/direct_plugin.py
 create mode 100644 scripts/lib/mic/plugins/imager/fs_plugin.py
 create mode 100644 scripts/lib/mic/plugins/imager/livecd_plugin.py
 create mode 100644 scripts/lib/mic/plugins/imager/liveusb_plugin.py
 create mode 100644 scripts/lib/mic/plugins/imager/loop_plugin.py
 create mode 100644 scripts/lib/mic/plugins/imager/raw_plugin.py
 create mode 100644 scripts/lib/mic/rt_util.py
 create mode 100644 scripts/lib/mic/test
 create mode 100644 scripts/lib/mic/utils/BmapCreate.py
 create mode 100644 scripts/lib/mic/utils/Fiemap.py
 create mode 100644 scripts/lib/mic/utils/__init__.py
 create mode 100644 scripts/lib/mic/utils/cmdln.py
 create mode 100644 scripts/lib/mic/utils/errors.py
 create mode 100644 scripts/lib/mic/utils/fs_related.py
 create mode 100644 scripts/lib/mic/utils/gpt_parser.py
 create mode 100644 scripts/lib/mic/utils/grabber.py
 create mode 100644 scripts/lib/mic/utils/misc.py
 create mode 100644 scripts/lib/mic/utils/oe/__init__.py
 create mode 100644 scripts/lib/mic/utils/oe/misc.py
 create mode 100644 scripts/lib/mic/utils/partitionedfs.py
 create mode 100644 scripts/lib/mic/utils/proxy.py
 create mode 100644 scripts/lib/mic/utils/rpmmisc.py
 create mode 100644 scripts/lib/mic/utils/runner.py
 create mode 100755 scripts/wic

-- 
1.7.11.4


