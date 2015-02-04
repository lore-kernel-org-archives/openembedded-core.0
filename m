Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id A621265D00
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 23:39:18 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 3FF543A3; Thu,  5 Feb 2015 00:39:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id F3868D;
	Thu,  5 Feb 2015 00:39:25 +0100 (CET)
Date: Thu, 5 Feb 2015 00:39:18 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Message-ID: <20150204233918.GC4443@piout.net>
References: <1423090155-14149-1-git-send-email-alexandre.belloni@free-electrons.com>
	<1423091895.18649.26.camel@picadillo>
MIME-Version: 1.0
In-Reply-To: <1423091895.18649.26.camel@picadillo>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: bootimg-partition: Stop removing whole workdir
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
X-List-Received-Date: Wed, 04 Feb 2015 23:39:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 04/02/2015 at 17:18:15 -0600, Tom Zanussi wrote :
> On Wed, 2015-02-04 at 23:49 +0100, Alexandre Belloni wrote:
> > Stop removing the whole working directory as this is also removing
> > eventual previously created partition images, leading to image creation
> > failures.
> > 
> 
> I'm surprised - I've never run into a problem like this.  Can you give
> more details and/or a reproducer?
> 

Sure, something like that in your wks will fail:
part / --source rootfs --ondisk mmcblk --fstype=ext4 --label root --align 4
part /boot --source bootimg-partition --ondisk mmcblk --fstype=vfat --label boot --active --align 4 --size 16

The error being:
Error: exec_cmd: dd if=/var/tmp/wic/build/rootfs_root.ext4
of=/var/tmp/wic/build/test-201502050034-mmcblk.direct bs=512 seek=8
count=294174 conv=notrunc returned '1' instead of 0

Using bootimg-partition anywhere but in the first position will fail
because the previously generated fs images (in my example
rootfs_root.ext4) will be removed.

> Thanks,
> 
> Tom
> 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > ---
> >  scripts/lib/wic/plugins/source/bootimg-partition.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
> > index 6ba39a01f700..c5eb7b8b801b 100644
> > --- a/scripts/lib/wic/plugins/source/bootimg-partition.py
> > +++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
> > @@ -66,7 +66,7 @@ class BootimgPartitionPlugin(SourcePlugin):
> >          - copies all files listed in IMAGE_BOOT_FILES variable
> >          """
> >          hdddir = "%s/boot" % cr_workdir
> > -        rm_cmd = "rm -rf %s" % cr_workdir
> > +        rm_cmd = "rm -rf %s/boot" % cr_workdir
> >          exec_cmd(rm_cmd)
> >  
> >          install_cmd = "install -d %s" % hdddir
> 
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

