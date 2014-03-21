Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 187A36FA43
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 15:54:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Mar 2014 08:54:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,704,1389772800"; d="scan'208";a="496870728"
Received: from unknown (HELO [10.255.12.230]) ([10.255.12.230])
	by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2014 08:54:28 -0700
Message-ID: <1395417268.25867.74.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: =?ISO-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>
Date: Fri, 21 Mar 2014 10:54:28 -0500
In-Reply-To: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] wic: Add --rootfs option to --source param
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
X-List-Received-Date: Fri, 21 Mar 2014 15:54:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2014-03-15 at 18:17 -0300, João Henrique Ferreira de Freitas
wrote:
> Hi, 
> 
> These patchs allows the user create the following directdisk-multi-rootfs.wks file:
> 
>   part /boot --source bootimg-pcbios --ondisk sda --fstype=msdos \
>     --label boot --active --align 1024
>   part / --source rootfs --ondisk sda --fstype=ext3 --label primary --align 1024
> 
>   part /standby --source rootfs --rootfs=<special rootfs directory> \
>     --ondisk sda --fstype=ext3 --label secondary --align 1024
> 
>   bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
> 
> The special thing is the /standby partition. Which using rootfs with
> a extra '--rootfs' argument instruct the RootfsPlugin what should be
> the rootfs directory to be used to create the partition.
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

This is a nice generalization of the --source plugin for the rootfs and
it does allow users to create .wks files that address a particular
image's needs with hard-coded paths to rootfs dirs, which I think is
something that the tool does need to be able to handle.

However, I think we also need to be able to create more
general-purpose .wks files that don't hard-code the directories but
instead take the directory names from the command-line.

Currently what we have for that purpose is:

wic create ... --rootfs-dir /some/rootfs/dir

And because we only support one rootfs partition at the moment, that
--rootfs-dir automatically gets assigned to the single --source rootfs:

  part / --source rootfs --ondisk sda --fstype=ext3 --label primary   --align 1024

Generalizing that to multiple directories could look something like
this:

wic create ... --rootfs-dir /some/rootfs/dir --rootfs-dir /some/other/rootfs/dir

That would assign the first to the / partition and the second to
the /standby partition if using this in the .wks file:

  part / --source rootfs --ondisk sda --fstype=ext3 --label primary --align 1024

  part /standby --source rootfs --rootfs=<special rootfs directory> \
    --ondisk sda --fstype=ext3 --label secondary --align 1024

The problem is that we're relying on ordering between the .wks file and
the command-line, and what if we're also using the -e param? - that
assumes the --rootfs-dir is coming from the image file.

I'd rather just ignore -e altogether when thinking about this, since
it's really just a usability hack and I don't think it should drive the
overall interface.

In any case, I think the connection between a command-line param and the
line in the .wks file should be explicit, but I'm not sure about the
best way do do that, maybe something like:

wic create ... --rootfs-dir rootfs1=/some/rootfs/dir --rootfs-dir rootfs2=/some/other/rootfs/dir

  part / --source rootfs --rootfs-dir="rootfs1" --ondisk sda --fstype=ext3 --label primary --align 1024

  part /standby --source rootfs --rootfs-dir="rootfs2" \
    --ondisk sda --fstype=ext3 --label secondary --align 1024

In the above case, 'rootfs1' and 'rootfs2' provide the connection (and
could be named anything, they're just strings).

The default, as is currently the case, is if --source rootfs is used
alone and no --rootfs-dir is specified for that line in the .wks file,
in which case the rootfs dir is automatically supplied by the
--rootfs-dir /some/rootfs/dir (or from the rootfs in the -e image).

Your current hard-coded secondary use case would still work without any
explicit named params - /standby would use --rootfs-dir=/some/rootfs/dir
and / would use either the rootfs from either -e or -r:

wic create ... hard-coded-path.wks -e core-image-minimal

or

wic create ... hard-coded-path.wks -r /some/rootfs/dir

  part / --source rootfs --ondisk sda --fstype=ext3 --label primary --align 1024

  part /standby --source rootfs --rootfs-dir=/some/rootfs/dir \
    --ondisk sda --fstype=ext3 --label secondary --align 1024


And we can still use a default rootfs dir with a named dir for the other
partition:

wic create ... -e core-image-minimal rootfs2=/some/other/rootfs/dir

or

wic create ... --rootfs-dir /some/rootfs/dir --rootfs-dir rootfs2=/some/other/rootfs/dir

  part / --source rootfs --ondisk sda --fstype=ext3 --label primary --align 1024

  part /standby --source rootfs --rootfs-dir="rootfs2" \
    --ondisk sda --fstype=ext3 --label secondary --align 1024

So I guess that's what make sense to me, but I'd be happy to hear other
ideas.

In any case, at minimum I think that you should change the syntax from
--rootfs=<special rootfs directory> to --rootfs-dir=<special rootfs
directory>, in keeping with current syntax.

Another thing missing is displaying the extra partitions in the output
e.g. I created an image with the added /standby, and it worked but I
didn't see it mentioned in the output, which it should be:

[trz@empanada build]$ wic create directdisk-multi -e core-image-minimal
Checking basic build environment...
Done.

Creating image(s)...

Info: The new image(s) can be found here:
  /var/tmp/wic/build/directdisk-multi-201403211050-sda.direct

The following build artifacts were used to create the image(s):
  ROOTFS_DIR:      /home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs
  BOOTIMG_DIR:     /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/share
  KERNEL_DIR:      /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/src/kernel
  NATIVE_SYSROOT:  /home/trz/yocto/master-cur/build/tmp/sysroots/x86_64-linux


The image(s) were created using OE kickstart file:
  /home/trz/yocto/master-cur/scripts/lib/image/canned-wks/directdisk-multi.wks

Thanks,

Tom

> Thanks.
> 
> João Henrique Ferreira de Freitas (5):
>   wic: Add RootfsPlugin
>   wic: Hook up RootfsPlugin plugin
>   wic: Add rootfs_dir argument to do_prepare_partition() method
>   wic: Use partition label to be part of rootfs filename
>   wic: Add option --rootfs to --source
> 
>  .../lib/mic/kickstart/custom_commands/partition.py | 38 +++++++-------
>  scripts/lib/mic/pluginbase.py                      |  2 +-
>  scripts/lib/mic/plugins/source/bootimg-efi.py      |  2 +-
>  scripts/lib/mic/plugins/source/bootimg-pcbios.py   |  2 +-
>  scripts/lib/mic/plugins/source/rootfs.py           | 58 ++++++++++++++++++++++
>  5 files changed, 81 insertions(+), 21 deletions(-)
>  create mode 100644 scripts/lib/mic/plugins/source/rootfs.py
> 
> -- 
> 1.8.3.2
> 



