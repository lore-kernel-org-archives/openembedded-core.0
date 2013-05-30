Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id F125060991
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 09:18:57 +0000 (UTC)
Message-ID: <51A71980.30802@communistcode.co.uk>
Date: Thu, 30 May 2013 10:18:56 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1369820334.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1369820334.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 0/4]Add FUSE: File system in Userspace
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 May 2013 09:18:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 30/05/13 10:01, Hongxu Jia wrote:
> Add fuse to oe-core and let target system could support
> `ntfs' and `exfat' filesystems.
>
> Test Case
>
> *Steps
> 1, preparation
> 1 target: e-menlow
> 2 usb sticks: one for boot and install, another for filesystem test.
>
> 2, config
> conf/local.conf:
> 247 MACHINE ?= "emenlow-noemgd"
> 247 IMAGE_INSTALL_append = " ntfs-3g ntfsprogs fuse-exfat exfat-utils"
>
> conf/bblayers.conf:
>    8 BBLAYERS ?= " \
>    9   /home/jiahongxu/yocto/poky/meta \
>   10   /home/jiahongxu/yocto/poky/meta-yocto \
>   11   /home/jiahongxu/yocto/poky/meta-yocto-bsp \
>   12   /home/jiahongxu/yocto/poky/meta-intel \
>   13   /home/jiahongxu/yocto/poky/meta-intel/meta-emenlow \
>
> 3, build image
> bitbake core-image-sato
>
> 4, load image to emenlow
> Test Case TC-2927: boot and install from usb
>
> 5, open a terminal/ssh of e-menlow
> Test Case TC-2955: remote access by ssh
>
> 6, make exfat filesystem on the testing usb storage
> 1) plug usb stick into e-menlow
> 2) execute `mkfs.exfat /dev/sdc1'
>
> 7, test usb stick with exfat filesystem is accessible
> Test Case TC-2947: usb mount
> Test Case TC-2948: usb read files
> Test Case TC-2949: usb umount
> Test Case TC-2950: usb write files
>
> 8, make ntfs filesystem on the testing usb storage
> 1) plug usb stick into e-menlow, if mounted, invoke `umount /dev/sdc1' first.
> 2) execute `mkfs.ntfs -f /dev/sdc1'
>
> 9, test usb stick with ntfs filesystem is accessible
> Test Case TC-2947: usb mount
> Test Case TC-2948: usb read files
> Test Case TC-2949: usb umount
> Test Case TC-2950: usb write files
>
> *Expected Results:
> 1, build image success
>
> 2, make exfat filesystem success
> root@emenlow-noemgd:~# mkfs.exfat /dev/sdc1
> mkexfatfs 1.0.1
> Creating... done.
> Flushing... done.
> File system created successfully.
>
> 3, make ntfs filesystem success
> root@emenlow-noemgd:~# mkfs.ntfs -f /dev/sdc1
> Cluster size has been automatically set to 4096 bytes.
> Creating NTFS volume structures.
> mkntfs completed successfully. Have a nice day.
>
> 4, While the usb's filesystem type is exfat or ntfs, system can mount
> plugged usb automatically, read files from usb, write files to usb and
> unmout usb automatically.
>
> [YOCTO #4178]
>
> The following changes since commit 350c36fcd97e8ef223b91e548d39c346c1c4cb29:
>
>    bitbake: test/fetch: Allow the conditional network tests to work under python 2.6 (2013-05-17 12:42:08 +0300)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib hongxu/support-fuse
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/support-fuse
>
> Hongxu Jia (4):
>    fuse: import recipe from meta-oe
>    ntfs-3g-ntfsprogs:import and update recipe from meta-oe
>    fuse-exfat: add version 1.0.1
>    exfat-utils: add version 1.0.1
>
>   meta/recipes-support/exfat/exfat-utils_1.0.1.bb    |   29 ++++++++++
>   meta/recipes-support/exfat/fuse-exfat_1.0.1.bb     |   26 +++++++++
>   meta/recipes-support/fuse/fuse-2.9.2/aarch64.patch |   20 +++++++
>   .../fuse/fuse-2.9.2/gold-unversioned-symbol.patch  |   60 ++++++++++++++++++++
>   meta/recipes-support/fuse/fuse_2.9.2.bb            |   38 +++++++++++++
>   .../ntfs-3g-ntfsprogs_2013.1.13.bb                 |   33 +++++++++++
>   6 files changed, 206 insertions(+)
>   create mode 100644 meta/recipes-support/exfat/exfat-utils_1.0.1.bb
>   create mode 100644 meta/recipes-support/exfat/fuse-exfat_1.0.1.bb
>   create mode 100644 meta/recipes-support/fuse/fuse-2.9.2/aarch64.patch
>   create mode 100644 meta/recipes-support/fuse/fuse-2.9.2/gold-unversioned-symbol.patch
>   create mode 100644 meta/recipes-support/fuse/fuse_2.9.2.bb
>   create mode 100644 meta/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
>

Without trying to be difficult, is oe-core really the place to support 
and spend effort ensuring NTFS/exFAT formatted drives are supported?

Could these improvements not stay in meta-oe? I don't really see support 
for essentially propriety filesystems as a core feature of a Linux build.

Shout up if I'm talking nonsense, just my 2p.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--

