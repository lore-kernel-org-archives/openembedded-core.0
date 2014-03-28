Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D29336B269
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 21:38:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Mar 2014 14:38:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,752,1389772800"; d="scan'208";a="509920207"
Received: from unknown (HELO [10.255.12.30]) ([10.255.12.30])
	by orsmga002.jf.intel.com with ESMTP; 28 Mar 2014 14:38:24 -0700
Message-ID: <1396042703.10059.162.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: =?ISO-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>
Date: Fri, 28 Mar 2014 16:38:23 -0500
In-Reply-To: <1395958078-5191-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1395958078-5191-1-git-send-email-joaohf@gmail.com>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 0/7] wic: Add --rootfs option to --source param
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
X-List-Received-Date: Fri, 28 Mar 2014 21:38:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2014-03-27 at 19:07 -0300, João Henrique Ferreira de Freitas
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

That helped a lot - I was able to get images generated using both the -e
and explicitly specifying all the arguments using the directdisk-multi
from before.  So these worked fine:

[trz@empanada build]$ wic create directdisk-multi -e core-image-minimal

[trz@empanada build]$ wic create directdisk-multi
-b /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/share
-k /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/src/kernel
-n /home/trz/yocto/master-cur/build/tmp/sysroots/x86_64-linux
-r /home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs/
Creating image(s)...


When testing, I noticed a problem I introduced when adding the plugin
support - I'll submit a patch for it, but the fix is here:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=tzanussi/wic-bitbake-env-fix&id=222d52976466464a3ff184e07c0c884c8f821dbc


Moving on to the generic connection versions, however, I still ran into
problems.  Here's the 'directdisk-multi-indirect-both.wks' file I used
for that test:

part /boot --source bootimg-pcbios --ondisk sda --fstype=msdos --label boot --active --align 1024
part / --source rootfs --rootfs-dir="rootfs1" --ondisk sda --fstype=ext3 --label platform --align 1024

part /standby --source rootfs --rootfs-dir="rootfs2" --ondisk sda --fstype=ext3 --label secondary --align 1024

bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"


Both the -e and manual failed in the same way:

[trz@empanada build]$ wic create directdisk-multi-indirect-both --rootfs-dir rootfs1=/home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs/ --rootfs-dir rootfs2=/home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs/ -e core-image-minimal
Checking basic build environment...
Done.

Creating image(s)...

Traceback (most recent call last):
  File "/home/trz/yocto/master-cur/scripts/wic", line 254, in <module>
    ret = main()
  File "/home/trz/yocto/master-cur/scripts/wic", line 249, in main
    invoke_subcommand(args, parser, wic_help_usage, subcommands)
  File "/home/trz/yocto/master-cur/scripts/lib/image/help.py", line 73, in invoke_subcommand
    subcommands.get(args[0], subcommand_error)[0](args[1:], usage)
  File "/home/trz/yocto/master-cur/scripts/wic", line 199, in wic_create_subcommand
    image_output_dir, options.debug, options.properties_file)
  File "/home/trz/yocto/master-cur/scripts/lib/image/engine.py", line 246, in wic_create
    cr.main(direct_args)
KeyError: 'ROOTFS_DIR'


[trz@empanada build]$ wic create directdisk-multi-indirect-both -b /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/share -k /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/src/kernel -n /home/trz/yocto/master-cur/build/tmp/sysroots/x86_64-linux --rootfs-dir rootfs1=/home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs/ --rootfs-dir rootfs2=/home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs/
Creating image(s)...

Traceback (most recent call last):
  File "/home/trz/yocto/master-cur/scripts/wic", line 254, in <module>
    ret = main()
  File "/home/trz/yocto/master-cur/scripts/wic", line 249, in main
    invoke_subcommand(args, parser, wic_help_usage, subcommands)
  File "/home/trz/yocto/master-cur/scripts/lib/image/help.py", line 73, in invoke_subcommand
    subcommands.get(args[0], subcommand_error)[0](args[1:], usage)
  File "/home/trz/yocto/master-cur/scripts/wic", line 153, in wic_create_subcommand
    rootfs_dir = options.rootfs_dir['ROOTFS_DIR']
KeyError: 'ROOTFS_DIR'

Thanks,

Tom

> changes since previous version:
>  v2: 
>   - in .wks syntax change --rootfs to --rootfs-dir
>   - reporting all extra partitions in the output
>   - use a connection string between --rootfs-dir from wic command-line and .wks
>  v3:
>   - fix when wic -e command-line param is used and no --rootfs-dir was passed
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
>  scripts/wic                                        | 36 +++++++++++-
>  8 files changed, 169 insertions(+), 29 deletions(-)
>  create mode 100644 scripts/lib/mic/plugins/source/rootfs.py
> 



