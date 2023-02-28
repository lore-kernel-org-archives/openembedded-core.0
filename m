Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98808C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 15:20:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.26186.1677597651977466843
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 07:20:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fkKPzet3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E1AC6FF813;
	Tue, 28 Feb 2023 15:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677597650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3XZBVDdwdXqmHCUDSOJGsU6zQkpetFdF2O6SCI16KDE=;
	b=fkKPzet3zLCqpCBd1PksVF8aP+R5yQeS/zF6nPH0sCbuG+Av5cJ8FwHuF+2yQC2w3NxNe6
	C04kEmnQskDjxfKbqiSegapC5BAG3OoPEsBZXy5D/y3CjlhNrVGJ8/PwztcyUp2p2pk2/p
	pBnZR3OUc7zlfBmSQ3IoSumC0g8dQwEAoyFfe0eMJ/3haiWloL7nfGyh10KL2aZeXDMHgj
	rVtdkO7wHJ97rCiZ1czAzD3G4bkqyXwoH5FIrTnsq4yu+zSOYf9KVvZHmuuc2prCJkH+5g
	ModNEjECXq4u8YzzUisn06KS0lxDzVGUkzH47yjKXCI+peAZ8o7ZaGScWGm2gQ==
Date: Tue, 28 Feb 2023 16:20:49 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: anna-lena.marx@inovex.de
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH 1/1] wic: Add support for F2FS in WIC rootfs
 plugin
Message-ID: <Y/4b0dLAaxLcHKSc@mail.local>
References: <cover.1677593618.git.anna-lena.marx@inovex.de>
 <d6eaaa6541a496112bfbd82401bf94d031741e59.1677593618.git.anna-lena.marx@inovex.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6eaaa6541a496112bfbd82401bf94d031741e59.1677593618.git.anna-lena.marx@inovex.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 15:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177841

Hello,

this failed on the autobuilders:

ERROR: Nothing PROVIDES 'f2fs-tools-native' (but /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-sato/images/core-image-sato.bb, /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-sato/images/core-image-sato-sdk.bb, /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-core/images/core-image-minimal.bb, /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-core/images/core-image-minimal-dev.bb, /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-core/images/core-image-ptest-all.bb DEPENDS on or otherwise requires it). Close matches:
  btrfs-tools-native
  dosfstools-native
  spirv-tools-native

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/6790/steps/11/logs/stdio

On 28/02/2023 16:00:58+0100, Anna-Lena Marx via lists.openembedded.org wrote:
> Building F2FS rootfs is supported in Yocto/OpenEmbedded - 
> see image_types.bbclass, but not in WIC.
> This adds it as a nice convenience feature.
> 
> F2FS needs a minimum size of ~500M to operate correctly due to
> an overprovision functionality.
> 
> Signed-off-by: Anna-Lena Marx <anna-lena.marx@inovex.de>
> ---
>  meta/classes-recipe/image_types_wic.bbclass |  2 +-
>  meta/lib/oeqa/selftest/cases/wic.py         |  2 ++
>  meta/recipes-core/meta/wic-tools.bb         |  2 +-
>  scripts/lib/wic/help.py                     |  1 +
>  scripts/lib/wic/ksparser.py                 |  2 +-
>  scripts/lib/wic/misc.py                     |  1 +
>  scripts/lib/wic/partition.py                | 32 ++++++++++++++++++++-
>  7 files changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
> index c339b9bdfb..8ae5ecca4d 100644
> --- a/meta/classes-recipe/image_types_wic.bbclass
> +++ b/meta/classes-recipe/image_types_wic.bbclass
> @@ -89,7 +89,7 @@ do_image_wic[recrdeptask] += "do_deploy"
>  do_image_wic[deptask] += "do_image_complete"
>  
>  WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
> -WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
> +WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native f2fs-tools-native"
>  # Unified kernel images need objcopy
>  WKS_FILE_DEPENDS_DEFAULT += "virtual/${MLPREFIX}${TARGET_PREFIX}binutils"
>  WKS_FILE_DEPENDS_BOOTLOADERS = ""
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> index ca1abb970a..5e255e35c7 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -1188,6 +1188,7 @@ class Wic2(WicTestCase):
>          with NamedTemporaryFile("w", suffix=".wks") as wks:
>              wks.writelines(['part ext2   --fstype ext2     --source rootfs\n',
>                              'part btrfs  --fstype btrfs    --source rootfs --size 40M\n',
> +                            'part f2fs   --fstype f2fs     --source rootfs --size 50M\n',
>                              'part squash --fstype squashfs --source rootfs\n',
>                              'part swap   --fstype swap --size 1M\n',
>                              'part emptyvfat   --fstype vfat   --size 1M\n',
> @@ -1258,6 +1259,7 @@ class Wic2(WicTestCase):
>              wks.writelines(
>                  ['part ext2   --fstype ext2     --source rootfs --mkfs-extraopts "-D -F -i 8192"\n',
>                   "part btrfs  --fstype btrfs    --source rootfs --size 40M --mkfs-extraopts='--quiet'\n",
> +                 "part f2fs   --fstype f2fs     --source rootfs --size 50M --mkfs-extraopts='-O extra_attr -o 20'\n",
>                   'part squash --fstype squashfs --source rootfs --mkfs-extraopts "-no-sparse -b 4096"\n',
>                   'part emptyvfat   --fstype vfat   --size 1M --mkfs-extraopts "-S 1024 -s 64"\n',
>                   'part emptymsdos  --fstype msdos  --size 1M --mkfs-extraopts "-S 1024 -s 64"\n',
> diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
> index 9282d36a4d..d30ce66b56 100644
> --- a/meta/recipes-core/meta/wic-tools.bb
> +++ b/meta/recipes-core/meta/wic-tools.bb
> @@ -7,7 +7,7 @@ DEPENDS = "\
>             mtools-native bmap-tools-native grub-native cdrtools-native \
>             btrfs-tools-native squashfs-tools-native pseudo-native \
>             e2fsprogs-native util-linux-native tar-native erofs-utils-native \
> -           virtual/${TARGET_PREFIX}binutils \
> +           f2fs-tools-native virtual/${TARGET_PREFIX}binutils \
>             "
>  DEPENDS:append:x86 = " syslinux-native syslinux grub-efi systemd-boot"
>  DEPENDS:append:x86-64 = " syslinux-native syslinux grub-efi systemd-boot"
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index 73e3380cde..0094065931 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -931,6 +931,7 @@ DESCRIPTION
>               btrfs
>               squashfs
>               erofs
> +             f2fs
>               swap
>  
>           --fsoptions: Specifies a free-form string of options to be
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index d1e546b12d..e10ce6581d 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -159,7 +159,7 @@ class KickStart():
>          part.add_argument('--fstype', default='vfat',
>                            choices=('ext2', 'ext3', 'ext4', 'btrfs',
>                                     'squashfs', 'vfat', 'msdos', 'erofs',
> -                                   'swap', 'none'))
> +                                   'f2fs', 'swap', 'none'))
>          part.add_argument('--mkfs-extraopts', default='')
>          part.add_argument('--label')
>          part.add_argument('--use-label', action='store_true')
> diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
> index 2b90821b30..dc84a37423 100644
> --- a/scripts/lib/wic/misc.py
> +++ b/scripts/lib/wic/misc.py
> @@ -41,6 +41,7 @@ NATIVE_RECIPES = {"bmaptool": "bmap-tools",
>                    "mkfs.ext3": "e2fsprogs",
>                    "mkfs.ext4": "e2fsprogs",
>                    "mkfs.vfat": "dosfstools",
> +                  "mkfs.f2fs": "f2fs-tools",
>                    "mksquashfs": "squashfs-tools",
>                    "mkswap": "util-linux",
>                    "mmd": "mtools",
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 382afa44bc..6adcaa041f 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -208,7 +208,7 @@ class Partition():
>          Prepare content for a rootfs partition i.e. create a partition
>          and fill it from a /rootfs dir.
>  
> -        Currently handles ext2/3/4, btrfs, vfat and squashfs.
> +        Currently handles ext2/3/4, btrfs, vfat, squashfs and f2fs.
>          """
>  
>          rootfs = "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
> @@ -351,6 +351,36 @@ class Partition():
>               self.mkfs_extraopts, self.fsuuid, rootfs)
>          exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
>  
> +    def prepare_rootfs_f2fs(self, rootfs, cr_workdir, oe_builddir, rootfs_dir,
> +                            native_sysroot, pseudo):
> +        """
> +        Prepare content for a f2fs rootfs partition.
> +        """
> +        du_cmd = "du -ks %s" % rootfs_dir
> +        out = exec_cmd(du_cmd)
> +        actual_rootfs_size = int(out.split()[0])
> +
> +        min_f2fs_size = 524288
> +        rootfs_size = self.get_rootfs_size(actual_rootfs_size)
> +        if rootfs_size < min_f2fs_size:
> +            rootfs_size = min_f2fs_size
> +
> +        with open(rootfs, 'w') as sparse:
> +            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
> +
> +        extraopts = self.mkfs_extraopts or "-O extra_attr,compression"
> +
> +        label_str = ""
> +        if self.label:
> +            label_str = "-l %s" % self.label
> +
> +        mkfs_f2fs_cmd = "mkfs.f2fs %s %s %s" % \
> +                        (label_str, extraopts, rootfs)
> +        exec_native_cmd(mkfs_f2fs_cmd, native_sysroot, pseudo=pseudo)
> +
> +        sload_f2fs_cmd = "sload.f2fs -f %s %s" % (rootfs_dir, rootfs)
> +        exec_native_cmd(sload_f2fs_cmd, native_sysroot, pseudo=pseudo)
> +
>      def prepare_rootfs_msdos(self, rootfs, cr_workdir, oe_builddir, rootfs_dir,
>                               native_sysroot, pseudo):
>          """
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177839): https://lists.openembedded.org/g/openembedded-core/message/177839
> Mute This Topic: https://lists.openembedded.org/mt/97291696/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

