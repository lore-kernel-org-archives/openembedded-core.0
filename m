Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 921E565CE7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 20:39:19 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Jul 2014 13:39:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,719,1400050800"; d="scan'208";a="460583187"
Received: from unknown (HELO [10.255.12.245]) ([10.255.12.245])
	by azsmga001.ch.intel.com with ESMTP; 23 Jul 2014 13:39:19 -0700
Message-ID: <1406147959.6335.44.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: maciej.borzecki@open-rnd.pl
Date: Wed, 23 Jul 2014 15:39:19 -0500
In-Reply-To: <1406147614.32507.1.camel@localhost.localdomain>
References: <1406111837-4287-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1406146879.6335.38.camel@empanada>
	<1406147614.32507.1.camel@localhost.localdomain>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: squashfs partition support
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
X-List-Received-Date: Wed, 23 Jul 2014 20:39:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2014-07-23 at 22:33 +0200, Maciek Borzecki wrote:
> On śro, 2014-07-23 at 15:21 -0500, Tom Zanussi wrote:
> > Hi, please include a description for this.
> Ok, will update with the rest of the patches.
> 
> > 
> > Also, it looks like this is missing the empty_partition() part?
> That's intentional. Squashfs, being read-only, is not really useful for
> a partition that is empty. You wouldn't be able to create files nor
> actually use it in a meaningful manner, unless it's combined with one of
> the merging filesystems like {union/au/overlay}fs. In this case the
> whole fs setup would be described in fstab.
> 
> Though, it might make sense to raise a warning at least.
> 

Yeah, makes sense, please do add a warning in that case.

Thanks,

Tom

> 
> > 
> > Thanks,
> > 
> > Tom
> > 
> > On Wed, 2014-07-23 at 12:37 +0200, Maciej Borzecki wrote:
> > > Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> > > ---
> > >  .../lib/mic/kickstart/custom_commands/partition.py | 26 ++++++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > > 
> > > diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
> > > index d0f1b78..c4d0113 100644
> > > --- a/scripts/lib/mic/kickstart/custom_commands/partition.py
> > > +++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
> > > @@ -192,6 +192,10 @@ class Wic_PartData(Mic_PartData):
> > >              return self.prepare_rootfs_vfat(cr_workdir, oe_builddir,
> > >                                              rootfs_dir, native_sysroot,
> > >                                              pseudo)
> > > +        elif self.fstype.startswith("squashfs"):
> > > +            return self.prepare_rootfs_squashfs(cr_workdir, oe_builddir,
> > > +                                                rootfs_dir, native_sysroot,
> > > +                                                pseudo)
> > >  
> > >      def prepare_rootfs_ext(self, cr_workdir, oe_builddir, rootfs_dir,
> > >                             native_sysroot, pseudo):
> > > @@ -324,6 +328,28 @@ class Wic_PartData(Mic_PartData):
> > >          self.set_size(rootfs_size)
> > >          self.set_source_file(rootfs)
> > >  
> > > +    def prepare_rootfs_squashfs(self, cr_workdir, oe_builddir, rootfs_dir,
> > > +                                native_sysroot, pseudo):
> > > +        """
> > > +        Prepare content for a squashfs rootfs partition.
> > > +        """
> > > +        image_rootfs = rootfs_dir
> > > +        rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
> > > +
> > > +        squashfs_cmd = "mksquashfs %s %s -noappend" % \
> > > +                       (image_rootfs, rootfs)
> > > +        rc, out = exec_native_cmd(pseudo + squashfs_cmd, native_sysroot)
> > > +
> > > +        # get the rootfs size in the right units for kickstart (Mb)
> > > +        du_cmd = "du -Lbms %s" % rootfs
> > > +        rc, out = exec_cmd(du_cmd)
> > > +        rootfs_size = out.split()[0]
> > > +
> > > +        self.size = rootfs_size
> > > +        self.source_file = rootfs
> > > +
> > > +        return 0
> > > +
> > >      def prepare_empty_partition(self, cr_workdir, oe_builddir, native_sysroot):
> > >          """
> > >          Prepare an empty partition.
> > 
> > 
> 
> 



