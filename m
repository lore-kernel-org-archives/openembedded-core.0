Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 88B7B6B21F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 01:33:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Jul 2013 18:34:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,697,1367996400"; d="scan'208";a="372892897"
Received: from unknown (HELO [10.255.13.233]) ([10.255.13.233])
	by orsmga002.jf.intel.com with ESMTP; 18 Jul 2013 18:33:59 -0700
Message-ID: <1374197639.27885.26.camel@envy.home>
From: Darren Hart <dvhart@linux.intel.com>
To: Jonathan Liu <net147@gmail.com>
Date: Thu, 18 Jul 2013 18:33:59 -0700
In-Reply-To: <CANwerB35Z3ggbVG=vQ5oVVTB_UTCZvFFUHGQh5adB+F82px1xQ@mail.gmail.com>
References: <cover.1367919920.git.liezhi.yang@windriver.com>
	<CANwerB3vdQu+WCYv-WzBMMFyv77LymqLkjp3wVMFHCO=KF53Dg@mail.gmail.com>
	<5190B127.40400@windriver.com> <5190B770.9050109@gmail.com>
	<5190C570.40700@windriver.com> <5190E932.2010604@gmail.com>
	<5191CC89.5030204@windriver.com> <51D82E76.3080202@gmail.com>
	<51E7E067.7000701@windriver.com> <51E7E9FD.3090505@gmail.com>
	<51E801C1.5000004@windriver.com>
	<CANwerB35Z3ggbVG=vQ5oVVTB_UTCZvFFUHGQh5adB+F82px1xQ@mail.gmail.com>
Organization: Intel
X-Mailer: Evolution 3.8.3 (3.8.3-2.fc19) 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] replace genext2fs with populate-extfs.sh
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
X-List-Received-Date: Fri, 19 Jul 2013 01:33:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-07-19 at 11:31 +1000, Jonathan Liu wrote:
> Hi Robert,
> 
> I tested your patches with my ext4 image on Intel Atom D2500HN board
> and it is working well.
> Previously I have been using custom image class which requires root
> privileges as I need to be able to specify custom options to mkfs.ext4
> which are not available with genext2fs and cannot be set with tune2fs
> afterwards. Using your patches I just put the extra options in
> EXTRA_IMAGECMD with ext4 image class and I no longer need root
> privileges for building image. =)

That's fantastic. Thank you for testing Jonathan. Congrats Robert, great
to see it improving things for people.

--
Darren

> 
> Thanks for your efforts.
> 
> Regards,
> Jonathan
> 
> On 19 July 2013 00:54, Robert Yang <liezhi.yang@windriver.com> wrote:
> >
> > Hi Jonathan,
> >
> > I've updated it a little, please make sure that you get the newest patches,
> > I've payed most of the time on e2fsprogs itself atm, so I didn't do enough
> > testing of the image (I will do it sooner)  thank you very much for focusing
> > on this.
> >
> > // Robert
> >
> >
> > On 07/18/2013 09:13 PM, Jonathan Liu wrote:
> >>
> >> On 18/07/2013 10:32 PM, Robert Yang wrote:
> >>>
> >>>
> >>> On 07/06/2013 10:49 PM, Jonathan Liu wrote:
> >>>>
> >>>> Any updates?
> >>>>
> >>>
> >>> Hi Jonathan,
> >>>
> >>> I've updated the patches, now they are working well, the "fsck -fn" finds
> >>> no errors any more, but I have to send the patches to the ext4 mailing
> >>> list
> >>> firstly, you can try it if you are interested in it atm.:
> >>>
> >>>   git://git.pokylinux.org/poky-contrib robert/image
> >>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/image
> >>>
> >>>
> >>> Robert Yang (5):
> >>>   e2fsprogs: the max length of debugfs argument is too short
> >>>   e2fsprogs: let debugfs do sparse copy
> >>>   e2fsprogs: only update the icache for ext2_inode
> >>>   e2fsprogs: add populate-extfs.sh
> >>>   image_types.bbclass: replace genext2fs with populate-extfs.sh
> >>>
> >>>  meta/classes/image_types.bbclass                   |  46 +++---
> >>>  .../e2fsprogs-1.42.8/debugfs-too-short.patch       |  28 ++++
> >>>  .../e2fsprogs/e2fsprogs-1.42.8/fix-icache.patch    |  69 ++++++++
> >>>  .../e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh   |  96 +++++++++++
> >>>  .../e2fsprogs/e2fsprogs-1.42.8/sparse_copy.patch   | 177
> >>> +++++++++++++++++++++
> >>>  .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb |   5 +
> >>>  6 files changed, 393 insertions(+), 28 deletions(-)
> >>>  create mode 100644
> >>> meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-too-short.patch
> >>>  create mode 100644
> >>> meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/fix-icache.patch
> >>>  create mode 100644
> >>> meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
> >>>  create mode 100644
> >>> meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/sparse_copy.patch
> >>>
> >>> // Robert
> >>
> >> Thanks, I will test it tomorrow. "yes | mkfs.$fstype" could probably be
> >> replaced
> >> with "mkfs.$fstype -F".
> >>
> >> Regards,
> >> Jonathan
> >>>
> >>>
> >>>> Regards,
> >>>> Jonathan
> >>>>>
> >>>>>
> >>>>>> meta: f7afeeb75993b159bb8959e0309bc5eb3978a8fb
> >>>>>>
> >>>>>> conf/local.conf:
> >>>>>> BB_NUMBER_THREADS = "8"
> >>>>>> PARALLEL_MAKE = "-j 8"
> >>>>>> MACHINE ??= "qemux86"
> >>>>>> DISTRO ?= "poky"
> >>>>>> PACKAGE_CLASSES = "package_ipk"
> >>>>>> EXTRA_IMAGE_FEATURES = "debug-tweaks"
> >>>>>> USER_CLASSES ?= "buildstats image-mklibs image-prelink"
> >>>>>> PATCHRESOLVE = "noop"
> >>>>>> BB_DISKMON_DIRS = "\
> >>>>>>      STOPTASKS,${TMPDIR},1G,100K \
> >>>>>>      STOPTASKS,${DL_DIR},1G,100K \
> >>>>>>      STOPTASKS,${SSTATE_DIR},1G,100K \
> >>>>>>      ABORT,${TMPDIR},100M,1K \
> >>>>>>      ABORT,${DL_DIR},100M,1K \
> >>>>>>      ABORT,${SSTATE_DIR},100M,1K"
> >>>>>> CONF_VERSION = "1"
> >>>>>> DISTRO_FEATURES_append = " systemd"
> >>>>>> DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
> >>>>>> VIRTUAL-RUNTIME_init_manager = "systemd"
> >>>>>> IMAGE_FSTYPES = "ext4"
> >>>>>>
> >>>>>> # bitbake core-image-minimal
> >>>>>> # fsck.ext4 -fn tmp/deploy/images/core-image-minimal-qemux86.ext4
> >>>>>>
> >>>>>> Regards,
> >>>>>> Jonathan
> >>>>>>>
> >>>>>>>
> >>>>>>>> distro conf:
> >>>>>>>> DISTRO_FEATURES_append = " largefile opengl systemd"
> >>>>>>>> DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
> >>>>>>>> VIRTUAL-RUNTIME_graphical_init_manager = ""
> >>>>>>>> VIRTUAL-RUNTIME_init_manager = "systemd"
> >>>>>>>> PACKAGE_CLASSES = "package_ipk"
> >>>>>>>>
> >>>>>>>> image bb:
> >>>>>>>> SYSLINUX_ROOT ?= "root=/dev/sda2"
> >>>>>>>> SYSLINUX_PROMPT = "0"
> >>>>>>>> SYSLINUX_TIMEOUT = "1"
> >>>>>>>> SYSLINUX_LABELS = "boot"
> >>>>>>>> LABELS_append = " ${SYSLINUX_LABELS} "
> >>>>>>>> do_bootdirectdisk[depends] += "${PN}:do_rootfs"
> >>>>>>>> APPEND += "rootfstype=ext4 rw"
> >>>>>>>> ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext4"
> >>>>>>>> inherit boot-directdisk
> >>>>>>>> IMAGE_FEATURES += "hwcodecs package-management ssh-server-openssh
> >>>>>>>> x11"
> >>>>>>>> IMAGE_FSTYPES = "ext4"
> >>>>>>>> IMAGE_LINGUAS = ""
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> My configuration:
> >>>>>>>>> MACHINE = "qemux86"
> >>>>>>>>> IMAGE_FSTYPES += "ext4"
> >>>>>>>>>
> >>>>>>>>> // Robert
> >>>>>>>>>
> >>>>>>>>> On 05/13/2013 12:59 PM, Jonathan Liu wrote:
> >>>>>>>>>>
> >>>>>>>>>> Hi Robert,
> >>>>>>>>>>
> >>>>>>>>>> I get the following errors doing filesystem check on the ext4
> >>>>>>>>>> image:
> >>>>>>>>>>
> >>>>>>>>>> # fsck.ext4 -fn tmp/deploy/images/custom-image-custom.ext4.ext4
> >>>>>>>>>> e2fsck 1.42.7 (21-Jan-2013)
> >>>>>>>>>> Pass 1: Checking inodes, blocks, and sizes
> >>>>>>>>>> Pass 2: Checking directory structure
> >>>>>>>>>> Entry 'mtd7' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'mtd4' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'fb0' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'mtd5' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'tty' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'tty6' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'random' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'mtd1' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'urandom' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'zero' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'null' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'kmsg' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'kmem' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'mtd6' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'tty7' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'tty4' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'apm_bios' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'tty5' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'mtd0' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'tty0' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'ttySA0' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'mem' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'mtd2' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'tty8' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'console' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'ttyS0' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should
> >>>>>>>>>> be 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'tty2' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'mtd3' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'tty1' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Entry 'tty3' in /dev (2739) has an incorrect filetype (was 4,
> >>>>>>>>>> should be
> >>>>>>>>>> 3).
> >>>>>>>>>> Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Pass 3: Checking directory connectivity
> >>>>>>>>>> Pass 4: Checking reference counts
> >>>>>>>>>> Inode 774 ref count is 9, should be 10.  Fix? no
> >>>>>>>>>>
> >>>>>>>>>> Pass 5: Checking group summary information
> >>>>>>>>>>
> >>>>>>>>>> tmp/deploy/images/custom-image-custom.ext4.ext4: **********
> >>>>>>>>>> WARNING:
> >>>>>>>>>> Filesystem still has errors **********
> >>>>>>>>>>
> >>>>>>>>>> tmp/deploy/images/custom-image-custom.ext4.ext4: 3899/21336 files
> >>>>>>>>>> (0.5%
> >>>>>>>>>> non-contiguous), 131042/169656 blocks
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> After booting the image I get the following:
> >>>>>>>>>> # dmesg | grep EXT4-fs
> >>>>>>>>>> EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts:
> >>>>>>>>>> (null)
> >>>>>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883:
> >>>>>>>>>> comm
> >>>>>>>>>> systemd: bad header/extent: invalid magic - magic 0, entries 0,
> >>>>>>>>>> max 0(0),
> >>>>>>>>>> depth 0(0)
> >>>>>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883:
> >>>>>>>>>> comm
> >>>>>>>>>> systemd: bad header/extent: invalid magic - magic 0, entries 0,
> >>>>>>>>>> max 0(0),
> >>>>>>>>>> depth 0(0)
> >>>>>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883:
> >>>>>>>>>> comm
> >>>>>>>>>> systemd: bad header/extent: invalid magic - magic 0, entries 0,
> >>>>>>>>>> max 0(0),
> >>>>>>>>>> depth 0(0)
> >>>>>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883:
> >>>>>>>>>> comm
> >>>>>>>>>> systemd-machine: bad header/extent: invalid magic - magic 0,
> >>>>>>>>>> entries 0,
> >>>>>>>>>> max
> >>>>>>>>>> 0(0), depth 0(0)
> >>>>>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883:
> >>>>>>>>>> comm
> >>>>>>>>>> systemd-machine: bad header/extent: invalid magic - magic 0,
> >>>>>>>>>> entries 0,
> >>>>>>>>>> max
> >>>>>>>>>> 0(0), depth 0(0)
> >>>>>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883:
> >>>>>>>>>> comm
> >>>>>>>>>> systemd-journal: bad header/extent: invalid magic - magic 0,
> >>>>>>>>>> entries 0,
> >>>>>>>>>> max
> >>>>>>>>>> 0(0), depth 0(0)
> >>>>>>>>>> EXT4-fs (sda2): re-mounted. Opts: (null)
> >>>>>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883:
> >>>>>>>>>> comm
> >>>>>>>>>> systemd-journal: bad header/extent: invalid magic - magic 0,
> >>>>>>>>>> entries 0,
> >>>>>>>>>> max
> >>>>>>>>>> 0(0), depth 0(0)
> >>>>>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883:
> >>>>>>>>>> comm
> >>>>>>>>>> systemd-journal: bad header/extent: invalid magic - magic 0,
> >>>>>>>>>> entries 0,
> >>>>>>>>>> max
> >>>>>>>>>> 0(0), depth 0(0)
> >>>>>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883:
> >>>>>>>>>> comm
> >>>>>>>>>> systemd-journal: bad header/extent: invalid magic - magic 0,
> >>>>>>>>>> entries 0,
> >>>>>>>>>> max
> >>>>>>>>>> 0(0), depth 0(0)
> >>>>>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883:
> >>>>>>>>>> comm
> >>>>>>>>>> systemd-journal: bad header/extent: invalid magic - magic 0,
> >>>>>>>>>> entries 0,
> >>>>>>>>>> max
> >>>>>>>>>> 0(0), depth 0(0)
> >>>>>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #810:
> >>>>>>>>>> comm
> >>>>>>>>>> login: bad header/extent: invalid magic - magic 0, entries 0, max
> >>>>>>>>>> 0(0),
> >>>>>>>>>> depth 0(0)
> >>>>>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #810:
> >>>>>>>>>> comm
> >>>>>>>>>> sshd: bad header/extent: invalid magic - magic 0, entries 0, max
> >>>>>>>>>> 0(0),
> >>>>>>>>>> depth 0(0)
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> # systemctl --failed | cat
> >>>>>>>>>> UNIT                     LOAD   ACTIVE SUB DESCRIPTION
> >>>>>>>>>> machineid.service        loaded failed failed Machine ID first
> >>>>>>>>>> boot
> >>>>>>>>>> configure
> >>>>>>>>>> systemd-journald.service loaded failed failed Journal Service
> >>>>>>>>>> systemd-journald.socket  loaded failed failed Journal Socket
> >>>>>>>>>>
> >>>>>>>>>> LOAD   = Reflects whether the unit definition was properly loaded.
> >>>>>>>>>> ACTIVE = The high-level unit activation state, i.e. generalization
> >>>>>>>>>> of SUB.
> >>>>>>>>>> SUB    = The low-level unit activation state, values depend on
> >>>>>>>>>> unit type.
> >>>>>>>>>>
> >>>>>>>>>> 3 loaded units listed. Pass --all to see loaded but inactive
> >>>>>>>>>> units, too.
> >>>>>>>>>> To show all installed unit files use 'systemctl list-unit-files'.
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> I am booting kernel with rootfstype=ext4. IMAGE_FSTYPES = "ext4".
> >>>>>>>>>>
> >>>>>>>>>> Regards,
> >>>>>>>>>> Jonathan
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> On 7 May 2013 19:48, Robert Yang <liezhi.yang@windriver.com>
> >>>>>>>>>> wrote:
> >>>>>>>>>>
> >>>>>>>>>>> * The benefits:
> >>>>>>>>>>>    - Really support ext4
> >>>>>>>>>>>    - Support the sparse file (the sparse file became into the
> >>>>>>>>>>> common file
> >>>>>>>>>>> before)
> >>>>>>>>>>>    - Have a uniform code for ext2/3/4 generation
> >>>>>>>>>>>    - Remove the depends on genext2fs-native
> >>>>>>>>>>>
> >>>>>>>>>>> * Impact
> >>>>>>>>>>>    - Build time:
> >>>>>>>>>>>      a) If we build fresh core-image-sato, there is nearly no
> >>>>>>>>>>> impact.
> >>>>>>>>>>>      b) If we do the image generation, which means:
> >>>>>>>>>>>         $ bitbake core-image-sato
> >>>>>>>>>>>         $ bitbake core-image-sato -ccleansstate
> >>>>>>>>>>>         $ bitbake core-image-sato
> >>>>>>>>>>>     About 50 extra seconds are needed, here is my test result:
> >>>>>>>>>>>     Before the patches: 4m25s
> >>>>>>>>>>>     After the patches: 5m17s
> >>>>>>>>>>>     This is because the genext2fs is much faster than the
> >>>>>>>>>>>     populate-extfs.sh, we will replace this script by the mke2fs
> >>>>>>>>>>> when it
> >>>>>>>>>>>     supports create the filesystem from a initial directory.
> >>>>>>>>>>>
> >>>>>>>>>>>    - Disk space (take core-image-sato as an example)
> >>>>>>>>>>>      a) The image file size is the same as before (529M)
> >>>>>>>>>>>      b) The disk usage is a little different: (du -sh)
> >>>>>>>>>>>                before       now
> >>>>>>>>>>>         ext2:  364M         388M
> >>>>>>>>>>>         ext3:  381M         404M
> >>>>>>>>>>>         ext4:  380M         387M
> >>>>>>>>>>>
> >>>>>>>>>>>     We may need to adjust the IMAGE_OVERHEAD_FACTOR from 1.3 to
> >>>>>>>>>>> 1.4.
> >>>>>>>>>>>
> >>>>>>>>>>>     I have done some simple runtime testing on core-image-sato
> >>>>>>>>>>> and
> >>>>>>>>>>>     core-image-minimal, they worked well.
> >>>>>>>>>>>
> >>>>>>>>>>> // Robert
> >>>>>>>>>>>
> >>>>>>>>>>> The following changes since commit
> >>>>>>>>>>> 3472c1f7ab409cd91c1d4782d9e00880b84e3ae8:
> >>>>>>>>>>>
> >>>>>>>>>>>    grub-efi-native: Cleanup whitespace (2013-05-03 16:37:05
> >>>>>>>>>>> +0100)
> >>>>>>>>>>>
> >>>>>>>>>>> are available in the git repository at:
> >>>>>>>>>>>
> >>>>>>>>>>>    git://git.pokylinux.org/poky-contrib robert/ext4
> >>>>>>>>>>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/ext4
> >>>>>>>>>>>
> >>>>>>>>>>> Robert Yang (4):
> >>>>>>>>>>>    e2fsprogs: the max length of debugfs argument is too short
> >>>>>>>>>>>    e2fsprogs: let debugfs do sparse copy
> >>>>>>>>>>>    e2fsprogs: add populate-extfs.sh
> >>>>>>>>>>>    image_types.bbclass: replace genext2fs with populate-extfs.sh
> >>>>>>>>>>>
> >>>>>>>>>>> meta/classes/image_types.bbclass | 46 ++++----
> >>>>>>>>>>> .../e2fsprogs-1.42.7/debugfs-too-short.patch | 28 +++++
> >>>>>>>>>>> .../e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh | 93
> >>>>>>>>>>> ++++++++++++++++
> >>>>>>>>>>> .../e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch | 114
> >>>>>>>>>>> ++++++++++++++++++++
> >>>>>>>>>>> .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb | 4 +
> >>>>>>>>>>>   5 files changed, 257 insertions(+), 28 deletions(-)
> >>>>>>>>>>>   create mode 100644
> >>>>>>>>>>>
> >>>>>>>>>>> meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/debugfs-too-short.patch
> >>>>>>>>>>>   create mode 100644
> >>>>>>>>>>>
> >>>>>>>>>>> meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh
> >>>>>>>>>>>   create mode 100644
> >>>>>>>>>>>
> >>>>>>>>>>> meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch
> >>>>>>>>>>>
> >>>>>>>>>>> --
> >>>>>>>>>>> 1.7.10.4
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> _______________________________________________
> >>>>>>>>>>> Openembedded-core mailing list
> >>>>>>>>>>> Openembedded-core@lists.openembedded.org
> >>>>>>>>>>>
> >>>>>>>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >>>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>> Regards,
> >>>>>>>> Jonathan
> >>>>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>
> >>>>
> >>>>
> >>
> >>
> >>
> >

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



