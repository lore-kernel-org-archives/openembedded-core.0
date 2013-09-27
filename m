Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id D01076CA60
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 06:48:50 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id o17so1775688oag.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 23:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=rdGVBpqBWvldQBNt2Kylu29KtmFOxRQdxCHQHmXiExk=;
	b=QWmphpM0xpBA89svqOwolWckB/oqi45GP8EuF2qu+R4bxBdfMB/FdKDBmOywT0W90I
	6g6htcH2UwvsSTVNfIfwMd29OfRic2oMk1CZug3OeLqLIbXSxi+M445AtN7dVKAdr8eN
	PJPyXPbqP7VOayq1SExuSz2juV7nVcFLEu0N3a97gdzcG6gRnLIUIBC0lR/02u3AjQUs
	BiTgL0e36mR4lXpAFxvX/TwzQm0yXpwgv0oiAGorUhZ7P1E8eeLjVCZ5SqHoBbcy2sYA
	iLlujBOg8deb0DHvrJWpScFiHp0yaXsGCtYDTAQjrnWLUteQMffS6XPJrGuK9qRUpgx/
	jmJA==
MIME-Version: 1.0
X-Received: by 10.182.34.194 with SMTP id b2mr4351139obj.41.1380264532203;
	Thu, 26 Sep 2013 23:48:52 -0700 (PDT)
Received: by 10.60.30.196 with HTTP; Thu, 26 Sep 2013 23:48:52 -0700 (PDT)
Received: by 10.60.30.196 with HTTP; Thu, 26 Sep 2013 23:48:52 -0700 (PDT)
In-Reply-To: <cover.1380234931.git.tom.zanussi@linux.intel.com>
References: <cover.1380234931.git.tom.zanussi@linux.intel.com>
Date: Fri, 27 Sep 2013 08:48:52 +0200
Message-ID: <CAAKB1h1Am8Ep7LNJOZ_-g=6j+ru7DjDTcR2dUs2VMC7s+qy2iw@mail.gmail.com>
From: David Nystrom <david.c.nystrom@gmail.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] 'wic'- OpenEmbedded Image Creator
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
X-List-Received-Date: Fri, 27 Sep 2013 06:48:51 -0000
Content-Type: multipart/alternative; boundary=001a11c2275e23606f04e757e173

--001a11c2275e23606f04e757e173
Content-Type: text/plain; charset=ISO-8859-1

On Sep 27, 2013 4:17 AM, "Tom Zanussi" <tom.zanussi@linux.intel.com> wrote:
>
> This patchset implements a new command named 'wic' (for OpenEmbedded
> Image Creator).  Please see [YOCTO #3847] for extensive background on
> what's implemented here.

Nice !

Would it be possible to add the MIC as a recipe for native and nativesdk,
with wic patches applied(easier to maintain), and could also enable wic to
use a package repo when built for nativesdk.

Br,
David

> This is a completely independent standalone utility that initially
> provides easier-to-use and more flexible replacements for a couple
> bits of existing functionality in oe-core: directdisk.bbclass and
> mkefidisk.sh.  The more interesting aspect of the current patchset
> though is that the replaced (this patchset doesn't actually replace
> those scripts, however) scripts are implemented by a general-purpose
> partitioning 'language' based on Redhat kickstart syntax (with the
> underlying code borrowed from Tizen mic, which in turn was borrowed
> from Meego mic, in turn borrowed from Fedora livecd, etc.).
>
> Though this patchset only uses the kickstart syntax related to
> partitioning and bootloaders and only for creating images, because the
> code is based on the mic/pykickstart code, future deployment efforts
> such as those partially described by [YOCTO #4106], but also others
> including package selection (from e.g. binary feeds) and deployment
> configuration of users/network/services, etc, could be implemented
> under this framework, considering that all of those are implemented
> in some form by the base system.
>
> The current patchset has successfully been used to generate and boot
> images from core-image-minimal build artifacts using the 'mkefidisk'
> kickstart file (in scripts/lib/image/canned-wks) on minnow and the
> 'directdisk' kickstart file using both core-image-minimal and
> core-image-sato artifacts for crownbay.
>
> The 'wic' command generates partitioned images from existing
> OpenEmbedded build artifacts.  Image generation is driven by
> partitioning commands contained in an 'Openembedded kickstart' (.wks)
> file specified either directly on the command-line or as one of a
> selection of canned .wks files (see 'wic list images').  When applied
> to a given set of build artifacts, the result is an image or set of
> images that can be directly written onto media and used on a
> particular system.
>
> It can be used in 'raw' mode, where artifacts are explicitly specified
> via command-line arguments (see example below), or it can be used in a
> more easily usable 'cooked' mode which uses the current MACHINE
> setting and a specified image name to automatically locate the
> artifacts used to create the image.
>
> OE kickstart files (.wks) can of course be specified directly on the
> command-line, but the user can also choose from a set of 'canned' .wks
> files available via the 'wic list images' command (example below).
>
> In any case, the prerequisite for generating any image is to have the
> build artifacts already available.  The below examples assume the user
> has already build a 'core-image-minimal' for a specific machine
> (future versions won't require this redundant step, but for now that's
> typically how build artifacts get generated).
>
> The other prerequisite is to source the build environment:
>
> $ source oe-init-build-env
>
> To start out with, we'll generate an image from one of the canned .wks
> files.  The following generates a list of availailable images:
>
> $ wic list images
>   mkefidisk             Create an EFI disk image
>   directdisk            Create a 'pcbios' direct disk image
>
> You can get more information about any of the available images by typing
> 'wic list xxx help', where 'xxx' is one of the image names:
>
> $ wic list mkefidisk help
>
> Creates a partitioned EFI disk image that the user
> can directly dd to boot media.
>
> At any time, you can get help on the 'wic' command or any subcommand
> (currently 'list' and 'create').  For instance, to get the description
> of 'wic create' command and its parameters:
>
> $ wic create
>
> Usage:
>
>  Create a new OpenEmbedded image
>
>  usage: wic create <wks file or image name> [-o <DIRNAME> | --outdir
<DIRNAME>]
>             [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
>             [-e | --image-name] [-r, --rootfs-dir] [-b, --bootimg-dir]
>             [-k, --kernel-dir] [-n, --native-sysroot] [-s,
--skip-build-check]
>
>  This command creates an OpenEmbedded image based on the 'OE kickstart
>  commands' found in the <wks file>.
>
>  The -o option can be used to place the image in a directory with a
>  different name and location.
>
>  See 'wic help create' for more detailed instructions.
>
> ...
>
> As mentioned in the command, you can get even more detailed information
> by adding 'help' to the above:
>
> $ wic help create
>
> NAME
>     wic create - Create a new OpenEmbedded image
>
> SYNOPSIS
>     wic create <wks file or image name> [-o <DIRNAME> | --outdir
> <DIRNAME>]
>         [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
>         [-e | --image-name] [-r, --rootfs-dir] [-b, --bootimg-dir]
>         [-k, --kernel-dir] [-n, --native-sysroot] [-s,
> --skip-build-check]
>
> DESCRIPTION
>     This command creates an OpenEmbedded image based on the 'OE
>     kickstart commands' found in the <wks file>.
>
>     In order to do this, wic needs to know the locations of the
>     various build artifacts required to build the image.
>
>     Users can explicitly specify the build artifact locations using
>     the -r, -b, -k, and -n options.  See below for details on where
>     the corresponding artifacts are typically found in a normal
>     OpenEmbedded build.
>
>     Alternatively, users can use the -e option to have 'mic' determine
>     those locations for a given image.  If the -e option is used, the
>     user needs to have set the appropriate MACHINE variable in
>     local.conf, and have sourced the build environment.
>
>     The -e option is used to specify the name of the image to use the
>     artifacts from e.g. core-image-sato.
>
>     The -r option is used to specify the path to the /rootfs dir to
>     use as the .wks rootfs source.
>
>     The -b option is used to specify the path to the dir containing
>     the boot artifacts (e.g. /EFI or /syslinux dirs) to use as the
>     .wks bootimg source.
>
>     The -k option is used to specify the path to the dir containing
>     the kernel to use in the .wks bootimg.
>
>     The -n option is used to specify the path to the native sysroot
>     containing the tools to use to build the image.
>
>     The -s option is used to skip the build check.  The build check is
>     a simple sanity check used to determine whether the user has
>     sourced the build environment so that the -e option can operate
>     correctly.  If the user has specified the build artifact locations
>     explicitly, 'wic' assumes the user knows what he or she is doing
>     and skips the build check.
>
>     When 'wic -e' is used, the locations for the build artifacts
>     values are determined by 'wic -e' from the output of the 'bitbake
>     -e' command given an image name e.g. 'core-image-minimal' and a
>     given machine set in local.conf.  In that case, the image is
>     created as if the following 'bitbake -e' variables were used:
>
>     -r:        IMAGE_ROOTFS
>     -k:        STAGING_KERNEL_DIR
>     -n:        STAGING_DIR_NATIVE
>     -b:        HDDDIR and STAGING_DATA_DIR (handlers decide which to
> use)
>
>     If 'wic -e' is not used, the user needs to select the appropriate
>     value for -b (as well as -r, -k, and -n).
>
>     The -o option can be used to place the image in a directory with a
>     different name and location.
>
>     As an alternative to the wks file, the image-specific properties
>     that define the values that will be used to generate a particular
>     image can be specified on the command-line using the -i option and
>     supplying a JSON object consisting of the set of name:value pairs
>     needed by image creation.
>
>     The set of properties available for a given image type can be
>     listed using the 'wic list' command.
>
> So, the easiest way to create an image is to use the -e option with a
> canned .wks file.  To use the -e option, you need to specify the image
> used to generate the artifacts and you actually need to have the MACHINE
> used to build them specified in your local.conf (these requirements
> aren't necessary if you aren't using the -e options.  Below, we generate
> a directdisk image, pointing the process at the core-image-minimal
> artifacts for the current MACHINE:
>
> $ wic create directdisk -e core-image-minimal
>
> Checking basic build environment...
> Done.
>
> Creating image(s)...
>
> Info: The new image(s) can be found here:
>   /var/tmp/wic/build/directdisk-201309252350-sda.direct
>
> The following build artifacts were used to create the image(s):
>
> ROOTFS_DIR:
 /home/trz/yocto/yocto-image/build/tmp/work/crownbay_noemgd-poky-linux/core-image-minimal/1.0-r0/rootfs
> BOOTIMG_DIR:
/home/trz/yocto/yocto-image/build/tmp/sysroots/crownbay-noemgd/usr/share
> KERNEL_DIR:
 /home/trz/yocto/yocto-image/build/tmp/sysroots/crownbay-noemgd/usr/src/kernel
> NATIVE_SYSROOT:
 /home/trz/yocto/yocto-image/build/tmp/sysroots/crownbay-noemgd/usr/src/kernel
>
> The image(s) were created using OE kickstart file:
>   /home/trz/yocto/yocto-image/scripts/lib/image/canned-wks/directdisk.wks
>
> The output shows the name and location of the image created, and so that
> you know exactly what was used to generate the image, each of the
> artifacts and the kickstart file used.
>
> Similarly, I can create a 'mkefidisk' image in the same way (notice that
> I'm using a different machine - because I'm using the -e option, I
> needed to change the MACHINE in my local.conf):
>
> $ wic create mkefidisk -e core-image-minimal
> Checking basic build environment...
> Done.
>
> Creating image(s)...
>
> Info: The new image(s) can be found here:
>   /var/tmp/wic/build/mkefidisk-201309260027-sda.direct
>
> The following build artifacts were used to create the image(s):
>
> ROOTFS_DIR:
 /home/trz/yocto/yocto-image/build/tmp/work/minnow-poky-linux/core-image-minimal/1.0-r0/rootfs
> BOOTIMG_DIR:
/home/trz/yocto/yocto-image/build/tmp/work/minnow-poky-linux/core-image-minimal/1.0-r0/core-image-minimal-1.0/hddimg
> KERNEL_DIR:
 /home/trz/yocto/yocto-image/build/tmp/sysroots/minnow/usr/src/kernel
> NATIVE_SYSROOT:
 /home/trz/yocto/yocto-image/build/tmp/sysroots/minnow/usr/src/kernel
>
> The image(s) were created using OE kickstart file:
>   /home/trz/yocto/yocto-image/scripts/lib/image/canned-wks/mkefidisk.wks
>
> Here's an example that doesn't take the easy way out and manually
> specifies each build artifact, along with a non-canned .wks file, and
> also uses the -o option to have wic create the output somewhere other
> than the default /var/tmp/wic:
>
> $ wic create ~/test.wks -o /home/trz/testwic
> --rootfs-dir
/home/trz/yocto/yocto-image/build/tmp/work/crownbay_noemgd-poky-linux/core-image-minimal/1.0-r0/rootfs
--bootimg-dir
/home/trz/yocto/yocto-image/build/tmp/sysroots/crownbay-noemgd/usr/share
--kernel-dir
/home/trz/yocto/yocto-image/build/tmp/sysroots/crownbay-noemgd/usr/src/kernel
--native-sysroot /home/trz/yocto/yocto-image/build/tmp/sysroots/x86_64-linux
>
> Creating image(s)...
>
> Info: The new image(s) can be found here:
>   /home/trz/testwic/build/test-201309260032-sda.direct
>
> The following build artifacts were used to create the image(s):
>
> ROOTFS_DIR:
 /home/trz/yocto/yocto-image/build/tmp/work/crownbay_noemgd-poky-linux/core-image-minimal/1.0-r0/rootfs
> BOOTIMG_DIR:
/home/trz/yocto/yocto-image/build/tmp/sysroots/crownbay-noemgd/usr/share
> KERNEL_DIR:
 /home/trz/yocto/yocto-image/build/tmp/sysroots/crownbay-noemgd/usr/src/kernel
> NATIVE_SYSROOT:
 /home/trz/yocto/yocto-image/build/tmp/sysroots/crownbay-noemgd/usr/src/kernel
>
> The image(s) were created using OE kickstart file:
>   /home/trz/test.wks
>
> Finally, here's an example of the actual partition language commands
> used to generate the mkefidisk image i.e. these are the contents of the
> mkefidisk.wks OE kickstart file:
>
> # short-description: Create an EFI disk image
> # long-description: Creates a partitioned EFI disk image that the user
> # can directly dd to boot media.
>
> part /boot --source bootimg --ondisk sda --fstype=efi --label msdos
--active --align 1024
>
> part / --source rootfs --ondisk sda --fstype=ext3 --label platform
--align 1024
>
> part swap --ondisk sda --size 44 --label swap1 --fstype=swap
>
> bootloader  --timeout=10  --append="rootwait rootfstype=ext3
console=ttyPCH0,115200 console=tty0 vmalloc=256MB
snd-hda-intel.enable_msi=0"
>
> The initial 'wic' implementation here supports only the basic
> kickstart partitioning commands: 'partition' (or 'part' for short) and
> 'bootloader'.
>
> Currently, only the options used in the 'canned' scripts (in
> scripts/lib/image/canned-wks) are supported.
>
> They're listed below and mostly follow the syntax and meaning of the
> standard kickstart options for those commands:
>
> http://fedoraproject.org/wiki/Anaconda/Kickstart#part_or_partition
> http://fedoraproject.org/wiki/Anaconda/Kickstart#bootloader
>
> For the 'partition' ('part') command, here are the supported options:
>
> --source
>         bootimg
>         rootfs
> --ondisk sda
> --size size (in mB)
> --fstype
>         msdos
>         efi
>         ext4
>         ext3
>         ext2
>         btrfs
>         swap
> --label label
> --active
> ---align (in kB)
>
> The --source option is a wic-specific option that can currently have
> one of two values, 'bootimg' or 'rootfs'.
>
> If '--source rootfs' is used, it tells the wic command to create a
> partition as large as needed to fill with the contents of /rootfs
> (specified by the -r 'wic' option) and to fill it with the contents of
> /rootfs.
>
> If '--source bootimg' is used, it tells the wic command to create a
> partition as large as needed to fill with the contents of the boot
> partition (specified by the -b 'wic' option).  Exactly what those
> contents are depend on the value of the --fstype option for that
> partition.  If '--fstype=efi' is specified, the boot artifacts
> contained in HDDDIR are used, and if '--fstype=msdos' is specified,
> the boot artifacts found in STAGING_DATADIR are used.
>
> The '--align' option is a mic-specific option that says to start a
> partition on an x kB boundary.
>
> For the 'bootloader' command, these are the supported options:
>
> --timeout
> --append
>
> Future updates will implement more options - using anything not
> explicitly supported can result in unpredicable results.
>
>
> The following changes since commit
b049d532f6e0ab9e458e486f81b00be47ee69acf:
>
>   testimage: Exclude BB_ORIGENV variable (2013-09-26 17:27:02 +0100)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-v1
>
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-v1
>
> Tom Zanussi (3):
>   wic: Initial code for wic (OpenEmbedded Image Creator)
>   wic: Add mic w/pykickstart
>   wic: Add OpenEmbedded-specific implementation
>
>  scripts/lib/image/__init__.py                      |   22 +
>  scripts/lib/image/canned-wks/directdisk.wks        |   10 +
>  scripts/lib/image/canned-wks/mkefidisk.wks         |   11 +
>  scripts/lib/image/config/wic.conf                  |    7 +
>  scripts/lib/image/engine.py                        |  280 ++++
>  scripts/lib/image/help.py                          |  311 ++++
>  scripts/lib/mic/3rdparty/pykickstart/base.py       |  466 ++++++
>  .../mic/3rdparty/pykickstart/commands/__init__.py  |   26 +
>  .../3rdparty/pykickstart/commands/authconfig.py    |   40 +
>  .../mic/3rdparty/pykickstart/commands/autopart.py  |  119 ++
>  .../mic/3rdparty/pykickstart/commands/autostep.py  |   55 +
>  .../3rdparty/pykickstart/commands/bootloader.py    |  265 ++++
>  .../mic/3rdparty/pykickstart/commands/clearpart.py |   86 ++
>  .../mic/3rdparty/pykickstart/commands/device.py    |  125 ++
>  .../3rdparty/pykickstart/commands/deviceprobe.py   |   40 +
>  .../3rdparty/pykickstart/commands/displaymode.py   |   68 +
>  .../mic/3rdparty/pykickstart/commands/dmraid.py    |   91 ++
>  .../3rdparty/pykickstart/commands/driverdisk.py    |  184 +++
>  .../lib/mic/3rdparty/pykickstart/commands/fcoe.py  |  114 ++
>  .../mic/3rdparty/pykickstart/commands/firewall.py  |  193 +++
>  .../mic/3rdparty/pykickstart/commands/firstboot.py |   62 +
>  .../lib/mic/3rdparty/pykickstart/commands/group.py |   88 ++
>  .../3rdparty/pykickstart/commands/ignoredisk.py    |  139 ++
>  .../3rdparty/pykickstart/commands/interactive.py   |   58 +
>  .../lib/mic/3rdparty/pykickstart/commands/iscsi.py |  133 ++
>  .../mic/3rdparty/pykickstart/commands/iscsiname.py |   54 +
>  .../lib/mic/3rdparty/pykickstart/commands/key.py   |   64 +
>  .../mic/3rdparty/pykickstart/commands/keyboard.py  |   55 +
>  .../lib/mic/3rdparty/pykickstart/commands/lang.py  |   60 +
>  .../3rdparty/pykickstart/commands/langsupport.py   |   58 +
>  .../mic/3rdparty/pykickstart/commands/lilocheck.py |   54 +
>  .../mic/3rdparty/pykickstart/commands/logging.py   |   66 +
>  .../mic/3rdparty/pykickstart/commands/logvol.py    |  304 ++++
>  .../3rdparty/pykickstart/commands/mediacheck.py    |   53 +
>  .../mic/3rdparty/pykickstart/commands/method.py    |  186 +++
>  .../mic/3rdparty/pykickstart/commands/monitor.py   |  106 ++
>  .../lib/mic/3rdparty/pykickstart/commands/mouse.py |   70 +
>  .../mic/3rdparty/pykickstart/commands/multipath.py |  111 ++
>  .../mic/3rdparty/pykickstart/commands/network.py   |  363 +++++
>  .../mic/3rdparty/pykickstart/commands/partition.py |  353 +++++
>  .../lib/mic/3rdparty/pykickstart/commands/raid.py  |  365 +++++
>  .../mic/3rdparty/pykickstart/commands/reboot.py    |   79 +
>  .../lib/mic/3rdparty/pykickstart/commands/repo.py  |  249 +++
>  .../mic/3rdparty/pykickstart/commands/rescue.py    |   68 +
>  .../mic/3rdparty/pykickstart/commands/rootpw.py    |   93 ++
>  .../mic/3rdparty/pykickstart/commands/selinux.py   |   64 +
>  .../mic/3rdparty/pykickstart/commands/services.py  |   71 +
>  .../lib/mic/3rdparty/pykickstart/commands/skipx.py |   54 +
>  .../lib/mic/3rdparty/pykickstart/commands/sshpw.py |  105 ++
>  .../mic/3rdparty/pykickstart/commands/timezone.py  |   86 ++
>  .../mic/3rdparty/pykickstart/commands/updates.py   |   60 +
>  .../mic/3rdparty/pykickstart/commands/upgrade.py   |  106 ++
>  .../lib/mic/3rdparty/pykickstart/commands/user.py  |  173 +++
>  .../lib/mic/3rdparty/pykickstart/commands/vnc.py   |  114 ++
>  .../mic/3rdparty/pykickstart/commands/volgroup.py  |  102 ++
>  .../mic/3rdparty/pykickstart/commands/xconfig.py   |  184 +++
>  .../mic/3rdparty/pykickstart/commands/zerombr.py   |   69 +
>  .../lib/mic/3rdparty/pykickstart/commands/zfcp.py  |  134 ++
>  scripts/lib/mic/3rdparty/pykickstart/constants.py  |   57 +
>  scripts/lib/mic/3rdparty/pykickstart/errors.py     |  103 ++
>  .../mic/3rdparty/pykickstart/handlers/control.py   | 1307
++++++++++++++++
>  .../lib/mic/3rdparty/pykickstart/handlers/f10.py   |   24 +
>  .../lib/mic/3rdparty/pykickstart/handlers/f11.py   |   24 +
>  .../lib/mic/3rdparty/pykickstart/handlers/f12.py   |   24 +
>  .../lib/mic/3rdparty/pykickstart/handlers/f13.py   |   24 +
>  .../lib/mic/3rdparty/pykickstart/handlers/f14.py   |   24 +
>  .../lib/mic/3rdparty/pykickstart/handlers/f15.py   |   24 +
>  .../lib/mic/3rdparty/pykickstart/handlers/f16.py   |   24 +
>  .../lib/mic/3rdparty/pykickstart/handlers/f7.py    |   24 +
>  .../lib/mic/3rdparty/pykickstart/handlers/f8.py    |   24 +
>  .../lib/mic/3rdparty/pykickstart/handlers/f9.py    |   24 +
>  .../lib/mic/3rdparty/pykickstart/handlers/fc3.py   |   24 +
>  .../lib/mic/3rdparty/pykickstart/handlers/fc4.py   |   24 +
>  .../lib/mic/3rdparty/pykickstart/handlers/fc5.py   |   24 +
>  .../lib/mic/3rdparty/pykickstart/handlers/fc6.py   |   24 +
>  .../lib/mic/3rdparty/pykickstart/handlers/rhel3.py |   24 +
>  .../lib/mic/3rdparty/pykickstart/handlers/rhel4.py |   24 +
>  .../lib/mic/3rdparty/pykickstart/handlers/rhel5.py |   24 +
>  .../lib/mic/3rdparty/pykickstart/handlers/rhel6.py |   24 +
>  scripts/lib/mic/3rdparty/pykickstart/ko.py         |   37 +
>  scripts/lib/mic/3rdparty/pykickstart/options.py    |  204 +++
>  scripts/lib/mic/3rdparty/pykickstart/parser.py     |  702 +++++++++
>  scripts/lib/mic/3rdparty/pykickstart/sections.py   |  244 +++
>  .../3rdparty/pykickstart/urlgrabber/__init__.py    |   53 +
>  .../3rdparty/pykickstart/urlgrabber/byterange.py   |  463 ++++++
>  .../mic/3rdparty/pykickstart/urlgrabber/grabber.py | 1477
++++++++++++++++++
>  .../3rdparty/pykickstart/urlgrabber/keepalive.py   |  617 ++++++++
>  .../mic/3rdparty/pykickstart/urlgrabber/mirror.py  |  458 ++++++
>  .../3rdparty/pykickstart/urlgrabber/progress.py    |  530 +++++++
>  .../3rdparty/pykickstart/urlgrabber/sslfactory.py  |   90 ++
>  scripts/lib/mic/3rdparty/pykickstart/version.py    |  197 +++
>  scripts/lib/mic/__init__.py                        |    4 +
>  scripts/lib/mic/__version__.py                     |    1 +
>  scripts/lib/mic/bootstrap.py                       |  279 ++++
>  scripts/lib/mic/chroot.py                          |  343 +++++
>  scripts/lib/mic/conf.py                            |  201 +++
>  scripts/lib/mic/creator.py                         |  351 +++++
>  scripts/lib/mic/imager/baseimager.py               | 1265
++++++++++++++++
>  scripts/lib/mic/imager/direct.py                   |  472 ++++++
>  scripts/lib/mic/imager/fs.py                       |   99 ++
>  scripts/lib/mic/imager/livecd.py                   |  750 +++++++++
>  scripts/lib/mic/imager/liveusb.py                  |  308 ++++
>  scripts/lib/mic/imager/loop.py                     |  418 ++++++
>  scripts/lib/mic/imager/raw.py                      |  501 +++++++
>  scripts/lib/mic/kickstart/__init__.py              |  892 +++++++++++
>  .../lib/mic/kickstart/custom_commands/__init__.py  |   17 +
>  .../lib/mic/kickstart/custom_commands/desktop.py   |   95 ++
>  .../mic/kickstart/custom_commands/installerfw.py   |   63 +
>  .../lib/mic/kickstart/custom_commands/micboot.py   |   49 +
>  .../mic/kickstart/custom_commands/micpartition.py  |   57 +
>  .../lib/mic/kickstart/custom_commands/micrepo.py   |  127 ++
>  .../lib/mic/kickstart/custom_commands/partition.py |  370 +++++
>  scripts/lib/mic/msger.py                           |  309 ++++
>  scripts/lib/mic/plugin.py                          |  102 ++
>  scripts/lib/mic/pluginbase.py                      |  101 ++
>  scripts/lib/mic/plugins/backend/yumpkgmgr.py       |  490 ++++++
>  scripts/lib/mic/plugins/backend/zypppkgmgr.py      |  973 ++++++++++++
>  scripts/lib/mic/plugins/hook/empty_hook.py         |    3 +
>  scripts/lib/mic/plugins/imager/direct_plugin.py    |   92 ++
>  scripts/lib/mic/plugins/imager/fs_plugin.py        |  143 ++
>  scripts/lib/mic/plugins/imager/livecd_plugin.py    |  255 ++++
>  scripts/lib/mic/plugins/imager/liveusb_plugin.py   |  260 ++++
>  scripts/lib/mic/plugins/imager/loop_plugin.py      |  255 ++++
>  scripts/lib/mic/plugins/imager/raw_plugin.py       |  275 ++++
>  scripts/lib/mic/rt_util.py                         |  223 +++
>  scripts/lib/mic/test                               |    1 +
>  scripts/lib/mic/utils/BmapCreate.py                |  298 ++++
>  scripts/lib/mic/utils/Fiemap.py                    |  252 ++++
>  scripts/lib/mic/utils/cmdln.py                     | 1586
++++++++++++++++++++
>  scripts/lib/mic/utils/errors.py                    |   71 +
>  scripts/lib/mic/utils/fs_related.py                | 1057 +++++++++++++
>  scripts/lib/mic/utils/gpt_parser.py                |  331 ++++
>  scripts/lib/mic/utils/grabber.py                   |   97 ++
>  scripts/lib/mic/utils/misc.py                      | 1067 +++++++++++++
>  scripts/lib/mic/utils/oe/__init__.py               |   22 +
>  scripts/lib/mic/utils/oe/misc.py                   |  108 ++
>  scripts/lib/mic/utils/partitionedfs.py             |  776 ++++++++++
>  scripts/lib/mic/utils/proxy.py                     |  183 +++
>  scripts/lib/mic/utils/rpmmisc.py                   |  600 ++++++++
>  scripts/lib/mic/utils/runner.py                    |  109 ++
>  scripts/wic                                        |  185 +++
>  141 files changed, 30983 insertions(+)
>  create mode 100644 scripts/lib/image/__init__.py
>  create mode 100644 scripts/lib/image/canned-wks/directdisk.wks
>  create mode 100644 scripts/lib/image/canned-wks/mkefidisk.wks
>  create mode 100644 scripts/lib/image/config/wic.conf
>  create mode 100644 scripts/lib/image/engine.py
>  create mode 100644 scripts/lib/image/help.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/__init__.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/base.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/__init__.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/authconfig.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/autopart.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/autostep.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/bootloader.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/clearpart.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/device.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/deviceprobe.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/displaymode.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/dmraid.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/driverdisk.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/fcoe.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/firewall.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/firstboot.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/group.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/ignoredisk.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/interactive.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/iscsi.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/iscsiname.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/key.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/keyboard.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/lang.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/langsupport.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/lilocheck.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/logging.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/logvol.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/mediacheck.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/method.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/monitor.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/mouse.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/multipath.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/network.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/partition.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/raid.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/reboot.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/repo.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/rescue.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/rootpw.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/selinux.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/services.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/skipx.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/sshpw.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/timezone.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/updates.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/upgrade.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/user.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/vnc.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/volgroup.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/xconfig.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/commands/zerombr.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/zfcp.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/constants.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/errors.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/handlers/__init__.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/handlers/control.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f10.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f11.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f12.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f13.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f14.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f15.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f16.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f7.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f8.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f9.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc3.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc4.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc5.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc6.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel3.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel4.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel5.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel6.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/ko.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/options.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/parser.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/sections.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/urlgrabber/__init__.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/urlgrabber/byterange.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/urlgrabber/grabber.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/urlgrabber/keepalive.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/urlgrabber/mirror.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/urlgrabber/progress.py
>  create mode 100644
scripts/lib/mic/3rdparty/pykickstart/urlgrabber/sslfactory.py
>  create mode 100644 scripts/lib/mic/3rdparty/pykickstart/version.py
>  create mode 100644 scripts/lib/mic/__init__.py
>  create mode 100644 scripts/lib/mic/__version__.py
>  create mode 100644 scripts/lib/mic/bootstrap.py
>  create mode 100644 scripts/lib/mic/chroot.py
>  create mode 100644 scripts/lib/mic/conf.py
>  create mode 100644 scripts/lib/mic/creator.py
>  create mode 100644 scripts/lib/mic/imager/__init__.py
>  create mode 100644 scripts/lib/mic/imager/baseimager.py
>  create mode 100644 scripts/lib/mic/imager/direct.py
>  create mode 100644 scripts/lib/mic/imager/fs.py
>  create mode 100644 scripts/lib/mic/imager/livecd.py
>  create mode 100644 scripts/lib/mic/imager/liveusb.py
>  create mode 100644 scripts/lib/mic/imager/loop.py
>  create mode 100644 scripts/lib/mic/imager/raw.py
>  create mode 100644 scripts/lib/mic/kickstart/__init__.py
>  create mode 100644 scripts/lib/mic/kickstart/custom_commands/__init__.py
>  create mode 100644 scripts/lib/mic/kickstart/custom_commands/desktop.py
>  create mode 100644
scripts/lib/mic/kickstart/custom_commands/installerfw.py
>  create mode 100644 scripts/lib/mic/kickstart/custom_commands/micboot.py
>  create mode 100644
scripts/lib/mic/kickstart/custom_commands/micpartition.py
>  create mode 100644 scripts/lib/mic/kickstart/custom_commands/micrepo.py
>  create mode 100644 scripts/lib/mic/kickstart/custom_commands/partition.py
>  create mode 100644 scripts/lib/mic/msger.py
>  create mode 100644 scripts/lib/mic/plugin.py
>  create mode 100644 scripts/lib/mic/pluginbase.py
>  create mode 100644 scripts/lib/mic/plugins/backend/yumpkgmgr.py
>  create mode 100755 scripts/lib/mic/plugins/backend/zypppkgmgr.py
>  create mode 100644 scripts/lib/mic/plugins/hook/.py
>  create mode 100644 scripts/lib/mic/plugins/hook/empty_hook.py
>  create mode 100644 scripts/lib/mic/plugins/imager/direct_plugin.py
>  create mode 100644 scripts/lib/mic/plugins/imager/fs_plugin.py
>  create mode 100644 scripts/lib/mic/plugins/imager/livecd_plugin.py
>  create mode 100644 scripts/lib/mic/plugins/imager/liveusb_plugin.py
>  create mode 100644 scripts/lib/mic/plugins/imager/loop_plugin.py
>  create mode 100644 scripts/lib/mic/plugins/imager/raw_plugin.py
>  create mode 100644 scripts/lib/mic/rt_util.py
>  create mode 100644 scripts/lib/mic/test
>  create mode 100644 scripts/lib/mic/utils/BmapCreate.py
>  create mode 100644 scripts/lib/mic/utils/Fiemap.py
>  create mode 100644 scripts/lib/mic/utils/__init__.py
>  create mode 100644 scripts/lib/mic/utils/cmdln.py
>  create mode 100644 scripts/lib/mic/utils/errors.py
>  create mode 100644 scripts/lib/mic/utils/fs_related.py
>  create mode 100644 scripts/lib/mic/utils/gpt_parser.py
>  create mode 100644 scripts/lib/mic/utils/grabber.py
>  create mode 100644 scripts/lib/mic/utils/misc.py
>  create mode 100644 scripts/lib/mic/utils/oe/__init__.py
>  create mode 100644 scripts/lib/mic/utils/oe/misc.py
>  create mode 100644 scripts/lib/mic/utils/partitionedfs.py
>  create mode 100644 scripts/lib/mic/utils/proxy.py
>  create mode 100644 scripts/lib/mic/utils/rpmmisc.py
>  create mode 100644 scripts/lib/mic/utils/runner.py
>  create mode 100755 scripts/wic
>
> --
> 1.7.11.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a11c2275e23606f04e757e173
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Sep 27, 2013 4:17 AM, &quot;Tom Zanussi&quot; &lt;<a href=3D"mailto:tom.=
zanussi@linux.intel.com">tom.zanussi@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This patchset implements a new command named &#39;wic&#39; (for OpenEm=
bedded<br>
&gt; Image Creator). =A0Please see [YOCTO #3847] for extensive background o=
n<br>
&gt; what&#39;s implemented here.</p>
<p dir=3D"ltr">Nice !</p>
<p dir=3D"ltr">Would it be possible to add the MIC as a recipe for native a=
nd nativesdk, with wic patches applied(easier to maintain), and could also =
enable wic to use a package repo when built for nativesdk.</p>
<p dir=3D"ltr">Br,<br>
David<br><br></p>
<p dir=3D"ltr">&gt; This is a completely independent standalone utility tha=
t initially<br>
&gt; provides easier-to-use and more flexible replacements for a couple<br>
&gt; bits of existing functionality in oe-core: directdisk.bbclass and<br>
&gt; mkefidisk.sh. =A0The more interesting aspect of the current patchset<b=
r>
&gt; though is that the replaced (this patchset doesn&#39;t actually replac=
e<br>
&gt; those scripts, however) scripts are implemented by a general-purpose<b=
r>
&gt; partitioning &#39;language&#39; based on Redhat kickstart syntax (with=
 the<br>
&gt; underlying code borrowed from Tizen mic, which in turn was borrowed<br=
>
&gt; from Meego mic, in turn borrowed from Fedora livecd, etc.).<br>
&gt;<br>
&gt; Though this patchset only uses the kickstart syntax related to<br>
&gt; partitioning and bootloaders and only for creating images, because the=
<br>
&gt; code is based on the mic/pykickstart code, future deployment efforts<b=
r>
&gt; such as those partially described by [YOCTO #4106], but also others<br=
>
&gt; including package selection (from e.g. binary feeds) and deployment<br=
>
&gt; configuration of users/network/services, etc, could be implemented<br>
&gt; under this framework, considering that all of those are implemented<br=
>
&gt; in some form by the base system.<br>
&gt;<br>
&gt; The current patchset has successfully been used to generate and boot<b=
r>
&gt; images from core-image-minimal build artifacts using the &#39;mkefidis=
k&#39;<br>
&gt; kickstart file (in scripts/lib/image/canned-wks) on minnow and the<br>
&gt; &#39;directdisk&#39; kickstart file using both core-image-minimal and<=
br>
&gt; core-image-sato artifacts for crownbay.<br>
&gt;<br>
&gt; The &#39;wic&#39; command generates partitioned images from existing<b=
r>
&gt; OpenEmbedded build artifacts. =A0Image generation is driven by<br>
&gt; partitioning commands contained in an &#39;Openembedded kickstart&#39;=
 (.wks)<br>
&gt; file specified either directly on the command-line or as one of a<br>
&gt; selection of canned .wks files (see &#39;wic list images&#39;). =A0Whe=
n applied<br>
&gt; to a given set of build artifacts, the result is an image or set of<br=
>
&gt; images that can be directly written onto media and used on a<br>
&gt; particular system.<br>
&gt;<br>
&gt; It can be used in &#39;raw&#39; mode, where artifacts are explicitly s=
pecified<br>
&gt; via command-line arguments (see example below), or it can be used in a=
<br>
&gt; more easily usable &#39;cooked&#39; mode which uses the current MACHIN=
E<br>
&gt; setting and a specified image name to automatically locate the<br>
&gt; artifacts used to create the image.<br>
&gt;<br>
&gt; OE kickstart files (.wks) can of course be specified directly on the<b=
r>
&gt; command-line, but the user can also choose from a set of &#39;canned&#=
39; .wks<br>
&gt; files available via the &#39;wic list images&#39; command (example bel=
ow).<br>
&gt;<br>
&gt; In any case, the prerequisite for generating any image is to have the<=
br>
&gt; build artifacts already available. =A0The below examples assume the us=
er<br>
&gt; has already build a &#39;core-image-minimal&#39; for a specific machin=
e<br>
&gt; (future versions won&#39;t require this redundant step, but for now th=
at&#39;s<br>
&gt; typically how build artifacts get generated).<br>
&gt;<br>
&gt; The other prerequisite is to source the build environment:<br>
&gt;<br>
&gt; $ source oe-init-build-env<br>
&gt;<br>
&gt; To start out with, we&#39;ll generate an image from one of the canned =
.wks<br>
&gt; files. =A0The following generates a list of availailable images:<br>
&gt;<br>
&gt; $ wic list images<br>
&gt; =A0 mkefidisk =A0 =A0 =A0 =A0 =A0 =A0 Create an EFI disk image<br>
&gt; =A0 directdisk =A0 =A0 =A0 =A0 =A0 =A0Create a &#39;pcbios&#39; direct=
 disk image<br>
&gt;<br>
&gt; You can get more information about any of the available images by typi=
ng<br>
&gt; &#39;wic list xxx help&#39;, where &#39;xxx&#39; is one of the image n=
ames:<br>
&gt;<br>
&gt; $ wic list mkefidisk help<br>
&gt;<br>
&gt; Creates a partitioned EFI disk image that the user<br>
&gt; can directly dd to boot media.<br>
&gt;<br>
&gt; At any time, you can get help on the &#39;wic&#39; command or any subc=
ommand<br>
&gt; (currently &#39;list&#39; and &#39;create&#39;). =A0For instance, to g=
et the description<br>
&gt; of &#39;wic create&#39; command and its parameters:<br>
&gt;<br>
&gt; $ wic create<br>
&gt;<br>
&gt; Usage:<br>
&gt;<br>
&gt; =A0Create a new OpenEmbedded image<br>
&gt;<br>
&gt; =A0usage: wic create &lt;wks file or image name&gt; [-o &lt;DIRNAME&gt=
; | --outdir &lt;DIRNAME&gt;]<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 [-i &lt;JSON PROPERTY FILE&gt; | --infile &lt;=
JSON PROPERTY_FILE&gt;]<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 [-e | --image-name] [-r, --rootfs-dir] [-b, --=
bootimg-dir]<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 [-k, --kernel-dir] [-n, --native-sysroot] [-s,=
 --skip-build-check]<br>
&gt;<br>
&gt; =A0This command creates an OpenEmbedded image based on the &#39;OE kic=
kstart<br>
&gt; =A0commands&#39; found in the &lt;wks file&gt;.<br>
&gt;<br>
&gt; =A0The -o option can be used to place the image in a directory with a<=
br>
&gt; =A0different name and location.<br>
&gt;<br>
&gt; =A0See &#39;wic help create&#39; for more detailed instructions.<br>
&gt;<br>
&gt; ...<br>
&gt;<br>
&gt; As mentioned in the command, you can get even more detailed informatio=
n<br>
&gt; by adding &#39;help&#39; to the above:<br>
&gt;<br>
&gt; $ wic help create<br>
&gt;<br>
&gt; NAME<br>
&gt; =A0 =A0 wic create - Create a new OpenEmbedded image<br>
&gt;<br>
&gt; SYNOPSIS<br>
&gt; =A0 =A0 wic create &lt;wks file or image name&gt; [-o &lt;DIRNAME&gt; =
| --outdir<br>
&gt; &lt;DIRNAME&gt;]<br>
&gt; =A0 =A0 =A0 =A0 [-i &lt;JSON PROPERTY FILE&gt; | --infile &lt;JSON PRO=
PERTY_FILE&gt;]<br>
&gt; =A0 =A0 =A0 =A0 [-e | --image-name] [-r, --rootfs-dir] [-b, --bootimg-=
dir]<br>
&gt; =A0 =A0 =A0 =A0 [-k, --kernel-dir] [-n, --native-sysroot] [-s,<br>
&gt; --skip-build-check]<br>
&gt;<br>
&gt; DESCRIPTION<br>
&gt; =A0 =A0 This command creates an OpenEmbedded image based on the &#39;O=
E<br>
&gt; =A0 =A0 kickstart commands&#39; found in the &lt;wks file&gt;.<br>
&gt;<br>
&gt; =A0 =A0 In order to do this, wic needs to know the locations of the<br=
>
&gt; =A0 =A0 various build artifacts required to build the image.<br>
&gt;<br>
&gt; =A0 =A0 Users can explicitly specify the build artifact locations usin=
g<br>
&gt; =A0 =A0 the -r, -b, -k, and -n options. =A0See below for details on wh=
ere<br>
&gt; =A0 =A0 the corresponding artifacts are typically found in a normal<br=
>
&gt; =A0 =A0 OpenEmbedded build.<br>
&gt;<br>
&gt; =A0 =A0 Alternatively, users can use the -e option to have &#39;mic&#3=
9; determine<br>
&gt; =A0 =A0 those locations for a given image. =A0If the -e option is used=
, the<br>
&gt; =A0 =A0 user needs to have set the appropriate MACHINE variable in<br>
&gt; =A0 =A0 local.conf, and have sourced the build environment.<br>
&gt;<br>
&gt; =A0 =A0 The -e option is used to specify the name of the image to use =
the<br>
&gt; =A0 =A0 artifacts from e.g. core-image-sato.<br>
&gt;<br>
&gt; =A0 =A0 The -r option is used to specify the path to the /rootfs dir t=
o<br>
&gt; =A0 =A0 use as the .wks rootfs source.<br>
&gt;<br>
&gt; =A0 =A0 The -b option is used to specify the path to the dir containin=
g<br>
&gt; =A0 =A0 the boot artifacts (e.g. /EFI or /syslinux dirs) to use as the=
<br>
&gt; =A0 =A0 .wks bootimg source.<br>
&gt;<br>
&gt; =A0 =A0 The -k option is used to specify the path to the dir containin=
g<br>
&gt; =A0 =A0 the kernel to use in the .wks bootimg.<br>
&gt;<br>
&gt; =A0 =A0 The -n option is used to specify the path to the native sysroo=
t<br>
&gt; =A0 =A0 containing the tools to use to build the image.<br>
&gt;<br>
&gt; =A0 =A0 The -s option is used to skip the build check. =A0The build ch=
eck is<br>
&gt; =A0 =A0 a simple sanity check used to determine whether the user has<b=
r>
&gt; =A0 =A0 sourced the build environment so that the -e option can operat=
e<br>
&gt; =A0 =A0 correctly. =A0If the user has specified the build artifact loc=
ations<br>
&gt; =A0 =A0 explicitly, &#39;wic&#39; assumes the user knows what he or sh=
e is doing<br>
&gt; =A0 =A0 and skips the build check.<br>
&gt;<br>
&gt; =A0 =A0 When &#39;wic -e&#39; is used, the locations for the build art=
ifacts<br>
&gt; =A0 =A0 values are determined by &#39;wic -e&#39; from the output of t=
he &#39;bitbake<br>
&gt; =A0 =A0 -e&#39; command given an image name e.g. &#39;core-image-minim=
al&#39; and a<br>
&gt; =A0 =A0 given machine set in local.conf. =A0In that case, the image is=
<br>
&gt; =A0 =A0 created as if the following &#39;bitbake -e&#39; variables wer=
e used:<br>
&gt;<br>
&gt; =A0 =A0 -r: =A0 =A0 =A0 =A0IMAGE_ROOTFS<br>
&gt; =A0 =A0 -k: =A0 =A0 =A0 =A0STAGING_KERNEL_DIR<br>
&gt; =A0 =A0 -n: =A0 =A0 =A0 =A0STAGING_DIR_NATIVE<br>
&gt; =A0 =A0 -b: =A0 =A0 =A0 =A0HDDDIR and STAGING_DATA_DIR (handlers decid=
e which to<br>
&gt; use)<br>
&gt;<br>
&gt; =A0 =A0 If &#39;wic -e&#39; is not used, the user needs to select the =
appropriate<br>
&gt; =A0 =A0 value for -b (as well as -r, -k, and -n).<br>
&gt;<br>
&gt; =A0 =A0 The -o option can be used to place the image in a directory wi=
th a<br>
&gt; =A0 =A0 different name and location.<br>
&gt;<br>
&gt; =A0 =A0 As an alternative to the wks file, the image-specific properti=
es<br>
&gt; =A0 =A0 that define the values that will be used to generate a particu=
lar<br>
&gt; =A0 =A0 image can be specified on the command-line using the -i option=
 and<br>
&gt; =A0 =A0 supplying a JSON object consisting of the set of name:value pa=
irs<br>
&gt; =A0 =A0 needed by image creation.<br>
&gt;<br>
&gt; =A0 =A0 The set of properties available for a given image type can be<=
br>
&gt; =A0 =A0 listed using the &#39;wic list&#39; command.<br>
&gt;<br>
&gt; So, the easiest way to create an image is to use the -e option with a<=
br>
&gt; canned .wks file. =A0To use the -e option, you need to specify the ima=
ge<br>
&gt; used to generate the artifacts and you actually need to have the MACHI=
NE<br>
&gt; used to build them specified in your local.conf (these requirements<br=
>
&gt; aren&#39;t necessary if you aren&#39;t using the -e options. =A0Below,=
 we generate<br>
&gt; a directdisk image, pointing the process at the core-image-minimal<br>
&gt; artifacts for the current MACHINE:<br>
&gt;<br>
&gt; $ wic create directdisk -e core-image-minimal<br>
&gt;<br>
&gt; Checking basic build environment...<br>
&gt; Done.<br>
&gt;<br>
&gt; Creating image(s)...<br>
&gt;<br>
&gt; Info: The new image(s) can be found here:<br>
&gt; =A0 /var/tmp/wic/build/directdisk-201309252350-sda.direct<br>
&gt;<br>
&gt; The following build artifacts were used to create the image(s):<br>
&gt;<br>
&gt; ROOTFS_DIR: =A0 =A0 =A0/home/trz/yocto/yocto-image/build/tmp/work/crow=
nbay_noemgd-poky-linux/core-image-minimal/1.0-r0/rootfs<br>
&gt; BOOTIMG_DIR: =A0 =A0 /home/trz/yocto/yocto-image/build/tmp/sysroots/cr=
ownbay-noemgd/usr/share<br>
&gt; KERNEL_DIR: =A0 =A0 =A0/home/trz/yocto/yocto-image/build/tmp/sysroots/=
crownbay-noemgd/usr/src/kernel<br>
&gt; NATIVE_SYSROOT: =A0/home/trz/yocto/yocto-image/build/tmp/sysroots/crow=
nbay-noemgd/usr/src/kernel<br>
&gt;<br>
&gt; The image(s) were created using OE kickstart file:<br>
&gt; =A0 /home/trz/yocto/yocto-image/scripts/lib/image/canned-wks/directdis=
k.wks<br>
&gt;<br>
&gt; The output shows the name and location of the image created, and so th=
at<br>
&gt; you know exactly what was used to generate the image, each of the<br>
&gt; artifacts and the kickstart file used.<br>
&gt;<br>
&gt; Similarly, I can create a &#39;mkefidisk&#39; image in the same way (n=
otice that<br>
&gt; I&#39;m using a different machine - because I&#39;m using the -e optio=
n, I<br>
&gt; needed to change the MACHINE in my local.conf):<br>
&gt;<br>
&gt; $ wic create mkefidisk -e core-image-minimal<br>
&gt; Checking basic build environment...<br>
&gt; Done.<br>
&gt;<br>
&gt; Creating image(s)...<br>
&gt;<br>
&gt; Info: The new image(s) can be found here:<br>
&gt; =A0 /var/tmp/wic/build/mkefidisk-201309260027-sda.direct<br>
&gt;<br>
&gt; The following build artifacts were used to create the image(s):<br>
&gt;<br>
&gt; ROOTFS_DIR: =A0 =A0 =A0/home/trz/yocto/yocto-image/build/tmp/work/minn=
ow-poky-linux/core-image-minimal/1.0-r0/rootfs<br>
&gt; BOOTIMG_DIR: =A0 =A0 /home/trz/yocto/yocto-image/build/tmp/work/minnow=
-poky-linux/core-image-minimal/1.0-r0/core-image-minimal-1.0/hddimg<br>
&gt; KERNEL_DIR: =A0 =A0 =A0/home/trz/yocto/yocto-image/build/tmp/sysroots/=
minnow/usr/src/kernel<br>
&gt; NATIVE_SYSROOT: =A0/home/trz/yocto/yocto-image/build/tmp/sysroots/minn=
ow/usr/src/kernel<br>
&gt;<br>
&gt; The image(s) were created using OE kickstart file:<br>
&gt; =A0 /home/trz/yocto/yocto-image/scripts/lib/image/canned-wks/mkefidisk=
.wks<br>
&gt;<br>
&gt; Here&#39;s an example that doesn&#39;t take the easy way out and manua=
lly<br>
&gt; specifies each build artifact, along with a non-canned .wks file, and<=
br>
&gt; also uses the -o option to have wic create the output somewhere other<=
br>
&gt; than the default /var/tmp/wic:<br>
&gt;<br>
&gt; $ wic create ~/test.wks -o /home/trz/testwic<br>
&gt; --rootfs-dir /home/trz/yocto/yocto-image/build/tmp/work/crownbay_noemg=
d-poky-linux/core-image-minimal/1.0-r0/rootfs --bootimg-dir /home/trz/yocto=
/yocto-image/build/tmp/sysroots/crownbay-noemgd/usr/share --kernel-dir /hom=
e/trz/yocto/yocto-image/build/tmp/sysroots/crownbay-noemgd/usr/src/kernel -=
-native-sysroot /home/trz/yocto/yocto-image/build/tmp/sysroots/x86_64-linux=
<br>

&gt;<br>
&gt; Creating image(s)...<br>
&gt;<br>
&gt; Info: The new image(s) can be found here:<br>
&gt; =A0 /home/trz/testwic/build/test-201309260032-sda.direct<br>
&gt;<br>
&gt; The following build artifacts were used to create the image(s):<br>
&gt;<br>
&gt; ROOTFS_DIR: =A0 =A0 =A0/home/trz/yocto/yocto-image/build/tmp/work/crow=
nbay_noemgd-poky-linux/core-image-minimal/1.0-r0/rootfs<br>
&gt; BOOTIMG_DIR: =A0 =A0 /home/trz/yocto/yocto-image/build/tmp/sysroots/cr=
ownbay-noemgd/usr/share<br>
&gt; KERNEL_DIR: =A0 =A0 =A0/home/trz/yocto/yocto-image/build/tmp/sysroots/=
crownbay-noemgd/usr/src/kernel<br>
&gt; NATIVE_SYSROOT: =A0/home/trz/yocto/yocto-image/build/tmp/sysroots/crow=
nbay-noemgd/usr/src/kernel<br>
&gt;<br>
&gt; The image(s) were created using OE kickstart file:<br>
&gt; =A0 /home/trz/test.wks<br>
&gt;<br>
&gt; Finally, here&#39;s an example of the actual partition language comman=
ds<br>
&gt; used to generate the mkefidisk image i.e. these are the contents of th=
e<br>
&gt; mkefidisk.wks OE kickstart file:<br>
&gt;<br>
&gt; # short-description: Create an EFI disk image<br>
&gt; # long-description: Creates a partitioned EFI disk image that the user=
<br>
&gt; # can directly dd to boot media.<br>
&gt;<br>
&gt; part /boot --source bootimg --ondisk sda --fstype=3Defi --label msdos =
--active --align 1024<br>
&gt;<br>
&gt; part / --source rootfs --ondisk sda --fstype=3Dext3 --label platform -=
-align 1024<br>
&gt;<br>
&gt; part swap --ondisk sda --size 44 --label swap1 --fstype=3Dswap<br>
&gt;<br>
&gt; bootloader =A0--timeout=3D10 =A0--append=3D&quot;rootwait rootfstype=
=3Dext3 console=3DttyPCH0,115200 console=3Dtty0 vmalloc=3D256MB snd-hda-int=
el.enable_msi=3D0&quot;<br>
&gt;<br>
&gt; The initial &#39;wic&#39; implementation here supports only the basic<=
br>
&gt; kickstart partitioning commands: &#39;partition&#39; (or &#39;part&#39=
; for short) and<br>
&gt; &#39;bootloader&#39;.<br>
&gt;<br>
&gt; Currently, only the options used in the &#39;canned&#39; scripts (in<b=
r>
&gt; scripts/lib/image/canned-wks) are supported.<br>
&gt;<br>
&gt; They&#39;re listed below and mostly follow the syntax and meaning of t=
he<br>
&gt; standard kickstart options for those commands:<br>
&gt;<br>
&gt; <a href=3D"http://fedoraproject.org/wiki/Anaconda/Kickstart#part_or_pa=
rtition">http://fedoraproject.org/wiki/Anaconda/Kickstart#part_or_partition=
</a><br>
&gt; <a href=3D"http://fedoraproject.org/wiki/Anaconda/Kickstart#bootloader=
">http://fedoraproject.org/wiki/Anaconda/Kickstart#bootloader</a><br>
&gt;<br>
&gt; For the &#39;partition&#39; (&#39;part&#39;) command, here are the sup=
ported options:<br>
&gt;<br>
&gt; --source<br>
&gt; =A0 =A0 =A0 =A0 bootimg<br>
&gt; =A0 =A0 =A0 =A0 rootfs<br>
&gt; --ondisk sda<br>
&gt; --size size (in mB)<br>
&gt; --fstype<br>
&gt; =A0 =A0 =A0 =A0 msdos<br>
&gt; =A0 =A0 =A0 =A0 efi<br>
&gt; =A0 =A0 =A0 =A0 ext4<br>
&gt; =A0 =A0 =A0 =A0 ext3<br>
&gt; =A0 =A0 =A0 =A0 ext2<br>
&gt; =A0 =A0 =A0 =A0 btrfs<br>
&gt; =A0 =A0 =A0 =A0 swap<br>
&gt; --label label<br>
&gt; --active<br>
&gt; ---align (in kB)<br>
&gt;<br>
&gt; The --source option is a wic-specific option that can currently have<b=
r>
&gt; one of two values, &#39;bootimg&#39; or &#39;rootfs&#39;.<br>
&gt;<br>
&gt; If &#39;--source rootfs&#39; is used, it tells the wic command to crea=
te a<br>
&gt; partition as large as needed to fill with the contents of /rootfs<br>
&gt; (specified by the -r &#39;wic&#39; option) and to fill it with the con=
tents of<br>
&gt; /rootfs.<br>
&gt;<br>
&gt; If &#39;--source bootimg&#39; is used, it tells the wic command to cre=
ate a<br>
&gt; partition as large as needed to fill with the contents of the boot<br>
&gt; partition (specified by the -b &#39;wic&#39; option). =A0Exactly what =
those<br>
&gt; contents are depend on the value of the --fstype option for that<br>
&gt; partition. =A0If &#39;--fstype=3Defi&#39; is specified, the boot artif=
acts<br>
&gt; contained in HDDDIR are used, and if &#39;--fstype=3Dmsdos&#39; is spe=
cified,<br>
&gt; the boot artifacts found in STAGING_DATADIR are used.<br>
&gt;<br>
&gt; The &#39;--align&#39; option is a mic-specific option that says to sta=
rt a<br>
&gt; partition on an x kB boundary.<br>
&gt;<br>
&gt; For the &#39;bootloader&#39; command, these are the supported options:=
<br>
&gt;<br>
&gt; --timeout<br>
&gt; --append<br>
&gt;<br>
&gt; Future updates will implement more options - using anything not<br>
&gt; explicitly supported can result in unpredicable results.<br>
&gt;<br>
&gt;<br>
&gt; The following changes since commit b049d532f6e0ab9e458e486f81b00be47ee=
69acf:<br>
&gt;<br>
&gt; =A0 testimage: Exclude BB_ORIGENV variable (2013-09-26 17:27:02 +0100)=
<br>
&gt;<br>
&gt; are available in the git repository at:<br>
&gt;<br>
&gt; =A0 git://<a href=3D"http://git.yoctoproject.org/poky-contrib.git">git=
.yoctoproject.org/poky-contrib.git</a> tzanussi/wic-v1<br>
&gt; =A0 <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/=
log/?h=3Dtzanussi/wic-v1">http://git.yoctoproject.org/cgit/cgit.cgi/poky-co=
ntrib/log/?h=3Dtzanussi/wic-v1</a><br>
&gt;<br>
&gt; Tom Zanussi (3):<br>
&gt; =A0 wic: Initial code for wic (OpenEmbedded Image Creator)<br>
&gt; =A0 wic: Add mic w/pykickstart<br>
&gt; =A0 wic: Add OpenEmbedded-specific implementation<br>
&gt;<br>
&gt; =A0scripts/lib/image/__init__.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 22 +<br>
&gt; =A0scripts/lib/image/canned-wks/directdisk.wks =A0 =A0 =A0 =A0| =A0 10=
 +<br>
&gt; =A0scripts/lib/image/canned-wks/mkefidisk.wks =A0 =A0 =A0 =A0 | =A0 11=
 +<br>
&gt; =A0scripts/lib/image/config/wic.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A07 +<br>
&gt; =A0scripts/lib/image/engine.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0280 ++++<br>
&gt; =A0scripts/lib/image/help.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0311 ++++<br>
&gt; =A0scripts/lib/mic/3rdparty/pykickstart/base.py =A0 =A0 =A0 | =A0466 +=
+++++<br>
&gt; =A0.../mic/3rdparty/pykickstart/commands/__init__.py =A0| =A0 26 +<br>
&gt; =A0.../3rdparty/pykickstart/commands/authconfig.py =A0 =A0| =A0 40 +<b=
r>
&gt; =A0.../mic/3rdparty/pykickstart/commands/autopart.py =A0| =A0119 ++<br=
>
&gt; =A0.../mic/3rdparty/pykickstart/commands/autostep.py =A0| =A0 55 +<br>
&gt; =A0.../3rdparty/pykickstart/commands/bootloader.py =A0 =A0| =A0265 +++=
+<br>
&gt; =A0.../mic/3rdparty/pykickstart/commands/clearpart.py | =A0 86 ++<br>
&gt; =A0.../mic/3rdparty/pykickstart/commands/device.py =A0 =A0| =A0125 ++<=
br>
&gt; =A0.../3rdparty/pykickstart/commands/deviceprobe.py =A0 | =A0 40 +<br>
&gt; =A0.../3rdparty/pykickstart/commands/displaymode.py =A0 | =A0 68 +<br>
&gt; =A0.../mic/3rdparty/pykickstart/commands/dmraid.py =A0 =A0| =A0 91 ++<=
br>
&gt; =A0.../3rdparty/pykickstart/commands/driverdisk.py =A0 =A0| =A0184 +++=
<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/commands/fcoe.py =A0| =A0114 ++<br=
>
&gt; =A0.../mic/3rdparty/pykickstart/commands/firewall.py =A0| =A0193 +++<b=
r>
&gt; =A0.../mic/3rdparty/pykickstart/commands/firstboot.py | =A0 62 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/commands/group.py | =A0 88 ++<br>
&gt; =A0.../3rdparty/pykickstart/commands/ignoredisk.py =A0 =A0| =A0139 ++<=
br>
&gt; =A0.../3rdparty/pykickstart/commands/interactive.py =A0 | =A0 58 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/commands/iscsi.py | =A0133 ++<br>
&gt; =A0.../mic/3rdparty/pykickstart/commands/iscsiname.py | =A0 54 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/commands/key.py =A0 | =A0 64 +<br>
&gt; =A0.../mic/3rdparty/pykickstart/commands/keyboard.py =A0| =A0 55 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/commands/lang.py =A0| =A0 60 +<br>
&gt; =A0.../3rdparty/pykickstart/commands/langsupport.py =A0 | =A0 58 +<br>
&gt; =A0.../mic/3rdparty/pykickstart/commands/lilocheck.py | =A0 54 +<br>
&gt; =A0.../mic/3rdparty/pykickstart/commands/logging.py =A0 | =A0 66 +<br>
&gt; =A0.../mic/3rdparty/pykickstart/commands/logvol.py =A0 =A0| =A0304 +++=
+<br>
&gt; =A0.../3rdparty/pykickstart/commands/mediacheck.py =A0 =A0| =A0 53 +<b=
r>
&gt; =A0.../mic/3rdparty/pykickstart/commands/method.py =A0 =A0| =A0186 +++=
<br>
&gt; =A0.../mic/3rdparty/pykickstart/commands/monitor.py =A0 | =A0106 ++<br=
>
&gt; =A0.../lib/mic/3rdparty/pykickstart/commands/mouse.py | =A0 70 +<br>
&gt; =A0.../mic/3rdparty/pykickstart/commands/multipath.py | =A0111 ++<br>
&gt; =A0.../mic/3rdparty/pykickstart/commands/network.py =A0 | =A0363 +++++=
<br>
&gt; =A0.../mic/3rdparty/pykickstart/commands/partition.py | =A0353 +++++<b=
r>
&gt; =A0.../lib/mic/3rdparty/pykickstart/commands/raid.py =A0| =A0365 +++++=
<br>
&gt; =A0.../mic/3rdparty/pykickstart/commands/reboot.py =A0 =A0| =A0 79 +<b=
r>
&gt; =A0.../lib/mic/3rdparty/pykickstart/commands/repo.py =A0| =A0249 +++<b=
r>
&gt; =A0.../mic/3rdparty/pykickstart/commands/rescue.py =A0 =A0| =A0 68 +<b=
r>
&gt; =A0.../mic/3rdparty/pykickstart/commands/rootpw.py =A0 =A0| =A0 93 ++<=
br>
&gt; =A0.../mic/3rdparty/pykickstart/commands/selinux.py =A0 | =A0 64 +<br>
&gt; =A0.../mic/3rdparty/pykickstart/commands/services.py =A0| =A0 71 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/commands/skipx.py | =A0 54 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/commands/sshpw.py | =A0105 ++<br>
&gt; =A0.../mic/3rdparty/pykickstart/commands/timezone.py =A0| =A0 86 ++<br=
>
&gt; =A0.../mic/3rdparty/pykickstart/commands/updates.py =A0 | =A0 60 +<br>
&gt; =A0.../mic/3rdparty/pykickstart/commands/upgrade.py =A0 | =A0106 ++<br=
>
&gt; =A0.../lib/mic/3rdparty/pykickstart/commands/user.py =A0| =A0173 +++<b=
r>
&gt; =A0.../lib/mic/3rdparty/pykickstart/commands/vnc.py =A0 | =A0114 ++<br=
>
&gt; =A0.../mic/3rdparty/pykickstart/commands/volgroup.py =A0| =A0102 ++<br=
>
&gt; =A0.../mic/3rdparty/pykickstart/commands/xconfig.py =A0 | =A0184 +++<b=
r>
&gt; =A0.../mic/3rdparty/pykickstart/commands/zerombr.py =A0 | =A0 69 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/commands/zfcp.py =A0| =A0134 ++<br=
>
&gt; =A0scripts/lib/mic/3rdparty/pykickstart/constants.py =A0| =A0 57 +<br>
&gt; =A0scripts/lib/mic/3rdparty/pykickstart/errors.py =A0 =A0 | =A0103 ++<=
br>
&gt; =A0.../mic/3rdparty/pykickstart/handlers/control.py =A0 | 1307 +++++++=
+++++++++<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/handlers/f10.py =A0 | =A0 24 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/handlers/f11.py =A0 | =A0 24 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/handlers/f12.py =A0 | =A0 24 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/handlers/f13.py =A0 | =A0 24 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/handlers/f14.py =A0 | =A0 24 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/handlers/f15.py =A0 | =A0 24 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/handlers/f16.py =A0 | =A0 24 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/handlers/f7.py =A0 =A0| =A0 24 +<b=
r>
&gt; =A0.../lib/mic/3rdparty/pykickstart/handlers/f8.py =A0 =A0| =A0 24 +<b=
r>
&gt; =A0.../lib/mic/3rdparty/pykickstart/handlers/f9.py =A0 =A0| =A0 24 +<b=
r>
&gt; =A0.../lib/mic/3rdparty/pykickstart/handlers/fc3.py =A0 | =A0 24 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/handlers/fc4.py =A0 | =A0 24 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/handlers/fc5.py =A0 | =A0 24 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/handlers/fc6.py =A0 | =A0 24 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/handlers/rhel3.py | =A0 24 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/handlers/rhel4.py | =A0 24 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/handlers/rhel5.py | =A0 24 +<br>
&gt; =A0.../lib/mic/3rdparty/pykickstart/handlers/rhel6.py | =A0 24 +<br>
&gt; =A0scripts/lib/mic/3rdparty/pykickstart/ko.py =A0 =A0 =A0 =A0 | =A0 37=
 +<br>
&gt; =A0scripts/lib/mic/3rdparty/pykickstart/options.py =A0 =A0| =A0204 +++=
<br>
&gt; =A0scripts/lib/mic/3rdparty/pykickstart/parser.py =A0 =A0 | =A0702 +++=
++++++<br>
&gt; =A0scripts/lib/mic/3rdparty/pykickstart/sections.py =A0 | =A0244 +++<b=
r>
&gt; =A0.../3rdparty/pykickstart/urlgrabber/__init__.py =A0 =A0| =A0 53 +<b=
r>
&gt; =A0.../3rdparty/pykickstart/urlgrabber/byterange.py =A0 | =A0463 +++++=
+<br>
&gt; =A0.../mic/3rdparty/pykickstart/urlgrabber/grabber.py | 1477 +++++++++=
+++++++++<br>
&gt; =A0.../3rdparty/pykickstart/urlgrabber/keepalive.py =A0 | =A0617 +++++=
+++<br>
&gt; =A0.../mic/3rdparty/pykickstart/urlgrabber/mirror.py =A0| =A0458 +++++=
+<br>
&gt; =A0.../3rdparty/pykickstart/urlgrabber/progress.py =A0 =A0| =A0530 +++=
++++<br>
&gt; =A0.../3rdparty/pykickstart/urlgrabber/sslfactory.py =A0| =A0 90 ++<br=
>
&gt; =A0scripts/lib/mic/3rdparty/pykickstart/version.py =A0 =A0| =A0197 +++=
<br>
&gt; =A0scripts/lib/mic/__init__.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A04 +<br>
&gt; =A0scripts/lib/mic/__version__.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A01 +<br>
&gt; =A0scripts/lib/mic/bootstrap.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0279 ++++<br>
&gt; =A0scripts/lib/mic/chroot.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0343 +++++<br>
&gt; =A0scripts/lib/mic/conf.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0201 +++<br>
&gt; =A0scripts/lib/mic/creator.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0351 +++++<br>
&gt; =A0scripts/lib/mic/imager/baseimager.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
1265 ++++++++++++++++<br>
&gt; =A0scripts/lib/mic/imager/direct.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0472 ++++++<br>
&gt; =A0scripts/lib/mic/imager/fs.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 99 ++<br>
&gt; =A0scripts/lib/mic/imager/livecd.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0750 +++++++++<br>
&gt; =A0scripts/lib/mic/imager/liveusb.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0308 ++++<br>
&gt; =A0scripts/lib/mic/imager/loop.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0418 ++++++<br>
&gt; =A0scripts/lib/mic/imager/raw.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0501 +++++++<br>
&gt; =A0scripts/lib/mic/kickstart/__init__.py =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0892 +++++++++++<br>
&gt; =A0.../lib/mic/kickstart/custom_commands/__init__.py =A0| =A0 17 +<br>
&gt; =A0.../lib/mic/kickstart/custom_commands/desktop.py =A0 | =A0 95 ++<br=
>
&gt; =A0.../mic/kickstart/custom_commands/installerfw.py =A0 | =A0 63 +<br>
&gt; =A0.../lib/mic/kickstart/custom_commands/micboot.py =A0 | =A0 49 +<br>
&gt; =A0.../mic/kickstart/custom_commands/micpartition.py =A0| =A0 57 +<br>
&gt; =A0.../lib/mic/kickstart/custom_commands/micrepo.py =A0 | =A0127 ++<br=
>
&gt; =A0.../lib/mic/kickstart/custom_commands/partition.py | =A0370 +++++<b=
r>
&gt; =A0scripts/lib/mic/msger.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 | =A0309 ++++<br>
&gt; =A0scripts/lib/mic/plugin.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0102 ++<br>
&gt; =A0scripts/lib/mic/pluginbase.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0101 ++<br>
&gt; =A0scripts/lib/mic/plugins/backend/yumpkgmgr.py =A0 =A0 =A0 | =A0490 +=
+++++<br>
&gt; =A0scripts/lib/mic/plugins/backend/zypppkgmgr.py =A0 =A0 =A0| =A0973 +=
+++++++++++<br>
&gt; =A0scripts/lib/mic/plugins/hook/empty_hook.py =A0 =A0 =A0 =A0 | =A0 =
=A03 +<br>
&gt; =A0scripts/lib/mic/plugins/imager/direct_plugin.py =A0 =A0| =A0 92 ++<=
br>
&gt; =A0scripts/lib/mic/plugins/imager/fs_plugin.py =A0 =A0 =A0 =A0| =A0143=
 ++<br>
&gt; =A0scripts/lib/mic/plugins/imager/livecd_plugin.py =A0 =A0| =A0255 +++=
+<br>
&gt; =A0scripts/lib/mic/plugins/imager/liveusb_plugin.py =A0 | =A0260 ++++<=
br>
&gt; =A0scripts/lib/mic/plugins/imager/loop_plugin.py =A0 =A0 =A0| =A0255 +=
+++<br>
&gt; =A0scripts/lib/mic/plugins/imager/raw_plugin.py =A0 =A0 =A0 | =A0275 +=
+++<br>
&gt; =A0scripts/lib/mic/rt_util.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0223 +++<br>
&gt; =A0scripts/lib/mic/test =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 | =A0 =A01 +<br>
&gt; =A0scripts/lib/mic/utils/BmapCreate.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0298 ++++<br>
&gt; =A0scripts/lib/mic/utils/Fiemap.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0252 ++++<br>
&gt; =A0scripts/lib/mic/utils/cmdln.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | 1586 ++++++++++++++++++++<br>
&gt; =A0scripts/lib/mic/utils/errors.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 71 +<br>
&gt; =A0scripts/lib/mic/utils/fs_related.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| 1057 +++++++++++++<br>
&gt; =A0scripts/lib/mic/utils/gpt_parser.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0331 ++++<br>
&gt; =A0scripts/lib/mic/utils/grabber.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 97 ++<br>
&gt; =A0scripts/lib/mic/utils/misc.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| 1067 +++++++++++++<br>
&gt; =A0scripts/lib/mic/utils/oe/__init__.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 22 +<br>
&gt; =A0scripts/lib/mic/utils/oe/misc.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0108 ++<br>
&gt; =A0scripts/lib/mic/utils/partitionedfs.py =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0776 ++++++++++<br>
&gt; =A0scripts/lib/mic/utils/proxy.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0183 +++<br>
&gt; =A0scripts/lib/mic/utils/rpmmisc.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0600 ++++++++<br>
&gt; =A0scripts/lib/mic/utils/runner.py =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0109 ++<br>
&gt; =A0scripts/wic =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0| =A0185 +++<br>
&gt; =A0141 files changed, 30983 insertions(+)<br>
&gt; =A0create mode 100644 scripts/lib/image/__init__.py<br>
&gt; =A0create mode 100644 scripts/lib/image/canned-wks/directdisk.wks<br>
&gt; =A0create mode 100644 scripts/lib/image/canned-wks/mkefidisk.wks<br>
&gt; =A0create mode 100644 scripts/lib/image/config/wic.conf<br>
&gt; =A0create mode 100644 scripts/lib/image/engine.py<br>
&gt; =A0create mode 100644 scripts/lib/image/help.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/__init__.py=
<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/base.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/__=
init__.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/au=
thconfig.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/au=
topart.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/au=
tostep.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/bo=
otloader.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/cl=
earpart.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/de=
vice.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/de=
viceprobe.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/di=
splaymode.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/dm=
raid.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/dr=
iverdisk.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/fc=
oe.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/fi=
rewall.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/fi=
rstboot.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/gr=
oup.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/ig=
noredisk.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/in=
teractive.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/is=
csi.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/is=
csiname.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/ke=
y.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/ke=
yboard.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/la=
ng.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/la=
ngsupport.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/li=
locheck.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/lo=
gging.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/lo=
gvol.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/me=
diacheck.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/me=
thod.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/mo=
nitor.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/mo=
use.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/mu=
ltipath.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/ne=
twork.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/pa=
rtition.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/ra=
id.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/re=
boot.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/re=
po.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/re=
scue.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/ro=
otpw.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/se=
linux.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/se=
rvices.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/sk=
ipx.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/ss=
hpw.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/ti=
mezone.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/up=
dates.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/up=
grade.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/us=
er.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/vn=
c.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/vo=
lgroup.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/xc=
onfig.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/ze=
rombr.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/zf=
cp.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/constants.p=
y<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/errors.py<b=
r>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/__=
init__.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/co=
ntrol.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f1=
0.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f1=
1.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f1=
2.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f1=
3.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f1=
4.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f1=
5.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f1=
6.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f7=
.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f8=
.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f9=
.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc=
3.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc=
4.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc=
5.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc=
6.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rh=
el3.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rh=
el4.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rh=
el5.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rh=
el6.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/ko.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/options.py<=
br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/parser.py<b=
r>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/sections.py=
<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/=
__init__.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/=
byterange.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/=
grabber.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/=
keepalive.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/=
mirror.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/=
progress.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/=
sslfactory.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/3rdparty/pykickstart/version.py<=
br>
&gt; =A0create mode 100644 scripts/lib/mic/__init__.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/__version__.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/bootstrap.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/chroot.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/conf.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/creator.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/imager/__init__.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/imager/baseimager.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/imager/direct.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/imager/fs.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/imager/livecd.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/imager/liveusb.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/imager/loop.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/imager/raw.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/kickstart/__init__.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/kickstart/custom_commands/__init=
__.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/kickstart/custom_commands/deskto=
p.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/kickstart/custom_commands/instal=
lerfw.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/kickstart/custom_commands/micboo=
t.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/kickstart/custom_commands/micpar=
tition.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/kickstart/custom_commands/micrep=
o.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/kickstart/custom_commands/partit=
ion.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/msger.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/plugin.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/pluginbase.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/plugins/backend/yumpkgmgr.py<br>
&gt; =A0create mode 100755 scripts/lib/mic/plugins/backend/zypppkgmgr.py<br=
>
&gt; =A0create mode 100644 scripts/lib/mic/plugins/hook/.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/plugins/hook/empty_hook.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/plugins/imager/direct_plugin.py<=
br>
&gt; =A0create mode 100644 scripts/lib/mic/plugins/imager/fs_plugin.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/plugins/imager/livecd_plugin.py<=
br>
&gt; =A0create mode 100644 scripts/lib/mic/plugins/imager/liveusb_plugin.py=
<br>
&gt; =A0create mode 100644 scripts/lib/mic/plugins/imager/loop_plugin.py<br=
>
&gt; =A0create mode 100644 scripts/lib/mic/plugins/imager/raw_plugin.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/rt_util.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/test<br>
&gt; =A0create mode 100644 scripts/lib/mic/utils/BmapCreate.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/utils/Fiemap.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/utils/__init__.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/utils/cmdln.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/utils/errors.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/utils/fs_related.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/utils/gpt_parser.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/utils/grabber.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/utils/misc.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/utils/oe/__init__.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/utils/oe/misc.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/utils/partitionedfs.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/utils/proxy.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/utils/rpmmisc.py<br>
&gt; =A0create mode 100644 scripts/lib/mic/utils/runner.py<br>
&gt; =A0create mode 100755 scripts/wic<br>
&gt;<br>
&gt; --<br>
&gt; 1.7.11.4<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--001a11c2275e23606f04e757e173--
