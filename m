Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 34B5D6121F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 19:09:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 29 Mar 2014 12:09:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,756,1389772800"; d="scan'208";a="502260980"
Received: from unknown (HELO [10.255.12.30]) ([10.255.12.30])
	by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2014 12:09:34 -0700
Message-ID: <1396120173.11878.3.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: =?ISO-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>
Date: Sat, 29 Mar 2014 14:09:33 -0500
In-Reply-To: <1396062728-9140-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1396062728-9140-1-git-send-email-joaohf@gmail.com>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 0/7] wic: Add --rootfs option to --source param
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
X-List-Received-Date: Sat, 29 Mar 2014 19:09:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2014-03-29 at 00:12 -0300, João Henrique Ferreira de Freitas
wrote:
> Hi, 
> 
> These patchs allows the user create the following directdisk-multi-rootfs.wks file:
> 

Hi João,

This all looks good now, and tested ok for me - thanks for persevering!

Just one small nit, I noticed some trailing whitespace on the first
patch (seen using 'git show' on the commit, it shows up as red at the
end of the affected lines).

Other than that, for the whole series,

Acked-by: Tom Zanussi <tom.zanussi@linux.intel.com>



>   part /boot --source bootimg-pcbios --ondisk sda --fstype=msdos \
>     --label boot --active --align 1024
>   part / --source rootfs --ondisk sda --fstype=ext3 --label primary --align 1024
> 
>   part /standby --source rootfs --rootfs-dir=<special rootfs directory> \
>     --ondisk sda --fstype=ext3 --label secondary --align 1024
> 
>   bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
> 
> The special thing is the /standby partition. Which using rootfs with
> a extra '--rootfs' argument instruct the RootfsPlugin what should be
> the rootfs directory to be used to create the partition.
> 
> Besides that, the user can specify a more generic connection
> between wic command-line --rootfs-dir and what is describing in .wks file. Like this:
> 
> wic create ... --rootfs-dir rootfs1=/some/rootfs/dir --rootfs-dir rootfs2=/some/other/rootfs/dir
> 
>   part / --source rootfs --rootfs-dir="rootfs1" --ondisk sda --fstype=ext3 --label primary --align 1024
> 
>   part /standby --source rootfs --rootfs-dir="rootfs2" \
>     --ondisk sda --fstype=ext3 --label secondary --align 1024
> 
> So no hard-coded path is used in .wks. The connection string could be any string that 
> makes a link between the '--rootfs-dir'
> 
> It is a very simple features that let users to customize your partition
> setup. I thought in the case where we have two rootfs (like active and
> standby, e.g used to software update). Or the odd cases when a special
> partition need to be create to hold whatever files.
> 
> The workflow of wic use remains the same. All the config needs to be done
> in .wks file.
> 
> To test I used <special rootfs directory> as a rootfs created by 'bitbkae core-image-minimal-dev'
> (e.g: /srv/build/yocto/master/tmp/work/genericx86-poky-linux/core-image-minimal-dev/1.0-r0/rootfs).
> 
> Use cases and command line:
> 
> wic create directdisk-multi-rootfs.wks \
>     -e core-image-minimal
>     --rootfs-dir /srv/build/yocto/master/tmp/work/genericx86-poky-linux/core-image-minimal/1.0-r0/rootfs \
>     --rootfs-dir rootfs2=/srv/build/yocto/master/tmp/work/genericx86-poky-linux/core-image-minimal-dev/1.0-r0/rootfs \
>     --rootfs-dir rootfs3=/tmp/fakerootfs
> 
> directdisk-multi-rootfs.wks:
> 
>   part /boot --source bootimg-pcbios --ondisk sda --fstype=msdos --label boot --active --align 1024
>   part / --source rootfs --ondisk sda --fstype=ext3 --label primary --align 1024
> 
>   part /standby --source rootfs --rootfs-dir=rootfs2 --ondisk sda --fstype=ext3 --label secondary --align 1024
> 
>   part /root --source rootfs --rootfs-dir=rootfs3 --ondisk sda --fstype=ext3 --label root_sec --align 1024
> 
>   bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
> 
> 
> 
> wic create directdisk-multi-rootfs-indirect.wks \
>     -e core-image-minimal \
>     --rootfs-dir rootfs1=/srv/build/yocto/master/tmp/work/genericx86-poky-linux/core-image-minimal/1.0-r0/rootfs \
>     --rootfs-dir rootfs2=/srv/build/yocto/master/tmp/work/genericx86-poky-linux/core-image-minimal-dev/1.0-r0/rootfs \
>     --rootfs-dir rootfs3=/tmp/fakerootfs
> 
> directdisk-multi-rootfs-indirect.wks:
> 
>   part /boot --source bootimg-pcbios --ondisk sda --fstype=msdos --label boot --active --align 1024
>   part / --source rootfs --rootfs=rootfs1 --ondisk sda --fstype=ext3 --label primary --align 1024
> 
>   part /standby --source rootfs --rootfs-dir=rootfs2 --ondisk sda --fstype=ext3 --label secondary --align 1024
> 
>   part /root --source rootfs --rootfs-dir=rootfs3 --ondisk sda --fstype=ext3 --label root_sec --align 1024
> 
>   bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
> 
> 
> changes since previous version:
>  v2: 
>   - in .wks syntax change --rootfs to --rootfs-dir
>   - reporting all extra partitions in the output
>   - use a connection string between --rootfs-dir from wic command-line and .wks
>  v3:
>   - fix when wic -e command-line param is used and no --rootfs-dir was passed
>  v4:
>   - fix fstab parser/create when --rootfs-dir connector is used and there was not passed a
>     --rootfs-dir param on wic command line
>   - fix wic command line param when used without --rootfs-dir and only --rootfs-dir connectors are passed
> 
> 
> João Henrique Ferreira de Freitas (7):
>   wic: Add RootfsPlugin
>   wic: Hook up RootfsPlugin plugin
>   wic: Add rootfs_dir argument to do_prepare_partition() method
>   wic: Use partition label to be part of rootfs filename
>   wic: Add option --rootfs-dir to --source
>   wic: Report all ROOTFS_DIR artifacts
>   wic: Extend --rootfs-dir to connect rootfs-dirs
> 
>  scripts/lib/mic/imager/direct.py                   | 36 +++++++----
>  .../lib/mic/kickstart/custom_commands/partition.py | 51 ++++++++++------
>  scripts/lib/mic/pluginbase.py                      |  2 +-
>  scripts/lib/mic/plugins/imager/direct_plugin.py    | 17 +++++-
>  scripts/lib/mic/plugins/source/bootimg-efi.py      |  2 +-
>  scripts/lib/mic/plugins/source/bootimg-pcbios.py   |  2 +-
>  scripts/lib/mic/plugins/source/rootfs.py           | 71 ++++++++++++++++++++++
>  scripts/wic                                        | 40 +++++++++++-
>  8 files changed, 185 insertions(+), 36 deletions(-)
>  create mode 100644 scripts/lib/mic/plugins/source/rootfs.py
> 
> -- 
> 1.8.3.2
> 



