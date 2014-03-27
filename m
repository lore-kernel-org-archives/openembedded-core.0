Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2FE6E79A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 20:15:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Mar 2014 13:10:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,744,1389772800"; d="scan'208";a="481663671"
Received: from ldsaruwe-mobl.gar.corp.intel.com (HELO [10.255.13.185])
	([10.255.13.185])
	by orsmga001.jf.intel.com with ESMTP; 27 Mar 2014 13:15:00 -0700
Message-ID: <1395951300.10059.69.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: =?ISO-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>
Date: Thu, 27 Mar 2014 15:15:00 -0500
In-Reply-To: <1395801769-13042-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1395801769-13042-1-git-send-email-joaohf@gmail.com>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/7] wic: Add --rootfs option to --source param
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
X-List-Received-Date: Thu, 27 Mar 2014 20:15:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2014-03-25 at 23:42 -0300, João Henrique Ferreira de Freitas
wrote:
> Hi, 
> 
> These patchs allows the user create the following directdisk-multi-rootfs.wks file:
> 
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

Hi João,

I'm having some trouble creating an image, looks like the assignment to
krootfs_dir['ROOTFS_DIR'] is bogus?:

[trz@empanada build]$ wic create directdisk-multi -e core-image-minimal
Checking basic build environment...
Done.

Creating image(s)...

Traceback (most recent call last):
  File "/home/trz/yocto/master-cur/scripts/wic", line 252, in <module>
    ret = main()
  File "/home/trz/yocto/master-cur/scripts/wic", line 247, in main
    invoke_subcommand(args, parser, wic_help_usage, subcommands)
  File "/home/trz/yocto/master-cur/scripts/lib/image/help.py", line 73, in invoke_subcommand
    subcommands.get(args[0], subcommand_error)[0](args[1:], usage)
  File "/home/trz/yocto/master-cur/scripts/wic", line 191, in wic_create_subcommand
    krootfs_dir['ROOTFS_DIR'] = rootfs_dir
TypeError: 'NoneType' object does not support item assignment


My directdisk-multi.wks contains this:

part /boot --source bootimg-pcbios --ondisk sda --fstype=msdos --label boot --active --align 1024
part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024

part /standby --source rootfs --rootfs-dir=/home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs/ --ondisk sda --fstype=ext3 --label secondary --align 1024

bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"

Tom

> changes since previous version:
>  v2: 
>   - in .wks syntax change --rootfs to --rootfs-dir
>   - reporting all extra partitions in the output
>   - use a connection string between --rootfs-dir from wic command-line and .wks
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
>  scripts/lib/mic/imager/direct.py                   | 20 +++++--
>  .../lib/mic/kickstart/custom_commands/partition.py | 51 ++++++++++------
>  scripts/lib/mic/pluginbase.py                      |  2 +-
>  scripts/lib/mic/plugins/imager/direct_plugin.py    | 17 +++++-
>  scripts/lib/mic/plugins/source/bootimg-efi.py      |  2 +-
>  scripts/lib/mic/plugins/source/bootimg-pcbios.py   |  2 +-
>  scripts/lib/mic/plugins/source/rootfs.py           | 68 ++++++++++++++++++++++
>  scripts/wic                                        | 34 ++++++++++-
>  8 files changed, 167 insertions(+), 29 deletions(-)
>  create mode 100644 scripts/lib/mic/plugins/source/rootfs.py
> 
> -- 
> 1.8.3.2
> 



