Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UbqcT-0004cB-IL
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 13:08:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4DAoVNe019700
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 May 2013 03:50:31 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 13 May 2013 03:50:29 -0700
Message-ID: <5190C570.40700@windriver.com>
Date: Mon, 13 May 2013 18:50:24 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <cover.1367919920.git.liezhi.yang@windriver.com>
	<CANwerB3vdQu+WCYv-WzBMMFyv77LymqLkjp3wVMFHCO=KF53Dg@mail.gmail.com>
	<5190B127.40400@windriver.com> <5190B770.9050109@gmail.com>
In-Reply-To: <5190B770.9050109@gmail.com>
Cc: dvhart@linux.intel.com, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] replace genext2fs with populate-extfs.sh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 11:08:46 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/13/2013 05:50 PM, Jonathan Liu wrote:
> On 13/05/2013 7:23 PM, Robert Yang wrote:
>>
>> Hi Jonathan Liu,
>>
>> What's your configuration, please, I tried a core-image-minimal building
>> just now, didn't notice this error. Did the error come after these patches
>> applied ?
> Yes, the errors occured after applying your patches.
>

Thanks, I will try a build with these configuration tonight, and see the
result tomorrow.

// Robert

> distro conf:
> DISTRO_FEATURES_append = " largefile opengl systemd"
> DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
> VIRTUAL-RUNTIME_graphical_init_manager = ""
> VIRTUAL-RUNTIME_init_manager = "systemd"
> PACKAGE_CLASSES = "package_ipk"
>
> image bb:
> SYSLINUX_ROOT ?= "root=/dev/sda2"
> SYSLINUX_PROMPT = "0"
> SYSLINUX_TIMEOUT = "1"
> SYSLINUX_LABELS = "boot"
> LABELS_append = " ${SYSLINUX_LABELS} "
> do_bootdirectdisk[depends] += "${PN}:do_rootfs"
> APPEND += "rootfstype=ext4 rw"
> ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext4"
> inherit boot-directdisk
> IMAGE_FEATURES += "hwcodecs package-management ssh-server-openssh x11"
> IMAGE_FSTYPES = "ext4"
> IMAGE_LINGUAS = ""
>
>>
>> My configuration:
>> MACHINE = "qemux86"
>> IMAGE_FSTYPES += "ext4"
>>
>> // Robert
>>
>> On 05/13/2013 12:59 PM, Jonathan Liu wrote:
>>> Hi Robert,
>>>
>>> I get the following errors doing filesystem check on the ext4 image:
>>>
>>> # fsck.ext4 -fn tmp/deploy/images/custom-image-custom.ext4.ext4
>>> e2fsck 1.42.7 (21-Jan-2013)
>>> Pass 1: Checking inodes, blocks, and sizes
>>> Pass 2: Checking directory structure
>>> Entry 'mtd7' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'mtd4' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'fb0' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'mtd5' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'tty' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'tty6' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'random' in /dev (2739) has an incorrect filetype (was 4, should be
>>> 3).
>>> Fix? no
>>>
>>> Entry 'mtd1' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'urandom' in /dev (2739) has an incorrect filetype (was 4, should be
>>> 3).
>>> Fix? no
>>>
>>> Entry 'zero' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'null' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'kmsg' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'kmem' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'mtd6' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'tty7' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'tty4' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'apm_bios' in /dev (2739) has an incorrect filetype (was 4, should be
>>> 3).
>>> Fix? no
>>>
>>> Entry 'tty5' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'mtd0' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'tty0' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'ttySA0' in /dev (2739) has an incorrect filetype (was 4, should be
>>> 3).
>>> Fix? no
>>>
>>> Entry 'mem' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'mtd2' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'tty8' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'console' in /dev (2739) has an incorrect filetype (was 4, should be
>>> 3).
>>> Fix? no
>>>
>>> Entry 'ttyS0' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'tty2' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'mtd3' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'tty1' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Entry 'tty3' in /dev (2739) has an incorrect filetype (was 4, should be 3).
>>> Fix? no
>>>
>>> Pass 3: Checking directory connectivity
>>> Pass 4: Checking reference counts
>>> Inode 774 ref count is 9, should be 10.  Fix? no
>>>
>>> Pass 5: Checking group summary information
>>>
>>> tmp/deploy/images/custom-image-custom.ext4.ext4: ********** WARNING:
>>> Filesystem still has errors **********
>>>
>>> tmp/deploy/images/custom-image-custom.ext4.ext4: 3899/21336 files (0.5%
>>> non-contiguous), 131042/169656 blocks
>>>
>>>
>>> After booting the image I get the following:
>>> # dmesg | grep EXT4-fs
>>> EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: (null)
>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
>>> systemd: bad header/extent: invalid magic - magic 0, entries 0, max 0(0),
>>> depth 0(0)
>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
>>> systemd: bad header/extent: invalid magic - magic 0, entries 0, max 0(0),
>>> depth 0(0)
>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
>>> systemd: bad header/extent: invalid magic - magic 0, entries 0, max 0(0),
>>> depth 0(0)
>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
>>> systemd-machine: bad header/extent: invalid magic - magic 0, entries 0, max
>>> 0(0), depth 0(0)
>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
>>> systemd-machine: bad header/extent: invalid magic - magic 0, entries 0, max
>>> 0(0), depth 0(0)
>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
>>> systemd-journal: bad header/extent: invalid magic - magic 0, entries 0, max
>>> 0(0), depth 0(0)
>>> EXT4-fs (sda2): re-mounted. Opts: (null)
>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
>>> systemd-journal: bad header/extent: invalid magic - magic 0, entries 0, max
>>> 0(0), depth 0(0)
>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
>>> systemd-journal: bad header/extent: invalid magic - magic 0, entries 0, max
>>> 0(0), depth 0(0)
>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
>>> systemd-journal: bad header/extent: invalid magic - magic 0, entries 0, max
>>> 0(0), depth 0(0)
>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #883: comm
>>> systemd-journal: bad header/extent: invalid magic - magic 0, entries 0, max
>>> 0(0), depth 0(0)
>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #810: comm
>>> login: bad header/extent: invalid magic - magic 0, entries 0, max 0(0),
>>> depth 0(0)
>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode #810: comm
>>> sshd: bad header/extent: invalid magic - magic 0, entries 0, max 0(0),
>>> depth 0(0)
>>>
>>>
>>> # systemctl --failed | cat
>>> UNIT                     LOAD   ACTIVE SUB    DESCRIPTION
>>> machineid.service        loaded failed failed Machine ID first boot
>>> configure
>>> systemd-journald.service loaded failed failed Journal Service
>>> systemd-journald.socket  loaded failed failed Journal Socket
>>>
>>> LOAD   = Reflects whether the unit definition was properly loaded.
>>> ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
>>> SUB    = The low-level unit activation state, values depend on unit type.
>>>
>>> 3 loaded units listed. Pass --all to see loaded but inactive units, too.
>>> To show all installed unit files use 'systemctl list-unit-files'.
>>>
>>>
>>> I am booting kernel with rootfstype=ext4. IMAGE_FSTYPES = "ext4".
>>>
>>> Regards,
>>> Jonathan
>>>
>>>
>>> On 7 May 2013 19:48, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>
>>>> * The benefits:
>>>>    - Really support ext4
>>>>    - Support the sparse file (the sparse file became into the common file
>>>> before)
>>>>    - Have a uniform code for ext2/3/4 generation
>>>>    - Remove the depends on genext2fs-native
>>>>
>>>> * Impact
>>>>    - Build time:
>>>>      a) If we build fresh core-image-sato, there is nearly no impact.
>>>>      b) If we do the image generation, which means:
>>>>         $ bitbake core-image-sato
>>>>         $ bitbake core-image-sato -ccleansstate
>>>>         $ bitbake core-image-sato
>>>>     About 50 extra seconds are needed, here is my test result:
>>>>     Before the patches: 4m25s
>>>>     After the patches: 5m17s
>>>>     This is because the genext2fs is much faster than the
>>>>     populate-extfs.sh, we will replace this script by the mke2fs when it
>>>>     supports create the filesystem from a initial directory.
>>>>
>>>>    - Disk space (take core-image-sato as an example)
>>>>      a) The image file size is the same as before (529M)
>>>>      b) The disk usage is a little different: (du -sh)
>>>>                before       now
>>>>         ext2:  364M         388M
>>>>         ext3:  381M         404M
>>>>         ext4:  380M         387M
>>>>
>>>>     We may need to adjust the IMAGE_OVERHEAD_FACTOR from 1.3 to 1.4.
>>>>
>>>>     I have done some simple runtime testing on core-image-sato and
>>>>     core-image-minimal, they worked well.
>>>>
>>>> // Robert
>>>>
>>>> The following changes since commit
>>>> 3472c1f7ab409cd91c1d4782d9e00880b84e3ae8:
>>>>
>>>>    grub-efi-native: Cleanup whitespace (2013-05-03 16:37:05 +0100)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>    git://git.pokylinux.org/poky-contrib robert/ext4
>>>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/ext4
>>>>
>>>> Robert Yang (4):
>>>>    e2fsprogs: the max length of debugfs argument is too short
>>>>    e2fsprogs: let debugfs do sparse copy
>>>>    e2fsprogs: add populate-extfs.sh
>>>>    image_types.bbclass: replace genext2fs with populate-extfs.sh
>>>>
>>>>   meta/classes/image_types.bbclass                   |   46 ++++----
>>>>   .../e2fsprogs-1.42.7/debugfs-too-short.patch       |   28 +++++
>>>>   .../e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh   |   93 ++++++++++++++++
>>>>   .../e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch   |  114
>>>> ++++++++++++++++++++
>>>>   .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb |    4 +
>>>>   5 files changed, 257 insertions(+), 28 deletions(-)
>>>>   create mode 100644
>>>> meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/debugfs-too-short.patch
>>>>   create mode 100644
>>>> meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh
>>>>   create mode 100644
>>>> meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch
>>>>
>>>> --
>>>> 1.7.10.4
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>>
>>>
> Regards,
> Jonathan
>
>


