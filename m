Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4C0B06F908
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 20:13:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Mar 2014 13:13:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,722,1389772800"; d="scan'208";a="506610230"
Received: from unknown (HELO [10.255.12.230]) ([10.255.12.230])
	by orsmga002.jf.intel.com with ESMTP; 24 Mar 2014 13:13:55 -0700
Message-ID: <1395692034.25867.103.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: =?ISO-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>
Date: Mon, 24 Mar 2014 15:13:54 -0500
In-Reply-To: <532E461E.3090206@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1395417268.25867.74.camel@empanada> <532E461E.3090206@gmail.com>
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
X-List-Received-Date: Mon, 24 Mar 2014 20:13:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2014-03-22 at 23:25 -0300, João Henrique Ferreira de Freitas
wrote:
> Hi Tom,
> 
> I am working to enhance the patches with your comments.
> 
> Em 21-03-2014 12:54, Tom Zanussi escreveu:
> > In any case, I think the connection between a command-line param and the
> > line in the .wks file should be explicit, but I'm not sure about the
> > best way do do that, maybe something like:
> >
> > wic create ... --rootfs-dir rootfs1=/some/rootfs/dir --rootfs-dir rootfs2=/some/other/rootfs/dir
> >
> >    part / --source rootfs --rootfs-dir="rootfs1" --ondisk sda --fstype=ext3 --label primary --align 1024
> >
> >    part /standby --source rootfs --rootfs-dir="rootfs2" \
> >      --ondisk sda --fstype=ext3 --label secondary --align 1024
> >
> > In the above case, 'rootfs1' and 'rootfs2' provide the connection (and
> > could be named anything, they're just strings).
> 
> What about to use '--label' or mountpoint as connection?
> 

I suppose using --label would be ok, though I don't really like to
overload things like this in general, and it forces the partitions to
have labels.

> wic create ... --rootfs-dir primary=/some/rootfs/dir --rootfs-dir secondary=/some/other/rootfs/dir
> 
> 
> 
> > So I guess that's what make sense to me, but I'd be happy to hear other
> > ideas.
> >
> > In any case, at minimum I think that you should change the syntax from
> > --rootfs=<special rootfs directory> to --rootfs-dir=<special rootfs
> > directory>, in keeping with current syntax.
> 
> Agree.
> 
> >
> > Another thing missing is displaying the extra partitions in the output
> > e.g.
> 
> Agree.
> 
> >   I created an image with the added /standby, and it worked but I
> > didn't see it mentioned in the output, which it should be:
> > [trz@empanada build]$ wic create directdisk-multi -e core-image-minimal
> > Checking basic build environment...
> > Done.
> >
> > Creating image(s)...
> >
> > Info: The new image(s) can be found here:
> >    /var/tmp/wic/build/directdisk-multi-201403211050-sda.direct
> >
> > The following build artifacts were used to create the image(s):
> >    ROOTFS_DIR:      /home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs
> >    BOOTIMG_DIR:     /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/share
> >    KERNEL_DIR:      /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/src/kernel
> >    NATIVE_SYSROOT:  /home/trz/yocto/master-cur/build/tmp/sysroots/x86_64-linux
> >
> >
> > The image(s) were created using OE kickstart file:
> >    /home/trz/yocto/master-cur/scripts/lib/image/canned-wks/directdisk-multi.wks
> >
> > Thanks,
> 
> Why BOOTIMG_DIR is pointing to 
> /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/share ? It 
> could be /var/tmp/wic/build/hdd/boot?
> 

The listing is supposed to tell the user where it found the artifacts as
a sanity check, e.g. what the variables or -e expanded to and thus where
the artifacts came from.  /var/tmp/wic/build/hdd/boot doesn't tell you
that.

> And what do you thing about this output ?
> 
> Checking basic build environment...
> Done.
> 
> Creating image(s)...
> 
> Info: The new image(s) can be found here:
>    /var/tmp/wic/build/directdisk-multi-rootfs-201403222319-sda.direct
> 
> The following build artifacts were used to create the image(s):
>    /boot                        /var/tmp/wic/build/hdd/boot
>    / 
> /srv/build/yocto/master/tmp/work/genericx86-poky-linux/core-image-minimal/1.0-r0/rootfs
>    /standby 
> /srv/build/yocto/master/tmp/work/genericx86-poky-linux/core-image-minimal-dev/1.0-r0/rootfs
>    /root_test 
> /srv/build/yocto/master/tmp/work/genericx86-poky-linux/core-image-minimal-dev/1.0-r0/rootfs
>    KERNEL_DIR: 
> /srv/build/yocto/master/tmp/sysroots/genericx86/usr/src/kernel
>    NATIVE_SYSROOT:  /srv/build/yocto/master/tmp/sysroots/x86_64-linux
> 
> 

That seems kind of unreadable to me.  Why not just add another
ROOTFS_DIR line for anything beyond the default rootfs e.g. 

    ROOTFS_DIR:                    /home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs
    ROOTFS_DIR["secondary"]:       /home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal-dev/1.0-r0/rootfs
    BOOTIMG_DIR:                   /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/share
    KERNEL_DIR:                    /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/src/kernel
    NATIVE_SYSROOT:                /home/trz/yocto/master-cur/build/tmp/sysroots/x86_64-linux

Tom

> The image(s) were created using OE kickstart file:
> /home/joaohf/jhf/opensource/poky/scripts/lib/image/canned-wks/directdisk-multi-rootfs.wks
> 
> Thanks.
> 
> -- 
> João Henrique Ferreira de Freitas - joaohf_at_gmail.com
> Campinas-SP-Brasil
> 



