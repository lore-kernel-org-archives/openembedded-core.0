Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 82BF96084B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 19:04:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 29 Mar 2014 11:59:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,756,1389772800"; d="scan'208";a="502259351"
Received: from unknown (HELO [10.255.12.30]) ([10.255.12.30])
	by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2014 12:04:10 -0700
Message-ID: <1396119850.5057.5.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: =?ISO-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>
Date: Sat, 29 Mar 2014 14:04:10 -0500
In-Reply-To: <53363CD0.7020507@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1395958078-5191-1-git-send-email-joaohf@gmail.com>
	<1396042703.10059.162.camel@empanada> <53363CD0.7020507@gmail.com>
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
X-List-Received-Date: Sat, 29 Mar 2014 19:04:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2014-03-29 at 00:24 -0300, João Henrique Ferreira de Freitas
wrote:
> Hi Tom,
> 
> Em 28-03-2014 18:38, Tom Zanussi escreveu:
> > On Thu, 2014-03-27 at 19:07 -0300, João Henrique Ferreira de Freitas
> > wrote:
> >
> >
> > When testing, I noticed a problem I introduced when adding the plugin
> > support - I'll submit a patch for it, but the fix is here:
> >
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=tzanussi/wic-bitbake-env-fix&id=222d52976466464a3ff184e07c0c884c8f821dbc
> 
> Do you have any automatic way to test wic? Like a tool to create 
> valid/invalid command line combinations ?
> 

No, but it's on my todo list.  I just opened a bug to track the work,
and added details on what I tested:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=6068

Your v4 series passed all those tests, and it looks good otherwise, so
I'll ack those in a minute...

Tom

> >
> > Moving on to the generic connection versions, however, I still ran into
> > problems.  Here's the 'directdisk-multi-indirect-both.wks' file I used
> > for that test:
> >
> > part /boot --source bootimg-pcbios --ondisk sda --fstype=msdos --label boot --active --align 1024
> > part / --source rootfs --rootfs-dir="rootfs1" --ondisk sda --fstype=ext3 --label platform --align 1024
> >
> > part /standby --source rootfs --rootfs-dir="rootfs2" --ondisk sda --fstype=ext3 --label secondary --align 1024
> >
> > bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
> >
> >
> > Both the -e and manual failed in the same way:
> >
> > [trz@empanada build]$ wic create directdisk-multi-indirect-both --rootfs-dir rootfs1=/home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs/ --rootfs-dir rootfs2=/home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs/ -e core-image-minimal
> > Checking basic build environment...
> > Done.
> >
> > Creating image(s)...
> >
> > Traceback (most recent call last):
> >    File "/home/trz/yocto/master-cur/scripts/wic", line 254, in <module>
> >      ret = main()
> >    File "/home/trz/yocto/master-cur/scripts/wic", line 249, in main
> >      invoke_subcommand(args, parser, wic_help_usage, subcommands)
> >    File "/home/trz/yocto/master-cur/scripts/lib/image/help.py", line 73, in invoke_subcommand
> >      subcommands.get(args[0], subcommand_error)[0](args[1:], usage)
> >    File "/home/trz/yocto/master-cur/scripts/wic", line 199, in wic_create_subcommand
> >      image_output_dir, options.debug, options.properties_file)
> >    File "/home/trz/yocto/master-cur/scripts/lib/image/engine.py", line 246, in wic_create
> >      cr.main(direct_args)
> > KeyError: 'ROOTFS_DIR'
> >
> >
> > [trz@empanada build]$ wic create directdisk-multi-indirect-both -b /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/share -k /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/src/kernel -n /home/trz/yocto/master-cur/build/tmp/sysroots/x86_64-linux --rootfs-dir rootfs1=/home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs/ --rootfs-dir rootfs2=/home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs/
> > Creating image(s)...
> >
> > Traceback (most recent call last):
> >    File "/home/trz/yocto/master-cur/scripts/wic", line 254, in <module>
> >      ret = main()
> >    File "/home/trz/yocto/master-cur/scripts/wic", line 249, in main
> >      invoke_subcommand(args, parser, wic_help_usage, subcommands)
> >    File "/home/trz/yocto/master-cur/scripts/lib/image/help.py", line 73, in invoke_subcommand
> >      subcommands.get(args[0], subcommand_error)[0](args[1:], usage)
> >    File "/home/trz/yocto/master-cur/scripts/wic", line 153, in wic_create_subcommand
> >      rootfs_dir = options.rootfs_dir['ROOTFS_DIR']
> > KeyError: 'ROOTFS_DIR'
> 
> Ok, the problem was that no --rootfs-dir (without a connect) was passed. 
> Like this:
> 
> ... --rootfs-dir /home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs/ --rootfs-dir rootfs2=/home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs/
> 
> 
> I've fixed the code to get this situation.
> 
> Thanks.
> 



